Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36928E77181
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:15:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.78238.1733663750792199709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEAnpCYd;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434aa222d96so38032895e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663749; x=1734268549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jujOO9DCUZvudacrUg159/H63744Y+rVT+WlRKCqJyw=;
        b=BEAnpCYdMDFTspNBd/MoKaCDmm1BIguo6AhKmchOZVhlZyqgWR9D8GGubRZ85S0mDk
         y4wIF2rByYvGch6gbyccuua6/UzStWu8cXhkSksPwWKAfMnPvOTHu0Ejd2hfuInUv+ty
         C0RapXBEs6+kwT+UOuacsPiDn+i73oERNCxkumBZqZb/iySvyx0Lfv8ZgwjxXSGiAZO7
         htJ+yeenavYCRuS0X84ZdTXp5CLlRN2oeI+FfD+ZLNmt7YVF5k27tCqKPs4wrbeVP5BT
         +IxWCs0wE9paAr+IJ+lV1ko+djMp9R+daYzQGU6CjpiGLeR1zxlb/5LvhQ/8jj/6bMu3
         yVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663749; x=1734268549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jujOO9DCUZvudacrUg159/H63744Y+rVT+WlRKCqJyw=;
        b=YNbPS/oIGf1kBnwSMiKyFmaaKCXyztULZbRs8lfHk7y3aM2Y3qzeVuj0jcnpD7JSmU
         qc5MJ2np5MoeITQ3lr6PIXDH8PkgmWUZjxfVUHkkzIQXe8E4bykE6T6zhFg1v63/4BWh
         2n3bD/S5Ecl1QqPuP2IeZsfJuz6FEpDnMCSduSg246/V7cHAQ0mJb0N8uWjJzQGVlrJq
         xvrLjafdAJ3Jgq2GQYuvP0CcCvf8I7iUMdYW4YPTRTu0XWVDyyHUhz5RD1vLICiUj82I
         2HycsGwfJCbXsN9gTiTrIF9e/ou50b6iRhf7hBy+Duc7r5j2qf/TFAFi+W4cOD56ganO
         kTqw==
X-Gm-Message-State: AOJu0Yw3BJf6Wmy2qkwpLAIgzK/mzgM6ouuSfq5pzew1Cw4mTpGAFB6z
	CHK7nyFEZRsroEpzQNmBJLKTGwJrqMadWRsQlK4YcNNn+Fbz6G2PrmHtUFoV
X-Gm-Gg: ASbGnctLjj4zF1JSfxwEFSJurEVtQ9idWr3cPUsFBS3NCSMVBVIjc0fX9LiKY7zjpZr
	ZPFGK09c+KXKzs8pgHtSB88pFOs5kZy9M1v5z6JTtsCChFbmCsspqdIB9Z5ks3MCy0iIFuh1FrA
	xuc8UFM0YdjmmNsjm0p83IsGTXJ54waYPGheFk9zuWi7mfOWY5GsZNAjLvkJTtFvERxCGW/H37C
	qarzopxKSu4sTyCdioZVg9YhUwrGpQE5Qy2NohEk8c9bSbemO5tOi0ou3qV4ZmFDxxFAnlf0U0=
X-Google-Smtp-Source: AGHT+IEfy9LsYdQTrTDt9wNBRsBPsBrLrGdmUHHPk+2mMqU/cvxPKstN6iOdINNDnXYQ2SgRpdijKQ==
X-Received: by 2002:a05:600c:34d3:b0:434:f739:7cd9 with SMTP id 5b1f17b1804b1-434f7397e05mr7899825e9.9.1733663748843;
        Sun, 08 Dec 2024 05:15:48 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm9807830f8f.38.2024.12.08.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:47 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 2/4] systemd-boot: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:15:33 +0000
Message-ID: <20241208131535.5397-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131535.5397-1-gudni.m.g@gmail.com>
References: <20241208131535.5397-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208462

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-boot_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
index 9a6d8e9d6e..1fbe4ef884 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.5.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.43.0


