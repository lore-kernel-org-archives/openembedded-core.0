Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF5ACCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 22:49:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4851.1761605350531899559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 15:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35DF61C14
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 15:49:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9867F3F63F
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 15:49:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-urllib3: remove rust dependency
Date: Mon, 27 Oct 2025 22:49:05 +0000
Message-ID: <20251027224905.3530383-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 22:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225368

python3-cryptography (and thus, rust-native) is only needed by the
urllib3.contrib.pyopenssl module, which is not recommended for use up
the urllib3 upstream maintainers:

  Module for using pyOpenSSL as a TLS backend. This module was relevant
  before the standard library ssl module supported SNI, but now that
  we've dropped support for Python 2.7 all relevant Python versions
  support SNI so **this module is no longer recommended**.

Add a PACKAGECONFIG to control whether this module is shipped, and
disable it by default.

This removes rust-native from the default build of urllib3, which is in
the dependencies of other common modules such as requests and sphinx.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-urllib3_2.5.0.bb           | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta=
/recipes-devtools/python/python3-urllib3_2.5.0.bb
index a4f39957309..62fdf8e345a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -7,18 +7,23 @@ SRC_URI[sha256sum] =3D "3fc47733c7e419d4bc3f6b3dc2b4f89=
0bb743906a30d56ba4a5bfa4bbf
=20
 inherit pypi python_hatchling
=20
-DEPENDS +=3D " \
-    python3-hatch-vcs-native \
-"
+DEPENDS +=3D "python3-hatch-vcs-native"
+
+PACKAGECONFIG ??=3D ""
+# This is not recommended for use upstream, and has large dependencies
+PACKAGECONFIG[openssl] =3D ",,,python3-cryptography python3-pyopenssl"
+
+do_install:append() {
+    if ! ${@bb.utils.contains("PACKAGECONFIG", "openssl", "true", "false=
", d)}; then
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/urllib3/contrib/pyopenssl.p=
y
+    fi
+}
=20
 RDEPENDS:${PN} +=3D "\
-    python3-certifi \
-    python3-cryptography \
-    python3-email \
     python3-idna \
+    python3-email \
     python3-json \
     python3-netclient \
-    python3-pyopenssl \
     python3-threading \
     python3-logging \
 "
--=20
2.43.0


