import 'dart:convert';
import 'package:http/http.dart';
import 'package:minggu_10_fmoovie/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '625a2329be780fba57a5f906fb7365eb';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
