Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01701D462BE
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:02 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web11.13053.1731509152535532797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lHy1Dmrw;
 spf=pass (domain: axis.com, ip: 40.107.241.79, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STwQbGLbO1WdNzfw8kvdqiptuyAJQw0385wa4hsqag1P2Xx2m5uPTZ+aXskDCum6T2tSqXIfnQwueu6t3GRaTOud5MA9wxfrkDJKfgCBrKscUwyiIJ/MPSk52W4KGMrtQdElCTk5iDSEbgHZhBnUQ+Um/jArm0nyHhXCJuv3IyK/Y6+NUR2SOoGOpM1BPTB/2tlDqusw45mvdInoCSqqPHMUbB7Svaz+Bgn/2wMTca9dtMg5kLmY/q3HY8vXbwFZtdKU+CaygKm37XofWZb3SXgsTeltd08Wphb0Gow1eSCzXBva8JLsq+G4pJ58EtInm92m8/M4kutBAv5H3BOCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTEtn8nL/hjtQOlC+Qry31xY5QzdU+2fFxJ+3EZzmmQ=;
 b=PYqFNBWoIABEOR0vdI6rDDLeHlLlfOviWr7C+uNSdF7D26Chyb9T7EKQwhszUUXY7HUYWJdvPFUYfwzYczq01WpQncoWuFmMj+mbtgIBc4viZOxHhzOL5qwZj8MIM9qWkjhLCJS64xLuH6d6HYJFL8aF5nocm2SEPO+4CBPcwP54OWzOXuFMERWUDUzDg4hp0Ar7S/FaQmlGEHYXNsV4jZRDqNS1l2wGsgrSWgk7l3LzFXHCNSxEt11WWXE3/B2DjSq38IQtxqLrCkCBUznzSgcgKoG8cKIl6Oe5U3UqmxYKSU0lzTS59zuEjQs92AoR5xIxj89UB99cKXlOwK9C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTEtn8nL/hjtQOlC+Qry31xY5QzdU+2fFxJ+3EZzmmQ=;
 b=lHy1DmrwRL2vurA+xERUO+IAv4tba7wAu0N4N6xmZPSsexi+7UJCi1JpxGROM5DX/TwLPGSQutz3ox+w2+JepKUduSPB/k//oGOLRjXKivdrNxYDJToTRAF99aYOk3tPIUB72nIbE7tJkGUkCjQ+e+gSnOwE7EaHOj3rZvMAL2k=
Received: from AS8PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:20b:331::7)
 by AM0PR02MB5940.eurprd02.prod.outlook.com (2603:10a6:208:18d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:45:48 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::fb) by AS8PR04CA0152.outlook.office365.com
 (2603:10a6:20b:331::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:48 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BB1DF867
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/6] attr: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:45:43 +0100
Message-ID: <20241113144547.3121036-3-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|AM0PR02MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1d5f93-4b90-459a-fe6a-08dd03f1dcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MwF+bBqlhXZA8+5cZzLOJSzADvcGXcnDwfV3+Vse0Dv8wrLA0dfBh7vyPReC?=
 =?us-ascii?Q?wUEuqLNJZszagm82QA7DIHZEGPcHWR+I7eMBo2NXwVzNFmgxHDCsKo21oQ68?=
 =?us-ascii?Q?KQug9N7wBw/MZMunUXMe+Rskj6qw8seGOXIYyod2hvuU51OMt/SkJJanIBGq?=
 =?us-ascii?Q?/htLAp+ZLBwiFPStTXNQfB1IKy4nQs6E8Qmof9n/wiz0GApRIO7PmXiqmGx5?=
 =?us-ascii?Q?On/ych/Kp4ltt68powjg2ORy4BDKlD7rLtvesHOLVtvr7GNv57KRsLx8xs6G?=
 =?us-ascii?Q?4r4H+x8VZ8wwJ4hMZDs8kGPmMykFi3RQNNcTXha0oQB/+JjA9VMZknKKUiGA?=
 =?us-ascii?Q?uAwz2vniT4XlXt2WM9sgkhncDhrI/TwcVcdytgw0uTz/wbKwgNpD5r3CghmI?=
 =?us-ascii?Q?8C//5lgeBWTfI8Uf79/QNG01GoiQe6gdiZ0SzclijzDnyG0YBg+O7iz/UG9r?=
 =?us-ascii?Q?fHEL/nsb0ZLiDasf/AvxNRg1ygUC7lBYTAsjsDT9J1P26dvY1zdgBTc5zpDs?=
 =?us-ascii?Q?t3AW2s7b/twsF9lKEvcWyxacuftmz2tE9/27sOR68Cnst6Q4aTfuPXjfoQh9?=
 =?us-ascii?Q?SxN6OvzGvviDatb3CKKAxnIcPr25OwlkmuIvAi6tYZGIcJthIHnA86TQkLy3?=
 =?us-ascii?Q?Ill3K9HqLlc3Bu9w06SpLsPYUzN3/di/TQHQY6+CP0uRotWzUGKF+/IFIJWi?=
 =?us-ascii?Q?UJv0q9Kqjw+211tr5rmdEChPxYHoaXhpy5Wb1SHWEzrrAJO0SBi78bwFPoo/?=
 =?us-ascii?Q?blwqN5OwZFyfd7qw+cT4+odl1a80u1GlGo1Jukuc9yinbjaBk7UTu87/0hJ8?=
 =?us-ascii?Q?w8+CPhwoQz1IHDIYzyD64xWh30rYlyz0j7U6LIoCoMcAYSnJlubB/f2LHx4f?=
 =?us-ascii?Q?5Eqq9rHn29TvKGRCNxjDU+/R7b+0FK9ndCnMp3A++33nA6qaDyD99tVqgMOM?=
 =?us-ascii?Q?+PiqUSja14JkOrwlnuJXLIbQXS66kPoGGjeqjoWVpmNdDw47P2hfuJ2gDR5g?=
 =?us-ascii?Q?P4EI8NIs7bYUiTsg3VDsWKmcybXtlX6cpEKCAIb48LWgpbj7ZaDsZ3t6dxjl?=
 =?us-ascii?Q?6ZdUyLFjW/Wvp/KMW0EuQdTwl/ADPaDw4f/jJfnksrhebAEE7Pkq91Pa3Cxj?=
 =?us-ascii?Q?iQiPd3yCiqDgGid4zUQx/RJxY5b1HWcb1Eeu29teQHJhTOaO6dU3oDYWvYmy?=
 =?us-ascii?Q?DLHrN2bBEvIk5hHUBhL8IIxoqy8IVXgGDkGvMbnaPtafKy6WLaNu2/1Hlq2I?=
 =?us-ascii?Q?V0Uz9b/UnpLCBjaBQhvOWCv1jFgqCj0QJuXZQa7szGc3rTINGN6+w/gR4OQO?=
 =?us-ascii?Q?aHATwYiKX1rXU7aDBrPvSBw7omw9yhpHIK6RWDUDMDzYnA20NF2ECoNO7Hnn?=
 =?us-ascii?Q?o50j2kr//jKGNinlHG49NB9r9c8u5BuszY08T084UWZc4IgQmg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:48.1122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1d5f93-4b90-459a-fe6a-08dd03f1dcb8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207107

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

