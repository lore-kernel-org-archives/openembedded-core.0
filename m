Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6C5C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 08:38:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7743.1788338306045018688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 01:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IZbtQju8;
 spf=pass (domain: axis.com, ip: 40.107.162.51, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8muuQor0XF1Q8EDh9Qk05liAyb0xlWAWHDh2AGoaUscg5R5DvZ0QdC5RghTNmp9PgfMPAFgktKrOQV4CW0CzWFgHHq/wzZDHmWU7mkUTOtGiWsFMdtC9tCetfhkgaeGPxUekF3FXxMiy+btMXO7t0fbfjbN9FLjeXlu0OTFmHYGrL9/C8Qg2D0F4Lk1wrkeOzohUfpR4Y8u3dT2IxLSKZc0PyEK6Vo52wNM/VX9ekpTlYuN3+gARE9ETr9jVAgVlUlvY3Li3OOwECBqia9kVtiAWfUyfwYYjdM7i5OT88TJEex1eP/LGKHJilYjudtZ4vdU8r6nxetTK1x/4VYkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn064P7VdLjedbZpgUPTBluO3jWqIfOHmOZBh1dEUhA=;
 b=PZpMF1eMdu6PWk3qewOK5bN4xYi8w6pAQ//ZYRcgKzaBTy0k/YbjmVncd8XaO4LD6bSSFdBif+u6a3npCmrVEjvfOejIEb3ZF2WI6I6VjvpBCtxuVYma4vocxa0+Ywnel6hY34Vcl9ITQp+nFyoLGqke7KvJuo44Yfw2l3uVo7blkzVqfxFk1yG8hpGWyl41vcF6WjzVBkSi/n8BF045lST6RYT4/GrQO4ot/jVgNKZpJ3ujgiU+UD+h8YtqmbyNQzI2SU/BLKQ/KuMXpT1r5yJ4Eg0u+cVDt1u17HzSF4QaXjjMoYrAnCD5FNXRFBvazl9G7OG0E7JyZnnvVlTzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn064P7VdLjedbZpgUPTBluO3jWqIfOHmOZBh1dEUhA=;
 b=IZbtQju8op10V7j5agZEF3Ix2Nm/Tbq2FAkGqXz6ObW8Jo1hUrA1FjdPgHEi6t2O9si2HsQuk1AJJ1tSDBMbe1DHtflOCnPCLS4cHGZnma+JxoxkkAoDFO8h9kntPszqWKXfV/sXWLR64SeY689glW77//3r70vnlPYU6RcdInE=
Received: from DB9PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:1da::14)
 by DB3PR0202MB9107.eurprd02.prod.outlook.com (2603:10a6:10:43d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:38:19 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::3c) by DB9PR05CA0009.outlook.office365.com
 (2603:10a6:10:1da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 08:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 08:38:19 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 2 Sep
 2026 10:38:18 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 2 Sep 2026 10:38:18 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id D4DAA73B;
	Wed,  2 Sep 2026 10:38:18 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id CD8334A82D1F; Wed,  2 Sep 2026 10:38:18 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv6] boost-asio: Add recipe
Date: Wed, 2 Sep 2026 10:38:14 +0200
Message-ID: <20260902083814.3966089-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|DB3PR0202MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4fe629-b3a7-4ed9-ae95-08df08cd8a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|11063799006|10067099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	tta5AO0AEuQ4V9rTuydEd+nlxwDqV3/Gm4N9VaEv/+vuqOZ8aTF/ikx+M26qZRFN9B9cRRop6YUPepOcbEdBgFsJs5iVj2nQLgNn1uxLS9bVyqO63gcsART+dc5DSJpbRvxd2JHfbzf7AVz3xONYH485UiUABQDv1BFSPC+UGEcidjQyUI2ZpO4shSHX02xHhdR1IKMhCeJILTtOPWAvHJuiYK59s49+hRkWShorVtQFYL9tB//qyp37K34M3f9+Wlac4PeYCxdH2rVq9Lxx1UHAcqvy9eVbXrhYubAZQdF1qj6XHJV2yuZxR1P7h+R8ntY8dbAjvgl8/8T1prbAXhX6WFie8jSFgcVLrMD8cuuNimPXqzr+zOsXSJkoFSmwlyBKi1xkLbPCNhDMQh0sFi1SZUU4HUETnmpfIfs/AIXU5ez5Qfxw9N00Bi42Vfh0D185CjXoXoECXG6EWhwzP4iLz7aOOWqrWd/5L67wpyB4oAzBRl0Cc0z1rgq/0WqHXmLW8Ci3MMS90dRZL0gWWMxI4DJQiY8X9TT7mY0xSUPaBo+sjFCtNRRSNa1M6oG1bgQHUKKauAwlstI8mbNoxc2KNUN7XwK0UtK+qW0P7oImmIHJVec0IkIFlGtnUOEZ0knX8AmjRtXxOKy+/V3NQH8Tm830hgL/W5N3FtWUBHFqapRkr3ql+ggu6dxaNADIVOzoU2TvAGTo0f+bFC9hpw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(10067099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	v9ar2WONhuVZ+7lt21ciYG71mwjk+3j27Qb8sUlA4+a6br+5ZiuZSUeXK4/HMmvtdOxtaXaUTl922imFe13erRnvp48OKXtoPeQO+K9lpX7kHDNtLSg1k83C+Le2b00qF/2zS/vWGZMJg5r87OmBHQI57/Td2p6uMXBJotEJTO6WTmVlqHnxezxSz92JxRVqYUo65KhBd2x2TRmsjOcFJVCVm065esfd+zFQ4i/8hcYruwZYIX9yDM9JE+wqnc5i/oCXavHkiJ82SjhXfsvw4v/XJ/UaI34HufmidxewibMaeIVNxClqlI7j5VyX3yGCE8P/Me+kaoOS4T/XMLGzzpqSMmW3b6a4/dcqQKeEyWTpb0XT4YzbKvWoY4QoR5oszd1Zh5Kmm515MSjyC2MksqhcA1AAgyk59Rn0U4y2zJ0ANy+99wJ9swvVxLDMyD2p
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:38:19.2949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4fe629-b3a7-4ed9-ae95-08df08cd8a6a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244903

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../boost/boost-asio/boost_asio.cpp           |  1 +
 .../boost/boost-asio_1.92.0.bb                | 33 +++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost-asio/boost_asio.cpp
 create mode 100644 meta/recipes-support/boost/boost-asio_1.92.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 99242af484..0df2a731a4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -76,6 +76,7 @@ RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <=
liuyd.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bmaptool =3D "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-boost =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-boost-asio =3D "Gustav Lindberg <gustali@axis.com>"
 RECIPE_MAINTAINER:pn-boost-build-native =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-bootchart2 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-bsd-headers =3D "Khem Raj <raj.khem@gmail.com>"
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

Add myself as maintainer

