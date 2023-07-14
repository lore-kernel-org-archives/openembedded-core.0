Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB61DEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.828.1689374026457817009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=P+vwzzwQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b89114266dso18826075ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374025; x=1691966025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfgumJdy0r9SgEKVOKGVHZKUK3WO7ySTQCVsD5YBMSw=;
        b=P+vwzzwQy4IcFhQOV8nyc83+Waizkkk06mNBETuYH8Xo4nV8Qfe5uby2PERUEIRsWf
         JtaXdj9xU38OxkQ755I3BMn6bcNo3a7J8Fuz2uo/ZiI/m0ucJeOxNGKQvxHwfKa/sc41
         eTEwXRxUZTQQF0KaPkhkTLVeT6sFtlrurSm1RpEfRwPLas/07fbn9P+fTXHXVIcU32tm
         VH4EY/aeQl/mOF6iE7DiI8fecJFNbKmI64DX5EGBxmHk1Ori3UNGOgOqxsU6I1KWUsI7
         LHjGmX+Ff4saLGwh8F7yCl7DvMgpmIMJj8l0fSMZUUeKlo4ezIakmtY68Iyw6V4gAl6J
         mWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374025; x=1691966025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfgumJdy0r9SgEKVOKGVHZKUK3WO7ySTQCVsD5YBMSw=;
        b=DmttU8S5CArpZ/chUAT2W69PQbhl1DLVxk5c0Jbesv7F7RgVREu8nc10GQ2wyprnHG
         i+1I82SEA/E/PifeNbsB5dgyvaYhmI7l8irFncUBRH0qSzbnedAHHRBvgWoHPmXk8hay
         rZbuSWupwBoLELdGyj9l+MCmIh0vkVy3iphbUUNQKC3gAB/LI+pDEFbsCWqfg0BhpOK6
         aAYWL8Zam5JViMWtSa/29TbS2l1lZyKB4VIQL0j5X62H/aaf1gkAzTSTbqpTJ4hxS19u
         owdtTKad9e7blYwGxpyRTUj6K+5Y3k2GPxaGh5/KiMG6jrhc4ZMeQe7kbQdfuPl0XC96
         HsdQ==
X-Gm-Message-State: ABy/qLYkaQkCuyI/86BQ3zjtOeQod7bfsvagktJbK+y/Ewqln9hQLmbk
	/nYjqoXn6dSyFPD78lA4Kc/7vScyIzEwAak+6Wo=
X-Google-Smtp-Source: APBJJlGQr8wacxaK+OHUuQ/1AEfTa1cKubkOa+pSMkaHLpWYeOpQJjsweRa28dQZb0l08wpLkXj1Dw==
X-Received: by 2002:a17:903:230a:b0:1b8:b41e:66b4 with SMTP id d10-20020a170903230a00b001b8b41e66b4mr6610720plh.67.1689374025455;
        Fri, 14 Jul 2023 15:33:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/26] rust-common.bbclass: move musl-specific linking fix from rust-source.inc
Date: Fri, 14 Jul 2023 12:32:50 -1000
Message-Id: <967d847a9815df43d0c92ca61cc544e1fe5dcc03.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184298

From: Alexander Kanavin <alex.kanavin@gmail.com>

This needs to be done for any item that is linked under rustc,
and not just rust itself. Latest python-cryptography exposes the issue.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3811228747590ea06e8d68be4785d45ec9c478f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rust-common.bbclass    | 4 ++++
 meta/recipes-devtools/rust/rust-source.inc | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index e0cedd7aa2..878272721c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -158,6 +158,10 @@ WRAPPER_TARGET_CXX = "${CXX}"
 WRAPPER_TARGET_CCLD = "${CCLD}"
 WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
 WRAPPER_TARGET_EXTRALD = ""
+# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
+# when building MACHINE=qemux86 for musl
+WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
 WRAPPER_TARGET_AR = "${AR}"
 
 # compiler is used by gcc-rs
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b25b5c17e8..0534e59c35 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -17,8 +17,3 @@ export TARGET_VENDOR
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
-
-# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
-# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
-# when building MACHINE=qemux86 for musl
-WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
-- 
2.34.1


