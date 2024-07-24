Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC1EC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14793.1721837322982335177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17E63FEC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:09:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36F573F73F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:08:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-packaging: enable ptest
Date: Wed, 24 Jul 2024 17:08:32 +0100
Message-Id: <20240724160832.2384962-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724160832.2384962-1-ross.burton@arm.com>
References: <20240724160832.2384962-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202462

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-packaging/run-ptest        |  3 +++
 .../python/python3-packaging_24.1.bb          | 21 ++++++++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-packaging/run-pt=
est

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 3dc1a2e88f1..7e9ec1c3aa6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -67,6 +67,7 @@ PTESTS_FAST =3D "\
     python3-mako \
     python3-markupsafe \
     python3-more-itertools \
+    python3-packaging \
     python3-pluggy \
     python3-pyasn1 \
     python3-pytz \
diff --git a/meta/recipes-devtools/python/python3-packaging/run-ptest b/m=
eta/recipes-devtools/python/python3-packaging/run-ptest
new file mode 100644
index 00000000000..8d2017d39ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/met=
a/recipes-devtools/python/python3-packaging_24.1.bb
index 596250b066d..20bcd55fbad 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a=
90b205c9167578ce91"
=20
 SRC_URI[sha256sum] =3D "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e9=
81cdf0ac37f4f002"
=20
-inherit pypi python_flit_core
+SRC_URI +=3D "file://run-ptest"
+
+inherit pypi python_flit_core ptest
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -16,3 +18,20 @@ RDEPENDS:${PN} +=3D "python3-profile"
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
+
+do_install_ptest() {
+    cp -r ${S}/tests ${D}${PTEST_PATH}/
+    # We don't need this script which is used to build the binaries
+    rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
+}
+
+RDEPENDS:${PN}-ptest =3D "\
+    python3-ctypes \
+    python3-pretend \
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+# The ptest package contains prebuilt test binaries
+INSANE_SKIP:${PN} =3D "already-stripped"
+INSANE_SKIP:${PN}-ptest =3D "arch"
--=20
2.34.1


