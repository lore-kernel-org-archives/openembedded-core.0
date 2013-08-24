Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8495261013
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 16:01:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7OGDcPD020649 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 17:13:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 09TOLnYx7E33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 17:13:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7OGDWZp020645
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 17:13:33 +0100
Message-ID: <1377360080.6762.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 24 Aug 2013 17:01:20 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] classes: Remove references to _remove in function names since this may become a bitbake keyword
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
X-List-Received-Date: Sat, 24 Aug 2013 16:01:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a good chance we might want to support a bitbake operator
"_remove" which works in a similar way to _append and _prepend. As
such, we can't use those keywords in function or variable names.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3d75d8e..e42c419 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -559,11 +559,11 @@ python do_archive_linux_yocto(){
 do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 
 # remove tarball for sources, patches and logs after creating srpm.
-python do_remove_tarlist(){
+python do_delete_tarlist(){
     work_dir = d.getVar('WORKDIR', True)
     tarlist = os.path.join(work_dir, 'tar-package')
     if os.path.exists(tarlist):
         os.remove(tarlist)
 }
-do_remove_tarlist[deptask] = "do_archive_scripts_logs"
-do_package_write_rpm[postfuncs] += "do_remove_tarlist "
+do_delete_tarlist[deptask] = "do_archive_scripts_logs"
+do_package_write_rpm[postfuncs] += "do_delete_tarlist "
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 909702a..ea59c36 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -335,7 +335,7 @@ fakeroot do_rootfs () {
 	fi
 
 	# remove unneeded packages/files from the final image
-	rootfs_remove_unneeded
+	rootfs_uninstall_unneeded
 
 	insert_feed_uris
 
@@ -497,7 +497,7 @@ rootfs_install_complementary() {
     fi
 }
 
-rootfs_remove_unneeded () {
+rootfs_uninstall_unneeded () {
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
 		if [ -z "$(delayed_postinsts)" ]; then
 			# All packages were successfully configured.
@@ -506,7 +506,7 @@ rootfs_remove_unneeded () {
 			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
 				remove_run_postinsts=true
 			fi
-			rootfs_remove_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
+			rootfs_uninstall_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
 
 			# Need to remove rc.d files for run-postinsts by hand since opkg won't
 			# call postrm scripts in offline root mode.
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 8b3a1c9..2f90159 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -57,7 +57,7 @@ def can_use_autotools_base(cfgdata, d):
 
     return True
 
-def can_remove_FILESPATH(cfgdata, d):
+def can_delete_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
     #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', True).split(':') for p in d.getVar('FILESPATHPKG', True).split(':') for o in (d.getVar('OVERRIDES', True) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
     expectedpaths = d.expand(expected)
@@ -71,7 +71,7 @@ def can_remove_FILESPATH(cfgdata, d):
             return False
     return expected != unexpanded
 
-def can_remove_FILESDIR(cfgdata, d):
+def can_delete_FILESDIR(cfgdata, d):
     expected = cfgdata.get("FILESDIR")
     #expected = "${@bb.which(d.getVar('FILESPATH', True), '.')}"
     unexpanded = d.getVar("FILESDIR", 0)
@@ -87,7 +87,7 @@ def can_remove_FILESDIR(cfgdata, d):
            (expanded in filespath or
             expanded == d.expand(expected))
 
-def can_remove_others(p, cfgdata, d):
+def can_delete_others(p, cfgdata, d):
     for k in ["S", "PV", "PN", "DESCRIPTION", "DEPENDS",
               "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
     #for k in cfgdata:
@@ -113,8 +113,8 @@ python do_recipe_sanity () {
     p = "%s %s %s" % (d.getVar("PN", True), d.getVar("PV", True), d.getVar("PR", True))
 
     sanitychecks = [
-        (can_remove_FILESDIR, "candidate for removal of FILESDIR"),
-        (can_remove_FILESPATH, "candidate for removal of FILESPATH"),
+        (can_delete_FILESDIR, "candidate for removal of FILESDIR"),
+        (can_delete_FILESPATH, "candidate for removal of FILESPATH"),
         #(can_use_autotools_base, "candidate for use of autotools_base"),
         (incorrect_nonempty_PACKAGES, "native or cross recipe with non-empty PACKAGES"),
     ]
@@ -124,7 +124,7 @@ python do_recipe_sanity () {
         if func(cfgdata, d):
             __note(msg, d)
 
-    can_remove_others(p, cfgdata, d)
+    can_delete_others(p, cfgdata, d)
     var_renames_overwrite(cfgdata, d)
     req_vars(cfgdata, d)
     bad_runtime_vars(cfgdata, d)
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index dcfe786..0161f7a 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -125,7 +125,7 @@ rootfs_install_packages() {
 	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
 }
 
-rootfs_remove_packages() {
+rootfs_uninstall_packages() {
 	# for some reason, --root doesn't really work here... We use --admindir&--instdir instead.
 	${STAGING_BINDIR_NATIVE}/dpkg --admindir=${IMAGE_ROOTFS}/var/lib/dpkg --instdir=${IMAGE_ROOTFS} -r --force-depends $@
 }
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index c9650cb..a37ab14 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -136,7 +136,7 @@ rootfs_install_packages() {
 	opkg-cl ${OPKG_ARGS} install `cat $1`
 }
 
-rootfs_remove_packages() {
+rootfs_uninstall_packages() {
 	opkg-cl ${OPKG_ARGS} --force-depends remove $@
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 30b52d4..6c68ac8 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -178,7 +178,7 @@ rootfs_install_packages() {
 	package_install_internal_rpm
 }
 
-rootfs_remove_packages() {
+rootfs_uninstall_packages() {
 	rpm -e --nodeps --root=${IMAGE_ROOTFS} --dbpath=/var/lib/rpm\
 		--define='_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper'\
 		--define='_tmppath /install/tmp' $@



