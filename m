Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C38D37E5C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13361.1768405715846604380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=PByyYSzS;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.50, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b845e8326acso93597966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405714; x=1769010514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nURO7gkYhhX17UIXFhiK2Bi6Jmp+Hl1waoIN5DOt2M=;
        b=PByyYSzSqPEqzI9XP2dS/Nk68vKQyB14VOsmoj9I0L39rPbJOWLU9d7KClHpV6CSyO
         GYqJf9V06bjqfwUslpwXUGLFUJX/fBeT8J9fJ+m9zKl2po2ZuEXXE1KwamrEo1v+6Kyp
         DyrfEzrahpXZZ0dzI4uaZ1r2P7U6K636CK5S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405714; x=1769010514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nURO7gkYhhX17UIXFhiK2Bi6Jmp+Hl1waoIN5DOt2M=;
        b=bs6W2+YzKQvGs6YfxNbY1BfoMPcs8ZMYICmwubxjbo8LRQLcVEe2YbypkYKIZT4Ndi
         WQ9v13r1NmDO3zeC6cLhnR9xPnAJK7nsJg8mKOhc+F0dXksZXfrq4GA9ztXqyf+fTBBH
         PjYLXYluwf0jvKGxfcNiHiFKw5tMD50T+Amnnk81hWqDIky7g3VvleS3cfWHhM+XhrYZ
         Nm6oYA0H6e1pVyO3X03pOhz5+YMbwkzRW50959kexbwnCF3EoqT21J9SuwoXmDBGDQ/v
         1pCCO/N+W0QfiMI7EJcCua9LKg4mH2InK93n5rz3DHE9HiZ95vXE/wDZVQKT1+IwIbPn
         q3OQ==
X-Gm-Message-State: AOJu0YwOMjBbtC5uQfP5duOVmeGgTeQ0G+MEevQ/qJW6OKLS8ToOyq5Y
	idcEvikiPj+C6imhV7xC8GAyI8NHV17aU5AxG1CTnjDsoGAyKqSs+EV8AGCi3/jrtrBVwLe9Gg5
	2gVug
X-Gm-Gg: AY/fxX5o5qmS4LIFSbYide8MsACsCtcggmD6b8tD2as8ijbj42Q01EV39/eeckKVI9/
	Rha4oSyKVmJlECqcPSYcCpA+onmj1ywyAYSi8Rf4FB6o1uc/van+ZGoVCMkzNpOYF+ZzqoCX8so
	fPWg1Wd2Sx4PC8azdJfLNGiRZzejIgjrxd7J03NMgpgd1RwiZUKfdYYOpc24J1kxh/vTQD28arL
	WhyLHtlxdWXTwD1e4KVp7lltwThYKqhqank6cGxEDpGsC6x9ueajsc4AMQtSM9ACsqy0fZIbWXM
	orTjG7LUxFHbXESRCkE+7SNboy+5G8nI+MgmUR5L+YI8S7Fuj3AQ09gzqaoIlgkSGoc7pewEnMt
	jF+IxOmy8Vc7kulbX5NRMZeJ+Q3wibn4grVw4rTejJkSuT/UEts34e9Wm+JdezhmFRQOMo0ZwU2
	2TWnLZJen490OD5zjed8Ze3Oc41s7qUC1jnQGJCAYqwfMzEgnudaG7TxPRtStYy/SsbcPWS2u0t
	zLDwlZBi1vsjYS/f00o88g6O+W5h9v9dSRh7IFCe9iTFsixWVdh
X-Received: by 2002:a17:907:d8f:b0:b87:2476:5e23 with SMTP id a640c23a62f3a-b8760fe1010mr158381066b.1.1768405714043;
        Wed, 14 Jan 2026 07:48:34 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 5/6] wic: extra-partitions: Make extra-files optional
Date: Wed, 14 Jan 2026 16:48:24 +0100
Message-ID: <20260114154825.4043483-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
References: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229342

There are many use cases where a user may need a blank partition of a given
size and format with no extra files added. Such as an empty data partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: If the list is blank, print a warning instead of an info.

 meta/lib/oeqa/selftest/cases/wic.py           | 10 ++++++++++
 .../lib/wic/plugins/source/extra_partition.py | 20 ++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d7a9b14658..33a6460677 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1698,6 +1698,16 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
 
             self.remove_config(config)
 
+            # Test with a blank formatted partition of 5M with no extra files
+            with NamedTemporaryFile("w", suffix=".wks") as wks:
+                wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n'])
+                wks.flush()
+                _, wicimg = self._get_wic(wks.name)
+
+                cmd = "wic ls %s | wc -l" % wicimg
+                result = runCmd(cmd)
+                self.assertEqual('2', result.output, msg="Expect 1 partition, not %s" % result.output)
+
         finally:
             os.environ['PATH'] = oldpath
 
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index efe15a4d15..1963a27d78 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -55,11 +55,13 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         Parse the files of which to copy.
         """
+        cls.extra_files_task = []
         deploy_files = []
 
         extra_files = cls._get_extra_vars(part, cls.image_extra_partition_files_var_name)
         if extra_files is None:
-            raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
+            logger.warning('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
+            return
 
 
         logger.info('Extra files: %s', extra_files)
@@ -74,7 +76,6 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -131,13 +132,14 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.extra_files_task:
-            src_path, dst_path = task
-            logger.debug('Install %s as %s', src_path, dst_path)
-            install_cmd = "install -m 0644 -D %s %s" \
-                          % (os.path.join(kernel_dir, src_path),
-                             os.path.join(extradir, dst_path))
-            exec_cmd(install_cmd)
+        if cls.extra_files_task:
+            for task in cls.extra_files_task:
+                src_path, dst_path = task
+                logger.debug('Install %s as %s', src_path, dst_path)
+                install_cmd = "install -m 0644 -D %s %s" \
+                              % (os.path.join(kernel_dir, src_path),
+                                 os.path.join(extradir, dst_path))
+                exec_cmd(install_cmd)
 
         logger.debug('Prepare extra partition using rootfs in %s', extradir)
         part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
-- 
2.52.0


