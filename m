Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C16A7199E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 17:53:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 10:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,287,1496127600"; d="scan'208";a="987324290"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2017 10:53:31 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 10:53:30 -0700
Message-Id: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Fri, 30 Jun 2017 17:53:34 -0000

When using wic to create an image from a certain build, wic is expecting
to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
which is wrong, since the initrd file has not been copied to the final
directory yet, so instead of trying to use an initrd file from 
DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory 
where the resulting images are placed before their final destination, 
and its where we can find the correct initrd file for our image.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 9879cb9fceb..d1d445ecfe1 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -105,9 +105,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         if initrd:
             # obviously we need to have a common common deploy var
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            bootimg_dir = get_bitbake_var("IMGDEPLOYDIR")
             if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+                raise WicError("Couldn't find IMGDEPLOYDIR, exiting")
 
             cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
             exec_cmd(cp_cmd, True)
-- 
2.12.0


