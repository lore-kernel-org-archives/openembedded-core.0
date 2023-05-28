Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F819C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.32989.1685293699258670716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hvXN5vc3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d2467d640so3053420b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293698; x=1687885698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIm3+POFq6IX0pSxxh8jHaSiUX6q1qQRLp0CUi9UmZI=;
        b=hvXN5vc3xDZmZ+JMeBLVH3kSuLHAPOepi+8Y57427ftKzaLNCgiPE1S2z2Pv1M4R7L
         aO6PcY29/bpJ4bcxq8FWr7WLzWfaKcHGsfp7JqIlT3BoBNx4G4MVM/E1wM+BURZNR8JC
         0OIY1+VTcIGScNndlFuDlUqyL4Fb53+BlBfoh2aYAHd0ZbCH0WYRp9T/dmD6W9jojD2H
         sEMRszzuaf8Vp517v/qF6d0j7k3fH3hxXfqI4hmO2Eard31U5JQ8ZiVCQZ88Zn277YZC
         +lHjG4xzY3GlUDT0V03HkIzXFkKKBXbrwWpKBP1LGQ/kkpsj/ULoXJkSXVH0/GpzQMk5
         +1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293698; x=1687885698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIm3+POFq6IX0pSxxh8jHaSiUX6q1qQRLp0CUi9UmZI=;
        b=MXFHPJMbkoWp7KjrSbbWd9nEuX43rfUSYuLcGNYCgXKiPaPj1QgbHGsnFCtF+gbIwr
         WBQcr2BslmKPqR3KJ94HjMu46e0vlknLZi7K3UHXPKCyoCdAjcXTwGxPoVDgGTu4TAVa
         np69Gf+EENWH/18ifdEg0zuCgMabs2JuLBZYcutG5IwnVMiKdb05clGj4tGJbU6IuQn7
         x0GYFPB7SoTK4U2xw56JT24l++pniWKd5CN91llzrcuT1jCv1GlVohdIHtQ3csVf6QOC
         YmtRgPlWEFcuDS+r5F0NXkB0XqXCuPPRwCBkDgfRVQu8YBusRXWerGGNk3JwjAVFhmKK
         eATg==
X-Gm-Message-State: AC+VfDySI4H9cawZv+0PIZrFu9YvDSL7gT/2TzdBzvJCFol79P0/zi0C
	Q93+7yqTg2CzTEAXeMH5lrt2+/ZJHV1j7mJ4E+A=
X-Google-Smtp-Source: ACHHUZ7GqFLgLb2KdLP/pAZPq+gLXfS3F9cKHB5hATO2sxmjhmZQ+uiX1ZsqPgXSRWCM7pqj5cu5KQ==
X-Received: by 2002:a05:6a00:a1f:b0:643:980:65b with SMTP id p31-20020a056a000a1f00b006430980065bmr12450156pfh.2.1685293698281;
        Sun, 28 May 2023 10:08:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/12] piglit: Fix c++11-narrowing warnings in tests
Date: Sun, 28 May 2023 07:07:52 -1000
Message-Id: <d9e41472e48a70bd28edc4117a5c0adf887205d6.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181844

From: Khem Raj <raj.khem@gmail.com>

This is found with clang on 32bit builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 844a1f1f593e0b4e4b0949ad78a00aa4ab8657e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Fix-narrowing-errors-seen-with-clang.patch | 53 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
new file mode 100644
index 0000000000..b1bb00e052
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -0,0 +1,53 @@
+From cd38c91e8c743bfc1841bcdd08e1ab18bf22f0e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 May 2023 21:59:43 -0700
+Subject: [PATCH] tests: Fix narrowing errors seen with clang
+
+Fixes
+piglit-test-pattern.cpp:656:26: error: type 'float' cannot be narrowed to 'int' in initiali
+zer list [-Wc++11-narrowing]
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/807]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../spec/ext_framebuffer_multisample/draw-buffers-common.cpp  | 4 ++--
+ tests/util/piglit-test-pattern.cpp                            | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp b/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
+index 48e1ad4a5..b36830c45 100644
+--- a/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
++++ b/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
+@@ -353,8 +353,8 @@ draw_pattern(bool sample_alpha_to_coverage,
+ 		float vertices[4][2] = {
+ 		{ 0.0f, 0.0f + i * (pattern_height / num_rects) },
+ 		{ 0.0f, (i + 1.0f) * (pattern_height / num_rects) },
+-		{ pattern_width, (i + 1.0f) * (pattern_height / num_rects) },
+-		{ pattern_width, 0.0f + i * (pattern_height / num_rects) } };
++		{ static_cast<float>(pattern_width), (i + 1.0f) * (pattern_height / num_rects) },
++		{ static_cast<float>(pattern_width), 0.0f + i * (pattern_height / num_rects) } };
+ 
+ 		glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE,
+ 				      sizeof(vertices[0]),
+diff --git a/tests/util/piglit-test-pattern.cpp b/tests/util/piglit-test-pattern.cpp
+index 43d451d6a..52ee94457 100644
+--- a/tests/util/piglit-test-pattern.cpp
++++ b/tests/util/piglit-test-pattern.cpp
+@@ -653,12 +653,12 @@ ColorGradientSunburst::draw_with_scale_and_offset(const float (*proj)[4],
+ {
+ 	switch (out_type) {
+ 	case GL_INT: {
+-		int clear_color[4] = { offset, offset, offset, offset };
++		int clear_color[4] = { static_cast<int>(offset), static_cast<int>(offset), static_cast<int>(offset), static_cast<int>(offset) };
+ 		glClearBufferiv(GL_COLOR, 0, clear_color);
+ 		break;
+ 	}
+ 	case GL_UNSIGNED_INT: {
+-		unsigned clear_color[4] = { offset, offset, offset, offset };
++		unsigned clear_color[4] = { static_cast<unsigned>(offset), static_cast<unsigned>(offset), static_cast<unsigned>(offset), static_cast<unsigned>(offset) };
+ 		glClearBufferuiv(GL_COLOR, 0, clear_color);
+ 		break;
+ 	}
+-- 
+2.40.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 78b47985bc..4353a0a3a4 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.34.1


