Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BA1EC01AC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 09:23:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13020.1774257785172978858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 02:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ebwzVpW3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 817C54E427AE;
	Mon, 23 Mar 2026 09:23:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 579A05FEF6;
	Mon, 23 Mar 2026 09:23:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7F2610371203;
	Mon, 23 Mar 2026 10:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774257782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zAdwgjAI1XUY2UquJjdzVqknMR0mDg71Z/vzOrhHCCg=;
	b=ebwzVpW31NIoElxFx6YqRPswQKdqKYlzq0e88vHYNIfojbk6uRjO3uo2d1xAE/LQj+7GHx
	oWkeAFjxv3FF8ZPEY72uxoU5NRnkHcW3RiqWxw5Sdm9vyPg/LdPCjGLue7v4heANx4jbhE
	f56BlAj/J8KM1Gpeo4Z+sf3fE9z0W33DknIVGzx1PWym86KhSJvUIznkOr+x1FUUYgne9w
	8mVS7rQDX49vdMBajfJOouuZUclu2mnvUUOlybx6p0I5LFITZObgrnqULKaT54uzZ8i64W
	PeovderN5rjuoIrxUFykzNQrA/Dl2XsFgNb6P5lN85aHYyVN+iOYt7wwe3oqxg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	benjamin.robin@bootlin.com,
	JPEWhacker@gmail.com,
	steve@sakoman.com,
	mathieu.dubois-briand@bootlin.com,
	pascal.eberhard@se.com,
	kamel.bouhara@bootlin.com,
	miquel.raynal@bootlin.com,
	olivier.benjamin@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] spdx: add option to include only compiled sources
Date: Mon, 23 Mar 2026 10:22:56 +0100
Message-ID: <20260323092256.1998732-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233707

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx =
size is
reduced from 156MB to 61MB.

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for SPDX3.0

Tested with:
- bitbake world on oe-core
- oe-selftest --run-tests spdx.SPDX30Check

Regarding SPDX2.2, the respective backport was already performed in
OE-Core rev: a2866934e58fb377a73e87576c8594988a63ad1b

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta/classes/spdx-common.bbclass |  3 +++
 meta/lib/oe/spdx30_tasks.py      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
index 713a7fc651..ca0416d1c7 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??=3D "1.0"
 SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
=20
 SPDX_INCLUDE_SOURCES ??=3D "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
=20
 SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
@@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
=20
 def create_spdx_source_deps(d):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8970dcca0..9c422d1757 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -145,6 +145,8 @@ def add_package_files(
     ignore_dirs=3D[],
     ignore_top_level_dirs=3D[],
 ):
+    import oe.spdx
+
     source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
         source_date_epoch =3D int(source_date_epoch)
@@ -156,6 +158,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
=20
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES")=
 =3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources, types =3D oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -171,6 +178,11 @@ def add_package_files(
             filename =3D str(filepath.relative_to(topdir))
             file_purposes =3D get_purposes(filepath)
=20
+            # Check if file is compiled
+            if check_compiled_sources:
+                if not oe.spdx.is_compiled_source(filename, compiled_sou=
rces, types):
+                    continue
+
             spdx_file =3D objset.new_file(
                 get_spdxid(file_counter),
                 filename,
--=20
2.47.0


