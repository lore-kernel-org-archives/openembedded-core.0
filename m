Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B53C17198F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 09:07:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9B974XH002599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 02:07:04 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 11 Oct 2017 02:07:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Oct 2017 02:07:03 -0700
Message-ID: <20171011090703.17303-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] tcl: remove host path from tclConfig.sh
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
X-List-Received-Date: Wed, 11 Oct 2017 09:07:03 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The tclConfig.sh is also used by other packages (such as expect) for
cross-compiling, the host path from it can't be removed directly in
the do_install step.

With PACKAGE_PREPROCESS_FUNCS to remove host path and avoid the
crossscripts installed to target.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.7.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.7.bb b/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
index d00d2dc62b..dac73be6e7 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
@@ -86,3 +86,16 @@ BINCONFIG_GLOB = "*Config.sh"
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
+
+# Cleanup host path from ${libdir}/tclConfig.sh and remove the
+# ${bindir_crossscripts}/tclConfig.sh from target
+PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
+tcl_package_preprocess() {
+	sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
+	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
+	       -e "s;${STAGING_INCDIR};${includedir};g" \
+	       -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+	       ${PKGD}${libdir}/tclConfig.sh
+
+	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
+}
-- 
2.13.0


