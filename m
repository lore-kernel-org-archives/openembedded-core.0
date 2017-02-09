Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB12B6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 23:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v19N6Zl0001389; Thu, 9 Feb 2017 23:06:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6zfDOjkRSneJ; Thu,  9 Feb 2017 23:06:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v19N6Vdk001385
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Feb 2017 23:06:32 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbxnL-0002Fp-Rp; Thu, 09 Feb 2017 23:06:31 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 23:06:28 +0000
Message-Id: <1486681588-8626-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] classes: Drop now unneeded update_data calls
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
X-List-Received-Date: Thu, 09 Feb 2017 23:06:39 -0000

Now that the datastore works dynamically we don't need the update_data calls
so we can just remove them. They're not actually done anything at all for
a while.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                  |  2 --
 meta/classes/buildhistory.bbclass          |  1 -
 meta/classes/distrodata.bbclass            | 15 ---------------
 meta/classes/grub-efi.bbclass              |  1 -
 meta/classes/image.bbclass                 |  1 -
 meta/classes/insane.bbclass                |  2 --
 meta/classes/multilib.bbclass              |  1 -
 meta/classes/multilib_global.bbclass       |  3 ---
 meta/classes/package_deb.bbclass           |  1 -
 meta/classes/package_ipk.bbclass           |  1 -
 meta/classes/package_rpm.bbclass           |  2 --
 meta/classes/package_tar.bbclass           |  1 -
 meta/classes/populate_sdk_ext.bbclass      |  1 -
 meta/classes/sanity.bbclass                |  1 -
 meta/classes/sstate.bbclass                |  2 --
 meta/classes/syslinux.bbclass              |  1 -
 meta/classes/systemd-boot.bbclass          |  1 -
 meta/classes/systemd.bbclass               |  1 -
 meta/classes/uboot-extlinux-config.bbclass |  1 -
 meta/classes/update-rc.d.bbclass           |  1 -
 meta/classes/utils.bbclass                 |  2 --
 meta/lib/oe/distro_check.py                |  4 ----
 meta/lib/oe/package_manager.py             |  2 --
 meta/recipes-core/glibc/glibc-ld.inc       |  1 -
 meta/recipes-core/meta/meta-environment.bb |  1 -
 meta/recipes-devtools/gcc/gcc-common.inc   |  1 -
 meta/recipes-devtools/rpm/rpm_5.4.16.bb    |  1 -
 scripts/lib/recipetool/create.py           |  1 -
 28 files changed, 53 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 965518c..d6116e1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -222,7 +222,6 @@ python base_eventhandler() {
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
-        bb.data.update_data(localdata)
         statuslines = []
         for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
             g = globals()
@@ -355,7 +354,6 @@ def set_packagetriplet(d):
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
-        bb.data.update_data(localdata)
 
         archs.append(localdata.getVar("PACKAGE_ARCHS").split())
         tos.append(localdata.getVar("TARGET_OS"))
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 73cd886..7251a2c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -594,7 +594,6 @@ def buildhistory_get_build_id(d):
     if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
     statuslines = []
     for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
         g = globals()
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 9587ba0..5e34441 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -38,32 +38,27 @@ python do_distrodata_np() {
             pnstripped = pn.split("-native")
             bb.note("Native Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.find("-crosssdk") != -1:
             pnstripped = pn.split("-crosssdk")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.startswith("nativesdk-"):
             pnstripped = pn.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
 
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
         pname = localdata.getVar('PN')
@@ -127,31 +122,26 @@ python do_distrodata() {
             pnstripped = pn.split("-native")
             bb.note("Native Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.startswith("nativesdk-"):
             pnstripped = pn.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.find("-crosssdk") != -1:
             pnstripped = pn.split("-crosssdk")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
         pname = localdata.getVar('PN')
@@ -292,7 +282,6 @@ python do_checkpkg() {
             pnstripped = pname.split("-native")
             bb.note("Native Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pname.startswith("nativesdk-"):
             if d.getVar('BBCLASSEXTEND'):
@@ -300,19 +289,16 @@ python do_checkpkg() {
             pnstripped = pname.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pname.find("-cross") != -1:
             pnstripped = pname.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         if pname.find("-initial") != -1:
             pnstripped = pname.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-            bb.data.update_data(localdata)
 
         pdesc = localdata.getVar('DESCRIPTION')
         pgrp = localdata.getVar('SECTION')
@@ -401,7 +387,6 @@ python do_distro_check() {
         return
 
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
     tmpdir = d.getVar('TMPDIR')
     distro_check_dir = os.path.join(tmpdir, "distro_check")
     logpath = d.getVar('LOG_DIR')
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 8adda09..df7fe18 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -133,7 +133,6 @@ python build_efi_cfg() {
 
         for btype in btypes:
             localdata.setVar('OVERRIDES', label + ':' + overrides)
-            bb.data.update_data(localdata)
 
             cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
             lb = label
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d501d23..98f5270 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -431,7 +431,6 @@ python () {
             debug = "setup_debugfs "
             realt = t[8:]
         localdata.setVar('OVERRIDES', '%s:%s' % (realt, old_overrides))
-        bb.data.update_data(localdata)
         localdata.setVar('type', realt)
         # Delete DATETIME so we don't expand any references to it now
         # This means the task's hash can be stable rather than having hardcoded
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3cf86c1..7fa0040 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -910,7 +910,6 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', pkg)
-        bb.data.update_data(localdata)
 
         # Now check the RDEPENDS
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or "")
@@ -1017,7 +1016,6 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 
     localdata = bb.data.createCopy(d)
     localdata.setVar('OVERRIDES', pkg)
-    bb.data.update_data(localdata)
 
     def check_valid_deps(var):
         try:
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index a4f70f2..401e0c2 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -36,7 +36,6 @@ python multilib_virtclass_handler () {
         e.data.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-        bb.data.update_data(e.data)
         return
 
     if bb.data.inherits_class('native', e.data):
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index c9869fd..fd0bfe1 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -29,7 +29,6 @@ def preferred_ml_updates(d):
                 localdata = bb.data.createCopy(d)
                 override = ":virtclass-multilib-" + p
                 localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-                bb.data.update_data(localdata)
                 if "-canadian-" in pkg:
                     newname = localdata.expand(v)
                 else:
@@ -57,7 +56,6 @@ def preferred_ml_updates(d):
                 localdata = bb.data.createCopy(d)
                 override = ":virtclass-multilib-" + p
                 localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-                bb.data.update_data(localdata)
                 newname = localdata.expand(prov)
                 if newname != prov:
                     newval = localdata.expand(val)
@@ -80,7 +78,6 @@ def preferred_ml_updates(d):
             localdata = bb.data.createCopy(d)
             override = ":virtclass-multilib-" + p
             localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
-            bb.data.update_data(localdata)
             newname = localdata.expand(prov)
             if newname != prov and not d.getVar(newname, False):
                 d.setVar(newname, localdata.expand(newval))
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eb549ca..4f107b5 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -106,7 +106,6 @@ python do_package_deb () {
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
-        bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
 
         pkgoutdir = os.path.join(outdir, localdata.getVar('PACKAGE_ARCH'))
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a76b235..fa47385 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -63,7 +63,6 @@ python do_package_ipk () {
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
-        bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
         arch = localdata.getVar('PACKAGE_ARCH')
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bde0453..db448ab 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -335,8 +335,6 @@ python write_specfile () {
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
-        bb.data.update_data(localdata)
-
         conffiles = get_conffiles(pkg, d)
         dirfiles = localdata.getVar('DIRFILES')
         if dirfiles is not None:
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 1ffc416..ce3ab4c 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -38,7 +38,6 @@ python do_package_tar () {
 
         overrides = localdata.getVar('OVERRIDES', False)
         localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
-        bb.data.update_data(localdata)
 
         bb.utils.mkdirhier(root)
         basedir = os.path.dirname(root)
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 95b3d23..fff0f12 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -657,7 +657,6 @@ do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
 def get_sdk_ext_rdepends(d):
     localdata = d.createCopy()
     localdata.appendVar('OVERRIDES', ':task-populate-sdk-ext')
-    bb.data.update_data(localdata)
     return localdata.getVarFlag('do_populate_sdk', 'rdepends')
 
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7bcceee..0f3ede2b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -226,7 +226,6 @@ def check_toolchain_tune(data, tune, multilib):
         # Apply the overrides so we can look at the details.
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + multilib
         localdata.setVar("OVERRIDES", overrides)
-    bb.data.update_data(localdata)
     bb.debug(2, "Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
     features = (localdata.getVar("TUNE_FEATURES_tune-%s" % tune) or "").split()
     if not features:
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index bd9c2ae..465fdcf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -645,7 +645,6 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Copy the data object and override DL_DIR and SRC_URI
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
 
     dldir = localdata.expand("${SSTATE_DIR}")
     bb.utils.mkdirhier(dldir)
@@ -802,7 +801,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
         localdata = bb.data.createCopy(d)
-        bb.data.update_data(localdata)
 
         dldir = localdata.expand("${SSTATE_DIR}")
         localdata.delVar('MIRRORS')
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d8859b3..d6f8824 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -163,7 +163,6 @@ python build_syslinux_cfg () {
             bb.fatal('OVERRIDES not defined')
 
         localdata.setVar('OVERRIDES', label + ':' + overrides)
-        bb.data.update_data(localdata)
     
         btypes = [ [ "", syslinux_default_console ] ]
         if menu and syslinux_serial:
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 6a2cbc8..6d002c0 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -103,7 +103,6 @@ python build_efi_cfg() {
         except OSError:
             bb.fatal('Unable to open %s' % entryfile)
         localdata.setVar('OVERRIDES', label + ':' + overrides)
-        bb.data.update_data(localdata)
 
         entrycfg.write('title %s\n' % label)
         entrycfg.write('linux /vmlinuz\n')
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 1ce0b94..c4b4bb9 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -89,7 +89,6 @@ python systemd_populate_packages() {
         # variable.
         localdata = d.createCopy()
         localdata.prependVar("OVERRIDES", pkg + ":")
-        bb.data.update_data(localdata)
 
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index ec5fffb..904d5b3 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -90,7 +90,6 @@ python create_extlinux_config() {
                     bb.fatal('OVERRIDES not defined')
 
                 localdata.setVar('OVERRIDES', label + ':' + overrides)
-                bb.data.update_data(localdata)
 
                 extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE')
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 36f9009..9ba3dac 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -104,7 +104,6 @@ python populate_packages_updatercd () {
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES")
         localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
-        bb.data.update_data(localdata)
 
         update_rcd_auto_depend(pkg)
 
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index fe75f73..96463ab 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -368,7 +368,6 @@ def get_multilib_datastore(variant, d):
     overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
     localdata.setVar("OVERRIDES", overrides)
     localdata.setVar("MLPREFIX", variant + "-")
-    bb.data.update_data(localdata)
     return localdata
 
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
@@ -423,7 +422,6 @@ def all_multilib_tune_list(vars, d):
     origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
     if origdefault:
         localdata.setVar("DEFAULTTUNE", origdefault)
-    bb.data.update_data(localdata)
     values['ml'] = ['']
     for v in vars:
         values[v].append(localdata.getVar(v))
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index f54f4bb..37f04ed 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -230,25 +230,21 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     if pn.find("-native") != -1:
         pnstripped = pn.split("-native")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-        bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.startswith("nativesdk-"):
         pnstripped = pn.split("nativesdk-")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.getVar('OVERRIDES'))
-        bb.data.update_data(localdata)
         recipe_name = pnstripped[1]
 
     if pn.find("-cross") != -1:
         pnstripped = pn.split("-cross")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-        bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.find("-initial") != -1:
         pnstripped = pn.split("-initial")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-        bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     bb.note("Recipe: %s" % recipe_name)
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f92f2b3..79f0a8b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -128,7 +128,6 @@ class RpmIndexer(Indexer):
                         default_tune = localdata.getVar(default_tune_key, False)
                     if default_tune:
                         localdata.setVar("DEFAULTTUNE", default_tune)
-                        bb.data.update_data(localdata)
                         package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS').split()
                         package_archs[eext[1]].reverse()
                         target_os[eext[1]] = localdata.getVar("TARGET_OS").strip()
@@ -2189,7 +2188,6 @@ class DpkgPM(OpkgDpkgPM):
             variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
             orig_arch = localdata.getVar("DPKG_ARCH")
             localdata.setVar("DEFAULTTUNE", variant_tune)
-            bb.data.update_data(localdata)
             variant_arch = localdata.getVar("DPKG_ARCH")
             if variant_arch not in base_arch_list:
                 base_arch_list.append(variant_arch)
diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index c266437..b89b70a 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -37,7 +37,6 @@ def glibc_dl_info(d):
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
-        bb.data.update_data(localdata)
         ld_append_if_tune_exists(localdata, infos, ld_info_all)
     infos['ldconfig'] = ','.join(infos['ldconfig'])
     infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index c7ac05d..29da121 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -43,7 +43,6 @@ python do_generate_content() {
         overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
-        bb.data.update_data(localdata)
         bb.build.exec_func("create_sdk_files", localdata)
 }
 addtask generate_content before do_install after do_compile
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 44e7c28..74578d9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -71,7 +71,6 @@ def get_tune_parameters(tune, d):
     localdata = bb.data.createCopy(d)
     override = ':tune-' + tune
     localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES', False) + override)
-    bb.data.update_data(localdata)
 
     retdict = {}
     retdict['tune'] = tune
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 2d27588..883dbc7 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -639,7 +639,6 @@ def multilib_rpmmacros(d):
         overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
-        bb.data.update_data(localdata)
         localdata.setVar('WORKDIR', workdirVal)
         localdata.setVar('distromacrodir', distromacrodirVal)
         localdata.setVar('D', dval)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5bd3853..1be3f14 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -348,7 +348,6 @@ def supports_srcrev(uri):
     # This is a bit sad, but if you don't have this set there can be some
     # odd interactions with the urldata cache which lead to errors
     localdata.setVar('SRCREV', '${AUTOREV}')
-    bb.data.update_data(localdata)
     try:
         fetcher = bb.fetch2.Fetch([uri], localdata)
         urldata = fetcher.ud
-- 
2.7.4


