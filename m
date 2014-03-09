Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8316F61B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 16:04:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2014 09:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,618,1389772800"; d="scan'208";a="469211878"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Mar 2014 09:04:35 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 965AC6A4007;
	Sun,  9 Mar 2014 09:04:23 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 18:04:28 +0200
Message-Id: <0733b5532e0f5ca31e7d7cf257bc7ead98ba6fad.1394379902.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/4] recipes-bsp: Add gummiboot recipe
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
X-List-Received-Date: Sun, 09 Mar 2014 16:04:38 -0000

gummiboot is a simple UEFI boot manager.

Recipe imported from meta-intel with these changes:
 - drop PR and update configure options
 - upgraded to latest version

A couple of notes:
 - If you wish you can install the gummiboot package on the target and
use 'gummiboot install' to add the payload to the ESP (see gummiboot --help,
just make sure the ESP partition has the boot flag on as gummiboot won't accept it
otherwise). However the point of this recipe is to be used by bootimg.bbclass and
generate images with gummiboot instead of grub-efi.
 - You need a kernel which has CONFIG_EFI_STUB=y at least
 - The default linux-yocto kernel config does not enable that, easiest way
to enable is to build with KERNEL_FEATURES_append = " cfg/efi-ext" in local.conf

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
new file mode 100644
index 0000000..5868a23
--- /dev/null
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Gummiboot is a simple UEFI boot manager which executes configured EFI images."
+HOMEPAGE = "http://freedesktop.org/wiki/Software/gummiboot"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "gnu-efi util-linux"
+
+inherit autotools
+inherit deploy
+
+PV = "43+git${SRCPV}"
+SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
+SRC_URI = "git://anongit.freedesktop.org/gummiboot"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
+                --with-efi-ldsdir=${STAGING_LIBDIR} \
+                --with-efi-libdir=${STAGING_LIBDIR}"
+
+do_deploy () {
+        install ${B}/gummiboot*.efi ${DEPLOYDIR}
+}
+addtask deploy before do_build after do_compile
-- 
1.8.5.3


