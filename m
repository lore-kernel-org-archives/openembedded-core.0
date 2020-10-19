Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.12746.1603112401054954403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 06:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: zTpsTaHvy7p3166gL8oUtAsoWYY57YCSE4C8v/mf+A75UmMvMS9e52UNic344dAbcPcwbvPng4
 oNX3dtxvO/rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="184632579"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="184632579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 05:59:59 -0700
IronPort-SDR: m5VUBhJtFEhymj3OVNnfmR/kZTEWrw5CYNqxFHt09TSNfF1MFNxI6AB1YGl4f8krmZ8NEw1Ovl
 fg9zna8nbYqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="301360982"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2020 05:59:58 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] libproxy: fix CVE-2020-25219
Date: Mon, 19 Oct 2020 20:59:55 +0800
Message-Id: <20201019125957.70874-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libproxy/libproxy/CVE-2020-25219.patch    | 61 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch

diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
new file mode 100644
index 0000000000..3ef7f85451
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
@@ -0,0 +1,61 @@
+From a83dae404feac517695c23ff43ce1e116e2bfbe0 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Wed, 9 Sep 2020 11:12:02 -0500
+Subject: [PATCH] Rewrite url::recvline to be nonrecursive
+
+This function processes network input. It's semi-trusted, because the
+PAC ought to be trusted. But we still shouldn't allow it to control how
+far we recurse. A malicious PAC can cause us to overflow the stack by
+sending a sufficiently-long line without any '\n' character.
+
+Also, this function failed to properly handle EINTR, so let's fix that
+too, for good measure.
+
+Fixes #134
+
+Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/836c10b60c65e947ff1e10eb02fbcc676d909ffa]
+CVE: CVE-2020-25219
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libproxy/url.cpp | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/libproxy/url.cpp b/libproxy/url.cpp
+index ee776b2..68d69cd 100644
+--- a/libproxy/url.cpp
++++ b/libproxy/url.cpp
+@@ -388,16 +388,24 @@ string url::to_string() const {
+ 	return m_orig;
+ }
+ 
+-static inline string recvline(int fd) {
+-	// Read a character.
+-	// If we don't get a character, return empty string.
+-	// If we are at the end of the line, return empty string.
+-	char c = '\0';
+-	
+-	if (recv(fd, &c, 1, 0) != 1 || c == '\n')
+-		return "";
+-
+-	return string(1, c) + recvline(fd);
++static string recvline(int fd) {
++	string line;
++	int ret;
++
++	// Reserve arbitrary amount of space to avoid small memory reallocations.
++	line.reserve(128);
++
++	do {
++		char c;
++		ret = recv(fd, &c, 1, 0);
++		if (ret == 1) {
++			if (c == '\n')
++				return line;
++			line += c;
++		}
++	} while (ret == 1 || (ret == -1 && errno == EINTR));
++
++	return line;
+ }
+ 
+ char* url::get_pac() {
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 19dddebd44..a14c358cc2 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -10,6 +10,7 @@ DEPENDS = "glib-2.0"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
+           file://CVE-2020-25219.patch \
           "
 SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
 SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
-- 
2.17.1

