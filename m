Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44C8CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 13:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.43159.1655817015252430316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0533D168F;
	Tue, 21 Jun 2022 06:10:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 627AB3F534;
	Tue, 21 Jun 2022 06:10:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v3 3/5] Add python3-hatchling (from meta-oe)
Date: Tue, 21 Jun 2022 14:10:09 +0100
Message-Id: <20220621131011.96980-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621131011.96980-1-ross.burton@arm.com>
References: <20220621131011.96980-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 13:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167147

Recipes in core are now needing to use the Hatch build system, so
move the hatchling recipe and class from meta-oe to oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_hatchling.bbclass         |  5 +++++
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-hatchling_1.3.0.bb         | 21 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 meta/classes/python_hatchling.bbclass
 create mode 100644 meta/recipes-devtools/python/python3-hatchling_1.3.0.=
bb

diff --git a/meta/classes/python_hatchling.bbclass b/meta/classes/python_=
hatchling.bbclass
new file mode 100644
index 00000000000..b3cbe23601b
--- /dev/null
+++ b/meta/classes/python_hatchling.bbclass
@@ -0,0 +1,5 @@
+inherit python_pep517 python3native python3-dir setuptools3-base
+
+DEPENDS +=3D "python3-hatchling-native"
+
+PEP517_BUILD_API =3D "hatchling.build"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 62e0ac24e35..cf7723deb08 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -612,6 +612,7 @@ RECIPE_MAINTAINER:pn-python3-extras =3D "Oleksandr Kr=
avchuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-flit-core =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-git =3D "Oleksandr Kravchuk <open.source@ol=
eksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb =3D "Oleksandr Kravchuk <open.source@=
oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-hatchling =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Tim Orling <tim.orling@kons=
ulko.com>"
 RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield <bruce.ashfield@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize =3D "Tim Orling <tim.orling@konsu=
lko.com>"
diff --git a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb b/me=
ta/recipes-devtools/python/python3-hatchling_1.3.0.bb
new file mode 100644
index 00000000000..6e7ccd743f5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "The extensible, standards compliant build backend used by H=
atch"
+HOMEPAGE =3D "https://hatch.pypa.io/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33fc9297692812fc94b=
7d27fd9"
+
+inherit pypi python_hatchling
+
+DEPENDS +=3D "python3-pluggy-native python3-tomli-native python3-pathspe=
c-native python3-packaging-native python3-editables-native"
+DEPENDS:remove:class-native =3D "python3-hatchling-native"
+
+SRC_URI[sha256sum] =3D "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f=
2b0040fdddc5b85e"
+
+# Until we have a proper tool to invoke PEP517 builds, hatchling can't
+# bootstrap itself automatically.
+PEP517_BUILD_API =3D "hatchling.ouroboros"
+
+do_compile:prepend() {
+    export PYTHONPATH=3Dsrc
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


