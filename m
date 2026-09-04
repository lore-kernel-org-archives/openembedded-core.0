Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30B3C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 10:02:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10479.1788516135145784500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 03:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=f0P/fNsQ;
 spf=pass (domain: axis.com, ip: 52.101.66.53, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q70Khajt/3XWyF1itOrEQXhOd5oBOnCAbVadSkqk1GgnDO2GvN76y5kyTda2uosUVoEptg/YTnpqJ8snkJdZgxUFPsadZ4XaGSDgt6Jc9a5BYJuNVys7mqZad/H08nN9oW4kiwsJ6/nfmI3+/d3WbSqI5T6pk7jUjYzcmp7tLwnVP5INWS1Se3Uy2XJRAOqC6lWD0gu10X6P93kdBF+3C5qEjQ6+V5xTju3lhM5SjBfSOhZPZphHXibAKP/038AfFb4gWIehgWxh6afGu4842/F2jgThGDXX/DqdJKe2XHhxC7HcMCFk5dZwArpQlElAoKRkRWjrbKd1CYkjU6zI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGbHiwAOCKQOl85UmP+Imrju0e8FEF5iAK+1Edwu2lE=;
 b=ErmETBIILGZ7kDVSt4R4Nd22yX00c3R4nCLeEscmlt18+UxLoFCrhR3+XaoS4LED+8WF0Y/fm1vjLdEbpUjnyN+TNA/HNfHqp6Q6V5tQ4GWNMKQoIAfUIoNI0ed1e3HqSN2kDSoRLPVSs71cQWYts1anvoThWK6PF7AS1AwLZaJ+xd2/VgTB0ZcqkHQO3XB0uf2VgQAQCBun0MqSXPSL+LKxIlk1jEYbuF0JAQCrQMF1n1zpi6A4pODPisKG+S3mN0ClsDL53jJtD1E6adq1BJfmnoLaPKwrgmZVzqUDsSogH3voxUzJ99rB8rrfcB9x7SLflxL/Pqqy51PSbhipog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGbHiwAOCKQOl85UmP+Imrju0e8FEF5iAK+1Edwu2lE=;
 b=f0P/fNsQi5cmBmLwFgsobV2XZv/Fhh8GUIQ0CBhItkW13jWGj6JTcQ2Rsn7OygggCzeIFPdeClp1D2keVEuKJdpm3e0zmRDXFF+xOAELkFlnTWaCP1vHztUPGnSXZC3EQfybPrUzxMaKhsr7mxRV41B9rIdTaHPTe4NnpI96r6k=
Received: from AS4P190CA0068.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::28)
 by AM7PPF9020C43FB.eurprd02.prod.outlook.com (2603:10a6:20f:fff1::816) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 10:02:11 +0000
Received: from AMS0EPF0000056B.eurprd02.prod.outlook.com
 (2603:10a6:20b:656::4) by AS4P190CA0068.outlook.office365.com
 (2603:10a6:20b:656::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 10:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000056B.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 10:02:10 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 4 Sep
 2026 12:02:10 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 4 Sep
 2026 12:02:09 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 4 Sep 2026 12:02:09 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C8868E15;
	Fri,  4 Sep 2026 12:02:09 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id C39E84A819D9; Fri,  4 Sep 2026 12:02:09 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv8] boost: Add support for building boost-asio as a shared library
