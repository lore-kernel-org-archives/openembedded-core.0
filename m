Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.1869.1623795177230809688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 15:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=qcU86bS0;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id E2C5E20B6AEE;
	Tue, 15 Jun 2021 15:12:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E2C5E20B6AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1623795176;
	bh=S1QvI60X0GtxVXcmeAvLnPIjAjmtdDDY2brMKEs+8X0=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=qcU86bS0cbo2f8ofWCz/dhBApgEGbvX1rQ1uWJuYE4aJ1rNWsda5ZD2g7EOPpYxEu
	 ZDTlr7weH9YCMC+j9rcsqE/33bT/Ak6bsjTuP1RDYtwqZwXJ3MAZ/LkpYcrBwzS09/
	 75BCyHQXGTAGaTXjurV0PSg08AOd9KwtfVXV7NXQ=
Subject: Re: [OE-core][hardknott][PATCH 1/2] curl: fix CVE-2021-22890
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <d6b36eef-37fb-9901-20ae-909c9a4475f5@linux.microsoft.com>
Date: Tue, 15 Jun 2021 16:12:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------415B3DE65EFC683887679871"
Content-Language: en-US

--------------415B3DE65EFC683887679871
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/21 9:09 AM, Trevor Gamblin wrote:
> Backport and modify the patch for CVE-2021-22890 from curl 7.76 to make
> it apply cleanly on 7.75.
>
> CVE: CVE-2021-22890
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-argument-to-Curl_ssl_get-addsession.patch | 517 ++++++++++++++++++
>   meta/recipes-support/curl/curl_7.75.0.bb      |   1 +
>   2 files changed, 518 insertions(+)
>   create mode 100644 meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
>
> diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
> new file mode 100644
> index 0000000000..a0c7d68f33
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
> @@ -0,0 +1,517 @@
> +From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Tue, 1 Jun 2021 09:50:20 -0400
> +Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
> + Curl_ssl_get/addsessionid()
> +
> +To make sure we set and extract the correct session.
> +
> +Reported-by: Mingtao Yang
> +Bug: https://curl.se/docs/CVE-2021-22890.html
> +
> +CVE-2021-22890
> +
> +Upstream-Status: Backport
> +(https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844)
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +---
> + lib/vtls/bearssl.c   |  8 +++++--
> + lib/vtls/gtls.c      | 12 ++++++----
> + lib/vtls/mbedtls.c   | 12 ++++++----
> + lib/vtls/mesalink.c  | 14 ++++++++----
> + lib/vtls/openssl.c   | 54 +++++++++++++++++++++++++++++++++-----------
> + lib/vtls/schannel.c  | 10 ++++----
> + lib/vtls/sectransp.c | 10 ++++----
> + lib/vtls/vtls.c      | 12 +++++++---
> + lib/vtls/vtls.h      |  2 ++
> + lib/vtls/wolfssl.c   | 28 +++++++++++++----------
> + 10 files changed, 111 insertions(+), 51 deletions(-)
> +
> +diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
> +index 29b08c0e6..0432dfadc 100644
> +--- a/lib/vtls/bearssl.c
> ++++ b/lib/vtls/bearssl.c
> +@@ -375,7 +375,8 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
> +     void *session;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &session, NULL, sockindex)) {
> ++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
> ++                              &session, NULL, sockindex)) {
> +       br_ssl_engine_set_session_parameters(&backend->ctx.eng, session);
> +       infof(data, "BearSSL: re-using session ID\n");
> +     }
> +@@ -571,10 +572,13 @@ static CURLcode bearssl_connect_step3(struct Curl_easy *data,
> +     br_ssl_engine_get_session_parameters(&backend->ctx.eng, session);
> +     Curl_ssl_sessionid_lock(data);
> +     incache = !(Curl_ssl_getsessionid(data, conn,
> ++                                      SSL_IS_PROXY() ? TRUE : FALSE,
> +                                       &oldsession, NULL, sockindex));
> +     if(incache)
> +       Curl_ssl_delsessionid(data, oldsession);
> +-    ret = Curl_ssl_addsessionid(data, conn, session, 0, sockindex);
> ++    ret = Curl_ssl_addsessionid(data, conn,
> ++                                SSL_IS_PROXY() ? TRUE : FALSE,
> ++                                session, 0, sockindex);
> +     Curl_ssl_sessionid_unlock(data);
> +     if(ret) {
> +       free(session);
> +diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
> +index 3ddee1974..28ca528a6 100644
> +--- a/lib/vtls/gtls.c
> ++++ b/lib/vtls/gtls.c
> +@@ -733,6 +733,7 @@ gtls_connect_step1(struct Curl_easy *data,
> +
> +     Curl_ssl_sessionid_lock(data);
> +     if(!Curl_ssl_getsessionid(data, conn,
> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
> +                               &ssl_sessionid, &ssl_idsize, sockindex)) {
> +       /* we got a session id, use it! */
> +       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
> +@@ -1292,8 +1293,9 @@ gtls_connect_step3(struct Curl_easy *data,
> +       gnutls_session_get_data(session, connect_sessionid, &connect_idsize);
> +
> +       Curl_ssl_sessionid_lock(data);
> +-      incache = !(Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL,
> +-                                        sockindex));
> ++      incache = !(Curl_ssl_getsessionid(data, conn,
> ++                                        SSL_IS_PROXY() ? TRUE : FALSE,
> ++                                        &ssl_sessionid, NULL, sockindex));
> +       if(incache) {
> +         /* there was one before in the cache, so instead of risking that the
> +            previous one was rejected, we just kill that and store the new */
> +@@ -1301,8 +1303,10 @@ gtls_connect_step3(struct Curl_easy *data,
> +       }
> +
> +       /* store this session id */
> +-      result = Curl_ssl_addsessionid(data, conn, connect_sessionid,
> +-                                     connect_idsize, sockindex);
> ++      result = Curl_ssl_addsessionid(data, conn,
> ++                                     SSL_IS_PROXY() ? TRUE : FALSE,
> ++                                     connect_sessionid, connect_idsize,
> ++                                     sockindex);
> +       Curl_ssl_sessionid_unlock(data);
> +       if(result) {
> +         free(connect_sessionid);
> +diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
> +index fc3a948d1..bd0e0802e 100644
> +--- a/lib/vtls/mbedtls.c
> ++++ b/lib/vtls/mbedtls.c
> +@@ -463,7 +463,9 @@ mbed_connect_step1(struct Curl_easy *data, struct connectdata *conn,
> +     void *old_session = NULL;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &old_session, NULL, sockindex)) {
> ++    if(!Curl_ssl_getsessionid(data, conn,
> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
> ++                              &old_session, NULL, sockindex)) {
> +       ret = mbedtls_ssl_set_session(&backend->ssl, old_session);
> +       if(ret) {
> +         Curl_ssl_sessionid_unlock(data);
> +@@ -724,6 +726,7 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +     int ret;
> +     mbedtls_ssl_session *our_ssl_sessionid;
> +     void *old_ssl_sessionid = NULL;
> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
> +
> +     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
> +     if(!our_ssl_sessionid)
> +@@ -742,11 +745,12 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +
> +     /* If there's already a matching session in the cache, delete it */
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL, sockindex))
> ++    if(!Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
> ++                              sockindex))
> +       Curl_ssl_delsessionid(data, old_ssl_sessionid);
> +
> +-    retcode = Curl_ssl_addsessionid(data, conn,
> +-                                    our_ssl_sessionid, 0, sockindex);
> ++    retcode = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
> ++                                    0, sockindex);
> +     Curl_ssl_sessionid_unlock(data);
> +     if(retcode) {
> +       mbedtls_ssl_session_free(our_ssl_sessionid);
> +diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
> +index b6d1005ec..ad807d3ba 100644
> +--- a/lib/vtls/mesalink.c
> ++++ b/lib/vtls/mesalink.c
> +@@ -261,7 +261,9 @@ mesalink_connect_step1(struct Curl_easy *data,
> +     void *ssl_sessionid = NULL;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
> ++    if(!Curl_ssl_getsessionid(data, conn,
> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
> ++                              &ssl_sessionid, NULL, sockindex)) {
> +       /* we got a session id, use it! */
> +       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
> +         Curl_ssl_sessionid_unlock(data);
> +@@ -345,13 +347,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
> +     bool incache;
> +     SSL_SESSION *our_ssl_sessionid;
> +     void *old_ssl_sessionid = NULL;
> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
> +
> +     our_ssl_sessionid = SSL_get_session(BACKEND->handle);
> +
> +     Curl_ssl_sessionid_lock(data);
> +     incache =
> +-      !(Curl_ssl_getsessionid(data, conn,
> +-                              &old_ssl_sessionid, NULL, sockindex));
> ++      !(Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
> ++                              sockindex));
> +     if(incache) {
> +       if(old_ssl_sessionid != our_ssl_sessionid) {
> +         infof(data, "old SSL session ID is stale, removing\n");
> +@@ -361,8 +364,9 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
> +     }
> +
> +     if(!incache) {
> +-      result = Curl_ssl_addsessionid(
> +-        data, conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
> ++      result =
> ++        Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid, 0,
> ++                              sockindex);
> +       if(result) {
> +         Curl_ssl_sessionid_unlock(data);
> +         failf(data, "failed to store ssl session");
> +diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
> +index 784d9f70e..8304264d3 100644
> +--- a/lib/vtls/openssl.c
> ++++ b/lib/vtls/openssl.c
> +@@ -391,12 +391,23 @@ static int ossl_get_ssl_conn_index(void)
> +  */
> + static int ossl_get_ssl_sockindex_index(void)
> + {
> +-  static int ssl_ex_data_sockindex_index = -1;
> +-  if(ssl_ex_data_sockindex_index < 0) {
> +-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
> +-        NULL);
> ++  static int sockindex_index = -1;
> ++  if(sockindex_index < 0) {
> ++    sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
> +   }
> +-  return ssl_ex_data_sockindex_index;
> ++  return sockindex_index;
> ++}
> ++
> ++/* Return an extra data index for proxy boolean.
> ++ * This index can be used with SSL_get_ex_data() and SSL_set_ex_data().
> ++ */
> ++static int ossl_get_proxy_index(void)
> ++{
> ++  static int proxy_index = -1;
> ++  if(proxy_index < 0) {
> ++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
> ++  }
> ++  return proxy_index;
> + }
> +
> + static int passwd_callback(char *buf, int num, int encrypting,
> +@@ -1172,7 +1183,7 @@ static int ossl_init(void)
> +
> +   /* Initialize the extra data indexes */
> +   if(ossl_get_ssl_data_index() < 0 || ossl_get_ssl_conn_index() < 0 ||
> +-     ossl_get_ssl_sockindex_index() < 0)
> ++     ossl_get_ssl_sockindex_index() < 0 || ossl_get_proxy_index() < 0)
> +     return 0;
> +
> +   return 1;
> +@@ -2455,8 +2466,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
> +   int data_idx = ossl_get_ssl_data_index();
> +   int connectdata_idx = ossl_get_ssl_conn_index();
> +   int sockindex_idx = ossl_get_ssl_sockindex_index();
> ++  int proxy_idx = ossl_get_proxy_index();
> ++  bool isproxy;
> +
> +-  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0)
> ++  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0 || proxy_idx < 0)
> +     return 0;
> +
> +   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
> +@@ -2469,13 +2482,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
> +   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
> +   sockindex = (int)(sockindex_ptr - conn->sock);
> +
> ++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
> ++
> +   if(SSL_SET_OPTION(primary.sessionid)) {
> +     bool incache;
> +     void *old_ssl_sessionid = NULL;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
> +-                                      sockindex));
> ++    if(isproxy)
> ++      incache = FALSE;
> ++    else
> ++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
> ++                                        &old_ssl_sessionid, NULL, sockindex));
> +     if(incache) {
> +       if(old_ssl_sessionid != ssl_sessionid) {
> +         infof(data, "old SSL session ID is stale, removing\n");
> +@@ -2485,8 +2503,8 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
> +     }
> +
> +     if(!incache) {
> +-      if(!Curl_ssl_addsessionid(data, conn, ssl_sessionid,
> +-                                      0 /* unknown size */, sockindex)) {
> ++      if(!Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
> ++                                0 /* unknown size */, sockindex)) {
> +         /* the session has been put into the session cache */
> +         res = 1;
> +       }
> +@@ -3212,17 +3230,27 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
> +     int data_idx = ossl_get_ssl_data_index();
> +     int connectdata_idx = ossl_get_ssl_conn_index();
> +     int sockindex_idx = ossl_get_ssl_sockindex_index();
> ++    int proxy_idx = ossl_get_proxy_index();
> +
> +-    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0) {
> ++    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
> ++       proxy_idx >= 0) {
> +       /* Store the data needed for the "new session" callback.
> +        * The sockindex is stored as a pointer to an array element. */
> +       SSL_set_ex_data(backend->handle, data_idx, data);
> +       SSL_set_ex_data(backend->handle, connectdata_idx, conn);
> +       SSL_set_ex_data(backend->handle, sockindex_idx, conn->sock + sockindex);
> ++#ifndef CURL_DISABLE_PROXY
> ++      SSL_set_ex_data(backend->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
> ++                      NULL);
> ++#else
> ++      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
> ++#endif
> ++
> +     }
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
> ++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
> ++                              &ssl_sessionid, NULL, sockindex)) {
> +       /* we got a session id, use it! */
> +       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
> +         Curl_ssl_sessionid_unlock(data);
> +diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
> +index 0668f98f2..bd27ba0bf 100644
> +--- a/lib/vtls/schannel.c
> ++++ b/lib/vtls/schannel.c
> +@@ -496,6 +496,7 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
> +   if(SSL_SET_OPTION(primary.sessionid)) {
> +     Curl_ssl_sessionid_lock(data);
> +     if(!Curl_ssl_getsessionid(data, conn,
> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
> +                               (void **)&old_cred, NULL, sockindex)) {
> +       BACKEND->cred = old_cred;
> +       DEBUGF(infof(data, "schannel: re-using existing credential handle\n"));
> +@@ -1337,8 +1338,9 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
> +   SECURITY_STATUS sspi_status = SEC_E_OK;
> +   CERT_CONTEXT *ccert_context = NULL;
> ++  bool isproxy = SSL_IS_PROXY();
> + #ifdef DEBUGBUILD
> +-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
> ++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
> +     conn->host.name;
> + #endif
> + #ifdef HAS_ALPN
> +@@ -1414,8 +1416,8 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +     struct Curl_schannel_cred *old_cred = NULL;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    incache = !(Curl_ssl_getsessionid(data, conn, (void **)&old_cred, NULL,
> +-                                      sockindex));
> ++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy, (void **)&old_cred,
> ++                                      NULL, sockindex));
> +     if(incache) {
> +       if(old_cred != BACKEND->cred) {
> +         DEBUGF(infof(data,
> +@@ -1426,7 +1428,7 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +       }
> +     }
> +     if(!incache) {
> +-      result = Curl_ssl_addsessionid(data, conn, (void *)BACKEND->cred,
> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, BACKEND->cred,
> +                                      sizeof(struct Curl_schannel_cred),
> +                                      sockindex);
> +       if(result) {
> +diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
> +index 9a8f7de8d..6d1ea7e7b 100644
> +--- a/lib/vtls/sectransp.c
> ++++ b/lib/vtls/sectransp.c
> +@@ -1400,10 +1400,12 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
> +   char * const ssl_cert = SSL_SET_OPTION(primary.clientcert);
> +   const struct curl_blob *ssl_cert_blob = SSL_SET_OPTION(primary.cert_blob);
> + #ifndef CURL_DISABLE_PROXY
> +-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
> ++  bool isproxy = SSL_IS_PROXY();
> ++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
> +     conn->host.name;
> +   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
> + #else
> ++  const isproxy = FALSE;
> +   const char * const hostname = conn->host.name;
> +   const long int port = conn->remote_port;
> + #endif
> +@@ -1613,7 +1615,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
> + #ifdef USE_NGHTTP2
> +       if(data->set.httpversion >= CURL_HTTP_VERSION_2
> + #ifndef CURL_DISABLE_PROXY
> +-         && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
> ++         && (!isproxy || !conn->bits.tunnel_proxy)
> + #endif
> +         ) {
> +         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
> +@@ -1953,7 +1955,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
> +     size_t ssl_sessionid_len;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, (void **)&ssl_sessionid,
> ++    if(!Curl_ssl_getsessionid(data, conn, isproxy, (void **)&ssl_sessionid,
> +                               &ssl_sessionid_len, sockindex)) {
> +       /* we got a session id, use it! */
> +       err = SSLSetPeerID(backend->ssl_ctx, ssl_sessionid, ssl_sessionid_len);
> +@@ -1981,7 +1983,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
> +         return CURLE_SSL_CONNECT_ERROR;
> +       }
> +
> +-      result = Curl_ssl_addsessionid(data, conn, ssl_sessionid,
> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
> +                                      ssl_sessionid_len, sockindex);
> +       Curl_ssl_sessionid_unlock(data);
> +       if(result) {
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index b8ab7494f..8ccc1f2e4 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -367,6 +367,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data)
> +  */
> + bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +                            struct connectdata *conn,
> ++                           const bool isProxy,
> +                            void **ssl_sessionid,
> +                            size_t *idsize, /* set 0 if unknown */
> +                            int sockindex)
> +@@ -377,7 +378,6 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +   bool no_match = TRUE;
> +
> + #ifndef CURL_DISABLE_PROXY
> +-  const bool isProxy = CONNECT_PROXY_SSL();
> +   struct ssl_primary_config * const ssl_config = isProxy ?
> +     &conn->proxy_ssl_config :
> +     &conn->ssl_config;
> +@@ -389,10 +389,15 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +   struct ssl_primary_config * const ssl_config = &conn->ssl_config;
> +   const char * const name = conn->host.name;
> +   int port = conn->remote_port;
> +-  (void)sockindex;
> + #endif
> ++  (void)sockindex;
> +   *ssl_sessionid = NULL;
> +
> ++#ifdef CURL_DISABLE_PROXY
> ++  if(isProxy)
> ++    return TRUE;
> ++#endif
> ++
> +   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
> +
> +   if(!SSL_SET_OPTION(primary.sessionid))
> +@@ -480,6 +485,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
> +  */
> + CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
> +                                struct connectdata *conn,
> ++                               bool isProxy,
> +                                void *ssl_sessionid,
> +                                size_t idsize,
> +                                int sockindex)
> +@@ -492,7 +498,6 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
> +   int conn_to_port;
> +   long *general_age;
> + #ifndef CURL_DISABLE_PROXY
> +-  const bool isProxy = CONNECT_PROXY_SSL();
> +   struct ssl_primary_config * const ssl_config = isProxy ?
> +     &conn->proxy_ssl_config :
> +     &conn->ssl_config;
> +@@ -505,6 +510,7 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
> +   const char *hostname = conn->host.name;
> +   (void)sockindex;
> + #endif
> ++  (void)sockindex;
> +   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
> +
> +   clone_host = strdup(hostname);
> +diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
> +index 9666682ec..4dc29794c 100644
> +--- a/lib/vtls/vtls.h
> ++++ b/lib/vtls/vtls.h
> +@@ -222,6 +222,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
> +  */
> + bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +                            struct connectdata *conn,
> ++                           const bool isproxy,
> +                            void **ssl_sessionid,
> +                            size_t *idsize, /* set 0 if unknown */
> +                            int sockindex);
> +@@ -232,6 +233,7 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +  */
> + CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
> +                                struct connectdata *conn,
> ++                               const bool isProxy,
> +                                void *ssl_sessionid,
> +                                size_t idsize,
> +                                int sockindex);
> +diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
> +index e1fa45926..e4c70877f 100644
> +--- a/lib/vtls/wolfssl.c
> ++++ b/lib/vtls/wolfssl.c
> +@@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
> +     void *ssl_sessionid = NULL;
> +
> +     Curl_ssl_sessionid_lock(data);
> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
> ++    if(!Curl_ssl_getsessionid(data, conn,
> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
> ++                              &ssl_sessionid, NULL, sockindex)) {
> +       /* we got a session id, use it! */
> +       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
> +         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
> +@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
> +     void *old_ssl_sessionid = NULL;
> +
> +     our_ssl_sessionid = SSL_get_session(backend->handle);
> +-
> +-    Curl_ssl_sessionid_lock(data);
> +-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
> +-                                      sockindex));

Hey Trevor,


If my eyes aren't deceiving me, I believe you took out two curly braces:

here:

> +-    if(incache) {
and here:
> +-      if(old_ssl_sessionid != our_ssl_sessionid) {
> +-        infof(data, "old SSL session ID is stale, removing\n");
> +-        Curl_ssl_delsessionid(data, old_ssl_sessionid);
> +-        incache = FALSE;
> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
> ++

Yet you added three,

here:

> ++    if(our_ssl_sessionid) {
> ++      Curl_ssl_sessionid_lock(data);
> ++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
> ++                                        &old_ssl_sessionid, NULL, sockindex));
here
> ++      if(incache) {
and here
> ++        if(old_ssl_sessionid != our_ssl_sessionid) {
> ++            infof(data, "old SSL session ID is stale, removing\n");
> ++            Curl_ssl_delsessionid(data, old_ssl_sessionid);
> ++            incache = FALSE;

That's one extra curly brace for these two closing ones.


This has already been merged (and backported) can you check that?

Cheers,

Alejandro

> +       }
> +     }
> +
> +     if(!incache) {
> +-      result = Curl_ssl_addsessionid(data, conn, our_ssl_sessionid,
> +-                                     0 /* unknown size */, sockindex);
> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
> ++                                     0, sockindex);
> +       if(result) {
> +         Curl_ssl_sessionid_unlock(data);
> +         failf(data, "failed to store ssl session");
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
> index 7666c7b608..428b8cd9e3 100644
> --- a/meta/recipes-support/curl/curl_7.75.0.bb
> +++ b/meta/recipes-support/curl/curl_7.75.0.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
>   
>   SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>              file://0001-replace-krb5-config-with-pkg-config.patch \
> +           file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
>   "
>   
>   SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
>
> 
>

--------------415B3DE65EFC683887679871
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/21 9:09 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">Backport and modify the patch for CVE-2021-22890 from curl 7.76 to make
it apply cleanly on 7.75.

CVE: CVE-2021-22890

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 ...-argument-to-Curl_ssl_get-addsession.patch | 517 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   1 +
 2 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch

diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
new file mode 100644
index 0000000000..a0c7d68f33
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
@@ -0,0 +1,517 @@
+From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+Date: Tue, 1 Jun 2021 09:50:20 -0400
+Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
+ Curl_ssl_get/addsessionid()
+
+To make sure we set and extract the correct session.
+
+Reported-by: Mingtao Yang
+Bug: <a class="moz-txt-link-freetext" href="https://curl.se/docs/CVE-2021-22890.html">https://curl.se/docs/CVE-2021-22890.html</a>
+
+CVE-2021-22890
+
+Upstream-Status: Backport
+(<a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844">https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844</a>)
+
+Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+---
+ lib/vtls/bearssl.c   |  8 +++++--
+ lib/vtls/gtls.c      | 12 ++++++----
+ lib/vtls/mbedtls.c   | 12 ++++++----
+ lib/vtls/mesalink.c  | 14 ++++++++----
+ lib/vtls/openssl.c   | 54 +++++++++++++++++++++++++++++++++-----------
+ lib/vtls/schannel.c  | 10 ++++----
+ lib/vtls/sectransp.c | 10 ++++----
+ lib/vtls/vtls.c      | 12 +++++++---
+ lib/vtls/vtls.h      |  2 ++
+ lib/vtls/wolfssl.c   | 28 +++++++++++++----------
+ 10 files changed, 111 insertions(+), 51 deletions(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 29b08c0e6..0432dfadc 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -375,7 +375,8 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
+     void *session;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;session, NULL, sockindex)) {
+       br_ssl_engine_set_session_parameters(&amp;backend-&gt;ctx.eng, session);
+       infof(data, "BearSSL: re-using session ID\n");
+     }
+@@ -571,10 +572,13 @@ static CURLcode bearssl_connect_step3(struct Curl_easy *data,
+     br_ssl_engine_get_session_parameters(&amp;backend-&gt;ctx.eng, session);
+     Curl_ssl_sessionid_lock(data);
+     incache = !(Curl_ssl_getsessionid(data, conn,
++                                      SSL_IS_PROXY() ? TRUE : FALSE,
+                                       &amp;oldsession, NULL, sockindex));
+     if(incache)
+       Curl_ssl_delsessionid(data, oldsession);
+-    ret = Curl_ssl_addsessionid(data, conn, session, 0, sockindex);
++    ret = Curl_ssl_addsessionid(data, conn,
++                                SSL_IS_PROXY() ? TRUE : FALSE,
++                                session, 0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(ret) {
+       free(session);
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 3ddee1974..28ca528a6 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -733,6 +733,7 @@ gtls_connect_step1(struct Curl_easy *data,
+ 
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               &amp;ssl_sessionid, &amp;ssl_idsize, sockindex)) {
+       /* we got a session id, use it! */
+       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
+@@ -1292,8 +1293,9 @@ gtls_connect_step3(struct Curl_easy *data,
+       gnutls_session_get_data(session, connect_sessionid, &amp;connect_idsize);
+ 
+       Curl_ssl_sessionid_lock(data);
+-      incache = !(Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL,
+-                                        sockindex));
++      incache = !(Curl_ssl_getsessionid(data, conn,
++                                        SSL_IS_PROXY() ? TRUE : FALSE,
++                                        &amp;ssl_sessionid, NULL, sockindex));
+       if(incache) {
+         /* there was one before in the cache, so instead of risking that the
+            previous one was rejected, we just kill that and store the new */
+@@ -1301,8 +1303,10 @@ gtls_connect_step3(struct Curl_easy *data,
+       }
+ 
+       /* store this session id */
+-      result = Curl_ssl_addsessionid(data, conn, connect_sessionid,
+-                                     connect_idsize, sockindex);
++      result = Curl_ssl_addsessionid(data, conn,
++                                     SSL_IS_PROXY() ? TRUE : FALSE,
++                                     connect_sessionid, connect_idsize,
++                                     sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+         free(connect_sessionid);
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index fc3a948d1..bd0e0802e 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -463,7 +463,9 @@ mbed_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *old_session = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;old_session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;old_session, NULL, sockindex)) {
+       ret = mbedtls_ssl_set_session(&amp;backend-&gt;ssl, old_session);
+       if(ret) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -724,6 +726,7 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     int ret;
+     mbedtls_ssl_session *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
+     if(!our_ssl_sessionid)
+@@ -742,11 +745,12 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+ 
+     /* If there's already a matching session in the cache, delete it */
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL, sockindex))
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, &amp;old_ssl_sessionid, NULL,
++                              sockindex))
+       Curl_ssl_delsessionid(data, old_ssl_sessionid);
+ 
+-    retcode = Curl_ssl_addsessionid(data, conn,
+-                                    our_ssl_sessionid, 0, sockindex);
++    retcode = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                    0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(retcode) {
+       mbedtls_ssl_session_free(our_ssl_sessionid);
+diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
+index b6d1005ec..ad807d3ba 100644
+--- a/lib/vtls/mesalink.c
++++ b/lib/vtls/mesalink.c
+@@ -261,7 +261,9 @@ mesalink_connect_step1(struct Curl_easy *data,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND-&gt;handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -345,13 +347,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     bool incache;
+     SSL_SESSION *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = SSL_get_session(BACKEND-&gt;handle);
+ 
+     Curl_ssl_sessionid_lock(data);
+     incache =
+-      !(Curl_ssl_getsessionid(data, conn,
+-                              &amp;old_ssl_sessionid, NULL, sockindex));
++      !(Curl_ssl_getsessionid(data, conn, isproxy, &amp;old_ssl_sessionid, NULL,
++                              sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != our_ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -361,8 +364,9 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(
+-        data, conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
++      result =
++        Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid, 0,
++                              sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, "failed to store ssl session");
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 784d9f70e..8304264d3 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -391,12 +391,23 @@ static int ossl_get_ssl_conn_index(void)
+  */
+ static int ossl_get_ssl_sockindex_index(void)
+ {
+-  static int ssl_ex_data_sockindex_index = -1;
+-  if(ssl_ex_data_sockindex_index &lt; 0) {
+-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
+-        NULL);
++  static int sockindex_index = -1;
++  if(sockindex_index &lt; 0) {
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
++  if(proxy_index &lt; 0) {
++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
++  }
++  return proxy_index;
+ }
+ 
+ static int passwd_callback(char *buf, int num, int encrypting,
+@@ -1172,7 +1183,7 @@ static int ossl_init(void)
+ 
+   /* Initialize the extra data indexes */
+   if(ossl_get_ssl_data_index() &lt; 0 || ossl_get_ssl_conn_index() &lt; 0 ||
+-     ossl_get_ssl_sockindex_index() &lt; 0)
++     ossl_get_ssl_sockindex_index() &lt; 0 || ossl_get_proxy_index() &lt; 0)
+     return 0;
+ 
+   return 1;
+@@ -2455,8 +2466,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   int data_idx = ossl_get_ssl_data_index();
+   int connectdata_idx = ossl_get_ssl_conn_index();
+   int sockindex_idx = ossl_get_ssl_sockindex_index();
++  int proxy_idx = ossl_get_proxy_index();
++  bool isproxy;
+ 
+-  if(data_idx &lt; 0 || connectdata_idx &lt; 0 || sockindex_idx &lt; 0)
++  if(data_idx &lt; 0 || connectdata_idx &lt; 0 || sockindex_idx &lt; 0 || proxy_idx &lt; 0)
+     return 0;
+ 
+   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
+@@ -2469,13 +2482,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
+   sockindex = (int)(sockindex_ptr - conn-&gt;sock);
+ 
++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
++
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     bool incache;
+     void *old_ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL,
+-                                      sockindex));
++    if(isproxy)
++      incache = FALSE;
++    else
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &amp;old_ssl_sessionid, NULL, sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -2485,8 +2503,8 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+     }
+ 
+     if(!incache) {
+-      if(!Curl_ssl_addsessionid(data, conn, ssl_sessionid,
+-                                      0 /* unknown size */, sockindex)) {
++      if(!Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
++                                0 /* unknown size */, sockindex)) {
+         /* the session has been put into the session cache */
+         res = 1;
+       }
+@@ -3212,17 +3230,27 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
+     int data_idx = ossl_get_ssl_data_index();
+     int connectdata_idx = ossl_get_ssl_conn_index();
+     int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
+ 
+-    if(data_idx &gt;= 0 &amp;&amp; connectdata_idx &gt;= 0 &amp;&amp; sockindex_idx &gt;= 0) {
++    if(data_idx &gt;= 0 &amp;&amp; connectdata_idx &gt;= 0 &amp;&amp; sockindex_idx &gt;= 0 &amp;&amp;
++       proxy_idx &gt;= 0) {
+       /* Store the data needed for the "new session" callback.
+        * The sockindex is stored as a pointer to an array element. */
+       SSL_set_ex_data(backend-&gt;handle, data_idx, data);
+       SSL_set_ex_data(backend-&gt;handle, connectdata_idx, conn);
+       SSL_set_ex_data(backend-&gt;handle, sockindex_idx, conn-&gt;sock + sockindex);
++#ifndef CURL_DISABLE_PROXY
++      SSL_set_ex_data(backend-&gt;handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
++                      NULL);
++#else
++      SSL_set_ex_data(backend-&gt;handle, proxy_idx, NULL);
++#endif
++
+     }
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend-&gt;handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 0668f98f2..bd27ba0bf 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -496,6 +496,7 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               (void **)&amp;old_cred, NULL, sockindex)) {
+       BACKEND-&gt;cred = old_cred;
+       DEBUGF(infof(data, "schannel: re-using existing credential handle\n"));
+@@ -1337,8 +1338,9 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+   struct ssl_connect_data *connssl = &amp;conn-&gt;ssl[sockindex];
+   SECURITY_STATUS sspi_status = SEC_E_OK;
+   CERT_CONTEXT *ccert_context = NULL;
++  bool isproxy = SSL_IS_PROXY();
+ #ifdef DEBUGBUILD
+-  const char * const hostname = SSL_IS_PROXY() ? conn-&gt;http_proxy.host.name :
++  const char * const hostname = isproxy ? conn-&gt;http_proxy.host.name :
+     conn-&gt;host.name;
+ #endif
+ #ifdef HAS_ALPN
+@@ -1414,8 +1416,8 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     struct Curl_schannel_cred *old_cred = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, (void **)&amp;old_cred, NULL,
+-                                      sockindex));
++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy, (void **)&amp;old_cred,
++                                      NULL, sockindex));
+     if(incache) {
+       if(old_cred != BACKEND-&gt;cred) {
+         DEBUGF(infof(data,
+@@ -1426,7 +1428,7 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+       }
+     }
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, (void *)BACKEND-&gt;cred,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, BACKEND-&gt;cred,
+                                      sizeof(struct Curl_schannel_cred),
+                                      sockindex);
+       if(result) {
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 9a8f7de8d..6d1ea7e7b 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -1400,10 +1400,12 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+   char * const ssl_cert = SSL_SET_OPTION(primary.clientcert);
+   const struct curl_blob *ssl_cert_blob = SSL_SET_OPTION(primary.cert_blob);
+ #ifndef CURL_DISABLE_PROXY
+-  const char * const hostname = SSL_IS_PROXY() ? conn-&gt;http_proxy.host.name :
++  bool isproxy = SSL_IS_PROXY();
++  const char * const hostname = isproxy ? conn-&gt;http_proxy.host.name :
+     conn-&gt;host.name;
+   const long int port = SSL_IS_PROXY() ? conn-&gt;port : conn-&gt;remote_port;
+ #else
++  const isproxy = FALSE;
+   const char * const hostname = conn-&gt;host.name;
+   const long int port = conn-&gt;remote_port;
+ #endif
+@@ -1613,7 +1615,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+ #ifdef USE_NGHTTP2
+       if(data-&gt;set.httpversion &gt;= CURL_HTTP_VERSION_2
+ #ifndef CURL_DISABLE_PROXY
+-         &amp;&amp; (!SSL_IS_PROXY() || !conn-&gt;bits.tunnel_proxy)
++         &amp;&amp; (!isproxy || !conn-&gt;bits.tunnel_proxy)
+ #endif
+         ) {
+         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
+@@ -1953,7 +1955,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+     size_t ssl_sessionid_len;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, (void **)&amp;ssl_sessionid,
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, (void **)&amp;ssl_sessionid,
+                               &amp;ssl_sessionid_len, sockindex)) {
+       /* we got a session id, use it! */
+       err = SSLSetPeerID(backend-&gt;ssl_ctx, ssl_sessionid, ssl_sessionid_len);
+@@ -1981,7 +1983,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+         return CURLE_SSL_CONNECT_ERROR;
+       }
+ 
+-      result = Curl_ssl_addsessionid(data, conn, ssl_sessionid,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
+                                      ssl_sessionid_len, sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index b8ab7494f..8ccc1f2e4 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -367,6 +367,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data)
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex)
+@@ -377,7 +378,6 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   bool no_match = TRUE;
+ 
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &amp;conn-&gt;proxy_ssl_config :
+     &amp;conn-&gt;ssl_config;
+@@ -389,10 +389,15 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   struct ssl_primary_config * const ssl_config = &amp;conn-&gt;ssl_config;
+   const char * const name = conn-&gt;host.name;
+   int port = conn-&gt;remote_port;
+-  (void)sockindex;
+ #endif
++  (void)sockindex;
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
+@@ -480,6 +485,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+@@ -492,7 +498,6 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   int conn_to_port;
+   long *general_age;
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &amp;conn-&gt;proxy_ssl_config :
+     &amp;conn-&gt;ssl_config;
+@@ -505,6 +510,7 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   const char *hostname = conn-&gt;host.name;
+   (void)sockindex;
+ #endif
++  (void)sockindex;
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   clone_host = strdup(hostname);
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index 9666682ec..4dc29794c 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -222,6 +222,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isproxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
+@@ -232,6 +233,7 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex);
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index e1fa45926..e4c70877f 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend-&gt;handle, ssl_sessionid)) {
+         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
+@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     void *old_ssl_sessionid = NULL;
+ 
+     our_ssl_sessionid = SSL_get_session(backend-&gt;handle);
+-
+-    Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL,
+-                                      sockindex));</pre>
    </blockquote>
    <p>Hey Trevor,</p>
    <p><br>
    </p>
    <p>If my eyes aren't deceiving me, I believe you took out two curly
      braces:<br>
    </p>
    <p>here:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+-    if(incache) {</pre>
    </blockquote>
    and here:<br>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+-      if(old_ssl_sessionid != our_ssl_sessionid) {
+-        infof(data, "old SSL session ID is stale, removing\n");
+-        Curl_ssl_delsessionid(data, old_ssl_sessionid);
+-        incache = FALSE;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
++</pre>
    </blockquote>
    <p>Yet you added three,</p>
    <p>here:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
++    if(our_ssl_sessionid) {
++      Curl_ssl_sessionid_lock(data);
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &amp;old_ssl_sessionid, NULL, sockindex));</pre>
    </blockquote>
    here<br>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
++      if(incache) {</pre>
    </blockquote>
    and here<br>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
++        if(old_ssl_sessionid != our_ssl_sessionid) {
++            infof(data, "old SSL session ID is stale, removing\n");
++            Curl_ssl_delsessionid(data, old_ssl_sessionid);
++            incache = FALSE;</pre>
    </blockquote>
    <p>That's one extra curly brace for these two closing ones.</p>
    <p><br>
    </p>
    <p>This has already been merged (and backported) can you check that?</p>
    <p>Cheers,<br>
    </p>
    <p>Alejandro<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+       }
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, our_ssl_sessionid,
+-                                     0 /* unknown size */, sockindex);
++      result = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                     0, sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, "failed to store ssl session");
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 7666c7b608..428b8cd9e3 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b">"file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"</a>
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://curl.haxx.se/download/curl-${PV}.tar.bz2\file://0001-replace-krb5-config-with-pkg-config.patch\+file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch\">"https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
 "</a>
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------415B3DE65EFC683887679871--
