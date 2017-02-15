Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4321777230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:25:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1F6PKXZ032426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:25:20 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Feb 2017 22:25:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2017 22:25:08 -0800
Message-ID: <5dbf7c0bb50293384d06a88fe8f90e1650386873.1487139819.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487139819.git.liezhi.yang@windriver.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] tcl: extend to nativesdk
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
X-List-Received-Date: Wed, 15 Feb 2017 06:25:20 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-expect
ERROR: Nothing PROVIDES 'nativesdk-tcl' (but virtual:nativesdk:expect_5.45.bb DEPENDS on or otherwise requires it). Close matches:
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
index 2dd0a7a..c828b38 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
@@ -54,8 +54,8 @@ do_install() {
 	autotools_do_install install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
-	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
-	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
+	sed -i "s;${WORKDIR};${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
@@ -78,7 +78,7 @@ RDEPENDS_${PN} += "tcl-lib"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-ptest += "libgcc"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
 	oe_runmake tcltest
-- 
2.10.2


