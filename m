Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22514D44C4E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2429.1768555942141668046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=f/UGK1KL;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b872cfd35cfso32964666b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555940; x=1769160740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=f/UGK1KLkzA1BU2D0d1dWxtMMAtpVv2506j+6+IizwSPdH5GQ6y87U8tDQMWCEJhvM
         fhv4W+L98KuiJnbt9eJHs/9ar5+1eBlI3LPip2IIQihHfz+nVNXTFDYxfeY0vNEcIRQ4
         VlFdvQDSlaEYW05t5rFlQ/Twai/ecBi7EmZ6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555940; x=1769160740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=NUVhcPtzQmC7E/8wyJcmTA+gIz2sNxh3ZU46RD+9EiE9jyiPPePK1NIC8ALBDfvWS/
         qkgbgZ3WUICTqgQCTabAUv0aJFhv7P0m96gyZWq3FC1Iq3aD/6sD9y3QQaMkrmpcrqql
         x3XnXIiOKES+rPC8eO6jcVWLpoRruVqBcFIggG4yiDRmS4aNoTocEbkJ0qUEADdpi+Qu
         FgY+j13IvIjR48R97KHQLyuMgIOCptkA/BQLA5TN3o8qLb6VEqW+L1SXno/DQIwjTtFH
         znaXEvfcQaIq6hQ66GVVsHFBUG1XxVRPocgD6muK//MM0lSPM1WUrtjscXdpRzyWO7VU
         5QRg==
X-Gm-Message-State: AOJu0Yyl6DCZ3gUmPX+JBcX7UmkcGeqqjOTvb1b89d/0XhPpsXEr8FhB
	IKX9DkEOtZ3VAvuSj5BK7BurIoW3LN6Qo4e6qcjWStigrSnPQfByFvWT4lTEtvrIt837Wk6Sqjf
	YN6Yu
X-Gm-Gg: AY/fxX4DsnCdz7p3eizbXU8brOIbpg9ZJV+8nrL+8Slq+0UGpStxqQ3QcL3NMYpeIMb
	mgflmbAL10FoWWkGR6UPGozJtDLsr+YiA+AWf6VyGeNaJ43J7Lf9rKL1R9T6NSBH5juOrqyoMfu
	oWdF7qGWHEGrULfUfX0PFYAM8DTXpr+UzQXX6U4tXX0U5ctd6mvmJFiTexXasSbPeruAL8Fg6nF
	vtYCheIJChicIpwckSqxShCmSejYNajCrirjXUxEWfx7PELHMR6+lJPZoY3FlSicTzPaun3pTS2
	B3B60v05oKI2Xsp9OywlWewhKcK16j0fdb/oV7gnwHswSNPsT/nxGy32AnMUxzk46PE5hHMiTUt
	mUSqCNcwPrOc3zcKH7GqvDjaviFP1ik9aJATTlRN4odOGgBvOKmdEvCtASJQacf+G7+s2XUK/Lp
	O9kUsBsYhuOFUJsOf3FOSbWv1/ekDWP7NJkNRUoSkcX3wUzFobmMqeZKlP1rfYYlE1Q8Sez9urX
	oRTX0CWHeapBPfB7LoT45SgrVWOA1w6AAoakowVNUfmOoT++P2K
X-Received: by 2002:a17:907:7201:b0:b86:f194:9ed5 with SMTP id a640c23a62f3a-b8792dff55emr141564966b.1.1768555940015;
        Fri, 16 Jan 2026 01:32:20 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 3/6] wic: extra-partition: Move extra var handling to a dedicated method
Date: Fri, 16 Jan 2026 10:32:12 +0100
Message-ID: <20260116093215.26108-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229533

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index aa4fb931c2..05b0ace361 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -36,6 +36,20 @@ class ExtraPartitionPlugin(SourcePlugin):
     name = 'extra_partition'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
+    @classmethod
+    def _get_extra_vars(cls, part, var_name):
+        """Get extra partition directory or file variables"""
+        extra_vars = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
+            var = ""
+            if fmt:
+                var = fmt % id
+            thing = var_name + var
+            extra_vars = get_bitbake_var(thing)
+            if extra_vars is not None:
+                break
+        return extra_vars
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -43,16 +57,7 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         deploy_files = []
 
-        extra_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
-                var = ""
-            extra_files = get_bitbake_var(cls.image_extra_partition_files_var_name + var)
-            if extra_files is not None:
-                break
-
+        extra_files = cls._get_extra_vars(part, cls.image_extra_partition_files_var_name)
         if extra_files is None:
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
-- 
2.52.0


