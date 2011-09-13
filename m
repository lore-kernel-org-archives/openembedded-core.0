Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3ch0-0001FN-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 01:47:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 16:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,376,1312182000"; d="scan'208";a="48466141"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2011 16:41:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 16:41:39 -0700
Message-Id: <3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315956050.git.sgw@linux.intel.com>
References: <cover.1315956050.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315956050.git.sgw@linux.intel.com>
References: <cover.1315956050.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] libzypp: move package-manger to it own package
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
X-List-Received-Date: Tue, 13 Sep 2011 23:47:06 -0000

[YOCTO #1234]

This moves a couple of files to a pkgmgt package so that
they will not be installed by default. This removes the
Add/Remove Software Icon from rpm based rootfs.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 1fc6809..aeae7df 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN} = "sat-solver"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -32,9 +32,16 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 # ARM specific global constructor workaround
 SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 
+PACKAGES =+ "${PN}-pkgmgt"
+
 FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
 FILES_${PN}-dev += "${datadir}/cmake"
 
+FILES_${PN}-pkgmgt = "${bindir}/package-manager \
+                      ${bindir}/package-manager-su \
+                      ${datadir}/applications/package-manager.desktop \
+                     "
+
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6



