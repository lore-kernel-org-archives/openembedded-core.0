Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C850960107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3Fmon021620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:15:48 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:15:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:15:46 -0700
Message-ID: <b85d93c20fe3d845e7ff42e3ba1c26d5124e3781.1464059717.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1464059717.git.liezhi.yang@windriver.com>
References: <cover.1464059717.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcl: fix sed command in do_install
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
X-List-Received-Date: Tue, 24 May 2016 03:15:48 -0000
Content-Type: text/plain

The -I= and -L= is used for cross compile, target doesn't need, and
binconfig.class can handle usr/bin/crossscripts/tclConfig.sh.

Fix do_configure error for the recipe which uses tclConfig.sh, for
example, postgresql.do_configure:
configure: error: header file <tcl.h> is required for Tcl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
index 61be81d..14ca9ba 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
@@ -56,8 +56,6 @@ do_install() {
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
 	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
-	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
-	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
-- 
2.7.4


