Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CA0C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22777.1716305553207396072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0901DA7
	for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:32:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BD283F641
	for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:32:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gawk: fix readline detection
Date: Tue, 21 May 2024 15:32:31 +0000
Message-Id: <20240521153231.608294-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199652

The code fragment used to detect readline in cross builds doesn't compile
cleanly with GCC 14.1, so readline is never enabled.

Add missing includes so the test works, and readline can be enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...001-m4-readline-add-missing-includes.patch | 38 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-=
missing-includes.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing=
-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-mi=
ssing-includes.patch
new file mode 100644
index 00000000000..5be2fd97ee0
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includ=
es.patch
@@ -0,0 +1,38 @@
+From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 21 May 2024 15:10:11 +0000
+Subject: [PATCH] m4/readline: add missing includes
+
+The cross-specific code fragment only includes stdio.h, where the native
+fragment also includes fcntl.h and unistd.h.  This is important because
+GCC 14.1 has made the implicit definitions an error:
+
+conftest.c: In function 'main':
+conftest.c:144:9: error: implicit declaration of function 'close'; did y=
ou mean 'pclose'? [-Wimplicit-function-declaration]
+conftest.c:146:14: error: implicit declaration of function 'open'; did y=
ou mean 'popen'? [-Wimplicit-function-declaration]
+
+Add the missing includes so that the check doesn't always fail due to
+these errors.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/=
2024-05/msg00000.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ m4/readline.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/readline.m4 b/m4/readline.m4
+index 38f96326..efd52d4e 100644
+--- a/m4/readline.m4
++++ b/m4/readline.m4
+@@ -66,6 +66,8 @@ dnl action if false:
+ dnl action if cross compiling:
+ 		[AC_LINK_IFELSE(
+ 			[AC_LANG_PROGRAM([[#include <stdio.h>
++#include <fcntl.h>
++#include <unistd.h>
+ #include <readline/readline.h>
+ #include <readline/history.h>]],		dnl includes
+ 			dnl function body
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.0.bb
index d7a0fc616d3..e94cf19db48 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -16,6 +16,7 @@ PACKAGECONFIG[readline] =3D "--with-readline,--without-=
readline,readline"
 PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mpfr"
=20
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+           file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            "
=20
--=20
2.34.1


