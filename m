Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B1AC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 10:28:05 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.8419.1717151282031156262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 03:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DjT6Li/a;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ea903cd11bso11958701fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717151279; x=1717756079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKTx9Upv1NKj3qvU+8lTdUtN36M2JU0ZGV4qK0gnU74=;
        b=DjT6Li/aYDkVcYPASS9vQn/V+vJM28fu2jhoJF1sj1T8+O6TrjAFLFcwd/n59QVzw/
         TGMoMgMPaGVY8epTLOP61p0wiM1A2yEStYBcP36obPvFCSZtN6MLi9a47iOHK4xyNPpJ
         cKWv61Nd5NbO+cSeVDtZM3kfKWNxEJ4p9WdfkoOmQWIHrMCIbGxGvMnBj7mkymVwlZzH
         UCKiZldfmgeSdPoJia/+KyP/PI1uyG660Hlw1C1JFmQNhMKJafQtZu7It92dqneJHSQ/
         dZ8pXyo8GFeBUhm+I25ztyuray7BXcQb9VOSBGbelTY6WbXkARmG+A3XjgiwOYjSMkYc
         iXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717151279; x=1717756079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKTx9Upv1NKj3qvU+8lTdUtN36M2JU0ZGV4qK0gnU74=;
        b=QiaU1tWgQA7uY0sq6vkEiCtq5m5UjOlRWR5zTkD2jlnfaLKPLti+oiVgCLRKzu1Y7o
         NG2Expc0lNiyCX572HxlzaRqrGSFrXaWpW8XLEZkUtJydAxojujEWaY+Zid7KiL4Fo4E
         iNGR24W0XVF0PH0odsLcF8zkRlVkyjm/XBlFG9QB7xIPauIAYp8Pjm/tFPqXcwmNIfuc
         ayU341xpNNUTzTJ9MBGfpAB6JxE38DnqnLt5WKFLGFwU8i8dcvr8OX+2m7krVD0rtbsX
         eRbzV2cqZBHRu2rfr60cuEvZIbe1BiZPkwJ0wm+9vox6NJlU22MJaMpqbvJJMeuIFai9
         vMzQ==
X-Gm-Message-State: AOJu0YyeMbGecancNe+hkJ45eoVGrr7hDAjW3oa36+IFwjbHIQrjFoXf
	E8o46AYigtgc/iIvxa3QDkNESI403fl2cZ5N2zOYuyLB93R6RC5lCInCCg==
X-Google-Smtp-Source: AGHT+IHCEHf5+NPlg9f0MhOYuwP7UvnE+qk4/N/r/rovfhrWaDgKtB8MUsGubB4cdw8KAB+Vl1RlWQ==
X-Received: by 2002:a05:6512:3d07:b0:523:2984:7a04 with SMTP id 2adb3069b0e04-52b8958da75mr1485859e87.36.1717151278839;
        Fri, 31 May 2024 03:27:58 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d34b18sm288201e87.12.2024.05.31.03.27.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:27:58 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base/bitbake.conf: use default assigment for UNPACKDIR
Date: Fri, 31 May 2024 10:27:42 +0000
Message-Id: <20240531102742.3550748-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 10:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200061

This lets recipes in other layers add weak default assignment as
  UNPACKDIR ??= "${WORKDIR}"
which allows the recipes to work also with older Yocto releases
without overriding the default value used in styhead.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ef2deb088..386e6e0a3e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,7 +405,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-UNPACKDIR ??= "${WORKDIR}/sources-unpack"
+UNPACKDIR ?= "${WORKDIR}/sources-unpack"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
-- 
2.25.1


