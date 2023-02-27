Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC0CC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 13:13:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89601.1677503588431205702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 05:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 281A9FEC;
	Mon, 27 Feb 2023 05:13:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAD23F67D;
	Mon, 27 Feb 2023 05:13:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] quilt: run tests as ptest user, and let that user write into the tests
Date: Mon, 27 Feb 2023 13:13:03 +0000
Message-Id: <20230227131303.3104010-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227131303.3104010-1-ross.burton@arm.com>
References: <20230227131303.3104010-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 13:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177793

The tests need to run as a non-root user, but that user also needs to be
able to write into the tests directory to create the work directories.

Use the new ptest user that ptest-runner creates to avoid having to add
a new user, and ensure that the test/ directory is owned by the ptest
group and that group has write access.

This solves the ptest regression where since oe-core 9a287b4 no quilt
tests were actually running.

A better solution would be to allow the tests to create a work directory
in another directory, but that would need work upstream which can happen
later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/quilt/quilt.inc       | 13 ++++++++++++-
 meta/recipes-devtools/quilt/quilt/run-ptest |  6 +-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index f7ff958103e..01fc22e9963 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -61,6 +61,9 @@ do_install:append:class-native () {
     touch ${D}${sysconfdir}/quiltrc
 }
=20
+# The tests need to run as a non-root user, so pull in the ptest user
+DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', ' ptest-runner', '', d)}"
+
 do_install_ptest() {
 	install ${WORKDIR}/test.sh ${D}${PTEST_PATH}
     mkdir ${D}${PTEST_PATH}/test
@@ -69,6 +72,14 @@ do_install_ptest() {
     rm -f ${D}${PTEST_PATH}/test/mail.test ${D}${PTEST_PATH}/test/patch-=
wrapper.test
 }
=20
+# ptest.bbclass currently chowns the ptest directory explicitly, so we n=
eed to
+# change permission after that has happened so the ptest user can write =
a
+# temporary directory.
+do_install_ptest_base:append() {
+    chgrp ptest ${D}${PTEST_PATH}/test
+    chmod g+w ${D}${PTEST_PATH}/test
+}
+
 PACKAGES +=3D "guards guards-doc"
=20
 FILES:${PN} =3D "${sysconfdir} ${datadir}/quilt \
@@ -84,5 +95,5 @@ RDEPENDS:${PN}-ptest +=3D "file sed gawk diffutils find=
utils ed perl \
                          perl-module-filehandle perl-module-getopt-std \
                          perl-module-posix perl-module-file-temp \
                          perl-module-text-parsewords perl-module-overloa=
ding \
-                         bash util-linux-getopt \
+                         bash util-linux-getopt ptest-runner \
                         "
diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-d=
evtools/quilt/quilt/run-ptest
index 322508cbe25..f35a756d6b4 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -1,7 +1,3 @@
 #!/bin/sh
=20
-/usr/sbin/adduser --disabled-password --gecos "" quilttest
-
-su -c ./test.sh quilttest
-
-/usr/sbin/deluser quilttest
+su -c ./test.sh ptest
--=20
2.34.1


