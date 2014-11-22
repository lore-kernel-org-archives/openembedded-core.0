Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2991072160
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Nov 2014 04:36:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAM4a7hH008982
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 20:36:07 -0800 (PST)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 20:36:07 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Nov 2014 12:35:54 +0800
Message-ID: <1416630954-13871-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1416630954-13871-1-git-send-email-ming.liu@windriver.com>
References: <1416630954-13871-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tcltk: do not deploy bindir_crossscripts to targets
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
X-List-Received-Date: Sat, 22 Nov 2014 04:36:07 -0000
Content-Type: text/plain

It does not make much sense to deploy bindir_crossscripts to targets
especially when we have other alternatives, let binconfig handle it.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.3.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
index 73c0d25..27197fa 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
@@ -58,8 +58,7 @@ do_install() {
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
-	install -d ${D}${bindir_crossscripts}
-	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
+	install -m 0755 tclConfig.sh ${D}${bindir}
 	install -m 0755 tclConfig.sh ${D}${libdir}
 	cd ..
 	for dir in compat generic unix; do
@@ -68,11 +67,6 @@ do_install() {
 	done
 }
 
-SYSROOT_PREPROCESS_FUNCS += "tcl_sysroot_preprocess"
-tcl_sysroot_preprocess () {
-	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
-
 PACKAGES =+ "tcl-lib"
 FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
 FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
@@ -97,6 +91,7 @@ do_install_ptest() {
 
 # Fix some paths that might be used by Tcl extensions
 BINCONFIG_GLOB = "*Config.sh"
+BINCONFIG_FILES = "${bindir}/*Config.sh"
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
-- 
1.8.4.1


