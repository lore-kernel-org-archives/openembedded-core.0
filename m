Return-Path: <r.gruenert@pironex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120ACCA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 12:55:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.114])
 by mx.groups.io with SMTP id smtpd.web10.8626.1755780946419883033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 05:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pironexGmbH.onmicrosoft.com header.s=selector2-pironexGmbH-onmicrosoft-com header.b=M4WoDcFS;
 spf=pass (domain: pironex.com, ip: 52.101.65.114, mailfrom: r.gruenert@pironex.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3oAt2X8y4VZmoY7Tj/xID0xKUSRoFcYUX6+EywcN2BSLYYF+pv5PWBNG20+XZcyh0Is7iT8vornsoJfELhM1VuuF6+Iry+vca8AZmR5mJsmI3ySjqnoUAVb2MI8+MQW65PYAP0mer3Q7kJp+AAtsMTz8Ou9USY/2Po0G9o2sPPH7IJ6aK5faUIaW2eD53G+889Tzs4H/LPQi7I6a83t1hTjntdgXL2QjznROOBXvRibSH9vMrK7qRSId+V4wy7za98kAW9EuLXFexMMRodo+xBywQTeEQwwyl1KbmXduIFW8GWyJv7xa5cU0SLTEgprOfmC0aluHwsPSFwuen4eMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4L9o8u3XT6fVuzlQdTAhmgay7eoSlj/tmDG8KgUxUA=;
 b=mEVVnPHbxcGGcgSiLdYANpq3hQhMnkOkGN0OCpGAN9bhI/oOgDJMol1bWQvwBlE3HRu84y+sT7nyGPnFVbh5gVLUhms9D/KBiixd5AF/wj4NNugdKiRRj2v614Fr095uLCyMh14K6KmDjRdn3sVNmmBuM9cOP9ngbdKvgUCSQ2sVOWMMkx+BqCk7outu9ud1sXDuEw0Hz5L24nsR9TrltviHbIT/Fj6FvkqMOk5Yly+n6z2n9J9vNmtpAOLstNSH7c9J12Dqg3f29IMknBs+PTEu8WlySCAXnwZO7r28y6CsCE0skxge84C2DyreclRtFoS3tOWwqGwNKIKZZrAGEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pironex.com; dmarc=pass action=none header.from=pironex.com;
 dkim=pass header.d=pironex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pironexGmbH.onmicrosoft.com; s=selector2-pironexGmbH-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4L9o8u3XT6fVuzlQdTAhmgay7eoSlj/tmDG8KgUxUA=;
 b=M4WoDcFSjI1zf+EGMIH5UHx8Z6QPEPnTHDoMnKJQe8+JRx+jTpsw1giBy/v1BiV59nscfO9/cWxcTCZiGxbAvIdrByHjexMWRAbdc53GvzFAXegG25s3ETr35azKToScr/7vezsYfODph1R58T70Gg+RVObx00Ja+ok0guh13wY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pironex.com;
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:415::15)
 by GV2PR10MB6935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 12:55:40 +0000
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b]) by DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 12:55:40 +0000
From: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
Subject: [PATCH v2] scripts/runqemu: raise an error when bitbake was not found CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Aug 2025 14:55:29 +0200
Message-ID: <20250821125529.808760-1-r.gruenert@pironex.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0005.eurprd03.prod.outlook.com
 (2603:10a6:208:14::18) To DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:415::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6954:EE_|GV2PR10MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a9182b-59f4-454e-4b8b-08dde0b20860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xQDGB4pySx8BrZjLfJkWZCtCXrvB2ZSznnVKbexVxJvkGOX3e0c2SyyuSt9a?=
 =?us-ascii?Q?8VXQykMQCZnr4CIQGWcBvBwWHcCk42b2rKhcgaT7a+nqH6+nlmoeFvOCrHd9?=
 =?us-ascii?Q?JyCFIwwS4VOY5HYZtcqZo+w26XJlpaO3P+cSKxwt97Kc1oxOAyHuuOjVxGuw?=
 =?us-ascii?Q?QDXoNkEcohry2YiqSuxC7u9kev/KW4GLFhQUFSZe77QKgDaw79LN1wqqo3vZ?=
 =?us-ascii?Q?o84v7VWBFnpdeJEzji7Q/dfr1SwoV+v9lgrijr1dvneXI75j+nfztcoMD1JW?=
 =?us-ascii?Q?b+/AhLAAESnaNzkYOLV8lQl0PH40DaQ5aNan+wAI1jfkqRJDCMla+G/J4ySL?=
 =?us-ascii?Q?rNsa1CNJGEdtQPX0XDrC411jWW1rapK827tNUfy/3AeD0z7OdPQHTYwDfROs?=
 =?us-ascii?Q?YODLe396VGPiLQfwpNlBu2QPDkktbCwj8xd3QIVOwVoh8rd/DD3mQfVwJnZe?=
 =?us-ascii?Q?EVLSyIi8b1tHp0tYjd2eoqQqWvPh747BbJqHpY29fDPUsZXiDu7YPzthJ9h5?=
 =?us-ascii?Q?DnSI6O862KfX2lqi3XtNg9JP6e1QMqHycXvV83qA7ursQFG5/yvPEwoS1HTg?=
 =?us-ascii?Q?B0CyvxB2PSpgxdlIMoXWZaDKGTfqp+ckVZdPXs5XDs2268D7BALbBNHznJYg?=
 =?us-ascii?Q?dDPF7tVZ5+GPNATgxGOhWr0goTANKIDrM6KgYCxjyc0zlAn/ftDA2QmeiSOB?=
 =?us-ascii?Q?7U4kwcLVvoCGvqNhmTPyDdqtwsaeq5Z9G598klrL8p8lNJUaxYqX104s0/uj?=
 =?us-ascii?Q?KFP5UEWhdToj24uCw0G8r4iyBfe8pCH3tmi+s6hgHVc1wO2ZezfxOcuF5d97?=
 =?us-ascii?Q?OUVnd56oojM18e2krcNYveQmzIzkfN6K2lcAkZLaqIYUQ4L9oV7HZ3MPc4sv?=
 =?us-ascii?Q?vNrFTv0E4rFV/UCmTe4U+t1197vxYSCkKpi8Jc9Nt22BEYXkmf5JuJk7vzy2?=
 =?us-ascii?Q?yzVS407Cwxtf5uVILvngqtmboeHaphzhXPIQB7LMbfId1vqZyUwqu3wnQlWJ?=
 =?us-ascii?Q?aBKuRkeHo75vB2BWpKv0o3agzSahwa0CyBTOpIW7YmkuQQXj8uV2oQDcd/Or?=
 =?us-ascii?Q?4f4NyFTpX5nrf2ThQPkL/yF9CRv8Y8XHJedEGLrEwato/9mGnqioLV/s8/OU?=
 =?us-ascii?Q?nkvneYkhnc+qwlrfxkZjXkV5AoA975NhxNy3uWqgfR6dh4Yallrb6YKO27dN?=
 =?us-ascii?Q?sYHCd2PAGtdaBYDMuFwMmOT43DSLcfOH17GGJfr2HqiRc4G5rkVxcUm/yhMJ?=
 =?us-ascii?Q?RGTsXJnSY+3bddSfDdBGZ2tucQUUjc27RiIrbInZlagULt4w9uZFc0cX/nL/?=
 =?us-ascii?Q?g/WCpLYf3txKPgLPqlmKcZgxQZfrrH1efPbJ81txdEmITR5S2/CiJDxvWAFs?=
 =?us-ascii?Q?Eb0DQTXtShlIrjrublDdFNlv3MGmzBMYpJwj5HNG5B+RRD/VBbPwM08+HsZo?=
 =?us-ascii?Q?kAe2PM7PTn0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nQi99MXg55aWWaTPW4rPU0OHuKdsX1U9jyXr15rxCv9fnJ43ZoabEiOkyhT+?=
 =?us-ascii?Q?lTcg7Lcd+CbgLNjUEcfZiFk4z7UPNvov4+jFblC8K7birxhlTDMaGmi9HrsS?=
 =?us-ascii?Q?bPpxEp44o6qsc1saH9TERDHnssw6N268eQmgmma4LBqvVvcAgmviFB9vnOku?=
 =?us-ascii?Q?lUfcvOft/YGBRpx/HB4VpQP0dI+v6Tm7k5gsBn6tPYCzmA3CbFyono3Hv0xr?=
 =?us-ascii?Q?awt+e2etUbBpuKbgw6vo+185TaEdx1VcwAPp4tB06ewDEDgbRG5x8TC1l7eP?=
 =?us-ascii?Q?18Gumv/BHPoEcUmp42bv1U10UWTV6TNq2xw0Ykd1e+WjuNLdDBD/Gi6AupOj?=
 =?us-ascii?Q?V4+n8AUHe4GKCSyaDxo9BdywEUQpEmhgABC1i6XxJP2qxgzklizMEaTB8CBA?=
 =?us-ascii?Q?IH69umihgEufJEfNknNY/AReZSa6KwSyODtWVNoYpAH7laUll0aUZKFz/zU4?=
 =?us-ascii?Q?XIzoKBXeL7uG442aDnovlZPXM20525W1Kxn6WEALf1eZXaLsRixV6frUPD6q?=
 =?us-ascii?Q?om22Mfm5RGuDnHSu+KqKMf3Kr7f4QLL3mDY3xJAK3mitvt1ArEItIRaOFlKC?=
 =?us-ascii?Q?cxcKd4EYPasOKlNeoRaTbDJ+g1HKDEIXfUk/ayMPoyGHin5LseA/sN1ryfcg?=
 =?us-ascii?Q?8HC5Scg48FJgAmnn0Wf0aq2rkNZDRxuRFWjGEiWNx1VusfGEk9//GOCPeLNo?=
 =?us-ascii?Q?APo9i9LXTPh9dgLWrIIbzYNvilC6nUOo9aDDzAdU3hIjHMJYCLSl4ZgPaH8N?=
 =?us-ascii?Q?CJArgoHCJCReBQgHcHpkjDbWQ55xNWXpTmdpfCpk8awKkJ08qyPdeZVOslxy?=
 =?us-ascii?Q?XaCWH8Mk4dzJ6SU/Vbya1KUrWZBhA045SwpeurfWf7yzzSG5L9RZvhyxd5hN?=
 =?us-ascii?Q?hQREx5qFBFJKRT3P4n+nc0JRJnyFaHT65pldyW5Sj6AVOE/9JYgfDX9JWNBS?=
 =?us-ascii?Q?e2yTIgCisjpT+WvIc/PyQq9sDIxI7Gn3FNnkrgDAZY7R2kK180kgzF1K4VLd?=
 =?us-ascii?Q?WU+S2PmYCqugJnBWL+CFZNrSJHPKnuD2euyLdOxh251417g1+Or0kJhp2ibI?=
 =?us-ascii?Q?hbUmt2+jPCNEGFMd4CCJKvCplWFTDgJOozru1BwbDTNLGvpGy97zxnMV/jzd?=
 =?us-ascii?Q?NQcnDFSNVh6zBfNy1wqN2jsGqvAwcJfKzTOZTMd83jdygwpYYQDgPUUB2ahL?=
 =?us-ascii?Q?UXXwlpVPcr8IRz9lwuO85UgRfIJ68A4saHR6X2IOLsqa6/YJenqFT1RTrZAc?=
 =?us-ascii?Q?lTo2EyKJkW3u6TFvs9El3vhiYu5rlnzKuwiNFlCkNHhT1+K8KzDZdDIh3l+m?=
 =?us-ascii?Q?gEqUuEf18YTCI4Bi0iFlhMEinWrfyrcFjFm1PmkdJYRYlJfOnIgNQRaVSpLk?=
 =?us-ascii?Q?sMkbN/rnteH0IHqvMWpDC4EPd8elmFNb8r1GMfAt1tRe3OcuqH+6O/gScF4m?=
 =?us-ascii?Q?RUdUw8OaOYBonGGjTXcoL64k/pAg6vVtsacOy4hkqaNbtyOg+xBBa/QQDZLn?=
 =?us-ascii?Q?WW9SKDZiyjwuJrZXgCJ6CVaKzNpYXPy3271O34YB8j2xRarSF/OC42yhANKn?=
 =?us-ascii?Q?OosdI7ZzgEQw/gWetOfSYHDtdRdmL3Mlpm7q3nBl1ikexKjiRkFsHoj9VcUq?=
 =?us-ascii?Q?/yc3IpaezRcdRaKCXqK94gXtGDQQVLDKLDwSvnhwAMzx?=
