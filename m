Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC8CEFCE5C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64688.1772781787104265842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pB9+DamY;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso82307645e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781785; x=1773386585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14AH6njZ0vCHKj1dZFvohjICUeB/L3Z5lrlm5Lec7FI=;
        b=pB9+DamY75tHAGxeosViCa7xGyg8MSdP6LgdAek2Pi+9FCagPGfuSDtCn/xRfObJcl
         lolLX0LFpxBEoyqPL1hnEq95ESzgF4zhMwuIKf0pxg6bleCM1rn2OCm2pff/WQgO3Vs7
         kllfAr8mwM6Rn+RGyLkqou9vonyUWWEnD0XqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781785; x=1773386585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14AH6njZ0vCHKj1dZFvohjICUeB/L3Z5lrlm5Lec7FI=;
        b=P4j/bv2xZdaYatMAdjLGdbJ3S68hjKJz4fcxGMcz6RoTHU/zIrpuvhl51ASwMVAtpI
         IiyUXWgTksg1CGTwgKGooEty4HkmGDEuCF/pBJFRpKUJ3G2DvlCZhUap3FQkZmr9l4cH
         I6gPL/TdIozsReAiZn5RAz6kFCEMAD9V+TlXvRhJLW5qDwBJhpHFwf+Rjh0LEm7udIWD
         EywDQ4TfRi5bVVoLGooAI7t3elOyQ+401pznVZZYsJTvseA2Z7QJ2Mwl0x6QF6h2AnoO
         dVdfMzFZV6CD7g61LyFBPP3UrB4J8hHkRjPTzNRUWZ6GA3+Sa6GtYAveYaztBHlRZYH6
         nO3A==
X-Gm-Message-State: AOJu0YyI7d0nXBzgW0dnxqrXFyJ/iulz8IY9jDfoPchYk33URBV8WcOW
	FUYJKRkcKsvjyDUzsqMyhNn0I18spSo9giMc93f4+nUx94wmmV8Y+y07L7YOUX12dJuq7pqGmA0
	GPU3m
X-Gm-Gg: ATEYQzy5LIqNx13LxN/SZfrH9dkTauOJOAU7JPZxpRtVyKSbqL1tBga2xidpS5FF+oN
	CmHJPKLvix1hOuGMjUOyrvwNM8eFFtXv7Qj8JVYvuErwsgimRlz7H94Ex71nEWE7oh1QqBih41z
	QdWgkwMlLWwtU0crMwfStiu6QcXuQdYA09G8XaqUcskm6CxSGu/j9Bt8aH1RrI1XxxS5wBWHsAa
	pBVILfRhaArp2NJGD0sfjdK7awGGf2gVyBMyTrh2Hdyk/SCNq8Hs2EvASvZjv4ZiA8bG1daZftF
	ouWw3JGhUw693QHsucb677OmR424REDTilYdSHDoFNpgtCa/E5e1qX6y2dcM2+B6sldGrdnMp8I
	YtzonSasbJFjyudTAv+iwjVsAb6kh3/zjqpqaYYz0Df4eE6F/+UGg8kLTx8mxoW6otzgZRcpe2T
	FeECWBPqSQVXixyhC+q0YLXRLwVBI4mbFr851mYUad+GUcODMAM65OLnXjZ53psPyU0oGSsSJ5j
	OiL29ogQL6DHsWzTS3YfmlCkI2/
X-Received: by 2002:a05:600c:1991:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-48526977699mr15330995e9.30.1772781785256;
        Thu, 05 Mar 2026 23:23:05 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 11/16] b4-config: add send-prefixes for whinlatter
Date: Fri,  6 Mar 2026 08:22:11 +0100
Message-ID: <000dbd26e2454e510e6df68fa39f7a02528a6777.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232549

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531..82d6c756e5e 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = whinlatter

