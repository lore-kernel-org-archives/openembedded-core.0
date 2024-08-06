Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA65C52D7B
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11874.1722962249930811001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B5E91063
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A0403F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] python3-rfc3986-validator: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:18 +0100
Message-Id: <20240806163723.2186196-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203032

The only user of this recipe in core is python3-jsonschema, but only if
you select the non-default 'nongpl' PACKAGECONFIG.

Move to meta-python so it's there if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...e-pytest-runner-to-test_requirements.patch | 32 -------------------
 .../python/python3-rfc3986-validator_0.1.1.bb | 24 --------------
 3 files changed, 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-rfc3986-validator=
/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 delete mode 100644 meta/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index dcab241f6be..9da07540ce2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -689,7 +689,6 @@ RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu =
<wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-referencing =3D "Trevor Gamblin <tgamblin@b=
aylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests =3D "Tim Orling <tim.orling@konsul=
ko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator =3D "Bruce Ashfield <bruc=
e.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-rfc3986-validator =3D "Bruce Ashfield <bruc=
e.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 =3D "Bruce Ashfield <bruce.ashfield=
@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rpds-py =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
diff --git a/meta/recipes-devtools/python/python-rfc3986-validator/0001-s=
etup.py-move-pytest-runner-to-test_requirements.patch b/meta/recipes-devt=
ools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-=
test_requirements.patch
deleted file mode 100644
index 8a646874e87..00000000000
--- a/meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py=
-move-pytest-runner-to-test_requirements.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3531ff73631a0d59234eb4713e7b3a7f5ea57bbb Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <nicola.lunghi@jci.com>
-Date: Thu, 14 Nov 2019 12:17:51 +0000
-Subject: [PATCH] setup.py: move pytest-runner to test_requirements
-
-This fixes an issue with yocto build.
-pytest-runner is only needed when running tests.
-
-Upstream-Status: Pending
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 53ebea7..ebb0de2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -10,9 +10,9 @@ with open('README.md') as readme_file:
-=20
- requirements =3D []
-=20
--setup_requirements =3D ['pytest-runner', ]
-+setup_requirements =3D []
-=20
--test_requirements =3D ['pytest>=3D3', ]
-+test_requirements =3D ['pytest>=3D3', 'pytest-runner']
-=20
- setup(
-     author=3D"Nicolas Aimetti",
---=20
-2.20.1
-
diff --git a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
deleted file mode 100644
index e374979cb40..00000000000
--- a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "Pure python rfc3986 validator"
-HOMEPAGE =3D "https://github.com/naimetti/rfc3986-validator"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f08f7e0b088aa38ce=
9c6"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-rfc3986-validator:"
-
-SRC_URI[md5sum] =3D "47f7657b790aaf6011a1ab3d86c6be95"
-SRC_URI[sha256sum] =3D "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449=
b145d533b240d055"
-
-PYPI_PACKAGE =3D "rfc3986_validator"
-UPSTREAM_CHECK_REGEX =3D "/rfc3986-validator/(?P<pver>(\d+[\.\-_]*)+)/"
-
-inherit pypi setuptools3
-
-SRC_URI +=3D "\
-    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
-"
-
-RDEPENDS:${PN} +=3D "\
-    python3-core \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


