Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AD1C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 17:40:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.36128.1643650816766527643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 09:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD7BED1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 09:40:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4C23F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 09:40:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] strace: remove obsolete musl-on-MIPS patch
Date: Mon, 31 Jan 2022 17:40:12 +0000
Message-Id: <20220131174013.817060-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 17:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161130

This patch was added as musl doesn't define SIGEMT on MIPS, but this was
a mistake in musl and has been  fixed in cabc369, available in musl
1.2.1 onwards (August 2020).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../strace/strace/mips-SIGEMT.patch           | 33 -------------------
 meta/recipes-devtools/strace/strace_5.16.bb   |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/mips-SIGEMT.patch

diff --git a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch b/meta=
/recipes-devtools/strace/strace/mips-SIGEMT.patch
deleted file mode 100644
index e86da9707c9..00000000000
--- a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 794648d84672bbda30a920a05540b56cd155ed9d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2016 23:47:57 -0700
-Subject: [PATCH] strace: Fix build with mips/mips64 on musl
-
-SIGEMT is not defined everywhere e.g musl does
-not define it. Therefore check it being defined
-before using it.
-
-Fixes errors e.g.
-../../strace-4.13/tests/signal2name.c:45:7: error: 'SIGEMT' undeclared (=
first use in this function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- tests/signal2name.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/signal2name.c b/tests/signal2name.c
-index 1d8e7c5..6722aa1 100644
---- a/tests/signal2name.c
-+++ b/tests/signal2name.c
-@@ -49,7 +49,9 @@ signal2name(int sig)
- 	CASE(SIGEMT);
- 	CASE(SIGLOST);
- #elif defined MIPS
-+#ifdef SIGEMT
- 	CASE(SIGEMT);
-+#endif
- 	CASE(SIGIOT);
- 	CASE(SIGPWR);
- #else
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-d=
evtools/strace/strace_5.16.bb
index 1874ef1017c..1574b8e7773 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.t=
ar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-           file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
--=20
2.25.1


