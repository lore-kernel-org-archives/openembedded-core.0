Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F40EA65CD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147357"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:28 -0700
Message-Id: <bab12ef19fabb4ee8183fb12291311b7382e4d2e.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 09/10] pointercal-xinput: convert to conf-files and remove
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf-files/conf-files}/pointercal.xinput         |  0
 .../xinput-calibrator/pointercal-xinput_0.0.bb       | 20 --------------------
 .../xinput-calibrator/xinput-calibrator_git.bb       |  3 +--
 3 files changed, 1 insertion(+), 22 deletions(-)
 rename meta/{recipes-graphics/xinput-calibrator/pointercal-xinput => recipes-bsp/conf-files/conf-files}/pointercal.xinput (100%)
 delete mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-bsp/conf-files/conf-files/pointercal.xinput
similarity index 100%
rename from meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
rename to meta/recipes-bsp/conf-files/conf-files/pointercal.xinput
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
deleted file mode 100644
index 65348c3..0000000
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Touchscreen calibration data from xinput-calibrator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r7"
-
-SRC_URI = "file://pointercal.xinput"
-S = "${WORKDIR}"
-
-do_install() {
-    # Only install file if it has a contents
-    if [ -s ${S}/pointercal.xinput ] &&\
-       [ ! -n "$(head -n1 ${S}/pointercal.xinput|grep "replace.*pointercal\.xinput")" ]; then
-        install -d ${D}${sysconfdir}/
-        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
-    fi
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 562434f..65506e3 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxi"
 PV = "0.7.5+git${SRCPV}"
 PR = "r6"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig conf-files
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
@@ -32,4 +32,3 @@ do_install_append() {
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput formfactor"
-RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.8.3.2


