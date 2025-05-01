Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C57C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 08:54:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7183.1746089647041912492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 01:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ty8IgVoE;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb39c45b4eso103140066b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746089645; x=1746694445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOi4KorQqfUG1/r8ujZJT0dN5WxHXXPgvWjEHat8f48=;
        b=Ty8IgVoEBlNZYWZdzKZEhWsAQcsdR0ELYDLTQ1S84R6/Tj+SnGFUf/s+NmpcOpRk3p
         cr6voc3iB4ra1JJIJQRrGc0n1sKSPQIPeAmfIRZIfRj6umExvfakhj4m5Qr+ZQMRazUS
         doW3gjZUjqZZxNQsF1AqOERsqvomnuOfvcbtxkr/IizXrdEiMUsLvINTQDG2uK/shGbe
         QeRcePyUJA9/6NrBZlKEuJeepPtg+YAes9ieVkJJYjlbhzpiXKzMhNm5Ke+rMRE5e4LL
         XF1B5V85hYD6788QFA0bb21o63dmqgyzPY5xjqyz5qUcduQMYVjNpmhZ6aw2KYwkAMfj
         UQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746089645; x=1746694445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOi4KorQqfUG1/r8ujZJT0dN5WxHXXPgvWjEHat8f48=;
        b=EGausNhAT2cuhYSMII2ucqDbwowLryz+ScG+NOAOwNv5rk1nfXG8oVlHm82E0sQERz
         W5fxf7LrAwAohrn0EdzmnL6eOTtL65uMMuzTlAzuTNBKy4zemCYbxlWS+QVwiex9uqti
         Yv8fpVK35WFPumCiGFJ/DZuiQw5gh2wbXbmz6giCKlepuptJlaFxjDqBMZoRa/zZ0HKJ
         k5B/FV6/Ny8spfpmFs6TFk9mHEGob9AtuTgXWgXd2E9INqM7xwyC+XXeM1aeSnmM1HtE
         GGMNGMcgGWXniHsTC067HH79Z0pn4NvA5epwHnYoT/tUgu3YCuuSlRBCoMbyykfXJt6j
         wPSQ==
X-Gm-Message-State: AOJu0YwNDelcMTRbB007DBe8loV0L8tjYf2wtOHC5CtXoKb5LGwVKxZH
	wm6FZtL43Aeaa893aU/nhRWwClyv86mm2CufxNgr0wDvhLVywIG4/ib6zQ==
X-Gm-Gg: ASbGncvEiHk8M1tYj+vWl6WJXFmMGGVxAPvtDuq5ei0nbjReOZgmbMabe9uH1Esv6kg
	Xpo28iQe8k+MZi5aD3a9Vw1TSGC7+gtTdFvI5wkmu2U25iuNi9EwhKud+Nk4/WsLcGn/fvlmJ7a
	FMuZthbBwt2w6hka3BsabxePBwzFV7PwdFqwi2HLk313AiWhQDe09UzB0KhpO4RZeS0MNQiSGDt
	UJ7qUIQ8ySeQsZxaJiIifSBRub5E1/SmTVflGnBP65vlaLNPhPQ2MlMmhLfBiILfQASZRk79jLa
	pbV0ZZewamdDo7H57BkLefz7/cNVO+ShB7y7anaDpkfppCVYBsYEDHfa
X-Google-Smtp-Source: AGHT+IHVXo0/9aAm7gXBN59uflcDw1YMUWczDG0cJ2V9BypY7c16+EGOmZjUCOiTDFXZ6W5JlgnqzA==
X-Received: by 2002:a17:906:c109:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-aceff41bae2mr139955866b.21.1746089644951;
        Thu, 01 May 2025 01:54:04 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da51693fsm10993666b.106.2025.05.01.01.54.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 01:54:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libmatchbox: upgrade 1.13 -> 1.14
Date: Thu,  1 May 2025 10:54:03 +0200
Message-ID: <20250501085403.2693001-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 08:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215766

Includes a fix for the library version to match the tagged version in git.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb} (95%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
similarity index 95%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index f212eb5e96..87ec4c812f 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-SRCREV = "35cd78efa3120efc46497f55c04382be960d1864"
+SRCREV = "04b214a0d5cf8285e196d90bf2332626b12c74ef"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
 S = "${WORKDIR}/git"

