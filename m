Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32A0971B48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2RF3QJk018339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:26 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:16 -0400
Message-ID: <4b38d9451ea461d938d76a53ceca3d48a157a206.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/meta: improve wifi driver granularity
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:26 -0000
Content-Type: text/plain

Integrating the following commit for the 4.12+ kernels:

   Author: Nathan Rossi <nathan@nathanrossi.com>
   Date:   Wed Mar 21 00:10:02 2018 +1000

    features/wifi: Add WiFi driver fragments for various vendors/interfaces

    This change adds WiFi driver configuration fragments. The fragments are
    split into vendor and interface files to allow for easy selection of
    drivers for specific interface types (USB, PCI, SDIO) which is useful
    for BSPs with specific interfaces. The specific vendor/interface config
    fragments can be included by specific BSPs in its .scc files.

    However .scc files (wifi-*.scc) are provided to allow enabling interface
    specific or all interfaces drivers via KERNEL_FEATURES or inclusion via
    other .scc files. And wifi-common.scc is provided to enable the base
    config options required for all WiFi drivers, which is done to ensure
    correct configuration for default no config setups (e.g.
    linux-yocto-tiny).

    This patch only enables a limited set of drivers, which is based on what
    the common-pc-wifi.cfg fragment sets as well as some additional drivers,
    that primarily appear in USB WiFi devices.

    Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

This gives us a much better granularity of drivers and a good baseline for
future improvements.

The 4.12 fragments are also slightly re-organized on top of this commit
to avoid patch failures when including the new frags.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 7b6d67c623f4..a59ab20feb0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e631b6433928b4b7f44b7ae2e97fe0a174aa0b44"
-SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
+SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index dc0832723472..07ad6bad3267 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "26443228033c81f99bf75e5b75eec662f39243b1"
-SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
+SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 457d5f0929ee..9da16b5afcfd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
+SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index d31c6ff3e1db..b0f7d77998f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
+SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index d3ac63898f7c..a9aa571540bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ff658b2ac6a54d40fcf17a9d5d8d854b80067d49"
-SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
+SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 76f6cab95e92..23b5f5387842 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
 SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
+SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 6c82505b4796..c112ae4d2126 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
 SRCREV_machine_qemux86-64 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
 SRCREV_machine_qemumips64 ?= "68bcd22421aa288aff3dc9cf3035539788b04353"
 SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
+SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 13e465198c0b..2904ef65f8bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
 SRCREV_machine_qemux86-64 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
 SRCREV_machine_qemumips64 ?= "d8c7e535a8dcc7b30213c628e4c4c98e56daad6b"
 SRCREV_machine ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
-SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
+SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 056fd30e6ab9..023577d946a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
 SRCREV_machine_qemux86-64 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
 SRCREV_machine_qemumips64 ?= "77ae4b3b45eab133a5daf1e90828e5dfe62062e1"
 SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
+SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


