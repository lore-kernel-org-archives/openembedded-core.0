Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12BDEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:40:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web10.5411.1690231232263140200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=sogcKI73;
 spf=pass (domain: welotec.com, ip: 40.107.14.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDB5am4Qs1zF4bwGtVwuVl1ChrlO57np2unfLumZzH/86/3F+xesutDZM9j0vq9BB2j0jKGKI+QGlFmgXALbf/q96PDovPY7XCodp+l63NrNY36vEc3kuiZiAeMfvde4H8hlTseR6cnw6575XEiUdOa0UOMdmyUHPZjBTlPWvW6ZUP5rikZuWdqJMA/N0OQRC9zsNbyBs6w68ioqLQdAqqH6jls2NwhTG6OEei3hhlvsxFtnbmmkPaenITmrrWacF0M72JKcEFtZFNzC31UQR+Po8Nih6ZKFi3bFreXzy4CqSa3XFaHMuI0k6w0vXEOy0nAO29//zJKofQvJMMu6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tJwUcSJjl88KJWQ+XEgAj2LNdA1Om9Drj4K+D9IMMw=;
 b=URYKcM9Y6hXBQKilg71frWyCymsjhEWAu8vw1rr16xvoPmOiUYSamRbqhBhHsv+pzZHS6plxEJF8Ig625rXye90bdZajjMXpV2c3SmMzFit3GWEo5GocxNbD0wDtq4uXzUT+cCySXoadaDWOx11u5usPUNVfoNV8w+A7cUhksx9d9WoLkhmUHamgLxzojOCtOlfRP2uIHJ1gNhPoYHmax3Vqg2my780PkOzxZaoQEC2LyQ5EbN/cCmnyYQboNsDFyYWOxfJDY5/AUXaBpbh0kN9gYoW9g8QPJ8eNo9svA6uzNivHs7q43RHHtf8l34GA6/BBiLWICv/sOI2ExIcBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tJwUcSJjl88KJWQ+XEgAj2LNdA1Om9Drj4K+D9IMMw=;
 b=sogcKI73OcQ+d3EPOOiL1u08cZH2h6BDD5oUksM7OyKIxGgNt1tuEfyqTcKshKjerkGsP0ld96gdRpdBnYcTd3ylrTNEVwVKRWEVVvF+LJzY8ojlkcTO4x8k9FfKtp9EpjU0AzfhMUQmY4Ku6zJBqxi3F93b2itYzpC/j2nLaWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:40:28 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:40:28 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: Christian Hermann <mail@hermannch.dev>,
	Alex Stewart <alex.stewart@ni.com>
Subject: [OE-Core][PATCH v5 1/5] opkg-build: make sure destination dir exists
Date: Mon, 24 Jul 2023 22:40:14 +0200
Message-ID: <20230724204018.352695-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0317.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::7) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f2fcd0-6a08-4809-f782-08db8c8636ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ilHyjAmUnq8VL/DcZTE3ytq/sQAnjH6rV3Ic086YC/Y7ehmgRcRj/nbuGz4BVA0Lv/l0YwkhhFZEVD5yJ5izZh/4YgA+bZJR5DPWhNbfW84Iyad5zFb2wONdzc+8Q4pEbS2wmckbr38dUafegpIgyj3BurP4o4R6LgZHB7+OAG5qBkPPQ6P5B5IPng+iS9vWkMFqvDz0GcNsIL4AqoBVxTiRxEd/sDsDHMUtrMJo6fXmvhQqfaxF+Ji5KDlUwZqlNZQGblRu8YTtF8GAwG1jmP1ePoROLs+1O/IhdVTWlC/uIX2Z2QrC6dNEXpt6M+rBXGrDYcwYKSi3e5DqPtfhXIjb6suldyVRJDfqJEF/WftRse0tHbokvVR6ViCP2+oaBXJ6Ay2BJWYn5JF2ZmOWrfhEgXYyG2pwnyDuKeEww7tcgGKJpDfrWqwemMzCcJEVqY8bfGWBsNlJ2SzcN22NHcw5uaeojj9paP8mKuvclUpn5/ABUHCosZOJEvfoBsaVHSnNUpIlDdds9zWWZMZ4Oc4qIgNPGCoBG0PNznCpiU6Zh9Cjg2Nzusfkaox0J6DJp8sGjEy3JUrSoyFEgG9EfdK0rbGNVzQlaEJ/+GTMMvyfYqjlNKl6HMP+0rYtgdjL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199021)(66556008)(66476007)(66946007)(316002)(4326008)(6916009)(54906003)(6486002)(6512007)(38100700002)(52116002)(478600001)(6666004)(41300700001)(36756003)(8676002)(8936002)(1076003)(26005)(186003)(5660300002)(6506007)(86362001)(38350700002)(2906002)(2616005)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YW2paoqSt5vckjJsP06xCTEr+tz44mBkAh1sbcKkXq/1VBpBqKMsX1vICLvg?=
 =?us-ascii?Q?o9tn2wyn2EB947ixuDYCUShLANXBhw5e9+PcpL7jrSiWtFC1rrVa6Lipbg31?=
 =?us-ascii?Q?3KeCoHHp47yEwY9rsjU82EF6g270nyWgRn0yJsSuZGhrQMxwBGQMlUQVOO9q?=
 =?us-ascii?Q?WFCeveaYE1RM1RkCoU+e5ow9Pu8ksWo8u5K+sMSj9d4ODJgXoqdhGvSMOamm?=
 =?us-ascii?Q?+yc4CYF21eHTRGvyy7/JYdxsvToBCV0CnyDwD85iJOdyVH1YdsZOaae1fsd9?=
 =?us-ascii?Q?fajiobeCU6MEgfEaJW4Z3gWenvtp1X7E+9SBmciAIVaXR9y5ZwIu2426a+Sg?=
 =?us-ascii?Q?G7EgCL6Y8RXeTTmicyOvEHcpzYGDbf1wFjW55WpC3+6UuF29S2gUT0pCWtwB?=
 =?us-ascii?Q?6IwEuRtdqLXvl/QCXXRR2eMYEHRtldfMifgMsz200t7sAWsvo0v2ZLjPtGDP?=
 =?us-ascii?Q?2ZiWl4gmetOEg7hl1jcfyc/4pFRLA3yYcdi0UvIIgobtsrK0CTTMYBVKNZa5?=
 =?us-ascii?Q?tUVkueo6rdQKEMdWHpCyYPuYj2+8QDyT1z5DLZbaoeNJ60TRy+7Hz2GD5hyn?=
 =?us-ascii?Q?72ZopZSRqLzuJadGX8rt54JiDuGKdkZPVeexWvSQWbvik1m6IxvIPSRrCbyv?=
 =?us-ascii?Q?O3uP+sFe6sGJ9tkS1gAkCqVZcjtWAZxURgKhlJLfTQOAOPYz7Ik3HpEERL9E?=
 =?us-ascii?Q?7Oc3HLXEo553wuqBtlTEq/EgiT1LLWjhrsYX0ASnvGU8we636sSp2Pyu+YrA?=
 =?us-ascii?Q?DgM6LO15BiOpVSn2fpnj2BTXNkWx4hMYH44QrGsS7kh065/V1x3vrl1tmi48?=
 =?us-ascii?Q?bSKPqZk+FWVCd+25JyX/UQvF4D3YcnpbSonVZTGISly43aRTI2zNRd9/BKc+?=
 =?us-ascii?Q?N5XrFvqDfRTd1ykbtNSOMOzUKO0ohkcpSl2cDtEhzi4tT6aD3SllVsvyGtPN?=
 =?us-ascii?Q?FWX26hi6rlrjPVgCR8oJzb3UNKd5G36+7MpLF+FIaxTjVvGOoE119FvW9O9u?=
 =?us-ascii?Q?zhoxeXMblgem7TqIYYpxywUDIZ8bAPC/X+oaYuhjYqFtKmcNe8u0ItVnlAQX?=
 =?us-ascii?Q?zpROBWSh9A5nQXprS4MSaRj7ghJDGO38/YcpBp8gaJWapJJ4XM64ADXl7xbi?=
 =?us-ascii?Q?QT7UKEptazwN9HJyZeX6RG/vIGef+BgBV0xpRw5lr85T/wGECFyDo8C+yURp?=
 =?us-ascii?Q?QFy4NcJpYVVQ/GSLJHwAsvDbjcEMJasc5C21aSlUHkz2L1SKBykVFuc53YY9?=
 =?us-ascii?Q?1uftx9WTfscsRkRWTqezqLy7tYjpbcym1H+O2kZstR5+CQsefkQlJKCPjIhI?=
 =?us-ascii?Q?VGUD24YVuxc7D10wbGKALucBLc17ZY9sjnxdbibuApuTdd14D6a3vMfhZkdr?=
 =?us-ascii?Q?o2ODum0aNKLG/6DWEXuzvOX+6S6wrKy0WmW04Q1UtkLnDo0Kzc8VC/i6Leq4?=
 =?us-ascii?Q?Jbw5se/UwKy/YP13K5vN2tWEMCWJzmA0H5PhxBnujPNb40nefiLBTfIm8R5O?=
 =?us-ascii?Q?Xdi4pRqiUbuKj5nNTwFiImYoPPJPUpL1WxJsZ1WdrDypKNbW4ehrPQuPGseV?=
 =?us-ascii?Q?1y7rZTUXE+Hi2dObnIzetv1qUHoyeh+sH3suD8fW?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f2fcd0-6a08-4809-f782-08db8c8636ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:40:28.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StWjBnPhBDfW/sg0nRDNzSJji5Su1pw1NCaLRgJ1oWTeSmwGP0oi4vShdswWml+WPu+o2imUyc00NJVvXThHQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184808

From: Christian Hermann <mail@hermannch.dev>

Signed-off-by: Christian Hermann <mail@hermannch.dev>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 opkg-build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/opkg-build b/opkg-build
index 1b56416..3333020 100755
--- a/opkg-build
+++ b/opkg-build
@@ -263,6 +263,8 @@ case $# in
 	dest_dir=3D$2
 	if [ "$dest_dir" =3D "." -o "$dest_dir" =3D "./" ] ; then
 	    dest_dir=3D$PWD
+	else
+		mkdir -p "$dest_dir"
 	fi
 	;;
 *)
--=20
2.34.1


