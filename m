Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94437D216A9
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47917.1764865106235107823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70A6C339
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:18 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DDBD3F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] binutils-testsuite: run tests in the testsuite directory
Date: Thu,  4 Dec 2025 16:18:16 +0000
Message-ID: <20251204161820.1339988-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227300

The tests expect to be ran inside the testsuite directory, which means
some tests fail because files cannot be found.

This fixes the tests:

    ptestresult.binutils-gas.DWARF5 .loc 0
    ptestresult.binutils-gas.DWARF5 dir[0]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb b/=
meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
index e5e159bc718..fe6b8c6f404 100644
--- a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
@@ -61,7 +61,7 @@ python check_prepare() {
         return "\n".join(content)
=20
     for i in ["binutils", "gas", "ld"]:
-        builddir =3D os.path.join(d.getVar("B"), i)
+        builddir =3D os.path.join(d.getVar("B"), i, "testsuite")
         if not os.path.isdir(builddir):
             os.makedirs(builddir)
         with open(os.path.join(builddir, "site.exp"), "w") as f:
@@ -70,13 +70,13 @@ python check_prepare() {
=20
 CHECK_TARGETS ??=3D "binutils gas ld"
=20
-do_check[dirs] =3D "${B} ${B}/binutils ${B}/gas ${B}/ld"
+do_check[dirs] =3D "${B} ${B}/binutils/testsuite ${B}/gas/testsuite ${B}=
/ld/testsuite"
 do_check[prefuncs] +=3D "check_prepare"
 do_check[nostamp] =3D "1"
 do_check() {
     export LC_ALL=3DC
     for i in ${CHECK_TARGETS}; do
-        (cd ${B}/$i; runtest \
+        (cd ${B}/$i/testsuite; runtest \
             --tool $i \
             --srcdir ${S}/$i/testsuite \
             --ignore 'plugin.exp' \
--=20
2.43.0


