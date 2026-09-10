Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84592C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:47:12 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11982.1789040829921480426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=gJ4ljlRZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-20260910114706232f55bb8a000207e2-wtvzts@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260910114706232f55bb8a000207e2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Sep 2026 13:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RiK3Vkq4dP/wEMi2H1scWoFVNmHJ/PsZOat0pdYvizE=;
 b=gJ4ljlRZgvhAR+JwzDcvchxNhFPBhOpuD0dxZFjNDP3PCQKIgNTpFklIXfufqao9X9KfnL
 ZxsHIN36kGQLdcc+p+zIIdRIHtsDqoRMc6YK7AKMp/bAQH0HurLClLKnmulCekOZa7tkloOm
 PNmlWoqFFHiWdf5X6GtP9zc1YbxuvMS8oR8yyAGB6qEG2Z8TmD2tymfKsvuRNdRssndmlh54
 0QmFoFCcCljNYUw1TjVUJTeR+ZuiJIJ4HxPYXUxHGVaAho3tdEmu7SvvCDxOBKIAUhDDlZbd
 jy6FJmxLLVyRHId3YLwb4bAbQ1OfzAu+sua50UtOKGXbqYSROu2cHBZg==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] rust: add secure-plt to generated powerpc targets
Date: Thu, 10 Sep 2026 13:47:05 +0200
Message-Id: <20260910114705.1039230-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245560

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Rust's built-in powerpc-unknown-linux-gnu target has used the
+secure-plt feature since rust-lang/rust#136154. OpenEmbedded generates
its own powerpc-poky-linux-gnu target specification, however, and the
feature was missing there. Consequently LLVM emitted objects that were
incompatible with the secure-plt toolchain default, making ld fall back
to bss-plt and print a diagnostic that rustc 1.97+ exposes through the
linker_messages lint.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 58c36bfebb..1cba275b85 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -254,6 +254,7 @@ TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
+FEATURES[powerpc] = "+secure-plt"
 
 ## powerpc64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-i128:128-n32:64-S128-v256:256:256-v512:512:512"
-- 
2.39.5


