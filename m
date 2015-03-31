Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 50FDC73CC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:12:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2015 13:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="688479885"
Received: from hsolver-mobl.ger.corp.intel.com (HELO fuath.ger.corp.intel.com)
	([10.252.22.169])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2015 13:12:12 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 21:11:05 +0100
Message-Id: <a802fb6d10856ea6ed84e6da0da596f5f1d0fd1d.1427832505.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/3] distrodata.bbclass/distro_check.py: Support -dummy mapping of PN
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

Strip out -dummy in order to map to the base PN of dummy packages

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/distrodata.bbclass | 12 ++++++++++++
 meta/lib/oe/distro_check.py     |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 10e59d3..6562c86 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -47,6 +47,10 @@ python do_distrodata_np() {
             pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
 
+        if pnstripped.find("-dummy") != -1:
+            pnstripped = pnstripped.split("-dummy")
+            bb.note("dummy Split: %s" % pnstripped)
+
         localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
 
@@ -127,6 +131,10 @@ python do_distrodata() {
             pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
 
+        if pnstripped.find("-dummy") != -1:
+            pnstripped = pnstripped.split("-dummy")[0]
+            bb.note("dummy Split: %s" % pnstripped)
+
         localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
 
@@ -293,6 +301,10 @@ python do_checkpkg() {
             pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
 
+        if pnstripped.find("-dummy") != -1:
+            pnstripped = pnstripped.split("-dummy")[0]
+            bb.note("dummy Split: %s" % pnstripped)
+
         localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
 
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index f754991..d13783b 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -279,7 +279,9 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     recipe_name = d.getVar('PN', True)
     bb.note("Checking: %s" % pn)
     pnstripped = pn
-    trim_dict = dict({"-native":"-native", "-cross":"-cross", "-crosssdk":"-crosssdk" ,"-initial":"-initial"})
+    trim_dict = dict({"-native":"-native", "-cross":"-cross", \
+                      "-crosssdk":"-crosssdk" ,"-initial":"-initial", \
+                      "-dummy":"-dummy"})
 
     if pnstripped.find("-native") != -1:
         pnstripped = pnstripped.split("-native")[0]
@@ -296,6 +298,9 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     if pnstripped.find("-initial") != -1:
         pnstripped = pnstripped.split("-initial")[0]
 
+    if pnstripped.find("-dummy") != -1:
+        pnstripped = pnstripped.split("-dummy")[0]
+
     localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
 
     bb.data.update_data(localdata)
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


