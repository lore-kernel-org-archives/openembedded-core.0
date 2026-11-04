Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11147.1793804789055244493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZPUxtWWV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF8FB1A145C
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 15:06:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EBAB60770
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 15:06:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCA59103291D1;
	Wed,  4 Nov 2026 16:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793804782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8EmydrUnkDr7L0yc6z3ubNHOR2Um+R1atjpILxpmaEI=;
	b=ZPUxtWWVMEltfynrw8yMR5N7WvtGpCn2/ZfT9fst7y0wDkc5czvzOe8f47+Wlma8GMSdyM
	nTkm+ttzh9WAgKLTP5PFEmavfWCdhYrlLBAd88JJDL/YYllfSvMnOuKNS6lCkuxWQAtN2e
	bOs8wMQ0YwkTvrbJBlEpqrpUtK2JFBe2Glvvm+2TdbPQwZG76nK4vAkOwCR7Nuvl6VJ5ST
	IhXejM7eVHQFe5AOB7t8fnd8BWIQpfdcbm6VmVAGKRPKQAq26slN/TQQDlwKWDhV/HzmiC
	w71qvTTq/6KGOsSboCrpFsU2QsFsm9LywJEVzOrAMCF3PzQzAQvTepYl8/NGbw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] glibc: fix CVE-2026-84243
Date: Wed,  4 Nov 2026 16:06:11 +0100
Message-ID: <20261104150611.1720587-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249386

This vulnerability, marked as High [1], was fixed upstream [2] since
2.45.

Backport the fix to glibc v2.39.

