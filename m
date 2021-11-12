Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F9C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.15933.1636725770993624591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C54A1063
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37C353F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] dtc: add PACKAGECONFIGs for tools and yaml
Date: Fri, 12 Nov 2021 14:02:34 +0000
Message-Id: <20211112140237.575404-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112140237.575404-1-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158224

Leave yaml off by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/dtc/dtc_1.6.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/d=
tc/dtc_1.6.1.bb
index 44293cf4ff..6365f73e10 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://devicetree.org/"
 DESCRIPTION =3D "The Device Tree Compiler is a tool used to manipulate t=
he Open-Firmware-like device tree used by PowerPC kernels."
 SECTION =3D "bootloader"
 LICENSE =3D "GPLv2 | BSD-2-Clause"
-DEPENDS =3D "flex-native bison-native"
=20
 LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=
=3D05bb357cfb75cae7d2b01d2ee8d76407"
@@ -19,9 +18,12 @@ inherit meson pkgconfig
=20
 EXTRA_OEMESON =3D "-Dpython=3Ddisabled -Dvalgrind=3Ddisabled"
=20
+PACKAGECONFIG ??=3D "tools"
+PACKAGECONFIG[tools] =3D "-Dtools=3Dtrue,-Dtools=3Dfalse,flex-native bis=
on-native"
+PACKAGECONFIG[yaml] =3D "-Dyaml=3Denabled,-Dyaml=3Ddisabled,libyaml"
+
 PACKAGES =3D+ "${PN}-misc"
 FILES:${PN}-misc =3D "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}=
/dtdiff"
-
-RDEPENDS:${PN}-misc +=3D "bash diffutils"
+RDEPENDS:${PN}-misc +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tools',=
 'bash diffutils', '', d)}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


