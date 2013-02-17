Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70PS-0008MB-9r for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:19:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H99wtw004288 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:09:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QA8gLhsYlzZc
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:09:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H99rCu004284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:09:56 GMT
Message-ID: <1361091808.31795.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 09:03:28 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_tar: Remove completely pointless code
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
X-List-Received-Date: Sun, 17 Feb 2013 09:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Remove/simply overcomplicated code. No functionality change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 27cddaa..5e3058d 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -2,12 +2,6 @@ inherit package
 
 IMAGE_PKGTYPE ?= "tar"
 
-python package_tar_fn () {
-    fn = os.path.join(d.getVar('DEPLOY_DIR_TAR'), "%s-%s-%s.tar.gz" % (d.getVar('PKG'), d.getVar('PKGV'), d.getVar('PKGR')))
-    fn = d.expand(fn)
-    d.setVar('PKGFN', fn)
-}
-
 python do_package_tar () {
     import subprocess
     workdir = d.getVar('WORKDIR', True)
@@ -19,42 +13,31 @@ python do_package_tar () {
     if not outdir:
         bb.error("DEPLOY_DIR_TAR not defined, unable to package")
         return
-    bb.utils.mkdirhier(outdir)
 
     dvar = d.getVar('D', True)
     if not dvar:
         bb.error("D not defined, unable to package")
         return
-    bb.utils.mkdirhier(dvar)
 
     packages = d.getVar('PACKAGES', True)
     if not packages:
         bb.debug(1, "PACKAGES not defined, nothing to package")
         return
 
+    bb.utils.mkdirhier(outdir)
+    bb.utils.mkdirhier(dvar)
+
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         root = "%s/install/%s" % (workdir, pkg)
 
-        localdata.setVar('ROOT', '')
-        localdata.setVar('ROOT_%s' % pkg, root)
-        localdata.setVar('PKG', pkg)
-
         overrides = localdata.getVar('OVERRIDES')
-        if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
-        overrides = localdata.expand(overrides)
         localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
-
         bb.data.update_data(localdata)
 
-        root = localdata.getVar('ROOT')
         bb.utils.mkdirhier(root)
         basedir = os.path.dirname(root)
-        pkgoutdir = outdir
-        bb.utils.mkdirhier(pkgoutdir)
-        bb.build.exec_func('package_tar_fn', localdata)
-        tarfn = localdata.getVar('PKGFN', True)
+        tarfn = localdata.expand("${DEPLOY_DIR_TAR}/${PKG}-${PKGV}-${PKGR}.tar.gz")
         os.chdir(root)
         from glob import glob
         if not glob('*'):




