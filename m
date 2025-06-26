Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6ED8C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 20:57:41 +0000 (UTC)
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net [130.76.20.194])
 by mx.groups.io with SMTP id smtpd.web10.6813.1750971458103327157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 13:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@boeing.com header.s=boeing-s1912 header.b=n2M8796O;
 spf=pass (domain: boeing.com, ip: 130.76.20.194, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 55QKvZWE051523;
	Thu, 26 Jun 2025 13:57:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1750971457;
	bh=jvuk/NYhFxagfv1asWyDPQ2PG4xa/MhNTiyiAaUnADY=;
	h=From:To:Cc:Subject:Date:From;
	b=n2M8796O8uINopzDklSUP0Q4hPw74PKMX2WCwo2XydW0L/e9OMpGwqhdWyCmR/euO
	 txbzWkBz20Y6io9y8aXIGGq8SBSwkdwJXNr9Nr/Jyu+M7h4t2sMTC89xq/lFwLDsXy
	 AmtGEoJXdwnzPV3xpWUeTrHvmqT5paPPWQ6icfiON+osaX8NX7D7OufJNptYeeBUqx
	 RIEUBUXcquhmXheyr96boeFGEC108Zze0DTf0UKnRHj5LcC8ISAJ/dabUPyLnWRbDm
	 q92B/uULAta1vbXUuKy7lBkS8tovXNbnDS1aKr1sByIV5J/WZhxCniVAN8lD+splwQ
	 sDq/IB8wMSEQQ==
Received: from ewa-av-01.mbs.boeing.net (ewa-av-01.mbs.boeing.net [137.137.51.75])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 55QKvVJd051489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 13:57:31 -0700
Received: from localhost (localhost [127.0.0.1])
	by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 55QKvT5G012118;
	Thu, 26 Jun 2025 13:57:29 -0700
Received: from A6360519.boeing.com (a6360519.nos.boeing.com [10.35.161.174])
	by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 55QKvNIn011820;
	Thu, 26 Jun 2025 13:57:24 -0700
From: Thune Tran <thune.a.tran@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Thune Tran <thune.a.tran@boeing.com>,
        Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH v3] oeqa/sdk: Simplify test specification and discovery
Date: Thu, 26 Jun 2025 20:57:21 +0000
Message-Id: <20250626205721.1328-1-thune.a.tran@boeing.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by ewa-mbsout-01.mbs.boeing.net id 55QKvZWE051523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 20:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219372

Simplify how tests are specified and discovered for different SDK configu=
rations
to allow per-layer customization.

* Introduce `TESTSDK_CASE_DIRS` variable to specify test directory types,
  replacing the need to modify the default_cases class member

* Discover tests from configured layers using a common discovery pattern
  (`<LAYER_DIR>/lib/oeqa/<dirname>/cases`) where `<dirname>` is specified=
 in `TESTSDK_CASE_DIRS`

* The buildtools directories were renamed to follow the common discovery =
pattern
(`<LAYER_DIR>/lib/oeqa/<dirname>/cases`) for consistency across all SDK c=
onfigurations.

  meta/lib/oeqa/
  =E2=94=9C=E2=94=80=E2=94=80 sdk/cases/              # Standard SDK: dir=
name=3D"sdk"
  =E2=94=9C=E2=94=80=E2=94=80 buildtools/cases/       # Buildtools: dirna=
me=3D"buildtools"
  =E2=94=94=E2=94=80=E2=94=80 buildtools-docs/cases/  # Buildtools-docs: =
dirname=3D"buildtools-docs"

  meta-mingw/lib/oeqa/
  =E2=94=94=E2=94=80=E2=94=80 sdkmingw/cases/         # MinGW: dirname=3D=
"sdkmingw"

  meta-foo/lib/oeqa/
  =E2=94=94=E2=94=80=E2=94=80 sdk/cases/              # Standard SDK: dir=
name=3D"sdk"

Tested by:

1. Adding new tests using the default discovery pattern `<LAYER_DIR>/lib/=
oeqa/sdk/cases` and
   verifying they are discovered and executed.

2. Verifying existing SDK configuration tests work (requires -c populate_=
sdk first):
   * Standard SDK: `bitbake core-image-minimal -c testsdk`
   * Buildtools tarball: `bitbake buildtools-tarball -c testsdk`
   * Buildtools docs tarball: `bitbake buildtools-docs-tarball -c testsdk=
`
   * Mingw SDK: (SDKMACHINE =3D "x86_64-mingw32") `bitbake core-image-min=
imal -c testsdk`

Signed-off-by: Thune Tran <thune.a.tran@boeing.com>
Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
---
 meta/classes-recipe/testsdk.bbclass           |  1 +
 .../cases}/README                             |  0
 .../cases}/build.py                           |  0
 .../cases}/README                             |  0
 .../cases}/build.py                           |  0
 .../cases}/gcc.py                             |  0
 .../cases}/https.py                           |  0
 .../cases}/sanity.py                          |  0
 meta/lib/oeqa/sdk/testsdk.py                  | 24 ++++++++++++++++++-
 .../meta/buildtools-docs-tarball.bb           |  3 ++-
 meta/recipes-core/meta/buildtools-tarball.bb  | 21 +++-------------
 11 files changed, 29 insertions(+), 20 deletions(-)
 rename meta/lib/oeqa/{sdk/buildtools-docs-cases =3D> buildtools-docs/cas=
es}/README (100%)
 rename meta/lib/oeqa/{sdk/buildtools-docs-cases =3D> buildtools-docs/cas=
es}/build.py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> buildtools/cases}/README=
 (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> buildtools/cases}/build.=
