Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BB1C30653
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:49 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.4269.1719778126223532171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bg9lPmE+;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.53, mailfrom: steve@sakoman.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7f63db7a69cso20364039f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778125; x=1720382925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVRmKdmfxa0MZz5kyWWcuWEVwB0jH/nlZvjhz5yC4fU=;
        b=Bg9lPmE+YA4+mopA+fn8Xab7Fs13Rz22iKmV6b+jYDFU/svXxMtT1e2Nb+kw9pdc6D
         sCukBpZ2hM53MH2tECc64Izyp9P3n3dmFcrrhfsuKKoJT/5DQVULNOlSgH6DAP1y7ykA
         m+Q5jlYCwLM68cRyAAmQr1lIhhMlqWctRZa+LW9KxweeMkQwNQBFI2YRpcR9m5u3rA/9
         ldYMCalFOWpP43We1M5fm251RKwlQvZwTawTMh7rs9hGPIHF0GRVqGx8jzQh5TS7NfLO
         emzLVTeEDLecuv3A/i3puwVNjnbRFlbx9Pd0IiX4ywl3Wuhrsn0EvzwUa7k76ezy/7Uu
         KVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778125; x=1720382925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVRmKdmfxa0MZz5kyWWcuWEVwB0jH/nlZvjhz5yC4fU=;
        b=p3DiDXFjVCTY2vvzCDLcJ3HoNPG5xHO8QQlFSLmUxwyycQ6m6/Q/YHOz2Zp/pKAuMs
         MZ0QKd1qLOYpaVPR6R1fsktSgt6gRQR6V5tr7R8yjNIojDqm2zcdSqu12iqn2UlO0NMt
         ryMXX5l+OgyiYmK+Lhy/IC0l3OTTP0GTKkaTviO3H/VxwHUTIuaosLw+tNZj7/xbCofa
         7jBKiXjw4gggUKhotOSivCj78tb+xemOC5upGk+PqFp5VjLxy2t5Ir0EXBpxSQ6kILCB
         s3btJSpw+WpgTC+a2CSI0Lz0m1mQI12+O10LZ4eGpVKZnt21SJPIJC5uuxyWKHELIbNA
         vKNw==
X-Gm-Message-State: AOJu0YwxlI5w+CXGIdMTVXTuU28kBoRrwSCq/hNYEQE9otWIx/4Xo+SK
	CcstHlAHHoEyezcyIdhSr37dCpxWsk51S0fi+mvacP7Rc0aqSp4tN7+we8wx5Quw2wEBez2wX8G
	02sk=
X-Google-Smtp-Source: AGHT+IFnfOZMmrLc5RS0cruvPt4K3tLbZMHk43gdfobhZ/yQCAGaRnXWjVR8rsyjzzIpEeIleqB89Q==
X-Received: by 2002:a6b:4412:0:b0:7f6:2da3:91e5 with SMTP id ca18e2360f4ac-7f62ee6e90cmr436471139f.15.1719778124368;
        Sun, 30 Jun 2024 13:08:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/35] wic/partition.py: Set hash_seed for empty ext partition
Date: Sun, 30 Jun 2024 13:07:40 -0700
Message-Id: <a4e7334a4b87f1bb1947f6b10f71ddb445c91d0c.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201265

From: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>

Although setting hash_seed is handled for the rootfs plugin case, but
this is missed when deploying an empty ext partition.

Signed-off-by: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0202fb594fb05098cb8d8b6088e63beb40b5906e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 37 ++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 795707ec5d..bf2c34d594 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -284,19 +284,8 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-F -i 8192"
 
-        if os.getenv('SOURCE_DATE_EPOCH'):
-            sde_time = int(os.getenv('SOURCE_DATE_EPOCH'))
-            if pseudo:
-                pseudo = "export E2FSPROGS_FAKE_TIME=%s;%s " % (sde_time, pseudo)
-            else:
-                pseudo = "export E2FSPROGS_FAKE_TIME=%s; " % sde_time
-
-            # Set hash_seed to generate deterministic directory indexes
-            namespace = uuid.UUID("e7429877-e7b3-4a68-a5c9-2f2fdf33d460")
-            if self.fsuuid:
-                namespace = uuid.UUID(self.fsuuid)
-            hash_seed = str(uuid.uuid5(namespace, str(sde_time)))
-            extraopts += " -E hash_seed=%s" % hash_seed
+        # use hash_seed to generate reproducible ext4 images
+        (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, pseudo)
 
         label_str = ""
         if self.label:
@@ -344,6 +333,23 @@ class Partition():
 
         self.check_for_Y2038_problem(rootfs, native_sysroot)
 
+    def get_hash_seed_ext4(self, extraopts, pseudo):
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            sde_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+            if pseudo:
+                pseudo = "export E2FSPROGS_FAKE_TIME=%s;%s " % (sde_time, pseudo)
+            else:
+                pseudo = "export E2FSPROGS_FAKE_TIME=%s; " % sde_time
+
+            # Set hash_seed to generate deterministic directory indexes
+            namespace = uuid.UUID("e7429877-e7b3-4a68-a5c9-2f2fdf33d460")
+            if self.fsuuid:
+                namespace = uuid.UUID(self.fsuuid)
+            hash_seed = str(uuid.uuid5(namespace, str(sde_time)))
+            extraopts += " -E hash_seed=%s" % hash_seed
+
+        return (extraopts, pseudo)
+
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
@@ -437,13 +443,16 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-i 8192"
 
+        # use hash_seed to generate reproducible ext4 images
+        (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, None)
+
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s -U %s %s" % \
             (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
         self.check_for_Y2038_problem(rootfs, native_sysroot)
 
-- 
2.34.1


