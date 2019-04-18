Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 42B267C7A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:22:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,412,1549900800"; d="scan'208";a="61112039"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Apr 2019 11:22:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C0CD4CD8122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:22:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 30 Apr 2019 11:22:18 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Apr 2019 11:17:29 +0800
Message-ID: <1555557449-1879-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 3C0CD4CD8122.AE264
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] icu: Added armeb support.
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
X-List-Received-Date: Tue, 30 Apr 2019 03:22:16 -0000
Content-Type: text/plain

Make icu support arm32 BE.

Upstream-Status: Pending

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../icu/icu/0001-Make-icu-support-arm-BE.patch     | 28 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_64.2.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch

diff --git a/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch b/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch
new file mode 100644
index 0000000..019d09e
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch
@@ -0,0 +1,28 @@
+From 8fa6cbf2d3de73bdca5e65f6523e4cce334aeee7 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 14 Dec 2018 16:07:31 +0900
+Subject: [PATCH] Make icu support arm BE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ i18n/double-conversion-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index 0bd3e83..9288e28 100644
+--- a/i18n/double-conversion-utils.h
++++ b/i18n/double-conversion-utils.h
+@@ -77,7 +77,7 @@ inline void abort_noreturn() { abort(); }
+ // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
+ // ICU PATCH: Enable ARM32 & ARM64 builds for Windows with 'defined(_M_ARM) || defined(_M_ARM64)'.
+ #if defined(_M_X64) || defined(__x86_64__) || \
+-    defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
++    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_64.2.bb
index bbc76d6..2e38a3f 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch \
+           file://0001-Make-icu-support-arm-BE.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.7.4




