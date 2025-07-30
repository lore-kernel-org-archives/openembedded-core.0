Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71347C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:04:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39280.1753891436456751191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E8F1BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C71B63F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/13] python3-docutils: upgrade to 0.22
Date: Wed, 30 Jul 2025 17:03:43 +0100
Message-ID: <20250730160343.4053614-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221134

License-Update: the code that was ZPL-licensed has been removed[1].

Explicitly set a non-GPLv3 LICENSE on the output package as we don't
actually ship the GPLv3 file.

This fixes the incorrect hashbangs, so we can remove the manual seds.

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] https://sourceforge.net/p/docutils/code/9977/
---
 .../python/python3-docutils_0.21.2.bb         | 22 -------------------
 .../python/python3-docutils_0.22.bb           | 16 ++++++++++++++
 2 files changed, 16 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-docutils_0.21.2.=
bb
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.22.bb

diff --git a/meta/recipes-devtools/python/python3-docutils_0.21.2.bb b/me=
ta/recipes-devtools/python/python3-docutils_0.21.2.bb
deleted file mode 100644
index 237cabb1958..00000000000
--- a/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "Docutils is a modular system for processing documentation i=
nto useful formats"
-HOMEPAGE =3D "http://docutils.sourceforge.net"
-SECTION =3D "devel/python"
-LICENSE =3D "CC0-1.0 & ZPL-2.1 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D382430a09a4453818aa6618f2=
090491b"
-
-SRC_URI[sha256sum] =3D "3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb=
109deff6ebfa986f"
-
-inherit pypi python_flit_core
-
-RDEPENDS:${PN} +=3D " \
-                   python3-pprint \
-"
-
-do_install:append() {
-	# Make sure we use /usr/bin/env python3
-	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-	done
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.bb b/meta=
/recipes-devtools/python/python3-docutils_0.22.bb
new file mode 100644
index 00000000000..2dafa034fb2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Docutils is a modular system for processing documentation i=
nto useful formats"
+HOMEPAGE =3D "http://docutils.sourceforge.net"
+SECTION =3D "devel/python"
+LICENSE =3D "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING.rst;md5=3Dce467b04b35c7ac3429b6908f=
c8b318e"
+
+SRC_URI[sha256sum] =3D "ba9d57750e92331ebe7c08a1bbf7a7f8143b86c476acd515=
28b042216a6aad0f"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} +=3D "python3-pprint"
+
+# We don't install the emacs lisp, which is the only piece of GPLv3
+LICENSE:${PN} =3D "CC0-1.0 & BSD-2-Clause"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


