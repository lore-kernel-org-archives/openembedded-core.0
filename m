Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKP-0008UB-Vf
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:25:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2011 08:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; d="scan'208";a="37491701"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2011 08:21:26 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:39 +0800
Message-Id: <6e26d40efb3f3f0aff147286f537d1e11d90e46d.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 7/7] package_rpm: Fix package rename issue in multilib case
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
X-List-Received-Date: Wed, 03 Aug 2011 15:25:50 -0000

do_package task will write information into pkgdata and
do_package_write_rpm will read them out. Take lib32-dates as an example,
one of its RDEPENDS is li32-gtk+, and PKG_lib32-gtk+ = "libgtk-2.0",
these info is stored at:
tmp/pkgdata/x86_64-pokymllib32-linux/runtime/lib32-dates.

Function "mapping_rename_hook" in do_package_write_rpm is to handle
those renamed packages. However before it executes, translate_vers
has stripped the multilib prefix out, making it failed to find PKG_gtk+
value in pkgdata.

This commit moves the strip_multilib out of translate_vers and call it
after "mapping_rename_hook".

CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_rpm.bbclass |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a29ce9d..4a2d667 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -362,7 +362,7 @@ python write_specfile () {
 							pv = subd['PKGV']
 							reppv = pv.replace('-', '+')
 							ver = ver.replace(pv, reppv)
-				newdeps_dict[strip_multilib(dep, d)] = ver
+				newdeps_dict[dep] = ver
 			depends = bb.utils.join_deps(newdeps_dict)
 			bb.data.setVar(varname, depends.strip(), d)
 
@@ -484,12 +484,12 @@ python write_specfile () {
 		# Map the dependencies into their final form
 		bb.build.exec_func("mapping_rename_hook", localdata)
 
-		splitrdepends    = bb.data.getVar('RDEPENDS', localdata, True) or ""
-		splitrrecommends = bb.data.getVar('RRECOMMENDS', localdata, True) or ""
-		splitrsuggests   = bb.data.getVar('RSUGGESTS', localdata, True) or ""
-		splitrprovides   = bb.data.getVar('RPROVIDES', localdata, True) or ""
-		splitrreplaces   = bb.data.getVar('RREPLACES', localdata, True) or ""
-		splitrconflicts  = bb.data.getVar('RCONFLICTS', localdata, True) or ""
+		splitrdepends    = strip_multilib(bb.data.getVar('RDEPENDS', localdata, True), d) or ""
+		splitrrecommends = strip_multilib(bb.data.getVar('RRECOMMENDS', localdata, True), d) or ""
+		splitrsuggests   = strip_multilib(bb.data.getVar('RSUGGESTS', localdata, True), d) or ""
+		splitrprovides   = strip_multilib(bb.data.getVar('RPROVIDES', localdata, True), d) or ""
+		splitrreplaces   = strip_multilib(bb.data.getVar('RREPLACES', localdata, True), d) or ""
+		splitrconflicts  = strip_multilib(bb.data.getVar('RCONFLICTS', localdata, True), d) or ""
 		splitrobsoletes  = []
 
 		# Gather special src/first package data
-- 
1.7.1



