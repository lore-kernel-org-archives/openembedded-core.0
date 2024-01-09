Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4E6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:45:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.19931.1704815101567177771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfZ8WVvz;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3368ac0f74dso2409173f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704815099; x=1705419899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvLw0iQgf3OhtY9qNNVKmve4x9v8K+ut4SJ0yVVbmGU=;
        b=DfZ8WVvzwhwV0lmd58YZPNVGZhqtH18gl5E8AkqSgUP0i4j3cJMzr/xjo2Zet2IsX7
         lP8D7c1a4F7AT3YL0KOJDi1zt3hXZo0xVH9zDTfpsbLJvoswwNlLHv1iahqk6DIolo6a
         TfsbvOn4H9dl4Psia24Ja7ekZz5EhNJj97BoAT9Rd/98BTBUkoZRZte4TMuuD9hb2FAn
         7dzw5W1OwTFwZTi+YEn+ixKEmPaKDml0+8PNn1BoOY3sxJLBxmXcJ2aBSXeIDuSjsUS1
         8qkHnY9KwZVZmgia/DECq5gcK6m62JL7MCIM81i6sIcjjszNC3vXgsV+PYsRhDFgL7xr
         KfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815099; x=1705419899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvLw0iQgf3OhtY9qNNVKmve4x9v8K+ut4SJ0yVVbmGU=;
        b=BnfxMzPoJHI4legHEu1FsiJ442mLIQhRPlL4naUfrLRlX6+M51hLEUe/3efKDAHZ6Z
         Gs/9QwHgvsnj2hvqFmm//8WLuVGJRy3mK7LUN4VfmMd49Z/cyi7k8f5DNeTFiWx7TbCX
         lM675AqWHShVhM9w6dzcc9BaEVT0aNzI37umXbVmVNj3VxGLteg3Hawv+pEVXQL+RplK
         D3JDqUFDuuVjTZyXkENyJjm0VP6fRIUo/fDpPCFg/chOs6tUWj1w2X8cyTXoB0xFJS0t
         CZ9aRuZftPzmezAzikPV9uCpHTd66v4E07sDgpjPY08xSf3OG8Q7DeRunup+Yq/njpfC
         1m8w==
X-Gm-Message-State: AOJu0Yz4Dxqych2gjzXvKQPjU+ppPiJt37vTqpHkf+BqQ9WOVEtHUyXt
	CBVA0swdRFMm94ZgH5UZb9F3iSG/o/OY5J6f
X-Google-Smtp-Source: AGHT+IGIH5mzxCYJDQ6WYYkV2rHrRJV3veQFeOeu6AbWuUqeINsMCDgYylfvtel17yeWziXJkKpx+w==
X-Received: by 2002:a5d:62c9:0:b0:336:eecf:9c3 with SMTP id o9-20020a5d62c9000000b00336eecf09c3mr645538wrv.63.1704815099369;
        Tue, 09 Jan 2024 07:44:59 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id dp13-20020a0560000c8d00b0033761b2de64sm2726250wrb.76.2024.01.09.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 07:44:58 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] pybootchartgui: fix 2 SyntaxWarnings
Date: Tue,  9 Jan 2024 15:44:49 +0000
Message-ID: <20240109154449.33003-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 15:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193463

From: Martin Jansa <Martin.Jansa@gmail.com>

scripts/pybootchartgui/pybootchartgui/draw.py:820: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
scripts/pybootchartgui/pybootchartgui/draw.py:918: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if i is not 0:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8d996616f0ca57220d939a41ca9ba6d696ea2a4f)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 707e7fe427..ce3af74e2b 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -703,7 +703,7 @@ def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip) :
         cmdString = proc.cmd
     else:
         cmdString = ''
-    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
+    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid != 0:
         cmdString = cmdString + " [" + str(ipid // 1000) + "]"
     if OPTIONS.show_all:
         if proc.args:
@@ -801,7 +801,7 @@ class CumlSample:
         if self.color is None:
             i = self.next() % HSV_MAX_MOD
             h = 0.0
-            if i is not 0:
+            if i != 0:
                 h = (1.0 * i) / HSV_MAX_MOD
             s = 0.5
             v = 1.0
-- 
2.43.0


