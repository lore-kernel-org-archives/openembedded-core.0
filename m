Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8D8C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8396.1646749840393774173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12B381655
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B48E43FA58
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] setuptools_build_meta: add variable to control where
 pyproject.toml is located
Date: Tue,  8 Mar 2022 14:30:34 +0000
Message-Id: <20220308143035.3569559-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308143035.3569559-1-ross.burton@arm.com>
References: <20220308143035.3569559-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162926

The PEP517[1] pyproject.toml doesn't have to be located at the top-level
of the source tree (for example, in recipes with multiple components), so
add a variable PEP517_SOURCE_PATH to set where the file is.

In the future there should be a pep517.bbclass to centralise the common
logic, but for now this can be defined in each of the relevant classes.

[1] https://www.python.org/dev/peps/pep-0517/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools_build_meta.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 18ae2e6004..787fbd5f36 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -2,12 +2,16 @@ inherit pip_install_wheel setuptools3-base
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
+# Where to execute the build process from
+PEP517_SOURCE_PATH ?=3D "${S}"
+
 setuptools_build_meta_do_configure () {
     :
 }
=20
 # TODO: ideally this uses pypa/build
 setuptools_build_meta_do_compile () {
+    cd ${PEP517_SOURCE_PATH}
     nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('${PIP_INSTALL_DIST_PATH}')"
 }
 do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
--=20
2.25.1


