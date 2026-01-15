Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA414D4115D
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32362.1768472078429716682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Zaj+g+KO;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b5b22f723so131122a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472077; x=1769076877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=Zaj+g+KOwHAtogsnlgMoYbnqWlIkkQOu1KB6Vdd0qu+7VZJj6/IZkPHKRbFxLzTE6Y
         /y8wdeb3SOdbj1bjptFBxo8F8qyYqZzn4uuw1DmzFwqHbyQbF2HRXlmToaRSTBS3ieWZ
         matN7aG788ali+heDJvfFf3huKc5SCWbbfAgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472077; x=1769076877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS839wYQCt34M6w0vqSouQF8mgM5YG3VWs2swfA2GQA=;
        b=Pm0GZM0uyoB7fW3rDYQCytF/9tbM3YuHAIgJOoTSJV2XenFwYChtLxOIEEi/NK9Qle
         wtx8DnfcoTAcvzNN+RCS6s/bzRQT+DKbN72AppcVu3UgxdZ90b1QTz+F13eAu7pGj40p
         fU0Kp14aLv3gCY7M20i6NFaTPm8o5jOy3nrXycmmT67OjbbxzbjTKVI9kz1fiz/QXLV8
         c1mmTB0J4YC8pbhXJ4yovW4zlEIe0OtX0Gu4cE1EGTLwX0c7c4qEoDJNItrf8J4AUyoR
         707wABD6OaawQD2uReV1R0Z/47cndYqadjigcOBr4yedUswyVtV6XRB6eRzW8kaavQCh
         Jbag==
X-Gm-Message-State: AOJu0Yw+pYm6DuYgjleQlGKBdMK0FyuiDAZr+tP8LZLUuwLw+kFB3+SS
	u6lljpqNPVuUhz2nM0+KA8OmwxArql80wpHQ8JKntqFsvUR2Uc85M5/KIN1WqM0AjOVR502lB1h
	5MCKz
X-Gm-Gg: AY/fxX7G0psEqnP8EzgHDbWB8OcTig65ZRL9VlDuiQDAJMG0EvA4yIulSc8aqh1D282
	8VOm/EbkTTWK7P7wEY6zXyOd4gqOKrGufLi3pCj2+UWmSvXpwgT69uGX03DD43RdoTthL+/bXFD
	dkSkwiwNNwloSxaErLwwDU/YgV38jFE512xCrVHZcYOQeK4RgMZ4HcpHGn5ZRh/zVgeVIdJYevW
	MfHvm3qE9v+de77n/dQi+ZggfpmJD4SZIk2utaymYQ8dWuS49gxG/9XT9pgA+IZIBFhHczptsM/
	NBsWYvh7Av5kYM0bW3bxTVGxivZiudh1KdsQmUHkPGh3kBOfaJ/xC94AZ2gIv2KKr5N6GfQx7BQ
	3gHSwsEOuvhgxwxuRwcEVIT6o2bNIiQ47Wsu1JpB241y6FUu7Ylhiu/1NTHl5E4N3BIH/J9T6Tj
	5gljDvexQKUNPTh8k1df+cwRlEs4/LW2Zpb02DtxygFnzxlLKseau84VfQPv1dA82VDyehdaxJ9
	+g0XvRBAFqRomf8TjQLb6o4HDLFKSMNIieBQtemFBz8PzN5yBF5kYDpPg==
X-Received: by 2002:a05:6402:35ca:b0:64d:2889:cf4e with SMTP id 4fb4d7f45d1cf-653ec47d79emr2639796a12.7.1768472076816;
        Thu, 15 Jan 2026 02:14:36 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 3/6] wic: extra-partition: Move extra var handling to a dedicated method
Date: Thu, 15 Jan 2026 11:14:29 +0100
Message-ID: <20260115101432.162696-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229401

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


