Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE925D6ACE3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:50:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.73424.1732719010777203445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 06:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B63B1477
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 06:50:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA4253F58B
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 06:50:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-flit-core: upgrade 3.9.0 -> 3.10.1
Date: Wed, 27 Nov 2024 14:50:00 +0000
Message-Id: <20241127145000.2086737-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 14:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207933

Summary of changes:
- The ``--python`` option can now take the path of a virtualenv folder, a=
s an
  alternative to a Python executable.
- The metadata in packages now has the names of optional dependency group=
s
  ("extras") normalised, complying with version 2.3 of the metadata stand=
ard.
- Fix potential substitution of environment variables into passwords read=
 from
  ``.pypirc`` files.
- A warning is now shown when building packages which specify the old
  ``flit.buildapi`` backend, which should be replaced by
  ``flit_core.buildapi``. It's a good idea to always set a maximum
  version for the build requirement, to protect against changes in
  future major versions of Flit.
- Avoid using the deprecated ``datetime.utcfromtimestamp()``.
- The tests for ``flit_core`` are no longer part of the installed package=
,
  reducing the size of the wheels.

Remove the -tests package, as the tests are no longer installed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...on3-flit-core_3.9.0.bb =3D> python3-flit-core_3.10.1.bb} | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.9.0.bb =3D> pyt=
hon3-flit-core_3.10.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.10.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
index b0bef4b6b69..55f200a3ad7 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER =3D "https://github.com/pypa/flit/issues"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a872983a882c694a8305=
f08"
=20
-SRC_URI[sha256sum] =3D "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd=
66a90611140844c7"
+SRC_URI[sha256sum] =3D "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb=
2a1daa13857a8f1a"
=20
 inherit pypi python_flit_core
=20
@@ -28,10 +28,4 @@ do_install:class-native () {
     python_pep517_do_bootstrap_install
 }
=20
-PACKAGES =3D+ "${PN}-tests"
-
-FILES:${PN}-tests +=3D "\
-    ${PYTHON_SITEPACKAGES_DIR}/flit_core/tests/* \
-"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


