Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE153C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:25:56 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.4251.1642112755303323891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=SBjajPCn;
 spf=pass (domain: foundries.io, ip: 209.85.167.67,
 mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f67.google.com with SMTP id o15so24426912lfo.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOQ2fyaYEEtWJFQh9Nvpzbu8ik+l/nA/DXmvJwSlJ38=;
        b=SBjajPCnbp3j01W4X5LEUQoBzMIz/4x2I1wlYLKua+k6VqqJeJ8ny7iWMOTY7KdlsQ
         PSyf68mWe6BOgUpTxCvOIOHTb8ckI/YEKWHnFnhDR7Sca8EEF8z+P22dSKggOfoikDS+
         ITYxH6v8k/dewc0E7w1xEfxb+yWXYz/wp22ZlDo9n4MhB8pm/qCRbbwt3zC3ohPrChdi
         zmy4zbbb05ogrS2RD9JRSlhJ4Ein6V/qvLf8n6EGcIv8jyPUgUpEPocP6p8+6VH7PxWL
         Ryc85Q/dbSdciAOP7JLoQs8MoHOVAKViWknquUOpfAT3eZokldJiAjNN8LUf83X1Grjl
         VU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOQ2fyaYEEtWJFQh9Nvpzbu8ik+l/nA/DXmvJwSlJ38=;
        b=xSnE6W8Hv0KsEfBjpN3u8lDG0V0vQt/aM1gGQM4drwMav0vd3k3Tp/MumA1vBA0g2W
         ofUx0fq1taF3gGa5jDXJFlZpGOiXq4xtcR34ASJfan4kNj0zYnVVdEbdAneD4ZYAn+dd
         7E1/cgZm3iWSISydy+OdskipQeJ5gATTYHGw24cpvfvRAXGskVS9OHChJf2OcgHAshx/
         KZYeRInsrmHfU7ZoGUsVvmQzkzOvGI5Yw3pzVah6Fbg30G0ei4ThU7mcZOEsDZAsvBll
         4B5bdW0M3QhvQi7BM4GOfwWooMb2sYGrnSPNuFU+44CHI3h8HFdJgXgyVkMXnUhL5m75
         JDLw==
X-Gm-Message-State: AOAM533VL3tT6pLAVsLGwUA8lhyxbFDUvnV3GEQzPwmqhi692E+8aleT
	1DFMXM2qLCH/zFXSpwtvaR423YG3qVUAnCZc
X-Google-Smtp-Source: 
 ABdhPJwmd5aUs9FoG5nJcTb3FAAMQ8fRYv/C/443QYpUOzow1sNy6As68PjA90WPY51Pr8rqNIHPTg==
X-Received: by 2002:a2e:b90f:: with SMTP id b15mr4777873ljb.129.1642112753224;
        Thu, 13 Jan 2022 14:25:53 -0800 (PST)
Received: from localhost ([109.108.76.111])
        by smtp.gmail.com with ESMTPSA id
 b6sm402361lfp.255.2022.01.13.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 14:25:52 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: mike@foundries.io,
	ricardo@foundries.io,
	tim.anderson@foundries.io,
	JPEWhacker@gmail.com
Subject: [PATCH 1/1] wic: support 512 byte size granularity
Date: Fri, 14 Jan 2022 00:25:51 +0200
Message-Id: <20220113222552.2811705-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160538

Since 938595d1dc("wic: Add 512 Byte alignment to --offset") wic
parser supports "s"/"S" suffixes, that can be used to align partition
on 512 byte boundary. Nevertheless, the minimum value of size is still
1Kb.

Introduce support for "s"/"S" suffixes for --size/--fixes-size.
This is required for some SoCs (like i.MX8M/MM, where SIT image is
stored on 0x8200, and actual boot image is at 0x8400).

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 11 +++++++++++
 scripts/lib/wic/ksparser.py              | 19 +++++++------------
 scripts/lib/wic/plugins/imager/direct.py |  6 +++---
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 5fc8e65142..bd2b941f65 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1011,6 +1011,17 @@ class Wic2(WicTestCase):
                 "1:0.50kiB:102400kiB:102400kiB:ext4::;",
                 ])
 
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that a partition size can be provided in segments (512 bytes) using "s" prefix
+            tempf.write("bootloader --ptable msdos\n" \
+                        "part /    --source rootfs --ondisk hda --offset 1s --fixed-size 10000s --fstype=fat16\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:0.50kiB:5000kiB:5000kiB:fat16::;",
+                ])
+
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that image creation fails if the partitions would overlap
             tempf.write("bootloader --ptable gpt\n" \
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0df9eb0d05..97e3e40825 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -51,7 +51,7 @@ class KickStartParser(ArgumentParser):
     def error(self, message):
         raise ArgumentError(None, message)
 
-def sizetype(default, size_in_bytes=False):
+def sizetype(default):
     def f(arg):
         """
         Custom type for ArgumentParser
@@ -68,19 +68,14 @@ def sizetype(default, size_in_bytes=False):
                 raise ArgumentTypeError("Invalid size: %r" % arg)
 
 
-        if size_in_bytes:
-            if suffix == 's' or suffix == 'S':
-                return size * 512
-            mult = 1024
-        else:
-            mult = 1
-
+        if suffix == 's' or suffix == 'S':
+            return size * 512
         if suffix == "k" or suffix == "K":
-            return size * mult
+            return size * 1024
         if suffix == "M":
-            return size * mult * 1024
+            return size * (1024 ** 2)
         if suffix == "G":
-            return size * mult * 1024 * 1024
+            return size * (1024 ** 3)
 
         raise ArgumentTypeError("Invalid size: %r" % arg)
     return f
@@ -149,7 +144,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
-        part.add_argument('--offset', type=sizetype("K", True))
+        part.add_argument('--offset', type=sizetype("K"))
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 35fff7c102..66f7e1d2aa 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -363,7 +363,7 @@ class PartitionedImage():
                          imager.updated_fstab_path)
 
             # Converting kB to sectors for parted
-            part.size_sec = part.disk_size * 1024 // self.sector_size
+            part.size_sec = part.disk_size // self.sector_size
 
     def layout_partitions(self):
         """ Layout the partitions, meaning calculate the position of every
@@ -422,12 +422,12 @@ class PartitionedImage():
                 # gaps we could enlargea the previous partition?
 
                 # Calc how much the alignment is off.
-                align_sectors = self.offset % (part.align * 1024 // self.sector_size)
+                align_sectors = self.offset % (part.align // self.sector_size)
 
                 if align_sectors:
                     # If partition is not aligned as required, we need
                     # to move forward to the next alignment point
-                    align_sectors = (part.align * 1024 // self.sector_size) - align_sectors
+                    align_sectors = (part.align // self.sector_size) - align_sectors
 
                     logger.debug("Realignment for %s%s with %s sectors, original"
                                  " offset %s, target alignment is %sK.",
-- 
2.30.2


