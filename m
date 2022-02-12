Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70454C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 10:40:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.7641.1644662436524220485
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k5vJ9zy9;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id m11so19836501edi.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FnDa3iqCyIg8DpV+OEjElBylc8kb34q+Ak3buQEYj8I=;
        b=k5vJ9zy9gI6z87cmUdEjtGIEXqvBnLcp+zJ1RHB0Y49SUysxb3v6LIDADQvtCWBU+e
         yP5bgwMr5MX+gDoT0yfYazUy1U2IiM0hYtdh+Yr9PP+FkwBnXU/0Q7zx3c8OSRuw+QZB
         nGGs+xkV0s/ti2H31+7K+ur3ovcz50mtUhrwwtbret7XwHmy6eN6htRlsQf8aQVYXFY+
         Wi6KLoVltB1sffrvWRjWYmCSlhvBb7DNIvv1Y401pGQzlpuAjnBCKBOvWWb21+1O7p+C
         Hb+Pq1vkJXvTx7kNUvW1OywpgzC1uhaw0AMR//pm2jfe4Ym0bKxsP0em8Vo0W1v8jOHd
         Ll2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnDa3iqCyIg8DpV+OEjElBylc8kb34q+Ak3buQEYj8I=;
        b=PjZMy8VA76OIBHOe+zDfXUqIEtjBgFzT4LBe4JLuWZ/zNQQA8jdRVd7XCH5BKr4U+D
         JDaAMMV8wIzOzOV7ljFXlnEwUTEUA5Yqpfj2yxq0z/iQY5Q3n5cQ+rcXkgDfJ2E1C9Oc
         RoJen9G8Mb7GR8nwp7f6jOdvfrkokerK96ZBStpJXBiVBPcOZmIxGyegUpNKlk/4xIA1
         pS/wqm+/yLpsm6d2YfauMggL0//ohOPeNX7tE6EOq+QgJvEtA+BTnhlLdb3BteCUhhz1
         Je2lJrszE4LwiRE1sSjLYHgOlpa9L9DtXU8YcIfvZsKtwqV1UNzhJ+A/YGjY2RbbYUHy
         cCHQ==
X-Gm-Message-State: AOAM532zxhZLw0KGomSbP8X/EQjHX6tenVr+K/v/BOR7ts/KM1DhxV/w
	qJwHTsxswhli3wKsuK7pC6F20mfEbgU=
X-Google-Smtp-Source: 
 ABdhPJx38DnUckKr4HtRFKhDMdcR0wRVovmX3CnXBPDazdyO8FTg7J0h20gG2TF8e1V5Djgnfv3MTg==
X-Received: by 2002:aa7:c453:: with SMTP id n19mr1129110edr.364.1644662434951;
        Sat, 12 Feb 2022 02:40:34 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 cz12sm7135895edb.30.2022.02.12.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 02:40:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] core-image-weston-sdk: synchronize with
 core-image-sato-sdk
Date: Sat, 12 Feb 2022 11:40:21 +0100
Message-Id: <20220212104022.842655-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220212104022.842655-1-alex@linutronix.de>
References: <20220212104022.842655-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 10:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161668

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/images/core-image-weston-sdk.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/images/core-image-weston-sdk.bb b/meta/recipes-graphics/images/core-image-weston-sdk.bb
index f5f7dade54..09e87b5b65 100644
--- a/meta/recipes-graphics/images/core-image-weston-sdk.bb
+++ b/meta/recipes-graphics/images/core-image-weston-sdk.bb
@@ -3,9 +3,13 @@ require core-image-weston.bb
 DESCRIPTION = "Image with Weston support that includes everything within \
 core-image-weston plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk \
 	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
 
 IMAGE_INSTALL += "kernel-devsrc"
 
+# Compiling stuff, specifically SystemTap probes, can require lots of memory
+# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14673
+QB_MEM = "-m 768"
-- 
2.20.1


