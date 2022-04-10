Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2FDC4707F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.19977.1649614046196844630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 11:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fng3LfpV;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 32so10119586pgl.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sa11kRzlWTha+0xRe7NvSuf5pelMyw8YWNuU5dfYDmE=;
        b=Fng3LfpVlRfZeacacyVh3nfc8SkgF0b+PnBwsg4myX1kQyXseCapAB8b5NvTuqkyK8
         edTNeTFycRfgXknH+kwq5sSf7+cHKbUKUX7i+ThrWRoXermaDZGqDZrwLn0cB+X8PpMl
         6LzeRJjT7RYMVY0rpOOAY+lTlE0Sc8O/mJUZKtWuUxaUs66lNwF45xs0shRlxV8EHjfk
         Ha5zUZ6l5vXjp+hUiqfSrGO12mwTbJmowxkH24s34V6JFvE7kD5JSTDDBq615Sm2GmBJ
         Uh2H8CKE2PAl+sHj5p/NS1dugNEdaPc77op72/UuNoivoBTYpKmfrsd9TULgoE2JgF2W
         hUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sa11kRzlWTha+0xRe7NvSuf5pelMyw8YWNuU5dfYDmE=;
        b=S1vqPIhqFK9ZTioIPmpb7vVGNyi9oietcsL0MiSAkfjo9FEYX4rQDfUWub0Dw4d43l
         ajF2fmy25GAtLDfcQrwzSIZfL8Q7OjwedX4IfbPpUFnhEsuGZOqgAm8PdkbUquB9y+dr
         P1BTP2XxLdHxmkDGW1UyhdIqVVG7q5z1SoGxkxOcSf05pLVhHhR3QpwRJd0Bd3KoHpbi
         ufozcuJ8Cn2SCyvrOj15qpuUYCk/aV88i5nbNd0gE7A2RJSP92hfh3Q7+BEO1TeH25Bb
         sUeTa7KW/L06x4q4fUJv5Og+3fl4T5DEPfQX9o9IQ+kiPdqbN+EgSLvH6RlU29QgMuD3
         Wt9Q==
X-Gm-Message-State: AOAM530zj+ayyCOSn9OjDB8t5o9st9vng55E2W2tm8JniwKA1idux6/i
	sUxjVkwZBOo0fYQGutjZkmj1kteO7OIbYQ==
X-Google-Smtp-Source: 
 ABdhPJyJ2O6WUZhGFSru09H0I72drvvAp/0Iul64eWzIA3qrERCUt12+YNB4d2IOl5vEoxj8sJRc5g==
X-Received: by 2002:a05:6a00:18a5:b0:505:c080:a4e0 with SMTP id
 x37-20020a056a0018a500b00505c080a4e0mr1680663pfh.2.1649614045172;
        Sun, 10 Apr 2022 11:07:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a17090a31cf00b001cb7c80616esm2823386pjf.57.2022.04.10.11.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 11:07:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libarchive: Upgrade to 2.6.1
Date: Sun, 10 Apr 2022 11:07:20 -0700
Message-Id: <20220410180721.1101347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164205

Changes in this release [1]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.6.1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.6.0.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index f078c8ad03e..c795b416289 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
+SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


