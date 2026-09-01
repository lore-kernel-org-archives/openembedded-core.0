Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B84CC624CF
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:32:06 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3205.1788251524875871526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Okb+FbYs;
 spf=pass (domain: axis.com, ip: 52.101.70.65, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4hHh2CXCNIgSzDR8VaOcJkyj1Rtis4xufsUzT6KulJ0JmfX52cF2KrVKfOibu+hNP3HxmFVwFuKgi2hRg/Skj8KYLjbyBVTNhdY8kvtZH8O4Acj5Dd1O0V+vhekL5+Zlcp/aIElK9VITkw25OD+ymy9WjJON2rDxeGJTIBxcJGFr9UxwmTz6dOL5RshZFUk/kxqR7JQO4ZRafpCCjA1k+0fHZZqDWuoOuYTWkvJvl2mvsLpEHVkHXx0CAczsIcPvYpfpbhaS/3iswvtj7jivL+nDTdCg9m5iEw5Yk6Cvo+eUU5dM4xIXUo6mBuqV+NY+reSEwTMbUpVi1Xij+2m8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kENhkUuH12hnhgENHD87CzP29IDJvhaeCdbRgYSuywQ=;
 b=owWuztYqIOjeUTUmrpghemYaYS1HfXSg0ml9REdgf1GZE1yFt0BUH1E1mZSiuS3Ovtd685cuayAe6YyvJN6TDbGC+v0zZc2B5Ns14Pr7O9DQmMxwrsvTxU1OAQEH1Er1dkrhtB2GKCd1V3CH0oMk0cZBsTTFW3LJotH+IE+LbpQJW67K2ZHZalx6zlKFuz9I56mViDiD52P7xkZQWUukwFkHBChYVCx0xWykaVRZtsBGeJrWxy9leJO1KttbQC6ljJTEXQv4FoESPrdezg8SD9P6RZ9VGacPMUAl+dyUu6/7Rr+0CM2PVaB5NEDwGwITa3pariQs2dGHBZEGpFapiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kENhkUuH12hnhgENHD87CzP29IDJvhaeCdbRgYSuywQ=;
 b=Okb+FbYsA7xRwpfLWvHOqwJG7r+xqyW0CrjBiwO53SB0jxXysvyaxgSQ0opG1ZWZbtJdKEGLj5+45WfgwMf6QUWertiZVGBtKPN5+jvBXqTsbafxx1JdOs/m7/Y8gmiDJuqtU75JmeHXnCjqgtFFjvWfE/Yz9VctZ+tEGKpsbJE=
Received: from AM0PR10CA0054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::34)
 by GV2PR02MB8895.eurprd02.prod.outlook.com (2603:10a6:150:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:31:59 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::5b) by AM0PR10CA0054.outlook.office365.com
 (2603:10a6:20b:150::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 08:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:31:58 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 1 Sep
 2026 10:31:58 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 1 Sep 2026 10:31:58 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 82CF3A64;
	Tue,  1 Sep 2026 10:31:58 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id 7DE034A819C0; Tue,  1 Sep 2026 10:31:58 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv5] boost-asio: Add recipe
