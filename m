Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15491C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:38:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.177184.1672213075363182659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AjZvIt7s;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bx10so14252254wrb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rxspv4TU9GO+SFRI4DVSIKhAg7n8Jcf9M06nJBuyTRU=;
        b=AjZvIt7scLLIVYnYH8ckZW0UijWkGBXm6Pb/Ca2YQ/vcpDSDTczx+SbmXigmtcYVHS
         b32U17KxzwytJjp7zcXXAGpRieQCeAx9vBxwoZbsx2+zrNUCdIwV6FBd1gXw6WkSBUuF
         VFGGdJkkqVVtE8UYCpVos+USpnShuMRNx7jTJDXtLVHaB3gJI+rax1Fz5511dh8y5two
         1kLx9+LtdbzQuFw3rZ86gl++gkGLjwIKdytDvfFhetU8fnNLTVmvUOFSD4sGyvxGTpRi
         xtHuALOVdtonsCOYRi1565q5WlFBIjD9bkF8jpj5RW5kKLYGDslaJ+4csPFuVx7JJCrp
         VhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rxspv4TU9GO+SFRI4DVSIKhAg7n8Jcf9M06nJBuyTRU=;
        b=Jp3s2rR+HXEjdGSaQgGWTGyDhOtTXPvCeCcpdWRblQ+HcH4+RgyTQFvAtwl5YGhOfh
         4wkuCUq9sZm4ZR4b6/IeEhrpblDI6mXQGVPU25OOoYxlCpI96mG9ihoyZeNycbAu58WZ
         WZfBiwj0L3PdGrQIa1S6ZSVAgIyKMTSFI0PWu3qsujcIZ2e2pCd0hiVh8WBGfRqkqyTo
         9hPt4FQfoBNbuQMRow7yWB3nkMvNmmBp65YVKiYeKgoX9HUUJ8Zabq2vGCkBWmkkTLkx
         twBJAXUFGjSbCjPfgWcaCbJNadajSB09MDg8Ru1kgd5iunaBgBePYdij5XwEdqSTUV8l
         vsWA==
X-Gm-Message-State: AFqh2kqDY3o2Iz3XDdCqGJv2RFpZX2cTo3h8yL+zYGpmiM28ytmNzgt3
	G0TsOuI3TQbHIjQr1McSGF9X18ZQtdI=
X-Google-Smtp-Source: AMrXdXvsi61ti9osPI3LkFjWUhnSm4NHKkONNFaetPZeoQgvclet84tRoylqJIHoNUfZ2oOG+0IOzQ==
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr14501353wrs.19.1672213065199;
        Tue, 27 Dec 2022 23:37:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/25] stress-ng: upgrade 0.15.00 -> 0.15.01
Date: Wed, 28 Dec 2022 08:37:19 +0100
Message-Id: <20221228073721.3454255-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175065

libbsd is required for splay tree macros in tree.h

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/{stress-ng_0.15.00.bb => stress-ng_0.15.01.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.00.bb => stress-ng_0.15.01.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
index e0d8a58517..38fd6698b3 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
@@ -6,10 +6,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "91ec6bccd7e94fd04674b29e081e579710b97d71"
+SRCREV = "8c7c3d95555c50148470553b55477db895a4f1ad"
 S = "${WORKDIR}/git"
 
-DEPENDS = "coreutils-native"
+DEPENDS = "coreutils-native libbsd"
 
 PROVIDES = "stress"
 RPROVIDES:${PN} = "stress"
-- 
2.30.2


