Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FF8C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 04:55:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14142.1709873733806372061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 20:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUH5tld9;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dcab44747bso13512705ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 20:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709873733; x=1710478533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=em+56iknvNkaGhCEQSnISwEBAycw5o3yP5g2YIgK0ns=;
        b=DUH5tld9dhYCtrtHTYKX4IQqzWs/fNuWJg+tsb82pTt2oPTC13CWiFIQzCRvSC0qcx
         CuI2bVvz5fUkuabBBSCmcMVuHjFZZs4xrd+63yJMm7vLBKw2KgF8V2OQKq+S4ZxaZFrP
         Yjxgg5t4enwfPVfGLD2SYKvnkBG8Iuy0EyZQH3uGQ+MJx7iwPIgVV9wIfDX2E6MRBCsv
         rkZ43Buh8XIuNt1ZeBQZ5fHj8Ve4iviyqxIzbApi9uW4oU2ZGmJRhII6z0bSWbb8jGMy
         bMSNBF7YmfAWf03TMXWdO6zHbbGt8NNeHYNzMAZmM9rGRWmdgiq5RRsYr6enyUmauuKR
         MW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709873733; x=1710478533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em+56iknvNkaGhCEQSnISwEBAycw5o3yP5g2YIgK0ns=;
        b=U/aa8dKayptEOu2rxFQk4PaiPn6DEKAXxhhAzDa0AUyJYI/5lFsKr4iismlvIQr/rd
         27mk5SZ7CRk2p5BC0BFaDW3yHfRzGI4w64iQQtoH+/5HThU0ZLNJufB4KHRh0O8eSMQ1
         ve8y5zA5sJKekxmRk7zwxvcZlJbT3PdbhI0Ku4rYp/XbVcBCiHasY9pAvgoSvRXY/FXO
         dJ17pUUiFYOXcyd3MSNUMy5R/n5UksEl2n+pKHdFPiQZkVc8lUURhpFJ/PlE/UAi+Ibf
         BJClZb0BBW6ahin4MydMbTXbvLfXMsAwWpJS0a98l5JTZSe4AmhVchxXW6NYCVojLm4o
         IYDg==
X-Gm-Message-State: AOJu0YzqN2i/sRWqvRIjA90mCIeEtJnY8U1ChyCv/Xoax9dt6M0NAN+1
	O+XOkjf4sZZ8B3Xq7cEGD7Wc1kHq6DnGWai3cg2VLgMYrN0TWmMbBRLpfmcpQA==
X-Google-Smtp-Source: AGHT+IHiTBiknmXINOKTwSMWRAL7W+zt0Gr2OjaGjaV29wdaP1TQbnIU/p0SjQpN5it7eD2/dYHLuw==
X-Received: by 2002:a17:902:e88b:b0:1db:d7a8:8508 with SMTP id w11-20020a170902e88b00b001dbd7a88508mr11095025plg.52.1709873732679;
        Thu, 07 Mar 2024 20:55:32 -0800 (PST)
Received: from localhost.localdomain ([103.146.224.223])
        by smtp.gmail.com with ESMTPSA id v12-20020a170903238c00b001dd6c0800b4sm158762plh.188.2024.03.07.20.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 20:55:31 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][master][PATCH] librsvg: Fix do_package_qa error for librsvg
Date: Fri,  8 Mar 2024 10:25:15 +0530
Message-Id: <20240308045515.32130-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 04:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196843

When using meta-rust layer for rust below
do_package_qa error in librsvg is observed

Fix the below error:
ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were found, failing task.

Upstream-Status: Pending

gitlint-ignore: B1, CCL1

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.56.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
index 9824b8898d..e6eece6858 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -77,3 +77,5 @@ FILES:librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
 RRECOMMENDS:librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.25.1


