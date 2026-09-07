Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D62C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 14:59:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37318.1788793172670543252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 07:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Z3YqLtxj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D0761476
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 07:59:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F6873F528
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788793172; bh=P8ZJop2IIWVM9+BpsxR/lMQvD8NcpBwE+7larCLleT0=;
	h=From:To:Subject:Date:From;
	b=Z3YqLtxjH13BubJAlS1OKC24nUESV2VPF1vYFai+gX3+CVB+/Ef3lBYQsKyAVPt6W
	 HqmO8zwPsZFxiSHk5nkHl/DeLVk/hcinqoX7SjRPft3sb5wMZR9+2ATY9rYNrofTh2
	 qQT8BYxfBJd9IrpjyeSrw8EDZRkhiPE6831sglSw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-flit-core: use flit-core sdist instead of flit
Date: Mon,  7 Sep 2026 15:59:28 +0100
Message-ID: <20260907145928.4115637-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 14:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245299

The flit sdist includes a copy of flit-core, but the maintainers also
upload a package that contains just flit-core.  Use this to allow the
default class to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-flit-core_3.12.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/m=
eta/recipes-devtools/python/python3-flit-core_3.12.0.bb
index e40ffd0d0f7..d6b37fe904b 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER =3D "https://github.com/pypa/flit/issues"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a872983a882c694a8305=
f08"
=20
-SRC_URI[sha256sum] =3D "1c80f34dd96992e7758b40423d2809f48f640ca285d0b782=
1825e50745ec3740"
+SRC_URI[sha256sum] =3D "18f63100d6f94385c6ed57a72073443e1a71a4acb4339491=
615d0f16d6ff01b2"
=20
 inherit pypi python_flit_core
=20
@@ -16,9 +16,7 @@ inherit pypi python_flit_core
 DEPENDS:remove:class-native =3D " python3-build-native python3-installer=
-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
-# We need the full flit tarball
-PYPI_PACKAGE =3D "flit"
-PEP517_SOURCE_PATH =3D "${S}/flit_core"
+PYPI_PACKAGE =3D "flit_core"
=20
 do_compile:class-native () {
     python_flit_core_do_manual_build
--=20
2.43.0


