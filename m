Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A056CD13D3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19441.1762873137589431940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CWZTvpTT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ba599137cf7so3325723a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873137; x=1763477937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pV9+acGqOu6gVLsJUYYQwOo84y2QEXi2OnJnSjDwDs=;
        b=CWZTvpTTrl/nYZ+M6Tyq7l6zaChMQSUIdUjdITN8U8FZloR3jr4ANSAyHxSj92B6Vd
         wtdiNW3b4eEYvF44QSSmw/FEIZe1DsuZUPyyJhMn1EcyARaLsertQRHasdRb/Y9wzpIL
         WqjkNADcxTxJU2g65Lp2oSDOTO9SEiSl5YWzdi8c7Rak9Mwe/B5gzGgeyJyTYYz6lyon
         a6qhiid8g6rZrSiGnpMOSol9XbhFLzXgff9+9YShRX6SQ/PkLDwSLYEJj9qog5V2ESlf
         u6NO8FFdQA0atl4AouMiBofBkJY/VaJuq1jyKDQWqk+QuovabkLZ5QFKLAXPErbz2t7D
         mNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873137; x=1763477937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0pV9+acGqOu6gVLsJUYYQwOo84y2QEXi2OnJnSjDwDs=;
        b=P73rVvRlJSuyr+lUZEFlciS9Nb8dShzUvk3d/aLPDIRJvqyO/yCzSg3tyn+LfCO6Bk
         mY0/bzXl90duJZLsse1v6qWOaxdqa4mLlLigeC//p2ImB51agtCNzMNELTX9MTDL34J3
         9EkevFimvJony6MGtmpoxYK5mFTpITa8NR/5eqf+eens6+LyxUSVpU3qk0HkzfxG9jY8
         lTEovITfuspnvBYaLopgy+A75JT4wBaA9rWk8wjWVogIt+VzeccKxYcI9QpXGcVfF3Mq
         tAMHS+e/NrliLXktc0I7fwQZK8/V9fGMg0FNMP6ahWw/2oGzfcZ8k+j4h6mntwMY3og2
         Cceg==
X-Gm-Message-State: AOJu0Yx4HN+0jPPnGA5Kb858rZE3fcwegHHsV7EN/M8beQ2ROv+FHSeF
	WqGRSawtiZA09Nn1kRB/WZSClJaaTI17z0vThvBn/XDa2P+kvnxScrp0xPkwHWSNJD/fQVr+Y3w
	0ItmmA+c=
X-Gm-Gg: ASbGncsZKw3j48yG9sbM1Qh/t/hgS/sKje1AAzpbHVqAHha39rqtxGQrhsQcaPswNzz
	r5fUXzBXMcBAOa+Pi81UjFykw1UsGpyPcv2f8T/GL5612MeitDaB1sZabXeIHtMV14EMx/BNFmD
	Ag/C00a9sajAY60iZhLBptIrnU/AJ9uuMF1rSizWdRvzcIAc2NhJF3FOQCRIY64TnLrvX46wiJT
	+uNrEeJzlxH+MB4rH450AxhHPz7UGex4zrXCKEfWNFcc7Riw3TieDRr4jp1w7VycSUAJwKINWAz
	dABgyKW5263X30k1ugSeUbwXiiN0YUuWKOa/RrFmf+u7lbm5YQAcshSHtgJHd5tqgXre0ULR8Zr
	ux/3C0l9brghGuu52nzFrpZiUbCNrbexjFRBggDxq0/YKmhQeCDuHFexPmOFZGzsJsD5HGsh35h
	p2CQ==
X-Google-Smtp-Source: AGHT+IFMvMtqgEZsOeNCD6DQshWsF4BkFYvM82ThJxu6jSYv0x52DOc0HbFM5qKqLgTqtrxUi+ZEyQ==
X-Received: by 2002:a17:90b:3a91:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-3436cb7bcfcmr16261155a91.6.1762873136816;
        Tue, 11 Nov 2025 06:58:56 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/19] webkitgtk: upgrade 2.44.3 -> 2.44.4
Date: Tue, 11 Nov 2025 06:58:17 -0800
Message-ID: <59cd37dc19548845804f29d37621f7435e206c43.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226174

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug fixes only:
https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
index a8f825e164..ac9ff41c91 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
+SRC_URI[sha256sum] = "2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


