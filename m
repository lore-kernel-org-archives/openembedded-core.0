Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494678"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075556"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/28] curl: Fix CVE-2021-22897
Date: Fri, 16 Jul 2021 10:42:20 +0800
Message-Id: <718d6ca70b99fa4bef4c88114c1bd511b6df121e.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-22897

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index 433037f564..42be2eb0b5 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://vtls-fix-addsessionid.patch \
            file://vtls-fix-warning.patch \
            file://CVE-2021-22898.patch \
+           file://CVE-2021-22897.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

