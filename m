Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E725C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:56:00 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.40964.1700574956512000908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A6EnW3wT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c4cf0aea06so5288439b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700574955; x=1701179755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=olTpUOrb+KfTp4PcPguWNrPFJ6spyfu8m1jTewynVtw=;
        b=A6EnW3wTe3RWpLYMUYMnnbfK6d8DpUpNABXx1mmtgybgwv2A+O+5dM7udhVo2fXWmZ
         kaRE0sSPKDCWFd8G8uNHJ0YWPKQgwwIIpGH87ls+ys37sn6JPDnLdFXCahF6jdO05Hck
         8wJdVSeAaBJgG3ElwHEASoBrux9ej3qdTUVkMb9giQJFn9GdRgMtD0tE7DJza6wRLRCx
         tSnnPKN7JlPO0AQ/z4cTPihWjHNvWVf8KI2BqtuZUsw9ABrfLGUqmRKjGS31KOGgR2WF
         U9pstJ3Q9IIQkFhQI+hwEQDJbjP3t6peUo8/uGYokQ6DRpZFviajUreKWwClp6xcjOoz
         giog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700574955; x=1701179755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olTpUOrb+KfTp4PcPguWNrPFJ6spyfu8m1jTewynVtw=;
        b=ZgnZRFHiN21nD7TlePb7qPH3jbk8J9s6xeHqU2VctI+bcVSYEBIxx6U8powA6uL0HW
         RbF8gE2PTBU+53dSzAVmqN3/KPuwav/FpgyDfbz7tYy8yD2pbK+vn2pQtximWW5h+7L6
         VxYnnPmc+sb/rQ8UnVXRNSoYUPx7Wu+WsFwylHFS2cpNpOmfrXQpU2y4liuyoWWqIa69
         S4jpKZu0Tsa8LAqIaI6i7clL+9rl39lcYP/gmcGueAfLQNBwsNRfuQPZJYto78znDXPb
         J1Uc7XywHbmGmAcOMIl7v8u+m6eYxnuyTOt714V6yBtoxoWP2EjUW6d4rUc+zEQdOdAn
         E13g==
X-Gm-Message-State: AOJu0YzriB2XWQv6dCxVIPcQRjjg3G7W6gjgWpHwdWZlL4MTZ1XgDooH
	3PdzcXrBpZX+m0kDP5PKNA0IQ/TbWiy92fRazffSVQ==
X-Google-Smtp-Source: AGHT+IE+ymkXFwsMHjENPDSCJ+Ph1/CvsJhZtwdwa6UtRr/55X+oJQVmbU0V0VZQ3CUtEaOCiXZR6w==
X-Received: by 2002:a05:6a21:398d:b0:188:aea:2138 with SMTP id ad13-20020a056a21398d00b001880aea2138mr14723901pzc.19.1700574955026;
        Tue, 21 Nov 2023 05:55:55 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id fc8-20020a056a002e0800b00692cb1224casm7960012pfb.183.2023.11.21.05.55.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:55:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: use upstream generated .po files
Date: Tue, 21 Nov 2023 03:55:42 -1000
Message-Id: <20231121135542.2943406-1-steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190981

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


