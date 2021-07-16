Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494672"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494672"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075553"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/28] curl: Fix CVE-2021-22898
Date: Fri, 16 Jul 2021 10:42:19 +0800
Message-Id: <4d703dd86c6b27790e1e34d3127652657243d20d.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-22898

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/CVE-2021-22898.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22898.patch b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
new file mode 100644
index 0000000000..1a9cd7289e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
@@ -0,0 +1,32 @@
+From 39ce47f219b09c380b81f89fe54ac586c8db6bde Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Fri, 7 May 2021 13:09:57 +0200
+Subject: [PATCH] telnet: check sscanf() for correct number of matches
+
+CVE-2021-22898
+
+Bug: https://curl.se/docs/CVE-2021-22898.html
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586c8db6bde]
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
index f7a8202bc9..433037f564 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
            file://vtls-fix-addsessionid.patch \
            file://vtls-fix-warning.patch \
+           file://CVE-2021-22898.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

