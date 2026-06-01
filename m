Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823E4CD6E60
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:00 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5835.1780337578703923102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Itn+eTBE;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-69d694cecd2so3508623eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337578; x=1780942378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4wkpbYHmIPIGcgL8V6DJM6pxlp3Ok9V/O8yJRme4lY=;
        b=Itn+eTBECWutxr4drB/heyQjfzzm9K5jZ0TsHq0Kw9vq/9xsS7bmL/JSQlCkfzN/xH
         q2kE95CZSomVpCcJQgOWDFT93008mn+6m9nnripHa8ILHXt8uD/gswQHTYjBqDv8x3SC
         W1hF3B6pvm6MYXycoiPy9aKWNXU2md2JqSuzqWNZbvGqhsIt8PfvfMbTcQcvu9qjYEw2
         f06Mga3vVLbUqQPKXs5i62x/b3/rk9fN7Ao14tD0OAoNu+24+wLGZ7bCP+38+W7Q0nqn
         L8GgSzUpLShSULWAh1op6cctgXTy4C1j2QtPRGDmt78RU/4LKhf5Uc5q7oC/nM0n/rbt
         /WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337578; x=1780942378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4wkpbYHmIPIGcgL8V6DJM6pxlp3Ok9V/O8yJRme4lY=;
        b=PxReN6lK2d1FT1A1d7fg5LmKpes3Zp8gC2x+D2xGwQRntsm30uHu3dTItMXRarKNIG
         7LLvd+FgYWzbiUjDI6h6phTy6xGFU/Qjk3K5kx6EF2b8NLgOUqp5i1V4aVgo9mkfLYpL
         nmWze63Ka3KLIieQTIIKzNv8lx9pYywr4gXwSq5VGqUgJBultAA2VTGLdrRKtxJLtFlS
         wwvPicuPJ5vqQSqpAzP6jWq4wX3LNwGqiEHuhNYZ71O8qI7Eur1i7cK7n9TC5MAQTDdC
         gnLXcv/eyw4SE8Y/+cZqc8zbh/UaoQnTi6f7ggMCCoo2OwPXsOQLO9daGIjrqovCR5d9
         zy8g==
X-Gm-Message-State: AOJu0YxD4e6EdVr0c+mGo/aQy5lKFruCquEZd6bdP6eZr4S7zlzvwmhP
	sMh9OkYiCKF7K9UqFTXNFtQEjOUV4gZlxGmOv9yKhUACOOroIivp+ZJ18xoF5Q==
X-Gm-Gg: Acq92OH+frFoFXCM4DKMHANTH7dW7rIhUxQiWoMQ54PqPKZfnGZxK6QHrDLdMVPz9JG
	+PEo3CPb1uLtV0ISP6P2l/wQtiX2dzXZmy3msl+YEUGdLHmCOJAlyjuj8Nti3qgXut0dfeokwWd
	tVEaGmCpT0skoGq5EXVt2GUcINLFnOzxep4IevTolsha7PwTHIk0qVP/GDyZ2zSIp0NVqdNQIU/
	055lPJgLoYXpltp9WnzN9RNhgJ1j6rTd3JHyRvjc5BvW1c2Pb+f+LAl9w1F31+W9p/ok14JuOgp
	KXE2PntmpdzAUlOfoZ8QJjsewH0SenBZY8onc3BRj2bHzb9Vdf8ZBELn5E5MjzxqC2m/90guv+D
	+K2jBHbOS5yghWhOlz+Tcyj4c2FoBr1u8PydAuT7Nik5UCe4soSNdCh1LPkVmtIeVjt9rjmEo3F
	UCD/bxEpWQht2K0eMsUUQDlL04MbXbajs=
X-Received: by 2002:a05:6820:4cc1:b0:69d:d86c:58fa with SMTP id 006d021491bc7-69e104c1de2mr6451380eaf.16.1780337577938;
        Mon, 01 Jun 2026 11:12:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 5/8] ttf-bitstream-vera: Use SPDX license identifier
Date: Mon,  1 Jun 2026 12:11:40 -0600
Message-ID: <20260601181251.123019-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237980

Change the license identifier to use the SPDX license identifier
"Bitstream-Vera" which refers to the same license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index ebc836d801..d086485c92 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -6,7 +6,7 @@ and bold).  In addition Fontconfig/Xft2 can artificially oblique the \
 serif faces for you: this loses hinting and distorts the faces slightly, \
 but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
-LICENSE = "BitstreamVera"
+LICENSE = "Bitstream-Vera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 
 inherit allarch fontcache
-- 
2.54.0


