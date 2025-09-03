Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1737BCA1011
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 14:45:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14464.1756910734468841008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 07:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lo+TMrCT;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso191435e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756910733; x=1757515533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZGny7P0iTDKi23sGAWKk6Sy92mUCg7mJ78ynyxVc5A=;
        b=Lo+TMrCTEm5Ey5DD3/9vLOpVkcy0+nFd6YzsSDziChXNlp7AqRjaNNszF4osJkoQP/
         JkKGxY6P3bnuc9a6vOV72l8g6iqcYPG+rZAf3tJJ3A+cUsflSVoOBnC0VCffQcR/HGzl
         TZhSALyWe2VfQhTbyyklgateUiCyKRkFgCCKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756910733; x=1757515533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZGny7P0iTDKi23sGAWKk6Sy92mUCg7mJ78ynyxVc5A=;
        b=H6WAIx4MNe2Eu+vpN/dIbpbAZkLwQo/ARgRF1YX3y0Q4Qj8wPGrWf66gqNnQUnerwM
         /MpUMJWjHDB5IB3Bp/seiGNA+IGvTolWnH471hwougxo6HuG92wwDe561k0Z24mXMmt1
         3AP8REFirxMNCEra48g3/cfzewTmu1VzJQq4jlWuhqDwKJMmBKLvxpK5/hT1MoHQBIOy
         u4l4zC8aAg+5Hp8URSGqFfMLiaNTT3prHBjbkUBBw8mFBZC4eZ5lDvjjJfZ+PPCmphwF
         RVqWYhZhU9simRc35eiwMbwrkPRKdsTkMvfqrDqfqv7kmyhS7TKsGMTSSSxTlTtFQqPN
         QeRA==
X-Gm-Message-State: AOJu0YwCCTCF1mb54kfjmIfXRn5/d/1lqW5O3wCZsuZIRRwNIK2Hldtj
	3jgtPfwCSCFnjvLR+XbvLlBDSNaJTpXQbA0fXKK7gKXD0ccqALLv6WKDZl+KszFLP4FDy3k14aL
	sm8l/yK8=
X-Gm-Gg: ASbGncvlXM4tI4N3s4i2xFiepIlScfH+oDqoD71djjRDntfPtr5tMVHUB7RoHl5F5ew
	FsP4FZrdnB1SzvZ+NZRiCWnwu/NJ6yVd9XQy9wYeAOVI22wmpv03hC4WsNcD9+E817kwnRH859Y
	Nobpp8dSjhLGvfRcLD3DhdBfLDp7YjAuDK/FDlkL/q/LuTpXVP8487a1Xw+LRKcWvQbFgb7eQ4s
	axBfCgLmvkGE0L7Hnth8d2Xmrb5zsdEwTUr+rxjBc8NibAivwKi6re2up1y6D/H0r36M6xoinrM
	A4VrfOjvHAxGx3AoGOrEtdySfFZoXWmFgEHMVpGHTdKDsSytSToWPd/q2EhbcP4gCoT2RYiUSor
	sbREu2dZvyBXoIawtgPjkVFnkE/b1jkbg6srDquLV/9//uJfdS81CSA==
X-Google-Smtp-Source: AGHT+IFPNkSR1UnCw8L/Smp2dEwMF7hBzkShxs4J0W55+s+IxHQSM5Lx7/2jEVc/WHWCtVMLDR/ovg==
X-Received: by 2002:a05:600c:35c8:b0:45b:8939:8b1c with SMTP id 5b1f17b1804b1-45b89398f5emr103686095e9.27.1756910732689;
        Wed, 03 Sep 2025 07:45:32 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf3458a67esm23943611f8f.62.2025.09.03.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:45:32 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v5 2/2] wic: rename wks flag --extra-space to --extra-filesystem-space
Date: Wed,  3 Sep 2025 16:45:28 +0200
Message-Id: <20250903144528.2248743-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
References: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 14:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222864

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

changes in v5:
- fix extra_filesystem_space check
---
 meta/lib/oeqa/selftest/cases/wic.py |  4 ++--
 scripts/lib/wic/help.py             | 12 ++++++------
 scripts/lib/wic/ksparser.py         | 25 +++++++++++++------------
 scripts/lib/wic/partition.py        |  6 +++---
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c244c9f188..b1c318bd4e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1311,12 +1311,12 @@ run_wic_cmd() {
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
index a1aaf1b4b3..705f989750 100644
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
                             if not parsed.overhead_factor:
                                 parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
-                            if not parsed.extra_space:
-                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
+                            if not parsed.extra_filesystem_space:
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


