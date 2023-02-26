Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C346C7EE2F
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.69588.1677430972994155422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6tNCJAGL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id h8so1107659plf.10
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XcbdLVW8L4hVCF1AkEep37qY8VajpXWETAjv74rO9o=;
        b=6tNCJAGLKRcYt1oHjZDJYMY/Y0v2tGvgG8lJjRFBxNQHrGBneYkfL4rE02mBJMcj0X
         4k32uZHSvcV1CFjWc8Eepu8oja9uHHkkNq/0yzX8MgEukvOH9/MxJ0YA89ca8KxxRdT1
         pw1V0MgLE8+RGpH/n5F1qWPrBvxLJaU+YXYs0ICRLo6XQyGes7CNBBuIxkSNW9oCDgE8
         njh7g3OrVCw3UsZE+Qzk6bddBRD2x4T82Ercgv5s43nyZFZcmhkBQeXfDoBx7VJbQj0P
         HF87jV9pMl4P9JESZ/mBbLHzIMub+3Ec6l3uNVRjolxVOZk51oEgNAlMOHhLtcShvOrS
         HMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XcbdLVW8L4hVCF1AkEep37qY8VajpXWETAjv74rO9o=;
        b=PckrepK+Kr1gJL4rDu1yQ3SeGB/1RskWfewLLX+tvKoUAo246zzZzqTxcMkTy5crxg
         kAKrq+4hVYhUuRhvBHmVdd5o3cE3HuovdaoPqyK7z8xUDkNrQq8z+AKQmzY48yvq82fE
         HlwMyp5wfli+EN0fvjfHuUhU1wgA6SSMazoRJ4AwbcaUKEPiFruT4PTD/xBh88O3Rk7A
         GEBzeVS7s+EHhg/qfIFK1IRyKJpJfOQvjBBoDaSXZOq+cfWSAZcCGfIkG7tU7gT0X7im
         P1j6/3wzo+f/vmEWEw60whNFd+P9iIxkOSpj3RPjo1qEG5hRwayGsqB6+rWYGqVTrbIm
         gvSw==
X-Gm-Message-State: AO0yUKUAzAhFR2eFqTuOc2i/SmfGhRQ6QTzQA8pSIE4L9XdE/4iBTRGa
	c8Pe2jJTXw9XXhJgqyuSj19+bnyeytFgH31LeHY=
X-Google-Smtp-Source: AK7set8CB/VxPNvu1mmoTSlBg9GQD8baAGVPQvyCz2iYrFg5wg62p38CNtmT+iHHwV6F9jW8TpfoLw==
X-Received: by 2002:a17:90a:57:b0:237:161d:f5ac with SMTP id 23-20020a17090a005700b00237161df5acmr21667077pjb.36.1677430971875;
        Sun, 26 Feb 2023 09:02:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/28] classes/populate_sdk_base: Append cleandirs
Date: Sun, 26 Feb 2023 07:02:08 -1000
Message-Id: <d64e3cf57d80f4f399350d91fc3e39198014f5eb.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177750

From: Joshua Watt <JPEWhacker@gmail.com>

Append to cleandirs in do_populate_sdk so that other classes
(specifically, create-spdx-2.2) can add additional directories

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e6f74b1910a6ddd359b037b975ba29406e1651b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 64a4a58bef..70b3f1974e 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -205,7 +205,7 @@ fakeroot python do_populate_sdk() {
 }
 SSTATETASKS += "do_populate_sdk"
 SSTATE_SKIP_CREATION:task-populate-sdk = '1'
-do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
+do_populate_sdk[cleandirs] += "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
-- 
2.34.1


