Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZ7N-00067K-UT
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:52:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 04:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="8069023"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 04:49:43 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 19:55:33 +0800
Message-Id: <dc7d54e6ac952eb76bdcecad52f741cfb0bf6205.1306401007.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306401007.git.lianhao.lu@intel.com>
References: <cover.1306401007.git.lianhao.lu@intel.com>
Subject: [PATCH 4/5] classes/package_xxx.class: Added PR service support.
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
X-List-Received-Date: Thu, 26 May 2011 11:52:46 -0000

Use PKGV/PKGR to build various package feed in tasks of pacakge_write_xxx.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_deb.bbclass |    6 +++---
 meta/classes/package_ipk.bbclass |    6 +++---
 meta/classes/package_rpm.bbclass |   10 +++++-----
 meta/classes/package_tar.bbclass |    4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 000d9ee..44e8419 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -272,7 +272,7 @@ python do_package_deb () {
         except ValueError:
             pass
         if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, True), bb.data.getVar('PR', localdata, True)))
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PKGV', localdata, True), bb.data.getVar('PKGR', localdata, True)))
             bb.utils.unlockfile(lf)
             continue
 
@@ -290,9 +290,9 @@ python do_package_deb () {
         fields = []
         pe = bb.data.getVar('PE', d, True)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+            fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
         else:
-            fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+            fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a3dfc73..177be55 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -241,7 +241,7 @@ python do_package_ipk () {
 		except ValueError:
 			pass
 		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PKGV', localdata, 1), bb.data.getVar('PKGR', localdata, 1)))
 			bb.utils.unlockfile(lf)
 			continue
 
@@ -256,9 +256,9 @@ python do_package_ipk () {
 		fields = []
 		pe = bb.data.getVar('PE', d, 1)
 		if pe and int(pe) > 0:
-			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+			fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
 		else:
-			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+			fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
 		fields.append(["Description: %s\n", ['DESCRIPTION']])
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1d8c686..6bfa877 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -330,7 +330,7 @@ python write_specfile () {
 				if dep and ver:
 					if '-' in ver:
 						subd = oe.packagedata.read_subpkgdata_dict(dep, d)
-						pv = subd['PV']
+						pv = subd['PKGV']
 						reppv = pv.replace('-', '+')
 						ver = ver.replace(pv, reppv)
 				newdeps_dict[dep] = ver
@@ -383,8 +383,8 @@ python write_specfile () {
 	# Construct the SPEC file...
 	srcname    = bb.data.getVar('PN', d, True)
 	srcsummary = (bb.data.getVar('SUMMARY', d, True) or bb.data.getVar('DESCRIPTION', d, True) or ".")
-	srcversion = bb.data.getVar('PV', d, True).replace('-', '+')
-	srcrelease = bb.data.getVar('PR', d, True)
+	srcversion = bb.data.getVar('PKGV', d, True).replace('-', '+')
+	srcrelease = bb.data.getVar('PKGR', d, True)
 	srcepoch   = (bb.data.getVar('PE', d, True) or "")
 	srclicense = bb.data.getVar('LICENSE', d, True)
 	srcsection = bb.data.getVar('SECTION', d, True)
@@ -438,8 +438,8 @@ python write_specfile () {
 		splitname    = pkgname
 
 		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
-		splitversion = (bb.data.getVar('PV', localdata, True) or "").replace('-', '+')
-		splitrelease = (bb.data.getVar('PR', localdata, True) or "")
+		splitversion = (bb.data.getVar('PKGV', localdata, True) or "").replace('-', '+')
+		splitrelease = (bb.data.getVar('PKGR', localdata, True) or "")
 		splitepoch   = (bb.data.getVar('PE', localdata, True) or "")
 		splitlicense = (bb.data.getVar('LICENSE', localdata, True) or "")
 		splitsection = (bb.data.getVar('SECTION', localdata, True) or "")
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index e546eb7..a806e45 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -3,7 +3,7 @@ inherit package
 IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
-	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PV', d), bb.data.getVar('PR', d)))
+	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PKGV', d), bb.data.getVar('PKGR', d)))
 	fn = bb.data.expand(fn, d)
 	bb.data.setVar('PKGFN', fn, d)
 }
@@ -83,7 +83,7 @@ python do_package_tar () {
 		os.chdir(root)
 		from glob import glob
 		if not glob('*'):
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PKGV', localdata, 1), bb.data.getVar('PKGR', localdata, 1)))
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
 		if ret != 0:
-- 
1.7.0.4



