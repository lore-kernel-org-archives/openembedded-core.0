Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25BBC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.57563.1701299120342655143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kI/mNG34;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cfb3ee8bc7so3388435ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299119; x=1701903919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgNDBM9H6UEzcdtEeJAIsDjHjPbsl9yXoXQ1uoWPtfw=;
        b=kI/mNG34yozBg6OI1BfSBAByjg/NfIsfUE2WqEUzMMeFJEUP7vZbiktznPPnKc2xRC
         mFqxNuNnkUFFQ+MMw8bON4+1MuV1crOe6HWCLTUxWZ+r129zsfBaiKIhFL5VgWdQBWt7
         xUt4eqzzORA0X9ukoHeankkPSadVWTOMW8qRbsrv0dg+ORsKDlqNFvk49GiLTLMVzjpp
         m/KwMPoB3Wc0jbSZqJz2+6iuWn7vHlUJaz5TRLoMMIKcO4OT8q1n71L1VgKZoSyijhC5
         IDafMOEHrr69vue87lAF3wnmGnXFk4iVac9BwgsGhCNJ7/E1fSjkchthTHEX1NJSQp2T
         y5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299119; x=1701903919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgNDBM9H6UEzcdtEeJAIsDjHjPbsl9yXoXQ1uoWPtfw=;
        b=u4erzdQ6BKZmuEhTSPQa9djQZ10U4+bJg8miWBpBTRyV8ESYXcoI4HvyV0ld8lMTfg
         JGruY49OPWxCEHR8KrfFf9jZwAI/O6E1Q84yiCGBWI95MTIVDr1SKBnJVq5NckH+A9kV
         kxCY2tDo5J/0OgydDYqSWUi/q/WqKSZedIk80IGBEQ1y3yClnyE90joQPlg9PxUzQfc6
         nR6HrkixZzaRNliwxYEOB9YazSrBNDyXDfyL9fy5t5c7iwWwthmX/fNm7y1qb+agTAM6
         cicdSTFASYQNL3oZsB1xtPj7gwzRs3kxCvEVbHEWxyhYDUa0+q0KgIhRG/7z4EBvFX51
         JrJQ==
X-Gm-Message-State: AOJu0YzzmxY70bbmPvqlrSNr2cUaB3/IS9uAOuMDc9r37rpa+mJWoemv
	vkrfGRIzlFrC8E4aUwfU9SlJSek9h3h+QG6CTnZVBg==
X-Google-Smtp-Source: AGHT+IHQlEDal6XIZnDur6Vsc88ZeelrN1Yth5hmx+vjMOYdQVQuCFps7e97mMlu4UuhP9Isksboxg==
X-Received: by 2002:a17:903:451:b0:1cf:59b7:b035 with SMTP id iw17-20020a170903045100b001cf59b7b035mr18971026plb.21.1701299119008;
        Wed, 29 Nov 2023 15:05:19 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] vim: use upstream generated .po files
Date: Wed, 29 Nov 2023 13:04:58 -1000
Message-Id: <3c1e35562c31b8fa94ea10d18ddfdb4267566bf3.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191469

A previous commit attempted to fix reproducibility errors by forcing
regeneration of .po files. Unfortunately this triggered a different
type of reproducibility issue.

Work around this by adjusting the timestamps of the troublesome .po
files so they are not regenerated and we use the shipped upstream
versions of the files.

The shipped version of ru.cp1251.po doesn't seem to have been created
with the vim tooling and specifies CP1251 instead of cp1251, fix that.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13d9551ba626f001c71bf908df16caf1d739cf13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 38212a1fa6..888f8f0e5a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,8 +40,10 @@ do_configure () {
     cd src
     rm -f auto/*
     touch auto/config.mk
-    # git timestamps aren't reliable and we want to consistently regenerate these generated files
-    rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
+    # git timestamps aren't reliable, so touch the shipped .po files so they aren't regenerated
+    touch -c po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
+    # ru.cp1251.po uses CP1251 rather than cp1251, fix that
+    sed -i -e s/CP1251/cp1251/ po/ru.cp1251.po
     aclocal
     autoconf
     cd ..
-- 
2.34.1


