Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D812C41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:39:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web10.2112.1718159956879584673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=njl6V4vm;
 spf=pass (domain: axis.com, ip: 40.107.6.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMZuspeUB3HuPtiWDubB7WnRheWUkEvjmG5v+R+UrxMEIUClHEUz/UlLDaLtoecBDPARqUlsrMRTvw2zuhiKglFx53G8Dd4hofOseGWTQoLUunl+5T38xLUOnkPUkGDFhkHhHy8UIX0JqPiCVlqv19s3Uweprx/lir83x4q29iszmxwl2T4N4C554Cp6Il+FFWCGvVS9YXNdyqQgrtGavaUGlFItRKp4i33Vrqo2NZvbLBvz2oWGG+z92i635epj8/R65RKR3Ita0yoiO8SeF2AUWgZ+DGqwsBo1JbbbZlQ/Y0F18jlxKDut6W5OGS6o0xBVQ2mzmRkOcMgIs/40wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8VryeNb/t1de0Nc+8vS6T+HPLfX5e8wrvn15t/O6Co=;
 b=XVww3wxl2dlgLaax/xXc0S2i8GMr3S7wT/OH+HQNAI519GPCzK2/RxAkq45/ItfUEwVRE+z1Ma2LkaQELwljClV5iHojKC6RFa5G4HZitifaf1L3dhmRfcWQIdGt2u43eaO8w4+vb7AvGcN7As1P7T39141/8GzRrtBB1jb+6h8DpG+I/fbgTNlSUE9M7r/+n8taeVkXtoLpWH3vKn+IerdNP3D4ZorE0k/VDTj5jfdiJIdhcreDoptWeYin8jqMV8fbxTeyhpcGgJBguLsG4suzXQCnm5OwGzAz4pxLj0bloGkEwcb9PMbn36qT2tH14loUntMk03BPYPw/EqjIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8VryeNb/t1de0Nc+8vS6T+HPLfX5e8wrvn15t/O6Co=;
 b=njl6V4vmgMTr58ffLos1MV+05D7uqW0fkUD8sfUU5vgOm3NMR3UHCQMIzr9LZhpUipod3sOn5/xjYSB8OY98zJglS0BY9DTdGNPs1iC41dePGMVZX5ccGpiZSnQixXQahZ8Bv3FV99LBe6V/wdwi/4XosktXfM74BJoFa0wnSDc=
Received: from AM6PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:6e::19)
 by DU0PR02MB8314.eurprd02.prod.outlook.com (2603:10a6:10:3be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 02:39:09 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:6e:cafe::20) by AM6PR02CA0006.outlook.office365.com
 (2603:10a6:20b:6e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 02:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 02:39:13 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 04:39:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 12 Jun
 2024 04:39:12 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 04:39:12 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E515D107
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:12 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 45C2dCR41493316
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:12 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 45C2dCQT1493315
	for openembedded-core@lists.openembedded.org; Wed, 12 Jun 2024 04:39:12 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/3] oeqa/selftest/devtool: add test for modifying recipes using go.bbclass
