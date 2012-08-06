Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SyHZR-0006R2-7p
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 09:17:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q76760tK027831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 00:06:00 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 6 Aug 2012 00:05:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Aug 2012 15:05:44 +0800
Message-ID: <dcb54534accacfee23d0ad69ab0e105baa81054d.1344236526.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1344236526.git.jackie.huang@windriver.com>
References: <cover.1344236526.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
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
X-List-Received-Date: Mon, 06 Aug 2012 07:17:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

tclConfig.sh is changed in do_install for cross compile and
is installed to STAGING_BINDIR_CROSS, but if SSTATE_DIR is set
and tcl is from sstage, tclConfig.sh can't be found in
STAGING_BINDIR_CROSS, add ${bindir_crossscripts}/tclConfig.sh
to sysroot stage can fix it.

[YOCTO #2891]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index d5cf6dc..f19e25a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -49,8 +49,8 @@ do_install() {
 	#sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
-	install -d ${STAGING_BINDIR_CROSS}/
-	install -m 0755 tclConfig.sh ${STAGING_BINDIR_CROSS}
+	install -d ${D}${bindir_crossscripts}
+	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	cd ..
 	for dir in compat generic unix
 	do
@@ -59,6 +59,11 @@ do_install() {
 	done
 }
 
+SYSROOT_PREPROCESS_FUNCS += "tcl_sysroot_preprocess"
+tcl_sysroot_preprocess () {
+	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
+}
+
 PACKAGES =+ "tcl-lib"
 FILES_tcl-lib = "${libdir}/libtcl8.5.so*"
 FILES_${PN} += "${prefix}/lib/tcl8.5 ${prefix}/lib/tcl8"
-- 
1.7.4



