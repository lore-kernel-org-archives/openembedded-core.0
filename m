Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D373C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45863.1721746323065076752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEFC1480
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 734FB3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/37] python3-uritools: enable ptest
Date: Tue, 23 Jul 2024 15:51:37 +0100
Message-Id: <20240723145137.74198-37-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202404

Install the test suite and run it in core-image-ptest-fast.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-uritools/run-ptest               |  3 +++
 .../python/python3-uritools_4.0.2.bb                | 13 ++++++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-uritools/run-pte=
st

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 16d7b9e6b2c..5e90096b1e8 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -71,6 +71,7 @@ PTESTS_FAST =3D "\
     python3-pyyaml \
     python3-rpds-py \
     python3-trove-classifiers \
+    python3-uritools \
     python3-wcwidth \
     python3-webcolors \
     qemu \
diff --git a/meta/recipes-devtools/python/python3-uritools/run-ptest b/me=
ta/recipes-devtools/python/python3-uritools/run-ptest
new file mode 100644
index 00000000000..8d2017d39ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uritools/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb b/met=
a/recipes-devtools/python/python3-uritools_4.0.2.bb
index 08ebd07705f..693d1974be2 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
@@ -6,6 +6,17 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ec55353c80c6=
62e4255f8889a0ca558"
=20
 SRC_URI[sha256sum] =3D "04df2b787d0eb76200e8319382a03562fbfe4741fd66c155=
06b08d3b8211d573"
=20
-inherit pypi python_setuptools_build_meta
+SRC_URI +=3D "file://run-ptest"
+
+inherit pypi python_setuptools_build_meta ptest
+
+do_install_ptest() {
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/
+}
+
+RDEPENDS:${PN}-ptest +=3D " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


