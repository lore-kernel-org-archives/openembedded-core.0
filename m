Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7109AC7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 11:53:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32847.1679918023228732027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 04:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0142F4B3;
	Mon, 27 Mar 2023 04:54:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 593E43F663;
	Mon, 27 Mar 2023 04:53:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libunwind: fix compile failures on 32-bit arm with Clang 16
Date: Mon, 27 Mar 2023 12:53:38 +0100
Message-Id: <20230327115338.3487878-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179157

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-Gtrace-remove-unguarded-print-calls.patch | 52 +++++++++++++++++++
 .../libunwind/libunwind_1.6.2.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-src-Gtr=
ace-remove-unguarded-print-calls.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-rem=
ove-unguarded-print-calls.patch b/meta/recipes-support/libunwind/libunwin=
d/0001-src-Gtrace-remove-unguarded-print-calls.patch
new file mode 100644
index 00000000000..fdadcd3b25a
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-ung=
uarded-print-calls.patch
@@ -0,0 +1,52 @@
+From 87d24ee47fd0e0461fca32d17564f21d76cbcb92 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 24 Mar 2023 16:18:44 +0000
+Subject: [PATCH] src/Gtrace: remove unguarded print() calls
+
+There is a use of printf() without #include stdio.h in src/arm/Gtrace.c,
+which results in a compiler error if clang 16 is used:
+
+src/arm/Gtrace.c:529:7: error: call to undeclared library function
+'printf' with type 'int (const char *, ...)'; ISO C99 and later do not
+support implicit function declarations [-Wimplicit-function-declaration]
+
+Replace the printf("XXX") with a Dprintf, so it doesn't pull stdio in
+unless in a debug build, and reword the message to be clearer.
+
+Also there is another printf("XXX") inside a FreeBSD-specific block in
+the UNW_ARM_FRAME_SIGRETURN case, replace this with a #error as the code
+needs to be implemented.
+
+Fixes #482.
+
+Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
483]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/arm/Gtrace.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/arm/Gtrace.c b/src/arm/Gtrace.c
+index 51fc281d..9e0f25af 100644
+--- a/src/arm/Gtrace.c
++++ b/src/arm/Gtrace.c
+@@ -514,7 +514,7 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int=
 *size)
+       if (likely(ret >=3D 0))
+         ACCESS_MEM_FAST(ret, c->validate, d, cfa + LINUX_SC_LR_OFF, lr)=
;
+ #elif defined(__FreeBSD__)
+-      printf("XXX\n");
++      #error implement UNW_ARM_FRAME_SIGRETURN on FreeBSD
+ #endif
+=20
+       /* Resume stack at signal restoration point. The stack is not
+@@ -526,7 +526,7 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int=
 *size)
+       break;
+=20
+     case UNW_ARM_FRAME_SYSCALL:
+-      printf("XXX1\n");
++      Dprintf ("%s: implement me\n", __FUNCTION__);
+       break;
+=20
+     default:
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
index 716be9a452f..d67862608c1 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -5,6 +5,7 @@ SRC_URI =3D "http://download.savannah.nongnu.org/releases=
/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-=
and.patch \
            file://0006-Fix-for-X32.patch \
+           file://0001-src-Gtrace-remove-unguarded-print-calls.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl-header-conflict.patch"
=20
--=20
2.34.1


