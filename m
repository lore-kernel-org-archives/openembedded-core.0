Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40613C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25044.1788163800828839453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 01:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=DFYeLPlL;
 spf=pass (domain: axis.com, ip: 52.101.83.41, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JimfV7HumI2XXvRKS74tHX3iEiuLY7bAqiSK2jrgBtHRJfPEh35zSrc/RA8K7Twyjxwk/TnibUj50mSy80GiT+JAdWEiLDkK4hL6JFnVY2JLurbqamvsNdN5OeI08lPbaM/3vUqk+ZFtNl0ffOtKSaycl1tuwaXAQh83KLcnMVQmx24WSPYVyksenLZSUtcndWQagSOQeaza0qk19fIGrEWITT513d2wTKBjeaHPU6uB8I2737yK1tRxu0BxoElro9KjwL7RBPHuBIsTXsxKi8QE5WwGygkNULuOOR4pn+Tm80KFeTDuDUOwBM20OO48I0jvh2f8rj1kxiNwqFd8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQPbcf4hUNFQ/QotEKgw0qaHf5POuDjFodOWEhL1aj8=;
 b=oFH/sPOKXlcJ/5ioTiBGhLgU1BobmeSAfsnn2gy6zU1OdSQ7ixO/eA9fnT/TPgEkjiTtwQRlcb7ZQ4uBUBBBrx1n9jEF1ZVa5OpBGTq3YtOcOhC7bC3h7Qp50wsmx7NXfr8C7WYkgZmQoR2e2+O4IJOwMIWk8Szchoq4e2ZtS+hh/g/Ba7+GYEGE28zWXTE2qFHFqHsBBCtex8D4sFTXruzYnxZ7Affk3V5yNiyp8nHkkwP0pfuesNB+TmYPk/AW9swW8GOl7fUYcJs8vEv3O5V8KncdeNe316wdtFuJRJhVXDelKwUrlnS43BnZNKPsPotT+D+Sh6Eihh3IKB2Ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQPbcf4hUNFQ/QotEKgw0qaHf5POuDjFodOWEhL1aj8=;
 b=DFYeLPlLbXehEXkAnVvGE2INhwxlvlHFlb5nqgaEQZmu9Ai9/qVgNRUVo5BVi5lUmDPfb/Z5j2sJUgSWFk012L3KIxwxJ4hj0bDmpqh36qOG/162So+NNrGuxi+7U1OJH51dNxmAcbMKWTKF8gJgxka5GiHdRFVU0r/dVO0nNrw=
Received: from AS4PR09CA0002.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::9)
 by PA4PR02MB6637.eurprd02.prod.outlook.com (2603:10a6:102:fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:09:55 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::2d) by AS4PR09CA0002.outlook.office365.com
 (2603:10a6:20b:5e0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 08:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:09:54 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 31 Aug
 2026 10:09:54 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 31 Aug 2026 10:09:54 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 628261231;
	Mon, 31 Aug 2026 10:09:54 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id 61BCC4A819C0; Mon, 31 Aug 2026 10:09:54 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv4] boost-asio: Add recipe
Date: Mon, 31 Aug 2026 10:09:52 +0200
Message-ID: <20260831080952.2703441-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|PA4PR02MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 94361047-9523-4e9a-8ed8-08df07373d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|13003099007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	euOSzrvjdg7G/IQnBqlqrxvb0RVwe9HOIDXaqXAGARBxEorkJKjhzOW5Ll/dBubCrvHwa6Uc1DfIOdSU2ZjWMc0nxKmzaxLsYiGRD+9Jr2R8cxD8FoH62pXjW0Z6tLRkPdKns0CiC9fngb48jEVhCCRJFvyDC/rEHYMJCJCz2bszxWzHLAdT5vCyhXCA6FPXheVD6QSjp/yIuWbwx6n1/sKijc7kfu9Ac2MQxzY0V+OA+XXbgVrbsELsfYjrvf2AuRMYfxGFZaqvfmg9UY9CU0EaFQWe41TEgtyxNnAhTqOIy2UIdcuXsCzLgxLoQKScYCVBfciE/vsF1NsezZy4M9TuJqDxL9U/gAMQS6lWQJo2gUupO+ptsFeX37olTbfR4HrcOFXFMCGt4BfGmU1g0NZNAYtGJiUJsCRqRipYkKOVd9ySH+3b39zrKi3eV8LgQBO8Ea5vXcFCs+QvuiNg1hDZJ9E1ON5FUjjLla1e3cGdgCcM5Gc/letjA4Sc4H0KAuxry+/lsgmZm7Z9517ebGLdws8vwk4+fxZ09KPI+CvV6iDSqTVW5m2QiUl0Pb5lzPpo9eBK5BgJHWcjyGOTr8SUpMUDspOHMQgp33a9JA8imf6i6ALSQDERv7YnWot6GI8f5MgY76MwbkmFxARLQx0GOP8zniUivIkBwS9fbk4R6Tv2inArY1Hgy8EOy5/vq6NtIspDv2UJ8SxJoGrE4Q==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(13003099007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZZ/StXbvl7MhTmklT2BE1qIkDz1q1qgE0Nzhx1224/tEB6g2r2u6oLrSiSvEBqOARSF2UYXbTUbCAGwdeJz+ZQFpth4VGlCMIkd/R3eX0IU37aiY/qp5Z1YEhXI3YhmoTsn9uEpttdSyW7+vE8T9MSbt1Bm9Qictnoba8UDRYrJ0+Jj/dzyXsmgqe+Pb9g/WVH0Tr5MdTl+MElH9CGv8wWma9u9i2oSD/p3OsobcUzcmnJgHgmitl3pdvbScOWIuGnoi8YiW7WxkiQWiRW0r0k49RH9noM4gyPF69YzPzFjrUAebrEDWXvmFZH4eDg1ylGl6xP3jvgyKXiJlEaJrShyoGRXdwbfcm855l1Mu+au5QlBSY+45Xx8kFgRzO7oxz05grnNbk58/yPnDSsnjhpmE154yuB26u564u89L49RpEdAWDVG15sFy1BunVBHN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:09:54.7409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94361047-9523-4e9a-8ed8-08df07373d96
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 08:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244737

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
index 0000000000..a71e647303
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
+SRC_URI +=3D " file://boost_asio.cpp"
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
+		${UNPACKDIR}/boost_asio.cpp \
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

Fix review comments: extract major version into a variable and upgrade boos=
t version to 1.92.0.

