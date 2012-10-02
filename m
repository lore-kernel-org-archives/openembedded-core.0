Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TIqBO-0001gT-Pl for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 02:17:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9204vlJ009261
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 01:04:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07592-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 01:04:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9204hBX009254
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 01:04:44 +0100
Message-ID: <1349136286.15753.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 01:04:46 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] insane.bbclass: Remove copy and paste confusion when using OVERRIDES
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
X-List-Received-Date: Tue, 02 Oct 2012 00:17:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



People keep copying this code and its confusing and unnecessary. Remove the
bad examples to try and stop this happening.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 17d887a..dddcd66 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -628,33 +628,20 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
 
     sane = True
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
-        # Copied from package_ipk.bbclass
-        # boiler plate to update the data
         localdata = bb.data.createCopy(d)
-        root = "%s/%s" % (pkgdest, pkg)
-
-        localdata.setVar('ROOT', '') 
-        localdata.setVar('ROOT_%s' % pkg, root)
-        pkgname = localdata.getVar('PKG_%s' % pkg, True)
-        if not pkgname:
-            pkgname = pkg
-        localdata.setVar('PKG', pkgname)
-
         localdata.setVar('OVERRIDES', pkg)
-
         bb.data.update_data(localdata)
 
         # Now check the RDEPENDS
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS', True) or "")
 
-
         # Now do the sanity check!!!
         for rdepend in rdepends:
             if "-dbg" in rdepend and "debug-deps" not in skip:
-                error_msg = "%s rdepends on %s" % (pkgname,rdepend)
+                error_msg = "%s rdepends on %s" % (pkg,rdepend)
                 sane = package_qa_handle_error("debug-deps", error_msg, d)
             if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
-                error_msg = "%s rdepends on %s" % (pkgname, rdepend)
+                error_msg = "%s rdepends on %s" % (pkg, rdepend)
                 sane = package_qa_handle_error("dev-deps", error_msg, d)
 
     return sane
@@ -662,20 +649,8 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
 def package_qa_check_deps(pkg, pkgdest, skip, d):
     sane = True
 
-    # Copied from package_ipk.bbclass
-    # boiler plate to update the data
     localdata = bb.data.createCopy(d)
-    root = "%s/%s" % (pkgdest, pkg)
-
-    localdata.setVar('ROOT', '') 
-    localdata.setVar('ROOT_%s' % pkg, root)
-    pkgname = localdata.getVar('PKG_%s' % pkg, True)
-    if not pkgname:
-        pkgname = pkg
-    localdata.setVar('PKG', pkgname)
-
     localdata.setVar('OVERRIDES', pkg)
-
     bb.data.update_data(localdata)
 
     def check_valid_deps(var):
@@ -683,11 +658,11 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
         try:
             rvar = bb.utils.explode_dep_versions(localdata.getVar(var, True) or "")
         except ValueError as e:
-            bb.fatal("%s_%s: %s" % (var, pkgname, e))
+            bb.fatal("%s_%s: %s" % (var, pkg, e))
             raise e
         for dep in rvar:
             if rvar[dep] and not rvar[dep].startswith(('< ', '= ', '> ', '<= ', '>=')):
-                error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkgname, dep, rvar[dep])
+                error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, rvar[dep])
                 sane = package_qa_handle_error("dep-cmp", error_msg, d)
         return sane
 




