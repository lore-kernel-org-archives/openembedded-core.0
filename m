Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0963C3527C
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7351.1651727164934262085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y2Yjt/jJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y21so3913055edo.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovyAbs0NnSPlIxsfw65rpcl8kLKdc2oL5SGnVqb8z7U=;
        b=Y2Yjt/jJJAsQxvvLHFPdBv+HAwAelDJq3PdAOnck/DA6DPQlgIb4PAq6g0b4xN3yyY
         U3zBJnQ5RJtjSaavyEYdm5aSo2cams60DBk9rdMfimcfDgSOkDN9qM5UrvVToQ3xD2sY
         GGdmV7yMwtK8H8UwUhpQGTfjRnGNT7UsZkF9Xnprb6Eu5cUrLoUeqAv/huBvw8AD6FpE
         v15QHvl2VdXq36OnbllLVECQgtCrVyiFpFihlwEfi2lpJW2Tl7pXT/korlb6Vr8zkLoS
         sTCT42kMYksWO7dAeYO3wMzPlFYaDP38RHumj4VL7l56lS1T9VXX2nkxkFJq9RAbrWUS
         rdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovyAbs0NnSPlIxsfw65rpcl8kLKdc2oL5SGnVqb8z7U=;
        b=tBJt3oC+ty6Y/6XXyexwC52o6sA+mnf61BXt8gWFa8+aW3M56moO0yXqn7EVOaPAzs
         fMf00x+U1yUp+dU++h6DnaVen+cjJjoqwfbVs8XQRoMIKcJ6nkKq21IsD+6ufEgEUNI4
         01/T+tD5uysLuWWWaOiX8PF3i/Kz0mi3W3l7+ggXCTrrzPVW2HEGWoHAsTQE1U97Ulep
         MnVPkJTiINnJanmGrzjPPD6XUcHfcDfcoBBLuszKdaUHjZHR90P+N9k3H4S3sWg8Jsgk
         iwq84+BN4PLNetuvGYLFHTFUM+JS63S0wNABQNXjitERRTnynwOkmL5MldKMY5Hyper6
         WsPg==
X-Gm-Message-State: AOAM531OlXiKMDhzbxAxcUKeAnYfaKaRPrqx6XL0eK/HVXhz2+nrqSo0
	aspdV+7qSWHGahj7Weh06L2cZQXkX0s=
X-Google-Smtp-Source: 
 ABdhPJw7hIZPjblNvTKxbyc5QZ12XXUm9EipU99QUtXPQ3hQmobOf9MZqJnYKN1nkXhrhPQOof+nZA==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr27523448edx.128.1651727168129;
        Wed, 04 May 2022 22:06:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/61] libseccomp: upgrade 2.5.3 -> 2.5.4
Date: Thu,  5 May 2022 07:05:10 +0200
Message-Id: <20220505050544.651895-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165256

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libseccomp/{libseccomp_2.5.3.bb => libseccomp_2.5.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.5.3.bb => libseccomp_2.5.4.bb} (96%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
similarity index 96%
rename from meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
index e6260a7754..c76f3c3573 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
 
 DEPENDS += "gperf-native"
 
-SRCREV = "57357d2741a3b3d3e8425889a6b79a130e0fa2f3"
+SRCREV = "f33f95014b36f97b42f0c2290e96d5c31647ed10"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5;protocol=https \
            file://run-ptest \
@@ -51,4 +51,4 @@ FILES:${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
 
 RDEPENDS:${PN}-ptest = "coreutils bash"
 
-PV = "2.5.3"
+PV = "2.5.4"
-- 
2.30.2


