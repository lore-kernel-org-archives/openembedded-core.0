Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7882074ECF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:25:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w69FPhNA028602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2018 08:25:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 08:25:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Jul 2018 11:25:34 -0400
Message-ID: <edcc5f57ea8796f70c032efb9284f214cc77a0e3.1531149297.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1531149297.git.bruce.ashfield@windriver.com>
References: <cover.1531149297.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto: add qemuarm -tiny support
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
X-List-Received-Date: Mon, 09 Jul 2018 15:25:43 -0000
Content-Type: text/plain

Adding a BSP definition to the kernel-cache, creating a tiny branch for
board specific patches and finally setting the machine compatibility in
the linux-yocto-tiny recipe.

This is only the BSP definition and kernel configuration side of things,
more changes are necessary for full tiny distro support on qemumarm.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  7 ++++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 00671182d1ee..9e46576fb8df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aeeb2d73f2a828a9c0b121b2aa3bb345009f5698"
-SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
+SRCREV_machine ?= "7e0d6d525a8deb7329c0d8f844880c5ec6c0b84a"
+SRCREV_meta ?= "34d4dc9c1d160ab3c514aa20cc82a7abdf2c29b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index d166a4098b89..29a2c19b52d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
+SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_meta ?= "ff65711e13fa39d7fe2947a1ba196dad82eed327"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 58945f25d081..db356bcd1343 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9e246607d5c23f8bb3b8800734b1707766e0b2b9"
-SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
+SRCREV_machine ?= "dd893e600276f4e05e416cf5be73a5fd5752e0cb"
+SRCREV_meta ?= "34d4dc9c1d160ab3c514aa20cc82a7abdf2c29b4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 5f9b3c7fb35f..8bad903eff2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -1,4 +1,5 @@
 KBRANCH ?= "v4.15/standard/tiny/common-pc"
+KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
@@ -9,15 +10,15 @@ LINUX_VERSION ?= "4.15.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
+SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_meta ?= "ff65711e13fa39d7fe2947a1ba196dad82eed327"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 0449213d424b..fd8562e955c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "363723ef50c06df54e146c8fe78faa962e96a8c8"
-SRCREV_machine_qemuarm64 ?= "798d15552a4d5d9355a300290ed6bf72106b7e96"
-SRCREV_machine_qemumips ?= "6c2433d7c51c3e78b1be2c7d1fbfe840b13d04df"
-SRCREV_machine_qemuppc ?= "c03babad17499489b20216576d608c94e7fddc5d"
-SRCREV_machine_qemux86 ?= "65d1c849534179bbfa494f77947f8be615e9871a"
-SRCREV_machine_qemux86-64 ?= "65d1c849534179bbfa494f77947f8be615e9871a"
-SRCREV_machine_qemumips64 ?= "59f70381cbde371e41206b7902390ae78558c310"
-SRCREV_machine ?= "65d1c849534179bbfa494f77947f8be615e9871a"
-SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
+SRCREV_machine_qemuarm ?= "88755525aeeeb3c42e365208858f74b3be7bad22"
+SRCREV_machine_qemuarm64 ?= "ec98b274e0e668eb6e368fe5d9173f52c6b6d401"
+SRCREV_machine_qemumips ?= "9fd9713c5ba50d6610da19bb296b8f4954e1786b"
+SRCREV_machine_qemuppc ?= "cfe05303950568a871b746b1955181da1fb13847"
+SRCREV_machine_qemux86 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
+SRCREV_machine_qemux86-64 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
+SRCREV_machine_qemumips64 ?= "346488cf46ac4045fe257eb63836eb93c7c09859"
+SRCREV_machine ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
+SRCREV_meta ?= "34d4dc9c1d160ab3c514aa20cc82a7abdf2c29b4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 693670c613da..72b15060621e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d16b10fb69974f1804a02f2678f40d22c80526cf"
-SRCREV_machine_qemuarm64 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_machine_qemumips ?= "182eaefab712f4360126e044c758e75d763d05c4"
-SRCREV_machine_qemuppc ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_machine_qemux86 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_machine_qemux86-64 ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_machine_qemumips64 ?= "ce3876a091477260fcb1197e3c6565dfbf9c6e80"
-SRCREV_machine ?= "e25dbfe95302eeaa1a03a828d05c09479574488a"
-SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
+SRCREV_machine_qemuarm ?= "12c2b0077b13cf6a2f1096a0d51f3a6ed5cbbd3a"
+SRCREV_machine_qemuarm64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_machine_qemumips ?= "c03f2971b07a79c5402f0d7126cc2cd856028e38"
+SRCREV_machine_qemuppc ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_machine_qemux86 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_machine_qemux86-64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_machine_qemumips64 ?= "b98c113571c72a0d34832dd6fe5585529b32988b"
+SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
+SRCREV_meta ?= "ff65711e13fa39d7fe2947a1ba196dad82eed327"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


