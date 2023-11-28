Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A991CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.10465.1701211988885806370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xEambc6K;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso4711206a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211988; x=1701816788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VziZnKsfvAXzAHyDZ0SPpJD0tYAuq31f4xb/HzfPFXc=;
        b=xEambc6KLg+owEIURY8PZNUm4f8fV0ZBqKLDR3VOSkDyBdehBl0wfO86iFlG5Azil6
         0FmTiP12XZk1DHShGUQk1LxaSOuiGFPwMrw+M/hnFuuTH0RrUvntDyBYw75eIljn+yQx
         A5HZ8C0rdhw8z7y9Crb789xCyX3tNBaAWjvOlBYslHcnb+DFt0zrqvD5Rod31b3LhPgL
         /0dXHBsCrTDYFCUJoAAOLIx6dBVfudGV95I9CdKfkFA4XMUObLQ/URdsliRXj3DlNG9b
         EZcHYOTAMJ+17VJkEsT4jylNUkcWgkg3b18DVBAJV6PPlw2+RWcAXGg3EnBvMQGV/Bu6
         xI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211988; x=1701816788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VziZnKsfvAXzAHyDZ0SPpJD0tYAuq31f4xb/HzfPFXc=;
        b=nR6zCfAT2dyr6BnQmErM0IsIp7JE6jI5s8SMnxI/Qv4VCc0bjXcUxraDRFnK7pXpOP
         0tCUwTFUuVyY6cENkgPoQH/NOFw8hFixsv83MnTih/S7Q0sCJ577EWOhVisDAN0evIZz
         eROjRfW8hQkKrq6/K3197LKk3j30WkZj/xv9HG9tPVyWfF02vjy2joVbu7qLnGurpQbr
         UXE3/zwquTykRxhHDgMJ4QWSY6Ibk7Q5wC3pNc4NjIEoXdR4nixv5jKhvzQ7cyyy7EDh
         SNdFTOHTbY63+RpQ3qmPgthBEC7CeMAGq+bTy65oSKn5G6KptW85nRext7GhUyiiy6qd
         fEVQ==
X-Gm-Message-State: AOJu0Ywx0iDx189eSMpcZTM22ffAXsG4CuW+48mUBCGTHgnJ8N6cTixp
	MJNl/2TP2YfxF9ukh7/ndqBM+f+CJ3d7fFYDZhrUIA==
X-Google-Smtp-Source: AGHT+IGnQDATNh8SVvuTPpeK5rXtMp3Vtoks/gC4qZC6N/Y4cLoPyTPDQU8juOZJaNHNzqozv8/nIw==
X-Received: by 2002:a17:90b:224b:b0:27d:880d:8645 with SMTP id hk11-20020a17090b224b00b0027d880d8645mr17058990pjb.49.1701211987790;
        Tue, 28 Nov 2023 14:53:07 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/13] vim: Improve locale handling
Date: Tue, 28 Nov 2023 12:52:37 -1000
Message-Id: <14982eabcdb96c2f7ef9e28d6c0daedb53aa96c4.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191405

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When making checkouts from git, the timestamps can vary and occasionally two files
can end up with the same stamp. This triggers make to regenerate ru.cp1251.po from
ru.po for example. If it isn't regenerated, the output isn't quite the same leading
to reproducibility issues (CP1251 vs cp1251).

Since we added all locales to buildtools tarball now, we can drop the locale
restrictions too. We need to generate a native binary for the sjis conversion
tool so also tweak that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d8e88af22e..1464c4f4f4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,22 +41,16 @@ do_configure () {
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


