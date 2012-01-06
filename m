Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rj5ol-0007dI-LJ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:10:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 01:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93582157"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 01:03:08 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 17:05:02 +0800
Message-Id: <0642f4ea3b43b7753405481c5f4999cf9f822142.1325840474.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325840092.git.dongxiao.xu@intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1325840474.git.dongxiao.xu@intel.com>
References: <cover.1325840474.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/7] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Fri, 06 Jan 2012 09:10:31 -0000

packageinfo.bbclass is to pass the accurate package information to
clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/packageinfo.bbclass |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/packageinfo.bbclass

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
new file mode 100644
index 0000000..644b482
--- /dev/null
+++ b/meta/classes/packageinfo.bbclass
@@ -0,0 +1,30 @@
+inherit packagedata
+
+python do_package_info () {
+    bb.build.exec_func("read_subpackage_metadata", d)
+    pn = d.getVar('PN', True) or ""
+    pv = d.getVar('PV', True) or ""
+    pr = d.getVar('PR', True) or ""
+    recipe = pn + '-' + pv + '-' + pr
+
+    packages = d.getVar('PACKAGES', True) or ""
+    pkginfolist = []
+    for pkg in packages.split():
+        pkginfo = {}
+        pkginfo['pkg'] = pkg
+        pkginfo['pkgv'] = d.getVar('PKGV', True) or ""
+        pkginfo['pkgr'] = d.getVar('PKGR', True) or ""
+        pkginfo['pkg_rename'] = d.getVar('PKG_%s' % pkg, True) or ""
+        pkginfo['section'] = d.getVar('SECTION', True) or ""
+        pkginfo['summary'] = d.getVar('SUMMARY', True) or ""
+        pkginfo['rdep'] = d.getVar('RDEPENDS_%s' % pkg, True) or ""
+        pkginfo['rrec'] = d.getVar('RRECOMMENDS_%s' % pkg, True) or ""
+        pkginfo['rprov'] = d.getVar('RPROVIDES_%s' % pkg, True) or ""
+        pkginfo['size'] = d.getVar('PKGSIZE_%s' % pkg, True) or ""
+        pkginfo['allow_empty'] = d.getVar('ALLOW_EMPTY_%s' % pkg, True) or d.getVar('ALLOW_EMPTY', True) or ""
+        pkginfolist.append(pkginfo)
+
+    bb.event.fire(bb.event.PackageInfo(recipe, pkginfolist), d)
+}
+do_package_info[nostamp] = "1"
+addtask package_info after do_package_write
-- 
1.7.0.4



