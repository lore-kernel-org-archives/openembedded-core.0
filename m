Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE932C98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:51:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9385.1790081483111637640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 05:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WRefca3a;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B45541576
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:51:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D73733F632
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790081482; bh=mMzbg/e61c/9rjAglURL4BmPOIej/2lpNtgerr74hLI=;
	h=From:To:Subject:Date:From;
	b=WRefca3awjGxt6N5x1f0rys+/mO9iQCZ3AO6LbPIploI1VgvCre92JVP8jAPVggq0
	 p/0lxdHF3N66aNy8eJHVi/Wsw0bUFc3loH9iqLrVlxyh+bGyfTSlZ7fyi4zgmWaGM7
	 58bAkMKnu9nE0u7Al3zamdlX4c3Roa8kx6DWZzCM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gzip: upgrade 1.14 -> 1.15
Date: Tue, 22 Sep 2026 13:50:56 +0100
Message-ID: <20260922125113.669634-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 12:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246409

Upstream release notes:

** Bug fixes

  gzip no longer can mistakenly remove the wrong file if some other
  process simultaneously renames a gzip destination's ancestor.
  [bug present since the beginning]

  gzip -d no longer rejects PKZIP signatures, local header, and data
  descriptors.  These can appear in well-formed streamed zip files.
  [bug present since the beginning]

  gzip diagnostics now quote file names containing unusual characters.
  [bug present since the beginning]

  A use of uninitialized memory on some malformed inputs has been fixed.
  [bug present since the beginning]

  A buffer overflow has been fixed when decompressing an .lzh file
  after decompressing a .Z file.
  [bug present since the beginning]

  When decompressing an .lzh file, the output is no longer corrupted
  when an internal bit buffer is not properly cleared.
  [bug present since the beginning]

  When decompressing an .lzh file after another .lzh file, the output is
  no longer corrupted by the previous file's decoding table.
  [bug present since the beginning]

  gzip --synchronous no longer fails to synchronize unreadable parent
  directories on platforms like GNU/Linux that have O_PATH, or to
  synchronize any parent directories on platforms like FreeBSD that
  have O_SEARCH but not O_PATH.
  [bug introduced in gzip-1.7]

  On old-fashioned or limited platforms lacking mktemp, gzexe, zdiff
  and znew no longer have a race when creating a temporary file.
  [bug present since the beginning]

** Changes in behavior

  gzip no longer insists on the "C" locale; instead, it follows the
  typical practice of using the locale specified by the environment.
  This change, which is needed for file name quoting, can affect the
  format of floating-point numbers output by gzip's -l and -v options.
  Diagnostics are still in English, though.

  gzip -l now reports "-Inf%" instead of "0.0%" for the infinite
  compression ratio of an empty file.

  znew's -P option is now ignored, with a warning.  It was present
  only to improve performance, and its implementation had too many
  bugs to be worth supporting.

Drop two CVE patches that were backports.

Add a patch from upstream to fix the build for aarch64.

Consolidate patches into a single directory instead of split between
gzip-{PV}/ and files/.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...id-failure-to-build-on-linux-aarch64.patch | 44 ++++++++++
 .../{gzip-1.14 =3D> files}/wrong-path-fix.patch |  0
 .../gzip/gzip-1.14/CVE-2026-41991.patch       | 86 -------------------
 .../gzip/gzip-1.14/CVE-2026-41992.patch       | 64 --------------
 .../gzip/{gzip_1.14.bb =3D> gzip_1.15.bb}       |  5 +-
 5 files changed, 46 insertions(+), 153 deletions(-)
 create mode 100644 meta/recipes-extended/gzip/files/0001-build-avoid-fai=
lure-to-build-on-linux-aarch64.patch
 rename meta/recipes-extended/gzip/{gzip-1.14 =3D> files}/wrong-path-fix.=
patch (100%)
 delete mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.p=
atch
 delete mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.p=
atch
 rename meta/recipes-extended/gzip/{gzip_1.14.bb =3D> gzip_1.15.bb} (90%)

