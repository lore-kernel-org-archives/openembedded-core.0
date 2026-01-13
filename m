Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3474ED2D115
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:33 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60299.1768315402854865666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=eBdA3roa;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-650854d9853so1613947a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315401; x=1768920201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGVM8ia48s6/nP8Bh3waDYobnyidEujwWsPuGyAoAPM=;
        b=eBdA3roaTaL6mJ6quxtwDH4Mv4xJ+NZs30agfr5gcS5zryoeoG6JBP4gRziB3i7oCG
         rUbSWWWElE3ivmS/sHkgwn1D6NJ4b0sy12LcUoUx7Ka1nCDVV9ULT9KI87eGbDfZ1KXJ
         rXChIxT9DjTr0LnqTy3jyiPiDSA2pMasTkDok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315401; x=1768920201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGVM8ia48s6/nP8Bh3waDYobnyidEujwWsPuGyAoAPM=;
        b=bsB+TUK1FB3cNxGdzYYj7XmSoDppbngHvQ6hfJP3rZ5Rer0rRH87PM1z7Nz9WdAqlu
         P2u9UOECGsQm3eHcW3rlMbxAsyBYOeXc3L6se2xeC4KWessbx4uwKSuHVSBdgSFl54EW
         jFX6G09Ct7mUkM155qPGijb130qV1Ri4hvu/LcFf86gKZyCl1wMNesOvEquVHGXDnnpa
         jIbbb5V4/3CUKfOvuPdnxgKhHucBzBkpND5h+yg+jG/OjnUGrSLgJCQvWmu6ZyQr+2Xs
         vLfrgQVwV63VXP6s/KuvTV4kTWbAUoeqYv37DDAF6eYWBOhhE5/FADW9mXs1bpAkQFbG
         ap8Q==
X-Gm-Message-State: AOJu0YystnvN3g5RX6IcDaQdwUelWjS+FJww1bo9/x6jUTyG8I5+tolt
	uYvyL24BSYwwCwK+wO+8UMK8CQSIZEbCUFWnzCLPbaeSJ2HDBxF54gIt1M0LIWQkwfRqKKYKHas
	k77duNoo=
X-Gm-Gg: AY/fxX6Fl1NUPJNgg6XvsQ6lA8UIKor7EnV1tj0PcRPvzKyPVYnrTVNYjyukc2rFcBj
	1cElzJGWximkq6XrU20WPjWCK/RU+FuUAmgxM//0dewEjj8UM4xN//d3K+W2HwrkfTbGXj9OuUp
	Dqok8ye2fPXNhct/64Ca6L2Vg8pTl2pk5/dEXivV8SSwowFgaBW0MofADSlxsVQ0Wu3UsosKo2W
	4ZHUVPINSIRdRU9YRXA5OhnVnqf/DayfHsVJyUGV5SJ0P4AsRl3ufkbQbuXPWJxPr0yVE+7frbn
	+/oBHwPwGYOMsmdjppe1VL7DA2XWyFE0nKQz6at+v/+CWWo+/LR5+IuywaX7GCv6AWkd40q65h9
	g37CtSNL9UrPE/G/p51knoJh72fpyHqtRqG3iciH8g+DrO5WonPr5TLmWD9lqJg/tJi11Yv/Gte
	OC/6IdLn0CQHTj8rDlZbH/94H3w9BZI5Dl8y2xrY4s1KOdvhk5vmVO3rQ0WNhVIkB4fjWxpBEZM
	Tb+MvG1sGIXyRd/piH/YCzymXRXOM5FY4m/QIaMPx8MzJMG7qpY
X-Google-Smtp-Source: AGHT+IEgYu6DPL9K+4v3niHo6063kFzr6DsRILVffT9Hs47ZE8kjrVMOXGLqYVvrT1VP5Mzavwam4A==
X-Received: by 2002:a05:6402:348a:b0:649:9fef:48e6 with SMTP id 4fb4d7f45d1cf-65097ec308fmr10825109a12.6.1768315401176;
        Tue, 13 Jan 2026 06:43:21 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 6/6] wic: extra-partitions: extend to support extra directories
Date: Tue, 13 Jan 2026 15:43:13 +0100
Message-ID: <20260113144314.3563680-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229272

Add the ability to define a semicolon-delminated list of directories
to create on the extra partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/lib/oeqa/selftest/cases/wic.py           | 11 ++++++
 .../lib/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 33a6460677..d365345554 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_extra_partition_plugin(self):
         """Test extra partition plugin"""
         config = dedent("""\
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/test1;/test2/test3"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/test1;/test2/test3"
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
         WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
             IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
         "
@@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                 result = runCmd("wic ls %s | wc -l" % wicimg)
                 self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
 
+                for part, extra_dir in enumerate(["test1", "test2"]):
+                    result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, extra_dir))
+                    self.assertEqual(0, result.status, msg="Directory '%s' not found in the partition #%d" % (extra_dir, part))
+
+                    result = runCmd("wic ls %s:%d/test2 | grep -q \"test3\"" % (wicimg, part + 1))
+                    self.assertEqual(0, result.status, msg="Directory test2/test3 not found in the partition #%d" % part)
+
                 for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
                     result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
                     self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 3abd2bfd4c..fee72df615 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -20,13 +20,19 @@ class ExtraPartitionPlugin(SourcePlugin):
     - File renaming.
     - Suffixes to specify the target partition (by label, UUID, or partname),
       enabling multiple extra partitions to coexist.
+    - Extra directories.
 
     For example:
 
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/foo;/bar/baz"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/foo;/bar/baz"
+
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
         WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
             IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
         "
@@ -35,6 +41,7 @@ class ExtraPartitionPlugin(SourcePlugin):
 
     name = 'extra_partition'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
+    image_extra_partition_dirs_var_name = 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
 
     @classmethod
     def _get_extra_vars(cls, part, var_name):
@@ -50,6 +57,30 @@ class ExtraPartitionPlugin(SourcePlugin):
                 break
         return extra_vars
 
+
+    @classmethod
+    def _parse_extra_directories(cls, part):
+        """
+        Parse the directories of which to copy.
+        """
+        cls.extra_dirs_task = []
+
+        extra_dirs = cls._get_extra_vars(part, cls.image_extra_partition_dirs_var_name)
+        if extra_dirs is None:
+            logger.debug('No extra directories defined, %s unset for entry #%d' % (cls.image_extra_partition_dirs_var_name, part.lineno))
+            return
+
+        logger.info('Extra dirs: %s', extra_dirs)
+        for src_entry in re.findall(r'[\w;\-./*]+', extra_dirs):
+            if ';' in src_entry:
+                dst_entries = src_entry.split(';')
+                if not dst_entries[0] or not dst_entries[1]:
+                    raise WicError('Malformed extra dir entry: %s' % src_entry)
+                for dst_entry in dst_entries:
+                    cls.extra_dirs_task.append(dst_entry)
+            else:
+                cls.extra_dirs_task.append(src_entry)
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -114,6 +145,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        cls._parse_extra_directories(part)
         cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
@@ -132,6 +164,12 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        if cls.extra_dirs_task:
+            for task in cls.extra_dirs_task:
+                mkdir_cmd = "mkdir -p %s/%s" % (extradir, task)
+                logger.debug(mkdir_cmd)
+                exec_cmd(mkdir_cmd)
+
         if cls.extra_files_task:
             for task in cls.extra_files_task:
                 src_path, dst_path = task
-- 
2.52.0


