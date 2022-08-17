Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7020DC32773
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:04:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.25905.1660719889403816001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TrkbsRy8;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 20so2655594plo.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Zr/IioYxefY146biaSOgUxWg4L4QhWnmts7qnlLavHQ=;
        b=TrkbsRy8nRe8a0fknVVq9fXQuSOQvfNBCfW8WR6C9jwDrgLif+QfXXhXXz786dH18h
         GVHVC2viebrCpZRRlE9wGzDt8NN1OC7/cf5jM0lWxXl8DiFSotQmDM/ua8ur0jWxtDZ7
         qGpeJ3XQHVKGCytCxC3M26mpK5HLdien5iGUAm8QzaGoAJtyu/RizpIFZ/7vaCrds7gq
         6bnpaUryzThiY4zyg4/xsfjarMn1sgCDc/Qsi+2rXMoJKn9jvdJcNKGOm9xuAVv0Ov0a
         3DQX9Uk8mV5ePYSE2IKI+kgMXNV3Mb4TG4xG4VYoMwJLwR6VP05hSXuw62+J3oR+7uy9
         JWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Zr/IioYxefY146biaSOgUxWg4L4QhWnmts7qnlLavHQ=;
        b=wxaUwfKn9Frxv9ceQhHfIxcM5lbGoX92oQYxE7xuSZxJ3CZcAHUQSmfZ95Bb2+4ket
         vlDULFrEheyn7fIHow59QVgkZmeAswQI1fzB55ymOlimrnLFU3bhagMK9RpMEn6PCSH8
         1tACWYUkMJwO8mXPQo1RinlHC7rAIaklA0lAvB2CczpEo02i/5YyMl+3mK1x3TFbkf5/
         3LjqBTtQ/LpQ7wYD7VlZj6vlVS99uVtXfmXgcXl5iNGtT2VkaxAT8jxNRhPGM893EY7l
         483uBYOA8UmpCbhVKxAD/A39FxTKkzJC+knJaN+stO1wHAtOXdyg0wThDeGUNiJF36UB
         NQTg==
X-Gm-Message-State: ACgBeo0fuSs81VaUNVqumZciS3meSPHyNj6zl95hhaXARbaWW92Ctbkf
	Ybbu+t73cVpz0oOuY2pFQfmIwY+AzEHAjA==
X-Google-Smtp-Source: 
 AA6agR7oCBXxlMuiHfxIlZOxHoWDmwuXADHatRbnLz8WCon6rWhcEqzshpSw2501awHoBVclejTypg==
X-Received: by 2002:a17:90a:fe92:b0:1f5:1b0b:1cd7 with SMTP id
 co18-20020a17090afe9200b001f51b0b1cd7mr2328734pjb.197.1660719888329;
        Wed, 17 Aug 2022 00:04:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 2/7] binutils-cross: Disable gprofng for when building
 cross binutils
Date: Wed, 17 Aug 2022 00:04:35 -0700
Message-Id: <20220817070440.537761-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:04:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169467

This does not work in cross settings yet

(From OE-Core rev: c9d484092060f7e8431e31c64d98433b4f85c378)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 02ec891606..835d4fa69b 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -16,6 +16,7 @@ SRC_URI += "file://0002-binutils-cross-Do-not-generate-linker-script-directo.pat
 # and mean the linker scripts have to be relocated.
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
+                --disable-gprofng \
                 --enable-poison-system-directories \
                 --with-lib-path==${target_base_libdir}:=${target_libdir} \
                 "
-- 
2.37.2


