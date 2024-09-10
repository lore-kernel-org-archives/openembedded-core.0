Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C42ECE58F
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 00:02:28 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.61])
 by mx.groups.io with SMTP id smtpd.web10.11211.1725926542514764674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 17:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=fITQgkN4;
 spf=pass (domain: axis.com, ip: 40.107.103.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKMlwM5706c4wI81suJBoGp71ovn8WKTt4K+vYQZRpnI6YjZ2tPEsqBeSprGM9YGh423068VUy/aCuA3E4hx5C/rTFXMopttFJnqdYvk+XtGxAxM1hyEPBBnzfiYA3e24LFi6avSW/Kuza83dZyIu4CKd8U/tp3Nt0qNVjtxQp40iX5AdBKRzQH3BzSDla3ziDQUkrXThFoGHYmCtgUe3shkAGiNxo/Od++FdAFGCG5fYpRcKuT11P9SelUONZqMDbogaiOLnF83h3cqwph40KavJaOiUU+2NP2iCshQFWMgYuy5xfnQGMAkNYQGJHtsB7axDnt8no6Jk3HZsjvP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdZity6SvCl/8k7VW+dGK21Nt/8B+RJFjazwaOIzzy0=;
 b=dXEFmeEXnXDRrkWU6790GNa2pcvfVel1r7Hf7/EycCHkTE8RXMdmW/1KeruQVSSlvCEGc8VtWR3N3tT2Opm+jhxWpN3fWCopJCvX9783tv7SJZUpeSl8iUOZvuPVKvbNoa8QCp++m6XZP5266jch6LG+hZ9+upZfEtslS7ORtG1yCT6TaaCbKO6XMoaUCjq2lYLjWenMvsLqtbLchkXSlltsZbUStjFUGR5aORc6dN+VKFCsCkQIXm/FXlmRphSBjMLVi5YfDyfcPmN3PA1isJMAuRqe+VL8dT/Da9tnQSbUnS3D9ppKLDbldvzLP95alSVWtV4U1pZpcj56MkuvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdZity6SvCl/8k7VW+dGK21Nt/8B+RJFjazwaOIzzy0=;
 b=fITQgkN4MWfT/e/9Q8dcQF10lTxsZG+L6mTBHO3HgzBAy5yobIJAZg3sBCwQ2bZWnFzfVGG6yEWMb6kSPvvRmwV/ycVOyt0ZB9ynOQlkCp0uafl4XB2GhFNA9tnWsHoxiyeIT0UHK4nMq6ajJnDuQwAe+0vM8qd9EzvYV4wJuDY=
Received: from DU2PR04CA0338.eurprd04.prod.outlook.com (2603:10a6:10:2b4::8)
 by VI1PR02MB5840.eurprd02.prod.outlook.com (2603:10a6:803:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 00:02:14 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::ab) by DU2PR04CA0338.outlook.office365.com
 (2603:10a6:10:2b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 00:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 00:02:14 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 02:02:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 02:02:13 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Sep 2024 02:02:13 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8330D21B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 02:02:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 48A02DbW3330234
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 02:02:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 48A02Ckd3330233
	for openembedded-core@lists.openembedded.org; Tue, 10 Sep 2024 02:02:12 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/2] Revert "bluez5: remove configuration files from install task"
Date: Tue, 10 Sep 2024 02:02:08 +0200
Message-ID: <20240910000209.3330191-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|VI1PR02MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 32851867-8091-46dd-6b15-08dcd12bd387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2xiiGO8DPocmkFBqCsfqFj6eUmqXu0noZmo1uMDJgjGDxRfRrYKCiigYPft1?=
 =?us-ascii?Q?yiCp4Hyx1qhD/v2RfsK9LpQt7Zoj/ymbdRrSaJOO0vyve2/2VQWJzy3TYDvD?=
 =?us-ascii?Q?5S0Uph3YbLm48NPIpG12GXMByC6svMtZhbA5zGsIOSfxrgdAm6RgK4shtqSY?=
 =?us-ascii?Q?lkgc0ze89h7ipsq2o0T6YzXwFohVb7zKlHYab5fs0rkvJhW/kILm1bU077K2?=
 =?us-ascii?Q?rdqlBCqEA52MzTIamK71w5T8ssflp62DAmo2NiyR8SRHMKBYWfLalmttDdTC?=
 =?us-ascii?Q?zDr8Q+2aHhEWa8X4mLEGDuJ0odRAcl99FKTErPqGAUBlb0GSwPA2qmuafi3J?=
 =?us-ascii?Q?lyEwzx5G/vHws9RJJE/F/VttuC/6QdAW5TkLG67EBry+dajp0yjEtp+xgP6H?=
 =?us-ascii?Q?ARS/DW6BszNGOdkNHWM842X/cXZo0OTxHoQoZ5LddC2p8JZmCozrjGhYuegL?=
 =?us-ascii?Q?Gf7gkNLpZiDvaidzrV7S9YZhuGX4wkdI4ttDxyIXP3qRZcZN5tN8bpiAR6BQ?=
 =?us-ascii?Q?ZrhfL2dbEZ+Ms0guA1BM4iD6ZqkVPDjbKHb7ssoR6egBul/jAeuUGPKDNDKK?=
 =?us-ascii?Q?W33C2uEI6tc7zgq2D1Khys+sjm9PvLuJd7NHsH3fhh7r8G2ePVy+zB8sXH6O?=
 =?us-ascii?Q?h4W7ziDIYaOKmTmFLOfPpoQ2ucs/Ruq+bxPC137MTijzuPdUOReFDMLzmdXb?=
 =?us-ascii?Q?jbs0vhdmNw/LVjVLQHDMxtsRfBCHYzr8eYaFqq83qbGCGmG8WSYg+276QYUb?=
 =?us-ascii?Q?1WZ0vOk59gcHnybl+akPgMDr01D6nmtIUl6LhNTzJBXd7fBUDos8X00/2Vvp?=
 =?us-ascii?Q?tAveje31VCvIXdctbHe33r3BUGFoYGTQTf+3x2wdnbfeJ8pniArhbtoQ30hf?=
 =?us-ascii?Q?WXjQTU/MIneNwOX4JUSfg1rferYpAXPWRS69pBLh0FmvVeAXqW75mu0uVqeJ?=
 =?us-ascii?Q?d/ZMCrPb0nELhdI9CaIysYvZKDvbqCiwknc1mx8//rpvcPEp+5zhasjXzex/?=
 =?us-ascii?Q?H2TScJINoYkaXCFffnJSkd8LO6WR5kO9aTnth80pk2s7ScF+/+TqudHhJjBY?=
 =?us-ascii?Q?0IJPWSNpa5ifFaoDcOXYfD54Skg3HKApKQ0lzBcPJ1gvYsj1pbjjUF84aiL9?=
 =?us-ascii?Q?rEOChnO79nMIxZTR7JYDWu83L5fPoB16hVdVTlYlO1Ff7752VWFhlfCChft3?=
 =?us-ascii?Q?ZT1O/q5ImztDZn412EtkSsb3gfM2TUhkUcT+9B7aIrCQA3EQip8OBHAXPy5J?=
 =?us-ascii?Q?PCy/YXLeo7VAkRG6sCumjZQahOenjNLUHLLbhraIt5gRCIoCWF7WikOF0Xna?=
 =?us-ascii?Q?CPyZGela9z/oqvQMH/VrN8A6BV55VyHWUjgKckJhbw+yQlD3jc89/Kbm/ecO?=
 =?us-ascii?Q?df/ptzEIpXlAeTrtVh3MTbL7MF5mTbIiN9QK/toBpZgLuE5IB53WUMEUrQ1B?=
 =?us-ascii?Q?SLB7q01wg7bmtsiU/URfjV4/BA/gntdT?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:02:14.1809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32851867-8091-46dd-6b15-08dcd12bd387
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 00:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204326

This reverts commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388.

It motivated the removal of the installation of files in /etc/bluetooth
with that commit be0e796299b0 ("build: ship all config files with
--enable-datafiles") in bluez already does it. However, that commit is
part of bluez 5.73 while the recipe is only at 5.72.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index a31d7076ba..e10158a6e5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -87,6 +87,14 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
=20
+	install -d ${D}${sysconfdir}/bluetooth/
+	if [ -f ${S}/profiles/network/network.conf ]; then
+		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bl=
uetooth/
+	fi
+	if [ -f ${S}/profiles/input/input.conf ]; then
+		install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/blueto=
oth/
+	fi
+
 	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/blu=
etooth
 	fi

