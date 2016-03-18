Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1C2C6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I92PVF017692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Mar 2016 02:02:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:50 -0400
Message-ID: <f25a727175913bd00e96caacdf486530c39a262e.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/18] tcl: fix buildpath QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:26 -0000
Content-Type: text/plain

- Tweak DEBUG_FLAGS, since ${S} is not normal format

- Remove build path in tclConfig.sh

- Tweak sed expression at tclConfig.sh to strict the pattern

[YOCTO #8457]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
index 8e92b3e..f32419e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
@@ -30,6 +30,7 @@ SRC_URI[sha256sum] = "9e6ed94c981c1d0c5f5fefb8112d06c6bf4d050a7327e95e71d417c416
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
+DEBUG_FLAGS += "-fdebug-prefix-map=${WORKDIR}/${BPN}${PV}=/usr/src/${BPN}"
 
 VER = "${PV}"
 
@@ -54,8 +55,8 @@ do_install() {
 	autotools_do_install install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
-	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
-	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s,-L${B},-L${STAGING_LIBDIR},g" tclConfig.sh
+	sed -i "s,='${WORKDIR},='${STAGING_INCDIR},g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
@@ -73,6 +74,14 @@ tcl_sysroot_preprocess () {
 	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
+inherit fix_buildpaths
+PACKAGE_BUILDPATH_TEXT_FILES ?= "${bindir_crossscripts}/tclConfig.sh \
+                                 ${libdir}/tclConfig.sh \
+"
+PACKAGE_BUILDPATH_TEXT_PATTERNS += " \
+    -e 's:-fdebug-prefix-map=${WORKDIR}/${BPN}${PV}=/usr/src/${BPN}::g'\
+"
+
 PACKAGES =+ "tcl-lib"
 FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
 FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
-- 
1.9.1


