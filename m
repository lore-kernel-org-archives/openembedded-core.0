Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26478D46603
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2428.1768555940993560258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=BJpWbVjj;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8719f5a2b5so33331566b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555939; x=1769160739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=BJpWbVjjIDHF+Znn15Yxr+JQTZB9gOxDZpiPo74tYFbRfE4gxAJ8uTRD/Owgz6fXOx
         erIIjY27oOYs5TmHuG5QUU8jGxFsw85EheKS4I+lGxIHliNStvjLpXcG55Os4m97czi6
         5Kw4pNXZfByYKMZsbm0YUX6/OKde38EQtXX1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555939; x=1769160739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=EDwOh7J77iZFypDc1/wwPZfb91tp5AdbmDINOHJ0gqQnQMN4LoQgH3l2f/T4PdDce3
         S1ePV0FQHhEvO+cH4/VOt1mryEMgh3avgNyQ3dSVAvPHuo6qDq1sN/46HeWy2R+j4kzW
         1n6oMLIMuk2gTSdnQTJLgSU0v0wHGfG7UbNkeBXutLnCk0PlILhhSOR1ywAZcgPbsq78
         gxTE3Pv/mLcdsP+zlgjZ8ZP2oaV+lZoCz+EvZvPWz1cnqMqszViXrOCHWwkMFeuD09qA
         ZASQlyb2djeFQsvjYyLJOuGnBpIC8J3/JfZDfa71ndNR0yAp9tu46iCLZcZZMQVDQQLV
         w5vg==
X-Gm-Message-State: AOJu0YyKs19axfWs+GOSTDoRLDWW1BUE3D8aiOYrU+3ZqyXzqKRoRJkm
	wcJcMBSdjGsdwwlOB/42JZVYkJ/4NMC+HG9I2+aY6iTXpxgPuKN6q7/Uw+8GV1XqfNa05pWsUpf
	m49gG
X-Gm-Gg: AY/fxX78xiWAlpGwiq689vuBY2mh7r+9oVaYAg2qJHXAQwWiMdmx0i1BG8n+/QcZCJb
	ggc3DlfTnBoPgmEkjC5Kh0HHfDnH9fZiSpGara82UUdYyxV5dVH7ivB9MLJCYV+gnIXBNQvvEaQ
	nAfsBrwe37SLjHPAurjF1cH/wQKPCvuUrRL5xNDcK70o1JUubmibEbyCqU4enp/2HLRztl8sD73
	aZomSAar872RuC8GAIQcmv9rokOMubgYTnELmUOB0YtU3vEzCPZmCkbkEuHSLOAcZQ61HmP+7KO
	xmXD5x+K09hFawWn1SWzR+QdBEiEZtK2DpGC2PH5J4uJv/pr7u/m+hJPs1vhB7wwDOCnxX/9hbg
	3VyHw0xZeKS+nzoipx7of2UtnPR+at7Y07wRDc8hD2k/jPEX8A0Vz7jLGFdcd24cM2RmYVsOajQ
	bEbgdpIOMR8L8+iq+pbxXCvr77NLFGR2xlMmY26Cqc9WajU2jkt7fgoSccZmwYRko0wDow89Zm7
	H8UowXYS180pVLwo7Breiaq4CCxHLOuGPYF4MX/t30br19diUuc
X-Received: by 2002:a17:907:9307:b0:b76:2667:7736 with SMTP id a640c23a62f3a-b8793044c34mr124218266b.4.1768555939124;
        Fri, 16 Jan 2026 01:32:19 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 2/6] wic: extra-partition: Move extra file parsing to a dedicated method
Date: Fri, 16 Jan 2026 10:32:11 +0100
Message-ID: <20260116093215.26108-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229532

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index a1d9aa9a7b..aa4fb931c2 100644
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
@@ -66,9 +57,6 @@ class ExtraPartitionPlugin(SourcePlugin):
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
         logger.info('Extra files: %s', extra_files)
-
-        # list of tuples (src_name, dst_name)
-        deploy_files = []
         for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
@@ -103,6 +91,23 @@ class ExtraPartitionPlugin(SourcePlugin):
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


