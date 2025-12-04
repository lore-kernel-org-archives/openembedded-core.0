Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA8AD216AF
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47921.1764865108817557325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D001339
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B5093F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] gcc: fix bad-mapper-3.C test failures on some hosts
Date: Thu,  4 Dec 2025 16:18:20 +0000
Message-ID: <20251204161820.1339988-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204161820.1339988-1-ross.burton@arm.com>
References: <20251204161820.1339988-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227304

This test tries to open an IPv6 socket to 'localhost', but some distros
(such as ubuntu 24.04) only have an IPv4 address for localhost and use
ip6-localhost for ::1.  This means the lookups fail in a way that the
test was not expecting, and the test fails.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |  3 +-
 ...-mapper-localhost-might-not-be-known.patch | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-mapper-localhost-m=
ight-not-be-known.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.2.inc
index d178b254878..3ed4600361b 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -72,7 +72,8 @@ SRC_URI =3D "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-	   file://0026-fix-pr90579-testcases.patch \
+           file://0026-fix-pr90579-testcases.patch \
+           file://0001-mapper-localhost-might-not-be-known.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-mapper-localhost-might-no=
t-be-known.patch b/meta/recipes-devtools/gcc/gcc/0001-mapper-localhost-mi=
ght-not-be-known.patch
new file mode 100644
index 00000000000..c7459517935
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-mapper-localhost-might-not-be-kn=
own.patch
@@ -0,0 +1,38 @@
+From ce2d518fd685adf6e69a045ac37fa03d3b54ae53 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 3 Dec 2025 15:05:12 +0000
+Subject: [PATCH] gcc/testsuite/g++/bad-mapper-3.C: localhost might not b=
e
+ known
+
+The module-mapper uses Cody::OpenInet6 to open the connection to the
+host. However, some distributions (such as Ubuntu 24.04) only have a v4
+address for localhost:
+
+  $ grep localhost /etc/hosts
+  127.0.0.1  localhost
+  ::1        ip6-localhost ip6-loopback
+
+On these systems this test fails with "Name or service not known", so
+add that to the list of allowed error messages.
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/20=
25-December/702846.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gcc/testsuite/g++.dg/modules/bad-mapper-3.C | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/testsuite/g++.dg/modules/bad-mapper-3.C b/gcc/testsuite=
/g++.dg/modules/bad-mapper-3.C
+index 2a57956afc87..ca7eec2e1df5 100644
+--- a/gcc/testsuite/g++.dg/modules/bad-mapper-3.C
++++ b/gcc/testsuite/g++.dg/modules/bad-mapper-3.C
+@@ -1,6 +1,6 @@
+ //  { dg-additional-options "-fmodules-ts -fmodule-mapper=3Dlocalhost:1=
72477262" }
+ import unique3.bob;
+-// { dg-error {failed (socket|connecting|disabled) mapper 'localhost:17=
2477262'} "" { target *-*-* } 0 }
++// { dg-error {failed (socket|connecting|disabled|Name or service not k=
nown) mapper 'localhost:172477262'} "" { target *-*-* } 0 }
+ // { dg-prune-output "fatal error:" }
+ // { dg-prune-output "failed to read" }
+ // { dg-prune-output "compilation terminated" }
+--=20
+2.43.0
+
--=20
2.43.0


