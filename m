Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C73CD5C0DD
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.14510.1731077656773927587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeyGK/UP;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4ba20075so1510440f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077655; x=1731682455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezy9MuS8FYmvlTLh1Sk/XvNFUECN5LEfZyqQWwNUr7U=;
        b=EeyGK/UP8lK6s0cu/yZkRxjmSfY8zKVhq1GQt5ApZYHZckNCRzywKj1FM9vNH/IY1E
         xyGuBsbba4hJuvIS04t7UqSg4qh9RBdWad43B0pTVuwt4PcoxXaTWduD2zxmgzSy/R2j
         zYvEIJqbJOWNcPN+avcdFkNeX7NSSz7IX+1H5txSrm23LlExJwvbAoFAkyXtuP/Zgn9O
         GtFfJL5Rl9BPDq5EcWV/AEIC3v7gKikLCQMHAffArbTv9Gi72RN0pSREi+ke4CoO8R/s
         HP8rEX69IQ34KCtdO0/ej1WPoBRsKAK2YyPuLWVWHi3/yZpvGcgttBTADGwXOc7/Ibvs
         G3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077655; x=1731682455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezy9MuS8FYmvlTLh1Sk/XvNFUECN5LEfZyqQWwNUr7U=;
        b=EGFdSEtEBOqwkv89CSjmYwiX3ZbHjIMdJp8vHfJLQjwuJeV2vDj3w8cI1fKDp9nEp6
         O47kA0xCrPrspCcSMMAPwjsZcsQorikm+Xr959aPnrdCogxrCKFAbqj9QxjdMJaHVCEt
         smERX1G8OqkESbM6B1nbq5ToMzqkC5f4kH6HTb2Rl+1ff5Zxco7jdlDTJe+rxhSystgP
         SiQZfu/TeHRrohHXMDwe8JlwjwGBLouDiwBGGYg3gWWfwH9glJeRN1JLaj5IpZtc+zp/
         enJHV1nGiupRgDKhoxzOmEt480CYVGUBqrquQST6YpqX7WPpSDgY3bND1Y4blIGJbqbv
         lcYw==
X-Gm-Message-State: AOJu0YydgVsw7e33AtmT8BT1+AP133vw6DU1qmIFFp+N3u3cv+k55AIo
	GoTVJqxvtG4wYovhVmrFXbbzMhIq0XKXPWUbDPx6p4DwBbOQhRqckptLFA==
X-Google-Smtp-Source: AGHT+IE1gQ8nIng3d6SJlHJ124SjbNqSxMg5lZ+5jspbq8qzd9O6PsFCqrQdX4tpmsMvuj0sSyP1Ow==
X-Received: by 2002:a5d:59a3:0:b0:37d:41df:136b with SMTP id ffacd0b85a97d-381f172a1eemr2519734f8f.13.1731077655155;
        Fri, 08 Nov 2024 06:54:15 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053ff08sm73359575e9.10.2024.11.08.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 11/12] pseudo: Update to include open symlink handling bugfix
Date: Fri,  8 Nov 2024 15:53:35 +0100
Message-ID: <20241108145336.224466-11-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206885

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a new revision which includes "Bugfix for Linux open(O_CREAT|O_EXCL)"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 50c3b59975..b390ca7db9 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
+SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


