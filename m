Return-Path: <ghislain.mange@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B43D78302
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:18:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.170276.1733134719460160271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hqu5alzk;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: ghislain.mange@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a099ba95so36534555e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 02:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733134718; x=1733739518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GUv4l48zLO/DrqOeNcV0HrmcHduKjpv2FB5yZaWMfYQ=;
        b=Hqu5alzkmyY6J8YlgEeXznsBuT/0TbfMU6ETTjcjld6yAmL3FYw0qvhrntIsSo3L0V
         jv6v6m5gQDdTFNC/jhAHY9NW7DmvIAlwSI3JeNIAK2ZHal5j7w0EBbdQ+2OSgVk85a4R
         g1De7uOEL/9RGxxfUhYuzMJtdiCDeeIPBphug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134718; x=1733739518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUv4l48zLO/DrqOeNcV0HrmcHduKjpv2FB5yZaWMfYQ=;
        b=aT/qbE7tzDp3k51UErETFmGrtKmrIuhAYwb4mg8Ous7Kd+Fr0KV2anlWzXWF8Ix6de
         KUR++4kF1Q/8ET7zT5LUjbCywj8d7b0jld9Lg5VykfECKpOuDxukE8Mvgsb7/Cj+LzUC
         ft0DS9TqWV3D4sdtMoskPf5UfEY6b6cxC5IWNf0+v7J3arVofAR/CHA3Aozebyt17sfR
         kIW5M/pNVApZo1/y8t4nm6900q3B8yfyWZXmQZRGTVttJZwsEc9aOrVT/f4ywcAyLIB0
         ea13IduzQhmPDG+loHiTDpxP7gDuiIFYN5/aS+EciI+P3ASlqVi18ZrJ6veytChcf82m
         BUEQ==
X-Gm-Message-State: AOJu0YyMwBE9wAL8HgQrBGO6TR70nzwGWG7yQKmEdLq0+ElMd0bvTP6f
	ElcsDlUHdx9pOuVvlgobn49gnV1b3SsZIE0P4QsDEyPrX/xBRBEXWwK9m1jqAxym29kRIZzUt1u
	G
X-Gm-Gg: ASbGncuXzCKR5VK1Dpi8bTCyo21ygi76nu4E4q1jYe0Po5IuQNx3ZMoyvKRmmeNyx0A
	DMA4y68No62fUAVeFqYyEW/m6wax6IJS8AaNGkaGGc4JFek79wSMR9YxzbBR9XxGeElEu5iiK8O
	VtLaUBOfS3u/Q4fn9maRJk0kgzTilC4XB4pFHSYg7TKvKUvSvCmYGDN9/lguO9rbBSlD7+fi9bk
	Mb+wg/0wOwHsUdKyOc1E7l0ErENVYDz8AlynrUNghpFHajc3zA56rpPku7fd5mxnuccbLk6F3Ri
	oCbkmqgR9XV/zcMKrWim1SND9AjoMyT46up4N8mwmP01emfNe5ibzpSyrQ==
X-Google-Smtp-Source: AGHT+IFxmvo78STGMbyh7HFNYiWfys8lnNNWMflUvNdDzQq5ka7Em1aOlQcQAC75aRphtxZkV0Mg2Q==
X-Received: by 2002:a05:600c:474c:b0:431:1868:417f with SMTP id 5b1f17b1804b1-434a9dce659mr225968165e9.17.1733134717833;
        Mon, 02 Dec 2024 02:18:37 -0800 (PST)
Received: from FRSMI24-FULL.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63b6sm146367425e9.22.2024.12.02.02.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:18:37 -0800 (PST)
From: ghislain.mange@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/2] wireshark: fix Qt5/6 configuration
Date: Mon,  2 Dec 2024 11:18:29 +0100
Message-Id: <20241202101830.3490907-1-ghislain.mange@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208131

From: Ghislain Mangé <ghislain.mange@smile.fr>

Wireshark is built with Qt6 by default when Qt is enabled.
Forcibly disable Qt6 in our Qt5 PACKAGECONFIG

Github issue: https://github.com/openembedded/meta-openembedded/issues/844
Reported-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 3fa293d0c..be342c73b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF, zstd"
 PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON -DUSE_qt6=OFF, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
-- 
2.34.1


