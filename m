Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.61218.1594051900251716779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HiS9ZK5P;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id w2so17794400pgg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=99hkkYy2rGRxELC1Pi/3tEyqG7uxarbX3fULgX8SAi4=;
        b=HiS9ZK5PpuaB9YPsXafvN68GiMW/6j3ghWtZ9OW410Mxch24ge7/AcvW6L5oS17HHM
         PZq8ph5vRWvmfNkKZY9mFgDqPS6PKcdiebgjfoFP+IpVAG2FbjLqId7fbv8m74WdS7/g
         MXdUbKnLIv7sRilZIRXLBVQQjF48i5UVivQQMu8vk+J0NN+FFItaVtbchSQSmvBVjBlz
         suk1NMJbOY2xb3aQNsTtncX+7sRldh0LRsZRcemT6Dn9aXHfC8+cdHtH25arncPKO5ND
         QyGwJ05nk1sRnTiYxR1iaDee4ggvCjgg4gFB8Bagv6eXrJsLCKaaPVtPe+1uv/JTlybG
         bT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=99hkkYy2rGRxELC1Pi/3tEyqG7uxarbX3fULgX8SAi4=;
        b=oth6jOR6XBXYG3ctStOsb9Sg7zMiEwjXyaPO73EZVcTV0DOpE19e9vjyRLzEtoyg7d
         IW8NjpUC8cnW+JL/Lyuw87KeOg5cgpYiqoFSexoCrVoXBH3aY8wIlkjw6h77QepWdloH
         63hyCTpdEONN/wYl186TWEIVk0Cj7+kssLiOnk8P9iKPTx7Lb0XrhRj0nt1OKtVDnDT/
         rlB2h9gubdj+cTq+s5xCI9NLiDCOebaTfivNZfoiGexYU+EBSGeZvSGbO3yc7F89deGT
         GgvlLuKwKARdA+7RNi8Rm4BE3AkgoTa7iLvFmUYgHyAJJ2A1P4+nq/biFkrH+raRsycY
         MK5g==
X-Gm-Message-State: AOAM532KS9P3CXdx+KHV9pnuFuZy6yb0zfYO3xxdMDOhiraGx2znD5kx
	sXWnsl85jN5mLCEARR1FnjZLlkgi030jgA==
X-Google-Smtp-Source: ABdhPJznVWs9HeSGJQ2f5bL1StV1LF0KyKC6AqPAok2vXMm9KXYDoxPi+PaDkBVGlq+pMvdVrDsJAg==
X-Received: by 2002:a05:6a00:148c:: with SMTP id v12mr44530651pfu.171.1594051899354;
        Mon, 06 Jul 2020 09:11:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/25] classes/archiver: run do_unpack_and_patch after do_preconfigure
Date: Mon,  6 Jul 2020 06:10:16 -1000
Message-Id: <3c9dfa31c3ffcb882fb400f2513e14ae1d830ae6.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The commit 8a7c779487 ("classes/archiver: Create patched archive before
configuring") fixed a race condition when using the archiver, but
introduced a bug where the GCC source would occasionally be deleted due
to the archiving code running before do_preconfigure. Instead, make sure
the archiving code runs after do_preconfigure by making
do_unpack_and_patch depend on it. This makes more sense anyway since
do_preconfigure is effectively an extension of do_patch.

This fixes errors like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4be264061023ae0ea6e023d82a7b99605bfc22c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a8d3afcbe9..bf275f4543 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,8 +583,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
+addtask do_unpack_and_patch after do_patch do_preconfigure
+addtask do_ar_patched after do_unpack_and_patch before do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.17.1

