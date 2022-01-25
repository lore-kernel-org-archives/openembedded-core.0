Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4A8C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:58:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.458.1643133508151873049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58541FB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:58:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC973F7D8
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:58:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tiff: backport fix for CVE-2022-22844
Date: Tue, 25 Jan 2022 17:58:25 +0000
Message-Id: <20220125175825.1480100-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 17:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160948

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch | 43 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffset-fi=
x-global-buffer-overflow-for-ASCII-tags-wh.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-globa=
l-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libti=
ff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
new file mode 100644
index 00000000000..72776f09ba8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffe=
r-overflow-for-ASCII-tags-wh.patch
@@ -0,0 +1,43 @@
+CVE: CVE-2022-22844
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags wher=
e
+ count is required (fixes #355)
+
+---
+ tools/tiffset.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffset.c b/tools/tiffset.c
+index 8c9e23c5..e7a88c09 100644
+--- a/tools/tiffset.c
++++ b/tools/tiffset.c
+@@ -146,9 +146,19 @@ main(int argc, char* argv[])
+=20
+             arg_index++;
+             if (TIFFFieldDataType(fip) =3D=3D TIFF_ASCII) {
+-                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_inde=
x]) !=3D 1)
+-                    fprintf( stderr, "Failed to set %s=3D%s\n",
+-                             TIFFFieldName(fip), argv[arg_index] );
++                if(TIFFFieldPassCount( fip )) {
++                    size_t len;
++                    len =3D strlen(argv[arg_index]) + 1;
++                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFiel=
dTag(fip),
++                            (uint16_t)len, argv[arg_index]) !=3D 1)
++                        fprintf( stderr, "Failed to set %s=3D%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                } else {
++                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
++                            argv[arg_index]) !=3D 1)
++                        fprintf( stderr, "Failed to set %s=3D%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                }
+             } else if (TIFFFieldWriteCount(fip) > 0
+ 		       || TIFFFieldWriteCount(fip) =3D=3D TIFF_VARIABLE) {
+                 int     ret =3D 1;
+--=20
+2.25.1
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.3.0.bb
index 6852758c6a9..ef8e8460fbb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D34da3db46fab=
7501992f9615d7e158cf"
 CVE_PRODUCT =3D "libtiff"
=20
 SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-          "
+           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags=
-wh.patch"
+
 SRC_URI[sha256sum] =3D "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daa=
ad1c2e89e1b37ac8"
=20
 # exclude betas
--=20
2.25.1


