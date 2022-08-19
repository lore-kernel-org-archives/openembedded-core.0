Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980E0C32793
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.473.1660894075638033239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P0/oOEuB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id h24so4170267wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/vV7Kqt/UKJATTlwiI1P9cvnNF2ldqzXPoSLDtHlfsM=;
        b=P0/oOEuBY0sWjO0wuVKQS12l0FsUL+ijyS36JBhJ3WgFKN0hn3gGAyQ+M5jW31F0cn
         J+N0xcSusaoZuqY2ZQ2Qoj1hYCINErq/kBqBFKRuD65cBJPNOSAgHQVhGzUkJ1cXS9JY
         q+/BHCZXPzWdaiBnEigz1pYkmbkAl6bHeOXsbmVVSDUDoBxZgRuJAKvnvtJ4/EHpBZDk
         gEKtPvI8p/RK9cxIIhD6ssk5MML60+smC70CUdPzPx+z6txTOXroF0bm/E2Jp1p5TWAV
         uNvnqRwp5yX4igNNqOqM99E9flmz7CBLQ6xFlxx5RKou5uxPhkZTNOcpxOoAg5jIH+El
         Tb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/vV7Kqt/UKJATTlwiI1P9cvnNF2ldqzXPoSLDtHlfsM=;
        b=Zy7DjIA/CP0oXsumSR5qE6ehMhK9P1VV7s2+2nDoz+JEzoiTJU1vjSJgcV8iy61xAA
         s7CH83K9NMcw3Zc6dXwUblsDV+avwuEszNEOXXkyy1DwScdM6JLuLnESH7/3OZN+/1/B
         lWJgFTtdxYHEwVnmrvaQ277vkZfZraB28keZ0KXOp0HlGnNZa9Zq9mic9M8eBjIu/ZZ5
         SXyznTF+QkeYgYSGW0KjvCfL67HQnGGNnTarYxspZVC7+8EREKuhgLRS2v4Hi0zS6xNB
         6s8bkfkQyBfUB684zo/3zeH4PiwAqHTOcEfSWER9VwJwR7x4Es9tsLzadpefgueKpBIm
         Ssew==
X-Gm-Message-State: ACgBeo0RSmKbU1Bf3zMvIIk+FuOpDZucQM6tzhrkzmlfgzqFT0S7BAZ5
	tNdpkpuxkkPfVkkqSzqs1yqfiO6DJ9k=
X-Google-Smtp-Source: 
 AA6agR6e5CoJ2AGJgCpB2fFhebgDrGwaQ06C1pnT/dx8/GoDqZBP3RBy7gytUWYBhCbF8z8Df8/pXw==
X-Received: by 2002:a05:6000:2c9:b0:220:5ffc:f159 with SMTP id
 o9-20020a05600002c900b002205ffcf159mr3447634wry.712.1660894074155;
        Fri, 19 Aug 2022 00:27:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/42] boost-build-native: update 4.4.1 -> 1.80.0
Date: Fri, 19 Aug 2022 09:26:55 +0200
Message-Id: <20220819072727.2236928-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169581

Due to the changed versioned scheme, we have missed a few versions,
and latest boost finally detects that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...st-build-native_4.4.1.bb => boost-build-native_1.80.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_4.4.1.bb => boost-build-native_1.80.0.bb} (83%)

diff --git a/meta/recipes-support/boost/boost-build-native_4.4.1.bb b/meta/recipes-support/boost/boost-build-native_1.80.0.bb
similarity index 83%
rename from meta/recipes-support/boost/boost-build-native_4.4.1.bb
rename to meta/recipes-support/boost/boost-build-native_1.80.0.bb
index de566eeb82..54c0b2064f 100644
--- a/meta/recipes-support/boost/boost-build-native_4.4.1.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.80.0.bb
@@ -7,9 +7,10 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "76da80f33187a3d9e5336157cdfae12ce82e37eb"
+SRCREV = "405d34a04d29519625c5edfe1f3bac3bc3dc3534"
+PE = "1"
 
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+){2,}))"
+UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
 
 inherit native
 
-- 
2.30.2


