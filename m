Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AE6C4167D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cosuJf3m;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16601468wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+1VO34smzDevTpNG1OdQtDvCVjVsRk/Qfz6WJJY2zU=;
        b=cosuJf3mL935bKfU54M0mAa6fA0OeHi6Zukjse37k5VA6t924ocMjgewfM3vZdukiN
         RQjADMqsiXlsgqLeGEHxgrhXLqf5cjCZOhZmZcRvFiXkzyMD7CjW0Lux/7iWRpipGSjr
         BYatgW88kDWARzNrGo4j2WoYmTovmaKquj5/iQZbboDRJU30Y2KhzcwF04mFzNs/rEjt
         Q6it1iUx2C18GBLN6qrzyv8M/XT6KUAZ/bnoD6uwNTup03Y4IfsMIs5hd1asw6pr4rdB
         YP7VLhIvPil4/FVXeGfyP3uN30Jv8NAncMORTy8wuMxBaVGscYpXFAZsgP8BVz5HmmYo
         dikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+1VO34smzDevTpNG1OdQtDvCVjVsRk/Qfz6WJJY2zU=;
        b=ax1NYhQ4OVZg9/LfJUZhMxfu1gPhEjh/i2QBZ6/iGHSsr907slRYLCiQ1jXYkisuKy
         9rw2h8v8oL8JhnYxfkCynRZKzfJBlElZ3/jtquVYYejinwMp1s+oPe9B+w62R6Hjc8nw
         Qq5zENhzXqWaHctbm08yY4o0pnaAnTbHbo/T4OGzgyB5cQ/BAxn2XBP7rRkAtd2up4ql
         df+082emPUxlQoaPKzBjPXdpHTk3ANM0WzeQeMzlTvUt7VUW/0YJ7o7T9yxygt/ajVUC
         8Eg6KXIs95EadCA3LhdbKSR/M9JG4X9WwJ5yMpOfkPboCn5Hjojge3geEuBKAI2JfeBq
         8wBw==
X-Gm-Message-State: ACrzQf2qNk0LYKqultT+WY4+/7JlEehz0KK9nXWg1JJWa3E7oedQKGri
	8mjo1v250IryEn21sBRQmog4vu6gSBE=
X-Google-Smtp-Source: AMsMyM7Y5ruKGmBGnoF/CToOExWCvsWnIjzSISSAIEcPLgV9ItcNJI4jwApH4MftkQNumez2pLb27w==
X-Received: by 2002:adf:cc92:0:b0:236:77f0:ef5f with SMTP id p18-20020adfcc92000000b0023677f0ef5fmr32448933wrj.198.1667832964220;
        Mon, 07 Nov 2022 06:56:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/48] python3: correctly adjust include paths in sysconfigdata
Date: Mon,  7 Nov 2022 15:55:05 +0100
Message-Id: <20221107145508.1051404-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172894

This was replacing /usr/include regardless of whether it
was at the beginning of the full path (correct, when building target
python3), or in the middle of it (not correct, when building
native or nativesdk python).

Through various reasons we haven't been bitten by this until now,
but latest setuptools does expose the problem.

I am not aware of anything using INCLDIRSTOMAKE, and it is harder
to adjust correctly due to the value being a list; if something
is using it, we can look at it specifically.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3_3.11.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 6b6c983abf..92a1f69320 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -186,8 +186,8 @@ do_install:append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
-                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
-                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
+                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
-- 
2.30.2


