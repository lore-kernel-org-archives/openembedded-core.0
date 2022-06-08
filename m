Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 08/14] curl: Backport CVE fixes
Date: Wed,  8 Jun 2022 04:46:32 -1000
Message-Id: <f8cdafc0ef54ab203164366ad96288fd10144b30.1654699348.git.steve@sakoman.com>
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Backport patches to address CVE-2022-27774, CVE-2022-27781, and
CVE-2022-27782.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-27774-1.patch          |  45 +++
 .../curl/curl/CVE-2022-27774-2.patch          |  80 ++++
 .../curl/curl/CVE-2022-27774-3.patch          |  83 ++++
 .../curl/curl/CVE-2022-27774-4.patch          |  35 ++
 .../curl/curl/CVE-2022-27781.patch            |  46 +++
 .../curl/curl/CVE-2022-27782-1.patch          | 363 ++++++++++++++++++
 .../curl/curl/CVE-2022-27782-2.patch          |  71 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   7 +
 8 files changed, 730 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-1.patch b/meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
new file mode 100644
index 0000000000..063c11712a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
@@ -0,0 +1,45 @@
+From 2a797e099731facf62a2c675396334bc2ad3bc7c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 Apr 2022 16:24:33 +0200
+Subject: [PATCH] connect: store "conn_remote_port" in the info struct
+
+To make it available after the connection ended.
+
+Prerequisite for the patches that address CVE-2022-27774.
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/08b8ef4e726ba10f45081ecda5b3cea788d3c839]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/connect.c | 1 +
+ lib/urldata.h | 6 +++++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/connect.c b/lib/connect.c
+index b3d4057..a977d67 100644
+--- a/lib/connect.c
++++ b/lib/connect.c
+@@ -624,6 +624,7 @@ void Curl_persistconninfo(struct connectdata *conn)
+   conn->data->info.conn_scheme = conn->handler->scheme;
+   conn->data->info.conn_protocol = conn->handler->protocol;
+   conn->data->info.conn_primary_port = conn->primary_port;
++  conn->data->info.conn_remote_port = conn->remote_port;
+   conn->data->info.conn_local_port = conn->local_port;
+ }
+ 
+diff --git a/lib/urldata.h b/lib/urldata.h
+index fafb7a3..ab1b267 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1148,7 +1148,11 @@ struct PureInfo {
+      reused, in the connection cache. */
+ 
+   char conn_primary_ip[MAX_IPADR_LEN];
+-  long conn_primary_port;
++  long conn_primary_port; /* this is the destination port to the connection,
++                             which might have been a proxy */
++  long conn_remote_port;  /* this is the "remote port", which is the port
++                             number of the used URL, independent of proxy or
++                             not */
+   char conn_local_ip[MAX_IPADR_LEN];
+   long conn_local_port;
+   const char *conn_scheme;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-2.patch b/meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
new file mode 100644
index 0000000000..c64d614194
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
@@ -0,0 +1,80 @@
+From 5c2f3b3a5f115625134669d90d591de9c5aafc8e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 Apr 2022 16:24:33 +0200
+Subject: [PATCH] transfer: redirects to other protocols or ports clear auth
+
+... unless explicitly permitted.
+
+Bug: https://curl.se/docs/CVE-2022-27774.html
+Reported-by: Harry Sintonen
+Closes #8748
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/620ea21410030a9977396b4661806bc187231b79]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/transfer.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 744e1c0..ac69d27 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1627,10 +1627,57 @@ CURLcode Curl_follow(struct Curl_easy *data,
+       return CURLE_OUT_OF_MEMORY;
+   }
+   else {
+-
+     uc = curl_url_get(data->state.uh, CURLUPART_URL, &newurl, 0);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
++
++    /* Clear auth if this redirects to a different port number or protocol,
++       unless permitted */
++    if(!data->set.allow_auth_to_other_hosts && (type != FOLLOW_FAKE)) {
++      char *portnum;
++      int port;
++      bool clear = FALSE;
++
++      if(data->set.use_port && data->state.allow_port)
++        /* a custom port is used */
++        port = (int)data->set.use_port;
++      else {
++        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
++                          CURLU_DEFAULT_PORT);
++        if(uc) {
++          free(newurl);
++          return Curl_uc_to_curlcode(uc);
++        }
++        port = atoi(portnum);
++        free(portnum);
++      }
++      if(port != data->info.conn_remote_port) {
++        infof(data, "Clear auth, redirects to port from %u to %u",
++              data->info.conn_remote_port, port);
++        clear = TRUE;
++      }
++      else {
++        char *scheme;
++        const struct Curl_handler *p;
++        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
++        if(uc) {
++          free(newurl);
++          return Curl_uc_to_curlcode(uc);
++        }
++
++        p = Curl_builtin_scheme(scheme);
++        if(p && (p->protocol != data->info.conn_protocol)) {
++          infof(data, "Clear auth, redirects scheme from %s to %s",
++                data->info.conn_scheme, scheme);
++          clear = TRUE;
++        }
++        free(scheme);
++      }
++      if(clear) {
++        Curl_safefree(data->set.str[STRING_USERNAME]);
++        Curl_safefree(data->set.str[STRING_PASSWORD]);
++      }
++    }
+   }
+ 
+   if(type == FOLLOW_FAKE) {
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-3.patch b/meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
new file mode 100644
index 0000000000..a585f6a8fa
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
@@ -0,0 +1,83 @@
+From 5dccf21ad49eed925e8f76b0cb844877239ce23d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 Apr 2022 17:59:15 +0200
+Subject: [PATCH] openssl: don't leak the SRP credentials in redirects either
+
+Follow-up to 620ea21410030
+
+Reported-by: Harry Sintonen
+Closes #8751
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/139a54ed0a172adaaf1a78d6f4fff50b2c3f9e08]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/http.c         | 10 +++++-----
+ lib/http.h         |  6 ++++++
+ lib/vtls/openssl.c |  3 ++-
+ 3 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 8b16c09..5291c07 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -732,10 +732,10 @@ output_auth_headers(struct connectdata *conn,
+ }
+ 
+ /*
+- * allow_auth_to_host() tells if autentication, cookies or other "sensitive
+- * data" can (still) be sent to this host.
++ * Curl_allow_auth_to_host() tells if authentication, cookies or other
++ * "sensitive data" can (still) be sent to this host.
+  */
+-static bool allow_auth_to_host(struct Curl_easy *data)
++bool Curl_allow_auth_to_host(struct Curl_easy *data)
+ {
+   struct connectdata *conn = data->conn;
+   return (!data->state.this_is_a_follow ||
+@@ -816,7 +816,7 @@ Curl_http_output_auth(struct connectdata *conn,
+ 
+   /* To prevent the user+password to get sent to other than the original host
+      due to a location-follow */
+-  if(allow_auth_to_host(data)
++  if(Curl_allow_auth_to_host(data)
+      || conn->bits.netrc
+     )
+     result = output_auth_headers(conn, authhost, request, path, FALSE);
+@@ -1891,7 +1891,7 @@ CURLcode Curl_add_custom_headers(struct connectdata *conn,
+                    checkprefix("Cookie:", compare)) &&
+                   /* be careful of sending this potentially sensitive header to
+                      other hosts */
+-                  !allow_auth_to_host(data))			  
++                  !Curl_allow_auth_to_host(data))			  
+             ;
+           else {
+             result = Curl_add_bufferf(&req_buffer, "%s\r\n", compare);
+diff --git a/lib/http.h b/lib/http.h
+index 4c1825f..4fbae1d 100644
+--- a/lib/http.h
++++ b/lib/http.h
+@@ -273,4 +273,10 @@ Curl_http_output_auth(struct connectdata *conn,
+                       bool proxytunnel); /* TRUE if this is the request setting
+                                             up the proxy tunnel */
+ 
++/*
++ * Curl_allow_auth_to_host() tells if authentication, cookies or other
++ * "sensitive data" can (still) be sent to this host.
++ */
++bool Curl_allow_auth_to_host(struct Curl_easy *data);
++
+ #endif /* HEADER_CURL_HTTP_H */
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 006a8c8..a14cecc 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -2739,7 +2739,8 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
+ #endif
+ 
+ #ifdef USE_TLS_SRP
+-  if(ssl_authtype == CURL_TLSAUTH_SRP) {
++  if((ssl_authtype == CURL_TLSAUTH_SRP) &&
++     Curl_allow_auth_to_host(data)) {
+     char * const ssl_username = SSL_SET_OPTION(username);
+ 
+     infof(data, "Using TLS-SRP username: %s\n", ssl_username);
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27774-4.patch b/meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
new file mode 100644
index 0000000000..2258681cab
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
@@ -0,0 +1,35 @@
+From 7395752e2f7b87dc8c8f2a7137075e2da554aaea Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 26 Apr 2022 07:46:19 +0200
+Subject: [PATCH] gnutls: don't leak the SRP credentials in redirects
+
+Follow-up to 620ea21410030 and 139a54ed0a172a
+
+Reported-by: Harry Sintonen
+Closes #8752
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/093531556203decd92d92bccd431edbe5561781c]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/vtls/gtls.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 8c05102..3d0758d 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -581,11 +581,11 @@ gtls_connect_step1(struct connectdata *conn,
+   }
+ 
+ #ifdef USE_TLS_SRP
+-  if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP) {
++  if((SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP) &&
++     Curl_allow_auth_to_host(data)) {
+     infof(data, "Using TLS-SRP username: %s\n", SSL_SET_OPTION(username));
+ 
+-    rc = gnutls_srp_allocate_client_credentials(
+-           &BACKEND->srp_client_cred);
++    rc = gnutls_srp_allocate_client_credentials(&BACKEND->srp_client_cred);
+     if(rc != GNUTLS_E_SUCCESS) {
+       failf(data, "gnutls_srp_allocate_client_cred() failed: %s",
+             gnutls_strerror(rc));
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27781.patch b/meta/recipes-support/curl/curl/CVE-2022-27781.patch
new file mode 100644
index 0000000000..ea1bc22928
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27781.patch
@@ -0,0 +1,46 @@
+From 7a1f183039a6a6c9099a114f5e5c94777413c767 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 May 2022 10:07:15 +0200
+Subject: [PATCH] nss: return error if seemingly stuck in a cert loop
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2022-27781
+
+Reported-by: Florian Kohnhäuser
+Bug: https://curl.se/docs/CVE-2022-27781.html
+Closes #8822
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c7da89d404bf59c8dd82a001119a16d18365917]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/vtls/nss.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index 375c78b..86102f7 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -950,6 +950,9 @@ static void display_cert_info(struct Curl_easy *data,
+   PR_Free(common_name);
+ }
+ 
++/* A number of certs that will never occur in a real server handshake */
++#define TOO_MANY_CERTS 300
++
+ static CURLcode display_conn_info(struct connectdata *conn, PRFileDesc *sock)
+ {
+   CURLcode result = CURLE_OK;
+@@ -986,6 +989,11 @@ static CURLcode display_conn_info(struct connectdata *conn, PRFileDesc *sock)
+         cert2 = CERT_FindCertIssuer(cert, now, certUsageSSLCA);
+         while(cert2) {
+           i++;
++          if(i >= TOO_MANY_CERTS) {
++            CERT_DestroyCertificate(cert2);
++            failf(data, "certificate loop");
++            return CURLE_SSL_CERTPROBLEM;
++          }
+           if(cert2->isRoot) {
+             CERT_DestroyCertificate(cert2);
+             break;
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782-1.patch b/meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
new file mode 100644
index 0000000000..6b6d0e1938
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
@@ -0,0 +1,363 @@
+From 907a16c832d9ce0ffa7e9b2297548063095a7242 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 May 2022 23:13:53 +0200
+Subject: [PATCH] tls: check more TLS details for connection reuse
+
+CVE-2022-27782
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2022-27782.html
+Closes #8825
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a64c]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/setopt.c       | 29 +++++++++++++++++------------
+ lib/url.c          | 17 ++++++++++-------
+ lib/urldata.h      | 13 +++++++------
+ lib/vtls/gtls.c    | 30 ++++++++++++++++--------------
+ lib/vtls/mbedtls.c |  2 +-
+ lib/vtls/nss.c     |  6 +++---
+ lib/vtls/openssl.c | 10 +++++-----
+ lib/vtls/vtls.c    |  1 +
+ 8 files changed, 60 insertions(+), 48 deletions(-)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 4648c87..bebb2e4 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -2130,6 +2130,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+ 
+   case CURLOPT_SSL_OPTIONS:
+     arg = va_arg(param, long);
++    data->set.ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     data->set.ssl.enable_beast =
+       (bool)((arg&CURLSSLOPT_ALLOW_BEAST) ? TRUE : FALSE);
+     data->set.ssl.no_revoke = !!(arg & CURLSSLOPT_NO_REVOKE);
+@@ -2139,6 +2140,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+ #ifndef CURL_DISABLE_PROXY
+   case CURLOPT_PROXY_SSL_OPTIONS:
+     arg = va_arg(param, long);
++    data->set.proxy_ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     data->set.proxy_ssl.enable_beast =
+       (bool)((arg&CURLSSLOPT_ALLOW_BEAST) ? TRUE : FALSE);
+     data->set.proxy_ssl.no_revoke = !!(arg & CURLSSLOPT_NO_REVOKE);
+@@ -2541,44 +2543,47 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+   case CURLOPT_TLSAUTH_USERNAME:
+     result = Curl_setstropt(&data->set.str[STRING_TLSAUTH_USERNAME_ORIG],
+                             va_arg(param, char *));
+-    if(data->set.str[STRING_TLSAUTH_USERNAME_ORIG] && !data->set.ssl.authtype)
+-      data->set.ssl.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
++    if(data->set.str[STRING_TLSAUTH_USERNAME_ORIG] &&
++       !data->set.ssl.primary.authtype)
++      data->set.ssl.primary.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
+     break;
+   case CURLOPT_PROXY_TLSAUTH_USERNAME:
+     result = Curl_setstropt(&data->set.str[STRING_TLSAUTH_USERNAME_PROXY],
+                             va_arg(param, char *));
+     if(data->set.str[STRING_TLSAUTH_USERNAME_PROXY] &&
+-       !data->set.proxy_ssl.authtype)
+-      data->set.proxy_ssl.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
++       !data->set.proxy_ssl.primary.authtype)
++      data->set.proxy_ssl.primary.authtype = CURL_TLSAUTH_SRP; /* default to
++                                                                  SRP */
+     break;
+   case CURLOPT_TLSAUTH_PASSWORD:
+     result = Curl_setstropt(&data->set.str[STRING_TLSAUTH_PASSWORD_ORIG],
+                             va_arg(param, char *));
+-    if(data->set.str[STRING_TLSAUTH_USERNAME_ORIG] && !data->set.ssl.authtype)
+-      data->set.ssl.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
++    if(data->set.str[STRING_TLSAUTH_USERNAME_ORIG] &&
++       !data->set.ssl.primary.authtype)
++      data->set.ssl.primary.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
+     break;
+   case CURLOPT_PROXY_TLSAUTH_PASSWORD:
+     result = Curl_setstropt(&data->set.str[STRING_TLSAUTH_PASSWORD_PROXY],
+                             va_arg(param, char *));
+     if(data->set.str[STRING_TLSAUTH_USERNAME_PROXY] &&
+-       !data->set.proxy_ssl.authtype)
+-      data->set.proxy_ssl.authtype = CURL_TLSAUTH_SRP; /* default to SRP */
++       !data->set.proxy_ssl.primary.authtype)
++      data->set.proxy_ssl.primary.authtype = CURL_TLSAUTH_SRP; /* default */
+     break;
+   case CURLOPT_TLSAUTH_TYPE:
+     argptr = va_arg(param, char *);
+     if(!argptr ||
+        strncasecompare(argptr, "SRP", strlen("SRP")))
+-      data->set.ssl.authtype = CURL_TLSAUTH_SRP;
++      data->set.ssl.primary.authtype = CURL_TLSAUTH_SRP;
+     else
+-      data->set.ssl.authtype = CURL_TLSAUTH_NONE;
++      data->set.ssl.primary.authtype = CURL_TLSAUTH_NONE;
+     break;
+   case CURLOPT_PROXY_TLSAUTH_TYPE:
+     argptr = va_arg(param, char *);
+     if(!argptr ||
+        strncasecompare(argptr, "SRP", strlen("SRP")))
+-      data->set.proxy_ssl.authtype = CURL_TLSAUTH_SRP;
++      data->set.proxy_ssl.primary.authtype = CURL_TLSAUTH_SRP;
+     else
+-      data->set.proxy_ssl.authtype = CURL_TLSAUTH_NONE;
++      data->set.proxy_ssl.primary.authtype = CURL_TLSAUTH_NONE;
+     break;
+ #endif
+ #ifdef USE_ARES
+diff --git a/lib/url.c b/lib/url.c
+index efa3dc7..6518be9 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -482,7 +482,7 @@ CURLcode Curl_init_userdefined(struct Curl_easy *data)
+   set->ssl.primary.verifypeer = TRUE;
+   set->ssl.primary.verifyhost = TRUE;
+ #ifdef USE_TLS_SRP
+-  set->ssl.authtype = CURL_TLSAUTH_NONE;
++  set->ssl.primary.authtype = CURL_TLSAUTH_NONE;
+ #endif
+   set->ssh_auth_types = CURLSSH_AUTH_DEFAULT; /* defaults to any auth
+                                                       type */
+@@ -3594,8 +3594,9 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.proxy_ssl.primary.pinned_key =
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY];
+ 
+-  data->set.ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_ORIG];
+-  data->set.proxy_ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_PROXY];
++  data->set.ssl.primary.CRLfile = data->set.str[STRING_SSL_CRLFILE_ORIG];
++  data->set.proxy_ssl.primary.CRLfile =
++    data->set.str[STRING_SSL_CRLFILE_PROXY];
+   data->set.ssl.cert = data->set.str[STRING_CERT_ORIG];
+   data->set.proxy_ssl.cert = data->set.str[STRING_CERT_PROXY];
+   data->set.ssl.cert_type = data->set.str[STRING_CERT_TYPE_ORIG];
+@@ -3609,10 +3610,12 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.ssl.primary.clientcert = data->set.str[STRING_CERT_ORIG];
+   data->set.proxy_ssl.primary.clientcert = data->set.str[STRING_CERT_PROXY];
+ #ifdef USE_TLS_SRP
+-  data->set.ssl.username = data->set.str[STRING_TLSAUTH_USERNAME_ORIG];
+-  data->set.proxy_ssl.username = data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
+-  data->set.ssl.password = data->set.str[STRING_TLSAUTH_PASSWORD_ORIG];
+-  data->set.proxy_ssl.password = data->set.str[STRING_TLSAUTH_PASSWORD_PROXY];
++  data->set.ssl.primary.username = data->set.str[STRING_TLSAUTH_USERNAME_ORIG];
++  data->set.proxy_ssl.primary.username =
++    data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
++  data->set.ssl.primary.password = data->set.str[STRING_TLSAUTH_PASSWORD_ORIG];
++  data->set.proxy_ssl.primary.password =
++    data->set.str[STRING_TLSAUTH_PASSWORD_PROXY];
+ #endif
+ 
+   if(!Curl_clone_primary_ssl_config(&data->set.ssl.primary,
+diff --git a/lib/urldata.h b/lib/urldata.h
+index ab1b267..ad0ef8f 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -231,6 +231,13 @@ struct ssl_primary_config {
+   char *cipher_list;     /* list of ciphers to use */
+   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
+   char *pinned_key;
++  char *CRLfile;         /* CRL to check certificate revocation */
++  #ifdef USE_TLS_SRP
++    char *username; /* TLS username (for, e.g., SRP) */
++    char *password; /* TLS password (for, e.g., SRP) */
++    enum CURL_TLSAUTH authtype; /* TLS authentication type (default SRP) */
++  #endif
++  unsigned char ssl_options;  /* the CURLOPT_SSL_OPTIONS bitmask */
+   BIT(verifypeer);       /* set TRUE if this is desired */
+   BIT(verifyhost);       /* set TRUE if CN/SAN must match hostname */
+   BIT(verifystatus);     /* set TRUE if certificate status must be checked */
+@@ -240,7 +247,6 @@ struct ssl_primary_config {
+ struct ssl_config_data {
+   struct ssl_primary_config primary;
+   long certverifyresult; /* result from the certificate verification */
+-  char *CRLfile;   /* CRL to check certificate revocation */
+   curl_ssl_ctx_callback fsslctx; /* function to initialize ssl ctx */
+   void *fsslctxp;        /* parameter for call back */
+   char *cert; /* client certificate file name */
+@@ -248,11 +254,6 @@ struct ssl_config_data {
+   char *key; /* private key file name */
+   char *key_type; /* format for private key (default: PEM) */
+   char *key_passwd; /* plain text private key password */
+-#ifdef USE_TLS_SRP
+-  char *username; /* TLS username (for, e.g., SRP) */
+-  char *password; /* TLS password (for, e.g., SRP) */
+-  enum CURL_TLSAUTH authtype; /* TLS authentication type (default SRP) */
+-#endif
+   BIT(certinfo);     /* gather lots of certificate info */
+   BIT(falsestart);
+   BIT(enable_beast); /* allow this flaw for interoperability's sake*/
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 3d0758d..92c301c 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -581,9 +581,10 @@ gtls_connect_step1(struct connectdata *conn,
+   }
+ 
+ #ifdef USE_TLS_SRP
+-  if((SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP) &&
++  if((SSL_SET_OPTION(primary.authtype) == CURL_TLSAUTH_SRP) &&
+      Curl_allow_auth_to_host(data)) {
+-    infof(data, "Using TLS-SRP username: %s\n", SSL_SET_OPTION(username));
++    infof(data, "Using TLS-SRP username: %s\n",
++          SSL_SET_OPTION(primary.username));
+ 
+     rc = gnutls_srp_allocate_client_credentials(&BACKEND->srp_client_cred);
+     if(rc != GNUTLS_E_SUCCESS) {
+@@ -593,8 +594,8 @@ gtls_connect_step1(struct connectdata *conn,
+     }
+ 
+     rc = gnutls_srp_set_client_credentials(BACKEND->srp_client_cred,
+-                                           SSL_SET_OPTION(username),
+-                                           SSL_SET_OPTION(password));
++                                           SSL_SET_OPTION(primary.username),
++                                           SSL_SET_OPTION(primary.password));
+     if(rc != GNUTLS_E_SUCCESS) {
+       failf(data, "gnutls_srp_set_client_cred() failed: %s",
+             gnutls_strerror(rc));
+@@ -648,19 +649,19 @@ gtls_connect_step1(struct connectdata *conn,
+   }
+ #endif
+ 
+-  if(SSL_SET_OPTION(CRLfile)) {
++  if(SSL_SET_OPTION(primary.CRLfile)) {
+     /* set the CRL list file */
+     rc = gnutls_certificate_set_x509_crl_file(BACKEND->cred,
+-                                              SSL_SET_OPTION(CRLfile),
++                                              SSL_SET_OPTION(primary.CRLfile),
+                                               GNUTLS_X509_FMT_PEM);
+     if(rc < 0) {
+       failf(data, "error reading crl file %s (%s)",
+-            SSL_SET_OPTION(CRLfile), gnutls_strerror(rc));
++            SSL_SET_OPTION(primary.CRLfile), gnutls_strerror(rc));
+       return CURLE_SSL_CRL_BADFILE;
+     }
+     else
+       infof(data, "found %d CRL in %s\n",
+-            rc, SSL_SET_OPTION(CRLfile));
++            rc, SSL_SET_OPTION(primary.CRLfile));
+   }
+ 
+   /* Initialize TLS session as a client */
+@@ -879,7 +880,7 @@ gtls_connect_step1(struct connectdata *conn,
+ 
+ #ifdef USE_TLS_SRP
+   /* put the credentials to the current session */
+-  if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP) {
++  if(SSL_SET_OPTION(primary.authtype) == CURL_TLSAUTH_SRP) {
+     rc = gnutls_credentials_set(session, GNUTLS_CRD_SRP,
+                                 BACKEND->srp_client_cred);
+     if(rc != GNUTLS_E_SUCCESS) {
+@@ -1061,8 +1062,8 @@ gtls_connect_step3(struct connectdata *conn,
+        SSL_CONN_CONFIG(verifyhost) ||
+        SSL_CONN_CONFIG(issuercert)) {
+ #ifdef USE_TLS_SRP
+-      if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP
+-         && SSL_SET_OPTION(username) != NULL
++      if(SSL_SET_OPTION(primary.authtype) == CURL_TLSAUTH_SRP
++         && SSL_SET_OPTION(primary.username) != NULL
+          && !SSL_CONN_CONFIG(verifypeer)
+          && gnutls_cipher_get(session)) {
+         /* no peer cert, but auth is ok if we have SRP user and cipher and no
+@@ -1116,7 +1117,8 @@ gtls_connect_step3(struct connectdata *conn,
+         failf(data, "server certificate verification failed. CAfile: %s "
+               "CRLfile: %s", SSL_CONN_CONFIG(CAfile) ? SSL_CONN_CONFIG(CAfile):
+               "none",
+-              SSL_SET_OPTION(CRLfile)?SSL_SET_OPTION(CRLfile):"none");
++              SSL_SET_OPTION(primary.CRLfile) ?
++              SSL_SET_OPTION(primary.CRLfile) : "none");
+         return CURLE_PEER_FAILED_VERIFICATION;
+       }
+       else
+@@ -1703,8 +1705,8 @@ static int Curl_gtls_shutdown(struct connectdata *conn, int sockindex)
+   gnutls_certificate_free_credentials(BACKEND->cred);
+ 
+ #ifdef USE_TLS_SRP
+-  if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP
+-     && SSL_SET_OPTION(username) != NULL)
++  if(SSL_SET_OPTION(primary.authtype) == CURL_TLSAUTH_SRP
++     && SSL_SET_OPTION(primary.username) != NULL)
+     gnutls_srp_free_client_credentials(BACKEND->srp_client_cred);
+ #endif
+ 
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index 19df847..62d2b00 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -245,7 +245,7 @@ mbed_connect_step1(struct connectdata *conn,
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+   const char * const ssl_capath = SSL_CONN_CONFIG(CApath);
+   char * const ssl_cert = SSL_SET_OPTION(cert);
+-  const char * const ssl_crlfile = SSL_SET_OPTION(CRLfile);
++  const char * const ssl_crlfile = SSL_SET_OPTION(primary.CRLfile);
+   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+     conn->host.name;
+   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index 86102f7..62fd7a2 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -1955,13 +1955,13 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+     }
+   }
+ 
+-  if(SSL_SET_OPTION(CRLfile)) {
+-    const CURLcode rv = nss_load_crl(SSL_SET_OPTION(CRLfile));
++  if(SSL_SET_OPTION(primary.CRLfile)) {
++    const CURLcode rv = nss_load_crl(SSL_SET_OPTION(primary.CRLfile));
+     if(rv) {
+       result = rv;
+       goto error;
+     }
+-    infof(data, "  CRLfile: %s\n", SSL_SET_OPTION(CRLfile));
++    infof(data, "  CRLfile: %s\n", SSL_SET_OPTION(primary.CRLfile));
+   }
+ 
+   if(SSL_SET_OPTION(cert)) {
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index a14cecc..ec5a8f5 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -2454,14 +2454,14 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
+     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
+   const long int ssl_version = SSL_CONN_CONFIG(version);
+ #ifdef USE_TLS_SRP
+-  const enum CURL_TLSAUTH ssl_authtype = SSL_SET_OPTION(authtype);
++  const enum CURL_TLSAUTH ssl_authtype = SSL_SET_OPTION(primary.authtype);
+ #endif
+   char * const ssl_cert = SSL_SET_OPTION(cert);
+   const char * const ssl_cert_type = SSL_SET_OPTION(cert_type);
+   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
+   const char * const ssl_capath = SSL_CONN_CONFIG(CApath);
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+-  const char * const ssl_crlfile = SSL_SET_OPTION(CRLfile);
++  const char * const ssl_crlfile = SSL_SET_OPTION(primary.CRLfile);
+   char error_buffer[256];
+ 
+   DEBUGASSERT(ssl_connect_1 == connssl->connecting_state);
+@@ -2741,15 +2741,15 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
+ #ifdef USE_TLS_SRP
+   if((ssl_authtype == CURL_TLSAUTH_SRP) &&
+      Curl_allow_auth_to_host(data)) {
+-    char * const ssl_username = SSL_SET_OPTION(username);
+-
++    char * const ssl_username = SSL_SET_OPTION(primary.username);
++    char * const ssl_password = SSL_SET_OPTION(primary.password);
+     infof(data, "Using TLS-SRP username: %s\n", ssl_username);
+ 
+     if(!SSL_CTX_set_srp_username(BACKEND->ctx, ssl_username)) {
+       failf(data, "Unable to set SRP user name");
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+     }
+-    if(!SSL_CTX_set_srp_password(BACKEND->ctx, SSL_SET_OPTION(password))) {
++    if(!SSL_CTX_set_srp_password(BACKEND->ctx, ssl_password)) {
+       failf(data, "failed setting SRP password");
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+     }
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index e38f74e..e8cb70f 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -89,6 +89,7 @@ Curl_ssl_config_matches(struct ssl_primary_config* data,
+ {
+   if((data->version == needle->version) &&
+      (data->version_max == needle->version_max) &&
++     (data->ssl_options == needle->ssl_options) &&
+      (data->verifypeer == needle->verifypeer) &&
+      (data->verifyhost == needle->verifyhost) &&
+      (data->verifystatus == needle->verifystatus) &&
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782-2.patch b/meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
new file mode 100644
index 0000000000..3d56025210
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
@@ -0,0 +1,71 @@
+From 0a115a8903dffc7f723d1d4d71fb821d69eb8761 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 May 2022 23:13:53 +0200
+Subject: [PATCH] url: check SSH config match on connection reuse
+
+CVE-2022-27782
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2022-27782.html
+Closes #8825
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1645e9b44505abd5cbaf65da5282c3f33b5924a5]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/url.c      | 11 +++++++++++
+ lib/vssh/ssh.h |  6 +++---
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 6518be9..8da0245 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1027,6 +1027,12 @@ static void prune_dead_connections(struct Curl_easy *data)
+   }
+ }
+ 
++static bool ssh_config_matches(struct connectdata *one,
++                               struct connectdata *two)
++{
++  return (Curl_safecmp(one->proto.sshc.rsa, two->proto.sshc.rsa) &&
++          Curl_safecmp(one->proto.sshc.rsa_pub, two->proto.sshc.rsa_pub));
++}
+ /*
+  * Given one filled in connection struct (named needle), this function should
+  * detect if there already is one that has all the significant details
+@@ -1260,6 +1266,11 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
++      if(get_protocol_family(needle->handler->protocol) == PROTO_FAMILY_SSH) {
++        if(!ssh_config_matches(needle, check))
++          continue;
++      }
++
+       if(!needle->bits.httpproxy || (needle->handler->flags&PROTOPT_SSL) ||
+          needle->bits.tunnel_proxy) {
+         /* The requested connection does not use a HTTP proxy or it uses SSL or
+diff --git a/lib/vssh/ssh.h b/lib/vssh/ssh.h
+index 0d4ee52..8f2632e 100644
+--- a/lib/vssh/ssh.h
++++ b/lib/vssh/ssh.h
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2020, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -120,8 +120,8 @@ struct ssh_conn {
+ 
+   /* common */
+   const char *passphrase;     /* pass-phrase to use */
+-  char *rsa_pub;              /* path name */
+-  char *rsa;                  /* path name */
++  char *rsa_pub;              /* strdup'ed public key file */
++  char *rsa;                  /* strdup'ed private key file */
+   bool authed;                /* the connection has been authenticated fine */
+   sshstate state;             /* always use ssh.c:state() to change state! */
+   sshstate nextstate;         /* the state to goto after stopping */
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index e850376ff8..b53b00cc38 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -28,6 +28,13 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-27776.patch \
            file://CVE-2022-27775.patch \
            file://CVE-2022-22576.patch \
+           file://CVE-2022-27774-1.patch \
+           file://CVE-2022-27774-2.patch \
+           file://CVE-2022-27774-3.patch \
+           file://CVE-2022-27774-4.patch \
+           file://CVE-2022-27781.patch \
+           file://CVE-2022-27782-1.patch \
+           file://CVE-2022-27782-2.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1

