Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EE3C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:41:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.22397.1691685678045815773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ABGrZ058;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe82a78740so2023355e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691685676; x=1692290476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvE7bRhO8RR3RGFkF25KakLaLGtJFbXsM0lWQGLMCyU=;
        b=ABGrZ058C0NmOPUsQ0jRV/KnA3zuvz380B8qX3KHPrsf34HdEdgIoLLzGwnfcpPUh/
         moRNzuLelLR/uRUtNobFqWReGkmp20rNsv/eAWm/4Y954BoTsoNT5yZTy1UglUnfYfOA
         eklwSxLphfVVbrDVsfAxvMcN5j+EX7kqNe5+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685676; x=1692290476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cvE7bRhO8RR3RGFkF25KakLaLGtJFbXsM0lWQGLMCyU=;
        b=Mx4qsyqlVBr165TJI3uoXgHnejBaPVSrmj4EdkY+bxWrwBEkneED+5k6ibJbNEAOWL
         eFkgCA8Ya7NlUQshOKquFobSy25U42PIpbBNxiPgufUT36+i4tq2NWJmAW9VHNlo7iWO
         myfNaKCXjnW4EO8p7jZcU4SpTQmOkD6NO8AmjFVkeNQ6tYvj5oA8tJvqWNn4GEVS1MzU
         prsP4JxnJo6xNUlfrYtb2hqPJJrt7bxoAOYYt3BG/n+7z3LpXo0mSpONKHorY01dN+3q
         o9Fa+A5nPVEM2r6N7S6YwbpkkcFFKc/3ASRGlUrom9Q1yQDzehTxk1P9bDYUl6jrrQui
         LZDA==
X-Gm-Message-State: AOJu0YxAa1vdXuM0UZLFt5fJOmJFJQyKB4juKd5W8397ilj1/vRK8f4B
	daoga0Vk8/A0iNAof4Xv5BVd40j+ioeh3I1N4w8=
X-Google-Smtp-Source: AGHT+IHfiEtGbDmzl5u41/SUD7lwWpEhjOChui0NuXNO/gA89AJIB4aKFn+5GsU+P2EFbh+wQT/wKA==
X-Received: by 2002:adf:f1ce:0:b0:317:644c:fedd with SMTP id z14-20020adff1ce000000b00317644cfeddmr2603412wro.30.1691685676110;
        Thu, 10 Aug 2023 09:41:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm2660039wrr.32.2023.08.10.09.41.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:41:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Drop PE and PR from WORKDIR and STAMP
Date: Thu, 10 Aug 2023 17:41:14 +0100
Message-Id: <20230810164114.261613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185818

Once, we relied upon stamps changing to rebuild. PE and PR are packaging
variables and are reflected in the taskhashes when/where they're used so
they do not need to be in STAMP.

Similarly, once, multiple versions were something which was useful in
WORKDIR but this is really just noise causing long pathnames now.

Drop PR and PE from these variables to clean up the paths a bit.

This may break some tool assumptions about paths but those are probably
things we need to fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 475d6523bb8..599bbc4ba85 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -402,10 +402,10 @@ PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
 
 STAMPS_DIR ?= "${TMPDIR}/stamps"
-STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
+STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
-WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
+WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
-- 
2.39.2


