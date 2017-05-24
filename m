Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 21296780D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:46:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wY4FD5XJtz1qryp;
	Wed, 24 May 2017 22:46:40 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wY4FD4wJYz3hmmB;
	Wed, 24 May 2017 22:46:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id m77cX064Qu1b; Wed, 24 May 2017 22:46:39 +0200 (CEST)
X-Auth-Info: pPZJWHhCG7i7scOPuNe2OMs1GXR22zoYDlv9FgIErVQ=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed, 24 May 2017 22:46:39 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 22:46:36 +0200
Message-Id: <20170524204636.2797-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] qemu: Add nios2 target
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
X-List-Received-Date: Wed, 24 May 2017 20:46:40 -0000

Add nios2 qemu target since nios2 is now supported in mainline.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta-poky/conf/distro/poky.conf     | 3 ++-
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 scripts/runqemu                     | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 57b7e71d5f..d262f572ad 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -39,13 +39,14 @@ POKYQEMUDEPS = "${@bb.utils.contains("INCOMPATIBLE_LICENSE", "GPL-3.0", "", "pac
 DISTRO_EXTRA_RDEPENDS_append_qemuarm = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemuarm64 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemumips = " ${POKYQEMUDEPS}"
+DISTRO_EXTRA_RDEPENDS_append_qemunios2 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemuppc = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemux86 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemux86-64 = " ${POKYQEMUDEPS}"
 
 TCLIBCAPPEND = ""
 
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el nios2 ppc x86_64"
 # Other QEMU_TARGETS "sh4"
 
 PREMIRRORS ??= "\
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0e1411af64..c9ac56121f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ inherit autotools pkgconfig bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el nios2 ppc sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
diff --git a/scripts/runqemu b/scripts/runqemu
index f0ddeea1bf..f4f1bba17d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1018,7 +1018,7 @@ class BaseConfig(object):
         """attempt to determine the appropriate qemu-system binary"""
         mach = self.get('MACHINE')
         if not mach:
-            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips64el|qemumipsel|qemumips|qemuppc).*'
+            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips64el|qemumipsel|qemumips|qemunios2|qemuppc).*'
             if self.rootfs:
                 match = re.match(search, self.rootfs)
                 if match:
@@ -1049,6 +1049,8 @@ class BaseConfig(object):
             qbsys = 'mipsel'
         elif mach == 'qemumips64el':
             qbsys = 'mips64el'
+        elif mach == 'qemunios2':
+            qbsys = 'nios2'
 
         return 'qemu-system-%s' % qbsys
 
-- 
2.11.0


