Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53730CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 11:39:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.49804.1758541169672282315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 04:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWsH0S+A;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso4280914f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758541168; x=1759145968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0puTBd9TB3zVN1BKcWahmZRS0Btg2zmQOe2Cr3S4Fs=;
        b=GWsH0S+A8zZnYkKJwdcFswGlxqJktRC8GtwOTP6Q3Q70oe6U+rWFkV1mUefa8xkoar
         4gMtrVEcZuRIgx1pnVd++Mks4iQKWZvZ4Ahe2HxbykUxFn9ta0dWOrJbhSE8EAbMKyid
         Qd6tC8RfTEhJV1ep2zZSiMq0NIgtwO7fgHJERb2ytynNNCdshEaWv35Ur4hHUuycRl28
         cRz5Ln6f8Ymu37yolovkW8KeLD86VFG7/5arLiQk9ma+5I7d/xn9nKXShi4DQB8Kygmh
         HGPnAvIf1FIazr4jbsyI4WdyXAS4uyXqyALb5HHd/T9x3+YJ9sfBUYJeLwY7czUzYKTA
         iRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541168; x=1759145968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0puTBd9TB3zVN1BKcWahmZRS0Btg2zmQOe2Cr3S4Fs=;
        b=F8//+FCLe2UbVaMPcBj1k7q36Tg1D+SDze35Dc03dZY88MV7+SwArD8SOhqk7MY2xA
         Xovh8EBZi7i7GfWS8ci6H8Xq28BVyIucIg++gjZ//vq+EHVT4H5Zz12UuUXQN+24LgfX
         EgmRFxjhLp90eNmBI7VvSKpkuov0afmSSfofknDGcG3LiUSwi9OwTquif/RKnnb6K/Op
         KJ4L8zc4hpXNyAQ0BBgGNLcs96GhSya5cjoXxU9B0Axdd6AIhv1GcxPQaxy0IhafzW/b
         ac19IdjCYxAwL5xz8l0LK1LJEMVJcUDon2Znc2F02VKgQ8gPWQDIcw1yg+rw/+G45D9/
         iWCw==
X-Gm-Message-State: AOJu0YxTFFZwNPYIDkvaAALa6NLr4rU3mmkPDPp4t2s2CWs5y6WT+VDd
	IjmGtIYXOMgiwCaTbmW3lWup2JwhmpwnwQJZ0KzLYYymY+A5VfB/sIfh0zF3hQ==
X-Gm-Gg: ASbGncvGPnZNxaLZhsSzaur5yZQOLyUQb9XGd/zitiDmF+Ub17TlvLxr7LoTuwREKNb
	El0h726dFjDsG7OU3aY91NyqRKCchIhTNDdc3/6bmYAandqHrDynL6ihmQsZbuvhs8nyWBHRspJ
	7PrrWEFqpX394PzucsidoJkBdDYhHt6X5eE7OA7XE1QKCycvtGYJM4Nnb0tAF3fygVQDzkhYu04
	VsAutvpLT6FGDJ4NKLM+1EI26V4OJQpmsItbAOk+HOz6NeLbqAJ+VZuWrrLV4aGgajY5Kxu0HJ3
	RLNTPZ6PXGXbkU7QOa0TM/0rUtml1bupucO5oxhG9d5uQ2ja+P6C2OkWYecuLQY5t2ppUYrV8Eo
	geUu8lftsU8fWtw+ApcKGtff+HFXrg7eXiZdzt+cq6ZE8foJXsgVM2hQHjXl2iwBc9/yMHC1yD2
	r63JrNinSRxVGdvg4f8CcQA+c6iGPxPaU3/277v9cNKe5LsyGObExlmAUvKmnvHMMgP1hq
X-Google-Smtp-Source: AGHT+IGnNk2yA5kRDA8kZO+XpP3IIVOwwCIqAw1qz/QKuWuL0F6zDY8gMlMszA0B6hNZI2M8gHwRKQ==
X-Received: by 2002:a05:6000:2404:b0:3d5:d5ea:38d5 with SMTP id ffacd0b85a97d-3ee7e10616fmr11062598f8f.25.1758541167673;
        Mon, 22 Sep 2025 04:39:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1c97a87csm44400205e9.20.2025.09.22.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:39:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] which: update 2.21 -> 2.23, build with meson
Date: Mon, 22 Sep 2025 13:39:19 +0200
Message-Id: <20250922113920.2693840-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 11:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223818

