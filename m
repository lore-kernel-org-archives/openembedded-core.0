Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.36660.1612196754681693876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JGmQUonb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id 63so16868736oty.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DAc8Y0FCV0elAXLuXlZ2osQN6ag4+1i8CRf18u0+Zuw=;
        b=JGmQUonbfIF2HF2ZCDtrttCAFrmL9Sc5dQ9KzQUVqlKOWP81GgYkdD0R9LemR1ZM5J
         I40bI3rHOZVBlHBnmV8Dz/Ad5/rXChATXxyHek284NlW4eq8/ghg4S6jwfY5fpsTwRzX
         zZoys1VU4h9Fo/Lgg5Y+4JugbDebo19Vypr9VbvsUCroBVQExP/uruVh7SRFKuaq4a71
         RJv3icSwoBnfqKmDYMGlBSKaCyFwyKzyGLUKVvgirrW1hWkVwBtdMowoKVYZqWwE3V09
         p9FdV+YnZsQZHz+vgf8MMuqI+9kczonySuYEVXcwf+9ADmPsWrvaadn8haZAZm3Com0i
         00HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAc8Y0FCV0elAXLuXlZ2osQN6ag4+1i8CRf18u0+Zuw=;
        b=qM74iqH3bUfgM8c4vlLLHbNUxwXAcY6nX4aV+EctArXnFvaoYhmfU9EfZ9TZOiLj2s
         +95Le5q+bIpNj5GqCEveCjm8FECsoxGdOJ96Mu5PdwNJqVLOYJVRoOOszQOJaMd2prlo
         rc7nS6rVpr16PpmRoTeRkVWblFgmV2LMD9RQqzRxJ0pUd+hxnPm4Wif6D6Zl+yAJAR1r
         2qGs38c54q4hgoVMbCyBfEXiEE/eS4MpMgcH1qeJTq2Qa3LZ5C3u3m8vyR1UT/kp0Prh
         PSsVByaTLEg73/iZ8z/63YW1ZhtewioZ85rAwhOZgo/mu5TYLmdxbLSK5yoZBFMTkeX3
         4ruQ==
X-Gm-Message-State: AOAM530U2SVF2S5IBz7AXfTWnUwyf/bKaraimqAjT7m71xE/AyROi1MS
	YENGXzqcPKYfPbnKvOUMe4WBsaoE81PkO5tgR/w=
X-Google-Smtp-Source: ABdhPJxLGp9F8J8sbFcmB3rtabvMBg1mtbMp8bEquv9+/3EaF3zzraIW2XwrEDAl4nMi9rGlMG5KRw==
X-Received: by 2002:a9d:7b4c:: with SMTP id f12mr11600432oto.144.1612196753511;
        Mon, 01 Feb 2021 08:25:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/21] flex: fix build with autoconf 2.70
Date: Mon,  1 Feb 2021 06:24:35 -1000
Message-Id: <4a977fba25e9fa0a14b49d5f8ac992f14a6ca254.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

autoconf 2.70 is coming soon which has some small behavioural fixes, so
backport a patch from upstream to fix the build with that release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 946610f2cc8cd42265ee3fab6c73ad4831aaeb4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../flex/flex/check-funcs.patch               | 79 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/check-funcs.patch

diff --git a/meta/recipes-devtools/flex/flex/check-funcs.patch b/meta/recipes-devtools/flex/flex/check-funcs.patch
new file mode 100644
index 0000000000..037ca81fdc
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/check-funcs.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c42de062bbdc7c31d7181c10a74202d493280ada Mon Sep 17 00:00:00 2001
+From: Explorer09 <explorer09@gmail.com>
+Date: Tue, 27 Feb 2018 09:10:12 +0800
+Subject: [PATCH] build: Move dnl comments out of AC_CHECK_FUNCS
+
+Due to a bug, autoheader (2.69) will treat M4 dnl comments in a quoted
+argument of AC_CHECK_FUNCS as function tokens and generate a lot of
+redundant and useless HAVE_* macros in config.h.in.
+(Examples: HAVE_DNL, HAVE_AVAILABLE_, HAVE_BY)
+
+It seems to be this commit dbb4e94dc7bacbcfd4acef4f085ef752fe1aa03f of
+mine that revealed this autoheader bug, and the affected config.h.in
+had been shipped within flex-2.6.4 release tarball.
+
+I have reported the autoheader bug here:
+<https://lists.gnu.org/archive/html/bug-autoconf/2018-02/msg00005.html>
+
+As a workaround, let's move comments out of AC_CHECK_FUNCS.
+
+Signed-off-by: Kang-Che Sung <explorer09@gmail.com>
+---
+ configure.ac | 29 +++++++++++++----------------
+ 1 file changed, 13 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 55e774b0..d0f3b7da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,6 +166,7 @@ strtol dnl
+ AC_CHECK_FUNCS([dnl
+ pow dnl           Used only by "examples/manual/expr"
+ setlocale dnl     Needed only if NLS is enabled
++reallocarr dnl    NetBSD function. Use reallocarray if not available.
+ reallocarray dnl  OpenBSD function. We have replacement if not available.
+ ])
+ 
+diff --git a/configure.ac b/configure.ac
+index 3c977a4e..9c53590f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -158,22 +158,19 @@ AC_FUNC_REALLOC
+ AS_IF([test "$cross_compiling" = yes],
+    AC_MSG_WARN([result $ac_cv_func_realloc_0_nonnull guessed because of cross compilation]))
+ 
+-AC_CHECK_FUNCS([dup2 dnl
+-memset dnl
+-regcomp dnl
+-strcasecmp dnl
+-strchr dnl
+-strdup dnl
+-strtol dnl
+-], [], [AC_MSG_ERROR(required library function not found on your system)])
+-
+-# Optional library functions
+-AC_CHECK_FUNCS([dnl
+-pow dnl           Used only by "examples/manual/expr"
+-setlocale dnl     Needed only if NLS is enabled
+-reallocarr dnl    NetBSD function. Use reallocarray if not available.
+-reallocarray dnl  OpenBSD function. We have replacement if not available.
+-])
++dnl Autoheader (<= 2.69) bug: "dnl" comments in a quoted argument of
++dnl AC_CHECK_FUNCS will expand wierdly in config.h.in.
++dnl (https://lists.gnu.org/archive/html/bug-autoconf/2018-02/msg00005.html)
++
++AC_CHECK_FUNCS([dup2 memset regcomp strcasecmp strchr strdup strtol], [],
++  [AC_MSG_ERROR(required library function not found on your system)])
++
++# Optional library functions:
++# pow - Used only by "examples/manual/expr".
++# setlocale - Needed only if NLS is enabled.
++# reallocarr - NetBSD function. Use reallocarray if not available.
++# reallocarray - OpenBSD function. We have replacement if not available.
++AC_CHECK_FUNCS([pow setlocale reallocarr reallocarray])
+ 
+ AC_CONFIG_FILES(
+ Makefile
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 43b2547fc6..3d57572865 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
+           file://check-funcs.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.25.1

