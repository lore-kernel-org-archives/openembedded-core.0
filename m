Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB6DD2E9C0
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web10.54931.1731314149821098524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VdotROje;
 spf=pass (domain: axis.com, ip: 40.107.21.85, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxJAdINd03ph7qlGedynpFxg7UYkQhr3Gnd5siW0RaINV08Swv0TdbmXyDnCj4i1p7O2AvNP9Ms6NHD7osEpqpE7prgJf90XYPmIQijGI/rV4rkoaobupw1g9+N06EKP0A3Z4bQPbM9/icSAw6MHXSQECepB+5p0CwFvYy1Ko57gXikWW60als1Ui11OncJ1sobjnmuhW5aUdTjIoQ59gC+gpBndpk0AQiRGZ2HDEX3IajiNeKwiQjI/YnD8RPRlRH3vr/9BBKSyostoVe9nRGmGnYMFJeK/DPzI/s0YeEfjSkAnb/gM540+bEmurcjNX4o22b7bOfCPIpsuR5NdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snSH9i91muf3pH2vZP/WeYsF1wctSh7SHSLAFCVEZHI=;
 b=WOoLNOqsuGZaVOhqO+RZTrIWJoBwYTFVqZ957hYEpeoWepzd40V6gom6QoFjwQ0W5bZbaWwNsJW+E4pzy33Uh0QUWOnKKoS+Jn+s6yARTCSm2M1etmTxMas8YfoAF5NhANhWYxeOxXgkHfJNBptckW2XdPvblvE0cl0u2pFR67G+EyUaKxMPAB0l75z5Junl0le+rVGU41VBvx1F0d2775YAG1/rs2q5Ouks5OV8Km2yG8A1egQIRiwJXHAh4Ua0X0YE6/Z6zQsL+TswHKb+sLZzBYtHUYyFJHNRL/M7ZdVvLpSRBfLwccOVsBKt3h13YHh6+470jDsjkUrG8YsrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snSH9i91muf3pH2vZP/WeYsF1wctSh7SHSLAFCVEZHI=;
 b=VdotROjeu5Ejn3Tkw4jE/AveY8Ig99b90zMGruTXlUaKpu/gPj/FXOdUHndIBguCuAYu31jsq5v5SXqQVOJD+xAipNGEhJyp9ci1IinH+EKGq1LTv9Y981/7Gh5PtFIlp/kXN9ASDkE9zLqkJW92s2ff/nHpCQdxEk+MHXJfcgg=
Received: from AM9P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::30)
 by DU0PR02MB8980.eurprd02.prod.outlook.com (2603:10a6:10:476::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Mon, 11 Nov
 2024 08:35:43 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::68) by AM9P250CA0025.outlook.office365.com
 (2603:10a6:20b:21c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 08:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 08:35:43 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 74E68829
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 4/5] strace: Fix the ptest path to test-driver
Date: Mon, 11 Nov 2024 09:35:40 +0100
Message-ID: <20241111083541.291594-5-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DU0PR02MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fd05f1-fbe1-4f08-c090-08dd022bd504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mD/xSPWcqUgpQQ+oSAgjLktHNMWrNucSCBoYI7wmaBYU1KbCYilbdi6vXrB4?=
 =?us-ascii?Q?OCBaFP97eiBW+7O0UlBqd2ePz4tS7/ZntZ7saoafx7nLW3sVRxAPj371tCWZ?=
 =?us-ascii?Q?z/MeYHwb9IlEv4GA2NEOvsZokXcGbuNKfSRDenwpBgAfcSbuPp7i1GlwdocS?=
 =?us-ascii?Q?jHVgDNxY90LlIEQ5I1ZEVPVZND0RGjfKdkvPIOwUpAx6b1tN63bF8mUM+KV1?=
 =?us-ascii?Q?BohTsq/zRnvq81iqOxmZZLi9fHS40cOnAMwv0c4iBIgIAN5XNf81R/HB3Di3?=
 =?us-ascii?Q?7luu7o4h5/qxe2UAxA3vJRtjwCrzoLxSNQSoZdmgvIKuKQPNZz5iJpXT8m/C?=
 =?us-ascii?Q?ZlFmWUdmcBS5dASiUz9Hse8YbmRj3ysQ2WdZmzDlhmFRMXg4EynbQODmaOEv?=
 =?us-ascii?Q?beb6DyNtfljmi61Ue2NxmEV6tj7VRYOHgES3Dh2XvUrYruZTEfB9PBo7Vq7q?=
 =?us-ascii?Q?OM5IGfjr5yMUXFazQdUd6V+00syx8kPaxZE5HDvwLKqItIDYmDLJDEF8Gf3i?=
 =?us-ascii?Q?ivZ42O4R/Xe0041Oh9t5rg3HAg14J1gRzdLq0+Cm+NaIQHs1llT1qoIFuhnO?=
 =?us-ascii?Q?H9ZRBWf91O550nNRMFDsi0rw3IT23VxRs0+YYNLi7GMIXA8YvDWCHIM83iIj?=
 =?us-ascii?Q?dLzBVsKTAxCAXuZ9SFyqHiQP885P5BpJBEgF4gdwg05WtvH+FzAoVK0fMfeL?=
 =?us-ascii?Q?14RTrhCnHSuDy7/oE3Wfu2+rwSfYzs0u+R+0wnKRKfGrgHJ83pve+NH6rLXI?=
 =?us-ascii?Q?CfeGlzEhBixZabDg42nTz1G+i/uFg99i18WYV6e33CbRIm2Zbl5P7GgSmBm8?=
 =?us-ascii?Q?IYK4J8Nq9UkvEzA+6w8XUl+ny6jRZqqi1WoD5Dl6jH8EyFqcMdER9UBatbvo?=
 =?us-ascii?Q?YZy+jecISEdc80KmMS/Y+yw1u/XW/KpAwnQ9wr6fevnbUF2kzydXtp43zfpO?=
 =?us-ascii?Q?riJx5Ck5AQOkeruAMUa7fFM2H+UKyuXvqjVSN7oEyAYfCkw+NINN5hwJLKdI?=
 =?us-ascii?Q?4aFeTvAn1KNqwzpaSahfUcQSknV+odF+Bg2NMREXuurlQYQEM4XjgEpqfONT?=
 =?us-ascii?Q?4zmeICdAKGKtHMIuV6fSFcDIB8SPRBWluvx8T4HrmBikYid/rq4kiDY6ntyT?=
 =?us-ascii?Q?l3BNuZug8fPW02poO/mDwvkU4V7/6S66GLSx+U8aqeksM3qzNs07t60e9duf?=
 =?us-ascii?Q?OpKDOJoS1Sp8Xvp50D3A1f+8HhQQjNH1W16NEZPWTUmWKtOx4kE/6mFjwYC9?=
 =?us-ascii?Q?2ecFX8HDCaCr/Tn8+D/lWM4lHWig3kmWTpVZK0b8Yu9ItsXgb/2ieTXjLvtP?=
 =?us-ascii?Q?codVRkFxXoKAk1Mm/lzmsZBt6zJo+XEaRbTxyEYpj6IQNl73Gl+rL+dBPyad?=
 =?us-ascii?Q?HLeaS5S9w4XmO9To4aOX2NHNo9Xz9aADTsCsKjfj3NjWoCjpXw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:43.6717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fd05f1-fbe1-4f08-c090-08dd022bd504
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206936

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/tests/Makefile that
transforms
 TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]
---
 meta/recipes-devtools/strace/strace_6.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-dev=
tools/strace/strace_6.11.bb
index 4ab78e7a9b9..1bc8aa99e71 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -45,7 +45,9 @@ do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/src
 	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
 	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
-        sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TEST=
DIR}/Makefile
+	sed -e '/^src/s/strace.*[0-9]/ptest/' \
+	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
=20
 RDEPENDS:${PN}-ptest +=3D "make coreutils grep gawk sed locale-base-en-us"
--=20
2.39.5


