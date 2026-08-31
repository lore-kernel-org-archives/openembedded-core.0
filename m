Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C980C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:09:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25042.1788163772532423591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 01:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dcsx2fLq;
 spf=pass (domain: axis.com, ip: 40.107.159.9, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRTCRMnrKW/P7+fQ8e8ohbYqw4oLrwVbEEUU7WqXJYnuaYyJn65dHXtQ7+iDPwmMGvG629sqr88HoaTf32XIIwG04yeNw0MTVyGxU1oHZZyRQCp3COkLDDLSuiWKlrNmx1E4ucRCod+WewZR+57uBfNqn6+kNaon/87+iDJ2HxACKUloM4AZt6MMVGL2CJ/xP8aaeUNSJdoP53K6Wvo8BIyvFCgRTLiYEJasAe/ewnAR2xMb8U4TUzh/3JoYVJ5yd/hzfbRwWO0Ud8KKhiHraLqHFD1bwuCmZN0vlzUSy4uhX4i/aGmc1g8AKnFUP+s7h3SREO02FOMXx+0c2Ztupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+1lf3QsB8xd0nNOW1bCENSwGjZQU2+YRpyIxATC2dg=;
 b=Xv3Nh3sG3zN1jpl1t7ZpFHTTEHMIM1DPm8Q/ywQ6M0kxsmVIWofuyLweqjlnpHaE9P57VpUn+Xx/l3H+0ssDHwano9L+wZ0VsSfytp7DruO+kVooUR3a6cAl/TalXC5vt+DLz1CG06l5HchKDO8vpkYfs151LZxfWmmcamw3xkkWYFz+scinm2DFxTVoeaf14LiQ6Fds7KVlNYw1OtDCPeYMH1OUr/hs6ZtoWINfH7ytzoyVDedXxye7YMoF3WvlI/cbp69iET7/ZRiJki2Ma0I/ioqUi0r/XLKDvlR2WuJxrUThsjGD7WwSMRzHyDIIYBHCJ38iypSFaUhV12UEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+1lf3QsB8xd0nNOW1bCENSwGjZQU2+YRpyIxATC2dg=;
 b=dcsx2fLqvJb4y+RcZXlclrnaD2HoJrauZ3oT8ZsR/3zF/fHtJxzkRFaF9cADU/r/rOIJGzadNR5BgcTPL300AH+k7Ry47D8Hl2eWe5SthhOIfXc3+skKI94M0/abx/PoUHf5ZiBhleo1jPjSvdlUG9R4CpoCbV6Tth9vFtgwERY=
Received: from AS4PR09CA0016.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::8)
 by VI0PR02MB10571.eurprd02.prod.outlook.com (2603:10a6:800:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:09:24 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::33) by AS4PR09CA0016.outlook.office365.com
 (2603:10a6:20b:5d4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 08:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:09:23 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 31 Aug
 2026 10:09:22 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 31 Aug
 2026 10:09:22 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 31 Aug 2026 10:09:22 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B4769690;
	Mon, 31 Aug 2026 10:09:22 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id AF6C14A819C0; Mon, 31 Aug 2026 10:09:22 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv3 141/141] boost-asio: Add recipe
Date: Mon, 31 Aug 2026 10:09:21 +0200
Message-ID: <20260831080921.2703254-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|VI0PR02MB10571:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d9687f-ae0a-47c8-10e6-08df07372acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	kXXxExGSQhQ3LIn82yEg/DSsIOoGnj+phbeNxY6MAfBuVG6zqFbH8T7vkIJHcKDVu1YzfxfPxVGcB00pokH/QGvarXE/pruzo8HnZgHlqSYrJhQSy/79HSsX7LSgkvPggqiTW6WLkG86cjzDK4zQ/JYfssmtyD0voVuM/y2p0lciJhjQzyv4htNC/n1ZOY6GvQm1zpyh9Zo4aCwU8N2kEM9fgdvB/d6LiJi8DDPiVv77NoB0yMzsSkuVXQeZZNpQkwxDxxh5d/bIU88SW6rkcioKqe1uHEpq0/ieadRQgnas+s3i1YnHlKFVn05ezEkozi/Dw9zTdDsxD9ZQ+ClLuhAsfrpenjLKETPpAWLMgHSrYqF5dsVlWvFUkCQzrVGr2GJ1xqLAt4RpbZ//ZJreRQvzW9wj4xfCLP2yQgHP/gunqMk7a219JM7L6Hr50gLpMdBKABr3hZ4HvamhvWf5fDt2NKRFW7OHonZh5eORvO3qM7RW+HrytXpf6E68a3B7LITyzA7Berak0MbmV/+S9Ownf1h0dU1kzScZCm9WnRcQCAOtE3jdeDL6f33P9Iu6YrV6t6RCdyDnW7VepQ9b9qT0Gp6grwr/zCiVnIwcAuc80pBk5+9ALASvLfgAVCq44oiQx6ExmMb3utMEmRl64GsD8GPq3B2sDLIhgvwoq+21yzC6loF5cEWpiBR06TmYG+7ZYjW5Fke4C0Cz3R6Nlw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6uxmlzbdqHsm7pStvZVqOSuYAfdqOKr8CBoPeu3KfyLfF23JESLbDJAqzBx3fY28fPCs3ALIFpbnLNgG9/YzuKcciv61PX+dNB2JEsgah5AxMOMdpD4yqX1H99rT6dDhCQQxX+VahChqmx6QK1OvLuwxYgsLB0VGj62uo5NGtJieSWFvJwsX44qVso+xjLeLcU3lkigCS3rR7xngEcZ7HCKdm3w4l8UqX+SBQCk+lnJCAH/XApNIVZFBUNle4rBQW5OQcHNftNmNHzzAEXQvxG7MaoPdOO6q5y9aHRVH9/OWpf6xKOJgfYdJDEkdjheOwOFoK8NNyMu3Be62TYQRZrLAVp8840tXqW2e9lIWIW63qWFnWzKJpNeYbXUjptXDU20gU3Qv9T6u96BuZ9gPG3ni2IGzHSmAYjfVd2lweTU531BI2CDFvW/B3cSVlUqb
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:09:23.2138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d9687f-ae0a-47c8-10e6-08df07372acc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 08:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244736

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


