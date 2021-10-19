Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53390C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.11520.1634657703502706160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lShu18cw;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso3644938wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mrr5a19H0QOjBmgf3YkVc5ndkZKIS7MCHBYPXpodmqw=;
        b=lShu18cw+eq7Cv5ChecfRMDl0TZG2+dBuUY25tQtPqUJ8554wmDGqbfkxRvhx+KC+j
         NfcNBpr1WlQSxAeKvEckT5puz/Cr81k1aXDKwpPMsrwCG9iONqvxGMHdVyCDdQs385Nt
         fs+yQhqvWYx6bmTD7cCuRLi7dLbtQ3VSICwVoxCxzNeLmZ1fbVsglhzeAKQ1ZEvsej2n
         9Nr5IBYVnmz6NsuizviCq/wKwTaGN7hpgFUV8EsPiKCqZ+iW6LwkMMNxoprk1yzBGx4v
         XklwWQv4m3lU51SibLWrMbWA3E1nNfqn/QojbHqXXT064uv5c7omkYJYq0aTcgBnzpT7
         zAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mrr5a19H0QOjBmgf3YkVc5ndkZKIS7MCHBYPXpodmqw=;
        b=cuGbAcaJGuLgnFsch/bMRYL+CmFuxx5t7HOGLgzaZsfNXm1v4iGi/94EK47FubXytq
         anvcS6wFyYqmJa3nYFucYwKVmWgJvuJwxgGW51Up1oA0V3sOYo0/RKngd6GUQ9T8Br7/
         K1Nm7x+Y5p1CMGK+96X2z2NyMD+5gp1MagHgP0v1/XfAHcSoKKF2xTQYc+7Hbn4IyhjX
         tANZWiyEt+CS1DS030XGYJRwKos8ytpdomgfMrdKoMqAP5VvreCZeV/ONBXkMRTNz4tZ
         qhGrqQMkGF5wUL6h0k+2S3zXjmOeA2ule/0Tpsm3bDW7dBrMoGdtBIDb5wNB8+FlahoH
         naKQ==
X-Gm-Message-State: AOAM530HnW6LH3cwjtjnu5tTpDqwvWgePLwgNVPge+9CApocchgx9F1L
	zMaDKhZGx3lYWBZDVvyQb96yZpG9xPg=
X-Google-Smtp-Source: 
 ABdhPJwqeKQJ32mIf2CbfkGhwJ3NY54SBXPQ+QoQ337a6wsShbBUtLIKwU+cCtvrU6uDyXzCjaZiBg==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr43432277wri.40.1634657702182;
        Tue, 19 Oct 2021 08:35:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 53/65] mpg123: upgrade 1.28.2 -> 1.29.0
Date: Tue, 19 Oct 2021 17:34:07 +0200
Message-Id: <20211019153419.3319802-53-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157172

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.28.2.bb => mpg123_1.29.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.28.2.bb => mpg123_1.29.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb
index 896162a251..0f4a36e0d3 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.29.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7eefd4b68fdac7e138d04c37efe12155a8ebf25a5bccf0fb7e775af22d21db00"
+SRC_URI[sha256sum] = "135e0172dfb6c7937a81f1188c27f9a47b0a337f7637680039ff3ee5fea3ce7d"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.20.1


