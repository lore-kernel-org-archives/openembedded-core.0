Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEE7CDB475
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6017.1781960429690057874
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xBdN9bH0;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629051c946so2202235f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960428; x=1782565228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpu7S/Tp3T5E6aKCCYomp9GWNr+QpZ13ZWXtId2M51Q=;
        b=xBdN9bH026mHIlfgmb240jc4mc4eG2gl5+B7zL2fiHCQsSp3M8PVPbhq0TDKhdXV2S
         PJ+s/S/7jS8fn5uvW72t7W9qpbzChqSudREKTEn5W0zO0MqiRQAioblwCOAdGuydX7JL
         JDT8FcIt5EpXL+rNSMn61VIMbXDjHyYKWGet8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960428; x=1782565228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dpu7S/Tp3T5E6aKCCYomp9GWNr+QpZ13ZWXtId2M51Q=;
        b=DZNTkDsjmRxV79R/VENIY7EurTdUyhhIU/k6RBivlTkYjE2ImeFiuGKqkboU9kz93a
         hHYuWydkrc+/va8S+osbA0N2J3Hh7bwUBli/wfUk2YVZjl6++S6VafJMt+MprPU1VMy9
         EL+dRb5/bdG1K/sVOIZB6AEsn/PRDZ5xZ8J9TuaOMhkTISsO1S3joPEOwROfJlrIDQ94
         IwrACP7CC3E1F6rezELtfBURRYt6WOOIadblsOOQ34S2dC9jONxp9Q6zuvYNfYBjXdkG
         k4mSQmdKVpKRbVZeqrlI630YUNZy4MTcv3MaVioiPdo+gL1qojKgm6OoU3UhgZpGS4+w
         ZgDA==
X-Gm-Message-State: AOJu0YzqFFpb9vmdag5Gy0TDrmHnR/46nR4FEqcM15HDIille4sGAx4/
	Ur4Au8dKYy2Hv9HaQN8fHrQcqYnpG6sJYG7QUPcAy/4MZkug64970Xqmfd5yv1bABebGWlwuegt
	O8nUn
X-Gm-Gg: AfdE7ckKpSyCW9vaeSctaJQ7j9OXjQoCSevXbYHlMlYUnizw8V5v8OB1UYPPOY+7Lax
	koTYD8mbBV/4IEShWiu4AVp7R8AZZsWYnxSR9q4+1bywBNBgt4E7eyk/aENoYemOB+YA1W/NinD
	C7JnF9BilwNb9wqv2YPZGFUiTiJyt2PjOGQvGuDansZ3pN5EuuxoiLhUWJjkmq3i0WhKTvovnaC
	QGLb6Z0fsdGjfw3VB3LmUVnwxT1ykow2qtmFu8QmjCLj3OJpJmMkHSMuGoFgKnbuVRS2MHUJkU7
	tg19ogxtub9vVlw9+l5VdA+hn3xK19PrPkOMtAymp+PODS6W6/Ld6F4rx8fI6KPC2LvEJM9rIk1
	m1fa11oUT6FxzGd7WAK4sWV69nTGPWFLOUXO3fjXGWBwqavq/ILche2dw9Sd8qmiEggAtViMxEO
	1OrRVhw4TKE+yfNmKQKmWkULLWeHmlEAcS6MX0+LxEtZvx9yGA880O7pENBegVV2PWQfzRRBg6d
	KQWtJi3LC2yg6yA4WZGGw0lEIk=
X-Received: by 2002:a5d:453b:0:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-4651dd1d5d9mr8043724f8f.16.1781960427803;
        Sat, 20 Jun 2026 06:00:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/36] pixman: Change PD license to HPND-sell-variant
Date: Sat, 20 Jun 2026 14:59:43 +0200
Message-ID: <e269116d815db459cd53f46486a465750435eb90.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239238

From: Joshua Watt <JPEWhacker@gmail.com>

The license listed matches the SPDX license HPND-sell-variant, so use
that identifier instead

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0df576caa09506a6c7362311b9d2aadbe6d2133)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
index 58c7bf3d034..468871f114e 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \

