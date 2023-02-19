Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877B1C678D5
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3843.1676835073406298325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I0UMGC47;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id bx23so836260wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDpdX3zAJb1neATikzOLpmJC38AEhWqmrcg/HG4+YTs=;
        b=I0UMGC47lrYDRPvftAFtak5K6xsrfB2e27PODzt79od8/zWUhRUjRTSLqV1z9i7pAk
         cGDP5bvEXbzDs0XdekwfeB0lxGU4RSw1Y+Bs5RujPfgjgY2cz+nOq1BmcqWSOO1P69qI
         G8v/Nf6fdUa0jgLKS/fXsqRwhe0lgLDk+VdFUzSUiZEjcrD1UI3h8Y3Z75T2q1249pNO
         c5dsHPVlTrjgz9mQHYyclBYYX4aGBkpmzo04HhwTqY41eP2MFaihELGiikvH2ZDL/8zQ
         auoPBJ2o4FSIs+2oBtKP4YuExUvfw2zOcnmLknplfXJe28JQPFoyVkJcvQ5zUAZ7bYHV
         V/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDpdX3zAJb1neATikzOLpmJC38AEhWqmrcg/HG4+YTs=;
        b=s5Zc2nz0Pno5Muj9iEYXep8HSX5KzJdug1hmOHNvwk+H5V1TopinuNtxyCeLYlgn5b
         zz6kC+esGAhlSOZGUglJuMHlURpx1Jr2FPoBa5d24I3naZGoElmCchjRs8ydq8T/TOdz
         I9cjEn32TJfcOO3x1J5EsQnQKFOufephUGjXXwIn6BgkYfUl+CrnutNy9RH1I669ZXak
         aQXmpxbQMUkgYHzWi4dHRDpzD6NzJKMUM7MElwk5d1vg04HqzJmUv/XMNWAwkYReV6M7
         E0+UkKxsYo9EjVp0A2UHO7ZqaX4elelN3yJJHh3ubOJtHzFqLLJ6cQ9ZjHInDuflbb8d
         QM1Q==
X-Gm-Message-State: AO0yUKWb9pwvm04DfWkhzkDyNwiXoxoHFebxLoTRp9hGhQ/fmIGLboSp
	b06KijjKqOFFA2vskr+lhEwrOqo4LkQ=
X-Google-Smtp-Source: AK7set/6tZJJfn3MX//fR91UoCPzSr+z62tDbotS2xxNmzqO88v1UIAY+sqz6LP2Ovdpvf3/UqxMIg==
X-Received: by 2002:a5d:6a46:0:b0:2c5:4c32:92c5 with SMTP id t6-20020a5d6a46000000b002c54c3292c5mr757492wrw.25.1676835083447;
        Sun, 19 Feb 2023 11:31:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/39] zstd: upgrade 1.5.2 -> 1.5.4
Date: Sun, 19 Feb 2023 20:30:50 +0100
Message-Id: <20230219193101.338397-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177371

License-Update: copyright holder Facebook -> Meta

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-extended/zstd/{zstd_1.5.2.bb => zstd_1.5.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.2.bb => zstd_1.5.4.bb} (89%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.4.bb
similarity index 89%
rename from meta/recipes-extended/zstd/zstd_1.5.2.bb
rename to meta/recipes-extended/zstd/zstd_1.5.4.bb
index 2a638eb426..c2e96225e4 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.4.bb
@@ -6,12 +6,13 @@ HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
-                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
+                    "
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "e47e674cd09583ff0503f0f6defd6d23d8b718d3"
+SRCREV = "945f27758c0fd67b636103a38dbf050266c6b90a"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.30.2


