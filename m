Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.26539.1598555231501306117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 12:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07RJ77lD032508
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 14:07:09 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v6 3/3] package.bbclass: hash equivalency and pr service
Date: Thu, 27 Aug 2020 14:07:06 -0500
Message-Id: <20200827190706.121027-4-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827190706.121027-1-mark.hatle@kernel.crashing.org>
References: <20200827190706.121027-1-mark.hatle@kernel.crashing.org>

When the PR service is enabled a number of small changes may happen
to variables.  In the do_package step a call to package_get_auto_pr
will end up setting PRAUTO and modifying PKGV (if AUTOINC is there).

PRAUTO is then used by EXTENDPRAUTO, which is then used to generate
PKGR.

Since this behavior typically happens BEFORE the BB_UNIHASH is
calculated for do_package, we need a way to defer the expansion
until after we have the unihash value.

Writing out the pkgdata files w/o AUTOPR and PKGV (AUTOINC) expanded
to placeholder values is the easiest way to deal with this.  All other
variables are expanded as expected.

In the next task, typically do_packagedata, we will then use the
UNIHASH from the do_package to get the PR (AUTOPR) as well as
generate the AUTOINC replacement value (now PRSERV_PV_AUTOINC).

The do_packagedata then translates the placeholders to the final values
when copying the data from pkgdata to pkgdata-pdata-input.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass | 58 +++++++++++++++++++++++++++++++-----
 meta/conf/bitbake.conf       |  1 +
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a36262eb6..0a4e9d13fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,7 +7,7 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) package_get_auto_pr - get PRAUTO from remote PR service
+# a) package_convert_pr_autoinc - convert AUTOINC in PKGV to ${PRSERV_PV_AUTOINC}
 #
 # b) perform_packagecopy - Copy D into PKGD
 #
@@ -664,12 +664,20 @@ def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s after: %s" % (varname, d.getVar(varname)))
 
 #
-# Package functions suitable for inclusion in PACKAGEFUNCS
+# Used by do_packagedata (and possibly other routines post do_package)
 #
 
+package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
 python package_get_auto_pr() {
     import oe.prservice
-    import re
+
+    def get_do_package_hash(pn):
+        if d.getVar("BB_RUNTASK") != "do_package":
+            taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+            for dep in taskdepdata:
+                if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
+                    return taskdepdata[dep][6]
+        return None
 
     # Support per recipe PRSERV_HOST
     pn = d.getVar('PN')
@@ -681,15 +689,22 @@ python package_get_auto_pr() {
 
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST'):
-        if 'AUTOINC' in pkgv:
-            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        d.setVar("PRSERV_PV_AUTOINC", "0")
         return
 
     auto_pr = None
     pv = d.getVar("PV")
     version = d.getVar("PRAUTOINX")
     pkgarch = d.getVar("PACKAGE_ARCH")
-    checksum = d.getVar("BB_TASKHASH")
+    checksum = get_do_package_hash(pn)
+
+    # If do_package isn't in the dependencies, we can't get the checksum...
+    if not checksum:
+        bb.warn('Task %s requested do_package unihash, but it was not available.' % d.getVar('BB_RUNTASK'))
+        #taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+        #for dep in taskdepdata:
+        #    bb.warn('%s:%s = %s' % (taskdepdata[dep][0], taskdepdata[dep][1], taskdepdata[dep][6]))
+        return
 
     if d.getVar('PRSERV_LOCKDOWN'):
         auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
@@ -707,7 +722,7 @@ python package_get_auto_pr() {
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
+                d.setVar("PRSERV_PV_AUTOINC", str(value))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
     except Exception as e:
@@ -717,6 +732,22 @@ python package_get_auto_pr() {
     d.setVar('PRAUTO',str(auto_pr))
 }
 
+#
+# Package functions suitable for inclusion in PACKAGEFUNCS
+#
+
+python package_convert_pr_autoinc() {
+    pkgv = d.getVar("PKGV")
+
+    # Adjust pkgv as necessary...
+    if 'AUTOINC' in pkgv:
+        d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
+
+    # Change PRSERV_PV_AUTOINC and EXTENDPRAUTO usage to special values
+    d.setVar('PRSERV_PV_AUTOINC', '@PRSERV_PV_AUTOINC@')
+    d.setVar('EXTENDPRAUTO', '@EXTENDPRAUTO@')
+}
+
 LOCALEBASEPN ??= "${PN}"
 
 python package_do_split_locales() {
@@ -2335,7 +2366,7 @@ python do_package () {
         package_qa_handle_error("var-undefined", msg, d)
         return
 
-    bb.build.exec_func("package_get_auto_pr", d)
+    bb.build.exec_func("package_convert_pr_autoinc", d)
 
     ###########################################################################
     # Optimisations
@@ -2407,9 +2438,20 @@ addtask do_package_setscene
 # Copy from PKGDESTWORK to tempdirectory as tempdirectory can be cleaned at both
 # do_package_setscene and do_packagedata_setscene leading to races
 python do_packagedata () {
+    bb.build.exec_func("package_get_auto_pr", d)
+
     src = d.expand("${PKGDESTWORK}")
     dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
     oe.path.copyhardlinktree(src, dest)
+
+    bb.build.exec_func("packagedata_translate_pr_autoinc", d)
+}
+
+# Translate the EXTENDPRAUTO and AUTOINC to the final values
+packagedata_translate_pr_autoinc() {
+    find ${WORKDIR}/pkgdata-pdata-input -type f | xargs \
+        sed -e 's,@PRSERV_PV_AUTOINC@,${PRSERV_PV_AUTOINC},g' \
+            -e 's,@EXTENDPRAUTO@,${EXTENDPRAUTO},g' -i
 }
 
 addtask packagedata before do_build after do_package
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

