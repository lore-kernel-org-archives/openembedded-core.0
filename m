Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA70C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 03:13:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4645.1751598833237398292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 20:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNonG53O;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso594166a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 20:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751598832; x=1752203632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eovDcf6odFM8mEfLcvOeSALEUSa59aFOyUkLONyPbuY=;
        b=HNonG53OvKpnvGW1scsn/Gs1gvlEt6QKaeR6Lu0Tj86N8O4mTB1JxH3PrS9mRqrVNl
         C4qjWR0Ad1OeOQR9Pw1A+D9MMWFldc7cZfkc1t8gLpngIFpB1AB+vsq8qttFALGFKwo1
         LHyKECADRqWnfDqyy7K4/husgyo2iYIe9uhHd2uwEhvykVw6ttkc1MUamKnu6KHG2Edm
         ZaNt0ZJkoXyOZmbEzO4B1snJsAavhMUksK/ih94pR02yeTDepAhpfaHqs/Ucux2cLcIZ
         REfrXAgt6ZI7tBlSR/XveaElhr8cL2ltLfa0uUWSiRj4YmKChG+I4O9+EbF7ZDxGpIeQ
         TmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751598832; x=1752203632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eovDcf6odFM8mEfLcvOeSALEUSa59aFOyUkLONyPbuY=;
        b=E2fg7RrCaCfAo9G+ELLlDYue3IySDDuj8PPyW+ukyqny2zAfycuZdDcHX4sASYZbda
         R4NSLWgRTs6rTnOYDZZyTMT8wPVi19z6cQ84A9/yoj7Ttcmn5eFdR6Ai1tj9inNtSpny
         zIiIHjtbKuqhqnYdgOeN5M4R+lfIFNaQuziWKpuRSgZEeYRlEO9TLUfJhik8m4gTCbiC
         hrMNfACpHrkQUcU+0UEIQ7/JQbfghX6jHNokQCgYQRn9VCP+XgdV163pro+q1w8jlw0n
         bnrVQUWLgEYvs21iVtcjor1xl3j4gOZoD7jQ2zZgIgiWz65Isdn2ScDBV1Lfi5BFl/oi
         I9SA==
X-Gm-Message-State: AOJu0Yxjl2Qnz4+NcxYf6XJ58/SD8QUfr9WpVKAT9g/vtKHAaRfQz7VP
	4kV2Z0BBVmQybsvxEhXeT9gha/ePGs+juR2/QfjL5jheDPN1lBmuolOHyscAI00+
X-Gm-Gg: ASbGncvkkaQbpUQahOaeR3Csg4O1VEkElQ44qe6qoBzIt9OMwlg7VnHSurAdpXfUbr8
	DJ3RL0tJazJNTDbpSxQklYy2i4L9yl5MgAsGX1ukDgUEQHNs7avnIUxxLXInLrZGLJxptvYVxs+
	h4OYXcNF+PHFXAWAENuNl1dbrMhKSYDt5CfKAiBKh3tJv69lyhXJSTK9x/K4O9Ly93PPNE1m8QJ
	c5MpDk9sqxMLJ4P9GRIN9qAA3YOK9bhWEQYlzhcLNqtcJzEBz/8HAADkLLrPIXEsEpdvOEPupdd
	jBzKb8/guF2ErwucvLVBRuwKLw9Ute09xa+Mp7Ko/zxKTtpZEplJyXrCUqxd515Y
X-Google-Smtp-Source: AGHT+IHFicxWPLGky5SvImWc5e7mVfioeK/83w710yW2CkHEyNpfnOSodWfoY3n/RfbKZWM+RE4eTA==
X-Received: by 2002:a17:90b:3e83:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-31aac4cd4damr1369577a91.25.1751598832306;
        Thu, 03 Jul 2025 20:13:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455e739sm8774655ad.119.2025.07.03.20.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 20:13:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v6 2/2] base.bbclass: Deferred inherit native toolchain class
Date: Thu,  3 Jul 2025 20:13:49 -0700
Message-ID: <20250704031349.3388250-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704031349.3388250-1-raj.khem@gmail.com>
References: <20250704031349.3388250-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 03:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219898

use TOOLCHAIN_NATIVE variable for selecting native compiler

Default it to PREFERRED_TOOLCHAIN_NATIVE, a recipe which wants
to enforce a toolchain can do so with

for cross toolchains ( e.g. target, nativesdk )

TOOLCHAIN = "gcc"

For native

TOOLCHAIN_NATIVE = "gcc"

This helps build native recipe with clang as native compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v6: Rebased

 meta/classes-global/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..6be1f5c2df2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -30,8 +30,9 @@ PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
 PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
+TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 
-inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

