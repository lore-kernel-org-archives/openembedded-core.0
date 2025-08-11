Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA70C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 13:49:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.48703.1754920149493693115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 06:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3+5ui2X4;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso2667341f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754920148; x=1755524948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPf6yBji9SZUubj4MOXa3W66sF6DczlpRSnmJk2aOwg=;
        b=3+5ui2X4i59jA/UapWEOn6JryvTybGKKUMDHqQic5edCLlWDzL0yy4vAvLs3N3Vwo5
         DNm4vjt8jJSkGFggifdWZ6Rg5mMrFaJ7evKf66w7eB98IN3X+UnrIpdMpowRgCoBA4BK
         28U99AgkD+dKykw7RdkHOa7xe7d78PA19yoWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920148; x=1755524948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPf6yBji9SZUubj4MOXa3W66sF6DczlpRSnmJk2aOwg=;
        b=t3W3AHQa0oSad3iAEMbB293bcnqoglJj8uDV2D5HAHPT5mmoPdxRxtUOJ+OK8CqH9Q
         F8h4vj9NFoU4h1LR0Kmn0ihfhtqzPdNnuPTIC1ZQOJ9hEILFqAP/zMtBJuqRQOlueCFy
         mJ9CV27ZV4wfJFzE3pPn4uzxFj7vNEkfU8cOrw80AwQe9PnHeKggBc3CWdAcvUEF7Am0
         218BwawCU8CUpZcF6g8cVdcxSRePuLE+8hZXQ+HTeyw6pTnOnkNsMBsPWwYJho3EUAU/
         MEpfGWJD/hzExXiFX8iSoDFiDNQu0883drYOlZiLYfX0XiP51MggABd3ge9rppUIYU62
         5I/w==
X-Gm-Message-State: AOJu0YyW+1DT2jnM2F10YKKIjg6o2s3pIl7YA8bqjT24SiVQAnk2rfqz
	VwLdIMuko32MYxJw7UL4TSW0KFAAbekZuiPnEgkhGzk1vm2fhd8+U/C9fW75d9gLsucYLrROqIm
	ag6yj06g=
X-Gm-Gg: ASbGncu0oWIG19rWpGMUIWWoeRXPPugUdNbiBr43MN1+L8Kqxwhb7GgYZbdHbHrWdUK
	usBR5WPmI/2wL1+CkoUl3rSh6pPoYot8szUVwMKP9oyPLpkpQDg6dZV7ZAlElzZf+95rwjA3ukX
	DothwmRWHioH1PjhPLFIyBu0343FN51Jp0gOy0Wab3W3oLHZ/Y2rNinMRiyqbFFutlr4BXuAudw
	iSqwISpkdZC/ob4Jd5zDGsRcdXCq5Qi2ALwTt1ffxvtk0A5idI2EkU88H19xX1pP7USFftsivy9
	1dnOxrZ6lHJca/MiZgDbD26amSl4KRnS+iDpeTyw3qvrjnE1DYskduuV/zi7k0QJPAraap8MKoy
	92eoCpBzDYw1D3PqLpj9eNWWJ15KQwkrfH2qfm0uEhk8=
X-Google-Smtp-Source: AGHT+IFkcu9wrcnL9LgPRHKe6AW7YRWfoldEkTje8u1yT6/GpZUwObkBSaVXBekcVlGojqZ6fmNihg==
X-Received: by 2002:a05:6000:402b:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3b900b7af4emr10069287f8f.40.1754920147765;
        Mon, 11 Aug 2025 06:49:07 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm30163276f8f.50.2025.08.11.06.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:49:07 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v3 2/2] wic: rename wks flag --extra-space to --extra-filesystem-space
Date: Mon, 11 Aug 2025 15:48:04 +0200
Message-Id: <20250811134804.841937-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
References: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 13:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221741

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Makes a clear distinction with --extra-partition-space flag.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

CC: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
changes in v3:
- adding this patch
---
 meta/lib/oeqa/selftest/cases/wic.py |  4 ++--
 scripts/lib/wic/help.py             | 12 ++++++------
 scripts/lib/wic/ksparser.py         | 25 +++++++++++++------------
 scripts/lib/wic/partition.py        |  6 +++---
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 09257f2624..643d6c7200 100644
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
index e71052fd15..7f95f710ff 100644
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
                                (actual_rootfs_size, rootfs_size, self.extra_partition_space))
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


