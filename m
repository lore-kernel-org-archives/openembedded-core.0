Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.9981.1628175791560470597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=WkQq+1fT;
 spf=pass (domain: qtec.com, ip: 209.85.208.45, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f45.google.com with SMTP id y12so8836761edo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRzDDYQSmk87NF0WpJ2Af8fxR/tS2aRWDY1AZpZlGcU=;
        b=WkQq+1fT+t0S3hJF/MjQeOOnwMKduTGrJVsL0KH3FiKi/9r4igi7JyJD4pzqAu7WaL
         Vek2KD6qc9gMy8No+QRIbHRntVHH2w+tn+KW6tc0kF066hO4yGGK1XoNpknkQyoYXh/h
         auI101/DhMbwPVabnMxrF7WfSWSonmqRCedxLZdMfnpQGgsfXuBNotmOQw2RP86pKy0U
         GLyPQsP6gI7gyOPE2eOdodBTZXKBH6x+p5cW6l+3TMgj22bGPZobTqE932EwLPqe6V3q
         6BrjrR4Q2vMFq27oGdl9o4npHXVr85xK96APSzTe4aSORh8Dstz2AM+Xil5VeFV+vk+g
         1M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRzDDYQSmk87NF0WpJ2Af8fxR/tS2aRWDY1AZpZlGcU=;
        b=dTfJnIl1aZrXQbDESLe0UXMYR9sR3V9jMvZkTrVScRL8KHgm988rbrpl2nZPJORraD
         qepxYpG3LD9bHkM9ET6/qKpXAdQbDCfi5Epen1Ea2rQlIvqo619OEhmry+L2cgibbZNo
         QiHcQT5gfV8rcFQN1X1jEZfMhq7TMflRlYeU9yVomIIZlvwTZ8JfCeemm+6HWYDKVcji
         idf4tUdUjM03G69n9wAb0IOSqc3jSzOueJvJar/UMtq8bfQpTAqHZJYbxwF3kBHpv9KM
         xLF7wmpl1lD2Dpkf1avYqh1EypJfX1OVZINXS3TA+wrxvXwMn4LnKa0JgkLBt3/zU9bI
         28Sg==
X-Gm-Message-State: AOAM530Wzh3B9n/yZ7FSN+Z2mQ7FZASBlpUjn2CTP2kMCgb5Ll8DGEuy
	r674Esnchpy1/k2vj1vgp0Gro9UklslhdZcOskdDestG7bOzXhy7NpIDtbmJ29MEdFj4CgXOnui
	kjRS+n0r6oCxpKvCoGbGQoXlsHA2oPvdi+r0sgGk9Eu0OErffddrzWtVt2TUSEhpreBF6ChSwDF
	yWYufJt31+zDKC/5IptQ==
X-Google-Smtp-Source: ABdhPJwo3CcVQzx7pBy3OfnxbcbBq/PZ554x+WmPtsz++bq/ToqmwkOmwCNt4P+7ITcSxfR025CieQ==
X-Received: by 2002:aa7:c246:: with SMTP id y6mr6953617edo.335.1628175789598;
        Thu, 05 Aug 2021 08:03:09 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id l9sm2431655edt.55.2021.08.05.08.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 08:03:09 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][RFC][PATCH][dunfell] wic: direct: Use stock fstab in partitions
Date: Thu,  5 Aug 2021 17:03:07 +0200
Message-Id: <20210805150307.56631-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Be able to get the stock fstab in partitions.

Functionality reverted at commit id:
ce682a73b7447652f898ce1d1d0416a456df5416

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

Hi,

I'm trying to get back the stock fstab file in a rootfs partition
image (wic plugin) and I'd like to know what you think about it.

Functionality was included before commit-id
ce682a73b7447652f898ce1d1d0416a456df5416 and removed afterwards. Would
it be possible to add it again? What would be needed to re-add it?

Thanks in advance,
Daniel

Here the relevant information:

wks definition:
part /boot/bootloader --source qbootimg-pcbios --active --align 1024 --use-uuid --fsoptions defaults,ro
part /export --source rootfs --rootfs-dir=hockeycam-image  --fstype=ext4 --label export --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M
part /media/rw --fstype=ext4 --label rwfs --align 1024 --use-uuid --size 200
part / --source rootfs --fstype=ext4 --label rootfs --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M

bootloader --timeout=1 --append="ro rootfstype=ext4 qtec_mem.size=64" --source qbootimg-pcbios

/export/etc/fstab before:
# stock fstab - you probably want to override this with a machine specific one

/dev/root            /                    auto       ro              1  0
proc                 /proc                proc       defaults              0  0
devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0

/dev/sdb /mnt auto defaults 0 0
UUID=D339-7B77  /boot/bootloader        vfat    defaults,ro     0       0
UUID=31f46be1-d9fb-4081-bd53-2c2727e7854b       /export ext4    defaults,ro     0       0
UUID=d8e8f5d4-897e-48cd-9188-33598363f706       /media/rw       ext4    defaults        0       0

/export/etc/fstab after:
# stock fstab - you probably want to override this with a machine specific one

/dev/root            /                    auto       ro              1  0
proc                 /proc                proc       defaults              0  0
devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0

10.100.10.100:/mnt/rw /media/rw   nfs        defaults   0 0


 scripts/lib/wic/plugins/imager/direct.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7e1c1c03ab..1bb9d38524 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -111,7 +111,15 @@ class DirectPlugin(ImagerPlugin):

         with open(fstab_path) as fstab:
             fstab_lines = fstab.readlines()
+            self.original_fstab = fstab_lines.copy()

+        if self._update_fstab(fstab_lines, self.parts):
+            with open(fstab_path, "w") as fstab:
+                fstab.writelines(fstab_lines)
+        else:
+            self.original_fstab = None
+
+    def _update_fstab(self, fstab_lines, parts):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
@@ -142,10 +150,7 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines.append(line)
             updated = True

-        if updated:
-            self.updated_fstab_path = os.path.join(self.workdir, "fstab")
-            with open(self.updated_fstab_path, "w") as f:
-                f.writelines(fstab_lines)
+        return updated

     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
@@ -274,6 +279,13 @@ class DirectPlugin(ImagerPlugin):
             if os.path.isfile(path):
                 shutil.move(path, os.path.join(self.outdir, fname))

+
+        # Restore original fstab
+        if self.original_fstab:
+            fstab_path = self.rootfs_dir.get("ROOTFS_DIR") + "/etc/fstab"
+            with open(fstab_path, "w") as fstab:
+                fstab.writelines(self.original_fstab)
+
         # remove work directory
         shutil.rmtree(self.workdir, ignore_errors=True)

--
2.30.2

