Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B657C27C5F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 15:37:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22699.1718033818942283909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 08:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFBB612FC
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 08:37:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28BE93F64C
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 08:36:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH scarthgap v2] procps: fix build with new glibc but old kernel headers
Date: Mon, 10 Jun 2024 15:36:53 +0000
Message-Id: <20240610153653.2972113-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 15:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200477

If you're building procps with a newer glibc (with pidfd_open()) but
older kernel headers (say 4.x, before __NR_pidfd_open) then procps will
fail to build because of a typo in configure.ac.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../procps/procps/pidfd.patch                 | 42 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch

diff --git a/meta/recipes-extended/procps/procps/pidfd.patch b/meta/recip=
es-extended/procps/procps/pidfd.patch
new file mode 100644
index 00000000000..23d1a3cd3ea
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/pidfd.patch
@@ -0,0 +1,42 @@
+From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 25 Apr 2024 13:33:15 +0000
+Subject: [PATCH] Fix pidfd_open detection
+
+This check for pidfd_open uses AC_CHECK_FUNC which just runs the specifi=
ed code, but=20
+src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by AC_CHEC=
K_FUNCS.
+
+Also pidfd_open is defined in sys/pidfd.h so that needs including.
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_=
requests/229]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+
+diff --git a/configure.ac b/configure.ac
+index fec27e3f..024731c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+=20
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=3Dyes], [
++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=3Dyes], [
+   AC_MSG_CHECKING([for __NR_pidfd_open])
+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+ #include <sys/syscall.h>
+diff --git a/src/pgrep.c b/src/pgrep.c
+index d8e57dff..c5211aec 100644
+--- a/src/pgrep.c
++++ b/src/pgrep.c
+@@ -44,7 +44,9 @@
+
+ #ifdef ENABLE_PIDWAIT
+ #include <sys/epoll.h>
+-#ifndef HAVE_PIDFD_OPEN
++#ifdef HAVE_PIDFD_OPEN
++#include <sys/pidfd.h>
++#else
+ #include <sys/syscall.h>
+ #endif /* !HAVE_PIDFD_OPEN */
+ #endif
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-=
extended/procps/procps_4.0.4.bb
index 800384f22f7..ec8c4b0261b 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
=20
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;bran=
ch=3Dmaster \
            file://sysctl.conf \
+           file://pidfd.patch \
            "
 SRCREV =3D "4ddcef2fd843170c8e2d59a83042978f41037a2b"
=20
--=20
2.34.1


