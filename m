Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7625C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156297.1783358237550991515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VUArJdIv;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b1710405so20438115e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358236; x=1783963036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm03BqEaX0wvOM8OBRlf5/DiBy30jdMkXAy8nr4wL8w=;
        b=VUArJdIv1rQp0a7BMijwiFA/u3YGC03u3lFfmU4WEkP+UnAUfRu+w0FqFzsCIsTmuK
         X5zoXyHpZjcTemOrR4tYL55F+M0xlvaR9IBN2hA5oitNajxEp4D6/P3Ymq/tf4dR/2K6
         Xpsizm+hTxDv5FheGWBoA0QvhDRSdaqvQtnfMCXEP8v0LuzdU0Z7bVpsHhSJS8Rqw+YL
         yS8ohtGBj3LPX2a44snIJV83Kl4zlCj77EqjYicHd+QfxH1WrJiHyG9ES9uaSswJCKAF
         yzAjYXDDt4ZHxAN4CmUT747NgRsaZEwmFszRI4ZLDnqn2KhUjwzu2/q+SkYElKJYaMhl
         E2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358236; x=1783963036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lm03BqEaX0wvOM8OBRlf5/DiBy30jdMkXAy8nr4wL8w=;
        b=jsDhiK8nCAjd1zpV3/HSi82fNi3DUwLe2QwTcQAVvhD6cfH6SD+/vEoOLENACToshB
         qCWo7cgkZaKQV5ifahOlGlyMIvHPo2vYFTDjTjrLwIllxsYO/h3G1KaxaxXvkRh/9sgC
         rouLjdp+YuKYp/Omhe98+qL8SJsXO+vdaMHUz8+VdwNWqYk1hzS7vDm8L0PwB7uurGvW
         XqFnEezEtQJILRhOt9jE+3gO7uTFBbpvFPMHuHmwrPjYpV+g9RBIdncRSi7SEEJj0ZyH
         E58EI5WlmbJkvfUqiS0ah+Ib6u375eaRehKwP9GHe6LX2GuzjpqeWS0htneyzJA7cmT7
         TzDw==
X-Gm-Message-State: AOJu0YxhnrBopHAg8cYEFO1j1xIvXqZg/qV4gB5Dx9aFuvHorOqB/KFS
	RnW+ozTGqZfCcOhrfpUqTDZ0gX5Ew3K72/3f1UthfFP4xx7FgEP4+1WT6BI+jw==
X-Gm-Gg: AfdE7cnjiH2aNr9fmjMZ782m4erwXfglfp/m9TJpocAf5u7pHcHNzK8G83Nh8bufgBm
	vgu5C8/apoYDdKZkjlec4xlzQ4bnoFt6Rb5cFmAUYhJ078GEvZJWXPtCtQFRaeuDjkqxOiiuadg
	CnYJ4GkAL50yPyRUdWqhR+r7Ani5gCmSlo7X+F/xUzs7jHhTBRDYhd9RaE29i20Mvl5gHkCLT30
	Tv7i5GGMEKJzsEcnhWZnemdOow1awvV81/BkHfXQjC3/o+f0dEPhHcnfrSZbBx/L2L0/eYcvxwP
	5S7NkT50b3H3eN3WneqKqupNvOb1URp68DW8/xa7LrBX0fACPkdUkqsREc7A2G34h071u7dNIid
	kMA4Rgu7QB05LgneA8oISXjVxRM5ybHRtJS9Gf23qZbK8VCDFIkyz/TG5qc12ZVqKPgUbV3T01O
	Y+zzPA9Wtdz5D8LrdpD8ldL/P5oCd+z/DhSS7igmHNQa9+/vSX
X-Received: by 2002:a05:600c:46c7:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-493df22862dmr16139815e9.22.1783358235789;
        Mon, 06 Jul 2026 10:17:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/45] gn: upgrade to latest revision
Date: Mon,  6 Jul 2026 19:16:28 +0200
Message-ID: <20260706171701.70536-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240300

From: Alexander Kanavin <alex@linutronix.de>

Build only gn, as otherwise ninja will attempt to run the integration
tests (which are cross-compiled). Only gn executable is installed,
so this doesn't reduce the output in ${D}.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gn/gn_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index c5ba7761b4..64217adbcb 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "bac66cfc3254aabcd8640c8ebbeb6d62a198d454"
+SRCREV = "1d86777e7f2562a86ecea77d1809ac4f82bb5bfe"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
@@ -39,7 +39,7 @@ do_configure() {
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 
 do_compile() {
-    ninja -C ${B} --verbose
+    ninja -C ${B} --verbose gn
 }
 
 do_install() {
-- 
2.47.3


