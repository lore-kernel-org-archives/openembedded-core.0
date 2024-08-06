Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B4FC52D76
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:37:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11876.1722962251525296587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2CC21063
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1F283F766
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Aug 2024 09:37:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] python3-importlib-metadata: remove recipe (moved to meta-python)
Date: Tue,  6 Aug 2024 17:37:21 +0100
Message-Id: <20240806163723.2186196-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163723.2186196-1-ross.burton@arm.com>
References: <20240806163723.2186196-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 16:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203035

This package is a backport of the importlib.metadata standard library
package, so shouldn't really be needed since we have Python 3.12.

The last user in core was pytest, removed in 0aee9aa.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../python3-importlib-metadata_8.2.0.bb       | 20 -------------------
 2 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-importlib-metada=
ta_8.2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 87a3fdcfa60..90fde4f8546 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -638,7 +638,6 @@ RECIPE_MAINTAINER:pn-python3-hatch-vcs =3D "Ross Burt=
on <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Trevor Gamblin <tgamblin@ba=
ylibre.com>"
 RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield <bruce.ashfield@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize =3D "Tim Orling <tim.orling@konsu=
lko.com>"
-RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D "Tim Orling <tim.orl=
ing@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse =3D "Trevor Gamblin <tgamblin@bayl=
ibre.com>"
 RECIPE_MAINTAINER:pn-python3-iso8601 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_8.2.=
0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
deleted file mode 100644
index 3e1c7a7d6b7..00000000000
--- a/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "Read metadata from Python packages"
-HOMEPAGE =3D "https://pypi.org/project/importlib-metadata/"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
-
-inherit pypi python_setuptools_build_meta
-
-PYPI_PACKAGE =3D "importlib_metadata"
-UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
-
-SRC_URI[sha256sum] =3D "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff=
0f98d4a8f901e73d"
-
-S =3D "${WORKDIR}/importlib_metadata-${PV}"
-
-DEPENDS +=3D "python3-setuptools-scm-native"
-RDEPENDS:${PN} +=3D "python3-zipp"
-RDEPENDS:${PN}:append:class-target =3D " python3-misc"
-RDEPENDS:${PN}:append:class-nativesdk =3D " python3-misc"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


