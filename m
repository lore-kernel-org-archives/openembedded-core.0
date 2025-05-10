Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D3C3ABD7
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6810.1746866650201018326
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC7B0153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80F523F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/23] oeqa/sdk: add helpers to check for and install packages
Date: Sat, 10 May 2025 09:43:41 +0100
Message-ID: <20250510084400.269726-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216256

The existing tests simply look at the manifest to determine if a test
should be ran or not based on dependencies. Whilst this works for
Traditional SDKs, it fails for Extensible SDKs if they've been built in
minimal mode, where the manifest will be empty.  However, minimal eSDKs
might well have available sstate to install the missing dependencies.

Add a pair of helper functions to ensure that a package is available, or
skip the test.  This handles nativesdk- vs -native (SDK vs eSDK) and
will try to sdk-install missing dependencies into an eSDK if they're not
already installed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/case.py | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 46a3789f572..1fd3b3b5695 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -7,8 +7,10 @@
 import os
 import subprocess
 import shutil
+import unittest
=20
 from oeqa.core.case import OETestCase
+from oeqa.sdkext.context import OESDKExtTestContext
=20
 class OESDKTestCase(OETestCase):
     def _run(self, cmd):
@@ -16,6 +18,62 @@ class OESDKTestCase(OETestCase):
                 (self.tc.sdk_env, cmd), shell=3DTrue, executable=3D"/bin=
/bash",
                 stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
=20
+    def ensure_host_package(self, *packages, recipe=3DNone):
+        """
+        Check that the host variation of one of the packages listed is a=
vailable
+        in the SDK (nativesdk-foo for SDK, foo-native for eSDK). The pac=
kage is
+        a list for the case where debian-renaming may have occured, and =
the
+        manifest could contain 'foo' or 'libfoo'.
+
+        If testing an eSDK and the package is not found, then try to ins=
tall the
+        specified recipe to install it from sstate.
+        """
+
+        # In a SDK the manifest is correct. In an eSDK the manifest may =
be
+        # correct (type=3Dfull) or not include packages that exist in ss=
tate but
+        # not installed yet (minimal) so we should try to install the re=
cipe.
+        for package in packages:
+            if isinstance(self.tc, OESDKExtTestContext):
+                package =3D package + "-native"
+            else:
+                package =3D "nativesdk-" + package
+
+            if self.tc.hasHostPackage(package):
+                break
+        else:
+            if isinstance(self.tc, OESDKExtTestContext):
+                recipe =3D (recipe or packages[0]) + "-native"
+                print("Trying to install %s..." % recipe)
+                self._run('devtool sdk-install %s' % recipe)
+            else:
+                raise unittest.SkipTest("Test %s needs one of %s" % (sel=
f.id(), ", ".join(packages)))
+
+    def ensure_target_package(self, *packages, multilib=3DFalse, recipe=3D=
None):
+        """
+        Check that at least one of the packages listed is available in t=
he SDK,
+        adding the multilib prefix if required. The target package is a =
list for
+        the case where debian-renaming may have occured, and the manifes=
t could
+        contain 'foo' or 'libfoo'.
+
+        If testing an eSDK and the package is not found, then try to ins=
tall the
+        specified recipe to install it from sstate.
+        """
+
+        # In a SDK the manifest is correct. In an eSDK the manifest may =
be
+        # correct (type=3Dfull) or not include packages that exist in ss=
tate but
+        # not installed yet (minimal) so we should try to install the re=
cipe.
+        for package in packages:
+            if self.tc.hasTargetPackage(package, multilib=3Dmultilib):
+                break
+        else:
+            if isinstance(self.tc, OESDKExtTestContext):
+                recipe =3D recipe or packages[0]
+                print("Trying to install %s..." % recipe)
+                self._run('devtool sdk-install %s' % recipe)
+            else:
+                raise unittest.SkipTest("Test %s needs one of %s" % (sel=
f.id(), ", ".join(packages)))
+
+
     def fetch(self, workdir, dl_dir, url, archive=3DNone):
         if not archive:
             from urllib.parse import urlparse
--=20
2.43.0


