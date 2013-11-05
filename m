Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A001C6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:09:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M97rI005533 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:09:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mfPnGRefdwtO
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:09:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M91ZC005513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:09:02 GMT
Message-ID: <1383689336.6271.180.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Nov 2013 22:08:56 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_deb/package_ipk: Cleanup control file handling/races
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
X-List-Received-Date: Tue, 05 Nov 2013 22:09:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you Ctrl+C ppackage_write_{deb/ipk} control files can get left lying around
and make it into another packaging format. This ensures we cleanup all known
control files before starting packaging. We can simplify some of the globbing
as a result.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 6a8e080..d18c250 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -202,6 +202,12 @@ python do_package_deb () {
 
     pkgdest = d.getVar('PKGDEST', True)
 
+    def cleanupcontrol(root):
+        for p in ['CONTROL', 'DEBIAN']:
+            p = os.path.join(root, p)
+            if os.path.exists(p):
+                bb.utils.prunedir(p)
+
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         root = "%s/%s" % (pkgdest, pkg)
@@ -224,13 +230,9 @@ python do_package_deb () {
         bb.utils.mkdirhier(pkgoutdir)
 
         os.chdir(root)
+        cleanupcontrol(root)
         from glob import glob
         g = glob('*')
-        try:
-            del g[g.index('DEBIAN')]
-            del g[g.index('./DEBIAN')]
-        except ValueError:
-            pass
         if not g and localdata.getVar('ALLOW_EMPTY') != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
             bb.utils.unlockfile(lf)
@@ -402,11 +404,10 @@ python do_package_deb () {
         os.chdir(basedir)
         ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
         if ret != 0:
-            bb.utils.prunedir(controldir)
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("dpkg-deb execution failed")
 
-        bb.utils.prunedir(controldir)
+        cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 }
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a633cfc..d0db945 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -234,6 +234,12 @@ python do_package_ipk () {
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
 
+    def cleanupcontrol(root):
+        for p in ['CONTROL', 'DEBIAN']:
+            p = os.path.join(root, p)
+            if os.path.exists(p):
+                bb.utils.prunedir(p)
+
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         root = "%s/%s" % (pkgdest, pkg)
@@ -255,13 +261,9 @@ python do_package_ipk () {
         pkgoutdir = "%s/%s" % (outdir, arch)
         bb.utils.mkdirhier(pkgoutdir)
         os.chdir(root)
+        cleanupcontrol(root)
         from glob import glob
         g = glob('*')
-        try:
-            del g[g.index('CONTROL')]
-            del g[g.index('./CONTROL')]
-        except ValueError:
-            pass
         if not g and localdata.getVar('ALLOW_EMPTY') != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
             bb.utils.unlockfile(lf)
@@ -407,7 +409,7 @@ python do_package_ipk () {
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("opkg-build execution failed")
 
-        bb.utils.prunedir(controldir)
+        cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
 }



