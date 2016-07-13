Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C39E9731B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 01:19:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6D1JcuR024249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jul 2016 18:19:38 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 18:19:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jul 2016 21:19:28 -0400
Message-ID: <78d91d98ff66219149234976279d2b5927b6366c.1468372600.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1468372600.git.bruce.ashfield@windriver.com>
References: <cover.1468372600.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.1/4.1: mei, usb and extcon changes
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
X-List-Received-Date: Wed, 13 Jul 2016 01:19:42 -0000
Content-Type: text/plain

Backporting the following mainline changes to the 4.1 and 4.4
kernels:

  device property: Avoid potential dereferences of invalid pointers
  device property: convert to use match_string() helper
  lib/string: introduce match_string() helper
  device property: fix for a case of use-after-free
  device property: fwnode->secondary may contain ERR_PTR(-ENODEV)
  xhci: harden xhci_find_next_ext_cap against device removal
  xhci: rework xhci extended capability list parsing functions
  xhci: parse xhci protocol speed ID list for usb 3.1 usage
  extcon: Redefine the unique id of supported external connectors without 'enum extcon' type
  extcon: Remove optional print_name() function pointer of extcon_dev
  extcon: Update the prototype of extcon_register_notifier() with enum extcon
  extcon: Use capital letter for the name of external connectors
  extcon: Use the unique id for external connector instead of string
  extcon: Remove the optional name of extcon device
  extcon: adc-jack: Remove the unneeded num_cables field
  extcon: Alter MHL-TA cable name to TA cable name
  extcon: Unify the dock device names on max8997/77693
  extcon: Unify the jig cable names on rt8973 and max14577/77693/77843
  extcon: Fix the checkpatch warning and minor coding style issue
  extcon: Add extcon_get_edev_name() API to get the extcon device name
  extcon: Modify the device name as extcon[X] for sysfs
  extcon: Add manufactor name of each extcon device

And the following config change:

  mei.cfg: Add CONFIG_INTEL_MEI_TXE=m

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 15494b63356b..858518baa0f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ab0fb3f54886c143066754df67eb6abe4c5d7f9"
-SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
+SRCREV_machine ?= "6d00f6d73a3268e99092096a3f5699c57370ece0"
+SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 106dc3450804..eb99e6ebab14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
+SRCREV_meta ?= "4ebb8be6799bf2b738d46a3db49ebe59187f3b96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 7503dd1b8359..a062272c3d46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
+SRCREV_machine ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 1df17848afc6..0bf3d8bb901a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
+SRCREV_meta ?= "4ebb8be6799bf2b738d46a3db49ebe59187f3b96"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index f673609b7fdf..49adad0fd15e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ce593534958d0bc6a3d1bc3036f425b9d7d9f5f6"
-SRCREV_machine_qemuarm64 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_machine_qemumips ?= "f1566b7d9fafd16b5dd98a313ffae1cab493a1c3"
-SRCREV_machine_qemuppc ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_machine_qemux86 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_machine_qemux86-64 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_machine_qemumips64 ?= "8bac527ccf5cef97eac0dec7d94fb8cb668d7e13"
-SRCREV_machine ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
-SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
+SRCREV_machine_qemuarm ?= "494bf106c15685dafa318f418ce86228728006f1"
+SRCREV_machine_qemuarm64 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_machine_qemumips ?= "3d9c0d5f502f7ae6f74766b2e9980df2cf5f661c"
+SRCREV_machine_qemuppc ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_machine_qemux86 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_machine_qemux86-64 ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_machine_qemumips64 ?= "6c9b0acfa18a1c86da12ae17da643cde03dd82cd"
+SRCREV_machine ?= "75d56a13f86fc48002e4a3f9ed60546db30432b7"
+SRCREV_meta ?= "0845ec79bc2fbc45efcf4c44138fd698039960c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index a91b9cedc70d..ea8ce49da8e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
 SRCREV_machine_qemux86-64 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
 SRCREV_machine_qemumips64 ?= "565650ff074c7438081bd2ff0db4d7208d666ddf"
 SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
+SRCREV_meta ?= "4ebb8be6799bf2b738d46a3db49ebe59187f3b96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


