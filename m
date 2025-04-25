Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC41C369D5
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:43:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4646.1745581406950031809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D3AD106F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F7B63F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] libunwind: check if libatomic is needed at configure time
Date: Fri, 25 Apr 2025 12:43:20 +0100
Message-ID: <20250425114322.718562-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425114322.718562-1-ross.burton@arm.com>
References: <20250425114322.718562-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215461

Backport a patch submitted upstream to conditionally link explicitly to
libatomic, so we don't need to that in the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libunwind/libunwind/libatomic.patch       | 38 +++++++++++++++++++
 .../libunwind/libunwind_1.8.1.bb              |  2 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind/libatomic.pa=
tch

diff --git a/meta/recipes-support/libunwind/libunwind/libatomic.patch b/m=
eta/recipes-support/libunwind/libunwind/libatomic.patch
new file mode 100644
index 00000000000..f39e92f2eef
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/libatomic.patch
@@ -0,0 +1,38 @@
+From d6a0d8ce07c761e51b9dc7c5d16a9b06c3e93560 Mon Sep 17 00:00:00 2001
+From: Stephen Webb <swebb@blackberry.com>
+Date: Mon, 18 Mar 2024 10:22:26 -0400
+Subject: [PATCH] configure.ac: detect if -latomic is required
+
+Some OS runtimes require libatomic be linked in separately to get
+standard atomic operations to work. Try to detect that at configure
+time.
+
+Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
732/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 758a27d19..d0ef5f3d9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -94,6 +94,18 @@ dnl Checks for library functions.
+ AC_CHECK_FUNCS(dl_iterate_phdr dl_phdr_removals_counter dlmodinfo getun=
wind \
+ 		ttrace mincore pipe2 sigaltstack execvpe)
+=20
++AC_MSG_CHECKING([if -latomic is required])
++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
++                        #include <stdatomic.h>
++                        atomic_bool ab_ =3D 0; atomic_llong al_ =3D 0;
++                    ]],[[
++                        atomic_load(&ab_); atomic_load(&al_);
++                    ]])],
++                 [use_libatomic=3Dno],
++                 [use_libatomic=3Dyes])
++AC_MSG_RESULT([$use_libatomic])
++AS_IF([test "$use_libatomic" =3D "yes"],[LIBS=3D"-latomic $LIBS"])
++
+ AC_MSG_CHECKING([if building with AltiVec])
+ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #ifndef __ALTIVEC__
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
index 1885da4d09f..38022569df2 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://github.com/libunwind/libunwind/rel=
eases/download/v${PV}/${BP}
            file://0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.pat=
ch \
            file://0004-Rework-inline-aarch64-as-for-setcontext.patch \
            file://0005-Handle-musl-on-PPC32.patch \
+           file://libatomic.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006=
c33e6df79e6a6157"
@@ -32,7 +33,6 @@ ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
 LDFLAGS +=3D "-Wl,-z,relro,-z,now"
-LDFLAGS:append:powerpc:libc-musl =3D " -latomic"
=20
 SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
 CACHED_CONFIGUREVARS:append:libc-musl =3D " LDFLAGS=3D'${LDFLAGS} -lucon=
text'"
--=20
2.43.0


