Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9770.1630510325343322906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 08:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D76A71FB
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 08:32:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8314F3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 08:32:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mesa: fix build on Arm V5 with soft float
Date: Wed,  1 Sep 2021 16:32:01 +0100
Message-Id: <20210901153201.5399-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since 80923e8d ("util/format: Add some NEON intrinsics-based
u_format_unpack.") upstream the build fails on Arm platforms which use
the soft-float ABI, such as qemuarmv5:

 arm_neon.h:31:2: error: #error "NEON intrinsics not available with the
 soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"

Take a patch from upstream to check the ABI being used before trying to
use NEON instructions.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../mesa/files/without-neon.patch             | 53 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/without-neon.patch

diff --git a/meta/recipes-graphics/mesa/files/without-neon.patch b/meta/r=
ecipes-graphics/mesa/files/without-neon.patch
new file mode 100644
index 00000000000..56e4aa77695
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/without-neon.patch
@@ -0,0 +1,53 @@
+Since 80923e8d ("util/format: Add some NEON intrinsics-based u_format_un=
pack.")
+upstream the build fails on Arm platforms which use the soft-float ABI, =
such as
+qemuarmv5:
+
+ arm_neon.h:31:2: error: #error "NEON intrinsics not available with the
+ soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
+
+Take a patch from upstream to check the ABI being used before trying to
+use NEON instructions.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/12569]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5dcce985a6dd3b7856d65e21db753e2c7a0f5dd5 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Thu, 26 Aug 2021 22:35:49 +0300
+Subject: [PATCH] util/format: NEON is not available with the soft-float =
ABI
+
+Fixes: 80923e8d58cc ("util/format: Add some NEON intrinsics-based u_form=
at_unpack.")
+---
+ src/util/format/u_format.c             | 2 +-
+ src/util/format/u_format_unpack_neon.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
+index c49b3788c82..31f1f240efc 100644
+--- a/src/util/format/u_format.c
++++ b/src/util/format/u_format.c
+@@ -1138,7 +1138,7 @@ static void
+ util_format_unpack_table_init(void)
+ {
+    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_FOR=
MAT_COUNT; format++) {
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined =
NO_FORMAT_ASM
++#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
+       const struct util_format_unpack_description *unpack =3D util_form=
at_unpack_description_neon(format);
+       if (unpack) {
+          util_format_unpack_table[format] =3D unpack;
+diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_=
format_unpack_neon.c
+index 7456d7aaa88..a4a5cb1f723 100644
+--- a/src/util/format/u_format_unpack_neon.c
++++ b/src/util/format/u_format_unpack_neon.c
+@@ -23,7 +23,7 @@
+=20
+ #include <u_format.h>
+=20
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined =
NO_FORMAT_ASM
++#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
+=20
+ /* armhf builds default to vfp, not neon, and refuses to compile neon i=
ntrinsics
+  * unless you tell it "no really".
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 2fb823dfb8d..35c170cfd62 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
+           file://without-neon.patch \
            "
=20
 SRC_URI[sha256sum] =3D "2c65e6710b419b67456a48beefd0be827b32db416772e0e3=
63d5f7d54dc01787"
--=20
2.25.1

