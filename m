Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A538C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:08:55 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.7457.1711051726270147453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7AnTsPi;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690cf6ecd3cso8887656d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711051724; x=1711656524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3qkPVQqU6Ak5p5lXLV4LncqfjtJjfwWLlU2hsEB8o=;
        b=C7AnTsPirlVzoQIea+oKJY21p+hN0WIiqTYZblGMlrsl1MaHePBWILzfEdEHz9pOOb
         fuvBnTVK1xxubev0hY8SsANYlxlAg2yvxrhKDzv3I+7OBa356Xtrf3WytwqQa3kJjjZw
         mCQEsuq0LBq0ptlTXPal655GlYLHiKT35lSIS+g48yaBZor7Xyf0J3vlaO71aZRvlxkY
         4J8GPCqQkwCs8louDq1nUYgohLuxa0L5CzxD4cmj6+dKo5Ta0Bgbi2jG8NgjFQFdkTHs
         IZBb33MY2e4ELiaTKD/J5O8vwHU/UT/GceDkQNuHt+JwMJJOPxc29eH4OCTnQUkc8uI/
         3Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711051724; x=1711656524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3qkPVQqU6Ak5p5lXLV4LncqfjtJjfwWLlU2hsEB8o=;
        b=gyk33YFZZWADXDVUU4eiR/KUQrfP2u1KyoL8q6FfSwpzUBwfqHnJTmnebmhheU+qSm
         euIVs42LilwIqBZXwsQ/0rERyQZXbuQR1Zcc+tnsFZWK3jTzFJZCVf2Mi4Sk9Ed4xEfJ
         vgbggUcQ1y5jnKDzbr9C4XcbMZRCpjJUV83rjVUjsTyJsNqpOmVCg0ZQ1PNF1Eevj4X/
         A+QnMsPRF3meJTNPblfrsoGD6h6Ruv8lsruqc0cISn9Vi5kGamngjJa58HqD7pyaB10V
         UuV0FW0PCDNaL7hMda9G/LMCdjX3sFmXDPWJcys8D9KLdC8HwCErbgym3rdWIz5icFC0
         TfLQ==
X-Gm-Message-State: AOJu0Yxd0M7u3Df4hHyhRVx2KQ+NHzDfMGZVAnAmHqmeNHoMvfkYCPUc
	Wum3Taz7kG6Cej5IuDl8ACb5E/KKxpmTaaPDR9qFh7aGdVArP84/CZCBZox7
X-Google-Smtp-Source: AGHT+IHwBFJvRT0yrNsb9yQT6pCvppZj/+urnDC+Na6WbJitaCYl9za9+BFL3vKgHBfIL2zp+CMDKw==
X-Received: by 2002:a05:6214:e87:b0:691:857a:1ef8 with SMTP id hf7-20020a0562140e8700b00691857a1ef8mr145989qvb.61.1711051724029;
        Thu, 21 Mar 2024 13:08:44 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id q15-20020ad45caf000000b0069124066c2fsm228535qvh.140.2024.03.21.13.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 13:08:43 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bmaptool: update to latest
Date: Thu, 21 Mar 2024 16:08:39 -0400
Message-ID: <20240321200839.13633-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197426

Upstream contains the patches that were being carried here.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 12 +--
 .../0001-BmapCopy.py-fix-error-message.patch  | 36 --------
 ...fix-block-device-udev-race-condition.patch | 83 -------------------
 ...mapCopy.py-tweak-suggested-udev-rule.patch | 43 ----------
 4 files changed, 3 insertions(+), 171 deletions(-)
 delete mode 100644 meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch
 delete mode 100644 meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
 delete mode 100644 meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index f70647732372..fd53c21c0663 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -9,16 +9,10 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https \
-	file://0001-BmapCopy.py-fix-error-message.patch \
-	file://0002-CLI.py-fix-block-device-udev-race-condition.patch \
-	file://0003-BmapCopy.py-tweak-suggested-udev-rule.patch \
-	"
-
-SRCREV = "d84a6fd202fe246a0bc19ed2082e41bcdd75fb13"
+SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
+SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
 S = "${WORKDIR}/git"
