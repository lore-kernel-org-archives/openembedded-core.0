Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZC-0005eP-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 19:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95059497"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2012 19:02:03 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:14 +0800
Message-Id: <5fb6ebfa61390b152d2ec7ab9775712e0e3aca40.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/5] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:34 -0000

packageinfo.bbclass is to pass the accurate package information to
clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/packageinfo.bbclass |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/packageinfo.bbclass

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
new file mode 100644
index 0000000..4a99b51
--- /dev/null
+++ b/meta/classes/packageinfo.bbclass
@@ -0,0 +1,30 @@
+python packageinfo_handler () {
+    if isinstance(e, bb.event.TargetsTreeGenerated) or isinstance(e, bb.event.BuildCompleted):
+        import oe.packagedata
+        pkginfolist = []
+        tmpdir = e.data.getVar('TMPDIR', True)
+        target_vendor = e.data.getVar('TARGET_VENDOR', True)
+        target_os = e.data.getVar('TARGET_OS', True)
+        package_archs = e.data.getVar('PACKAGE_ARCHS', True)
+        packaging = e.data.getVar('PACKAGE_CLASSES', True).split()[0].split('_')[1]
+        deploy_dir = e.data.getVar('DEPLOY_DIR', True) + '/' + packaging
+        for arch in package_archs.split():
+            pkgdata_dir = tmpdir + '/pkgdata/' + arch + target_vendor + '-' + target_os + '/runtime/'
+            if os.path.exists(pkgdata_dir):
+                for root, dirs, files in os.walk(pkgdata_dir):
+                    for pkgname in files:
+                        if pkgname.endswith('.packaged'):
+                            continue
+                        sdata = oe.packagedata.read_pkgdatafile(root + pkgname)
+                        sdata['PKG'] = pkgname
+                        pkgrename = sdata['PKG_%s' % pkgname]
+                        pkgv = sdata['PKGV']
+                        pkgr = sdata['PKGR']
+                        pkgname_path = deploy_dir + '/' + arch + '/' + pkgname + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging
+                        pkgrename_path = deploy_dir + '/' + arch + '/' + pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging
+                        if os.path.exists(pkgname_path) or os.path.exists(pkgrename_path):
+                            pkginfolist.append(sdata)
+        bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
+}
+
+addhandler packageinfo_handler
-- 
1.7.0.4



