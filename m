Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A99EA3F22
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 16:07:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23142.1770739662707734927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD887339
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:07:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2F7C3F632
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:07:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-packaging: be more specific when skipping tests on musl
Date: Tue, 10 Feb 2026 16:07:38 +0000
Message-ID: <20260210160738.296773-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 16:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230916

We don't need to skip all of test_tags.py, just the two test cases that
use manylinux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-packaging_26.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/met=
a/recipes-devtools/python/python3-packaging_26.0.bb
index 1a1b58a13d..ff45cb5133 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -15,8 +15,8 @@ RDEPENDS:${PN} +=3D "python3-profile"
=20
 # This test needs tomli_w which isn't currently in meta/
 SKIPLIST =3D "--ignore=3Dtests/test_pylock.py"
-# https://github.com/pypa/packaging/issues/850
-SKIPLIST:append:libc-musl =3D " --deselect tests/test_manylinux.py::test=
_is_manylinux_compatible_old --ignore=3Dtests/test_tags.py"
+# Tests don't handle manylinux+musl (https://github.com/pypa/packaging/i=
ssues/850)
+SKIPLIST:append:libc-musl =3D " --deselect=3Dtests/test_manylinux.py::te=
st_is_manylinux_compatible_old --deselect=3Dtests/test_tags.py::TestManyl=
inuxPlatform --deselect=3Dtests/test_tags.py::TestSysTags"
=20
 do_compile:class-native () {
     python_flit_core_do_manual_build
--=20
2.43.0


