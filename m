Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8536C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:50:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.27524.1700088651779973836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=KL8rSidI;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso1300285e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700088649; x=1700693449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvl1VuoUr6B5HobKbhCZ44o2VrtJMSaDy55w+qcC2Iw=;
        b=KL8rSidIC9J+zSi1x7a8MK7rwY9wSk5H7Vo3S0TftQoiQ2xmflpRv61w1Nf0l4ccpb
         3C/r0nWR+rowU8dIli0CIJ5uKZL9g1YUokHBGHM/MghCyUQVR5BwsxNnHQj1KfLGDAVA
         EWJ6vAaBgqJqIlhkoOW656QtuUOhv880Ed9wpgMQeaB9lEwDqUE/Nl2P3tyaZw3pxgoG
         Eur2Ima+bply5CAe5SUGQxgZX8zqRYW/JHfpcJeJoHTS/msQk4fIH1M8E3NyOn286weE
         MDWGX6UxQGdH3f8ugPoCQbYakBEdzvbXIpMkjdvRC2jxPX9zGIU4J1H5bHvlMU9kN3uV
         UmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088649; x=1700693449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cvl1VuoUr6B5HobKbhCZ44o2VrtJMSaDy55w+qcC2Iw=;
        b=TWIJVpNOZ8pzV1fZQ35kCSfgSDaQ4boGsB6vxfrgnbklEsYDmkBCtTCXJDhEvJXOW5
         gxwyGfZSXPZ8bwAifoFDdJXyc/aztNlXNbbvZRgX+DjkktkB5AyIWX1tubAFhv3fb1mJ
         WAH+LDDL/4JjiMMm4h3zGe1R4ofsRVFIh7XQvVhGJs9vI1RIbKdwm40qFDfVyPRrVipY
         1KYSu4fGFNhIOY0yYRg1FkC82z01QGcLgxeI+0Gsbb9BpFXPu83dEECySa8jH96NOiJN
         9IdZjP+v+99mD16JngFH7ZvoYWYQt0LohkRi0WkgvU60YeWa+S6RHzFVCBd3E8vzOd5J
         cfTA==
X-Gm-Message-State: AOJu0YzzXLfvHU/q0v5P9SxhxSdeLAvMbkRmumICY3UPztk28lijnWIv
	nMH4at6MsQq+KMrapeV7R7E48pYVN3CpWxIYaAU=
X-Google-Smtp-Source: AGHT+IFKyrDrppYS3iGMO0X6eZolKqJkdcRQojWrNSqmWZppWWPbymSJLsoQahJBG8IJ67O6bR3b/g==
X-Received: by 2002:a05:600c:2d15:b0:404:6ed9:98d1 with SMTP id x21-20020a05600c2d1500b004046ed998d1mr11227580wmf.41.1700088649478;
        Wed, 15 Nov 2023 14:50:49 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id k16-20020adff290000000b00323287186aasm11693481wro.32.2023.11.15.14.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:50:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] meta-selftest/files: add xuser to static-passwd/-group
Date: Wed, 15 Nov 2023 23:50:42 +0100
Message-Id: <20231115225042.2606718-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190750

As xuser-account creates a new user, we need to add it to the testing
static passwd file.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index af2fa0f016..f7a66de24d 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -26,3 +26,4 @@ wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
+xuser:x:530:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index a4f652198c..cc6c5acd5c 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -18,3 +18,4 @@ builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
 weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
+xuser:x:530:530::/:/bin/nologin
-- 
2.30.2