Date: Wed, 12 Jun 2024 04:39:08 +0200
Message-ID: <20240612023909.1493286-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240612023909.1493286-1-pkj@axis.com>
References: <20240612023909.1493286-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|DU0PR02MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dd1cd2-f245-4050-ae41-08dc8a88d8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|82310400018|376006|1800799016|36860700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1ksO5hgeJOjChpSlRTs3/QDcPZSbm+AjRWKJiFnQC41Nhf4GZd1ZBphmztrU?=
 =?us-ascii?Q?4JBnsztfTrcmpoAxTfi7cVzpjbrsucCPVrHY2FRxgAGwQja7Qo/72aEce4Fx?=
 =?us-ascii?Q?KTg/bMoHppdZ2xpEujOYrGftMz9n72qpsNs0l6ysgDlFKhsSu4XAe4rAktqB?=
 =?us-ascii?Q?kwu/OalFaOjvn+iCkg/XOQcOMCl9J1lC5Xhvv27ue0zRq/fb8Ev3disBV/W9?=
 =?us-ascii?Q?18Vir32oQMXlCWGsiq8bQ4YpnGTb4Z1XeeklW7EO8XpvNUl2vRJNUCAAs8pR?=
 =?us-ascii?Q?vCV7eW5K8DMFiAdMH2FvNSwUnjBKW52IzkVaxRGn/vDqP+tGPFhxNTqBDktE?=
 =?us-ascii?Q?/KU6is/LnsbBeqP2D/EfkOk7BzbrSpRV/tDuWdGm8CUZTPBnOPAlTLpcpT6W?=
 =?us-ascii?Q?hZskSGRH+Hqs/elKnmiafGrwGpyoeOPS/6LeJbvLIri1kDAnTbnWj1Hz6SSI?=
 =?us-ascii?Q?vcgNrIYERBJM1mOnn4lfORfTNXZ3NgONnatt0Dodvpfae+uHgL4a7K+ZjGxK?=
 =?us-ascii?Q?8wqpIEZnuzNo05FOHjMsqw0xYA0u66qRamQe8IXON+MnZUbmAiThCZXAArQH?=
 =?us-ascii?Q?/eSd1n92ldFckF3k7/MWWYSMVM0ca5dcoaDlKJku/Zelpi6LV3GNIvUZuiUd?=
 =?us-ascii?Q?y3CGCf7Jo/OYjJXw8rLCuXpxbhkOI7ZF+/cFFIYG0hkEIboVNTrFWPD50Se3?=
 =?us-ascii?Q?0mdzIe8Z6tIqm4+3hPAqCzr2hcG15rjzjOkDQketJ/tpaGEy86LP5H8q7Sbt?=
 =?us-ascii?Q?U8GCrsA0fzaEk1JvXmirkkp+dBgYR1ZJ8nMQ05f3T4KubGPDoE5DG+Y8bI/y?=
 =?us-ascii?Q?3vU9KOOHbHEK4DMh0FL5razAY6LcmXQQ90KXYE1P+1LTx88sHqxtjlfDV3WA?=
 =?us-ascii?Q?WFTQYyMmPc7B30bZtzol/6/SabIQ+caJViZQDDt/uC++keUZWycuM5Q8pxk9?=
 =?us-ascii?Q?YOFmxjzFqcJX3nPlfqcnFcOpZNr85H26GtK4TYgKm5ayrzw+lyXfwdC5ZZd0?=
 =?us-ascii?Q?nsNEIGKLBTCp/Aq0glxSJVPiF7EBpwXRsBELIg8BBSsgU51g9uTxu2/6hSSh?=
 =?us-ascii?Q?7k3D3aiFT22z0cY1mU4mmUnFVQOP7Ifkz7TcJpLNGmFeqlCBfldge07nd3DM?=
 =?us-ascii?Q?6U5tnykD4pZ4B2Op2B26INYsX19puHM44wLu1e0P365kQ7EsqC0lWKi1zvi8?=
 =?us-ascii?Q?AaGi6tnYhfWyzVDCCsDL05DlMw3OTqDFcmejqa++pTsxlPaXpc15NuyT650z?=
 =?us-ascii?Q?7eNS2tXM95TBK/p4HpDGvCe8GrMLIsNbc02kG4jZT3vk/UBixCNkrkAh942Q?=
 =?us-ascii?Q?ypqE0QIul01kcgSrMgWR4iDbMPo5nkcjHx3rUwBxmYqeHa2JGuaVJoZzp4K7?=
 =?us-ascii?Q?gF+k0p6nbJve38vxvPUqeKdAl8IvzKwZBSFwApUBg9fA90dcEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230032)(82310400018)(376006)(1800799016)(36860700005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 02:39:13.4876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dd1cd2-f245-4050-ae41-08dc8a88d8af
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 02:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200555

From: Ola x Nilsson <olani@axis.com>

go.bbclass uses a special do_unpack function that causes the git root
to be different from S.  Verify that it unpacks as expected.

[ YOCTO #15483 ]

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fab0c737b95b8d0c0bbf58336bc308776c956406)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 51949e3c93..cc4cbec5ae 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -749,6 +749,25 @@ class DevtoolModifyTests(DevtoolBase):
         result =3D runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
=20
+    def test_devtool_modify_go(self):
+        import oe.path
+        from tempfile import TemporaryDirectory
+        with TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            self.track_for_cleanup(self.workspacedir)
+            self.add_command_to_tearDown('bitbake -c clean go-helloworld')
+            self.add_command_to_tearDown('bitbake-layers remove-layer */wo=
rkspace')
+            result =3D runCmd('devtool modify go-helloworld -x %s' % tempd=
ir)
+            self.assertExists(
+                oe.path.join(tempdir, 'src', 'golang.org', 'x', 'example',=
 'go.mod'),
+                             'Extracted source could not be found'
+            )
+            self.assertExists(
+                oe.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                'Workspace directory not created'
+            )
+            matches =3D glob.glob(oe.path.join(self.workspacedir, 'appends=
', 'go-helloworld_*.bbappend'))
+            self.assertTrue(matches, 'bbappend not created %s' % result.ou=
tput)
+
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f =3D os.path.join(path, *paths)

