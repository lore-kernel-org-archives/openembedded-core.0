Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0A972F4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490358616; x=1521894616;
	h=from:to:cc:subject:date:message-id;
	bh=R/+349YcL7TOaGUAmMrVg6JPnVKuOPall3Lewsha7yk=;
	b=crStBvgetiPLnPlw4Y9SXAT2/NsK6q0u5SVSP1MLcPoHnWh7xJC+LYu7
	RFemQUgiue4Z4L/gSIbfIOPS9DSF8w==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 05:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,214,1486454400"; d="scan'208";a="64517941"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2017 05:30:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 586B56A4080;
	Fri, 24 Mar 2017 05:30:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 14:29:52 +0200
Message-Id: <1490358592-32508-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: use kernel_dir to find systemd-efi bootloader
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
X-List-Received-Date: Fri, 24 Mar 2017 12:30:14 -0000

Fixed test failure caused by using bootimg_dir path
instead of kernel_dir to find systemd-efi bootloader:
FAIL: test_systemd_bootdisk (oeqa.selftest.wic.Wic)
...
FileNotFoundError: [Errno 2] No such file or directory:
'tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index ff76c2f..9879cb9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -209,7 +209,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
-                for mod in [x for x in os.listdir(bootimg_dir) if x.startswith("systemd-")]:
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
             else:
-- 
2.1.4


