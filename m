Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7932.1794564951767781098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 02:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=Mdxaxvh4;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794564949; x=1794824149;
	bh=zAibuKcnPaytrHHm+y2CI+5zxhPFS6f3vz0LoZXz6ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Mdxaxvh4axarD3w0rTRdy+gR893jzZ5r+ye8nURiO4GbyLBF+4pcNuUPvjaqEZHL/
	 PXVKDMYAV+x6nWIup8+uYHnPcpFTb7CyPoNMdv4I+vBVDoBQs7Q0rhHe4MeAmAaX5e
	 41Nlr9emmO5HZ8CGPA6eduNeIeoZop/KzxVuPxkNqidjHk0kvWIRDKhCB2raj709d5
	 HfJKIoV9gRE9AxPjzgo/XzXIoa0kv5puJgs30kMu0K8FcifWuk+wdH9c4kmx4rV2XU
	 frv2lBDnGuwQ0zG2PzXJWsrW1gzh2HMWQfMctbr5hgDXLrbn9dgcfDjfSaO2m8e6rq
	 4lf0GNKx0ZZHQ==
X-Pm-Submission-Id: 4jQtSM144Zz1DFF6
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 2/2] oeqa/selftest/incompatible_lic: test INCOMPATIBLE_LICENSE in populate_sdk
Date: Fri, 13 Nov 2026 11:15:37 +0100
Message-ID: <20261113101537.3586467-2-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113101537.3586467-1-sean@geanix.com>
References: <20261113101537.3586467-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 10:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250156
Content-Type: text/plain; charset="utf-8"

Check that do_populate_sdk ignores the image's INCOMPATIBLE_LICENSE for
SDK host tools (nativesdk-bash) and still applies it to packages in the
SDK target sysroot (which).

bash can't be used for the target check, as target-sdk-provides-dummy
RPROVIDES bash, so it is never installed into the SDK target sysroot.

Autoconf-exception-macro is added to the exceptions, as the SDK's
complementary packages include xz-src.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
It seems weird to add the AI-Generated tag here.
It took quite a lot of effort to get the tests to fail before 1/2 and
pass after 1/2.

 .../oeqa/selftest/cases/incompatible_lic.py   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/=
oeqa/selftest/cases/incompatible_lic.py
index 406f92e37b..e05e2ee31c 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -155,6 +155,34 @@ NO_GENERIC_LICENSE[SomeLicense] =3D "COPYING"
             """))
         bitbake('core-image-minimal')
=20
+class IncompatibleLicensePerImageSDKTests(OESelftestTestCase):
+    def default_config(self):
+        return """
+INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D "GPL-3.0* LGPL-3.0*"
+INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal =3D "GCC-exception=
-3.1 Autoconf-exception-macro"
+ERROR_QA:remove:pn-core-image-minimal =3D "license-exception"
+
+require conf/distro/include/no-gplv3.inc
+"""
+
+    # Verify that host tools in the SDK (nativesdk, cross-canadian) are =
not
+    # checked against the image's INCOMPATIBLE_LICENSE, the same as at p=
arse
+    # time
+    def test_sdk_host_gpl3(self):
+        self.write_config(self.default_config() + '\nTOOLCHAIN_HOST_TASK=
:append:pn-core-image-minimal =3D " nativesdk-bash"')
+
+        bitbake('core-image-minimal -c populate_sdk')
+
+    # Verify that target packages in the SDK sysroot are still checked
+    # against the image's INCOMPATIBLE_LICENSE
+    def test_sdk_target_gpl3(self):
+        self.write_config(self.default_config() + '\nTOOLCHAIN_TARGET_TA=
SK:append:pn-core-image-minimal =3D " which"')
+        error_msg =3D "ERROR: core-image-minimal-1.0-r0 do_populate_sdk:=
 Some packages cannot be installed into the image because they have incom=
patible licenses:\n\twhich (GPL-3.0-or-later)"
+
+        result =3D bitbake('core-image-minimal -c populate_sdk', ignore_=
status=3DTrue)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
+
 class NoGPL3InImagesTests(OESelftestTestCase):
     def test_core_image_minimal(self):
         self.write_config("""
--=20
2.56.0

