Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3ABC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:53:43 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.69])
 by mx.groups.io with SMTP id smtpd.web10.35444.1715936021763053717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ZJLWWG31;
 spf=pass (domain: axis.com, ip: 40.107.241.69, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmCVSEzIO4wd3XqdgcPqRDKbRgtuwTJzhRwtJN4datYQaWhHI+eu2VEpAJJjziyucWs+6P962UlBJDCqjIXZ3I9bVbs1vrpCDz5NrXWMZEYenjjoixYHXrLqhZ401npds9yonGq4qrXHC0BhS4CRdz5ZSEGQ3eqvK5Y8T4dRdbwsrcL3ApiIUHimuj6+6kax1ovsK+Y02fAYBl0Y6cPnjtmy9Wg8dSeWfiKXNMnc8qZCZayRcgnPTCbnBV9W/ITrRJ/ZDmLxA4R9SZBGoCoBD4hVWApGf9hjWVm774AS3DpdQ3U1PQ6ufPYe3ZCvVDSz7OWLWNvl/ur/xCrB6cCVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5a0Llk34NWIc0XmspeVsgwpVIthoW7q/ueaNk85aLw=;
 b=RrFxK4soU5/A02EDO9gFNPro4F4H5PsiIaSjD045HbdNkAUBfP/Tz6atC0nv4DTwcxE7H2wcIVW413pCB/YxcPg+4ZQEg++DQPP3EHm9q8+AortKZtEj6tQYdpgkq07heAqeckXhbeNqZsjKNaI4JGoyOqzrJL/Xm2E9lJq6xSxyHBciY2dQhFY8Hi3MmJ3jqCNkbJFFmSDrNzMEK1mpYF08d16tBrzI9WtcKojqjc2gZ7LRFN6Gjj0oVvRnKofyj+cEn0txrBIh/QYs5VIX2YaRPloJPSYhM+TmNSGHfLuA0eYy2cQYlXzjNz1WDM0HoZcrqxQ+CATTwayO2B+usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5a0Llk34NWIc0XmspeVsgwpVIthoW7q/ueaNk85aLw=;
 b=ZJLWWG31s1U+f4Qn2t0IsC0nNXBX3EIdVm/wVw9FOM4COmqJcRUKzqqG+5rE8Ys0xlDThJiFmvioUUbrTJCM4Wokpa6OkgAA3Rlr9D06KVHEBYCkpzWhtNTZgRZCvOQ1yygMTbmWnd9zRsJf8JJgcCtczTGB2OLmdmuX/fDJPxQ=
Received: from DU7P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::31)
 by AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 08:53:38 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::e4) by DU7P195CA0021.outlook.office365.com
 (2603:10a6:10:54d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31 via Frontend
 Transport; Fri, 17 May 2024 08:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 17 May 2024 08:53:36 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 May
 2024 10:53:36 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 May
 2024 10:53:36 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 May 2024 10:53:36 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1922D1597;
	Fri, 17 May 2024 10:53:36 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 1B56B4123773; Fri, 17 May 2024 10:54:10 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH v2] oeqa/selftest/devtool: add test for modifying recipes using go.bbclass
