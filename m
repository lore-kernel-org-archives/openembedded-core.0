Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096C2C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2262.1743577901209210103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ct7t53T0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso60545425e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577899; x=1744182699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtdr/dUaFVdp2w0lWH8o4vxhr6MrQwS5YCHwRG9ws0U=;
        b=ct7t53T0gerXYqiut2NjYQqAmLJk4ZNJ3NrdcUPLyc2Y1Ix0bzEggG9ZNZomt59HPN
         +Fbok6a6+t4g8lI/xhXfAMpoptSytIaew5ovY6y4SlUM39g9LXJrq7bMEo/e6AAeOGld
         op0um4UxDPlH8x50u6OARPxrjmPK2eZ05JO7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577899; x=1744182699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtdr/dUaFVdp2w0lWH8o4vxhr6MrQwS5YCHwRG9ws0U=;
        b=pgXWtL4XbkvDE6LdSlttgZIU/6/6nsuHuuT8YuWo5IFG6PlOoZ1kDmoTQlVPN8/7g0
         fWapFfrI167LNU2KcZL4MWwBBs1NyqngEdZ+HAUBaUCWFQ70CQMuP7v259IU7ov2O/cn
         ZIuPgnqVO8bgbpvOMTFIpzGHbaPUmg/2O3EfQb8NDfQdC03okOlx3/BuRso0oyrufbH8
         tTHBvtc5RXdYB9O3CshUS7E/JNvzbD/jPfOL9/WCKeIcc7+QRJtXkZgNQaDGaZR+BlSt
         7IzPzfCRgdPtmQRuyq1MkuCovkAUnXP9UiNqAHa6YPrJW2Chv3IRiS0D8gdS874xhHcx
         At7g==
X-Gm-Message-State: AOJu0YwDQh4aKH8sEQEbO5jRI7bAjOoEQIuV9gGmh5ell2b1FPhSSlpZ
	qfLZ0uaHmPMQ7iYye8sXpQBGuWXlJwD/s//TgP82fhSsrxE24ccqdbuAk07uiHomAolzEdfNZw4
	O
X-Gm-Gg: ASbGncsEkCwLCWo8negnPpzHayOF3uH+6QFjPefO+4LZJDGauZUlcxqotjtOF6VfMhq
	c1dboRMyeOdiptz3Yi98pHKA+HhJXt+gjM/o/3zyrz0NoDEQRcI3qy/tUEXVE6g1A5Kc8ojjoXG
	LsEQmTs2LHABDH/EoEOZgdynwGmP/vrnBy4s1L128O4355xnRYlAgV68RWxI088WX3lC+MVxxbI
	6ZhtM//81tx2nXozDorU7Ypf0ZnUKEpTX2nwOiPIrA3er2/bXYargtnCls+H9M0sJpqvhhJNS6P
	rREl7kZ1VaLda7qie1+Gx3mO+D9nv8IciPa4xAYv0R03WipNhg1W/Mxt++erRrMwMAER1habisK
	6yDjQ9+UI
X-Google-Smtp-Source: AGHT+IFwXmZc05QVHoWO3gsrkXjsGeQwtgdB0F27dwa0h8HVjvo84HHcfKHazdHdebB+MYRdpWA2Ng==
X-Received: by 2002:a05:6000:1843:b0:391:952:c730 with SMTP id ffacd0b85a97d-39c120cca4emr12725770f8f.11.1743577898925;
        Wed, 02 Apr 2025 00:11:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/48] python3-poetry-core: upgrade 2.1.1 -> 2.1.2
Date: Wed,  2 Apr 2025 08:10:00 +0100
Message-ID: <20250402071017.2157620-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214204

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-poetry-core_2.1.1.bb => python3-poetry-core_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.1.bb => python3-poetry-core_2.1.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
index 1dd4337ae26..728b09cd7e6 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "c1a1f6f00e4254742f40988a8caf665549101cf9991122cd5de1198897768b1a"
+SRC_URI[sha256sum] = "f9dbbbd0ebf9755476a1d57f04b30e9aecf71ca9dc2fcd4b17aba92c0002aa04"
 
 inherit python_poetry_core pypi
 

