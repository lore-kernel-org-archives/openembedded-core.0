Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7471.1793976114200796741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Dn68cI9p;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7FFCA4E4145C;
	Fri,  6 Nov 2026 14:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F7125FFBC;
	Fri,  6 Nov 2026 14:41:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53B4F103293C4;
	Fri,  6 Nov 2026 15:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793976111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnoP3Z6Knn9zUFetq6D4Ys9UxbAunRH5QkD+GIrysIk=;
	b=Dn68cI9ph2rrxB9ND+mQvUsUNdobxIfZhN+FrdQx8deasuln+r+OCLat9AtmaYXjz8GD40
	KjSELUV1WElAYsYx5n4umgpboQ0Iy3ShYgidQruWZfai4QoUnC1pG6B4wbV7aUH0VMW6eZ
	D8Sw1dsWsfX/TFd9FJqeq0yN7cPl6o15m0fD7fe0C02/vYS1s+fwzQ+iXq/Q65JlGIXhEm
	Y+Y0HmGzVHJd12SA8FIRfT51FwpOJEmmV78iltzEFoK9pmVwiHLcAPA4+T0mWIJYKbp3S4
	/he3us7Ejw5QNrZSLQg4eSaaF2TqpyISy63Pg4YOIU9d/cZwD7EIIj1/aed7Hg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 7/7] curl: fix CVE-2026-94266
Date: Fri,  6 Nov 2026 15:41:34 +0100
Message-ID: <20261106144134.1370928-8-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249662

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.7.1.

The *-pre.patch includes essentially the definition of CURLU_GET_EMPTY,
needed by the actual CVE fix, and the calls to curlx_free and
curlx_safefree were replaced by their respective counterparts available in
curl v8.7.1.

Also, in effective_url(), the call to Curl_bufref_ptr() was replaced a
plain const char * assignment, as curl v8.7.1 defines stat.url as char* (as
opposed to struct bufref in v8.23.0). While I tried backporting the commit
[3] that turns it into a bufref, it just raised too many conflicts.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-94266
[2] https://curl.se/docs/CVE-2026-94266.html
[3] https://github.com/curl/curl/commit/36542b734966fce2ce5689d689a0e4922a1=
03e50

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.cost=
a@bootlin.com>
---
 .../curl/curl/CVE-2026-94266-pre.patch        | 302 ++++++++++++++++++
 .../curl/curl/CVE-2026-94266.patch            | 222 +++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 526 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266-pre.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-94266-pre.patch b/meta=
