Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C1DFF6E69
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86393.1773779360235666554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMxk8di3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97b7e0368eso395462666b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779358; x=1774384158; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyUaOOrXx762eE5LTNf6llsxzsmc3JRXIfUrSdFJ4oo=;
        b=nMxk8di3eqYKxy78i6tLXHgVxZ2tb5hnL6jJYtF6m2CSqyRfolyfKGkLJ84ItIxbC6
         qIF3FXDO5TaRk7spHtMFV0LvoO3Uv9SlcqvTnwt7UR+yomRk+TGGivxs3yCC3plI+isa
         JiYhTEL4FPDZOLSPNFXpovpOrl5iC7RZEbbs3zQRJ3faAKeMJSgy0X1F05AKd9hTsNaN
         D6JXThyisjhr+ZlsgobdZhvp3xoJlUUyBLWKHyB27kWvnpUTQZzsQY10bOgA9CkcEnw+
         Gorca0O0n9Bvz9owQaK4K5W+OmjZNpDYLr/DVT3yP1q4QaUpjYCVztkaGXP2Ruxs/YcS
         D+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779358; x=1774384158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyUaOOrXx762eE5LTNf6llsxzsmc3JRXIfUrSdFJ4oo=;
        b=G8C7/Co/mbcsNxRtdgsO2KGriDEdDNgbWjZHSDdNSrIPU4OwdNlpYYENFhhWMyvTya
         547N8TgzdqHdzbdanpmJF+LAu+aG7QJ8Np1XKnpDX/iuXI6BCQ+9UlPasaAIAIhWWoZ6
         LrRHy5p9eqPpu7bmx82rC8iXw0f9RQDJsBLpBJerC0kBf6Iub4oFl1GtElIbBLJPtZR9
         EQTb/WtE5FnU8fa+jT0x3crAaExyemeOepkT9k4TerZccmV3IwixxuxivwnZ3cSoqIz5
         ISCoQnzfdRiG9Xpp9671y16C7S1purxcL63z2fbpzbes3g4oZ9XqjfhS+X2Y6bwmJqAR
         pKrw==
X-Gm-Message-State: AOJu0Yzi5diUJiKJNk0hVd3GZgZ8ZuU1eCuKjtj8RruWOr1dk8onPmiR
	n5pa0lEW/H4Z5rdx6MmsQqF1iwj3VEwyYlBbIW1pXBLS2iFP+HxjODpM
X-Gm-Gg: ATEYQzypJv6ZXxmsuMs1RCSUNy1tbVtfItCCJnF1FUXcifdQpFf8/McIsAc+saOd8lq
	nzq9mpJepBBLR3a9nVIA9X3sMtO2k+ATHezYs2XRiKOjaKHCgB5K3W/ucIxk8ohxGeX/EWHrGn4
	99isktbvrNz+HI20bqZiSz0wnsCe6d3HFmqVYHYnE4gBmPgy2YHbz1NGNODBDE6CeBNpLqDMEcF
	blERjFkmuGoObq77Zm99cuNJQXvplkzzWKobsVgdGp18EWfhru032wfXXA0PG4scp5dksp6wjJx
	qIBG2quh8oB8oKNpI7MVCIwuHW5Tw80cvWiGdO6Ha69ht4MYg3uYZR0QUUBiIWMKSYCZQkPi4+x
	3vz29PSG2QCwSiQpDjVDwI2azsn9lCmfRBNOXZOvF33QdCGZXlyOXWDAhhoyppft5g4Vzm6lHMg
	RYBkG6p7bICf3S0pNAwcH7Unyb3tvjqpzg5eKlGcP/8liax6plVXoyrbuzqPFEaWo=
X-Received: by 2002:a17:907:1c9a:b0:b97:9130:659e with SMTP id a640c23a62f3a-b97f4897a33mr35453166b.3.1773779358172;
        Tue, 17 Mar 2026 13:29:18 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:17 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:01 +0100
Subject: [PATCH v3 02/13] coreutils: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-2-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233337

:class-target overrides for PACKAGE_BEFORE_PN and RDEPENDS:coreutils
were being appended to with the coreutils-stdbuf, but instead of being
an append only for target builds, it was actually overriding those
variables.

One could replace `:class-target +=` with `:append:class-target =`, but
I don't think there is actually any need for this to be :class-target
specific. RPROVIDES:coreutils few lines below doesn't use that override.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_9.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
index 984c5b5292..fb254d047d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -66,9 +66,9 @@ sbindir_progs = "chroot"
 # coreutils-stdbuf without getting the rest of coreutils, but make
 # coreutils itself pull in stdbuf, so IMAGE_INSTALL += "coreutils"
 # always provides all coreutils
-PACKAGE_BEFORE_PN:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
+PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
 FILES:coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
-RDEPENDS:coreutils:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
+RDEPENDS:coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
 
 # However, when the single-binary PACKAGECONFIG is used, stdbuf
 # functionality is built into the single coreutils binary, so there's

-- 
2.53.0


