Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1SrXVh-0003sN-VK
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 18:54:02 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6IGgdBg014123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 09:42:39 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 12:42:35 -0400
Message-Id: <1342629755-23841-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] tcl: fix tcl INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Wed, 18 Jul 2012 16:54:02 -0000

TCL_INCLUDE_SPEC -I/usr/include will cause problems cross configure/compile
TCL_LIB_SPEC -L${libdir} will cause problems too when link.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index 1d43371..d5cf6dc 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -46,8 +46,9 @@ do_install() {
 	autotools_do_install
 	oe_libinstall -so libtcl8.5 ${STAGING_LIBDIR}
 	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
-	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
-	sed -i "s,-L${libdir},," tclConfig.sh
+	#sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
+	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
 	install -d ${STAGING_BINDIR_CROSS}/
 	install -m 0755 tclConfig.sh ${STAGING_BINDIR_CROSS}
 	cd ..
-- 
1.7.9.5



