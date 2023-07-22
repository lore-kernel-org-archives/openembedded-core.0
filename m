Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ED7EB64DC
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 06:07:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.730.1690006039458178003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 23:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GU83A57n;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-314172bac25so1951681f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 23:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690006037; x=1690610837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc8ObZKkQSNKJzgZpQcxSWtW/2G2IJ+0uhOvcRTfwyo=;
        b=GU83A57ncvytRkxshoazSJD3nGxuAOZozOEv//u5TioTamBim4SLqtBKA3cR0IAvIy
         a2mNGXeiJ4DDboPVnkc9LSR28fEB57tiiO2w3C05Z/F65bDNd078rc9ES3OAHIe4XCjg
         Pn0wKFMjYXrm9PnF0Sq8lAWiy9lzEpelar8S9yxC2rqK9Hm783enzGBWsr56PKIad3Dl
         7Z1/qoknlTwxW8/neG+oXeSbhzjJ6FePRhFN779s2Y+ZWVUvq7q5QSfbm8BQ7IEKtvz9
         wOSsVKG6dApjp5oWM6bIc6EJNjRr0VBgoiUu7Gf3zptOKRRKWznPYfnT9A42IzPBKzBc
         GD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690006037; x=1690610837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc8ObZKkQSNKJzgZpQcxSWtW/2G2IJ+0uhOvcRTfwyo=;
        b=YJK9iBh5aWyG+UtEKAXZufqsejnO5g+ybde6JsLeOxuaQXWNAafA3F68MxPhoNJpgp
         uesWwHa3KxUiYlODkUXAglvjHzGgdxGIoY0MBZ/w5rWiGuLLa6zzfG6eHBpyp65LHUyj
         H01oojNp6GKLCIlr+R+Q+e0jmkQDR4IcVYhp2BO/9ob76mId+6jYIV2eJP9WlDYX8lSA
         wJdqQomuCqUNT/BqilCrZTs42KX1deStf0HlT2yrG9od6hRVq3VW3JU5MOOXLt3E4z1a
         r36jvu6XyzATdh39Ckdk4PV+aBsHbbKPk7e6bluuqZncIPLx/U6xp4cUSNiCvDw5FcUX
         Q3wA==
X-Gm-Message-State: ABy/qLZCXPEVEZYhI2pIZ+Hcba32jwd29u1Q+yheL4wj3gNcYi+c3w3U
	CYy2EzFELjan6X3/areSKyzNHGw0Ol5cdQ==
X-Google-Smtp-Source: APBJJlEeiT9BIU3m78wTJSy2L8a30sH25vdjLPrevfOnB9j7MHl520N+AVXNhdHGFBhsG09OQZ4ltg==
X-Received: by 2002:a5d:680c:0:b0:317:2574:c2b1 with SMTP id w12-20020a5d680c000000b003172574c2b1mr3078206wru.30.1690006037314;
        Fri, 21 Jul 2023 23:07:17 -0700 (PDT)
Received: from localhost.localdomain ([147.235.53.124])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b003143c6e09ccsm5974398wrx.16.2023.07.21.23.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 23:07:16 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH] bitwise: Upgrade 0.43 -> 0.50
Date: Sat, 22 Jul 2023 12:07:03 +0300
Message-ID: <20230722090703.1372912-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 06:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184714

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../bitwise/{bitwise_0.43.bb => bitwise_0.50.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/bitwise/{bitwise_0.43.bb => bitwise_0.50.bb} (91%)

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
similarity index 91%
rename from meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
rename to meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
index 3a9943916..5cd20c5b1 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitw
            file://run-ptest \
            file://ptest.out.expected \
            "
-SRC_URI[sha256sum] = "f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb"
+SRC_URI[sha256sum] = "806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e"
 
 UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
 
-- 
2.41.0


