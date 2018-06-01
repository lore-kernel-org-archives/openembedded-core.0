Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9E0745F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:18:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2018 22:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,464,1520924400"; d="scan'208";a="60867562"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2018 22:18:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 13:18:18 +0800
Message-Id: <20180601051818.31971-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] wic/bootimg-efi.py: recognize initrd when using grub
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
X-List-Received-Date: Fri, 01 Jun 2018 05:18:24 -0000

Make sure that we're able to use the initrd value specified in the wks
file when using grub-efi bootloader with bootimg-efi wic plugin.

Fixes [YOCTO #12689]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index beb74d7a71..0eb86a079f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -45,7 +45,7 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_grubefi(cls, creator, cr_workdir):
+    def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
         """
         Create loader-specific (grub-efi) config
         """
@@ -62,6 +62,18 @@ class BootimgEFIPlugin(SourcePlugin):
                 raise WicError("configfile is specified but failed to "
                                "get it from %s." % configfile)
 
+        initrd = source_params.get('initrd')
+
+        if initrd:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            exec_cmd(cp_cmd, True)
+        else:
+            logger.debug("Ignoring missing initrd")
+
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
             bootloader = creator.ks.bootloader
@@ -76,6 +88,10 @@ class BootimgEFIPlugin(SourcePlugin):
 
             grubefi_conf += "linux %s root=%s rootwait %s\n" \
                 % (kernel, creator.rootdev, bootloader.append)
+
+            if initrd:
+               grubefi_conf += "initrd /%s\n" % initrd
+
             grubefi_conf += "}\n"
 
         logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
@@ -167,7 +183,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         try:
             if source_params['loader'] == 'grub-efi':
-                cls.do_configure_grubefi(creator, cr_workdir)
+                cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             else:
-- 
2.17.0


