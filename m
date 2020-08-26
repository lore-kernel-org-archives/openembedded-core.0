Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.10344.1598441258051828323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QBRY5e018314
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:27:36 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 6/6] package.bbclass: hash equivalency and pr service
Date: Wed, 26 Aug 2020 06:27:33 -0500
Message-Id: <20200826112733.52492-7-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>

When the PR service is enabled a number of small changes may happen
to variables.  In the do_package step a call to package_get_auto_pr
will end up setting PRAUTO and modifying PKGV (if AUTOINC is there).

PRAUTO is then used by EXTENDPRAUTO, which is then used to generate
PKGR.

Since this behavior typically happens BEFORE the BB_UNIHASH is
calculated for do_package, we need a way to defer the expansion
until after we have the unihash value.

Writing out the pkgdata files w/o AUTOPR and PKGV (AUTOINC) expanded
is the easiest way to deal with this.  The majority of items are still
expanded as expected.

In the next task, typically do_packagedata, we will then use the
UNIHASH from the do_package to get the PR (AUTOPR) as well as
generate the AUTOINC replacement value (now PRSERV_PV_AUTOINC).

Then, as required, the standard load routine, read_subpackage_metadata,
will then be used to read the values stored from do_package, and
do_packagedata which provide everything required for the expanded
PKGV and PKGR.

Note, we use read_subpackage_metadata, as PKGV and PKGR may be
set per sub-package with the way things are defined.  Due to this
they are not defined in a ${PN} file, but in the per package
files.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass     | 69 +++++++++++++++++++++++++-------
 meta/classes/packagedata.bbclass | 19 ++++++---
 meta/conf/bitbake.conf           |  1 +
 3 files changed, 69 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d44c359e94..5570d4954c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,7 +7,7 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) package_get_auto_pr - get PRAUTO from remote PR service
+# a) package_convert_autoinc - convert AUTOINC in PKGV to ${PRSERV_PV_AUTOINC}
 #
 # b) perform_packagecopy - Copy D into PKGD
 #
@@ -648,11 +648,21 @@ def get_package_additional_metadata (pkg_type, d):
         metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
         return "\n".join(metadata_fields).strip()
 
+# Remove the excluded variables from a copy of d
+# This ensures that any users will list these variables when expanded
+def exclude_pkgdata_vars(d):
+    localdata = d.createCopy()
+    for exclude_var in (d.getVar('PKGDATA_VARS_EXCLUDE') or "").split():
+        localdata.delVar(exclude_var)
+    return localdata
+
 def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname)))
 
     new_depends = {}
-    deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
+    localdata = exclude_pkgdata_vars(d)
+
+    deps = bb.utils.explode_dep_versions2(localdata.getVar(varname) or "")
     for depend, depversions in deps.items():
         new_depend = get_package_mapping(depend, pkg, d, depversions)
         if depend != new_depend:
@@ -667,6 +677,13 @@ def runtime_mapping_rename (varname, pkg, d):
 # Package functions suitable for inclusion in PACKAGEFUNCS
 #
 
