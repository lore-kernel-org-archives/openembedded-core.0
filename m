Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E156C6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3126.1675840910613950144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YdRABzds;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so744530wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxpRalo+dE4sj+CUJdCo2Bky7mAPmElVGSSKfdMfyWE=;
        b=YdRABzdsdnOOl53/8GoJcEVkiYvgIAIMN5CYmeWYCpwO3rzEGbRpKUZf5nK8w59Jnc
         kWyh2Hmj6VZJK+QuulpxuZfcCxsStYh1xSyHke2tGNnTiFnAh50BITpsaYpB0tSSq7/P
         wH5lbU2xGk+pF+NHWg1+AmKNfE1Y+MXqV2U3sEILFvjBcRfZbAe1kWVR4iF0EJNF5IPR
         Ch6sL0o8cwJAlgszuGuDZg84D249YalYNxTJvrRhuqTmeWdlNQpO4SigtQ7sTJt+mEAU
         KRzon0jriZuyGzG44V/iqra47kLLGZ7EXpLiSX1rr+Qu7E9kXrP4T2+wM+l9BkSv/UvA
         bQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxpRalo+dE4sj+CUJdCo2Bky7mAPmElVGSSKfdMfyWE=;
        b=MDFElA9XfBBfHxy5gJboE29Anqa9QgMX/Yic5GU0c0sVOfB9NGyl3CIpg+AF+35Ihp
         JP5rOav5F6T6QTY+H/Nv5iFNkmMUGP2AhIjWImGW88BL+WByCSELoiCyXmkVW5T6rvhJ
         d1mroMJiQs3LcVsJECkwxcQ8KEHddI8gIdsRDSBbbnOfmKU3T7CQTEHXmAuNNs/UKrTt
         KTE/xWVNPIe8ZEbzkSsS4Tt7eTrtkFNc5pzcv1OZg/W5TwjBuhcvnMj91e+kYnXgqZoF
         oB26x3q+sJFea8X1mU0ohOaxBcKUPb/08lmVOV80NlzM76NP5zsTlmG3igV45HNmFbW0
         hbwQ==
X-Gm-Message-State: AO0yUKUgNdSRFt74cvN1D+wLbveq8y76CR5x9IaxokwtZFjAsl2VPc64
	W9Ns8jtB6hXCeSF1o56bxVu7GRer+EU=
X-Google-Smtp-Source: AK7set96xn5V85MyVQ3jfXTXSvRHwvdsXIqUqmizrk7fokolzfv936dadzCIvRIMgP5QZQT7Ak1N2w==
X-Received: by 2002:a05:600c:a692:b0:3df:d86d:797a with SMTP id ip18-20020a05600ca69200b003dfd86d797amr6138848wmb.25.1675840936538;
        Tue, 07 Feb 2023 23:22:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 50/52] stress-ng: upgrade 0.15.02 -> 0.15.03
Date: Wed,  8 Feb 2023 08:21:41 +0100
Message-Id: <20230208072143.2930292-50-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176890

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/{stress-ng_0.15.02.bb => stress-ng_0.15.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.02.bb => stress-ng_0.15.03.bb} (95%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
similarity index 95%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
index 75400f589e..13a8b49f70 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-test-float-Make-variables-global.patch \
            file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
-SRCREV = "4164f6842c712c2d9a13619c3c70fd35d8d02cdb"
+SRCREV = "f3be0447c10fd5652b4c3753d56bcaac13fd8917"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.30.2


