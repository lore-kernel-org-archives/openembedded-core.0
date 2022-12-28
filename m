Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B8DC3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.182565.1672241029706140040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lGIX+RX+;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bx10so15246066wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzPYvHH0H6FWllOARL90mGJTxxCwr18B2lHzq+Q9z88=;
        b=lGIX+RX+5VvNzCTdUn1MUiJh3MBPkGW3CbBofDrBhjEVcZSlU2fR/p9sJra/Dvqu2h
         Vs7Ams4bYPM7uENKEm5x1m4OAVDOx+Hn/uVG7FUgEbTMl9fLmi2eR1pBJFskJzlm7u5h
         0YST7CG2mtFDnk49XYpFK+FFBmBVt1uSXIJaeLi+WRDrJD2hbL6ZniaW3dgrOYKiWoPQ
         rNyudYiM7F8kE7PjIBq7kB5z5MrnoObzwJl1nUO8zD982lm4Mt9Zbx1FwfPXyU1lGIaD
         Mhb9ykbKfqYlCcdI1R4mE5FtTLyiUzoN9aoSB/MuFpFJ+slMIxMq5rwnPcT22MlO+OhD
         tkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzPYvHH0H6FWllOARL90mGJTxxCwr18B2lHzq+Q9z88=;
        b=H0NlAiGhhn9JHMd17gpWH0sVyB5ILiNwe3j+Azc4OtEvsHr8vV20OGDUQMf2cfkwLp
         hMVAf8ConGZ3gALds7Ckc/A1JyI88HtlBUwCB/2q2JxhzrN3/1dYYxrF7Y2W/yNKs7sl
         rLaQwLaSxBobNVs9Mm+LQtdDO1oTlZIEdhq/RrFoyiYNgrDfXHM01hdILluP4qOvdez7
         txVZ+f1a7Sr72HX2rjxGClQVH7gF6JEK98VD44TVRHJoHUwVwhnfSlMG8hgfbhgPqa1U
         mrZFyn97+Wz5gEk6W9gG5sDGE3Tz5qg8UfT483K3RnpAYrNdn5OQ/ZEjIsys4Y8KyxBK
         /UUg==
X-Gm-Message-State: AFqh2koyNe2J//KOaXnApLdSFUvsa+sIb/25FRrYx6SZvTjIgBWqxU8s
	Q250XtMEkKUg+CcVuZWRVwjBl3UZjwA=
X-Google-Smtp-Source: AMrXdXvbPWw2GKQ1aFWL4OrX+miNbMjSaQrynlCnTGz4JTfnuMaQmR3Gv9sQJ+AnbUY3gm6i6TVQdw==
X-Received: by 2002:adf:ee06:0:b0:281:aec4:71b7 with SMTP id y6-20020adfee06000000b00281aec471b7mr5091770wrn.64.1672241033712;
        Wed, 28 Dec 2022 07:23:53 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:53 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 11/12] packagegroup-rust-sdk-target: Add cargo
Date: Wed, 28 Dec 2022 15:23:33 +0000
Message-Id: <20221228152334.25449-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175081

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
index 334b24900b4b..59874c4c2c81 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -10,4 +10,5 @@ inherit packagegroup
 
 RDEPENDS:${PN} = " \
     rust \
+    cargo \
 "
-- 
2.39.0


