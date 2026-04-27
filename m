Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBF5FF8867
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:34:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6925.1777325663397467757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BD6htdaB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4411e1eba51so7379013f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777325661; x=1777930461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCKNV6/QIHqxNEMp8WZ/9E47H7oc8vbGJzAw7e4dxIQ=;
        b=BD6htdaBj00GLzBnn5KrneCq2F6OoFkrBLwkYh/Du9ggq1AFsAILm85mBkSPdz9NR/
         af8MGhw104Sn0Linc7vE05YzNcQQtha7B3l6SQeajB0X0aC8VNqn3pD1OkLY4UVC81d+
         WeFj2wNFpOfzUlfZR0D7hXhY2kzbub7sqgGnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325661; x=1777930461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCKNV6/QIHqxNEMp8WZ/9E47H7oc8vbGJzAw7e4dxIQ=;
        b=ZGoA1RwNRB0MwubLFxjV7QZWUgyuOmT1bTbLsx50Ec4bQkOobW7eKg05O/DgP1HQ0n
         YMhI0zESl41KTbeilStUTIRdBIHkJ/RP/8UtWZuCDfLCGqWhL5dw5I9e8Vg/ptzPDX/L
         1MKwMRlD2c+BOWs19096vy0ARSXoRGRb7sZevyF00EngJWAxzLxlVzTUu4BJ2MK7S/D1
         7GGh+wKV9tmhVnyMjAujvW+LcQ044h4gPng/lSHdAKYdhxYe4tj4emtvb3VY4PQRCR2m
         QIVASZgGSxg5dUapjsyeqmTMpY/YliVR0UCbPYjekB2YOaH6s6onEbFdcB0d1nOOf9Oc
         4sFw==
X-Gm-Message-State: AOJu0YysjLPRNN8acI/HkzQygfjSXwIDfdmI+Pmin1bgIcd2wBQx0Dzs
	SsY3nvoQRoQaZi7tNADdp4HzquCJwFekXpFZaejVzRXe9hZS56wZaVVLtRz6eBcRDU32WR2fXmJ
	EbMztyrc=
X-Gm-Gg: AeBDieueJRSus61FLde2gQ+vV3mhjTBfdxDRuBtR1QFk0j/0ErZxpIgbkJvoMiPKI/I
	n+lV9xn979AABqnnQiZByqF851K8etMq0g1FZnu4qswXrvJNuHF7WtFJd4hahYQfoUisinaJ7lN
	tb7qU/1xPPnRs5r4fPOD70Q+6z9P3mcHRVq8ZCLvk6BRdw1EkFcTrP3umJekEJfR0m8TmTmeo4D
	kPEy0+5V81gBGNtggO67Betm1nyBh1fucYNwJJen77ND33EQhzK+ZC7oXatkbvHJU1sO62lkHND
	gaRagZRwP9ndYabPKSju2KvuVhBFLWeId7NEOT+DGzUf6JzWwQByPu6tsBKi8r+CLXee4O7HhxS
	D3t3rwDcSttsuzbebCgKCquBgN/NbgeAWxXs2tiq0WJ5C141SDo3PBeectk0jc6ETsta9nGqZRM
	NWU2h3oXW0TBrINZQwvTWQfvspfSEMWg4gIJLk9fRhmU25wKxyAHFmz/8HW8iCxr3SNLhS/zLk
X-Received: by 2002:a05:6000:2006:b0:43d:7e6f:3816 with SMTP id ffacd0b85a97d-4464a72938fmr734483f8f.40.1777325661218;
        Mon, 27 Apr 2026 14:34:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ee:ac09:77b8:6d78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59ebasm1187183f8f.8.2026.04.27.14.34.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:34:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update 1.9.5 -> 1.9.6
Date: Mon, 27 Apr 2026 22:34:19 +0100
Message-ID: <20260427213419.1030226-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236030

Pulls in the changes:

  * Makefile.in: Bump version to 1.9.6
  * pseudo_util.c: Fix symlink processing for symlinkat and related
  * test: Add test symlinkat and related
  * ports/unix: realpath: Fix chroot processing
  * test: Add test cases for canonicalize functions
  * ports/unix: fts_open: Fix chroot behavior
  * ports/unix: fts_*: Certain functions were incorrectly returning stat data
  * test: Add fts test case
  * test: Add test for linkat chroot path stripping
  * linkat: Avoid a segmentation fault
  * Only copy xattrs on a rename if it's cross-filesystem

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8c16aa71355..b118f436db8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
-PV = "1.9.5"
+SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
+PV = "1.9.6"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

