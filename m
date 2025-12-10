Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28232D3E773
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3244.1765391597619233494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07C3F153B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:10 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E12EA3F762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] classes/meson: no need to export STAGING_DIR_HOST
Date: Wed, 10 Dec 2025 18:33:05 +0000
Message-ID: <20251210183308.4022909-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183308.4022909-1-ross.burton@arm.com>
References: <20251210183308.4022909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227502

If we use ${} for STAGING_DIR_HOST then the correct paths get written
into the command earlier.

Also use STAGING_LIBDIR, it's the same end result but more idiomatic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 0709a1313a4..2c098771fec 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -50,9 +50,6 @@ MESON_CROSS_FILE =3D ""
 MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE:class-nativesdk =3D "--cross-file ${WORKDIR}/meson.cros=
s"
=20
-# Needed to set up qemu wrapper below
-export STAGING_DIR_HOST
-
 def rust_tool(d, target_var):
     rustc =3D d.getVar('RUSTC')
     if not rustc:
@@ -141,7 +138,7 @@ EOF
 write_qemuwrapper() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that =
meson
     # can run target helper binaries through that.
-    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$ST=
AGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['$=
{STAGING_LIBDIR}','${STAGING_BASELIBDIR}'])}"
     cat > ${WORKDIR}/meson-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random th=
ings
--=20
2.43.0


