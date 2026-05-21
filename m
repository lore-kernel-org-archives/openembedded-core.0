Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E91ECD5BB4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35794.1779368323114933293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gblz/55y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 764EC1A365D;
	Thu, 21 May 2026 12:58:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C6D360495;
	Thu, 21 May 2026 12:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33E33107E8B86;
	Thu, 21 May 2026 14:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzCpfCoSryro31BaigR4AUbv1wjwJ4RHTzb2iodmqd0=;
	b=gblz/55yQaKT52A8JbBTHGJYXBEoTXuON9At1DsABooikq9HapD3hLs9YzeEDVsa5fZCNh
	RDztaFvXViH169GwyDR+59sr71ZGKcn6OfvuztMn+hYrA1RwlgtD7Kp9qa7laBai1GPzUu
	1XoR4C5RpRu7d8u6ui18qmf2kE06Oz5DospUu5Bvf0N7OIkplZS+lRe4yVLQsf9rhW7xpO
	l8bVHUEwj946pisnFEXycAvOd4H3vXxIobhUbntwvudyk/jnoutAcZJflJJdHAsTNghhlX
	wdWokG/dOG1Vt9sMbOvYeWg6QFXaaO8iuVRQdHbK9ZgZkEB+7+9G4xxznfu0VQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/5] vim: introduce vim-sources.inc file
Date: Thu, 21 May 2026 14:58:24 +0200
Message-ID: <20260521125828.718050-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237508

This include file contains source-related settings that should be common
for any recipes whose sources belong into Vim's source code.

The first example is xxd, which will be introduced in a follow-up commit.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/vim/vim-sources.inc |  9 +++++++++
 meta/recipes-support/vim/vim.inc         | 14 +-------------
 meta/recipes-support/vim/vim_9.2.bb      |  5 +++++
 3 files changed, 15 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-support/vim/vim-sources.inc

diff --git a/meta/recipes-support/vim/vim-sources.inc b/meta/recipes-supp=
ort/vim/vim-sources.inc
new file mode 100644
index 0000000000..19d3b2d15b
--- /dev/null
+++ b/meta/recipes-support/vim/vim-sources.inc
@@ -0,0 +1,9 @@
+SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv${PV}"
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
index 6e0058b13e..190953b9dd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -12,19 +12,7 @@ RSUGGESTS:${PN} =3D "diffutils"
 LICENSE =3D "Vim"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd1a651ab770b45d41c0f8cb5a8ca9=
30e"
=20
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
diff --git a/meta/recipes-support/vim/vim_9.2.bb b/meta/recipes-support/v=
im/vim_9.2.bb
index fee9f055e9..59de224aac 100644
--- a/meta/recipes-support/vim/vim_9.2.bb
+++ b/meta/recipes-support/vim/vim_9.2.bb
@@ -1,5 +1,10 @@
 require vim.inc
=20
+SRC_URI +=3D "file://disable_acl_header_check.patch \
+    file://0001-src-Makefile-improve-reproducibility.patch \
+    file://no-path-adjust.patch \
+"
+
 PROVIDES =3D "xxd"
=20
 RDEPENDS:${PN} =3D "ncurses-terminfo-base ${PN}-xxd"
--=20
2.43.0


