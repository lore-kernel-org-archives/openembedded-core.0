Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF858C02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.28741.1736801250187024297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0MoqhXqp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21649a7bcdcso80742215ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801249; x=1737406049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG0dTBHSr0nONIybrilem9SxA+OmLkYubYwSBdRRKUo=;
        b=0MoqhXqp3lMBreRdompuaG3qjljTP+Hdh5mVezxmF8B1L9mhU/8Kd7qB7ZRT03UgbG
         5WRukhg++xJieJs6kgWCxM+n/wV8ZFV6O0PTlou8vR8pRxjaMdI8F0KC7Rzd/UrRmvxD
         pW3jLjVBq+Bsd5a18QrC5+aMlUEtJwxWk5boMIvU/2bEoaHEI1vx19zlLjlGqELDAN82
         sEjiKq0pGaJ4OBwar2iVS30w3rqgOwffrOkdBaQzGlznLWlWNdK5E6XdZ6TBzza9R+px
         1vv3a47zGr7qsOOuNBhB/TVVEgaQwR3PNLUgbcvbbF59NcA8RLm6wZKc+weDblljulBb
         bAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801249; x=1737406049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG0dTBHSr0nONIybrilem9SxA+OmLkYubYwSBdRRKUo=;
        b=fMhzurzkbtp7AIZAnP4K26tifA1dZilP58ywD3OwJplw1dBdMNkFveoO9prCTdew6a
         dzasbWLNzuJ54CL+lM0wPO2ySb3fX5JmAoZwjz7StC78NbLvz0TSD833GPY0/BSemsUy
         WqYgSKNPyMuV/JoTLK/GmOYdce+k5d5hfSSifV4hI5OoIeEMVJpjtGiEnsX96Bh+r0qP
         I7NWS3WW3ZzXny5BVGtInwNLO/pFYnsteP7G6PhUCup7oqWumTCSTnY0sbMAtUSqCyEe
         S71MuwYQlDRLheIhJry/as2XBp8dUj33+UE90aUHhvuix/7+4i7wRrA+56YdjqeohheF
         8jKw==
X-Gm-Message-State: AOJu0YzRicuitBE74Dml1vEv8H+cw0+mbPzyVLpZM+crZQYNvzErfBY6
	y5TAQvG98Vt0ebkCRgCQ9dtMaeG36AHPbTkmpbO6xg+UG0ZeAAGwyV7HZBdwjnXyDL2D6GUg5AH
	QqVA=
X-Gm-Gg: ASbGncvazUlY6rNbSUOVKWnL9WvL8KaE3Lw/8tJh3VSpkAn1aCkQtean6h1fz2YRDXU
	3/n3pDIg7SqHno5YX0Qr9462MITnQlyu/LHFrB8jWZiiDxdDu9WlDnIqj7Ti25S0g8bZlh4WPRl
	A/u2zuII61gfm+ZhbneA3oCVxoeIpUQuzA3hmwmvu95vQDw3yimo7wY9xbR5GyuuOfRZLTZr3Xk
	Q4VVVXNnianD+5pYQbySDtLX/rY7Ie6DEOFUJl7jTI3fA==
X-Google-Smtp-Source: AGHT+IGIXclaMAIILWiM8Ei2oajvnKTyEE7pOTjaVTRhIdvX1Gvtira6Q3TEXRcmcPA0VZelDmbTBA==
X-Received: by 2002:a05:6a00:3a01:b0:727:3cd0:1145 with SMTP id d2e1a72fcca58-72d21f303f5mr28648176b3a.2.1736801249452;
        Mon, 13 Jan 2025 12:47:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/15] linux-yocto/6.6: bsp/genericarm64: disable ARM64_SME
Date: Mon, 13 Jan 2025 12:47:00 -0800
Message-ID: <93000533d5ab0e808e020b05234dbb9a538d65dd.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209752

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: disable ARM64_SME
    Date: Thu, 21 Nov 2024 15:53:35 +0000

    From upstream:

        arm64: Kconfig: Make SME depend on BROKEN for now

        commit 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc upstream.

        Although support for SME was merged in v5.19, we've since uncovered a
        number of issues with the implementation, including issues which might
        corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
        patches to address some of these issues, ongoing review has highlighted
        additional functional problems, and more time is necessary to analyse
        and fix these.

        For now, mark SME as BROKEN in the hope that we can fix things properly
        in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
        very little extant hardware, this should not adversely affect the vast
        majority of users.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed7b6ad39bdab4e67acc7a5841b4519fd15a2dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 99e8248c72..b02aeb2d08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "67f358194225f9936b9a98ee9366417597be1769"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index dce2633842..0990260ec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 924a9c709e..c6355ff33d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemux86-64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemumips64 ?= "9b078a376adbf198325e1569246106e480191063"
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


