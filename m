Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC3CC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:37:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.45375.1742837838886445961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KLxwH4TW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso35323695e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742837837; x=1743442637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTXdTe2LiTKdlf/04QrV4ZoRH6bCDBFJV812tthr2Gw=;
        b=KLxwH4TWkJ+xizBtXf4T1d2lYUwNWf4oVgwN6mEybwHZEu5SwdB4nhSo07biYb2ttA
         /5pgu09Vuzg3CwIVgaN+o9vWcEeYcqjsW0Q1pAjCI1JyJAa58wInkF94lSRqblLF8lQO
         VXkA6O78xPZbsdaS6huz074QpfbJOAz1CInP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837837; x=1743442637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTXdTe2LiTKdlf/04QrV4ZoRH6bCDBFJV812tthr2Gw=;
        b=eoKa9TlwlaPr94oLEKlhUEcBzhFEPn8a85nh4z5WfczAHASk1FzitrtzRkjz7qdNff
         BawjGc0mOF0kBlT1YzeZvmLK2piAi1Dt2l2U8bekOWEhJzW1BkH+EK6eAB+QleQiDjb6
         uasSLdHsYiyIAppaXyz8NWVgg0BGeGEGWN3q6r2jhyzRYcj+mN0SWWZ2WDvPsSz5VBZJ
         ckXXmadPpFiZ39ECj7vaNiN+Ey0OdI7HicmrHTMfOFA/uvG2Kde5hQ74KJVf8heV4XXe
         VSnQFU4nTVuIYSXwdCSSEQHQvdEN2hvU/kCFPXhdAsjMJ0E/M54P8uiUaeejNYsjOhnB
         3RZw==
X-Gm-Message-State: AOJu0YwA3Gqq+N7kdtCYm3FZ2hQosCZRQLUnDx51pVJTuciMOpnb0Pw8
	5/Tv6smXaja9XMrDVYzMtTOCJDDdUg9CzuPAbXpIjDLjxsnogH9KbOpDdAGHLdGrbO6bl6ZZrl7
	c
X-Gm-Gg: ASbGncsg8mkclN4pzPxbSbvZiGW/c5UjPLXc2VNGV+kFJGCf1BRoZVCfdYdwhTg0hzR
	yUwzpOZJxksbaQ5A4REQguwrWFat+TxM0eTi3cBmI8TPKfxWr4DrTxGCpQXIehunTWWhGD4QyEJ
	778xt545LRp8SRSkA4zjKYkGAMORf9oZ/HSPFTpYwFfFsKYt5SQs+1AokuK44mk3XSt3hFxjKv4
	Ryd+Ha8c1/FGW4qlVMQ5aAhVUnHFXgNIrLoSGSbJup77nwiIQP6/Q+8t4CMe0BpwJt4Uf/Nz1B4
	g2GT5xDU3+E5zdvbbiVkW4ZjmHQGsid2DFSQSvJXRee7iUESIYVrL45d7lLygbcIqv17N2T5e2Y
	pAAQlc9g=
X-Google-Smtp-Source: AGHT+IH7cpCPMzFedglo1XOkfeVcW2us+UOA7EFktEqmiWrY494ZZGej1QNiDI5ciaUlaJVusUTbmg==
X-Received: by 2002:a05:600c:3b9c:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-43d50a4ada0mr87023235e9.27.1742837836762;
        Mon, 24 Mar 2025 10:37:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd27b59sm126626685e9.23.2025.03.24.10.37.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:37:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "cargo: pass PACKAGECONFIG_CONFARGS to cargo build"
Date: Mon, 24 Mar 2025 17:37:15 +0000
Message-ID: <20250324173715.399785-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213566

This reverts commit 16745b20452de60ae2474433cc1a2fb1ed9f6a64.

A recipe may need to pass PACKAGECONFIG_CONFARGS to rust instead of cargo
so the recipe does need to make this choice, the class can't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 461d100dd96..76a39668c7d 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -48,7 +48,7 @@ oe_cargo_build () {
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"

