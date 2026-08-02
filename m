Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27DEC55183
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21336.1785666550310865112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GhjiqUdl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso3651125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666548; x=1786271348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W5QsbDbC+XYTDpMBt/kEG0pLwqoau4rmJxBnA4cHvJs=;
        b=GhjiqUdlKS8FgSLctlAQNup4i6ESh2aeXzNv99QGEAhtRVNZK2tG06b3FE/CkFEX9s
         pDz1bN6m6oV1Haia17GbDSw+263tWnbXkoBJE+LHiXztoD6WU+Bd0Km9yvOmtm9W2GMF
         AXGHIgK1CRB2J+wVT5ML8gPqTa6QIMFuAGlUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666548; x=1786271348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W5QsbDbC+XYTDpMBt/kEG0pLwqoau4rmJxBnA4cHvJs=;
        b=hQZN09H7qBd44CWHpuBWbqLhlECm65YaSf5A/AFzLldZvJv3IDYrvP84U3gBLfoQYs
         p7XzOea7rSrrsSNvAGRhuBdBg4CC+jztXTP+Jch02cqqYWFsjT899iLzq9CjrELRGDMr
         /babio5S7NxwO4iwKcQc71pJCyoSALvqx3ADgFrqn9Ceu5CDprQrt7wUHSh6S1nermmQ
         vVujatRp3klZYfew1IYPxwpp18hSiVWB+vSihmPgGqKGUKLKptiNycCVbLom/9mYgGrz
         URXI1RcER/qhcpOQ3rAu3sCyp8b2kCZ43q1FyBPCviLA1TRuMtjgpnh6cjK9ZGQ34gFJ
         067w==
X-Gm-Message-State: AOJu0YyN7JuthuB3oVcTGIsZKuVywQq/YGD+6h1ARWf2RgJxR3jthGzn
	9RX8bTlD3UsAheDG6oHfwL/W8bUUpfwBAq++iBuRCmVNo9dukE5Lvu8DmIIwXVLoc9dwD8YxGWH
	w6jYBfH0=
X-Gm-Gg: AR+sD10Mfh6TaLIKgt4lGXFOt1LMmBSR/rc2vShtYgY1j1g+1XukWY9BLqtxTqNd/Fr
	1ECUUwj48ppFwbfklEnFmBjflsNPlsMmspSYtP96V1XERTAEDrTJupV9CZK3FxPSBnaRA0sE+Fj
	IrLZa0z9AQA75E68F4w2f5zGW4WfZogjZyFHvsdp5caTDrrQbZVR7HWNLQymvTECdo9PrfoZoBM
	kU+aqOYQWSUSr5hqhgaq57EonSHYQR7Mx0ppcFxf2+Hn3kIPgsHm8suHXcDdR0OC53kKkDTTvva
	P/h9lLoivRguYzBqDW0fGBJjEZhMVnk35Zt5LrW4i3KzwbLGynWu2wYuqb1ATSmllD8vC5Y0XW/
	Ch89ngp/Us55WhqciafL7CITcX3CIqgguWgRlykZ0Ik4uStWycf3t/UnThbn5azMboU7NtlYdMI
	bOCRI+OnxhLY9bQd1BEBK72PyLes86cmq4WhELxta+37EVCuD+2d50i7n+X5dUmEXhbZNCg5xGU
	YPCkXonvBqRM3KJzA==
X-Received: by 2002:a05:600c:5249:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-4980eb9b2eemr79211385e9.5.1785666548576;
        Sun, 02 Aug 2026 03:29:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/25] lib/oe/kernel: Simplify map_uboot_arch
Date: Sun,  2 Aug 2026 11:28:39 +0100
Message-ID: <20260802102854.3952760-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242535

The main kernel map function would already handle x86 correctly.

Modern u-boot already handles both forms of powerpc and ppc correctly to
so we don't need this legacy function mapping for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/kernel.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
index 6c57ef402e8..ff88c41b218 100644
--- a/meta/lib/oe/kernel.py
+++ b/meta/lib/oe/kernel.py
@@ -41,11 +41,7 @@ def map_kernel_arch(d):
 # Return a value for the -A parameter to u-boot's mkimage
 # This would be the value from the table in boot/image.c:uimage_arch
 def map_uboot_arch(d):
-    a = map_kernel_arch(d)
-
-    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
-    elif re.match('i.86$', a): return 'x86'
-    return a
+    return map_kernel_arch(d)
 
 # parse kernel ABI version out of <linux/version.h>
 def get_version_headers(p):

