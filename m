Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93058C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:29 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.12049.1651248084722509608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zU2qr+/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 7so2972345pga.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jBV2nPoHWRHU0P6oN5vbfaPgp1mjQCX015Drr7nPUdk=;
        b=zU2qr+/yQsOI/m+dxHBrxbK0rmIivcox0nt/qm0PlADT1GbVLAIoRdzwx0S9e4X63F
         gM+mnCMvHmgOKSVQcVzAaNMOpm2KOSdPz9CRIec9HiFvm4pN6W7d9sJNLzt1+ZabswFf
         a8xpwTD818fgZUk5ZrGp2EDDwM8hm8/z4JRxm2pZAUtWoeQ/lsPRb7KXxXHfPRUVtAyx
         hYKoEoJhsYZVHtjD1SZeG05YRd4PSAFJWd2bJ6KGKNacezbTh++2N9p+gg4tsxOobv1r
         65y3ZbPHiQfUkaJ9wo7vCukE5/mYnX+tTvFKJRYyLjExrgoyDHeC6GcBbCjYQH34h74R
         Wtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jBV2nPoHWRHU0P6oN5vbfaPgp1mjQCX015Drr7nPUdk=;
        b=V9apFuse6X79+AaPJN/YYCRFP/+ys80V261RCVwGmo3cijpt11hNTy3qTdjGwrgrLe
         JV3HmBdeNQUkYyyAbFqzt6p21sAJP+pKKzlTPDMmSpw1Qd5P1KuINhBIbXt2UOgKbuz2
         iyG7oHDDLAOqL9noEjiJGyb1kDSpxLeGDVgdMh5zSqoDiveaQrNSy73S2aDnivcesTSK
         c1KVRC3DGoExR38maNAaA+skHWq0QJKMFJI6ZIvTA4NdkCJq2iOUb3udUsoG4W3vkRsB
         9G+UE16K5hx+AF8xTI/OrBi7FQDVwunLKEuF6geT17FpygZJ+gUdxSESKN2Elk84pTZP
         2Gkw==
X-Gm-Message-State: AOAM530/UO3F8Wr5yKXfUCy0pwA1043EVCu3mQmq4+8iReUL2FS95O4z
	dVZP8aDMW2iEQj8x639uHG4BUoJ9x7gepgMkk08=
X-Google-Smtp-Source: 
 ABdhPJyQdgTWQVRLvl3SxAyxIu2CY+dq0/E9kfmRBUp6NDeSml+u+9ehdOiulEG1RE02YV/pi6RgDg==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr28461pfu.46.1651248083378;
        Fri, 29 Apr 2022 09:01:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/34] python3: ignore CVE-2015-20107
Date: Fri, 29 Apr 2022 06:00:21 -1000
Message-Id: 
 <f525745af38b0e5ea26693849cd4f19c627efd46.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165021

From: Ross Burton <ross.burton@arm.com>

CVE-2015-20107 describes an arbitrary command execution in the mailcap
module, but this is by design in mailcap and needs to be worked around
by the calling application.

Upstream Python will be documenting this flaw in the library reference,
and it is likely that the mailcap module will be deprecated and removed
in the future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85fac8408baf92d8b71946f5bfea92952b7eab01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 7eaafe34ad..d678d55083 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -55,6 +55,9 @@ CVE_CHECK_IGNORE += "CVE-2007-4559"
 CVE_CHECK_IGNORE += "CVE-2019-18348"
 # These are specific to Microsoft Windows
 CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
+# The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
+# The module will be removed in the future and flaws documented.
+CVE_CHECK_IGNORE += "CVE-2015-20107"
 
 PYTHON_MAJMIN = "3.10"
 
-- 
2.25.1


