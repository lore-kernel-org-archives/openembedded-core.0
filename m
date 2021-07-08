Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.7186.1625714945271517736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 20:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209252757"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="209252757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 20:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="487387292"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2021 20:29:00 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH][hardknott] curl: Fix CVE-2021-22898
Date: Thu,  8 Jul 2021 11:29:00 +0800
Message-Id: <20210708032900.3548-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-22898

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../curl/curl/CVE-2021-22898.patch            | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22898.patch b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
new file mode 100644
index 0000000000..29a4f818f3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
@@ -0,0 +1,33 @@
+From 39ce47f219b09c380b81f89fe54ac586c8db6bde Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Fri, 7 May 2021 13:09:57 +0200
+Subject: [PATCH] telnet: check sscanf() for correct number of matches
+
+CVE-2021-22898
+
+Bug: https://curl.se/docs/CVE-2021-22898.html
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586c8db6bde]
+
+CVE: CVE-2021-22898
+
+Signed-off-by: Harry Sintonen <sintonen@iki.fi>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ lib/telnet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 26e0658ba9cc..fdd137fb0c04 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -922,7 +922,7 @@ static void suboption(struct Curl_easy *data)
+         size_t tmplen = (strlen(v->data) + 1);
+         /* Add the variable only if it fits */
+         if(len + tmplen < (int)sizeof(temp)-6) {
+-          if(sscanf(v->data, "%127[^,],%127s", varname, varval)) {
++          if(sscanf(v->data, "%127[^,],%127s", varname, varval) == 2) {
+             msnprintf((char *)&temp[len], sizeof(temp) - len,
+                       "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
+                       CURL_NEW_ENV_VALUE, varval);
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 7c7b363ae3..c905659967 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
            file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
+           file://CVE-2021-22898.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.32.0

