Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027F3C74A5B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.16016.1678375209133202861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BaKixGm5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1458318wmp.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri0FjTyR3BjGdPHmS4T1IkjM5cf2TL3MxjdVBu3uslc=;
        b=BaKixGm5joqxOXT2swPndzvhi05VxNGAd1rT4GYW8G+R7OR4WYN1JSUnxkETOGRsN1
         30mWwuDCvflpNA2Kq6FjMZS7BVe65DPH3t98sH8kgIlvgUdGowzgveJ3iVpFi3GeyE+F
         sDRUEcgu5Mqvap4oVeTfX9Mb+ErRtTT/G1iqk/Bwbn9Ip01Q+eHCuGok6J4lOQAJGPLk
         w1XDcjErSGuoZ/eAL9rqVTR5qbe6g3qWrKP3NGvJjC9kCTgP4wE6klJFcbI+lqrD6r5A
         66VyJDbhvnBRz9e0ECvpv7ILcQ3s48x/MMoSoPhvIqxmLXMifQ323vwKtW3XXvoCq48n
         gHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri0FjTyR3BjGdPHmS4T1IkjM5cf2TL3MxjdVBu3uslc=;
        b=Pl/aJWaDbaHpNE3onBZGOXfBeQXYc7iNELIwuKjY+pt4QSzIyvQvnr39o0gNFJUvf9
         W1peAfjkgN/RxWzA/xIfKQ9+Pznv8ztY5MzNRo/lBWFOnZjCbf+FoD0AYCA4Pf471eMe
         UIsgxsmmq7FrNdrDz2QPjrYHnlUu9g0GphZmlFE9qE7K9sR2SrIOvScK8SpB3NEQC8NA
         9q9jeOF/Vhxb5gEciNsdeNEsnqUyb6tsOPzMCj+dsjKSULwBS5y5UbvaGKKmBtmYN20V
         UOOqcVNtM1UWEb9C58X3XWStvlXjFPU7ndrHyJm/lWRmum3REEUhXxhI4vLzm66HYRsl
         OfmQ==
X-Gm-Message-State: AO0yUKVw/xFspoCi0wrgIQ4Odij1Opjb7mmq25pwisOCqzOXC2gkPGhM
	GiuycbQE4rGjMuMNvF8rDtT3a2cWhYc=
X-Google-Smtp-Source: AK7set/L2JCi0bdR4GzfFg1ajOKpjy+riIACrP9r2A6JMARRcXa+/QU9LEqSj9ek9tOtF2caigt+fg==
X-Received: by 2002:a05:600c:4fc8:b0:3eb:cf1:f2b6 with SMTP id o8-20020a05600c4fc800b003eb0cf1f2b6mr20883390wmq.14.1678375207692;
        Thu, 09 Mar 2023 07:20:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/26] dpkg: update 1.21.20 -> 1.21.21
Date: Thu,  9 Mar 2023 16:19:38 +0100
Message-Id: <20230309151958.3619193-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178231

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dpkg/{dpkg_1.21.20.bb => dpkg_1.21.21.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.20.bb => dpkg_1.21.21.bb} (93%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
similarity index 93%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.20.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
index a6ed4fd429..a19a96ef06 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.x \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "6c5140f124925ad4eb12fb2c8e83a050028bbc1f"
+SRCREV = "9ef736b7b3a5fa0d6e991e8475eb2e3151fec345"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


