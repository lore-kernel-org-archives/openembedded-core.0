Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Syyjd-0001gn-QX
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 07:23:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q785BLoA014387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 22:11:22 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 7 Aug 2012 22:11:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Aug 2012 13:11:17 +0800
Message-ID: <a872a03486a427c12e97a55f58dd1b79abbf5b4b.1344402403.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1344402403.git.jackie.huang@windriver.com>
References: <cover.1344402403.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Liezhi.Yang@windriver.com
Subject: [PATCH 1/1] tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.
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
X-List-Received-Date: Wed, 08 Aug 2012 05:23:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The line 'sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh'
is commented somehow in previous commit, so that TCL_SRC_DIR
point to the tcl workdir which will cause package that use it
fail to configure or compile when the tcl workdir is removed,
so uncomment it back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index f19e25a..e5fe7d3 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -46,7 +46,7 @@ do_install() {
 	autotools_do_install
 	oe_libinstall -so libtcl8.5 ${STAGING_LIBDIR}
 	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
-	#sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
 	install -d ${D}${bindir_crossscripts}
-- 
1.7.4



