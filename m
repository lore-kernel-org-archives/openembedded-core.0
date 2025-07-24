Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62693C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5251.1753392959766488864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mg78Fd3C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-75ab31c426dso1285975b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392959; x=1753997759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=mg78Fd3CScGJXT32lcZJnKwsH6EKZoLjH00HIqS7sqgorx2eEzFXvLXqFNloeXsri+
         Ers0G4Ih14ufE8ma7N//G2znc8JSv6VvAPrK+tWpD20qH3i/wMxmgXrpo5Stk73FplTl
         uZvTKHb3ElR+wfpW7EHlwcM2ZyOQKdn2I8Vwsl+G+H5lTVijHJFoiTkVUKGhT+C0xIjR
         rTAAWAHltkN4VZHX7cK22yx1MwMxnGZs/8IRnpmncfqx6JwwtS81YpT6mfCxWrR8s9a+
         lCP6XFGA4x3zH05MSJc2IbQWxABpW3UryBnG3clsQMxvCn7cmsjVE9Qj1YUMwn/R5JH1
         6LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392959; x=1753997759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=qY1JnvZt19QHTESIs8ImH0iYB7BxEGLX71dc1NeTxY9LkNr6iaETcOYxCF0rqzCsCX
         YTdX87p345290Pxt7xGkb/Et4PhN4/vnvtXrKdrvWeeLz/S1WLUHE7L+XQko6VTWF0CQ
         ar+unxzQwkrWpZxa1CBxpjcI79W+iv0UDd5Mys9GiCpekgi56fsMUdqDslTIgW0kjFbY
         9+afZpL12vOgt3UIUplzBX+fZk2exiE3FTbSOT+dTyBDa3PNN/g3UPICafT+Kg1Cll7v
         C+QKEU/QT/aN/SHsPTpvswhMnXLWFnn15z3IcI+UeCqc7WqxETeiRyf7Pslzjc9ezh77
         Yxmw==
X-Gm-Message-State: AOJu0YwsaX1W1/pdOTPnfs1nSrlyAAQu3mxIT8xcQ4RaZM8Mw7/tSjlk
	+gL1ei6wQU+TpFF9ocYjep5LA4JjwxibWgqekGd7dMkWgzM9BDmJexX27HjnQTSlN+yeJuZ+UNu
	83hd3
X-Gm-Gg: ASbGncsLxWjykjym/foHZPXucNWFnDaXO/kVO0gdEk2liHGh6AtYMjeKvqF4XosnacD
	Gh/TZX8yu7CeGuYAflONlsfUJarxrPHLOMqOo6JvxYY+2rO69YxQNNBnrjpfafhVvcMYeGTUWXY
	oX1TUFHNWu3uafp++Xw37Gg/M8kjGZyuM1cU20wvTYacLzby2ouo8BFmaABW+u8JYcJ7qKxnvlp
	H28zHZVLyVmDjLunFuLF6Wgu1QIkbIrgcgFK8WRJ5rSCGrE10A1coZ8amWnuwiOGBDE5c9rEM/Q
	pNExbCKBCwxbe5gJuz8uqpMtTICMVF9ajOu1Zb07WCeLljVyeCe78VRhWfsq1+C8y6qOD69PIfb
	HHszx9CqpMsDQ
X-Google-Smtp-Source: AGHT+IFczEaC0IcEAzLfyOGBE0wu/8MsQQU8nmnmExuEr/jNKmzsQC59woHzFhtOM0dL7TaFKrzZsg==
X-Received: by 2002:a05:6a00:a1c:b0:748:eedb:902a with SMTP id d2e1a72fcca58-760353f328fmr11142252b3a.17.1753392958865;
        Thu, 24 Jul 2025 14:35:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/16] xserver-xorg: upgrade 21.1.6 -> 21.1.18
Date: Thu, 24 Jul 2025 14:35:26 -0700
Message-ID: <c42dcbb7f7745769ee5f0adcc62d1e9a6ea20d6f.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220883

From: Vijay Anusuri <vanusuri@mvista.com>

xorg-server 21.1.17
This release contains the fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

   * CVE-2025-49175
   * CVE-2025-49176
   * CVE-2025-49177
   * CVE-2025-49178
   * CVE-2025-49179
   * CVE-2025-49180

Additionally, this release includes a fix for CVE-2022-49737 which was
issued after the fix was merged back in 2022 and several other various fixes.

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html

xorg-server 21.1.18
This release contains an additional fix for CVE-2025-49176 from June 17
security advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a59b385184fb3a548dc27310fd04d64351d8dfba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 38c81f2372..14c45be432 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


