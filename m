Return-Path: <Matthieu.CRAPET@ingenico.com>
X-Greylist: delayed 614 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 11:10:00 UTC
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0E165FB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 11:10:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,996,1389740400"; d="scan'208";a="50765407"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 12:59:46 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 6 May 2014 12:59:46 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 12:59:45 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 12:59:54 +0200
Message-ID: <1399373994-17206-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] tcl: cleanup
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
X-List-Received-Date: Tue, 06 May 2014 11:10:03 -0000
Content-Type: text/plain

Changes:
- add missing licence file: tcl
- use binconfig to patch tclConfig.sh paths
- avoid subshell in do_configure()
- use ${PV}

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/files/common-licenses/tcl           | 40 ++++++++++++++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb | 34 ++++++++++++++++-----------
 2 files changed, 60 insertions(+), 14 deletions(-)
 create mode 100644 meta/files/common-licenses/tcl

diff --git a/meta/files/common-licenses/tcl b/meta/files/common-licenses/tcl
new file mode 100644
index 0000000..d8049cd
--- /dev/null
+++ b/meta/files/common-licenses/tcl
@@ -0,0 +1,40 @@
+This software is copyrighted by the Regents of the University of
+California, Sun Microsystems, Inc., Scriptics Corporation, ActiveState
+Corporation and other parties.  The following terms apply to all files
+associated with the software unless explicitly disclaimed in
+individual files.
+
+The authors hereby grant permission to use, copy, modify, distribute,
+and license this software and its documentation for any purpose, provided
+that existing copyright notices are retained in all copies and that this
+notice is included verbatim in any distributions. No written agreement,
+license, or royalty fee is required for any of the authorized uses.
+Modifications to this software may be copyrighted by their authors
+and need not follow the licensing terms described here, provided that
+the new terms are clearly indicated on the first page of each file where
+they apply.
+
+IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
+FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
+ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
+DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
+
+THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
+IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
+NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
+MODIFICATIONS.
+
+GOVERNMENT USE: If you are acquiring this software on behalf of the
+U.S. government, the Government shall have only "Restricted Rights"
+in the software and related documentation as defined in the Federal
+Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
+are acquiring the software on behalf of the Department of Defense, the
+software shall be classified as "Commercial Computer Software" and the
+Government shall have only "Restricted Rights" as defined in Clause
+252.227-7014 (b) (3) of DFARs.  Notwithstanding the foregoing, the
+authors grant the U.S. Government and others acting in its behalf
+permission to use and distribute the software in accordance with the
+terms specified in this license.
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 9d35da1..27f73f2 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -1,19 +1,21 @@
 SUMMARY = "Tool Command Language"
-LICENSE = "BSD-3-Clause"
-SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
-DEPENDS = "tcl-native zlib"
+SECTION = "devel/tcltk"
+
+# http://www.tcl.tk/software/tcltk/license.html
+LICENSE = "tcl & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../compat/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../library/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../macosx/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../tests/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../win/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    "
+"
 
-BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
-                file://tcl-add-soname.patch"
+DEPENDS = "tcl-native zlib"
 
+BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
+                file://tcl-add-soname.patch"
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_non_native_build_issue.patch \
            file://fix_issue_with_old_distro_glibc.patch \
@@ -21,24 +23,26 @@ SRC_URI = "${BASE_SRC_URI} \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
            file://run-ptest \
-          "
+"
 SRC_URI[md5sum] = "aae4b701ee527c6e4e1a6f9c7399882e"
 SRC_URI[sha256sum] = "16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-S = "${WORKDIR}/tcl${PV}/unix"
+S = "${WORKDIR}/${BPN}${PV}/unix"
 
-VER = "8.6.1"
+VER = "${PV}"
 
-inherit autotools ptest
+inherit autotools ptest binconfig
 
 DEPENDS_class-native = "zlib-native"
 
 EXTRA_OECONF = "--enable-threads --disable-rpath --libdir=${libdir}"
 
 do_configure() {
-	( cd ${S}; gnu-configize )
+	cd ${S}
+	gnu-configize
+	cd ${B}
 	oe_runconf
 }
 
@@ -53,13 +57,12 @@ do_install() {
 	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
-	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
+	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
 	cd ..
-	for dir in compat generic unix
-	do
+	for dir in compat generic unix; do
 		install -d ${D}${includedir}/${BPN}${VER}/$dir
 		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
 	done
@@ -91,5 +94,8 @@ do_install_ptest() {
 	cp -r ${S}/../tests ${D}${PTEST_PATH}
 }
 
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB = "*Config.sh"
+
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
-- 
1.8.5.4


