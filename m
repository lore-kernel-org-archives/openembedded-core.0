Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C73DC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2939.1790154727905872143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oUROZg0o;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso4464565e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154726; x=1790759526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PlIf/bF9PMaAhJNtVvya0Gb17zg5Hh9zS2Xjh82ZbUQ=;
        b=oUROZg0og+a5yd52xnOgP2d+J6FzFnU483Y5AJW9+suVtXSCM966qfhdtAop2aau7N
         lg/PxxwLnTc90xIbx7IfIwEpLauzN9m3csz/tV3LC3mt+BqDFBN1vMyuIZsyox6qCE2p
         quEcGUcSBTwRXvpNxEazAmN/m2tZ/z2Yhwr8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154726; x=1790759526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PlIf/bF9PMaAhJNtVvya0Gb17zg5Hh9zS2Xjh82ZbUQ=;
        b=NnAmmE6uks4f5XE4Z4IguhgCVEqEGm6h4HK3tZiP6d6OHj5NHAmugSs0HxxCNaLtp4
         AxuOwzbF+3FQBMUXqL04Uf4UDrCDjFIzEsbObEa69Q24b/AhIfuDOLzhIHqhELNf/Dr2
         jzdLMoH1gCsF/XL6/sp21yhqXg9Bg0jjzDttssHO4YdjaRacev/FAIEM3T08G+7hlmpT
         AmrESc7EwSa60Qip6PPAqYPzVstJyk3vKYH4yPHmP1Rdu/8X9Kf2YcOfHmkYvT52JRSs
         qADQ62S7QfBRRV6eEB27LYEqYb+vN4qYn/LrpsFDDDTvmqtcaU7nCRbRNeWkIgMYZTkm
         VEFg==
X-Gm-Message-State: AFuF++kMhsWTnIgYCJbRBP2RkUQIA7K35gLXGnEzYSsLgrWmn6MPIaip
	fR0Am+WloifMS5LCTOajL0R1dqEuDiPMtSKm02YtXKuomMIU7SDQzhGab8c05x2nKwFrZDmjI/e
	W+40tjIs=
X-Gm-Gg: AYBFou00IkHJyjn2rIfmXlC6mX3CezI94g/gC7/RGV4tPbx1OnrSnYOVyXlzdXEYbka
	UrbTYoIRglh39qiIqK5iuAWoFH0rd7kem3BuszYFcERdl947XF4/VF6ZnZ8CM5wBTPHg96SEq2z
	jEUE2Pn5ZNlTNClmmw5A4sOqm4GUm61+J693+7K8xqR/wHxHEcaSicu/mErL8UoVKJ4bKlKC+Np
	96iLOXNjtXAcjED6NR5w7OhHNJDgQfsHOcHNXAqSz4CYpQzeMYKTut6CQnvx3K7XjSIRAugIrW9
	ABsF0ZgJKSYAg6PNsEOhKbyaUNZP2Bnr/lOdPp+Iiu3l3m/3lTLQge1q7GtKU2l1jSWkZqamRx+
	M5K5d8ORX87y5SjsNqp+Pb4E0I6LMlJpOU4xoATUnYoazDODDXZXLeYFX0fP40j3ooTxOX7Ucjg
	v+WLA/wUc/pPHePLcRxFZv5gF7W1/TKHPByHXhz7cc42ia/oZUuU/iCKbj5A6mKu3PBb4MqDLUt
	6Fl0dKZa2nyFb2x12mlV+xeQwAyGNPEeiOveKpOgRT7iuxd02/pecqizmm4LZc1EDjRj6li
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr22026155e9.4.1790154726095;
        Wed, 23 Sep 2026 02:12:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 39/48] pseudo: 1.9.10 -> 1.9.11
Date: Wed, 23 Sep 2026 11:10:41 +0200
Message-ID: <2d50a4b12798e57a6d7900de2cb2b6b4edcb77e9.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246501

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adds suport for a working close_range() intercept.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a68d3f4bd0e80ea7e1ea745b6a10acd341dc7d8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 22d9006f797..1320d19ad49 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
+SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
 S = "${WORKDIR}/git"
-PV = "1.9.10"
+PV = "1.9.11"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

