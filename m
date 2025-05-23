Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82CCC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.40734.1747972368038415999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WF6bW+tH;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-232054aa4ebso48908435ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972367; x=1748577167; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=WF6bW+tHKPTlsgarZ2v5K7gnv1IxvioyboN/CI+0dEiHwx6a4Ecbvn4je5U6b81V/0
         nCskn0U0KttRBSrc7b1V6m++jel4iTWXI7+G7WYFNakxHDHaW5PnmoAP4NlDiG7hgw1l
         UhL3a88zWsdtRnY9tDybac/Rkz8F6LaK760igHz4sK2a74mWA6y2JYfnUhVDbjAjkMfW
         R2AumlB5CkTVVB9BeXc7it9uxW9o2W5E24GPIA0tKuAClzKrbF92H94IK7nrqe7FyT3s
         p8VcaGzw74CP03UghZcNj0pshCVRONJAmuGequgwcbm9dVwfx0L7NA9AZfMmGZw7j3Me
         xWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972367; x=1748577167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=Fmp+KqYhIoiz7ApUnkyiVHhuvDyhO30y6HdmzY1qRpY4VK3axJ8R6c2981v+pRWnxU
         4AX31qDrm3UCk78uUOjBiEI7qjHG48V4XCGucV4VgZ//wt53VhOFfFA8+nTt463vPamP
         pLFkc7YVJK2iFvo3j82PtXtCBglRH49h9aP9lWIrFhK8vLQpM64usiy4J9CVxobuh7ir
         gg7L7FoC4WkQ40+aOJdq6nWdUkcA7ESzVVHbvXxBiyo8f47+o+rQx/FL7b0b+XdTlhGA
         OTjMmdauSU1vMQE6uz4dv6mIE+Qrx+t0cvkltFVchx0sNykmQCEMS3RpED/HlRwCQ9xU
         ofaA==
X-Gm-Message-State: AOJu0YyECjCtCKmasco0H7/wqAX5iRUNg5LlGteZGGIEKXRZSQYz6Vp7
	XPEloFMsg+GOTbwX8SQzX5SZsT8gcmoz4QprMmOkHfIE4xw55Vo8hA4kzpi9mgq9
X-Gm-Gg: ASbGncuMR4r029mm3oQ50kMqzOf6sGDMD15Bcf9h1w70bvTX+fUFSE6t52VF4whtyrH
	wYCuHAToHui7NV3IQrhH8YmxywySAY7cM3f2OrdeHEw4j+Ymtq+9Lb1xYiJzzoM9fjAl3hwauOI
	uIbF2fOkZa8u3LqctYhlHMFElJqUNHQZDZA+oZkoZFBQ8uj4bXWX7QQtKH+uehfSll6vycy8xZl
	5M9fGYU8/l6PJ+NyHtGsiAGkujyzFEGtWSddT9WwZgaxkHQ8Uj0Xf6HYTJnW+W6Z5EuymT9m/b4
	RnlQ7UJ+GnV1vX05QBcgrjGFEHbTO5EkBuWuKNeUz8w=
X-Google-Smtp-Source: AGHT+IFfASPPhoDE9LSgxM70L9qP/rqHVPDqAitkY+EFBZy3u6ygtJ2DtHM6NbeETtg4R+DvlvQQew==
X-Received: by 2002:a17:903:1745:b0:231:e331:b7c9 with SMTP id d9443c01a7336-233f21c7cf1mr23569985ad.10.1747972367041;
        Thu, 22 May 2025 20:52:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:39 -0700
Subject: [PATCH v3 05/13] tcf-agent: Fix ranlib call when using llvm-ranlib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217165

This ensures that binutils-ranlib or llvm-ranlib
behaves same as gcc-ranlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff91c8f112b8122a5c6c30 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -51,6 +51,11 @@ CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
+# This works with gcc-ranlib wrapper only which expands $@ shell array,
+# but it will fail if RANLIB was set to <cross>-ranlib or
+# <cross>-llvm-ranlib has same behaviour
+RANLIB:append:toolchain-clang = " $@"
+
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/

-- 
2.49.0


