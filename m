Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2951C32793
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.476.1660894087143332176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HxP+5M5w;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a4so4190480wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=oeCQqJV3OgDK4A6dvfaY1oUNP5gbSRtPqnLN7XDTefg=;
        b=HxP+5M5w1KKQFksi6FMbj6BOULT5noEOm8JWQxrOgy4WE28dyPU9DUUQ+Ym+Vk625N
         B2Nba+5LNWjhkHOOnQhKa1ZzPSp9k3sni/7qnpJ7fitVLYSMp6HlCzWEkEu6qBd3OA+R
         GZ37s3I9fzCSxRoOs0izHF4Fum2FQqR03U+95vO8dGuw/icBSK9UERjD3Jot8AxoCw+Y
         002Di7nggwqbkmQv6vz52bpDsI30vkwgRO3ynLdA9VPMvXVWnlwDsMqqFum3Yk+FnMK7
         NfZG6SSAlmHpF+yoJ8RpZdvZLIq27I8H5SqP+uqtCUSWLBxsYG+ey3D7k7V+5h7eEuhu
         4xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=oeCQqJV3OgDK4A6dvfaY1oUNP5gbSRtPqnLN7XDTefg=;
        b=VLqmQJ8jpfWFFDgaZ/yjxo07hR/1lDJF9HJ7U0Le1v6IGWyt6HtTesY7c2UKz++ECo
         2btCDkctCTlD/Qq6Hns2vfBxR4khsHBUW0XVZ9sEgzkRimJBUTEIN1fUY18biyEUdlWt
         C7xsYGuMO4ttbIlFFwu5ExYkcPwfvJvbrgX2zF3YdG2q4iyvy5n+yzqZ0zPI0d2zpQDF
         zt9rNJKMo2EIKbJzR/yZcAwqWTfF1wOr8pYo2vNMctsSMP7+kpjpCTjwIVYvuwrfm6X/
         xIip/Kmt1UQ8Zfy3kbqHSKQzlxMeV3UOkUYzEipe6S0B8wcc5jKPPev6nNE8HZgbN1H8
         k9Jg==
X-Gm-Message-State: ACgBeo19bQVDnJhvZ3YM0y4h8LN4qwU/NXspTQfXklJBGIY1gCMaYRW5
	vu8o14OPMApH7atWQIn8ycK8PpD0SFo=
X-Google-Smtp-Source: 
 AA6agR6oYnWYyQrr2ifah179zqY/xHxbK5bmEGFOqA2I13gIAoW+wKTU8CmYUFZMd1R6c1zVOOfnRg==
X-Received: by 2002:a5d:4586:0:b0:225:2ba8:db5d with SMTP id
 p6-20020a5d4586000000b002252ba8db5dmr3476328wrq.676.1660894091343;
        Fri, 19 Aug 2022 00:28:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/42] python3-hypothesis: upgrade 6.54.1 -> 6.54.3
Date: Fri, 19 Aug 2022 09:27:13 +0200
Message-Id: <20220819072727.2236928-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169598

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
index afcd5e64ef..7874fed296 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
+SRC_URI[sha256sum] = "03749f5e2cb982e54e2a11abcb367b9a260ef8e279387d437145354c080a6bdc"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


