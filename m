Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35180C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:19:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.7980.1705069151007506923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ByThM/c8;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783293278adso341458685a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705069147; x=1705673947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=isr+LK4OBB1ar3ZNVrgpX9+G1IRt3tzv1x2mlIgo1hU=;
        b=ByThM/c8Ii/v7OktPvHWM8UnY0XPvlNXmCatVCqOh+O0EtG8sZByrPthhNJapsiOTg
         PPYlr6ZAZQJotF4QmSwmucbmwQVZG5m/MJvDV2SbmeoUaOyZHoURVsCEU5fWjdTUPdme
         QheuZD+WSyb+sgqG88u0XSr7eDh1MfmhnONVA60AIw7HQdYGudwGI5vqBycT3XHG/2sa
         Iz6KSfp2UjACev8UGXl08N6grGUnQDWQ4uzTQdrgxL6zpXVbvH8s8ealuAsDxHwxEgXw
         y5aUnaLYE2Gh0OPasCrNHe9xst2YCbDgiqmpFWF9coNL1hb5JN4UONAwtpnvW3Hh+XXR
         RmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069147; x=1705673947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isr+LK4OBB1ar3ZNVrgpX9+G1IRt3tzv1x2mlIgo1hU=;
        b=oLnGeQvTIa84V1EsRA87peb7cyEqcX063PPRfO5c9yTunT8cGIfDQlyu7yMKbmK1rG
         VjbHt/A2iKP6JVjrPRZ8ZKaOiIL6sK23aHdxEYX1XziDlFk4kK4S2GKLPx7O7PSuaDQH
         5oC7ii4rIU1tzmC9Oe0J+aHqzIGQBqoqCWnEWmUgSWPjnhP5sHYxRTUQsTIQuEu3F6yi
         PS4cNWZarYpJ8PzJRwyTIfxyBU8/mdwgERCNcQE64ZMuRhydL0B4Ws/MFNj9EPd9Jgmt
         tXPItda9FTgpoYXBP9zsFkxrPyLAJa94N4rWDnTsHp0Vdl/Ajx0V9dQopMw8BrEzOBuk
         G6SA==
X-Gm-Message-State: AOJu0Yzlt9MSMzpOfEWsRwquAzap4o/cJVO7eBqEKQyS4SzDWPMwQFfa
	7np/oyvkDvB3nv9Nv4V1pcF98pW0ioCbFA==
X-Google-Smtp-Source: AGHT+IFScJrATgwIuUWVu/ZiXl0M11w6lKs5mU76MdyVsEKYjej72oTx8kYAu2NO7V1mdsHd1V1SQg==
X-Received: by 2002:ad4:5bae:0:b0:67f:dc29:f9d0 with SMTP id 14-20020ad45bae000000b0067fdc29f9d0mr1066033qvq.114.1705069147462;
        Fri, 12 Jan 2024 06:19:07 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id o12-20020a0562140e4c00b006812de43724sm1067924qvc.97.2024.01.12.06.19.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:19:06 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bmaptool: add 3 fixes
Date: Fri, 12 Jan 2024 09:18:56 -0500
Message-ID: <20240112141856.27697-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 14:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193583

I found a couple issues with bmaptool, including a race condition, which I
have fixed and submitted upstream. This patch adds these fixes to the project
now while waiting for feedback and a new release:

	BmapCopy.py: fix error message
	CLI.py: fix block device udev race condition
	BmapCopy.py: tweak suggested udev rule

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../bmap-tools/bmap-tools_git.bb              |  7 +-
 .../0001-BmapCopy.py-fix-error-message.patch  | 36 ++++++++
 ...fix-block-device-udev-race-condition.patch | 83 +++++++++++++++++++
 ...mapCopy.py-tweak-suggested-udev-rule.patch | 43 ++++++++++
 4 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch
 create mode 100644 meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
 create mode 100644 meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index effba2ecad68..9bbd7d51c831 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -9,7 +9,12 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https \
