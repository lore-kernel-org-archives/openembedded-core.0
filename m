Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12530.1794580243860259390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ir14Zq3W;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02281516
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 909E03F673
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794580242; bh=U70mj18+FJAJ8al1KJYoHNNKOJVBfdB8AXShsni+MBo=;
	h=From:To:Subject:Date:From;
	b=Ir14Zq3WEp3BOy9QaMKznL4VI4ANS2Akjoxrq1YmUD2Nk2fsi8B9nlFVAbcDV+6mB
	 1DMtWGIyAoehQKLqmMN2Yhx8uZ/y4WrrdLOr8g9zaxW+ZJUitHy3S1IqODQSwiQUlK
	 IxDpcEbQ/HphBD/o06os/YPqxUsiwL6evYlAQc6U=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/5] python3: remove obsolete reformatting of _sysconfigdata*.py
Date: Fri, 13 Nov 2026 14:30:34 +0000
Message-ID: <20261113143038.1651404-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250176
Content-Type: text/plain; charset="utf-8"

The python3 recipe currently reformats the _sysconfigdata*.py files after
they are modified to remove build paths, as the files may be wrapped
differently based on the length of strings[1].

However, this wrapping was due to the use of pprint.pprint(), which
since Python 3.13 is no longer used to generate the sysconfigdata[2].

As such, remove the reformatting as it is no longer needed.

[1] oe-core ec8a2b310d5 ("python3: Reformat sysconfig")
[2] python 5ecedbd2669 ("gh-106789: avoid importing pprint from sysconfig=
 (#106790)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/reformat_sysconfig.py      | 21 -------------------
 .../python/python3_3.14.10.bb                 |  8 +------
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/reformat_sysconf=
ig.py

diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b=
/meta/recipes-devtools/python/python3/reformat_sysconfig.py
deleted file mode 100644
index 5e2b12879d9..00000000000
--- a/meta/recipes-devtools/python/python3/reformat_sysconfig.py
+++ /dev/null
@@ -1,21 +0,0 @@
-#! /usr/bin/env python3
-#
-# SPDX-License-Identifier: MIT
-#
-# Copyright 2019 by Garmin Ltd. or its subsidiaries
-#
-# A script to reformat python sysconfig
-
-import sys
-import pprint
-l =3D {}
-g =3D {}
-with open(sys.argv[1], 'r') as f:
-    exec(f.read(), g, l)
-
-with open(sys.argv[1], 'w') as f:
-    for k in sorted(l.keys()):
-        f.write('%s =3D ' % k)
-        pprint.pprint(l[k], stream=3Df, width=3D1)
-        f.write('\n')
-
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index c50c4d4babc..28e67330d1a 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://get_module_deps3.py \
            file://python3-manifest.json \
            file://check_build_completeness.py \
-           file://reformat_sysconfig.py \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-prof=
ile.patch \
            file://0001-test_locale.py-correct-the-test-output-format.pat=
ch \
            file://makerace.patch \
@@ -214,9 +213,6 @@ do_install:append:class-native() {
 }
=20
 do_install:append() {
-        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.p=
y; do
-            python3 ${UNPACKDIR}/reformat_sysconfig.py $c
-        done
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfi=
gdata*.cpython*
=20
         mkdir -p ${D}${libdir}/python-sysconfigdata
@@ -389,10 +385,8 @@ py_package_preprocess () {
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars=
*.json \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
=20
-        # Reformat and recompile _sysconfigdata after modifying it so th=
at it remains
-        # reproducible
+        # Recompile _sysconfigdata after modifying it
         for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata=
*.py; do
-            python3 ${UNPACKDIR}/reformat_sysconfig.py $c
             python3 -mcompileall $c -s ${PKGD} -p /
         done
=20
--=20
2.43.0

