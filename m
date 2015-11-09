Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 538DF766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:15:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 14:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,267,1444719600"; d="scan'208";a="597159086"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 14:15:57 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:04:42 +0000
Message-Id: <5736d7f75445f625a8563050fcabc42ea7060d30.1447077439.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 5/6] license.bbclass: Add function get_deployed_files
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
X-List-Received-Date: Mon, 09 Nov 2015 22:15:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This function will get the files that were deployed in
the image using the sstate-control manifest file. This
will give a better view of what was deployed in the image.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d384491..463dd54 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -141,6 +141,19 @@ def get_boot_dependencies(d):
                         break
     return depends
 
+def get_deployed_files(d, man_file):
+    """ This will get the files deployed from the sstate manifest """
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
 def write_license_files(d, license_manifest, pkg_dic):
     import re
 
-- 
1.8.4.5


