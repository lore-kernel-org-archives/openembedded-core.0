Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web10.12106.1628096760451297987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=pN2QrRmX;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id BKL7m7kq07QW9BKL8m5fml; Wed, 04 Aug 2021 18:05:59 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=H+BAP9Qi c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=MhDmnRu9jo8A:10 a=ugkhXdxtAAAA:8 a=-An2I_7KAAAA:8 a=UJ5Y5Z__AAAA:8
 a=-RpR3kqr2_yimFC_s6AA:9 a=63wSdAoKnfsA:10 a=KqUEti3kXUUA:10
 a=eDHOid60NOgA:10 a=FZ_q8whQ1RAA:10 a=SIBqzdgODD4A:10 a=VinBSYM5t5AA:10
 a=ZG-MjRxWnTTVGrJRUvVH:22 a=Sq34B_EcNBM9_nrAYB9S:22 a=-nuATAkMhhWPdIrRzIKU:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=wCx3deyGBUoXKvFW95z2yfdYOxKXfIkRYZRcgMhlDuM=; b=pN
	2QrRmXoMnPKZD7x+xCpFFUQFxmzTmcnKO5Rrbtrjf4Xwwe0bsxP2Mp7IreBsvSkbKUjaxpOEwu2pZ
	WKTcYSa+epDHelphrHi9Xzrl2AhGMrn1a9xbsUUP/4WPoAeCA7stQm/ms04KncoZxjnXq5vVnOZQM
	Yh7my0N/WP02Kf49jViG9YiP9Usvy8Qlwwtt+a857rGxakUGjHZnaxfUqNxpC3E9SDVQnzfpFD79H
	/EmUC0MkblaD3IrqEgqnAR9hNhcgq+QaKVAC6Uc0b/7FBe+WABU8jnhJiMtfae7IuvsUEVIOxse0U
	jqVNcPxbrpG3irBc0XWbD1RvIcIMYlQQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mBKL5-00070E-Hd; Wed, 04 Aug 2021 18:05:55 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH v2] curl: Fix CVE-2021-22924 and CVE-2021-22925
Date: Wed,  4 Aug 2021 18:05:52 +0100
Message-Id: <20210804170552.1163928-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJOgi5w0g2whcXaUlFS9u7KWLCF5j3ZOxvpO/g3iJLZXBA1JHXeZKiDJWLPe0bPgcyivx/YtK2PYQNmB9Lqv8icyK96ncuFOVapH4mi9EXTjbJpKMT+w
 OlpeGgPQw9ffnrbBI6ADglGn1Osh2oQrCjz54gK7a4TGXkWRhXzHPovmd/rl2OyPXbxQ+t++JJ39vw==
Content-Transfer-Encoding: 8bit

curl v7.78 contained fixes for five CVEs:

CVE-2021-22922[1] and CVE-2021-22923[2] are only present when support
for metalink is enabled. EXTRA_OECONF contains "--without-libmetalink"
so these fixes are unnecessary.

CVE-2021-22926[3] only affects builds for MacOS.

CVE-2021-22924[4] and CVE-2021-22925[5] are both applicable. Take the
patches from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close
enough that the patch for CVE-2021-22924 applies without conflicts. The
CVE-2021-22925 patch required only a small tweak to apply.

[1] https://curl.se/docs/CVE-2021-22922.html
[2] https://curl.se/docs/CVE-2021-22923.html
[3] https://curl.se/docs/CVE-2021-22926.html
[4] https://curl.se/docs/CVE-2021-22924.html
[5] https://curl.se/docs/CVE-2021-22925.html

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../curl/curl/CVE-2021-22924.patch            | 226 ++++++++++++++++++
 .../curl/curl/CVE-2021-22925.patch            |  43 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 3 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22924.patch b/meta/recipes-support/curl/curl/CVE-2021-22924.patch
