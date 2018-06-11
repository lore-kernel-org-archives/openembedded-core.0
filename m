Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9301178C10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:12:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5BGAo3B002138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jun 2018 09:11:47 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 11 Jun 2018 09:11:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jun 2018 12:11:22 -0400
Message-ID: <1528733483-19785-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.14/4.15: fix gcc8 mips compilation issues
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
X-List-Received-Date: Mon, 11 Jun 2018 16:12:12 -0000
Content-Type: text/plain

Making the following commit available to fix mips gcc8 build issues:

   commit e25dbfe95302eeaa1a03a828d05c09479574488a
   Author: Kevin Hao <kexin.hao@windriver.com>
   Date:   Mon Jun 11 18:17:54 2018 +0800

       MIPS: Use '+=" instead of '=' to avoid the CFLAGS override

       We used the CFLAGS_xxx to workaround the gcc 8 build warnings
       for some specific file. But CFLAGS_xxx is also used with '=' in
       other places of this Makefile. This override the gcc 8 workaround,
       so replace all the '=' with '+=" to fix this issue.

       Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 16 ++++++++--------
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index dc09b9088079..00671182d1ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f8ced9d2648cffbb6ce6222bb453540422eb19f2"
+SRCREV_machine ?= "aeeb2d73f2a828a9c0b121b2aa3bb345009f5698"
 SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 7cec80e02df5..d166a4098b89 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 2f48bc67de1e..58945f25d081 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -12,7 +12,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "72fa684fc18637c6b385c8fa2335ac4e48240d15"
+SRCREV_machine ?= "9e246607d5c23f8bb3b8800734b1707766e0b2b9"
 SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 05b076af6cb7..5f9b3c7fb35f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.15.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 12cd8254e0ce..0449213d424b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3a7b21b8959eaeb6b3548ccc03e5aeef02757a83"
-SRCREV_machine_qemuarm64 ?= "fff23f8dabf7774db37656037243f5706f311ccd"
-SRCREV_machine_qemumips ?= "825a9302d4829384c5f8ccdf96a71f39441095dd"
-SRCREV_machine_qemuppc ?= "24febbcbc2cefbf05ea038ed1042603142d3b033"
-SRCREV_machine_qemux86 ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
-SRCREV_machine_qemux86-64 ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
-SRCREV_machine_qemumips64 ?= "a55b95ebad77a4124d5f52a6d121d59e17647289"
-SRCREV_machine ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
+SRCREV_machine_qemuarm ?= "363723ef50c06df54e146c8fe78faa962e96a8c8"
+SRCREV_machine_qemuarm64 ?= "798d15552a4d5d9355a300290ed6bf72106b7e96"
+SRCREV_machine_qemumips ?= "6c2433d7c51c3e78b1be2c7d1fbfe840b13d04df"
+SRCREV_machine_qemuppc ?= "c03babad17499489b20216576d608c94e7fddc5d"
+SRCREV_machine_qemux86 ?= "65d1c849534179bbfa494f77947f8be615e9871a"
+SRCREV_machine_qemux86-64 ?= "65d1c849534179bbfa494f77947f8be615e9871a"
+SRCREV_machine_qemumips64 ?= "59f70381cbde371e41206b7902390ae78558c310"
+SRCREV_machine ?= "65d1c849534179bbfa494f77947f8be615e9871a"
 SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 6e708550fa4e..693670c613da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2e7f1aeb11d0aedec2ba2ce995933221a0bfddeb"
-SRCREV_machine_qemuarm64 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
-SRCREV_machine_qemumips ?= "43122d3a461b6216ca1a4a568378eea8143cf927"
-SRCREV_machine_qemuppc ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
-SRCREV_machine_qemux86 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
-SRCREV_machine_qemux86-64 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
-SRCREV_machine_qemumips64 ?= "4cc6d70306ff8bd235008d18adee0bc676dc2798"
-SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine_qemuarm ?= "d16b10fb69974f1804a02f2678f40d22c80526cf"
+SRCREV_machine_qemuarm64 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
+SRCREV_machine_qemumips ?= "182eaefab712f4360126e044c758e75d763d05c4"
+SRCREV_machine_qemuppc ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
+SRCREV_machine_qemux86 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
+SRCREV_machine_qemux86-64 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
+SRCREV_machine_qemumips64 ?= "ce3876a091477260fcb1197e3c6565dfbf9c6e80"
+SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


