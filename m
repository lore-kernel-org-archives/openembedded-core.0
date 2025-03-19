Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F954C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:10:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4280.1742379009682124286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMjkyiTx;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso31116615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742379008; x=1742983808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRIM/X1l6hqL3XBAISdCSY8ALrzcuWiOiIuneteoJCs=;
        b=FMjkyiTxqIVqAcysAXcyU8aTH0zoQoe1cefynxpkKPyEKMbZJFrmzb7ZMdWARn/9Mt
         uAVjXhQYMtsBjWN+vBsWj0uXi6ZWIVuKKsOfV5BO2JKVKkLxeKNVxIh2oCIS21w5/OyG
         lpHZzgXH9E6ghMpSCYm2oyDkWfzlqmxacjIYH1krA9T6bJAHned+Xmb2qOibeOZK2ESj
         UdQ0A5WuUaUOK4bpqCzxPX8zBQJqmlVSv96sM8RkRR9Cb3AF5qZwTlep3BqG+X755nDO
         hSFf/5wlBRdcmCd1UPrOh1awPdmd7CTsp3XgVB58lIsU8QYWCw7ub+K1vDvgg938IXi1
         DpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379008; x=1742983808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRIM/X1l6hqL3XBAISdCSY8ALrzcuWiOiIuneteoJCs=;
        b=V7fLdYbx0S5nXHhswMxTkck6gXlh3xAw6ckSbRfzwoYMlZ4ziy0fc7M1FMfFMsqPxf
         XdFFgeGeAA+GwlXfB7nW0arR49Dju/ubSd8hrge9tEII5aBaN2LFU60ZSY95od9qSTZB
         hpF14c8a3e3QhhcCgjl5zyx+VBhME3ugki7mHnpIdLfmjJlfEz5sMQBpCWZY5WWSDeu1
         9zh1jVkvxwF1QDEiRmV/IskaAdPUMGWWNJKC7isuERnboPhX37K0nLp0j93jZAAPWw6L
         U7Mpa/PjgbD8gD2RRFrdZHhvSJKRLEk7hi4dyg7YkCwiWfJaTIKjHOMG0lILc9w2biCN
         UFJA==
X-Gm-Message-State: AOJu0YzamuEGftw5fdE4gU8GIpYjCorUqDU5mSu2By95V602pSxIcre0
	/9ZExlxg7VX1NFyNpslAgIDBLh7ElESbwQ3h+AhAj8n4XNHXdNkXLWP4bg==
X-Gm-Gg: ASbGncsYkhrUU9p0Of0mPt6zY54ONGjEsFg6kuluvrIP1RmWK7enFMneObEpGeSyVXf
	ZUp+YszCQkcx+EesrJLpwyapkQp+A2YRZHhjYg4Qah/OIu06MlBs/HA5O2rcZTaF1sQuVK1V4jQ
	U1MDTdw4zSSjolOQcSp5On3IUy2HXJEWz4CUtNzyBTtAecSLGqIuOBWlkciIn0EZ3aPukUebrEN
	EnDNgJymQbIUyiUlbkNiSkHmWXw84fqrDfo/vWAtCH7UimwPHWpo2yJvHgkIwWzW1NWz1kiCJdA
	2Thdddnv9cirCkS3Lph7UoWcJX0LH3dsqA21h4Zt9Im/356z3USDq/XbEfzSt0qGAyldAN1Aop0
	Uyz6g7Q==
X-Google-Smtp-Source: AGHT+IHOScp0ciyF72cUyRzDwSbZ6JjvK8dNqbPMv6SvdJ6V9+4Y15HZuSlnocUpFHOShfpPbqUVUw==
X-Received: by 2002:a05:600c:154c:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43d437e1626mr12321595e9.23.1742379007280;
        Wed, 19 Mar 2025 03:10:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55c3dsm14226425e9.23.2025.03.19.03.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:10:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] mesa: correct download location
Date: Wed, 19 Mar 2025 11:09:58 +0100
Message-Id: <20250319100959.4102512-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213318

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/libglu_9.0.3.bb     | 2 +-
 meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
index 8151727c52a..9e23ff830fc 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 # Epoch as this used to be part of mesa
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz \
+SRC_URI = "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz \
            "
 
 SRC_URI[sha256sum] = "bd43fe12f374b1192eb15fe20e45ff456b9bc26ab57f0eee919f96ca0f8a330f"
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
index 12f41d75a5f..1a64e16a2a9 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/demos/${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://archive.mesa3d.org/demos/${PV}/${BPN}-${PV}.tar.bz2 \
            file://0001-mesa-demos-Add-missing-data-files.patch \
            file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
            "
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a3f7a0740b0..f6a91a7002f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10
 
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-- 
2.39.5


