Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24880C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.30691.1668892588483339004
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oshSPwvg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w23so7404082ply.12
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGbIHVMWTYsG58trt2y5xO8zgQRB+Oj6CaRfibTparE=;
        b=oshSPwvgmTUicg8fq26Fz+L4rpSLVgg3B6zO3AfFOVmZIByR2JaIMwY3M1Z64toqqH
         qMg6FqLHgBk23kjMK7wsgpuN7jitLS3RmhA+xElY3Wd/6OE430/xvQgLlsN09TKhmF7S
         wu2yVcPNtbRY2evVvMj6J0ADFpDJZowH6wkMunVhH+y3u8hzdcP4vQxgl5zR3B9tK0fJ
         QGRUlnTrX0kd4zAwPdyd5NVc0lJCvz2TvenAmU9Qkvb7hFNAy+SpgFz8NOTIUeZvhXmB
         iZCFm4BmRmZ3rY+B5YW9YmPIl5a5jtoxjgL/vVIM3ZTwPVLloZlQj1uub+JlS+cHe4FY
         vxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGbIHVMWTYsG58trt2y5xO8zgQRB+Oj6CaRfibTparE=;
        b=5E6Uvzwhd9UZYgqZxZNCL18uR/Pww+BNl3Vn3ohzM+1ALMTBEEEnIm1zjByymrPEjK
         vd4wxu4ZfpST7BOchjOLM+BgGfo+Ocd3jDE49E/v2GRa///aG6VyMVMT4tdadpfmbgHK
         T6H391vnfeHCDEid/9DHL+hW8BCGjFtBeElsRB2B2z1HnFIkUFypyD4A0Ib1/GT23rKy
         B8XqgPiRsSxgV0clT/QSg2viUSLYUvzFpb9YW5NYS5jaPC4loP4UWp4FveEaExuguHU6
         UdgAbMs0LKNPzYtGiqB464BmvSyzW7/oi2NXbSA7ylGY1QGaFf7OYhbgiVPuoP5AD/EY
         OLFw==
X-Gm-Message-State: ANoB5pltiKInL2gxnbihk/A+XiSYYQp0z25766fYFBR/L3nbhbw2bmZs
	S28lX5ClwUIgfNWCwN8snd0AxUw5RPy+vWEGO68=
X-Google-Smtp-Source: AA0mqf6lCZpmlHFCvlNUocPQb3zvPXjmfAYWlGCBSM7EACL++Q3YBRTYgcYdupKAHuGE2TuzRk4zmQ==
X-Received: by 2002:a17:902:be01:b0:186:7db1:d2a4 with SMTP id r1-20020a170902be0100b001867db1d2a4mr5300009pls.84.1668892587513;
        Sat, 19 Nov 2022 13:16:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 34/35] gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change
Date: Sat, 19 Nov 2022 11:15:13 -1000
Message-Id: <fbc6c1dc6cd4b360efb11fd7165d8cb14f12cc48.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173574

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently if you switch machines, gcc-source do_deploy_source_date_epoch
would re-run as the stamps are tune specific. This hasn't caused much
of an issue until now, however if we fix the gcc recipes to reuse the
timestamp from this task, it does then create problems.

Copy code from allarch to ensure this task hash doesn't change between
machines/tunes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7e052d03464ba5e880a6c5a0e45ff2f467ef97e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index bf33a4b31f..265bcf4bef 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -17,6 +17,13 @@ STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
+TARGET_ARCH = "allarch"
+TARGET_AS_ARCH = "none"
+TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_OS = "linux"
+baselib = "lib"
+PACKAGE_ARCH = "all"
 
 B = "${WORKDIR}/build"
 
-- 
2.25.1


