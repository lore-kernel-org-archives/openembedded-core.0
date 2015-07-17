Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E16B73E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:04:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H34dvw019769
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:04:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 16 Jul 2015 20:04:39 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2015 10:58:32 +0800
Message-ID: <1437101912-15318-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] kexec-tools: disable the GCC's stack protection for purgatory code
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
X-List-Received-Date: Fri, 17 Jul 2015 03:04:44 -0000
Content-Type: text/plain

From: Kevin Hao <kexin.hao@windriver.com>

If the GCC's stack protection is enabled by default, the purgatory will
also be built with this option. But it makes no sense to enable this
for the purgatory code, and would cause error when we are trying to
relocate the purgatory codes because symbol like __stack_chk_fail is
unresolved. Instead of disabling this for some archs specifically,
disable it for all the archs.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...urgatory-Disabling-GCC-s-stack-protection.patch | 64 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb     |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch
new file mode 100644
index 0000000..74a8387
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch
@@ -0,0 +1,64 @@
+From 8227f5a583ad4523059ba2531263e625ac01cd40 Mon Sep 17 00:00:00 2001
+From: Kevin Hao <kexin.hao@windriver.com>
+Date: Tue, 28 Apr 2015 20:25:12 +0800
+Subject: [PATCH] purgatory: Disabling GCC's stack protection
+
+If the GCC's stack protection is enabled by default, the purgatory will
+also be built with this option. But it makes no sense to enable this
+for the purgatory code, and would cause error when we are trying to
+relocate the purgatory codes because symbol like __stack_chk_fail is
+unresolved. Instead of disabling this for some archs specifically,
+disable it for all the archs.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ purgatory/Makefile            | 3 ++-
+ purgatory/arch/ppc64/Makefile | 2 +-
+ purgatory/arch/s390/Makefile  | 1 -
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/purgatory/Makefile b/purgatory/Makefile
+index 1945702..a25b262 100644
+--- a/purgatory/Makefile
++++ b/purgatory/Makefile
+@@ -47,7 +47,8 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
+ $(PURGATORY): CC=$(TARGET_CC)
+ $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
+ 		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+-		      -Os -fno-builtin -ffreestanding
++		      -Os -fno-builtin -ffreestanding \
++		      -fno-stack-protector
+ 
+ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+ 			-I$(srcdir)/purgatory/include \
+diff --git a/purgatory/arch/ppc64/Makefile b/purgatory/arch/ppc64/Makefile
+index 6c58fa2..8ca2719 100644
+--- a/purgatory/arch/ppc64/Makefile
++++ b/purgatory/arch/ppc64/Makefile
+@@ -9,7 +9,7 @@ ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/console-ppc64.c
+ ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/crashdump_backup.c
+ ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/misc.S
+ 
+-ppc64_PURGATORY_EXTRA_CFLAGS += -m64 -msoft-float -fno-stack-protector	\
++ppc64_PURGATORY_EXTRA_CFLAGS += -m64 -msoft-float \
+ 				-fno-exceptions
+ ppc64_PURGATORY_EXTRA_ASFLAGS += -m64
+ ifeq ($(SUBARCH),BE)
+diff --git a/purgatory/arch/s390/Makefile b/purgatory/arch/s390/Makefile
+index 09749bd..c94cc3c 100644
+--- a/purgatory/arch/s390/Makefile
++++ b/purgatory/arch/s390/Makefile
+@@ -2,7 +2,6 @@
+ # Purgatory s390
+ #
+ 
+-s390_PURGATORY_EXTRA_CFLAGS += -fno-stack-protector
+ s390_PURGATORY_SRCS += purgatory/arch/s390/console-s390.c
+ s390_PURGATORY_SRCS += purgatory/arch/s390/setup-s390.S
+ s390_PURGATORY_SRCS += purgatory/arch/s390/purgatory-s390.c
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
index 36e4c15..db5649b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
@@ -5,6 +5,7 @@ EXTRA_OECONF = " --with-zlib=yes"
 SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
             file://kexec-x32.patch \
+            file://0001-purgatory-Disabling-GCC-s-stack-protection.patch \
          "
 
 SRC_URI[md5sum] = "4ecb7ab7ad9eb6ce413899bdb07a8426"
-- 
1.9.1


