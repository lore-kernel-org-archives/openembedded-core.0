Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E2FCD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105048.1781424235479444125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KKPxkAF/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ac10e337so15116865e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424234; x=1782029034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qCZrcLnKXFebTnj/CZN18FZjrmyVXh6k8wTpn5EYXU=;
        b=KKPxkAF/T9ep4HgoT95XyWcIr2L8eELbQs+ReADdnjHoYrkY33gA994lngVgavjASK
         s5QKW+UyptSNCiXT17baIlNRZIHAKMmwSqHPqLvY+FX1jEcUa8ZHiixVg9zFy+GMeQO1
         JR6PZD9BL09NriXr3x3SiwIt3Yr18PRI9ZiDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424234; x=1782029034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qCZrcLnKXFebTnj/CZN18FZjrmyVXh6k8wTpn5EYXU=;
        b=RJWicBZwHqX5U4LCCK5lo3Nu56fVQ8SdNqddmUhN3m9+GhndcAduxk59duDteXOFcz
         xYrIUSKy4BJoyWcvxINKe5SPxU72sSNQM3cn/VTZmbDOCpI80N8j+iEyIK1B4mHhO/n0
         jw8dAnlvXEqvQAI8M4g+0ZzRi+HePP2vMIqIwdv3QJB4T43eM85x1qrkDCWkEjx1EfeT
         7jzk2A/q/yIwUmSv6AtoxPb9yATLXBySVIzcXOhgCn9vgeG4mgjet6nhu80FYD6a0sCM
         qr19QrjlJapTC23XoRgS/thsx/UACo+FZZhk50fPWQoqj+yhGfEW19lGuYS+XdNHmX/i
         WLiw==
X-Gm-Message-State: AOJu0YwedRM46dTJZmSPle/g6hy8txvVJ34/pcYO5LHjAbimFtwioO5P
	ab1ZQDuZZdxUvWtzv65PaH312q0qfvYGTTCgZMlnCdIZ98R1PVfE3eTgDV7+hDebvxUh0XA/Gvp
	8fSYQ
X-Gm-Gg: Acq92OHa1ZEb6+DXbeAofx7EFhYeO2dWmzj3nwQrr4nXu2NwhZkK+QTB8ZNFepDYb9g
	7sI2hXxqyY4NdTuh3al1OqpVj++M1fxms7POROSZa35hmN+EVx0PIZ2FAUrmVCVWLxuQ89NlZGx
	eOjBbMPY+bIIiwuUg9Wehhxr+4jpD2PDQVLRMhKio2q5rZQmRPT2HuuNHAj1coCnj4aWWGuBorl
	BhG9UA5oaAY1BRq7Gr8u5o+NAV/6Y3LFXI/D+pCPWkdfQJY7y80eLfqkDz+dPX1EOOzlPLvM8cM
	O8AdIsuQK7v9aos3o2L9KPtv5wrf5G9H/SZAD+YP+1UzBUS/gsyYkVfpJ/kqZMyWIB3M/HvxuSr
	xXZLSOfblLFNocTRUT/waqOpsx/1Wk0YQMJuYGiDnkBxSy0599rISsLghgeKtLwQBTku6cytSKr
	Vad7+U50Ez7LrYsLAGqDYS4E/CrS6VqyrlyWqB/yIVCE2e2jp6Pn+s
X-Received: by 2002:a05:600c:2d88:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-492200e24cfmr41553685e9.25.1781424233521;
        Sun, 14 Jun 2026 01:03:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/56] python3-cython: upgrade 3.2.4 -> 3.2.5
Date: Sun, 14 Jun 2026 09:02:38 +0100
Message-ID: <20260614080307.4017177-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238711

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Replace-not-predictable-build-path-prefix-with-hardc.patch | 4 ++--
 .../{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb}      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index d232f58e026..fad7f28a606 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 77c73d8c317224f66af66521f8cfe7a8e5491136 Mon Sep 17 00:00:00 2001
+From 949e3c185719c37b3a3e4c11664db16533f51dc8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,7 +53,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index c1d8783..f24b2d9 100644
+index 30e67aa..ade6a7f 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.4.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.5.bb
index 3e889857e14..373387576a7 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "84226ecd313b233da27dc2eb3601b4f222b8209c3a7216d8733b031da1dc64e6"
+SRC_URI[sha256sum] = "3dd42e4cf36ad15f265bdfec2337cc00c688c8eb6d374ffd13bb19437c27bba1"
 
 inherit pypi setuptools3 cython
 

