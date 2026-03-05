Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ED3F47CA5
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:03:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50785.1772733821598346748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xndn20uu;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4833115090dso85276945e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772733820; x=1773338620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFWA3VBLvl+TsYNCLe2KnzOJS49YB8xSIk8xbsc70NQ=;
        b=Xndn20uurZGVkSOwq5sAdmFdYAYD/fn2xVSQ3rP4Mb113r/1qYdNDp8U3myMC30tRk
         ZU2X6j77Qq4jlTfEB6ZvhSS0L2t4d5mRGaHfkJBPpMP/clr4UYZuK5NfiWPmnmIpTGjO
         0vnFvev6r2LFnc0fzJDnVJ4x5xq/NWk3fh+L0gfppCVpA27CgYcQzt5cOiyG661y6QtV
         TUYd8pNKslIiMP5JyZMxrnNysOSbb3gxocEYoh9DOdPJKdk5rmyIL10SR6ROs8ro3LwX
         rE5wxLd/Z+R0xEYRKIKTBaAQCl6MW33dx+HfdJHKbOuyH1LdPCo3cQmzHq0v3eAGJz6N
         Qb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772733820; x=1773338620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFWA3VBLvl+TsYNCLe2KnzOJS49YB8xSIk8xbsc70NQ=;
        b=dWZWbA0LtOZPOBpkwZMWPBYlFLn1S+1ycjxI1Ve2+Ja9WvwERSwJGvmcet2AUdOtYr
         /s0BAAurYEdiUZFJHwLPAakwX5LsbR+go5HDnYLoFej1JWm6hXZPIhfw9LLwdld9+KUL
         sKhorx5C+8BtbkF3qgQKKfU6dHCM2CqpGOEuIJRZJiGv+K6I/H82/wrL/INuCV+65Q4h
         wa8vm3ClVDQGyVgOG4XDrBl5nIaLRa133pRQzimcvfnadcfX8W7l49I5LjtZAEJhY9+N
         yKzOr4War/NuLsynt7twCzfshXk3UKNaDser/qkk4Njse698GTrGsb5jZlShjWYxyQdh
         Dzhg==
X-Gm-Message-State: AOJu0YziltkZsaEE4YjScqrXIznbrJzc1RblF17SsGClQs1vfAUNLZaY
	FOmHirifFLqpaddP/TF/UsEAGxUkUzxMGBnLyasjCK41gT0M4qMXQu1tUDMMcnjw
X-Gm-Gg: ATEYQzx9tS0PkKp3K/0ippexySc4Ee1rvg3tVOksZl7KWi7694/A2Pqmlfirzj5hvlU
	h05AdkmbEVefUz5MLyd5rTeObQFjP36zi84PxAfyYYQqKEfOMDCbp3aiQbRrBEbWoJtIWxlcZqJ
	cfrwkm+QIuKfmYg0JK5TMQoTCQ1MmjGr2bBtZZJDHH05srXyJOpiRpENc1PL1QaVRZ3ONJSGO0B
	f0vX6kjb5bwntQ1mFy/0abxhMDsiuyZ+R0xFcLCBoSVtc/XQs0mWkEPMd/o/1XaT5VDpH3b7/Tt
	YCtRFnuIeGKoIhgteGF8QSkAkUlIRpoIc1MkjVOiQ9WXwNtIV4VP68cGJEfIt4wvRGfXokq/bHG
	vQdN4DLD0gloCoBO4f0UIP3OX8vRHSGrRUHiHMKKJ9UgEXCqSDRzNtUwDZcVKixYuS9+X6qEt//
	ygI3hmltsoOKeRtM8WW9VISiMInw==
X-Received: by 2002:a05:600c:8708:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-485235c7e44mr6023725e9.16.1772733819536;
        Thu, 05 Mar 2026 10:03:39 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm108245235e9.9.2026.03.05.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:03:39 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/3] m4: upgrade to 1.4.21
Date: Thu,  5 Mar 2026 19:03:29 +0100
Message-ID: <20260305180333.306176-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232503

From: Martin Jansa <martin.jansa@gmail.com>

https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
This release is being made mainly to cater to recent glibc changes in
light of the C23 language standard.  However, it also includes fixes
for some corner-case bugs in eval and when using the defn macro on
builtins.

