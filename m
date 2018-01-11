Return-Path: <clopez@igalia.com>
X-Greylist: delayed 1635 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 04:36:24 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 84A2677D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 04:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=IdF0XKIpRmLNIVvIS5l0D4CPjMBAHjUZpNRJkgdw0DA=; 
	b=Z++bHLrLP8zlw6d9yYg1djkedeKP/9AUEpGH9nT8xjM14uJPaIN+m1M0TnPZal2KXa0y8w/Orey1KmsO1Ll862tpPBEPRJcwtN2h0t1uwsbdTtxWlmw1brDTHk6bkqI2WxDlz5goFVFT413IJTEKOUHHlh+Xw9O/6Ri/xzK6v896mF4+aEqGXoKwM9+HDXO1xPTBjX7KXKTL4Tl2Tp0MhvXVp6S8YHVqAr0hqJ6k1lKTANR5QSL6N5HEQ12hHg/OmeODNnZhfvwl4AtxPLs6JjY4bOHMVPMjq8Q73K1N26DWpHmOj7jCQ/b7xOuMYqiPPFZoHOkmsVH/5dh+dGMRzA==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1eZUAv-00062U-UE for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:09:10 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 05:08:58 +0100
Message-Id: <20180111040858.22280-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tune-i686: Add new tune for better support of 686-class CPUs.
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
X-List-Received-Date: Thu, 11 Jan 2018 04:36:24 -0000

There isn't currently any tune available for i686 x86 optimizations.
The tune for i586 doesn't enable i686 specific optimizations, and the
one for core2 enables things that won't work on a i686 CPU (like SSE3).

This patch also changes the default tune for the qemux86 machine from
i586 to i686. This should cause no issue, as "runqemu qemux86" already
defaults to run with "-cpu pentium2".

The tune for core2 now inherits from this one, which allows to remove
the override on the X86ARCH32 definition.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/conf/machine/include/tune-core2.inc |  7 ++-----
 meta/conf/machine/include/tune-i686.inc  | 25 +++++++++++++++++++++++++
 meta/conf/machine/qemux86.conf           |  2 +-
 3 files changed, 28 insertions(+), 6 deletions(-)
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
index 0000000000..c2bb534874
--- /dev/null
+++ b/meta/conf/machine/include/tune-i686.inc
@@ -0,0 +1,25 @@
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
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c53f7a92ce..f01cbeeb35 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-i586.inc
+require conf/machine/include/tune-i686.inc
 require conf/machine/include/qemuboot-x86.inc
 
 KERNEL_IMAGETYPE = "bzImage"
-- 
2.11.0


