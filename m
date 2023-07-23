Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE18EC001DF
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 16:54:25 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.29781.1690131264018693956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 09:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sc2M3Tn8;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-26813478800so195506a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690131263; x=1690736063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADI7E+q0Xqbitorw1AuoMLNtNkkHd/VKNCfG3U4BQDA=;
        b=sc2M3Tn8bCzG4HyRqnzSTm0bboFYjrw0dNLkcJvOxwt/d2/CK6RkqQ4xqJoeGCrBhS
         KFhSz+FpAzoT8k29D1rqjQvEasjBG8Fddmk678aD2zpDB4+8l9NAUXGv7shY1reKLlRP
         jhu/GosQTOrLwhDFf9DelgF+fUOFmdawLiqxA7xDtNOT7VL36lIY2i56hR2/2SblczXH
         D0oKsygBKYqHNHNILGGHYVHt54KTd0I4u0LcsM2UKGUCqJ+CRVHU9pJ/Cj/kAqMgqWc3
         Rb3pTKSzTZ3u1DUOHnzusWFHyXvGSpFG9zuTsQwDdXikIOjD0i0XtksFSkU82bgjJj3L
         p1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690131263; x=1690736063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADI7E+q0Xqbitorw1AuoMLNtNkkHd/VKNCfG3U4BQDA=;
        b=TZAvCmsPBokNaYimqxOkltyLygbEz0SGEDpI/JPZHudgf9xko5E9GTHW3gGExNp8nh
         Y4bUekR1h4OPmzg+XEvV68WsDwRo7g6g9FjSWdEwQPfFfcIUN1IJ2KL44Fsr5jltu9/2
         C4ZAiB6n35V9cq60mNsfzPDozH0p3SGTKOZwh2icawcB7KhPOF7rZvSfpdTbG/pkK5oJ
         BushHn22giaBClxoR5Von72X2B3JJEHNf7/CfJksac5XVJenSWKFauQEEZcvMk791FQC
         xqgbfaEKB88Rx8etpg8tk0I+SUFR6iNWBf19j0K97R+lZ6riIy9evcMfvqQDongZGUdC
         FB+A==
X-Gm-Message-State: ABy/qLYGF/er9CsHLhE6XuwjYfEaBWbeYKUE+XptQBDocKunEAcKgoz/
	WHLksUniaoT5VuIx+7n7+qOCHZnplAU=
X-Google-Smtp-Source: APBJJlHsBdEPw7GyFDktCqyCAs9ZmdtS3NBUMYbIxTIUXJGxNccfzcZkxkLTsnIkLpyw1Q3aRIFjLQ==
X-Received: by 2002:a17:90b:4c51:b0:263:5702:d4c5 with SMTP id np17-20020a17090b4c5100b002635702d4c5mr7185313pjb.19.1690131262934;
        Sun, 23 Jul 2023 09:54:22 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:9ac3:5615:a7a6:3dfe])
        by smtp.gmail.com with ESMTPSA id t18-20020a17090a951200b00268032f6a64sm1573023pjo.25.2023.07.23.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 09:54:22 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python_setuptools3_rust: inherit ...build_meta
Date: Sun, 23 Jul 2023 09:52:16 -0700
Message-Id: <20230723165215.4034727-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 16:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184762

Rather than inheriting the aging `setuptools3` bbclass, inherit
`python_setuptools_build_meta` which is one of the PEP 517 build
backends (for proper wheels using pyproject.toml).

Since python_setuptools_build_meta does not have a do_configure,
call the parent python_pep517_do_configure().

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
* All python3-cryptography ptests pass on core-image-base qemux86_64
* All python3-bcrypt ptests pass on core-image-base qemux86_64
* Basic python3-pyruvate Hello World example works
  (needs python3-logging) on core-image-base qemux86_64

 meta/classes-recipe/python_setuptools3_rust.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python_setuptools3_rust.bbclass b/meta/classes-recipe/python_setuptools3_rust.bbclass
index d6ce2edb963..d3d7590cbeb 100644
--- a/meta/classes-recipe/python_setuptools3_rust.bbclass
+++ b/meta/classes-recipe/python_setuptools3_rust.bbclass
@@ -4,14 +4,14 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python_pyo3 setuptools3
+inherit python_pyo3 python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-rust-native"
 
 python_setuptools3_rust_do_configure() {
     python_pyo3_do_configure
     cargo_common_do_configure
-    setuptools3_do_configure
+    python_pep517_do_configure
 }
 
 EXPORT_FUNCTIONS do_configure
-- 
2.34.1


