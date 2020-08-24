Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.2997.1598311774884143660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07ONTUA6010752
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 18:29:32 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 4/5] package / packagedata bbclass: Change the way PRAUTO and AUTOINC are handled
Date: Mon, 24 Aug 2020 18:29:29 -0500
Message-Id: <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>

During the do_package operation, we need to convert AUTOINC to some other
value, as PKGV is set and stored to the packagedata at this time.  We
create a new variable called "PRSERV_PV_AUTOINC" to handle this case,
with a default value of AUTOINC.

The value of PRSERV_PV_AUTOINC is added to the PKGDATA_VARS_NOHASH so it
does NOT get written as part of the PKGV to the packagedata files, but is
preserved as a bitbake variable for later processing.

As part of this work, we deterined we should not always write out
PKGDATA_VARS_NOHASH, as it may contain incomplete information.  For instance
EXTENDPRAUTO at do_package time is "", while later becomes a ".0" or
similar number when the PR Service is enabled.

do_packagedata was modified to explicitly run package_get_auto_pr, and then
preserve the PRAUTO and PRSERV_PV_AUTOINC values.  We store these in a new
file called ${PN}_prservice.oe_nohash.  Doing it this way will ensure that
subsequent calls to "read_subpackage_metadata", and similar function will
have correct results for the recipes PRAUTO and PRSERV_PV_AUTOINC.

read_subpackage_metadata was modified to read this file as well.

package_get_auto_pr was refactored to add processing to set the
correct PRSERV_PV_AUTOINC values, instead of modifying PKGV directly.

A related change was also needed for the kernel.bbclass.  The kernel

needs to get the AUTOINC values used by the various PV/PKGV, but with
this new system we don't want to call auto_pr each time -- instead
call the read_subpackage_metadata to ensure a consistent result.

This also fixes an issue in the old version where the kernel sometimes
caused the PR to be incremented twice, as the auto_pr was called
multiple times from different tasks.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/kernel.bbclass      |  4 ++--
 meta/classes/package.bbclass     | 27 +++++++++++++++++++--------
 meta/classes/packagedata.bbclass | 30 ++++++++++++++++++++----------
 meta/conf/bitbake.conf           |  1 +
 4 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e2ceb6a333..4449452065 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -416,7 +416,7 @@ kernel_do_install() {
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
-do_install[prefuncs] += "package_get_auto_pr"
+do_install[prefuncs] += "read_subpackage_metadata"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
@@ -749,7 +749,7 @@ kernel_do_deploy() {
 		done
 	fi
 }
-do_deploy[prefuncs] += "package_get_auto_pr"
+do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 003eb71a6e..e822174b8a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,7 +7,7 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) package_get_auto_pr - get PRAUTO from remote PR service
+# a) package_convert_autoinc - convert autoinc in PKGV to ${PRSERV_PV_AUTOINC}
 #
 # b) perform_packagecopy - Copy D into PKGD
 #
@@ -672,6 +672,13 @@ def runtime_mapping_rename (varname, pkg, d):
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
@@ -1470,7 +1477,8 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
-PKGDATA_VARS_NOHASH = "EXTENDPRAUTO"
+# Really we only care about PRAUTO, but EXTENDPRAUTO evaluates this
+PKGDATA_VARS_NOHASH = "EXTENDPRAUTO PRSERV_PV_AUTOINC"
 
 python emit_pkgdata() {
     from glob import glob
@@ -1584,11 +1592,6 @@ fi
 
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
 
-        # Write out nohash variables first
-        with open("%s.oe_nohash" % subdata_file, 'w') as sf:
-            for var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
-                write_if_exists(d, sf, pkg, var)
-
         # Write out regular variables, but sanitize nohash values
         with open(subdata_file, 'w') as sf:
             localdata = d.createCopy()
@@ -2322,7 +2325,7 @@ python do_package () {
         package_qa_handle_error("var-undefined", msg, d)
         return
 
-    bb.build.exec_func("package_get_auto_pr", d)
+    bb.build.exec_func("package_convert_autoinc", d)
 
     ###########################################################################
     # Optimisations
@@ -2396,6 +2399,14 @@ addtask do_package_setscene
 python do_packagedata () {
     src = d.expand("${PKGDESTWORK}")
     dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
+
+    bb.build.exec_func("package_get_auto_pr", d)
+    # Store this for later retrieval
+    data_file = src + d.expand("/${PN}_prservice.oe_nohash")
+    with open(data_file, 'w') as fd:
+        fd.write('PRAUTO: %s\n' % d.getVar('PRAUTO'))
+        fd.write('PRSERV_PV_AUTOINC: %s\n' % d.getVar("PRSERV_PV_AUTOINC"))
+
     oe.path.copyhardlinktree(src, dest)
 }
 
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 981c324909..176bfe6948 100644
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
 
@@ -36,15 +39,15 @@ python read_subpackage_metadata () {
 package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
 python package_get_auto_pr() {
     import oe.prservice
-    import re
 
     def get_do_package_hash(pn):
-        if d.getVar("BB_RUNTASK") != "do_package":
-            taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-            for dep in taskdepdata:
-                if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
-                    return taskdepdata[dep][6]
-        return d.getVar("BB_UNIHASH")
+        if d.getVar("BB_RUNTASK") == "do_package":
+            return d.getVar('BB_UNIHASH')
+        taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+        for dep in taskdepdata:
+            if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
+                return taskdepdata[dep][6]
+        return None
 
     # Support per recipe PRSERV_HOST
     pn = d.getVar('PN')
@@ -56,8 +59,7 @@ python package_get_auto_pr() {
 
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST'):
-        if 'AUTOINC' in pkgv:
-            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        d.setVar("PRSERV_PV_AUTOINC", "0")
         return
 
     auto_pr = None
@@ -66,6 +68,14 @@ python package_get_auto_pr() {
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
@@ -82,7 +92,7 @@ python package_get_auto_pr() {
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

