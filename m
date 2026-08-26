Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A323DC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:41 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8286.1787734958575823871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ebsAQU2x;
 spf=pass (domain: axis.com, ip: 52.101.72.40, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0F9nhk2xGsnEK8xgb81qBDdFwip3kxKWrgha+dsqRgl6+AcRBIligd/CEzW5Eni0wZFtF+fgxhaBqze7LUuhq7KSC2OktLVxUNUO4fgFBi6HGZYGHPLBzx6SWPca2zBszMkoGtE3S2EHlwDNq8MnksxvzAQnYZMYza6NkScrUskv/tkxznMTBC7bt0SBmAA7fWD9F0W+Nrzj0G52cyi98tp7bRNvaxK45O7ZRwf8OAFnUlD0wiOLVQR2fApTpqnKhbT8uhX47KQ3tIBBp0WWkCC4xyAxQvXKw1zqgEcNPcUFXZh+xQmanNr3KJoLYNQyYNKam53Ighe7ZRatjgj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osiJgDrrO4ki+Tb8/14ezPCoC+Cz7d3/QLLn7Txr/Mo=;
 b=VfREyB1AjCqE0S4aoAy20gLI7dDa2++rT1CSAFRYm7TwNaDy1VKQS5wWJlLQ5hyfu/xvLZUNHZYoyolf3qBc5RmihM6ctoQYhFT8s3cdYyP8lzzv1tFctlnLLJjn2vPq6HExC0nS4k4T0msBBQ7fVIh+FL8CeARAsgmpnS2/npKb4tThpzf7adUMt3Mx97ZKpko1XSYc+yvbRrCQtnMfkxafPl5bdWhDdkda869tnRbapObg2NhDYzVztXQc2Esy3sDVJw+B9tHiE3JZeOQgKi4hDeDsBTlc+OdhfXJOvxzwV857pyEDHobamh4ArNPQr/Qb8IgNHT1eGA8EzwhtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osiJgDrrO4ki+Tb8/14ezPCoC+Cz7d3/QLLn7Txr/Mo=;
 b=ebsAQU2xbn9RNdeMVqsUGIPDrMkGaJlYrbPX0idfB6tApTLXhqayAIgNWBIB3nQqbXzXj1kZlZE3jKcOflMwxw9aoaqW0EnjFA4dJROj6C2EAOhziZV4Stf/S3GjCR3U0L6BvMwqsA+qZn////aJx0hg7/mo3x81cEfYLNiTjhw=
Received: from AS4P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::14)
 by VI1PR02MB5855.eurprd02.prod.outlook.com (2603:10a6:803:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 09:02:33 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::a5) by AS4P189CA0010.outlook.office365.com
 (2603:10a6:20b:5d7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Wed, 26
 Aug 2026 09:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 09:02:32 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 26 Aug
 2026 11:02:32 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 26 Aug 2026 11:02:32 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F1E804AD;
	Wed, 26 Aug 2026 11:02:31 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id EDD164A819C4; Wed, 26 Aug 2026 11:02:31 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCH 141/141] boost-asio: Add recipe
Date: Wed, 26 Aug 2026 11:02:27 +0200
Message-ID: <20260826090227.277102-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|VI1PR02MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f08f365-ba14-4ba6-5ff7-08df0350c396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eWZJBRNPuO4ckUe+ziZrm9RSsPKyZHJDrd7wPvieZLOAMOy5JGFYQAPgnlWXa7Lv55suFAKVhDTwnGd8f0lraxRpDNHSR8ZS7KzfCQKYMBnIQYLuZE6DiKUGbWwBN2/5FvRtfhDeMbm9VEj5IECHWPYcJLTtzqXQb9c6TLzuXNjmpElqUfo55C5iSaS355fwH25AgIbquyfWkVajN5qwEQW1bY5NdgcnnBqJWdCjuemf8/esh4sSdmtBYJFUdMSWiTCLKqD66oVOJx8Vcy27VlAr8sOmvifExuGFm7dUd0T8m2TyIMCkLbZOM2Devy9GEHoAQZtA150VRV0fmBU4WNmNkP+v+3ICOry7nrHx75R/ihpynhQb6wNd4Tnwmm1QFoBZotlBplqSa4ug+brfVEZIZ8HfMWcJuQize0/gT5CON3uWVaW3ZCAKHRvyU7vUHPrdOrlw5c/Vyugp0c3rQM1k4JapsiEnauxr54ua4ZjxWHDAFLget/v7jHSpwNIGVIwbMkvSPAWatqTJBtFw3r24tTMvl0M2I2om7QGV1dQe34Jb1OJRC/cJ9bx5H5O1xWjfJJVmOKECv8kD2fbNY3HPyL4Egy6W8924SkDX/hcv1U9VLIbdYeKREazKYvIAeP6n7H12QkYglXaM31ETOHDgoXEWDlCT2U/0mXKFI+RAQRI4iqL6iIMmcCG7Tb9EXl3Z0XG7wwA45GMvApEYkw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GeUlYMqwCTirHRTF0NoQiU1Gn79jA1WpgbFF287QyzDfKfOMgHRjw5Ly9XrKxaNEwefurIyNHqnGoGwWigADEsx2tkcPwkF5YSBVuaE96AFnbLYcl70wmgtYLQTxgGmMEvVZXGoZRquCcsi0auhRolfkEvfocIa4Va3rAmBxYUF+0MjoewLrSV5RbaXBJw0LEOrGKChNYOeIhVgmrmQH89EzuqNLvZ1BmwmglUslni9uJ4sscg5u793wpkBshD9duEzRFFvu8MvmSfaZ+5cl7s1KMGdkETfQmKt81cPDsalqMTrtT6TiNiQz6ry5bHyy6+4oz9BTvTOTLWS9hZELp2UuCywk5W856wtUIkqF4LzHAuZ/LpAO0R17ZY+Rf9NYMg/VSc7CxjTxZgVE1M8jMAvrpkUgertUCN5BCly4h5ytFeh7TaG8nsy1V4EKVeoS
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:02:32.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f08f365-ba14-4ba6-5ff7-08df0350c396
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244387

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Change-Id: I3ac5ed0ccadae3e9d042b9c4eed3a1ab7220a009
Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 .../boost-asio/boost-asio_1.90.0.bb           | 33 +++++++++++++++++++
 .../boost-asio/files/boost_asio.cpp           |  2 ++
 2 files changed, 35 insertions(+)
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
index 0000000000..b10a8f3997
--- /dev/null
+++ b/meta/recipes-support/boost-asio/files/boost_asio.cpp
@@ -0,0 +1,2 @@
+#include <boost/asio/impl/src.hpp>
+#include <boost/asio/ssl/impl/src.hpp>
--=20
2.43.0


