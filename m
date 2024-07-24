Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1616CC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:08:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14633.1721837322569448380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67D74DA7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:09:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86F9E3F73F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:08:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-cffi: enable ptest
Date: Wed, 24 Jul 2024 17:08:31 +0100
Message-Id: <20240724160832.2384962-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724160832.2384962-1-ross.burton@arm.com>
References: <20240724160832.2384962-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202461

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-cffi/run-ptest             |  7 ++++++
 .../python/python3-cffi_1.16.0.bb             | 22 ++++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-cffi/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 08a8d612048..3dc1a2e88f1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -115,6 +115,7 @@ PTESTS_SLOW =3D "\
     parted \
     perl \
     python3 \
+    python3-cffi \
     python3-click \
     python3-cryptography \
     python3-xmltodict \
diff --git a/meta/recipes-devtools/python/python3-cffi/run-ptest b/meta/r=
ecipes-devtools/python/python3-cffi/run-ptest
new file mode 100644
index 00000000000..24ee6f2156c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cffi/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+# test_passing_large_list often causes an OOM, skip for now
+
+# test_version verifies that versions match across the source tree, igno=
re
+# as we don't have a source tree
+pytest --automake -k 'not test_passing_large_list and not test_version'
diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/r=
ecipes-devtools/python/python3-cffi_1.16.0.bb
index dfe32c604bd..e740ef45be6 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -6,13 +6,33 @@ DEPENDS +=3D "libffi python3-pycparser"
=20
 SRC_URI[sha256sum] =3D "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa=
5647806c25e02cc0"
=20
-inherit pypi python_setuptools_build_meta
+SRC_URI +=3D "file://run-ptest"
+
+inherit pypi python_setuptools_build_meta ptest
+
+do_install_ptest() {
+    cp -r ${S}/testing ${D}${PTEST_PATH}
+    # These two files from the source tree are needed by the tests
+    install -D -m644 ${S}/src/c/parse_c_type.c ${D}${PTEST_PATH}/src/c/p=
arse_c_type.c
+    install -D -m644 ${S}/src/cffi/parse_c_type.h ${D}${PTEST_PATH}/src/=
cffi/parse_c_type.h
+}
=20
 RDEPENDS:${PN} =3D " \
     python3-ctypes \
     python3-io \
     python3-pycparser \
+    python3-setuptools \
     python3-shell \
 "
=20
+RDEPENDS:${PN}-ptest +=3D " \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-dev \
+    gcc-symlinks \
+    g++-symlinks \
+"
+
+INSANE_SKIP:${PN}-ptest =3D "dev-deps"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


