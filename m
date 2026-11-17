Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16286.1794916930378406461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=eP7ZjMeD;
 spf=pass (domain: geanix.com, ip: 79.135.106.111, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794916927; x=1795176127;
	bh=DZFM8AP0bzBAP2gafMNvnUzUK9jBtpMzZE/FCgKuFkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eP7ZjMeDHVhBUqTl8TWgPz3BUSX0I/0xAXcuOTzmCt6YRC1zQ9kO+EsBFZBdecfdV
	 ivopszEBpbsDxvTfYXb97wIdJNOs+Z4TvAn9TSrIgSBLzMkK9D3bOC7ILVzOcWkVUN
	 LkAvQ30eZpasCCW6R4uOwgl7ypOe248SOdgCbp9bBr8tR4wBalsyneUBOTjnqqACXt
	 qbbMoAhCgWYSKWG4KtgyRQDldxjuMeFyqxj2YACYmD6JOk9q3CMQL4gIMwkJSjjQ40
	 NHjnyAPCFajhSmK4dB+OQQwvZ4k/U6ph6gh7Iod5SOtsJ03ymxuLA37T5kHOSWlObV
	 Eb+APgyZu5E+w==
X-Pm-Submission-Id: 4jTNdB2lZyz1DDLk
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 3/3] oeqa/selftest/incompatible_lic: build the SDK in NoGPL3 core-image-minimal test
Date: Tue, 17 Nov 2026 13:01:55 +0100
Message-ID: <20261117120155.3986876-4-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117120155.3986876-1-sean@geanix.com>
References: <20261117120155.3986876-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250436
Content-Type: text/plain; charset="utf-8"

Also run do_populate_sdk in test_core_image_minimal, to check that SDK
host tools (e.g. nativesdk-autoconf) are not checked against the image's
INCOMPATIBLE_LICENSE.

GCC-exception-3.1 and Autoconf-exception-macro are added to the
exceptions, as the SDK target sysroot includes libgcc and xz-src.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/=
oeqa/selftest/cases/incompatible_lic.py
index 406f92e37b..eafe63ab77 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -159,10 +159,12 @@ class NoGPL3InImagesTests(OESelftestTestCase):
     def test_core_image_minimal(self):
         self.write_config("""
 INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D "GPL-3.0* LGPL-3.0*"
+INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal =3D "GCC-exception=
-3.1 Autoconf-exception-macro"
+ERROR_QA:remove:pn-core-image-minimal =3D "license-exception"
=20
 require conf/distro/include/no-gplv3.inc
 """)
-        bitbake('core-image-minimal')
+        bitbake('core-image-minimal core-image-minimal:do_populate_sdk')
=20
     @skipIfNotFeature('wayland', 'Test requires wayland to be in DISTRO_=
FEATURES')
     def test_core_image_full_cmdline_weston(self):
--=20
2.56.0

