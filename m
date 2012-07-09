Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMo-000659-QS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292929"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:43 -0700
Message-Id: <955f8c5881c35fa69f806225cadf6e2ce8832654.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/41] populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 16:11:24 -0000

From: Mark Hatle <mark.hatle@windriver.com>

An anonymous python chunk configures some multilib settings for both
populate_sdk_rpm and rootfs_rpm.  The two classes should contain identical
versions to ensure that the generated multilib configuration is the same
for the SDK and the rootfs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_rpm.bbclass |   15 ++++++++++-----
 meta/classes/rootfs_rpm.bbclass       |    1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index b115c27..365a337 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -115,18 +115,23 @@ EOF
 }
 
 python () {
+    # The following code should be kept in sync w/ the rootfs_rpm version.
     ml_package_archs = ""
+    ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
-            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + eext[1]
-            localdata.setVar("OVERRIDES", overrides)
-            # TEMP: OVERRIDES isn't working right
-            localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
+            if default_tune:
+                localdata.setVar("DEFAULTTUNE", default_tune)
+            package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
+            package_archs = " ".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()])
+            ml_package_archs += " " + package_archs
+            ml_prefix_list += " " + eext[1]
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     d.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs)
+    d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 202f9ce..4551f7a 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -198,6 +198,7 @@ python () {
         d.setVar('RPM_PREPROCESS_COMMANDS', '')
         d.setVar('RPM_POSTPROCESS_COMMANDS', '')
 
+    # The following code should be kept in sync w/ the populate_sdk_rpm version.
     ml_package_archs = ""
     ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
-- 
1.7.7.6



