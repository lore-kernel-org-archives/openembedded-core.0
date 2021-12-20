Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803F0C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 18:26:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.602.1640024760890707274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2924B6D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:25:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D643F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:25:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gawk: remove load-sensitive tests
Date: Mon, 20 Dec 2021 18:25:57 +0000
Message-Id: <20211220182557.885070-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 18:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159895

The time and timeout tests are sensitive to system load, and as we run
these on build machines they fail randomly.

[ YOCTO #14371 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gawk/gawk/test-time.patch                 | 22 -------------------
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  6 ++++-
 2 files changed, 5 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/test-time.patch

diff --git a/meta/recipes-extended/gawk/gawk/test-time.patch b/meta/recip=
es-extended/gawk/gawk/test-time.patch
deleted file mode 100644
index 05a68c5faf..0000000000
--- a/meta/recipes-extended/gawk/gawk/test-time.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The test time.awk does a sleep() and checks that the real sleep duration=
 is
-close to the expected duration.
-
-As currently our tests can run on a heavily loaded system, increase the =
range of
-a passing duration.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/test/time.awk b/test/time.awk
-index 517377e2..ca81d92d 100644
---- a/test/time.awk
-+++ b/test/time.awk
-@@ -16,7 +16,7 @@ BEGIN {
-    printf "sleep(%s) =3D %s\n",delta,sleep(delta)
-    t1 =3D timecheck()
-    slept =3D t1-t0
--   if ((slept < 0.9*delta) || (slept > 1.3*delta))
-+   if ((slept < 0.5*delta) || (slept > 2*delta))
-       printf "Warning: tried to sleep %.2f secs, but slept for %.2f sec=
s\n",
- 	     delta,slept
- }
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-exte=
nded/gawk/gawk_5.1.1.bb
index 215ac8c860..e3d85c8d53 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -17,7 +17,6 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mp=
fr"
=20
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-           file://test-time.patch \
            "
=20
 SRC_URI[sha256sum] =3D "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b7449=
01da15fb4f06bffd"
@@ -48,6 +47,11 @@ do_install_ptest() {
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/tes=
t/*.awk
=20
         sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests
+
+	# These tests require an unloaded host as otherwise timing sensitive te=
sts can fail
+	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14371
+	rm -f ${D}${PTEST_PATH}/test/time.*
+	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
=20
 RDEPENDS:${PN}-ptest +=3D "make"
--=20
2.25.1


