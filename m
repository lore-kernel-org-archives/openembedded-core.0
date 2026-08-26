Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0002C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:59:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9090.1787738389125371663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qOMb3lcx;
 spf=pass (domain: axis.com, ip: 52.101.83.64, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CglTSutQ7Klp7PdM15eOuOQprsA2WovUR8qXq1Wwx3kj0W14ckY7L/iuyFBSVr7H6NMMsWovKV+v1tnWu8E64ZrJrX99vkIxj+wGvRssU1IF+U9kG/CdnYoZn2osqBZ+E+PEmUNt3Ca99YRrkZKNju4crJNjw9cRv4YXD3KtKnVh4QzEYpax0CCPVmgYfeh3FM02i2aC4Rwb3quuCngNWJvDDRAPXhmAmTwYLQnn58zOU0FmO/z4TIWoKHf907Q9OjSOLX8wgfLkvsZy54Kbb33rWNWDfnYavElbiIKVyONf6D7+WCRKJ6a3W5BEftd1QDaWNfA3gjU19GXYclfZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lcfw+PZorI3WKvVBL9sVE6njjsUMTGSNTdrZFAy7uSE=;
 b=QRlHAdA1ZrhWN6jRcXW5ZO2Lwcshn2BE/jTYsQjpHBBkzSwN/bCPQuphJAoGHFvP+42/uMqAhhCkwimc8VdM3S8R1cj4cpM1HWZvUlxyQFPNWfz3alWDg+QKFcl/TdcIQsor2a2ohmfJll10VVJ1yxcttszdoHgpXX2o3oD1eO8c51GrcQCJfbc2Iss6k4+m1R8CoE+9QfBJlLs+kEmXjxszQhB/ksdAFmtl1RlmndPyD2mkgnL7LBjnpiyCgSR3USnqEBks6JRSHlhAfIhF6Sle8BzE/VTCyP/ktezG3+qyFduJpCOqbE2t3+iEsq0Z49Kia3TB+5pSLHBSu9qM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lcfw+PZorI3WKvVBL9sVE6njjsUMTGSNTdrZFAy7uSE=;
 b=qOMb3lcxbjQuB3lko8HyI1IcGmIaQdRwCSSS4LhciHz1nDlqsjDxD5q2qcItR/eZcJdbRer/X6e2+yE9TGeDBLyCoE4JnrDJaialJICDTuvh9y34G23f3i8t9EBwOEz19QFxaOQB5hH7Eirfbx+sG8BVatoUrfib+xSE0Vry+70=
Received: from AM9P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::32)
 by VI1PR02MB6141.eurprd02.prod.outlook.com (2603:10a6:800:18b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 09:59:40 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::2d) by AM9P250CA0027.outlook.office365.com
 (2603:10a6:20b:21c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 09:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 09:59:40 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 26 Aug
 2026 11:59:39 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 26 Aug 2026 11:59:39 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id BBDDA948;
	Wed, 26 Aug 2026 11:59:39 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id B7E534A81A07; Wed, 26 Aug 2026 11:59:39 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCH 141/141] boost-asio: Add recipe
