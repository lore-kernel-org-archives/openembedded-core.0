Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23147.1628516977589258924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64DF86D
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 06:49:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 096493F718
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 06:49:35 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] buildtools-tarball: add testsdk task
Date: Mon,  9 Aug 2021 14:49:32 +0100
Message-Id: <20210809134933.2654738-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a testsdk task, which is essentially the same as testsdk.bbclass but
the test case directory is changed.  This lets us exercise the
buildtools tarballs at build time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index 9775430d4bf..6e96cf6c326 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -99,3 +99,16 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D ""
=20
 # The recipe doesn't need any default deps
 INHIBIT_DEFAULT_DEPS =3D "1"
+
+python do_testsdk() {
+    import oeqa.sdk.testsdk
+    testsdk =3D oeqa.sdk.testsdk.TestSDK()
+
+    cases_path =3D os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk=
.testsdk.__file__)), "buildtools-cases")
+    testsdk.context_executor_class.default_cases =3D cases_path
+
+    testsdk.run(d)
+}
+addtask testsdk
+do_testsdk[nostamp] =3D "1"
+do_testsdk[depends] +=3D "xz-native:do_populate_sysroot"
--=20
2.25.1

