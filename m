Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 415DA7821A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 10:43:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 03:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="882975522"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2017 03:43:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 13:41:03 +0300
Message-Id: <20170726104103.13050-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170726104103.13050-1-alexander.kanavin@linux.intel.com>
References: <20170726104103.13050-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] libcap: fix build with gperf 3.1
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
X-List-Received-Date: Wed, 26 Jul 2017 10:43:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../files/0001-Fix-build-with-gperf-3.1.patch      | 30 ++++++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.25.bb         |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch

diff --git a/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
new file mode 100644
index 00000000000..ae03cf74223
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
@@ -0,0 +1,30 @@
+From 2b350b270bd6a5cf0c89414cd16e51d8dec5c874 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Jul 2017 13:37:49 +0300
+Subject: [PATCH] Fix build with gperf 3.1
+
+The generated gperf file refers to size_t which needs to be
+provided by stddef.h include.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libcap/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index d189777..32c5a69 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc
+ 
+ ifeq ($(BUILD_GPERF),yes)
+ USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
+-INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
++INCLUDE_GPERF_OUTPUT = -include stddef.h -include $(GPERF_OUTPUT)
+ endif
+ 
+ libcap.pc: libcap.pc.in
+-- 
+2.13.2
+
diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 5c2765f343a..d619a2eb4cc 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -9,7 +9,8 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
-"
+           file://0001-Fix-build-with-gperf-3.1.patch \
+           "
 SRC_URI[md5sum] = "6666b839e5d46c2ad33fc8aa2ceb5f77"
 SRC_URI[sha256sum] = "693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162"
 
-- 
2.13.2


