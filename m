Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CA25372FB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:30:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 07:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67845925"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2017 07:30:16 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id ABB256A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:30:15 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:23:11 +0200
Message-Id: <0afc6522aad6a68b7557d5217e5726e628cae97c.1487690169.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/6] wic: raise WicError instead of calling logger.error
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
X-List-Received-Date: Tue, 21 Feb 2017 15:30:16 -0000

Replaced forgotten calls of logger.error with raising
WicError exception. Otherwise errors will be ignored.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 4 ++--
 scripts/lib/wic/utils/misc.py                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 74c75a0..bbc9f47 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -96,8 +96,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
                 logger.debug("Using custom configuration file %s "
                              "for syslinux.cfg", bootloader.configfile)
             else:
-                logger.error("configfile is specified but failed to "
-                             "get it from %s.", bootloader.configfile)
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % bootloader.configfile)
 
         if not custom_cfg:
             # Create syslinux configuration using parameters from wks file
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 216ab7b..c941112 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -136,7 +136,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
         else:
             msg += "Wic failed to find a recipe to build native %s. Please "\
                    "file a bug against wic.\n" % prog
-        logger.error(msg)
+        raise WicError(msg)
 
     return ret, out
 
-- 
2.1.4


