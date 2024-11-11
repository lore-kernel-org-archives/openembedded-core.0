Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E8CD6409B
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:48 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.63])
 by mx.groups.io with SMTP id smtpd.web10.54930.1731314147263707161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ehmg1qCf;
 spf=pass (domain: axis.com, ip: 40.107.247.63, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUFIssZKYHoD7kZRXncCTsAKV4m3XnzQEAytPOBuhOdc1drlIqeBe6JUDKf7YVfzJq2b8qGMkcKNYMtFLB5qOGZGUJqi646lmfqtcqK++RT1FNzCTjoR/NG385iGnufuewG/DRUJ9LxRqAHW2mhhoTfcpkiBMbrsWIhg7dUQ4wFYNAzFF2noNhKSrXqjJxQTURU76nHorWO4Vt7KK0wPyXa7D/E0XxrOdWm31ynHYWxnVmj+dY6QWNuOm7JPe5f/pCOf8Z1EZrttYZi7JXmP7ebLL2MqlitHi2BOzlwx2kEQ1t45d6h55KNsDgOlm4UYF/NHQnc/XX9qbVRduVSZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muXSABq+V/V9ZYOUBb9pcKWnAyBoQQ5oaKYoq5Nmybw=;
 b=mvjQjOKFjLeZWR2I4NINc6pU2Mzui+kJJnlnLfKsbyI6Tm0oWLnKqPFy1t+jLBm1JOwsvLqVm9wdaLM3lkvmbC7+SUsDqRq4p8Mq81pbHmN1dhBz+hPFcwDtLtu1yZrk8ygKWu8wBZnk4cjcbscfKIvd7OyPzDTeIke8gz/Uo+yUrwP43vjvZ6M0XMIQRAea5gNYhKspYIsOx/XSAXbyZvXfE+8sTD64Wuxp+LjSERAxakBYmNH2pz8yDiseHD9+uVjLEeGEOCwTrgdLKhTsrK9hnXgkwRuwCLNddYAh+0dtIPz+r44pXIoKy3nted5Bn5obOGb28TxkD0w3BGo1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muXSABq+V/V9ZYOUBb9pcKWnAyBoQQ5oaKYoq5Nmybw=;
 b=ehmg1qCfdmSuRem/CxKhkzJ7AeY9hua1Kzx7xmPxlZgI9FZQcWKmO/CwxOd5aA3KWsoWxGSBMn/khCrMhb0kejy34HTihnrucfVRN5NTzuZh8Ft2XRI7VG3yPTI+0w5vhN7KDJLHQgolGB0vcTDhvtlw6C+QdzyoIVkLshOFzb8=
Received: from AM9P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::30)
 by AS8PR02MB6854.eurprd02.prod.outlook.com (2603:10a6:20b:251::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 08:35:43 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::c1) by AM9P250CA0025.outlook.office365.com
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
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 666AE7B8
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 1/5] attr: Fix the ptest path to test-driver
Date: Mon, 11 Nov 2024 09:35:37 +0100
Message-ID: <20241111083541.291594-2-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|AS8PR02MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 7237a160-b351-4f48-fd4c-08dd022bd4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ujlH+zi6t2nkVwr1cxH9mJCRat5cRKzxXp1hX7HPfriaYLZMncgOfd415TZt?=
 =?us-ascii?Q?Mg8h4VQWOTcl3HaOVuctLhA6oEP8/yPkcGmvxXaUcEzIKml/l+IKTGaaYfMl?=
 =?us-ascii?Q?ba1nAAdrowKRtEHSPbCWt8zbnGuSQhCw0k94CSJeb1iMjPb0BWLrF/1Mda4q?=
 =?us-ascii?Q?QRq1Cll3NKGi5zm4HWKKDtOuAa5ur3rGXL5x3BCgZBuZGu5ttYNhUmjqFfq5?=
 =?us-ascii?Q?WRe8MIhoCkk4iq8u7fNy92O5B1fhHAAxbmq5fHnagMhzU5b3e7mTyEYckogx?=
 =?us-ascii?Q?dIMOFvQmW19969bbTtaDVlHw9H9ggv5FXAlfBeza6tmQHKZCfmSzxKlcPwMC?=
 =?us-ascii?Q?bRpCMQFSU2qhwUVtqIF2RWGR/dQh7nDS8yQl3te+rtuMVJxLCsnsBWH5beRl?=
 =?us-ascii?Q?6hBbGyqkii6pS86jaNTiHx2OqyVJrZ+8EN06NXuBZio1jZcawAqzbTNEYHVI?=
 =?us-ascii?Q?IwQbPbOWbWy5L4dOFa2MEuZ4k76WEmR95M/xvGXGhkTUn4tpXaVGLFLUccYa?=
 =?us-ascii?Q?Ldlvt+ZplDdou4aHyxNj2qaQIKdVbZ6aXFVAHtihGD3Qf99HkFxkOj8ZXfEZ?=
 =?us-ascii?Q?ey0lwj4b3CqWCX9/VNbZ0AujfdueHIQQJ712NKRJo4C686cpHh9reNr3WBgz?=
 =?us-ascii?Q?CIMAbAShX06S4tf1LTsPGMAzNnBgzs3bs/4dOdfAxFO4RyLs6qu8LG+I6kQ/?=
 =?us-ascii?Q?I+N/G4crLBKsVdzqWMNunpglSEIhuzoAw6K3QgPfJ+TGbCM1Q2OP8FDP9/4W?=
 =?us-ascii?Q?VJ+nV8TgvoivgAkolNwgRNLdZ4Lkr/EgvQqPU16IG3Mj6qaPP0lU46ievH1S?=
 =?us-ascii?Q?rhO4Qdvn/JhltNAfKSi+rbgmDBr6BIvHXu6dVOvVYdpXmqU5IbTC9Pg+JqAi?=
 =?us-ascii?Q?6C8u3iSe9HBaPwICS8M5N9SCWF9glJ1lFhH3YaWrAX1jLInNEp+pR0JuA+uR?=
 =?us-ascii?Q?ECkhOFBfX0TulS0as6T1EB26coljsSh5st4ZRzaa2b6IZvdwDxHSSlvYeYDX?=
 =?us-ascii?Q?v9ImawQUX9BR0uwnmwIZAUoFELu0lS7nJuGbxKWuNpI4PHA8cawO41j6hPoP?=
 =?us-ascii?Q?PsncxfWCbCPh9evwl5Nah+/6YQKoFFp21gGvBLLKMxlktFXw5DvWVPCWkeXd?=
 =?us-ascii?Q?TgyHkr0gLZKn4HXX4KR0cVB1vG3OwYvXrUIFwrEzRPa5IuYjs7//fXMDPQ6r?=
 =?us-ascii?Q?7eVtpidMDNzGvEwuhlrFyckF+2zbi4ZGaozy9wjbGmTygSP0Av0dGNsB7k7d?=
 =?us-ascii?Q?itf70+LFKoYEz/FzWAIfOoE1/9RyTqI5RFGeEiT82wSPtGvAOGnwfGe9Drak?=
 =?us-ascii?Q?Xw3MCsRLMPcPUs40jWptjTb1Pht2LmLGe2WL/lazwd2hCDW0ql+RIbmS5/4v?=
 =?us-ascii?Q?Z66/MDRrL09ql5hMTp6LS1g2S3mOjRcAgNc7A9+E43kqE2XXCA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:43.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7237a160-b351-4f48-fd4c-08dd022bd4e0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206933

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
 TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]
---
 meta/recipes-support/attr/attr.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr=
/attr.inc
index 60339344015..5d6929fe507 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -42,10 +42,13 @@ do_install_ptest() {
             -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
             -i ${D}${PTEST_PATH}/Makefile
=20
-        sed -i "s|^srcdir =3D.*|srcdir =3D \.|g" ${D}${PTEST_PATH}/Makefil=
e
-        sed -i "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" ${D}${PTEST_PATH}=
/Makefile
-        sed -i "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D \.\.|g" ${D}${P=
TEST_PATH}/Makefile
-        sed -i "s|^Makefile:.*|Makefile:|g" ${D}${PTEST_PATH}/Makefile
+	sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
+	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
+	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
+	    -e "s|^Makefile:.*|Makefile:|" \
+	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -i ${D}${PTEST_PATH}/Makefile
+
 	cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
 	cp -rf ${S}/test/ ${D}${PTEST_PATH}
 }
--=20
2.39.5


