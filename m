Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3820CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:40:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.669.1778276435639229843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=APcRIhx+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70A8DC5DC73;
	Fri,  8 May 2026 21:41:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23693605D0;
	Fri,  8 May 2026 21:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F47810819DBA;
	Fri,  8 May 2026 23:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778276433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Ey05Gm7nU7ADQ8P8O0WhBbqz5R84meaOgfVr4LUazU=;
	b=APcRIhx+V7qCH1Q+WQ1r5zCZ/N5ooGinF/Igoxu4OiykL88CUIWa1gmBVMZhgo/t3vjwF0
	PtwMIrQcDbQgNr6GxcvywzeK+qw5bCZ0XmISmB3u1lS+m404zfcXipQp+tuV5HIIpSwNY6
	+cXlgtrhzC537pDwtRbh2MnLG7OLK1+qZXMdwQ7/ZzSTIwX/+IW5fsCceiK3q1fwDwCmSc
	0NuhpGjMcgkU9AwzemyOdO5rxWFSbmVejl0pVDPeFTqVmcfKFAxvnNno5A2FaANYyHrDZt
	Y/pUfUA/WL67J5AcEv7CVkmhDHXOBHjTPa4iTPurrhK5P7DZXuUfK6scdbllHw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/4] vim: introduce vim-sources.inc file
Date: Fri,  8 May 2026 23:40:17 +0200
Message-ID: <20260508214020.2488025-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236742

This include file contains source-related settings that should be common
for any recipes whose sources belong into Vim's source code.

The first example is xxd, which will be introduced in a follow-up commit.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/vim/vim-sources.inc | 16 ++++++++++++++++
 meta/recipes-support/vim/vim.inc         | 17 +----------------
 2 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-support/vim/vim-sources.inc

diff --git a/meta/recipes-support/vim/vim-sources.inc b/meta/recipes-supp=
ort/vim/vim-sources.inc
new file mode 100644
index 0000000000..8a12485c39
--- /dev/null
+++ b/meta/recipes-support/vim/vim-sources.inc
@@ -0,0 +1,16 @@
+LICENSE =3D "Vim"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd1a651ab770b45d41c0f8cb5a8ca9=
30e"
+
+SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv${PV} \
+           file://disable_acl_header_check.patch \
+           file://0001-src-Makefile-improve-reproducibility.patch \
+           file://no-path-adjust.patch \
+           "
+
+PV .=3D ".0340"
+SRCREV =3D "6addd6c101117706bc9b3609d3a418e26e92618f"
+
+# Do not consider .z in x.y.z, as that is updated with every commit
+UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN =3D "1"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index d6fdf45706..74777864e7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -9,22 +9,7 @@ DEPENDS =3D "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS:${PN} =3D "diffutils"
=20
-LICENSE =3D "Vim"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd1a651ab770b45d41c0f8cb5a8ca9=
30e"
-
-SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv${PV} \
-           file://disable_acl_header_check.patch \
-           file://0001-src-Makefile-improve-reproducibility.patch \
-           file://no-path-adjust.patch \
-           "
-
-PV .=3D ".0340"
-SRCREV =3D "6addd6c101117706bc9b3609d3a418e26e92618f"
-
-# Do not consider .z in x.y.z, as that is updated with every commit
-UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
-# Ignore that the upstream version .z in x.y.z is always newer
-UPSTREAM_VERSION_UNKNOWN =3D "1"
+require vim-sources.inc
=20
 VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('=
.')[1]}"
=20
--=20
2.43.0


