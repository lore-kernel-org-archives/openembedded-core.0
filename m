Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB993C54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9367.1672830378198700664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KDs8uNfp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso503056wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64dArQROzhqLq1tU6E5nmHNco2LEF25xhY3D2VVo5Bg=;
        b=KDs8uNfpnWZc6bGMl0nt71HEvjaR7hVZbHZUvtzhLm9Q+Uj0ctcsyOigm/RtgkRy/W
         AwEExjmJICTyHyMqoEYgn1e/ogjL0v7gYB6VYKwDI0LtLrhIhdO1yZ4jygg5PrZZaH0I
         JgEW12TBBGg5pJAWZa9v1NynE85qY9zsB3H0sdX5AsgPr0NlGl+Qye7bGGpxsx3dNpvF
         NfoyRy2dYm61FC4r73CD+m8QLTmr1OjCmmskJdCHRFWeqsRsSNlRz1HrNcRmE5Ji4avp
         WblVdbBqizrT0WqeMTupdgbxXSKHNpXapAKtN8Eja+lsVHjWnVcRgfsfYY+WevQoXh+3
         dBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64dArQROzhqLq1tU6E5nmHNco2LEF25xhY3D2VVo5Bg=;
        b=Q2bBNFYr4JAyhJx0BIMihrBdQMW585VBppv+Ns16iiOj4M6WrXbs2WR+eCwNCwh5ly
         iaB8K4F6BwCjyEVgJ9172eVZ481KJZh9ROgEg1KSmCaRaEiWHRtiovfBVtfEERlKr6QT
         VI6m1xGIMxPlSvjV9cOB7TN6gbdUQkIIeAyb1QJb/eVQ16o10Gd4UUEMLlYrO8A61HoZ
         zpMGoPCxfbdgXQFxwJcP+FzrTfOE7Uq8Pfbv8l06AmW9StiFzy/b2aqWYeR9nGqzKKo6
         QrunIUtkIl8RwUsJPOcuIf+8whh+v7bdSEZ8Gy9hgc09PB9JAxlsoJe29qgWp3KoIMdN
         WN2g==
X-Gm-Message-State: AFqh2krsqGB4kx1AM3W5HyfORT4HiVe8yuoCdSNhuA0+uuY5GFOKCuiT
	/KWt30ikY3WqMn/gbvJQYMOauTMf/O0=
X-Google-Smtp-Source: AMrXdXvWR4XSbjIS+Oq9rh6Z/cYO9ysi18fQ5E5rkN+OEQw0Cm5FcFbYBtHEY0UMF+mKjtURBEej1Q==
X-Received: by 2002:a1c:2b04:0:b0:3d3:4f28:40c6 with SMTP id r4-20020a1c2b04000000b003d34f2840c6mr32513555wmr.1.1672830376702;
        Wed, 04 Jan 2023 03:06:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/77] python3-cryptography: upgrade 38.0.3 -> 38.0.4
Date: Wed,  4 Jan 2023 12:05:02 +0100
Message-Id: <20230104110548.2537259-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175417

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n3-cryptography_38.0.3.bb => python3-cryptography_38.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_38.0.3.bb => python3-cryptography_38.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb b/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography_38.0.4.bb
index 4bbc0904ed..5d279e7db1 100644
--- a/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "bfbe6ee19615b07a98b1d2287d6a6073f734735b49ee45b11324d85efc4d5cbd"
+SRC_URI[sha256sum] = "175c1a818b87c9ac80bb7377f5520b7f31b3ef2a0004e2420319beadedb67290"
 
 SRC_URI += "\
     file://0002-Cargo.toml-edition-2018-2021.patch \
-- 
2.30.2


