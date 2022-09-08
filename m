Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EFCC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 10:45:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3806.1662633935230994825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 03:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 743C014BF;
	Thu,  8 Sep 2022 03:45:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEC273F71A;
	Thu,  8 Sep 2022 03:45:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] gcc: remove obsolete poisoned calloc workaround
Date: Thu,  8 Sep 2022 11:45:30 +0100
Message-Id: <20220908104531.281820-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 10:45:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170455

This was fixed upstream in de6f402a, as part of 12.2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-12.2.inc        |  1 -
 ...ched.h-include-ahead-of-user-headers.patch | 56 -------------------
 2 files changed, 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-inclu=
de-ahead-of-user-headers.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.2.inc
index 7cc34b26215..02dc59db631 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
@@ -61,7 +61,6 @@ SRC_URI =3D "${BASEURI} \
            file://0022-mingw32-Enable-operation_not_supported.patch \
            file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0024-Fix-install-path-of-linux64.h.patch \
-           file://0025-Move-sched.h-include-ahead-of-user-headers.patch =
\
            file://0026-rust-recursion-limit.patch \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahea=
d-of-user-headers.patch b/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h=
-include-ahead-of-user-headers.patch
deleted file mode 100644
index d4aeacfed51..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahead-of-us=
er-headers.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7422adfb471f4b4f2ec870124064632d55f72e50 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 11 Apr 2022 15:46:18 -0700
-Subject: [PATCH] Move sched.h include ahead of user headers
-
-Fix attempt to use poisoned calloc error, this moves the sched.h before
-using system.h from gcc headers which includes #pragma GCC poison calloc
-
-Fixes
-In file included from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/pthread.h:30,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/aarch64-yoe-l=
inux-musl/bits/gthr-default.h:35,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/aarch64-yoe-l=
inux-musl/bits/gthr.h:148,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/ext/atomicity=
.h:35,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/bits/shared_p=
tr_base.h:61,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/bits/shared_p=
tr.h:53,
-                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-lin=
ux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/memory:77,
-                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc=
-12-20220410/libcc1/deleter.hh:23,
-                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc=
-12-20220410/libcc1/rpc.hh:25,
-                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc=
-12-20220410/libcc1/libcc1plugin.cc:67:
-/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/=
recipe-sysroot/usr/include/sched.h:84:7: error: attempt to use poisoned "=
calloc"
-   84 | void *calloc(size_t, size_t);
-      |       ^
-/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/=
recipe-sysroot/usr/include/sched.h:124:36: error: attempt to use poisoned=
 "calloc"
-  124 | #define CPU_ALLOC(n) ((cpu_set_t *)calloc(1,CPU_ALLOC_SIZE(n)))
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcc1/libcc1plugin.cc | 1 +
- libcc1/libcp1plugin.cc | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libcc1/libcc1plugin.cc b/libcc1/libcc1plugin.cc
-index 12ab5a57c8d..fff9bfab18b 100644
---- a/libcc1/libcc1plugin.cc
-+++ b/libcc1/libcc1plugin.cc
-@@ -17,6 +17,7 @@
-    along with GCC; see the file COPYING3.  If not see
-    <http://www.gnu.org/licenses/>.  */
-=20
-+#include <sched.h>
- #include <cc1plugin-config.h>
-=20
- #undef PACKAGE_NAME
-diff --git a/libcc1/libcp1plugin.cc b/libcc1/libcp1plugin.cc
-index 83dab7f58b1..0b83ce7a09d 100644
---- a/libcc1/libcp1plugin.cc
-+++ b/libcc1/libcp1plugin.cc
-@@ -18,6 +18,7 @@
-    along with GCC; see the file COPYING3.  If not see
-    <http://www.gnu.org/licenses/>.  */
-=20
-+#include <sched.h>
- #include <cc1plugin-config.h>
-=20
- #undef PACKAGE_NAME
--=20
2.34.1


