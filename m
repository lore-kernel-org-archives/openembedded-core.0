Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60F0D462B4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web10.13421.1731509152484423555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jvVpdhP8;
 spf=pass (domain: axis.com, ip: 40.107.20.57, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4Vnd+M0XW0SrQ50I4aLkMT7Lc/qDSxaHAGB50VztiiFaNP4Q9jEdThUHlIiyazgiZGQorvB0nUAAqSbuS84IJUpA8cZpm6OtzUcCvcsZkK5V0SlfVUE78JTUnH2qjmMJOoZPKf0EB5jWe/S8xqSyjWAyYMgE/NEJEJsOOCT3N5AiGjiVeocPKh7btrcXSUp2rwk6Wm3A3ypR+ad7PTa5zgzl/4NmMWWyo10bng7XaB1S2Sg02KD9TphJL7fLRsefHDXQ18MtYemN69QaFxM4xiIzW0mbDtlo95BK5d/Jn4VQjS7985nvEeOJIHR8/mUND7JxiDyq6Yhepw69s8CvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvFp8hTamBR2Ols3hLy06cu/gk7oM3hm9ZtRGst4yEA=;
 b=ek3wY+oUm5LmNawY9LC5vXgqIloVb0ovAnk6Rrw0tSStGBm/g0sswD9N09mD1DmEONFGjexw938yLg0fv2tL1A4B/fjVqXZCSHwem6uF80lUL1h3VL6pRIuogKcuCqQzf9Wu2CpMuh7a9s1WkWFG5qQuuTtPjbIADRyFzfg2HqhVBLJ1ZTtkpFAawJ5yjtDG5dACI0EPYWpIRiti+nbmICRNpvhVNyx7AiTJt77aDqGEW0Z1xSL3WsfQXwMI/t6iMFICnAvQdOPSdzjIzXv6anrKPMOl49x+PTPFNTb0dfyJZzB/C27JUl9cgl35TKXkPcwZIaEcyGyFI5CGevrGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvFp8hTamBR2Ols3hLy06cu/gk7oM3hm9ZtRGst4yEA=;
 b=jvVpdhP8yBp8IvIPa4JC4vWI6dQE2tn29pWrVKwunP5TplNUausRWLiv7JaHji0KGVmjqfS3OVI5izUiKol2vDnUcpXHo4m6/lkePXA4eUz0kI06WY/krv0JKs7wFzRC2bPm7yVQoBO4A7IvcWPY8woHhxn+gpD0ogsIuhi1p/U=
Received: from DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) by AS1PR02MB7822.eurprd02.prod.outlook.com
 (2603:10a6:20b:4ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 13 Nov
 2024 14:45:48 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::48) by DUZPR01CA0040.outlook.office365.com
 (2603:10a6:10:468::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:48 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BD7D288C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 3/6] sed: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:45:44 +0100
