Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEEDF8DFF7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28257.1776378793095939232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=btaMK7gr;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a29e6110so253745e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378791; x=1776983591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVhU4dd0fSKGFFw3DxJjyGrc8CGImTlTcAo7+1C/Vwg=;
        b=btaMK7gryBIo/MQ519Gp8FlYYm4Ny4kF2x/MPgNNL4FMpwG7iGaEgT453HI6lF5pN0
         abh15B0+CcCCcwJRQ2L+7IzFCP4bqcNNT9oZaS4GHJySHVukfphXyvayGZVhlAvUCDqZ
         UXUhB0yPUPIaED8EHiWQIQ9eunCyCgAO8QDAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378791; x=1776983591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVhU4dd0fSKGFFw3DxJjyGrc8CGImTlTcAo7+1C/Vwg=;
        b=DYI9jEE91C2bMoPgMAJ1JWUcBLAlLgMbhF1HdgmC5VD7ocaYc0d6+4v0x/Ad6UkljL
         4WYjWQJooYd6gx37HBn64m+gUTZxV5KuQBhEwD3Jojnuhwa8YUpVjYNtslKrB6FkVOZq
         u2mkOXxLo61pyEJ5CI7zqyngUVcKQTqouaZfraeXEZYkTGZTqaKJNj9EMMGDQpoZTBLJ
         sli1h2nxAvP2v1pK8FXiny8sYUVb+V9oAjIGraBbwzvrVEEMiHgfwmDBbuVYPE3L6/7d
         BKEM39RVRWgDXKUiDmvZduDFJ5dBRmx6LgyQjKCY4I/ooeoq2OfxZHCkAZNVaE+dareh
         Q3Ww==
X-Gm-Message-State: AOJu0YzGnA4tpjAjdgfLRhGQhcW1/nfSDwsBNlo5Z0UJXHErxBWBVjhh
	GYZgoHBoqjImO5XZ+udka88QzpXk2CEgZ+04Sl853SwUdyEXnYPlMcvF+aaHcjxrVwx9mRk8dKN
	Ux/JmyBV8A4AC
X-Gm-Gg: AeBDiesU8umTBLNeCRTzxJKGK6RsnCdBFxHRu3m65Zm2Fal4O8etI03msNvM0/AjBjs
	ezoadvjXErE6/AsdAxt2BX08cvzEzkjszXM5uUmCYd4sZ1vRQHDjbYja4B6IUbtty13mGsHdcyj
	0dwNfUuRs9F/mDlNInyEjEMDeJxUkncTNEnC/FK50CLJ7YIpjCCYpLtZX4UI0PK0H3Mcmprh2F4
	xI7jSgWOd9BC6RbQ3+2DysMBNC5CFKARs6KBoElTd6KnKVq3CKYuuFxXfr1m86eMslNQcWTbMKx
	iTREF2oASuqEWI91EHMCbTCCZv/6SayPlM0Q0M+UtjOLpeSerdWnJqx44VpWuCc/LSRX8IZaPWV
	5F1zTzhlP5nRkOZmiMMz36tqoVaNfgT2VsX1u1snvzbnN+CqsJ8LUjZSxg3BRB1wAQLKI2sBiKy
	S9x38/WVYFVNKR2iarLrM9h6601myyrASIiblL3IX62LucEv6m83FxuB4U87KciQTaLuEG8d78j
	vm2lObkxtyZWV6++8hXBjTnAx2Y7BLOGYP54A==
X-Received: by 2002:a05:600c:c118:b0:488:a82f:bb96 with SMTP id 5b1f17b1804b1-488fb79891cmr3609575e9.29.1776378791201;
        Thu, 16 Apr 2026 15:33:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 19/51] pseudo: Add fix for glibc 2.43
Date: Fri, 17 Apr 2026 00:30:02 +0200
Message-ID: <10cf0fc5f2a18ac377186c3013a50d1355b41312.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235448

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d35b0e7929d666af783db835a3a809f8f6ce429)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a26a205a160..4d316299033 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

