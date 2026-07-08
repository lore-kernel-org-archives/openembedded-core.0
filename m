Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A253C44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6516.1783510830874207921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G6TSiwGJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so4428905e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510829; x=1784115629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yAYDP1aQmjtYESQZGQn+Tr52z6nhinoWrVujzqCHwQE=;
        b=G6TSiwGJrkJTDYkDotOpjGB36Kln0Gh2SHXTRaa0BKZkedT4FcMWyDU8CbOQBS1Pt4
         pGlgqrIwq36K4R8brOUbwfqwv6bg67KHIDu1ZMzIymT6aWHq7JUIBnf3zZI5+Nh1C7V2
         n6u0kQSpQoV8H/Mv0TliIxw2UFl4bqg3N1WoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510829; x=1784115629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yAYDP1aQmjtYESQZGQn+Tr52z6nhinoWrVujzqCHwQE=;
        b=jL9aB7gzremwh2Id72nrEzVGH4ctOB6IJaJIJmOKFR6VCIs91twtVAp3NfeQ6oRj54
         w9tQjsRrWJvk7st9u+Xpqml2TKBUfuIEfjAyHqffx860Sb095qA+Zlkrrd7dcU6pSNLa
         Gr0rQYZGpkzizrtene2wutkF3kE03gRadv2dwWfhb/FIoES6dJXPfpE2k8WjpbTYgldB
         Ncw+hasViJjVWiynMbuswil8ov2wZZKCw7fViuanBt7Qla7feajIMM/gf4RWa4FE6dsy
         X3phY4ivVLCCRvHvFMejELdWTiSJ6M4Q3Krpum1vmyPaZw7xFsdD7jLAzYAkS5BD4bZo
         q6eA==
X-Gm-Message-State: AOJu0YwxC1KsyZVU8+KX8F8l8VhE6n/vAV5yeuCm5nILb9VNKNAmbThe
	3c/hvaFb7Bzoee59SqpCwSM5O1LtpgHbAw8J3dMx98eRfRmhzPkD9dn8HkxLKz4j18JD5prYtLg
	Jy76WXCI=
X-Gm-Gg: AfdE7cnvjmfLFDJogqt6rROIvwH13OFh9KjpJx85V46fV7c4gBSUI+mBUd0HaDIqMtf
	F1v571r4BTrz329xpPtVWmO8B8Z7xvERjxYzPc+4FAi9t+ZgxND69gofsUJYg/WKDIC+CZVPJDz
	9cwDPaAe3HUqFn6fJV8sk/TRyxCgO6EWU8Ymq1h34amaKsv6unTK4Lb6GYdKEmrQLhFujlWrsOb
	7KEY23f1G+E/KVNwOnRN9tW2vR7BQfZ25CqShb8+GudoOQJBZOnJRIZJ8LL758TXzFaUOBV91yl
	wY5UavUf8w8nlH3NGUs66+Adgo4bG711l9Khnyr6fInOjqLnE64q/eqhQSaBtZDh0NkZQaz3RDz
	j9C70kBMMDMKr8reP5QB1oxku8ReGedUwoWd1Haglrco4VpINGKKn3BjSR5HNfIpxUTywH8OQTx
	kD2M+sHyvQURVbcoHBTainAICz05+WoSq3Zl2RDaU6Kw==
X-Received: by 2002:a05:600c:3f0a:b0:492:3773:a230 with SMTP id 5b1f17b1804b1-493e68e7582mr22693965e9.27.1783510829137;
        Wed, 08 Jul 2026 04:40:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] xserver-xorg: upgrade 21.1.23 -> 21.1.24
Date: Wed,  8 Jul 2026 12:40:16 +0100
Message-ID: <20260708114021.3484868-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240469

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 4a5bf4ba437..14831b1a9b9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
+From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
index d3c00e087e5..8d7f9ae14d2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
+SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

