Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68ADC982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:52:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25143.1789483951422513997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VGbfw/P3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF801570
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:52:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6823B3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789483950; bh=Cykwv2Z8w0Lmu2YIW4CveJyqSgV+kITW+nJGlCnMOF0=;
	h=From:To:Subject:Date:From;
	b=VGbfw/P3mlfnJKRvOMm3OTDuCKYaS7Qc7/dXofLgWZ9k+ghGX/xySdFr5U6kbv1g6
	 ov+stSU9r7cQ8CCURMfoOXxK7gX8dKWOXy4qtRBBVoPAtipu+/W5g2iwaYOniaaN38
	 7w3Qtwba75XimOgFydjinAzZK+QL+zN9ZQHb+ov4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-tomlkit: add new recipe (from meta-oe)
Date: Tue, 15 Sep 2026 15:52:27 +0100
Message-ID: <20260915145228.775109-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245854

Add a recipe for tomlkit, which is a new dependency needed by hatchling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-tomlkit_0.15.1.bb          | 21 +++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-tomlkit_0.15.1.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index bded4bf6c7d..1a023cb86c1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializin=
ghtml =3D "Tim Orling <tim.or
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-svg2pdfconverter =3D "Antonin=
 Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-subunit =3D "Trevor Gamblin <tgamblin@bayli=
bre.com>"
 RECIPE_MAINTAINER:pn-python3-testtools =3D "Trevor Gamblin <tgamblin@bay=
libre.com>"
+RECIPE_MAINTAINER:pn-python3-tomlkit =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D "Trevor Gamblin <tgam=
blin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify =3D "Trevor Gamblin <tgamblin@bay=
libre.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 2b5d665abe7..a8a8a4ae773 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -91,6 +91,7 @@ PTESTS_FAST =3D "\
     python3-pyyaml \
     python3-rpds-py \
     python3-six \
+    python3-tomlkit \
     python3-trove-classifiers \
     python3-vcs-versioning \
     python3-uritools \
diff --git a/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb b/met=
a/recipes-devtools/python/python3-tomlkit_0.15.1.bb
new file mode 100644
index 00000000000..b0c51f21c51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Style preserving TOML library"
+HOMEPAGE =3D "https://pypi.org/project/tomlkit/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D31aac0dbc1babd278d5386dadb7f8=
e82"
+
+SRC_URI[sha256sum] =3D "e25bbf38843005246210a12982776f27f99cb9be67160e14=
434d0c0d21ee1e97"
+
+inherit pypi python_poetry_core ptest-python-pytest
+
+RDEPENDS:${PN} +=3D " \
+    python3-datetime \
+    python3-profile \
+    python3-stringold \
+"
+
+RDEPENDS:${PN}-ptest +=3D " \
+    python3-poetry-core \
+    python3-pyyaml \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


