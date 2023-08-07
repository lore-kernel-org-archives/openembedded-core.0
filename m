Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F9BC04E69
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 16:59:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40217.1691427590241988309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 09:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6C351FB;
	Mon,  7 Aug 2023 10:00:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42BA43F59C;
	Mon,  7 Aug 2023 09:59:49 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] ghostscript: backport fix for CVE-2023-38559
Date: Mon,  7 Aug 2023 17:59:44 +0100
Message-Id: <20230807165945.4102126-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 16:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185612

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...pcx-buffer-overrun-fix-from-devices-.patch | 31 +++++++++++++++++++
 .../ghostscript/ghostscript_10.01.2.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bu=
g-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-70689=
7-Copy-pcx-buffer-overrun-fix-from-devices-.patch b/meta/recipes-extended=
/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from=
-devices-.patch
new file mode 100644
index 00000000000..b29212fbc6c
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-=
pcx-buffer-overrun-fix-from-devices-.patch
@@ -0,0 +1,31 @@
+From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+
+CVE: CVE-2023-38559
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index 7b14d9c71..6351fb77a 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1983,7 +1983,7 @@ devn_pcx_write_rle(const byte * from, const byte *=
 end, int step, gp_file * file
+         byte data =3D *from;
+=20
+         from +=3D step;
+-        if (data !=3D *from || from =3D=3D end) {
++        if (from >=3D end || data !=3D *from) {
+             if (data >=3D 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index fdbdfb6502f..6b5f443db06 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -25,6 +25,7 @@ def gs_verdir(v):
 SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/relea=
ses/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
+           file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devic=
es-.patch \
 "
=20
 SRC_URI[sha256sum] =3D "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0=
176715e499d21661"
--=20
2.34.1


