Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E461DC46CA9
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.91596.1701080289154553606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljj1folt;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so574393366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080287; x=1701685087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BmTYZegMcUsaHpjdP/G5E/ZFwlOwU7XUSksiWTnmQc=;
        b=ljj1foltd7TFazJROxM4P1rBeSTaGUldzj7wKuxhNy5aCKh/VFc86QLeedzNMn9OuR
         /GfBDXko+ANCC7zRa0ciy7kk3PnmvJtaH4E3bcPVWSl+gCuguA7WlsMwsAY4A/GACH63
         8zUyw/L7rjp3/0fzCpdloe9A/VgrfqLmeX0DTIUA92SfSk+kH8uhrgXlDzFpwQhImeBL
         ATdrKLZsRxrclabvKWd0gjb4ZQQcVmhbhxPjmRjAGcb5yvc02qsXXUn+Wj4ais7Ef7QH
         p7zFRbO0SP3kfJem+lkCNFK/rB8VUbauYEKspBvAb1VVXiP8X5pu6tMgyYbsIJ4PXS++
         hD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080287; x=1701685087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BmTYZegMcUsaHpjdP/G5E/ZFwlOwU7XUSksiWTnmQc=;
        b=lLNM5CsSnu6PKdimhGmZB1YJsm7CfIH0+afW51iT+CgloKECf+SgCkGB1pfz3wiwwC
         lkdT8ZkXu6RlwuZEJRJoKD8JzMjtYYGiq7WjIFo8OJ7FKzIZisa6zlB1FKNzAyQU9TD+
         68WlIu5vHGVk2iZrnEbNj72i2AQNVVnoqwkERab5Bz8gAK17ZrXGa7sbKOVEch8r7W/6
         jO4htds8VbDI14JzCpf2zfqJGdW3hkA6pZpL/SniLyJoC8AqZpU8kA7pP5Sme3vunu9B
         +mvpQOoT93Ugcepw91xhFwqkdKGVKjQB4Pk1zfYmCafMCqwsvPN7+8avQ6hs09sppJkB
         ch4A==
X-Gm-Message-State: AOJu0Yy4z9G8qPsHb50BzwvMp2V6RcShb5ND0c6rn1MCKDxZxSzkFmiz
	qJJZMtPsHj4hSBqDdEwdUq2AQSZ2iYk=
X-Google-Smtp-Source: AGHT+IHVZyie/jgziFAFgFQIRFfNfWYkzF0I++qJhA9lnQjGd82VxhxfANhyDUR5Nu0hTpMsG7im+w==
X-Received: by 2002:a17:906:d28e:b0:9e5:cef:6ff with SMTP id ay14-20020a170906d28e00b009e50cef06ffmr9039465ejb.33.1701080287569;
        Mon, 27 Nov 2023 02:18:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/19] p11-kit: upgrade 0.25.0 -> 0.25.2
Date: Mon, 27 Nov 2023 11:17:47 +0100
Message-Id: <20231127101751.3187950-15-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191282

Switch to gitsm:// to fetch https://github.com/p11-glue/pkcs11-json.git
as a submodule (otherwise meson will try to do that in do_configure).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../p11-kit/files/strerror-1.patch            | 76 -------------------
 .../p11-kit/files/strerror-2.patch            | 30 --------
 .../{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb}  |  6 +-
 3 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-1.patch
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-2.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb} (85%)

diff --git a/meta/recipes-support/p11-kit/files/strerror-1.patch b/meta/recipes-support/p11-kit/files/strerror-1.patch
deleted file mode 100644
index 6af4fee7249..00000000000
--- a/meta/recipes-support/p11-kit/files/strerror-1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3ba2c55dfdc8ff20de369f07f6c57d08718d3add Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:22:49 +0100
-Subject: [PATCH] Check for GNU strerror_r using the compiler only
-
-The new test that was added to distinguish GNU/XSI strerror_r ran a
-compiled program, which doesn't work when cross-compiling. The only
-difference at compile time is that the GNU version returns char * and
-the XSI version returns int, so detect it by compiling a program that
-dereferences the return value.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 19 +++++++------------
- meson.build  | 10 +++++-----
- 2 files changed, 12 insertions(+), 17 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 40f5a583..29890622 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -146,19 +146,14 @@ if test "$os_unix" = "yes"; then
- 
- 	AC_CHECK_FUNC(
- 		[strerror_r],
--		[AC_RUN_IFELSE(
--			[AC_LANG_SOURCE([[
--				#include <errno.h>
--				#include <string.h>
--
--				int main (void)
--				{
--					char buf[32];
--					return strerror_r (EINVAL, buf, 32);
--				}
--			]])],
--                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
-+		[AC_COMPILE_IFELSE(
-+			[AC_LANG_PROGRAM([[#include <errno.h>
-+					   #include <string.h>]],
-+					 [[/* GNU strerror_r returns char *, XSI returns int */
-+					    char buf[32];
-+					    return *strerror_r (EINVAL, buf, 32);]])],
- 			[AC_DEFINE([HAVE_GNU_STRERROR_R], 1, [Whether GNU-specific strerror_r() is available])],
-+                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
- 			[])],
- 		[])
- 
-diff --git a/meson.build b/meson.build
-index 0f8c8da0..4cc3f89a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -306,15 +306,15 @@ if cc.has_function('strerror_r', prefix: '#include <string.h>')
- 
- int main (void)
- {
-+    /* GNU strerror_r returns char *, XSI returns int */
-     char buf[32];
--    return strerror_r (EINVAL, buf, 32);
-+    return *strerror_r (EINVAL, buf, 32);
- }
- '''
--  strerror_r_check = cc.run(strerror_r_code, name : 'strerror_r check')
--  if strerror_r_check.returncode() == 0
--    conf.set('HAVE_XSI_STRERROR_R', 1)
--  else
-+  if cc.compiles(strerror_r_code, name : 'GNU strerror_r check')
-     conf.set('HAVE_GNU_STRERROR_R', 1)
-+  else
-+    conf.set('HAVE_XSI_STRERROR_R', 1)
-   endif
- endif
- 
diff --git a/meta/recipes-support/p11-kit/files/strerror-2.patch b/meta/recipes-support/p11-kit/files/strerror-2.patch
deleted file mode 100644
index 1a9180b508c..00000000000
--- a/meta/recipes-support/p11-kit/files/strerror-2.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7aa6251bf4ce36d027d53c9c96bb05f90ef7eb5b Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:44:06 +0100
-Subject: [PATCH] Define _GNU_SOURCE when testing for strerror_r
-
-The Meson check for GNU/XSI strerror_r didn't inherit the project
-options that include _GNU_SOURCE (unlike the autoconf version), so the
-result didn't match how the code that uses it will be compiled. Add
-_GNU_SOURCE explicitly as with the following checks.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 4cc3f89a..9a72e148 100644
---- a/meson.build
-+++ b/meson.build
-@@ -301,6 +301,7 @@ endforeach
- 
- if cc.has_function('strerror_r', prefix: '#include <string.h>')
-   strerror_r_code = '''
-+#define _GNU_SOURCE
- #include <errno.h>
- #include <string.h>
- 
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
similarity index 85%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
index ad1fda3f3b7..d00ef2daf55 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
@@ -10,10 +10,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https \
-           file://strerror-1.patch \
-           file://strerror-2.patch"
-SRCREV = "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
+SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https"
+SRCREV = "66d6b42ef8dd84fcd8e199ac9f23f822f1a058c9"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


