Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.4632.1628050040412713453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 21:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17447HGS012890
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 3 Aug 2021 21:07:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17447GIZ018360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Aug 2021 21:07:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 3 Aug 2021 21:07:16 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 3 Aug 2021 21:07:15 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] curl: fix CVES
Date: Wed, 4 Aug 2021 12:04:48 +0800
Message-ID: <20210804040448.24659-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix below CVEs:
CVE-2021-22901
CVE-2021-22924
CVE-2021-22926

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2021-22901.patch            | 453 ++++++++++++++++++
 .../curl/curl/CVE-2021-22924.patch            | 298 ++++++++++++
 .../curl/curl/CVE-2021-22926.patch            |  79 +++
 meta/recipes-support/curl/curl_7.75.0.bb      |   3 +
 4 files changed, 833 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22901.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22926.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22901.patch b/meta/recipes-support/curl/curl/CVE-2021-22901.patch
new file mode 100644
index 0000000000..c5775c6306
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22901.patch
@@ -0,0 +1,453 @@
+From a801ebdc2b1c008fa72c31f1bf7773d99e6e2a2d Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Tue, 3 Aug 2021 08:41:45 +0000
+Subject: [PATCH] openssl: associate/detach the transfer from connection
+
+CVE-2021-22901
+
+Bug: https://curl.se/docs/CVE-2021-22901.html
+
+CVE: CVE-2021-22901
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7f4a9a9b2a49547eae24d2e19bc5c346e9026479]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/multi.c          |   5 +-
+ lib/vtls/gskit.c     |   4 +-
+ lib/vtls/gtls.c      |   4 +-
+ lib/vtls/mbedtls.c   |   4 +-
+ lib/vtls/mesalink.c  |   4 +-
+ lib/vtls/nss.c       |   4 +-
+ lib/vtls/openssl.c   | 146 +++++++++++++++++++++++++++++++------------
+ lib/vtls/schannel.c  |   6 +-
+ lib/vtls/sectransp.c |   4 +-
+ lib/vtls/vtls.c      |  23 ++++++-
+ lib/vtls/vtls.h      |  12 ++++
+ lib/vtls/wolfssl.c   |   4 +-
+ 12 files changed, 170 insertions(+), 50 deletions(-)
+
+diff --git a/lib/multi.c b/lib/multi.c
+index 85707a1..a4ff9ac 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -875,8 +875,10 @@ bool Curl_multiplex_wanted(const struct Curl_multi *multi)
+ void Curl_detach_connnection(struct Curl_easy *data)
+ {
+   struct connectdata *conn = data->conn;
+-  if(conn)
++  if(conn) {
+     Curl_llist_remove(&conn->easyq, &data->conn_queue, NULL);
++    Curl_ssl_detach_conn(data, conn);
++  }
+   data->conn = NULL;
+ }
+ 
+@@ -893,6 +895,7 @@ void Curl_attach_connnection(struct Curl_easy *data,
+   data->conn = conn;
+   Curl_llist_insert_next(&conn->easyq, conn->easyq.tail, data,
+                          &data->conn_queue);
++  Curl_ssl_associate_conn(data, conn);
+ }
+ 
+ static int waitconnect_getsock(struct connectdata *conn,
+diff --git a/lib/vtls/gskit.c b/lib/vtls/gskit.c
+index 9b5f649..bd9c602 100644
+--- a/lib/vtls/gskit.c
++++ b/lib/vtls/gskit.c
+@@ -1282,7 +1282,9 @@ const struct Curl_ssl Curl_ssl_gskit = {
+   Curl_none_set_engine_default,   /* set_engine_default */
+   Curl_none_engines_list,         /* engines_list */
+   Curl_none_false_start,          /* false_start */
+-  NULL                            /* sha256sum */
++  NULL,                           /* sha256sum */
++  NULL,                           /* associate_connection */
++  NULL                            /* disassociate_connection */
+ };
+ 
+ #endif /* USE_GSKIT */
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 28ca528..24e036b 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -1683,7 +1683,9 @@ const struct Curl_ssl Curl_ssl_gnutls = {
+   Curl_none_set_engine_default,  /* set_engine_default */
+   Curl_none_engines_list,        /* engines_list */
+   Curl_none_false_start,         /* false_start */
+-  gtls_sha256sum                 /* sha256sum */
++  gtls_sha256sum,                /* sha256sum */
++  NULL,                          /* associate_connection */
++  NULL                           /* disassociate_connection */
+ };
+ 
+ #endif /* USE_GNUTLS */
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index bd0e080..fc973c7 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -1112,7 +1112,9 @@ const struct Curl_ssl Curl_ssl_mbedtls = {
+   Curl_none_set_engine_default,     /* set_engine_default */
+   Curl_none_engines_list,           /* engines_list */
+   Curl_none_false_start,            /* false_start */
+-  mbedtls_sha256sum                 /* sha256sum */
++  mbedtls_sha256sumi,               /* sha256sum */
++  NULL,                             /* associate_connection */
++  NULL                              /* disassociate_connection */
+ };
+ 
+ #endif /* USE_MBEDTLS */
+diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
+index ad807d3..8a91487 100644
+--- a/lib/vtls/mesalink.c
++++ b/lib/vtls/mesalink.c
+@@ -666,7 +666,9 @@ const struct Curl_ssl Curl_ssl_mesalink = {
+   Curl_none_set_engine_default,  /* set_engine_default */
+   Curl_none_engines_list,        /* engines_list */
+   Curl_none_false_start,         /* false_start */
+-  NULL                           /* sha256sum */
++  NULL,                          /* sha256sum */
++  NULL,                          /* associate_connection */
++  NULL                           /* disassociate_connection */
+ };
+ 
+ #endif
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index e5ab71c..fb9f763 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -2444,7 +2444,9 @@ const struct Curl_ssl Curl_ssl_nss = {
+   Curl_none_set_engine_default, /* set_engine_default */
+   Curl_none_engines_list,       /* engines_list */
+   nss_false_start,              /* false_start */
+-  nss_sha256sum                 /* sha256sum */
++  nss_sha256sum,                /* sha256sum */
++  NULL,                         /* associate_connection */
++  NULL                          /* disassociate_connection */
+ };
+ 
+ #endif /* USE_NSS */
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 8304264..946b4c5 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -244,6 +244,10 @@ struct ssl_backend_data {
+ #endif
+ };
+ 
++static void ossl_associate_connection(struct Curl_easy *data,
++                                      struct connectdata *conn,
++                                      int sockindex);
++
+ /*
+  * Number of bytes to read from the random number seed file. This must be
+  * a finite value (because some entropy "files" like /dev/urandom have
+@@ -2527,6 +2531,7 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
+   curl_socket_t sockfd = conn->sock[sockindex];
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   ctx_option_t ctx_options = 0;
++  void *ssl_sessionid = NULL;
+ 
+ #ifdef SSL_CTRL_SET_TLSEXT_HOSTNAME
+   bool sni;
+@@ -3224,46 +3229,23 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
+   }
+ #endif
+ 
+-  /* Check if there's a cached ID we can/should use here! */
+-  if(SSL_SET_OPTION(primary.sessionid)) {
+-    void *ssl_sessionid = NULL;
+-    int data_idx = ossl_get_ssl_data_index();
+-    int connectdata_idx = ossl_get_ssl_conn_index();
+-    int sockindex_idx = ossl_get_ssl_sockindex_index();
+-    int proxy_idx = ossl_get_proxy_index();
+-
+-    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
+-       proxy_idx >= 0) {
+-      /* Store the data needed for the "new session" callback.
+-       * The sockindex is stored as a pointer to an array element. */
+-      SSL_set_ex_data(backend->handle, data_idx, data);
+-      SSL_set_ex_data(backend->handle, connectdata_idx, conn);
+-      SSL_set_ex_data(backend->handle, sockindex_idx, conn->sock + sockindex);
+-#ifndef CURL_DISABLE_PROXY
+-      SSL_set_ex_data(backend->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
+-                      NULL);
+-#else
+-      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
+-#endif
+-
+-    }
++  ossl_associate_connection(data, conn, sockindex);
+ 
+-    Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
+-                              &ssl_sessionid, NULL, sockindex)) {
+-      /* we got a session id, use it! */
+-      if(!SSL_set_session(backend->handle, ssl_sessionid)) {
+-        Curl_ssl_sessionid_unlock(data);
+-        failf(data, "SSL: SSL_set_session failed: %s",
+-              ossl_strerror(ERR_get_error(), error_buffer,
+-                            sizeof(error_buffer)));
+-        return CURLE_SSL_CONNECT_ERROR;
+-      }
+-      /* Informational message */
+-      infof(data, "SSL re-using session ID\n");
++  Curl_ssl_sessionid_lock(data);
++  if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                            &ssl_sessionid, NULL, sockindex)) {
++    /* we got a session id, use it! */
++    if(!SSL_set_session(backend->handle, ssl_sessionid)) {
++      Curl_ssl_sessionid_unlock(data);
++      failf(data, "SSL: SSL_set_session failed: %s",
++            ossl_strerror(ERR_get_error(), error_buffer,
++                          sizeof(error_buffer)));
++      return CURLE_SSL_CONNECT_ERROR;
+     }
+-    Curl_ssl_sessionid_unlock(data);
++     /* Informational message */
++    infof(data, "SSL re-using session ID\n");
+   }
++  Curl_ssl_sessionid_unlock(data);
+ 
+ #ifndef CURL_DISABLE_PROXY
+   if(conn->proxy_ssl[sockindex].use) {
+@@ -4481,6 +4463,90 @@ static void *ossl_get_internals(struct ssl_connect_data *connssl,
+          (void *)backend->ctx : (void *)backend->handle;
+ }
+ 
++static void ossl_associate_connection(struct Curl_easy *data,
++                                      struct connectdata *conn,
++                                      int sockindex)
++{
++  struct ssl_connect_data *connssl = &conn->ssl[sockindex];
++  struct ssl_backend_data *backend = connssl->backend;
++
++  /* If we don't have SSL context, do nothing. */
++  if(!backend->handle)
++    return;
++
++  if(SSL_SET_OPTION(primary.sessionid)) {
++    int data_idx = ossl_get_ssl_data_index();
++    int connectdata_idx = ossl_get_ssl_conn_index();
++    int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
++
++    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
++       proxy_idx >= 0) {
++      /* Store the data needed for the "new session" callback.
++       * The sockindex is stored as a pointer to an array element. */
++      SSL_set_ex_data(backend->handle, data_idx, data);
++      SSL_set_ex_data(backend->handle, connectdata_idx, conn);
++      SSL_set_ex_data(backend->handle, sockindex_idx, conn->sock + sockindex);
++#ifndef CURL_DISABLE_PROXY
++      SSL_set_ex_data(backend->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
++                      NULL);
++#else
++      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
++#endif
++    }
++  }
++}
++
++/*
++ * Starting with TLS 1.3, the ossl_new_session_cb callback gets called after
++ * the handshake. If the transfer that sets up the callback gets killed before
++ * this callback arrives, we must make sure to properly clear the data to
++ * avoid UAF problems. A future optimization could be to instead store another
++ * transfer that might still be using the same connection.
++ */
++
++static void ossl_disassociate_connection(struct Curl_easy *data,
++                                         int sockindex)
++{
++  struct connectdata *conn = data->conn;
++  struct ssl_connect_data *connssl = &conn->ssl[sockindex];
++  struct ssl_backend_data *backend = connssl->backend;
++
++  /* If we don't have SSL context, do nothing. */
++  if(!backend->handle)
++    return;
++
++  if(SSL_SET_OPTION(primary.sessionid)) {
++    bool isproxy = FALSE;
++    bool incache;
++    void *old_ssl_sessionid = NULL;
++    int data_idx = ossl_get_ssl_data_index();
++    int connectdata_idx = ossl_get_ssl_conn_index();
++    int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
++
++    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
++       proxy_idx >= 0) {
++      /* Invalidate the session cache entry, if any */
++      isproxy = SSL_get_ex_data(backend->handle, proxy_idx) ? TRUE : FALSE;
++
++      /* Disable references to data in "new session" callback to avoid
++       * accessing a stale pointer. */
++      SSL_set_ex_data(backend->handle, data_idx, NULL);
++      SSL_set_ex_data(backend->handle, connectdata_idx, NULL);
++      SSL_set_ex_data(backend->handle, sockindex_idx, NULL);
++      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
++    }
++
++    Curl_ssl_sessionid_lock(data);
++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                      &old_ssl_sessionid, NULL, sockindex));
++    if(incache)
++      Curl_ssl_delsessionid(data, old_ssl_sessionid);
++    Curl_ssl_sessionid_unlock(data);
++  }
++}
++
+ const struct Curl_ssl Curl_ssl_openssl = {
+   { CURLSSLBACKEND_OPENSSL, "openssl" }, /* info */
+ 
+@@ -4514,10 +4580,12 @@ const struct Curl_ssl Curl_ssl_openssl = {
+   ossl_engines_list,        /* engines_list */
+   Curl_none_false_start,    /* false_start */
+ #if (OPENSSL_VERSION_NUMBER >= 0x0090800fL) && !defined(OPENSSL_NO_SHA256)
+-  ossl_sha256sum            /* sha256sum */
++  ossl_sha256sum,           /* sha256sum */
+ #else
+-  NULL                      /* sha256sum */
++  NULL,                     /* sha256sum */
+ #endif
++  ossl_associate_connection, /* associate_connection */
++  ossl_disassociate_connection /* disassociate_connection */
+ };
+ 
+ #endif /* USE_OPENSSL */
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 670310d..596106a 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -325,7 +325,7 @@ get_alg_id_by_name(char *name)
+ 
+ static CURLcode
+ set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers,
+-                int *algIds)
++                ALG_ID *algIds)
+ {
+   char *startCur = ciphers;
+   int algCount = 0;
+@@ -2429,7 +2429,9 @@ const struct Curl_ssl Curl_ssl_schannel = {
+   Curl_none_set_engine_default,      /* set_engine_default */
+   Curl_none_engines_list,            /* engines_list */
+   Curl_none_false_start,             /* false_start */
+-  schannel_sha256sum                 /* sha256sum */
++  schannel_sha256sum,                /* sha256sum */
++  NULL,                              /* associate_connection */
++  NULL                               /* disassociate_connection */
+ };
+ 
+ #endif /* USE_SCHANNEL */
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 6d1ea7e..37b41f8 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -3311,7 +3311,9 @@ const struct Curl_ssl Curl_ssl_sectransp = {
+   Curl_none_set_engine_default,       /* set_engine_default */
+   Curl_none_engines_list,             /* engines_list */
+   sectransp_false_start,              /* false_start */
+-  sectransp_sha256sum                 /* sha256sum */
++  sectransp_sha256sum,                /* sha256sum */
++  NULL,                               /* associate_connection */
++  NULL                                /* disassociate_connection */
+ };
+ 
+ #ifdef __clang__
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 00b6268..59a7efb 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -579,6 +579,25 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   return CURLE_OK;
+ }
+ 
++void Curl_ssl_associate_conn(struct Curl_easy *data,
++                             struct connectdata *conn)
++{
++  if(Curl_ssl->associate_connection) {
++    Curl_ssl->associate_connection(data, conn, FIRSTSOCKET);
++    if(conn->sock[SECONDARYSOCKET] && conn->bits.sock_accepted)
++      Curl_ssl->associate_connection(data, conn, SECONDARYSOCKET);
++  }
++}
++
++void Curl_ssl_detach_conn(struct Curl_easy *data,
++                          struct connectdata *conn)
++{
++  if(Curl_ssl->disassociate_connection) {
++    Curl_ssl->disassociate_connection(data, FIRSTSOCKET);
++    if(conn->sock[SECONDARYSOCKET] && conn->bits.sock_accepted)
++      Curl_ssl->disassociate_connection(data, SECONDARYSOCKET);
++  }
++}
+ 
+ void Curl_ssl_close_all(struct Curl_easy *data)
+ {
+@@ -1212,7 +1231,9 @@ static const struct Curl_ssl Curl_ssl_multi = {
+   Curl_none_set_engine_default,      /* set_engine_default */
+   Curl_none_engines_list,            /* engines_list */
+   Curl_none_false_start,             /* false_start */
+-  NULL                               /* sha256sum */
++  NULL,                              /* sha256sum */
++  NULL,                              /* associate_connection */
++  NULL                               /* disassociate_connection */
+ };
+ 
+ const struct Curl_ssl *Curl_ssl =
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index 1351215..94049f9 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -75,6 +75,11 @@ struct Curl_ssl {
+   bool (*false_start)(void);
+   CURLcode (*sha256sum)(const unsigned char *input, size_t inputlen,
+                     unsigned char *sha256sum, size_t sha256sumlen);
++  
++  void (*associate_connection)(struct Curl_easy *data,
++                               struct connectdata *conn,
++                               int sockindex);
++  void (*disassociate_connection)(struct Curl_easy *data, int sockindex);
+ };
+ 
+ #ifdef USE_SSL
+@@ -264,6 +269,11 @@ bool Curl_ssl_cert_status_request(void);
+ 
+ bool Curl_ssl_false_start(void);
+ 
++void Curl_ssl_associate_conn(struct Curl_easy *data,
++                             struct connectdata *conn);
++void Curl_ssl_detach_conn(struct Curl_easy *data,
++                          struct connectdata *conn);
++
+ #define SSL_SHUTDOWN_TIMEOUT 10000 /* ms */
+ 
+ #else /* if not USE_SSL */
+@@ -290,6 +300,8 @@ bool Curl_ssl_false_start(void);
+ #define Curl_ssl_cert_status_request() FALSE
+ #define Curl_ssl_false_start() FALSE
+ #define Curl_ssl_tls13_ciphersuites() FALSE
++#define Curl_ssl_associate_conn(a,b) Curl_nop_stmt
++#define Curl_ssl_detach_conn(a,b) Curl_nop_stmt
+ #endif
+ 
+ #endif /* HEADER_CURL_VTLS_H */
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index f1b12b1..f734a84 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -1165,7 +1165,9 @@ const struct Curl_ssl Curl_ssl_wolfssl = {
+   Curl_none_set_engine_default,    /* set_engine_default */
+   Curl_none_engines_list,          /* engines_list */
+   Curl_none_false_start,           /* false_start */
+-  wolfssl_sha256sum                /* sha256sum */
++  wolfssl_sha256sum,               /* sha256sum */
++  NULL,                            /* associate_connection */
++  NULL                             /* disassociate_connection */
+ };
+ 
+ #endif
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22924.patch b/meta/recipes-support/curl/curl/CVE-2021-22924.patch
new file mode 100644
index 0000000000..f09704c8a9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22924.patch
@@ -0,0 +1,298 @@
+From 205cf19fc374ee8eb848c5448e31fa703392832e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 4 Aug 2021 01:52:40 +0000
+Subject: [PATCH] vtls: fix connection reuse checks for issuer cert and case
+ sensitivity
+
+CVE-2021-22924
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2021-22924.html
+
+CVE: CVE-2021-22924
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5ea3145850ebff1dc2b13d17440300a01ca38161]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/url.c          | 10 ++++++----
+ lib/urldata.h      |  6 ++++--
+ lib/vtls/gtls.c    | 10 +++++-----
+ lib/vtls/nss.c     |  4 ++--
+ lib/vtls/openssl.c | 18 +++++++++---------
+ lib/vtls/vtls.c    | 26 +++++++++++++++++++++-----
+ 6 files changed, 47 insertions(+), 27 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index c02d2c2..474c53b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3695,6 +3695,8 @@ static CURLcode create_conn(struct Curl_easy *data,
+   */
+   data->set.ssl.primary.CApath = data->set.str[STRING_SSL_CAPATH_ORIG];
+   data->set.ssl.primary.CAfile = data->set.str[STRING_SSL_CAFILE_ORIG];
++  data->set.ssl.primary.issuercert = data->set.str[STRING_SSL_ISSUERCERT];
++  data->set.ssl.primary.issuercert_blob = data->set.blobs[BLOB_SSL_ISSUERCERT];
+   data->set.ssl.primary.random_file = data->set.str[STRING_SSL_RANDOM_FILE];
+   data->set.ssl.primary.egdsocket = data->set.str[STRING_SSL_EGDSOCKET];
+   data->set.ssl.primary.cipher_list =
+@@ -3719,8 +3721,11 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.proxy_ssl.primary.pinned_key =
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY];
+   data->set.proxy_ssl.primary.cert_blob = data->set.blobs[BLOB_CERT_PROXY];
++  data->set.proxy_ssl.primary.issuercert =
++    data->set.str[STRING_SSL_ISSUERCERT_PROXY];
++  data->set.proxy_ssl.primary.issuercert_blob =
++    data->set.blobs[BLOB_SSL_ISSUERCERT_PROXY];
+   data->set.proxy_ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_PROXY];
+-  data->set.proxy_ssl.issuercert = data->set.str[STRING_SSL_ISSUERCERT_PROXY];
+   data->set.proxy_ssl.cert_type = data->set.str[STRING_CERT_TYPE_PROXY];
+   data->set.proxy_ssl.key = data->set.str[STRING_KEY_PROXY];
+   data->set.proxy_ssl.key_type = data->set.str[STRING_KEY_TYPE_PROXY];
+@@ -3729,7 +3734,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.proxy_ssl.key_blob = data->set.blobs[BLOB_KEY_PROXY];
+ #endif
+   data->set.ssl.CRLfile = data->set.str[STRING_SSL_CRLFILE_ORIG];
+-  data->set.ssl.issuercert = data->set.str[STRING_SSL_ISSUERCERT_ORIG];
+   data->set.ssl.cert_type = data->set.str[STRING_CERT_TYPE_ORIG];
+   data->set.ssl.key = data->set.str[STRING_KEY_ORIG];
+   data->set.ssl.key_type = data->set.str[STRING_KEY_TYPE_ORIG];
+@@ -3743,9 +3747,7 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.proxy_ssl.password = data->set.str[STRING_TLSAUTH_PASSWORD_PROXY];
+ #endif
+ #endif
+-
+   data->set.ssl.key_blob = data->set.blobs[BLOB_KEY_ORIG];
+-  data->set.ssl.issuercert_blob = data->set.blobs[BLOB_SSL_ISSUERCERT_ORIG];
+ 
+   if(!Curl_clone_primary_ssl_config(&data->set.ssl.primary,
+                                     &conn->ssl_config)) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index f7d60b2..7d01874 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -246,6 +246,7 @@ struct ssl_primary_config {
+   long version_max;      /* max supported version the client wants to use*/
+   char *CApath;          /* certificate dir (doesn't work on windows) */
+   char *CAfile;          /* certificate to verify peer against */
++  char *issuercert;      /* optional issuer certificate filename */
+   char *clientcert;
+   char *random_file;     /* path to file containing "random" data */
+   char *egdsocket;       /* path to file containing the EGD daemon socket */
+@@ -253,6 +254,7 @@ struct ssl_primary_config {
+   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
+   char *pinned_key;
+   struct curl_blob *cert_blob;
++  struct curl_blob *issuercert_blob;
+   char *curves;          /* list of curves to use */
+   BIT(verifypeer);       /* set TRUE if this is desired */
+   BIT(verifyhost);       /* set TRUE if CN/SAN must match hostname */
+@@ -264,8 +266,6 @@ struct ssl_config_data {
+   struct ssl_primary_config primary;
+   long certverifyresult; /* result from the certificate verification */
+   char *CRLfile;   /* CRL to check certificate revocation */
+-  char *issuercert;/* optional issuer certificate filename */
+-  struct curl_blob *issuercert_blob;
+   curl_ssl_ctx_callback fsslctx; /* function to initialize ssl ctx */
+   void *fsslctxp;        /* parameter for call back */
+   char *cert_type; /* format for certificate (default: PEM)*/
+@@ -1545,6 +1545,7 @@ enum dupstring {
+   STRING_SSL_CRLFILE_ORIG, /* crl file to check certificate */
+   STRING_SSL_CRLFILE_PROXY, /* crl file to check certificate */
+   STRING_SSL_ISSUERCERT_ORIG, /* issuer cert file to check certificate */
++  STRING_SSL_ISSUERCERT, /* issuer cert file to check certificate */
+   STRING_SSL_ISSUERCERT_PROXY, /* issuer cert file to check certificate */
+   STRING_SSL_ENGINE,      /* name of ssl engine */
+   STRING_USERNAME,        /* <username>, if used */
+@@ -1600,6 +1601,7 @@ enum dupblob {
+   BLOB_CERT_PROXY,
+   BLOB_KEY_ORIG,
+   BLOB_KEY_PROXY,
++  BLOB_SSL_ISSUERCERT,
+   BLOB_SSL_ISSUERCERT_ORIG,
+   BLOB_SSL_ISSUERCERT_PROXY,
+   BLOB_LAST
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 2c65ba0..d1c3919 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -855,7 +855,7 @@ gtls_connect_step3(struct Curl_easy *data,
+   if(!chainp) {
+     if(SSL_CONN_CONFIG(verifypeer) ||
+        SSL_CONN_CONFIG(verifyhost) ||
+-       SSL_SET_OPTION(issuercert)) {
++       SSL_CONN_CONFIG(issuercert)) {
+ #ifdef HAVE_GNUTLS_SRP
+       if(SSL_SET_OPTION(authtype) == CURL_TLSAUTH_SRP
+          && SSL_SET_OPTION(username) != NULL
+@@ -1039,21 +1039,21 @@ gtls_connect_step3(struct Curl_easy *data,
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
+   size = sizeof(certname);
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index fb9f763..dab12b6 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -2159,9 +2159,9 @@ static CURLcode nss_do_connect(struct Curl_easy *data,
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
+       ret = check_issuer_cert(backend->handle, nickname);
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 946b4c5..85e1ee5 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -3881,10 +3881,10 @@ static CURLcode servercert(struct Curl_easy *data,
+        deallocating the certificate. */
+ 
+     /* e.g. match issuer name with provided issuer certificate */
+-    if(SSL_SET_OPTION(issuercert) || SSL_SET_OPTION(issuercert_blob)) {
+-      if(SSL_SET_OPTION(issuercert_blob))
+-        fp = BIO_new_mem_buf(SSL_SET_OPTION(issuercert_blob)->data,
+-                             (int)SSL_SET_OPTION(issuercert_blob)->len);
++    if(SSL_CONN_CONFIG(issuercert) || SSL_CONN_CONFIG(issuercert_blob)) {
++      if(SSL_CONN_CONFIG(issuercert_blob))
++        fp = BIO_new_mem_buf(SSL_CONN_CONFIG(issuercert_blob)->data,
++                             (int)SSL_CONN_CONFIG(issuercert_blob)->len);
+       else {
+         fp = BIO_new(BIO_s_file());
+         if(fp == NULL) {
+@@ -3898,10 +3898,10 @@ static CURLcode servercert(struct Curl_easy *data,
+           return CURLE_OUT_OF_MEMORY;
+         }
+ 
+-        if(BIO_read_filename(fp, SSL_SET_OPTION(issuercert)) <= 0) {
++        if(BIO_read_filename(fp, SSL_CONN_CONFIG(issuercert)) <= 0) {
+           if(strict)
+             failf(data, "SSL: Unable to open issuer cert (%s)",
+-                  SSL_SET_OPTION(issuercert));
++                  SSL_CONN_CONFIG(issuercert));
+           BIO_free(fp);
+           X509_free(backend->server_cert);
+           backend->server_cert = NULL;
+@@ -3913,7 +3913,7 @@ static CURLcode servercert(struct Curl_easy *data,
+       if(!issuer) {
+         if(strict)
+           failf(data, "SSL: Unable to read issuer cert (%s)",
+-                SSL_SET_OPTION(issuercert));
++                SSL_CONN_CONFIG(issuercert));
+         BIO_free(fp);
+         X509_free(issuer);
+         X509_free(backend->server_cert);
+@@ -3924,7 +3924,7 @@ static CURLcode servercert(struct Curl_easy *data,
+       if(X509_check_issued(issuer, backend->server_cert) != X509_V_OK) {
+         if(strict)
+           failf(data, "SSL: Certificate issuer check failed (%s)",
+-                SSL_SET_OPTION(issuercert));
++                SSL_CONN_CONFIG(issuercert));
+         BIO_free(fp);
+         X509_free(issuer);
+         X509_free(backend->server_cert);
+@@ -3933,7 +3933,7 @@ static CURLcode servercert(struct Curl_easy *data,
+       }
+ 
+       infof(data, " SSL certificate issuer check ok (%s)\n",
+-            SSL_SET_OPTION(issuercert));
++            SSL_CONN_CONFIG(issuercert));
+       BIO_free(fp);
+       X509_free(issuer);
+     }
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 59a7efb..eb885da 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -125,6 +125,16 @@ static bool blobcmp(struct curl_blob *first, struct curl_blob *second)
+   return !memcmp(first->data, second->data, first->len); /* same data */
+ }
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
+ Curl_ssl_config_matches(struct ssl_primary_config *data,
+                         struct ssl_primary_config *needle)
+@@ -135,11 +145,13 @@ Curl_ssl_config_matches(struct ssl_primary_config *data,
+      (data->verifyhost == needle->verifyhost) &&
+      (data->verifystatus == needle->verifystatus) &&
+      blobcmp(data->cert_blob, needle->cert_blob) &&
+-     Curl_safe_strcasecompare(data->CApath, needle->CApath) &&
+-     Curl_safe_strcasecompare(data->CAfile, needle->CAfile) &&
+-     Curl_safe_strcasecompare(data->clientcert, needle->clientcert) &&
+-     Curl_safe_strcasecompare(data->random_file, needle->random_file) &&
+-     Curl_safe_strcasecompare(data->egdsocket, needle->egdsocket) &&
++     blobcmp(data->issuercert_blob, needle->issuercert_blob) &&
++     safecmp(data->CApath, needle->CApath) &&
++     safecmp(data->CAfile, needle->CAfile) &&
++     safecmp(data->issuercert, needle->issuercert) &&
++     safecmp(data->clientcert, needle->clientcert) &&
++     safecmp(data->random_file, needle->random_file) &&
++     safecmp(data->egdsocket, needle->egdsocket) &&
+      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &&
+      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list13) &&
+      Curl_safe_strcasecompare(data->curves, needle->curves) &&
+@@ -161,8 +173,10 @@ Curl_clone_primary_ssl_config(struct ssl_primary_config *source,
+   dest->sessionid = source->sessionid;
+ 
+   CLONE_BLOB(cert_blob);
++  CLONE_BLOB(issuercert_blob);
+   CLONE_STRING(CApath);
+   CLONE_STRING(CAfile);
++  CLONE_STRING(issuercert);
+   CLONE_STRING(clientcert);
+   CLONE_STRING(random_file);
+   CLONE_STRING(egdsocket);
+@@ -178,6 +192,7 @@ void Curl_free_primary_ssl_config(struct ssl_primary_config *sslc)
+ {
+   Curl_safefree(sslc->CApath);
+   Curl_safefree(sslc->CAfile);
++  Curl_safefree(sslc->issuercert);
+   Curl_safefree(sslc->clientcert);
+   Curl_safefree(sslc->random_file);
+   Curl_safefree(sslc->egdsocket);
+@@ -185,6 +200,7 @@ void Curl_free_primary_ssl_config(struct ssl_primary_config *sslc)
+   Curl_safefree(sslc->cipher_list13);
+   Curl_safefree(sslc->pinned_key);
+   Curl_safefree(sslc->cert_blob);
++  Curl_safefree(sslc->issuercert_blob);
+   Curl_safefree(sslc->curves);
+ }
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22926.patch b/meta/recipes-support/curl/curl/CVE-2021-22926.patch
new file mode 100644
index 0000000000..3a803bcc98
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22926.patch
@@ -0,0 +1,79 @@
+From 6180ef7c19defa9f77ae166acb8b63ed98a9c09a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 4 Aug 2021 03:05:45 +0000
+Subject: [PATCH] sectransp: check for client certs by name first, then file
+
+CVE-2021-22926
+
+Bug: https://curl.se/docs/CVE-2021-22926.html
+
+Assisted-by: Daniel Gustafsson
+Reported-by: Harry Sintonen
+
+CVE: CVE-2021-22926
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/fd9b40bf8dfd43edcbc0d254d613d95a11061c05]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/vtls/sectransp.c | 33 +++++++++++++++++++--------------
+ 1 file changed, 19 insertions(+), 14 deletions(-)
+
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 37b41f8..f8effde 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -32,6 +32,7 @@
+ #include "curl_base64.h"
+ #include "strtok.h"
+ #include "multiif.h"
++#include "strcase.h"
+ 
+ #ifdef USE_SECTRANSP
+ 
+@@ -1648,24 +1649,28 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+     bool is_cert_file = (!is_cert_data) && is_file(ssl_cert);
+     SecIdentityRef cert_and_key = NULL;
+ 
+-    /* User wants to authenticate with a client cert. Look for it:
+-       If we detect that this is a file on disk, then let's load it.
+-       Otherwise, assume that the user wants to use an identity loaded
+-       from the Keychain. */
+-    if(is_cert_file || is_cert_data) {
++    /* User wants to authenticate with a client cert. Look for it. Assume that
++       the user wants to use an identity loaded from the Keychain. If not, try
++       it as a file on disk */
++
++    if(!is_cert_data)
++      err = CopyIdentityWithLabel(ssl_cert, &cert_and_key);
++    else
++      err = !noErr;
++    if((err != noErr) && (is_cert_file || is_cert_data)) {
+       if(!SSL_SET_OPTION(cert_type))
+-        infof(data, "WARNING: SSL: Certificate type not set, assuming "
+-                    "PKCS#12 format.\n");
+-      else if(strncmp(SSL_SET_OPTION(cert_type), "P12",
+-        strlen(SSL_SET_OPTION(cert_type))) != 0)
+-        infof(data, "WARNING: SSL: The Security framework only supports "
+-                    "loading identities that are in PKCS#12 format.\n");
++        infof(data, "SSL: Certificate type not set, assuming "
++              "PKCS#12 format.");
++      else if(!strcasecompare(SSL_SET_OPTION(cert_type), "P12")) {
++        failf(data, "SSL: The Security framework only supports "
++              "loading identities that are in PKCS#12 format.");
++        return CURLE_SSL_CERTPROBLEM;
++      }
+ 
+       err = CopyIdentityFromPKCS12File(ssl_cert, ssl_cert_blob,
+-        SSL_SET_OPTION(key_passwd), &cert_and_key);
++                                       SSL_SET_OPTION(key_passwd),
++                                       &cert_and_key);
+     }
+-    else
+-      err = CopyIdentityWithLabel(ssl_cert, &cert_and_key);
+ 
+     if(err == noErr && cert_and_key) {
+       SecCertificateRef cert = NULL;
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index b2aad0bbc2..d64e5e1f79 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2021-22898.patch \
            file://CVE-2021-22897.patch \
            file://CVE-2021-22925.patch \
+           file://CVE-2021-22901.patch \
+           file://CVE-2021-22924.patch \
+           file://CVE-2021-22926.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.17.1

