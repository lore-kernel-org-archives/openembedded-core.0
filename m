Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90294C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 17:19:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16302.1721841575478322916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 10:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DFEBFEC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:20:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF39F3F766
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:19:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-idna: enable ptest
Date: Wed, 24 Jul 2024 18:19:26 +0100
Message-Id: <20240724171926.3724005-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724171926.3724005-1-ross.burton@arm.com>
References: <20240724171926.3724005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 17:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202473

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc     | 1 +
 meta/recipes-devtools/python/python3-idna/run-ptest | 3 +++
 meta/recipes-devtools/python/python3-idna_3.7.bb    | 9 ++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-idna/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 7e9ec1c3aa6..5a9896cc211 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -61,6 +61,7 @@ PTESTS_FAST =3D "\
     python3-beartype \
     python3-calver \
     python3-hypothesis \
+    python3-idna \
     python3-jinja2 \
     python3-jsonpointer \
     python3-license-expression \
diff --git a/meta/recipes-devtools/python/python3-idna/run-ptest b/meta/r=
ecipes-devtools/python/python3-idna/run-ptest
new file mode 100644
index 00000000000..d9693bb30f8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 -mputao.unittest discover --top-level-directory . --start-direct=
ory tests
diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/reci=
pes-devtools/python/python3-idna_3.7.bb
index 20c92d65372..713e803d038 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -5,8 +5,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D204c0612e4=
0a4dd46012a78d02c80fb1"
=20
 SRC_URI[sha256sum] =3D "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd=
08b9f8285bcb5cfc"
=20
-inherit pypi python_flit_core
+SRC_URI +=3D "file://run-ptest"
+
+inherit pypi python_flit_core ptest
+
+do_install_ptest() {
+    cp -r ${S}/tests ${D}${PTEST_PATH}/
+}
=20
 RDEPENDS:${PN} +=3D "python3-codecs"
+RDEPENDS:${PN}-ptest +=3D "python3-unittest-automake-output"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


