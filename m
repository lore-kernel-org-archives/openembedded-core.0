Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC3FC48BC4
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:23 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.86])
 by mx.groups.io with SMTP id smtpd.web11.8369.1707818420480780960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=WWObyQhJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.86, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKRs6FqT8JnELhgFRenP+JPbZAMhKYiFLC+RTTjBRLgphcdM0iYuJ0a6sXOiWxCA51Pqk9DLTJbkbR2uopJhJmKoYorPgNj7uuDCRglkcEkKGru5RAVAhpgo/gwxyCzL2qq2gKV248YOR2WovTO0dVKim/3p28bnYgAU25zefbMBiq0pau5FShUVgETiSSNBw+10wcd/19fwrdNlBFmji61xIO6wXBIiIvH6//BBHF3UCoq+fBrLKcFCppT6741Z69K+QtDuoCqkQ/TVcjVqv4pWtNiy1mdJuiJSPJz5h608An2pxPtPqbkoceLGVNjkpJRzwcXSffEv5qDRGwHykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHH0Q6FI1riNydWLErJ0+N6m8LyupzT33JOKpIGB1ec=;
 b=IHK5FO20xgEzjrVdq5pFiC4WoppvXZemkdRR3Ey7uh4E5apRF+HKZFF2tH7kVHjTUrESg93uXMrFrjPZUjoBkuioi99M1aCCLM/o34DDH7aFq1RraY23szLyQ6CDiKGdZ/8ZNWU/+No6WSGGwvXKsD6tIB6nG2hG2D43x+s2RZ+6L0AixfcwhYPneAMeL7Bpz0WcNhje7NtlqyP2CDmNnqKRf9dDb2FR1/PWJBThqNDWe24EVj4rPT5G1goV/Tl0bb1Gk9mWutT/+wjF53lBRjMhYpyVqu0lhD5DUw3MG9Gn68GAJQJi0k/9fubin0kpH2u8L99S6UVN0VfbKSrYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHH0Q6FI1riNydWLErJ0+N6m8LyupzT33JOKpIGB1ec=;
 b=WWObyQhJ8/C496HZxUp4r57TT8WH+yRTMfKx9cEqQtToyYt7k9m9KRaDw4E4oITqFa7/oE5ips4SKOgKuAUj/U4B/xuogKPKU7Hna90KefcfPhKBLfHFx+yqSRQCUpli9ACaRUv/fP4yLtoSvB+MzkJm4V75mmcqGs8sM2aw/dc=
Received: from AM6P191CA0076.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::17)
 by DU0PR06MB8549.eurprd06.prod.outlook.com (2603:10a6:10:358::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 13 Feb
 2024 10:00:17 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:209:8a:cafe::de) by AM6P191CA0076.outlook.office365.com
 (2603:10a6:209:8a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Tue, 13 Feb 2024 10:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.0 via Frontend Transport; Tue, 13 Feb 2024 10:00:17 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:00:15 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] python3-pyyaml: enable ptest
Date: Tue, 13 Feb 2024 11:00:12 +0100
Message-ID: <20240213100012.252237-5-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:00:15.0301 (UTC) FILETIME=[7117CF50:01DA5E63]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DU0PR06MB8549:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9348449-d87a-4c69-7880-08dc2c7a94ad
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MGwixu/kuf5OCFrwJkLyaWbaVayXJsQpSG2dXDnOCCMNGGooggKXmFuJ62mM4tSHCRidvF/BTL/GNMtJK8i0l7EKq3dIZ+n/2h4GJFGxCuQrrXnpqMX7GSg/7HsW7M28O4AAAtOOE+mGgOqEfXW5qRbyWea2iFaaWjEt6VL6Qf1+YDoS1aC0aSNLA1zPYtAQNxzZI5/0cCjKrkcK++Byn2tGGUSayHMShroPYfr2ntPWhRU8/QjCi2Mq9O2HD8jexY+McjgMfxYasjraQwGR+sqs2yqmy4fHSZRv9BIsK2f23FsSxFVaxgyJX//7Fh/I0AS4j4iOoo/ObaRKrDYQvJhv0kp1YQ4tXfu7IYNSXyWZUAJXKHftXbxVOHuZxp8Bc6SgpzUpaFXG+VXwu9oPpXV7cnP3R+KcW6xk8F/AVj5n6ar40dN3bQufn4tUQ0ELJJJKklSiKSoT6wpxa+z583Gxg93q7LNO9n2C5FbM03i6lSoKlgivMpz6ZDU6iXJlyoxFP6BVMP2Y0ZnbpNghPJ/OORYv6ItqlUW5pVuTMDWHj6MvMoZaoc0VMi5nidHoS3Nybf10XRQ1yO6mxWC5xA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(70206006)(8936002)(41300700001)(44832011)(54906003)(316002)(6916009)(8676002)(4326008)(2906002)(86362001)(107886003)(81166007)(1076003)(26005)(356005)(83380400001)(336012)(6666004)(82740400003)(478600001)(966005)(2616005)(5660300002)(70586007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:00:17.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9348449-d87a-4c69-7880-08dc2c7a94ad
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR06MB8549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195382

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


