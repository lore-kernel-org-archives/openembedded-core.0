Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B974DC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 13:32:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.40934.1666013538333700195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 437251042;
	Mon, 17 Oct 2022 06:32:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763853F67D;
	Mon, 17 Oct 2022 06:32:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] zlib: upgrade 1.2.12 -> 1.2.13
Date: Mon, 17 Oct 2022 14:32:11 +0100
Message-Id: <20221017133211.212616-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017133211.212616-1-ross.burton@arm.com>
References: <20221017133211.212616-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171911

Drop a number of patches whicih have been merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...t-inputs-provided-to-the-CRC-functio.patch | 54 -------------------
 ...etting-a-gzip-header-extra-field-wit.patch | 38 -------------
 ...processing-bug-that-dereferences-NUL.patch | 36 -------------
 meta/recipes-core/zlib/zlib/cc.patch          | 27 ----------
 .../zlib/zlib/ldflags-tests.patch             | 45 ----------------
 .../zlib/{zlib_1.2.12.bb =3D> zlib_1.2.13.bb}   |  7 +--
 6 files changed, 1 insertion(+), 206 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-in=
puts-provided-to-the-CRC-functio.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getti=
ng-a-gzip-header-extra-field-wit.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-extra-field-proc=
essing-bug-that-dereferences-NUL.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/ldflags-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.2.12.bb =3D> zlib_1.2.13.bb} (75%)

