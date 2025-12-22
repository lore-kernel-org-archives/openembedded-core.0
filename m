Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7E1E6ADFE
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88513.1766436306590388032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9lTiN18;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8052725de4so275932666b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436305; x=1767041105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD8ggzTGV0w4gMLpr8WjmgXorYRq7o/W1cpcGIKQ9IU=;
        b=C9lTiN18WXlG9yC/8wWaWaUNf/fHCu6rRvs6HYqJj7vehWwYLKZu//rxSwF3l4Hv3p
         qAgCjeKIxYO+pAYggSX2m9DEThKNEL10eFlbw20HvW/Wy2OjNfq7FfJh/eYcS0WsGeBO
         36Fki2Bd40wOTmgNIXrZu7HaEhBlLOS7pDpx0ZhCGjj9UnfSwxFZDwOrHlBrN+2bDFvG
         6NO9zO+ZpRBVGR2xsPRalUMIf606ArLDDmIUOczWXZHzNIhBaA7OjXRjk/Wq1yNlqERX
         +Xp/XhsY5iu0OL8GV7+axsZZjEB639PlpAVojUmrDY5ZqwJi/ts7Ng2ETnFGiXXovJs+
         +8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436305; x=1767041105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nD8ggzTGV0w4gMLpr8WjmgXorYRq7o/W1cpcGIKQ9IU=;
        b=aKACqgK0ywV5e2A+6ZTeTkaC3c9gbgxpAwTDbheyFRRMb2yJTwRocs8ofUx0UU3L2+
         6/foWrHCdnNbF9omWOfrCa5yVM+xGya8wcRjEfINUg5trVK/kneyKLm5C5ETCccBOyvX
         34PecjVEHmZCYg7Ly8oolYoVlVIF/TwBm28W57xfL9xBBKrPc1ampwwdu9JtxEeCxGSF
         It1Y7d9y2DNU0oBMLwhqJg/ZsMdMqvAHMRf2fPZ+Itl/oXDFfkMJNlPrveUJ+839t+lY
         69BdmQ1URTXBBwjLeq5jMNutRzUIorvfInj+QH9783HdVCoTHGwNty+572s9/bgJl1ot
         i06g==
X-Gm-Message-State: AOJu0Ywj3G8GrIsFbeSEiM28ZrNIHcIwNi7z2cVA6iTzLovRjUsRsA4E
	0kgwUjx4HNpOkcadBgw38PVqdWmzPyhOFul5BJSZJhqIirLl9qps+ZXc44quSw==
X-Gm-Gg: AY/fxX6SEzy71ViDJF+rp30r0HKoaWTpLmMBRX9iPBcdLYTku7LNggwpryp/TmxZg8G
	bhxeReAisjIUat5UVeOaYIj1uVPAIqBuugCvKvnq4sjz8veI2zSXGPEhbMTdC2lqgx6XTIO7IZg
	8GoSPduVm7GRwa8bTXHJkHuqSwV2JKBw7ZvcBnYG+NSKUaxvt3K6UgWNqIIIKmtZ04dQq3O41pO
	9Fj6jiCg6Yl1gUJNr7zqPDice06l0XF+utPLV68aK8XUqIgjeY8/f8OtzixE4z+ofigrjSUBLv6
	J6dl+C8Jr61dZqwMVKLGN1BZIDx/MDtYEZQ9smARxSniiVhtjEUE60l7nxKOFOI0NndPWTEzElv
	QSMiFXdeoreHDl9nZloAhajnWjYCRkzVQhmHfgHChj/Hlbp+7FWYpw4CZgVtUmhlN6jzWr3JLKN
	YWz5S9lWJuF7lj9RCZGXe+Y4bCYbHZd6dfpDnUO6+DHATrFJsSHner71hLhA==
X-Google-Smtp-Source: AGHT+IFY+CCll8pJjUkN/Wp9GVeMRHf3Het7175jZGN1sA6cTzMc97kbO7prmddetgx4AKrMtw4+DQ==
X-Received: by 2002:a17:907:8686:b0:b6d:7288:973d with SMTP id a640c23a62f3a-b80371d670fmr1405972966b.56.1766436304876;
        Mon, 22 Dec 2025 12:45:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/15] x264: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:44:28 +0100
Message-ID: <20251222204455.2284529-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228435

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...b801191522961102d4bea292cdb61068d0dd.patch | 39 -------------------
 meta/recipes-multimedia/x264/x264_git.bb      |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch

diff --git a/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch b/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
deleted file mode 100644
index fb0f313cdb..0000000000
--- a/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 32c3b801191522961102d4bea292cdb61068d0dd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
-Date: Fri, 4 Apr 2025 16:59:34 +0300
-Subject: [PATCH] lavf: Update the code to work with the latest libavutil API
-
-Upstream-Status: Backport [https://code.videolan.org/videolan/x264/-/commit/32c3b801191522961102d4bea292cdb61068d0dd]
----
- input/lavf.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/input/lavf.c b/input/lavf.c
-index 90f4cec5..e2489963 100644
---- a/input/lavf.c
-+++ b/input/lavf.c
-@@ -33,6 +33,7 @@
- #include <libavutil/error.h>
- #include <libavutil/mem.h>
- #include <libavutil/pixdesc.h>
-+#include <libavutil/version.h>
- 
- #define FAIL_IF_ERROR( cond, ... ) FAIL_IF_ERR( cond, "lavf", __VA_ARGS__ )
- 
-@@ -141,8 +142,13 @@ static int read_frame_internal( cli_pic_t *p_pic, lavf_hnd_t *h, int i_frame, vi
-     if( info )
-     {
-         info->fullrange  = is_fullrange;
-+#if LIBAVUTIL_VERSION_MAJOR < 60
-         info->interlaced = h->frame->interlaced_frame;
-         info->tff        = h->frame->top_field_first;
-+#else
-+        info->interlaced = !!(h->frame->flags & AV_FRAME_FLAG_INTERLACED);
-+        info->tff        = !!(h->frame->flags & AV_FRAME_FLAG_TOP_FIELD_FIRST);
-+#endif
-     }
- 
-     if( h->vfr_input )
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index eb72ba006a..b3d1cfd695 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
-    file://32c3b801191522961102d4bea292cdb61068d0dd.patch \
+SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
+SRCREV = "0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee"
 
 PV = "r3039+git"
 
-- 
2.47.3


