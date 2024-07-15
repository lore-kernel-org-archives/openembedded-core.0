Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD502C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 23:05:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.5583.1721084742709039783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 16:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rAkZetys;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9a550e9fso5775367e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721084741; x=1721689541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQqKNIDDWvUSbuaC/nsg3tRauv1MFbM78vp4Y0cjcKM=;
        b=rAkZetysaJvD/IXVPOpj9Mfb2xweaC5yDrqJzPGtIbmrRyIKOtO+td0u0uEpz8Z8ta
         qKOdacR6z02d/qxC8oLLBQ+EsmRpzL0VhJw3d0fSkMHQ6NeUQNKRvxRrwBOO+Gr8HgyR
         uMjRmSc98EYtXJvTKmXWlSETbKAwIN2bygqJm2ksqZbSmlyYqP6zZbPysS66CbjQvLxI
         cOtQxh+aYKIJ1c4Wu8Ap9hWOzP1FZemr3MVJ/1v4xOFRDww4EPQhldCkdusJvOVXZ6b3
         NL/qg82T3xee3k9HkzU57aUho/16q5OkWcGIRGyF2h1iL4n4Epxpg2Cn51mj62wxLB5R
         pCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721084741; x=1721689541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQqKNIDDWvUSbuaC/nsg3tRauv1MFbM78vp4Y0cjcKM=;
        b=Q+n2sVZSf++olt3c3REuwp13c8tmfZF16Bfrjk0SCB0Yvlwb3bU7ywpMnuP4NaIeQq
         TutPqRUtn6XljuQEkjYhJYspeIaZpJ4I0HG0TzSqA/kPlf4akKDTgHm5FuQeqSo6SbtB
         HwFdaBWTCl+AlovmRGnQU/A9dSk0knzI51ZlF8oVFyvr/joqwJ6XjA0Z5Yk2x+fjINi+
         QmLxC/uFsVQSNXoOYa4bB6nhSn9WZz9yVwiwD0sKRjzhagl4qb0cXtMKiubRIKLBqo6E
         CZ9e0KFQdzkiVl+dZGziki3oSyMmsSz1mlWFVrxWKVqOQxRxXU1O5/ZxTgbmCoJEWeGu
         7m0Q==
X-Gm-Message-State: AOJu0YxWyOKsWaKzdcl32mr7RCVysfFGhzKaYjD8EXNqS06guo3LCUPG
	6pc16G7FmawwG1ipRW9Kon7bHlrCBcvQvv9qLFqpmOHOzGkrcyQHGBqw0D8a584+2DsjHDjzXsU
	GGXNHSQ==
X-Google-Smtp-Source: AGHT+IG2mJQMOzNA+mPKKxSnJEIYAa1Y8+XMZJElwRWocy+1EV2yKACcRwn6WT1B47GhZuuOEWjBZw==
X-Received: by 2002:a05:6512:3b8b:b0:52c:ccb3:71f7 with SMTP id 2adb3069b0e04-52edf8bb9a5mr22758e87.9.1721084740587;
        Mon, 15 Jul 2024 16:05:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d5aesm990132e87.153.2024.07.15.16.05.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 16:05:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mesa: fix QA warnings caused by freedreno tools
Date: Tue, 16 Jul 2024 02:05:39 +0300
Message-Id: <20240715230539.139514-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 23:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202076

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
index 000000000000..2741f87ed00b
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
+Upstream-Status: Inappropriate [OE-Core QA issue]
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