diff --git a/meta/recipes-extended/gzip/files/0001-build-avoid-failure-to=
-build-on-linux-aarch64.patch b/meta/recipes-extended/gzip/files/0001-bui=
ld-avoid-failure-to-build-on-linux-aarch64.patch
new file mode 100644
index 00000000000..b737d126b25
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/0001-build-avoid-failure-to-build-=
on-linux-aarch64.patch
@@ -0,0 +1,44 @@
+From b4ed8e73401968bcad749afb0e636dd3ec205ca7 Mon Sep 17 00:00:00 2001
+From: Jim Meyering <meyering@meta.com>
+Date: Mon, 21 Sep 2026 01:42:18 -0700
+Subject: [PATCH] build: avoid failure to build on linux aarch64
+X-ARM-No-Footer: NoDisclaimer
+
+* gzip.c: Include gzip.h only after all system headers.
+gzip.h's "head" definition affected a subsequent signal.h-
+included system struct member named "head".
+Reported by Adam Sampson in https://bugs.gnu.org/81904
+
+Upstream-Status: Backport [gzip b4ed8e73401968bcad749afb0e636dd3ec205ca7=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gzip.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gzip.c b/gzip.c
+index 220f6fc..6c0af7f 100644
+--- a/gzip.c
++++ b/gzip.c
+@@ -58,7 +58,6 @@ static char const license_msg[] =3D
+=20
+ #include "tailor.h"
+=20
+-#include "gzip.h"
+ #include "lzw.h"
+ #include "revision.h"
+ #include "version.h"
+@@ -99,6 +98,11 @@ static char const license_msg[] =3D
+ #  include <utimens.h>
+ #endif
+=20
++/* Include this only after all system headers. Otherwise, its definitio=
n
++   of "head" conflicts with member names in linux-headers 7.2.6's
++   asm/sigcontext.h pulled in via <signal.h>.  */
++#include "gzip.h"
++
+ #ifndef MAX_PATH_LEN
+ #  define MAX_PATH_LEN   1024 /* max pathname length */
+ #endif
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch b/=
meta/recipes-extended/gzip/files/wrong-path-fix.patch
similarity index 100%
rename from meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/files/wrong-path-fix.patch
diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch b/=
meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
deleted file mode 100644
index b1a36440209..00000000000
--- a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 661918c7c0d5acf52508107d6bcdeb72a526ce52 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 16 Apr 2026 12:11:44 -0700
-Subject: [PATCH] gzexe: use -C if lacking mktemp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-(Problem reported by Micha=C5=82 Majchrowicz.)
-* gzexe.in: If mktemp is needed but not installed,
-use =E2=80=98set -C=E2=80=99 to avoid a race when creating a temporary f=
ile.
-* zdiff.in: Use the same pattern here, even though the old
-code was probably OK anyway.
-
-CVE: CVE-2026-41991
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.g=
it/commit/?id=3D4e6f8b24ab823146ab8776f0b7fe486ab34d4269]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- NEWS     | 13 +++++++++----
- gzexe.in |  1 +
- zdiff.in |  7 +++----
- 3 files changed, 13 insertions(+), 8 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 881b6b6..3a05d7e 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,10 +4,6 @@ GNU gzip NEWS                                    -*- ou=
tline -*-
-=20
- ** Bug fixes
-=20
--  A buffer overflow has been fixed when decompressing an .lzh file
--  after decompressing a .Z file.
--  [bug present since the beginning]
--
-   'gzip -d' no longer omits the last partial output buffer when the
-   input ends unexpectedly on an IBM Z platform.
-   [bug introduced in gzip-1.11]
-@@ -18,6 +14,15 @@ GNU gzip NEWS                                    -*- =
outline -*-
-   'gzip -S' now rejects suffixes containing '/'.
-   [bug present since the beginning]
-=20
-+  A buffer overflow has been fixed when decompressing an .lzh file
-+  after decompressing a .Z file.
-+  [bug present since the beginning]
-+
-+  On old-fashioned or limited platforms lacking mktemp, gzexe and
-+  zdiff no longer have a race when creating a temporary file.
-+  [bug present since the beginning]
-+
-+
- ** Changes in behavior
-=20
-   The GZIP environment variable is now silently ignored except for the
-diff --git a/gzexe.in b/gzexe.in
-index 1267d6e..09a2571 100644
---- a/gzexe.in
-+++ b/gzexe.in
-@@ -127,6 +127,7 @@ for i do
-     tmp=3D`mktemp "${dir}gzexeXXXXXXXXX"`
-   else
-     tmp=3D${dir}gzexe$$
-+    (umask 77; set -C; > "$tmp")
-   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
-     res=3D$?
-     printf >&2 '%s\n' "$0: cannot copy $file"
-diff --git a/zdiff.in b/zdiff.in
-index a8689a0..c04a8c0 100644
---- a/zdiff.in
-+++ b/zdiff.in
-@@ -156,12 +156,11 @@ case $file2 in
-                           *) TMPDIR=3D/tmp/;;
-                         esac
-                         if command -v mktemp >/dev/null 2>&1; then
--                          tmp=3D`mktemp "${TMPDIR}zdiffXXXXXXXXX"` ||
--                            exit 2
-+                          tmp=3D`mktemp "${TMPDIR}zdiffXXXXXXXXX"`
-                         else
--                          set -C
-                           tmp=3D${TMPDIR}zdiff$$
--                        fi
-+                          (umask 77; set -C; > "$tmp")
-+                        fi &&
-                         'gzip' -cdfq -- "$file2" > "$tmp" || exit 2
-                         gzip_status=3D$(
-                           exec 4>&1
diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/=
meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
deleted file mode 100644
index f55c89978d6..00000000000
--- a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Wed, 15 Apr 2026 12:00:17 -0700
-Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lz=
h=3D20after=3D20.Z?=3D
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Micha=C5=82 Majchrowicz.
-* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
-
-CVE: CVE-2026-41992
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.g=
it/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- NEWS    | 4 ++++
- THANKS  | 1 +
- unlzh.c | 6 ++++++
- 3 files changed, 11 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 6388227..8fb8918 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,6 +4,10 @@ GNU gzip NEWS                                    -*- ou=
tline -*-
-=20
- ** Bug fixes
-=20
-+  A buffer overflow has been fixed when decompressing an .lzh file
-+  after decompressing a .Z file.
-+  [bug present since the beginning]
-+
-   'gzip -d' no longer omits the last partial output buffer when the
-   input ends unexpectedly on an IBM Z platform.
-   [bug introduced in gzip-1.11]
-diff --git a/THANKS b/THANKS
-index 4e545d9..a7d25e4 100644
---- a/THANKS
-+++ b/THANKS
-@@ -186,6 +186,7 @@ Jamie Lokier            u90jl@ecs.oxford.ac.uk
- Richard Lloyd           R.K.Lloyd@csc.liv.ac.uk
- David J. MacKenzie	djm@eng.umd.edu
- John R MacMillan        john@chance.gts.org
-+Micha=C5=82 Majchrowicz	mmajchrowicz@afine.com
- Ron Male                male@eso.mc.xerox.com
- Jakub Martisko		jamartis@redhat.com
- Don R. Maszle           maze@bea.lbl.gov
-diff --git a/unlzh.c b/unlzh.c
-index 3320196..a6cf109 100644
---- a/unlzh.c
-+++ b/unlzh.c
-@@ -232,6 +232,12 @@ read_c_len ()
-         c =3D getbits(CBIT);
-         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
-         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
-+
-+        /* Needed in case LEFT and RIGHT are reused from a previous
-+           LZW decompression.  It may be overkill to clear all of both
-+           arrays, but nobody has had time to analyze this carefully.  =
*/
-+        memzero(left, (2 * NC - 1) * sizeof *left);
-+        memzero(right, (2 * NC - 1) * sizeof *left);
-     } else {
-         i =3D 0;
-         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-exten=
ded/gzip/gzip_1.15.bb
similarity index 90%
rename from meta/recipes-extended/gzip/gzip_1.14.bb
rename to meta/recipes-extended/gzip/gzip_1.15.bb
index d6bd36f89f9..9db300f078c 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.15.bb
@@ -6,8 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
-           file://CVE-2026-41992.patch \
-           file://CVE-2026-41991.patch \
+           file://0001-build-avoid-failure-to-build-on-linux-aarch64.pat=
ch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
@@ -42,4 +41,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
=20
-SRC_URI[sha256sum] =3D "613d6ea44f1248d7370c7ccdeee0dd0017a09e6c39de894b=
3c6f03f981191c6b"
+SRC_URI[sha256sum] =3D "545886cf57fa88a65e967fbf705903d7fcb2567c82c73424=
93e82e8d7b1a210b"
--=20
2.43.0


