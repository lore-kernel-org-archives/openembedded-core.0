Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC855C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.3070.1639000818308695975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evtGfYnL;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2782433wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DeHmyHLPhFSNqoJ3q9Htqlegnxa4o4gbDJWY54Ckpxw=;
        b=evtGfYnLsUsA6P7UQtq/If4omWvh1PoimDvOT0FZh3ajgKakJzlAKEtYGyrAx+QtFk
         rwkhyd0fgdZsNA/9Z0UU5L4OSEW49Y2KeDT08AcO3jLPv4B3YgjDt3Z9LfteZprlsTY7
         xr4fZzmtWzuTC8TXVSukyBMqhb7iJ7ELq0HE9ZLnaFPRRTiVS99MTBm1S7bEDGSivRHo
         ScSvP11fCEMQg4tRMOEL0jhhgNVJN39sI+H29PSkSf+uXg6T5jFSKpQzWEajT22DdwIM
         MGjZcpPrWJjzJjQoDhG0rKcWUqcvaLUdcVL0WSNzVqwooNcKbLTb9Yra2vymUMwSC6uf
         qilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DeHmyHLPhFSNqoJ3q9Htqlegnxa4o4gbDJWY54Ckpxw=;
        b=JXEWwjYLSkR0eT6wRHCvwDg/GPgD9aBp396M+bAtsd+3p0WcXDnb4d2VEXrA+OafUF
         7s8FNKpqnoOSAM2uYzZYo+YpnbWf34HZAF61h2SpVkjKba75chXyrFMFIsjZCekITYbW
         +2vRzZut26GsM5L03l4HQoO8awsHDomCRd8rkj8vZ4EUXOoU7YibRhpC3EaYxtZ/2cH6
         VxKcREcn8Xkw8vt9wrb2GEKxd9Rj4wKNy7cRGDd1jsHhrp8tk9qd2nG+JaCFRIv3cJcw
         ECZZa1Tj+YLM8X+Hj75Ei8BEVsl2xhr+Tnak2UjLoqCMaTnJF+hpH2Yp0fyINebnC0kL
         DE7A==
X-Gm-Message-State: AOAM5313MXW2kOV+vrJmNyudNWPiyd+HHluDGvkZv87MFn9Gt9PSoDVI
	QnVmBE9b3AsJIKm5tjdq0xrdAiJ3Pbyulg==
X-Google-Smtp-Source: 
 ABdhPJzZ4NbktKydL2HwG03F1hJylWHtUXuYi1Etr6f37hmSI/q6Ss3DKSJhtSMSrzvYc5jCegIF4g==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr1685982wmp.73.1639000816992;
        Wed, 08 Dec 2021 14:00:16 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/29] kern-tools-native: check tags,
 not commits for new versions
Date: Wed,  8 Dec 2021 22:59:47 +0100
Message-Id: <20211208215947.1979470-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159395

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ef035aed23..ef43ef74fa 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,6 @@ inherit native
 
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
 S = "${WORKDIR}/git"
-UPSTREAM_CHECK_COMMITS = "1"
 
 do_configure() {
 	:
-- 
2.20.1


