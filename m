Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.4310.1624520576807967681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 00:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: F19s9FzIGs9Wqk0vYuXpT/aIPFhML0BakETCOE48XKjTQyuyahBc/VcVmjVFrjQ4/L9GL3LlxQ
 m0eP0c/Dea6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207357341"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="207357341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 00:42:56 -0700
IronPort-SDR: RBWMmUJg4Iy56+eyUWvDbKZtc+uZyQmrxUTsVsLLcp7tpVUAlwz0IHVgzEhxORygKwevFJfHAf
 J4HEZOWaxXDA==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="487657363"
Received: from seng-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.180.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 00:42:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sander.visser.2@consultant.volvo.com
Subject: [hardknott][PATCH] curl: fix build when proxy is not enabled in PACKAGECONFIG
Date: Thu, 24 Jun 2021 15:42:43 +0800
Message-Id: <20210624074243.163441-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport upstream patches to fix issues introduced by a backported CVE
patch. Fixes:

| ../../curl-7.75.0/lib/vtls/vtls.c: In function ‘Curl_ssl_addsessionid’:
| ../../curl-7.75.0/lib/vtls/vtls.c:508:14: error: ‘isProxy’ redeclared as different kind of symbol
|   508 |   const bool isProxy = FALSE;
|       |              ^~~~~~~
| ../../curl-7.75.0/lib/vtls/vtls.c:488:37: note: previous definition of ‘isProxy’ with type ‘_Bool’
|   488 |                                bool isProxy,
|       |                                     ^

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/vtls-fix-addsessionid.patch     | 31 ++++++++++++++
 .../curl/curl/vtls-fix-warning.patch          | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-warning.patch

diff --git a/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch b/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
new file mode 100644
index 0000000000..a4b9cb8931
--- /dev/null
+++ b/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
@@ -0,0 +1,31 @@
+From 2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf24 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Mar 2021 12:50:57 +0200
+Subject: [PATCH] vtls: fix addsessionid for non-proxy builds
+
+Follow-up to b09c8ee15771c61
+Fixes #6812
+Closes #6811
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf24]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ lib/vtls/vtls.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 95fd6356285f..2e07df0a0462 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -504,11 +504,8 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   const char *hostname = isProxy ? conn->http_proxy.host.name :
+     conn->host.name;
+ #else
+-  /* proxy support disabled */
+-  const bool isProxy = FALSE;
+   struct ssl_primary_config * const ssl_config = &conn->ssl_config;
+   const char *hostname = conn->host.name;
+-  (void)sockindex;
+ #endif
+   (void)sockindex;
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
diff --git a/meta/recipes-support/curl/curl/vtls-fix-warning.patch b/meta/recipes-support/curl/curl/vtls-fix-warning.patch
new file mode 100644
index 0000000000..113b6fd116
--- /dev/null
+++ b/meta/recipes-support/curl/curl/vtls-fix-warning.patch
@@ -0,0 +1,40 @@
+From b31d9ccfc2da288900e6857ad8d048c612328cac Mon Sep 17 00:00:00 2001
+From: Jay Satiro <raysatiro@yahoo.com>
+Date: Sun, 20 Jun 2021 16:42:58 -0400
+Subject: [PATCH] vtls: fix warning due to function prototype mismatch
+
+b09c8ee changed the function prototype. Caught by Visual Studio.
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b31d9ccfc2da288900e6857ad8d048c612328cac]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ lib/vtls/vtls.c | 2 +-
+ lib/vtls/vtls.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 82883c9c55e2..fe43703bf8b8 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -497,7 +497,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
+-                               bool isProxy,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index a0585c9cec4c..f1a9b8033ae5 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -247,7 +247,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
+-                           const bool isproxy,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 7c7b363ae3..f7a8202bc9 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
            file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
+           file://vtls-fix-addsessionid.patch \
+           file://vtls-fix-warning.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

