Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A5122782F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:43:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 27 Jul 2017 07:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="112612763"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 27 Jul 2017 07:43:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:40:46 +0300
Message-Id: <20170727144046.13124-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCHv2] libcap: fix build with gperf 3.1
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
X-List-Received-Date: Thu, 27 Jul 2017 14:43:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../files/0001-Fix-build-with-gperf-3.1.patch      | 41 ++++++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.25.bb         |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch

diff --git a/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
new file mode 100644
index 00000000000..110ef902da2
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
@@ -0,0 +1,41 @@
+From a05eba68c42222f02465d7ba376015926433c531 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Jul 2017 13:37:49 +0300
+Subject: [PATCH] Fix build with gperf 3.1
+
+The generated gperf file refers to size_t which needs to be
+provided by stddef.h include. Also, adjust the makefile
+to match the declaration in the gperf file.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ libcap/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index d189777..1a57206 100644
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
+@@ -41,7 +41,7 @@ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
+ 
+ $(GPERF_OUTPUT): cap_names.list.h
+-	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, unsigned int);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
++	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, register size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
+ 
+ cap_names.list.h: Makefile $(KERNEL_HEADERS)/linux/capability.h
+ 	@echo "=> making $@ from $(KERNEL_HEADERS)/linux/capability.h"
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


