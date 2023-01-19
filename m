Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D66C678D6
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 04:27:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.38158.1674102450658653799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 20:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=je7SKJvc;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id 20so1211526plo.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwtz5zHGIpws9b114XxGgP7fhTwkxvLMOOUPoRh7Q5k=;
        b=je7SKJvcAbA/PNw2tPWWs22aWOuJKqtiWX29mPGuLg0gmDKWM0IvrJwVswMHLliKDm
         YaXM4MRdPw96tTQILQFbUieR+kZYxK/EDPdrQqwiyTiR+iMG98KL87cJqXsQv+68CmTG
         3b/WKgXhSqa7agP9CcRBJ+p1/rGqTlczGNPUXwgKCMFYSEO2Nb2aMiSODvD0V72O3wnX
         pqqUREJFU6oYFM4YvQWuuaaq+yIpBAvx6+Z9BlDgGJqBKCk4vE11UyYt98+RePpz7c2r
         /Rq3VEfCZ045TWFtZ0MUbVNlAV7xRQxPjFkOuRe/dsrCog2iT79bTExxUGUmd2z8wC5N
         0gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwtz5zHGIpws9b114XxGgP7fhTwkxvLMOOUPoRh7Q5k=;
        b=KmfKW3xrKs0p15pjqjdjmUFTUs29wRF5iEX0Aug0ZsSeYe2hiaN4BFhU8K49/kXgJ7
         9FEJGFFW7WgrR6yyHW6NlTDY3CCzVC+uNW2AqesKlFnDwBaBdhGv6qQTJWt7D08uwsS5
         5mjTYLNXw1zoQ+jMeInPGYv4K9af76uPVr72EN6MLS3O2rmip46DvZZ0XfC9RoQDuAeb
         QFuGxIbQEfm+vZSykTdHWQ9Y4+3TNULhiuepCOoAhXH3sxyq6FKQpMytNqvDpZuthEB/
         OjvdVTNY+edMacYah7YaRWjmI0MxJI2LK/VdMAOaI+goVmbzYbXTBWVUeZo0AzY5i04m
         C3RA==
X-Gm-Message-State: AFqh2kpoWAgwiseA1UzPInuUEYpJ6GhqzUFY0o81sIwkhFPSclKsqjKy
	thI0/wmNkcr8ggEamiIjyv6Dq6vSgkJloA==
X-Google-Smtp-Source: AMrXdXvFM8qfBln1R07UpavU9JqUJb6AtOFSyQxSspd5+kdL42ykNHcM3k6BzuG0CiEvRxyq1j7lVA==
X-Received: by 2002:a17:902:7c15:b0:191:3ec0:9166 with SMTP id x21-20020a1709027c1500b001913ec09166mr9492996pll.6.1674102449929;
        Wed, 18 Jan 2023 20:27:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903120e00b0017849a2b56asm24001775plh.46.2023.01.18.20.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 20:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alejandro Hernandez <aehs29@gmail.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] binutils: Package libsframe
Date: Wed, 18 Jan 2023 20:27:23 -0800
Message-Id: <20230119042724.1413857-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119042724.1413857-1-raj.khem@gmail.com>
References: <20230119042724.1413857-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 04:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176117

libsframe is newly added in binutils 2.40

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Rebase

 meta/recipes-devtools/binutils/binutils_2.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 67240383f7..9087af87c5 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -66,7 +66,7 @@ PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
-FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so ${libdir}/libsframe.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.39.1