+	file://0001-BmapCopy.py-fix-error-message.patch \
+	file://0002-CLI.py-fix-block-device-udev-race-condition.patch \
+	file://0003-BmapCopy.py-tweak-suggested-udev-rule.patch \
+	"
 
 SRCREV = "d84a6fd202fe246a0bc19ed2082e41bcdd75fb13"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch b/meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch
new file mode 100644
index 000000000000..ddac322e9135
--- /dev/null
+++ b/meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch
@@ -0,0 +1,36 @@
+From ad0b0513a46c7d238d0fdabee0267c7084b75e84 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Thu, 11 Jan 2024 22:04:23 -0500
+Subject: [PATCH 1/3] BmapCopy.py: fix error message
+
+The wrong variable was being used when attempting to print out an informative
+message to the user. Leading to nonsense messages such as:
+
+	bmaptool: info: failed to enable I/O optimization, expect suboptimal speed (reason: cannot switch to the 1 I/O scheduler: 1 in use. None)
+
+Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/129]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ bmaptools/BmapCopy.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bmaptools/BmapCopy.py b/bmaptools/BmapCopy.py
+index 9de7ef434233..b1e8e0fcbdb7 100644
+--- a/bmaptools/BmapCopy.py
++++ b/bmaptools/BmapCopy.py
+@@ -892,9 +892,9 @@ class BmapBdevCopy(BmapCopy):
+                 _log.info(
+                     "failed to enable I/O optimization, expect "
+                     "suboptimal speed (reason: cannot switch to the "
+-                    f"{max_ratio_chg.temp_value} I/O scheduler: "
+-                    f"{max_ratio_chg.old_value or 'unknown scheduler'} in use. "
+-                    f"{max_ratio_chg.error})"
++                    f"'{scheduler_chg.temp_value}' I/O scheduler: "
++                    f"'{scheduler_chg.old_value or 'unknown scheduler'}' in use. "
++                    f"{scheduler_chg.error})"
+                 )
+             if max_ratio_chg.error or scheduler_chg.error:
+                 _log.info(
+-- 
+2.43.0.76.g1a87c842ece3
+
diff --git a/meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch b/meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
new file mode 100644
index 000000000000..ea2749a26432
--- /dev/null
+++ b/meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
@@ -0,0 +1,83 @@
+From 34f4321dfce28697f830639260076e60d765698b Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Fri, 12 Jan 2024 01:16:19 -0500
+Subject: [PATCH 2/3] CLI.py: fix block device udev race condition
+
+We are encouraged to add a udev rule to change a block device's
+bdi/max_ratio to '1' and queue/scheduler to 'none', which I did.
+So I was surprised when, about 50% of the time, I kept seeing:
+
+	...
+	bmaptool: info: failed to enable I/O optimization, expect suboptimal speed (reason: cannot switch to the 'none' I/O scheduler: 'bfq' in use. [Errno 13] Permission denied: '/sys/dev/block/8:160/queue/scheduler')
+	bmaptool: info: You may want to set these I/O optimizations through a udev rule like this:
+	...
+
+The strange part is that sometimes it doesn't report a problem and
+sometimes it does, even if the block device is left plugged in continuously
+between multiple bmaptool invocations.
+
+In all of my tests the bdi/max_ratio is always okay, but the
+queue/scheduler would sometimes be reported as being the default scheduler,
+not the one the udev rule was setting (none). Yet no matter how many times
+I would read the file outside of bmaptool it always would be set to the
+correct scheduler.
+
+It turns out that opening a block device in "wb+" mode, which is what
+bmaptool is doing at one point, causes the block device to act as though
+it was just inserted, giving it the default settings, then causing udev to
+trigger to switch it to the requested settings. However, if udev doesn't
+finish before bmaptool reads the scheduler value there's a chance it will
+read the pre-udev value, not the post-udev value, even though the block
+device was never physically removed and re-inserted.
+
+bmaptool was opening every file, then checking for block devices and
+if found, closing then re-opening the block devices via a special
+block-opening helper function. This patch re-organizes the code to only
+open block devices once using the special block-opening helper function
+that does not open block devices in "wb+" mode.
+
+Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/130]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ bmaptools/CLI.py | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/bmaptools/CLI.py b/bmaptools/CLI.py
+index 82303b7bc398..0a263f05cf43 100644
+--- a/bmaptools/CLI.py
++++ b/bmaptools/CLI.py
+@@ -38,6 +38,7 @@ import tempfile
+ import traceback
+ import shutil
+ import io
++import pathlib
+ from bmaptools import BmapCreate, BmapCopy, BmapHelpers, TransRead
+ 
+ VERSION = "3.7"
+@@ -440,17 +441,16 @@ def open_files(args):
+     # Try to open the destination file. If it does not exist, a new regular
+     # file will be created. If it exists and it is a regular file - it'll be
+     # truncated. If this is a block device, it'll just be opened.
++    dest_is_blkdev = False
+     try:
+-        dest_obj = open(args.dest, "wb+")
++        if pathlib.Path(args.dest).is_block_device():
++            dest_is_blkdev = True
++            dest_obj = open_block_device(args.dest)
++        else:
++            dest_obj = open(args.dest, "wb+")
+     except IOError as err:
+         error_out("cannot open destination file '%s':\n%s", args.dest, err)
+ 
+-    # Check whether the destination file is a block device
+-    dest_is_blkdev = stat.S_ISBLK(os.fstat(dest_obj.fileno()).st_mode)
+-    if dest_is_blkdev:
+-        dest_obj.close()
+-        dest_obj = open_block_device(args.dest)
+-
+     return (image_obj, dest_obj, bmap_obj, bmap_path, image_obj.size, dest_is_blkdev)
+ 
+ 
+-- 
+2.43.0.76.g1a87c842ece3
+
diff --git a/meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch b/meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
new file mode 100644
index 000000000000..2794eeada394
--- /dev/null
+++ b/meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
@@ -0,0 +1,43 @@
+From 2a71e0c1a675e4f30f02c03dd0325944b393c434 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Fri, 12 Jan 2024 01:54:26 -0500
+Subject: [PATCH 3/3] BmapCopy.py: tweak suggested udev rule
+
+Both bdi/max_ratio and queue/scheduler are only valid for whole block devices,
+not individual partitions. Therefore, add a
+
+	ENV{DEVTYPE}!="partition",
+
+to the suggested udev rule so that bmaptool doesn't try to check every
+partition of the block device, just the whole device.
+
+Otherwise the following will appear in the logs:
+
+	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/bdi/min_ratio}, ignoring: No such file or directory
+	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/bdi/max_ratio}, ignoring: No such file or directory
+	Jan 10 01:30:31 localhost (udev-worker)[10399]: sdk1: /etc/udev/rules.d/60-bmaptool-optimizations.rules:5 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1.2/2-3.1.2:1.0/host14/target14:0:0/14:0:0:0/block/sdk/sdk1/queue/scheduler}, ignoring: No such file or directory
+	[... and so on for every partition on your block device ...]
+
+Upstream-Status: Submitted [https://github.com/intel/bmap-tools/pull/131]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ bmaptools/BmapCopy.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bmaptools/BmapCopy.py b/bmaptools/BmapCopy.py
+index b1e8e0fcbdb7..a4c1177246a9 100644
+--- a/bmaptools/BmapCopy.py
++++ b/bmaptools/BmapCopy.py
+@@ -906,7 +906,8 @@ class BmapBdevCopy(BmapCopy):
+                     "\n"
+                     'ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="xxxx", '
+                     'ATTRS{idProduct}=="xxxx", TAG+="uaccess"\n'
+-                    'SUBSYSTEMS=="usb", ATTRS{idVendor}=="xxxx", '
++                    'SUBSYSTEMS=="usb", ENV{DEVTYPE}!="partition", '
++                    'ATTRS{idVendor}=="xxxx", '
+                     'ATTRS{idProduct}=="xxxx", ATTR{bdi/min_ratio}="0", '
+                     'ATTR{bdi/max_ratio}="1", ATTR{queue/scheduler}="none"\n'
+                     "\n"
+-- 
+2.43.0.76.g1a87c842ece3
+
-- 
2.43.0.76.g1a87c842ece3


