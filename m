Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D2DE6F08F
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 12:48:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100352.1766494111177021896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 04:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORaXzbYh;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f98adea4so710188766b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 04:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766494109; x=1767098909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1Pbi3AL8+JiJRrx9+yLdXCAS7HsXuXwgnDSP/qzKUg=;
        b=ORaXzbYhhvtj0V85kc+jb5DB2vgXXRXKZPP7LrIIINcL3TSmmR2mauc09AmKrIkODr
         ugw/+GSpcx8o2on1XsaE9daLS+ggJscOKAC0Es9yX87xjGD066O+nuE7Gu0snO3yCXZ2
         S80X/DeLAiHTXYSx+DIJgbBB80+15A8YEYK5WdpCuJ7p8YfeZeJiRzj0cngJhqVD8L0D
         gd/3JPGs4Y8x+wIvSY1RG24hzfzM1lutiCboPWLZGV+sYytzzzW2uKCdZXgvsgQi9gX5
         Jsg2tavEznuE/WUs1uHmu0ggXHl4hOyg4spQuYTTMqRqR+BP2h/Ysc24+4I3G9W4IkqJ
         bv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494109; x=1767098909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1Pbi3AL8+JiJRrx9+yLdXCAS7HsXuXwgnDSP/qzKUg=;
        b=NEz8HTnFrkz3e5dMUNGoyMiXhqu6aEpDKKD0EsPs5iVGi1HwlSimDC7ndOWnqEvD+0
         2G825VYe5xEvJqwHGMKcawL7g1FZ80ozihRUTxQYUKY/6phvW7r8jDW6fn/fco3dkicD
         Qq/TsmtXwWyYXFxPmBD+Ismij1aBXW2hI5YobcAFpNomjT8oX5zBrp4vJzp2jb4Y25hJ
         wVY2P4cEZilPjYDexjBNxIx/kg0xU4Md9LzWUhXlE1PDCezJM174rzEm7X5Y/DHqzlJ6
         k1BSm0immAK0Fna6p6UEq3tSivF6BxLcwOws7fofLdmb+VSKnU9RLuAYj/6BQb2wynEh
         Kicg==
X-Gm-Message-State: AOJu0YxiI2eqNnE6Wrbj7YE6yLmwRluCPOF7umqSQkk+c2ZKrIPYelrQ
	hJ/Qu3BLQGCGAktbnm8SItbEjmWDo0vnTdPxjiHucz74lAbZ3icAVG/RkZWIPw==
X-Gm-Gg: AY/fxX6bvYV1cikzRAg5WzZspXrSS93RF0CDV2/yLJGrgsx82Zf8JEOkRiMcgbJs8eO
	FYroBs34iWBo6gCh1JNq94c2ydHdmLsWanw1dl3FIakYvUOAYUrRp496mNQnVu/exEonUfOXYcN
	IPcEuL1LZoCBLPEy9Y2qKpok/md9N4XJxO0HrT7CNgCtUPgFRcUSn0/kxDoIMu+hq2Bdv++Qxtj
	T2e9aMfvD5og2R7PY7UWiTnzOI5dZThYljUlxwMbeTNeBcMVo0Uu82J56TZWUkQWCT0o7PAPGqM
	xj5U0RMzm4XsSVcFopfrQpHvhe2CaAUIxGMVoD0hjw5SLN5TqbY1ca5PcEVXMy7BOy5JWLAiirh
	x2oCqkqVgmxTIlZptEvSzpXgDKPW55y79MlfkzxEeepw08rLi9pRMII/TTP6uSShSsJB3DoURcf
	Vvu4f0jctpEh7fiCBdUxFwNEk5R4Kol+YfV2dhx/g0IW+jQ4M=
X-Google-Smtp-Source: AGHT+IEgTbip1ChgH4sH7DPqIo6LtRfeCG2uahlOYGvd1gmzlTtMrcN8xZ8gpIZl7JI9yYQpTQYc8Q==
X-Received: by 2002:a17:906:6a18:b0:b80:1a97:64e4 with SMTP id a640c23a62f3a-b8037051115mr1512455266b.39.1766494109106;
        Tue, 23 Dec 2025 04:48:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffd2sm1337496266b.33.2025.12.23.04.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:48:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] strace: correct the upstream status in newly added skip-bpf patch
Date: Tue, 23 Dec 2025 13:48:26 +0100
Message-ID: <20251223124826.2718713-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 12:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228468

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/strace/skip-bpf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
index df218153c9..b058b0ba03 100644
--- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
+++ b/meta/recipes-devtools/strace/strace/skip-bpf.patch
@@ -1,7 +1,7 @@
 These tests failed when upgrading to 6.18. Skip them for now until the issue can be resolved
 as the upgrade is needed for newer kernel versons.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
 
 Index: strace-6.16/tests/bpf-v.gen.test
 ===================================================================
-- 
2.47.3


