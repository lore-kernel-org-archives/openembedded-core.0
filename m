Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D21C61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 16:45:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2062.1787589944166571778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 09:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bXWURqBj;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso5130522a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787589943; x=1788194743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QbYjvYAgkgDuh/qlMnOxEec2p8GTFuOTCtxNZDzEww=;
        b=bXWURqBjUXf3y403H+ShReFVOEhBjMRnmHKkkETKfsICzcx5hIslOfMVYz5EXyPN7i
         y9EvzqdVhQpQEhUNWYbcqR3HJ2gKJy99e7TKW/6NPWz7i/fTfjxJu0GpQ5ttHYsGyepL
         48Cmcex++RWC2WebbTqlO+naKuTdglNeCqs0HWCXketeCmaSpuFVKwz7XC8a7rapnPnX
         SmKHceYFaj3zRM8EjGUol4ElJ6X+uIm2KgFactKZXrG2jfsVhuYVECufj4Czg9hkC575
         MzSfMisPk8N03M5tScdomEfdxZ2+GW9qz51ZX3SqWUIQloZAnmqbvl3dHmfV0bFgyPMx
         uUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589943; x=1788194743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QbYjvYAgkgDuh/qlMnOxEec2p8GTFuOTCtxNZDzEww=;
        b=mPnp6Hkz/FxBNOwUcvnagY3I/2EVd6Ia2obSaRMgca2WeHqLBsKgVZyV1GQPG44tWK
         /wnDm3gAibXmWNE+jklShqD1K5rKhOZOtvMLVWk51DLB3ZP4gaHNXqyHi+JRCuIqakWG
         l0IXynDjzgBSd1Uk3U8Xn1JKiVBAUdsvJz0ivU+CqHtLslDF/RFUVLQPgC5dBfNRGRLL
         bFd9s4IGUNLBED2IKHU4PSt8u9Wpdo5WEV/h4DS7dDeWC4dnlqMyasOtxNba6yAXA5L5
         eONjwymZ6RpcEhVZtAd2Bn5ciYxoWUuocxzEadOJVSL4dDGCmT2IefY3ae/w8RCTH2N7
         pt+g==
X-Gm-Message-State: AFuF++kNpCszQiYxj9TYE5rFMDSJHJwh4OkvZy5XbtwrPUGk7WtFW6OZ
	tO6A5dHORzOH3mdhaB6ssGyks66MOSyFf6omidlp8DrlSD/Eee7P+TrL2BTj2A==
X-Gm-Gg: AR+sD10ZexXtpbbRRqVE372te21KWc2mOZtP49tGzQtVOze9Rtau/yfkASRMC/OUbbd
	1koZ8GA6eoVTs3gEYfyTpmexLF0DyzSUvrbvLV6DwORKqvBxDEZOiFqDZp1/1BF8QVBKT9twp0M
	Apct/oee9yZ+Kl01zIh6RfXKF3nCmkAh3o4LUgy7QRp/6eYc064KANSQshDTd7PjIKw8xueWkFW
	ic9h4HGJcxr93431oLtImsiv4MD5I1Tl5jPahFV1PEIMLCfvQzUFtfbh32GnMxh9Eqd6uozUokK
	8+YmO4damxB8lrwMgdv2uULe1QQ3N+YO4eRvtQNr+n1nND7YsNXD5ziy1I8T00a1kuLRx7CfwKp
	Sy3YNTgmC8KtIuI++3qS8f037wKVQzUo1VA8paB8ggaZTMMKz3Kbb5Bz3ugB1dgTMX4VBtkRmNZ
	vjZyIZ+XDzjE42Z13Co8blGR9w++TgoPYdwULIqmzokmVgL9FrY3VJhiIoETymPQ8si/w6Wb5p8
	vqSrn7W9kVB7mU4aq0f3xk=
X-Received: by 2002:a17:90b:3804:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-39646579b5cmr291161a91.16.1787589943480;
        Mon, 24 Aug 2026 09:45:43 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm41861615eec.30.2026.08.24.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:45:43 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 2/4] repo: upgrade 2.66 -> 2.66.1
Date: Mon, 24 Aug 2026 22:15:25 +0530
Message-ID: <20260824164527.296576-2-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244140

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/GerritCodeReview/git-repo/compare/v2.66...v2.66.1

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.66.bb => repo_2.66.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.66.bb => repo_2.66.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.66.bb b/meta/recipes-devtools/repo/repo_2.66.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.66.bb
rename to meta/recipes-devtools/repo/repo_2.66.1.bb
index e03cf7f019..32c7a38a94 100644
--- a/meta/recipes-devtools/repo/repo_2.66.bb
+++ b/meta/recipes-devtools/repo/repo_2.66.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d9da609d8c120bb882a43196a4a6b7f183418304"
+SRCREV = "b85886fa9f5b4e2189cc5b2f40bd0a80459d4c77"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


