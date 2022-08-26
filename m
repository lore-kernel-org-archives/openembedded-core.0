Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C69ECAAD5
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 14:23:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.37733.1661523821011947071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 07:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A636DD6E;
	Fri, 26 Aug 2022 07:23:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EFA43F71A;
	Fri, 26 Aug 2022 07:23:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] libgcrypt: remove obsolete patch
Date: Fri, 26 Aug 2022 15:23:36 +0100
Message-Id: <20220826142337.42920-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826142337.42920-1-ross.burton@arm.com>
References: <20220826142337.42920-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 14:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169920

This patch was added in 2017 to fix an ICE in GCC.  GCC no longer ICEs,
so the patch isn't needed anymore.  Of note is that the random failures
in ptest are in the test being patched, so maybe this is causing subtle
breakage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...e.c-workaround-ICE-failure-on-mips-w.patch | 79 -------------------
 .../libgcrypt/libgcrypt_1.10.1.bb             |  1 -
 2 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0003-tests-bench=
-slope.c-workaround-ICE-failure-on-mips-w.patch

diff --git a/meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.=
c-workaround-ICE-failure-on-mips-w.patch b/meta/recipes-support/libgcrypt=
/files/0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch
deleted file mode 100644
index 105df2957e1..00000000000
--- a/meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.c-worka=
round-ICE-failure-on-mips-w.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 7cc702c7b5a1ccc2b0091f3effa1391b6c3030fd Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 16 Aug 2017 10:46:28 +0800
-Subject: [PATCH 3/4] tests/bench-slope.c: workaround ICE failure on mips=
 with
- '-O -g'
-
-Hit a ICE and could reduce it to the following minimal example:
-
-1. Only the size of array assigned with 2 caused the issue:
-$ cat > mipgcc-test.c << END
-
-int main (int argc, char **argv)
-{
-        char *pStrArry[ARRAY_SIZE_MAX] =3D {"hello"};
-        int i =3D 0;
-
-        while(pStrArry[i] && i<ARRAY_SIZE_MAX)
-        {
-                printf("%s\n", pStrArry[i]);
-                i++;
-        }
-
-        return 0;
-}
-
-END
-
-2. Only -O1 and -g on mips caused the issue:
-$ mips-poky-linux-gcc -O1 -g -o mipgcc-test mipgcc-test.c
-mipgcc-test.c: In function 'main':
-mipgcc-test.c:18:1: internal compiler error: in dwarf2out_var_location,
-at dwarf2out.c:20810
- }
- ^
-Please submit a full bug report,
-with preprocessed source if appropriate.
-See <http://gcc.gnu.org/bugs.html> for instructions
-
-3. The quick workround is trying to enlarge the size of array with
-larger
-than 2.
-
-4. File a bug to GNU, but it could not be reproduced on there
-environment.
-http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D60643
-
-Upstream-Status: Inappropriate [oe specific]
-
-Rebase to 1.8.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/bench-slope.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/bench-slope.c b/tests/bench-slope.c
-index 75e6e43..4e70842 100644
---- a/tests/bench-slope.c
-+++ b/tests/bench-slope.c
-@@ -1463,7 +1463,7 @@ static struct bench_ops hash_ops =3D {
- };
-=20
-=20
--static struct bench_hash_mode hash_modes[] =3D {
-+static struct bench_hash_mode hash_modes[3] =3D {
-   {"", &hash_ops},
-   {0},
- };
-@@ -1629,7 +1629,7 @@ static struct bench_ops mac_ops =3D {
- };
-=20
-=20
--static struct bench_mac_mode mac_modes[] =3D {
-+static struct bench_mac_mode mac_modes[3] =3D {
-   {"", &mac_ops},
-   {0},
- };
---=20
-1.8.3.1
-
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.1.bb
index c1f52aedff5..5047c9075f1 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN}-ptest =3D "bash make"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mip=
s-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-p=
ath.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthr=
ead.patch \
            file://run-ptest \
--=20
2.34.1


