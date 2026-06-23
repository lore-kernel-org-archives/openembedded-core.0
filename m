Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEABFCDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:35 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20441.1782220467618867207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TqvY5tWh;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4629d80fa08so5347659f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220466; x=1782825266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbE9Pd6luAnxk6H8jtLKUvoGLuG03WOVQBvo9b1KoRY=;
        b=TqvY5tWhXCAlB0m1PyRRS/gUzQ6amI2wSNmmpWzPvLIKnPfF363qGeWHVwy5ndz9mB
         4+4RqNosu5Kr2Htv+szGsSkyaCY1mau4obF9VR6EwPcWs3OqO6WYedlcRNyO3hui4nNU
         A382GUnITyNrndANFuw0dZGK+82CrGuNP+KMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220466; x=1782825266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbE9Pd6luAnxk6H8jtLKUvoGLuG03WOVQBvo9b1KoRY=;
        b=HoSHfoMJ0L07ke8vYjJeH1QvdZmAFLHbcI1e2j/f69pJ/HLEuT5+cwJSv57T//6jP3
         cxmcw0LbpBNMy6Eive/y8NmZSxEvsKLP0nPnRcD54KF7q1Em0aqkwZQyJb4GQjfp+AxM
         MVBZlcPgK4KUGYd+JYcTdEkgXGOpHXZxdWYxj4fy5vzBN/37ldA5U5j12pjjMpSGydqz
         m+kDkC5fp6jcDwkjfl7U2MqiuJ1fBdxGEmu/xmK6TwL/m7T6kkTGUpxaPPBu3huKomKb
         LeDc8BYEQWQc80pgsBzjtYJDhRGjzO7tX8tgBws1hnBHfNoRwk/WxbVr+Jw+HXOSHSQM
         1SzQ==
X-Gm-Message-State: AOJu0Yx61LVlf4RHjzRlfjipBDqaH5Fw+l/xqRrAqqyZosu3MSZBJY+7
	410j7fNeOUeorCFgJcWxsXIUJcyOv9JqyPxh6scFQOzxp8Ieh4goTMHmm1rWyA1K+kL+NPQxeO6
	C3Vwq
X-Gm-Gg: AfdE7cnkGbAaRxAYL2eJiX2g0V4qcliivpy4fxm62YWWm9M/RNplMbxppXvqmOX0VJN
	B+RvkEKl7KyZQ5biT5vnZnwjcOaDztDFk2uuKI9J6vVH80qVP+yySDZDQM69EqKiOwurgcXK39j
	sMOFz1VlTwFIXTwso2/nx8tcgnqyVBPgcbo1HIX0kz3ogEX0HLCsPTcaSJFr3zFcCHg/E+YNkOb
	1DdXw4GyKiXY+x9ycppw+DE4mSp1vNdIBPFUX4WOTcDjab5Ldwzu4cP2TD3JYFxLAdPmmzcsIPb
	VURKmWLuqMWtW8iBYzAybaXU6E9M91S+/5hPgTbJurJtCpReKDzATJHkcxTxhsTDF1gixiOoutN
	VMkjimFeEobOSLF9cPZeVd74bFpBlFfCJToQ2atysdCAHwhG6+E721jjAEvFyc1/jjuJzWn2Vxm
	dBmZ7un5BoK5Q72hGDAClSeqLC7bDz9RtCIsfUfofIAIkuM04bp2mgEKKbrX6UuTIEbMXsaITCt
	FlBvQPibaFkXBzhzQ==
X-Received: by 2002:a05:600c:190a:b0:492:3071:1db7 with SMTP id 5b1f17b1804b1-49240e6ca7dmr311970635e9.28.1782220465733;
        Tue, 23 Jun 2026 06:14:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/26] pseudo: Update to version 1.9.8
Date: Tue, 23 Jun 2026 15:13:42 +0200
Message-ID: <d716fe7e4f1dd2156be8773408611bb979a94d5d.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239367

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Changelog:
    Makefile.in: Bump to 1.9.8
    pseudo_client.h: Fix typo in the comment
    client: permissions drop setuid and setgid
    tests: Add setuid permission check
    pseudo_client.h: Add +s to PSEUDO_DB_MODE for mkdir
    tests: Add test that returned stat is correct
    pseudo_client.h: Make it clear both macros must be updated together
    Makefile.in: Add pseudo_client.h as a dependency

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa302de94c7da77a49ca0701580467ebaa8eda18)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1ca1ebd6bf2..3d7dd62448f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
+SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
 S = "${WORKDIR}/git"
-PV = "1.9.7"
+PV = "1.9.8"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

