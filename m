Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C639C79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:38:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13889.1788529100520856390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nvBDLOUC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5228F152B
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:38:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97D283F7D8
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788529100; bh=CNgXIB5DljLDY3RSidcTRnJezIFFTRMq7gs4yZf+ZWw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nvBDLOUCx0r3nKkX2T1PiojpSwBhx7yrOZodFyixYjdkSpNiG/Z19LkpxKawrW3r9
	 aOhGqycoNJM+32V+3wedZiaDGOSpIiKDELRmerSByFxVyRpbmV6LtZfOPb+zht9nP7
	 xWYhUu+VETUTdiNq25/tpHLxD1uumY2ZIUmXeAmA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] classes/pypi: rename pypi_package() to pypi_default_package()
Date: Fri,  4 Sep 2026 14:38:14 +0100
Message-ID: <20260904133815.778303-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904133815.778303-1-ross.burton@arm.com>
References: <20260904133815.778303-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245112

Make it clear that this function returns a default value.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pypi.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
index b42b171e151..eb13ffe7e71 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -4,7 +4,11 @@
 # SPDX-License-Identifier: MIT
 #
=20
-def pypi_package(d):
+def pypi_default_package(d):
+    """
+    Return a reasonable guess for the PyPI package name by
+    stripping any python- prefix from PN.
+    """
     bpn =3D d.getVar('BPN')
     if bpn.startswith('python-'):
         return bpn[7:]
@@ -13,7 +17,7 @@ def pypi_package(d):
     return bpn
=20
 # The PyPi package name (defaults to PN without the python3- prefix)
-PYPI_PACKAGE ?=3D "${@pypi_package(d)}"
+PYPI_PACKAGE ?=3D "${@pypi_default_package(d)}"
 # The file extension of the source archive
 PYPI_PACKAGE_EXT ?=3D "tar.gz"
 # An optional prefix for the download file in the case of name collision=
s
--=20
2.43.0


