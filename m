Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B196EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:30:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16904.1686832245751185349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70C2C1FB;
	Thu, 15 Jun 2023 05:31:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C66383F64C;
	Thu, 15 Jun 2023 05:30:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] coreutils: fix build when the host has fr_FR.
Date: Thu, 15 Jun 2023 13:30:43 +0100
Message-Id: <20230615123043.2340005-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182852

From: Ross Burton <ross.burton@arm.com>

There is a missing comma in an AC_TRY_RUN call which means it has no
fallback for cross-compilation, so if the host doesn't have a French
locale then AC_TRY_RUN fails.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../coreutils/stdlib-mb-cur-max.patch         | 33 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.3.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-m=
ax.patch

diff --git a/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patc=
h b/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
new file mode 100644
index 00000000000..732fa5b6f23
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ca6c179226864bff23f2b062518cf885bb42ce56 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Thu, 27 Apr 2023 15:26:37 +0200
+Subject: [PATCH] stdlib: Fix error when cross-compiling.
+
+Reported by Pierre Labastie <pierre.labastie@neuf.fr> in
+<https://lists.gnu.org/archive/html/bug-gnulib/2023-04/msg00220.html>.
+
+* m4/stdlib_h.m4 (gl_STDLIB_H): Provide a 4th argument to AC_RUN_IFELSE.
+---
+ ChangeLog      | 7 +++++++
+ m4/stdlib_h.m4 | 4 ++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/m4/stdlib_h.m4 b/m4/stdlib_h.m4
+index 3274ea4948..f47c1eb37b 100644
+--- a/m4/stdlib_h.m4
++++ b/m4/stdlib_h.m4
+@@ -66,7 +66,7 @@ int main ()
+   return result;
+ }]])],
+           [gl_cv_macro_MB_CUR_MAX_good=3Dyes],
+-          [gl_cv_macro_MB_CUR_MAX_good=3Dno]
++          [gl_cv_macro_MB_CUR_MAX_good=3Dno],
+           [:])
+       fi
+     ])
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.3.bb b/meta/recipes-=
core/coreutils/coreutils_9.3.bb
index 4ec953c575b..25da988f508 100644
--- a/meta/recipes-core/coreutils/coreutils_9.3.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.3.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://stdlib-mb-cur-max.patch \
            file://run-ptest \
            "
=20
--=20
2.34.1


