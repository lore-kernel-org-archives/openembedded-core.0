Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8638FD41D7E
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:59:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16102.1765475951649160324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12D391063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E52E03F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa: open JSON to parse in a context manager
Date: Thu, 11 Dec 2025 17:59:06 +0000
Message-ID: <20251211175908.3952420-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227561

Use context managers to open the .json files we're about to parse, so
that python doesn't warn about unclosed files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testexport.bbclass  | 3 ++-
 meta/lib/oeqa/sdk/testmetaidesupport.py | 3 ++-
 meta/lib/oeqa/sdk/testsdk.py            | 3 ++-
 meta/lib/oeqa/sdkext/testsdk.py         | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe=
/testexport.bbclass
index 344ae489b5a..12b7e171129 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -52,7 +52,8 @@ def testexport_main(d):
                              d.getVar('IMAGE_LINK_NAME') or d.getVar('IM=
AGE_NAME')))
=20
     tdname =3D "%s.testdata.json" % image_name
-    td =3D json.load(open(tdname, "r"))
+    with open(tdname, "r") as f:
+        td =3D json.load(f)
=20
     logger =3D logging.getLogger("BitBake")
=20
diff --git a/meta/lib/oeqa/sdk/testmetaidesupport.py b/meta/lib/oeqa/sdk/=
testmetaidesupport.py
index 00ef30e82e9..1110c40b9bf 100644
--- a/meta/lib/oeqa/sdk/testmetaidesupport.py
+++ b/meta/lib/oeqa/sdk/testmetaidesupport.py
@@ -21,7 +21,8 @@ class TestSDK(object):
=20
         sdk_envs =3D OESDKTestContextExecutor._get_sdk_environs(d.getVar=
("DEPLOY_DIR_IMAGE"))
         tdname =3D d.expand("${DEPLOY_DIR_IMAGE}/${PN}.testdata.json")
-        test_data =3D json.load(open(tdname, "r"))
+        with open(tdname, "r") as f:
+            test_data =3D json.load(f)
=20
         host_pkg_manifest =3D {"cmake-native":"", "gcc-cross":"", "gette=
xt-native":"", "meson-native":"", "perl-native":"", "python3-core-native"=
:"", }
         target_pkg_manifest =3D {"gtk+3":""}
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index cffcf9f49a9..98ef9c71cd6 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -103,7 +103,8 @@ class TestSDK(TestSDKBase):
             bb.fatal("The toolchain %s is not built. Build it before run=
ning the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
=20
         tdname =3D d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testd=
ata.json")
-        test_data =3D json.load(open(tdname, "r"))
+        with open(tdname, "r") as f:
+            test_data =3D json.load(f)
=20
         target_pkg_manifest =3D self.context_executor_class._load_manife=
st(
             d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manif=
est"))
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/tests=
dk.py
index 6dc23065a4a..4d626f3e0c2 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -35,7 +35,8 @@ class TestSDKExt(TestSDKBase):
                     " tests: 'bitbake <image> -c populate_sdk_ext' ." % =
tcname)
=20
         tdname =3D d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.te=
stdata.json")
-        test_data =3D json.load(open(tdname, "r"))
+        with open(tdname, "r") as f:
+            test_data =3D json.load(f)
=20
         target_pkg_manifest =3D OESDKExtTestContextExecutor._load_manife=
st(
             d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.ma=
nifest"))
--=20
2.43.0