py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> buildtools/cases}/gcc.py=
 (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> buildtools/cases}/https.=
py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> buildtools/cases}/sanity=
.py (100%)

diff --git a/meta/classes-recipe/testsdk.bbclass b/meta/classes-recipe/te=
stsdk.bbclass
index 59d2834c99..b1c4fa67e6 100644
--- a/meta/classes-recipe/testsdk.bbclass
+++ b/meta/classes-recipe/testsdk.bbclass
@@ -19,6 +19,7 @@ TESTSDK_SUITES ?=3D ""
=20
 TESTSDK_CLASS_NAME ?=3D "oeqa.sdk.testsdk.TestSDK"
 TESTSDKEXT_CLASS_NAME ?=3D "oeqa.sdkext.testsdk.TestSDKExt"
+TESTSDK_CASE_DIRS ?=3D "sdk"
=20
 def import_and_run(name, d):
     import importlib
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/README b/meta/lib/oe=
qa/buildtools-docs/cases/README
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-docs-cases/README
rename to meta/lib/oeqa/buildtools-docs/cases/README
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/=
oeqa/buildtools-docs/cases/build.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
rename to meta/lib/oeqa/buildtools-docs/cases/build.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/README b/meta/lib/oeqa/bu=
ildtools/cases/README
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/README
rename to meta/lib/oeqa/buildtools/cases/README
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/=
buildtools/cases/build.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/build.py
rename to meta/lib/oeqa/buildtools/cases/build.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/gcc.py b/meta/lib/oeqa/bu=
ildtools/cases/gcc.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/gcc.py
rename to meta/lib/oeqa/buildtools/cases/gcc.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/=
buildtools/cases/https.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/https.py
rename to meta/lib/oeqa/buildtools/cases/https.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa=
/buildtools/cases/sanity.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/sanity.py
rename to meta/lib/oeqa/buildtools/cases/sanity.py
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 52b702b6a2..cffcf9f49a 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -31,6 +31,28 @@ class TestSDK(TestSDKBase):
     context_class =3D OESDKTestContext
     test_type =3D 'sdk'
=20
+    def sdk_dir_names(self, d):
+        """Return list from TESTSDK_CASE_DIRS."""
+        testdirs =3D d.getVar("TESTSDK_CASE_DIRS")
+        if testdirs:
+            return testdirs.split()
+
+        bb.fatal("TESTSDK_CASE_DIRS unset, can't find SDK test directori=
es.")
+
+    def get_sdk_paths(self, d):
+        """
+        Return a list of paths where SDK test cases reside.
+
+        SDK tests are expected in <LAYER_DIR>/lib/oeqa/<dirname>/cases
+        """
+        paths =3D []
+        for layer in d.getVar("BBLAYERS").split():
+            for dirname in self.sdk_dir_names(d):
+                case_path =3D os.path.join(layer, "lib", "oeqa", dirname=
, "cases")
+                if os.path.isdir(case_path):
+                    paths.append(case_path)
+        return paths
+
     def get_tcname(self, d):
         """
         Get the name of the SDK file
@@ -115,7 +137,7 @@ class TestSDK(TestSDKBase):
=20
             try:
                 modules =3D (d.getVar("TESTSDK_SUITES") or "").split()
-                tc.loadTests(self.context_executor_class.default_cases, =
modules)
+                tc.loadTests(self.get_sdk_paths(d), modules)
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_=
exc())
diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/rec=
ipes-core/meta/buildtools-docs-tarball.bb
index b9ef68eb6d..36f86d9855 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -16,4 +16,5 @@ TOOLCHAIN_OUTPUTNAME =3D "${SDK_ARCH}-buildtools-docs-n=
ativesdk-standalone-${DISTR
=20
 SDK_TITLE =3D "Docs Build tools tarball"
=20
-TESTSDK_CASES =3D "buildtools-docs-cases"
+# Directory that contains testcases
+TESTSDK_CASE_DIRS =3D "buildtools-docs"
\ No newline at end of file
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index 6fa6d93a3d..02117ab84d 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -124,22 +124,7 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D ""
 # The recipe doesn't need any default deps
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-# Directory in testsdk that contains testcases
-TESTSDK_CASES =3D "buildtools-cases"
+inherit testsdk
=20
-# We have our own code, avoid deferred inherit
-SDK_CLASSES:remove =3D "testsdk"
-
-python do_testsdk() {
-    import oeqa.sdk.testsdk
-    testsdk =3D oeqa.sdk.testsdk.TestSDK()
-
-    cases_path =3D os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk=
.testsdk.__file__)), d.getVar("TESTSDK_CASES"))
-    testsdk.context_executor_class.default_cases =3D [cases_path,]
-
-    testsdk.run(d)
-}
-addtask testsdk
-do_testsdk[nostamp] =3D "1"
-do_testsdk[network] =3D "1"
-do_testsdk[depends] +=3D "xz-native:do_populate_sysroot"
+# Directory that contains testcases
+TESTSDK_CASE_DIRS =3D "buildtools"
\ No newline at end of file
--=20
2.34.1