X-OriginatorOrg: pironex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a9182b-59f4-454e-4b8b-08dde0b20860
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 12:55:40.7509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00aa8e52-eebe-489a-8263-3195e0a468ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npPoHXZFIOWsZOFTptDV2ErOu98raqr20myL7U9WzhXvIu7y3G22tNbx5DcbkAByduE7Aua4JczAsW/4E0OS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 12:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222235

I am new to Yocto/OpenEmbedded and compiled poky by following the Yocto
"Quick Build" guide. I later tried to call runqemu
from a terminal different to the one I ran the compilation in
and runqemu was not found.
Wondering why it was not found, I ran it directly as `./scripts/runqemu`,
which was a misconception I had because you are supposed to have
`oe-init-build-env` sourced. However, there was no error that told me
this when running runqemu like I did. So I thought it would be
good to add this error message to notify the user that bitbake
was not found. At least it would have helped me and saved me
some minutes of head scratching.

Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
---
changes in v2:
Changed the position according to suggestion by Alexander Kanavin.
I also changed the error to OEPathError as this seems to be made for
this exact situation.
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c24528eac8..5dbeb518c6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1713,9 +1713,6 @@ to your build configuration.
         self.cleaned =3D True
=20
     def run_bitbake_env(self, mach=3DNone, target=3D''):
-        bitbake =3D shutil.which('bitbake')
-        if not bitbake:
-            return
=20
         if not mach:
             mach =3D self.get('MACHINE')
@@ -1732,6 +1729,10 @@ to your build configuration.
         else:
             cmd =3D 'bitbake -e %s %s' % (multiconfig, target)
=20
+        bitbake =3D shutil.which('bitbake')
+        if not bitbake:
+            raise OEPathError("bitbake could not be found")
+
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=3DTrue).decode('utf-=
8')



