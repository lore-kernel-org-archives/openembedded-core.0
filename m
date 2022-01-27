Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2658C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 22:49:03 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.517.1643323743059032668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 14:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QUq072kf;
 spf=pass (domain: gmail.com, ip: 209.85.210.53,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so3996577otv.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCRoPq+qC3gv7De9dPsFtsgFJGLJalhh7Pf3IqDcI6Q=;
        b=QUq072kfdH0X5d4fj2kv9RQmbgS6fhkAo2tOMzC2RpYiWQLa0cg1ncJ/CoRa3eZhX3
         ndrB0k/xa9xaQuuz9aleTA8ACS5ok3NohbuF8iZCvnSFS6oZGRH2tZc3csD3zgXoLPcI
         BiwqCOY730ot5X3cB91Iql+mWJNEJfOVBP3WDufp2DVd/xQAP9/2/VdXxYraHxenH2CK
         reX3zvtAAyJPtqphTAkiLSkGwpKjhPArWuQ2kjJKEH8cCvSr/8J5Avw5+uwGxtXF/PXV
         1KvnU+bGC+7kqfUCaYR1AfyMjBQytmhAC/7EmZQLuM0HC/keZBLVUfTQiP18YAGDMZGO
         ySzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCRoPq+qC3gv7De9dPsFtsgFJGLJalhh7Pf3IqDcI6Q=;
        b=DN0CemDX4Yon/voe9Gy0FAczGDU9759U49MqgHz4LYMVnVLrKuadPLjUGEpk8QzsiG
         cu2eUd+8BjW213jJSGWWFdIfyU8HAxabyy+mX4G57NfrXOQrks3JsS7MZRtH5xKIAEGH
         Gh46HoOeF/M7TTHtMzJw2cV6JuALAyucCJCGoq8kLzPpSYoOadww7AuGk9Rje9war+yi
         KBFVGgz+El/s5LXeYLNjbw0v6f+O7kFbQ2mShOyhPdCmHVfwn+0rduOdJ8d4vQE0tIlS
         AhGGrAOzhNrQKXQyQmzdKryurP017lk+tyaA3v2DMj7cU/t0G8Uthqk6eq9iFN8mOfjv
         5wVg==
X-Gm-Message-State: AOAM531z3c3KNh+lC1NBNejw+ygegiM84jszXIj7KsTWdN3mPOlAJgs7
	J7HBSeak9yEJxUVB2q+xmSRd5+EkAK8=
X-Google-Smtp-Source: 
 ABdhPJyNUE4rzf2einhKjxai4Ldtl7D4R0oWy9mvQtrLr1Nar6C6HH9CgxwEjM2sgB6M58eTMwDC3Q==
X-Received: by 2002:a05:6830:16cf:: with SMTP id
 l15mr3218291otr.378.1643323742213;
        Thu, 27 Jan 2022 14:49:02 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 t2sm10714104otp.71.2022.01.27.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 14:49:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx: Remove unnecessary package
Date: Thu, 27 Jan 2022 16:48:58 -0600
Message-Id: <20220127224858.1523844-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 22:49:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161059

A superfluous package was being created, but it was never used.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index eaf92c1773..8b4203fdb5 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -837,8 +837,6 @@ python image_combine_spdx() {
 
     doc.packages.append(image)
 
-    spdx_package = oe.spdx.SPDXPackage()
-
     packages = image_list_installed_packages(d)
 
     for name in sorted(packages.keys()):
-- 
2.33.0


