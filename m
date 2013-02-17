Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70MY-00086O-0Q for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:16:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H96whP004136 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:06:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N0RDUinKBZzL
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:06:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H96ref004132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:06:56 GMT
Message-ID: <1361091629.31795.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 09:00:29 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_rpm/dev/ipk/tar: Drop unused functions
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
X-List-Received-Date: Sun, 17 Feb 2013 09:17:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The package_xxx_install functions date from a different era and are not used by
anything. In the rpm case, they're simply unimplemented, in the tar case they're
using broken whitespace and deprecated functions. We might as well clean
out the old broken unused code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index f4b18c3..12e01d1 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -10,57 +10,6 @@ DPKG_ARCH ?= "${TARGET_ARCH}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
-python package_deb_fn () {
-    d.setVar('PKGFN', d.getVar('PKG'))
-}
-
-addtask package_deb_install
-python do_package_deb_install () {
-    pkg = d.getVar('PKG', True)
-    pkgfn = d.getVar('PKGFN', True)
-    rootfs = d.getVar('IMAGE_ROOTFS', True)
-    debdir = d.getVar('DEPLOY_DIR_DEB', True)
-    apt_config = d.expand('${STAGING_ETCDIR_NATIVE}/apt/apt.conf')
-    stagingbindir = d.getVar('STAGING_BINDIR_NATIVE', True)
-    tmpdir = d.getVar('TMPDIR', True)
-
-    if None in (pkg,pkgfn,rootfs):
-        raise bb.build.FuncFailed("missing variables (one or more of PKG, PKGFN, IMAGE_ROOTFS)")
-    try:
-        if not os.exists(rootfs):
-            os.makedirs(rootfs)
-        os.chdir(rootfs)
-    except OSError:
-        import sys
-        raise bb.build.FuncFailed(str(sys.exc_value))
-
-    # update packages file
-    (exitstatus, output) = commands.getstatusoutput('dpkg-scanpackages %s > %s/Packages' % (debdir, debdir))
-    if (exitstatus != 0 ):
-        raise bb.build.FuncFailed(output)
-
-    f = open(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"), "w")
-    f.close()
-
-    # NOTE: this env stuff is racy at best, we need something more capable
-    # than 'commands' for command execution, which includes manipulating the
-    # env of the fork+execve'd processs
-
-    # Set up environment
-    apt_config_backup = os.getenv('APT_CONFIG')
-    os.putenv('APT_CONFIG', apt_config)
-    path = os.getenv('PATH')
-    os.putenv('PATH', '%s:%s' % (stagingbindir, os.getenv('PATH')))
-
-    # install package
-    commands.getstatusoutput('apt-get update')
-    commands.getstatusoutput('apt-get install -y %s' % pkgfn)
-
-    # revert environment
-    os.putenv('APT_CONFIG', apt_config_backup)
-    os.putenv('PATH', path)
-}
-
 #
 # Update the Packages index files in ${DEPLOY_DIR_DEB}
 #
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 526c3ae..094ba09 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -14,62 +14,6 @@ OPKG_ARGS = "-f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK --force_postinstall --p
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
-python package_ipk_fn () {
-    d.setVar('PKGFN', d.getVar('PKG'))
-}
-
-python package_ipk_install () {
-    import subprocess
-
-    pkg = d.getVar('PKG', True)
-    pkgfn = d.getVar('PKGFN', True)
-    rootfs = d.getVar('IMAGE_ROOTFS', True)
-    ipkdir = d.getVar('DEPLOY_DIR_IPK', True)
-    stagingdir = d.getVar('STAGING_DIR', True)
-    tmpdir = d.getVar('TMPDIR', True)
-
-    if None in (pkg,pkgfn,rootfs):
-        raise bb.build.FuncFailed("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")
-    try:
-        bb.mkdirhier(rootfs)
-        os.chdir(rootfs)
-    except OSError:
-        import sys
-        (type, value, traceback) = sys.exc_info()
-        print value
-        raise bb.build.FuncFailed
-
-    # Generate ipk.conf if it or the stamp doesnt exist
-    conffile = os.path.join(stagingdir,"ipkg.conf")
-    if not os.access(conffile, os.R_OK):
-        ipkg_archs = d.getVar('PACKAGE_ARCHS')
-        if ipkg_archs is None:
-            bb.error("PACKAGE_ARCHS missing")
-            raise FuncFailed
-        ipkg_archs = ipkg_archs.split()
-        arch_priority = 1
-
-        f = open(conffile,"w")
-        for arch in ipkg_archs:
-            f.write("arch %s %s\n" % ( arch, arch_priority ))
-            arch_priority += 1
-        f.write("src local file:%s" % ipkdir)
-        f.close()
-
-
-    if not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK):
-        ret = subprocess.call('opkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir), shell=True)
-        if (ret != 0 ):
-            raise bb.build.FuncFailed
-        f = open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),"w")
-        f.close()
-
-    ret = subprocess.call('opkg-cl  -o %s -f %s update' % (rootfs, conffile), shell=True)
-    ret = subprocess.call('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn), shell=True)
-    if (ret != 0 ):
-        raise bb.build.FuncFailed
-}
-
 package_tryout_install_multilib_ipk() {
 	#try install multilib
 	multilib_tryout_dirs=""
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e85e027..a0715fe 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -8,14 +8,6 @@ RPMBUILD="rpmbuild"
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
 
-python package_rpm_fn () {
-    d.setVar('PKGFN', d.getVar('PKG'))
-}
-
-python package_rpm_install () {
-    bb.fatal("package_rpm_install not implemented!")
-}
-
 #
 # Update the packages indexes ${DEPLOY_DIR_RPM}
 #
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index e76ce29..aaa3ca6 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -3,36 +3,9 @@ inherit package
 IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
 	fn = os.path.join(d.getVar('DEPLOY_DIR_TAR'), "%s-%s-%s.tar.gz" % (d.getVar('PKG'), d.getVar('PKGV'), d.getVar('PKGR')))
 	fn = d.expand(fn)
 	d.setVar('PKGFN', fn)
-}
-
-python package_tar_install () {
-	import subprocess
-	pkg = d.getVar('PKG', True)
-	pkgfn = d.getVar('PKGFN', True)
-	rootfs = d.getVar('IMAGE_ROOTFS', True)
-
-	if None in (pkg,pkgfn,rootfs):
-		bb.error("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")
-		raise bb.build.FuncFailed
-	try:
-		bb.mkdirhier(rootfs)
-		os.chdir(rootfs)
-	except OSError:
-		import sys
-		(type, value, traceback) = sys.exc_info()
-		print value
-		raise bb.build.FuncFailed
-
-	if not os.access(pkgfn, os.R_OK):
-		bb.debug(1, "%s does not exist, skipping" % pkgfn)
-		raise bb.build.FuncFailed
-
-	ret = subprocess.call('zcat %s | tar -xf -' % pkgfn, shell=True)
-	if ret != 0:
-		raise bb.build.FuncFailed
 }
 
 python do_package_tar () {