-BASEVER = "3.7"
+BASEVER = "3.8.0"
 PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch b/meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch
deleted file mode 100644
index ddac322e9135..000000000000
--- a/meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ad0b0513a46c7d238d0fdabee0267c7084b75e84 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <twoerner@gmail.com>
-Date: Thu, 11 Jan 2024 22:04:23 -0500
-Subject: [PATCH 1/3] BmapCopy.py: fix error message
-
-The wrong variable was being used when attempting to print out an informative
-message to the user. Leading to nonsense messages such as:
-
-	bmaptool: info: failed to enable I/O optimization, expect suboptimal speed (reason: cannot switch to the 1 I/O scheduler: 1 in use. None)
-
-Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/129]
-Signed-off-by: Trevor Woerner <twoerner@gmail.com>
----
- bmaptools/BmapCopy.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bmaptools/BmapCopy.py b/bmaptools/BmapCopy.py
-index 9de7ef434233..b1e8e0fcbdb7 100644
---- a/bmaptools/BmapCopy.py
-+++ b/bmaptools/BmapCopy.py
-@@ -892,9 +892,9 @@ class BmapBdevCopy(BmapCopy):
-                 _log.info(
-                     "failed to enable I/O optimization, expect "
-                     "suboptimal speed (reason: cannot switch to the "
--                    f"{max_ratio_chg.temp_value} I/O scheduler: "
--                    f"{max_ratio_chg.old_value or 'unknown scheduler'} in use. "
--                    f"{max_ratio_chg.error})"
-+                    f"'{scheduler_chg.temp_value}' I/O scheduler: "
-+                    f"'{scheduler_chg.old_value or 'unknown scheduler'}' in use. "
-+                    f"{scheduler_chg.error})"
-                 )
-             if max_ratio_chg.error or scheduler_chg.error:
-                 _log.info(
--- 
-2.43.0.76.g1a87c842ece3
-
diff --git a/meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch b/meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
deleted file mode 100644
index ea2749a26432..000000000000
--- a/meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 34f4321dfce28697f830639260076e60d765698b Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <twoerner@gmail.com>
-Date: Fri, 12 Jan 2024 01:16:19 -0500
-Subject: [PATCH 2/3] CLI.py: fix block device udev race condition
-
-We are encouraged to add a udev rule to change a block device's
-bdi/max_ratio to '1' and queue/scheduler to 'none', which I did.
-So I was surprised when, about 50% of the time, I kept seeing:
-
-	...
-	bmaptool: info: failed to enable I/O optimization, expect suboptimal speed (reason: cannot switch to the 'none' I/O scheduler: 'bfq' in use. [Errno 13] Permission denied: '/sys/dev/block/8:160/queue/scheduler')
-	bmaptool: info: You may want to set these I/O optimizations through a udev rule like this:
-	...
-
-The strange part is that sometimes it doesn't report a problem and
-sometimes it does, even if the block device is left plugged in continuously
-between multiple bmaptool invocations.
-
-In all of my tests the bdi/max_ratio is always okay, but the
-queue/scheduler would sometimes be reported as being the default scheduler,
-not the one the udev rule was setting (none). Yet no matter how many times
-I would read the file outside of bmaptool it always would be set to the
-correct scheduler.
-
-It turns out that opening a block device in "wb+" mode, which is what
-bmaptool is doing at one point, causes the block device to act as though
-it was just inserted, giving it the default settings, then causing udev to
-trigger to switch it to the requested settings. However, if udev doesn't
-finish before bmaptool reads the scheduler value there's a chance it will
-read the pre-udev value, not the post-udev value, even though the block
-device was never physically removed and re-inserted.
-
-bmaptool was opening every file, then checking for block devices and
-if found, closing then re-opening the block devices via a special
-block-opening helper function. This patch re-organizes the code to only
-open block devices once using the special block-opening helper function
-that does not open block devices in "wb+" mode.
-
-Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/130]
-Signed-off-by: Trevor Woerner <twoerner@gmail.com>
----
- bmaptools/CLI.py | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/bmaptools/CLI.py b/bmaptools/CLI.py
-index 82303b7bc398..0a263f05cf43 100644
---- a/bmaptools/CLI.py
-+++ b/bmaptools/CLI.py
-@@ -38,6 +38,7 @@ import tempfile
- import traceback
- import shutil
- import io
-+import pathlib
- from bmaptools import BmapCreate, BmapCopy, BmapHelpers, TransRead
- 
- VERSION = "3.7"
-@@ -440,17 +441,16 @@ def open_files(args):
-     # Try to open the destination file. If it does not exist, a new regular
-     # file will be created. If it exists and it is a regular file - it'll be
-     # truncated. If this is a block device, it'll just be opened.
-+    dest_is_blkdev = False
-     try:
--        dest_obj = open(args.dest, "wb+")
-+        if pathlib.Path(args.dest).is_block_device():
-+            dest_is_blkdev = True
-+            dest_obj = open_block_device(args.dest)
-+        else:
-+            dest_obj = open(args.dest, "wb+")
-     except IOError as err:
-         error_out("cannot open destination file '%s':\n%s", args.dest, err)
- 
--    # Check whether the destination file is a block device
--    dest_is_blkdev = stat.S_ISBLK(os.fstat(dest_obj.fileno()).st_mode)
--    if dest_is_blkdev:
--        dest_obj.close()
--        dest_obj = open_block_device(args.dest)
--
-     return (image_obj, dest_obj, bmap_obj, bmap_path, image_obj.size, dest_is_blkdev)
- 
- 
--- 
-2.43.0.76.g1a87c842ece3
-
diff --git a/meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch b/meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
deleted file mode 100644
index 2794eeada394..000000000000
--- a/meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2a71e0c1a675e4f30f02c03dd0325944b393c434 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <twoerner@gmail.com>
-Date: Fri, 12 Jan 2024 01:54:26 -0500
-Subject: [PATCH 3/3] BmapCopy.py: tweak suggested udev rule
-
-Both bdi/max_ratio and queue/scheduler are only valid for whole block devices,
-not individual partitions. Therefore, add a
-
-	ENV{DEVTYPE}!="partition",
-
-to the suggested udev rule so that bmaptool doesn't try to check every
-partition of the block device, just the whole device.
-
-Otherwise the following will appear in the logs:
-
-	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/bdi/min_ratio}, ignoring: No such file or directory
-	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/bdi/max_ratio}, ignoring: No such file or directory
-	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/queue/scheduler}, ignoring: No such file or directory
-	[... and so on for every partition on your block device ...]
-
-Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/131]
-Signed-off-by: Trevor Woerner <twoerner@gmail.com>
----
- bmaptools/BmapCopy.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bmaptools/BmapCopy.py b/bmaptools/BmapCopy.py
-index b1e8e0fcbdb7..a4c1177246a9 100644
---- a/bmaptools/BmapCopy.py
-+++ b/bmaptools/BmapCopy.py
-@@ -906,7 +906,8 @@ class BmapBdevCopy(BmapCopy):
-                     "\n"
-                     'ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="xxxx", '
-                     'ATTRS{idProduct}=="xxxx", TAG+="uaccess"\n'
--                    'SUBSYSTEMS=="usb", ATTRS{idVendor}=="xxxx", '
-+                    'SUBSYSTEMS=="usb", ENV{DEVTYPE}!="partition", '
-+                    'ATTRS{idVendor}=="xxxx", '
-                     'ATTRS{idProduct}=="xxxx", ATTR{bdi/min_ratio}="0", '
-                     'ATTR{bdi/max_ratio}="1", ATTR{queue/scheduler}="none"\n'
-                     "\n"
--- 
-2.43.0.76.g1a87c842ece3
-
-- 
2.43.0.76.g1a87c842ece3


