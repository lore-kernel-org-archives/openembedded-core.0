Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97941C0018A
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.40644.1698951784061418216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2gqmdR3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6c10f098a27so1188524b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951783; x=1699556583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VddpuhvqBJzeu1p5mO8cl+RNf4U05eRSBrP6Knztjl0=;
        b=M2gqmdR3MWQDwbpNAowNavNqAot9Aw9w8Se5CW0rKjUmrTOdgu2lt0xjEQ5Azpe2JN
         GiyPM3axU4BX+QdqUj+QNLeyIL5ICSRAvf/jUwzqbfvd/kq+Z5t2ZIXTucWz3mRwMWTy
         3WphbQi6q4o4uffck5dhV8a5X4gtOSa5PWKJ+VoRdnit7v+Io+14gSKBSVlVK3xmq7HJ
         adBFMx/pFC5e2qXx6VcObA4opBMl8s4CCRq06ACwuEy6rx0Xe3Lm6nbpW8Zwe3eIsEK2
         ZECAE+FaMQ0XgCnXkVS2D4MJNqkS0hQ3D39Gi/i3JFiycVPI4Qa9qISW89aRtUoWJm2T
         ytEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951783; x=1699556583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VddpuhvqBJzeu1p5mO8cl+RNf4U05eRSBrP6Knztjl0=;
        b=T4HD7mj33oBVghr7c6YD86RVVh3PJooSpLD16w/JQJxiSN06R8g1ud0tto6qAGzeYl
         JfY1w7O16AtprSvafJQ2Mes/6usx2WVlu34CzWddiFRvFCENjYZ+fgOz6o7DokpGrWhA
         Jr0DF5O0jJdub5Nd2LE3ojwqNA8xhaiCUqEYVB4N5rgd5RGjo40GB5SzFk3zPVz4MqWT
         QHPiisLphrfIj2qllSRwFBCbN249i2VL711Rq1ZD1JbkbebqDj8CkCOfvB0yV4/flMH5
         2njdmOvDium4rI581ipKu1HBnibbGqbQpDXf74uloFdPaFVl0oMXo94jYPIjtpxcK8CA
         UYIw==
X-Gm-Message-State: AOJu0YzUB6XfCA2K/noqvIFsc5FdpuisdvNkIzjcvsVeU7gMXlZmbm09
	4A46mvOotN5t6tAaIYCxEuiJcCy7fF4WUA==
X-Google-Smtp-Source: AGHT+IHBwdZM01ZOgO/f2lPxnF9dY9USPLezlTlRqXsie02R+aDZSOATMgJFfP/3VUVV+G+2njzK5w==
X-Received: by 2002:a05:6a00:24d6:b0:68e:2478:d6c9 with SMTP id d22-20020a056a0024d600b0068e2478d6c9mr19094691pfv.2.1698951783191;
        Thu, 02 Nov 2023 12:03:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] poky: Do not inherit uninative on ppc64le and riscv64 hosts
Date: Thu,  2 Nov 2023 12:02:52 -0700
Message-ID: <8462223b678a91422ac652076fa56001c5b4a315.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190092

uninative tarballs for these architectures is not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index e742666b4e5..ccad9c835a7 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -62,7 +62,7 @@ require conf/distro/include/poky-world-exclude.inc
 require conf/distro/include/no-static-libs.inc
 require conf/distro/include/yocto-uninative.inc
 require conf/distro/include/security_flags.inc
-INHERIT += "uninative"
+INHERIT += "${@bb.utils.contains_any('BUILD_ARCH', 'ppc64le riscv64', '', 'uninative', d)}"
 
 BB_SIGNATURE_HANDLER ?= "OEEquivHash"
 BB_HASHSERVE ??= "auto"
-- 
2.42.0


