Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2617FC48BC1
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:38:04 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web10.8615.1707820682005575106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=bdesWGKt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.48, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P954ZfLAFVRUyYozRHKLsZKAnwA3LALJRyQ/yE5nuHUIqZzoGDju/WK1EmNsqIEhyLRcqz9Dxkt5S1ywvre3jmWqMU2jgTk2maDYjYE+MYx6At4kh7VEnIBnQ6V3hphqsvUIsHDDRt9viaVlguzk4rbe9DWNPxTPf8Vv+892vI82PPnoIekEQqka1OjqaD+d8aQo7bTu/WVUpA9SCPqnaCqtmBg4BWZ/8ue3a2xoTMJ2vgJXXKabV5/hh7SOfsGwZL3wOXuzScWgC2gzylA7ewUn/nGeM8u4gY7RATvuIwQnOMRLQh/ekQn2tl9x105POEGHL5Dj7zoeMOPFh+Axew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHH0Q6FI1riNydWLErJ0+N6m8LyupzT33JOKpIGB1ec=;
 b=jJmwEiQFS65s0nLL+C1K89H+XJLG4JDxAN0mmBRWaimXDiXI72nEmBib9oGPkjqC9FMZgXt+Th3t0g+2+xVc+Rt8jF5UJc8Wt67MgDhStwsZyNhx5My4RzFQWvUA4gk8tPJGIj6HtNrlRUsKjKXIl9zI9gtj9JKDOD0z1e/D5D4Y9kr7paA8cok3gBCH7MkvvwiWoaQE7bI58J8ZoR2cilS/E/aQA/y6kNKM+joz0YfGXn1RzqGhX37XL81U+53b3AFRw0uMUP0sEg5Z48kZrGlCM9flnGgX6wuFRT7bBR6TJPwQ+ScOJ8PMXnB1jigyWvpj2s9lpc4ryJTQbRl8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHH0Q6FI1riNydWLErJ0+N6m8LyupzT33JOKpIGB1ec=;
 b=bdesWGKtOj4sbylhljzgvZ8ZWsU+YkvsNNbIb4Vr+7atD86A5MAgwQe+OFHRnKEpinBL7xnMT4k105Xucc1ic/KIUm2EQCCNeMzTSy4It2Ck0u52W6Lcbc3o6kR+/mCgKNcRE1ZwIUXccrb3YnvLuPFTofRfrN9FimLRXEzm6Ew=
Received: from AS9PR04CA0158.eurprd04.prod.outlook.com (2603:10a6:20b:530::6)
 by VI1PR06MB8949.eurprd06.prod.outlook.com (2603:10a6:800:1e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 10:37:57 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:530:cafe::40) by AS9PR04CA0158.outlook.office365.com
 (2603:10a6:20b:530::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 10:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 10:37:57 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:37:56 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] python3-pyyaml: enable ptest
Date: Tue, 13 Feb 2024 11:37:54 +0100
Message-ID: <20240213103754.1622358-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213103754.1622358-1-johannes.schneider@leica-geosystems.com>
References: <20240213103754.1622358-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:37:56.0478 (UTC) FILETIME=[B4DC09E0:01DA5E68]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|VI1PR06MB8949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8dbe0c43-a5ec-4f89-5db5-08dc2c7fd7cf
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2haO/L62Mjvu+mQ+aBIy+gN1FBtjgSlKwxzyXoBhzA7mWhNTm/j9weOjqsLjFPXGU1l875QpolhmbZwsE2NYsg/YVxmC27gCw9uRw9dQPHcC1ldJWFCv6IJYIVTBnnYoPe+NXLOVPVkY5PUkntG1D33mhE8deHt/rpxWzx246zKnNx8AJPeTxKgBJ7RWdTkfiWvAi6POsAMtu6lK4huubowZ4sPgU7XMpUYmFMz4fj+MhfdpOG8BRGV1/kGs2tzClAmXC+Se3BKrGlM/HPg3AWcdhXj9vrN11GfqR1SNmsYk0CjxYqxig3gpJoulusEakDaSDcbOInjoVGV8+ripISeQE210Bi1JSexeaUA2z4oHtptq+gGisi0tRU4XP8XfUdW8F2RrZhviWPzTfhl8cTlKqGQKs4tq+YzOu7487RyQ4WcZKH/co5EuI+2pVA12JS9X1EcVGi5AHKO9IYN/nwzi6hZ81yBOBtrFGF4KRX5s3/GUPtLbROLBxqYRosz6jC0WsWCkUi5RDXMWQHNfv1cgaeNZWIWd+QXAvUJwr1rL0dLFlD56c79yGnXgDXg+UXdqHwDLlNW7jdESYnp9vw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(966005)(478600001)(41300700001)(8676002)(4326008)(8936002)(44832011)(5660300002)(2906002)(6916009)(54906003)(70206006)(70586007)(316002)(107886003)(2616005)(83380400001)(336012)(356005)(81166007)(86362001)(1076003)(26005)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:37:57.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbe0c43-a5ec-4f89-5db5-08dc2c7fd7cf
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195388

From: Tim Orling <ticotimo@gmail.com>

Upstream is in the process of migrating testing to pytest, backport
test_dump_load.py (the legacy_tests were throwing Errors and Failures).
We don't really need to run upstream's test suite, but we do need to verify
that our runtime is functional.

https://github.com/yaml/pyyaml/commit/a98fd6088e81d7aca571220c966bbfe2ac43c=
335

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 .../python/python3-pyyaml/run-ptest             |  3 +++
 .../python/python3-pyyaml_6.0.1.bb              | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b590640edc..0192146dbd 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -69,6 +69,7 @@ PTESTS_FAST =3D "\
     python3-pluggy \
     python3-pyasn1 \
     python3-pytz \
+    python3-pyyaml \
     python3-trove-classifiers \
     python3-wcwidth \
     python3-webcolors \
diff --git a/meta/recipes-devtools/python/python3-pyyaml/run-ptest b/meta/r=
ecipes-devtools/python/python3-pyyaml/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/re=
cipes-devtools/python/python3-pyyaml_6.0.1.bb
index 102e2f2498..62be059df5 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -20,4 +20,21 @@ RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-netclient \
 "
=20
+inherit ptest
+SRC_URI +=3D "\
+    https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c=
966bbfe2ac43c335/tests/test_dump_load.py;name=3Dtest \
+    file://run-ptest \
+"
+SRC_URI[test.sha256sum] =3D "b6a8a2825d89fdc8aee226560f66b8196e872012a0ea7=
118cbef1a832359434a"
+
+RDEPENDS:${PN}-ptest +=3D " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${WORKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


