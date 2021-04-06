Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web10.11363.1617713645750966151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 05:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=AAImnuLg;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id TlDVlhXIk6wwFTlDWltzC5; Tue, 06 Apr 2021 13:54:04 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TPXet2ta c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=3YhXtTcJ-WEA:10 a=-An2I_7KAAAA:8 a=ugkhXdxtAAAA:8 a=UJ5Y5Z__AAAA:8
 a=Bot_1oTIco8RagOFwXMA:9 a=t_Cljoco5jwA:10 a=PeFqg9HAHHMA:10
 a=VinBSYM5t5AA:10 a=-RoEEKskQ1sA:10 a=Sq34B_EcNBM9_nrAYB9S:22
 a=ZG-MjRxWnTTVGrJRUvVH:22 a=-nuATAkMhhWPdIrRzIKU:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=c1tYMtyk4mk/m0N0nPQTGGL1aXMrjMwZu6t1enizA+E=; b=AA
	ImnuLgCrnbfuQkihcQ6FyIT1Eckuu5tCcSqIXaMMUVY6aKQcoyRulYm+TCD/rAA6WecDo5ZOrdjti
	utQmu4yvMYNR93gi3bLYaYwHccCqy8rRXkxzSQuDMK59h1GX+nIO5r3eGBEZ32EAdxZNyVygVe8Hs
	texzLkDblBhSSFuz9TE0K+kaIjw241OTiYnRuOLIf52WOSYgDXXTdMPgrjpkdvoxOnWKPz51jI46v
	lmzCCpAIakkdEosTDtX7NsLScHq5lEiOq/loDe7TE5NEc9hR2BHqGhZkzgjSaQJ7J5ucHnBCv7uOg
	42t5BL1cRN5Xqu1RRvkVpJeJEdbM89Kg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lTlDT-0006jK-Qj; Tue, 06 Apr 2021 13:53:59 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH] curl: Patch CVE-2021-22876 & CVE-2021-22890
Date: Tue,  6 Apr 2021 13:53:42 +0100
Message-Id: <20210406125342.15743-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGkO9PzaIxP3zsHv69dtPuCY8IGrXBgFyv5hmb/jaxRfNTqKei2zGd90MJ0ILh+LM6fBqa+wHXEmAmLpFCg+ZbmcQS6r94TEvc+0tOzbpuSIgu9DocHp
 DvupYjg5nDHeft+R0ZSiIxBx4cevci31D3yzaxduHEYj+tyuR3wKuD0CfzkFkQaMtlm2XlRERu4uGQ==
Content-Transfer-Encoding: 8bit

Take patches from Ubuntu 20.04 7.68.0-1ubuntu2.5, which is close enough
that they apply without conflicts.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../curl/curl/CVE-2021-22876.patch            |  59 +++
 .../curl/curl/CVE-2021-22890.patch            | 464 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 3 files changed, 525 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22876.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22890.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22876.patch b/meta/recipes-support/curl/curl/CVE-2021-22876.patch
