Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD74BD4115F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32416.1768472079875506180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=DaAkI9Df;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64d0da6019fso87072a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472078; x=1769076878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayCW3fi/Ht9Rf6CFlDAqN9uPwO2sghnJiPGCCvGi5j4=;
        b=DaAkI9DfIm/Vt7bHIkJ/Qac8nSkB+pRcL1zPA7ofF4CIXZYk75F2tfPd3OF1+2QEni
         1EcCndgSUHxZ+/Y6esW/Vz9HKtGMkrhzX7GIJXVlC1CiV3Ph6CCcpZd14OEzw4o1Iz8M
         pCNkS1aLbvOQtRYmyxRNmJrDlLFRVl65PJFgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472078; x=1769076878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayCW3fi/Ht9Rf6CFlDAqN9uPwO2sghnJiPGCCvGi5j4=;
        b=PF3crWayxH/wnQggQ6BcMc1F9DHSv71wlY3rul68qQP/J4iEIk3Vj3KeGYeEKlJa6H
         g5q1nW/9hy0y0hBjEmOE0LRlxRDngwP+a/oaY6q3M3ilSclUkRnI5x31hNSlPG59Y5ZU
         aumB9EzQ0FxOmFsStz+oFhjeN6U4uuvPsvRBdwyOOxtoneI2ZyeowMeMDLYv8XueGgFN
         fyNK8ENDSpTJ0oTzAMefc96MNmVetsPCcvVzUMUtQuCn0+3kOn7uBXmBBQIfkPcBvyvq
         XPqGPQARneUnAnsFpiDnVYCsrWxx189dI46AW7JDSamHDzd0cGuK9+oD1XAtNk5p5RBq
         i7LA==
X-Gm-Message-State: AOJu0YwvESs7CxsFYKeqPzoKQX/aAKwebWnQIh41ThWv30IIujNPyTRe
	v+pMbCDq4P0g3JJSrwUkX7bWFtornWURJAiVrhzikvVsthTbDYBj91rBmfNdD8m83SqONTai3o8
	Nrkau
X-Gm-Gg: AY/fxX7+HrWEmIOhcENrOCxz9kdVa+bklsEbVYAvulD2AMAS349FwAClCKdioFFGVoa
	o3HBRtlLHc2jBdNMeYKOeVKlqkfzcwZs/G+Z29KKW2ectR9fDOA571a7zVwUfWgE6FkvoWUlLvr
	mDtWClQ4apVrTtf3LAPpNVdIPrMJk3PqHz+/eG1qH7FiCSWlsn1cuOSHDMqk6XiCaxDAKkBBXNu
	tba0f3hsi4KgyTIx1Y4M5VegKAa+GnZWr/wL5B83tbVKp592MI7S0/idbMGTnfq//3zOWT8EQvS
	gAswPF/kWM6IJnY+A5vt2t+//DfR2/O4GKRMqLML288T0aWXIgRlcqb0438rvpKzepcry3jc5bA
	IUzkb90ldJDizX3FLMftuHdcZfX3MXVuaRF6kpxY7YkshtCDKkJ9ZRRIHuQodtbGV1Jn/DZltU/
	sy7E5VTfFNQp+2bjWxc4NNouYAK6oaIVylpTtW3yN5k8Yip3+9AXlPusEv52KLH44iYk7t/XWB3
	TwFjcooqO92HtIT/sxZq7apHkxEO2OhOfaZCCloid/jDOGSuQo4JFbeAw==
X-Received: by 2002:a05:6402:3581:b0:649:9c37:5d5f with SMTP id 4fb4d7f45d1cf-653ec46b04amr2703051a12.5.1768472078209;
        Thu, 15 Jan 2026 02:14:38 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:37 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 5/6] wic: extra-partitions: move extra-files WicError to do_prepare_partition
Date: Thu, 15 Jan 2026 11:14:31 +0100
Message-ID: <20260115101432.162696-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229403

For organizational purposes, move the raised WicError if extra files isn't
provided by a user to the do_prepare_partition method and rewrite the message
to be more clear if a user wishes to create an empty partition.

The original error is changed to a warning in the event a user has a typo
in the variable. For example:

IMAGE_EXTRA_PARTITION_FILES_label-fooo = "bar.conf"
part --source extra-partition --fstype=ext4 --label foo

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: If the list is blank, print a warning instead of an info.
v2 -> v4: Raise an error in do_prepare_partition instead of making
          extra files optional. Extend error message.

 .../lib/wic/plugins/source/extra_partition.py | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 25aab06c52..62a7b4b1d3 100644
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
         for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
@@ -73,7 +75,6 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -125,18 +126,25 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
+        if not cls.extra_files_task:
+            raise WicError("Entry #%d does not have a corresponding %s variable set!"
+                           "If you wish to create an empty partition, remove "
+                           "--source extra-partition from the wks file"
+                           % (part.lineno, cls.image_extra_partition_dirs_var_name))
+
         if not kernel_dir:
             kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
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


