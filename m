Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5DE7017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:38:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2016 01:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="1018384688"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2016 01:38:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E2E446A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 01:37:54 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 11:39:32 +0300
Message-Id: <1471855173-19517-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1471855173-19517-1-git-send-email-maxin.john@intel.com>
References: <1471855173-19517-1-git-send-email-maxin.john@intel.com>
Subject: [jethro][PATCH 2/3] curl: security fix for CVE-2016-5420
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 08:38:12 -0000

Affected versions: libcurl 7.1 to and including 7.50.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/curl/curl/CVE-2016-5420.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.44.0.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-5420.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-5420.patch b/meta/recipes-support/curl/curl/CVE-2016-5420.patch
new file mode 100644
index 0000000..6bfacd7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-5420.patch
@@ -0,0 +1,31 @@
+From 11ec5ad4352bba384404c56e77c7fab9382fd22d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 31 Jul 2016 00:51:48 +0200
+Subject: [PATCH] TLS: only reuse connections with the same client cert
+
+Bug: https://curl.haxx.se/docs/adv_20160803B.html
+
+Upstream-Status: Backport
+https://curl.haxx.se/CVE-2016-5420.patch
+
+CVE: CVE-2016-5420
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ lib/vtls/vtls.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 33e209d..3863777 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -99,6 +99,7 @@ Curl_ssl_config_matches(struct ssl_config_data* data,
+      (data->verifyhost == needle->verifyhost) &&
+      safe_strequal(data->CApath, needle->CApath) &&
+      safe_strequal(data->CAfile, needle->CAfile) &&
++     safe_strequal(data->clientcert, needle->clientcert) &&
+      safe_strequal(data->random_file, needle->random_file) &&
+      safe_strequal(data->egdsocket, needle->egdsocket) &&
+      safe_strequal(data->cipher_list, needle->cipher_list))
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index dcd63aa..917bd27 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 # from mucking around with debug options
 #
 SRC_URI += " file://configure_ac.patch \
+             file://CVE-2016-5420.patch \
              file://CVE-2016-5419.patch \
              file://CVE-2016-0754.patch \
              file://CVE-2016-0755.patch"
-- 
2.4.0


