Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15528CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:59:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.72008.1756799964102055200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l0bDYEm4;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3d3fa21a77fso1351099f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756799962; x=1757404762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4y9gIpSEpuIfA7Vw8RJHfN/mrIHz0IHKW2Guz34BMQ=;
        b=l0bDYEm4JGl/+R9eRUJOPp+JQ120slLDvbrOvvjwIrnpuV1ZrNQKpLBskg4j49zoiv
         bCt8YhgjTHwE9SI4Q9ZyZnboFoiUjK2ojY/gIT0cv4xooziJUStyVwKb225YR57+dDJs
         7XL6LM40FDnoPbJTYpdgRUNb30t0PyWQ2yVCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799962; x=1757404762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4y9gIpSEpuIfA7Vw8RJHfN/mrIHz0IHKW2Guz34BMQ=;
        b=s9NARpBGBAeic68XQ8z85AbfTY6aa83a1b4rDA1ShAVp92RoWvyAyq4c/GonusKdHn
         ZfpDNs4eH07kw3E3SZiE3rl9cUrVCxMGr1822u06vzOK5oz6xS51mlrV5RihWEW5cxtp
         e6hoZB9pRnky8QmONl3a0bsp3UFYbcacq1Yv7y/p5yui7E2X4rdq0zA3j9YL4clbzkJD
         rIiggBjzraxrXSDPRcyufWCxGgixPRGrq71lEQGAY1VpzcFNBZRNwOFT8bG1nGihH/xc
         0xTHih5aJWD03X7jK/qwSDY/l3xVQzz39UBB/ABT+txAw4LLYauLqV+fGdKOzRMea0KX
         CwpQ==
X-Gm-Message-State: AOJu0YxTjmyC9M0PO7aZFito+3lqTDDNkJaQTsLfJ3vcYIkjZDjjtBOc
	yv9Qp5ade7k9Hd6mS+ULNg2UsmK/B3XlyyGx45Dkt0Y+7pDdPh2TQiYQUOqlNYjeftut/K1jz+K
	8WK75HLM=
X-Gm-Gg: ASbGncsCsyoGawwGhrZDCfeyfdU3nFHZWRKIBz/k5zMEWLXneTN3SisT1mcegjiHqJY
	D+zAi3zt13XCYBj/oaXNyzVjbrW50nUY/CyFRkmNW17uKLiMTFGM9dAzPMFiGAlCq6TumM1lGvF
	2UcXDK07T6n6loRWHnYr/X8C6XWaoBWOb+PM+76J3JkOtncAtUd/jbF1zzbCPvGrzsOYiyMF/1D
	ssTU5nDSBANWKOlE5C8KhEVsWweX6g/Q1kYI0ovr0WpkBgrWcU1690FhOC8UUB0gcnyjH1KeSSO
	p94hpvpLN5Q0CEC4DercQRFmwlH7YzSFvZnu70HcEAgaqO7UFg1jfWOIpSCnupF1la2LDy0rTOE
	RktpTHc0J/8n/Jokk1c/58XKHTF2i373kNlP446XSi04=
X-Google-Smtp-Source: AGHT+IFfiGrbv0u6f1bWfEQvtPtiu9T7Yni8669Dj6IMBf5GRxE+DV8m19xvwBGsrI1meXXCawp5aw==
X-Received: by 2002:a05:6000:4013:b0:3c8:152d:a707 with SMTP id ffacd0b85a97d-3d1df34f78emr9130778f8f.53.1756799961364;
        Tue, 02 Sep 2025 00:59:21 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm12052f8f.1.2025.09.02.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:59:21 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v4 2/2] wic: rename wks flag --extra-space to --extra-filesystem-space
Date: Tue,  2 Sep 2025 09:59:01 +0200
Message-Id: <20250902075901.1550357-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr>
References: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 07:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222714

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Makes a clear distinction with --extra-partition-space flag.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

CC: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
changes in v3:
- adding this patch

