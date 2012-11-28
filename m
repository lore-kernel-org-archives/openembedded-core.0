Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TdmVz-0000MK-4n
	for Openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:37:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2012 10:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,180,1355126400"; d="scan'208";a="225937985"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 10:22:22 -0800
From: nitin.a.kamble@intel.com
To: meta-intel@yoctoproject.org, Openembedded-core@lists.openembedded.org,
	tom.zanussi@intel.com, darren.hart@intel.com, ross.burton@intel.com
Date: Wed, 28 Nov 2012 10:21:34 -0800
Message-Id: <f3c38fa5b0bf38395e258f07cba67c8aca5b7ae4.1354126748.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <80889d89c4670fffecda4e06e85c68f73aa67ce0.1354126748.git.nitin.a.kamble@intel.com>
References: <80889d89c4670fffecda4e06e85c68f73aa67ce0.1354126748.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1354126748.git.nitin.a.kamble@intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
Subject: [meta-intel patch 3/3] xserver-xorg-video-psb: fix packaging issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 18:37:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit takes care of these packaging warnings.

WARNING: QA Issue: xserver-xorg-video-psb: Files/directories were installed but not shipped
  /usr/lib/xorg/modules/drivers/psb_drv.la
  /usr/lib/xorg/modules/drivers/libmm.la
  /usr/lib/xorg/modules/drivers/.debug
  /usr/lib/xorg/modules/drivers/.debug/psb_drv.so
  /usr/lib/xorg/modules/drivers/.debug/libmm.so

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xserver-xorg-video-psb_0.32.1.bb               |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb_0.32.1.bb b/meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb_0.32.1.bb
index 7972fcd..afbf31b 100644
--- a/meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb_0.32.1.bb
+++ b/meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb_0.32.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "2D graphics driver for Poulsbo"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://MIT_License.txt;md5=732825ecdcf420261531d935fcd914a7"
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
@@ -37,3 +37,9 @@ DEPENDS += "virtual/libgl virtual/xserver"
 RDEPENDS_${PN} = "xserver-psb-module-exa"
 
 COMPATIBLE_MACHINE = "emenlow"
+
+do_install_append() {
+	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
+}
+
+FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
-- 
1.7.3.4



