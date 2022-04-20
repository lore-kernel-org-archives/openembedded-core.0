Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C80C636C8
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.8224.1650463758351154223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J8VXqcDC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id v12so1869942plv.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8oSkE0eEbl2BxBCX5uk8tjTNqkTehLPmU+nDqCulut8=;
        b=J8VXqcDC7X39fa6MLXsyk1u1w7AzKfXztMWpk62tdET7PV5lBVVAl/PMp5nimgrxh8
         gDPbvJhKpF2iYiPsbeUCRNDuyU67ZmM7V83f5W8NlEU7DZCV3UQq70sYqS4Xcxp71EoO
         BVAGm/HByrxTkEOMM7rT/S2ZfytZIM+CG28gkyYo8AYx4kp68yB3Rg1cfssT/XfC0t32
         PuFRRh1Up4+Liwswy6UhUWY4tkzm/cOOaYW2pS3umrhc3L6IBFJ1vLjUbacZOwzlgvD8
         hMTvbmpDRwitLLmX8VHIMiJwGlVFTuTRAl6W2/xTLP24BTT7I8ch9Ax1EX4G332kn3KR
         vEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8oSkE0eEbl2BxBCX5uk8tjTNqkTehLPmU+nDqCulut8=;
        b=BOzOlsRDJ6NFKRqTVZ1d56CbZ6b8mwuED6E1Dhhx7h8gOAL8h2b20NNj5ddnRoWWLS
         +9YWSjOc67oP/ZpxNaOZW+MHRaGad3NsZ7XtnJAwAOoJqwDEVJXHc3l/lQEzzXEJC9jf
         Gq+6h7UWnKul3Xb9N3kV4OKxnM3oY7ZiWaMTYhczQ6xxtQQkVnZVay63sx0MEsuPlY6p
         vdqICsrPtYS6l6D2KEFl/k73GHA5v5gbZX+VLKrKenXF+P2k1ntEt6jDvRTLWOGBM2fl
         xATK9U6YE+27TUuMlkJx6+yRTT8GVoGxJENjUes6IvFNxQAEfOEOh4W3NOTOoxLXX8hR
         71fA==
X-Gm-Message-State: AOAM532BATSvok7KV/IncXaAIc0+YKD5GPrtQACostKi+FCeiTPRB31k
	Rf3/LkIWjRu205Kf6EElxUMHMWYb3dqg+aWv5+0=
X-Google-Smtp-Source: 
 ABdhPJwIimsuxNiwQF0qaENThPhjw7PmxCCzf+1U9LAEYE1pIbEbfNmyMitBy2niWkxH4DCk/MMLNw==
X-Received: by 2002:a17:902:854c:b0:159:a70:deca with SMTP id
 d12-20020a170902854c00b001590a70decamr11520152plo.142.1650463757211;
        Wed, 20 Apr 2022 07:09:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/27] u-boot: Correct the SRC_URI
Date: Wed, 20 Apr 2022 04:08:04 -1000
Message-Id: 
 <2233e83da4fab1d6d34517f6ebf5860f4fd5b2a1.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164684

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids a redirect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 879bc5098943cf6977c32555ac31cb21be7b46ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8e78ea4a75..488b923737 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,8 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          "
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.25.1