/recipes-support/curl/curl/CVE-2026-94266-pre.patch
new file mode 100644
index 0000000000..bd04a9cd29
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-94266-pre.patch
@@ -0,0 +1,302 @@
+From 63f45b182c53fa98727f37d6ef9ff7e5b4d1ed06 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 17 Apr 2024 11:39:25 +0200
+Subject: [PATCH] urlapi: add CURLU_GET_EMPTY for empty queries and fragmen=
ts
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+By default the API inhibits empty queries and fragments extracted.
+Unless this new flag is set.
+
+This also makes the behavior more consistent: without it set, zero
+length queries and fragments are considered not present in the URL. With
+the flag set, they are returned as a zero length strings if they were in
+fact present in the URL.
+
+This applies when extracting the individual query and fragment
+components and for the full URL.
+
+Closes #13396
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3eac21d86bc=
50ba459a9a8a0f3d1130b6d30b57d]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ docs/libcurl/curl_url_get.md     | 12 ++++++++++
+ docs/libcurl/symbols-in-versions |  1 +
+ include/curl/urlapi.h            |  3 +++
+ lib/urlapi.c                     | 37 +++++++++++++++++++++-------
+ tests/data/test1201              |  4 ++--
+ tests/libtest/lib1560.c          | 41 ++++++++++++++++++++++++++++++++
+ 6 files changed, 88 insertions(+), 10 deletions(-)
+
+diff --git a/docs/libcurl/curl_url_get.md b/docs/libcurl/curl_url_get.md
+index 2f3b89b5e5..100eea7f52 100644
+--- a/docs/libcurl/curl_url_get.md
++++ b/docs/libcurl/curl_url_get.md
+@@ -113,6 +113,18 @@ punycode.
+=20
+ (Added in curl 8.3.0)
+=20
++## CURLU_GET_EMPTY
++
++When this flag is used in curl_url_get(), it makes the function return em=
pty
++query and fragments parts or when used in the full URL. By default, libcu=
rl
++otherwise considers empty parts non-existing.
++
++An empty query part is one where this is nothing following the question m=
ark
++(before the possible fragment). An empty fragments part is one where ther=
e is
++nothing following the hash sign.
++
++(Added in curl 8.8.0)
++
+ # PARTS
+=20
+ ## CURLUPART_URL
+diff --git a/docs/libcurl/symbols-in-versions b/docs/libcurl/symbols-in-ve=
rsions
+index a627dd68b6..2a9a0ff6f5 100644
+--- a/docs/libcurl/symbols-in-versions
++++ b/docs/libcurl/symbols-in-versions
+@@ -1062,6 +1062,7 @@ CURLU_APPENDQUERY               7.62.0
+ CURLU_DEFAULT_PORT              7.62.0
+ CURLU_DEFAULT_SCHEME            7.62.0
+ CURLU_DISALLOW_USER             7.62.0
++CURLU_GET_EMPTY                 8.8.0
+ CURLU_GUESS_SCHEME              7.62.0
+ CURLU_NO_AUTHORITY              7.67.0
+ CURLU_NO_DEFAULT_PORT           7.62.0
+diff --git a/include/curl/urlapi.h b/include/curl/urlapi.h
+index 91f8c4548a..19388c3c01 100644
+--- a/include/curl/urlapi.h
++++ b/include/curl/urlapi.h
+@@ -99,6 +99,9 @@ typedef enum {
+ #define CURLU_ALLOW_SPACE (1<<11)       /* Allow spaces in the URL */
+ #define CURLU_PUNYCODE (1<<12)          /* get the host name in punycode =
*/
+ #define CURLU_PUNY2IDN (1<<13)          /* punycode =3D> IDN conversion */
++#define CURLU_GET_EMPTY (1<<14)         /* allow empty queries and fragme=
nts
++                                           when extracting the URL or the
++                                           components */
+=20
+ typedef struct Curl_URL CURLU;
+=20
+diff --git a/lib/urlapi.c b/lib/urlapi.c
+index dc42489722..a7abd0b248 100644
+--- a/lib/urlapi.c
++++ b/lib/urlapi.c
+@@ -79,7 +79,9 @@ struct Curl_URL {
+   char *path;
+   char *query;
+   char *fragment;
+-  long portnum; /* the numerical version */
++  unsigned short portnum; /* the numerical version */
++  BIT(query_present);    /* to support blank */
++  BIT(fragment_present); /* to support blank */
+ };
+=20
+ #define DEFAULT_SCHEME "https"
+@@ -558,7 +560,7 @@ UNITTEST CURLUcode Curl_parse_port(struct Curl_URL *u,=
 struct dynbuf *host,
+     if(rest[0])
+       return CURLUE_BAD_PORT_NUMBER;
+=20
+-    u->portnum =3D port;
++    u->portnum =3D (unsigned short) port;
+     /* generate a new port number string to get rid of leading zeroes etc=
 */
+     free(u->port);
+     u->port =3D aprintf("%ld", port);
+@@ -1242,6 +1244,7 @@ static CURLUcode parseurl(const char *url, CURLU *u,=
 unsigned int flags)
+   fragment =3D strchr(path, '#');
+   if(fragment) {
+     fraglen =3D pathlen - (fragment - path);
++    u->fragment_present =3D TRUE;
+     if(fraglen > 1) {
+       /* skip the leading '#' in the copy but include the terminating nul=
l */
+       if(flags & CURLU_URLENCODE) {
+@@ -1269,6 +1272,7 @@ static CURLUcode parseurl(const char *url, CURLU *u,=
 unsigned int flags)
+     size_t qlen =3D fragment ? (size_t)(fragment - query) :
+       pathlen - (query - path);
+     pathlen -=3D qlen;
++    u->query_present =3D TRUE;
+     if(qlen > 1) {
+       if(flags & CURLU_URLENCODE) {
+         struct dynbuf enc;
+@@ -1404,6 +1408,8 @@ CURLU *curl_url_dup(const CURLU *in)
+     DUP(u, in, fragment);
+     DUP(u, in, zoneid);
+     u->portnum =3D in->portnum;
++    u->fragment_present =3D in->fragment_present;
++    u->query_present =3D in->query_present;
+   }
+   return u;
+ fail:
+@@ -1488,10 +1494,16 @@ CURLUcode curl_url_get(const CURLU *u, CURLUPart w=
hat,
+     ptr =3D u->query;
+     ifmissing =3D CURLUE_NO_QUERY;
+     plusdecode =3D urldecode;
++    if(ptr && !ptr[0] && !(flags & CURLU_GET_EMPTY))
++      /* there was a blank query and the user do not ask for it */
++      ptr =3D NULL;
+     break;
+   case CURLUPART_FRAGMENT:
+     ptr =3D u->fragment;
+     ifmissing =3D CURLUE_NO_FRAGMENT;
++    if(!ptr && u->fragment_present && flags & CURLU_GET_EMPTY)
++      /* there was a blank fragment and the user asks for it */
++      ptr =3D "";
+     break;
+   case CURLUPART_URL: {
+     char *url;
+@@ -1499,13 +1511,18 @@ CURLUcode curl_url_get(const CURLU *u, CURLUPart w=
hat,
+     char *options =3D u->options;
+     char *port =3D u->port;
+     char *allochost =3D NULL;
++    bool show_fragment =3D
++      u->fragment || (u->fragment_present && flags & CURLU_GET_EMPTY);
++    bool show_query =3D
++      (u->query && u->query[0]) ||
++      (u->query_present && flags & CURLU_GET_EMPTY);
+     punycode =3D (flags & CURLU_PUNYCODE)?1:0;
+     depunyfy =3D (flags & CURLU_PUNY2IDN)?1:0;
+     if(u->scheme && strcasecompare("file", u->scheme)) {
+       url =3D aprintf("file://%s%s%s",
+                     u->path,
+-                    u->fragment? "#": "",
+-                    u->fragment? u->fragment : "");
++                    show_fragment ? "#": "",
++                    u->fragment ? u->fragment : "");
+     }
+     else if(!u->host)
+       return CURLUE_NO_HOST;
+@@ -1593,9 +1610,9 @@ CURLUcode curl_url_get(const CURLU *u, CURLUPart wha=
t,
+                     port ? ":": "",
+                     port ? port : "",
+                     u->path ? u->path : "/",
+-                    (u->query && u->query[0]) ? "?": "",
+-                    (u->query && u->query[0]) ? u->query : "",
+-                    u->fragment? "#": "",
++                    show_query ? "?": "",
++                    u->query ? u->query : "",
++                    show_fragment ? "#": "",
+                     u->fragment? u->fragment : "");
+       free(allochost);
+     }
+@@ -1730,9 +1747,11 @@ CURLUcode curl_url_set(CURLU *u, CURLUPart what,
+       break;
+     case CURLUPART_QUERY:
+       storep =3D &u->query;
++      u->query_present =3D FALSE;
+       break;
+     case CURLUPART_FRAGMENT:
+       storep =3D &u->fragment;
++      u->fragment_present =3D FALSE;
+       break;
+     default:
+       return CURLUE_UNKNOWN_PART;
+@@ -1816,9 +1835,11 @@ CURLUcode curl_url_set(CURLU *u, CURLUPart what,
+     appendquery =3D (flags & CURLU_APPENDQUERY)?1:0;
+     equalsencode =3D appendquery;
+     storep =3D &u->query;
++    u->query_present =3D TRUE;
+     break;
+   case CURLUPART_FRAGMENT:
+     storep =3D &u->fragment;
++    u->fragment_present =3D TRUE;
+     break;
+   case CURLUPART_URL: {
+     /*
+@@ -1969,6 +1990,6 @@ nomem:
+   /* set after the string, to make it not assigned if the allocation above
+      fails */
+   if(port)
+-    u->portnum =3D port;
++    u->portnum =3D (unsigned short)port;
+   return CURLUE_OK;
+ }
+diff --git a/tests/data/test1201 b/tests/data/test1201
+index 296e7fa6a0..f4c1a48386 100644
+--- a/tests/data/test1201
++++ b/tests/data/test1201
+@@ -25,7 +25,7 @@ gopher
+ Gopher selector
+ </name>
+ <command>
+-gopher://%HOSTIP:%GOPHERPORT/1/selector/SELECTOR/%TESTNUMBER?
++gopher://%HOSTIP:%GOPHERPORT/1/selector/SELECTOR/%TESTNUMBER
+ </command>
+ </client>
+=20
+@@ -33,7 +33,7 @@ gopher://%HOSTIP:%GOPHERPORT/1/selector/SELECTOR/%TESTNU=
MBER?
+ # Verify data after the test has been "shot"
+ <verify>
+ <protocol>
+-/selector/SELECTOR/%TESTNUMBER?=0D
++/selector/SELECTOR/%TESTNUMBER=0D
+ </protocol>
+ </verify>
+ </testcase>
+diff --git a/tests/libtest/lib1560.c b/tests/libtest/lib1560.c
+index 1509c76a7f..2a26874e54 100644
+--- a/tests/libtest/lib1560.c
++++ b/tests/libtest/lib1560.c
+@@ -151,6 +151,21 @@ struct clearurlcase {
+ };
+=20
+ static const struct testcase get_parts_list[] =3D{
++  {"https://curl.se/#",
++   "https | [11] | [12] | [13] | curl.se | [15] | / | [16] | ",
++   0, CURLU_GET_EMPTY, CURLUE_OK},
++  {"https://curl.se/?#",
++   "https | [11] | [12] | [13] | curl.se | [15] | / |  | ",
++   0, CURLU_GET_EMPTY, CURLUE_OK},
++  {"https://curl.se/?",
++   "https | [11] | [12] | [13] | curl.se | [15] | / |  | [17]",
++   0, CURLU_GET_EMPTY, CURLUE_OK},
++  {"https://curl.se/?",
++   "https | [11] | [12] | [13] | curl.se | [15] | / | [16] | [17]",
++   0, 0, CURLUE_OK},
++  {"https://curl.se/?#",
++   "https | [11] | [12] | [13] | curl.se | [15] | / | [16] | [17]",
++   0, 0, CURLUE_OK},
+   {"https://curl.se/#  ",
+    "https | [11] | [12] | [13] | curl.se | [15] | / | [16] | %20%20",
+    CURLU_URLENCODE|CURLU_ALLOW_SPACE, 0, CURLUE_OK},
+@@ -508,6 +523,20 @@ static const struct testcase get_parts_list[] =3D{
+ };
+=20
+ static const struct urltestcase get_url_list[] =3D {
++  {"http://user@example.com?#",
++   "http://user@example.com/?#",
++   0, CURLU_GET_EMPTY, CURLUE_OK},
++  /* WHATWG disgrees, it wants "https:/0.0.0.0/" */
++  {"https://0x.0x.0", "https://0x.0x.0/", 0, 0, CURLUE_OK},
++
++  {"https://example.com:000000000000000000000443/foo",
++   "https://example.com/foo",
++   0, CURLU_NO_DEFAULT_PORT, CURLUE_OK},
++  {"https://example.com:000000000000000000000/foo",
++   "https://example.com:0/foo",
++   0, CURLU_NO_DEFAULT_PORT, CURLUE_OK},
++  {"https://192.0x0000A80001", "https://192.168.0.1/", 0, 0, CURLUE_OK},
++  {"https://0xffffffff", "https://255.255.255.255/", 0, 0, CURLUE_OK},
+   {"https://1.0x1000000", "https://1.0x1000000/", 0, 0, CURLUE_OK},
+   {"https://0x7f.1", "https://127.0.0.1/", 0, 0, CURLUE_OK},
+   {"https://1.2.3.256.com", "https://1.2.3.256.com/", 0, 0, CURLUE_OK},
+@@ -770,6 +799,18 @@ static int checkurl(const char *org, const char *url,=
 const char *out)
+    3. Extract all components (not URL)
+ */
+ static const struct setgetcase setget_parts_list[] =3D {
++  {"https://example.com/",
++   "query=3D\"\",",
++   "https | [11] | [12] | [13] | example.com | [15] | / |  | [17]",
++   0, 0, CURLU_GET_EMPTY, CURLUE_OK},
++  {"https://example.com/",
++   "fragment=3D\"\",",
++   "https | [11] | [12] | [13] | example.com | [15] | / | [16] | ",
++   0, 0, CURLU_GET_EMPTY, CURLUE_OK},
++  {"https://example.com/",
++   "query=3D\"\",",
++   "https | [11] | [12] | [13] | example.com | [15] | / | [16] | [17]",
++   0, 0, 0, CURLUE_OK},
+   {"https://example.com",
+    "path=3Dget,",
+    "https | [11] | [12] | [13] | example.com | [15] | /get | [16] | [17]",
diff --git a/meta/recipes-support/curl/curl/CVE-2026-94266.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-94266.patch
new file mode 100644
index 0000000000..0ef6e0c07c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-94266.patch
@@ -0,0 +1,222 @@
+From 91b6ecabaed3a6400d5d1a86990a3fec9ccbe09c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 21 Sep 2026 11:13:13 +0200
+Subject: [PATCH] getinfo: make sure CURLINFO_EFFECTIVE_URL does not contain
+ creds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported-by: Joshua Rogers
+
+Verified in test 1876
+
+Closes #23016
+
+CVE: CVE-2026-94266
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7a6bd027d0d=
e2b6857472d35da090ef60cc29f19]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/getinfo.c           | 45 +++++++++++++++++++++++++--
+ lib/transfer.c          |  1 +
+ lib/url.c               |  1 +
+ lib/urldata.h           |  1 +
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test1876     | 67 +++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 114 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1876
+
+diff --git a/lib/getinfo.c b/lib/getinfo.c
+index dd43643d8b..d972e081d8 100644
+--- a/lib/getinfo.c
++++ b/lib/getinfo.c
+@@ -73,6 +73,9 @@ CURLcode Curl_initinfo(struct Curl_easy *data)
+   free(info->contenttype);
+   info->contenttype =3D NULL;
+=20
++  free(info->effective_url);
++  info->effective_url=3D NULL;
++
+   free(info->wouldredirect);
+   info->wouldredirect =3D NULL;
+=20
+@@ -91,13 +94,51 @@ CURLcode Curl_initinfo(struct Curl_easy *data)
+   return CURLE_OK;
+ }
+=20
++static CURLcode effective_url(struct Curl_easy *data,
++                              const char **param_charp)
++{
++  const char *s =3D data->state.url;
++  *param_charp =3D s ? s : "";
++  if(s) {
++    char *url =3D NULL;
++    /* Make a copy of the URL without credentials */
++    CURLU *u =3D curl_url();
++    CURLUcode uc;
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
++
++    uc =3D curl_url_set(u, CURLUPART_URL, s,
++                      CURLU_NON_SUPPORT_SCHEME |
++                      (data->set.path_as_is ? CURLU_PATH_AS_IS : 0));
++    if(!uc)
++      uc =3D curl_url_set(u, CURLUPART_USER, NULL, 0);
++    if(!uc)
++      uc =3D curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++    if(!uc)
++      uc =3D curl_url_get(u, CURLUPART_URL, &url, CURLU_GET_EMPTY);
++
++    curl_url_cleanup(u);
++
++    if(uc || !url)
++      return CURLE_OUT_OF_MEMORY;
++    if(strcmp(url, s)) {
++      /* they are different */
++      free(data->info.effective_url);
++      data->info.effective_url =3D url;
++      *param_charp =3D url;
++    }
++    else
++      curl_free(url);
++  }
++  return CURLE_OK;
++}
++
+ static CURLcode getinfo_char(struct Curl_easy *data, CURLINFO info,
+                              const char **param_charp)
+ {
+   switch(info) {
+   case CURLINFO_EFFECTIVE_URL:
+-    *param_charp =3D data->state.url?data->state.url:(char *)"";
+-    break;
++    return effective_url(data, param_charp);
+   case CURLINFO_EFFECTIVE_METHOD: {
+     const char *m =3D data->set.str[STRING_CUSTOMREQUEST];
+     if(!m) {
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a73462928d..d4550f8184 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -645,6 +645,7 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+   data->state.authhost.want =3D data->set.httpauth;
+   data->state.authproxy.want =3D data->set.proxyauth;
+   Curl_safefree(data->info.wouldredirect);
++  Curl_safefree(data->info.effective_url);
+   Curl_data_priority_clear_state(data);
+=20
+   if(data->state.httpreq =3D=3D HTTPREQ_PUT)
+diff --git a/lib/url.c b/lib/url.c
+index 9e1ca0336c..5153406287 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -291,6 +291,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+ #endif
+   Curl_safefree(data->info.contenttype);
+   Curl_safefree(data->info.wouldredirect);
++  Curl_safefree(data->info.effective_url);
+=20
+   /* this destroys the channel and we cannot use it anymore after this */
+   Curl_resolver_cancel(data);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 4fc595a639..7c5a3daa67 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1031,6 +1031,7 @@ struct PureInfo {
+   long numconnects; /* how many new connection did libcurl created */
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would've been redirected to if asked t=
o */
++  char *effective_url; /* when needed */
+   curl_off_t retry_after; /* info from Retry-After: header */
+   unsigned int header_size;  /* size of read header(s) in bytes */
+=20
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 9efae9cefe..9d4f9281d0 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -219,7 +219,7 @@ test1680 test1681 test1682 test1683 \
+ \
+ test1700 test1701 test1702 test1703 test1704 \
+ \
+-test1800 test1801 \
++test1800 test1801 test1876 \
+ \
+ test1900                   test1903 test1904 test1905 test1906 test1907 \
+ test1908 test1909 test1910 test1911 test1912 test1913 test1914 test1915 \
+diff --git a/tests/data/test1876 b/tests/data/test1876
+new file mode 100644
+index 0000000000..4fc3b9fd02
+--- /dev/null
++++ b/tests/data/test1876
+@@ -0,0 +1,67 @@
++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf=3D"headers" nocheck=3D"yes">
++HTTP/1.1 301 redir
++Content-Length: 0
++Content-Type: text/html
++Location: %TESTNUMBER0002
++
++</data>
++
++<data2 crlf=3D"headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Content-Type: text/html
++
++</data2>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++verify no credentials present in effective URL after redirect
++</name>
++<file name=3D"%LOGDIR/netrc">
++machine %HOSTIP
++login netrcuser
++password netrcSECRET123
++</file>
++
++<command option=3D"no-include">
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER --netrc-optional --netrc-file %LOGDI=
R/netrc -L -w 'EFFECTIVE_URL=3D%{url_effective}\n'
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf=3D"headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET /%TESTNUMBER0002 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<stdout>
++EFFECTIVE_URL=3Dhttp://%HOSTIP:%HTTPPORT/%TESTNUMBER0002
++</stdout>
++</verify>
++</testcase>
+--=20
+2.55.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 3bd1b92d44..90ec2cd9d8 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -49,6 +49,8 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92386.patch \
            file://CVE-2026-92389.patch \
            file://CVE-2026-92391.patch \
+           file://CVE-2026-94266-pre.patch \
+           file://CVE-2026-94266.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

