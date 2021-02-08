Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.35216.1612792372801538961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RM0+gBxJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id r21so5707106otk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8Y2qyYU4cl9NoWUK0UqOvoB1BQJ4RzZyHK2MKGmA4ns=;
        b=RM0+gBxJuQenYjCi9E/JrkEuWSyhpKEZRtGGGjcAYgS6evvYp6ok/RXKwcEt/b6ZB7
         Qh8r+PURC9OA2+7X/ZWgPPilCl9QuWUJuA9cEPF6zCVxLMXt6zxEqA38W1u3VXiZ4m+s
         MCVoYhNiGew22a0FEo/KHSFQ5EcsrC+TCMmiCqFnLiuN7NVFAAFgNjhpwFA4QTXGgui3
         gP/aJfv0IWCtJqo5H8THKRwwpDbllUMQyixcwwf//Vty+byx5NAUBbr/vLcpAIuUuzqP
         qRlSPtVfp/P63mquZ713YCHAx1n32QgogT233/kz7z+DOJXlLp7dN3e5sn+ZPhH3Ym8x
         Xtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Y2qyYU4cl9NoWUK0UqOvoB1BQJ4RzZyHK2MKGmA4ns=;
        b=WTdBgGYkvgPkfrfRVIhWzeaYBXPA2TKs7xgbCIiHVvMnDnpYipjlaZudcCT4HMeuhV
         38tcpuPnHA1aWS/C4ZVPphIUMWn4OG/UuZBibsjkjSvgcii219rnHegkmYWLTq6o7YA7
         vij6yO3WdsSOjyrWnLAeGd++4MzBRY/uMe8D7jEPmeeRLfyImNhoqQeENHODtkHciHlU
         uRTL5NrBuLzdhqeqsPG9QE3g/ugFR3M8ajttgW5m5l3ROipnOQ7XnFQE+keVFnsky1n4
         Wv4txyJb8ZHco6FPEnxzx/kfBc7O2//FDFGMNKyzLdDBowkSj1OnH8vm7L+zxnWTdmFA
         D+ow==
X-Gm-Message-State: AOAM530QhWy5ccofaAFGyxZSkGlpwQ3af01APIU8Uy5Jp394awWWaEOa
	nZPL+M8rdxOhKI43EuhoW2Qv43S3vlgMePvSOkk=
X-Google-Smtp-Source: ABdhPJyrhCsYnX/UOXUue9tkmTBv/FTYgBL4NqAeWK1B1xI5hP6FEchcB4ywb5V6PHFWuU0GMyUVjg==
X-Received: by 2002:a9d:7d10:: with SMTP id v16mr12592551otn.54.1612792371698;
        Mon, 08 Feb 2021 05:52:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:52:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/28] pseudo: Update to include passwd and file renaming fixes
Date: Mon,  8 Feb 2021 03:51:53 -1000
Message-Id: <a92c60dddc65f316eca5ae8434e2815fefc025af.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:
  pseudo_client: Ensure renames update open fd file paths
  pseudo_client.c: Rebuild passwd paths after chroot

which should fix issues seen in apt package index creation, new
binutils and other autobuilder race issues in pseudo amongst other
issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44d11b56001f40622c055069b0901cc4ae15c76c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 29fa9152e2..0ba7b50355 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
+SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

