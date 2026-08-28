Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C442C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 11:53:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4610.1787918016036995105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 04:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oRoJ7p3e;
 spf=pass (domain: axis.com, ip: 52.101.72.69, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOQLk+1JGLXGWOPVxGiouI/UO8W43gJqv/BhKnLaape/n4q9A1JMJUfLHUSMKMKt2N4QrVD+R3BH2fpA0IWytjuZJu9luH7kJWGO+2gSjjv5PWhu3xEiqc9iJasK3ZFQrWjRPBWRBJvAN0yUZWnCF892FzQdxMp8hChJALag7oyc/GBeRxyfsxk+UWWsZH+51x6kOPIzqqVMyqjvHFeUoum/CbG6rT9wBZW5f7LL+1mvkp7hm2BugrKB7h0uTvc5wv8qK293J6FzrpkzRjKeQicSwp6EgYA48bsmT1YYwigJi4ONx3/wvuyaLsMgHoB4bRefXkEv/7laSa+ACNWkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+1lf3QsB8xd0nNOW1bCENSwGjZQU2+YRpyIxATC2dg=;
 b=J4gRmkNuOlFUVVCXvc7VytYg8k2LoDqYSvH9W+oqyDytxEAZaaLA3vctNeZONmB7+KeOSnCJVx3Munbb7V2ZHHQkocQowW7GGXaDBNTkkBxBu6zQKbS84kI9iu+mgSjJb3O3rHC4TePuSego8IQE2gKzLezqYclzFNB/E5QwMdSlMr6Igw+GGyEbqltbVfloKe6PYRiY2r4zRAX+LNC9SXctI/NfhRSt3SFGVy8wpG/GCTeUEeoX2VXFJ61f/ODjYqkUJ0kfPUmCdKAoEMG5XZmabxMl/ZP9gHrWBY3UkjGJDfi1fye5K/3L7b/muaaJczxKMFJ0fhwHQJudCK/0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+1lf3QsB8xd0nNOW1bCENSwGjZQU2+YRpyIxATC2dg=;
 b=oRoJ7p3e9NFlKGu2FvDp8dgqTEoFOGSGBC0LcZGFBSz8L1H38roZeduI9I8OUAXioD4HF/Sf3Vp5inIG+zT9WoyrRoSupLcRjLOZAK0xgTYqVUedqRT8RYfhqGgvJIi59SrnOmogjcjZSYaqYik38RX0wAlT6lPxXqTivg929HU=
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by PR3PR02MB6092.eurprd02.prod.outlook.com
 (2603:10a6:102:67::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 11:53:27 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::1c) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 11:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 11:53:27 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 28 Aug
 2026 13:53:27 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 28 Aug 2026 13:53:27 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 325BE2BC;
	Fri, 28 Aug 2026 13:53:27 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id 2E07C4A819C0; Fri, 28 Aug 2026 13:53:27 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv3 141/141] boost-asio: Add recipe
Date: Fri, 28 Aug 2026 13:53:22 +0200
Message-ID: <20260828115322.936850-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C3:EE_|PR3PR02MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0f4907-0141-4de7-a827-08df04faf910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	gdlfByEy0uP3TlzuAifm6YUKccM14eS/NkD0SLB/hrTpnvv+BEaAfBY/zbQfq+4suBHjH5vDKSuXBf5Ce+d371C0PZi2rRFNRx3PbkykNhVrZgVp0ER+EMqqExfwOLJkWJmtriWG9aKmyHXs7HcVlVUwf1Y8RY/Tpl9vE6J12seDui+z2h2eK6/JJzmULBHFOuPlvsyxBDTWicuIo/O5daZyiRrlAdcx+t6rftmUFbfTlbV2Te/BhpQwEg9uAn5OPyhNuuED4F3oDcBOLt0VSFB4vW2Hu/mVeaUbrb3+4GmO1aFtHKJUCJf3A5h606ZxwGXwXRYGeojUr87wN8qiiO3g/5+4XtYF/ZkdU/00QGxim9To2BvxLUvJOk3oda4gnODj6BWVt9W1PgmPFNH3x8GSXD5KPwmqmHvsTqA7X/3rVDJu+x4NteaVap/Jq7dENBwVGx4FX+GK0Rm9R1GgSZGqNTqK1mnrwSnbil2gDbvTktM3NfFBTKh39GtnLky1daL2BZYtLLcnQuTPnGehaxJjt7Y1OpGHaGBo+1eRgje81N4wUAXmMRTYWIG8v043dUjzX2SRNYuW77yrycdHCJ5w3Cfphvt4K20tYdQ2U1SKKqPg4gUjzZ/67CvhPWlacgCmPso8h/1GVYpkF+nifZfkL2iRIomBhpugLvGmCeleU0IE+2x+pepieyfC9sRU4eVPc/sLcBWeTgnMdWKxtQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Tqvjy8KmnZeciG7rrc2c5sO4Vrg8Z/Ymn91FQHPyf1roE1jkehbrrpHXK6HOK5KBItqvuxw2Xt32XrjUjxPjNu8nn3thFR/tAl288P9Wa6of02hyqcTuKFCe7zxZ8SK7xKnEokhk1MfELvR1kPpU9T6k+2vQI0pNuL75+BIb4IR/Mnz/GBPH09Zcrp+1Ls5XA55JaHo/5US8aU8a7KqQbKy0dKFNblqR/u7a9Tte5sGNxaQoMLvo6pxPEPbwI/KpNoBdxwyLVcEbgO149bSe7Us8YYK9mt31Vy/KXxVGHFWG9VPWvSpFVtJHsCaPH2Rvtb38nTMPNkMV+/9ysJ7vCZ37n77hZVjShtIBSl3+bJuvF8DDKz+FGQ5HzNNamtd2f/bPmt/lOlKO7L7rrav8XByl8ZSZf4TcW7AXwaF/hDii6NGxmJbjI3nLdqwdOcEO
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:53:27.6359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0f4907-0141-4de7-a827-08df04faf910
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 11:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244535

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 .../boost/boost-asio/boost_asio.cpp           |  1 +
 .../boost/boost-asio_1.90.0.bb                | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
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
index 0000000000..9630d99e42
--- /dev/null
+++ b/meta/recipes-support/boost/boost-asio_1.90.0.bb
@@ -0,0 +1,31 @@
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
+	ln -sf libboost_asio.so.${@oe.utils.trim_version("${PV}", 1)} ${D}${libdi=
r}/libboost_asio.so
+}
+
+BBCLASSEXTEND =3D "native"
--=20
2.43.0


