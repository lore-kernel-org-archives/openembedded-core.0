Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.10285.1598441257955491515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QBRY5c018314
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:27:36 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 4/6] package.bbclass: Move package_get_auto_pr to packagedata.bbclass
Date: Wed, 26 Aug 2020 06:27:31 -0500
Message-Id: <20200826112733.52492-5-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>

Running package_get_auto_pr during do_package is 'too early' when we need
to evaluate the do_package output to get it's unihash to look up the
right value in the PR database.

Move this function packagedata.bbclass (no changes yet), as subsequent
patches will refactor this function and the order in which it's called.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass     | 50 ---------------------------
 meta/classes/packagedata.bbclass | 59 ++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 50 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a36262eb6..d44c359e94 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -667,56 +667,6 @@ def runtime_mapping_rename (varname, pkg, d):
 # Package functions suitable for inclusion in PACKAGEFUNCS
 #
 
-python package_get_auto_pr() {
-    import oe.prservice
-    import re
-
-    # Support per recipe PRSERV_HOST
-    pn = d.getVar('PN')
-    host = d.getVar("PRSERV_HOST_" + pn)
-    if not (host is None):
-        d.setVar("PRSERV_HOST", host)
-
-    pkgv = d.getVar("PKGV")
-
-    # PR Server not active, handle AUTOINC
-    if not d.getVar('PRSERV_HOST'):
-        if 'AUTOINC' in pkgv:
-            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
-        return
-
-    auto_pr = None
-    pv = d.getVar("PV")
-    version = d.getVar("PRAUTOINX")
-    pkgarch = d.getVar("PACKAGE_ARCH")
-    checksum = d.getVar("BB_TASKHASH")
-
-    if d.getVar('PRSERV_LOCKDOWN'):
-        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
-        if auto_pr is None:
-            bb.fatal("Can NOT get PRAUTO from lockdown exported file")
-        d.setVar('PRAUTO',str(auto_pr))
-        return
-
-    try:
-        conn = d.getVar("__PRSERV_CONN")
-        if conn is None:
-            conn = oe.prservice.prserv_make_conn(d)
-        if conn is not None:
-            if "AUTOINC" in pkgv:
-                srcpv = bb.fetch2.get_srcrev(d)
-                base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
-                value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
-
-            auto_pr = conn.getPR(version, pkgarch, checksum)
-    except Exception as e:
-        bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
-    if auto_pr is None:
-        bb.fatal("Can NOT get PRAUTO from remote PR service")
-    d.setVar('PRAUTO',str(auto_pr))
-}
-
 LOCALEBASEPN ??= "${PN}"
 
 python package_do_split_locales() {
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index a903e5cfd2..5475d5c0da 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -32,3 +32,62 @@ python read_subpackage_metadata () {
             else:
                 d.setVar(key, sdata[key], parsing=True)
 }
+
+package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
+python package_get_auto_pr() {
+    import oe.prservice
+    import re
+
+    def get_do_package_hash(pn):
+        if d.getVar("BB_RUNTASK") != "do_package":
+            taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+            for dep in taskdepdata:
+                if taskdepdata[dep][1] == "do_package" and taskdepdata[dep][0] == pn:
+                    return taskdepdata[dep][6]
+        return d.getVar("BB_TASKHASH")
+
+    # Support per recipe PRSERV_HOST
+    pn = d.getVar('PN')
+    host = d.getVar("PRSERV_HOST_" + pn)
+    if not (host is None):
+        d.setVar("PRSERV_HOST", host)
+
+    pkgv = d.getVar("PKGV")
+
+    # PR Server not active, handle AUTOINC
+    if not d.getVar('PRSERV_HOST'):
+        if 'AUTOINC' in pkgv:
+            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        return
+
+    auto_pr = None
+    pv = d.getVar("PV")
+    version = d.getVar("PRAUTOINX")
+    pkgarch = d.getVar("PACKAGE_ARCH")
+    checksum = get_do_package_hash(pn)
+
+    if d.getVar('PRSERV_LOCKDOWN'):
+        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
+        if auto_pr is None:
+            bb.fatal("Can NOT get PRAUTO from lockdown exported file")
+        d.setVar('PRAUTO',str(auto_pr))
+        return
+
+    try:
+        conn = d.getVar("__PRSERV_CONN")
+        if conn is None:
+            conn = oe.prservice.prserv_make_conn(d)
+        if conn is not None:
+            if "AUTOINC" in pkgv:
+                srcpv = bb.fetch2.get_srcrev(d)
+                base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
+                value = conn.getPR(base_ver, pkgarch, srcpv)
+                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
+
+            auto_pr = conn.getPR(version, pkgarch, checksum)
+    except Exception as e:
+        bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
+    if auto_pr is None:
+        bb.fatal("Can NOT get PRAUTO from remote PR service")
+    d.setVar('PRAUTO',str(auto_pr))
+}
-- 
2.17.1

