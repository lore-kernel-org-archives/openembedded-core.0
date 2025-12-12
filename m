Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF60CD59D70
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15365.1765554023610546493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZPblJmCV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so1058540a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554023; x=1766158823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK9EF/yeP0rsy2p7/ALVtrGX5u8vbtm7Zo7tyL6ybEw=;
        b=ZPblJmCVK3sI+jynBChq0uBNyVrnRp3h/gwrZcn0DHO4nTiVvQ2n3XRsVPCDaEgpEt
         vA8cGrx/mk2nP/BneZsgrwIYayHC4TzxY28AV1Kx1LlMTiF2ekF08d77CZIknPUGoig+
         XTe89dNuH2s6Bk6ejk6C+yMQAVz1BOMgiENxTuTRll31k6w++3K08S2x62zwNkoSupH7
         kCqKt03cSeH47vr18TbU7wc3FO2QCPNS+e01K6P+c5VQ05hij879XPq/7NDrswLVWVTP
         pHgJKcPGhZHIb0x9FC2qzt0UJTjeUKl1FrwkY//2vGTUd2er4x69JPhDig1NZQ3ro2iw
         0PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554023; x=1766158823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lK9EF/yeP0rsy2p7/ALVtrGX5u8vbtm7Zo7tyL6ybEw=;
        b=YPRn/gx7LodQrvenFuiGohMMqkUvenz0wWUvvf3rImysGOKoLV+RC+U62yNRs/rZxI
         mgElJGTqdEo70MM5/vw0YlCEuOyFJolFecUYGyNitp0B9c3CLx/3X13j3VqNmKYaXGIW
         cta8YO2o80X0Ru4k96eimlWDRKYsA40Fjp1C+PMkIxqGbUnhxt7y5tk8Uh4mJyQ+iAgw
         dQUt/Xwi3Mwv/W7V9+rA6TzzLT9RZVKGEwOs8znZ37b12vSJvXUweTZmYquj61gdQx02
         NdY+1IsrDYrkhyPmgj8/TymJ4TtHWE6jl9T7hhQaTuJ0qUC04jy3zdQpws1GBEQPdKl3
         Y9iw==
X-Gm-Message-State: AOJu0Yy+nBk8xYNSooH0dxSFYjMRSaETLzlVnFnVids+IIfkfDs/d5h+
	jEnJAmFevtH9Ubl5Ol512CF67pzNutlPMynMb8L4Ib4yls29b5euZzMsyCXb2NLzxttI7K8jS8O
	o7tkp
X-Gm-Gg: AY/fxX6gI3oaOlXD8O6Mlb7rZ2WbvzSPm/crPYCCf77ch5W9Ats8K6VHB1WGzTJmghL
	YYmZ4EQ+5y8OuGeQD78x0CQUZKwabq1mUYeP8GgdCUu8gmC6PuvZ79YNd3FFjKeOFl1cDIpPkZE
	z9ROnWEiX3CxzIUVz6f98LCRB8Ug/uxhT13S5rwIRuzbYn3ezQJPziLe4jBepcYIY1ain6BN4gc
	J3Ek4vwxlDftQR+ZCe2Hl/WwI19VCRTml72J/dx+LP8uA7Q2AOTrepZuY1AVUn8NnR+sc5ZLrih
	EsU0frplhcRXt7Ldb8BCIqadt4fvQyIaXq/51IXLhYcwyqmeznb3ZJ8zVgzTFLKO0p/VXH3goTG
	w1UMgBY1emzBnyd3Xzf002YjRxvjInhxZbqScb0QNc7rTdYT00KiX/SF8xdkV6XLO/bCSVfigie
	a/8w==
X-Google-Smtp-Source: AGHT+IFC2NhNJtewCxTZmqa7w5A7VaLmg9a31oDOYNj41JJ5yNavxgQ2e6Y1ShNeKq5qMGLzjk4wpg==
X-Received: by 2002:a17:90b:1d4c:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-34abd817345mr2126125a91.22.1765554022771;
        Fri, 12 Dec 2025 07:40:22 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] Revert "lib/oe/go: document map_arch, and raise an error on unknown architecture"
Date: Fri, 12 Dec 2025 07:40:00 -0800
Message-ID: <2b3d2b671a149cbeea2bdc9ba42192da2015c3b7.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227607

From: Peter Marko <peter.marko@siemens.com>

This reverts commit e6de433ccb2784581d6c775cce97f414ef9334b1.

This introduced a breaking change which is not suitable for backport to
stable LTS branches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/go.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index 4559dc63b2..dfd957d157 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,10 +7,6 @@
 import re
 
 def map_arch(a):
-    """
-    Map our architecture names to Go's GOARCH names.
-    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
-    """
     if re.match('i.86', a):
         return '386'
     elif a == 'x86_64':
@@ -35,4 +31,4 @@ def map_arch(a):
         return 'riscv64'
     elif a == 'loongarch64':
         return 'loong64'
-    raise KeyError(f"Cannot map architecture {a}")
+    return ''
-- 
2.43.0


