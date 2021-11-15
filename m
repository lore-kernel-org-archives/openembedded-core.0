Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB4CC43217
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 12:58:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.22003.1636981137163909124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 04:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=opVP37mH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id iq11so12787078pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ckaayammXgs0JtU+BP+gif9Nxzi2OxjhP4/+BAOdaQ=;
        b=opVP37mHhAApfKfFJKiUdIYG4ZVDsBR7CHlbxJCnsVZ3p6VwaeSidlwJ099cOWhXvU
         m0ztVWxSZY+PqpIpA/QyDyjQHp2bcjTY+na82B7OhamgFa73f0PgkbfbiDs4+oJL0BxG
         +6SKQ6/A0WxmfgPqqAd6W1gUpJmVh+sIP81BwWSMhYdk9+424Ug7miek4elyUEAcI0Lw
         hoGIu4fqghwYw9sm1EL7GEz3czmpAiwaa1tMDc8PazwuhmIBiJkKPmdtgNGvkAb5jrz6
         qoMCqh+yyGh29xV69qfe5/7vPrjNB55kNcP1PKlWleHD9granxmnvImE7JYvmhWuD5Qb
         R4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ckaayammXgs0JtU+BP+gif9Nxzi2OxjhP4/+BAOdaQ=;
        b=Q53Ig7q2+raN+iW4hrNdax5wVJRfzWKKnKjSaw9MATHXH9pDyEBpMtw7vU5Mz7w5vK
         YEgkzdPhCndv92DDD0eG3Hqdf2JFomi3KWLQfBCxYKgO+YvM64Qz18UIadE1BlI7iPVr
         JhTMKyn+6fwDmxkbr8qcMVYHQcRHx8FOAT16+NxlqnsX/rQPNzxXojLoBraZSx4sXUnu
         81e3m23/0FJgf5b1v0/2XVzN4wkuQ0DEmRvPO1auFsaravumiff5btvnWP/XxGav1bHy
         MNYPZUN+R84ULhILrZNDQpdTF0bYJWGhj3wwhf8F+R+B3WBrTIyUqzOxa4REzhCSFUFO
         bD9g==
X-Gm-Message-State: AOAM533Fk6Q2W3G9g98vHBueDtel1jlLvw6CogmiXp6YP/aW9gylbTSG
	FQLCd4wSacl1FWnu8EwF4lDpePlPXlgSuQ==
X-Google-Smtp-Source: 
 ABdhPJydTrXY3mt1okq4NAkG54kIG4aqWevTBhtL8Flwz0n8+H+3y4+fpTtezwnfN9r+x4sD6OHZig==
X-Received: by 2002:a17:90b:1e07:: with SMTP id
 pg7mr63676827pjb.185.1636981136459;
        Mon, 15 Nov 2021 04:58:56 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 j15sm15565269pfh.35.2021.11.15.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 04:58:56 -0800 (PST)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] Fix Bug-14613
Date: Mon, 15 Nov 2021 04:58:53 -0800
Message-Id: <20211115125853.123820-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 12:58:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158285

Source:- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14613

Adds TUNE_PKGARCH to PN so that it picks correct TUNE_FEATURES.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index bb625f4240..30c92ed395 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
+PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}-${TUNE_PKGARCH}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.31.1


