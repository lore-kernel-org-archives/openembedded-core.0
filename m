Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B25C54F3F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.13891.1650491497874995913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1ANK7lH0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id i63so2903945pge.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n5bmbV+TjCoqLC2r3BQtlmo2xtq2jjrWusxccTyDyMA=;
        b=1ANK7lH06iRaUQ6LTKyn0+Q01Un5N3wfW1IJL+U0AZj9+qA6IQ3ZlQ4TkbFXJrB2Mn
         GSJC3ae791DpbWZcEKRYQ+xolbjI2YHkzAmmw/CN5R9wq/qnEa/3GHc1caGOyD0PKrEQ
         GoOlQ7qCvHfmWLt7Eh2T2Sq4wvhM2vo49SnGTak+x111YxdhOHQ9ffv1Kqf9lM4nTXUV
         X4+iCgIovAryY5ZCsDlyyE9Jrn4aPfqL0/OOyivG9FMjxPBUdHT4XwfGKNODNwIkvSA6
         V/xBHEoobk+H140hIwIgIQPDI1I7W5H7g7Umb+I/+uhSb9u4qf1E4qebCb1ONda9blkR
         hJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5bmbV+TjCoqLC2r3BQtlmo2xtq2jjrWusxccTyDyMA=;
        b=1WNiskM7VDdPStZkJisdHzcxpgSg+CS54oj+QiltNGTZxPot9hpb4s7Bj81ZDDd6+G
         yL3cbdLingGy6kTxlhfJXJLcTBaiGJ1d/buUY/5iCoRTQYbnTaSWau0jXNGIimFFnlYu
         +FJ7VxtqibPisILZho/dnleXPCdx+sKpVjUJCwXUQXrmJ/vAPVoA7sbHCRjPa64yo+M9
         3DhUWunuTPfqAsgTKhxjk8GdEvTSa7xTAKEiaCoRZUPuX2AEFCf8z4jYIcOweihYym4K
         +Se8EFbjbEYxoGeEsV3lBdZHALaEsPJwCvYq4tYxl/YAHlsLIWmMvQwwvVsYoAO44poG
         NTCQ==
X-Gm-Message-State: AOAM530BZmQa5KonRH2VtXbwIQfI7XgCoiA+Ahb4dKs7AP55UfST6vki
	yFDRaH83diTh1xVmFqXuVpc9IY+pLuOPbo8FE5Y=
X-Google-Smtp-Source: 
 ABdhPJxsOBQyv8FBpSkiGURNpetPC95FJIQ1HXPEmoCkzgi/neWS0FZvg6941xetDMZvWhnZPgTgDA==
X-Received: by 2002:a65:6cc8:0:b0:382:1b18:56a9 with SMTP id
 g8-20020a656cc8000000b003821b1856a9mr21205581pgw.347.1650491496927;
        Wed, 20 Apr 2022 14:51:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] u-boot: Correct the SRC_URI
Date: Wed, 20 Apr 2022 11:51:10 -1000
Message-Id: 
 <4da46e0423a7003fb689a8b6a03f5924b8f22cb9.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491190.git.steve@sakoman.com>
References: <cover.1650491190.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164730

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids a redirect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 879bc5098943cf6977c32555ac31cb21be7b46ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 2233e83da4fab1d6d34517f6ebf5860f4fd5b2a1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a001190292..91fe08966b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,13 +14,13 @@ PE = "1"
 # repo during parse
 SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://remove-redundant-yyloc-global.patch \
            file://CVE-2020-8432.patch \
            file://CVE-2020-10648-1.patch \
            file://CVE-2020-10648-2.patch \
           "
-
+          
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.25.1


