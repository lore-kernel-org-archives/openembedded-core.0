Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5B3C77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:17 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.10388.1681572428402728457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BnfY7Vho;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b62d2f729so433809b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572427; x=1684164427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR8eyXG3SUI3Dy6xjaxgVB9PeDUcBvWiIVNl95g3fqs=;
        b=BnfY7VhoN1t+ws69MTbZjk3dRzOw9fdvCRf3sAn/+KluAI0nkZ78qyBD6GahD3nWiG
         CBzUz/+gONbazzY/y+P/fxpVog2iXiJOAHPdWfevjtmeGAKPJbip5N3BGz5lJVLWUo4U
         g8FnrvdfG51MTY26pg+x1AzRAibXO9DDuWlsZDcaX/9QQeipT6aeQTtnlurvemitCgJP
         3W13uST0hU01WAeJ20mvY0Yz4OoYVksJ0E6Fto4ahWg8OtyLNsde74slbJowVh5X5BeZ
         xqj9WSWx0IMEvN2TCEyKAIO8hQ1FRmp7l5qrzznr6n16woGUfiglQccsJAULo9xWj07e
         Inhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572427; x=1684164427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR8eyXG3SUI3Dy6xjaxgVB9PeDUcBvWiIVNl95g3fqs=;
        b=AmRigIR30Rn7HAMMBtUSjnal3zJbmjkEXG2yFMbmRh658ysQbaFva+oMdRKo4h1Co6
         y4ZpsNGbRzqkQZvpaSWoD/r5fYn56zX/B11aMGbbhHHfSf74i5JHJ3+TUyqwp4aZ2UiE
         MiWCaOohw00VRR1whCXWULqfkIvGfX3hQtfF17ymEFImm/wou1zlktu+WswcK4ZqCdiq
         90taT0s6CN90KcjLINAC+EDhDXgXfXlgby7/nABWn0jSmzTfCnDzeEy7lJTZxzzkInuW
         Q0vcNde2o1TAYFSCMr7WOrw25Gf8V9EvyL/ALF1NnamZ6399WdIN64cQUgpyit1EGg9N
         EVTg==
X-Gm-Message-State: AAQBX9fqfBrOfRM1+5RLKVTfImNXj6AqkvhLB0Uj2p7VR3HvkvAJ3DJE
	Sn0AZMMmpl1688yc26VJcYm2DoO5AdBKbr1QHq4=
X-Google-Smtp-Source: AKy350b7EYb9ovC4yNzvJKUjFH2GrDYFuZHRikKxiZOUu3OEbRVP4F536/OD37sgAbMosqVcyaa5dA==
X-Received: by 2002:a05:6a00:22d6:b0:625:ebc3:b26c with SMTP id f22-20020a056a0022d600b00625ebc3b26cmr14380823pfj.22.1681572427384;
        Sat, 15 Apr 2023 08:27:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.27.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:27:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] openssl: Move microblaze to linux-latomic config
Date: Sat, 15 Apr 2023 05:26:43 -1000
Message-Id: <26b4db753c4f2080a132fb176b514efafa3ff8e3.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180016

From: Mark Hatle <mark.hatle@kernel.crashing.org>

When building with the previous a number of atomic functions come back as
undefined.  Switching to linux-latomic fixes this.

(From OE-Core rev: 88d5bf78ffb1d120df48139b1ed3c2e3fa8310d0)

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
index e1f30d7a47..82f3e18dd7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -80,7 +80,7 @@ do_configure () {
 	esac
 	target="$os-${HOST_ARCH}"
 	case $target in
-	linux-arc)
+	linux-arc | linux-microblaze*)
 		target=linux-latomic
 		;;
 	linux-arm*)
@@ -108,7 +108,7 @@ do_configure () {
 	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=linux64-mips64
 		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
+	linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
-- 
2.34.1


