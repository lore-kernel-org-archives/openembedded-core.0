Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A0DC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:46:14 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.153783.1680770772882879506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=yJ5dO0f1;
 spf=neutral (domain: kynetics.com, ip: 209.85.208.52, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-ed1-f52.google.com with SMTP id i5so147712927eda.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1680770771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJzj40/c+dDZV+4AQqNRSvObAh6AJJUhqjOTCDY2xNw=;
        b=yJ5dO0f1HmS85lEOZaw6td/yzNlmJgQ8CZg6+msWtcQ3Rvq5xbEVpeQ58N3N4xs+pO
         dkxsVFtry10mqGP5sX1AjOp5nNTqWYdTvS3erwp0L2TcB+tTWfIjNJP/NNtFL1ZYSl6c
         o/WIWMmN3Bjw3s1BEw+Nk8fjskCuLjAlJINs1pDjnOfs4L5RvP6qW2eGeQJucr/jp3DQ
         t/485M31LyKDZv9+/Jnk36iP83lrwKpZ8kYsWJm0g+MRpwtkzG/eBejXbjjlDlYfjD3p
         /Y0N/m/lkjo7csel7knZuWzVvQTdScwJH0tVxvpFhvwvLTNa/mCaUsYQnZ4rGl21PnlO
         rGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJzj40/c+dDZV+4AQqNRSvObAh6AJJUhqjOTCDY2xNw=;
        b=FN+OpaEDu3HFfuUmbp+2+J4Sp0TKQovtDBhQ2mPqrrUC3feezHyMIwHaHxEp2nG/UL
         j5m0R9OobjrUCUHv/U8m9AMBky7acviX7GjZtTZk0Pmek14biyA3hoHwSdIfQPPX3QOq
         gsgEWgKcR2VEpk6MKAEHvN2HcyaQkqYtpMRE9lMdwPdks9cK2F5BHSmuF+EcJUc07nKF
         6XyEIEz1v68J3o//Yhjy8jF5MEKK5FxGLiMYPk+e9zpDPn8Xd7HFTQKKBraSMHw3CbJh
         LvhNP0FLUWMZJW8hyoAV0N0eFuGDo1/ySw7F0SPthTXOaiky+jvDCbK0Uh4yjBLymV3G
         sBaw==
X-Gm-Message-State: AAQBX9eAG57vHIRxAXzNKEGKir/32DTiaZgN9CxLSvQzCSOOPLNkV21T
	IXRD6O7fXwFKhPdmZ0KFfoHE4PrmUT13+cqCelo=
X-Google-Smtp-Source: AKy350b6oax99ZOkPvDiKJNXZXtRQbiOC3bxix3a6oRe5cBhQ00ZHPyh8dQi/a1rvTLsWrq3+ckO2g==
X-Received: by 2002:a17:906:4e56:b0:948:b988:8cc3 with SMTP id g22-20020a1709064e5600b00948b9888cc3mr5257143ejw.75.1680770770974;
        Thu, 06 Apr 2023 01:46:10 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm440544eda.58.2023.04.06.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:46:10 -0700 (PDT)
From: dit.kozmaj@kynetics.com
To: openembedded-core@lists.openembedded.org
Cc: Dit Kozmaj <dit.kozmaj@kynetics.com>,
	Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH 1/3] wic: use part_name when defined
Date: Thu,  6 Apr 2023 10:44:15 +0200
Message-Id: <20230406084417.34931-1-dit.kozmaj@kynetics.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179760

From: Dit Kozmaj <dit.kozmaj@kynetics.com>

So far part.label has been used to define GPT partition label even if
part.part_name was defined.
Fix the code to use part.part_name whenever available, as it makes sense
to have a GPT partition label which is different from the contained
filesystem label.

Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index dfaa901567..7315d8f073 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -571,11 +571,12 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
-            if part.part_name:
+            if self.ptable_format == "gpt" and (part.part_name or part.label):
+                partition_label = part.part_name if part.part_name else part.label
                 logger.debug("partition %d: set name to %s",
-                             part.num, part.part_name)
+                             part.num, partition_label)
                 exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
-                                         (part.num, part.part_name,
+                                         (part.num, partition_label,
                                           self.path), self.native_sysroot)
 
             if part.part_type:
@@ -592,13 +593,6 @@ class PartitionedImage():
                                 (part.num, part.uuid, self.path),
                                 self.native_sysroot)
 
-            if part.label and self.ptable_format == "gpt":
-                logger.debug("partition %d: set name to %s",
-                             part.num, part.label)
-                exec_native_cmd("parted -s %s name %d %s" % \
-                                (self.path, part.num, part.label),
-                                self.native_sysroot)
-
             if part.active:
                 flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
                 logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
-- 
2.34.1


