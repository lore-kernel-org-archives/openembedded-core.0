Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBC4C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:30 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.13287.1668953782988949760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=foHWsT4+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so3270082pjk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Im6TR76ttRMQ+ry3zrTBTsDYns6HGOXIVUVPbU7ucA=;
        b=foHWsT4+AAl7HL9YGlVng9xHT3O2BCVHu6yY81Lt1rZTAavt8e5oQGdfbe3J4ESNLj
         Nu1c6jfYydmN4Ffou3O1883mbA3FTNuzgkGTrZwmaD2gbk4oj0bgYbacl14nNNnSzxnJ
         fvXjqUhW37j4EvuomgYlBmWL7AKANylocws+lusjopToObtlC3sJtpIvjtr6992bbG2v
         Aez4b5jBF0gIve/j1Y7Sw2I6nbq/e9vfHEsAFp5KQUfcN48tl8rQBxxJ8a9q7QG8JFQx
         RuBPHR0jS5LUYSxHwMoEdrnWIVAL8NkPLfSjUj8DK/Xql91Qdgij99NQWmg88chcNQwt
         1Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Im6TR76ttRMQ+ry3zrTBTsDYns6HGOXIVUVPbU7ucA=;
        b=TvF7R5qnYwy31OZLlmvPUarsiQAGYU2ZT0fio2hgdUP4whSpiMVM6llXhTiYFe5jLR
         HKrSWnUtoFvJj9805JxlkZHiDGX5CdAxYD/8CIJXCyuiAKrIqCQ+gzjKKKrcbHbAIWRH
         q2ERfPATVRH0vRYWj7bFiaHgujpgCSjifUGcD0oDEE8IhjVjRariHxb/20dXIj30PLyF
         iceg8cPn5IYCC5cbDfnsG0TBWAkMgFhLpqudsJFhWDp3oMcgQ4C68E1dFBCknDoQxokU
         whZiE4e2wUsMUP70J18/pJPVLnyNpowC/mTD+WvGOBxdn2QzIEHcYujY4NkzzQsG3B4F
         wmWw==
X-Gm-Message-State: ANoB5pk7mPZRw7fl7/IMseb7kN+iFjghEWQWDc7JgV9s6i7cZJW84yim
	yX7obGbDUSyoZlQdL4BWBgbhhSG8R2jB8fqMKPs=
X-Google-Smtp-Source: AA0mqf69/nejorpuNO8zU8wB2voTptsCsxuruD/FZjp2MId/tUUvWefCZZP0KrGA38VtxMVEt9o91g==
X-Received: by 2002:a17:902:ce0e:b0:172:86a2:8e68 with SMTP id k14-20020a170902ce0e00b0017286a28e68mr668081plg.27.1668953782043;
        Sun, 20 Nov 2022 06:16:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/35] libffi: submit patch upstream
Date: Sun, 20 Nov 2022 04:15:13 -1000
Message-Id: <c8c8945ded40a36b42da4e95974cf76796c15cfb.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173624

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9555a7dc768c32a009333232e25cef041054b7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 5e529d1ce7..4233799501 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -11,7 +11,7 @@ https://github.com/libffi/libffi/issues/607. Now that
 clang supports the LDC and SDC instructions, this mitigation
 has been reverted.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---
  src/arm/sysv.S | 33 ---------------------------------
-- 
2.25.1


