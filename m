Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2061DF8808C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:43 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7580.1776322112408029441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2m1JLGpz;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso91625825e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322110; x=1776926910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVhU4dd0fSKGFFw3DxJjyGrc8CGImTlTcAo7+1C/Vwg=;
        b=2m1JLGpzi3vDyyxeup0DwXBPQIfEolAX1doU3ieYN7AfIKfhCPfLPdKS+cMiRElJwb
         h5kOBZuQ8b/YNX83z83gUwy67DnO9tTuXopvNMI7795qYNGG5qtxkbuBHh9aOAVpnFbA
         FlL+jNhhMD43oRs+zYQwd/r6kHEJM4BUECx0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322110; x=1776926910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVhU4dd0fSKGFFw3DxJjyGrc8CGImTlTcAo7+1C/Vwg=;
        b=LFO1N8mZ5gQ1kuv+idmkJwjp29IEhhq+OHk956WaRuh1mbq3LNG2SRYXmVCex8x27w
         pRbVq3vi4Y1zhyHs8yQFg5Je200QErLb+3q1upUJmaR24HPOFpTsTR9MX1zoSxn4yi72
         syfwAsa6ryKViuPxXo7SBsmXkfysmNb+e0ozTpPkorFMoQ/rOPl7jWE2RgROyvf8lv2/
         ekl1hCGei71u5JpOqlYhhHoPAXqmKsyQ+IWZavC9T6gVxNhKEipkg9qWltNpZWs/tO/v
         GdcN9XiEGAsE5aMwA1nTNZV+f64cPs4pF4D0QwKn5iwdSi5W8LTYjhnACo1s+UrrOZgW
         zQjQ==
X-Gm-Message-State: AOJu0YyLgDNVgE7l9mbc+ac//9F7joshr95LohIUf8fhYB0YBBUAEUu+
	DbnBblHi36Tn7ovam5r5rVAMnnCF9JSnR3iI8P/fj2kXLeIPnKOp7qgEEqnHmUUicx8sZv68M8/
	FfpzKizSnjA1g
X-Gm-Gg: AeBDiet0HL5/iEvYf/X3aUmejXshV6byBPeJsoyITtxIubuk02DHrawAk//5Jyr2h9D
	W8xqpx4+F2nNH/YBTLxMHrMe/Fsyl3+rtEysTY1AGH+jC2OzN3bOyi0StOTR4B2hJHgiQlXcfjW
	bXmizrpoe25DOUActzQ24ZvSwLvXuhjQ272961DxWm9PTm07kjzR6UiDhPSFOQm+HP210qZg3Np
	iAUVavfKmmhUXMCV5r6qbJ8vVhwS8Syj0pm6X64uwkmXzET5qmm5XFL7HcQZtpynZVWQTrKaWku
	ROBJoa0CZWs6RjKm8e1C8OldZm7/DZw8fcHKH5MQxNcOmezZ4arJckOObKss6ViA2kIa0COIOH5
	32Twt7H+qMepqZLyKB492ES3NffFKMwXeWlwU4C6QqrNnGLmkfFOLxkdut+WgifcMWpkF47RnOU
	Zdn4RWhG86A90AqnGDYVlpvvjNc0I3CnX4ScLhln055pKRKMkLa1UTToTY0db5AmhZ2rpEZGXGr
	X2d3UMicJDSfq8zQIZtb1r/yZ76zLudDeMygA==
X-Received: by 2002:a05:600c:c088:b0:488:a98b:b891 with SMTP id 5b1f17b1804b1-488d67bf75amr251849795e9.3.1776322110494;
        Wed, 15 Apr 2026 23:48:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 19/47] pseudo: Add fix for glibc 2.43
Date: Thu, 16 Apr 2026 08:47:20 +0200
Message-ID: <10cf0fc5f2a18ac377186c3013a50d1355b41312.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235361

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

