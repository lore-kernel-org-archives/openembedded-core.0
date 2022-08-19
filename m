Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A515C28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.51218.1660877005707667355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Tj/rY+B8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id u22so3023664plq.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Ea5/amMPeFQn9DrCko51+hLPEJJfYWIFWcMiemikxGM=;
        b=Tj/rY+B8BHdMUpnEOvMCl7GN2FyfpnDOTctEfaS/hXhOHUY3XLCPAdiZ2RDpjxmfYF
         VMNlVdWhPUQae4J9bYc6tOP3On7B4FQIBGExKLllKsReQ+VDnJ51Hg1/E49MEgu9fmQY
         +4vj6jUvCNL9eLk6WKJQ/dmH2xE6UM/TYiDt6z/KLzcPbcZzgYAu3sLRvIxbpbhK/mSe
         JrZ+FH9PLsD2CqG1U4NAQ7cqnj4o4m8Ed7Uu4YwCwhk1P7MZNyu4uVfDfdm5g73ZY/uY
         xxBc04J0PfhLfNSI09TUmVqZdT9IRlb6r1ur1SBIQTEXCaLLN9LJ0vDqA9lUIQmEnCCJ
         2cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Ea5/amMPeFQn9DrCko51+hLPEJJfYWIFWcMiemikxGM=;
        b=X0L2+OZJABdg+8baYijFetNq6tAKuj+Ciio5qZ8i9JniJ5LaOHwY9upCXNABbuD/e8
         pfJ7Ep4K6WPYPVnC49HmINMaKPqVmMl6AG17KMVcXRnsC/64gglLfbwXfq0RoWCvYmOR
         YzaaT7cH9UvjT55nxA3Bm6FbZ9qlKyf3l5j/FVdGHyZReaWyGr+1YZvcxpGiPF/TNhdF
         v6Swx2CAvRMTFWpOYRnfNlX/jBWuYCzrLLmPyzh2LJLLFuuc1XSMnFoU58+yCp5z9BjF
         SAVQcFjq1VFhSfjYStZinxBAC7j7Vsmx2PRalhILEPCgm495lqGbXwgXGm8kdv3kq+LS
         ewvw==
X-Gm-Message-State: ACgBeo3+ecjKqISornqbt4dyfv+O0sptqcuWXpOLyL3gof+ivFKsdlO4
	mBGlIJuKXYuj3KPsOawp0pjYF5Z4L9EWMgyO
X-Google-Smtp-Source: 
 AA6agR7XCGonE0RtrdgjDRZbtlZK50nJIm7OEV8VHpALpQDYka0yX1cEDNMLQ9FMNP1AAqkofqeciQ==
X-Received: by 2002:a17:903:18a:b0:16f:e43:efdf with SMTP id
 z10-20020a170903018a00b0016f0e43efdfmr5109744plg.157.1660877031798;
        Thu, 18 Aug 2022 19:43:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/26] nativesdk: Clear TUNE_FEATURES
Date: Thu, 18 Aug 2022 16:42:43 -1000
Message-Id: 
 <394c1bb8c8148d65b6188586fd4b6d8edc39ab88.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169564

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similarly to what native.bbclass does, clear TUNE_FEATURES since these
aren't appropriate to the nativesdk build. This saves us having to change
down signature issues due to data in this variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e5079e434504a3a22b609f7ddbb7f4c533c4cdb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index f8e9607513..e46739e325 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -55,6 +55,7 @@ TARGET_CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
 TARGET_LDFLAGS = "${BUILDSDK_LDFLAGS}"
 TARGET_FPU = ""
 EXTRA_OECONF_GCC_FLOAT = ""
+TUNE_FEATURES = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
-- 
2.25.1


