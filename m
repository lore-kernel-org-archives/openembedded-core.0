Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3FEF31E35
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135340.1775748524584884443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZJBb6Erb;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfd832155so641546f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748523; x=1776353323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaF2ZqA6ejmwYl6nT7hja/uhPwl649Cfq1F7Lh+q6no=;
        b=ZJBb6ErbpSLwb+G315wd4zBUu4MMkt8me57yk0kz2+fyNob8Xcg6MXVuW8cZjQiY3H
         8f2Dx2y3sQdamCeegXrT4lDM7vpbxfQzruyZ+1X8g/c34kpagbJjTeRpyoAX7TguN0IV
         VkI+KY3t+rAt3v7OdIW14ysmAhRUn/IHFVzj8l1X9y3C4qGtUZbz2DT28e+ezVMh8Vay
         QnGfksChR/ecYHLHISUC8lswheiDJNtLkeEDfr8G5ASkXTmVJjeVhRXMog84DTxcllYh
         gg4858CVMt0mUNVAlHdxS+12qAtLpEA1m1JPTE6+IxTeW/1DkIOwWIfeuOkOq/dTHj2f
         lkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748523; x=1776353323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qaF2ZqA6ejmwYl6nT7hja/uhPwl649Cfq1F7Lh+q6no=;
        b=P7IMsMdNqVwr+oFAjGUr4r0t30MNz/qDSkJzIZUpsONGFf3vr/Tz5nhdfsei+CK3Iq
         cH7zhNkVjNC4CPnTbu3VHtYPgukIxzD5P7+hc4WT51tRwzgnR4u3/Pr7fogASH7cCgEv
         uyYbxj5SvaQolOyq6+kZePGUS6P04GYX+ZqzpD7WVOaJm/DM8YtBieyOBwQfqnCAaRgb
         xdAGMxEmFVWc3oCiJe8yLhkGiO4PQGztsPbvfxphDy0wjhK2lBE7eLbul5MLj0eESccv
         Zgps2/iWb7gnRCnj8FU/keXzAgl0cEavrYW4j/WLfa3EzgbyDuTVbP3lV5lshYm3lFUk
         jh1A==
X-Gm-Message-State: AOJu0Yx7xTfDc+fHwbz2QNpoUWQ4NIiAMUAhwZ1mkrLHPhXg8lEeXrmx
	ng3/4mUORuaa4e8CttXbPGhUkRkIHv+Jr+oSxZXCd0Vjz1mACFICMiXnhUaPTg==
X-Gm-Gg: AeBDievUUBLm3Eb8APP4WZO4p4/I6C+dB7+NUtiyR9vFQ5bseqwRpY3CXCkgoKxBKXF
	NXV4F7mK5ocpX9nEneAg7o312Hh2WEgkA8v3NJ+CFX+OaPs6yvIqseBcedw0qZOtbcuf8CN//0C
	oRE7dGLOD0LdEkVcoXBDCB0/lGDAGQkpqgHwJekHHum7RMYuce89gkR1z2utIqJmDNqkcxK0dYK
	AP7zb9hZIOtrkeYdLMaBa8JroINJBKxNaI4QFz/6m7WFZKvWNy0orzHyjfg9Ol+0jj61TawkDUX
	ZH4QGni4umbOdtOn37gM1XO3mcf/p59kQ/KRGecz0rO+g08OGSCkpDOh2K4lCX8KisxSdDPuHv6
	0ggUFs68K9LvocACUhBQxLCgoHy/eY1OBNLbYQZg1nQAngSUUgzkaHRYLUVCGqhUIdI021a8FG5
	FPQ3sarc5xxbO+bYW1hYaw0q6VuA==
X-Received: by 2002:a05:6000:40dd:b0:43d:1c39:593c with SMTP id ffacd0b85a97d-43d292e4021mr39256353f8f.30.1775748522849;
        Thu, 09 Apr 2026 08:28:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm67801824f8f.15.2026.04.09.08.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 2/9] pseudo: Add fix for glibc 2.43
Date: Thu,  9 Apr 2026 17:28:21 +0200
Message-ID: <20260409152839.2894434-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234918

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a26a205a16..4d31629903 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

