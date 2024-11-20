Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865BDD63955
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13950.1732111067120654190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=luTnuzRo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21145812538so15681325ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111066; x=1732715866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3Gq1LhsgUhKgwT1rSMVnKgKhlzopqeC9HWNPnfFjEs=;
        b=luTnuzRoac9Z0OqrKn5bEmTQGb8ldJNqM3IvvAb5j9B/mZXd8ediJdQ3k3V4qbDuX8
         2bPkLmQKF2TM2t3dEiAjB7WMhPJ0aZ3AFcsQ5EB/ltOAvjrEflc0LzXLD+AuS3R4MBeT
         vdqdIIJdqhI8oEw7o8RIq1eNadxS3xX1ZQHfg6cmKEnQtwXlTJLHS00RDsY1nE7NzEs4
         QYaIZ6ZRBIE0EhPguBvKMis4dzuj3zdEY0r3GUTWvJ3c8wHo1mtLyE43fDHUvJiniERg
         LQUcfMyPsvsIce7y8NFWkiHIsUuXgPPmNSnkP8Z4eRKqilyrlD4+iC9JJvnhZRYBu1lb
         bCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111066; x=1732715866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Gq1LhsgUhKgwT1rSMVnKgKhlzopqeC9HWNPnfFjEs=;
        b=WfMEitS1ruZu7q6kJJtinGdOvJA5bZ/AJjqwjaWa9JKAA0uixJsBG/Mu8lESBuuEbS
         WIex9ADVmmpv2wtyBrgCI0uE59Sj36mF4TO6fxcFTIk5l5yO3fYkTWzRwmyq7KIAmXPK
         2prhOl6EmntcCkAiiEX07Rp3EF+Yo2y8+lWyd8wKA/ALkP2bcyu7RUcx8uT1kxDbEHJG
         r3Or4QZCCuu8omSfm3D0JFPaORDD+ITfy/Fhmb+hV7t1PjT/fkM0fcyOc+aqPeOpVTdT
         Xh1U8dNMZYNsGdP6GMVoLFiPONtq58OE26XJ1tHjWmcNJFMv7q0JuFOGXHPRCjdgShX/
         oCSQ==
X-Gm-Message-State: AOJu0YyIC9wK1Zj4Brn4voYEkxcPF2uoCl69BHbEEXdu7q6c52BD57To
	NOfRCxecPjVNlyNV1Yqde7mYsBpC9K7a7oHoqR0LbD/7nXDTawS4zdDLlI7mp3R/Cv9nb+CgkkJ
	I
X-Google-Smtp-Source: AGHT+IFYZnti5YXN72BA2f6L5JE1F78z3AKFPH9UYfObLxwUBjrc7EFamd7jAWY9TqAT+4Ix7s+u6Q==
X-Received: by 2002:a17:902:e5c6:b0:20c:9936:f0ab with SMTP id d9443c01a7336-2126c37bf16mr30152455ad.47.1732111066401;
        Wed, 20 Nov 2024 05:57:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 21/31] gcc-source: Fix racing on building gcc-source-14.2.0 and lib32-gcc-source-14.2.0
Date: Wed, 20 Nov 2024 05:56:53 -0800
Message-Id: <cc5ce5e9dafbc3b4b1df268342a91c16c8ca6549.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207445

From: Hongxu Jia <hongxu.jia@windriver.com>

While enabling multilib, build gcc-source-14.2.0 and lib32-gcc-source-14.2.0
at the same time:

    $ MACHINE = "qemux86-64"
    $ require conf/multilib.conf
    $ MULTILIBS = "multilib:lib32"
    $ DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
    $ bitbake gcc-source-14.2.0 lib32-gcc-source-14.2.0
    ...
    $ cat tmp-glibc/work-shared/gcc-14.2.0-r0.vr2401/temp/log.task_order
    20241012-064533.415426 do_recipe_qa (2688052): log.do_recipe_qa.2688052
    20241012-064533.463783 do_recipe_qa (2688051): log.do_recipe_qa.2688051
    20241012-064533.805164 do_fetch (2688257): log.do_fetch.2688257
    20241012-064533.852955 do_fetch (2688256): log.do_fetch.2688256
    20241012-064617.823714 do_unpack (2698542): log.do_unpack.2698542
    20241012-064617.871730 do_unpack (2698541): log.do_unpack.2698541
    ...

There are two tasks for do_fetch, do_unpack and others, so there are race issues.

Both of them have the same hardcode 'gcc' prefix in ${WORKDIR} and
${S}, explicitly disable lib32-gcc-source-14.2.0 for multilib

Set gcc-source as BPN of gcc-source-14.2.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 901c47877e0710af50639f688e0bfdb851b762b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/multilib.conf                      | 2 +-
 meta/recipes-devtools/gcc/gcc-source_14.2.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 09546315b8..7bdfcd56aa 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -24,4 +24,4 @@ OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
diff --git a/meta/recipes-devtools/gcc/gcc-source_14.2.bb b/meta/recipes-devtools/gcc/gcc-source_14.2.bb
index b890fa33ea..be11fa2fcc 100644
--- a/meta/recipes-devtools/gcc/gcc-source_14.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_14.2.bb
@@ -1,4 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
 
+BPN = "gcc-source"
 EXCLUDE_FROM_WORLD = "1"
-- 
2.34.1