Fixes m4-native builds on hosts with glibc-2.43 like:
./stdlib.h:827:20: error: expected identifier or '(' before '_Generic'
./string.h:777:20: error: expected identifier or '(' before '_Generic'

Remove 0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
which is included in gnulib revision used by m4 since:
https://gitweb.git.savannah.gnu.org/gitweb/?p=m4.git;a=commit;h=beee8d26382460010338c37f9dd9f823aa9f4ee8

LIC_FILES_CHKSUM was updated for barem4.m4 and testbarem4.m4 from:
https://gitweb.git.savannah.gnu.org/gitweb/?p=m4.git;a=blobdiff;f=examples/COPYING;h=e623b2b9394cbd1784a4964bbac105050296f33b;hp=7e73a1219b542fa035facc47cdb3dd81132e6373;hb=900a90f624cee4a8c1c02c4d6a61ef1ed26a17d1;hpb=c7b96d682958532c4eb2d5c2d81bb6ac342fd410

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../m4/{m4-1.4.20.inc => m4-1.4.21.inc}       |   5 +-
 ...4-native_1.4.20.bb => m4-native_1.4.21.bb} |   0
 ...gcc-Wformat-security-warnings-with-d.patch | 133 ------------------
 .../m4/{m4_1.4.20.bb => m4_1.4.21.bb}         |   0
 4 files changed, 2 insertions(+), 136 deletions(-)
 rename meta/recipes-devtools/m4/{m4-1.4.20.inc => m4-1.4.21.inc} (90%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.20.bb => m4-native_1.4.21.bb} (100%)
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
 rename meta/recipes-devtools/m4/{m4_1.4.20.bb => m4_1.4.21.bb} (100%)

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.21.inc
similarity index 90%
rename from meta/recipes-devtools/m4/m4-1.4.20.inc
rename to meta/recipes-devtools/m4/m4-1.4.21.inc
index 5c4ba09288..ce9fe2be8e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
@@ -7,19 +7,18 @@ GNU M4 also has built-in functions for including files, running shell commands,
 inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-           file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
                                 file://serial-tests-config.patch \
                               "
 
-SRC_URI[sha256sum] = "6ac4fc31ce440debe63987c2ebbf9d7b6634e67a7c3279257dc7361de8bdb3ef"
+SRC_URI[sha256sum] = "38ae59f7a30bf9c108193cc5c25fbb06014f21e230c7ede2eff614f7b7c37ed8"
 
 LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464\
