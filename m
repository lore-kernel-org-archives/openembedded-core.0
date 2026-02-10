Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30001EA8123
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:49:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21275.1770734967876691179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4253339
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:49:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D61123F632
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:49:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] python3-packaging: upgrade 25.0 -> 26.0
Date: Tue, 10 Feb 2026 14:49:20 +0000
Message-ID: <20260210144920.2294147-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230906

Skip the testcase test_pylock.py as this depends on tomli_w, which isn't
currently part of core.

Upstream changelog:

Features:

* PEP 751: support pylock
* PEP 794: import name metadata
* Support for writing metadata to a file
* Support __replace__ on Version
* Support positional pattern matching for Version and SpecifierSet

Behavior adaptations:

* PEP 440 handling of prereleases for Specifier.contains,
  SpecifierSet.contains, and SpecifierSet.filter
* Handle PEP 440 edge case in SpecifierSet.filter
* Adjust arbitrary equality intersection preservation in SpecifierSet
* Return False instead of raising for .contains with invalid version
* Support arbitrary equality on arbitrary strings for Specifier and
  SpecifierSet's filter and contains method.
* Only try to parse as Version on certain marker keys, return False on
  unequal ordered comparisons

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...n3-packaging_25.0.bb =3D> python3-packaging_26.0.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb =3D> pyth=
on3-packaging_26.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/met=
a/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..1a1b58a13d 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,21 +3,20 @@ HOMEPAGE =3D "https://github.com/pypa/packaging"
 LICENSE =3D "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a90b205c9167578c=
e91"
=20
-SRC_URI[sha256sum] =3D "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d31=
48b5599295b0fc4f"
+SRC_URI[sha256sum] =3D "00243ae351a257117b6a241061796684b084ed1c516a08c4=
8a3f7e147a9d80b4"
=20
 SRC_URI +=3D "file://run-ptest.in"
=20
 inherit pypi python_flit_core ptest
=20
-BBCLASSEXTEND =3D "native nativesdk"
-
 # Bootstrap the native build
 DEPENDS:remove:class-native =3D "python3-build-native"
 RDEPENDS:${PN} +=3D "python3-profile"
=20
+# This test needs tomli_w which isn't currently in meta/
+SKIPLIST =3D "--ignore=3Dtests/test_pylock.py"
 # https://github.com/pypa/packaging/issues/850
-SKIPLIST ?=3D ""
-SKIPLIST:libc-musl =3D "--deselect tests/test_manylinux.py::test_is_many=
linux_compatible_old --ignore=3Dtests/test_tags.py"
+SKIPLIST:append:libc-musl =3D " --deselect tests/test_manylinux.py::test=
_is_manylinux_compatible_old --ignore=3Dtests/test_tags.py"
=20
 do_compile:class-native () {
     python_flit_core_do_manual_build
@@ -41,3 +40,5 @@ RDEPENDS:${PN}-ptest =3D "\
 # The ptest package contains prebuilt test binaries
 INSANE_SKIP:${PN} =3D "already-stripped"
 INSANE_SKIP:${PN}-ptest =3D "arch"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


