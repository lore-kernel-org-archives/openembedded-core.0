Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 696BD606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:36:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 14:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,319,1444719600"; d="scan'208";a="855244960"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2015 14:36:55 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:25:18 +0000
Message-Id: <bc8afc65a1ecd361a682a1e543731d107521c61e.1447942163.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3 5/6] license.bbclass: Add function get_deployed_files
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
X-List-Received-Date: Thu, 19 Nov 2015 22:36:55 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This function will get the files that were deployed using
the sstate-control manifest file. This will give a better
view of what was deployed next to the image.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f012783..dbec4d7 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -225,6 +225,21 @@ def get_boot_dependencies(d):
                         break
     return depends
 
+def get_deployed_files(man_file):
+    """
+    This will get the files deployed from the sstate manifest
+    """
+
+    dep_files = ""
+    excluded_files = ["README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"]
+    with open(man_file, "r") as manifest:
+        all_files = manifest.read()
+    for f in all_files.splitlines():
+        if ((not (os.path.islink(f) or os.path.isdir(f))) and
+                not os.path.basename(f) in excluded_files):
+            dep_files = "%s %s" % (dep_files, os.path.basename(f))
+    return dep_files
+
 python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
-- 
1.8.4.5