-	            file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
+	            file://examples/COPYING;md5=005f2e201a0526c1d1d79dd6303ecf23"
 
 EXTRA_OECONF += "--without-libsigsegv-prefix"
 
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.20.bb b/meta/recipes-devtools/m4/m4-native_1.4.21.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.20.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.21.bb
diff --git a/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch b/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
deleted file mode 100644
index 6fad05041f..0000000000
--- a/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From c4dc0ab4424fca31635b7837b1c180f7d3df8ede Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Wed, 28 May 2025 15:14:07 +0200
-Subject: [PATCH] gettext-h: Avoid gcc -Wformat-security warnings with
- --disable-nls.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Reported by Holger Hoffstätte <holger@applied-asynchrony.com> in
-<https://lists.gnu.org/archive/html/bug-gnulib/2025-05/msg00225.html>.
-
-* lib/gettext.h (gettext, dgettext, dcgettext): With gcc in C mode,
-define these as inline functions.
-* lib/sigpipe-die.c (sigpipe_die): Use translated string as a format
-string, relying on the format string checking done by 'msgfmt -c'.
-* lib/xmemcoll.c (collate_error): Revert commit from 2025-01-17.
-* lib/xprintf.c (xvprintf, xvfprintf): Likewise.
-* lib/openat-die.c (openat_save_fail, openat_restore_fail): Revert
-commit from 2024-12-10.
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnulib.git/commit/?id=6e5015dd557b20ae4a0829c4bf78480ce2f4cb04]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- lib/gettext.h    | 49 ++++++++++++++++++++++++++++++++++++------------
- lib/openat-die.c |  4 ++--
- lib/xprintf.c    |  4 ++--
- 3 files changed, 41 insertions(+), 16 deletions(-)
-
-diff --git a/lib/gettext.h b/lib/gettext.h
-index ea0c27e..bb3d975 100644
---- a/lib/gettext.h
-+++ b/lib/gettext.h
-@@ -59,18 +59,43 @@
- #  endif
- # endif
- 
--/* Disabled NLS.
--   The casts to 'const char *' serve the purpose of producing warnings
--   for invalid uses of the value returned from these functions.
--   On pre-ANSI systems without 'const', the config.h file is supposed to
--   contain "#define const".  */
--# undef gettext
--# define gettext(Msgid) ((const char *) (Msgid))
--# undef dgettext
--# define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgid))
--# undef dcgettext
--# define dcgettext(Domainname, Msgid, Category) \
--    ((void) (Category), dgettext (Domainname, Msgid))
-+/* Disabled NLS.  */
-+# if defined __GNUC__ && !defined __clang__ && !defined __cplusplus
-+/* Use inline functions, to avoid warnings
-+     warning: format not a string literal and no format arguments
-+   that don't occur with enabled NLS.  */
-+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
-+const char *
-+gettext (const char *msgid)
-+{
-+  return msgid;
-+}
-+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
-+const char *
-+dgettext (const char *domain, const char *msgid)
-+{
-+  (void) domain;
-+  return msgid;
-+}
-+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
-+const char *
-+dcgettext (const char *domain, const char *msgid, int category)
-+{
-+  (void) domain;
-+  (void) category;
-+  return msgid;
-+}
-+# else
-+/* The casts to 'const char *' serve the purpose of producing warnings
-+   for invalid uses of the value returned from these functions.  */
-+#  undef gettext
-+#  define gettext(Msgid) ((const char *) (Msgid))
-+#  undef dgettext
-+#  define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgid))
-+#  undef dcgettext
-+#  define dcgettext(Domainname, Msgid, Category) \
-+     ((void) (Category), dgettext (Domainname, Msgid))
-+# endif
- # undef ngettext
- # define ngettext(Msgid1, Msgid2, N) \
-     ((N) == 1 \
-diff --git a/lib/openat-die.c b/lib/openat-die.c
-index 3fbb5d8..79a5b23 100644
---- a/lib/openat-die.c
-+++ b/lib/openat-die.c
-@@ -34,7 +34,7 @@ _Noreturn void
- openat_save_fail (int errnum)
- {
- #ifndef GNULIB_LIBPOSIX
--  error (exit_failure, errnum, "%s",
-+  error (exit_failure, errnum,
-          _("unable to record current working directory"));
- #endif
-   /* _Noreturn cannot be applied to error, since it returns
-@@ -53,7 +53,7 @@ _Noreturn void
- openat_restore_fail (int errnum)
- {
- #ifndef GNULIB_LIBPOSIX
--  error (exit_failure, errnum, "%s",
-+  error (exit_failure, errnum,
-          _("failed to return to initial working directory"));
- #endif
- 
-diff --git a/lib/xprintf.c b/lib/xprintf.c
-index 4d9a3e5..790af53 100644
---- a/lib/xprintf.c
-+++ b/lib/xprintf.c
-@@ -45,7 +45,7 @@ xvprintf (char const *restrict format, va_list args)
- {
-   off64_t retval = vzprintf (format, args);
-   if (retval < 0 && ! ferror (stdout))
--    error (exit_failure, errno, "%s", _("cannot perform formatted output"));
-+    error (exit_failure, errno, _("cannot perform formatted output"));
- 
-   return retval;
- }
-@@ -67,7 +67,7 @@ xvfprintf (FILE *restrict stream, char const *restrict format, va_list args)
- {
-   off64_t retval = vfzprintf (stream, format, args);
-   if (retval < 0 && ! ferror (stream))
--    error (exit_failure, errno, "%s", _("cannot perform formatted output"));
-+    error (exit_failure, errno, _("cannot perform formatted output"));
- 
-   return retval;
- }
diff --git a/meta/recipes-devtools/m4/m4_1.4.20.bb b/meta/recipes-devtools/m4/m4_1.4.21.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4_1.4.20.bb
rename to meta/recipes-devtools/m4/m4_1.4.21.bb

