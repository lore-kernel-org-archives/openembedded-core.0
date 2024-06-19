Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B548CC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:38:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19684.1718800723188275497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593B81042
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 05:39:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53BB53F6A8
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 05:38:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxcrypt: correct the check for a working libucontext.h
Date: Wed, 19 Jun 2024 12:38:41 +0000
Message-Id: <20240619123841.463797-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 12:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200912

The test fails with GCC 14.1 due to an incompatible pointer assignment,
take a patch submitted upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libxcrypt/files/configure-c99.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/configure-c99.patch

diff --git a/meta/recipes-core/libxcrypt/files/configure-c99.patch b/meta=
/recipes-core/libxcrypt/files/configure-c99.patch
new file mode 100644
index 00000000000..b77ea7af077
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/configure-c99.patch
@@ -0,0 +1,39 @@
+From cfe9f4d6b0a5d10a15e10e987d528c5c513a42f1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 19 Dec 2023 11:00:11 +0100
+Subject: [PATCH] configure: Only text the makecontext signature we need
+
+The test/explicit-bzero.c test uses a start routine without any
+arguments.  There is no need for the multi-argument version.
+
+This avoids a build failure with glibc and future compilers.
+The GNU C library declares the makecontext callback of
+type void (*) (void), so no cast is needed.  On other systems,
+the type may be the (currently distinct) type void (*) (),
+but given that this only affects the ability to execute a test,
+no further machinery is added here to detect that different type.
+
+Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/1=
78/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 016997c..4b8afd8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -303,13 +303,11 @@ AS_IF([test $ac_cv_header_ucontext_h =3D yes],
+ #include <ucontext.h>
+ static int x;
+ static void fn1(void) {}
+-static void fn2(int a, int b) { x =3D a - b; }
+ ]], [[
+   ucontext_t uc1, uc2;
+   if (getcontext(&uc1)) return 1;
+   if (setcontext(&uc1)) return 1;
+   makecontext(&uc1, fn1, 0);
+-  makecontext(&uc2, fn2, 2, 1, 1);
+   if (swapcontext(&uc1, &uc2)) return 1;
+   return x;
+ ]])],
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-cor=
e/libxcrypt/libxcrypt.inc
index ba93d91aef1..ee6875aa05d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -13,7 +13,8 @@ SRC_URI =3D "git://github.com/besser82/libxcrypt.git;br=
anch=3D${SRCBRANCH};protocol=3D
 SRCREV =3D "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?=3D "master"
=20
-SRC_URI +=3D "file://fix_cflags_handling.patch"
+SRC_URI +=3D "file://fix_cflags_handling.patch \
+            file://configure-c99.patch"
=20
 PROVIDES =3D "virtual/crypt"
=20
--=20
2.34.1


