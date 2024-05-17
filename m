Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B34C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:56:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.35474.1715936183345131307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=W01GmWWC;
 spf=pass (domain: axis.com, ip: 40.107.7.42, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0PAHZvYTc8SVpvjpFljsXpUrOKzfXeDzlrwZHODhDOUsdv0ZuSV0xaTIsfivKz3ycVocufjomvkuWHmxVxGaPG0HKVtcoSzeSdpbiE28+aX6gPSqRZf21ktuzS1YKX3mvp6ugkZ/7sdUzrQpgm34EpebtIaa1Q0MDGW85Zo488oiaINqP/84ycPzYtUQRNcaFDSeKGgj8CZbOMe7X+9dl9UcO5BeH5qjaVzsFkviW0kIuYioow4w4mw0bIZdSTZ5e/x5/W0ZLc+T5p9k+ji+MABg5bcekJxWlE61lC85sLiA4/f32NYkzVtxjb6xD2X7VZuDBOPvKhx2Iy4o8Z0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0XbVuAREftYKxYYzmjQ+/EBVeZ9BX+34PbQYedIG90=;
 b=gNE1aMXblrCgGV4luFtu/k+Fk3PI8cULdZcioYmyN4jNaYuC8kK51lyGzw+2t9jhkXkX8M9uxa2iRXpp24hpPJkFSJuFeSk5wbBrp98UIoB/ulQ8GEZRa9cSln8umT8DD7vA0ZIqoHfO309qMc9qs5KmRD8hXdeFmte/t5uZ9RzEpCRPMHqTD19PSlZXEoowlGHzk+FuWmHCbe7tlo9Ek9w6BnH13yWEMMVtykkfYbe3qZGrWAedShcqfbNjqwQpBhRZvc7/jBxjxZGx1Es4+E0P5coJ0rCb3zoblxspIV6EEnrI80LzM3a/wDQ3tpA5Oik7hp436IbjMKfJb91YTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0XbVuAREftYKxYYzmjQ+/EBVeZ9BX+34PbQYedIG90=;
 b=W01GmWWCK8QcgEXjw8wGVADCwqviE2+iZtf8P+uflRRdlBHQTCRvchImxbsYqCkj6/9aTRBY5BEN9mrfg42vNRLucxj9K8Z5RAoJEGfv1Fb6Irg+ZhfPJa9uy5SF7bxcYHgwnp+21q91bJzj+My+Q5sVi+WJubX6Gsv6wHIVhqE=
Received: from DUZPR01CA0337.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::10) by DU5PR02MB10514.eurprd02.prod.outlook.com
 (2603:10a6:10:51a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 08:56:19 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::15) by DUZPR01CA0337.outlook.office365.com
 (2603:10a6:10:4b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Fri, 17 May 2024 08:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 17 May 2024 08:56:19 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 May
 2024 10:56:18 +0200
Received: from pc58073-2410 (10.0.5.60) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server id 15.1.2375.34 via Frontend Transport; Fri, 17
 May 2024 10:56:18 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: <olani@axis.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oeqa/selftest/devtool: add test for modifying
 recipes using go.bbclass
In-Reply-To: <20240517085410.2598110-1-olani@axis.com> (olani@axis.com's
	message of "Fri, 17 May 2024 10:54:10 +0200")
References: <20240517085410.2598110-1-olani@axis.com>
User-Agent: mu4e 1.12.1; emacs 30.0.50
Date: Fri, 17 May 2024 10:56:52 +0200
Message-ID: <jwqy1887r57.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DU5PR02MB10514:EE_
X-MS-Office365-Filtering-Correlation-Id: afb40789-0d5b-4f0a-f216-08dc764f37db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FeX+yf6yVcm+6rS84XnD4gyoKVVoTraYGPRpuoPJbbe7CzGiDyoTmrwd9yfg?=
 =?us-ascii?Q?d/VcVBIS6Abg8xTBIIruNBikADkumomDdxNLZV+hXYV467YELxRp/g4bbTyA?=
 =?us-ascii?Q?wG2Zi9WyDd+8dU72v++xE0mV1E8qO6ZW/50tuQJD48+Gl1F6OzzY777zVgV6?=
 =?us-ascii?Q?Mlng6NGSjAs59Ywm3qjrBO0A2GyGmktqONHVJ79+QERqwjMiHvhKFd+fECxz?=
 =?us-ascii?Q?bjFohtrZw2GUgu/ysZFc+DQ9G5IlBwsmRor+c+YedF7fypWWSSAEUyFqXQYP?=
 =?us-ascii?Q?omXtvi2JmUlc4r0+7fbOdzaoDO74/ieoRYIDx09a945od54ZIqb59Nl7RkhU?=
 =?us-ascii?Q?cgP58PU9WyimKf2S2czXwGAtVvjcteo6VTBV5zHqsJmwzNsOJH+93Eshf1Eg?=
 =?us-ascii?Q?/N7RZi6S9Ai0Wd88YmB8wpAGJTWSwJnTc+sncv5nPSa0lsTx9aDd7BAAxHZ9?=
 =?us-ascii?Q?GM9VO9Llomk3XyzSvpddRH90zxX8Ak6GxU/jjQmDtpJGirBpKnlA+sOlU832?=
 =?us-ascii?Q?y7vBmYAbrWQPEa4E6a9J/Qc7o84ytYlX/u//UOFUj1Hvgl5Qmw5VG8tQCN3G?=
 =?us-ascii?Q?x7OPpa+Bq1rcLgsNI0UqUN3Sp29+xniQN65LGDwJvvXrtkZkDxYSzFfS78y7?=
 =?us-ascii?Q?97OxsDvxb/s9xwDh34HLrAU4BaHALseIzmO/Yh4pXd6hjdBXkO7CjJMW4Zhq?=
 =?us-ascii?Q?7U6dCS8khasHTY6y6pzOd8oPTmL73AkZ2t3kIGOQGkbO9xLD2HSlshx4X/Qd?=
 =?us-ascii?Q?u88sGUP37FXiGw0eLv1nxryAifH6oCT8ZV3O7eQKQmFtX97S9p2PtUsvv0/C?=
 =?us-ascii?Q?csJmU/yGaSEDdbvNF7qEEmoT73cp2ac8gKX++xFTx0oDc7IVE5ZVWQnCKLyr?=
 =?us-ascii?Q?Hlmf3wyfdOiySFY1lGYrE4wCzv1rFMOtfvWxW9/cMqka2JMeMiX6L5FI+bk6?=
 =?us-ascii?Q?T7wbDAQ5BWO4/2QyprqbMTmAnfvmlK6YsYUVxDDdHP9Zahep5mC4RCTTE3af?=
 =?us-ascii?Q?xBPw2fQZXicIVy9zO1ieOpcZdoHc+22CyCxdZefQXylnyhMAetYOMEohVHDP?=
 =?us-ascii?Q?al95yYiMW4xsIBUHYkqplnSylcVtWTw8UturXxgyD5ukn/TwhrJeBVwlBFcV?=
 =?us-ascii?Q?r9wfpqK/2RB4Y6IZ9Jo+b139RiO+Dx6iWPvoSmzDTeHiCl8HZR92leHyQVBc?=
 =?us-ascii?Q?wvp9NoU6FGfjdeJjYf/2uTKO7iSoAHbHaXatPtqulRw+NHKV9e8tONjoPorO?=
 =?us-ascii?Q?NXVWWuV8t5ArwYCYFKaredwq4Bk4JZl/xHKv76bkddmWuiSds8TzGSNDgXbv?=
 =?us-ascii?Q?Y/m6YqQQOLKDHSNS3W75vQnq+ZKY4e+J81HBgwqC/LYT4b1WR3X61BETgVBF?=
 =?us-ascii?Q?iGWPJ1p4H6OeOIXQiL62iX74C3w+?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 08:56:19.0641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb40789-0d5b-4f0a-f216-08dc764f37db
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199512

On Fri, May 17 2024, olani@axis.com wrote:

> From: Ola x Nilsson <olani@axis.com>
>
> go.bbclass uses a special do_unpack function that causes the git root
> to be different from S.  Verify that it unpacks as expected.
>
> [ YOCTO #15483 ]
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>
> Changes since v1:
>   Correct author
>
>  meta/lib/oeqa/selftest/cases/devtool.py | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 882225dde3..fc08906117 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -753,6 +753,25 @@ class DevtoolModifyTests(DevtoolBase):
>          result = runCmd('devtool status')
>          self.assertNotIn('mdadm', result.output)
>  
> +    def test_devtool_modify_go(self):
> +        import oe.path
> +        from tempfile import TemporaryDirectory
> +        with TemporaryDirectory(prefix='devtoolqa') as tempdir:
> +            self.track_for_cleanup(self.workspacedir)
> +            self.add_command_to_tearDown('bitbake -c clean go-helloworld')
> +            self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> +            result = runCmd('devtool modify go-helloworld -x %s' % tempdir)
> +            self.assertExists(
> +                oe.path.join(tempdir, 'src', 'golang.org', 'x', 'example', 'go.mod'),
> +                             'Extracted source could not be found'
> +            )
> +            self.assertExists(
> +                oe.path.join(self.workspacedir, 'conf', 'layer.conf'),
> +                'Workspace directory not created'
> +            )
> +            matches = glob.glob(oe.path.join(self.workspacedir, 'appends', 'go-helloworld_*.bbappend'))
> +            self.assertTrue(matches, 'bbappend not created %s' % result.output)
> +
>      def test_devtool_buildclean(self):
>          def assertFile(path, *paths):
>              f = os.path.join(path, *paths)

I realize that this test doesn't really solve the problem of "papering
over" the problem in devtool modify, but I hope it at least protects
against some breakage.

/Ola

