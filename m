Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.7292.1625715446607075309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 20:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189116291"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="189116291"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 20:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="449790012"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 07 Jul 2021 20:37:12 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH][hardknott] curl: Fix CVE-2021-22897
Date: Thu,  8 Jul 2021 11:37:12 +0800
Message-Id: <20210708033712.41975-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-22897

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../curl/curl/CVE-2021-22897.patch            | 72 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22897.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22897.patch b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
new file mode 100644
index 0000000000..fcd11b7674
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
@@ -0,0 +1,72 @@
+From bbb71507b7bab52002f9b1e0880bed6a32834511 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 23 Apr 2021 10:54:10 +0200
+Subject: [PATCH] schannel: don't use static to store selected ciphers
+
+CVE-2021-22897
+
+Bug: https://curl.se/docs/CVE-2021-22897.html
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/bbb71507b7bab52002f9b1e0880bed6a32834511]
+
+CVE: CVE-2021-22897
+
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ lib/vtls/schannel.c | 9 +++++----
+ lib/vtls/schannel.h | 3 +++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 8c25ac5dd5a5..dba7072273a9 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -328,12 +328,12 @@ get_alg_id_by_name(char *name)
+ }
+ 
+ static CURLcode
+-set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers)
++set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers,
++                int *algIds)
+ {
+   char *startCur = ciphers;
+   int algCount = 0;
+-  static ALG_ID algIds[45]; /*There are 45 listed in the MS headers*/
+-  while(startCur && (0 != *startCur) && (algCount < 45)) {
++  while(startCur && (0 != *startCur) && (algCount < NUMOF_CIPHERS)) {
+     long alg = strtol(startCur, 0, 0);
+     if(!alg)
+       alg = get_alg_id_by_name(startCur);
+@@ -593,7 +593,8 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     }
+ 
+     if(SSL_CONN_CONFIG(cipher_list)) {
+-      result = set_ssl_ciphers(&schannel_cred, SSL_CONN_CONFIG(cipher_list));
++      result = set_ssl_ciphers(&schannel_cred, SSL_CONN_CONFIG(cipher_list),
++                               BACKEND->algIds);
+       if(CURLE_OK != result) {
+         failf(data, "Unable to set ciphers to passed via SSL_CONN_CONFIG");
+         return result;
+diff --git a/lib/vtls/schannel.h b/lib/vtls/schannel.h
+index 2952caa1a5a1..77853aa30f96 100644
+--- a/lib/vtls/schannel.h
++++ b/lib/vtls/schannel.h
+@@ -71,6 +71,8 @@ CURLcode Curl_verify_certificate(struct Curl_easy *data,
+ #endif
+ #endif
+ 
++#define NUMOF_CIPHERS 45 /* There are 45 listed in the MS headers */
++
+ struct Curl_schannel_cred {
+   CredHandle cred_handle;
+   TimeStamp time_stamp;
+@@ -102,6 +104,7 @@ struct ssl_backend_data {
+ #ifdef HAS_MANUAL_VERIFY_API
+   bool use_manual_cred_validation; /* true if manual cred validation is used */
+ #endif
++  ALG_ID algIds[NUMOF_CIPHERS];
+ };
+ #endif /* EXPOSE_SCHANNEL_INTERNAL_STRUCTS */
+ 
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index c905659967..10ef559281 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
            file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
            file://CVE-2021-22898.patch \
+           file://CVE-2021-22897.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.32.0

