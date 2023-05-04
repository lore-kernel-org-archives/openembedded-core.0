Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6A8C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 05:25:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.43084.1683177932730911795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 22:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jxEZ2Fq4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-24e3a0aa408so125884a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 22:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683177932; x=1685769932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nq5T44kT9BTy1GnO8dFBGg9lbOSuxp6DBcPJdSUVB0=;
        b=jxEZ2Fq4h5wBPsIwo0gyxP1p00BRgeCz4qnIta1hAePkBN/+9ZM5V05THoPPC8cwyB
         nRl3j5IpbVmO8tXFSt9rmok+YtRSJxDEa+c8N5a6p+cUrSK9R2Z5uqfri9EyKCA850CS
         HwIOfwBxiI6LDqRbAk7Oy+eM0y4BxPo0rIdT8aUDlrSAzerDiNh3v4RhOc3V8PqBG6Cr
         bInoTsCDF9ulng3xUZvcaLA+Z+0R7fOtdfJEvAdxiUGghaXBlWtO70wanT6MV6O4C5K3
         a02+NgN8j/Rw6tws9dTa8oPPLzMoLYV6jF8PGTlQYDJMK+VvUQHbvSSjT80+aBvzMV3N
         4YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683177932; x=1685769932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nq5T44kT9BTy1GnO8dFBGg9lbOSuxp6DBcPJdSUVB0=;
        b=G4s96SBvVM3/5JtqEQLOkY6KL/OFFmORw8xDa/eWfrbtXy3tJKIIqX9tZIIaIOe78M
         86j0UFPq0dek7AFO3cNqbxC7wp18y7a4EUDsak24AaYBny0wkolAONhAgRNk4dMw6Uff
         J8HnrTxJbtBuJl0b66gFSLF+xwnCespzmEVsNEWT3/wJdDpe5LZG50ptNiN5JTIEL+1l
         2mm0xS8rPGbb7tO5ZAwOaCMwvRRGrBZk4CxERyXTweLkusVRnhNR5vur1vVg0nceam7Z
         M47uTdXc+3dzRXg5qkjJBe1R/ucScSbS1Nlo93CqMNEU3JKEAk+7QDWRxhxE1YDoAJgJ
         jWJw==
X-Gm-Message-State: AC+VfDy2B7B8atfQ+xjH8GfcFBpNzemLV5IUXGR6OjJGEJ8PdcUatIwl
	4dOsWjGGWX5y0Obd/7CHpAZvEOwIhvVgvA==
X-Google-Smtp-Source: ACHHUZ7GJ+i599Ze/Y/16nojFE2KCuPv52hS5Ff0YCEcUlWtpXnpYZ3K6ExfT8yo9xAuTRiEba2wpw==
X-Received: by 2002:a17:90b:f0b:b0:246:f9f1:ad17 with SMTP id br11-20020a17090b0f0b00b00246f9f1ad17mr860509pjb.40.1683177931696;
        Wed, 03 May 2023 22:25:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm10225912pjr.41.2023.05.03.22.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 22:25:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] piglit: Fix c++11-narrowing warnings in tests
Date: Wed,  3 May 2023 22:25:29 -0700
Message-Id: <20230504052529.3597932-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 05:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180850

This is found with clang on 32bit builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
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
index 1daeb35b58..116d2f5d81 100644
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
2.40.1


