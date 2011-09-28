Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIw-00041w-2B
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360960"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:52 -0700
Message-Id: <f8281560b6a7d9dd389f574b022223f6eb11359d.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/29] zypper & sat-solver: needs RDEPENDS on rpm-lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 07:11:50 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 ++++----
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    4 +++-
 meta/recipes-extended/zypper/zypper_git.bb         |    6 ++++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 4b1b8e4..7d9382a 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -8,13 +8,10 @@ inherit cmake gettext
 
 DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 
-# rpmdb2solv from sat-solver is run from libzypp
-RDEPENDS_${PN} = "sat-solver"
-
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -32,6 +29,9 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 # ARM specific global constructor workaround
 SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 
+# rpmdb2solv from sat-solver is run from libzypp
+RDEPENDS_${PN} = "sat-solver rpm-libs"
+
 PACKAGES =+ "${PN}-pkgmgt"
 
 FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 0d9a439..b616c57 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcheck rpm zlib expat db"
 
 SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
-PR = "r11"
+PR = "r12"
 
 PARALLEL_MAKE=""
 
@@ -29,6 +29,8 @@ EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
 inherit cmake pkgconfig
 
+RDEPENDS_${PN} = "rpm-libs"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_archgen () {
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 7f7ceb3..4f4fc4d 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,8 +5,7 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
-PR = "r5"
+PR = "r6"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
@@ -20,4 +19,7 @@ S = "${WORKDIR}/git"
 
 PV = "1.5.3-git${SRCPV}"
 
+RDEPENDS_${PN} = "rpm-libs"
+RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6



