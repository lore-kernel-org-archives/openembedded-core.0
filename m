Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50794C44507
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155318.1783358255851066037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jxLVueD+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36382665e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358254; x=1783963054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd/XBfWyOvopvgezK1ubnxp9mApaAIxTwHIEX8RoL4o=;
        b=jxLVueD+8gNupGrl/f3/jVhV2OXb4gnkj6iXzpXhx0T/+wFPWKl8iLYPnaHdcifFRg
         BYaMSz0iWZl+f5Pg9dUdUXeYD+QgyDb7VRnrWduw7sYwOaz+XQJZB5gLYkBW8nFWPVal
         NH9/I75/XMvpTyVPkwLkhhXxQAl+u1Dq3L1sSoWuPZWktrH6CgcqRGy5f+4vt42rHwEg
         WvSmDyzgu39Dbgs3Dz056jXRDjyus5/6EtDbc3h9bEsiBHJlXgKM/7W+44cLTJrJI5RF
         F7vCYsjkkHGRs0zXlHrD5ci2XQ2IL8vmjSVlt9zslpeypG5NwsDCWVRVuVWt6HdOEBdf
         OEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358254; x=1783963054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cd/XBfWyOvopvgezK1ubnxp9mApaAIxTwHIEX8RoL4o=;
        b=KGMAZv/WBHZJIxDPiXmGI2DDivOX9e5GI1EdzIaPWabxFxYvL4mg95GcToljUQgWum
         SiAct3j0hyYUuG1uv7fBVC0Be+f84PQnZ9/PuFVknuYXDKvHjo1QADbwA45/syH+gZG6
         AaaPFZHXXRLIqrrnsBhdI0/d0JFLLzXsqX5SOmFfQNBo7iK/dtM5JMGKG4i6CaG39y1m
         L5EBvqpzstz4wMTLhCfz5eXC2zVoe3c0BEAMe/K5yIMU5xuItRJv3XNGsciMA03YmOAs
         h0AdLhjK3uRylcoYr6S2jHwU3+zF0BiKBLSZAcPYNYhPwVcPYsZK27hF7QsSgxsoOGrk
         PW2A==
X-Gm-Message-State: AOJu0Yzfnk79ijiV2VVTivA3nMGIyN30cKxggyf7pWY139hB32yAyMmm
	7IsdHnZWyhKV6w6vS3IkZ+uFZkFb8roZmKtNLn1skVEnClP4triWyDHii6LpJw==
X-Gm-Gg: AfdE7ckTXHFmWPaPDxZ14dsRNDh5kB2Z/5BuEajrZbIzPg06Htyfr7n1Yf9qhXJi135
	+0zsOyZaAQJ53PJZbvbmO7+nHngFJiY3akXgE60BDOJQHgiAav/353bhkaywMhoJrZOnPjV5hDM
	4c+gMvnlbDv2uRcW4rKQtO7g6rOcNvHItM7MGQ9BtNoB6sYdLrZtyiUycY+Bkax2QkcMvHQJHA5
	dNgCRX93ThVIIFgrAa4OJDU8kE46s/LwOFgHVJKoDbwrxYz7yUKthJz1l/kilnh46ggA+MgHYZt
	gKkduMKFochzW1NNRGq296GJibmwMcCmrVcDQtB2k8IuEonNDDRum1fnZbArtti1ih3Iw13GLry
	Ryg06/mtDKiinkJOlFYgKWwYfGxvyM5Iy7hmtEBppbfHrC34lLKSF4SYU9Cg8qx4SSP3miETZMs
	r5GbkJPvFN26/j7y4BaRTkv+fgySMR0RLINrUYSuBUE+z27lRo
X-Received: by 2002:a05:600c:3d8b:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-493df065f50mr17945515e9.18.1783358254097;
        Mon, 06 Jul 2026 10:17:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/45] python3-wcwidth: upgrade 0.8.1 -> 0.8.2
Date: Mon,  6 Jul 2026 19:16:47 +0200
Message-ID: <20260706171701.70536-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240319

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-wcwidth_0.8.1.bb => python3-wcwidth_0.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.8.1.bb => python3-wcwidth_0.8.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
index 9b306225d9..d5867ef9b8 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "faf5b4a5366a72dc49cad48cdf21f52bdf63bdda995178e483ba247ff79089b9"
+SRC_URI[sha256sum] = "91fbef97204b96a3d4d421609b80340b760cf33e26da123ff243d76b1fda8dda"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3


