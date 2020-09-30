Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6553.1601504147107699425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NmcBYvLL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id f18so2328459pfa.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=his2nw6KRpaNJtg9Z8IC7onpEfLBk/1GGARDk1+t2TQ=;
        b=NmcBYvLL0UuULBlNKdD2AP4BcM+PlJs4+XCAuk0+DbdGfeZQmCwGP1VVtI00pwj/b0
         JxyxngCk8f8nYEELE/lhe0CA43+Vh9XIcoes5Wf3CSwLiO1SZYfGfj8QSBf3WSWhQFzr
         wLqCX9KTsiGq5/Ta5no5MyAvyznwJ1oJcEQfk6iTWLm1W7nHlOyvx0tYRE7QIOLu75oD
         Taw/Te0K3qp63tXWiNjoSNmc1t5R4IdkAHHU8mhS/cIBb1P4uEIUWYROEOo2iGkLSCiQ
         33ZCeN0ARnKpfauUG5ofCHMgJqwryPX3c3FY85atC2gn49RwlHupCygmJpTDu84UJEri
         A7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=his2nw6KRpaNJtg9Z8IC7onpEfLBk/1GGARDk1+t2TQ=;
        b=jqyxfCTnzP5uOslo/vYsFY7tS8t7fe5tWVqF4ByNHF0FAEgw6gJawnyoqSfkT1AvBt
         ODXri3wDoRm25RtbcQQwqyMAwSYAjMYjGoIu7ux0l4t3yXlCsTmxug8+iGA+P3QodIEE
         mtVYDfX6wUyyvNJvl0Zt8ZSvdR6RUK28aIwldn8xoUglboqFnZCmRvcXae7/JAMpB1Rw
         xpdqKgayr4kzLB4xXll1leQw0CcInLpKAziLAhBTrTDeDrzr9Au7CFVrNv2QfrL8nFNx
         zMdW86vz05pcmK5j9D4vXwg3EIoxGX9UBgc/xfRVJfGuQFScyFfQW9wml3WBW36iktby
         sDwA==
X-Gm-Message-State: AOAM532H74Vh8H1ZtJZx5H/iJj2tsPp+UvD3ipYv7dLU68py3zy3MVej
	n/4yQj7QDWdZkkmpQM1em1DqXk2tdSgq7iU0DLo=
X-Google-Smtp-Source: ABdhPJzQRuVcw0qIOQJJ8SWXp4gN8j7XmqODYaqGlUgjIK5rKakF8L7v+G/0AvWfDPM1phePzcejrg==
X-Received: by 2002:aa7:8299:0:b029:142:2501:397a with SMTP id s25-20020aa782990000b02901422501397amr1437668pfm.63.1601504146075;
        Wed, 30 Sep 2020 15:15:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 41/41] wic: Add 512 Byte alignment to --offset
Date: Wed, 30 Sep 2020 12:11:43 -1000
Message-Id: <b9296bdeaacc1dce97aac9c9bf0d70555bb36646.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Allows the --offset argument to use the "s" or "S" suffix to specify
that it is reporting the number of 512 byte sectors.

This is required for some SoCs where the mask ROM looks for an item at a
sector that isn't aligned to a 1KB boundary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 938595d1dc4abaf5f7f3a7900add3f0492b805d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 24 ++++++++++++++++++++++++
 scripts/lib/wic/ksparser.py              | 20 ++++++++++++++------
 scripts/lib/wic/plugins/imager/direct.py |  8 ++++----
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index a166d3f614..13b6a0cc72 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -738,6 +738,30 @@ class Wic2(WicTestCase):
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
index ac6f427564..76cc55b848 100644
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
         part.add_argument('--include-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype("M"))
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
2.17.1

