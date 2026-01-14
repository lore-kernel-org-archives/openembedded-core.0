Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1339ED37E59
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13326.1768405714093357514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=gzivaLR4;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.50, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b5eb14e88so1531589a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405712; x=1769010512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rclxTIKzc1P/UiHbYYifeNn0ElbsZ3DBTx6SpHk68K0=;
        b=gzivaLR4yDHfrGgI4nsuh991SxSW5xrjApFR+mDZae3eqGLq+NxDOCq24BwIIkYQkX
         Skd+LJ6iWhIWRq8JWI64Qlr8ChpZTOLQO5rifMh7njAV6e/n8oWPT7DTC71ZTQrzup8D
         W4eBW//41M2qQ2AwSXQXOxQs0ann56K4pllw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405712; x=1769010512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rclxTIKzc1P/UiHbYYifeNn0ElbsZ3DBTx6SpHk68K0=;
        b=KvlcznKzGQu5e73Bk6H1vgNVwbg42Lsj9xbE3DQnTEHGW4Ginbda9DlTLleEil101S
         MN6HUshNPaP/8OzjAWe/317uJtWwdCjncBaO2GfphwJmRCgl5fXOnKsb934TGrxpuBM1
         1Is1OE+rkgpRiE7BkpCYEHYWhL5EnsovBE+MGDFkK0N1BRgfMJsfIHW6wQ/mRLalQkax
         Yg40zgFz+IGyvUfstGKUZPE2IxwgnPuE7Zp/a3u+wIs4GfjTqv9zn7KlsXoaec/UQloq
         6dRwi4jshTZgzUoQeRxzXIfdlbcWKmfzcO9TiWOFePQHmWZBlXU5EXIkAdswktcsAB8B
         JYlg==
X-Gm-Message-State: AOJu0YxBItRlpdHtfafH7OpxJapxgxE9fDypBrie/yFhoXypHCd3J662
	bq5aqKczjg+c+ho/93Pb9HDQOdE9cvBv22vF7A1IEF2utfM0T89Dcz58WBsK2su5HqN/Nd7p8oE
	Z6oF7
X-Gm-Gg: AY/fxX4L3AcWKo1IlRJVGmukLUfAESDDkeibLbYremnK45UGGSJSAEYXx83W5WL2vAa
	Q3OmQdVgIblWZvSiQoacSmAi9HaKMeNak++EGYbcKMpqHZu2+YVAJyBy03ixDQWbbhg1Yzv+UpC
	fiI6/ADDwo1h4xSIf0xTXEmMN7AkLrkJg7LmLQw9QupMk9Nqud1Ob0iRnEyHBqbqRMszaDsCCHw
	Vs2jlfRhI4cvmm0BZqmDNwhIQACyX7BHCJwmyQO+6cv6Nveztrnyzq5CRXCyZZ6mOmIzLaoFw68
	hux/2fjoNf67seDs0PpX+wiHqI/ePWQb5Icy5YWCB9DRQV2+0RifRlY2tuDwV80IYLD05WPB0rW
	KnmQWk8gq/F7qaFewKa6KCiJAIYXsQytRRSvs2wHGw7LaRZcNi3aPFDmUu/VDbd8aus8rnAZdJF
	GrW6Ua2fMv9UxoySWRxH/6aePYA73a0NVEslqACZH+Okf0lk12qJnlTO3QlQUyZ+lCrEcqWQFhH
	dCwyxrFB/LDiAxq8pE6t1NyJ4AfboB1eWJYdwtOQOQwhHxOm2Ef
X-Received: by 2002:a05:6402:26d1:b0:649:9aff:9f42 with SMTP id 4fb4d7f45d1cf-653ebf7deb2mr1455424a12.0.1768405711907;
        Wed, 14 Jan 2026 07:48:31 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 2/6] wic: extra-partition: Move extra file parsing to a dedicated method
Date: Wed, 14 Jan 2026 16:48:21 +0100
Message-ID: <20260114154825.4043483-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
References: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229339

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