+python package_convert_autoinc() {
+    pkgv = d.getVar("PKGV")
+
+    if 'AUTOINC' in pkgv:
+        d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
+}
+
 LOCALEBASEPN ??= "${PN}"
 
 python package_do_split_locales() {
@@ -1436,8 +1453,10 @@ python package_fixsymlinks () {
             if found == False:
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
 
+    localdata = exclude_pkgdata_vars(d)
+
     for pkg in newrdepends:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar('RDEPENDS_' + pkg) or "")
         for p in newrdepends[pkg]:
             if p not in rdepends:
                 rdepends[p] = []
@@ -1460,6 +1479,12 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
+# When we write or use PKGDATA_VARS items, components of this may need
+# to be excluded from expansion.
+# Really we only care about PRAUTO, but EXTENDPRAUTO evaluates this, so
+# exclude it instead
+PKGDATA_VARS_EXCLUDE = "EXTENDPRAUTO PRSERV_PV_AUTOINC"
+
 python emit_pkgdata() {
     from glob import glob
     import json
@@ -1498,7 +1523,7 @@ fi
                     scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
             d.setVar('%s_%s' % (scriptlet_name, pkg), scriptlet)
 
-    def write_if_exists(f, pkg, var):
+    def write_if_exists(d, f, pkg, var):
         def encode(str):
             import codecs
             c = codecs.getencoder("unicode_escape")
@@ -1572,16 +1597,18 @@ fi
 
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
         with open(subdata_file, 'w') as sf:
+            localdata = exclude_pkgdata_vars(d)
+
             for var in (d.getVar('PKGDATA_VARS') or "").split():
-                val = write_if_exists(sf, pkg, var)
+                write_if_exists(localdata, sf, pkg, var)
 
-            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-            for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
-                write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+            write_if_exists(localdata, sf, pkg, 'FILERPROVIDESFLIST')
+            for dfile in (localdata.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
+                write_if_exists(localdata, sf, pkg, 'FILERPROVIDES_' + dfile)
 
-            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-            for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
-                write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+            write_if_exists(localdata, sf, pkg, 'FILERDEPENDSFLIST')
+            for dfile in (localdata.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
+                write_if_exists(localdata, sf, pkg, 'FILERDEPENDS_' + dfile)
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
@@ -2076,9 +2103,11 @@ def read_libdep_files(d):
 python read_shlibdeps () {
     pkglibdeps = read_libdep_files(d)
 
+    localdata = exclude_pkgdata_vars(d)
+
     packages = d.getVar('PACKAGES').split()
     for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar('RDEPENDS_' + pkg) or "")
         for dep in sorted(pkglibdeps[pkg]):
             # Add the dep if it's not already there, or if no comparison is set
             if dep not in rdepends:
@@ -2108,9 +2137,10 @@ python package_depchains() {
     prefixes  = (d.getVar('DEPCHAIN_PRE') or '').split()
 
     def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
+        localdata = exclude_pkgdata_vars(d)
 
         #bb.note('depends for %s is %s' % (base, depends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
+        rreclist = bb.utils.explode_dep_versions2(localdata.getVar('RRECOMMENDS_' + pkg) or "")
 
         for depend in sorted(depends):
             if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
@@ -2129,9 +2159,10 @@ python package_depchains() {
         d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
 
     def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
+        localdata = exclude_pkgdata_vars(d)
 
         #bb.note('rdepends for %s is %s' % (base, rdepends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
+        rreclist = bb.utils.explode_dep_versions2(localdata.getVar('RRECOMMENDS_' + pkg) or "")
 
         for depend in sorted(rdepends):
             if depend.find('virtual-locale-') != -1:
@@ -2285,7 +2316,7 @@ python do_package () {
         package_qa_handle_error("var-undefined", msg, d)
         return
 
-    bb.build.exec_func("package_get_auto_pr", d)
+    bb.build.exec_func("package_convert_autoinc", d)
 
     ###########################################################################
     # Optimisations
@@ -2359,6 +2390,14 @@ addtask do_package_setscene
 python do_packagedata () {
     src = d.expand("${PKGDESTWORK}")
     dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
+
+    bb.build.exec_func("package_get_auto_pr", d)
+    # Store this for later retrieval
+    data_file = src + d.expand("/${PN}_prservice")
+    with open(data_file, 'w') as fd:
+        fd.write('PRAUTO: %s\n' % d.getVar('PRAUTO'))
+        fd.write('PRSERV_PV_AUTOINC: %s\n' % d.getVar("PRSERV_PV_AUTOINC"))
+
     oe.path.copyhardlinktree(src, dest)
 }
 
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 5475d5c0da..63274b4365 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -9,7 +9,10 @@ python read_subpackage_metadata () {
     }
 
     data = oe.packagedata.read_pkgdata(vars["PN"], d)
+    for key in data.keys():
+        d.setVar(key, data[key])
 
+    data = oe.packagedata.read_pkgdata("%s_prservice" % d.getVar('PN'), d)
     for key in data.keys():
         d.setVar(key, data[key])
 
@@ -36,7 +39,6 @@ python read_subpackage_metadata () {
 package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
 python package_get_auto_pr() {
     import oe.prservice
-    import re
 
     def get_do_package_hash(pn):
         if d.getVar("BB_RUNTASK") != "do_package":
@@ -44,7 +46,7 @@ python package_get_auto_pr() {
             for dep in taskdepdata:
                 if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
                     return taskdepdata[dep][6]
-        return d.getVar("BB_TASKHASH")
+        return None
 
     # Support per recipe PRSERV_HOST
     pn = d.getVar('PN')
@@ -56,8 +58,7 @@ python package_get_auto_pr() {
 
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST'):
-        if 'AUTOINC' in pkgv:
-            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        d.setVar("PRSERV_PV_AUTOINC", "0")
         return
 
     auto_pr = None
@@ -66,6 +67,14 @@ python package_get_auto_pr() {
     pkgarch = d.getVar("PACKAGE_ARCH")
     checksum = get_do_package_hash(pn)
 
+    # If do_package isn't in the dependencies, we can't get the checksum...
+    if not checksum:
+        bb.warn('Task %s requested do_package unihash, but it was not available.' % d.getVar('BB_RUNTASK'))
+        #taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+        #for dep in taskdepdata:
+        #    bb.warn('%s:%s = %s' % (taskdepdata[dep][0], taskdepdata[dep][1], taskdepdata[dep][6]))
+        return
+
     if d.getVar('PRSERV_LOCKDOWN'):
         auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
         if auto_pr is None:
@@ -82,7 +91,7 @@ python package_get_auto_pr() {
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
+                d.setVar("PRSERV_PV_AUTOINC", str(value))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
     except Exception as e:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 353caacef9..65b4432c63 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -208,6 +208,7 @@ PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
 P = "${PN}-${PV}"
 
+PRSERV_PV_AUTOINC = "AUTOINC"
 PRAUTO = ""
 EXTENDPRAUTO = "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO')]}"
 PRAUTOINX = "${PF}"
-- 
2.17.1

