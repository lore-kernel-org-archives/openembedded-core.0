Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9947A731C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:53 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so146459049pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=yc6TdddQMQLJV9QGTGlZxysnMuYWWWiEPnK2+xjoBjk=;
	b=OCAMWSa3LN5fuLBcSC3Cx298pNm++xaDdkqGadgAcAqo8UMpI0iJr8gVYNREfVNrOI
	r9eNUs/FLMXZXYwGz54pnyzUL0AuoavIC8X1izHNzKwh/XF/yoyODpr3l9a9e44ihjcC
	TC46xFbJIrruKFhB55uMXjcAQmCTwF3dGhCbBKFX2w+6oajjL/A6z5HHKLclabLjv6vO
	0QJGSgR8xz8OmLdaFzRCX//HBQieymvocfpTganEwQLOZ3g5O8JiItnJ7PuP4dsNl/Ve
	xkECLpo0LMvKaRPo7MYzZS7a4Ell2bCZI6iZ/xcigag0HPHyyq+JABIkd0uz4hTfHNIW
	35GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=yc6TdddQMQLJV9QGTGlZxysnMuYWWWiEPnK2+xjoBjk=;
	b=GScTbIcgGfWO1oZUDkVL8LxtRgFwVRROtuXRjVN11KeQr0y90e/4qnU1YxQdMSFN5E
	RprI5QUVQgweV5+7lLrRyg3xJ/MGz/ZVlvHi2S9QUqXtouUxUdpPS/DbV6KzG7XdR9hz
	z8TLPx49YvZGi7PvDP/aDrTOMaw7eklbSCXKq5ddT9F3Xjj9Y8hmSgrOqE7IiUOo9ARH
	ox+HA2f1pkjCdw9J6V3xteXz4/WmxjN4taABbekv4DiN/lfdSpve2LcGYNENrHIFiTmr
	Qlt/MnvFuFa+MnV4U8j73kQwm3+tVBvHzJ0hfmoUtwn+ZLe6Ou773K+3G+QfDYMwKhA8
	srLg==
X-Gm-Message-State: ALoCoQmvTgmMLAw7LWFNZGwhAUKlrQk5JVNQpZjHSDq+EXQ4IdLl6fC/b4GUOyaRKRKv7g+VuvwM/09pRB8HZzYeT7vKCLMcnQ==
X-Received: by 10.98.67.135 with SMTP id l7mr28722031pfi.148.1453030674320;
	Sun, 17 Jan 2016 03:37:54 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:34 -0800
Message-Id: <d694435fcfc3ad4945f694a272d22bf703049bf9.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 61/73] guile: Fix build with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jan 2016 11:37:53 -0000

strol_l is not available on musl
delete charset.alias as well its not needed

Use internal gc function on musl

We get errors on certain functions not being available in boeheme gc
when built with musl. Therefore use the internal versions
e.g.

Undefined gc_set_finalizer_notifier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...guile-Check-for-strtol_l-during-configure.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        | 12 +++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch

diff --git a/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch b/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
new file mode 100644
index 0000000..24f073f
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
@@ -0,0 +1,56 @@
+From 814d6fb6c1f4a544c8fd37f5a390ba020c2d8c85 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 10 Jan 2016 22:28:17 +0000
+Subject: [PATCH] libguile: Check for strtol_l during configure
+
+strtol_l is a gnu extention which may not be available on other linux
+libc implementations e.g. musl. Therefore check for this funciton and
+conditionalize the use of it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac    | 5 +++--
+ libguile/i18n.c | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3969929..f8a6a1a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -752,7 +752,8 @@ AC_CHECK_HEADERS([assert.h crt_externs.h])
+ #   truncate - not in mingw
+ #   isblank - available as a GNU extension or in C99
+ #   _NSGetEnviron - Darwin specific
+-#   strcoll_l, newlocale - GNU extensions (glibc), also available on Darwin
++#   strcoll_l, newlocale, strtol_l - GNU extensions (glibc),
++#                                    also available on Darwin
+ #   fork - unavailable on Windows
+ #   utimensat - posix.1-2008
+ #   sched_getaffinity, sched_setaffinity - GNU extensions (glibc)
+@@ -768,7 +769,7 @@ AC_CHECK_FUNCS([DINFINITY DQNAN cexp chsize clog clog10 ctermid		\
+   getgrent kill getppid getpgrp fork setitimer getitimer strchr strcmp	\
+   index bcopy memcpy rindex truncate unsetenv isblank _NSGetEnviron	\
+   strcoll strcoll_l newlocale utimensat sched_getaffinity		\
+-  sched_setaffinity sendfile])
++  sched_setaffinity sendfile strtol_l])
+ 
+ AM_CONDITIONAL([BUILD_ICE_9_POPEN],
+   [test "x$enable_posix" = "xyes" && test "x$ac_cv_func_fork" = "xyes"])
+diff --git a/libguile/i18n.c b/libguile/i18n.c
+index 97d44b0..9fb6976 100644
+--- a/libguile/i18n.c
++++ b/libguile/i18n.c
+@@ -1352,7 +1352,7 @@ SCM_DEFINE (scm_locale_string_to_integer, "locale-string->integer",
+ 
+   if (c_locale != NULL)
+     {
+-#ifdef USE_GNU_LOCALE_API
++#if defined(USE_GNU_LOCALE_API) && defined(HAVE_STRTOL_L)
+       c_result = strtol_l (c_str, &c_endptr, c_base, c_locale);
+ #else
+       RUN_IN_LOCALE_SECTION (c_locale,
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index 413c81d..6815e25 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://libguile-Makefile.am-hook.patch \
            file://libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch \
            file://remove_strcase_l_funcs.patch \
+           file://0001-libguile-Check-for-strtol_l-during-configure.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
@@ -52,6 +53,13 @@ EXTRA_OECONF_append_class-target = " --with-libunistring-prefix=${STAGING_LIBDIR
                                      --with-libgmp-prefix=${STAGING_LIBDIR} \
                                      --with-libltdl-prefix=${STAGING_LIBDIR}"
 EXTRA_OECONF_append_libc-uclibc = " guile_cv_use_csqrt=no "
+
+CFLAGS_append_libc-musl = " -DHAVE_GC_SET_FINALIZER_NOTIFIER \
+	                    -DHAVE_GC_GET_HEAP_USAGE_SAFE \
+	                    -DHAVE_GC_GET_FREE_SPACE_DIVISOR \
+	                    -DHAVE_GC_SET_FINALIZE_ON_DEMAND \
+                           "
+
 do_configure_prepend() {
 	mkdir -p po
 }
@@ -77,6 +85,10 @@ do_install_append_class-target() {
 	sed -i -e 's:${STAGING_DIR_TARGET}::g' ${D}${libdir}/pkgconfig/guile-2.0.pc
 }
 
+do_install_append_libc-musl() {
+	rm -f ${D}${libdir}/charset.alias
+}
+
 SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
 
 guile_cross_config() {
-- 
2.7.0


