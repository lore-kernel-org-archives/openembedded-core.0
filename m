Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0082ED462B9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:02 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.57])
 by mx.groups.io with SMTP id smtpd.web10.13422.1731509152695008748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VgRhnEtk;
 spf=pass (domain: axis.com, ip: 40.107.241.57, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI5L+IZbtG9QwZkEsaDEjTxdjBynGYdhavw8NkGba+M715GEfHZkaxJbNtjNv/bRyRKec42vUvuJp4ZaNDB1g+dWev/KVCuQL0S/QUAL2l36sP7IfxRBjYTqtaWrhJWEIXV0SSVKApD6sWk/wKdUjIuDhtxsRexyyEZEwPUGnVucL/AY5qJIfeMKfOvA8fVeTdS+q9J9oLpQsrQVGauAbLZ9dj9PyZlZMA2oJDyBqhPS7sglfElRnH+tehlbHuSdFta69CXHek4bhWxWuYEdZhMDInxLHH+E8gbRr8ZjWE783PWeEdFugc4mgXR9Hgg8Ykvvt2bE0fQ/ES1F050FWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHLI7fsfoKh49SQK2ToDksIDwFH/hs6YFLAiCyIAY8I=;
 b=qN1TfWzoqTyoi4k6T2NgMttERU+Xs56tw+ya3xiBC5Kn6IE49rw909ZWUU80/rsfIv4+gqhR1A0T8g/duWJIufydWrr1ntgAAGtPIwcV4siW8R7iEfnFsWF3aW5qFPqE9MWPcIeGdXSpQJR31r/AKCMRfhNWGgc3bjrH4Zv1J2lM2yZzgn9zNEcof1xznrvJrMWQpZdjjH9YeFFZ82xjfeSNvgdZgxk7qC7cZZwGeFxNhsqlPunwgkSJUdxbApkDdNLkU1g4fcjFtip6MObd20YDVtmAsbXGtQdW+TxVvOMpXgZ7zL63QJf2g4f8c/b35bLCblZ6bOmKYT9YQTu2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHLI7fsfoKh49SQK2ToDksIDwFH/hs6YFLAiCyIAY8I=;
 b=VgRhnEtkPch2GXb5TNqbUTvlML4Ez/zyOuLea9k0veTL5KHbTN0kfnO6vaAFOwqhfp4zGWxlAXCB/tGJbH9R5v36dRYOS1eeSUa1TeyLWEvsXxXG7ZrlXti744JSjX9D7ePS4nhfp/mYqkYKh0GszMF/guFjDF0Nb/qfBAg7OdY=
Received: from AS8PR04CA0158.eurprd04.prod.outlook.com (2603:10a6:20b:331::13)
 by DB9PR02MB8370.eurprd02.prod.outlook.com (2603:10a6:10:399::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:45:49 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::54) by AS8PR04CA0158.outlook.office365.com
 (2603:10a6:20b:331::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:49 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B837881C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/6] acl: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:45:42 +0100
Message-ID: <20241113144547.3121036-2-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|DB9PR02MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: c58bd80b-35e0-4809-7fb8-08dd03f1dd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OF2zcqhUtI1CubBau2ajBhkAZDeE9Xbamdy35yjTmeXPSKssUXG19nZVsUKq?=
 =?us-ascii?Q?Gq8MXlOEoGnM6T6jjVnRRIjccbF7UVf3rNHPOV4iVFtCN5p9Ww6QdWccY5yv?=
 =?us-ascii?Q?FipXOEHsly1kb+ybEuv/QIyBtJYzWZ75vzul2JoJKVoW3SIcEDL+D7pXGB6C?=
 =?us-ascii?Q?AD8//Ub+YEIZMpb+lwkRvu3YymxWHLcAP3+pZ7wsGR4nzf9DgzfE79VrSH/4?=
 =?us-ascii?Q?7NAUj4A/V43Ud14249aFiI4vO0C7oiNBwfNNQCVqiav2dsuwNOcH3nKq8EUx?=
 =?us-ascii?Q?58ABkEIv9DExEfith4EZPcTBpIl16r/6KpqO1r2q1d2wk/BgnCSjb8g1HN0W?=
 =?us-ascii?Q?h87esu4oZeae8My9PY8OMc4xxEEjf85QXOmHGkTH8ger3/TdWXXKOHbDHmNE?=
 =?us-ascii?Q?6yYqxSZQU9JzRl9nICmM1Oq4nXHmREfFH5iM2rHfqSyBbm89OmIOqgsW9NYL?=
 =?us-ascii?Q?hf6O2Z3Mc8dVMlE4xoza2iASxetgeZzFXbRrpnI12A7/7hp4stt6+sg5N7nV?=
 =?us-ascii?Q?nCoMsP3PkdCCE0DL8DWBSuDfXPSbtuD/rxKZ3a5HRmkN+tge7U/2nclPtP4D?=
 =?us-ascii?Q?Pa08PIVOLTdWzK7sxDp+tA9SCZvvmciMWmF1QRPVGAjJPzJYOIr5IleJszpR?=
 =?us-ascii?Q?Uji7zl/jLCv3c6OsOnC9Vso0jiQRHt4qsIJ+HWdJ+BAZNVc0ALqzAIsoFpB4?=
 =?us-ascii?Q?snwdGqapxyKZmEuGPXPQhTDabEAhONlmpP2EY+tgY4qVNewwcCp84LP95PUK?=
 =?us-ascii?Q?fOVBeCWIgtFc3WV854lVivx0E2dGOPm9oZUQDmv3/sObygFQmvKoZLckWMdt?=
 =?us-ascii?Q?oa3hHurDn1eNR5iVf84THoGegv+kUCYOSfbm0UIcK0rwR1wwPsgjNpUKsQxj?=
 =?us-ascii?Q?SJEy/xVqBsZf8wLaK5XJFt9JJLtJjavpj6iGk0ktuxOqgjUwn0UtJM0In7yx?=
 =?us-ascii?Q?n6AAn9pgRh1eI6MmShkv4JafbVitnyqLy4dVQoU6faVYDAgT58OsQWJFMIgU?=
 =?us-ascii?Q?FX7NaqiqudQcTJJpKDBG8+FeMPs+zpxTnlrzqqLV5O1y8iousji7PpW7nt1z?=
 =?us-ascii?Q?6Wz4nj9y8nyh3qryX5SvidliWYdYOg9ZPr4paRpmG+JHAj3R+myOLvxe56f6?=
 =?us-ascii?Q?dODlVQH/fKabr8gnLgoe4rtAprNho6lwiSm2Rd+2LvUEEsJCRU4U5XLbv1yY?=
 =?us-ascii?Q?WpPrhgkrKd1DKtDL1sxZz1m9HZpVDrGptSOGnW+fpet8U4ve/Aaoheh0trhg?=
 =?us-ascii?Q?24pnWKzi8ciaEr2q33vxQpDIeIgIAFt24XuWRRf9SBhoHTpQXN9twZV9rOda?=
 =?us-ascii?Q?TU4Fw5xsimhnSTO80XoggJ2TVri6RKMkNPnDVXph433wwBjw8xaGGL2Fmdmn?=
 =?us-ascii?Q?ji0xgv+4U9XmOSdbEw5b3TDx3nvN0WgZWVbslTiVf8HsVx8qEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:49.3935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c58bd80b-35e0-4809-7fb8-08dd03f1dd7c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8370
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207108

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
 TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-support/attr/acl_2.3.2.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/=
attr/acl_2.3.2.bb
index 61784738738..dd959a5051b 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -52,10 +52,12 @@ do_install_ptest() {
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
+        sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
+	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
+	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
+	    -e "s|^Makefile:.*|Makefile:|" \
+	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -i ${D}${PTEST_PATH}/Makefile
=20
         rm ${D}${PTEST_PATH}/.libs/libtestlookup.lai
 }