From: Alexander Kanavin <alex@linutronix.de>

This (and 2.22) is a first release in many years. Rather than try
to use upstream's absurdly overblown, incompatible build system
(see below), I added a small-ish meson file. This means:

- drop tweaks and dependency on cwautomacros as that is no longer used

- drop patch as configure.ac has been rewritten, and the recipe is using meson anyway

- drop --disable-iberty for the same reason

In this realease, cwautomacros has been replaced by an equally custom, weird set
of macros, written by 'which' maintainer: https://github.com/CarloWood/cwm4

- one effect of that is that autoreconf isn't happy with which's configure.ac and won't run;
one is supposed to use a custom script instead: https://github.com/CarloWood/cwm4/blob/master/scripts/bootstrap.sh

- alas, that script is not shipped in tarballs; the maintainer wants
everyone to trust their 200k configure script (hello xz backdoor)

- building from git (where the script exists) is not impossible,
but that has no version tags

All this 'special handling' for what, exactly? Five .c files to produce one
single-function executable, and one manpage. Wich should all be in coreutils
to begin with. GNU's attachment to autotools defies reason.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../which/which-2.21/automake.patch           | 19 ----
 ...opt-Fix-signature-of-getenv-function.patch | 29 ++++---
 .../which/which-2.23/meson.build              | 87 +++++++++++++++++++
 .../which/{which_2.21.bb => which_2.23.bb}    | 11 +--
 4 files changed, 108 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-extended/which/which-2.21/automake.patch
 rename meta/recipes-extended/which/{which-2.21 => which-2.23}/0001-getopt-Fix-signature-of-getenv-function.patch (51%)
 create mode 100644 meta/recipes-extended/which/which-2.23/meson.build
 rename meta/recipes-extended/which/{which_2.21.bb => which_2.23.bb} (71%)

diff --git a/meta/recipes-extended/which/which-2.21/automake.patch b/meta/recipes-extended/which/which-2.21/automake.patch
deleted file mode 100644
index 4d0f2e4d7be..00000000000
--- a/meta/recipes-extended/which/which-2.21/automake.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Update autoconf prologue to use "foreign" strictness.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index d974461..a20dfa8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,7 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT([which], [2.21])
- AC_CONFIG_SRCDIR(which.c)
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- AM_MAINTAINER_MODE
- 
-
diff --git a/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
similarity index 51%
rename from meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
rename to meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
index e006d797d3c..c54368a0840 100644
--- a/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
+++ b/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -1,4 +1,4 @@
-From 16a1647fc26953fab659de5f55d4c0defdfb894f Mon Sep 17 00:00:00 2001
+From 83d2ed3fd203868a8f287d2ebedc7c304c74fbb4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Mar 2025 17:56:19 -0700
 Subject: [PATCH] getopt: Fix signature of getenv function
