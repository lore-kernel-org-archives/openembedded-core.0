Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.5197.1614440103690718459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ejYhA7h3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id p3so9723656wmc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IHT4bf/ojqt9rd+HO1Wg7apwCJyDKTpyBzAjckrQEeY=;
        b=ejYhA7h36z0p7/zWOymtn0r992e5nORN2gly4g36nmkcIKF9gkOU89IZRoH1vZvS1d
         e2+pFaGtsmiNzfRrNVoHSK+Durm6BVHEaviLlLMzrzoBKxf4Vyc5Zrq7DZfCzATE6v6b
         i8g8vtnTAqIjZmcCZ77ZG4uLvmrJsckES0UeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IHT4bf/ojqt9rd+HO1Wg7apwCJyDKTpyBzAjckrQEeY=;
        b=Z6lWagTfLNav+0WSplsSUO8BUKvLzE2EKLJC8rSR59vU3QoJRILu54Mq38FnfB1N52
         +Dqi9HAgl5KwG/OhzzXPrmJXXU9hd12v6Z95vBBLFNnWjTV8UD5HwWmoJNCn7lp8tiyr
         ht5JeNRwlB7+9QPGx6VbPv14NUaev9jNYd3T2a6Xion+sk4VJW144K97xgTZFTLMapz8
         wbZ74hckxKEq6/rm+AHTW4xSvNo03ajiUe1J+7VBLhUZomlcLOPz/O6+WqIwwoKi7nII
         7oF83Szy5x3pYdq+t3NhTZnWacstU++tXt0JIx5TorosY5gOXOlCfk1A9ozigVQfext7
         /P3Q==
X-Gm-Message-State: AOAM533PbHEbkvtkO/NGNXOIYFDF/o7mx7FsloI8IH4571Z4LJ7n5QYs
	2x2OPlmisl+xiD2han6s9+KpqO89HPdbsA==
X-Google-Smtp-Source: ABdhPJx8icvxoUXy1/2oklS6WDc4H531fNCDGYxUMUelUBJmHAQvFf5wXCv+6hq4WDYVAem60kLEAg==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr7703127wmk.27.1614440101878;
        Sat, 27 Feb 2021 07:35:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:78c6:baba:ab09:bdce])
        by smtp.gmail.com with ESMTPSA id 18sm1955708wmj.21.2021.02.27.07.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:35:01 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] igt-gpu-tools: Fix reproducibility issue
Date: Sat, 27 Feb 2021 15:34:59 +0000
Message-Id: <20210227153500.3963357-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210227153500.3963357-1-richard.purdie@linuxfoundation.org>
References: <20210227153500.3963357-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option to pass in srcdir, removing hard coded
build paths from the binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../igt-gpu-tools/reproducibility.patch       | 38 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  5 ++-
 3 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 10bd37cd258..cb633f91177 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -36,7 +36,6 @@ exclude_packages = [
 	'go_',
 	'go-',
 	'gstreamer1.0-python',
-	'igt-gpu-tools',
 	'libaprutil',
 	'libid3tag',
 	'lttng-tools-dbg',
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
new file mode 100644
index 00000000000..39e36d87378
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
@@ -0,0 +1,38 @@
+meson: Allow source location to be configurable
+
+Hardcoding a build source path into a binary when cross compiling isn't
+appropriate and breaks build reproducibility. Allow the srcdir to be
+specified by an optional configuration option to meson.
+
+Signed-off-by: Richard Purdie <richard.purdie at linuxfoundation.org>
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/igt-dev/2021-February/029443.html]
+
+Index: git/lib/meson.build
+===================================================================
+--- git.orig/lib/meson.build
++++ git/lib/meson.build
+@@ -122,7 +122,11 @@ if chamelium.found()
+ 	lib_sources += 'igt_chamelium_stream.c'
+ endif
+ 
+-srcdir = join_paths(meson.source_root(), 'tests')
++if get_option('srcdir') != ''
++    srcdir = join_paths(get_option('srcdir'), 'tests')
++else
++    srcdir = join_paths(meson.source_root(), 'tests')
++endif
+ 
+ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
+ 		      fallback : 'NO-GIT',
+Index: git/meson_options.txt
+===================================================================
+--- git.orig/meson_options.txt
++++ git/meson_options.txt
+@@ -50,3 +50,7 @@ option('use_rpath',
+        type : 'boolean',
+        value : false,
+        description : 'Set runpath on installed executables for libigt.so')
++
++option('srcdir',
++       type : 'string',
++       description : 'Path to source code to be compiled into binaries (optional)')
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 89480d79d21..f25cbc06038 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -10,7 +10,8 @@ inherit meson
 SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
 PV = "1.25+git${SRCPV}"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+           file://reproducibility.patch"
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +23,7 @@ PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
 PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.27.0

