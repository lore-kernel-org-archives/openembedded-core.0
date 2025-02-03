Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CC6C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.92668.1738600920369187686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QlVPlTPo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385eed29d17so2250924f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600918; x=1739205718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKi5ia8Mz9rYQJ1+LHlD/a8rdXC1BnXIHNvyZEiIE1Y=;
        b=QlVPlTPojrItppyhIArP8oRAE821busS1QtX+/vtELT0TAtx6RXi9o+Zr4tlw+DEQN
         X38o4MkqeONFWqVdWVIDHRbBZm0qMBopeU83TUeQtZVS9EtqhEVflmj0TdqrgxmfIccC
         YZfUL11yUzownBJCPsxlBhg+LO0lSfmpUWdTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600918; x=1739205718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKi5ia8Mz9rYQJ1+LHlD/a8rdXC1BnXIHNvyZEiIE1Y=;
        b=vlgnjH6uv9oKqP/mYlhXqn7rTJ/hF6ZQ6bRdGkr5i4tdrcTStLIP6G7BRcXliyf4kk
         uTIPtZ+vHeGUs5gqzgLXcwFjRRG8JVVqn/nLACMlOPJU9zfbq79Lf0tDoPdVhJI9D94m
         dbOGNWMV8NDBQkTHsAeLkc5SvD1N7cG1lm1MR9ZvIyO0/aRce7CS2w41NJ0+WCWWUPkp
         BUV2fWCYsO0BXcAobMMQrYX5FxpgZMmr6VCo8QxN9dodKLMnTGtVfCObfeVbi9EYQKpP
         x5QH/o/a++dBf0qCHb+zH5p0caczLt96gZl/l9ZZ4MWhIFtPmECcRfGYkXkFkPuWa9xS
         wfow==
X-Gm-Message-State: AOJu0Yx01o4wA2JtE1Y8X4mYuKTXhiPliOcdbhR4iANjYtN6CQeDfns0
	gSlHTqW+K+LeL4fJXnuZ8MHHsNfaoZP8w9ckxB5cdyVPvb+OzNXrtfpx33MQB0v0rB0b7OlK3xg
	V
X-Gm-Gg: ASbGncv7AvBtqtomS2fFDYUAhXxax0ZaZkrR8VGt+aE9m9u3bLjNBCruLim9h4GrD0m
	1ZYQQHWpv0SdkGv5zwEn3HgDljyRcutqoWA+cImLCOvsoU7iF3XPBbKf6xMzQih+46JyvRDZInZ
	zUZQcr8yT1sZPGmcjZj/WjTAJIY+6ceIPaA52y8ssZMIC85BZ274N6pfBR3MXIcQP2MoVcJuTOc
	k5e8/Vos6aSTOwnB/VI2zlm2hbvXWHBfMKyy2FYC2QSIH+8YtGGcBLQLP62/bbhPHn9MLq443YO
	eTf+1wpXFhus5gRC21ult8v5jbGMQEMOUO4bCYtYL0SQ
X-Google-Smtp-Source: AGHT+IE7o6TYV0OYdMqQAmVdi2S80ZPTnTvmNDnNuqNNgFl+zPqhOwu820mAvTs9UeE4gcJyz2nXeQ==
X-Received: by 2002:a05:6000:4013:b0:385:fc97:9c76 with SMTP id ffacd0b85a97d-38c51949eb0mr19474240f8f.3.1738600918414;
        Mon, 03 Feb 2025 08:41:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/46] piglit: upgrade to latest revision
Date: Mon,  3 Feb 2025 16:41:10 +0000
Message-ID: <20250203164130.3403325-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210699

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch       | 2 +-
 ...1-tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch   | 2 +-
 ...3-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index c7e6a68e234..fa9db07f3f5 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From ae76c836d98320dacb00616e19af93ac20c48825 Mon Sep 17 00:00:00 2001
+From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b7da9f43d6..8b51790e2a9 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e1d84dc54b0eca3cef1136264dbbceb9ea19524c Mon Sep 17 00:00:00 2001
+From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index d68e9d477de..9c2fe0adb2a 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From e23bacb04ff77f86e56d6684451e5e93b59f1b0a Mon Sep 17 00:00:00 2001
+From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a934d48c565..a196921aa43 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 6810358403b2de577d76cab80a4e39da77c5c442 Mon Sep 17 00:00:00 2001
+From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index fa9cad36872..1a5d7f7006a 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From d18b10cde60f209375e79db480c46489d483c7f2 Mon Sep 17 00:00:00 2001
+From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index c4091eecb07..ef3241c7a27 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "631b72944f56e688f56a08d26c8a9f3988801a08"
+SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 

