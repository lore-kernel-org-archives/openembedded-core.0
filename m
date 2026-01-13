Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE04D2D11A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:23 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60627.1768315399962877433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Yvz9ItwP;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8719f5a2b5so36381866b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315398; x=1768920198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rclxTIKzc1P/UiHbYYifeNn0ElbsZ3DBTx6SpHk68K0=;
        b=Yvz9ItwPcX4f66SlJdvTZegOHRHkXRDhN0NKJmttzsf6QeXt7tw/K4amqL958MidzY
         BtAyc9BElOYJT0u03x89X+mZwg3OINu6SICgWGHAgj9jWzv5BQyJp5RTK713QS1/yyGn
         RYxM0mLNFm1yfER4ihUWaJ3vYFtzbfRwWSC8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315398; x=1768920198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rclxTIKzc1P/UiHbYYifeNn0ElbsZ3DBTx6SpHk68K0=;
        b=B0WPB7WMcBUo58C/qR5FL9nDRDVvnlndmUD6B+DjvmccvFnbLaepkvyzIBnIC4a9Bo
         31k6O+tEbcJSqRfJUeJQCNILSoTLugoO52eO/8/mGaVMgVrjQZ8eevM3zJZNKEnl5F4J
         Z7t7UWi59yoMko11/mt/aGe/8pMySRy825Zv/hTsnE8XKD/8x37y4BoRozM0p+3Zf9rK
         llXw5DNlprBcdSutAXFE/fq3du5R7t6EbSoPJrlgCzHIvto5iEbbxn30ZGzdSN3cehYi
         KLB/bK2SsXdgHCUKNMV4ryZLWGhlRHWHY3OfyhebvR3POCloT/dYY5BROnANc6rgLP/l
         qL8w==
X-Gm-Message-State: AOJu0Yy7u4v3nBudQAweptSphUV9ONXFykcpMVoAOc1HCtrfU0q02OJu
	H2HQoEOM2nqNpdTpVs3G8SnuJQLtozHjNj35/1J92udfpotCTKhljvhBXNwLoM76L5hu2IPbcNg
	DUU0p
X-Gm-Gg: AY/fxX5NVtjp+BUdDI42oayS4GOCslyWaaDHvO0g2HoQ+rRf6yZ8C2oNthkxQ5wMNH0
	eLjcnh36PlIDN1QFXnXuf6p8tv1q3VLvgxL+apjDUxOWzA5lVe9puDYtZIVctI2G4Ynxoyg0ymc
	DaMsZai/bHlPr/LwUv0rYqAWE4tx/jzMlx8X9shC8+QNkz0lDEOgbrZ6XcLESOUQQuVU3ba00k5
	htc8PECNBHbwZS0Zn/zr+QHYSNqXdBpqX0zyDWLa4FiwUl5vEcXN4vjBEYaZszG/a6c2IiRRWu3
	q1/+PGkooC1S9lWNWyPHl8zPXwGrWcEirbI+pZRmOKsfRm3lE2xPWecJQoXZrQgEt90hL9zZH4/
	VBDkxmkj3GzTXoDuixheCupMOhLv5XanZH6PpvrbS7e1scctUFKhRj2baeQGsH3XmeONh+WSf1O
	Gzj5n7rBho8GnhSWdWCg/QA2GPaBBrs9TQRXfoK3ZKvImyM52w745j+DITQKFKNDc7gYPvq9R6a
	v5KFMPZNi4U5NIYXk2W2MZk53DZeGm/mVYDYiDxO+ID9BkGxUNz
X-Google-Smtp-Source: AGHT+IEQxTVev7tt81Cznq+rElbNfXLGZWC5ggni3pDjr5pxptIXD5mpzsAqh80RZN8mmI+vV6mr8g==
X-Received: by 2002:a17:907:1c18:b0:b87:1eaf:3762 with SMTP id a640c23a62f3a-b871eaf3f94mr349398466b.7.1768315398319;
        Tue, 13 Jan 2026 06:43:18 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:17 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/6] wic: extra-partition: Move extra file parsing to a dedicated method
Date: Tue, 13 Jan 2026 15:43:09 +0100
Message-ID: <20260113144314.3563680-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229268

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 36 +++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index a1d9aa9a7b..040b6d22ad 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -37,20 +37,11 @@ class ExtraPartitionPlugin(SourcePlugin):
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             native_sysroot):
+    def _parse_extra_files(cls, part, kernel_dir):
         """
-        Called before do_prepare_partition(), list the files to copy
+        Parse the files of which to copy.
         """
-        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
-        install_cmd = "install -d %s" % extradir
-        exec_cmd(install_cmd)
-
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+        deploy_files = []
 
         extra_files = None
         for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
@@ -65,10 +56,8 @@ class ExtraPartitionPlugin(SourcePlugin):
         if extra_files is None:
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
-        logger.info('Extra files: %s', extra_files)
 
-        # list of tuples (src_name, dst_name)
-        deploy_files = []
+        logger.info('Extra files: %s', extra_files)
         for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
@@ -103,6 +92,23 @@ class ExtraPartitionPlugin(SourcePlugin):
             else:
                 cls.install_task.append((src, dst))
 
+    @classmethod
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             native_sysroot):
+        """
+        Called before do_prepare_partition(), list the files to copy
+        """
+        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
+        install_cmd = "install -d %s" % extradir
+        exec_cmd(install_cmd)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-- 
2.52.0


