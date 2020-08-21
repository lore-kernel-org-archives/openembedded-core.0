Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.142138.1598039187038010018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VrhVRbWm;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e11so2365297ils.10
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeawTOTdj2HN7QrMTs4g/7tGjKyMAe/YVWpskL8eCrA=;
        b=VrhVRbWmGwePbmmuOUE1cDYu8i8G8UuwQM55G0lLQOH8IXVT6iEwbvyjnMFxHKJKj0
         0Znzf/tLaGIPOMKAmYgE9MTlgfixduYJbo9h6TXKee0k8GHukUSoSsGqXEgjg/f/vzoK
         omkpGpkysppHQ8ECheNW0tYr0PxxDXtDqDHLZ4G23UokuOkYRfXq5v9DhwMfnhtAgPa+
         h3MWKaGUhXk6ux66cJQPWfcmkjBgvBQr4wrdVtLjMHMqS3ILStEV+RBgTsCU0KJxKt+O
         3tPKsZQfjvlD92Q5IpWPvGHoptuqHoMkSgJHi3AUtfLjz1oILxalljQz2uxeciFqiusd
         SbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeawTOTdj2HN7QrMTs4g/7tGjKyMAe/YVWpskL8eCrA=;
        b=jvqaaJXArniUn98hol3YDPO9JYGvuh+13T/ksruLSEYAY6Zz5vhIxIUDGenh747+iR
         SmRwaeV/F+rQbg6j2Dme8XbKOqDdutRWleHYEhRaxeS7oo866TnWKcq1S1sU95qgxdk/
         UXnaTg0TMdyFUFXHIqKsENUu+6OBIfidY9OV7OlvIGcpjY3dC3/4KcEuIrHrlV9i1QT6
         L627huU7iWc5iTpEp9ZMkCNDpR9Rb2925K3Pu5TOGBWP6FylAoZLrV365hRZHsyI2eFS
         SDiE+kmh8Mx/+EDLxUJbMsPY2tY2TCKbDQZvE+/dafd51qSWe47/C0sHhNdN0VSeIUMC
         bVzQ==
X-Gm-Message-State: AOAM532oEfeSDjw18eFxQda1fUz5fOd0KByerrKDzY8Wh0fJZNRew6Nx
	nBYEw2Ez4neg2JcwHJ26XV5vkzSpxRk=
X-Google-Smtp-Source: ABdhPJyiZYL1DWsH8SKeh016nSWbrzKzq40wxOPVSvXpjVS0pU0ZMEVawKy3Xk0fEfUHW+7E+qMt8g==
X-Received: by 2002:a92:d403:: with SMTP id q3mr3542778ilm.158.1598039185874;
        Fri, 21 Aug 2020 12:46:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:751d:5957:ddd8:231])
        by smtp.gmail.com with ESMTPSA id h11sm1844112ioe.4.2020.08.21.12.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:46:25 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] wic: Add 512 Byte alignment to --offset
Date: Fri, 21 Aug 2020 14:46:23 -0500
Message-Id: <20200821194623.6388-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows the --offset argument to use the "s" or "S" suffix to specify
that it is reporting the number of 512 byte sectors.

This is required for some SoCs where the mask ROM looks for an item at a
sector that isn't aligned to a 1KB boundary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 24 ++++++++++++++++++++++++
 scripts/lib/wic/ksparser.py              | 20 ++++++++++++++------
 scripts/lib/wic/plugins/imager/direct.py |  8 ++++----
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8b58285c32..e6b23c6888 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -889,6 +889,30 @@ class Wic2(WicTestCase):
                 "2:103424kiB:205824kiB:102400kiB:ext4:primary:;",
                 ])
 
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that partitions can be placed on a 512 byte sector boundary
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 65s --fixed-size 99M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:32.5kiB:101408kiB:101376kiB:ext4:primary:;",
+                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                ])
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that a partition can be placed immediately after a MSDOS partition table
+            tempf.write("bootloader --ptable msdos\n" \
+                        "part /    --source rootfs --ondisk hda --offset 1s --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:0.50kiB:102400kiB:102400kiB:ext4::;",
+                ])
+
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that image creation fails if the partitions would overlap
             tempf.write("bootloader --ptable gpt\n" \
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 3453d9cb9d..913e3283dc 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -51,11 +51,11 @@ class KickStartParser(ArgumentParser):
     def error(self, message):
         raise ArgumentError(None, message)
 
-def sizetype(default):
+def sizetype(default, size_in_bytes=False):
     def f(arg):
         """
         Custom type for ArgumentParser
-        Converts size string in <num>[K|k|M|G] format into the integer value
+        Converts size string in <num>[S|s|K|k|M|G] format into the integer value
         """
         try:
             suffix = default
@@ -67,12 +67,20 @@ def sizetype(default):
             except ValueError:
                 raise ArgumentTypeError("Invalid size: %r" % arg)
 
+
+        if size_in_bytes:
+            if suffix == 's' or suffix == 'S':
+                return size * 512
+            mult = 1024
+        else:
+            mult = 1
+
         if suffix == "k" or suffix == "K":
-            return size
+            return size * mult
         if suffix == "M":
-            return size * 1024
+            return size * mult * 1024
         if suffix == "G":
-            return size * 1024 * 1024
+            return size * mult * 1024 * 1024
 
         raise ArgumentTypeError("Invalid size: %r" % arg)
     return f
@@ -141,7 +149,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
-        part.add_argument('--offset', type=sizetype("K"))
+        part.add_argument('--offset', type=sizetype("K", True))
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2f01999405..55db826e93 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -429,14 +429,14 @@ class PartitionedImage():
                     self.offset += align_sectors
 
             if part.offset is not None:
-                offset = (part.offset * 1024) // self.sector_size
+                offset = part.offset // self.sector_size
 
-                if offset * self.sector_size != part.offset * 1024:
-                    raise WicError("Could not place %s%s at offset %dK with sector size %d" % (part.disk, self.numpart, part.offset, self.sector_size))
+                if offset * self.sector_size != part.offset:
+                    raise WicError("Could not place %s%s at offset %d with sector size %d" % (part.disk, self.numpart, part.offset, self.sector_size))
 
                 delta = offset - self.offset
                 if delta < 0:
-                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, self.offset, delta))
+                    raise WicError("Could not place %s%s at offset %d: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, self.offset, delta))
 
                 logger.debug("Skipping %d sectors to place %s%s at offset %dK",
                              delta, part.disk, self.numpart, part.offset)
-- 
2.28.0

