Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698FFC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.1000.1660170758018970105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZrVnOpxo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so3484616pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=y46jv7FwurLlwqDZCS8QW+9OfNshW0f22VTDuexrcKU=;
        b=ZrVnOpxoW5QdPZonbLuSkZT0AJX3Ja6xR98jJ3wkM9pWuukweXP7dF56M/Ex/yWBnd
         bl7x4LdhbG5MO6X6xCAuMFeTUGeFM3bC/MVqOnDo3KGP0dCl577AHH9Q5x/YcEtCMNvP
         iK59xHDxd3Xjv2arTvJkMfNDlJFwSmLrnBFxIlyb6+OjRgZMPkXvnjON5CbUxI4y1n8f
         Ksqr9BQiFhforvegKB3ra7Bt4gjU0ub/2/+abQ0I0qAch8HQocRm9tS3kInvWY0DK7du
         ljwe1sJOncfX2MwBnettRsZDXbmF8V90EKyPS36REyjPPGt7fo4MXLPWl+9kOOKKWnNA
         5orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=y46jv7FwurLlwqDZCS8QW+9OfNshW0f22VTDuexrcKU=;
        b=Z0mQ7H7OI2C2n81QeUIN+MoYmPK4qtRWt25/qUA7y19TG/Eec4pIjtVkLf73S3pMwd
         wkpo1MIck7MWYrvkz4GzCV4g0RZfEAJv69232HJXdHTmOdvNUpMKWymJXUmy/5X6Rct3
         HXPc/mdtgU4uMcwQisXM1ZFySGSRzzICJ6I11JLxJX0oZb0Uyzs4nccorQtxDWvCTPVY
         eiEDr+yRfpFp5T7ijrZ0TONl6ycCTroDYj6XXYFHqHKG8lLPnKjfTi5UYy8LSGk6EyGh
         mAOAFAXci+8O7p2hNDvN/yJpdiIqISbqAzJIHArO1whNfzzyN1E8/pMUQwOHBa0YJTvw
         fBpQ==
X-Gm-Message-State: ACgBeo1DkKnFz4CK+ypHLk8eDU0omOB+tAHkVaZIRRddR65EEKlu4YFQ
	SqcYLOOzkQAZoQOKtA4lzaTYjj7UlA4N3o8H
X-Google-Smtp-Source: 
 AA6agR4d/ntkwZDNaMkcB/sSzJQz2vYNGJNj37X9KOAILVHiXxMaw06vwb3XnHnq/DB2weEduFWWbw==
X-Received: by 2002:a17:902:ef4c:b0:16f:8937:6acb with SMTP id
 e12-20020a170902ef4c00b0016f89376acbmr28072221plx.62.1660170757103;
        Wed, 10 Aug 2022 15:32:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] libmodule-build-perl: Use env utility to
 find perl interpreter
Date: Wed, 10 Aug 2022 12:32:05 -1000
Message-Id: 
 <f11ed8c8fd78b88a50f382df419afff6ccde02a0.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169220

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: QA Issue: : /work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/sysroot-destdir/work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/recipe-sysroot-native/usr/bin/config_data maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54ecb2d3f2523293383103cbe590ebdd037ee483)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index a6fd7b1c07..c91b44cd6e 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -37,6 +37,7 @@ EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
 
 do_install_append () {
         rm -rf ${D}${docdir}/perl/html
+        sed -i "s:^#!.*:#!/usr/bin/env perl:" ${D}${bindir}/config_data
 }
 
 do_install_ptest() {
-- 
2.25.1


