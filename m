Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6657CC4321E
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22514.1653585012276439434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8C4B150C;
	Thu, 26 May 2022 10:10:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F383F66F;
	Thu, 26 May 2022 10:10:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 07/10] python3-picobuild: add new recipe
Date: Thu, 26 May 2022 18:09:58 +0100
Message-Id: <20220526171001.4074388-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166193

Picobuild is a pico-scale Python PEP517 build frontend, designed to have
minimal dependencies (via vendoring) to be well suited for building
source-based distributions, such as OpenEmbedded.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-picobuild_0.1.bb           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-picobuild_0.1.bb

diff --git a/meta/recipes-devtools/python/python3-picobuild_0.1.bb b/meta=
/recipes-devtools/python/python3-picobuild_0.1.bb
new file mode 100644
index 00000000000..bbd3636eea8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-picobuild_0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Library and tool for installing Python wheels"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6c811a9fbdf5641ff0b0d43fbbb44=
0e5"
+# TODO vendorered license files
+
+SRC_URI =3D "git://gitlab.com/rossburton/picobuild.git;protocol=3Dhttps;=
branch=3Dmain"
+SRCREV =3D "f08fe0375e2b93e3363416f210534d1ac3f8fc68"
+
+S =3D "${WORKDIR}/git"
+
+inherit python_flit_core
+
+# For target builds we can deleted the vendored libraries and RDEPEND on=
 them
+# instead. Use an explicit list to be sure we delete what we RDEPEND on.
+do_install:append:class-target() {
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/picobuild/vendored/packaging
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/picobuild/vendored/pep517*
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/picobuild/vendored/pyparsing
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/picobuild/vendored/tomli
+}
+
+RDEPENDS:${PN}:append:class-target =3D " python3-tomli python3-pep517 py=
thon3-packaging python3-pyparsing"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


