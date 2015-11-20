Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A296E60670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 18:56:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Nov 2015 10:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="604303870"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2015 10:56:22 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 10:44:49 +0000
Message-Id: <d4209ee736b1da2f63052fde3eb206e38170e660.1448015777.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448015777.git.mariano.lopez@linux.intel.com>
References: <cover.1448015777.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv4 1/6] license.bbclass: Write recipeinfo file in license folder
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
X-List-Received-Date: Fri, 20 Nov 2015 18:56:23 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently there is no way to get the recipe version when
creating the rootfs. It is needed because the manifest
file for the image has to contain this important piece
of information.

This change writes a new file in the license folder for
every recipe. This file is called "recipeinfo" and have
the information used to write the manifest file for the
recipes deployed next to the image.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c616a20..76f40c9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -142,6 +142,10 @@ python do_populate_lic() {
     # The base directory we wrangle licenses to
     destdir = os.path.join(d.getVar('LICSSTATEDIR', True), d.getVar('PN', True))
     copy_license_files(lic_files_paths, destdir)
+    info = get_recipe_info(d)
+    with open(os.path.join(destdir, "recipeinfo"), "w") as f:
+        for key in sorted(info.keys()):
+            f.write("%s: %s\n" % (key, info[key]))
 }
 
 # it would be better to copy them in do_install_append, but find_license_filesa is python
@@ -156,6 +160,13 @@ python perform_packagecopy_prepend () {
         add_package_and_files(d)
 }
 
+def get_recipe_info(d):
+    info = {}
+    info["PV"] = d.getVar("PV", True)
+    info["PR"] = d.getVar("PR", True)
+    info["LICENSE"] = d.getVar("LICENSE", True)
+    return info
+
 def add_package_and_files(d):
     packages = d.getVar('PACKAGES', True)
     files = d.getVar('LICENSE_FILES_DIRECTORY', True)
-- 
1.8.4.5


