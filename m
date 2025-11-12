Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7630CD343E
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 18:08:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4189.1762970889226111690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 10:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOutWY7b;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso8744065e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762970888; x=1763575688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11CxvFjobGX21ZuUv280JxlFOVFoQF4kPZrjW/v8QeM=;
        b=iOutWY7b1rbkt5/XQamxYfaCII/UeWSkwYhSr3ut2ibM3H5UwFz99PHxtQ6N8k/3CP
         i7u3DAkr6G9XFJEohebqZaiFI6X1gA68dVil7T24dc+VaiDtW5+mW1be1yiKuq/kttW7
         F+MkWYQzzAAmS0P/JjEkLCKOB+mDFQKEfbe5tGeZynjTgLc+uw8XRHejG2vIiixVHMz3
         D4STc9zS+5cTqxASoX2xdgO4KhSP/dGMRM2HyGjy8Wzsu9uG89/H3nw5GD6dy9DvAgfR
         eAbSBMFiQe1smeJ6PGfDR1Fo9vE88mpPXyuFllXD8KTB2zvZTxlvgmxeUXu4jswVq6fJ
         Q9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762970888; x=1763575688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11CxvFjobGX21ZuUv280JxlFOVFoQF4kPZrjW/v8QeM=;
        b=K7YX2NQkmfjMRV1e5qkfGH9CCyz74/Dr1zs7XtBmRtIcs97oIM6sNUQ+vyA/ebxiSH
         O4R1aAeZykwGqtszZXwotLpUdumUR7nroFYnNOn5R3Zqm/U18jgTvB39MLLzBhSG3Ftm
         jXxBbAMbPqPCZPneTW/8b/j33CfcaOk5tu14TY/ElKWuvBA1AeuzQcqnHMIsYyDWMzxK
         FC9ek9uWKXJcrN+VxxA4gX3FC1GS1yjhD5+cPCFHjxP/z4glBIX8Zx7Z0F5MoH9VDBMs
         n68uttX9TRl3TeC5Nnls3KWhv18zRq5WMafWrKnlVDfWiI5HMgxlWZfDdjt/uGxMNMKk
         0SFg==
X-Gm-Message-State: AOJu0YxsAndCz/RMcmZtK1y02rE5U4xW2oHVONTbw7JwvA0Uwe12c3Cl
	OPqLU8P00SBv0602xlY3LRh8itRxgaeQhgLniKFfBLJyk58k3mp3XSlJ8TINeyLs
X-Gm-Gg: ASbGncs9pg8op7sbJtGVoM0sVYgI5Ez6g97CYpvzrm3AVir3LUOQx8WkBmsvg5qaYGV
	W+49+vvyMIppA5XjENgwC8uRdl8/tPtvrPnJdyhXKRMgjmMf57c3IP2CbQWNoDqHCaSJZAVuC7S
	QaDacXi85ml0BjTn6XV+lXQcDoxN1dsuvWfFmiy1l7K8I5/2x35gkYSvAQ6ELYGgNZpCQe8oHtp
	IQvwtvTKRIGKBQNSGCOwRTWe7YwBEaCKh1bN/AiG+54lRjrAqe28yTJxusgM1SmO+WSnGdPleZt
	2QaBtV54+8kIxQ2TLHkdGya2mG0RkGwNsggLC3kqGpXytmXQB/X1jdiM8oD2dr6nJ4gR0JWMPPE
	kM/Y+YPAypdj7tkpQnMNyFqutNncOwTEk4MT2lXPATsxjC9OqL+pDcsgGaJGl7QFPNtH6X11Vcw
	==
X-Google-Smtp-Source: AGHT+IH+g6cgMCEy5+ScQIM3JB36oZx+z1yzBpVOKs/9VTPf8Ij/R4zjbeuJu1Wo6NXdKF1TJrvKSg==
X-Received: by 2002:a05:600c:c4a2:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-477870468c4mr33916555e9.13.1762970887481;
        Wed, 12 Nov 2025 10:08:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e486fbsm45552585e9.5.2025.11.12.10.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:08:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/2] xf86-video-intel: correct SRC_URI as freedesktop anongit is down
Date: Wed, 12 Nov 2025 19:08:05 +0100
Message-ID: <20251112180805.773151-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112180805.773151-1-skandigraun@gmail.com>
References: <20251112180805.773151-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226214

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: 04037a14e1431c4a51f5d51885974732a6108368)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9649bec517996558e01d668d2b59e68306a3a647)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 74ec57aa66..e747d2046f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,8 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
-"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

