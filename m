Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C095EC07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.10468.1701211994171981538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=akvg1Eey;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-285196556fcso4892983a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211993; x=1701816793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiGJbOGn6iZSAbSE35tCbhpFw36mA4YXhD3+EnK2g7s=;
        b=akvg1EeyNR3HpsNgP3TK0FXswDQHL8UwR7/8vHhGSv4V8OdbLuvwT9pT1OOUtyvBTA
         4LJ0OV2JcRs1nGJwn9yhdks8o+WO+widvcc7e1NZopnaXVKWjKYUBO9UOqMEi69/W8g9
         y+4jnZgiEHZbnecZqhIqBUecah6KJbfVtN7bVWvCXwSXKpGi3uyevwLNByq2UWZa9nXr
         OMSrIxp4mvfytzxSD7PhYxJmy2AYe337IBk/IGqZnFGUf34pmV+tq/sH5XfqTZpDbgcb
         yVzTzukXBLCVv4b8Tm+XJOYlbMiwkUCU9z5NVG26xt6pBIeWTjPE8UDOOrk776dl7H4t
         jfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211993; x=1701816793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiGJbOGn6iZSAbSE35tCbhpFw36mA4YXhD3+EnK2g7s=;
        b=TYpWkqmtCI7NllUnnbKXe5wNdCubYntSyUCbNwJEIe8uwgSYWJXAc/dv0rw4zmQEGc
         X8ncXb80zBwpmmpBFfX7Jssh90B+YCtJ0769ZPD+vLc30VE5TbV6EwQ8UepVWvtaWRbf
         i+KqdMqYjYuM2YxXYk4kUypl50xZniIrIFjgXq39MBR5CGmbBKpVDQBfiWmfuYQ8gNy1
         nMfbK17RE+uNRwpqXHT7h2wXn5LfHaq/UIAmOh8XhzjXbq3hTA1lheGd/5vahKbW8Kj0
         l0xKm60YbmEClCkNZhT6qphWgBZGTn6DmPULOhhXplm6e19aXj9YxfHCbWSSpBYZlWVX
         sxpQ==
X-Gm-Message-State: AOJu0YzhYt3Tnf99yFNXqi0MtM9x7PAMFCLumHcnUAS27JTGDUUy0KQ5
	vQ+Ao5S8/TuhJ/FxK7JbtW4R9QT9gbL4giS0VAI3oA==
X-Google-Smtp-Source: AGHT+IFaziuPp1oCFlp4sR6EWJZSutG2HVpRzzAyIv2lKHQE2CKujnRc2YWj/9grvPkj53A3VrAfAg==
X-Received: by 2002:a17:90b:1bd2:b0:285:da91:69c2 with SMTP id oa18-20020a17090b1bd200b00285da9169c2mr8281118pjb.45.1701211993323;
        Tue, 28 Nov 2023 14:53:13 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/13] vim: use upstream generated .po files
Date: Tue, 28 Nov 2023 12:52:40 -1000
Message-Id: <0764da7e3f1d71eb390e5eb8a9aa1323c24d1c19.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191408

A previous commit attempted to fix reproducibility errors by forcing
regeneration of .po files. Unfortunately this triggered a different
type of reproducibility issue.

Work around this by adjusting the timestamps of the troublesome .po
files so they are not regenerated and we use the shipped upstream
versions of the files.

The shipped version of ru.cp1251.po doesn't seem to have been created
with the vim tooling and specifies CP1251 instead of cp1251, fix that.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9a74a52b52..0662822202 100644
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


