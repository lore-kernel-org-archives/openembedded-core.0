Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D2C0015E
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.11717.1690052242708584219
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XVux9Gc2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666e97fcc60so1775423b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052242; x=1690657042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNLxap/hBjr6Jmuwpr18Eb7WCBTH5tAE00EAwGjeQBg=;
        b=XVux9Gc2yZ12opifAWsC1jE5BS/JcE6DuT/BmoAIUsKNJvAbnlsY44TM8ZKsMMqpZK
         Tk20C8CAi7IL1M96u58W0uUA8RXF7eYZlnA9/yvawCi96nOCoU2N/j3tCOdEUqy0TCWi
         dxAw2h1ZOhARRCO2fTLG7M5T31CMiES8cdCcR7kH2zuNDM1ZibPmwMCIyeb8QlqJ9Lt3
         MYLNKcYpRdUTh+YpGnCmXFRATIZDoT5Ki/ZN0pksOXQCoZpTJGPpZJ8STUezZmejB5w8
         hCoNBgDffDXkmMQcwaCv3eInLASjarzxcKSw5M4/gl9LEIuMZYAqwVaG5auAF3b/TQY6
         AY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052242; x=1690657042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNLxap/hBjr6Jmuwpr18Eb7WCBTH5tAE00EAwGjeQBg=;
        b=Ak/SYWP+Xgy4dl5kzXH85l2ZmDTvdBBJ32/srhgbaf2u7YgGjhz2OIyY1Qng1sa1qT
         tq24XESC0ukr2E82kk5KJvADZglFmCv6Ngyh3cYlIDkR39mmmPZzcFolaAGCcXeLHD+U
         rK40Po4GRY+shAsYhPcJM/DPl8lPY9NGIZjSV+ocHb/qYGyHrxpspKvGyuOHjYuT+YLo
         /phU77Hs5ocxVe6zCoh7upFyFUZIQbd0P1+CPTyPExIV34UqtVM5pJ8GUzTVPIF16BsR
         Wm8VvM56yN3J0HxxCfzSzNakklsp8Qsg3Se038Bxb9i2M+EbIHnjhdF334Wh6i+HpMLz
         ceEg==
X-Gm-Message-State: ABy/qLbqVzFU0UgnfK4iqJQMmjRIaWRjru/qc7U2RzBpPTXlMtOmB7N1
	hB8p7pWspq830I6HtnBu1zfvEjNRzNnPfDRAVtI=
X-Google-Smtp-Source: APBJJlEvoyD2DgNNrXtXXVeKYD94A/gbNydGORBxSi80HSXOu8uA90B6Wm+Uu0dwQJM+bkQDI8KCag==
X-Received: by 2002:a17:902:da89:b0:1b8:2a4d:3eb9 with SMTP id j9-20020a170902da8900b001b82a4d3eb9mr4654327plx.34.1690052241861;
        Sat, 22 Jul 2023 11:57:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/11] gcc-testsuite: Fix ppc cpu specification
Date: Sat, 22 Jul 2023 08:56:54 -1000
Message-Id: <ea3143b243bb979f9b89f01fc2e7826cac0a7d75.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184733

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After this change in qemu:

https://gitlab.com/qemu-project/qemu/-/commit/c7e89de13224c1e6409152602ac760ac91f606b4

there is no 'max' cpu model on ppc. Drop it to clean up ppc gcc testsuite failures.

In order for this to work we do need to pull in the alternative cpu option from
QEMU_EXTRAOPTIONS on powerpc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c447f2b21b20fb2b1829d540af2cc0bf8242700c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f68fec58ed..64f60c730f 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -51,9 +51,10 @@ python check_prepare() {
         # enable all valid instructions, since the test suite itself does not
         # limit itself to the target cpu options.
         #   - valid for x86*, powerpc, arm, arm64
-        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
             args += ["-cpu", "max"]
-
+        elif qemu_binary.lstrip("qemu-") in ["ppc"]:
+            args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
         # lib paths are static here instead of using $libdir since this is used by a -cross recipe
-- 
2.34.1


