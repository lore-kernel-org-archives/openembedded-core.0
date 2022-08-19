Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCA3C32796
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.476.1660894087143332176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P98pyqhz;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a4so4190515wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9caMsa7CZxtsZSr/Sz+a/0MmuuJzy4XU2RCbTaiG4uU=;
        b=P98pyqhzzasBTghoZNfriG9thVwawMfWj9agCWYZR3NzD8al2lV5FhC2MyYxwCQn8E
         JlbUN9MGGmJtF4jYQ6Xsphv8baBXEVkag6DRQw6spFzrqA/kgWzzeO6wN/mCOe94/Fd7
         VLI/lO3aNcYGcJxC83lQ4+U+YgDG30cWVLFVnEz633JMrX7ZH1Yc0AjT4vTQPqkghVfm
         nd/3stgv9Ynkrkew5Zn4yg2TF5DUPajSqWcb0ZT2Q5K9asXjIh/qlGd67s3Ip9N3UuZO
         tgqIg46ASjy426mZf7aIhiufTC/h0I4d3sEKIp17HQoUefgFYXjWrOzezDzWplFUxXpX
         OdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9caMsa7CZxtsZSr/Sz+a/0MmuuJzy4XU2RCbTaiG4uU=;
        b=yD31nZ9rf120vf+psfYpxWFS0S+7FuFmK2jxInKpdMibOOIJ23P4kaFM0Fo4A6H+3a
         xPtq9/la5RxgtlWLflaIG0xWiha1W+Wgq1FdAaqdC7NbvNpHRIt3c8TWoh9/WylNsB2a
         XN+/sfM5VDUlwzQsG9idt/SN3vvLdyPTzJ6hQKRLHwUJsj1X30B1vVG0xAVnEaBPQcXC
         /VubGEQ1i6HRaMQvy2+ZB3e/ZDUp69aXFHAp8TgSD4Dyth34scIJ5IwYy8zF691068uv
         2l8NratV0/V1NE3VVWjc81EadgKAU50E30ZplMYMM8J71jlwaC0MCeTSQ7MTEdI86icH
         5zHA==
X-Gm-Message-State: ACgBeo1rnp5zk5LFNtJTqXixgfy8d7R6lzeM1JtoUeYP3dT4VDP2iaFr
	HBfWZenrcCIQ3NSLR0NoV8JkAMYaZVE=
X-Google-Smtp-Source: 
 AA6agR5sSfUZqyosFepjG6wSsDIvsoOL+ZmYb6yhD2j3HkxUYGBYZFbRaDx6H4RwyDdHGQP8mHG2rg==
X-Received: by 2002:a05:6000:69a:b0:223:664f:15b8 with SMTP id
 bo26-20020a056000069a00b00223664f15b8mr3618795wrb.356.1660894092365;
        Fri, 19 Aug 2022 00:28:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/42] python3-more-itertools: upgrade 8.13.0 -> 8.14.0
Date: Fri, 19 Aug 2022 09:27:14 +0200
Message-Id: <20220819072727.2236928-29-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169600

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ore-itertools_8.13.0.bb => python3-more-itertools_8.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.13.0.bb => python3-more-itertools_8.14.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb
index 94f6f9e4d5..c955f93d9b 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "a42901a0a5b169d925f6f217cd5a190e32ef54360905b9c39ee7db5313bfec0f"
+SRC_URI[sha256sum] = "c09443cd3d5438b8dafccd867a6bc1cb0894389e90cb53d227456b0b0bccb750"
 
 inherit pypi python_flit_core ptest
 
-- 
2.30.2


