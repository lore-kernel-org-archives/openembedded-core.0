Return-Path: <gustali@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF0CC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:45:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3969.1788428726702595857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bf9AcFk4;
 spf=pass (domain: axis.com, ip: 52.101.69.13, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwYZpb1sc1H8NCF9Z+VoPapceb0QyxFxK1XLFe71boZWcNyudYocy+EZMuNjjUjUUKM0mQ0bnsBEXAiuGt+QFQLXQqoapVd8uF9Zm7AwxgG2abcVPCU51Dq1meIPPXwWBBuuGB9XcdQFOc4TKScPmXwxHT2u27LqwwShuHY4uuto72PBE1QRcEjWgMwk75hoP57kHpsKzoFMaGBC1eVf/AZ3wnGKIjFrUoWeMZLTqyz8AjqSwQuQqFHOvviteoZsbtfJh7tLKEeghEsB27ZuIzsnS4Tl3LIEfHN5wDEoHMQYHCYjdzYkgxeISGawv3uX3hWXESmWPsTABSCzuAV9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTba3rkXQjk1nza9TpjRou40SoSwFyM2mY6QAs0Agmc=;
 b=Gqxlh8LMorRI0j4ZoA1bthjDP/0kFwjzzHuz9WcNXtwJ9KbZcrVREEqW4eE7uxnD4WydYeuCxiJ4lRN9f8DlLpP4aBkzaLsXwvKDK3S2DUNd0H05vBFPOUqUvNicDh3rKLmae8UHfacDAKgnuaggaAmDCxKJvryZoISGr16MGUaV3twlBm356hkVLP8AkjZpBtsaINbFaMOKuRIMVQFhnMXgeYdWhB1ASjMLq0iV1yhR+Pp7yt0MhwvkjEHVIhCJ8cUIkthlatWhbmgFLcN6AmxPaTzbN8HwgdryCMwjUgPSjlZXVcE0yqx8f+Mlta3IPcrEOHYMbius6DC2AO7Mnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTba3rkXQjk1nza9TpjRou40SoSwFyM2mY6QAs0Agmc=;
 b=bf9AcFk4RmHzIF3TSClFtExzp5AaAo9Ie2FK+CY5ytauj4nlZ4FdMgZq9hYJ5Sn/ZGuKzxkl5Hqm2QVPx20LVQe/+zCbarPFBscB+X0tdDDOlMkbVhMm6oQNiYw6Z+VNq9pHNVIw1pxXf3oL3SvY2uPn2LiDbtSfOK+XTUNrWoE=
Received: from AS9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::8) by GV2PR02MB11445.eurprd02.prod.outlook.com
 (2603:10a6:150:2a1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 09:45:20 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:540:cafe::48) by AS9PR01CA0012.outlook.office365.com
 (2603:10a6:20b:540::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:45:19 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 3 Sep
 2026 11:45:18 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 3 Sep
 2026 11:45:18 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 3 Sep 2026 11:45:18 +0200
Received: from pc53324-2309.se.axis.com (pc53324-2309.se.axis.com [10.92.8.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7A50FD13;
	Thu,  3 Sep 2026 11:45:18 +0200 (CEST)
Received: by pc53324-2309.se.axis.com (Postfix, from userid 18459)
	id 739C34A82D1F; Thu,  3 Sep 2026 11:45:18 +0200 (CEST)
From: Gustav Lindberg <gustali@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Gustav Lindberg <gustali@axis.com>
Subject: [PATCHv7] boost: Add support for building boost-asio as a shared library
Date: Thu, 3 Sep 2026 11:45:17 +0200
Message-ID: <20260903094517.891670-1-gustali@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|GV2PR02MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f81b49-3855-461d-d7f2-08df09a0111f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	c6ZypQhzMCDtiT/0ZyMXnAgggbCWQq3NtFAx2Ute6CTwMeMGMDCCSK8+U9k14Y8iKfeZ/C/3elb/YE9z38l9Y8px1G7n+RLXC4CW8nNCvfUtCYU9/64BErqjcft3zd2/DfWb6PZaJKxe2KuDCOhDHjosnDmlmCmCz68V1ZYlbYqfLOaqlAKruan95cYwTmYbD+UZ7l1jR+/3MndvT0TcPjObhKEy63MP356XgHqqXDXP44py4PoeAapskbaA+ow6sPXoCFKJbGt2VTMihjFBPFXt6pYGiAAo8enhmwTuqe/lIhpZrG4UKFVp5ATN5AfKO32sj2EL3Tz56AbQqsM6fpghKiFBU+wxP4fvt3YiUWBNHudAbloxsdBc3sYhavPI5EGOfhs71Sw30OyvRnxpM1UqFhvq2dIFroZsG03KVNuh7cyekshql153K7EwUSZ75wqyJAW2IHwAY+IdEYZYGvAzrXm7j1lIv9BOCIKGGESrUBPbN/F4OwVPu+m/wFQ7vSSgg9ZTSncGuyDl46JVDnFjiqa3VyyAuXZXgwJoRjyFSQuOvET2orKfOjt4Xezu4s15TyRXhzgzcLy5Ka+YGnWqczrc8uvg8fSPEa/JdwGlw1rTLnabpXM34O0hmFmHc8/MXHH80EnqelNBS/aaBp+daAxGe4bq9zQwHSRhh2oCubv+inXjvAHnxMwtkRSfQ8aRIm6QRPC+E6htVycqSg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QcznTelGamq1lhNLP0hf0B5mnAkPoKanewFUj41v6NOy7HiWnpV1yP/eyPu+3iz0AmasBrLKY4KtVJDVctpFhV+ATWYSinze/YMVEA+lyhOpYJ7r72Fnpoy3+tfbcDwS4EdVpN52eWjRga02H/K3qJZP0902BAwshU8TP4blqsanOWJSexTBdjWTA3tqLKXifKdrNVf1kaxWAxgeyqm7/Uhwxo1mLbOPPudZ8FvAffRfRC1qWtOijRRxJK2bVUdOR2rEwqiU9Zm0xOi4XrzEpUD4TexYzUCtaxAIf2DYhefpAe6/BSEntP9jdrdyL04AAwvRNR2sb8UktD9QAQ+vmljzPq8xpHxtxbv8fWuRr1EZ410KmqthM1YHygaJIEqXRB9JL8Qt3ZimPal2HAN33BNiXeznu4h1nxg8+RNxtjEc8NoA886WOX+GhtyE9wb4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:45:19.6260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f81b49-3855-461d-d7f2-08df09a0111f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11445
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 09:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245020

This is needed to build boost asio as a shared library rather than a
header-only library, which is needed to save memory.

This can be enabled by adding `PACKAGECONFIG:append =3D " asio"` to
`boost_%.bbappend`.

Signed-off-by: Gustav Lindberg <gustali@axis.com>
---
 meta/recipes-support/boost/boost.inc          | 25 +++++++++++++++++++
 .../boost/boost/boost_asio.cpp                |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/boost_asio.cpp

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 64a57ddfb2..4ac3f7af5b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -44,6 +44,7 @@ BOOST_LIBS =3D "\
 	type_erasure \
 	url \
 	wave \
+	${@bb.utils.contains('PACKAGECONFIG', 'asio', 'asio', '', d)} \
 	${@bb.utils.filter('PACKAGECONFIG', 'locale python', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel', 'graph_parallel m=
pi', \
 			     bb.utils.filter('PACKAGECONFIG', 'mpi', d), d)} \
@@ -51,11 +52,14 @@ BOOST_LIBS =3D "\
=20
 # optional libraries
 PACKAGECONFIG ??=3D "locale python"
+PACKAGECONFIG[asio] =3D ",,"
 PACKAGECONFIG[locale] =3D ",,icu"
 PACKAGECONFIG[graph_parallel] =3D ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] =3D ",,mpich"
 PACKAGECONFIG[python] =3D ",,python3"
=20
+SRC_URI:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'file:/=
/boost_asio.cpp', '', d)}"
+
 inherit python3-dir
 PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
=20
@@ -198,6 +202,20 @@ do_compile() {
 		--debug-configuration
 }
=20
+do_compile:append() {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'true', 'false', d)}; th=
en
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
+	if ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'true', 'false', d)}; th=
en
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

Move the shared library build to the existing boost recipe, and allow enabl=
ing it with a PACKAGECONFIG

