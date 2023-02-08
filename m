Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3081EC678DB
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3149.1675840921798244239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n7Hc+kHp;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so737612wma.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d27Gd/q8mQJ6bp1DwV4O410bocpIPpyx96AaG7EQ++c=;
        b=n7Hc+kHpCKoZlHaqAW6zE8B6igqgfuqql/DoPjJ7PRj1xHiOXQ3lcFXMGWTWhWm8KP
         x16zIZx4xUhiIl2Ejbji9gcbTZL2bT9+hxAJFBVgG6r1b8UEh+QfiGBqyUbLqatmvid1
         dUCPqjwTKE3YdmY5zjmSlhNaA7gVR0UJ99PCb+P5LkQFriVWcLDHFfgUmAUVOmUjJSdE
         pKswHqu0MQ+cv6ZR9nebkUkNG+MVJxEBGz9mwLWIaW9JvkkJhziKS6xmp1/whxLjsqdR
         cUuzJIWdHO7yWUlqCRY3bxwQdGnrciKGdThhSb5EgAAA7fk+E4aCVT68p8V9IGaaE4In
         9rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d27Gd/q8mQJ6bp1DwV4O410bocpIPpyx96AaG7EQ++c=;
        b=viYIiV1fMNWXUzP+I8Gqq9kp4uaC6XmnIQTUdNji5OZ6FrYBIgjjOz/ld9xFUFXsVW
         gIPVjO6hw8xRSc/lXOt91QZek5tD55rQvgfJqw5S8YdGZzr/F4LmK/ms6EDlU0JMpCCl
         rU1DbR9wW+OgzoIX3B/u2s6DJLP6uDcFr7G91jOy9nKNgrRKpWtFdggoYC24kmZIajWs
         W910+AE+CbRX/EXiWC9spqa1Wv1rRJaqh1dxZEZyR3aF/JKz9IPWK1AkRSyhDC8GL7co
         BVWZan4pSFiakS9BapB32QGPk4jHGVIAj1YjpIep1RvdLuJaBskOFPzsDE2BNjENNdi1
         q+zQ==
X-Gm-Message-State: AO0yUKU0MCCVKfg9Sa2MiDcOPm2slJLGZI9EB0J64sv6bp2wa3YhTQMd
	opMGGZc7sb017qCQLZdW28+69U+w5XU=
X-Google-Smtp-Source: AK7set9UNTzPyZCfzj5Si5d+P6w+VHhjBCcpKgMYhf2kQ0j8BFfmXVRr4uZDJQ3myBJMGE0pYEJ9Og==
X-Received: by 2002:a05:600c:2b45:b0:3dd:a4ad:ae45 with SMTP id e5-20020a05600c2b4500b003dda4adae45mr5567707wmf.12.1675840928990;
        Tue, 07 Feb 2023 23:22:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/52] llvm: upgrade 15.0.6 -> 15.0.7
Date: Wed,  8 Feb 2023 08:21:28 +0100
Message-Id: <20230208072143.2930292-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176877

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 77fccbccc2..b4e983d2d0 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "15.0.6"
+PV = "15.0.7"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "088f33605d8a61ff519c580a71b1dd57d16a03f8"
+SRCREV = "8dfdcc7b7bf66834a761bd8de445840ef68e4d1a"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.30.2