Date: Wed, 26 Aug 2026 11:59:36 +0200
Message-ID: <20260826095936.307786-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|VI1PR02MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 66faf277-4dbc-4e95-dcd6-08df0358beba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lKjsbtHLMKYx308Hy70d3DUjlfOUEufqBu2kTaqHkpYOkg/TiSP1/K09GyN6DYGyLwCm0mVPWfhopOJcYz+zh8wMBVXPGcvC+FKYF8kOABRh6KxH15nu62xu0P6RqJfOIWdWaPBK5vq8clMokWg5iyb9YvJsrxQCA2OKsU3hb/aUIJYUA0H4aDteICql6IhpBgz6Ek1i6iiZDjgMdKVKI60j+ztOLTSHIPQkmy1Zvg701PyToQFIkyxDf+Mw6vsBCeH8rprUnPAtsKaXzjKB1Cwmrd874HfNtR5XkONkyGhj0ARa6HPUqYTr6j4lPvgtotULUsD+zUAxoBjJ2EZBzE/czid/saH6j1OKM1vKny3FhImupoLO2PtfcdJHOJZ/rtAlRXUdeYnT1lhE1LQEXVHptye5S3NjZqt0b6VvW3IYl6LSoBzkfRL6Wfi1NfPPAJ3KA1B/6gLhaF98IvvZQ4aYROrTcjafUaElj6gf2hfQY8RGoE/+BUB7RO+OWaYG0P9FH8OIahQG3vYiZ54gmSZq7MjhbPTx3xBPjvVKZpAQHexHt9Y+Mso6/Vc+PImTQNjHkyyNP/6xRD5bRlIYsDCvy8wn4dmV7rb6LCxtaALdS86p+Fpq1hGwdJ7GNg4MrIH4aHi33/GfPwghhUh9HKp2Eie7VMv3j0RZmiQxsQJTx08hUpmTJ38P+lVTvWKsVtSuttyij2kFvDqYEKhsUg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gNxEuELBXgJvQ4Meke44G35rV0J797/4wLhTY6NbBTB50stPFJvNKBpCtMFD2/9n+xVD4CKZE1J4uY3d5P0+WuZU7raL6JUxTAxrXPR+llDmpRtycsCNw0Cq2wYc77fe88aUVPRvb1jy64ObWtbC1zSxBhFY2rnmZIw5cywahH322znf7Tr+p48mnsL0NlOgw3CB4caKq8WfW3OS+gSG66xGSYNIT6Paz6AUAse7aNLM4ZaHWInd8FrQjz9v87v/BfvEkp40VKHDW4gAuJGb0mX1w+V0Yc3t9UXt2yu0pBjhL9qfOWSjeIP+mHshrnv8QrRj3RJ1LzTzyUTr9JtijYKGOHS9mvHuRzA4kFPTSrweWA+d/BgB50S2anI4L1oMnK8rLBA/ru7/a49fVJGOoIBeF1SeoEsGF+2E/XJk2SaGmDeE156B79op7j46m4JL
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:59:40.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66faf277-4dbc-4e95-dcd6-08df0358beba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244392

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Change-Id: I3ac5ed0ccadae3e9d042b9c4eed3a1ab7220a009
Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 .../boost-asio/boost-asio_1.90.0.bb           | 33 +++++++++++++++++++
 .../boost-asio/files/boost_asio.cpp           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/boost-asio/boost-asio_1.90.0.bb
 create mode 100644 meta/recipes-support/boost-asio/files/boost_asio.cpp

diff --git a/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb b/meta/re=
cipes-support/boost-asio/boost-asio_1.90.0.bb
new file mode 100644
index 0000000000..ea534ff172
--- /dev/null
+++ b/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Boost.Asio shared library shim"
+DESCRIPTION =3D "Builds libboost_asio as a shared library from boost/asio/=
impl/src.hpp"
+HOMEPAGE =3D "https://www.boost.org/doc/libs/1_90_0/doc/html/boost_asio.ht=
ml"
+
+# Reuse Boost source and licensing metadata from openembedded-core.
+require recipes-support/boost/boost-${PV}.inc
+
+SRC_URI +=3D " file://boost_asio.cpp"
+
+DEPENDS =3D "boost"
+
+do_compile() {
+	${CXX} ${CPPFLAGS} ${CXXFLAGS} \
+		-std=3Dc++23 \
+		-DBOOST_ASIO_DYN_LINK=3D1 \
+		-fPIC \
+		-shared \
+		-Wl,-soname,libboost_asio.so.1 \
+		${UNPACKDIR}/boost_asio.cpp \
+		${LDFLAGS} \
+		-o ${B}/libboost_asio.so.${PV}
+}
+
+do_install() {
+	install -d ${D}${libdir}
+	install -m 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/
+	ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so.1
+	ln -sf libboost_asio.so.1 ${D}${libdir}/libboost_asio.so
+}
+
+FILES:${PN} +=3D "${libdir}/libboost_asio.so.*"
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-support/boost-asio/files/boost_asio.cpp b/meta/re=
cipes-support/boost-asio/files/boost_asio.cpp
new file mode 100644
index 0000000000..bf00c8ff26
--- /dev/null
+++ b/meta/recipes-support/boost-asio/files/boost_asio.cpp
@@ -0,0 +1 @@
+#include <boost/asio/impl/src.hpp>
--=20
2.43.0


