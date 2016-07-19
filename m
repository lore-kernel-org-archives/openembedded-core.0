Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73D8D60589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:02:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2016 12:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,390,1464678000"; d="scan'208";a="142060586"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2016 12:02:59 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 12:04:55 -0700
Message-Id: <1468955096-36964-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2 1/2] wic: add systemd-boot option in EFI boot image plugin
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
X-List-Received-Date: Tue, 19 Jul 2016 19:02:58 -0000

The new systemd-boot enabled in OE is the old gummiboot
merged into systemd project. Our intention is to replace
gummiboot with systemd-boot in OE once every feature based
on gummiboot is supported with systemd-boot.

Before we can purge gummiboot, we temporarily keep both of
the two bootloaders supported.

Patch doesn't do replacement for every "gummi" occurrence.
We think cleaning can be done in background after we disable
people to use gummiboot, so we just keep change small and
safe this time.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 3a16861..8bc3622 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -84,7 +84,7 @@ class BootimgEFIPlugin(SourcePlugin):
     @classmethod
     def do_configure_gummiboot(cls, hdddir, creator, cr_workdir):
         """
-        Create loader-specific (gummiboot) config
+        Create loader-specific systemd-boot/gummiboot config
         """
         install_cmd = "install -d %s/loader" % hdddir
         exec_cmd(install_cmd)
@@ -149,7 +149,8 @@ class BootimgEFIPlugin(SourcePlugin):
         try:
             if source_params['loader'] == 'grub-efi':
                 cls.do_configure_grubefi(hdddir, creator, cr_workdir)
-            elif source_params['loader'] == 'gummiboot':
+            elif source_params['loader'] == 'gummiboot' \
+                 or source_params['loader'] == 'systemd-boot':
                 cls.do_configure_gummiboot(hdddir, creator, cr_workdir)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
@@ -189,7 +190,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
-            elif source_params['loader'] == 'gummiboot':
+            elif source_params['loader'] == 'gummiboot' \
+                 or source_params['loader'] == 'systemd-boot':
                 cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
                 exec_cmd(cp_cmd, True)
             else:
-- 
2.7.4


