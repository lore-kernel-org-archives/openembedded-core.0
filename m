Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79835C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:28:31 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2384.1787909302032972127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 02:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QC18twCD;
 spf=pass (domain: axis.com, ip: 40.107.130.4, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQcF3z+H4rkxX4UkztgxA8ktR/CdgRjxNcn9xMTqCzqxiY82HwBbo5w2RVcRQMwoVo0H6ceqirBzoCPhJw+HiWb/UqdDzkRzucA8hS3BDpvk52heElH+cEhyeRXWSCsqCf28awhRa6w3ei2x4ui52yMITXsd7Tc430FzSGxCG5Yc5Hu1SyRVm0VGcdxmmXSYH/HazoquqJpmDOovuWCexkgcGA6OtZAOw7QdWBeWW+HLSQYvE4bvUp4Fm1p0x6nuZCX2J2VL9B945xYaohizCGH/uAyaRSEVGTOBYi3V9lKfvVzd+5fC54bGkt+RizRzkHu4HlrjgcUhQubcg+tUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rd3SRehEqhFOn+YD/0VHo+JasvworAm6aY9HizUnvM=;
 b=yi0Lk6nSEK+cJwMS1PCFNLrSOXsQ6V2tu44Ec3MrbPBCZeNQZvN45DbgZyHPcI74VLBiHLszfux7F4YdLbW3Obm33JsI5+JR0nKzOmK83m0vE4mRntAfhdpYK8L8lD8lQkYU5K/kCzqaXOH9qkNifpjvefjyRqN6BLwS1DwSc906cycDj8Q/zaY9ouLR7IENB9+Qz7CXP1kxW8+Xz5axotoIS337LfMPlDaemVu4BGgNEdl9uwU6fthWWr346EaFDNKomkC67OvLV7HGDwLzfHi/W2bKJ54/tERutt5l8edsKm1LT9sDq+wUHVYmtub6LgYPllrxXH/axE+R2KQSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rd3SRehEqhFOn+YD/0VHo+JasvworAm6aY9HizUnvM=;
 b=QC18twCDdnnavq9Rh5coA2YiXg+3nMobMdfXHLhQHOmtgs222T5mr2pdgCRB8ASoBOJPLmBg8lSmh8NBAjrLNKdOnVwo2LelPb6DyGl0/tbH9mpY9qp10J5helIXV9h1pICue986XIvqnT0mp5VHoJQRzq6zChmJbAIUL5/Z6jw=
Received: from AM0P309CA0008.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::8)
 by DB8PR02MB5849.eurprd02.prod.outlook.com (2603:10a6:10:f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 09:28:16 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::78) by AM0P309CA0008.outlook.office365.com
 (2603:10a6:20b:28f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Fri, 28
 Aug 2026 09:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 09:28:16 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 28 Aug
 2026 11:28:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 28 Aug 2026 11:28:15 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AC7F7A74;
	Fri, 28 Aug 2026 11:28:15 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id A6EB74A81A07; Fri, 28 Aug 2026 11:28:15 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv2 141/141] boost-asio: Add recipe
Date: Fri, 28 Aug 2026 11:28:14 +0200
Message-ID: <20260828092814.834719-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|DB8PR02MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 371f5a8d-874e-420b-5747-08df04e6b091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EYHhrgmlttMvNhQd+Kmhwmzd6MhCAay6ntWeB28kzGRLpwGBJLK4YZ/fXuZIv+e7YZjTjWzwyIxi9mdwCphSBTGlXYJt8lttU+E8pthsvhPSik6eX8uo3pRLjkSOtgUk73IHeQJDgDRGRnuLMKVrNLALuxpU784RdsmkHfNQN7TdSt4ex7d/A6U6Y4bVMyTcAJk2QbapW/NF0WjPpofFQXfXZqwCTZ6YPorrFOSjWC+87+9gK8Op12J7Wl+GQUJR6S2jsWZrEazqzUtaHD/9IM3QX+cSI1wqVWoaHBnPhMPa6DtEXhl7FAjgW/5A2Z0kX0dsbBPBWZmqzgorLidEV4miu+jxsb6LC1hCPGLAvRw9rwbPq2TITJD101X4wx1Tvjdn+WALGeVqMwYv3LUjPip9I8zI1DGTA++PR3reDFiA7W9BGRVp1grPpJwSk1vRTKMPP4BEmM011VLITGsDwaHzwOVitpDl6o8PRuxm05+jgoi/6CtQLT8IlhButVS60eaqumYSlnbPL+pKO/cMSgQJ7th3WHhniKMGJyzkd6Dr4+hHUGs/yfJ65M07r/ok/A411jabt3R99mm/wH17k5AnoJ/lN6jax90HAuJz8NgFEbE1/3Ct8sGma9ZqKuDUacsaLkGnLeQ4krd/G4bNE9FRtRV39kuelEPWd4PrvhibiMUDrT6n71NjGyRV0SiXbNHQpV2MQlVQPTteQd3AIg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U7lZKKVWq3gWPwn4TmlXLBks/j3nA8KOwC0v7KUvXfFuYRKcVJxZSmtewWCk5d33kKkKLB+OYEF2/f3dM1v/bR6hTBCny++WSao15xVqtJxv0RBBBfB6UNs0mBoMXIDOpoRAaJE8gTGKAYzbLUQzoWGu2Wy6E41pk9nbhgjrmAs5lZ19JahmRfH+ImqJeD51KieON8w8IvOrMvExUH8hEQt35a0JfUCN6sWXq+hMyObv2vYUtKAW01Hcexwt1fPOPNgkHa/QWE2WzA7fJoJII+PvmKur5IPYE+DA0SFGs/Glp2rJtd0n5BwVu2Ry6Kk5+UtTFmtJQCRxDntRai/vHc44XHgfFCeLfWaSSWf3Gif8o/3yWdZRD7gTdqaCuDGiKcmxgsjgXS1j3JEZMum8HR1G30vleVWDBX8FXYfZyhgm6Qf4tBbk1R7e+Cjvtwqc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:28:16.0799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371f5a8d-874e-420b-5747-08df04e6b091
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244527

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 .../boost/boost-asio/boost_asio.cpp           |  1 +
 .../boost/boost-asio_1.90.0.bb                | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost-asio/boost_asio.cpp
 create mode 100644 meta/recipes-support/boost/boost-asio_1.90.0.bb

diff --git a/meta/recipes-support/boost/boost-asio/boost_asio.cpp b/meta/re=
cipes-support/boost/boost-asio/boost_asio.cpp
new file mode 100644
index 0000000000..bf00c8ff26
--- /dev/null
+++ b/meta/recipes-support/boost/boost-asio/boost_asio.cpp
@@ -0,0 +1 @@
+#include <boost/asio/impl/src.hpp>
diff --git a/meta/recipes-support/boost/boost-asio_1.90.0.bb b/meta/recipes=
-support/boost/boost-asio_1.90.0.bb
new file mode 100644
index 0000000000..ea534ff172
--- /dev/null
+++ b/meta/recipes-support/boost/boost-asio_1.90.0.bb
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
--=20
2.43.0