Message-ID: <20241113144547.3121036-4-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|AS1PR02MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2cf0a9-94fc-4953-0d9a-08dd03f1dcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QKxRw1CDOMh7QBUX5QqX9+WCSEvedv+gYblkEtjr4MbXctV7gzttZBB2XFLJ?=
 =?us-ascii?Q?Me1YBEI796RS0jDiZ2TZLQ0OmtdkdEA/hTNCZSXNJNUNL2BeHTjfRH6Xsz4v?=
 =?us-ascii?Q?2CwEJqFihvjxUfb+3UDDmCC5j9xOg86U8eOy7HkPxk7L2BwKZlRE/tRZmKqr?=
 =?us-ascii?Q?AeQzKPH38HdzsiQ2bhFfdE8Gu96eD/m/ZvGORl0TK/HTOs6SUVJu1028T/ew?=
 =?us-ascii?Q?yOMRa5wTumGSoyiQ6hcnB/lpfSG2cSUO0rzDIEEGeB5mfgfI1R/h8YoRlf83?=
 =?us-ascii?Q?xgpX4XvjknwZpVV4JYjXJmq2/hiSZqoekvmSF5yzyFFPGUzItxZbB9hBsJgb?=
 =?us-ascii?Q?momUyznRVN4jwh49nQshNAB7ZtZX5JmPq0DnJyf3axTlfZ/jeVuDKlOIzHwb?=
 =?us-ascii?Q?SvdtnJQfn8Y/kKQYPD7IdzXi26jbWs4AKpSv7QBstEqU+A/CB7UAYbWRQdmp?=
 =?us-ascii?Q?qXJO3NtSJQtZp990Ib8/VtphqkC0sPTeeoxCFsq+nWHU49JjSZqwYmyuDb9H?=
 =?us-ascii?Q?QCEKGFqj+LuL5TbgM505DtjKzDn+1g4XcvwRv9s+rg/s7JKIXFrX+a0AHMl2?=
 =?us-ascii?Q?KKfFjxtYqO6YYD1IUHPsPkifvXOK+USl1SMmc8UaTU7aSpRjcGk0fskQB2RN?=
 =?us-ascii?Q?DM+EikqHROMlJdpd5oEMUn66uzJzp90tLQFgEglsbXsVr0KG0Hw3wHH4PiT/?=
 =?us-ascii?Q?5UYBYWIYoh1YsLxZRWNwY2PgxHdggAk5eg4i7BVS4YB5el8q5dowq1XU//qU?=
 =?us-ascii?Q?VZdTOabqj+UG0Up47WpMQYVy35fexkQ/utXGgcBv4F4rA+tyRq4nTGpqVmGx?=
 =?us-ascii?Q?05UJeHMQGOVoTlsus4bZLuw18Q9kbx4VPs1z6UcCHZK1Vy1ZWpxxoXF+Vbbw?=
 =?us-ascii?Q?udIgOXAh4e/smP84uy2Kjkl7pfYJIQxJfWAnM73Vo3LeG/e9tLzKZ2D4B4/v?=
 =?us-ascii?Q?npidYoUnGTX6HL3dXI3tl1CLgbOy8ryCxJdEnqvhYHeApkRuEuz2/eBuVeNE?=
 =?us-ascii?Q?4OKZz69WeoGtFFpPOspCEisu/G70/na9Vjt+Zuk2Uu8fDPhGMG17RGe+ctE3?=
 =?us-ascii?Q?vwpSrewwnQ8a6i6kz2aKcgrySvNw1MQIJG7nN2GwaSX82P6sU9FKsDugTv/6?=
 =?us-ascii?Q?zosPo3TanHpNbU6yZhEkf+quYIZkXBFwIjysBhcOjLiPOXEcsRdESRR8+353?=
 =?us-ascii?Q?C4rtwAyWMteBqBKvxrLYitUnH+BS2B4oASTAHFr5AgTY07NL6uXTVywvCJdv?=
 =?us-ascii?Q?NXbmBqv1Cen3o6ewhYtoeVAyS6sihdob6k7Z+4tD/7HLLt9Zc/Tz0+ke8iTZ?=
 =?us-ascii?Q?wjIoQqjKmGvAVwd+wKRfNBUuvfyJHD91PYSBLgw1w7D8DGJ8DiAebOzfzhXF?=
 =?us-ascii?Q?Xetj9XvmWvNw7XWB4VIbScsajChC8njGPdb4UuVmcr5GekeZtQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:48.2608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2cf0a9-94fc-4953-0d9a-08dd03f1dcd2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207106

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
 PL_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
 PL_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-extended/sed/sed_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/s=
ed/sed_4.9.bb
index c4d89c34b2a..b30ddc73ca6 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -59,6 +59,7 @@ do_install_ptest() {
 	    -e 's:abs_srcdir =3D.*:abs_srcdir =3D ..:g' \
 	    -e 's:top_srcdir =3D.*:top_srcdir =3D ..:g' \
 	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	    -e "/^\(PL\|SH\)_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
=20

