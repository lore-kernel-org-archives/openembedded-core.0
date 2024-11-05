Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CB1D3E778
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:56:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32439.1730843811389845582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD30911FB
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 13:57:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D1D43F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 13:56:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-setuptols: do parallel builds
Date: Tue,  5 Nov 2024 21:56:44 +0000
Message-Id: <20241105215644.1884070-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105215644.1884070-1-ross.burton@arm.com>
References: <20241105215644.1884070-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 21:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206757

Explicitly tell the build_ext task to do parallel builds, as it defaults
to not.

In my testing this halves the build time of python3-pandas.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 9 +++++++++
 meta/classes-recipe/setuptools3.bbclass                  | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index 4c84d1e8d0b..f4695b08245 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -7,3 +7,12 @@
 inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
+
+do_compile:prepend() {
+    # Write an extra config file to build in parallel
+    export DIST_EXTRA_CONFIG=3D${WORKDIR}/setuptools-extra.cfg
+    cat <<EOF >$DIST_EXTRA_CONFIG
+[build_ext]
+parallel =3D ${@oe.utils.parallel_make(d)}
+EOF
+}
diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index 64a78e9a367..f9b892ef832 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -31,6 +31,13 @@ setuptools3_do_configure() {
 }
=20
 setuptools3_do_compile() {
+        # Write an extra config file to build in parallel
+        export DIST_EXTRA_CONFIG=3D${WORKDIR}/setuptools-extra.cfg
+        cat <<EOF >$DIST_EXTRA_CONFIG
+[build_ext]
+parallel =3D ${@oe.utils.parallel_make(d)}
+EOF
+
         cd ${SETUPTOOLS_SETUP_PATH}
         NO_FETCH_BUILD=3D1 \
         STAGING_INCDIR=3D${STAGING_INCDIR} \
--=20
2.34.1


