Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1468A73CC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:12:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2015 13:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="688479890"
Received: from hsolver-mobl.ger.corp.intel.com (HELO fuath.ger.corp.intel.com)
	([10.252.22.169])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2015 13:12:12 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 21:11:06 +0100
Message-Id: <1ec089080f95b9042d782b5e5ecc6628877acd02.1427832505.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/3] distrodata.bbclass/distro_check.py: Support buildtools PN mapping
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
X-List-Received-Date: Tue, 31 Mar 2015 20:12:12 -0000

We need to be able to map buildtools- to the original PN.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/distrodata.bbclass | 12 ++++++++++++
 meta/lib/oe/distro_check.py     |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 6562c86..f540170 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -43,6 +43,10 @@ python do_distrodata_np() {
             pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
 
+        if pnstripped.find("buildtools-") != -1:
+            pnstripped = pnstripped.split("buildtools-")[1]
+            bb.note("buildtools Split: %s" % pnstripped)
+
         if pnstripped.find("-initial") != -1:
             pnstripped = pnstripped.split("-initial")[0]
             bb.note("initial Split: %s" % pnstripped)
@@ -119,6 +123,10 @@ python do_distrodata() {
             pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
 
+        if pnstripped.find("buildtools-") != -1:
+            pnstripped = pnstripped.split("buildtools-")[1]
+            bb.note("buildtools Split: %s" % pnstripped)
+
         if pnstripped.find("-cross") != -1:
             pnstripped = pnstripped.split("-cross")[0]
             bb.note("cross Split: %s" % pnstripped)
@@ -289,6 +297,10 @@ python do_checkpkg() {
             pnstripped = pnstripped.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
 
+        if pnstripped.find("buildtools-") != -1:
+            pnstripped = pnstripped.split("buildtools-")[1]
+            bb.note("buildtools Split: %s" % pnstripped)
+
         if pnstripped.find("-cross") != -1:
             pnstripped = pnstripped.split("-cross")[0]
             bb.note("cross Split: %s" % pnstripped)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index d13783b..88474d0 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -289,6 +289,9 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     if pnstripped.startswith("nativesdk-"):
         pnstripped = pnstripped.split("nativesdk-")[1]
 
+    if pnstripped.find("buildtools-") != -1:
+        pnstripped = pnstripped.split("buildtools-")[1]
+
     if pnstripped.find("-cross") != -1:
         pnstripped = pnstripped.split("-cross")[0]
 
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


