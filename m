Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6408AC64ED6
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.3854.1676835080159970372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GoawmNLf;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c17so729747wrx.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU4/KVUHmBCjD6rcwi74uMIYG1scRink8oU2xaNpQpg=;
        b=GoawmNLfKXCcfnrP6sL6CENMoL5SxZGXmCc730fLMYlKz3ZbtSrzQ8Mg9NcLCu2pWY
         T8kvDt2xXRsOwQ6vb2Y1YT95Bq4bAW7liEo7ecgkQ29J4K6Cabz8dO61b9jLiufb3B+0
         6U/dIKu90625IHdLrn4YgqgJLWwSjaeo7API37ju7a9Ev4MD0gSgREVAn7W9j8js8u61
         2pzoGoBmKBPHRO6ouFljmbWVCdxBKv10w5V5lnL1XAo0fPoNpFt/pZpHNZ3FBzML50N5
         BvwqoVzA/kM56qoY7VQDXOg80+PrzyprCcKjMV9zyRkQAhOCsYBFB4oaXGdSElncdnqX
         aN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU4/KVUHmBCjD6rcwi74uMIYG1scRink8oU2xaNpQpg=;
        b=oF6CgrTS5nxvFIYioBus+t9+7dhHwPcjt/fxEsSOH6/n4WR6KilYr1LRkz1ljqE73u
         bnWoFrF9sMIued60unXbFdshlJ2BmS73hJ3s5HX2KmXSaH+YH0XE9yz9ewkf8Bz9Jxkm
         kXBgK1u68WGz7b9Kdgx+ID/5EcelnTDM8ZX71spfgj6ZjGEuHJPWAOSC5SRn0tWqxFeI
         MkirYQz+xNxHq7vGT0gJAAQ945l+W4x6Ejtr+1KwgszdDawkobHXru0QBOwK2Ao1MzoY
         JNofYW5APPxZPdAqfMjgHPK49RS+uG1tOnRTnQ3vfuPi/JuF7CnWc0AZ3xWS28PpNLvF
         hHuA==
X-Gm-Message-State: AO0yUKV2hENOiH2ZCVtQ+SmGCx2/20kikYLX//LePotGN6/P2D8LyPTs
	ND1EAHI60HFqpBj9oiqho6E/2csttLU=
X-Google-Smtp-Source: AK7set/usvnUPWY2qcIdjTv6xd9yACaTVx0moSTPP4XTtWzfF5gWU2zz+dNem3FdgDyJS9RRSV0DOA==
X-Received: by 2002:adf:f843:0:b0:2c5:93a0:3bd2 with SMTP id d3-20020adff843000000b002c593a03bd2mr906694wrq.14.1676835078708;
        Sun, 19 Feb 2023 11:31:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/39] dpkg: upgrade 1.21.19 -> 1.21.20
Date: Sun, 19 Feb 2023 20:30:43 +0100
Message-Id: <20230219193101.338397-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177364

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch | 2 +-
 meta/recipes-devtools/dpkg/{dpkg_1.21.19.bb => dpkg_1.21.20.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.19.bb => dpkg_1.21.20.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 160adbbe6e..f2367c95e9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From b68fcf0e23b91dca7fecfeeceb1c4267e29e6f9d Mon Sep 17 00:00:00 2001
+From e3ade3464b8a1129a55c2790cf114d9ae01e3cda Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.19.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.19.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.20.bb
index 8d0eb40bd6..a6ed4fd429 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.19.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "2f3105279e0fb2255f39b2e9a11f15837cacd44b"
+SRCREV = "6c5140f124925ad4eb12fb2c8e83a050028bbc1f"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


