Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A8DC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 22:13:24 +0000 (UTC)
Received: from phx-mbsout-02.mbs.boeing.net (phx-mbsout-02.mbs.boeing.net [130.76.184.179])
 by mx.groups.io with SMTP id smtpd.web10.20610.1749161600295800272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 15:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@boeing.com header.s=boeing-s1912 header.b=CkugTzvM;
 spf=pass (domain: boeing.com, ip: 130.76.184.179, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 555MDJJG065119;
	Thu, 5 Jun 2025 15:13:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1749161599;
	bh=7XqiubU56RyUz1qPY/IFFVWPb19/l2NVCzSs6KFMWfY=;
	h=From:To:Cc:Subject:Date:From;
	b=CkugTzvMCdyPmrbo+sNnEJSkjh8SR2RlnhTadp4x6ja3Fn+0kfWmV3bEZOi+mrc6Y
	 NoXs3RxhzMdcV5pxRRt9HYXsDy5wu+cNY0TlO9tlK1BE2kDsolbF6DSvU7h0mF1Awc
	 PpWl/n05HJ5RK//xqnqkajG7oEtSeVZu5LYmLEAaI6Jsjp5w1K0xWbmjhsosbuez/h
	 hKoI+RI+UMm0B9mb49tMojJMJp6Fr4zW3mbuhzQ94duHdeMlILXZCFGLRe2VgJa4wc
	 7zSExJ4Y6w2sOuldC9TiSsKI6b70ei1n9nNf/PE7T99k9EP0ZjE0OEGyXvTveoKkQu
	 NorAaptmOk4VA==
Received: from clt-av-01.mbs.boeing.net (clt-av-01.mbs.boeing.net [144.115.64.247])
	by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 555MDBfH065092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 15:13:12 -0700
Received: from localhost (localhost [127.0.0.1])
	by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 555MDAeH027017;
	Thu, 5 Jun 2025 18:13:10 -0400
Received: from A6360519.boeing.com (a6360519.nos.boeing.com [10.34.35.202])
	by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 555MD4ox026813;
	Thu, 5 Jun 2025 18:13:04 -0400
From: Thune Tran <thune.a.tran@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Thune Tran <thune.a.tran@boeing.com>,
        Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH v2] oeqa/sdk: Simplify test specification and discovery
Date: Thu,  5 Jun 2025 22:13:01 +0000
Message-Id: <20250605221301.890797-1-thune.a.tran@boeing.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by phx-mbsout-02.mbs.boeing.net id 555MDJJG065119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 22:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218089

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
  =E2=94=9C=E2=94=80=E2=94=80 sdk/cases/                 # (default) Stan=
dard SDK: dirname=3D"sdk"
  =E2=94=9C=E2=94=80=E2=94=80 sdkbuildtools/cases/       # Buildtools: di=
rname=3D"sdkbuildtools"
  =E2=94=94=E2=94=80=E2=94=80 sdkbuildtools-docs/cases/  # Buildtools-doc=
s: dirname=3D"sdkbuildtools-docs"

  meta-mingw/lib/oeqa/
  =E2=94=94=E2=94=80=E2=94=80 sdkmingw/cases/            # MinGW: dirname=
=3D"sdkmingw"

  meta-foo/lib/oeqa/
  =E2=94=94=E2=94=80=E2=94=80 sdk/cases/                 # (default) Stan=
dard SDK: dirname=3D"sdk"

* Add mingw sdk compatibility until meta-mingw migrates to TESTSDK_CASE_D=
IRS

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
   * Mingw SDK: `SDKMACHINE=3Dx86_64-mingw32 bitbake core-image-minimal -=
c testsdk`