new file mode 100644
index 0000000000..68fde45ddf
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22924.patch
@@ -0,0 +1,226 @@
+Subject: [PATCH] vtls: fix connection reuse checks for issuer cert and
+ case sensitivity CVE-2021-22924
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2021-22924.html
+CVE: CVE-2021-22924
+Upstream-Status: backport from Ubuntu curl_7.68.0-1ubuntu2.6
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ lib/url.c          |  5 +++--
+ lib/urldata.h      |  2 +-
+ lib/vtls/gtls.c    | 10 +++++-----
+ lib/vtls/nss.c     |  4 ++--
+ lib/vtls/openssl.c | 12 ++++++------
+ lib/vtls/vtls.c    | 23 ++++++++++++++++++-----
+ 6 files changed, 35 insertions(+), 21 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 47fc66aed..eebad8d32 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3555,6 +3555,9 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.proxy_ssl.primary.CApath = data->set.str[STRING_SSL_CAPATH_PROXY];
+   data->set.ssl.primary.CAfile = data->set.str[STRING_SSL_CAFILE_ORIG];
+   data->set.proxy_ssl.primary.CAfile = data->set.str[STRING_SSL_CAFILE_PROXY];
++  data->set.ssl.primary.issuercert = data->set.str[STRING_SSL_ISSUERCERT_ORIG];
++  data->set.proxy_ssl.primary.issuercert =
++    data->set.str[STRING_SSL_ISSUERCERT_PROXY];
+   data->set.ssl.primary.random_file = data->set.str[STRING_SSL_RANDOM_FILE];
+   data->set.proxy_ssl.primary.random_file =
+     data->set.str[STRING_SSL_RANDOM_FILE];
+@@ -3575,8 +3578,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+ 
+   data->set.ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_ORIG];
+   data->set.proxy_ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_PROXY];
+-  data->set.ssl.issuercert = data->set.str[STRING_SSL_ISSUERCERT_ORIG];
+-  data->set.proxy_ssl.issuercert = data->set.str[STRING_SSL_ISSUERCERT_PROXY];
+   data->set.ssl.cert = data->set.str[STRING_CERT_ORIG];
+   data->set.proxy_ssl.cert = data->set.str[STRING_CERT_PROXY];
+   data->set.ssl.cert_type = data->set.str[STRING_CERT_TYPE_ORIG];
+diff --git a/lib/urldata.h b/lib/urldata.h
+index fbb8b645e..615fbf369 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -224,6 +224,7 @@ struct ssl_primary_config {
+   long version_max;      /* max supported version the client wants to use*/
+   char *CApath;          /* certificate dir (doesn't work on windows) */
+   char *CAfile;          /* certificate to verify peer against */
++  char *issuercert;      /* optional issuer certificate filename */
+   char *clientcert;
+   char *random_file;     /* path to file containing "random" data */
+   char *egdsocket;       /* path to file containing the EGD daemon socket */
+@@ -240,7 +241,6 @@ struct ssl_config_data {
+   struct ssl_primary_config primary;
+   long certverifyresult; /* result from the certificate verification */
+   char *CRLfile;   /* CRL to check certificate revocation */
+-  char *issuercert;/* optional issuer certificate filename */
+   curl_ssl_ctx_callback fsslctx; /* function to initialize ssl ctx */
+   void *fsslctxp;        /* parameter for call back */
+   char *cert; /* client certificate file name */
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 46e149c7d..8c051024f 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -1059,7 +1059,7 @@ gtls_connect_step3(struct connectdata *conn,
+   if(!chainp) {
+     if(SSL_CONN_CONFIG(verifypeer) ||
+        SSL_CONN_CONFIG(verifyhost) ||
+-       SSL_SET_OPTION(issuercert)) {
++       SSL_CONN_CONFIG(issuercert)) {
+ #ifdef USE_TLS_SRP
+       if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP
+          && SSL_SET_OPTION(username) != NULL
+@@ -1241,21 +1241,21 @@ gtls_connect_step3(struct connectdata *conn,
+        gnutls_x509_crt_t format */
+     gnutls_x509_crt_import(x509_cert, chainp, GNUTLS_X509_FMT_DER);
+ 
+-  if(SSL_SET_OPTION(issuercert)) {
++  if(SSL_CONN_CONFIG(issuercert)) {
+     gnutls_x509_crt_init(&x509_issuer);
+-    issuerp = load_file(SSL_SET_OPTION(issuercert));
++    issuerp = load_file(SSL_CONN_CONFIG(issuercert));
+     gnutls_x509_crt_import(x509_issuer, &issuerp, GNUTLS_X509_FMT_PEM);
+     rc = gnutls_x509_crt_check_issuer(x509_cert, x509_issuer);
+     gnutls_x509_crt_deinit(x509_issuer);
+     unload_file(issuerp);
+     if(rc <= 0) {
+       failf(data, "server certificate issuer check failed (IssuerCert: %s)",
+-            SSL_SET_OPTION(issuercert)?SSL_SET_OPTION(issuercert):"none");
++            SSL_CONN_CONFIG(issuercert)?SSL_CONN_CONFIG(issuercert):"none");
+       gnutls_x509_crt_deinit(x509_cert);
+       return CURLE_SSL_ISSUER_ERROR;
+     }
+     infof(data, "\t server certificate issuer check OK (Issuer Cert: %s)\n",
+-          SSL_SET_OPTION(issuercert)?SSL_SET_OPTION(issuercert):"none");
++          SSL_CONN_CONFIG(issuercert)?SSL_CONN_CONFIG(issuercert):"none");
+   }
+ 
+   size = sizeof(certbuf);
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index ef51b0d91..375c78b1b 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -2151,9 +2151,9 @@ static CURLcode nss_do_connect(struct connectdata *conn, int sockindex)
+   if(result)
+     goto error;
+ 
+-  if(SSL_SET_OPTION(issuercert)) {
++  if(SSL_CONN_CONFIG(issuercert)) {
+     SECStatus ret = SECFailure;
+-    char *nickname = dup_nickname(data, SSL_SET_OPTION(issuercert));
++    char *nickname = dup_nickname(data, SSL_CONN_CONFIG(issuercert));
+     if(nickname) {
+       /* we support only nicknames in case of issuercert for now */
+       ret = check_issuer_cert(BACKEND->handle, nickname);
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 64f43605a..7e81fd3a0 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -3547,7 +3547,7 @@ static CURLcode servercert(struct connectdata *conn,
+        deallocating the certificate. */
+ 
+     /* e.g. match issuer name with provided issuer certificate */
+-    if(SSL_SET_OPTION(issuercert)) {
++    if(SSL_CONN_CONFIG(issuercert)) {
+       fp = BIO_new(BIO_s_file());
+       if(fp == NULL) {
+         failf(data,
+@@ -3560,10 +3560,10 @@ static CURLcode servercert(struct connectdata *conn,
+         return CURLE_OUT_OF_MEMORY;
+       }
+ 
+-      if(BIO_read_filename(fp, SSL_SET_OPTION(issuercert)) <= 0) {
++      if(BIO_read_filename(fp, SSL_CONN_CONFIG(issuercert)) <= 0) {
+         if(strict)
+           failf(data, "SSL: Unable to open issuer cert (%s)",
+-                SSL_SET_OPTION(issuercert));
++                SSL_CONN_CONFIG(issuercert));
+         BIO_free(fp);
+         X509_free(BACKEND->server_cert);
+         BACKEND->server_cert = NULL;
+@@ -3574,7 +3574,7 @@ static CURLcode servercert(struct connectdata *conn,
+       if(!issuer) {
+         if(strict)
+           failf(data, "SSL: Unable to read issuer cert (%s)",
+-                SSL_SET_OPTION(issuercert));
++                SSL_CONN_CONFIG(issuercert));
+         BIO_free(fp);
+         X509_free(issuer);
+         X509_free(BACKEND->server_cert);
+@@ -3585,7 +3585,7 @@ static CURLcode servercert(struct connectdata *conn,
+       if(X509_check_issued(issuer, BACKEND->server_cert) != X509_V_OK) {
+         if(strict)
+           failf(data, "SSL: Certificate issuer check failed (%s)",
+-                SSL_SET_OPTION(issuercert));
++                SSL_CONN_CONFIG(issuercert));
+         BIO_free(fp);
+         X509_free(issuer);
+         X509_free(BACKEND->server_cert);
+@@ -3594,7 +3594,7 @@ static CURLcode servercert(struct connectdata *conn,
+       }
+ 
+       infof(data, " SSL certificate issuer check ok (%s)\n",
+-            SSL_SET_OPTION(issuercert));
++            SSL_CONN_CONFIG(issuercert));
+       BIO_free(fp);
+       X509_free(issuer);
+     }
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index aaf73ef8f..8c681da14 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -82,6 +82,16 @@
+   else                                       \
+     dest->var = NULL;
+ 
++static bool safecmp(char *a, char *b)
++{
++  if(a && b)
++    return !strcmp(a, b);
++  else if(!a && !b)
++    return TRUE; /* match */
++  return FALSE; /* no match */
++}
++
++
+ bool
+ Curl_ssl_config_matches(struct ssl_primary_config* data,
+                         struct ssl_primary_config* needle)
+@@ -91,11 +101,12 @@ Curl_ssl_config_matches(struct ssl_primary_config* data,
+      (data->verifypeer == needle->verifypeer) &&
+      (data->verifyhost == needle->verifyhost) &&
+      (data->verifystatus == needle->verifystatus) &&
+-     Curl_safe_strcasecompare(data->CApath, needle->CApath) &&
+-     Curl_safe_strcasecompare(data->CAfile, needle->CAfile) &&
+-     Curl_safe_strcasecompare(data->clientcert, needle->clientcert) &&
+-     Curl_safe_strcasecompare(data->random_file, needle->random_file) &&
+-     Curl_safe_strcasecompare(data->egdsocket, needle->egdsocket) &&
++     safecmp(data->CApath, needle->CApath) &&
++     safecmp(data->CAfile, needle->CAfile) &&
++     safecmp(data->issuercert, needle->issuercert) &&
++     safecmp(data->clientcert, needle->clientcert) &&
++     safecmp(data->random_file, needle->random_file) &&
++     safecmp(data->egdsocket, needle->egdsocket) &&
+      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &&
+      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list13) &&
+      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
+@@ -117,6 +128,7 @@ Curl_clone_primary_ssl_config(struct ssl_primary_config *source,
+ 
+   CLONE_STRING(CApath);
+   CLONE_STRING(CAfile);
++  CLONE_STRING(issuercert);
+   CLONE_STRING(clientcert);
+   CLONE_STRING(random_file);
+   CLONE_STRING(egdsocket);
+@@ -131,6 +143,7 @@ void Curl_free_primary_ssl_config(struct ssl_primary_config* sslc)
+ {
+   Curl_safefree(sslc->CApath);
+   Curl_safefree(sslc->CAfile);
++  Curl_safefree(sslc->issuercert);
+   Curl_safefree(sslc->clientcert);
+   Curl_safefree(sslc->random_file);
+   Curl_safefree(sslc->egdsocket);
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22925.patch b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
new file mode 100644
index 0000000000..daca16d4dc
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
@@ -0,0 +1,43 @@
+Subject: [PATCH] telnet: fix option parser to not send uninitialized
+ contents CVE-2021-22925
+
+Reported-by: Red Hat Product Security
+Bug: https://curl.se/docs/CVE-2021-22925.html
+CVE: CVE-2021-22925
+Upstream-Status: backport from Ubuntu curl_7.68.0-1ubuntu2.6
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ lib/telnet.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 4bf4c652c..3347ad6d1 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -967,12 +967,17 @@ static void suboption(struct connectdata *conn)
+         size_t tmplen = (strlen(v->data) + 1);
+         /* Add the variable only if it fits */
+         if(len + tmplen < (int)sizeof(temp)-6) {
+-          if(sscanf(v->data, "%127[^,],%127s", varname, varval)) {
+-            msnprintf((char *)&temp[len], sizeof(temp) - len,
+-                      "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
+-                      CURL_NEW_ENV_VALUE, varval);
+-            len += tmplen;
+-          }
++          int rv;
++          char sep[2] = "";
++          varval[0] = 0;
++          rv = sscanf(v->data, "%127[^,]%1[,]%127s", varname, sep, varval);
++          if(rv == 1)
++            len += msnprintf((char *)&temp[len], sizeof(temp) - len,
++                             "%c%s", CURL_NEW_ENV_VAR, varname);
++          else if(rv >= 2)
++            len += msnprintf((char *)&temp[len], sizeof(temp) - len,
++                             "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
++                             CURL_NEW_ENV_VALUE, varval);
+         }
+       }
+       msnprintf((char *)&temp[len], sizeof(temp) - len,
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 13ab29cf69..27151ca5d7 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2020-8286.patch \
            file://CVE-2021-22876.patch \
            file://CVE-2021-22890.patch \
+           file://CVE-2021-22924.patch \
+           file://CVE-2021-22925.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
@@ -26,6 +28,7 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
+CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.30.2

