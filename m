Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358CBC4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:56:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.9813.1637168210146714451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qkn0RmXU;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso5783578pji.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUIS/RCwbIGwZ4KDSnOZhcNu73uN288Lrlu4SEGQgWA=;
        b=qkn0RmXUkaYxlAnfKOxLraVV+hGcb6y/Ps+ao1Hv2SfKJBNaQtFZGuYe0pYpcmPc6d
         oscBEGWO+qRGbC18ZNZMxbUW60qhjL0PUKa35oCditffTgjhQcQER6OY0aFtrwyL8kh8
         b0aYyX2CVjE6TjB3tD/nMc3QI7sPyDm+ym28U9KEpiIYifJprUGEo35Pn+BJUwWdiSDo
         46HrEAlcS+fzrGvDDkGf0QOS7Tn3w4WjrwLZuIwz6G8lVM/qfG+VrLYinEkybMMFRlKX
         XzcpEzG9J9rxVcv0/mgohc35lkgrNvrZiJdxV8bDbt2vSYMrcwblJf+IDo3zQsm2bUGY
         xqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUIS/RCwbIGwZ4KDSnOZhcNu73uN288Lrlu4SEGQgWA=;
        b=R3ueGFRafgKXWDbjDtV6fMfb08be8/AJej3YsUKTCwMU/ACSXuxqHZYCyS65n1rM6r
         vonfiizvmhz47mXqGAKar9Ne5Ano5YGGtI4YkzPTvq22h/0JhJP6EQ3Mn/TgccI4YTA6
         E0Xb3O6i6RactEE42oJ8vw/gXWsqIOIFX3rcdTvVwe/xDbS6piitQjevIlR0EDztQ/K+
         FgVQcycm/olO7dF41c1MUKucce9ok3Pm/b0S2wr9fQ0WJz52VmKAqVT3krDClT5XXuvA
         frwtiQ1R01emYR/i/IYAu8UpIbxbflUXvZp5TBJ7YR2M3Df2VifeV+KlNVZEaq+KWrgO
         U/CA==
X-Gm-Message-State: AOAM533MYJ38QrQZ6/GlcMtx5TnyiRhSM95aiBIoqQnBdc0yO8+YjbIB
	sU1vOMXf8zdeYpENrEk9tuu/qJQ8i2qhhw==
X-Google-Smtp-Source: 
 ABdhPJxmlXCR9PjQAjso6pypTVyXoAAoR5tjFuQs/O/8LoyGcDvOw3hZcJPAZzttq7vrU6f9p2lJVw==
X-Received: by 2002:a17:90a:d48f:: with SMTP id
 s15mr1413833pju.64.1637168209360;
        Wed, 17 Nov 2021 08:56:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id b4sm226420pfl.60.2021.11.17.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 08:56:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glibc-testsuite: Use append operator to add
 check-test-wrapper
Date: Wed, 17 Nov 2021 08:56:45 -0800
Message-Id: <20211117165646.70015-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 16:56:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158434

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.34.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.34.bb b/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
index e8ad2a938b1..6650ec5a483 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
@@ -3,7 +3,8 @@ require glibc-tests.inc
 
 inherit qemu
 
-SRC_URI += "file://check-test-wrapper"
+# Use append instead of += that way patch is applied with devupstream too
+SRC_URI:append = " file://check-test-wrapper"
 
 # strip provides
 PROVIDES = ""
-- 
2.34.0


