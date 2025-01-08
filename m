Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099C7E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:36:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.11130.1736307392574565342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxOgr2Xp;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb94cceso169650285ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 19:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736307392; x=1736912192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng6dD2icOL6G2GDc/ZBkKTejOEIb+ZxM+xpJN0wMdCs=;
        b=GxOgr2XpVgLbeQUP/+RNbNbCcQeHMLTvPOAnFLeZ63s4vLTPKf2cxsfgx0oxIWVs9D
         KKGUTiNWZQ1/9w80GSEJP+cyFeRHoZxF0gQvCvilprQ2vK81o3nmV6uie0axCKTYr7qJ
         q+LmgSc9EnjxePp2yjli4ylvNHDMcVInWhPmxK3IO06SYIEWGhJ6mT3zQvvc1F+HzEGx
         NXUIhrtyLKXrtzuMXTRHvWHBd7Py747+61mJJEn8tVC+NftOM50McaRUgcPdW97Mahxb
         5sP9cpvp/xmO000gSStvDjOxQ+zDVgYzJPYs4ImM76AxezeXkiIGrLlMYB9SVR3xfqvC
         6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736307392; x=1736912192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ng6dD2icOL6G2GDc/ZBkKTejOEIb+ZxM+xpJN0wMdCs=;
        b=rqMAAEueY/Y9E3zxPEqCIoKLXDk45LuqEvmvIFuC2nUDStnetkdhSrIe0TJahWHB/I
         jUyJuwKuYHG9eJZn7uaauNaINDycuMaCdd2J4vyrDx92F4uCjQG9qIJeg3vdi1lnNJ/R
         hpneEClwqJ5bRl7QgSXTT5Vc5CEBYcrZYllyjYnh1mdm87pYlKsuZ7MVkVphylp8qm6T
         ip1yOAYuA/Uuq1XwmLkQjWCX7+nFtws5sxvRpGV8GM4mVcmvPIpcdjZs06o8+wIqCWXq
         g7ZTvJ7SggyYCzNg0kOabWKZNet02Gp3hPROQlF14B2Q1oM5TVptgebwJcMlxgNKd1+k
         NFrg==
X-Gm-Message-State: AOJu0YwXvEOb/ke2TW/ZA6VAEd9x6cZMTFif88hbGXMhQPBK77LD55EL
	se4kaURXx+YCV8yenLwBtl/0+hS/lEh5NsLPmXD45zw+K5hXTzvuoeYReg==
X-Gm-Gg: ASbGncvaZuZqwk/+xgco+oFZ4qdbg8btXiMUCHc2c1+aita7/rqOhYyZgeaAwlwRSWP
	/DjvZYrea+f+3pVPrx6ywlruIxtKEhfyp6pKbMBUXiqazY9ouZKPzHoZML0TqsDoz0p3StWF5vS
	/BgjwvJlWexkqKBDmLu+wg2bbbqY+UuidiLk/hTg2ra9nk5UyDE5dJJLNzKJg6g1L3r02IYbAuh
	63Kazth07DhP3gz3SA/cRDsvmW21alzdwjzt8OOFgx7a1En
X-Google-Smtp-Source: AGHT+IElVU9LrZPDwDQgTEBqBE+hrPNBAGTt24HXqF4nhtOM0Pv2i1bza4XUQqMbeIjEbYG0Bw8IOg==
X-Received: by 2002:a05:6a20:c91b:b0:1e1:aa10:5491 with SMTP id adf61e73a8af0-1e88cfd7605mr2646086637.24.1736307391772;
        Tue, 07 Jan 2025 19:36:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm31792116a12.7.2025.01.07.19.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:36:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Disable JIT on RISCV64
Date: Tue,  7 Jan 2025 19:36:27 -0800
Message-ID: <20250108033627.2889555-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108033627.2889555-1-raj.khem@gmail.com>
References: <20250108033627.2889555-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 03:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209510

It does not compile anymore with 2.46+ as we dropped the patch
https://bugs.webkit.org/show_bug.cgi?id=250681

This patch it seems is still needed but has not yet been
accepted upstream yet.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.46.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
index ed5055962a9..d8b91d66c71 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
@@ -123,7 +123,7 @@ EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT and gold linker does not work on RISCV
 EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "

