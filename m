Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC6EC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 22:58:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.5391.1721084318178103544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 15:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xfec8nFo;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso5874534e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 15:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721084316; x=1721689116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ta+DKsKn/wSlI3RcPxmLyF30eiyPcl1eMlCETHNoc5w=;
        b=xfec8nFo1BRS0M5OgvDZ10OQCvZeTu0JQDiA6XWNq3+NWYPgQ/YLHWKLP7yTVCHEvG
         tE9hr2oA7YjtUJ6IL5mE9zu4BytjAjySWyd9qxSfFHb3dZqRl8DTP2ffJAEvtMirN4R0
         rRQibfkNqrtyMIFy9cLhphVOWn2jflQofAklz2WakLlijLK/YKsf3RQ0Ryz2CwkCYGCe
         a+uY2PNiYBUY803FL9Dv2BCQWV66DO2Vgey2C8Pak7vO9y+UrS8UBX9nYABi5v6o5OM8
         8hS8wNberFjzVTE9Pz79UvE1cfN/+P/Ea1N4xIZbEBXCpRBEwsO11IK0QNzjHfEvxh0L
         A5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721084316; x=1721689116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta+DKsKn/wSlI3RcPxmLyF30eiyPcl1eMlCETHNoc5w=;
        b=YXJ2ZQmbBfOHp4nRnAtjprqv6ARXZDsbqOUemyiW+t7CrB/lHBRhApH5OHdFm/n1d8
         mEJGFz4+iy9IZ0zqpe5cEsSZWBtVJ6aKXRoeNFTaSJwfWIsvdxp8nPkfdnZ2HPqCxesP
         14F9DnTQWaUB8uA14kuNcBE+3e7WKjD5U55bKvCIrPF+Ay4+T98hb400PY/vhpqOiCpF
         4IHq77NS03FshuAgEGk0fTEarH0jjdkAZdLVsIxAp6q6W7+yj3eulUaHpLlEbYFufHad
         K992+4yPeudutQO2IaItPV14BM58WH8hthajqrx0NTYELHQclRGOAbIMqr1EIzabVTIT
         PYSg==
X-Gm-Message-State: AOJu0YymtBuMiIhLvYpZB8eWoGG452SHrL6i5NIuQQ8LitRpmxTvxlqC
	LS+xp4A8W+08ZKnlH4svaUkIVrsOwXDtdhKHseZkwRBu5qoJkAaEtyhhxIt2xqsXx4q/FPP0OM+
	1oYIBNQ==
X-Google-Smtp-Source: AGHT+IHVVeMyD1EXN7M4pi86qd5SNHQXJhGDJd8q80Bt+/ArvCPyGFcyk7D6l6xln1msqPh06XFRQQ==
X-Received: by 2002:a05:6512:1384:b0:52c:e5ac:ecd2 with SMTP id 2adb3069b0e04-52edf038bf9mr165272e87.51.1721084315585;
        Mon, 15 Jul 2024 15:58:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2532794sm986614e87.228.2024.07.15.15.58.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 15:58:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: fix QA warnings caused by freedreno tools
Date: Tue, 16 Jul 2024 01:58:34 +0300
Message-Id: <20240715225834.3778274-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 22:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202073

Fix following QA warnings / errors

File /usr/bin/afuc-asm in package mesa-tools contains reference to TMPDIR [buildpaths]
File /usr/bin/afuc-disasm in package mesa-tools contains reference to TMPDIR [buildpaths]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...t-include-rnn_src_path-into-rnn_path.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-don-t-include-rnn_src_path-into-rnn_path.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-include-rnn_src_path-into-rnn_path.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-include-rnn_src_path-into-rnn_path.patch
new file mode 100644
index 000000000000..0899d5b515f6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-include-rnn_src_path-into-rnn_path.patch
@@ -0,0 +1,27 @@
+From 7a8044621ae7dcba1873a13190ac51a6465937b7 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Mon, 15 Jul 2024 22:23:32 +0300
+Subject: [PATCH] freedreno: don't include rnn_src_path into rnn_path
+
+rnn_path gets compiled-in into several tools, which triggers OE QA
+errors. Remove rnn_src_path from rnn_path.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+---
+ src/freedreno/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
+index cae09c88edbb..20a121b43b1c 100644
+--- a/src/freedreno/meson.build
++++ b/src/freedreno/meson.build
+@@ -23,7 +23,7 @@ inc_freedreno_rnn = include_directories('rnn')
+ 
+ rnn_src_path = dir_source_root + '/src/freedreno/registers'
+ rnn_install_path = get_option('datadir') + '/freedreno/registers'
+-rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
++rnn_path = get_option('prefix') + '/' + rnn_install_path
+ 
+ dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
+                      allow_fallback: true, version: '>=5.2')
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c426e8fddd46..2522294a047d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
            file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
+           file://0001-freedreno-don-t-include-rnn_src_path-into-rnn_path.patch \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-- 
2.39.2


