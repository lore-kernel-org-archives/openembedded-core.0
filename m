Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6107A77AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 22 Mar 2017 06:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="79825630"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2017 06:44:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 64B532C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:43:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:26 +0200
Message-Id: <d3467b4b9ed4eeb0108ca66ba3f5750d937b87d4.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/10] wic: don't set creator.bootimg_dir in plugins
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:03 -0000

Changing bootimg_dir in plugins is a dangerous hack as this
value comes from wic command line and can be used by multiple
plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py    | 2 --
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 2 --
 2 files changed, 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2d793a5..2d1c4d4 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -189,8 +189,6 @@ class BootimgEFIPlugin(SourcePlugin):
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-            # just so the result notes display it
-            creator.bootimg_dir = bootimg_dir
 
         staging_kernel_dir = kernel_dir
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index bd03eaa..1779520 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -153,8 +153,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
                 raise WicError("Couldn't find STAGING_DATADIR, exiting")
             if not _has_syslinux(bootimg_dir):
                 raise WicError("Please build syslinux first")
-            # just so the result notes display it
-            creator.bootimg_dir = bootimg_dir
 
         staging_kernel_dir = kernel_dir
 
-- 
2.1.4


