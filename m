Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB9C6CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 16:54:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Nov 2013 09:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="428363565"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 01 Nov 2013 09:53:40 -0700
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 6153E6A4007;
	Fri,  1 Nov 2013 09:53:39 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 19:03:48 +0100
Message-Id: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Fri, 01 Nov 2013 16:54:06 -0000

- added buildstats inheritance inside buildhistory
- reworked the buildstats directory structure not to contain the build name(read: the build start date).
Now it only contains the target name and machine. This is usefull in order to reduce git noise.
- because builds are no longer separated by build name(read: date) it is necessary to remake(remove and create from scratch)
the buildstats folder for each build in order keep buildstats compatible with tools like pybootchartgui.py

Some changes to make the new functionality compatible with Yocto:
- remove buildstats from default usage because it now needs buildhistory (remove it from USER_CLASSES in local.conf)
- add 'buildhistory' to USER_CLASSES or add INHERIT += "buildhistory" in local.conf
OPTIONAL: - I tested this patch with buildhistory under git enabled (BUILDHISTORY_COMMIT = "1" in local.conf). I believe this
should be made default.

I made some tests with the buildhistory-diff tool and it is compatible with the changes. We can add further functionality
to it in order to make it interpret buildstats data.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/classes/buildhistory.bbclass |    1 +
 meta/classes/buildstats.bbclass   |    8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3da03c8..a78bd4b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -19,6 +19,7 @@ BUILDHISTORY_PUSH_REPO ?= ""
 
 # Must inherit package first before changing PACKAGEFUNCS
 inherit package
+inherit buildstats
 PACKAGEFUNCS += "buildhistory_emit_pkghistory"
 
 # We don't want to force a rerun of do_package for everything
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 72fff11..476ae94 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,4 +1,4 @@
-BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
+BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
 BNFILE = "${BUILDSTATS_BASE}/.buildname"
 DEVFILE = "${BUILDSTATS_BASE}/.device"
 
@@ -33,7 +33,7 @@ def set_bn(e):
 
 def get_bn(e):
     with open(e.data.getVar('BNFILE', True)) as f:
-        bn = f.readline()
+        bn = str(f.readline()).split("/")[0]
     return bn
 
 def set_device(e):
@@ -175,6 +175,10 @@ python run_buildstats () {
         # set the buildname
         ########################################################################
         try:
+            bb.utils.remove(e.data.getVar('BUILDSTATS_BASE', True), recurse=True)
+        except:
+            pass
+        try:
             bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
         except:
             pass
-- 
1.7.9.5


