Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6376C61DB3
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9378.1672830369815591871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FuuJdYnC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bs20so30463566wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d40zxSSpeo0GPEZRbxdEtW1UHi81uGY74+DGs4DAT8=;
        b=FuuJdYnCXTzFUyikqgnN1/JFapiIeip2LjAEcyaROomS+/O60/lITssQu4v/QYVTIe
         orA6p9Qzdr/m0vVglKt6b12KiYmH0vtTODGTulxK9TvZYQ/0WMMoCMxZzlw+ZdTTdGSt
         Q78cq3/6fYzY6V9+d5Uvo9FxJNNMeBXN6DS0Uu1KRuClNyqXJUjK7z9rWL8Vyh9EOSqW
         gY9u+V6/q6n84cVAqm+JkE63yP+wFNZgHOaJEk+p8RiEP8dEYuMskhCu7610RcJb+C1G
         DZUZHo8idS52uXTt82wdxGV4Eumpb0GuQ9umattky4AdihIELKhRLBRjKM+O9+IqnFkX
         5mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+d40zxSSpeo0GPEZRbxdEtW1UHi81uGY74+DGs4DAT8=;
        b=WJY9bz6VcsAnpcK2bYMFX9nAE/8EK58VIrSoKFz/EH+EefbEIUnUUsQoelbZZ9mqMo
         uGbGLDm7Nq0i35YYfZCekomwIJMP01UkCZpAF+vr79kICvf2DXv9iajnatAXRehndHyv
         pF1zI/KYjubgSnIeolLHrYMc78IlFjYw68VD0Tp+To9BCrfaN2Y9I1ZLFQ4OUX+v+dId
         TM07g+6gqQn1fE4orvmswNKG2LJuJr5EPJK8kbG/hUBhrUfb6u/XBxdwPgH4Z+egpf6Z
         9HJheHMHAM6j88zoyyCGSssXy5PFnFOXmgyxvAaF9lsS3E+6f9o64KJC1Jfx52pTWrKF
         3jag==
X-Gm-Message-State: AFqh2kruR6qvCbPdEelBg06EErSJiJLueLS63OmvSTRRgMQrq/hbCxks
	k74f2jTdLWmib/xV52R48S+4FBdLKWY=
X-Google-Smtp-Source: AMrXdXvgrk7chfES3GtR/C1MJ7LhKkqbzbfGbtAeekiUimjJVC0TWDY4QVL7yaE9QymKlEgzMwwylw==
X-Received: by 2002:a05:6000:4002:b0:298:4baf:ac8a with SMTP id cy2-20020a056000400200b002984bafac8amr6493323wrb.44.1672830373799;
        Wed, 04 Jan 2023 03:06:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/77] python3-pyrsistent: upgrade 0.19.2 -> 0.19.3
Date: Wed,  4 Jan 2023 12:04:58 +0100
Message-Id: <20230104110548.2537259-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175412

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-pyrsistent_0.19.2.bb => python3-pyrsistent_0.19.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyrsistent_0.19.2.bb => python3-pyrsistent_0.19.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb
rename to meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
index 0b309de8b1..05654c348d 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
 
-SRC_URI[sha256sum] = "bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2"
+SRC_URI[sha256sum] = "1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