Signed-off-by: Thune Tran <thune.a.tran@boeing.com>
Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
---
 meta/classes-recipe/testsdk.bbclass           |  1 +
 meta/lib/oeqa/sdk/testsdk.py                  | 35 ++++++++++++++++++-
 .../cases}/README                             |  0
 .../cases}/build.py                           |  0
 .../cases}/README                             |  0
 .../cases}/build.py                           |  0
 .../cases}/gcc.py                             |  0
 .../cases}/https.py                           |  0
 .../cases}/sanity.py                          |  0
 .../meta/buildtools-docs-tarball.bb           |  3 +-
 meta/recipes-core/meta/buildtools-tarball.bb  | 21 ++---------
 11 files changed, 40 insertions(+), 20 deletions(-)
 rename meta/lib/oeqa/{sdk/buildtools-docs-cases =3D> sdkbuildtools-docs/=
cases}/README (100%)
 rename meta/lib/oeqa/{sdk/buildtools-docs-cases =3D> sdkbuildtools-docs/=
cases}/build.py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> sdkbuildtools/cases}/REA=
DME (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> sdkbuildtools/cases}/bui=
ld.py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> sdkbuildtools/cases}/gcc=
.py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> sdkbuildtools/cases}/htt=
ps.py (100%)
 rename meta/lib/oeqa/{sdk/buildtools-cases =3D> sdkbuildtools/cases}/san=
ity.py (100%)

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
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 52b702b6a2..2507cb035f 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -6,6 +6,13 @@
=20
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
=20
+# TODO: drop once the meta-mingw layer migrates to TESTSDK_CASE_DIRS
+def mingw_default_dir(d):
+    sdkmach =3D d.getVar("SDKMACHINE") or ""
+    if sdkmach.endswith("mingw32"):
+        return "sdkmingw"
+    return ""
+
 class TestSDKBase(object):
     @staticmethod
     def get_sdk_configuration(d, test_type):
@@ -31,6 +38,32 @@ class TestSDK(TestSDKBase):
     context_class =3D OESDKTestContext
     test_type =3D 'sdk'
=20
+    def sdk_dir_names(self, d):
+        """Return list from TESTSDK_CASE_DIRS."""
+        mingw_dir =3D mingw_default_dir(d)
+        if mingw_dir:
+            return mingw_dir.split()
+
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
@@ -115,7 +148,7 @@ class TestSDK(TestSDKBase):
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
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/README b/meta/lib/oe=
qa/sdkbuildtools-docs/cases/README
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-docs-cases/README
rename to meta/lib/oeqa/sdkbuildtools-docs/cases/README
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/=
oeqa/sdkbuildtools-docs/cases/build.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
rename to meta/lib/oeqa/sdkbuildtools-docs/cases/build.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/README b/meta/lib/oeqa/sd=
kbuildtools/cases/README
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/README
rename to meta/lib/oeqa/sdkbuildtools/cases/README
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/=
sdkbuildtools/cases/build.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/build.py
rename to meta/lib/oeqa/sdkbuildtools/cases/build.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/gcc.py b/meta/lib/oeqa/sd=
kbuildtools/cases/gcc.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/gcc.py
rename to meta/lib/oeqa/sdkbuildtools/cases/gcc.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/=
sdkbuildtools/cases/https.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/https.py
rename to meta/lib/oeqa/sdkbuildtools/cases/https.py
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa=
/sdkbuildtools/cases/sanity.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildtools-cases/sanity.py
rename to meta/lib/oeqa/sdkbuildtools/cases/sanity.py
diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/rec=
ipes-core/meta/buildtools-docs-tarball.bb
index b9ef68eb6d..210c111a3c 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -16,4 +16,5 @@ TOOLCHAIN_OUTPUTNAME =3D "${SDK_ARCH}-buildtools-docs-n=
ativesdk-standalone-${DISTR
=20
 SDK_TITLE =3D "Docs Build tools tarball"
=20
-TESTSDK_CASES =3D "buildtools-docs-cases"
+# Directory that contains testcases
+TESTSDK_CASE_DIRS =3D "sdkbuildtools-docs"
\ No newline at end of file
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index 6fa6d93a3d..c5ddb39f5b 100644
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
+TESTSDK_CASE_DIRS =3D "sdkbuildtools"
\ No newline at end of file
--=20
2.34.1