Date: Fri, 17 May 2024 10:54:10 +0200
Message-ID: <20240517085410.2598110-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|AS8PR02MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aac13fb-e2ef-4345-ddf0-08dc764ed725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?egaQAt+PcsiJKD90tk2MH6N3sKFUaTQ5p67qZiXy7n7JFwQ7tmYS58nku7e4?=
 =?us-ascii?Q?/yFMgPm4wALgLWGy7YEF1vYocQC8vD/SubWdO9244KlBSfGSEu22ZpKoOSOh?=
 =?us-ascii?Q?/WBr4VZ3E/JhiMiMpV8KF6gvCdil8MUUTy8E0niuSiX6mVLD5zkVR2y5ap7G?=
 =?us-ascii?Q?fEp3AcPhwmycZqOALEunfTP8S1F9Pwd6gRKwElJqHurZ7cR15Bn7UB/7WekF?=
 =?us-ascii?Q?hi8kB6BLenmGT5uDd/iPT2HIBaYnci7k5FPQp9ZqUFPmXMjWkdgjnT10YQ5s?=
 =?us-ascii?Q?07agfS7F+Pk/MiJU1/ruk/mvk50RqTerh7gIka7a2TF3batuQ1kmEw9jCImB?=
 =?us-ascii?Q?NGMoJczf+0WHlnlX56F+ooa3+Ov2SlDlMBIFhP0KSNV6apTKvwMMbyXsip+P?=
 =?us-ascii?Q?iuZdW9k++OzOP12jCO6QzGZOf8Y2Ekd7TtgCaolHN8J8igXBeq7uzLoZ3rDO?=
 =?us-ascii?Q?GlVkKHh9oiWWwJJnceEv+N7285YsH/4No3JCZqNTekg9FCGtaTlwQ5ZnHIRF?=
 =?us-ascii?Q?GufFMNBwwCuvTmjRvj9NJg58ttEU4QYLxKnQxj77fKro7YfGfPfDICuk3qMQ?=
 =?us-ascii?Q?9WAYso/mAcP4GMY8Gf+Njhzw55DFoohy31+yUYLw/GNhnNCpFyzJwSijarrI?=
 =?us-ascii?Q?z1AzMQQFg5NaL1ePW7IL5vem747EvGt11eakdhJwxZKkW99fPTvDTSnBY6P6?=
 =?us-ascii?Q?uRb2PAyB438rXcjpZiTrYaAQ6dkGAd7EfgUr8u7AXU0Hzmngh1gOdeF4umOq?=
 =?us-ascii?Q?CMuH6MklqRpRb9a/k3tEgyFo/JyWzFmb2AdnL8/eJumZI/IatlETl1NHP5Sb?=
 =?us-ascii?Q?Hz1+bxHLTtdj98xA0187qaNar1kQjLVLa5MRn7ts+62JsPKnU8eBx7dehmg2?=
 =?us-ascii?Q?MxiTzoH/mJzX0m/bDezAoUMSXdO1WCUdE5UeNy1FyXO5LpCXVvhK65H7JC0Z?=
 =?us-ascii?Q?UEolMT6gvg0excIeU8sN54t0Uh1/vyc/9iQqmH+h0vgD+W8Q3tJofRbzHU/u?=
 =?us-ascii?Q?eFV87PhbSHmPXN5ujhfEQTNXLMi3yaVnm8skL6vgq3lwdbevn3CABwY0GJC1?=
 =?us-ascii?Q?17p5+gJ3xdJhKNhJjclwQz/H+O2WIQ6pXDN+97b5RpzwJy0wwo/n82zjlU6l?=
 =?us-ascii?Q?HKc071GAc/DJHHwHqKpSkBcrcIJMQMLf+VLi8hCZxDm8Ra1UidcS+t+Exc7r?=
 =?us-ascii?Q?jEVjKavdeGbRShh4MV/rJSnCZcQVVFJUf7zgNkxz9OFbMv8QTBxOGAixI/2h?=
 =?us-ascii?Q?Uxmk8SgMo8mG0HwMypRdAzxv1xZZyeasiyexNgMCsG2zJ/+UM2ja47MPs9T6?=
 =?us-ascii?Q?kSNFYFCOkkWnvyUBb86eN9neiYe5nGnNqVIRqzPPaQatfRIz24trX+Rrjt6R?=
 =?us-ascii?Q?kqRIv9v6SKpaRrS/0Yd17gtdv5aS?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 08:53:36.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aac13fb-e2ef-4345-ddf0-08dc764ed725
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199511

From: Ola x Nilsson <olani@axis.com>

go.bbclass uses a special do_unpack function that causes the git root
to be different from S.  Verify that it unpacks as expected.

[ YOCTO #15483 ]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---

Changes since v1:
  Correct author

 meta/lib/oeqa/selftest/cases/devtool.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 882225dde3..fc08906117 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -753,6 +753,25 @@ class DevtoolModifyTests(DevtoolBase):
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
--=20
2.39.2


