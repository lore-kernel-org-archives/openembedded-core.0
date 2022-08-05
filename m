Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CAFC25B06
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.6768.1659705176182557441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cNy6kl7A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id b6so1389761wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=X2TAOfXg7YoGOOnAQE+GYx8LSGd2JtQEi9WVmmO0/Fo=;
        b=cNy6kl7Ahd955w1hkAmJ2MYM02P9QaGxaQcIhY6Jjs7PTyM3eBLTmJmfBdWK18DOJC
         MsqlQ3e5zwbktYqD7BA3jH7o58W6g3ytPmtR3nFebp7tx+AoY9RgoOqOSguyXcz/dEMP
         2BpwuhMfnNo76qoWH/eMgEPsihTCdqKMIaaKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=X2TAOfXg7YoGOOnAQE+GYx8LSGd2JtQEi9WVmmO0/Fo=;
        b=gx2uUrZZSiADrAuLLabOOKf64MVDI/1OFtAES1ShqBGJvyM54V+raeOoKa94i1sxmU
         znmgPbIikYXqBrPUMQRoqt8AzycIWGi3CM4uQ7Bzegr03VUxhPuR9kUdvHVXqPGpu9q5
         jyjpyL5ZKC11IU5cVpRL65a1DtVOWOZeD1sZ7wVW6aUhZM+YrwZIGewxP5vZoOM+iJgT
         nNteWYeVBVDnbMVlcxh2/DuCdu5zVF0BXo996hbiT6dauiAsJpgtUzkKSi7CeBawh/8j
         kDApNUCqPxQ5hnkJV4k5Pvx0TvWDRDh41pJwAW3LgSwKHLuCafTlZDMjpclanMnz00yf
         97Gw==
X-Gm-Message-State: ACgBeo16UcTcecNPw6UvZg899saBNskVEu/um4MGdMVOOODB2UHR1Ndd
	EsgPY2OWNkliB+YatZdYPSJKaCYkEiCaIA==
X-Google-Smtp-Source: 
 AA6agR4vEuLLauKz2ASnFhgHDnYA96W1kdHKHtTEhC55irWVIGObBKs5Haxyw1A2NeVouo1Mr4S57g==
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr9343793wmp.158.1659705174200;
        Fri, 05 Aug 2022 06:12:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/29] populate_sdk_base: Disable rust SDK for MIPS n32
Date: Fri,  5 Aug 2022 14:12:25 +0100
Message-Id: <20220805131252.3706794-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168936

The n32 MIPS rust SDK doesn't quite build (libstd-rs fails with an llvm
register issue). Disable it for now, someone with interest in having it working
can fix if/as/when.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f260217b508..0d1c6e18c4e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -45,6 +45,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 SDK_TOOLCHAIN_LANGS ??= ""
 SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
 
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
-- 
2.34.1


