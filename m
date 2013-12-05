Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD65C6DF29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:26:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2013 08:26:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,834,1378882800"; d="scan'208";a="439184075"
Received: from jbrandeb-mobl.amr.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.15.213])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2013 08:26:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 08:26:20 -0800
Message-Id: <1386260780-28694-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] tcl: fix tclConfig.sh to point to the correct private headers
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
X-List-Received-Date: Thu, 05 Dec 2013 16:26:23 -0000

When building expect with rm_work enabled, it was not finding the correct private
header files because they were removed from the WORKDIR, this fixes the tclConfig.sh
to point to the sysroot private area instead.

This also fixes the -L directory to point to STAGING_LIBDIR instead if INCDIR!

[YOCTO #5620]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 10186c4..0d6468a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -48,11 +48,13 @@ do_compile_prepend() {
 do_install() {
 	autotools_do_install install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
+	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
+	install -m 0755 tclConfig.sh ${D}${libdir}
 	cd ..
 	for dir in compat generic unix
 	do
-- 
1.8.3.1


