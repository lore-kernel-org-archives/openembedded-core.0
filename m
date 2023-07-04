Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47A7C001B0
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.61498.1688484618312748896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IxnXHmf1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b80b3431d2so28683585ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484617; x=1691076617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQoX4jnlKMqDN1+3FnRytSOGorI0NkoIf62u74otw5A=;
        b=IxnXHmf1cwGcqCKzURq41/wWE1aRE0e8LK2xP0Y8TXP4QpWPGwnjMbNGTMK/ivvPIC
         RXrt6Ue9VsRQJ6PlBGrM5Sy02Z84i/Cp4Q8DP3AEqIpiq/MJuA6V43w1Hxdz/B7/P0Kd
         +7H+fg3Lyzqut/OmTNXK0FtZrlNRwm2SEOZhje1GINXwDSBLLIip+bm3wYz1HqDhiH0I
         r7xyYgEJzQDkdH7Hu99Wd6AjGHUPSdL6JYvVrxGXisA/GDFjPBiFaobEda4x6yuMaZgD
         bC9a7jrlfBEo+uMt6Xsm0eM/SIzSOYsgydGTcLQw/LZ5KNNjdSbvVq0kbYcfQh4aN7lW
         N45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484617; x=1691076617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQoX4jnlKMqDN1+3FnRytSOGorI0NkoIf62u74otw5A=;
        b=cHFuZc/41vWSBv4KBjTX3ynPe700X/Nv83BXCJzDCc/Z8A3S6ScqXXhRlq1qLs14W6
         /Q+CbWFeUZuUaj7RbiuPzkA741qFMIhyHAyQ4b+nH+q8SC/RZ4Y/0Q4rVlFOdzg9LFy6
         Pt7EAQMmhPSxngY4246iTOmA6vDOfAxuh5zpRiJ/4+uxvrDSSnRzr8GJyf/Foqn3aXYZ
         C0zMsBZ8/S7nxu6L4isZhEfDVfVxvfdWEQR8546WGLJ3Ek9q/ZkoWJTgporo+jsT1+h9
         ciMqxR+7evUAYUieWJQbF/3ThvnveSXVX9PCmJ8KnQEqxKQ5AyYKODT1bjQuo+gFNYgV
         d1Ug==
X-Gm-Message-State: ABy/qLbVLMI75cpQCUKM2czBgMkhGphwNLomg6VAfJFV1qHK89Xms+vp
	myodidpEQvWEJTAAVtaTd0PQlhYnTA2avCpAk+6kSw==
X-Google-Smtp-Source: APBJJlH0LlfYravw9smEreBtwkfQ30x7PGL2Fcm8uExhHiDn98+6Eqfj6pzeiOe0Eeskgl0wLg3b7Q==
X-Received: by 2002:a17:902:e852:b0:1b8:d4c:70b with SMTP id t18-20020a170902e85200b001b80d4c070bmr13704369plg.7.1688484617372;
        Tue, 04 Jul 2023 08:30:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/30] python3-bcrypt: Use BFD linker when building tests
Date: Tue,  4 Jul 2023 05:29:21 -1000
Message-Id: <353b9c765218ed631fc14a406fcdfe1c36a8237b.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183854

From: Khem Raj <raj.khem@gmail.com>

Some of the tests use symbols from libpython3 e.g. PyBytes_FromStringAndSize
but does not add it to linker cmdline, its perhaps cargo which
should be fixed for that, this however is not something we can
fix in OE. So switch to using bfd linker explicitly when
building with ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4392ebb512fa48168a48fbff3e9140a8e1b7ec4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 9f5b81330b..42d5d4dfce 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-- 
2.34.1


