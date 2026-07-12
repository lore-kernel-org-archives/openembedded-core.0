Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DE6C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:29 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14871.1783866568904022459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=COehDD0i;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664c6304683so2143681d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866568; x=1784471368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=COehDD0iLjURLaS/2QGgQGTGDdY0GU1HVMM0YJZ/yQheGDRsYqZFczDuSSqqWo+smS
         7qbKAmrawRhXyQz/wIF9xndB3lC1kXD4A5oaTGxk+NjtAWHz9r6w5H7+QcwBASkY5id+
         CyqR13UbK+iZDj3W0X5DFLNa2vXeZVlr7kqL4coW858OlUHsONJ5n0QvhrfeOnX3nCqv
         r44a5NFCoI3dYJm5ZwlfzPt8YB3hCqPjWn6oh0QymRe4fjCC6zIOE4WRKhMpuZBGJoax
         YyCyRW+zoGUygiTK0Q+cbLcJcxAoSHW1qToUwh4U8B0DfEMGRX4mE3oBYla+OvhZEcbF
         iVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866568; x=1784471368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=nHuR9dWbiKE2Do64eJrQZHXV7fgyohXg0GC+QIcSEzu/4mEbOhxp5QG13Zmkdb/wUl
         HtKTu86xMpUDab6jm0Fx7LGAiZoxIcjCXLyd55vd6mJNMV4EGuidVlC3YQHVQLEMJmtq
         tknMU1yhl7xTGFwwGJGcF8f+7qRf8iUSBhM7CmRklTzae2NMQnRrAYs2QaMwtctULRXB
         IEJT4atk0/Vg6acXII1EMCzr6L0n9MjREiTIbJiRqkk+x9P5IOu3fWynVG2CI+ceUgb/
         gqh42LtLBjsdoHIUEFhENLGURXlI+svBrcuy8qdIkySnd2Wv3bIWvcr86fMTcSW1A0Qv
         uRYQ==
X-Gm-Message-State: AOJu0YyQyNHMO5djOfjulg/e+5O0rmTHKFvy1KO1Okss42NAJJPYg6kR
	eTY7hb0hrhwX64fRZBXWQbbmhnH40rd9H7u4Iby/NvL5wlF3GhjMqrMtB4KDjb5rwNJpsPgEgxG
	km1QEzRo=
X-Gm-Gg: AfdE7clw3OPYTvsnFipABHm2xXAWgXBkdrBdZ4NHru/tFGzdc8HE6LmYHvRxzSNA0Uz
	yQpPRUv8XFDMFi6E12iSK5MrAjW6cYRT4mHbMfdkCxVaV7bZTeCj61x2w0G68i1302ecohcUWYr
	V83kOx61/gYpI2LsTFCypMTpRQU7t816On8HPtxEfQj7BeiIkpxi8ZC33zxJ93lh1asXI/MgZCy
	JMukgq5TB82ir+ViY8e8hjS6oIHQ7EtZRxUvCRbVrLMhVayf0YXIG1usqGFEE9dZD8yAs3i5Zty
	4sKnMRHEPbWrFGv0ishGn/i5uvlzHTvJMv1D2TC9lkn+s0yW4/QiynydP3ZJDKC1kgBurgMVjpq
	0Syn33nJl0BBudGQIpUqC8XPHo90BmiPOPvuvkOXg3iHpnMYfV7HcOnn1VqXETiZc6PHZeundvA
	ux6IAzk9FMg8qIUw==
X-Received: by 2002:a05:690e:4510:10b0:664:eb60:f60e with SMTP id 956f58d0204a3-667d7c7deadmr3062238d50.65.1783866567962;
        Sun, 12 Jul 2026 07:29:27 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:27 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 05/24] core-image-kernel-dev: rename kernel prefix
Date: Sun, 12 Jul 2026 10:28:57 -0400
Message-ID: <20260712142916.2573370-5-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240771

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 4018af7a3a..708bd6bc1f 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -6,7 +6,7 @@ require recipes-core/images/core-image-minimal.bb
 
 KERNEL_DEV_UTILS ?= "dropbear connman"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
-KERNEL_DEV_MODULE ?= "kernel-modules"
+KERNEL_DEV_MODULE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
                              ${KERNEL_DEV_UTILS} \
-- 
2.43.0


