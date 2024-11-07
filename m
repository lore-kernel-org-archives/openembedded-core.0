Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B854D5D675
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78027.1731000251269503128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9088B1063
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C16A3F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/8] classes/setuptools: do parallel builds in a clean directory
Date: Thu,  7 Nov 2024 17:23:58 +0000
Message-Id: <20241107172404.4017047-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206843

It turns out that by setting DIST_EXTRA_CONFIG you can tell setuptools to
read a supplementary configuration file. This lets us pass options that
we normally cannot reach via the bdist_wheel command.

Tell the build task to use a build directory outside of the source tree,
so that we can clean it before each rebuild.

Tell the build_ext task to do parallel builds, as it defaults to not. In
my testing this halves the build time of python3-pandas.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python_setuptools_build_meta.bbclass           | 14 ++++++++++++++
 meta/classes-recipe/setuptools3.bbclass            | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index 4c84d1e8d0b..3fd42cc9845 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,3 +7,17 @@
 inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
+
+B =3D "${WORKDIR}/build"
+do_configure[cleandirs] +=3D "${B}"
+
+do_compile:prepend() {
+    # Write an extra config file to build in parallel
+    export DIST_EXTRA_CONFIG=3D${WORKDIR}/setuptools-extra.cfg
+    cat <<EOF >$DIST_EXTRA_CONFIG
+[build]
+build_base =3D ${B}
+[build_ext]
+parallel =3D ${@oe.utils.parallel_make(d)}
+EOF
+}
diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index 64a78e9a367..be260093b47 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -12,6 +12,8 @@ SETUPTOOLS_BUILD_ARGS ?=3D ""
=20
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
+B =3D "${WORKDIR}/build"
+
 python do_check_backend() {
     import re
     filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
@@ -29,8 +31,18 @@ addtask check_backend after do_patch before do_configu=
re
 setuptools3_do_configure() {
     :
 }
+do_configure[cleandirs] +=3D "${B}"
=20
 setuptools3_do_compile() {
+        # Write an extra config file to build in parallel
+        export DIST_EXTRA_CONFIG=3D${WORKDIR}/setuptools-extra.cfg
+        cat <<EOF >$DIST_EXTRA_CONFIG
+[build]
+build_base =3D ${B}
+[build_ext]
+parallel =3D ${@oe.utils.parallel_make(d)}
+EOF
+
         cd ${SETUPTOOLS_SETUP_PATH}
         NO_FETCH_BUILD=3D1 \
         STAGING_INCDIR=3D${STAGING_INCDIR} \
--=20
2.34.1


