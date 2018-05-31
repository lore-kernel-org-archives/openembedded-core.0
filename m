Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4589A74EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 04:34:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2018 21:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,462,1520924400"; d="scan'208";a="53627351"
Received: from scng1-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.249.74.164])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2018 21:34:38 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 12:34:32 +0800
Message-Id: <20180531043433.19106-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/2] qemux86*: change default wic wks to qemux86-directdisk
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
X-List-Received-Date: Thu, 31 May 2018 04:34:38 -0000

When runqemu is invoked with an image type (wic, hddimg etc) as a parameter,
the kernel value and command line parameters from qemuboot.conf
are ignored and not passed to qemu cmdline.

As an example, when using:

$ runqemu wic kvm

It results in no network interface and video mode warnings when qemu is up because
the -kernel and -append options were not passed.

Change qemu conf to use qemux86-directdisk.wks that supplies the kernel parameters
that are appended to the bootloader configuration when generating qemu wic
images instead of relying on qemuboot.conf.

Fixes [YOCTO #12224]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index fcc44595e8..2330c7d86e 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -33,5 +33,5 @@ KERNEL_MODULE_AUTOLOAD += "uvesafb"
 KERNEL_MODULE_PROBECONF += "uvesafb"
 module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
-WKS_FILE ?= "directdisk.wks"
+WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c53f7a92ce..811e3ef7cf 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -32,5 +32,5 @@ KERNEL_MODULE_AUTOLOAD += "uvesafb"
 KERNEL_MODULE_PROBECONF += "uvesafb"
 module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
-WKS_FILE ?= "directdisk.wks"
+WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.17.0


