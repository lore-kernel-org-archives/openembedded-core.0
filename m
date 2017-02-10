Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 69F1F71ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="932388898"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 10 Feb 2017 07:28:52 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8E6CA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:50 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:41 +0200
Message-Id: <0e090e1930c4d18379d05935208c493ef4fd8c68.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/13] wic: direct: remove set_bootimg_dir setter
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:51 -0000

Removed java-like setter set_bootimg_dir. It's more pythonic
to access public attributes directly.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py         | 9 ---------
 scripts/lib/wic/plugins/source/bootimg-efi.py    | 2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 2 +-
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 1204431..a2bc4c4 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -149,15 +149,6 @@ class DirectPlugin(ImagerPlugin):
 
         return updated
 
-    def set_bootimg_dir(self, bootimg_dir):
-        """
-        Accessor for bootimg_dir, the actual location used for the source
-        of the bootimg.  Should be set by source plugins (only if they
-        change the default bootimg source) so the correct info gets
-        displayed for print_outimage_info().
-        """
-        self.bootimg_dir = bootimg_dir
-
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
         return os.path.join(path, "%s-%s.%s" % (self.name, name, extention))
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index dd6c920..95316c8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -187,7 +187,7 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
             # just so the result notes display it
-            creator.set_bootimg_dir(bootimg_dir)
+            creator.bootimg_dir = bootimg_dir
 
         staging_kernel_dir = kernel_dir
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 0be2b78..e5f6a32 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -151,7 +151,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             if not _has_syslinux(bootimg_dir):
                 msger.error("Please build syslinux first\n")
             # just so the result notes display it
-            creator.set_bootimg_dir(bootimg_dir)
+            creator.bootimg_dir = bootimg_dir
 
         staging_kernel_dir = kernel_dir
 
-- 
2.1.4


