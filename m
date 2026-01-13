Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246C1D2D111
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:23 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60298.1768315402115617215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=GYezXHnb;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b845e8326acso74616266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315400; x=1768920200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgulkzg2dmGwiyVMByZiKyc7y9PxnUJfD96yknQZKoQ=;
        b=GYezXHnbnDyeLtH69MHFQJ+xOI65B5VArg5cFZYzDotCC12drE6qKHxWaI6zvniX95
         lJfJs7uABOg7pqgYPejxz+RKkSNovma82VqhyWGRRQgr/aeaHKow+PQxYSOkI2d5qhwG
         kS5VMPoAwliAtcUSNFx6CYiCxUodsx8BDWmKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315400; x=1768920200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qgulkzg2dmGwiyVMByZiKyc7y9PxnUJfD96yknQZKoQ=;
        b=q6Y5+GyjN1eH1yIny0ZQ96SFsA0+POCVP3WUD0bDVAYZ2js2tvEM/QxoJZB4KAvzvA
         8Rw+7nRmW+9w6I0uX9SeOi11PDf17QhcYW3J8G8lWD+Wtj5gChqd5lQWYmPLsDFD0JN8
         9Fhx1eaEUA6loLB+HfE1NdwMfRMfglmhKeG6eJ5MXMRMvXcAyrj2XOVCS/l675JDK1h9
         EexTUzrwrMd9Fe2XSB9Rlyr16DQLpVE+BTtAC9yIcODhbLlLh5M66thAVuplaWh49Plg
         2zyddMDWilO21hgmCCEc7BY0Mt5P7ouBz87wcP4iQs+Lp9lhUyr4WmPG1Or0qejQ7ePq
         skRw==
X-Gm-Message-State: AOJu0YzLdETfPctjoT5AvSco/sLpV+xf8iNPOa8qks7btZIXvm/+9q/S
	SqcJahKsKnHVAjDp24NA1K8+nm/w+ogqMXaW23eh0tbZ82iVXMKDlJN+5nzQKN8UXNwkhgctqM8
	rlBd7
X-Gm-Gg: AY/fxX5Tdj8s9XoDGtoJ/8J8sS1JfSB1FdoL/QJH6cMvBMiLP1/rDGrOX2M/1b6hru3
	fLmYy9KDhZvk3YR7sl60BJSIkmdfRxpAsa9TATZ9TsjK8QOkCvoGa7867ECen5E6kGYh00d+o5m
	y8OIZz01XM7uzp5HQhusF4wRU6ybAko+OUhwE2+GCKWqbmA8KAW74gQCABXfg+pJo0Wd3BbuXNm
	5YcTLzEvQFQQL5qgLniH26RFaLTzSU4T1Z8kiwCd6s7eIxSKaoUVOKiZjXh9QQqBWaVqgbTu8UM
	7tt9XqXDlvnYe41v9pllTJLYy04sbLhNoGLCgD7mVvylQQRspCLWRyHW18Q9PsyXDiDp8oruzRe
	/JhaH2jwOHpvR1S0qmQamK8xOn2AYvOGZfbrIc9qlnX/BFA10Y+cT2fGMBzyCjgfXdj0Z2tm1Ar
	42Nn+OZcXrx1DmDybT6bzlec/dnWmoPyWdkFIYZDmOtxaWe6rNlcpbmOuZKAIOcFZonoow6viAz
	xaQ4gQ0r6nJ5ZUpAOpVX/Pe+oLAAaA55MePZ0hBquE2EA4osdRc
X-Google-Smtp-Source: AGHT+IG4+Jw3gxdFqb5dr1YRZG+4E3QDnC/V94PmrgtIlee0qn1FpBZ1kNBIhX1ZC2ueqgJh6eTGMQ==
X-Received: by 2002:a17:907:7b8e:b0:b87:2a56:9d6 with SMTP id a640c23a62f3a-b872a56235amr298059466b.2.1768315400473;
        Tue, 13 Jan 2026 06:43:20 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 5/6] wic: extra-partitions: Make extra-files optional
Date: Tue, 13 Jan 2026 15:43:12 +0100
Message-ID: <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229271

There are many use cases where a user may need a blank partition of a given
size and format with no extra files added. Such as an empty data partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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
index efe15a4d15..3abd2bfd4c 100644
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
+            logger.debug('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
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


