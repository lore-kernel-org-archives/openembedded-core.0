Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFD26018C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 23:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12NjmbR005980 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 23:45:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9USYnaPNkeFv
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 23:45:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12Njkv9005976
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 23:45:47 GMT
Message-ID: <1454456746.27087.133.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Feb 2016 23:45:46 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] classes/lib: Add expand parameter to getVarFlag
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
X-List-Received-Date: Tue, 02 Feb 2016 23:45:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This sets the scene for removing the default False for expansion 
from getVarFlag. This would later allow True to become the default.

On the most part this is an automatic translation with:

sed -e 's:\(\.getVarFlag([^,()]*, [^,()]*\)):\1, True):g'  -i `grep -ril getVar *`

In this case, the default was False, but True was used since in most
cases here expansion would be expected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 9b58d82..8073c17 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -40,8 +40,8 @@ python package_do_compress_doc() {
     compress_cmds = {}
     decompress_cmds = {}
     for mode in compress_list:
-        compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode)
-        decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode)
+        compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode, True)
+        decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode, True)
 
     mandir = os.path.abspath(dvar + os.sep + d.getVar("mandir", True))
     if os.path.exists(mandir):
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4451436..341d9c0 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -3,7 +3,7 @@ inherit terminal
 DEVSHELL = "${SHELL}"
 
 python do_devshell () {
-    if d.getVarFlag("do_devshell", "manualfakeroot"):
+    if d.getVarFlag("do_devshell", "manualfakeroot", True):
        d.prependVar("DEVSHELL", "pseudo ")
        fakeenv = d.getVar("FAKEROOTENV", True).split()
        for f in fakeenv:
@@ -27,7 +27,7 @@ do_devshell[nostamp] = "1"
 # be done as the normal user. We therfore carefully construct the envionment
 # manually
 python () {
-    if d.getVarFlag("do_devshell", "fakeroot"):
+    if d.getVarFlag("do_devshell", "fakeroot", True):
        # We need to signal our code that we want fakeroot however we
        # can't manipulate the environment and variables here yet (see YOCTO #4795)
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index be0fe55..607861f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -51,7 +51,7 @@ python () {
             # Dummy value because the default function can't be called with blank SRC_URI
             d.setVar('SRCPV', '999')
 
-        tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
+        tasks = filter(lambda k: d.getVarFlag(k, "task", True), d.keys())
 
         for task in tasks:
             if task.endswith("_setscene"):
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index aa17cc8..5b738ae 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -19,7 +19,7 @@ def image_buildinfo_outputvars(vars, listvars, d):
     ret = ""
     for var in vars:
         value = d.getVar(var, True) or ""
-        if (d.getVarFlag(var, 'type') == "list"):
+        if (d.getVarFlag(var, 'type', True) == "list"):
             value = oe.utils.squashspaces(value)
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
index 8931856..6b02cad 100644
--- a/meta/classes/image-swab.bbclass
+++ b/meta/classes/image-swab.bbclass
@@ -47,7 +47,7 @@ python() {
     # and cross packages which aren't swabber-native or one of its dependencies
     # I have ignored them for now...
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('nativesdk', d) and not bb.data.inherits_class('cross', d):
-        deps = (d.getVarFlag('do_setscene', 'depends') or "").split()
+        deps = (d.getVarFlag('do_setscene', 'depends', True) or "").split()
         deps.append('strace-native:do_populate_sysroot')
         d.setVarFlag('do_setscene', 'depends', " ".join(deps))
         logdir = d.expand("${TRACE_LOGDIR}")
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 301216d..fe38d21 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -416,10 +416,10 @@ def find_license_files(d):
 
         for lic_dir in license_source_dirs:
             if not os.path.isfile(os.path.join(lic_dir, license_type)):
-                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
+                if d.getVarFlag('SPDXLICENSEMAP', license_type, True) != None:
                     # Great, there is an SPDXLICENSEMAP. We can copy!
                     bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
-                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
+                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type, True)
                     license_source = lic_dir
                     break
             elif os.path.isfile(os.path.join(lic_dir, license_type)):
@@ -435,14 +435,14 @@ def find_license_files(d):
 
             # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
             # and should not be allowed, warn the user in this case.
-            if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
+            if d.getVarFlag('NO_GENERIC_LICENSE', license_type, True):
                 bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
 
-        elif d.getVarFlag('NO_GENERIC_LICENSE', license_type):
+        elif d.getVarFlag('NO_GENERIC_LICENSE', license_type, True):
             # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
             # of the package rather than the license_source_dirs.
             for (basename, path) in lic_files_paths:
-                if d.getVarFlag('NO_GENERIC_LICENSE', license_type) == basename:
+                if d.getVarFlag('NO_GENERIC_LICENSE', license_type, True) == basename:
                     lic_files_paths.append(("generic_" + license_type, path))
                     break
         else:
@@ -510,7 +510,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
-        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
+        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag, True) for flag in spdxflags]
 
     spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or '').split()
     for wld_lic in wildcard_licenses:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 854591b..93b275c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -429,7 +429,7 @@ def get_package_additional_metadata (pkg_type, d):
         if d.getVar(key, False) is None:
             continue
         d.setVarFlag(key, "type", "list")
