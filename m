Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7A3C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:28:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17760.1676910501462505858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A94115BF;
	Mon, 20 Feb 2023 08:29:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799EF3F703;
	Mon, 20 Feb 2023 08:28:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] tiff: backport fix for CVE-2022-48281
Date: Mon, 20 Feb 2023 16:28:16 +0000
Message-Id: <20230220162817.180458-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220162817.180458-1-ross.burton@arm.com>
References: <20230220162817.180458-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177439

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libtiff/files/CVE-2022-48281.patch        | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.=
patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b=
/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
new file mode 100644
index 00000000000..e356d377ead
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
@@ -0,0 +1,29 @@
+CVE: CVE-2022-48281
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 14fa18da..7db69883 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data=
 *image,
+                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
+             else
+             {
+-                prev_cropsize =3D seg_buffs[0].size;
++                prev_cropsize =3D seg_buffs[i].size;
+                 if (prev_cropsize < cropsize)
+                 {
+                     next_buff =3D _TIFFrealloc(
+--=20
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.5.0.bb
index e2cb512892b..f8a2482a848 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d6=
db1386b4689c8121531c3"
=20
 CVE_PRODUCT =3D "libtiff"
=20
-SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2022-48281.patch"
=20
 SRC_URI[sha256sum] =3D "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb62=
2727b5b08c423464"
=20
--=20
2.34.1


