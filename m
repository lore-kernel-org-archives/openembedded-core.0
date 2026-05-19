Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002F3CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:01:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21861.1779199271915288699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 07:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dCs56O8k;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22CB034FC
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:01:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D93153F632
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779199271; bh=98ke5c2OdfQBEtDUV6jCOnyk0epwm/M1XWDd/XT0pxE=;
	h=From:To:Subject:Date:From;
	b=dCs56O8ktX8ZRj9QLgx4Rd5xlwW808TKOVHffGL0OyHGMDhkhnhMBjZGoEWkJg09H
	 CrrYCSFGDVQ6icR1Bkx4RawJ9tcQfg0uSB/Vl4ibSy1b/bDexIUH7tdIkApxpTW0S/
	 36Tot6fQx9hF8Wgo8ZCIjdepJcMqAivbol/aX5yI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] nasm: remove groff-native dependency
Date: Tue, 19 May 2026 15:01:05 +0100
Message-ID: <20260519140105.507088-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 14:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237326

The documentation hasn't been built with groff since 2013[1], remove the
dependency.

This exposes the fact that nasm depends on zlib, so add it to DEPENDS.

[1] nasm 1a63699c ("man: Generate manpages from asciidoc format")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/nasm/nasm_3.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devto=
ols/nasm/nasm_3.01.bb
index 1e4719000f..837aaad9ab 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "The Netwide Assembler (NASM) is an assem=
bler and disassembler for
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6178dc4f5355e40552448080e67a2=
14b"
=20
+DEPENDS =3D "zlib"
+
 SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.=
tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
@@ -19,6 +21,4 @@ inherit autotools-brokensep
=20
 BBCLASSEXTEND =3D "native"
=20
-DEPENDS =3D "groff-native"
-
 CVE_PRODUCT =3D "netwide_assembler"
--=20
2.43.0