The only changes not included in the backport are the ones in NEWS file.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-84243
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D17142

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../glibc/glibc/CVE-2026-84243.patch          | 193 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta/re=
cipes-core/glibc/glibc/CVE-2026-84243.patch
new file mode 100644
index 0000000000..640a166c08
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
@@ -0,0 +1,193 @@
+From 02449c3a9751f801d49a41952291a6c09a24de15 Mon Sep 17 00:00:00 2001
+From: Avinal Kumar <avinal.xlvii@gmail.com>
+Date: Mon, 2 Nov 2026 17:18:03 -0300
+Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE env v=
ar [BZ
+ #17142, CVE-2026-84243]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in
+locale/findlocale.c to reject locale names containing ".." path
+components.  However, the LANGUAGE environment variable processing in
+intl/dcigettext.c was not covered by that fix.  An attacker who can
+set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using
+program to load a crafted .mo file from an arbitrary filesystem
+location via directory traversal.  A crafted .mo file can crash the
+program through out-of-range offsets or through format-string
+translations that consume more arguments than the caller passes,
+causing undefined behaviour in *printf.  glibc cannot fully protect
+against the latter at the gettext level.  The safety of .mo files
+normally relies on them being produced by msgmerge and msgfmt -c and
+installed in read-only locations; path traversal bypasses this trust
+model.
+
+Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it
+applies to all binaries, not just SUID/SGID ones, and extend it to
+also reject the bare ".." entry which contains no directory separator
+but still names the parent directory.
+
+Add tst-gettext-path-traversal to verify that locale names containing
+path separators or equal to ".." are rejected by the LANGUAGE processing=
 loop.
+
+This fixes bug 17142 and CVE-2026-84243.
+
+Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-84243
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dgli=
bc.git;h=3D03067f3c5e39aec5ec250a44bc1b395a1afd45e8]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ intl/Makefile                     |  4 ++
+ intl/dcigettext.c                 |  8 +--
+ intl/tst-gettext-path-traversal.c | 83 +++++++++++++++++++++++++++++++
+ 3 files changed, 91 insertions(+), 4 deletions(-)
+ create mode 100644 intl/tst-gettext-path-traversal.c
+
+diff --git a/intl/Makefile b/intl/Makefile
+index 9b79198e68..02b217d471 100644
+--- a/intl/Makefile
++++ b/intl/Makefile
+@@ -53,6 +53,7 @@ $(objpfx)plural.o: $(objpfx)plural.c
+ ifeq ($(run-built-tests),yes)
+ ifeq (yes,$(build-shared))
+ ifneq ($(strip $(MSGFMT)),:)
++tests +=3D tst-gettext-path-traversal
+ tests-special +=3D $(objpfx)tst-translit.out $(objpfx)tst-gettext.out \
+ 		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
+ 		 $(objpfx)tst-gettext3.out
+@@ -107,6 +108,7 @@ $(objpfx)tst-gettext6.out: tst-gettext6.sh $(objpfx)=
tst-gettext6
+ $(objpfx)tst-codeset.out: $(codeset_mo)
+ $(objpfx)tst-gettext3.out: $(codeset_mo)
+ $(objpfx)tst-gettext5.out: $(codeset_mo)
++$(objpfx)tst-gettext-path-traversal.out: $(codeset_mo)
+ endif
+=20
+ LOCALES :=3D de_DE.ISO-8859-1 de_DE.UTF-8 en_US.ANSI_X3.4-1968 fr_FR.IS=
O-8859-1 \
+@@ -121,6 +123,7 @@ $(objpfx)tst-gettext4.out: $(gen-locales)
+ $(objpfx)tst-gettext5.out: $(gen-locales)
+ $(objpfx)tst-gettext6.out: $(gen-locales)
+ $(objpfx)tst-gettext-c-utf8.out: $(gen-locales)
++$(objpfx)tst-gettext-path-traversal.out: $(gen-locales)
+ $(objpfx)tst-translit.out: $(gen-locales)
+ endif
+=20
+@@ -140,6 +143,7 @@ CFLAGS-tst-gettext3.c +=3D -DOBJPFX=3D\"$(objpfx)\"
+ CFLAGS-tst-gettext4.c +=3D -DOBJPFX=3D\"$(objpfx)\"
+ CFLAGS-tst-gettext5.c +=3D -DOBJPFX=3D\"$(objpfx)\"
+ CFLAGS-tst-gettext6.c +=3D -DOBJPFX=3D\"$(objpfx)\"
++CFLAGS-tst-gettext-path-traversal.c +=3D -DOBJPFX=3D\"$(objpfx)\"
+=20
+ ifeq ($(have-thread-library),yes)
+ ifeq (yes,$(build-shared))
+diff --git a/intl/dcigettext.c b/intl/dcigettext.c
+index a028518c2a..57f422f437 100644
+--- a/intl/dcigettext.c
++++ b/intl/dcigettext.c
+@@ -684,10 +684,10 @@ DCIGETTEXT (const char *domainname, const char *ms=
gid1, const char *msgid2,
+ 	    *cp++ =3D *categoryvalue++;
+ 	  *cp =3D '\0';
+=20
+-	  /* When this is a SUID binary we must not allow accessing files
+-	     outside the dedicated directories.  */
+-	  if (ENABLE_SECURE && IS_PATH_WITH_DIR (single_locale))
+-	    /* Ingore this entry.  */
++	  /* Do not allow accessing files outside the dedicated
++	     directories.  */
++	  if (IS_PATH_WITH_DIR (single_locale)
++	      || strcmp (single_locale, "..") =3D=3D 0)
+ 	    continue;
+ 	}
+=20
+diff --git a/intl/tst-gettext-path-traversal.c b/intl/tst-gettext-path-t=
raversal.c
+new file mode 100644
+index 0000000000..95ad326f64
+--- /dev/null
++++ b/intl/tst-gettext-path-traversal.c
+@@ -0,0 +1,83 @@
++/* Test that LANGUAGE values with path traversal are rejected [BZ #1714=
2].
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <libintl.h>
++#include <locale.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/support.h>
++
++static const char *const domaindir =3D OBJPFX "domaindir";
++static const char *const localedir =3D OBJPFX "domaindir/de_DE";
++static const char *const msgdir =3D OBJPFX "domaindir/de_DE/LC_MESSAGES=
";
++
++static int
++do_test (void)
++{
++  unsetenv ("OUTPUT_CHARSET");
++  /* LANGUAGE is only consulted if the locale is not "C" or "C.<codeset=
>".
++     The catalog is in ISO-8859-1, as is the locale, so no conversion o=
f
++     the translation takes place.  */
++  xsetlocale (LC_ALL, "de_DE.ISO-8859-1");
++  textdomain ("codeset");
++
++  /* Verify that a legitimate LANGUAGE value produces the expected
++     translation.  This exercises the normal lookup path and confirms
++     that the test .mo catalog is in place.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A bare ".." must be rejected.  Without the fix this would resolve
++     to msgdir/../LC_MESSAGES/codeset.mo, which is the real catalog,
++     so the translation would succeed.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* A relative path that leaves and re-enters the catalog directory
++     must be rejected.  Without the fix this would resolve to
++     localedir/../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Multiple levels of directory traversal must be rejected.  Without
++     the fix this would resolve to
++     msgdir/../../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "../../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Invalid entries in a colon-separated LANGUAGE list must be
++     skipped individually; valid entries that follow are still
++     used.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "..:../de_DE:de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A path containing "/.." must be rejected.  Use localedir so the
++     binding changes, which invalidates the DCIGETTEXT result cache.  *=
/
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "LC_MESSAGES/..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
index d31c865641..805a78571c 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -63,6 +63,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0028-CVE-2026-6238-0004.patch \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
+           file://CVE-2026-84243.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.55.0

