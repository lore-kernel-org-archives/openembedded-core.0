Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC78CC10DC3
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.91950.1701080287148459679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lX3Na9Xt;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9fa2714e828so546072766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080285; x=1701685085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+d7O1NLGH6kxN3U5W/ZwIh11QTnmoJybOK02e2woqI=;
        b=lX3Na9XtvVUU1GKL+rqVqLek1HKEt3PXbGyWpRlAsBmvxprRa9PCm8GrbqNEZmZOvv
         uY7NzbWRXApRaLOzXon76ayx0wGzEEQJW4TUdF57Dm8lQRZQFKER341OS86mUYOhmdEy
         ia7eKZs2CRtIem97fvlIUdvkLsE2zivNUyosOR6PJes/6ThyKfbDKh9+FgYlDx3u6yI9
         6XoNUjggLAgm6TBj+D6p0ZSvjaYlt2yULrhV1tlc2TXZQDy5HpSQruw3sp0H2e7Paa7K
         mbmXzJZFnr/qA/SvPmmpEFBnnjQirnc4hvMtZiz0+Wn/LhdyytUmtXpoPqEUFrJsQw7h
         +xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080285; x=1701685085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+d7O1NLGH6kxN3U5W/ZwIh11QTnmoJybOK02e2woqI=;
        b=Cvrqh/ZKJRGw0xd+guf6RXICTv1KEH/pDbVvpfcAECQIBR2idaxV1ggCGOc7Kswr8S
         u30fLybcr5DnzB8JHSwHejexhUXQAIqVAppA3STOuLI4yW7cMuwyI2XvYtBo00xDZFX1
         ioRC5zRS9k5aoPRvp2bRAdrQGahiz1jpYQ3nfWLvzz1mKSZ3CKkGjNfb1SHephZPd3+z
         lKy2icVdBntrMoz3qtXywGbj2zBo0zxv4GHFUKCeoH6Vk496LxN9W9ZVHbvjQMvSMFjc
         cfXE2PO1lMoFjrz9v2/hkuQduvoCw9dDQitqjGXkYJml/tzwwbXzTvlwRMb6DeYzLVYV
         stDA==
X-Gm-Message-State: AOJu0YxIBAjMLfy1Oi7ggPtbh4lEJRLfC4VR6K8vJCI0Hk/BxM2ZAcux
	ibywdVjsSAp9ZMhWQOFjRR2GSIDdowg=
X-Google-Smtp-Source: AGHT+IHi9KH5iKNg8iZJ85fi/VFSXkWHauH+YMXz/+8bAebeQ3/PBUdn4x/+5iu6RshOqpOsfpUezg==
X-Received: by 2002:a17:906:1019:b0:a10:eda7:7976 with SMTP id 25-20020a170906101900b00a10eda77976mr802803ejm.56.1701080285616;
        Mon, 27 Nov 2023 02:18:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/19] virglrenderer: upgrade 0.10.4 -> 1.0.0
Date: Mon, 27 Nov 2023 11:17:43 +0100
Message-Id: <20231127101751.3187950-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191278

venus (virtual vulkan support) is no longer experimental.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-meson.build-use-python3-directly-for-python.patch | 10 +++++-----
 ...{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} (84%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 8230ba588b5..06379ee7166 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
+From 2afe24fc95dbb89e99df29ccbe73afa835f58202 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -14,15 +14,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 13d95bb..b241eb2 100644
+index de6d16b5..79cedbf6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -64,7 +64,7 @@ flags = [
+@@ -68,7 +68,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- libdrm_dep = dependency('libdrm', version : '>=2.4.50')
- thread_dep = dependency('threads')
+ not_found = dependency('', required: false)
+ libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
similarity index 84%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
index f76e7cb1b94..ffe30a9c525 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "88b9fe3bfc64b23a701e4875006dbc0e769f14f6"
-SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
+SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
+SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
@@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'venus-experimental', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'venus', '', d)}"
 
-PACKAGECONFIG[venus-experimental] = "-Dvenus-experimental=true,-Dvenus-experimental=false,vulkan-loader vulkan-headers"
+PACKAGECONFIG[venus] = "-Dvenus=true,-Dvenus=false,vulkan-loader vulkan-headers"
 PACKAGECONFIG[va] = "-Dvideo=true,-Dvideo=false,libva"
 PACKAGECONFIG[render-server] = "-Drender-server=true,-Drender-server=false"
 PACKAGECONFIG[drm-msm-experimental] = "-Ddrm-msm-experimental=true,-Ddrm-msm-experimental=false"
-- 
2.39.2