new file mode 100644
index 0000000000..fc396aabef
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22876.patch
@@ -0,0 +1,59 @@
+transfer: strip credentials from the auto-referer header field
+
+CVE-2021-22876
+
+Patch taken from Ubuntu curl 7.68.0-1ubuntu2.5.
+
+Bug: https://curl.se/docs/CVE-2021-22876.html
+Upstream-Status: backport
+---
+ lib/transfer.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index e76834eb3..744e1c00b 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1570,6 +1570,9 @@ CURLcode Curl_follow(struct Curl_easy *data,
+       data->set.followlocation++; /* count location-followers */
+ 
+       if(data->set.http_auto_referer) {
++        CURLU *u;
++        char *referer;
++
+         /* We are asked to automatically set the previous URL as the referer
+            when we get the next URL. We pick the ->url field, which may or may
+            not be 100% correct */
+@@ -1579,9 +1582,27 @@ CURLcode Curl_follow(struct Curl_easy *data,
+           data->change.referer_alloc = FALSE;
+         }
+ 
+-        data->change.referer = strdup(data->change.url);
+-        if(!data->change.referer)
++        /* Make a copy of the URL without crenditals and fragment */
++        u = curl_url();
++        if(!u)
++          return CURLE_OUT_OF_MEMORY;
++
++        uc = curl_url_set(u, CURLUPART_URL, data->change.url, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_FRAGMENT, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_USER, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++        if(!uc)
++          uc = curl_url_get(u, CURLUPART_URL, &referer, 0);
++
++        curl_url_cleanup(u);
++
++        if(uc || referer == NULL)
+           return CURLE_OUT_OF_MEMORY;
++
++        data->change.referer = referer;
+         data->change.referer_alloc = TRUE; /* yes, free this later */
+       }
+     }
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22890.patch b/meta/recipes-support/curl/curl/CVE-2021-22890.patch
new file mode 100644
index 0000000000..8c0ecbfe7f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22890.patch
@@ -0,0 +1,464 @@
+vtls: add 'isproxy' argument to Curl_ssl_get/addsessionid()
+
+To make sure we set and extract the correct session.
+
+Patch taken from Ubuntu curl 7.68.0-1ubuntu2.5.
+
+CVE-2021-22890
+
+Reported-by: Mingtao Yang
+Bug: https://curl.se/docs/CVE-2021-22890.html
+Upstream-Status: backport
+---
+ lib/vtls/bearssl.c   |  9 +++++---
+ lib/vtls/gtls.c      |  9 +++++---
+ lib/vtls/mbedtls.c   |  8 ++++---
+ lib/vtls/mesalink.c  |  9 +++++---
+ lib/vtls/openssl.c   | 52 ++++++++++++++++++++++++++++++++++----------
+ lib/vtls/schannel.c  | 10 +++++----
+ lib/vtls/sectransp.c |  9 ++++----
+ lib/vtls/vtls.c      |  9 ++++++--
+ lib/vtls/vtls.h      |  2 ++
+ lib/vtls/wolfssl.c   |  8 ++++---
+ 10 files changed, 88 insertions(+), 37 deletions(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 67f945831..32cb0a4c2 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -372,7 +372,8 @@ static CURLcode bearssl_connect_step1(struct connectdata *conn, int sockindex)
+     void *session;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &session, NULL, sockindex)) {
+       br_ssl_engine_set_session_parameters(&BACKEND->ctx.eng, session);
+       infof(data, "BearSSL: re-using session ID\n");
+     }
+@@ -560,10 +561,12 @@ static CURLcode bearssl_connect_step3(struct connectdata *conn, int sockindex)
+       return CURLE_OUT_OF_MEMORY;
+     br_ssl_engine_get_session_parameters(&BACKEND->ctx.eng, session);
+     Curl_ssl_sessionid_lock(conn);
+-    incache = !(Curl_ssl_getsessionid(conn, &oldsession, NULL, sockindex));
++    incache = !(Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                                      &oldsession, NULL, sockindex));
+     if(incache)
+       Curl_ssl_delsessionid(conn, oldsession);
+-    ret = Curl_ssl_addsessionid(conn, session, 0, sockindex);
++    ret = Curl_ssl_addsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                                session, 0, sockindex);
+     Curl_ssl_sessionid_unlock(conn);
+     if(ret) {
+       free(session);
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 5f740eeba..46e149c7d 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -937,7 +937,8 @@ gtls_connect_step1(struct connectdata *conn,
+     size_t ssl_idsize;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &ssl_sessionid, &ssl_idsize, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, &ssl_idsize, sockindex)) {
+       /* we got a session id, use it! */
+       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
+ 
+@@ -1485,7 +1486,8 @@ gtls_connect_step3(struct connectdata *conn,
+       gnutls_session_get_data(session, connect_sessionid, &connect_idsize);
+ 
+       Curl_ssl_sessionid_lock(conn);
+-      incache = !(Curl_ssl_getsessionid(conn, &ssl_sessionid, NULL,
++      incache = !(Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                                        &ssl_sessionid, NULL,
+                                         sockindex));
+       if(incache) {
+         /* there was one before in the cache, so instead of risking that the
+@@ -1494,7 +1496,8 @@ gtls_connect_step3(struct connectdata *conn,
+       }
+ 
+       /* store this session id */
+-      result = Curl_ssl_addsessionid(conn, connect_sessionid, connect_idsize,
++      result = Curl_ssl_addsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                                     connect_sessionid, connect_idsize,
+                                      sockindex);
+       Curl_ssl_sessionid_unlock(conn);
+       if(result) {
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index f057315f3..19df8478e 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -453,7 +453,8 @@ mbed_connect_step1(struct connectdata *conn,
+     void *old_session = NULL;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &old_session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &old_session, NULL, sockindex)) {
+       ret = mbedtls_ssl_set_session(&BACKEND->ssl, old_session);
+       if(ret) {
+         Curl_ssl_sessionid_unlock(conn);
+@@ -709,6 +710,7 @@ mbed_connect_step3(struct connectdata *conn,
+     int ret;
+     mbedtls_ssl_session *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
+     if(!our_ssl_sessionid)
+@@ -727,10 +729,10 @@ mbed_connect_step3(struct connectdata *conn,
+ 
+     /* If there's already a matching session in the cache, delete it */
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &old_ssl_sessionid, NULL, sockindex))
++    if(!Curl_ssl_getsessionid(conn, isproxy, &old_ssl_sessionid, NULL, sockindex))
+       Curl_ssl_delsessionid(conn, old_ssl_sessionid);
+ 
+-    retcode = Curl_ssl_addsessionid(conn, our_ssl_sessionid, 0, sockindex);
++    retcode = Curl_ssl_addsessionid(conn, isproxy, our_ssl_sessionid, 0, sockindex);
+     Curl_ssl_sessionid_unlock(conn);
+     if(retcode) {
+       mbedtls_ssl_session_free(our_ssl_sessionid);
+diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
+index cab1e390b..79d1e3dfa 100644
+--- a/lib/vtls/mesalink.c
++++ b/lib/vtls/mesalink.c
+@@ -263,7 +263,8 @@ mesalink_connect_step1(struct connectdata *conn, int sockindex)
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(conn);
+@@ -347,12 +348,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     bool incache;
+     SSL_SESSION *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool inproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = SSL_get_session(BACKEND->handle);
+ 
+     Curl_ssl_sessionid_lock(conn);
+     incache =
+-      !(Curl_ssl_getsessionid(conn, &old_ssl_sessionid, NULL, sockindex));
++      !(Curl_ssl_getsessionid(conn, isproxy, &old_ssl_sessionid,
++                              NULL, sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != our_ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -363,7 +366,7 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+ 
+     if(!incache) {
+       result = Curl_ssl_addsessionid(
+-        conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
++        conn, isproxy, our_ssl_sessionid, 0 /* unknown size */, sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(conn);
+         failf(data, "failed to store ssl session");
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 1d09cadca..64f43605a 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -422,12 +422,23 @@ static int ossl_get_ssl_conn_index(void)
+  */
+ static int ossl_get_ssl_sockindex_index(void)
+ {
+-  static int ssl_ex_data_sockindex_index = -1;
+-  if(ssl_ex_data_sockindex_index < 0) {
+-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
+-        NULL);
++  static int sockindex_index = -1;
++  if(sockindex_index < 0) {
++    sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+   }
+-  return ssl_ex_data_sockindex_index;
++  return sockindex_index;
++}
++
++/* Return an extra data index for proxy boolean.
++ * This index can be used with SSL_get_ex_data() and SSL_set_ex_data().
++ */
++static int ossl_get_proxy_index(void)
++{
++  static int proxy_index = -1;
++  if(proxy_index < 0) {
++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
++  }
++  return proxy_index;
+ }
+ 
+ static int passwd_callback(char *buf, int num, int encrypting,
+@@ -1079,7 +1090,8 @@ static int Curl_ossl_init(void)
+ #endif
+ 
+   /* Initialize the extra data indexes */
+-  if(ossl_get_ssl_conn_index() < 0 || ossl_get_ssl_sockindex_index() < 0)
++  if(ossl_get_ssl_conn_index() < 0 || ossl_get_ssl_sockindex_index() < 0 ||
++     ossl_get_proxy_index() < 0)
+     return 0;
+ 
+   return 1;
+@@ -2341,8 +2353,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   curl_socket_t *sockindex_ptr;
+   int connectdata_idx = ossl_get_ssl_conn_index();
+   int sockindex_idx = ossl_get_ssl_sockindex_index();
++  int proxy_idx = ossl_get_proxy_index();
++  bool isproxy;
+ 
+-  if(connectdata_idx < 0 || sockindex_idx < 0)
++  if(connectdata_idx < 0 || sockindex_idx < 0 || proxy_idx < 0)
+     return 0;
+ 
+   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
+@@ -2355,13 +2369,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
+   sockindex = (int)(sockindex_ptr - conn->sock);
+ 
++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
++
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     bool incache;
+     void *old_ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    incache = !(Curl_ssl_getsessionid(conn, &old_ssl_sessionid, NULL,
+-                                      sockindex));
++    if(isproxy)
++      incache = FALSE;
++    else
++      incache = !(Curl_ssl_getsessionid(conn, isproxy,
++                                        &old_ssl_sessionid, NULL, sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -2371,7 +2390,7 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+     }
+ 
+     if(!incache) {
+-      if(!Curl_ssl_addsessionid(conn, ssl_sessionid,
++      if(!Curl_ssl_addsessionid(conn, isproxy, ssl_sessionid,
+                                       0 /* unknown size */, sockindex)) {
+         /* the session has been put into the session cache */
+         res = 1;
+@@ -2868,16 +2887,25 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
+     void *ssl_sessionid = NULL;
+     int connectdata_idx = ossl_get_ssl_conn_index();
+     int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
+ 
+-    if(connectdata_idx >= 0 && sockindex_idx >= 0) {
++    if(connectdata_idx >= 0 && sockindex_idx >= 0 && proxy_idx >= 0) {
+       /* Store the data needed for the "new session" callback.
+        * The sockindex is stored as a pointer to an array element. */
+       SSL_set_ex_data(BACKEND->handle, connectdata_idx, conn);
+       SSL_set_ex_data(BACKEND->handle, sockindex_idx, conn->sock + sockindex);
++#ifndef CURL_DISABLE_PROXY
++      SSL_set_ex_data(BACKEND->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
++                      NULL);
++#else
++      SSL_set_ex_data(BACKEND->handle, proxy_idx, NULL);
++#endif
++
+     }
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(conn);
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index f665ee340..a354ce95d 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -487,7 +487,8 @@ schannel_connect_step1(struct connectdata *conn, int sockindex)
+   /* check for an existing re-usable credential handle */
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, (void **)&old_cred, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              (void **)&old_cred, NULL, sockindex)) {
+       BACKEND->cred = old_cred;
+       DEBUGF(infof(data, "schannel: re-using existing credential handle\n"));
+ 
+@@ -1193,8 +1194,9 @@ schannel_connect_step3(struct connectdata *conn, int sockindex)
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   SECURITY_STATUS sspi_status = SEC_E_OK;
+   CERT_CONTEXT *ccert_context = NULL;
++  bool isproxy = SSL_IS_PROXY();
+ #ifdef DEBUGBUILD
+-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
+     conn->host.name;
+ #endif
+ #ifdef HAS_ALPN
+@@ -1268,7 +1270,7 @@ schannel_connect_step3(struct connectdata *conn, int sockindex)
+     struct curl_schannel_cred *old_cred = NULL;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    incache = !(Curl_ssl_getsessionid(conn, (void **)&old_cred, NULL,
++    incache = !(Curl_ssl_getsessionid(conn, isproxy, (void **)&old_cred, NULL,
+                                       sockindex));
+     if(incache) {
+       if(old_cred != BACKEND->cred) {
+@@ -1280,7 +1282,7 @@ schannel_connect_step3(struct connectdata *conn, int sockindex)
+       }
+     }
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(conn, (void *)BACKEND->cred,
++      result = Curl_ssl_addsessionid(conn, isproxy, (void *)BACKEND->cred,
+                                      sizeof(struct curl_schannel_cred),
+                                      sockindex);
+       if(result) {
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 7dd028fb7..9c67d465a 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -1376,7 +1376,8 @@ static CURLcode sectransp_connect_step1(struct connectdata *conn,
+   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+   char * const ssl_cert = SSL_SET_OPTION(cert);
+-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
++  bool isproxy = SSL_IS_PROXY();
++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
+     conn->host.name;
+   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
+ #ifdef ENABLE_IPV6
+@@ -1584,7 +1585,7 @@ static CURLcode sectransp_connect_step1(struct connectdata *conn,
+ 
+ #ifdef USE_NGHTTP2
+       if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
+-         (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
++         (!isproxy || !conn->bits.tunnel_proxy)) {
+         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
+         infof(data, "ALPN, offering %s\n", NGHTTP2_PROTO_VERSION_ID);
+       }
+@@ -1916,7 +1917,7 @@ static CURLcode sectransp_connect_step1(struct connectdata *conn,
+     size_t ssl_sessionid_len;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, (void **)&ssl_sessionid,
++    if(!Curl_ssl_getsessionid(conn, isproxy, (void **)&ssl_sessionid,
+                               &ssl_sessionid_len, sockindex)) {
+       /* we got a session id, use it! */
+       err = SSLSetPeerID(BACKEND->ssl_ctx, ssl_sessionid, ssl_sessionid_len);
+@@ -1944,7 +1945,7 @@ static CURLcode sectransp_connect_step1(struct connectdata *conn,
+         return CURLE_SSL_CONNECT_ERROR;
+       }
+ 
+-      result = Curl_ssl_addsessionid(conn, ssl_sessionid, ssl_sessionid_len,
++      result = Curl_ssl_addsessionid(conn, isproxy, ssl_sessionid, ssl_sessionid_len,
+                                      sockindex);
+       Curl_ssl_sessionid_unlock(conn);
+       if(result) {
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index dfefa1bd5..aaf73ef8f 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -305,6 +305,7 @@ void Curl_ssl_sessionid_unlock(struct connectdata *conn)
+  * there's one suitable, it is provided. Returns TRUE when no entry matched.
+  */
+ bool Curl_ssl_getsessionid(struct connectdata *conn,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex)
+@@ -315,7 +316,6 @@ bool Curl_ssl_getsessionid(struct connectdata *conn,
+   long *general_age;
+   bool no_match = TRUE;
+ 
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &conn->proxy_ssl_config :
+     &conn->ssl_config;
+@@ -324,6 +324,11 @@ bool Curl_ssl_getsessionid(struct connectdata *conn,
+   int port = isProxy ? (int)conn->port : conn->remote_port;
+   *ssl_sessionid = NULL;
+ 
++#ifdef CURL_DISABLE_PROXY
++  if(isProxy)
++    return TRUE;
++#endif
++
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   if(!SSL_SET_OPTION(primary.sessionid))
+@@ -411,6 +416,7 @@ void Curl_ssl_delsessionid(struct connectdata *conn, void *ssl_sessionid)
+  * later on.
+  */
+ CURLcode Curl_ssl_addsessionid(struct connectdata *conn,
++                               bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+@@ -423,7 +429,6 @@ CURLcode Curl_ssl_addsessionid(struct connectdata *conn,
+   char *clone_conn_to_host;
+   int conn_to_port;
+   long *general_age;
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &conn->proxy_ssl_config :
+     &conn->ssl_config;
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index a81b2f22d..a5e348752 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -202,6 +202,7 @@ void Curl_ssl_sessionid_unlock(struct connectdata *conn);
+  * under sessionid mutex).
+  */
+ bool Curl_ssl_getsessionid(struct connectdata *conn,
++                           const bool isproxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
+@@ -211,6 +212,7 @@ bool Curl_ssl_getsessionid(struct connectdata *conn,
+  * object with cache (e.g. incrementing refcount on success)
+  */
+ CURLcode Curl_ssl_addsessionid(struct connectdata *conn,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex);
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index 8c2d3f4a2..dd9f907ff 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -392,7 +392,8 @@ wolfssl_connect_step1(struct connectdata *conn,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    if(!Curl_ssl_getsessionid(conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
+         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
+@@ -618,9 +619,10 @@ wolfssl_connect_step3(struct connectdata *conn,
+     void *old_ssl_sessionid = NULL;
+ 
+     our_ssl_sessionid = SSL_get_session(BACKEND->handle);
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     Curl_ssl_sessionid_lock(conn);
+-    incache = !(Curl_ssl_getsessionid(conn, &old_ssl_sessionid, NULL,
++    incache = !(Curl_ssl_getsessionid(conn, isproxy, &old_ssl_sessionid, NULL,
+                                       sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != our_ssl_sessionid) {
+@@ -631,7 +633,7 @@ wolfssl_connect_step3(struct connectdata *conn,
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(conn, our_ssl_sessionid,
++      result = Curl_ssl_addsessionid(conn, isproxy, our_ssl_sessionid,
+                                      0 /* unknown size */, sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(conn);
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 4cc35c2c51..13ab29cf69 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2020-8284.patch \
            file://CVE-2020-8285.patch \
            file://CVE-2020-8286.patch \
+           file://CVE-2021-22876.patch \
+           file://CVE-2021-22890.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.20.1

