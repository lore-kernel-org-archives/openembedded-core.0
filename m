Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C88D37E5D
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:46 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13329.1768405716409332866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Tbs5mbKy;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8773fcff60so4592666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405715; x=1769010515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT03Olx6mkX495cdefv+gWSXW/Urln8BKw81JYENDH4=;
        b=Tbs5mbKyL2Bju7BxMh2ISKMlAqVKtv9QrJcDkwYODlxouozx7nAQrTuBUbeGFUrU+Z
         SJzxny7+dEY4fGNyFnOIxj6SYkP5ovpKQeGV6k5RSipi7UQLraFrsj1UzDafo6J0DC4G
         hYoMm9KGxaijY9MEr5vOVC9SgTPCb1z/5IqUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405715; x=1769010515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lT03Olx6mkX495cdefv+gWSXW/Urln8BKw81JYENDH4=;
        b=UaWubXutildtoeIh/n1tlo+7J+Qmc1MljiqqnyqmLqYjEwyA/dQ9ZOyNdcn2cYmg9X
         1n7x6WqpqUzIk6JkRTSGbIsdIwVVCrVyBKLs7kv6mcEmC9TORAnnLLJtls0p1Z8IGti5
         WPLBJJ0FGA7UG23/XCtKgAnDPUHzP+Sk0bqWg13M0EaaNgQtH3k8XVLU6ASQMGEheFa6
         ZjthjW9w0pgmzyalbCkv91c5yiSXBFeqz07guR1ze/ONqgXeb8D0A9/WXs2GAOg57am4
         j2hF/1A1javoqhugsuE8RTvQBgvb3P8b59mumAnn0cJ5TpU0mS4ijUvtXD6ct5k7qMVZ
         dF4g==
X-Gm-Message-State: AOJu0YxqmRdEZkWFkRRn+rYkAdJ3/lfcDedb2+zrmzWM01rQkU0P9Dw2
	7e3xBSBIstiKho7xCV4dTiBccQzbRP3+I8IwaN5YhKSMi5f/DxvxQDVIW3L/Pi8K71xr5Udgq9p
	oUw+9fEM=
X-Gm-Gg: AY/fxX6b6Wlpxdv5hEkR4VlSEfZ/WHSkGF/UNcAbrBDy6TBhe7PzrqcX1Pg9t40L7rT
	iIqTnTMxOp8Oxtm3RenYKH1iqh6rD6gZ21fmyfTzXX4X3I1lv9xP4SSWBXirG1FervOg7ja3laf
	vhf8ndZJOR/7h184WrtWFKyNrYhaF0ZTt/423okXCLFPWjT7YitmlCke0fSR1DUaZCxYoDUtscE
	Z14S2bs4EiXbbfvzb6xUfAEvom7iqWw724UAa6AuLIp6XhVvQQjo0MYa/LJ5d5nBVO1e6xIRoh+
	eujaN4jEgmIAEtYaN429SsPjWOg80oOhY5Hc/9XRHsWmepdFjJ+Nkf6pofZ6V976ktTu5MOT2MQ
	dcnGktZ3yEdye/ZOoiASmNHNdUzwzHnXt9AzYEjFzmdEW7BUwoY7SE6CoBvSAzi4AIYhWRLEOGp
	bU/I0ZsK58bliLgRhVIjcA+rux+mak7YiEWhTB1czIsToG5Aht0IWLY4uerq2kzOVsFX093ZsFh
	HPxeS8Fm+msShugM52a0r1zKU6j3hnkwd1EADFjlluKp2tbzkvnae+dZwmSbTY=
X-Received: by 2002:a17:907:e98a:b0:b87:6a6:5fc2 with SMTP id a640c23a62f3a-b87612c8dc2mr138175466b.5.1768405714674;
        Wed, 14 Jan 2026 07:48:34 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 6/6] wic: extra-partitions: extend to support extra directories
Date: Wed, 14 Jan 2026 16:48:25 +0100
Message-ID: <20260114154825.4043483-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
References: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229343

Add the ability to define a space-delminated list of directories
to create on the extra partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Make the list space deliminated instead of semicolon deliminated.
          If the list is blank, print a warning instead of an info.

 meta/lib/oeqa/selftest/cases/wic.py           | 11 ++++++
 .../lib/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++
 2 files changed, 49 insertions(+)

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
index 1963a27d78..5626aa336a 100644
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
+            logger.warning('No extra directories defined, %s unset for entry #%d' % (cls.image_extra_partition_dirs_var_name, part.lineno))
+            return
+
+        logger.info('Extra dirs: %s', extra_dirs)
+        for src_entry in tuple(extra_dirs.strip().split(' ')):
+            if ' ' in src_entry:
+                dst_entries = src_entry.split(' ')
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


