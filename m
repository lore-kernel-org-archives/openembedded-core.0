Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D97526AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 13:11:18 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 15:11:16 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id D66E628BA1D;
	Thu, 23 Apr 2015 15:11:16 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Apr 2015 15:11:00 +0200
Message-ID: <1429794660-2600-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [fido][PATCH] curl: several security fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 13:11:19 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Fixes below listed bugs:
1. CVE-2015-3143
2. CVE-2015-3144
3. CVE-2015-3145
4. CVE-2015-3148

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2015-3143.patch | 38 ++++++++++++
 meta/recipes-support/curl/curl/CVE-2015-3144.patch | 45 ++++++++++++++
 meta/recipes-support/curl/curl/CVE-2015-3145.patch | 70 ++++++++++++++++++=
++++
 meta/recipes-support/curl/curl/CVE-2015-3148.patch | 50 ++++++++++++++++
 meta/recipes-support/curl/curl_7.40.0.bb           |  4 ++
 5 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3143.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3144.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3145.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3148.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2015-3143.patch b/meta/reci=
pes-support/curl/curl/CVE-2015-3143.patch
new file mode 100644
index 0000000..745e945
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3143.patch
@@ -0,0 +1,38 @@
+From d7d1bc8f08eea1a85ab0d794bc1561659462d937 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 13:26:46 +0200
+Subject: [PATCH] ConnectionExists: for NTLM re-use, require credentials to
+ match
+
+Upstream-Status: Backport
+
+CVE-2015-3143
+
+Bug: http://curl.haxx.se/docs/adv_20150422A.html
+Reported-by: Paras Sethia
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 018bb88..ee3d176 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3207,11 +3207,11 @@ ConnectionExists(struct SessionHandle *data,
+            strcmp(check->localdev, needle->localdev))
+           continue;
+       }
+=20
+       if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) ||
+-         wantNTLMhttp) {
++         (wantNTLMhttp || check->ntlm.state !=3D NTLMSTATE_NONE)) {
+         /* This protocol requires credentials per connection or is HTTP+N=
TLM,
+            so verify that we're using the same name and password as well =
*/
+         if(!strequal(needle->user, check->user) ||
+            !strequal(needle->passwd, check->passwd)) {
+           /* one of them was different */
+--=20
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3144.patch b/meta/reci=
pes-support/curl/curl/CVE-2015-3144.patch
new file mode 100644
index 0000000..ca6d744
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3144.patch
@@ -0,0 +1,45 @@
+From 6218ded6001ea330e589f92b6b2fa12777752b5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 23:52:04 +0200
+Subject: [PATCH] fix_hostname: zero length host name caused -1 index offse=
t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+If a URL is given with a zero-length host name, like in "http://:80" or
+just ":80", `fix_hostname()` will index the host name pointer with a -1
+offset (as it blindly assumes a non-zero length) and both read and
+assign that address.
+
+CVE-2015-3144
+
+Bug: http://curl.haxx.se/docs/adv_20150422D.html
+Reported-by: Hanno B=C3=B6ck
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index ee3d176..f033dbc 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3625,11 +3625,11 @@ static void fix_hostname(struct SessionHandle *dat=
a,
+=20
+   /* set the name we use to display the host name */
+   host->dispname =3D host->name;
+=20
+   len =3D strlen(host->name);
+-  if(host->name[len-1] =3D=3D '.')
++  if(len && (host->name[len-1] =3D=3D '.'))
+     /* strip off a single trailing dot if present, primarily for SNI but
+        there's no use for it */
+     host->name[len-1]=3D0;
+=20
+   if(!is_ASCII_name(host->name)) {
+--=20
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3145.patch b/meta/reci=
pes-support/curl/curl/CVE-2015-3145.patch
new file mode 100644
index 0000000..15a9982
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3145.patch
@@ -0,0 +1,70 @@
+From ea595c516bc936a514753597aa6c59fd6eb0765e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 16:37:40 +0200
+Subject: [PATCH] cookie: cookie parser out of boundary memory access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+The internal libcurl function called sanitize_cookie_path() that cleans
+up the path element as given to it from a remote site or when read from
+a file, did not properly validate the input. If given a path that
+consisted of a single double-quote, libcurl would index a newly
+allocated memory area with index -1 and assign a zero to it, thus
+destroying heap memory it wasn't supposed to.
+
+CVE-2015-3145
+
+Bug: http://curl.haxx.se/docs/adv_20150422C.html
+Reported-by: Hanno B=C3=B6ck
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/cookie.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0864f6b..0127926 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -223,15 +223,18 @@ static char *sanitize_cookie_path(const char *cookie=
_path)
+   char *new_path =3D strdup(cookie_path);
+   if(!new_path)
+     return NULL;
+=20
+   /* some stupid site sends path attribute with '"'. */
++  len =3D strlen(new_path);
+   if(new_path[0] =3D=3D '\"') {
+-    memmove((void *)new_path, (const void *)(new_path + 1), strlen(new_pa=
th));
++    memmove((void *)new_path, (const void *)(new_path + 1), len);
++    len--;
+   }
+-  if(new_path[strlen(new_path) - 1] =3D=3D '\"') {
+-    new_path[strlen(new_path) - 1] =3D 0x0;
++  if(len && (new_path[len - 1] =3D=3D '\"')) {
++    new_path[len - 1] =3D 0x0;
++    len--;
+   }
+=20
+   /* RFC6265 5.2.4 The Path Attribute */
+   if(new_path[0] !=3D '/') {
+     /* Let cookie-path be the default-path. */
+@@ -239,12 +242,11 @@ static char *sanitize_cookie_path(const char *cookie=
_path)
+     new_path =3D strdup("/");
+     return new_path;
+   }
+=20
+   /* convert /hoge/ to /hoge */
+-  len =3D strlen(new_path);
+-  if(1 < len && new_path[len - 1] =3D=3D '/') {
++  if(len && new_path[len - 1] =3D=3D '/') {
+     new_path[len - 1] =3D 0x0;
+   }
+=20
+   return new_path;
+ }
+--=20
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3148.patch b/meta/reci=
pes-support/curl/curl/CVE-2015-3148.patch
new file mode 100644
index 0000000..13df14e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3148.patch
@@ -0,0 +1,50 @@
+From 6abfb512ed22c2de891a4398616d81a2a0690b5a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 18 Apr 2015 23:50:16 +0200
+Subject: [PATCH] http_done: close Negotiate connections when done
+
+Upstream-Status: Backport
+
+When doing HTTP requests Negotiate authenticated, the entire connnection
+may become authenticated and not just the specific HTTP request which is
+otherwise how HTTP works, as Negotiate can basically use NTLM under the
+hood. curl was not adhering to this fact but would assume that such
+requests would also be authenticated per request.
+
+CVE-2015-3148
+
+Bug: http://curl.haxx.se/docs/adv_20150422B.html
+Reported-by: Isaac Boukris
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/http.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 4c1cfc5..2a226fb 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1433,12 +1433,18 @@ CURLcode Curl_http_done(struct connectdata *conn,
+=20
+   Curl_unencode_cleanup(conn);
+=20
+ #ifdef USE_SPNEGO
+   if(data->state.proxyneg.state =3D=3D GSS_AUTHSENT ||
+-      data->state.negotiate.state =3D=3D GSS_AUTHSENT)
++      data->state.negotiate.state =3D=3D GSS_AUTHSENT) {
++    /* add forbid re-use if http-code !=3D 401 as a WA
++     * only needed for 401 that failed handling
++     * otherwie state will be RECV with current code */
++    if((data->req.httpcode !=3D 401) && (data->req.httpcode !=3D 407))
++      connclose(conn, "Negotiate transfer completed");
+     Curl_cleanup_negotiate(data);
++  }
+ #endif
+=20
+   /* set the proper values (possibly modified on POST) */
+   conn->fread_func =3D data->set.fread_func; /* restore */
+   conn->fread_in =3D data->set.in; /* restore */
+--=20
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-suppor=
t/curl/curl_7.40.0.bb
index 4cde9c6..2b39d11 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D7;md5=3D3=
a34942f4ae3fbf1a303160714e66
=20
 SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
+           file://CVE-2015-3143.patch \
+           file://CVE-2015-3144.patch \
+           file://CVE-2015-3145.patch \
+           file://CVE-2015-3148.patch \
           "
=20
 # curl likes to set -g0 in CFLAGS, so we stop it
--=20
1.9.1