@@ -13,27 +13,32 @@ Upstream-Status: Submitted [https://lists.gnu.org/archive/html/which-bugs/2025-0
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ getopt.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/getopt.c b/getopt.c
+index 9ac2ed6..b1aa322 100644
 --- a/getopt.c
 +++ b/getopt.c
-@@ -209,7 +209,7 @@ static char *posixly_correct;
+@@ -205,7 +205,7 @@ static char *posixly_correct;
  /* Avoid depending on library functions or files
     whose names are inconsistent.  */
  
--char *getenv ();
+-char *getenv();
 +char *getenv (const char*);
  
- static char *
- my_index (str, chr)
+ static char *my_index(str, chr) const char *str;
+ int chr;
+diff --git a/getopt.h b/getopt.h
+index f080053..e04e3ca 100644
 --- a/getopt.h
 +++ b/getopt.h
-@@ -103,7 +103,7 @@ struct option
+@@ -102,7 +102,7 @@ struct option {
     errors, only prototype getopt for the GNU C library.  */
- extern int getopt (int argc, char *const *argv, const char *shortopts);
- #else /* not __GNU_LIBRARY__ */
--extern int getopt ();
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
 +extern int getopt (int, char * const [], const char *);
  #endif /* __GNU_LIBRARY__ */
- extern int getopt_long (int argc, char *const *argv, const char *shortopts,
- 		        const struct option *longopts, int *longind);
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
diff --git a/meta/recipes-extended/which/which-2.23/meson.build b/meta/recipes-extended/which/which-2.23/meson.build
new file mode 100644
index 00000000000..97b3d23d5ae
--- /dev/null
+++ b/meta/recipes-extended/which/which-2.23/meson.build
@@ -0,0 +1,87 @@
+project('which', 'c', version: '2.23')
+
+add_project_arguments('-DHAVE_CONFIG_H', language : 'c')
+
+src = ['bash.c','getopt1.c','getopt.c','tilde.c','which.c']
+
+executable('which', src, install: true)
+install_man('which.1')
+
+conf_data = configuration_data()
+
+conf_data.set('GETGROUPS_T', 'gid_t')
+
+compiler = meson.get_compiler('c')
+if compiler.has_function('strchr')
+    conf_data.set('HAVE_STRCHR', 1)
+endif
+if compiler.has_function('memcpy')
+    conf_data.set('HAVE_MEMCPY', 1)
+endif
+if compiler.has_function('getopt_long')
+    conf_data.set('HAVE_GETOPT_LONG', 1)
+endif
+if compiler.has_function('getcwd')
+    conf_data.set('HAVE_GETCWD', 1)
+endif
+if compiler.has_function('getwd')
+    conf_data.set('HAVE_GETWD', 1)
+endif
+if compiler.has_function('sysconf')
+    conf_data.set('HAVE_SYSCONF', 1)
+endif
+if compiler.has_function('getgroups')
+    conf_data.set('HAVE_GETGROUPS', 1)
+endif
+if compiler.has_function('eaccess')
+    conf_data.set('HAVE_EACCESS', 1)
+endif
+if compiler.has_function('getpwent')
+    conf_data.set('HAVE_GETPWENT', 1)
+endif
+if compiler.has_function('getpwnam')
+    conf_data.set('HAVE_GETPWNAM', 1)
+endif
+if compiler.has_function('getpwuid')
+    conf_data.set('HAVE_GETPWUID', 1)
+    conf_data.set('HAVE_GETPW_DECLS', 1)
+endif
+
+if compiler.has_header('unistd.h')
+    conf_data.set('HAVE_UNISTD_H', 1)
+endif
+if compiler.has_header('string.h')
+    conf_data.set('HAVE_STRING_H', 1)
+endif
+if compiler.has_header('stdlib.h')
+    conf_data.set('HAVE_STDLIB_H', 1)
+endif
+if compiler.has_header('memory.h')
+    conf_data.set('HAVE_MEMORY_H', 1)
+endif
+if compiler.has_header('pwd.h')
+    conf_data.set('HAVE_PWD_H', 1)
+endif
+if compiler.has_header('strings.h')
+    conf_data.set('HAVE_STRINGS_H', 1)
+endif
+if compiler.has_header('inttypes.h')
+    conf_data.set('HAVE_INTTYPES_H', 1)
+endif
+if compiler.has_header('stdio.h')
+    conf_data.set('HAVE_STDIO_H', 1)
+endif
+if compiler.has_header('stdint.h')
+    conf_data.set('HAVE_STDINT_H', 1)
+endif
+if compiler.has_header('sys/stat.h')
+    conf_data.set('HAVE_SYS_STAT_H', 1)
+endif
+if compiler.has_header('sys/types.h')
+    conf_data.set('HAVE_SYS_TYPES_H', 1)
+endif
+conf_data.set('NEED_XMALLOC', 1)
+conf_data.set('STDC_HEADERS', 1)
+conf_data.set('VERSION', '"' + meson.project_version() + '"')
+
+configure_file(output: 'config.h', configuration: conf_data)
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.23.bb
similarity index 71%
rename from meta/recipes-extended/which/which_2.21.bb
rename to meta/recipes-extended/which/which_2.23.bb
index 7279a047373..0bbc3510d87 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.23.bb
@@ -9,21 +9,18 @@ HOMEPAGE = "https://carlowood.github.io/which/"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
-DEPENDS     = "cwautomacros-native"
 
-inherit autotools texinfo update-alternatives
-
-EXTRA_OECONF = "--disable-iberty"
+inherit meson update-alternatives
 
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
-           file://automake.patch \
+           file://meson.build \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[sha256sum] = "f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad"
+SRC_URI[sha256sum] = "a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73"
 
 do_configure:prepend() {
-	sed -i -e 's%@ACLOCAL_CWFLAGS@%-I ${STAGING_DIR_NATIVE}/usr/share/cwautomacros/m4%g' ${S}/Makefile.am ${S}/tilde/Makefile.am
+       cp ${UNPACKDIR}/meson.build ${S}
 }
 
 ALTERNATIVE:${PN} = "which"
-- 
2.39.5


