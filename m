Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4245C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 11:09:17 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.83224.1657019350094145369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 04:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 265B8rXg017438
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 04:08:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 265B8mm3017036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 04:08:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 5 Jul 2022 04:08:47 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 5 Jul 2022 04:08:47 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] curl: Upgrade to 7.84.0
Date: Tue, 5 Jul 2022 19:08:46 +0800
Message-ID: <20220705110846.901820-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 265B8rXg017438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 11:09:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167650

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade to 7.84.0 to fix CVEs [1].

Backport a patch fixing a compile issue where sched.h was not included
on certain platforms.

[1] https://curl.se/changes.html#7_84_0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ude-sched.h-if-available-to-fix-buil.patch |  33 ++
 .../curl/curl/CVE-2022-22576.patch            | 145 ------
 .../curl/curl/CVE-2022-27774-1.patch          |  45 --
 .../curl/curl/CVE-2022-27774-2.patch          |  80 ---
 .../curl/curl/CVE-2022-27774-3.patch          |  83 ----
 .../curl/curl/CVE-2022-27774-4.patch          |  35 --
 .../curl/curl/CVE-2022-27775.patch            |  37 --
 .../curl/curl/CVE-2022-27776.patch            | 115 -----
 .../curl/curl/CVE-2022-27779.patch            |  42 --
 .../curl/curl/CVE-2022-27780.patch            |  33 --
 .../curl/curl/CVE-2022-27781.patch            |  43 --
 .../curl/curl/CVE-2022-27782-1.patch          | 458 ------------------
 .../curl/curl/CVE-2022-27782-2.patch          |  71 ---
 .../curl/curl/CVE-2022-30115.patch            |  82 ----
 .../curl/{curl_7.82.0.bb =3D> curl_7.84.0.bb}   |  16 +-
 15 files changed, 35 insertions(+), 1283 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-easy_lock.h-inclu=
de-sched.h-if-available-to-fix-buil.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27779.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27780.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2022-30115.patch
 rename meta/recipes-support/curl/{curl_7.82.0.bb =3D> curl_7.84.0.bb} (8=
7%)