-        if d.getVarFlag(key, "separator") is None:
+        if d.getVarFlag(key, "separator", True) is None:
             d.setVarFlag(key, "separator", "\\n")
         metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
         return "\n".join(metadata_fields).strip()
@@ -1916,7 +1916,7 @@ python package_depchains() {
 
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
-            if d.getVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs'):
+            if d.getVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', True):
                 continue
             (base, func) = pkgs[suffix][pkg]
             if suffix == "-dev":
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index f9e2292..854e645 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -53,7 +53,7 @@ python do_package_tar () {
 
 python () {
     if d.getVar('PACKAGES', True) != '':
-        deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
+        deps = (d.getVarFlag('do_package_write_tar', 'depends', True) or "").split()
         deps.append('tar-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index d417800..d5c38fe 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -28,7 +28,7 @@ MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
 python () {
 
     if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
-        flags = d.getVarFlag('do_rootfs', 'recrdeptask')
+        flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
         flags = flags.replace("do_package_write_ipk", "")
         flags = flags.replace("do_deploy", "")
         flags = flags.replace("do_populate_sysroot", "")
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index b4cd55b..0d2e897 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -31,7 +31,7 @@ do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
-        flags = d.getVarFlag('do_rootfs', 'recrdeptask')
+        flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
         flags = flags.replace("do_package_write_rpm", "")
         flags = flags.replace("do_deploy", "")
         flags = flags.replace("do_populate_sysroot", "")
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 37af46f..3986340 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -194,7 +194,7 @@ def exportTests(d,tc):
     savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
 
     keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
-            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func")]
+            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func", True)]
     for key in keys:
         try:
             savedata["d"][key] = d.getVar(key, True)
diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
index 72da932..6bff7c7 100644
--- a/meta/classes/typecheck.bbclass
+++ b/meta/classes/typecheck.bbclass
@@ -5,7 +5,7 @@
 python check_types() {
     import oe.types
     for key in e.data.keys():
-        if e.data.getVarFlag(key, "type"):
+        if e.data.getVarFlag(key, "type", True):
             oe.data.typed_value(key, e.data)
 }
 addhandler check_types
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index f62d523..5bcfd0b 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -4,12 +4,12 @@ python do_listtasks() {
     taskdescs = {}
     maxlen = 0
     for e in d.keys():
-        if d.getVarFlag(e, 'task'):
+        if d.getVarFlag(e, 'task', True):
             maxlen = max(maxlen, len(e))
             if e.endswith('_setscene'):
-                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc') or '')
+                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc', True) or '')
             else:
-                desc = d.getVarFlag(e, 'doc') or ''
+                desc = d.getVarFlag(e, 'doc', True) or ''
             taskdescs[e] = desc
 
     tasks = sorted(taskdescs.keys())
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 4cc0e02..e495721 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -3,7 +3,7 @@ import oe.maketype
 def typed_value(key, d):
     """Construct a value for the specified metadata variable, using its flags
     to determine the type and parameters for construction."""
-    var_type = d.getVarFlag(key, 'type')
+    var_type = d.getVarFlag(key, 'type', True)
     flags = d.getVarFlags(key)
     if flags is not None:
         flags = dict((flag, d.expand(value))
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 12eb421..a6fee5f 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -3,9 +3,9 @@ import itertools
 def is_optional(feature, d):
     packages = d.getVar("FEATURE_PACKAGES_%s" % feature, True)
     if packages:
-        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
+        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional", True))
     else:
-        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional"))
+        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional", True))
 
 def packages(features, d):
     for feature in features:



