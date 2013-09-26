Return-Path: <ddalex@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0809A6CBB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:02:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2013 09:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,986,1371106800"; d="scan'208";a="299695288"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Sep 2013 09:01:43 -0700
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 71B68560829; Thu, 26 Sep 2013 17:01:43 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 17:01:41 +0100
Message-Id: <1380211301-23898-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1380211301-23898-1-git-send-email-alexandru.damian@intel.com>
References: <1380211301-23898-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/2] package.bbclass: add event with package file contents
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
X-List-Received-Date: Thu, 26 Sep 2013 16:02:13 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In populate packages, the code breaks the artifacts
of the build process into separate directories for
each final package.

I'm adding code to use this opportunity and send out
a list of artifacts for each package together with the sizes.

This is needed in order to allow inspection of build artifacts
on remote clients.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/package.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 67ee138..8f7ee3c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1025,6 +1025,20 @@ python populate_packages () {
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
+    for pkg in package_list:
+        pkg_info_data = { 'PKG' : pkg }
+        root = os.path.join(pkgdest, pkg)
+
+        os.chdir(root)
+        pkg_info_data['FILES'] = []
+        import subprocess
+        for path in subprocess.Popen("find . -type f", shell=True, bufsize=16384, stdout=subprocess.PIPE).communicate()[0].rstrip().split("\n"):
+            if len(path) > 0:
+                size = os.stat(path).st_size
+                pkg_info_data['FILES'].append((path, size))
+
+        bb.event.fire(bb.event.MetadataEvent("PackageFileSize",pkg_info_data), d)
+
     os.chdir(workdir)
 
     unshipped = []
-- 
1.8.1.2


