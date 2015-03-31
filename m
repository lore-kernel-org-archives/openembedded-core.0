Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23C0373CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:12:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2015 13:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="688479884"
Received: from hsolver-mobl.ger.corp.intel.com (HELO fuath.ger.corp.intel.com)
	([10.252.22.169])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2015 13:12:11 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 21:11:04 +0100
Message-Id: <17800ae49667ee311ccc15a539dae026674efc35.1427832505.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/3] distrodata.bbclass/distro_check.py: Fix splits
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
X-List-Received-Date: Tue, 31 Mar 2015 20:12:11 -0000

When we're trying to get the name of the package for
nativesdk/cross/crosssdk this bit of code fails to do
this right for things like nativesdk-foo-cross.

This ensures that a package like nativesdk-glibc-initial
maps to glibc and not to nativesdk-glibc

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/distrodata.bbclass | 105 ++++++++++++++++++----------------------
 meta/lib/oe/distro_check.py     |  46 ++++++++----------
 2 files changed, 67 insertions(+), 84 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 83aa381..10e59d3 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -25,37 +25,30 @@ python do_distrodata_np() {
         distro_check_dir = os.path.join(tmpdir, "distro_check")
         datetime = localdata.getVar('DATETIME', True)
         dist_check.update_distro_data(distro_check_dir, datetime)
+        pnstripped = pn
 
-        if pn.find("-native") != -1:
-            pnstripped = pn.split("-native")
+        if pnstripped.find("-native") != -1:
+            pnstripped = pnstripped.split("-native")[0]
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pn.find("-cross") != -1:
-            pnstripped = pn.split("-cross")
+        if pnstripped.find("-cross") != -1:
+            pnstripped = pnstripped.split("-cross")[0]
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pn.find("-crosssdk") != -1:
-            pnstripped = pn.split("-crosssdk")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
+        if pnstripped.find("-crosssdk") != -1:
+            pnstripped = pnstripped.split("-crosssdk")[0]
+            bb.note("crosssdk Split: %s" % pnstripped)
 
-        if pn.startswith("nativesdk-"):
-            pnstripped = pn.replace("nativesdk-", "")
+        if pnstripped.startswith("nativesdk-"):
+            pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
-
 
-        if pn.find("-initial") != -1:
-            pnstripped = pn.split("-initial")
+        if pnstripped.find("-initial") != -1:
+            pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
+
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+        bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
         pname = localdata.getVar('PN', True)
@@ -112,36 +105,30 @@ python do_distrodata() {
 
         pn = d.getVar("PN", True)
         bb.note("Package Name: %s" % pn)
+        pnstripped = pn
 
-        if pn.find("-native") != -1:
-            pnstripped = pn.split("-native")
+        if pnstripped.find("-native") != -1:
+            pnstripped = pnstripped.split("-native")[0]
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pn.startswith("nativesdk-"):
-            pnstripped = pn.replace("nativesdk-", "")
+        if pnstripped.startswith("nativesdk-"):
+            pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pn.find("-cross") != -1:
-            pnstripped = pn.split("-cross")
+        if pnstripped.find("-cross") != -1:
+            pnstripped = pnstripped.split("-cross")[0]
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pn.find("-crosssdk") != -1:
-            pnstripped = pn.split("-crosssdk")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
+        if pnstripped.find("-crosssdk") != -1:
+            pnstripped = pnstripped.split("-crosssdk")[0]
+            bb.note("crosssdk Split: %s" % pnstripped)
 
-        if pn.find("-initial") != -1:
-            pnstripped = pn.split("-initial")
+        if pnstripped.find("-initial") != -1:
+            pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
+
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+        bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
         pname = localdata.getVar('PN', True)
@@ -280,34 +267,34 @@ python do_checkpkg() {
 
         """generate package information from .bb file"""
         pname = d.getVar('PN', True)
+        pnstripped = pname
 
-        if pname.find("-native") != -1:
+        if pnstripped.find("-native") != -1:
             if d.getVar('BBCLASSEXTEND', True):
                     return
-            pnstripped = pname.split("-native")
+            pnstripped = pnstripped.split("-native")[0]
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pname.startswith("nativesdk-"):
+        if pnstripped.startswith("nativesdk-"):
             if d.getVar('BBCLASSEXTEND', True):
                     return
-            pnstripped = pname.replace("nativesdk-", "")
+            pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pname.find("-cross") != -1:
-            pnstripped = pname.split("-cross")
+        if pnstripped.find("-cross") != -1:
+            pnstripped = pnstripped.split("-cross")[0]
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
 
-        if pname.find("-initial") != -1:
-            pnstripped = pname.split("-initial")
+        if pnstripped.find("-crosssdk") != -1:
+            pnstripped = pnstripped.split("-cross")[0]
+            bb.note("crosssdk Split: %s" % pnstripped)
+
+        if pnstripped.find("-initial") != -1:
+            pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
+
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+        bb.data.update_data(localdata)
 
         pdesc = localdata.getVar('DESCRIPTION', True)
         pgrp = localdata.getVar('SECTION', True)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 8ed5b0e..f754991 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -278,32 +278,28 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     pn = d.getVar('PN', True)
     recipe_name = d.getVar('PN', True)
     bb.note("Checking: %s" % pn)
+    pnstripped = pn
+    trim_dict = dict({"-native":"-native", "-cross":"-cross", "-crosssdk":"-crosssdk" ,"-initial":"-initial"})
 
-    trim_dict = dict({"-native":"-native", "-cross":"-cross", "-initial":"-initial"})
-
-    if pn.find("-native") != -1:
-        pnstripped = pn.split("-native")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-        bb.data.update_data(localdata)
-        recipe_name = pnstripped[0]
-
-    if pn.startswith("nativesdk-"):
-        pnstripped = pn.split("nativesdk-")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.getVar('OVERRIDES', True))
-        bb.data.update_data(localdata)
-        recipe_name = pnstripped[1]
-
-    if pn.find("-cross") != -1:
-        pnstripped = pn.split("-cross")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-        bb.data.update_data(localdata)
-        recipe_name = pnstripped[0]
-
-    if pn.find("-initial") != -1:
-        pnstripped = pn.split("-initial")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-        bb.data.update_data(localdata)
-        recipe_name = pnstripped[0]
+    if pnstripped.find("-native") != -1:
+        pnstripped = pnstripped.split("-native")[0]
+
+    if pnstripped.startswith("nativesdk-"):
+        pnstripped = pnstripped.split("nativesdk-")[1]
+
+    if pnstripped.find("-cross") != -1:
+        pnstripped = pnstripped.split("-cross")[0]
+
+    if pnstripped.find("-crosssdk") != -1:
+        pnstripped = pnstripped.split("-crosssdk")[0]
+
+    if pnstripped.find("-initial") != -1:
+        pnstripped = pnstripped.split("-initial")[0]
+
+    localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+
+    bb.data.update_data(localdata)
+    recipe_name = pnstripped
 
     bb.note("Recipe: %s" % recipe_name)
     tmp = localdata.getVar('DISTRO_PN_ALIAS', True)
-- 
1.9.1

-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


