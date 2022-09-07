Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9396C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 13:02:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7239.1662555731583585365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 06:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF011042;
	Wed,  7 Sep 2022 06:02:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 742583F7B4;
	Wed,  7 Sep 2022 06:02:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] meta-selftest/poison: improve sysroot poisoning test case
Date: Wed,  7 Sep 2022 14:02:05 +0100
Message-Id: <20220907130207.2258074-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 13:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170389

It was discovered by Martin Jansa that the sysroot poisoning errors are
not functioning as they should. Due to either a bug from day 1 or a
bad rebase, -Werror=3Dpoison-system-directories is only passed when GCC
is invoking _just_ the preprocessor, not the compiler.

Demonstrate this by expanding the test case to exercise not just $CPP,
but also $CC for both C and C++ languages. This improved test case now
fails.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-test/poison/poison.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/poison/poison.bb b/meta-selftest/=
recipes-test/poison/poison.bb
index 7ace901cc3a..e9eee0cdbab 100644
--- a/meta-selftest/recipes-test/poison/poison.bb
+++ b/meta-selftest/recipes-test/poison/poison.bb
@@ -9,8 +9,12 @@ inherit nopackages
 # will result in compiler errors.  This recipe should will fail to build=
 and
 # oe-selftest has a test that verifies that.
 do_compile() {
-    touch empty.c
-    ${CPP} ${CFLAGS} -I/usr/include empty.c
+    bbnote Testing preprocessor
+    echo "int main(int argc, char** argv) {}" | ${CPP} -I/usr/include -
+    bbnote Testing C compiler
+    echo "int main(int argc, char** argv) {}" | ${CC} -x c -I/usr/includ=
e -
+    bbnote Testing C++ compiler
+    echo "int main(int argc, char** argv) {}" | ${CC} -x c++ -I/usr/incl=
ude -
 }
=20
 EXCLUDE_FROM_WORLD =3D "1"
--=20
2.34.1


