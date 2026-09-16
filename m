Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CBFC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 21:01:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25451.1789592506396866809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 14:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jfLZGvlS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 678B01516
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:01:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B45E03F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789592506; bh=D8e6zUUsjK/5YsNgOk42gZuslrXz/ql8BEJ86XfcbmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jfLZGvlSMXp8jO/Va6UaSmQUw3VxUV1hZxXw4aeVIi2jjBNfHTA51tC9QkPeC/blG
	 59KbfZdvPGCzVbbjiOs5nG8qNTCOmDBB6h81/6trLnONVA5MjCYkEDgHiLVbjkTxlO
	 0r6VlDzOSwjTD3KQt5kyVZw/GqPljejM+6oS4t4Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/python_pyo3: export fewer variables
Date: Wed, 16 Sep 2026 22:01:40 +0100
Message-ID: <20260916210141.1080593-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916210141.1080593-1-ross.burton@arm.com>
References: <20260916210141.1080593-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245999

These variables are already set in the pyo3.config that is written, so
there is no need to also export them.

Apart from PYO3_PYTHON, so set "executable".

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pyo3.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recip=
e/python_pyo3.bbclass
index d2aa188cf07..8854ed80d9b 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -12,11 +12,8 @@
 inherit cargo python3-dir siteinfo
=20
 export PYO3_CROSS =3D "1"
-export PYO3_CROSS_PYTHON_VERSION =3D "${PYTHON_BASEVERSION}"
-export PYO3_CROSS_LIB_DIR =3D "${STAGING_LIBDIR}"
 export CARGO_BUILD_TARGET =3D "${RUST_HOST_SYS}"
 export RUSTFLAGS
-export PYO3_PYTHON =3D "${PYTHON}"
 export PYO3_CONFIG_FILE =3D "${WORKDIR}/pyo3.config"
=20
 python_pyo3_do_configure () {
@@ -25,6 +22,7 @@ implementation=3DCPython
 version=3D${PYTHON_BASEVERSION}
 shared=3Dtrue
 abi3=3Dfalse
+executable=3D${PYTHON}
 lib_name=3D${PYTHON_DIR}
 lib_dir=3D${STAGING_LIBDIR}
 pointer_width=3D${SITEINFO_BITS}
--=20
2.43.0


