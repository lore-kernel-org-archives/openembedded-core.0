Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2101674B36
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:16:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w39FGEoS011381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2018 08:16:14 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 9 Apr 2018 08:16:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Apr 2018 11:16:07 -0400
Message-ID: <83cd6ea6823c9850737ad6e8508f6157a8bdf813.1523286757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1523286757.git.bruce.ashfield@windriver.com>
References: <cover.1523286757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.14/4.15: deterministic srcversion
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
X-List-Received-Date: Mon, 09 Apr 2018 15:16:14 -0000
Content-Type: text/plain

   Author: Juro Bystricky <juro.bystricky@intel.com>
   Date:   Fri Mar 30 10:14:05 2018 -0700

       modpost: srcversion sometimes incorrect

       "srcversion" field inserted into module modinfo section contains a
       sum of the source files which made it. However, this field can
       be incorrect. Building the same module can end up having inconsistent
       srcversion field eventhough the sources remain the same.
       This can be reproduced by building modules in a deeply nested directory,
       but other factors contribute as well.

       The reason for incorrect srcversion is that some source files can be
       simply silently skipped from the checksum calculation due to limited
       buffer space for line parsing.

       This patch addresses two issues:

       1. Allocates a larger line buffer (32k vs 4k).
       2. Issues a warning if a line length exceeds the line buffer.

       Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 85f85428514e..81306a984262 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "620ed070a13e614e8e550998fae123318eeb881a"
-SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
+SRCREV_machine ?= "7272e9132fdaaf0dd78bc94e9f297aaf73452982"
+SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 19c07ddf1dc9..c5d3ee03fd28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
+SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 942579795f39..34bee0949fc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "40adf66d7c45b8252a1d3f904b5027a495e41725"
-SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
+SRCREV_machine ?= "ad31896630f8bf6a459164263adc0a8faf984d9e"
+SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 9054f1862191..05b9ca38b2df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.15.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
 SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index bfc4de02f239..16142f8ceb47 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "73815e83e4f6bc22e88f4eb3bd4ee5483198ff0d"
-SRCREV_machine_qemuarm64 ?= "b0bf285405cf0369ecc7e0b923d776138b0bcf84"
-SRCREV_machine_qemumips ?= "47b99cfeaf68526ab28e657ac8fa681b0c78103a"
-SRCREV_machine_qemuppc ?= "2219819c5473dd238913e4c0ca077798d531eaf4"
-SRCREV_machine_qemux86 ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
-SRCREV_machine_qemux86-64 ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
-SRCREV_machine_qemumips64 ?= "37b40335aa0cd149c7664fe6d9b0d63b5c34e150"
-SRCREV_machine ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
-SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
+SRCREV_machine_qemuarm ?= "d6268fc3460d3904fd49087f7a822efbaab9bfe8"
+SRCREV_machine_qemuarm64 ?= "c94189843b8ad62cafe9a307e7f7d60741690505"
+SRCREV_machine_qemumips ?= "4afd92347b2b35dc8e0006712f8fa00ac57f2a36"
+SRCREV_machine_qemuppc ?= "e8af5c9b65c5187d148ecd11bd7979489460ca64"
+SRCREV_machine_qemux86 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
+SRCREV_machine_qemux86-64 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
+SRCREV_machine_qemumips64 ?= "9863b327e770b42b8c18da3e0cfaf06e8f99ae97"
+SRCREV_machine ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
+SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 7e25a3d58de8..70bd7118bd01 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e98391b2cf78ebdc41c229359d35d9e6ca96dde3"
-SRCREV_machine_qemuarm64 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_machine_qemumips ?= "e99c1fc0e84dba772531ba02373a28350056211a"
-SRCREV_machine_qemuppc ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_machine_qemux86 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_machine_qemux86-64 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_machine_qemumips64 ?= "0789d1f7734d5408de3130f9305f2ca4abc93025"
-SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
+SRCREV_machine_qemuarm ?= "4b6902b42f47593928117b2ff0900cd965cf6443"
+SRCREV_machine_qemuarm64 ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_machine_qemumips ?= "19ba2d843750ff65d8fe590acdfc99aea6153945"
+SRCREV_machine_qemuppc ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_machine_qemux86 ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_machine_qemux86-64 ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_machine_qemumips64 ?= "97000c3f4664643bac7828bbdc048f7ec216cc31"
+SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
+SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


