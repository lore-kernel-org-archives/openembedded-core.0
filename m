Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96F0D41164
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32365.1768472081548922783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=PgsYZ2DC;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b6f22bc77so84825a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472080; x=1769076880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNTCV7/dljVrxCqByE5lmxqCZA5C1/JZqT4yqBF81kg=;
        b=PgsYZ2DClyr8tvnxcPKTKaI7vhThSFE1mEkqU+ERmWxk4xLHUJmu0DteWL3Sv6oe02
         BXBogTKrPkbiiR+XpkH6qhXzss1B5mdSYGnG0AMeELUnOleFRur4O20s3Wdu2Upmgcvi
         UiOwQEpdmDKWNLKGQJy06wZuZjqdpOxpIxABQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472080; x=1769076880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNTCV7/dljVrxCqByE5lmxqCZA5C1/JZqT4yqBF81kg=;
        b=YRxfCoskKuGxIbyJ3e28pPCOOIy6+sLve8kwS6oUKxwq/vSTzRelB+jK/ZyoiekFF4
         8OXVBJ1VO40AjKkmw7Ua07eWZT+yVSKiw+BOb8a/riLmwJs30Is/r1oVMAztwVxy8hn6
         S1wGDBXoZ10MRGHpKp9UXDHptMoUPgjS7dA3nxA9Vrp8jT76Y4ddMsqpzVbQ51cLPMPS
         ol1N/K8BjXrNjHSMb6MxQ4isOe7u1/R7xudiB9K9ZEKTaXq+HM1zpgLtWTKmv0jHsylW
         cqbHmMcp3TmnqT6L5Avr6nZNCedleBVDG0kAkcxebZrNS4GrPLpmXcMGDKyW+LlJqaPn
         JhNA==
X-Gm-Message-State: AOJu0YyrJhP6H3oqwIqhVT+bYE9mOkbUF5y+IsiH0nWyJe6nXD0+ddaG
	6dy98dW7aPT7agYNIG4lxJ6S3Ivcv13/Sdv1K2m968XZ7D8MreoWAcx7VWMDw4yhiWoAqDQeAR3
	aVRwEsC8=
X-Gm-Gg: AY/fxX7y1TkWzTSBG8iFp8k2wVkBaET9v00CUvmmoUSOlm+ezqABXpA8L9efsRyk6Yg
	cMRF8T+xnDGlzys5YtGBe2UVhqW9cF5CGJkmesRa6ZNgX4DexLYKqOw6fmt9M3CDCt39x+BnIlc
	bCD2tSfU2Vy/Sz25jRmOABJbEVEeGj3uv4//KltRJcpjx9ZZvkJn9/llWIHAhWdPHejSloBuKe0
	E6B4n8UBx+95momTm3ldNa9lvYs1i1c6qRVQLDbmfdihE2mCH8tbBfG7hq4ubAMwewcBxJRGmK5
	Tol+ufqZFFuV7JVsXMah4Uw/V7BZ9BXsZkf1IM/URi8lFkofrkjxw5L76ezbFywl89TOVYI+ATg
	8kTmmL0srdyK78VTcFRK4AwP35CFcBXB2yvFWgwMGasjcHcQAa5FS4ufMWxkO+ItPGOz+VzTwes
	C/k8/MqGqePpCNe6P5wK2aKevyahzJb3qRyr+3x/05/yqTsUBJ7/+S0fclpWfSj2jWBAwCORy51
	10bFnvGfCsZWc+GZJdrPzqpO5kqIIfG3YR0Rs24YsATTo9e3L1GW9vgqw==
X-Received: by 2002:a05:6402:35d1:b0:64b:4e7a:bbc8 with SMTP id 4fb4d7f45d1cf-653ec461c8emr2515983a12.5.1768472079906;
        Thu, 15 Jan 2026 02:14:39 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 6/6] wic: extra-partitions: extend to support extra directories
Date: Thu, 15 Jan 2026 11:14:32 +0100
Message-ID: <20260115101432.162696-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229404

  - Add the ability to define a space-delminated list of directories
    to create on the extra partition.

  - Extend the fail condition to fail if both extra directories and
    extra files is not defined.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Make the list space deliminated instead of semicolon deliminated.
          If the list is blank, print a warning instead of an info.

v2 -> v3: Remove uneeded logic in _parse_extra_directories

v3 -> v4: Rework to error if extra directories and files are not set.

 meta/lib/oeqa/selftest/cases/wic.py           | 11 +++++
 .../lib/wic/plugins/source/extra_partition.py | 43 +++++++++++++++++--
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d7a9b14658..83072deaae 100644
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
index 62a7b4b1d3..185fcab585 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -13,20 +13,29 @@ logger = logging.getLogger('wic')
 class ExtraPartitionPlugin(SourcePlugin):
     """
     Populates an extra partition with files listed in the IMAGE_EXTRA_PARTITION_FILES
-    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE directory.
+    BitBake variable or directories listed in the IMAGE_EXTRA_PARTITION_DIRECTORIES Bitbake variable.
+
+    Directories are created automatically.
+    Files should be deployed to the DEPLOY_DIR_IMAGE directory.
 
     The plugin supports:
     - Glob pattern matching for file selection.
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
@@ -34,6 +43,7 @@ class ExtraPartitionPlugin(SourcePlugin):
     """
 
     name = 'extra_partition'
+    image_extra_partition_dirs_var_name = 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
     @classmethod
@@ -50,6 +60,23 @@ class ExtraPartitionPlugin(SourcePlugin):
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
@@ -113,6 +140,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        cls._parse_extra_directories(part)
         cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
@@ -126,17 +154,24 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
-        if not cls.extra_files_task:
-            raise WicError("Entry #%d does not have a corresponding %s variable set!"
+        if not cls.extra_dirs_task and not cls.extra_files_task:
+            raise WicError("Entry #%d does not have a corresponding %s or %s variable set!"
                            "If you wish to create an empty partition, remove "
                            "--source extra-partition from the wks file"
-                           % (part.lineno, cls.image_extra_partition_dirs_var_name))
+                           % (part.lineno, cls.image_extra_partition_dirs_var_name,
+                              cls.image_extra_partition_dirs_var_name))
 
         if not kernel_dir:
             kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
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


