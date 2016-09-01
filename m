Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDB773166
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 20:07:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2016 13:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023868810"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 13:07:29 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 13:07:36 -0700
Message-Id: <1472760457-8822-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] Fix glib build for mips64
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
X-List-Received-Date: Thu, 01 Sep 2016 20:07:29 -0000

The attached patch fixes a problem observed on AB, in particular
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/930/steps/BuildImages_5/logs/stdio

glib build failed, hence core-image-minimal was not built, hence SDK tests were not ran.

The test patch was tested with:
MACHINE = "qemumips64"

require conf/multilib.conf
MULTILIBS = "multilib:lib64 multilib:lib32"
DEFAULTTUNE = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"
QEMU_USE_KVM = "True"

USER_CLASSES += " testsdk "


Build Configuration:
BB_VERSION        = "1.31.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "mips64-poky-linux-gnun32"
MACHINE           = "qemumips64"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1+snapshot-20160901"
TUNE_FEATURES     = "n32 bigendian fpu-hard"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "master-next:df6d79dc8faba6ca997beebd32242bd65fe962bd"


$ bitbake core-image-minimal -c populate_sdk
$ bitbake core-image-minimal -c testsdk


Juro Bystricky (1):
  glib: disable gtk-doc on mips64

 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.4


