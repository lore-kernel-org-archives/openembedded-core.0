Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYD-0003fP-8K
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 23:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="8494464"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 23:26:32 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:49 +0800
Message-Id: <1a747e8eee9ae2c68d66278835af4b912714647e.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 05/11] classes/package_xxx.class: Use PKGE/PKGV/PKGR.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:38 -0000

Use PKGE/PKGV/PKGR to build various package feed in tasks of pacakge_write_xxx.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_deb.bbclass |    8 ++++----
 meta/classes/package_ipk.bbclass |    8 ++++----
 meta/classes/package_rpm.bbclass |   14 +++++++-------
 meta/classes/package_tar.bbclass |    4 ++--
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 000d9ee..fb502cb 100644
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
 
@@ -288,11 +288,11 @@ python do_package_deb () {
             raise bb.build.FuncFailed("unable to open control file for writing.")
 
         fields = []
-        pe = bb.data.getVar('PE', d, True)
+        pe = bb.data.getVar('PKGE', d, True)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+            fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
         else:
-            fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+            fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a3dfc73..4317028 100644
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
 
@@ -254,11 +254,11 @@ python do_package_ipk () {
 			raise bb.build.FuncFailed("unable to open control file for writing.")
 
 		fields = []
-		pe = bb.data.getVar('PE', d, 1)
+		pe = bb.data.getVar('PKGE', d, 1)
 		if pe and int(pe) > 0:
-			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+			fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
 		else:
-			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+			fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
 		fields.append(["Description: %s\n", ['DESCRIPTION']])
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1d8c686..3df66cc 100644
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
@@ -383,9 +383,9 @@ python write_specfile () {
 	# Construct the SPEC file...
 	srcname    = bb.data.getVar('PN', d, True)
 	srcsummary = (bb.data.getVar('SUMMARY', d, True) or bb.data.getVar('DESCRIPTION', d, True) or ".")
-	srcversion = bb.data.getVar('PV', d, True).replace('-', '+')
-	srcrelease = bb.data.getVar('PR', d, True)
-	srcepoch   = (bb.data.getVar('PE', d, True) or "")
+	srcversion = bb.data.getVar('PKGV', d, True).replace('-', '+')
+	srcrelease = bb.data.getVar('PKGR', d, True)
+	srcepoch   = (bb.data.getVar('PKGE', d, True) or "")
 	srclicense = bb.data.getVar('LICENSE', d, True)
 	srcsection = bb.data.getVar('SECTION', d, True)
 	srcmaintainer  = bb.data.getVar('MAINTAINER', d, True)
@@ -438,9 +438,9 @@ python write_specfile () {
 		splitname    = pkgname
 
 		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
-		splitversion = (bb.data.getVar('PV', localdata, True) or "").replace('-', '+')
-		splitrelease = (bb.data.getVar('PR', localdata, True) or "")
-		splitepoch   = (bb.data.getVar('PE', localdata, True) or "")
+		splitversion = (bb.data.getVar('PKGV', localdata, True) or "").replace('-', '+')
+		splitrelease = (bb.data.getVar('PKGR', localdata, True) or "")
+		splitepoch   = (bb.data.getVar('PKGE', localdata, True) or "")
 		splitlicense = (bb.data.getVar('LICENSE', localdata, True) or "")
 		splitsection = (bb.data.getVar('SECTION', localdata, True) or "")
 		splitdescription = (bb.data.getVar('DESCRIPTION', localdata, True) or ".")
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



