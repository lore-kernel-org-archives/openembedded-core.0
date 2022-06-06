Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68285CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.30984.1654516909299934436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtUCI84O;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t13so19560240wrg.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cZzngFStWJ8LCzzc3CMAzyfWxtqAkqzdYqGjni7MWz8=;
        b=AtUCI84OYa28ZLRvN04h2C+Re7iYrexJagXLkxzLFR7D6mMsdOHWLyLRNDtX9ocgvl
         YW8wjBtLlDiVp7lWLrAx7NqXTxgD2Tqrw/1dy26VZYhoIXrNfnXZ/FJ/gFZ+UWVzG+HV
         zeas8i11VD8J+dJP1qMY4ratKbHo3B9s9mKRBgFl7xKHo3aINjfJHrYFxgtCMozhb4cj
         g9oMke8TuxLVI/GdbB34nS9k8zK64sUtVJnrnAlSwJl19aB+Pecf+8P56IXJmdx/cwc4
         yOHNgmTrc7z3BxooC4Jm592qurezbhFumMxjHhyprwYWdfKZnjhqTsSP2jB09y75mVh+
         KCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cZzngFStWJ8LCzzc3CMAzyfWxtqAkqzdYqGjni7MWz8=;
        b=ZpiMyp8HXHAlsTflxCUx4rX9F5FgaFVxPmSlww9lzoPkEzWDn1S8QMM3FQkCzD3dPw
         /xMFW3xXboDVq875mJ9mAJxlOHXRH+f5Y7cCoDeRQaMWmG5QmTC1IBMuaEpJQBA/H9dH
         WsXj6uHQIDDf4pOl6Hz9W2Fe7q/T63jN/W0MlCMCCRBlkQ7k7kDhtzMNY8FhIXQUJL6A
         dLBSxcwIOA65NOGAPaKloAxX3A58PL2iv3ddZ3iJfPjYZFDWxmAXaPFVCuRLG2E4yd2W
         GSl1buXvRT9fAY+X9zoW3oevuKTzHROg34WfZsoyytuaYgeALE7oqHuqqjL+a60o+Fgo
         tcPQ==
X-Gm-Message-State: AOAM530EjIT2N2xlronCw3ZEOir+HBUZzsg2eY5EN2c++F5wJspswpQr
	7688qpcOzAfB3imCHWoUdS45ZDGbKwPBxQ==
X-Google-Smtp-Source: 
 ABdhPJy+Jv//71Yyn45TRbHQ0PtEFh7Jtp99Gsn4LMectJd4cbfrrMrQZtp0zvs5NtefZQRlD7B33Q==
X-Received: by 2002:adf:dc51:0:b0:210:21ea:8840 with SMTP id
 m17-20020adfdc51000000b0021021ea8840mr21351831wrj.664.1654516907539;
        Mon, 06 Jun 2022 05:01:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/21] perl: enable _GNU_SOURCE define via d_gnulibc
Date: Mon,  6 Jun 2022 14:01:26 +0200
Message-Id: <20220606120126.3381438-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166614

This is needed to properly support memmem() and friends under musl
as musl guards the declarations with _GNU_SOURCE define, and if the
declarations are not present, gcc will issue warnings and generate
assembly that assumes the functions return int (instead of e.g.
void*), with catastrophic consequences at runtime.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/perl_5.36.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index cb82cad36c..60785c72a5 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -59,6 +59,7 @@ do_configure:class-target() {
     -Dlibpth='${libdir} ${base_libdir}' \
     -Dglibpth='${libdir} ${base_libdir}' \
     -Alddlflags=' ${LDFLAGS}' \
+    -Dd_gnulibc=define \
     ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
-- 
2.30.2


