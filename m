Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UQhNV-0000O8-5O for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 19:03:13 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CGjhgl017090 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:45:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cfjsya0d6T9I
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:45:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CGjZMm017086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:45:37 +0100
Message-ID: <1365785127.16702.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 17:45:27 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] package/image.bbclass: Fix multilib rprovides
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
X-List-Received-Date: Fri, 12 Apr 2013 17:03:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

allarch multilib recipes are meant to provide a list of different multilib variants.
Unfortunately since the pkgdata also has mappings for these, they get mapped back to
the original package name which means the effect is undone at package creation time
when the remapping code is called.

This patch adds in a conditional to break that chain meaning the packages get
the correct RPROVIDES and image builds work correctly with opkg.

[YOCTO #3453]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3cde0b8..4e9c29c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -116,8 +116,9 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
 
     if d.getVar('BB_WORKERCONTEXT', True) is not None:
-        runtime_mapping_rename("PACKAGE_INSTALL", d)
-        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
+        pn = d.getVar('PN', True)
+        runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
+        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
 
     # Ensure we have the vendor list for complementary package handling
     ml_vendor_list = ""
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 826a54e..4e9b79e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -332,24 +332,27 @@ def copydebugsources(debugsrcdir, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, d):
+def get_package_mapping (pkg, basepkg, d):
     import oe.packagedata
 
     data = oe.packagedata.read_subpkgdata(pkg, d)
     key = "PKG_%s" % pkg
 
     if key in data:
+        # Have to avoid undoing the write_extra_pkgs(global_variants...)
+        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
+            return pkg
         return data[key]
 
     return pkg
 
-def runtime_mapping_rename (varname, d):
+def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
 
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname, True) or "")
     for depend in deps:
-        new_depend = get_package_mapping(depend, d)
+        new_depend = get_package_mapping(depend, pkg, d)
         new_depends[new_depend] = deps[depend]
 
     d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
@@ -1942,10 +1945,11 @@ def mapping_rename_hook(d):
     Rewrite variables to account for package renaming in things
     like debian.bbclass or manual PKG variable name changes
     """
-    runtime_mapping_rename("RDEPENDS", d)
-    runtime_mapping_rename("RRECOMMENDS", d)
-    runtime_mapping_rename("RSUGGESTS", d)
-    runtime_mapping_rename("RPROVIDES", d)
-    runtime_mapping_rename("RREPLACES", d)
-    runtime_mapping_rename("RCONFLICTS", d)
+    pkg = d.getVar("PKG", True)
+    runtime_mapping_rename("RDEPENDS", pkg, d)
+    runtime_mapping_rename("RRECOMMENDS", pkg, d)
+    runtime_mapping_rename("RSUGGESTS", pkg, d)
+    runtime_mapping_rename("RPROVIDES", pkg, d)
+    runtime_mapping_rename("RREPLACES", pkg, d)
+    runtime_mapping_rename("RCONFLICTS", pkg, d)
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6280705..49e4469 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -30,7 +30,8 @@ EXCLUDE_FROM_WORLD = "1"
 SDK_PACKAGING_FUNC ?= "create_shar"
 
 fakeroot python do_populate_sdk() {
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
+    pn = d.getVar('PN', True)
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
 
     bb.build.exec_func("populate_sdk_image", d)
 




