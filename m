Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Sy-00062F-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:28:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 03:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,236,1304319600"; 
   d="scan'208";a="886883"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2011 03:24:26 -0700
Message-Id: <846fb39b9bb26dff90cfe8f964eb33dc44efd2d0.1305800693.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Thu, 19 May 2011 10:17:43 +0800
Date: Thu, 19 May 2011 18:29:28 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
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
X-List-Received-Date: Thu, 19 May 2011 10:28:29 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Use PRFORMAT instead of PR to build various package feed in tasks
of pacakge_write_xxx.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_deb.bbclass |    6 +++---
 meta/classes/package_ipk.bbclass |    6 +++---
 meta/classes/package_rpm.bbclass |    4 ++--
 meta/classes/package_tar.bbclass |    4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4faeb4a..1f26d34 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -272,7 +272,7 @@ python do_package_deb () {
         except ValueError:
             pass
         if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, True), bb.data.getVar('PR', localdata, True)))
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, True), bb.data.getVar('PRFORMAT', localdata, True)))
             bb.utils.unlockfile(lf)
             continue
 
@@ -290,9 +290,9 @@ python do_package_deb () {
         fields = []
         pe = bb.data.getVar('PE', d, True)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+            fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PRFORMAT']])
         else:
-            fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+            fields.append(["Version: %s-%s\n", ['PV', 'PRFORMAT']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 3c2472b..7bec136 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -241,7 +241,7 @@ python do_package_ipk () {
 		except ValueError:
 			pass
 		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PRFORMAT', localdata, 1)))
 			bb.utils.unlockfile(lf)
 			continue
 
@@ -256,9 +256,9 @@ python do_package_ipk () {
 		fields = []
 		pe = bb.data.getVar('PE', d, 1)
 		if pe and int(pe) > 0:
-			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PRFORMAT']])
 		else:
-			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+			fields.append(["Version: %s-%s\n", ['PV', 'PRFORMAT']])
 		fields.append(["Description: %s\n", ['DESCRIPTION']])
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1cf9f79..ecb6f45 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -383,7 +383,7 @@ python write_specfile () {
 	srcname    = bb.data.getVar('PN', d, True)
 	srcsummary = (bb.data.getVar('SUMMARY', d, True) or bb.data.getVar('DESCRIPTION', d, True) or ".")
 	srcversion = bb.data.getVar('PV', d, True).replace('-', '+')
-	srcrelease = bb.data.getVar('PR', d, True)
+	srcrelease = bb.data.getVar('PRFORMAT', d, True)
 	srcepoch   = (bb.data.getVar('PE', d, True) or "")
 	srclicense = bb.data.getVar('LICENSE', d, True)
 	srcsection = bb.data.getVar('SECTION', d, True)
@@ -438,7 +438,7 @@ python write_specfile () {
 
 		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
 		splitversion = (bb.data.getVar('PV', localdata, True) or "").replace('-', '+')
-		splitrelease = (bb.data.getVar('PR', localdata, True) or "")
+		splitrelease = (bb.data.getVar('PRFORMAT', localdata, True) or "")
 		splitepoch   = (bb.data.getVar('PE', localdata, True) or "")
 		splitlicense = (bb.data.getVar('LICENSE', localdata, True) or "")
 		splitsection = (bb.data.getVar('SECTION', localdata, True) or "")
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index e546eb7..d4d7980 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -3,7 +3,7 @@ inherit package
 IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
-	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PV', d), bb.data.getVar('PR', d)))
+	fn = os.path.join(bb.data.getVar('DEPLOY_DIR_TAR', d), "%s-%s-%s.tar.gz" % (bb.data.getVar('PKG', d), bb.data.getVar('PV', d), bb.data.getVar('PRFORMAT', d)))
 	fn = bb.data.expand(fn, d)
 	bb.data.setVar('PKGFN', fn, d)
 }
@@ -83,7 +83,7 @@ python do_package_tar () {
 		os.chdir(root)
 		from glob import glob
 		if not glob('*'):
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PR', localdata, 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, bb.data.getVar('PV', localdata, 1), bb.data.getVar('PRFORMAT', localdata, 1)))
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
 		if ret != 0:
-- 
1.7.0.4



