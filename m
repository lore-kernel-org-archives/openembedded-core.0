Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEA9C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:07:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89958.1783073236807211727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TgjoMTyd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A31A22D7
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CBCD3F905
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783073236; bh=VJcHMQ2VrkFwJnvLUwaWwioxVDLCSDo7JF1XmCsHm9U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TgjoMTyd++usz07y6/a5JR7gGie4SToOiKLlAs5l1F4SBhFHf7IajR9FYd/9Uld99
	 WSW9eAvAmEJ/9tYwkeBs/P665BZmSWxACv160Len2mmcbryJYYTVpPhjKvxS7RLGbE
	 1UOVpp0n6QqQgpSC5ipikFdvq0Gvcu1i5iBpRCuQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] classes/insane: increase shebang size limit
Date: Fri,  3 Jul 2026 11:07:10 +0100
Message-ID: <20260703100710.2901608-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703100710.2901608-1-ross.burton@arm.com>
References: <20260703100710.2901608-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 10:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240105

Since Linux 5.1 the shebang buffer has been 256 bytes[1], so update the
check to match.

Also rewrite the test, create a variable for the magic number (that has
the same name as the kernel #define), read double that so we either have
a full line, or definitely are over the buffer, don't pointlessly try to
decode the bytes as UTF-8, and consolidate the test logic to entirely
inside the try block.

Also update the tests: sysroot-shebang-test needs updating to write a
longer shebang, and generalise the test case so that the string being
searched for isn't so specific.

[1] linux 6eb3c3d0a52dc ("exec: increase BINPRM_BUF_SIZE to 256")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../sysroot-test/sysroot-shebang-test_1.0.bb  |  4 ++--
 meta/classes-global/insane.bbclass            | 23 ++++++++-----------
 meta/lib/oeqa/selftest/cases/sysroot.py       |  3 +--
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test=
_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.=
0.bb
index 6c834be8976..106ddd54262 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -1,11 +1,11 @@
-SUMMARY =3D "Check that shebang does not exceed 128 characters"
+SUMMARY =3D "Check that shebang does not exceed 256 characters"
 LICENSE =3D "CLOSED"
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
 EXCLUDE_FROM_WORLD =3D "1"
 do_install() {
     install -d ${D}${bindir}
-    echo '#!BiM3cnVd1Amtv6PG+FynrQiVMbZnX5ELgF21q3EkuB+44JEGWtq8TvBJ7EGi=
dfVs3eR3wVOUbLnjYDlKUWcm7YC/ute7f+KDHbwxziRUSUBZAUqgjiQdfQ0HnxajI0ozbM863=
E9JV9k13yZKYfh9/zR77Y6Dl4Dd3zOWS75LSpkAXV' > ${D}${bindir}/max-shebang
+    echo '#!4Shfcy9Ej8gPKDGNkyhmtxrwPinmpZQ1pCS3snbdqlNx7YfmTpHkeJakCMaD=
nQXx4c4TmtyJpGBn5F7IO1FShYG9EwtALDOsRKEDOJKRj2L7hW92wZTzlqx4mMqREqNa7Hrwq=
l4DYVv8vmEMhIwvtHO3UaVpgvLY9Y3HhfopUVUMZJi5Xs9KKkRisrM0HBePG67tbeWL9ZstNu=
PKH1ikyeNB7PprwLrsjZ6EngCrhFTfYzRSuXhdrQQBBsLZBRDsy5QE' > ${D}${bindir}/m=
ax-shebang
     chmod 755 ${D}${bindir}/max-shebang
 }
=20
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 1818ce2168d..c1d8b165866 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -83,25 +83,22 @@ QAPATHTEST[shebang-size] =3D "package_qa_check_sheban=
g_size"
 def package_qa_check_shebang_size(path, name, d, elf):
     global cpath
=20
+    # From kernel 5.1 onwards (specifically linux 6eb3c3d0a52dc ("exec: =
increase
+    # BINPRM_BUF_SIZE to 256")) the shebang buffer was increased from 12=
8 bytes
+    # to 256 bytes.
+    BINPRM_BUF_SIZE =3D 256
+
     if elf or cpath.islink(path) or not cpath.isfile(path):
         return
=20
     try:
         with open(path, 'rb') as f:
-            stanza =3D f.readline(130)
+            stanza =3D f.readline(BINPRM_BUF_SIZE * 2)
+            if stanza.startswith(b'#!') and len(stanza) > BINPRM_BUF_SIZ=
E:
+                oe.qa.handle_error("shebang-size", "%s: %s maximum sheba=
ng size exceeded, the maximum size is %d" % (name, package_qa_clean_path(=
path, d, name), BINPRM_BUF_SIZE), d)
+                return
     except IOError:
-        return
-
-    if stanza.startswith(b'#!'):
-        try:
-            stanza.decode("utf-8")
-        except UnicodeDecodeError:
-            #If it is not a text file, it is not a script
-            return
-
-        if len(stanza) > 129:
-            oe.qa.handle_error("shebang-size", "%s: %s maximum shebang s=
ize exceeded, the maximum size is 128." % (name, package_qa_clean_path(pa=
th, d, name)), d)
-            return
+        pass
=20
 QAPATHTEST[libexec] =3D "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf):
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/self=
test/cases/sysroot.py
index ef854f6feeb..bdf7ad35a53 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -44,9 +44,8 @@ TESTSTRING:pn-sysroot-test-arch2 =3D "%s"
         Expected:  Fail when a shebang bigger than the max shebang-size =
is reached.
         Author:    Paulo Neves <ptsneves@gmail.com>
         """
-        expected =3D "maximum shebang size exceeded, the maximum size is=
 128. [shebang-size]"
         res =3D bitbake("sysroot-shebang-test-native -c populate_sysroot=
", ignore_status=3DTrue)
-        self.assertTrue(expected in res.output, msg=3Dres.output)
+        self.assertTrue("[shebang-size]" in res.output, msg=3Dres.output=
)
         self.assertTrue(res.status !=3D 0)
=20
     def test_sysroot_la(self):
--=20
2.43.0


