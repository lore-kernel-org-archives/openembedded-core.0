Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15373C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:13:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37265.1782486815206785302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CMSwWP6o;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 138B41E7D
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F7F53F632
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782486814; bh=54OjgINFxm0DyQNvPZcyius3JP+OLuM8Chhsp+536gI=;
	h=From:To:Subject:Date:From;
	b=CMSwWP6ok6UDdWuQqmEBE5KtTKDo1QA6MJfSRQqpt+25dTic6raRV4qL/5vJFqxbd
	 N+C4/NrEO/1xrw8amla3B/xcp3bCxaGMmDmDifHfRFNACnDqlOrt0Xq2Xlkm7xi8AZ
	 pysjtLHeaKVCry/iii8PMHq4UTgsLEPnD0zyDVOA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] blueprint-compiler: inherit python3-dir not python3targetconfig
Date: Fri, 26 Jun 2026 16:13:23 +0100
Message-ID: <20260626151325.1735368-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239647

This recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR,
which is defined by python3-dir. Inheriting that directly instead of
python3targetconfig means we don't depend on python3 to build this tool.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../blueprint-compiler/blueprint-compiler_0.20.4.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.2=
0.4.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.=
bb
index bf357872c39..5bd3a5439cf 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec0=
61b899bce1d9ce9404"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3D=
https;branch=3Dblueprint-0-20;tag=3Dv${PV}"
 SRCREV =3D "31b62c24a72c1670d2d93dcdf2d130f1ae12778e"
=20
-inherit meson pkgconfig python3targetconfig
+inherit meson pkgconfig python3-dir
=20
 PACKAGES +=3D "${PN}-python"
=20
--=20
2.43.0


