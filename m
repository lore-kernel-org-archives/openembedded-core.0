Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S0ZBB-0000iK-7r
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:57:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 05:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128611064"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 05:49:31 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 21:48:07 +0800
Message-Id: <8c9fb2fe5686f51c154172b25294b87694d0247c.1330003047.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/3] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Thu, 23 Feb 2012 13:57:53 -0000

packageinfo.bbclass is to pass the accurate package information to
clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/packageinfo.bbclass |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/packageinfo.bbclass

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
new file mode 100644
index 0000000..46b9097
--- /dev/null
+++ b/meta/classes/packageinfo.bbclass
@@ -0,0 +1,35 @@
+python packageinfo_handler () {
+    if isinstance(e, bb.event.RequestPackageInfo):
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
+                        pkgv = sdata['PKGV'].replace('-', '+')
+                        pkgr = sdata['PKGR']
+                        if os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging):
+                            pkginfolist.append(sdata)
+        bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
+}
+
+addhandler packageinfo_handler
-- 
1.7.4.1



