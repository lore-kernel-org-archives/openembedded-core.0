Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E76CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 10:53:48 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.8714.1758797626755935041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 03:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2hOpKGe;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a16441so127475866b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758797625; x=1759402425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aYHg+QxCAYhBGCRlfs1TQx2Hj2nP20UT92UU8ellj8=;
        b=k2hOpKGeW+aQoWs0UOLmLe2/1yYZRgFEhHxIj2I4pEtHI7Tm8Zd/gYp7AR9qn/vGYr
         oz6vITib/lla7A5SOUJDQaWoYZp8dpJs2VdOuboXm1+H1THOiMBRm4xkcj/im6Xc1mqX
         tgTnLBjtGJQDk4bxVC/JNEhTADOvghDRwCxX8nL2DdZVjn1yvIQ9oGwn87kA7WxlWNA2
         9XpK4rtA+CaNAqTzyed11t5OOoSqM8m1zXuxT4kJNm4WApmPUq0pB3oyMXB7BD2tMTr0
         dkH+3lzeZdtrPEYWNkvw9lyyKITpj2fIMisPLrvCC2QsdPC1gnmnAnJnLTf5zUkdNjrE
         WdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797625; x=1759402425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aYHg+QxCAYhBGCRlfs1TQx2Hj2nP20UT92UU8ellj8=;
        b=oLGV+DJmhAMRp0w6pZ26DrajwLqYqpoFCBR/kYIy5cKpIt4vTIjUySzxA7RTyhpMj3
         9DdaXIBMTJ75mf+bwuPSs8UD3tXwb4pTWuf97G1yupAaTO1Jaq3dfupgqYkfg9I2i0aE
         yllrKD2LcqhdMUaDAfBNEpzDG1qnH52dbMXQoAthn6+BWROStTtBHfaxJtaxE7nkfQM+
         sw6bG3NJYZPEhPeL8wWMvMHIde5L3wEVyXixUdNtw0JRD4WKcR1xxOY3aW7fW7YnOqgh
         ivLzWMwEJThkXKtT3nH+zMtELbyjtmu04FDBsTwa6uadrkxWNXdIM6VwsfQMYpQaNYh4
         aC5w==
X-Gm-Message-State: AOJu0YwKu8UDH5LJvMA9D+juxpgVcjJZBS/LZkwNsmIi4oPXpdOMMvnX
	8M8daB6CrGXENMfLJW3O7tRttzOwRySubK59iz1I+wyELepv4ncNuJN4q8NgQQ==
X-Gm-Gg: ASbGnctTkZlTIWQcugf+QyBFJFBmqNFtRwshAnAVsdCRsUi4hfrJ76rhKcx+pq08QiV
	daWDTGImzyyGA4wVF94nezQBEJYeAL06We1btN58koQ/DpuPs3ybLzNFOQq43ITY8VG0Le9pyL5
	/JO/pGZRsL7ZHpZZOybYS2dUUp025IVtLmIjdh3FNRHYIu/zaHX0YvFII0YfmsEiA0XdUoqWYeU
	4cmoz8BnuOqYs5qnSPQyV2VXu6hjljfPJQk59BR+tN0zfTUO0iMVMJJqbx7ceLpRkH7JipZf/1t
	7cFwMOG4OHK1UqJAfxOX+C4UwmUJsxFHxVJ7FN/hSUK/l+ZcZ3kUsqiptwQLbwGIAyCBD3JGXZI
	2vCFQd1biJyH/2Noh5EvBHu5KriBPfl38c3g8nlHJ/Nv2k/rcEdcEQYRDnEINjjg0RlChvx/o8H
	E/a2UDl6/4kErXNVt7sTBuB1wM2sT/JJqaWUuWnWmWqvc62U5h5pf9ziuDTQ==
X-Google-Smtp-Source: AGHT+IH6JkYcO+yytNbtxop1mEAqgPBygjAvi/xcX7RrfDc9w8EKwif0bPRigjQHAThn/QnOps/6uA==
X-Received: by 2002:a17:906:794c:b0:b2b:63a9:223b with SMTP id a640c23a62f3a-b34bb9e9d44mr371323266b.31.1758797624684;
        Thu, 25 Sep 2025 03:53:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a9esm144917966b.84.2025.09.25.03.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:53:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] which: update 2.21 -> 2.23, build with meson
Date: Thu, 25 Sep 2025 12:53:39 +0200
Message-ID: <20250925105340.3021412-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 10:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224012

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
 ...opt-Fix-signature-of-getenv-function.patch | 29 +++---
 .../which/which-2.23/meson.build              | 92 +++++++++++++++++++
 .../which/{which_2.21.bb => which_2.23.bb}    | 11 +--
 4 files changed, 113 insertions(+), 38 deletions(-)
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
index 00000000000..045dfceb66e
--- /dev/null
+++ b/meta/recipes-extended/which/which-2.23/meson.build
@@ -0,0 +1,92 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
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
2.49.0


