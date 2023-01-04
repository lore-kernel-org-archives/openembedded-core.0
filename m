Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9A0C63705
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9368.1672830362190792853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dT2laHe+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d17so12823437wrs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jUe0D+Uyp3v1KAtqIkxZjMz70c4KZ9KgnKNBHW4rKA=;
        b=dT2laHe+ZjO6GPyf96cliSLFPxcbBj/6s3usefDj2qbUIbXJUEtjZRKfSB/rf6Cv5X
         WgrJY6BBrW9WqM961h0YxGGO3/YmkvXP4B1LFRzOID+fFppZBTrOo4N05r0N3+HpG7uP
         PusBw0EKiGzKR1RXsgy1HoDEhy2Z/bQ7R4wHI5gpnZHunh96NV/EJLa9XE8QClOI5RIN
         nLOrH/tStjZVLKR/g5lE3qIaozBAijmP7Q828TywmvJfp0auOf9zjZFuvbFLEkgQWZ/Y
         OQdZx9CIic1nPt+AscF8GaddAe20p3Ay+kfRdX7sXwEzwo2zgvALb8au4kdPsXvr0Lbf
         w80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jUe0D+Uyp3v1KAtqIkxZjMz70c4KZ9KgnKNBHW4rKA=;
        b=EBlr+GotLkFVZGngHk61Hxu2llQczCT53BLBfqfa27vxH1UkUS5dO6kySA4hkHDyDQ
         aztL0r/c1LfFLQ6viVK+t3nLPt9KLTFk5/Z/WWqTji2zSWYNsM7iVyecfC3i5SYZVBYh
         uhM2nRokFzIz5J5n2nUBRa7/U7okIlcXz3nJ920OEdLMLtSMOmQv0fvxCsiV1c34Glc8
         Z1D2U3Xz1E3ydqT7y8h4cxANr0t5dXNl3btZ6cF1020/7RrVpGk+dXeq2eUFe5oFcCOS
         dAfiU2visrCCXGXfJQ/mDAruas2X4dfPVb5AwqJTuzN5EgVSzxwoKjRJSKs7i7LXHb/b
         RVcw==
X-Gm-Message-State: AFqh2kqxY3an1bVN4+kxpDovE3LRFGWeSgBuxMWShpbLGVa/LSIK+9+c
	5xId67BEWzJkffrGhSj4fI/UFpKvfGE=
X-Google-Smtp-Source: AMrXdXubk8ua+jcTOEvH5Wpw0fM9F5tWGBgI24h/rPtS/MGiF6V26Yu1KFP4Fw/AmLopVdf2KStC2w==
X-Received: by 2002:a5d:4602:0:b0:277:ae6c:a939 with SMTP id t2-20020a5d4602000000b00277ae6ca939mr24107048wrq.21.1672830364501;
        Wed, 04 Jan 2023 03:06:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/77] piglit: upgrade to latest revision
Date: Wed,  4 Jan 2023 12:04:46 +0100
Message-Id: <20230104110548.2537259-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175400

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n-t-enable-GLX-if-tests-are-disabled.patch | 32 -------------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
deleted file mode 100644
index ef6fda0f4e..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 13ff43fe760ac343b33d8e8c84b89886aac07116 Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Fri, 3 Jun 2022 10:44:29 -0500
-Subject: [PATCH] cmake: Don't enable GLX if tests are disabled
-
-Allow building for systems that don't support GLX.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/720]
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
----
- CMakeLists.txt | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e1aeb5ddf..85e171aba 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -134,10 +134,7 @@ if(PIGLIT_BUILD_CL_TESTS)
- endif(PIGLIT_BUILD_CL_TESTS)
- 
- IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
--	if(X11_FOUND AND OPENGL_gl_LIBRARY)
--		# Assume the system has GLX. In the future, systems may exist
--		# with libGL and libX11 but no GLX, but that world hasn't
--		# arrived yet.
-+	if(X11_FOUND AND OPENGL_gl_LIBRARY AND PIGLIT_BUILD_GLX_TESTS)
- 		set(PIGLIT_HAS_GLX True)
- 		add_definitions(-DPIGLIT_HAS_GLX)
- 	endif()
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 8d66df4e09..7858fa0b08 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,11 +10,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "1cd716180cfb6ef0c1fc54702460ef49e5115791"
+SRCREV = "e300648a805d62101de341232d99bfec1cce78c5"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