changes in v4:
- no change
---
 meta/lib/oeqa/selftest/cases/wic.py |  4 ++--
 scripts/lib/wic/help.py             | 12 ++++++------
 scripts/lib/wic/ksparser.py         | 25 +++++++++++++------------
 scripts/lib/wic/partition.py        |  6 +++---
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c9c9ceb0f2..3f75411059 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1270,12 +1270,12 @@ run_wic_cmd() {
             p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
             self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
 
-    def test_extra_space(self):
+    def test_extra_filesystem_space(self):
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /     --source rootfs --ondisk hda --extra-space 200M --fstype=ext4\n")
+                        "part /     --source rootfs --ondisk hda --extra-filesystem-space 200M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 800c0abf0f..6b49a67de9 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1013,12 +1013,12 @@ DESCRIPTION
          --no-fstab-update: This option is specific to wic. It does not update the
                             '/etc/fstab' stock file for the given partition.
 
-         --extra-space: This option is specific to wic. It adds extra
-                        space after the space filled by the content
-                        of the partition. The final size can go
-                        beyond the size specified by --size.
-                        By default, 10MB. This option cannot be used
-                        with --fixed-size option.
+         --extra-filesystem-space: This option is specific to wic. It adds extra
+                                   space after the space filled by the content
+                                   of the partition. The final size can go
+                                   beyond the size specified by --size.
+                                   By default, 10MB. This option cannot be used
+                                   with --fixed-size option.
 
          --extra-partition-space: This option is specific to wic. It adds extra
                                   empty space after the space filled by the
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e86e1069f5..dbf0cf2dc3 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -132,7 +132,7 @@ def systemidtype(arg):
 class KickStart():
     """Kickstart parser implementation."""
 
-    DEFAULT_EXTRA_SPACE = 10*1024
+    DEFAULT_EXTRA_FILESYSTEM_SPACE = 10*1024
     DEFAULT_OVERHEAD_FACTOR = 1.3
 
     def __init__(self, confpath):
@@ -153,7 +153,7 @@ class KickStart():
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
-        part.add_argument("--extra-space", type=sizetype("M"))
+        part.add_argument('--extra-filesystem-space', type=sizetype("M"))
         part.add_argument('--extra-partition-space', type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fspassno', dest='fspassno')
@@ -175,9 +175,9 @@ class KickStart():
         part.add_argument('--hidden', action='store_true')
 
         # --size and --fixed-size cannot be specified together; options
-        # ----extra-space and --overhead-factor should also raise a parser
-        # --error, but since nesting mutually exclusive groups does not work,
-        # ----extra-space/--overhead-factor are handled later
+        # ----extra-filesystem-space and --overhead-factor should also raise a
+        # parser error, but since nesting mutually exclusive groups does not work,
+        # ----extra-filesystem-space/--overhead-factor are handled later
         sizeexcl = part.add_mutually_exclusive_group()
         sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
         sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
@@ -264,12 +264,13 @@ class KickStart():
                             parsed.extra_partition_space = 0
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
-                        # value; --overhead-factor/--extra-space cannot be used
-                        # with --fixed-size, so at least detect when these were
-                        # passed with non-0 values ...
+                        # value; --overhead-factor/--extra-filesystem-space
+                        # cannot be used with --fixed-size, so at least detect
+                        # when these were passed with non-0 values ...
                         if parsed.fixed_size:
-                            if parsed.overhead_factor or parsed.extra_space:
-                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
+                            if parsed.overhead_factor or parsed.extra_filesystem_space:
+                                err = "%s:%d: arguments --overhead-factor and "\
+                                      "--extra-filesystem-space not "\
                                       "allowed with argument --fixed-size" \
                                       % (confpath, lineno)
                                 raise KickStartError(err)
@@ -280,8 +281,8 @@ class KickStart():
                             # with value equal to 0)
                             if '--overhead-factor' not in line_args:
                                 parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
-                            if '--extra-space' not in line_args:
-                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
+                            if '--extra-filesystem-space' not in line_args:
+                                parsed.extra_filesystem_space = self.DEFAULT_EXTRA_FILESYSTEM_SPACE
 
                         self.partnum += 1
                         self.partitions.append(Partition(parsed, self.partnum))
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d358aabbd6..0c9b1a5b96 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -28,7 +28,7 @@ class Partition():
         self.align = args.align
         self.disk = args.disk
         self.device = None
-        self.extra_space = args.extra_space
+        self.extra_filesystem_space = args.extra_filesystem_space
         self.extra_partition_space = args.extra_partition_space
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
@@ -104,8 +104,8 @@ class Partition():
                                (actual_rootfs_size, rootfs_size))
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-            if extra_blocks < self.extra_space:
-                extra_blocks = self.extra_space
+            if extra_blocks < self.extra_filesystem_space:
+                extra_blocks = self.extra_filesystem_space
 
             rootfs_size = actual_rootfs_size + extra_blocks
             rootfs_size = int(rootfs_size * self.overhead_factor)
-- 
2.34.1


