Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A3DC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 14:36:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22745.1718807780722331257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 07:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5391042
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 07:36:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C66563F6A8
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 07:36:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bash: fix configure checks that fail with GCC 14.1
Date: Wed, 19 Jun 2024 14:36:18 +0000
Message-Id: <20240619143618.1820845-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 14:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200914

These configure checks cause compiler errors with GCC 14.1, so they alway=
s
fail.  Backport fixes from upstream to solve this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../bash/bash/0001-fix-c99.patch              | 41 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-fix-c99.patch

diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/re=
cipes-extended/bash/bash/0001-fix-c99.patch
new file mode 100644
index 00000000000..aa810f7d4e6
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -0,0 +1,41 @@
+From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 19 Jun 2024 12:57:39 +0000
+Subject: [PATCH] Fix C99 problems
+
+Backport some fixes from upstream to fix configure checks that fail with=
 GCC 14.1.
+
+Upstream-Status: Backport [devel branch]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ aclocal.m4   | 3 +++
+ configure.ac | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index cc97bd4..7423b99 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -238,6 +238,9 @@ AC_CACHE_VAL(bash_cv_dup2_broken,
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
++#ifdef HAVE_UNISTD_H
++# include <unistd.h>
++#endif /* HAVE_UNISTD_H */
+ int
+ main()
+ {
+diff --git a/configure.ac b/configure.ac
+index a3b5bd7..2a38c6b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
+ 	[AC_COMPILE_IFELSE(
+ 		[AC_LANG_PROGRAM(
+ 		[[#include <stdlib.h>]],
+-		[[long double r; char *foo, bar; r =3D strtold(foo, &bar);]]
++		[[long double r; char *foo, *bar; r =3D strtold(foo, &bar);]]
+ 	)],
+ 	[bash_cv_strtold_broken=3Dno],[bash_cv_strtold_broken=3Dyes])
+         ]
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-ext=
ended/bash/bash_5.2.21.bb
index 532adf4c1a0..ccfe5c47a7e 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-chi=
ld-.patch \
            file://fix-filesubst-errexit.patch \
+           file://0001-fix-c99.patch \
            "
=20
 SRC_URI[tarball.sha256sum] =3D "c8e31bdc59b69aaffc5b36509905ba3e5cbb1274=
7091d27b4b977f078560d5b8"
--=20
2.34.1


