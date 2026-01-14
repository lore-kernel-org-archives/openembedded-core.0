Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD2ED38FE7
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:56 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13889.1768407049843866678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=WeA1cKgu;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8719f5a2b5so31966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407048; x=1769011848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCrsSPCjpqSneu2kH27tPS7PxKgqwy8LRAPZxMnXR9U=;
        b=WeA1cKguRZDM/wriT2GBE7uwFYmvQGeuzsrqrZ8rOr88Pb4w86ClRArXxQzkx8Q3pz
         cJA9Tw6vZlU9P4LvBb4K9g6YBXc5Y41m35OEyieRu2Ro80m3Wp8A6j0DZKRCURMBfFWL
         WjO0oRD9bGrkunVH+j9TKT9eh2Ep4YVJZp/W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407048; x=1769011848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fCrsSPCjpqSneu2kH27tPS7PxKgqwy8LRAPZxMnXR9U=;
        b=Sge1Voh+YuRLZcrmxWYHkZJI6s0fiJYwQxKLCFMibuzHzqbbn55M4m3VncmGShcMcx
         /29oonz6D6mz6aNlCSxQTNtAJe7ZPZjDVNS6eFLkOZ6ojieox/Zs3ivgGKgIFtcsGJ0e
         X9WLcUtZcUIgPkxq30KxyAhRDK+gl38bpzWBja86A6jm4KKIlJwbqzDq6z5Tj7toY30L
         padO6BkOhhtU8tUE2aw1zJ5sLGRTdmJsHGqK35oFvC4JcTK9KXUa6d3zX/a11FFwfoK5
         BCVvE1OrLmE8kH7Ev9ZhCUBQWAYTCZSGP0fvhgwofw3tUxLzb+9nw4yqPKTH1pVwsf3h
         oC7Q==
X-Gm-Message-State: AOJu0YyrDeWZM4edg43lxgadj0hcDPAdkWZArUqFGa+j7/V+FDDIZJlZ
	20uDYvm29qos6d1McXIbrcSoNwTjrgJyWIK9RnhFbXorNY2DuPyq5b7KwktSbOMi7eTPPI+wJu9
	pdXFoPxM=
X-Gm-Gg: AY/fxX6Wc1WmQhrFLH5zxG+yt1lWzcJZWrNYs9/8DlNYx7NeosHFUSLNK/f2AFbBXF9
	WSOByE9A4I+BHvXpugqKmhoe0odQ5Frrhr6LSwOdFGEtLBWa4ULSZyCv0pWXGGa1q+rDWuTaLIC
	JFE8uwF2JOVy4uQp3ZbE0YP8wb68FDRuySHJw5vGkMqtRJ3qHRFoNbuMgpUTLYYpc9Plk6Rwf8n
	4yhTO06VSHoMUzcNkdJ20EKo29sn+EObo1nfYRCNyqQitXmH48NmUQL+dhgg9CkrYi/acKvb1yI
	9HKY/ecEWG9zJ9hYpR4S5e9l5n1xaUiPuXcQVxobqjNFQXt4f6tQrjuXOKQIZOluDv1PoNnXnLv
	smHiWij4zdj3ibX0BjzoHw7r3m9aTHEKis8IWio8kBzc+fVtAH+PENbcyni94sdxeKqKymCnAuD
	MVbSg2mG0Z+/dSAmsBH9b2wjbQfTMYZ9S1sNtYKrs3Z5mZWXAXk2yS8R42jgq+jW5B/skepUYF7
	r6QmZwgoAHw/+IUP+H9TaK1r/kZ9/zLkczdllh5WHRVxkCio7iaXxcpYpN19hk=
X-Received: by 2002:a17:907:6d17:b0:b76:2667:7736 with SMTP id a640c23a62f3a-b876140b914mr141598466b.4.1768407048145;
        Wed, 14 Jan 2026 08:10:48 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:47 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 6/6] wic: extra-partitions: extend to support extra directories
Date: Wed, 14 Jan 2026 17:10:40 +0100
Message-ID: <20260114161040.941159-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
References: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229352

Add the ability to define a space-delminated list of directories
to create on the extra partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Make the list space deliminated instead of semicolon deliminated.
          If the list is blank, print a warning instead of an info.

v2 -> v3: Remove uneeded logic in _parse_extra_directories

 meta/lib/oeqa/selftest/cases/wic.py           | 11 +++++++
 .../lib/wic/plugins/source/extra_partition.py | 31 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 33a6460677..3aab6a52b8 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_extra_partition_plugin(self):
         """Test extra partition plugin"""
         config = dedent("""\
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/test1 /test2/test3"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/test1 /test2/test3"
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
index 3fcf3971a8..21f8d9e09d 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -20,13 +20,19 @@ class ExtraPartitionPlugin(SourcePlugin):
     - File renaming.
     - Suffixes to specify the target partition (by label, UUID, or partname),
       enabling multiple extra partitions to coexist.
+    - Extra directories.
 
     For example:
 
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/foo /bar/baz"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/foo /bar/baz"
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
@@ -50,6 +57,23 @@ class ExtraPartitionPlugin(SourcePlugin):
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
+            logger.warning('No extra directories defined, %s unset for entry #%d' % (cls.image_extra_partition_dirs_var_name, part.lineno))
+            return
+
+        logger.info('Extra dirs: %s', extra_dirs)
+        for src_entry in extra_dirs.strip().split(' '):
+            cls.extra_dirs_task.append(src_entry)
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -113,6 +137,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        cls._parse_extra_directories(part)
         cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
@@ -131,6 +156,12 @@ class ExtraPartitionPlugin(SourcePlugin):
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


