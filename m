Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BBAC46CA3
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.57640.1701299117934613369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oGjNacHV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cfb3ee8bc7so3388025ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299117; x=1701903917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKschNn/We33KA8i19Qd++hRUK+6p6AhyoeHfDKlSFY=;
        b=oGjNacHVI1/xUwyNpQOQOjMTCcENnj1Id3X45FXTrQanyM5r7Ui1e7+CLi82o1zyM+
         SSIE/6NabN9s22H92Rtfnywf14etLWiihu0SJedRSwwg9tWvAmpE3Aw87Z19HI9SaYrf
         KrpKY83aMKQY/WRVXkQ9fsgoy29WGnu5FcsmmNLYkdzpa0KWD6tKtA35ld4HDwqQlT0l
         dx5aO0IM4X1WAlcsdCc67C00Lp837J1w7rkzRsoiuq3HWPhTe9zlrX6MphF/WlAC17Xs
         pQMOszQcX2I1Mxn5tcSYDrv0MhisFa99yWaM3ANQW8Yqy/n4x8/ccXhrZ6voEzFOTDdX
         l2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299117; x=1701903917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKschNn/We33KA8i19Qd++hRUK+6p6AhyoeHfDKlSFY=;
        b=sy0VkxNsTVv6OxDSq7gDnMBj4u60hYUqsfU+vrzStUNJ6swb8hSknCqoJ59o7d7vhh
         WvWcgrPthbgpjYZw6jd+p9mtWLnHYMfQF8ssogWubV3GUEjiADYIr2Jftnrze2NBkUkA
         zXzR1uGsYWDEqulxuMx6JGL5d/2F+zTjD7YeP26gadiym0LdsbZNdIeh/AURFyUOCZ2L
         XNAUkXIjD6YZ+xKKXYTPG464TNUc4IOIwtym0a9wWxUDW7otMYf1HDCEmZ3Kkbq3aGAx
         qp+r0RBPUKJfTt6gCWAqByCPfmtEK85JSL0kTJMaO1hTctc3r/YxYYrTVF9UWrL6f9gJ
         JRKw==
X-Gm-Message-State: AOJu0YxmhrzwffyIk7D6JQ9/gsCu/BkKfEN+Wdd5+9x2Ohp2VIi/Re07
	i75Er4ZdvRZunbJv9bHpXSPI0YszRO8ypUXYNuRGsQ==
X-Google-Smtp-Source: AGHT+IGuP/owgBEx2atJ+H1CUtuDHGn5mGki2Bh+kGjEB1Xsh/35ZG0ZDjfUy/I9EJLn+888XMIp1w==
X-Received: by 2002:a17:902:da86:b0:1cf:c901:5451 with SMTP id j6-20020a170902da8600b001cfc9015451mr14050059plx.14.1701299117082;
        Wed, 29 Nov 2023 15:05:17 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] vim: Improve locale handling
Date: Wed, 29 Nov 2023 13:04:57 -1000
Message-Id: <b2e62fb4d52b019728a4920553fa24f4626b881a.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191468

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When making checkouts from git, the timestamps can vary and occasionally two files
can end up with the same stamp. This triggers make to regenerate ru.cp1251.po from
ru.po for example. If it isn't regenerated, the output isn't quite the same leading
to reproducibility issues (CP1251 vs cp1251).

Since we added all locales to buildtools tarball now, we can drop the locale
restrictions too. We need to generate a native binary for the sjis conversion
tool so also tweak that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 042c1a501b1dae5ddb31307b461be02c3591c589)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 58025828f2..38212a1fa6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,22 +40,16 @@ do_configure () {
     cd src
     rm -f auto/*
     touch auto/config.mk
+    # git timestamps aren't reliable and we want to consistently regenerate these generated files
+    rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
     aclocal
     autoconf
     cd ..
     oe_runconf
     touch src/auto/configure
     touch src/auto/config.mk src/auto/config.h
-}
-
-do_compile() {
-    # We do not support fully / correctly the following locales.  Attempting
-    # to use these with msgfmt in order to update the ".desktop" files exposes
-    # this problem and leads to the compile failing.
-    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
-        echo -n > src/po/${LOCALE}.po
-    done
-    autotools_do_compile
+    # need a native tool, not a target one
+    ${BUILD_CC} src/po/sjiscorr.c -o src/po/sjiscorr
 }
 
 PACKAGECONFIG ??= "\
-- 
2.34.1


