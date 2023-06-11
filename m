Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E256C8300C
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.39001.1686499379364219774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=D9RFWQZ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b3a6469623so6266975ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499378; x=1689091378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZZA0azB5FuH0ZdhUaAUAq+xZ+70mF3jFoJyKxGBDHY=;
        b=D9RFWQZ32FNcc01ShvySkDAT8NeseEL+uBe7OvNKDlgbVCTp0KGspPBjWbW69LnmaT
         5Jb3raWZ6dfsrGLXs+/l1UB2KZAWAZ9o1RebSoHPEnPZEBRc1SmLjijEkcjiiVM3Sylc
         Yj5VcERHkVgO9ZWoxkTy0vG3b8l+hsEmPj9GcDK6Tsc50CIIQ8e3MIzkmJX+GqBn3sxp
         hpv2ZG4ND4zlAGBVO5y0WSEzxb1B1Sl0sLibeoUgLrhhl+nivYSlm0Pwm/9Eq9Zo5h+Z
         1LgL87fsA+yUIw2XDm5H1EF5zzMuViHHNAW38McgHYulB6egdq4iilGs3M7mwNSihg4B
         QfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499378; x=1689091378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZZA0azB5FuH0ZdhUaAUAq+xZ+70mF3jFoJyKxGBDHY=;
        b=StbxEJLSEWahGFbrxwG71yX63YoKEyxN+pgRXVtFx8dAHK2w0cYnZIyq87JU9dR17b
         8j1NXrol/Sxt1Oj3AJc9xOTdf+joONCnD1KE1ORppaPTXpDjCjY3XuwOlcv1XORDQDmY
         1WytaX16PNwsqJ1BNvtnN2eqanBBzzgYZZh6GUX3Z8FZM6zpVepG2InM7zaYLT0EgmhN
         yJxDMnQfXpVi9wIQ/rPwNjpM0mk+QqbNgKtfgtE07C++u7xxIM+bqjYN1pKAOgo9q2g8
         RF4IJZc+Dq/+TvFeOEkhMvuehqFJ/vemERnu/jE2pXPQOMvlc6YKxvHrK0VR4NJYejK6
         kpEg==
X-Gm-Message-State: AC+VfDxo48ul0f0il1Jk+P7pWNXp0FV7jS5tXlw65Qo8YFyLmMCDgxNx
	96e4gMrPC4yRJKoL/Utijk1qXKBGMfx5aA05vI0=
X-Google-Smtp-Source: ACHHUZ6Rk1hkia3aNLnd6yMAwsGWMYks1vxDfjsrLUOPjhtIj0dOmJEAX9Ss991wtBZsOyuk/2xwGg==
X-Received: by 2002:a17:903:22c7:b0:1b3:d25a:5ecd with SMTP id y7-20020a17090322c700b001b3d25a5ecdmr169969plg.50.1686499378430;
        Sun, 11 Jun 2023 09:02:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:02:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] curl: Correction for CVE-2023-27536
Date: Sun, 11 Jun 2023 06:02:36 -1000
Message-Id: <4691bc257d0bf2372e31535f0b90cf49ef0ed0d8.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182625

From: Omkar Patil <omkar.patil@kpit.com>

Correction of backport link inside the patch with correct commit link as
below
Link: https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/CVE-2023-27536.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
index fb3ee6a14d..d3d1d2dc2e 100644
--- a/meta/recipes-support/curl/curl/CVE-2023-27536.patch
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -3,10 +3,11 @@ From: Daniel Stenberg <daniel@haxx.se>
 Date: Fri, 10 Mar 2023 09:22:43 +0100
 Subject: [PATCH] url: only reuse connections with same GSS delegation
 
-Upstream-Status: Backport from [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5]
 CVE: CVE-2023-27536
 Signed-off-by: Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
 ---
  lib/url.c     | 6 ++++++
  lib/urldata.h | 1 +
-- 
2.34.1


