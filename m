Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D39C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17128.1740678020177251986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=itYmttXq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2212a930001so32313935ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678019; x=1741282819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWyz/34o450LB0D4DclRe8gBLvmnglMdXl90a8aCJ1o=;
        b=itYmttXquqrDepY1WS10HMwCpfu9u2hZcFtCrIn6nCqt/vYP/wUNtKypefwd91HeK4
         vQXff5InEtmv4B8O9XqMPgPLRVXc6lwJmGI/bh7UHa7np2hFgX6d49C96DwX/UEfCfRo
         UBshBLQt6WxjhQGOaFFvcMoUaHqqaa4vbi/ajByLNEpCGcQBDUA8PYEnMw2alyuRpWpR
         TXWwrdEcAyjWMCRevJ6R1QsWN+ZUItoo2KnwywR9I+ZnF6r0kOQgxmlsDFDJOF32Y6iu
         07tnII+OnYLXyRF/ErefosT98Up6HtsozHcCUdFbPUnG+Rf+5SrwxUKxHn+CCSwd7OCF
         9Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678019; x=1741282819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWyz/34o450LB0D4DclRe8gBLvmnglMdXl90a8aCJ1o=;
        b=HHS6piAFnSgAjbjFBR/hZBa4aqf4ppF96SFTuykI8QyTC8JL4q969Z7bw4qamClWUz
         RNLgfxnZefZh3vc/tQWsBpOSqwNVb+CXRzgHIHfru+00c8q8HGZ8S+Ig+ECA+OHFF9zb
         2t7p20OZvxJ1id4lANT+IK8Ca7LD2qoz0nYbiv8yZd4Erk6263dYrbEBbsjbPWFmGakY
         wJj0p9AYoern2O+M4/F97dYY9qXbWe/lgXuliyMLRfppWd+dOfJWoA6+qL7tV0lwY40T
         uYAzxfkt860evX285HauL1lwXmtFiLa4U0k0hCoQeBUdh9hcZf43G8uB8xJhrvRKXEEj
         Km2A==
X-Gm-Message-State: AOJu0YyxqVCnzgDEyKS7VEAyzdu6VofhtrvvJDPGxf0WAFblCDkILQF1
	NkcuTG6KWrmTPm6L4aIa5HSj6d/2Qj7XUMX4+UIR2Z/BbmsoUiYM46EzMydnva0CPaMemoTa/y6
	A
X-Gm-Gg: ASbGnct5+TPiYRuU0igXJARNqMowyMm3/DSdgo+YKUDjTo1IkCBlvvYqZc/S2u+5bwC
	+pOcdLCIG0Y4ET4lwwykRqhHXCvNazfyst4PPEVywXU+2oItJ0N9cc/lc4LZsCCXwwNd2QtkJxC
	4KtBpM4UIxkFAP2YONTwKgFxFR4aLA2nymqYuPhr5hFH+K47JY9GIzW7pyUDNPj868zfBzbXbct
	RChbzy/jRO//QRHxe+2PNf7G0n01X+JLAPU1LYQ3XNldm5GZPv5/0A2dCOgmVj0pATCgfemQPwx
	iNenXRUdxBAage1kvA==
X-Google-Smtp-Source: AGHT+IHGWuWD6QCYdERfOsmTNFcsruGIhBtdUApkUMnbp86jMv94BxqlZmZB1jWY5iXBqAFAzISCGA==
X-Received: by 2002:a05:6a00:8d1:b0:732:6221:7180 with SMTP id d2e1a72fcca58-734ac32cfd9mr412065b3a.5.1740678019358;
        Thu, 27 Feb 2025 09:40:19 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] virglrenderer: fix do_fetch error
Date: Thu, 27 Feb 2025 09:39:47 -0800
Message-ID: <72450859dd5ee5395b64917516f185a2eed52775.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212034

From: Libo Chen <libo.chen.cn@windriver.com>

Update SRC_URI to fix the following error:
WARNING: virglrenderer-native-0.9.1-r0 do_fetch: Failed to fetch URL
git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1,
attempting MIRRORS if available

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index ad3688e300..8590539e55 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/egl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
-SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1 \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
            file://cve-2022-0175.patch \
-- 
2.43.0


