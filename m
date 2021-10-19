Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023FEC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 11:35:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8327.1634643333365438017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3500ED6E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D385F3F70D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gawk: replace AR patch with upstreamed patch
Date: Tue, 19 Oct 2021 12:35:28 +0100
Message-Id: <20211019113529.1612190-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 11:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157110

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Use-cross-AR-during-compile.patch    | 47 +++++++++----------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-com=
pile.patch b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-com=
pile.patch
index ca0d668ce9..be6dbe1e57 100644
--- a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.pa=
tch
+++ b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.pa=
tch
@@ -1,35 +1,30 @@
-From 207b94e37c84007b294e57878c913271aad544ef Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 11 Nov 2020 23:13:23 -0800
-Subject: [PATCH] Use cross AR during compile
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-If AR is specifcied then it should be used instead of defaulting to 'ar'
-from host
+From 47dce6a7002a8d7b818c19d574d81327b769871b Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 5 Jun 2020 13:14:54 +0300
+Subject: Allow for cross-compile version of ar.
=20
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+(limited to 'configure.ac')
=20
 diff --git a/configure.ac b/configure.ac
-index 31364ab..4804f7b 100644
+index 31364ab8..8c256f21 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -92,6 +92,13 @@ GAWK_CANONICAL_HOST
- AC_USE_SYSTEM_EXTENSIONS
+@@ -105,6 +105,9 @@ AC_EXEEXT
+ AC_PROG_INSTALL
+ AC_PROG_MAKE_SET
 =20
- dnl checks for programs
-+m4_ifndef([AC_PROG_AR],[dnl
-+  AN_MAKEVAR([AR], [AC_PROG_AR])
-+  AN_PROGRAM([ar], [AC_PROG_AR])
-+  AC_DEFUN([AC_PROG_AR],
-+  [AC_CHECK_TOOL(AR, ar, :)])
-+])
-+AC_PROG_AR
- AC_PROG_EGREP
- AC_PROG_YACC
- AC_PROG_LN_S
++# support/ builds libsupport.a, allow for cross version of ar
++AM_PROG_AR
++
+ # This is mainly for my use during testing and development.
+ # Yes, it's a bit of a hack.
+ AC_MSG_CHECKING([for special development options])
 --=20
-2.29.2
-
+cgit v1.2.1
--=20
2.25.1