diff --git a/meta/recipes-support/curl/curl/0001-easy_lock.h-include-sche=
d.h-if-available-to-fix-buil.patch b/meta/recipes-support/curl/curl/0001-=
easy_lock.h-include-sched.h-if-available-to-fix-buil.patch
new file mode 100644
index 0000000000..771bdb2b96
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-easy_lock.h-include-sched.h-if-=
available-to-fix-buil.patch
@@ -0,0 +1,33 @@
+From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Jun 2022 08:46:21 +0200
+Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
+
+Patched-by: Harry Sintonen
+
+Closes #9054
+
+Upstream-Status: Backport [e2e7f54b7bea521fa8373095d0f43261a720cda0]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/easy_lock.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+index 819f50ce8..1f54289ce 100644
+--- a/lib/easy_lock.h
++++ b/lib/easy_lock.h
+@@ -36,6 +36,9 @@
+=20
+ #elif defined (HAVE_ATOMIC)
+ #include <stdatomic.h>
++#if defined(HAVE_SCHED_YIELD)
++#include <sched.h>
++#endif
+=20
+ #define curl_simple_lock atomic_bool
+ #define CURL_SIMPLE_LOCK_INIT false
+--=20
+2.35.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2022-22576.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-22576.patch
deleted file mode 100644
index 469cf220ba..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-22576.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 371264697a70e8ed3da678aefbe20940759485fa Mon Sep 17 00:00:00 2001
-From: Patrick Monnerat <patrick@monnerat.net>
-Date: Mon, 25 Apr 2022 11:44:05 +0200
-Subject: [PATCH] url: check sasl additional parameters for connection re=
use.
-
-Also move static function safecmp() as non-static Curl_safecmp() since
-its purpose is needed at several places.
-
-Bug: https://curl.se/docs/CVE-2022-22576.html
-
-CVE-2022-22576
-
-Closes #8746
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/852aa5ad3=
51ea53e5f01d2f44b5b4370c2bf5425]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/strcase.c   | 10 ++++++++++
- lib/strcase.h   |  2 ++
- lib/url.c       | 13 ++++++++++++-
- lib/urldata.h   |  1 +
- lib/vtls/vtls.c | 21 ++++++---------------
- 5 files changed, 31 insertions(+), 16 deletions(-)
-
-diff --git a/lib/strcase.c b/lib/strcase.c
-index dd46ca1..692a3f1 100644
---- a/lib/strcase.c
-+++ b/lib/strcase.c
-@@ -131,6 +131,16 @@ void Curl_strntolower(char *dest, const char *src, =
size_t n)
-   } while(*src++ && --n);
- }
-=20
-+/* Compare case-sensitive NUL-terminated strings, taking care of possib=
le
-+ * null pointers. Return true if arguments match.
-+ */
-+bool Curl_safecmp(char *a, char *b)
-+{
-+  if(a && b)
-+    return !strcmp(a, b);
-+  return !a && !b;
-+}
-+
- /* --- public functions --- */
-=20
- int curl_strequal(const char *first, const char *second)
-diff --git a/lib/strcase.h b/lib/strcase.h
-index b628656..382b80a 100644
---- a/lib/strcase.h
-+++ b/lib/strcase.h
-@@ -47,4 +47,6 @@ char Curl_raw_toupper(char in);
- void Curl_strntoupper(char *dest, const char *src, size_t n);
- void Curl_strntolower(char *dest, const char *src, size_t n);
-=20
-+bool Curl_safecmp(char *a, char *b);
-+
- #endif /* HEADER_CURL_STRCASE_H */
-diff --git a/lib/url.c b/lib/url.c
-index adef2cd..94e3406 100644
---- a/lib/url.c
-+++ b/lib/url.c
-@@ -779,6 +779,7 @@ static void conn_free(struct connectdata *conn)
-   Curl_safefree(conn->passwd);
-   Curl_safefree(conn->sasl_authzid);
-   Curl_safefree(conn->options);
-+  Curl_safefree(conn->oauth_bearer);
-   Curl_dyn_free(&conn->trailer);
-   Curl_safefree(conn->host.rawalloc); /* host name buffer */
-   Curl_safefree(conn->conn_to_host.rawalloc); /* host name buffer */
-@@ -1340,7 +1341,9 @@ ConnectionExists(struct Curl_easy *data,
-         /* This protocol requires credentials per connection,
-            so verify that we're using the same name and password as wel=
l */
-         if(strcmp(needle->user, check->user) ||
--           strcmp(needle->passwd, check->passwd)) {
-+           strcmp(needle->passwd, check->passwd) ||
-+           !Curl_safecmp(needle->sasl_authzid, check->sasl_authzid) ||
-+           !Curl_safecmp(needle->oauth_bearer, check->oauth_bearer)) {
-           /* one of them was different */
-           continue;
-         }
-@@ -3635,6 +3638,14 @@ static CURLcode create_conn(struct Curl_easy *dat=
a,
-     }
-   }
-=20
-+  if(data->set.str[STRING_BEARER]) {
-+    conn->oauth_bearer =3D strdup(data->set.str[STRING_BEARER]);
-+    if(!conn->oauth_bearer) {
-+      result =3D CURLE_OUT_OF_MEMORY;
-+      goto out;
-+    }
-+  }
-+
- #ifdef USE_UNIX_SOCKETS
-   if(data->set.str[STRING_UNIX_SOCKET_PATH]) {
-     conn->unix_domain_socket =3D strdup(data->set.str[STRING_UNIX_SOCKE=
T_PATH]);
-diff --git a/lib/urldata.h b/lib/urldata.h
-index cc8a600..03da59a 100644
---- a/lib/urldata.h
-+++ b/lib/urldata.h
-@@ -984,6 +984,7 @@ struct connectdata {
-   char *passwd;  /* password string, allocated */
-   char *options; /* options string, allocated */
-   char *sasl_authzid;     /* authorisation identity string, allocated *=
/
-+  char *oauth_bearer; /* OAUTH2 bearer, allocated */
-   unsigned char httpversion; /* the HTTP version*10 reported by the ser=
ver */
-   struct curltime now;     /* "current" time */
-   struct curltime created; /* creation time */
-diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
-index 03b85ba..a40ac06 100644
---- a/lib/vtls/vtls.c
-+++ b/lib/vtls/vtls.c
-@@ -125,15 +125,6 @@ static bool blobcmp(struct curl_blob *first, struct=
 curl_blob *second)
-   return !memcmp(first->data, second->data, first->len); /* same data *=
/
- }
-=20
--static bool safecmp(char *a, char *b)
--{
--  if(a && b)
--    return !strcmp(a, b);
--  else if(!a && !b)
--    return TRUE; /* match */
--  return FALSE; /* no match */
--}
--
-=20
- bool
- Curl_ssl_config_matches(struct ssl_primary_config *data,
-@@ -147,12 +138,12 @@ Curl_ssl_config_matches(struct ssl_primary_config =
*data,
-      blobcmp(data->cert_blob, needle->cert_blob) &&
-      blobcmp(data->ca_info_blob, needle->ca_info_blob) &&
-      blobcmp(data->issuercert_blob, needle->issuercert_blob) &&
--     safecmp(data->CApath, needle->CApath) &&
--     safecmp(data->CAfile, needle->CAfile) &&
--     safecmp(data->issuercert, needle->issuercert) &&
--     safecmp(data->clientcert, needle->clientcert) &&
--     safecmp(data->random_file, needle->random_file) &&
--     safecmp(data->egdsocket, needle->egdsocket) &&
-+     Curl_safecmp(data->CApath, needle->CApath) &&
-+     Curl_safecmp(data->CAfile, needle->CAfile) &&
-+     Curl_safecmp(data->issuercert, needle->issuercert) &&
-+     Curl_safecmp(data->clientcert, needle->clientcert) &&
-+     Curl_safecmp(data->random_file, needle->random_file) &&
-+     Curl_safecmp(data->egdsocket, needle->egdsocket) &&
-      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &=
&
-      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list1=
3) &&
-      Curl_safe_strcasecompare(data->curves, needle->curves) &&
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-1.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27774-1.patch
deleted file mode 100644
index f24003fd79..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f489d50ca5fd8b6a3a622e2521e2ca52787a6608 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 25 Apr 2022 16:24:33 +0200
-Subject: [PATCH] connect: store "conn_remote_port" in the info struct
-
-To make it available after the connection ended.
-
-Prerequisite for the patches that address CVE-2022-27774.
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/08b8ef4e7=
26ba10f45081ecda5b3cea788d3c839]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/connect.c | 1 +
- lib/urldata.h | 6 +++++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/lib/connect.c b/lib/connect.c
-index 64f9511..7518807 100644
---- a/lib/connect.c
-+++ b/lib/connect.c
-@@ -623,6 +623,7 @@ void Curl_persistconninfo(struct Curl_easy *data, st=
ruct connectdata *conn,
-   data->info.conn_scheme =3D conn->handler->scheme;
-   data->info.conn_protocol =3D conn->handler->protocol;
-   data->info.conn_primary_port =3D conn->port;
-+  data->info.conn_remote_port =3D conn->remote_port;
-   data->info.conn_local_port =3D local_port;
- }
-=20
-diff --git a/lib/urldata.h b/lib/urldata.h
-index f92052a..5218f76 100644
---- a/lib/urldata.h
-+++ b/lib/urldata.h
-@@ -1160,7 +1160,11 @@ struct PureInfo {
-      reused, in the connection cache. */
-=20
-   char conn_primary_ip[MAX_IPADR_LEN];
--  int conn_primary_port;
-+  int conn_primary_port; /* this is the destination port to the connect=
ion,
-+                            which might have been a proxy */
-+  int conn_remote_port;  /* this is the "remote port", which is the por=
t
-+                            number of the used URL, independent of prox=
y or
-+                            not */
-   char conn_local_ip[MAX_IPADR_LEN];
-   int conn_local_port;
-   const char *conn_scheme;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-2.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27774-2.patch
deleted file mode 100644
index 9739634dfe..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 50aebd6ea20956513e9b7d7c776830b54d9c8ff6 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 25 Apr 2022 16:24:33 +0200
-Subject: [PATCH] transfer: redirects to other protocols or ports clear a=
uth
-
-... unless explicitly permitted.
-
-Bug: https://curl.se/docs/CVE-2022-27774.html
-Reported-by: Harry Sintonen
-Closes #8748
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/620ea2141=
0030a9977396b4661806bc187231b79]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/transfer.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 48 insertions(+), 1 deletion(-)
-
-diff --git a/lib/transfer.c b/lib/transfer.c
-index 1f8019b..752fe14 100644
---- a/lib/transfer.c
-+++ b/lib/transfer.c
-@@ -1608,10 +1608,57 @@ CURLcode Curl_follow(struct Curl_easy *data,
-       return CURLE_OUT_OF_MEMORY;
-   }
-   else {
--
-     uc =3D curl_url_get(data->state.uh, CURLUPART_URL, &newurl, 0);
-     if(uc)
-       return Curl_uc_to_curlcode(uc);
-+
-+    /* Clear auth if this redirects to a different port number or proto=
col,
-+       unless permitted */
-+    if(!data->set.allow_auth_to_other_hosts && (type !=3D FOLLOW_FAKE))=
 {
-+      char *portnum;
-+      int port;
-+      bool clear =3D FALSE;
-+
-+      if(data->set.use_port && data->state.allow_port)
-+        /* a custom port is used */
-+        port =3D (int)data->set.use_port;
-+      else {
-+        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
-+                          CURLU_DEFAULT_PORT);
-+        if(uc) {
-+          free(newurl);
-+          return Curl_uc_to_curlcode(uc);
-+        }
-+        port =3D atoi(portnum);
-+        free(portnum);
-+      }
-+      if(port !=3D data->info.conn_remote_port) {
-+        infof(data, "Clear auth, redirects to port from %u to %u",
-+              data->info.conn_remote_port, port);
-+        clear =3D TRUE;
-+      }
-+      else {
-+        char *scheme;
-+        const struct Curl_handler *p;
-+        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, =
0);
-+        if(uc) {
-+          free(newurl);
-+          return Curl_uc_to_curlcode(uc);
-+        }
-+
-+        p =3D Curl_builtin_scheme(scheme);
-+        if(p && (p->protocol !=3D data->info.conn_protocol)) {
-+          infof(data, "Clear auth, redirects scheme from %s to %s",
-+                data->info.conn_scheme, scheme);
-+          clear =3D TRUE;
-+        }
-+        free(scheme);
-+      }
-+      if(clear) {
-+        Curl_safefree(data->state.aptr.user);
-+        Curl_safefree(data->state.aptr.passwd);
-+      }
-+    }
-   }
-=20
-   if(type =3D=3D FOLLOW_FAKE) {
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-3.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27774-3.patch
deleted file mode 100644
index e4e8c294a6..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 8af08ebf94bc6448dbc7da59845f5b78964689d9 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 25 Apr 2022 17:59:15 +0200
-Subject: [PATCH] openssl: don't leak the SRP credentials in redirects ei=
ther
-
-Follow-up to 620ea21410030
-
-Reported-by: Harry Sintonen
-Closes #8751
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/139a54ed0=
a172adaaf1a78d6f4fff50b2c3f9e08]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/http.c         | 10 +++++-----
- lib/http.h         |  6 ++++++
- lib/vtls/openssl.c |  3 ++-
- 3 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/lib/http.c b/lib/http.c
-index 0791dcf..4433824 100644
---- a/lib/http.c
-+++ b/lib/http.c
-@@ -776,10 +776,10 @@ output_auth_headers(struct Curl_easy *data,
- }
-=20
- /*
-- * allow_auth_to_host() tells if autentication, cookies or other "sensi=
tive
-- * data" can (still) be sent to this host.
-+ * Curl_allow_auth_to_host() tells if authentication, cookies or other
-+ * "sensitive data" can (still) be sent to this host.
-  */
--static bool allow_auth_to_host(struct Curl_easy *data)
-+bool Curl_allow_auth_to_host(struct Curl_easy *data)
- {
-   struct connectdata *conn =3D data->conn;
-   return (!data->state.this_is_a_follow ||
-@@ -864,7 +864,7 @@ Curl_http_output_auth(struct Curl_easy *data,
-=20
-   /* To prevent the user+password to get sent to other than the origina=
l host
-      due to a location-follow */
--  if(allow_auth_to_host(data)
-+  if(Curl_allow_auth_to_host(data)
- #ifndef CURL_DISABLE_NETRC
-      || conn->bits.netrc
- #endif
-@@ -1917,7 +1917,7 @@ CURLcode Curl_add_custom_headers(struct Curl_easy =
*data,
-                    checkprefix("Cookie:", compare)) &&
-                   /* be careful of sending this potentially sensitive h=
eader to
-                      other hosts */
--                  !allow_auth_to_host(data))
-+                  !Curl_allow_auth_to_host(data))
-             ;
-           else {
- #ifdef USE_HYPER
-diff --git a/lib/http.h b/lib/http.h
-index 07e963d..9000bae 100644
---- a/lib/http.h
-+++ b/lib/http.h
-@@ -320,4 +320,10 @@ Curl_http_output_auth(struct Curl_easy *data,
-                       bool proxytunnel); /* TRUE if this is the request=
 setting
-                                             up the proxy tunnel */
-=20
-+/*
-+ * Curl_allow_auth_to_host() tells if authentication, cookies or other
-+ * "sensitive data" can (still) be sent to this host.
-+ */
-+bool Curl_allow_auth_to_host(struct Curl_easy *data);
-+
- #endif /* HEADER_CURL_HTTP_H */
-diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
-index 616a510..e8633f4 100644
---- a/lib/vtls/openssl.c
-+++ b/lib/vtls/openssl.c
-@@ -2893,7 +2893,8 @@ static CURLcode ossl_connect_step1(struct Curl_eas=
y *data,
- #endif
-=20
- #ifdef USE_OPENSSL_SRP
--  if(ssl_authtype =3D=3D CURL_TLSAUTH_SRP) {
-+  if((ssl_authtype =3D=3D CURL_TLSAUTH_SRP) &&
-+     Curl_allow_auth_to_host(data)) {
-     char * const ssl_username =3D SSL_SET_OPTION(username);
-=20
-     infof(data, "Using TLS-SRP username: %s", ssl_username);
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-4.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27774-4.patch
deleted file mode 100644
index a642336797..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 56a145d6ca031841610daeebde99fbde0f8fcf21 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Tue, 26 Apr 2022 07:46:19 +0200
-Subject: [PATCH] gnutls: don't leak the SRP credentials in redirects
-
-Follow-up to 620ea21410030 and 139a54ed0a172a
-
-Reported-by: Harry Sintonen
-Closes #8752
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/093531556=
203decd92d92bccd431edbe5561781c]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/vtls/gtls.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
-index 5749376..fe45b3a 100644
---- a/lib/vtls/gtls.c
-+++ b/lib/vtls/gtls.c
-@@ -437,11 +437,11 @@ gtls_connect_step1(struct Curl_easy *data,
-   }
-=20
- #ifdef HAVE_GNUTLS_SRP
--  if(SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP) {
-+  if((SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP) &&
-+     Curl_allow_auth_to_host(data)) {
-     infof(data, "Using TLS-SRP username: %s", SSL_SET_OPTION(username))=
;
-=20
--    rc =3D gnutls_srp_allocate_client_credentials(
--           &backend->srp_client_cred);
-+    rc =3D gnutls_srp_allocate_client_credentials(&backend->srp_client_=
cred);
-     if(rc !=3D GNUTLS_E_SUCCESS) {
-       failf(data, "gnutls_srp_allocate_client_cred() failed: %s",
-             gnutls_strerror(rc));
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27775.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27775.patch
deleted file mode 100644
index 666a906352..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27775.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From eef2b165c39245857b1663e9153e7c4b4b519a4c Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 25 Apr 2022 11:48:00 +0200
-Subject: [PATCH] conncache: include the zone id in the "bundle" hashkey
-
-Make connections to two separate IPv6 zone ids create separate
-connections.
-
-Reported-by: Harry Sintonen
-Bug: https://curl.se/docs/CVE-2022-27775.html
-Closes #8747
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/058f98dc3=
fe595f21dc26a5b9b1699e519ba5705]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/conncache.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/lib/conncache.c b/lib/conncache.c
-index cd5756a..9b9f683 100644
---- a/lib/conncache.c
-+++ b/lib/conncache.c
-@@ -155,8 +155,12 @@ static void hashkey(struct connectdata *conn, char =
*buf,
-     /* report back which name we used */
-     *hostp =3D hostname;
-=20
--  /* put the number first so that the hostname gets cut off if too long=
 */
--  msnprintf(buf, len, "%ld%s", port, hostname);
-+  /* put the numbers first so that the hostname gets cut off if too lon=
g */
-+#ifdef ENABLE_IPV6
-+  msnprintf(buf, len, "%u/%ld/%s", conn->scope_id, port, hostname);
-+#else
-+  msnprintf(buf, len, "%ld/%s", port, hostname);
-+#endif
-   Curl_strntolower(buf, buf, len);
- }
-=20
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27776.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27776.patch
deleted file mode 100644
index 2feee45200..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27776.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From f6eba3638f9b25adfe85f3570f9a0fb2ceb09c2b Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 25 Apr 2022 13:05:40 +0200
-Subject: [PATCH] http: avoid auth/cookie on redirects same host diff por=
t
-
-CVE-2022-27776
-
-Reported-by: Harry Sintonen
-Bug: https://curl.se/docs/CVE-2022-27776.html
-Closes #8749
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/6e6599939=
52aa5f90f48864be84a1bbb047fc258]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/http.c    | 34 ++++++++++++++++++++++------------
- lib/urldata.h | 16 +++++++++-------
- 2 files changed, 31 insertions(+), 19 deletions(-)
-
-diff --git a/lib/http.c b/lib/http.c
-index 799d4fb..0791dcf 100644
---- a/lib/http.c
-+++ b/lib/http.c
-@@ -775,6 +775,21 @@ output_auth_headers(struct Curl_easy *data,
-   return CURLE_OK;
- }
-=20
-+/*
-+ * allow_auth_to_host() tells if autentication, cookies or other "sensi=
tive
-+ * data" can (still) be sent to this host.
-+ */
-+static bool allow_auth_to_host(struct Curl_easy *data)
-+{
-+  struct connectdata *conn =3D data->conn;
-+  return (!data->state.this_is_a_follow ||
-+          data->set.allow_auth_to_other_hosts ||
-+          (data->state.first_host &&
-+           strcasecompare(data->state.first_host, conn->host.name) &&
-+           (data->state.first_remote_port =3D=3D conn->remote_port) &&
-+           (data->state.first_remote_protocol =3D=3D conn->handler->pro=
tocol)));
-+}
-+
- /**
-  * Curl_http_output_auth() setups the authentication headers for the
-  * host/proxy and the correct authentication
-@@ -847,17 +862,14 @@ Curl_http_output_auth(struct Curl_easy *data,
-        with it */
-     authproxy->done =3D TRUE;
-=20
--  /* To prevent the user+password to get sent to other than the origina=
l
--     host due to a location-follow, we do some weirdo checks here */
--  if(!data->state.this_is_a_follow ||
-+  /* To prevent the user+password to get sent to other than the origina=
l host
-+     due to a location-follow */
-+  if(allow_auth_to_host(data)
- #ifndef CURL_DISABLE_NETRC
--     conn->bits.netrc ||
-+     || conn->bits.netrc
- #endif
--     !data->state.first_host ||
--     data->set.allow_auth_to_other_hosts ||
--     strcasecompare(data->state.first_host, conn->host.name)) {
-+    )
-     result =3D output_auth_headers(data, conn, authhost, request, path,=
 FALSE);
--  }
-   else
-     authhost->done =3D TRUE;
-=20
-@@ -1905,10 +1917,7 @@ CURLcode Curl_add_custom_headers(struct Curl_easy=
 *data,
-                    checkprefix("Cookie:", compare)) &&
-                   /* be careful of sending this potentially sensitive h=
eader to
-                      other hosts */
--                  (data->state.this_is_a_follow &&
--                   data->state.first_host &&
--                   !data->set.allow_auth_to_other_hosts &&
--                   !strcasecompare(data->state.first_host, conn->host.n=
ame)))
-+                  !allow_auth_to_host(data))
-             ;
-           else {
- #ifdef USE_HYPER
-@@ -2084,6 +2093,7 @@ CURLcode Curl_http_host(struct Curl_easy *data, st=
ruct connectdata *conn)
-       return CURLE_OUT_OF_MEMORY;
-=20
-     data->state.first_remote_port =3D conn->remote_port;
-+    data->state.first_remote_protocol =3D conn->handler->protocol;
-   }
-   Curl_safefree(data->state.aptr.host);
-=20
-diff --git a/lib/urldata.h b/lib/urldata.h
-index 03da59a..f92052a 100644
---- a/lib/urldata.h
-+++ b/lib/urldata.h
-@@ -1329,14 +1329,16 @@ struct UrlState {
-   char *ulbuf; /* allocated upload buffer or NULL */
-   curl_off_t current_speed;  /* the ProgressShow() function sets this,
-                                 bytes / second */
--  char *first_host; /* host name of the first (not followed) request.
--                       if set, this should be the host name that we wil=
l
--                       sent authorization to, no else. Used to make Loc=
ation:
--                       following not keep sending user+password... This=
 is
--                       strdup() data.
--                    */
-+
-+  /* host name, port number and protocol of the first (not followed) re=
quest.
-+     if set, this should be the host name that we will sent authorizati=
on to,
-+     no else. Used to make Location: following not keep sending user+pa=
ssword.
-+     This is strdup()ed data. */
-+  char *first_host;
-+  int first_remote_port;
-+  unsigned int first_remote_protocol;
-+
-   int retrycount; /* number of retries on a new connection */
--  int first_remote_port; /* remote port of the first (not followed) req=
uest */
-   struct Curl_ssl_session *session; /* array of 'max_ssl_sessions' size=
 */
-   long sessionage;                  /* number of the most recent sessio=
n */
-   struct tempbuf tempwrite[3]; /* BOTH, HEADER, BODY */
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27779.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27779.patch
deleted file mode 100644
index 235be900a3..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27779.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 33dac5777fe5f9c8d2d7d340144b1685cd511d11 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 16:47:06 +0200
-Subject: [PATCH] cookies: make bad_domain() not consider a trailing dot =
fine
-
-The check for a dot in the domain must not consider a single trailing
-dot to be fine, as then TLD + trailing dot is fine and curl will accept
-setting cookies for it.
-
-CVE-2022-27779
-
-Reported-by: Axel Chong
-Bug: https://curl.se/docs/CVE-2022-27779.html
-Closes #8820
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/7e92d12b4=
e6911f424678a133b19de670e183a59]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/cookie.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/lib/cookie.c b/lib/cookie.c
-index d418efa..1b8c8f9 100644
---- a/lib/cookie.c
-+++ b/lib/cookie.c
-@@ -427,7 +427,15 @@ static void remove_expired(struct CookieInfo *cooki=
es)
- /* Make sure domain contains a dot or is localhost. */
- static bool bad_domain(const char *domain)
- {
--  return !strchr(domain, '.') && !strcasecompare(domain, "localhost");
-+  if(strcasecompare(domain, "localhost"))
-+    return FALSE;
-+  else {
-+    /* there must be a dot present, but that dot must not be a trailing=
 dot */
-+    char *dot =3D strchr(domain, '.');
-+    if(dot)
-+      return dot[1] ? FALSE : TRUE;
-+  }
-+  return TRUE;
- }
-=20
- /*
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27780.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27780.patch
deleted file mode 100644
index 8820af3f74..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27780.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 304b7acf73712fa501119b1ca0724f71f3074fe7 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 08:19:38 +0200
-Subject: [PATCH] urlapi: reject percent-decoding host name into separato=
r
- bytes
-
-CVE-2022-27780
-
-Reported-by: Axel Chong
-Bug: https://curl.se/docs/CVE-2022-27780.html
-Closes #8826
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/914aaab91=
53764ef8fa4178215b8ad89d3ac263a]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/urlapi.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/urlapi.c b/lib/urlapi.c
-index ff00ee4..00222fc 100644
---- a/lib/urlapi.c
-+++ b/lib/urlapi.c
-@@ -678,8 +678,8 @@ static CURLUcode hostname_check(struct Curl_URL *u, =
char *hostname)
- #endif
-   }
-   else {
--    /* letters from the second string is not ok */
--    len =3D strcspn(hostname, " \r\n");
-+    /* letters from the second string are not ok */
-+    len =3D strcspn(hostname, " \r\n\t/:#?!@");
-     if(hlen !=3D len)
-       /* hostname with bad content */
-       return CURLUE_BAD_HOSTNAME;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27781.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27781.patch
deleted file mode 100644
index 52f39a0cc5..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27781.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 5bb5b2a901db4c6441fc451f21408be2a9463058 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 10:07:15 +0200
-Subject: [PATCH] nss: return error if seemingly stuck in a cert loop
-
-CVE-2022-27781
-
-Reported-by: Florian Kohnh=C3=A4user
-Bug: https://curl.se/docs/CVE-2022-27781.html
-Closes #8822
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/5c7da89d4=
04bf59c8dd82a001119a16d18365917]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/vtls/nss.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
-index 558e3be..52f2060 100644
---- a/lib/vtls/nss.c
-+++ b/lib/vtls/nss.c
-@@ -983,6 +983,9 @@ static void display_cert_info(struct Curl_easy *data=
,
-   PR_Free(common_name);
- }
-=20
-+/* A number of certs that will never occur in a real server handshake *=
/
-+#define TOO_MANY_CERTS 300
-+
- static CURLcode display_conn_info(struct Curl_easy *data, PRFileDesc *s=
ock)
- {
-   CURLcode result =3D CURLE_OK;
-@@ -1018,6 +1021,11 @@ static CURLcode display_conn_info(struct Curl_eas=
y *data, PRFileDesc *sock)
-         cert2 =3D CERT_FindCertIssuer(cert, now, certUsageSSLCA);
-         while(cert2) {
-           i++;
-+          if(i >=3D TOO_MANY_CERTS) {
-+            CERT_DestroyCertificate(cert2);
-+            failf(data, "certificate loop");
-+            return CURLE_SSL_CERTPROBLEM;
-+          }
-           if(cert2->isRoot) {
-             CERT_DestroyCertificate(cert2);
-             break;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782-1.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27782-1.patch
deleted file mode 100644
index ce2599be81..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
+++ /dev/null
@@ -1,458 +0,0 @@
-From acee9eb38639b35af9047521d71333423657de0d Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 23:13:53 +0200
-Subject: [PATCH] tls: check more TLS details for connection reuse
-
-CVE-2022-27782
-
-Reported-by: Harry Sintonen
-Bug: https://curl.se/docs/CVE-2022-27782.html
-Closes #8825
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/f18af4f87=
4cecab82a9797e8c7541e0990c7a64c]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/setopt.c       | 29 +++++++++++++++++------------
- lib/url.c          | 23 ++++++++++++++++-------
- lib/urldata.h      | 13 +++++++------
- lib/vtls/gtls.c    | 32 +++++++++++++++++---------------
- lib/vtls/mbedtls.c |  2 +-
- lib/vtls/nss.c     |  6 +++---
- lib/vtls/openssl.c | 10 +++++-----
- lib/vtls/vtls.c    | 21 +++++++++++++++++++++
- 8 files changed, 87 insertions(+), 49 deletions(-)
-
-diff --git a/lib/setopt.c b/lib/setopt.c
-index 8e1bf12..7aa6fdb 100644
---- a/lib/setopt.c
-+++ b/lib/setopt.c
-@@ -2294,6 +2294,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURL=
option option, va_list param)
-=20
-   case CURLOPT_SSL_OPTIONS:
-     arg =3D va_arg(param, long);
-+    data->set.ssl.primary.ssl_options =3D (unsigned char)(arg & 0xff);
-     data->set.ssl.enable_beast =3D !!(arg & CURLSSLOPT_ALLOW_BEAST);
-     data->set.ssl.no_revoke =3D !!(arg & CURLSSLOPT_NO_REVOKE);
-     data->set.ssl.no_partialchain =3D !!(arg & CURLSSLOPT_NO_PARTIALCHA=
IN);
-@@ -2307,6 +2308,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURL=
option option, va_list param)
- #ifndef CURL_DISABLE_PROXY
-   case CURLOPT_PROXY_SSL_OPTIONS:
-     arg =3D va_arg(param, long);
-+    data->set.proxy_ssl.primary.ssl_options =3D (unsigned char)(arg & 0=
xff);
-     data->set.proxy_ssl.enable_beast =3D !!(arg & CURLSSLOPT_ALLOW_BEAS=
T);
-     data->set.proxy_ssl.no_revoke =3D !!(arg & CURLSSLOPT_NO_REVOKE);
-     data->set.proxy_ssl.no_partialchain =3D !!(arg & CURLSSLOPT_NO_PART=
IALCHAIN);
-@@ -2745,49 +2747,52 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CU=
RLoption option, va_list param)
-   case CURLOPT_TLSAUTH_USERNAME:
-     result =3D Curl_setstropt(&data->set.str[STRING_TLSAUTH_USERNAME],
-                             va_arg(param, char *));
--    if(data->set.str[STRING_TLSAUTH_USERNAME] && !data->set.ssl.authtyp=
e)
--      data->set.ssl.authtype =3D CURL_TLSAUTH_SRP; /* default to SRP */
-+    if(data->set.str[STRING_TLSAUTH_USERNAME] &&
-+       !data->set.ssl.primary.authtype)
-+      data->set.ssl.primary.authtype =3D CURL_TLSAUTH_SRP; /* default t=
o SRP */
-     break;
- #ifndef CURL_DISABLE_PROXY
-   case CURLOPT_PROXY_TLSAUTH_USERNAME:
-     result =3D Curl_setstropt(&data->set.str[STRING_TLSAUTH_USERNAME_PR=
OXY],
-                             va_arg(param, char *));
-     if(data->set.str[STRING_TLSAUTH_USERNAME_PROXY] &&
--       !data->set.proxy_ssl.authtype)
--      data->set.proxy_ssl.authtype =3D CURL_TLSAUTH_SRP; /* default to =
SRP */
-+       !data->set.proxy_ssl.primary.authtype)
-+      data->set.proxy_ssl.primary.authtype =3D CURL_TLSAUTH_SRP; /* def=
ault to
-+                                                                  SRP *=
/
-     break;
- #endif
-   case CURLOPT_TLSAUTH_PASSWORD:
-     result =3D Curl_setstropt(&data->set.str[STRING_TLSAUTH_PASSWORD],
-                             va_arg(param, char *));
--    if(data->set.str[STRING_TLSAUTH_USERNAME] && !data->set.ssl.authtyp=
e)
--      data->set.ssl.authtype =3D CURL_TLSAUTH_SRP; /* default to SRP */
-+    if(data->set.str[STRING_TLSAUTH_USERNAME] &&
-+       !data->set.ssl.primary.authtype)
-+      data->set.ssl.primary.authtype =3D CURL_TLSAUTH_SRP; /* default *=
/
-     break;
- #ifndef CURL_DISABLE_PROXY
-   case CURLOPT_PROXY_TLSAUTH_PASSWORD:
-     result =3D Curl_setstropt(&data->set.str[STRING_TLSAUTH_PASSWORD_PR=
OXY],
-                             va_arg(param, char *));
-     if(data->set.str[STRING_TLSAUTH_USERNAME_PROXY] &&
--       !data->set.proxy_ssl.authtype)
--      data->set.proxy_ssl.authtype =3D CURL_TLSAUTH_SRP; /* default to =
SRP */
-+       !data->set.proxy_ssl.primary.authtype)
-+      data->set.proxy_ssl.primary.authtype =3D CURL_TLSAUTH_SRP; /* def=
ault */
-     break;
- #endif
-   case CURLOPT_TLSAUTH_TYPE:
-     argptr =3D va_arg(param, char *);
-     if(!argptr ||
-        strncasecompare(argptr, "SRP", strlen("SRP")))
--      data->set.ssl.authtype =3D CURL_TLSAUTH_SRP;
-+      data->set.ssl.primary.authtype =3D CURL_TLSAUTH_SRP;
-     else
--      data->set.ssl.authtype =3D CURL_TLSAUTH_NONE;
-+      data->set.ssl.primary.authtype =3D CURL_TLSAUTH_NONE;
-     break;
- #ifndef CURL_DISABLE_PROXY
-   case CURLOPT_PROXY_TLSAUTH_TYPE:
-     argptr =3D va_arg(param, char *);
-     if(!argptr ||
-        strncasecompare(argptr, "SRP", strlen("SRP")))
--      data->set.proxy_ssl.authtype =3D CURL_TLSAUTH_SRP;
-+      data->set.proxy_ssl.primary.authtype =3D CURL_TLSAUTH_SRP;
-     else
--      data->set.proxy_ssl.authtype =3D CURL_TLSAUTH_NONE;
-+      data->set.proxy_ssl.primary.authtype =3D CURL_TLSAUTH_NONE;
-     break;
- #endif
- #endif
-diff --git a/lib/url.c b/lib/url.c
-index 94e3406..5ebf5e2 100644
---- a/lib/url.c
-+++ b/lib/url.c
-@@ -540,7 +540,7 @@ CURLcode Curl_init_userdefined(struct Curl_easy *dat=
a)
-   set->ssl.primary.verifypeer =3D TRUE;
-   set->ssl.primary.verifyhost =3D TRUE;
- #ifdef USE_TLS_SRP
--  set->ssl.authtype =3D CURL_TLSAUTH_NONE;
-+  set->ssl.primary.authtype =3D CURL_TLSAUTH_NONE;
- #endif
-   set->ssh_auth_types =3D CURLSSH_AUTH_DEFAULT; /* defaults to any auth
-                                                       type */
-@@ -1758,11 +1758,17 @@ static struct connectdata *allocate_conn(struct =
Curl_easy *data)
-   conn->ssl_config.verifystatus =3D data->set.ssl.primary.verifystatus;
-   conn->ssl_config.verifypeer =3D data->set.ssl.primary.verifypeer;
-   conn->ssl_config.verifyhost =3D data->set.ssl.primary.verifyhost;
-+  conn->ssl_config.ssl_options =3D data->set.ssl.primary.ssl_options;
-+#ifdef USE_TLS_SRP
-+#endif
- #ifndef CURL_DISABLE_PROXY
-   conn->proxy_ssl_config.verifystatus =3D
-     data->set.proxy_ssl.primary.verifystatus;
-   conn->proxy_ssl_config.verifypeer =3D data->set.proxy_ssl.primary.ver=
ifypeer;
-   conn->proxy_ssl_config.verifyhost =3D data->set.proxy_ssl.primary.ver=
ifyhost;
-+  conn->proxy_ssl_config.ssl_options =3D data->set.proxy_ssl.primary.ss=
l_options;
-+#ifdef USE_TLS_SRP
-+#endif
- #endif
-   conn->ip_version =3D data->set.ipver;
-   conn->bits.connect_only =3D data->set.connect_only;
-@@ -3848,7 +3854,8 @@ static CURLcode create_conn(struct Curl_easy *data=
,
-     data->set.str[STRING_SSL_ISSUERCERT_PROXY];
-   data->set.proxy_ssl.primary.issuercert_blob =3D
-     data->set.blobs[BLOB_SSL_ISSUERCERT_PROXY];
--  data->set.proxy_ssl.CRLfile =3D data->set.str[STRING_SSL_CRLFILE_PROX=
Y];
-+  data->set.proxy_ssl.primary.CRLfile =3D
-+    data->set.str[STRING_SSL_CRLFILE_PROXY];
-   data->set.proxy_ssl.cert_type =3D data->set.str[STRING_CERT_TYPE_PROX=
Y];
-   data->set.proxy_ssl.key =3D data->set.str[STRING_KEY_PROXY];
-   data->set.proxy_ssl.key_type =3D data->set.str[STRING_KEY_TYPE_PROXY]=
;
-@@ -3856,18 +3863,20 @@ static CURLcode create_conn(struct Curl_easy *da=
ta,
-   data->set.proxy_ssl.primary.clientcert =3D data->set.str[STRING_CERT_=
PROXY];
-   data->set.proxy_ssl.key_blob =3D data->set.blobs[BLOB_KEY_PROXY];
- #endif
--  data->set.ssl.CRLfile =3D data->set.str[STRING_SSL_CRLFILE];
-+  data->set.ssl.primary.CRLfile =3D data->set.str[STRING_SSL_CRLFILE];
-   data->set.ssl.cert_type =3D data->set.str[STRING_CERT_TYPE];
-   data->set.ssl.key =3D data->set.str[STRING_KEY];
-   data->set.ssl.key_type =3D data->set.str[STRING_KEY_TYPE];
-   data->set.ssl.key_passwd =3D data->set.str[STRING_KEY_PASSWD];
-   data->set.ssl.primary.clientcert =3D data->set.str[STRING_CERT];
- #ifdef USE_TLS_SRP
--  data->set.ssl.username =3D data->set.str[STRING_TLSAUTH_USERNAME];
--  data->set.ssl.password =3D data->set.str[STRING_TLSAUTH_PASSWORD];
-+  data->set.ssl.primary.username =3D data->set.str[STRING_TLSAUTH_USERN=
AME];
-+  data->set.ssl.primary.password =3D data->set.str[STRING_TLSAUTH_PASSW=
ORD];
- #ifndef CURL_DISABLE_PROXY
--  data->set.proxy_ssl.username =3D data->set.str[STRING_TLSAUTH_USERNAM=
E_PROXY];
--  data->set.proxy_ssl.password =3D data->set.str[STRING_TLSAUTH_PASSWOR=
D_PROXY];
-+  data->set.proxy_ssl.primary.username =3D
-+    data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
-+  data->set.proxy_ssl.primary.password =3D
-+    data->set.str[STRING_TLSAUTH_PASSWORD_PROXY];
- #endif
- #endif
-   data->set.ssl.key_blob =3D data->set.blobs[BLOB_KEY];
-diff --git a/lib/urldata.h b/lib/urldata.h
-index 5218f76..e006495 100644
---- a/lib/urldata.h
-+++ b/lib/urldata.h
-@@ -253,10 +253,17 @@ struct ssl_primary_config {
-   char *cipher_list;     /* list of ciphers to use */
-   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
-   char *pinned_key;
-+  char *CRLfile;         /* CRL to check certificate revocation */
-   struct curl_blob *cert_blob;
-   struct curl_blob *ca_info_blob;
-   struct curl_blob *issuercert_blob;
-+#ifdef USE_TLS_SRP
-+  char *username; /* TLS username (for, e.g., SRP) */
-+  char *password; /* TLS password (for, e.g., SRP) */
-+  enum CURL_TLSAUTH authtype; /* TLS authentication type (default SRP) =
*/
-+#endif
-   char *curves;          /* list of curves to use */
-+  unsigned char ssl_options;  /* the CURLOPT_SSL_OPTIONS bitmask */
-   BIT(verifypeer);       /* set TRUE if this is desired */
-   BIT(verifyhost);       /* set TRUE if CN/SAN must match hostname */
-   BIT(verifystatus);     /* set TRUE if certificate status must be chec=
ked */
-@@ -266,7 +273,6 @@ struct ssl_primary_config {
- struct ssl_config_data {
-   struct ssl_primary_config primary;
-   long certverifyresult; /* result from the certificate verification */
--  char *CRLfile;   /* CRL to check certificate revocation */
-   curl_ssl_ctx_callback fsslctx; /* function to initialize ssl ctx */
-   void *fsslctxp;        /* parameter for call back */
-   char *cert_type; /* format for certificate (default: PEM)*/
-@@ -274,11 +280,6 @@ struct ssl_config_data {
-   struct curl_blob *key_blob;
-   char *key_type; /* format for private key (default: PEM) */
-   char *key_passwd; /* plain text private key password */
--#ifdef USE_TLS_SRP
--  char *username; /* TLS username (for, e.g., SRP) */
--  char *password; /* TLS password (for, e.g., SRP) */
--  enum CURL_TLSAUTH authtype; /* TLS authentication type (default SRP) =
*/
--#endif
-   BIT(certinfo);     /* gather lots of certificate info */
-   BIT(falsestart);
-   BIT(enable_beast); /* allow this flaw for interoperability's sake*/
-diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
-index fe45b3a..3c31782 100644
---- a/lib/vtls/gtls.c
-+++ b/lib/vtls/gtls.c
-@@ -437,9 +437,10 @@ gtls_connect_step1(struct Curl_easy *data,
-   }
-=20
- #ifdef HAVE_GNUTLS_SRP
--  if((SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP) &&
-+  if((SSL_SET_OPTION(primary.authtype) =3D=3D CURL_TLSAUTH_SRP) &&
-      Curl_allow_auth_to_host(data)) {
--    infof(data, "Using TLS-SRP username: %s", SSL_SET_OPTION(username))=
;
-+    infof(data, "Using TLS-SRP username: %s",
-+          SSL_SET_OPTION(primary.username));
-=20
-     rc =3D gnutls_srp_allocate_client_credentials(&backend->srp_client_=
cred);
-     if(rc !=3D GNUTLS_E_SUCCESS) {
-@@ -449,8 +450,8 @@ gtls_connect_step1(struct Curl_easy *data,
-     }
-=20
-     rc =3D gnutls_srp_set_client_credentials(backend->srp_client_cred,
--                                           SSL_SET_OPTION(username),
--                                           SSL_SET_OPTION(password));
-+                                           SSL_SET_OPTION(primary.usern=
ame),
-+                                           SSL_SET_OPTION(primary.passw=
ord));
-     if(rc !=3D GNUTLS_E_SUCCESS) {
-       failf(data, "gnutls_srp_set_client_cred() failed: %s",
-             gnutls_strerror(rc));
-@@ -507,19 +508,19 @@ gtls_connect_step1(struct Curl_easy *data,
-   }
- #endif
-=20
--  if(SSL_SET_OPTION(CRLfile)) {
-+  if(SSL_SET_OPTION(primary.CRLfile)) {
-     /* set the CRL list file */
-     rc =3D gnutls_certificate_set_x509_crl_file(backend->cred,
--                                              SSL_SET_OPTION(CRLfile),
-+                                              SSL_SET_OPTION(primary.CR=
Lfile),
-                                               GNUTLS_X509_FMT_PEM);
-     if(rc < 0) {
-       failf(data, "error reading crl file %s (%s)",
--            SSL_SET_OPTION(CRLfile), gnutls_strerror(rc));
-+            SSL_SET_OPTION(primary.CRLfile), gnutls_strerror(rc));
-       return CURLE_SSL_CRL_BADFILE;
-     }
-     else
-       infof(data, "found %d CRL in %s",
--            rc, SSL_SET_OPTION(CRLfile));
-+            rc, SSL_SET_OPTION(primary.CRLfile));
-   }
-=20
-   /* Initialize TLS session as a client */
-@@ -590,7 +591,7 @@ gtls_connect_step1(struct Curl_easy *data,
- #ifdef HAVE_GNUTLS_SRP
-   /* Only add SRP to the cipher list if SRP is requested. Otherwise
-    * GnuTLS will disable TLS 1.3 support. */
--  if(SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP) {
-+  if(SSL_SET_OPTION(primary.authtype) =3D=3D CURL_TLSAUTH_SRP) {
-     size_t len =3D strlen(prioritylist);
-=20
-     char *prioritysrp =3D malloc(len + sizeof(GNUTLS_SRP) + 1);
-@@ -685,7 +686,7 @@ gtls_connect_step1(struct Curl_easy *data,
-=20
- #ifdef HAVE_GNUTLS_SRP
-   /* put the credentials to the current session */
--  if(SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP) {
-+  if(SSL_SET_OPTION(primary.authtype) =3D=3D CURL_TLSAUTH_SRP) {
-     rc =3D gnutls_credentials_set(session, GNUTLS_CRD_SRP,
-                                 backend->srp_client_cred);
-     if(rc !=3D GNUTLS_E_SUCCESS) {
-@@ -867,8 +868,8 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
-        SSL_CONN_CONFIG(verifyhost) ||
-        SSL_CONN_CONFIG(issuercert)) {
- #ifdef HAVE_GNUTLS_SRP
--      if(SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP
--         && SSL_SET_OPTION(username) !=3D NULL
-+      if(SSL_SET_OPTION(primary.authtype) =3D=3D CURL_TLSAUTH_SRP
-+         && SSL_SET_OPTION(primary.username)
-          && !SSL_CONN_CONFIG(verifypeer)
-          && gnutls_cipher_get(session)) {
-         /* no peer cert, but auth is ok if we have SRP user and cipher =
and no
-@@ -926,7 +927,8 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
-         failf(data, "server certificate verification failed. CAfile: %s=
 "
-               "CRLfile: %s", SSL_CONN_CONFIG(CAfile) ? SSL_CONN_CONFIG(=
CAfile):
-               "none",
--              SSL_SET_OPTION(CRLfile)?SSL_SET_OPTION(CRLfile):"none");
-+              SSL_SET_OPTION(primary.CRLfile) ?
-+              SSL_SET_OPTION(primary.CRLfile) : "none");
-         return CURLE_PEER_FAILED_VERIFICATION;
-       }
-       else
-@@ -1556,8 +1558,8 @@ static int gtls_shutdown(struct Curl_easy *data, s=
truct connectdata *conn,
-   gnutls_certificate_free_credentials(backend->cred);
-=20
- #ifdef HAVE_GNUTLS_SRP
--  if(SSL_SET_OPTION(authtype) =3D=3D CURL_TLSAUTH_SRP
--     && SSL_SET_OPTION(username) !=3D NULL)
-+  if(SSL_SET_OPTION(primary.authtype) =3D=3D CURL_TLSAUTH_SRP
-+     && SSL_SET_OPTION(primary.username) !=3D NULL)
-     gnutls_srp_free_client_credentials(backend->srp_client_cred);
- #endif
-=20
-diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
-index b9fd26a..bd4ad8f 100644
---- a/lib/vtls/mbedtls.c
-+++ b/lib/vtls/mbedtls.c
-@@ -279,7 +279,7 @@ mbed_connect_step1(struct Curl_easy *data, struct co=
nnectdata *conn,
-   const char * const ssl_capath =3D SSL_CONN_CONFIG(CApath);
-   char * const ssl_cert =3D SSL_SET_OPTION(primary.clientcert);
-   const struct curl_blob *ssl_cert_blob =3D SSL_SET_OPTION(primary.cert=
_blob);
--  const char * const ssl_crlfile =3D SSL_SET_OPTION(CRLfile);
-+  const char * const ssl_crlfile =3D SSL_SET_OPTION(primary.CRLfile);
-   const char * const hostname =3D SSL_HOST_NAME();
- #ifndef CURL_DISABLE_VERBOSE_STRINGS
-   const long int port =3D SSL_HOST_PORT();
-diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
-index 52f2060..959e23e 100644
---- a/lib/vtls/nss.c
-+++ b/lib/vtls/nss.c
-@@ -2035,13 +2035,13 @@ static CURLcode nss_setup_connect(struct Curl_ea=
sy *data,
-     }
-   }
-=20
--  if(SSL_SET_OPTION(CRLfile)) {
--    const CURLcode rv =3D nss_load_crl(SSL_SET_OPTION(CRLfile));
-+  if(SSL_SET_OPTION(primary.CRLfile)) {
-+    const CURLcode rv =3D nss_load_crl(SSL_SET_OPTION(primary.CRLfile))=
;
-     if(rv) {
-       result =3D rv;
-       goto error;
-     }
--    infof(data, "  CRLfile: %s", SSL_SET_OPTION(CRLfile));
-+    infof(data, "  CRLfile: %s", SSL_SET_OPTION(primary.CRLfile));
-   }
-=20
-   if(SSL_SET_OPTION(primary.clientcert)) {
-diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
-index e8633f4..d98bbcb 100644
---- a/lib/vtls/openssl.c
-+++ b/lib/vtls/openssl.c
-@@ -2632,7 +2632,7 @@ static CURLcode ossl_connect_step1(struct Curl_eas=
y *data,
- #endif
-   const long int ssl_version =3D SSL_CONN_CONFIG(version);
- #ifdef USE_OPENSSL_SRP
--  const enum CURL_TLSAUTH ssl_authtype =3D SSL_SET_OPTION(authtype);
-+  const enum CURL_TLSAUTH ssl_authtype =3D SSL_SET_OPTION(primary.autht=
ype);
- #endif
-   char * const ssl_cert =3D SSL_SET_OPTION(primary.clientcert);
-   const struct curl_blob *ssl_cert_blob =3D SSL_SET_OPTION(primary.cert=
_blob);
-@@ -2643,7 +2643,7 @@ static CURLcode ossl_connect_step1(struct Curl_eas=
y *data,
-     (ca_info_blob ? NULL : SSL_CONN_CONFIG(CAfile));
-   const char * const ssl_capath =3D SSL_CONN_CONFIG(CApath);
-   const bool verifypeer =3D SSL_CONN_CONFIG(verifypeer);
--  const char * const ssl_crlfile =3D SSL_SET_OPTION(CRLfile);
-+  const char * const ssl_crlfile =3D SSL_SET_OPTION(primary.CRLfile);
-   char error_buffer[256];
-   struct ssl_backend_data *backend =3D connssl->backend;
-   bool imported_native_ca =3D false;
-@@ -2895,15 +2895,15 @@ static CURLcode ossl_connect_step1(struct Curl_e=
asy *data,
- #ifdef USE_OPENSSL_SRP
-   if((ssl_authtype =3D=3D CURL_TLSAUTH_SRP) &&
-      Curl_allow_auth_to_host(data)) {
--    char * const ssl_username =3D SSL_SET_OPTION(username);
--
-+    char * const ssl_username =3D SSL_SET_OPTION(primary.username);
-+    char * const ssl_password =3D SSL_SET_OPTION(primary.password);
-     infof(data, "Using TLS-SRP username: %s", ssl_username);
-=20
-     if(!SSL_CTX_set_srp_username(backend->ctx, ssl_username)) {
-       failf(data, "Unable to set SRP user name");
-       return CURLE_BAD_FUNCTION_ARGUMENT;
-     }
--    if(!SSL_CTX_set_srp_password(backend->ctx, SSL_SET_OPTION(password)=
)) {
-+    if(!SSL_CTX_set_srp_password(backend->ctx, ssl_password)) {
-       failf(data, "failed setting SRP password");
-       return CURLE_BAD_FUNCTION_ARGUMENT;
-     }
-diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
-index a40ac06..e2d3438 100644
---- a/lib/vtls/vtls.c
-+++ b/lib/vtls/vtls.c
-@@ -132,6 +132,7 @@ Curl_ssl_config_matches(struct ssl_primary_config *d=
ata,
- {
-   if((data->version =3D=3D needle->version) &&
-      (data->version_max =3D=3D needle->version_max) &&
-+     (data->ssl_options =3D=3D needle->ssl_options) &&
-      (data->verifypeer =3D=3D needle->verifypeer) &&
-      (data->verifyhost =3D=3D needle->verifyhost) &&
-      (data->verifystatus =3D=3D needle->verifystatus) &&
-@@ -144,9 +145,15 @@ Curl_ssl_config_matches(struct ssl_primary_config *=
data,
-      Curl_safecmp(data->clientcert, needle->clientcert) &&
-      Curl_safecmp(data->random_file, needle->random_file) &&
-      Curl_safecmp(data->egdsocket, needle->egdsocket) &&
-+#ifdef USE_TLS_SRP
-+     Curl_safecmp(data->username, needle->username) &&
-+     Curl_safecmp(data->password, needle->password) &&
-+     (data->authtype =3D=3D needle->authtype) &&
-+#endif
-      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &=
&
-      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list1=
3) &&
-      Curl_safe_strcasecompare(data->curves, needle->curves) &&
-+     Curl_safe_strcasecompare(data->CRLfile, needle->CRLfile) &&
-      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
-     return TRUE;
-=20
-@@ -163,6 +170,10 @@ Curl_clone_primary_ssl_config(struct ssl_primary_co=
nfig *source,
-   dest->verifyhost =3D source->verifyhost;
-   dest->verifystatus =3D source->verifystatus;
-   dest->sessionid =3D source->sessionid;
-+  dest->ssl_options =3D source->ssl_options;
-+#ifdef USE_TLS_SRP
-+  dest->authtype =3D source->authtype;
-+#endif
-=20
-   CLONE_BLOB(cert_blob);
-   CLONE_BLOB(ca_info_blob);
-@@ -177,6 +188,11 @@ Curl_clone_primary_ssl_config(struct ssl_primary_co=
nfig *source,
-   CLONE_STRING(cipher_list13);
-   CLONE_STRING(pinned_key);
-   CLONE_STRING(curves);
-+  CLONE_STRING(CRLfile);
-+#ifdef USE_TLS_SRP
-+  CLONE_STRING(username);
-+  CLONE_STRING(password);
-+#endif
-=20
-   return TRUE;
- }
-@@ -196,6 +212,11 @@ void Curl_free_primary_ssl_config(struct ssl_primar=
y_config *sslc)
-   Curl_safefree(sslc->ca_info_blob);
-   Curl_safefree(sslc->issuercert_blob);
-   Curl_safefree(sslc->curves);
-+  Curl_safefree(sslc->CRLfile);
-+#ifdef USE_TLS_SRP
-+  Curl_safefree(sslc->username);
-+  Curl_safefree(sslc->password);
-+#endif
- }
-=20
- #ifdef USE_SSL
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782-2.patch b/meta=
/recipes-support/curl/curl/CVE-2022-27782-2.patch
deleted file mode 100644
index 74fa7f85a9..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 782a5e8e5b0271f8cb33eeef6a3819b0149093e0 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 23:13:53 +0200
-Subject: [PATCH] url: check SSH config match on connection reuse
-
-CVE-2022-27782
-
-Reported-by: Harry Sintonen
-Bug: https://curl.se/docs/CVE-2022-27782.html
-Closes #8825
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/1645e9b44=
505abd5cbaf65da5282c3f33b5924a5]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/url.c      | 11 +++++++++++
- lib/vssh/ssh.h |  6 +++---
- 2 files changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/lib/url.c b/lib/url.c
-index 5ebf5e2..c713e54 100644
---- a/lib/url.c
-+++ b/lib/url.c
-@@ -1098,6 +1098,12 @@ static void prune_dead_connections(struct Curl_ea=
sy *data)
-   }
- }
-=20
-+static bool ssh_config_matches(struct connectdata *one,
-+                               struct connectdata *two)
-+{
-+  return (Curl_safecmp(one->proto.sshc.rsa, two->proto.sshc.rsa) &&
-+          Curl_safecmp(one->proto.sshc.rsa_pub, two->proto.sshc.rsa_pub=
));
-+}
- /*
-  * Given one filled in connection struct (named needle), this function =
should
-  * detect if there already is one that has all the significant details
-@@ -1356,6 +1362,11 @@ ConnectionExists(struct Curl_easy *data,
-          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
-         continue;
-=20
-+      if(get_protocol_family(needle->handler) =3D=3D PROTO_FAMILY_SSH) =
{
-+        if(!ssh_config_matches(needle, check))
-+          continue;
-+      }
-+
-       if((needle->handler->flags&PROTOPT_SSL)
- #ifndef CURL_DISABLE_PROXY
-          || !needle->bits.httpproxy || needle->bits.tunnel_proxy
-diff --git a/lib/vssh/ssh.h b/lib/vssh/ssh.h
-index 7972081..30d82e5 100644
---- a/lib/vssh/ssh.h
-+++ b/lib/vssh/ssh.h
-@@ -7,7 +7,7 @@
-  *                            | (__| |_| |  _ <| |___
-  *                             \___|\___/|_| \_\_____|
-  *
-- * Copyright (C) 1998 - 2021, Daniel Stenberg, <daniel@haxx.se>, et al.
-+ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
-  *
-  * This software is licensed as described in the file COPYING, which
-  * you should have received as part of this distribution. The terms
-@@ -131,8 +131,8 @@ struct ssh_conn {
-=20
-   /* common */
-   const char *passphrase;     /* pass-phrase to use */
--  char *rsa_pub;              /* path name */
--  char *rsa;                  /* path name */
-+  char *rsa_pub;              /* strdup'ed public key file */
-+  char *rsa;                  /* strdup'ed private key file */
-   bool authed;                /* the connection has been authenticated =
fine */
-   bool acceptfail;            /* used by the SFTP_QUOTE (continue if
-                                  quote command fails) */
diff --git a/meta/recipes-support/curl/curl/CVE-2022-30115.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-30115.patch
deleted file mode 100644
index 96839cf204..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2022-30115.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 8313ef3f507b5bdc54e985cae71aa9df00609d55 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 9 May 2022 08:13:55 +0200
-Subject: [PATCH] hsts: ignore trailing dots when comparing hosts names
-
-CVE-2022-30115
-
-Reported-by: Axel Chong
-Bug: https://curl.se/docs/CVE-2022-30115.html
-Closes #8821
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/fae6fea20=
9a2d4db1582f608bd8cc8000721733a]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/hsts.c | 30 +++++++++++++++++++++++++-----
- 1 file changed, 25 insertions(+), 5 deletions(-)
-
-diff --git a/lib/hsts.c b/lib/hsts.c
-index 03fcc9e..b9fa6f7 100644
---- a/lib/hsts.c
-+++ b/lib/hsts.c
-@@ -114,16 +114,25 @@ static CURLcode hsts_create(struct hsts *h,
-                             curl_off_t expires)
- {
-   struct stsentry *sts =3D hsts_entry();
-+  char *duphost;
-+  size_t hlen;
-   if(!sts)
-     return CURLE_OUT_OF_MEMORY;
-=20
--  sts->expires =3D expires;
--  sts->includeSubDomains =3D subdomains;
--  sts->host =3D strdup(hostname);
--  if(!sts->host) {
-+  duphost =3D strdup(hostname);
-+  if(!duphost) {
-     free(sts);
-     return CURLE_OUT_OF_MEMORY;
-   }
-+
-+  hlen =3D strlen(duphost);
-+  if(duphost[hlen - 1] =3D=3D '.')
-+    /* strip off trailing any dot */
-+    duphost[--hlen] =3D 0;
-+
-+  sts->host =3D duphost;
-+  sts->expires =3D expires;
-+  sts->includeSubDomains =3D subdomains;
-   Curl_llist_insert_next(&h->list, h->list.tail, sts, &sts->node);
-   return CURLE_OK;
- }
-@@ -238,10 +247,21 @@ struct stsentry *Curl_hsts(struct hsts *h, const c=
har *hostname,
-                            bool subdomain)
- {
-   if(h) {
-+    char buffer[MAX_HSTS_HOSTLEN + 1];
-     time_t now =3D time(NULL);
-     size_t hlen =3D strlen(hostname);
-     struct Curl_llist_element *e;
-     struct Curl_llist_element *n;
-+
-+    if((hlen > MAX_HSTS_HOSTLEN) || !hlen)
-+      return NULL;
-+    memcpy(buffer, hostname, hlen);
-+    if(hostname[hlen-1] =3D=3D '.')
-+      /* remove the trailing dot */
-+      --hlen;
-+    buffer[hlen] =3D 0;
-+    hostname =3D buffer;
-+
-     for(e =3D h->list.head; e; e =3D n) {
-       struct stsentry *sts =3D e->ptr;
-       n =3D e->next;
-@@ -440,7 +460,7 @@ static CURLcode hsts_pull(struct Curl_easy *data, st=
ruct hsts *h)
-     CURLSTScode sc;
-     DEBUGASSERT(h);
-     do {
--      char buffer[257];
-+      char buffer[MAX_HSTS_HOSTLEN + 1];
-       struct curl_hstsentry e;
-       e.name =3D buffer;
-       e.namelen =3D sizeof(buffer)-1;
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.84.0.bb
similarity index 87%
rename from meta/recipes-support/curl/curl_7.82.0.bb
rename to meta/recipes-support/curl/curl_7.84.0.bb
index ba3fd11820..addbaf14b1 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -10,21 +10,9 @@ LICENSE =3D "MIT-open-group"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D190c514872597083303371684954f=
238"
=20
 SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
-           file://CVE-2022-22576.patch \
-           file://CVE-2022-27775.patch \
-           file://CVE-2022-27776.patch \
-           file://CVE-2022-27774-1.patch \
-           file://CVE-2022-27774-2.patch \
-           file://CVE-2022-27774-3.patch \
-           file://CVE-2022-27774-4.patch \
-           file://CVE-2022-30115.patch \
-           file://CVE-2022-27780.patch \
-           file://CVE-2022-27781.patch \
-           file://CVE-2022-27779.patch \
-           file://CVE-2022-27782-1.patch \
-           file://CVE-2022-27782-2.patch \
+           file://0001-easy_lock.h-include-sched.h-if-available-to-fix-b=
uil.patch \
            "
-SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
+SRC_URI[sha256sum] =3D "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080a=
ef49fbcd817c5db8"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.25.1