diff --git a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-pr=
ovided-to-the-CRC-functio.patch b/meta/recipes-core/zlib/zlib/0001-Correc=
t-incorrect-inputs-provided-to-the-CRC-functio.patch
deleted file mode 100644
index ad5e59de040..00000000000
--- a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-=
to-the-CRC-functio.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ec3df00224d4b396e2ac6586ab5d25f673caa4c2 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Wed, 30 Mar 2022 11:14:53 -0700
-Subject: [PATCH] Correct incorrect inputs provided to the CRC functions.
-
-The previous releases of zlib were not sensitive to incorrect CRC
-inputs with bits set above the low 32. This commit restores that
-behavior, so that applications with such bugs will continue to
-operate as before.
-
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/ec3df00=
224d4b396e2ac6586ab5d25f673caa4c2]
-Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
----
- crc32.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/crc32.c b/crc32.c
-index a1bdce5..451887b 100644
---- a/crc32.c
-+++ b/crc32.c
-@@ -630,7 +630,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
- #endif /* DYNAMIC_CRC_TABLE */
-=20
-     /* Pre-condition the CRC */
--    crc ^=3D 0xffffffff;
-+    crc =3D (~crc) & 0xffffffff;
-=20
-     /* Compute the CRC up to a word boundary. */
-     while (len && ((z_size_t)buf & 7) !=3D 0) {
-@@ -749,7 +749,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
- #endif /* DYNAMIC_CRC_TABLE */
-=20
-     /* Pre-condition the CRC */
--    crc ^=3D 0xffffffff;
-+    crc =3D (~crc) & 0xffffffff;
-=20
- #ifdef W
-=20
-@@ -1077,7 +1077,7 @@ uLong ZEXPORT crc32_combine64(crc1, crc2, len2)
- #ifdef DYNAMIC_CRC_TABLE
-     once(&made, make_crc_table);
- #endif /* DYNAMIC_CRC_TABLE */
--    return multmodp(x2nmodp(len2, 3), crc1) ^ crc2;
-+    return multmodp(x2nmodp(len2, 3), crc1) ^ (crc2 & 0xffffffff);
- }
-=20
- /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
-@@ -1112,5 +1112,5 @@ uLong crc32_combine_op(crc1, crc2, op)
-     uLong crc2;
-     uLong op;
- {
--    return multmodp(op, crc1) ^ crc2;
-+    return multmodp(op, crc1) ^ (crc2 & 0xffffffff);
- }
diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gz=
ip-header-extra-field-wit.patch b/meta/recipes-core/zlib/zlib/0001-Fix-a-=
bug-when-getting-a-gzip-header-extra-field-wit.patch
deleted file mode 100644
index 96ab563121c..00000000000
--- a/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-head=
er-extra-field-wit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Sat, 30 Jul 2022 15:51:11 -0700
-Subject: [PATCH] Fix a bug when getting a gzip header extra field with i=
nflate().
-
-If the extra field was larger than the space the user provided with
-inflateGetHeader(), and if multiple calls of inflate() delivered
-the extra header data, then there could be a buffer overflow of the
-provided space. This commit assures that provided space is not
-exceeded.
-
-CVE: CVE-2022-37434
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308a=
f425b67093bab25f80f1ae950166be]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- inflate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7be8c63..7a72897 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,9 +763,10 @@ int flush;
-                 copy =3D state->length;
-                 if (copy > have) copy =3D have;
-                 if (copy) {
-+                    len =3D state->head->extra_len - state->length;
-                     if (state->head !=3D Z_NULL &&
--                        state->head->extra !=3D Z_NULL) {
--                        len =3D state->head->extra_len - state->length;
-+                        state->head->extra !=3D Z_NULL &&
-+                        len < state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
---=20
-2.37.2
-
diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-=
bug-that-dereferences-NUL.patch b/meta/recipes-core/zlib/zlib/0001-Fix-ex=
tra-field-processing-bug-that-dereferences-NUL.patch
deleted file mode 100644
index a0978c5f953..00000000000
--- a/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-tha=
t-dereferences-NUL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Mon, 8 Aug 2022 10:50:09 -0700
-Subject: [PATCH] Fix extra field processing bug that dereferences NULL
- state->head.
-
-The recent commit to fix a gzip header extra field processing bug
-introduced the new bug fixed here.
-
-CVE: CVE-2022-37434
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/1eb7682=
f845ac9e9bf9ae35bbfb3bad5dacbd91d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- inflate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7a72897..2a3c4fe 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,10 +763,10 @@ int flush;
-                 copy =3D state->length;
-                 if (copy > have) copy =3D have;
-                 if (copy) {
--                    len =3D state->head->extra_len - state->length;
-                     if (state->head !=3D Z_NULL &&
-                         state->head->extra !=3D Z_NULL &&
--                        len < state->head->extra_max) {
-+                        (len =3D state->head->extra_len - state->length=
) <
-+                            state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
---=20
-2.37.2
-
diff --git a/meta/recipes-core/zlib/zlib/cc.patch b/meta/recipes-core/zli=
b/zlib/cc.patch
deleted file mode 100644
index 8fb974ded4a..00000000000
--- a/meta/recipes-core/zlib/zlib/cc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Mon, 28 Mar 2022 18:34:10 -0700
-Subject: [PATCH] Fix configure issue that discarded provided CC definiti=
on.
-
----
- configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index 52ff4a04e..3fa3e8618 100755
---- a/configure
-+++ b/configure
-@@ -174,7 +174,10 @@ if test -z "$CC"; then
-   else
-     cc=3D${CROSS_PREFIX}cc
-   fi
-+else
-+  cc=3D${CC}
- fi
-+
- cflags=3D${CFLAGS-"-O3"}
- # to force the asm version use: CFLAGS=3D"-O3 -DASMV" ./configure
- case "$cc" in
diff --git a/meta/recipes-core/zlib/zlib/ldflags-tests.patch b/meta/recip=
es-core/zlib/zlib/ldflags-tests.patch
deleted file mode 100644
index 286390665f0..00000000000
--- a/meta/recipes-core/zlib/zlib/ldflags-tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Obey LDFLAGS for tests
-
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/409]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- zlib-1.2.8.orig/Makefile.in
-+++ zlib-1.2.8/Makefile.in
-@@ -26,7 +26,7 @@ CFLAGS=3D-O
-
- SFLAGS=3D-O
- LDFLAGS=3D
--TEST_LDFLAGS=3D-L. libz.a
-+TEST_LDFLAGS=3D-L. $(LDFLAGS)
- LDSHARED=3D$(CC)
- CPP=3D$(CC) -E
-
-@@ -176,22 +176,22 @@ placebo $(SHAREDLIBV): $(PIC_OBJS) libz.
-	-@rmdir objs
-
- example$(EXE): example.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(STATICLIB)
-
- minigzip$(EXE): minigzip.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(STATICLIB)
-
- examplesh$(EXE): example.o $(SHAREDLIBV)
--	$(CC) $(CFLAGS) -o $@ example.o -L. $(SHAREDLIBV)
-+	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(SHAREDLIBV)
-
- minigzipsh$(EXE): minigzip.o $(SHAREDLIBV)
--	$(CC) $(CFLAGS) -o $@ minigzip.o -L. $(SHAREDLIBV)
-+	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(SHAREDLIBV)
-
- example64$(EXE): example64.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS) $(STATICLIB)
-
- minigzip64$(EXE): minigzip64.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS) $(STATICLIB)
-
- install-libs: $(LIBS)
-	-@if [ ! -d $(DESTDIR)$(exec_prefix)  ]; then mkdir -p $(DESTDIR)$(exec=
_prefix); fi
diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.13.bb
similarity index 75%
rename from meta/recipes-core/zlib/zlib_1.2.12.bb
rename to meta/recipes-core/zlib/zlib_1.2.13.bb
index 9ec78b95be0..ec977a30354 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.13.bb
@@ -8,17 +8,12 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endli=
ne=3D23;md5=3D5377232268e952e9ef6
=20
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
-           file://cc.patch \
-           file://ldflags-tests.patch \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
-           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-func=
tio.patch \
-           file://0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-=
wit.patch \
-           file://0001-Fix-extra-field-processing-bug-that-dereferences-=
NUL.patch \
            "
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
-SRC_URI[sha256sum] =3D "91844808532e5ce316b3c010929493c0244f3d37593afd6d=
e04f71821d5136d9"
+SRC_URI[sha256sum] =3D "b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b=
3ac13740f846ab30"
=20
 # When a new release is made the previous release is moved to fossils/, =
so add this
 # to PREMIRRORS so it is also searched automatically.
--=20
2.34.1


