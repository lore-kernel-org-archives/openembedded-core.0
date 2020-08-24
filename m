Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.189892.1598251184363809199
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: c9SjNUm3JWn5sgswSE5m+Vl8QW//gkdWzz8kcVxMtukr7a/f2QoK5bAzwHrQJ65262wbwxk5Eb
 4CfpllJ8LnhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="135391314"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="135391314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 23:39:43 -0700
IronPort-SDR: hRyZdNUOsK+C64OKZUBjeY8XH53By2YQHU9Ihdx5kWoRFFjj5brw4wu1w/bFm+os3WVv/B7FSs
 qrkJmIj7xAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="473806066"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005.jf.intel.com with ESMTP; 23 Aug 2020 23:39:43 -0700
From: khairul.rohaizzat.jamaluddin@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/bootimg-efi: Added feature to exclude IMAGE_BOOT_FILES
Date: Mon, 24 Aug 2020 14:39:42 +0800
Message-Id: <1598251182-58358-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
when both bootimg-partition and bootimg-efi occur in a single .wks
and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
will be duplicated in both partition.
Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
optional for bootimg-efi, hence allow bootimg-efi to have the option
to ignore it.

The new variable, excludeibf, in bootimg-efi.py need to be set in
the .wks file to make use of this feature. Simply remove the
variable from the the .wks file if not needed.
Example:
    part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,
    excludeibf=y" --ondisk sda --label msdos --active --align 1024 --use-uuid

[YOCTO #14011]

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 14c1723..b3c76e2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -214,6 +214,8 @@ class BootimgEFIPlugin(SourcePlugin):
 
         if get_bitbake_var("IMAGE_BOOT_FILES") is None:
             logger.debug('No boot files defined in IMAGE_BOOT_FILES')
+        elif source_params.get('excludeibf') == 'y':
+            logger.debug('Skipping IMAGE_BOOT_FILES values')
         else:
             boot_files = None
             for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
@@ -292,7 +294,9 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, kernel, hdddir, kernel)
         exec_cmd(install_cmd)
 
-        if get_bitbake_var("IMAGE_BOOT_FILES"):
+        if source_params.get('excludeibf') == 'y':
+            logger.debug('Skipping IMAGE_BOOT_FILES values')
+        elif get_bitbake_var("IMAGE_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
                 install_cmd = "install -m 0644 -D %s %s" \
                               % (os.path.join(kernel_dir, src_path),
-- 
2.7.4

