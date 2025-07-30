Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528B4C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39267.1753891428709453250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2110D1BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4A3F3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/13] classes/python_pep517: centralise shared inherits
Date: Wed, 30 Jul 2025 17:03:31 +0100
Message-ID: <20250730160343.4053614-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221122

For the build process to actually work some inherits are always needed:

- python3native for the python that is actually running build.
- setuptools3-base (badly named) defines how to build extensions and
  where to put modules.

Instead of inheriting these in every class, inherit them once in the
python_pep517 class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_flit_core.bbclass             | 2 +-
 meta/classes-recipe/python_hatchling.bbclass             | 2 +-
 meta/classes-recipe/python_mesonpy.bbclass               | 2 +-
 meta/classes-recipe/python_pep517.bbclass                | 2 ++
 meta/classes-recipe/python_poetry_core.bbclass           | 2 +-
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 2 +-
 6 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/python_flit_core.bbclass b/meta/classes-=
recipe/python_flit_core.bbclass
index c5480654f3b..cb40ab0faf4 100644
--- a/meta/classes-recipe/python_flit_core.bbclass
+++ b/meta/classes-recipe/python_flit_core.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit python_pep517 python3native python3-dir setuptools3-base
+inherit python_pep517
=20
 DEPENDS +=3D "python3-flit-core-native"
=20
diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-=
recipe/python_hatchling.bbclass
index b5a3c3feea5..6765ddbe8ce 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit python_pep517 python3native python3-dir setuptools3-base
+inherit python_pep517
=20
 DEPENDS +=3D "python3-hatchling-native"
=20
diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
index 81c087c7c75..d62f2d4374b 100644
--- a/meta/classes-recipe/python_mesonpy.bbclass
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit meson setuptools3-base python3targetconfig python_pep517
+inherit meson python_pep517
=20
 # meson_do_qa_configure does the wrong thing here because
 # mesonpy runs "meson setup ..." in do_compile context.
diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index e8cd1923ef2..880aadb2e23 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -10,6 +10,8 @@
 # This class will build a wheel in do_compile, and use pypa/installer to=
 install
 # it in do_install.
=20
+inherit python3native python3-dir setuptools3-base
+
 DEPENDS:append =3D " python3-build-native python3-installer-native"
=20
 # Where to execute the build process from
diff --git a/meta/classes-recipe/python_poetry_core.bbclass b/meta/classe=
s-recipe/python_poetry_core.bbclass
index c7dc5d0382e..35a2f137cbe 100644
--- a/meta/classes-recipe/python_poetry_core.bbclass
+++ b/meta/classes-recipe/python_poetry_core.bbclass
@@ -4,6 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit python_pep517 python3native setuptools3-base
+inherit python_pep517
=20
 DEPENDS +=3D "python3-poetry-core-native"
diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index 4c84d1e8d0b..c7b12e53093 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -4,6 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit setuptools3-base python_pep517
+inherit python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
--=20
2.43.0


