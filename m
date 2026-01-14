Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3993BD31A3F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13887.1768407047246135559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=eiZS+vfY;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b6f22bc77so1588192a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407046; x=1769011846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=eiZS+vfYaf8uS/2FCF8+ZxeXfU5oIPVJwAqcg9oHmUwNxmr8jng9u/avUW8GB5E1Sq
         mZADe7LvYh/1CNpTtWjbjmcvjOytztP0qVP6Emc7Q7DcdPcRmr+7IzhGprk1oSyAV52l
         ovLO46K3Hpr1d2tpEqxKhNAhH+mfrg1Zw9ZjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407046; x=1769011846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=MZ9rZPGB2nH6Wis92Jp+F7J8jqRgWbPBbKvLIhUCfCpUsqaZgfaUmC3hwRYDT2DzjU
         iShpznWKrHcTw2zdEockBox6E4idX/4E5TcDVUHVyvOUDb7b/5WN3by6Z4f0miiXab4W
         DY871ZwUOkiwrG9KOqsM77n/Zc0VlfZBuGnvxM/CDO2LEDGWy4Vdmju4nn7E62IR1vrg
         adOe9gutH2m4REA2EghfpXeRzocTgdYTcZRo/XchyxeoqKHc2pOtvf5E/lC7nUvEtDgB
         MAYiLxj75/VOKnUL0IeQ5xWPciQpausMFm6beJ+r5ugJzWEBduCoBZ9UQZB/fTChSRjY
         pYyg==
X-Gm-Message-State: AOJu0Yx4m4a4efZJ3c/hQuCOxxPJl5eumGcPHIF8XLkfrM8TNNX7vhcB
	VeOrbNsyOAQRZ2XUMgoImqGSqwAlPbfvHx1vvuykhCFR/ETTKuS9+wwkRBHXTueJGHdAx5INcfH
	xAvjY
X-Gm-Gg: AY/fxX5BB3x38QFCHSfL/a53PKO5kCucOW8/r7c4zV8gUEXtwqHvBSRrlzUNB4Duk9u
	jddKfGMOK0L2tp3gaxRs5MHAAV8PTB78U+/WlLvtliDRys/K7wbMHUYxjkuU2uPQli79u7cPbjt
	mX/S6WEXpq5pa7AwzU+7BjyOgM36bdHU9cfpb/itFJ6W+LPpAJ4tN90qnUkKSpkuhqUFri/5Gp/
	UN9oqWnuV4F9cdhka46OBShG1ulj6TyqLkU5COP2cVUKLVjxMY+QhkKW2yp4M8P5jDel2w4t3WT
	sZhZCINL/dYT25Cq3SZh+exfRq9BYnbhGzqfLnfAPiaulYjGBXtRYIrRD+XTSwWrasdcJlUb1eA
	pm6E7BlTGLDxVpu97RJOfoCF9jfzv92lAvLGEP+NeX9oo1n/+jInaY4dQIa9dYCCIpRlcjycIxR
	Qd0Ye7bpJbnC4R6hNzCmA3Gs8oWaXOqYxJRJlPN3+Jp9SYWJAmy+n0nWYxjkXG1VkzgZLE9B9XX
	54ApyB0bYeOAR1+dj5XzP082kPSxgHvRalqV69fTA6CtJn8+SG1
X-Received: by 2002:a05:6402:35d1:b0:64b:4e7a:bbc8 with SMTP id 4fb4d7f45d1cf-653ec461c8emr1366948a12.5.1768407045592;
        Wed, 14 Jan 2026 08:10:45 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:45 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 3/6] wic: extra-partition: Move extra var handling to a dedicated method
Date: Wed, 14 Jan 2026 17:10:37 +0100
Message-ID: <20260114161040.941159-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
References: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229349

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