Date: Fri, 4 Sep 2026 12:02:08 +0200
Message-ID: <20260904100208.3052527-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056B:EE_|AM7PPF9020C43FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e158f5b-340c-4d7f-3374-08df0a6b95f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/Fb3mJjnLR2sJQg4PWDCfsmN/pihSOwzeDH8QXeoGm1PeSCVd8AIh+w/ZDgGaN7b3Cl6MD310N1WJ+EbXbBvXwbNNg7WqARODVOWQBmqGNNCWrfiCmS8TdaD4jZ+zB4O1byQ+QP8qFiCw8aUMIvr9FTtT8raAgMHdfG7FcYVMWV0SphDGLOKc0tQdzQuvHWNCsxZ0E0MkBp2JH1pEh4M6seUCDNz7FVlyRlawh55tjHebaDaybLpdg+89OHDt5B7fohlmVWPw+G+PFj5ux/esE3dQiZ139UbknzQ7woUcOlzhBsqzTmye14Fu6GSpwjs7lERyW12RuMhkpcP/prj1T3/v/Q7Y71ksBjFRaCx3nJPe/GqyHci0V8wRcYoBpxNye34zN999Vaux9PqlArFTfgYdzAjKdOYAjVb4QaPWbH9BGHLpERqgrtkLy6UikOuotrKSAfVnMP0xjaiWN8jtcz2YDu2tVoC5MadQwvepZK4X3p4sAzvLOzmGlunPKJoP8Jvpfb0RbvtvCD2iRsC98tBmw6vl6KJ7WuP9LnWXsU+B4dwSxYafFvelLcptE19RgLgmkJFfKLe37LmY0OWpB439tKWaqGDkR6DnKXH3LODE6vEoS7324KE42E0DX/2gmtbx/ajD4VCjKMEruwagPWC8QKY6Qs0oaPb+Tduu9RAP1AFEfV6T1DYugXVXrDXM+w9Vu/I4qad8v/ZtHaS5A==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4O5lK5VZ2qNps+QEqiQldjWiFMgI+tnD+gBDHKm5v2tvIrGzpM0M4ZWQ4V7lBl2sGN0pPKG70qqjLL9p36EWDUFO6x1ItZXLzc1EG7Hr82nKYcvSC0mD2YvImu9QC4x98YMsleFqfKfqmLAO4wAF+Jl4hDaSp9fOls7yHu1Aud+f08puhdVM1vWA02g39euLEYM7A/iiZf0GCsKPHR1zvhKKRnHjPj/8bVB0KmxGcwoeJ240AoCc0ei7hDYvcmWldaBq3M1g6ubPYjBMkgU/dgjSdNUkoJe8s245MoTEOsAVahA1WHlU6F8MnjicePZIM6Okak8wn009IfYKieQpfveUrYkwFBdqTWZTktIEnSRGHd8E5bWMnIN+pnikaKsjQbKv3Jzeb/mE1Ow6Rue84wKT34Es9fMleC8y+w9UGX2RPEy0VsJL6r9uDDOrR99z
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:02:10.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e158f5b-340c-4d7f-3374-08df0a6b95f3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF9020C43FB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 10:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245089

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

This can be enabled by adding `PACKAGECONFIG:append =3D " asio-shared"` to
`boost_%.bbappend`.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 meta/recipes-support/boost/boost.inc          | 25 +++++++++++++++++++
 .../boost/boost/boost_asio.cpp                |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/boost_asio.cpp

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 64a57ddfb2..0267d8e819 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,6 +16,7 @@ do_configure[cleandirs] =3D "${B}"
=20
 BOOST_LIBS =3D "\
 	atomic \
+	asio \
 	charconv \
 	chrono \
 	container \
@@ -51,11 +52,14 @@ BOOST_LIBS =3D "\
=20
 # optional libraries
 PACKAGECONFIG ??=3D "locale python"
+PACKAGECONFIG[asio-shared] =3D ",,"
 PACKAGECONFIG[locale] =3D ",,icu"
 PACKAGECONFIG[graph_parallel] =3D ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] =3D ",,mpich"
 PACKAGECONFIG[python] =3D ",,python3"
=20
+SRC_URI:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'asio-shared', =
'file://boost_asio.cpp', '', d)}"
+
 inherit python3-dir
 PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
=20
@@ -198,6 +202,20 @@ do_compile() {
 		--debug-configuration
 }
=20
+do_compile:append() {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'asio-shared', 'true', 'false', =
d)}; then
+		${CXX} ${CPPFLAGS} ${CXXFLAGS} \
+			-DBOOST_ASIO_DYN_LINK=3D1 \
+			-I${S} \
+			-fPIC \
+			-shared \
+			-Wl,-soname,libboost_asio.so.${PV} \
+			${UNPACKDIR}/boost_asio.cpp \
+			${LDFLAGS} \
+			-o ${B}/libboost_asio.so.${PV}
+	fi
+}
+
 do_install() {
 	cd ${S}
 	b2 ${BJAM_OPTS} \
@@ -220,4 +238,11 @@ do_install() {
=20
 }
=20
+do_install:append() {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'asio-shared', 'true', 'false', =
d)}; then
+		install -Dm 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/libboost_asio=
.so.${PV}
+		ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so
+	fi
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/boost/boost/boost_asio.cpp b/meta/recipes=
-support/boost/boost/boost_asio.cpp
new file mode 100644
index 0000000000..eb3b7262c3
--- /dev/null
+++ b/meta/recipes-support/boost/boost/boost_asio.cpp
@@ -0,0 +1 @@
+#include <boost/asio/impl/src.hpp>
\ No newline at end of file
--=20
2.43.0

Rename `asio` packageconfig flag to `asio-shared` and include asio in BOOST=
_LIBS unconditionally.

> No custom compiler executions please. Building a shared library should
> be done by the boost build system itself, and enabled via a flag to it
> during do_configure (e.g. via PACKAGECONFIG_CONFARGS or BJAM_EXTRA).
> You probably need to patch boost to do this, and send the needed patch
> upstream.

I spent a day trying to get that to work, but it doesn't seem to be possibl=
e. Everything I tried either breaks
the header-only version or doesn't build the shared library.

