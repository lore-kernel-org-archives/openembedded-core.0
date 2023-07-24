Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64B9C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:40:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web10.5411.1690231232263140200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=uVgRCmGd;
 spf=pass (domain: welotec.com, ip: 40.107.14.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6MagYd0r6q1dbN8qjD19JVKnesdoU3n8HgG7mXAYd4XAxEFY0tMxPNZTvFeTsw0BI3RUYu/42BPBq8msAuuT5U7imEp5NvwzEFhyAEgSzNCv0OYidWJgVwzW9IuJ9nLjJHomWassTUvjMPPF+bM2tiowzJNqgGahj4n8MQxjshMeuBF8t7Yc+NmTyoLEA9/tfW1hYTM4zAuPrmS5i2fvA3zRNugomcz5/lG+XnWM9oVsRl1EQcMsi90KCf5+TliNafNt6J52wIsluIF8koUmRYbbRGh2Ly8ml8CnFMhtaVR1GQwh5ULsu7tprRPa8JVWPbP+ZDDWw8143NZG8yubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU9Wnr4aRvkeOJUg9XaYAuQetNKAEspISvAoS3BT1t4=;
 b=K7nC3+EinG7ypJ44g8+46BlzZdxY7quyCWmES3WoNSLCRazaABod4F8nqtygrY48sBfLBbAGPAfkZSp4OOkj/LP0/GJIo4kYgjhqyC43uEBlcE4myYsM9BH94aOYIucvcILJJontHPB3JC1aYMGfh85W6SCaY0mbVwAF7zHhnAZYz8EBzmmLxq6RZLWd9Z81WJkkVOzPtP8taDKKZ7TEj/2kUwFnmd8LwXcHeCZVc3yuaheS9BS2scCsYXbxLYLy+eqZiDTC1bim2KnTJ3ti7Jnoo0R2bXF96qwGWKiqZDnJbRhC6NvQVBLzKyWFSyfe6aUW01gthcfhkgxW1kuIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU9Wnr4aRvkeOJUg9XaYAuQetNKAEspISvAoS3BT1t4=;
 b=uVgRCmGdde1fAu058r6cblgy7E5pFhKvbaDrL55jtBHriUIeK+wECeHPaF9pvj8TJns1o6D7EgVLzFyQJUu90gpDriGdJdvyPH0jNPMfml128Vh2gKkLGVn3uSS8Ef6wMMe0DN2dqfi8l2FVKx888yBoH+WpOs5oiqDuuAFeg20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:40:29 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:40:29 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [OE-Core][PATCH v5 4/5] update-alternatives: correctly match priority
Date: Mon, 24 Jul 2023 22:40:17 +0200
Message-ID: <20230724204018.352695-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204018.352695-1-p.lobacz@welotec.com>
References: <20230724204018.352695-1-p.lobacz@welotec.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0317.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::7) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 844001df-76f5-4322-aa2e-08db8c863808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fDiKdKYr/ymziEw00guVUan7QMMCp88iZ2fJmfWxBSN4tYv607/0EXN5VuaI1o7k5GiZLiSzaOkhKs4IKBHAkmppQvRJOxXrR5bQkEfMtJhfbMuaHQTbY2J9iHOtmmJtQjDx4eQpaIZHUF/YBKXm91vc2KsP/y0qEdsx+2Ptnzgm2KHRzIbXGUbO3xBoqcnMxYrGrAVdRCufKS25Gj+ym0gVxdPzfaTPGFBqj5yZLkuIsbTZ3cd/Hcjtt/L9saZ0ORECKaFpBQhK5qMvdBMQ9dU8Z0qusdQ/vFsTbHWm05oHcIYti5pu+Go2jZ363oOxIagtCrRw67wz1ybghf3QszM8zLRwZk50/q8ug/3MxBzxBYccr2mOdyA//lHFglwRxyTWNhY5LEcef9rsrBtgXZ7fZmNWkJ/2AZUPQg9b0MNqMz+oOIsS7BxzzGV+h8Geef6s6J9NACcm33DIp4aIxWpss+bSLGcY1nQ0VIEpj2gb8uWr5/gr93UNcrzMIR0xLo1jPpvGlnNwIOIB3EDNE9koxQHBsachsVzk2nJS8wH1QtX19PvyDTbnNHe7twmIX0gpZT8a5s02trVacdl6I5rlENnH4uRRxSTwd6Y2tETvy4PFWdFaVkq494WqenFP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199021)(66556008)(66476007)(66946007)(316002)(4326008)(6916009)(6486002)(6512007)(38100700002)(83380400001)(52116002)(478600001)(6666004)(41300700001)(36756003)(8676002)(8936002)(1076003)(26005)(186003)(5660300002)(6506007)(86362001)(15650500001)(38350700002)(2906002)(2616005)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?74FLDPQRdJT+MHD27CuQtul95Kil66nweO7tD+87+BHfSf0OYKMN6mYrNF8h?=
 =?us-ascii?Q?/YVkApwdiFtyv20lP9xtsl9dsBEl/3jSwuEJoKvYrUlP/F/lTK4BZZSsj+Po?=
 =?us-ascii?Q?eS0affUqkVQ6dMtzXNT7gTN+QBzjmnd3/o4nJMXHwvhVqqFnHYdJs9lxyqqK?=
 =?us-ascii?Q?1zDFjTzII/UM5fHAOtdujvCYWTFt2m5CGu24DSgSi1USXsVtVtNYb51wf2JZ?=
 =?us-ascii?Q?Il2HKnyQahTzRPhG1uuLptqLdws/BnhqvCZ1nxAUevqQcawbA/7NLwT8Xykn?=
 =?us-ascii?Q?a6SmVZ28qWAGFyAxoXNk2Nd1yof/4aaQnxK16D28FvBopQnL3LPjdrkDPws4?=
 =?us-ascii?Q?agPh/CcUUHW+JRZIsBb1vc0OfpB6yfgTPeq2uQs2SL8BrQY4ZdTWGadgdKNq?=
 =?us-ascii?Q?zqoG1Hd5noVZhCZeRQbIZqxd9Fz2EotjIA7gI0h2gvR3icQ2FPKz7MAwuDyy?=
 =?us-ascii?Q?zcCe/OyK0dJegHfXMiFw9/8Xoi5HrzDKi+le3kkoI61996tr+ZdEhSsToMjJ?=
 =?us-ascii?Q?vrVEdQW6VF7MqjHbzRe+rTErkddb/Tt/GBEd3FWCHalNkhLtStZFaggA2O57?=
 =?us-ascii?Q?GpJ/tAD9YIm+63TtTloqcYMYqQen29FRhvTi5oq47F5RgDsBlqTD5scj4Kcs?=
 =?us-ascii?Q?jYR/dB9hwFgnTTS0Vun7may5heEqQXG+2xmh/Upq98JY4qqtCc5KJ4nEvzTF?=
 =?us-ascii?Q?77Ps3QtHqtFuLrQlUt6RR8j2bC0T8/63IY3QFg3ftomOLqy/RiA9fGn/2sVQ?=
 =?us-ascii?Q?Vdoqk/2NmY65USfjNCg0vbsRAHjXyH8261EZ0cvgwW5sJ69tveDwrHCF4H1F?=
 =?us-ascii?Q?eK2cy3sgdncrmqpwXvVtEKb4qfUaSzXzMVHFdCBWZLBxG7Deu0n7IBS1Pog2?=
 =?us-ascii?Q?UKQBhxPa1dCeY62LIq/cln8Zm+jlZVNf6Cpb8h1FXyS/+c+tcMtU4RABEwiH?=
 =?us-ascii?Q?y9XDzeHELCZkFRO22HjIlX1CGZUdN79STRz3ZS53J5j99UYBzMkBe8Iyn/1J?=
 =?us-ascii?Q?OyyMHBHFgG3TMiZxKkOfE6+svlhjLvRx3TB9Z4tqzfLmmcwygfip0gHgz/+o?=
 =?us-ascii?Q?xVdXzGQU0b6CyXMHPFGUL21mLXGELQ0bFBDjv3ZQ7BjzTLfaYXSKIyULen7j?=
 =?us-ascii?Q?tcAgJZ5AySyKWGAAalAhE7bOeW/sJFYTQ66v/a/cfqeQrxvZnMXi32Jj9HCT?=
 =?us-ascii?Q?qM6MxzYN6qJM1NPxL8akU3PZa0dkUcgsxEaB/8r+LFnYS7AUvmRCgCWCsjDq?=
 =?us-ascii?Q?SF9QdoQ2Jzip/9AdAiRkDwtsvvxShubbR2WwLJO16HVZjVPwJtYA0aazJYbK?=
 =?us-ascii?Q?LI7e/FGMI4hCElWTihC6bo9RqBeoxB+apF2kpYhGhhLO7e0qrpy7UqYGESF7?=
 =?us-ascii?Q?Mss48KY5mZrKNwr3t7zXei0NkHbq2UqaQjf8mz5y+IWWIICs/PMxkQhtxTFV?=
 =?us-ascii?Q?oVua3uItHsUYJb6sFJbilHQhnXIfOOj3JZ+tx2koeQi/PtZVciQd1dk0ZFo+?=
 =?us-ascii?Q?qhmwnFja9UlKkawio9vVSpqW03bNJrx3e5K//S9KTl4XJ45B6Ylqn2hcDzfq?=
 =?us-ascii?Q?9uP3l5+/UyZZTTErv0M7uc7dFknQRegYuKRiRUCy?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844001df-76f5-4322-aa2e-08db8c863808
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:40:29.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RhHxg2Voe8CIqJnTVOja8yjlCRt2V9Z+z0a5342F1n9iRXlbAW0aZ7zC5l1Qw2qbfXfE1zCZ8xlnYayobmnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184811

From: Alexander Kanavin <alex.kanavin@gmail.com>

It should always be at the end of string, otherwise something
like "/usr/bin/python3.9-config 123" will erroneously match
against priority 9.

Upstream-Status: Submitted
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

%% original patch: 0001-update-alternatives-correctly-match-priority.patch
---
 update-alternatives | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/update-alternatives b/update-alternatives
index 1389b3f..e0b31bf 100644
--- a/update-alternatives
+++ b/update-alternatives
@@ -94,7 +94,7 @@ add_alt() {
 	local path=3D"$2"
 	local priority=3D"$3"
 	remove_alt $name $path
-	if grep -qw "$priority" $ad/$name; then
+	if grep -qw "$priority"$ $ad/$name; then
 		echo "Warn: update-alternatives: $name has multiple providers with the s=
ame priority, please check $ad/$name for details"
 	fi
 	echo "$path $priority" >> $ad/$name
--=20
2.34.1


