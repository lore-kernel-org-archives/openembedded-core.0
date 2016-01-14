Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20C026FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:15:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2016 06:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="890435449"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2016 06:15:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 7E4596A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:03:35 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:59 +0200
Message-Id: <689a1bfa0f20b2713f020bfce058bb844eba1654.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 9/9] wic: get rid of 2 getters
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
X-List-Received-Date: Thu, 14 Jan 2016 14:15:38 -0000

Used partitions and configfile bootloader attributes instead of
using getters get_bootloader_file and get_partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py                 |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py    |  4 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 11 ++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 09ff5f8..8d4daec 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -159,7 +159,7 @@ class DirectImageCreator(BaseImageCreator):
                 self.ks.partitions.append(part)
 
         # partitions list from kickstart file
-        return kickstart.get_partitions(self.ks)
+        return self.ks.partitions
 
     def get_disk_names(self):
         """ Returns a list of physical target disk names (e.g., 'sdb') which
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 8bfa3a9..22f9813 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -46,7 +46,7 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
-        configfile = kickstart.get_bootloader_file(creator.ks)
+        configfile = creator.ks.bootloader.configfile
         custom_cfg = None
         if configfile:
             custom_cfg = get_custom_config(configfile)
@@ -104,7 +104,7 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.write(loader_conf)
         cfg.close()
 
-        configfile = kickstart.get_bootloader_file(creator.ks)
+        configfile = creator.ks.bootloader.configfile
         custom_cfg = None
         if configfile:
             custom_cfg = get_custom_config(configfile)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index e84bddf..0b5478e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -84,18 +84,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
-        configfile = kickstart.get_bootloader_file(creator.ks)
+        bootloader = creator.ks.bootloader
+
         custom_cfg = None
-        if configfile:
-            custom_cfg = get_custom_config(configfile)
+        if bootloader.configfile:
+            custom_cfg = get_custom_config(bootloader.configfile)
             if custom_cfg:
                 # Use a custom configuration for grub
                 syslinux_conf = custom_cfg
                 msger.debug("Using custom configuration file "
-                        "%s for syslinux.cfg" % configfile)
+                            "%s for syslinux.cfg" % bootloader.configfile)
             else:
                 msger.error("configfile is specified but failed to "
-                        "get it from %s." % configfile)
+                            "get it from %s." % bootloader.configfile)
 
         if not custom_cfg:
             # Create syslinux configuration using parameters from wks file
-- 
2.1.4


