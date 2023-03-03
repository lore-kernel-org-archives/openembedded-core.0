Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3719DC7EE3A
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.27605.1677860264917639768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OuEPRLc5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so2726907pjg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWzSKx6nI+vmiL8fx93n5TH7au1OwUyLw0JdENbtbN4=;
        b=OuEPRLc5oAi4E/UVfVK9tGMIpugWW9MS9z4LegVJxH5+hkXYbHl+bHpoArBLATtUpg
         RVHoo0RG/XxkQk8BJtiEszIAsYj1Gbq2JFf9SdISDcztjv/zonzbnDK5sSE7MPSeJpDp
         NM6NBTdrDw7AQ66DWec63f3OpGVWP0wThIBzV57NZGxFFS74mwDHMq44qCLQXPt5/7kP
         myYheE2Fss4NLV2702ZcTdaXZZwBZq01S1dDpnEHPYt4lY++bLPlGYAGnHODxKrYOSfk
         quuYEPsMkctZFqRUCCWVWLWSrNfkZtwAsb9C5XpbjepZ0lPglfLWudQTtbg/nviTE8WQ
         Xx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWzSKx6nI+vmiL8fx93n5TH7au1OwUyLw0JdENbtbN4=;
        b=HTHebvoZkcDEZo1NBJ6tQ1YVVu5/ne3sY0CJM5xLJDw1R24JLzwfBouOKvy0Pryfq7
         cnBfrpau0OIqPlNTTsh5xYKeCEJhN8ph/TfQsNSTGwD0KKCWeugIRyK6GBCy5z0AEeYA
         c42M1KOr4SaSsnKxhUvDMMwUA7K0Y2j3UGtCDgmRwRGTl0VXtrKaws8dsK8Tcy12Go9W
         /ApK7KB6IejmxOPLU8hQRMu7Uaxm7LGKrZBw+5PoM0wkQ07ji9tY4FnkuOkxuBtqRpan
         FQ1ClvN7h4NdS40gfLwxPotnRtPivOpfy+wXbd1A8oh0yPCuOxbPmPgxiV0mtwnFXhGo
         aEwg==
X-Gm-Message-State: AO0yUKWoMyjfh1ps9mLT2bpDgVEqnf+3gihMzEqlt0/MfkhOT3Mz8ZLK
	NEG1RgYzasIgbpjsFXsNPOFG3M6zQAdR/QwfCuc=
X-Google-Smtp-Source: AK7set9MsQ0RnahlCGIfh9w+x/U/VlyIOGWWiEgekMEPBLtrh+s1u6PAMLqfMI7rSqko43JngExpgw==
X-Received: by 2002:a17:902:e80d:b0:19c:cb64:dacc with SMTP id u13-20020a170902e80d00b0019ccb64daccmr3057366plg.61.1677860263918;
        Fri, 03 Mar 2023 08:17:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/29] vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
Date: Fri,  3 Mar 2023 06:17:05 -1000
Message-Id: <8cbcdf1ca8bc5fcda25ccbb4063b3f9c5dd8e2e2.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177996

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d77dbe499ee362b6e28902f1efcf52b961037a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9bc6881fce..fcb5cf6334 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1211"
-SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
+PV .= ".1293"
+SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


