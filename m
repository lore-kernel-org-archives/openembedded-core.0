Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70Ng-0008D0-9i for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:18:22 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H988EX004163 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jmiOR2f+t8jm
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H980Vd004159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:02 GMT
Message-ID: <1361091695.31795.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 09:01:35 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_tar: Fix whitespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 09:18:29 -0000
X-List-Received-Date: Sun, 17 Feb 2013 09:18:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index aaa3ca6..475c898 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -3,66 +3,66 @@ inherit package
 IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
-	fn = os.path.join(d.getVar('DEPLOY_DIR_TAR'), "%s-%s-%s.tar.gz" % (d.getVar('PKG'), d.getVar('PKGV'), d.getVar('PKGR')))
-	fn = d.expand(fn)
-	d.setVar('PKGFN', fn)
+    fn = os.path.join(d.getVar('DEPLOY_DIR_TAR'), "%s-%s-%s.tar.gz" % (d.getVar('PKG'), d.getVar('PKGV'), d.getVar('PKGR')))
+    fn = d.expand(fn)
+    d.setVar('PKGFN', fn)
 }
 
 python do_package_tar () {
-	import subprocess
-	workdir = d.getVar('WORKDIR', True)
-	if not workdir:
-		bb.error("WORKDIR not defined, unable to package")
-		return
+    import subprocess
+    workdir = d.getVar('WORKDIR', True)
+    if not workdir:
+        bb.error("WORKDIR not defined, unable to package")
+        return
 
-	outdir = d.getVar('DEPLOY_DIR_TAR', True)
-	if not outdir:
-		bb.error("DEPLOY_DIR_TAR not defined, unable to package")
-		return
-	bb.mkdirhier(outdir)
+    outdir = d.getVar('DEPLOY_DIR_TAR', True)
+    if not outdir:
+        bb.error("DEPLOY_DIR_TAR not defined, unable to package")
+        return
+    bb.mkdirhier(outdir)
 
-	dvar = d.getVar('D', True)
-	if not dvar:
-		bb.error("D not defined, unable to package")
-		return
-	bb.mkdirhier(dvar)
+    dvar = d.getVar('D', True)
+    if not dvar:
+        bb.error("D not defined, unable to package")
+        return
+    bb.mkdirhier(dvar)
 
-	packages = d.getVar('PACKAGES', True)
-	if not packages:
-		bb.debug(1, "PACKAGES not defined, nothing to package")
-		return
+    packages = d.getVar('PACKAGES', True)
+    if not packages:
+        bb.debug(1, "PACKAGES not defined, nothing to package")
+        return
 
-	for pkg in packages.split():
-		localdata = bb.data.createCopy(d)
-		root = "%s/install/%s" % (workdir, pkg)
+    for pkg in packages.split():
+        localdata = bb.data.createCopy(d)
+        root = "%s/install/%s" % (workdir, pkg)
 
-		localdata.setVar('ROOT', '')
-		localdata.setVar('ROOT_%s' % pkg, root)
-		localdata.setVar('PKG', pkg)
+        localdata.setVar('ROOT', '')
+        localdata.setVar('ROOT_%s' % pkg, root)
+        localdata.setVar('PKG', pkg)
 
-		overrides = localdata.getVar('OVERRIDES')
-		if not overrides:
-			raise bb.build.FuncFailed('OVERRIDES not defined')
-		overrides = localdata.expand(overrides)
-		localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
+        overrides = localdata.getVar('OVERRIDES')
+        if not overrides:
+            raise bb.build.FuncFailed('OVERRIDES not defined')
+        overrides = localdata.expand(overrides)
+        localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
 
-		bb.data.update_data(localdata)
+        bb.data.update_data(localdata)
 
-		root = localdata.getVar('ROOT')
-		bb.mkdirhier(root)
-		basedir = os.path.dirname(root)
-		pkgoutdir = outdir
-		bb.mkdirhier(pkgoutdir)
-		bb.build.exec_func('package_tar_fn', localdata)
-		tarfn = localdata.getVar('PKGFN', True)
-		os.chdir(root)
-		from glob import glob
-		if not glob('*'):
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
-			continue
-		ret = subprocess.call("tar -czf %s %s" % (tarfn, '.'), shell=True)
-		if ret != 0:
-			bb.error("Creation of tar %s failed." % tarfn)
+        root = localdata.getVar('ROOT')
+        bb.mkdirhier(root)
+        basedir = os.path.dirname(root)
+        pkgoutdir = outdir
+        bb.mkdirhier(pkgoutdir)
+        bb.build.exec_func('package_tar_fn', localdata)
+        tarfn = localdata.getVar('PKGFN', True)
+        os.chdir(root)
+        from glob import glob
+        if not glob('*'):
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
+            continue
+        ret = subprocess.call("tar -czf %s %s" % (tarfn, '.'), shell=True)
+        if ret != 0:
+            bb.error("Creation of tar %s failed." % tarfn)
 }
 
 python () {
@@ -76,8 +76,8 @@ python () {
 
 
 python do_package_write_tar () {
-	bb.build.exec_func("read_subpackage_metadata", d)
-	bb.build.exec_func("do_package_tar", d)
+    bb.build.exec_func("read_subpackage_metadata", d)
+    bb.build.exec_func("do_package_tar", d)
 }
 do_package_write_tar[dirs] = "${D}"
 addtask package_write_tar before do_build after do_packagedata do_package




