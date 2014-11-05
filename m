Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E9CEC71FC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5IhqcS028248 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:43:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TnbV_9rhNkjB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:43:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5Ihnjn028244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:43:50 GMT
Message-ID: <1415213064.23396.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Nov 2014 18:44:24 +0000
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] package/prserv: Merge two similar functions into one
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
X-List-Received-Date: Wed, 05 Nov 2014 18:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having these two separate functions handling PR values seems pointless,
and worse, there are impossible code branches mixed within them.

Merge them into one function and tweak comments so at least you
don't have to read both functions to figure out what is going on.

This does restructure the conditionals to try and aid readability.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 7fb811e..ee01834 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -620,11 +620,13 @@ def get_autorev(d):
 
 def get_srcrev(d):
     """
-    Return the version string for the current package
-    (usually to be used as PV)
+    Return the revsion string, usually for use in the version string (PV) of the current package
     Most packages usually only have one SCM so we just pass on the call.
     In the multi SCM case, we build a value based on SRCREV_FORMAT which must
     have been set.
+
+    The idea here is that we put the string "AUTOINC+" into return value if the revisions are not 
+    incremental, other code is then responsible for turning that into an increasing value (if needed)
     """
 
     scms = []
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2aec3e6..510617c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -392,28 +392,52 @@ def runtime_mapping_rename (varname, pkg, d):
 #
 
 python package_get_auto_pr() {
-    # per recipe PRSERV_HOST
+    import oe.prservice
+    import re
+
+    # Support per recipe PRSERV_HOST
     pn = d.getVar('PN', True)
     host = d.getVar("PRSERV_HOST_" + pn, True)
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
 
-    if d.getVar('PRSERV_HOST', True):
-        try:
-            auto_pr=prserv_get_pr_auto(d)
-        except Exception as e:
-            bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
-        if auto_pr is None:
-            if d.getVar('PRSERV_LOCKDOWN', True):
-                bb.fatal("Can NOT get PRAUTO from lockdown exported file")
-            else:
-                bb.fatal("Can NOT get PRAUTO from remote PR service")
-            return
-        d.setVar('PRAUTO',str(auto_pr))
-    else:
+    # PR Server not active, handle AUTOINC
+    if not d.getVar('PRSERV_HOST', True):
         pkgv = d.getVar("PKGV", True)
         if 'AUTOINC' in pkgv:
             d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        return
+
+    auto_pr = None
+    pv = d.getVar("PV", True)
+    version = d.getVar("PRAUTOINX", True)
+    pkgarch = d.getVar("PACKAGE_ARCH", True)
+    checksum = d.getVar("BB_TASKHASH", True)
+
+    if d.getVar('PRSERV_LOCKDOWN', True):
+        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
+        if auto_pr is None:
+            bb.fatal("Can NOT get PRAUTO from lockdown exported file")
+        d.setVar('PRAUTO',str(auto_pr))
+        return
+
+    try:
+        conn = d.getVar("__PRSERV_CONN", True)
+        if conn is None:
+            conn = oe.prservice.prserv_make_conn(d)
+        if conn is not None:
+            if "AUTOINC" in pv:
+                srcpv = bb.fetch2.get_srcrev(d)
+                base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
+                value = conn.getPR(base_ver, pkgarch, srcpv)
+                d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
+
+            auto_pr = conn.getPR(version, pkgarch, checksum)
+    except Exception as e:
+        bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
+    if auto_pr is None:
+        bb.fatal("Can NOT get PRAUTO from remote PR service")
+    d.setVar('PRAUTO',str(auto_pr))
 }
 
 LOCALEBASEPN ??= "${PN}"
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index b440d86..139597f 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -1,33 +1,2 @@
-def prserv_get_pr_auto(d):
-    import oe.prservice
-    import re
 
-    pv = d.getVar("PV", True)
-    if not d.getVar('PRSERV_HOST', True):
-        if 'AUTOINC' in pv:
-            d.setVar("PKGV", pv.replace("AUTOINC", "0"))
-        bb.warn("Not using network based PR service")
-        return None
 
-    version = d.getVar("PRAUTOINX", True)
-    pkgarch = d.getVar("PACKAGE_ARCH", True)
-    checksum = d.getVar("BB_TASKHASH", True)
-
-    conn = d.getVar("__PRSERV_CONN", True)
-    if conn is None:
-        conn = oe.prservice.prserv_make_conn(d)
-        if conn is None:
-            return None
-
-    if "AUTOINC" in pv:
-        srcpv = bb.fetch2.get_srcrev(d)
-        base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
-        value = conn.getPR(base_ver, pkgarch, srcpv)
-        d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
-
-    if d.getVar('PRSERV_LOCKDOWN', True):
-        auto_rev = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
-    else:
-        auto_rev = conn.getPR(version, pkgarch, checksum)
-
-    return auto_rev



