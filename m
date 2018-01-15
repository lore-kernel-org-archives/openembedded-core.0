Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 74A5F65D35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=xzi7YCAsvknOPZqlSYibthynzwobKBw7IzTZHa1GssA=; 
	b=FnCnxV+W1XQrs0ReX8JBdOaWws7VYK8O4uIwHtioYBRmURBTG/PKTV/ERHQGFUhgTLChwz7FDjCBZUb8Xj1k62hv9F/VzzNRkWOXqaTa29A+93RaDFVCwwcrkcV2IsKGvc2vC8jT89mfd188u7pYzrBQkg70uJcJBLeOeso2RGPGwutGwEbpohg+O8WfL9sXutU1Mk16m3WawGVNPMOvqubQ/82XxP/W7uwmMyoQ4Aq6qHRsKwDb8ZmJ/WzaZqF8wvztOuSa7aOy7iLp1sd16FQ+OLCQnggRlc9m3aLJbzM2VwiUdFZ75dH6b8oxbo725leO4wdxW7y+JHWR3E0f7Q==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ebAyi-0002U4-Ko for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 21:03:32 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2018 21:02:55 +0100
Message-Id: <20180115200255.7926-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180111040858.22280-1-clopez@igalia.com>
References: <20180111040858.22280-1-clopez@igalia.com>
Subject: [PATCH v2] tune-i686: Add new tune for better support of 686-class CPUs.
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
X-List-Received-Date: Mon, 15 Jan 2018 20:03:32 -0000

There isn't currently any tune available for i686 x86 optimizations.
The tune for i586 doesn't enable i686 specific optimizations, and the
one for core2 enables things that won't work on a i686 CPU (like SSE3).

Make the tune for core2 inherits from this one and move there the
setting of X86ARCH32.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/conf/machine/include/tune-core2.inc |  7 ++-----
 meta/conf/machine/include/tune-i686.inc  | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-i686.inc

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index f4ba43fbfd..6a03466650 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -8,11 +8,8 @@
 #
 DEFAULTTUNE ?= "core2-32"
 
-# Set x86 target arch to i686, so that glibc enables SSE optimised memcpy, etc.
-X86ARCH32 ?= "i686"
-
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
-require conf/machine/include/tune-i586.inc
+require conf/machine/include/tune-i686.inc
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
@@ -23,7 +20,7 @@ AVAILTUNES += "core2-32"
 TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
 BASE_LIB_tune-core2-32 = "lib"
 TUNE_PKGARCH_tune-core2-32 = "core2-32"
-PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i586} core2-32"
+PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686} core2-32"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
diff --git a/meta/conf/machine/include/tune-i686.inc b/meta/conf/machine/include/tune-i686.inc
new file mode 100644
index 0000000000..bdb4799209
--- /dev/null
+++ b/meta/conf/machine/include/tune-i686.inc
@@ -0,0 +1,27 @@
+#
+# The i686 CPU family was introduced with the Intel Pentium Pro in 1995.
+# It has as required feature flags: fpu tsc cx8 cmov.
+#
+# It is the minimum CPU required by the Debian i386 port.
+# https://lists.debian.org/debian-devel-announce/2016/05/msg00001.html
+#
+#
+
+DEFAULTTUNE ?= "i686"
+
+# Set x86 target arch to i686, so that glibc enables SSE optimised memcpy, etc.
+X86ARCH32 ?= "i686"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/tune-i586.inc
+
+# Extra tune features
+TUNEVALID[i686] = "Enable i686 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i686', ' -march=i686', '', d)}"
+
+# Extra tune selections
+AVAILTUNES += "i686"
+TUNE_FEATURES_tune-i686 = "${TUNE_FEATURES_tune-x86} i686"
+BASE_LIB_tune-i686 = "lib"
+TUNE_PKGARCH_tune-i686 = "i686"
+PACKAGE_EXTRA_ARCHS_tune-i686 = "${PACKAGE_EXTRA_ARCHS_tune-i586} i686"
-- 
2.11.0


