Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B32CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15837.1762158114459664447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=KELD29RE;
 spf=pass (domain: navimatix.de, ip: 52.101.72.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbmp+o2JLSi5IFzl7JvnB5m0l8VbxPhGTIDT8x+IReQ8FElibkK4BTLpBkJHfYaytI94bpPcj7ONEidAiOKtabGeDBcVpEm8J0/YJpO9tps7nPHt7yAq7zyBkER6AeCUYATjaPe0sFGjSpno7DeCXbU+NIPZDDqIEa6Y1tqaMEGwDgmd6vYNl51Ld3e1wwrVAOIDkNeNQSb60h51dYUd3ntf6ySMc+uzDTJVduOQeiV52twOxSh1AtmXxksibSe2R3AgGlLeJtGPv/flMf7iAc582vVpWD97C8Ev47WxkRKJt8TYoL6Qzx6MM41VXQ0kPYmJvF0IcetoBr0wYyNnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXZAJWWQLZOVHSKwdB9xDKjLFa72x/riEP8rFKi+so0=;
 b=yFwCJJs1YC9YLm0eSySDR2pTNj+ib7AO88FHPI/55l6o+7e/2KVsZGZS/Nr4yqr9uJufrDwTQ+IDHXbKdwnPXXcQuPAAQZ9iPUfzi3KQLEj3HRvz0b7cNTZdTZhsanYsCL+eCzs7tuHOSpqqpPiUvn8bPa9oIBERn1opG8LbGCfC4vJO7a0t8Q/Fotcvp4X8Pk0xglSE/gHn71EXsr27qtGwzMnZs+pipN69jdaoJO1U9/5ULvFB+rUEXIgpeXr7NhbrxqG3eBIviXJtgyR5+abPM6vB94vmlpn8gPO43ZWcI8xBlgWIpRbhGra17U/Q7NzQaAYdRH903fu8HVyMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXZAJWWQLZOVHSKwdB9xDKjLFa72x/riEP8rFKi+so0=;
 b=KELD29REo23Ip87VAjzX92JJvivfrPltZUQGNvVfHJbjkk4qSH9ot7WTWUYUQOJygSDwHm3+cnaaMc1tmsYj17u1h1UbrCj/LUaDVtbhvT/qZCrrhMeUDrdRuKajmhiMVvUnUavm5Z1xmT1Hyi6c22l9M1N4WVAcJ3389nna2NY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:21:54 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:53 +0000
Date: Mon, 3 Nov 2025 09:21:52 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 07/19] gtk+3: upgrade 3.24.37 -> 3.24.38
Message-ID: <ccba9c216ce522d0547574a4bfb27361781c8128.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 373106c3-f30d-4f39-9f0d-08de1ab20bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cFSMIJSR3sAfiAzp0OvIpXgfHMNb7kqtlVXnZfV0Hs3/aNArwGqI+9dBtvJz?=
 =?us-ascii?Q?Qy2koiYNb44x1Nnqc6cKoQ7tTn8Vgw9NIes4nLiur9N4Jh05us3FtQwYi4pJ?=
 =?us-ascii?Q?XPdnblljdzV+qtMOv2EuZ7wmQwBxO/bGoUdFelZBMEyrLACX5U4szUh+saUc?=
 =?us-ascii?Q?piYgEz5r1zxuN1iuaZfM5/SLt8qi23hkgx6NXoCUVoqj1W3yfXftDAsc9Hul?=
 =?us-ascii?Q?GbFSuLqToCzIqmR5UsLopYebit4v+K+kf9hirCUCOBOtE9fcbAgI8xnl9K1g?=
 =?us-ascii?Q?fLf4LJH/p7LsQnIzyo0V3ZPlJsT8741gTbPlyyIkTMAewHwbnuoYdwwi4GyL?=
 =?us-ascii?Q?cBcEvNFuYFbQS/JWmUCI/mqYoD0ZsNB0pDt2f+R+KCiNFJEJ/qV8tnpM47Pv?=
 =?us-ascii?Q?wIHKytIxj/S5R2SlSPhSfVE8y9ORwjf0jAjpQYFGnMW23GIq8CCtYwKm1TPQ?=
 =?us-ascii?Q?SFhz5vSpBaKKRR661xz6j8QqxAy5BW1IXa5dr1T/Jf7KKMmFq/Q2B/D3NQ3y?=
 =?us-ascii?Q?Rk6+vP+EgkSom4dtLA5hyDC09uSFjYcVeobV4mscIl9u1NoC6PPlMe61Gtlz?=
 =?us-ascii?Q?oVjhh7eeJihOKj6Imr+dsLCaFfcJ0aWlZJ/3Qs7I7FVLPVpXsL1mSbgNXva9?=
 =?us-ascii?Q?C5lXTVFbDmDOWUhyj1C22UC+FtGFIxx7lY1CbPaZhvMkVP7IMvlgpcuDVbX1?=
 =?us-ascii?Q?MuMhhohnJP1mHfumR2BpZw142lfnDaElTOFcEZsVKCdfBSdrckio1CvXX9jY?=
 =?us-ascii?Q?34jPtdvsMC0Ldzn/STdwsZLZsIcps6P/UIDcwOTPhrMFugYqToynjMl2cuJx?=
 =?us-ascii?Q?PxEY8B4PvK4YzzsuvcaWxtku6JQ9F0L/nsaWfZClAHQHwu/XvO2yDvWmoKQQ?=
 =?us-ascii?Q?7QmvB4Vg0MFdDms8mBJX4+v8/9UCYCnbYJNZWOZ1Nj5fsvcz2aqAWB+87alK?=
 =?us-ascii?Q?oSTbrZig2FsAaNfIEt96+FVPs4Gx5RGZABZdk2CT5UnXgWGecSqulhmgrjMa?=
 =?us-ascii?Q?7UrXIH+tqM+0UfGY11tebfHODYTjPf8cvvJ9yv7p/A32lSM7v0b1ww0L5ETm?=
 =?us-ascii?Q?V14cT/QlB3nppvmu/UT3u5dmCrA1ZRgsQOAk+qznW8gAzPhAoYAHlpk//p26?=
 =?us-ascii?Q?wOF/ROVetSpIbo6Uxj0WYxPZR3GI3d5Tb86puFsUfNgkWJivv9QOHvq1VzoQ?=
 =?us-ascii?Q?NtHS0erMMgesmQJXeO5AA+kHVut+FrV41ByXc1F5LJG+e6IT1iMq/UMv+BUp?=
 =?us-ascii?Q?dQJQj7E2Mzryfw8IcqjHyjlDelWSeuVfIjzMuHeh3lqqlWOirvQg8sSGF+eH?=
 =?us-ascii?Q?fcYjRU1+cWW4FGcs1sAJgqMbVIwYww/1Zpwj8wLUUqRGCl2iTNcCIuyM0NH8?=
 =?us-ascii?Q?DgGu0SsTMp41dF+o1tkzUGUK52+25mjAptvwRt6jZO7RgbZRI7C5c5o/SWzT?=
 =?us-ascii?Q?8PUiq5VMCNiruerFWEVjGltCcT+Csphh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UMEtMdeyp7VLfY8n7T/hjbWbdjYPDbieHVzN0FKtbFf9b/HJ6mK8im1DbUo5?=
 =?us-ascii?Q?9jOdSUAlu03bJ+kp8F5zLJQPYjI+Uf83mRCGQOupxPw260QbG6UltkRO2GMf?=
 =?us-ascii?Q?r7I+sSCdcQOwtcekcloa6TXnzKQTEi9+6nFEbePn7YWC3tF1Pez2JZsR8ja2?=
 =?us-ascii?Q?hBIvsxsmzloTRhlU6HqSP4co/FxNIfRQV3nE6k7H0FOBOGJbV+4Bgro4cZI8?=
 =?us-ascii?Q?skyOKYON8fv+4IJ8TqcPqoZ/Op7vO6PU4iO0nSC17QCmha6SecONGsGz6cHg?=
 =?us-ascii?Q?ebA0uYCyyGKzpgsa/c1cfFYE+c4SyYuAUljPovufD+ryklm2KBsn2i1cze+X?=
 =?us-ascii?Q?xlneScLU2WRLtSXUNFCP0WoFVj9MyW71rANbdCzm3e+xoOytNzBGWnxBUezW?=
 =?us-ascii?Q?4/xhYeZFhHWpjxC0Jd0hqfrhrL9drVChjJXDSF6qHIVE0+BaEPOLIsvLY7B1?=
 =?us-ascii?Q?xzPmqYESK4WAEC/HwnWffX9euxtPpuGUu6N+TL8BWmWLb+THBXCBkye+0wVz?=
 =?us-ascii?Q?ZB8KHQTkDXRCMWQ3CjlUqDX+3F7HxfpR4ZZTcKtJRsXr2jrk/Qz1QnYqlo3q?=
 =?us-ascii?Q?G4mJKej/J81lzeL8vOTju+M4Md2ol6DV5UrPbBoZjbRXK2KhBveIZP5IvK0H?=
 =?us-ascii?Q?UfaTJ7gFQS9dltQbgPwIK127FCA6pzDx4Lw2JplHvsshnG6xAq3K4O3YSLi8?=
 =?us-ascii?Q?YZijCCmGIyrQTuzKI1dybJt/caaIT5eGoUCPNd6CBCd05cVBQhX1NHrU5VbL?=
 =?us-ascii?Q?XREHRuighHxc4BmMLdtBoebvduAbgBqSL3XluzRe8vosVJBIYlAWtitoh+Z4?=
 =?us-ascii?Q?ZvaWoz+18TFYUAb6/m6vVhXX3wjq20qe+WwiWQ2v9XElkg+u+P+/FNdg28hN?=
 =?us-ascii?Q?+1mg0eXi57XQjZwBcFdGz3gJQMF05jddHoLmFJAB5oeFcP1hT62FsSzN8tsX?=
 =?us-ascii?Q?XNSazVgFFHpJrNvNQ0y+5S+Inki+Q+uBfbKIaX0scMD6AXpfKbBby2ZsZ7KG?=
 =?us-ascii?Q?KXqCmVo/rZh7+sb1/veI22L5EeEmevTdIIrCnQoMzZsxndX5jHGgwJoM1r0O?=
 =?us-ascii?Q?EkgoiM3/r8gbshVxxZ7VdSLTeQ55ZnJtFsh/aEmYoaJJLp+45KQRCRbqKDKa?=
 =?us-ascii?Q?gFX3+wWmkRS5xSUFSgn4qHSUE4aMku9q+3dOLpdGKhqZ8D6f6e3oKOlu1cw1?=
 =?us-ascii?Q?qnGcfgS83pP0D8Bkjz1Op4EgjQtzj6NlTDsUbdzQMOHcDRCVJYGmatyS4YAJ?=
 =?us-ascii?Q?K8apwOWO3FhdUbKjPdJCMJYVXteFyibRc27/zv0Rly2TqY5xjpb4drBd/6R3?=
 =?us-ascii?Q?/w6JBqe+CU74PesYaDbHAvdBhXW8+dPUpLHmZbWXUIyBrYMtpbJCxHWEFs4u?=
 =?us-ascii?Q?sRwUiRUi5UKiTJ5CBn7BBrqIHUYyorsrvAjN69i/j2wbA2mndA7R3iOkD+lK?=
 =?us-ascii?Q?/UR9WUftH6NkLCY1tWXDGe6LFa67jf1U4qHfobzIj4g36U6BaKPlPKXONSZH?=
 =?us-ascii?Q?hw3IyfWD/ER69exbgzYC9NlLCwyhDTXhgYHcPJqhUKwFIuQTfzoUpkRLPnDo?=
 =?us-ascii?Q?SUhKvwS36eqZrGsUU/xAcC2pvwNK5v36MWGxzkJVlHnhmUy+FL6FAlul75pc?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 373106c3-f30d-4f39-9f0d-08de1ab20bc5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:53.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUs0uume6BF+yqvtQkfV7lJ/RPsGEybmHN4LsxYw7vyvCrHi19DrYkE9Ycw9aHBM68BzjOqtaTI8DQMe9zbzkvOkrHOY+ixOB4qg6/pvehY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225621

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 7056611ae3bd356908b17201d35879024f2628c2)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 1e049e4e7af7846f58652aed110f0a688a5809c1
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.37.bb =3D> gtk+3_3.24.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.37.bb =3D> gtk+3_3.24.38.bb} (8=
7%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.38.bb
similarity index 87%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
index 382fceecc1..7337591fa5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
@@ -6,7 +6,7 @@ SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${=
MAJ_VER}/gtk+-${PV}.tar
            file://opengl.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf3d=
39fe9fe5fb7f57"
+SRC_URI[sha256sum] =3D "ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5=
f3a20444dd8ee7"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