Date: Tue, 1 Sep 2026 10:31:56 +0200
Message-ID: <20260901083157.3345681-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|GV2PR02MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: f8acd026-63ed-4cf7-c2e3-08df08037d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|10067099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	SnvphH8i4pXZLMtgJDlpop2V0o5PEldXerblzH86Zcp01qMxCfQp7EnyI+nhcJdQRr64n7jDHN5B8EZZJAKq6oBdO6FUgrd1G7MktpMMyX5MXlE9MNikMJS5mX3fZoe7VXkorafSl3p948oOOpnPb3FrIj81haj2MIRYeA65aqMd6R3fhpSGm6anBc4y7etEh6BXBXFfERZYsGnrX0TpnyybmIQBWG98ROSrGEw9EETCVPlWH9vaZRiI7IqsEk4YFQkhVxRHZhZtfD7MJsnZgke17YdI7GeUzwVWmow1Gq8jpvl70jjuPNGvA19drlU/CFM67AgSJTWkvYHC9IHGLyv1BdqUHEmHT7Md6Op5EPZ6bunZUpyZP9JJJOYnry4DwGVCVvUdzc8KTV/VhOYE2yg5QCOFcQhWPxXxQ5Fm/uqfa73N7Pdvmfox4J5N6F07bkiPW5g4Sg0F/lm0hN33ruKEMK3Vy7Br3wH9Cwcofwg4uSQbL6wARP9MB7ADWB0147c1C4evMneUK8cEYUU/DV0KIDnwhX4Y/5Vvv8pKZaHu+D6GtAjLjJ+yXI2INtyQzPh1wzXZ1YgkUsviyawZx9ECbuaKS69VJcHhDmwL8oYj/2x1hnzKaOhwJhfgYfrpyHeRzLeRVTP4sQlEMmnFB3au6+t56Zc1FoIw9l+kmvLik9G8l0tbTeY4PuyIlsd9nqyZ8G4JmD2+YpVadLeYSw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(10067099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M96jjprUzJFqqOOB9n/4Fk85+sTrD73rji3/gn6gwvU9r232d9u7lWhJkWgP2KujqwIGJMr9yzxs94nL2f3ZCzzMn0zi0cyetMIL1HwHo8PLqV0+ekNKjiKsoKei/QlTYVypzGCGnnuAC2EdesaGMcSWgn3P3w4s+/YsVcG/WBGHvko2LiCGtXSxOSsf/ZZSc5X4Tgp11QFjbyNkUSG7Ne8gdosAYx5hThFlQMMFi562lUc5GJq80Yav8ENakDifOXrI3afcUW2WpralZuSLJZgBS3UnkoUVPzgSD7bZ3mIkzX+J7zTg6qajdEBSClaiomF+6MZPdoz++u0iOYEqVH/mKSt/GlXZENfDm0274YGdJbWiD2vMdGgrlCLNOjYymoO3cSQ90yh6IxMQkbt9KCu9cs1imJcyHx4Ph8LD1v89z9sbygmc6PGvHy/oVWEO
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:31:58.8854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8acd026-63ed-4cf7-c2e3-08df08037d40
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244807

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 .../boost/boost-asio/boost_asio.cpp           |  1 +
 .../boost/boost-asio_1.92.0.bb                | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost-asio/boost_asio.cpp
 create mode 100644 meta/recipes-support/boost/boost-asio_1.92.0.bb

diff --git a/meta/recipes-support/boost/boost-asio/boost_asio.cpp b/meta/re=
cipes-support/boost/boost-asio/boost_asio.cpp
new file mode 100644
index 0000000000..bf00c8ff26
--- /dev/null
+++ b/meta/recipes-support/boost/boost-asio/boost_asio.cpp
@@ -0,0 +1 @@
+#include <boost/asio/impl/src.hpp>
diff --git a/meta/recipes-support/boost/boost-asio_1.92.0.bb b/meta/recipes=
-support/boost/boost-asio_1.92.0.bb
new file mode 100644
index 0000000000..e275a3b61b
--- /dev/null
+++ b/meta/recipes-support/boost/boost-asio_1.92.0.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Boost.Asio shared library shim"
+DESCRIPTION =3D "Builds libboost_asio as a shared library from boost/asio/=
impl/src.hpp"
+HOMEPAGE =3D "https://www.boost.org/doc/libs/1_90_0/doc/html/boost_asio.ht=
ml"
+
+DEPENDS =3D "boost"
+
+# Reuse Boost source and licensing metadata.
+require recipes-support/boost/boost-${PV}.inc
+
+SRC_URI +=3D " file://boost_asio.cpp;subdir=3D${BOOST_P}"
+
+MAJOR_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
+
+do_compile() {
+	${CXX} ${CPPFLAGS} ${CXXFLAGS} \
+		-std=3Dc++23 \
+		-DBOOST_ASIO_DYN_LINK=3D1 \
+		-fPIC \
+		-shared \
+		-Wl,-soname,libboost_asio.so.${MAJOR_VER} \
+		${S}/boost_asio.cpp \
+		${LDFLAGS} \
+		-o ${B}/libboost_asio.so.${PV}
+}
+
+do_install() {
+	install -d ${D}${libdir}
+	install -m 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/
+	ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so.${MAJOR_VER}
+	ln -sf libboost_asio.so.${MAJOR_VER} ${D}${libdir}/libboost_asio.so
+}
+
+BBCLASSEXTEND =3D "native"
--=20
2.43.0


