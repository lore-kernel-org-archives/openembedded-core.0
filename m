Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.13849.1594900591295977226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=jNVPHXxZ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id o11so6756040wrv.9
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=biC/T5BwCn1ZydWCxv0OTiTPQKyTFZfhV+kMKMIZM5Q=;
        b=jNVPHXxZIrR4GAfMKiaLBFerqk3R92s15F4buKJCEQkxz8zBf4wSzxOGOpodriq8cx
         auevmx9jAjwJhRcE6U1CgprS4p/pDHI8fIyhqnaJ88etpCyKSEfJ5KG/S4zvoCwISAtv
         fxHcGQeJ1GbUZ0CsRVZyxsmqsFbpKHHixFdBKBs+pCk8hBXDkXm0K6SeND0uQ9y6g+Cg
         k8RCbRMRFfiEeTmEear3c8JdKP6LXO61Sd8ZFa8KEgAlUgOdAhxh0dXbXwypJyFgObGD
         gUsq2FVvwGPR0sKynnQs1oechpnTuMAYbJQeF/amNpWhZ3IiYQYUWtDq7CADQPsTl+UE
         N5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=biC/T5BwCn1ZydWCxv0OTiTPQKyTFZfhV+kMKMIZM5Q=;
        b=W/GtKLtdnqDEk53fyYwD4ndE/+dmgeRyuCAxha8Gll5SQCjxz6wvbHResgVm6oHZig
         fir3nUXhalifiTUq4SqeAJNHxg2jdKAL9qZc9wKpiwLmDjZ8Fmi5+uTmxokzsJZSFAjj
         BSN+7XDqzu6/XIABTrSFIbSYovJYwP2L5BE9YSTzLZgOhAud8/wy4sYleE1drfjotsR+
         94bochJ4xnbGXWQYt6ZekN1NMqNiRwQhD7o24wdkpdpj3unPqcctECeEALDXH6dPAao7
         yrQiuGnNvEWNgX2R96Eu77TZiL4HrJkCz3UIzeiiqUeSaoyx4MBiBid/jtgtkbMTzjH7
         o4IQ==
X-Gm-Message-State: AOAM530cHcH6paEhcAJbbBAfActnujh4AUpvEBMzW2JdjNiWUGQOKnhX
	o2CyJpuAK90nxTZZxmVrSGTVmeC6x7w=
X-Google-Smtp-Source: ABdhPJzmU/wYPAo178oZxASM5q+AmIfTfny6ZaUHXSpGTb+GwbUSr79z0z6NS4jbpLLElmsL6avzSw==
X-Received: by 2002:adf:f104:: with SMTP id r4mr4960581wro.90.1594900589450;
        Thu, 16 Jul 2020 04:56:29 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id w7sm7914939wmc.32.2020.07.16.04.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:56:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] flex: fix build with autoconf 2.70
Date: Thu, 16 Jul 2020 12:55:45 +0100
Message-Id: <20200716115546.3724268-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716115546.3724268-1-ross@burtonini.com>
References: <20200716115546.3724268-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

autoconf 2.70 is coming soon which has some small behavioural fixes, so
backport a patch from upstream to fix the build with that release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
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
2.26.2

