Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH71-0005g0-Jl
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167887"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:12 -0700
Message-Id: <f13dd36d54db32c16a2d46112d2b7e76be169438.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/43] console-tools: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:12 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use update-alternatives and sync to the way the replace kbd package
does things.  Using update-alternatives ensures that the proper provides
are setup in the packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../console-tools/console-tools_0.3.2.bb           |   27 +++----------------
 1 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 5f1d640..6027d4a 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://codepage.patch \
@@ -30,28 +30,11 @@ do_compile () {
 	oe_runmake 'SUBDIRS=${SUBDIRS}'
 }
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
-do_install () {
-	autotools_do_install
-	mv ${D}${bindir}/chvt ${D}${bindir}/chvt.${PN}
-	mv ${D}${bindir}/deallocvt ${D}${bindir}/deallocvt.${PN}
-	mv ${D}${bindir}/openvt ${D}${bindir}/openvt.${PN}
-	mv ${D}${bindir}/fgconsole ${D}${bindir}/fgconsole.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/chvt chvt chvt.${PN} 100
-	update-alternatives --install ${bindir}/deallocvt deallocvt deallocvt.${PN} 100
-	update-alternatives --install ${bindir}/openvt openvt openvt.${PN} 100
-	update-alternatives --install ${bindir}/fgconsole fgconsole fgconsole.${PN} 100
-}
+ALTERNATIVE_PRIORITY = "100"
 
-pkg_prerm_${PN} () {
-	update-alternatives --remove chvt chvt.${PN}
-	update-alternatives --remove deallocvt deallocvt.${PN}
-	update-alternatives --remove openvt openvt.${PN}
-	update-alternatives --remove fgconsole fgconsole.${PN}
-}
+bindir_progs = "chvt deallocvt fgconsole openvt"
+ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
 RDEPENDS_${PN} = "bash"
-- 
1.7.7.6



