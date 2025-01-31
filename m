Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D373C02190
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:26:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.49])
 by mx.groups.io with SMTP id smtpd.web10.21739.1738337189453153714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 07:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=gb+tzvaD;
 spf=pass (domain: cherry.de, ip: 40.107.162.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdXx61RWoBo90Yf+bGXp7Cw0GI0onCb5zy4/uOCJGpnPDGlYe8M56RP/7QxogH+UHxWCVpQknoreK2KIxN0HbCILPjYLXv1GfSWU4WJcTsierwvceXe174ljkzSji5hbJs1ALRZrzZvEHOQvP8kjReMNN3psw44GNEWUpji8k8rj1QwPVY0CogELlz0Yrap5RJqjmgbZadBKE1NuAmaRWj28DY3msB/Mz20y/uvdmwaxqxJ3QwxFdOE6qf6WKlQ4rvwxHf1vJ1xCdyi+dryinYvGjv2XUU/bfi8PzEVLGTzGDplBJjFwlhx0oPNGrahUFkONbafiq3UNNGADK0AP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYTsSkQDUFkw17ZoSRjvlKbokiKLtiW8EvUMPhTFaag=;
 b=t2Nn0lCgBCSCgceyzzzn/06oygZHS2h4ri98xF6BDNMG+d8iLMdizyB27EBW+XYnAniBvDfvLXHPdxYa6EBp2QoS/uVJpQWV9r6QtBpS+SGBMtxYLdSh6xs4eqf30MIiAgYDzwjCFyXVHrRR/IirX3P6sbzxt8dUoxxmB/qsq8UUIxfcPZAwHUNfUFhCuCImqkyDVMH6lMx7DZw2xECRfIxoijXJcGcD/wVyeJ8ZlV6GvEJoBGbwJmzXpr/RkKJB2g3HD2//9fokepQ5Vqzig5vWNzkwUJvtzIGlDwoutJrTVelLC29VAXi8DezWlgJHbJL2TcyfqLsqKHVo8QcdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYTsSkQDUFkw17ZoSRjvlKbokiKLtiW8EvUMPhTFaag=;
 b=gb+tzvaDkQEWSZLfQ5NsHKYpDrfg2k6jYVhv2qcYR9gVkWYqxhnLSJr80gN2nQ3YfvxcMP49cL9aNXddz0RFVgsnahQOFjApvJz2Y4ctmIbLeGQIYG9i4MA9uIPm7FbUCs91y5KWucQrwyS6Zo1Lu/R+JZNIWoQ565aKsXk3jnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9775.eurprd04.prod.outlook.com (2603:10a6:10:4ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:26:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 15:26:24 +0000
Message-ID: <59c1bd14-2af8-421f-94c4-0f16024f14e0@cherry.de>
Date: Fri, 31 Jan 2025 16:26:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC kirkstone scarthgap styhead 0/2]
 uboot-extlinux-config.bbclass: add support for DTBOs
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
 <c75e5c2a-f97f-4f39-85c5-ff09499d5fbb@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c75e5c2a-f97f-4f39-85c5-ff09499d5fbb@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0306.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 95335e90-55eb-4730-a737-08dd420b9f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eX5OHskBfDYIsIzOFTABBViTOj/hZ2B0uW26icIzoIzmUIOyfO4VjiX3gZR7?=
 =?us-ascii?Q?B7dF//oH6xVsBH2qY/hC2sdPM+35GOPkUSwv+aXGnMYhi3q1DT4tRYdMn5G8?=
 =?us-ascii?Q?FhWQM4Vww8M7Q96H4jfTj+hI+VrUyYWAKTC6aCnH7DWhomBZiRJ1XtmPhmxQ?=
 =?us-ascii?Q?rjtI2jWF3igD+etVwea2tp1crDfT4iY3CEP+GUX21P6DhmWOBTzr1kBkapfl?=
 =?us-ascii?Q?HJ+x9Ga1xpY7b17wHIhsYXxz5FNTW/kqa8M0AAt/kpGStmmqAENFvPEQ738T?=
 =?us-ascii?Q?hE43dmja1wG1afWCklbdsWEwdtmga1bd1Pu9XEsrHqvneeRBKA70/pTxYLtA?=
 =?us-ascii?Q?UdYPDIoLlM0o17v7rEVHDTKtixL8HIH4ov3y2dEOoHEms/cNIORoZrPHGIlu?=
 =?us-ascii?Q?48G+4GvEa2hgzt62GrF5xpEdCFT5G3IlzVG7FYmpnw37dJqh/H+u0z166q52?=
 =?us-ascii?Q?a4khEZGqA/Z7ztDkHE3KTa512BHLOGefLiqAmkr1w5LDeYJo0QWbx/LvnxUi?=
 =?us-ascii?Q?GkDDJkz0+evZArPPdeFgK24FM2US1NQOvQxDT34E1NpMu3aGUBrqlgAE1qeQ?=
 =?us-ascii?Q?5gdWFwxibQJNmacxm/Gx2gQvLbcEFgOy/ksiSuWuQh7NKxk37QZSvJDTQkYs?=
 =?us-ascii?Q?nCpR0GqDWFF2R+/+3be26qHiHrF/9gZAjnmabpuFE3w4nIEpjTmoT2xzXYNs?=
 =?us-ascii?Q?Alm0Q+2Kfty07YuWmAa3IDESJfzWjyC39shF3fndyvQk3l8Lt+5i9bG2uYjU?=
 =?us-ascii?Q?x8iF9TKaV8l3R1Ybb1J5/gjN75+L1F432oVKV1l8FAZL6UOKosfmLzftWxqo?=
 =?us-ascii?Q?N2l+v+Yi7YF0qigc5uIqbkFceJ20Aa9TgScYf1Zr/2jUsQl4CVuFsuKfUKZv?=
 =?us-ascii?Q?ZAQUAh9O1lAt4uazk++ZtRnUrr3KgZhggNq52Ay0fiWvr+dKdFFqeJXDO3j/?=
 =?us-ascii?Q?f3CUGTA/Ctnyb1MORp67ZIAAqXs+H2FFOudgwj85MDsadaMaG39qOXNTVrhc?=
 =?us-ascii?Q?b1AveY/VVh1JHsFBkwOsBOAFCHlRrqsMPaXoyVFDVAe/BVbB3Ktm4fUuO+5r?=
 =?us-ascii?Q?d5ZhqQi146RYn/VmaS3tKICc06aw8l4/n33g15hPBwS/nYQpBCKDxwFuk7Ei?=
 =?us-ascii?Q?Zmsk2Af6ewfJQh8mR7POJ8yqOBkKhpIfF2M6+MDB22LKgog4pJNG2GZx5q6w?=
 =?us-ascii?Q?BXlErwBkJufnDpgUf84/ryPgtHYD9HicSrUZHOSSCLWURMWdftZBGJXroHGD?=
 =?us-ascii?Q?XHZfptgth2JKa5xXGF+FD1Ir3pMPP9/1KgzXL6divZxawAMH5xaVbGgVHTm6?=
 =?us-ascii?Q?0GeQ4gVcE1sOSeFZ3WNG9GzM32WGkU8OP777X4S3ILAckA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MoyyyzJBY12rScnhMP2pPFk93AyiFp7WFkBUhsrMluCYtQ4o42RgooenJlwP?=
 =?us-ascii?Q?+uQuhorldzN3gCaapsuYLthR/CrLCRJK+9eg0xA26xgQ7WLgicfCIC2LvLrZ?=
 =?us-ascii?Q?PMGv9ZWbRT4UHMq1U+C3lOmdagJNZvAmLKNJ0ZsQjW+Yox7QTKoHef/IF89L?=
 =?us-ascii?Q?04By5owWVdo2wFEf1v12wFQGfUCEoLx/Av77WaHyo2Y2X0pBNU3Eyail9OGS?=
 =?us-ascii?Q?01w/FsgE8UVG4Ad0SOe9ycu6bnBejwRaaAqpwzwdSMALMQXLduvsTdvCNnAt?=
 =?us-ascii?Q?TzdHm3r2UTZN9C1C3FsPB6JJeaO1KV5qDEwtsq2jOM+8n2jP8Mq2qUVqVPeW?=
 =?us-ascii?Q?PQrOq3azkc+LuClqotk+cfTIDs3/j3Dv5fDjdITxUpm7CpKncb2in2cb6ftq?=
 =?us-ascii?Q?JIJLdH3UJwizsw0iZ4rNYd/AR1to776kjjaM3xbRrTquA/4FnEFAsL3UKHNN?=
 =?us-ascii?Q?AvUztuhXQPEzGl/jwyELoqVE5ROqTGWJ2xJSsdJYte4n9vC9AYzbGuxEzlcd?=
 =?us-ascii?Q?1AsOaP6n0rAtR3lMV4UkIvqsNhvtpwcsEl8FF6vKVAPXEgp0X7xZCMCDyUe2?=
 =?us-ascii?Q?ek/9qOogsYBfpxyUy0ctpRASSkKMPAkTWje5uDQnrDo1638psai4G0fGxOef?=
 =?us-ascii?Q?N91VQM+mhFa4dAII1fd3a3bIDEGOd4/vjCoTJuBYA8mxoLbUrBv1etnC97C/?=
 =?us-ascii?Q?W7KxivUdgkBgitQQwT85gpFMxduEQowy7LquvH8JJ+Ej2+js6vCLQA3++hbx?=
 =?us-ascii?Q?G9Lh+C/Ue22mWSkrI4uRNSjjESrcjFpDRmG20BhNsdfMDSXk9rCskh2clDRA?=
 =?us-ascii?Q?9nx28wca7j3LKK5HaLurB+sVH/9pzXlDzgn5xfcObqSmGyR+uS75LVG1OI+n?=
 =?us-ascii?Q?zBE0mBVfAo3sKvICwgFgJDdrp/hSo5/F3hUR9fnWBZP3z8viGVm78B87hNM5?=
 =?us-ascii?Q?nlHIsAsXlkNFNgbgUEfNsEFk0TKmAyPLMtczXwYzIfQ+2kvnhcq4WVSDilhf?=
 =?us-ascii?Q?f5sMYEfP7EA+F4ni7Hs201Sj9+3PVNMkKlOUONgSSslnrlpUAg2PFB6Y7f2W?=
 =?us-ascii?Q?Xk2v3VOCnfV3Y3UjctfhEk83hPDlJ7GL5aXtjujbI3lejvl8DLdsRp7VSHk5?=
 =?us-ascii?Q?qqijTzOAtg2F4ZGQDrGQRXyQ6mY6+qDwZ7XPyBNtNiWoDWHBGpWvX2rWAxpG?=
 =?us-ascii?Q?zbLQh2ub4v0czabkfAyV+/BPlPhb10kyBtU0SW7qWtDcn7a9u6Bw7GFcMvgz?=
 =?us-ascii?Q?bRWvLaSwbomQ2+qxMEc6g8uEW3+qtWD0uRXqFeg9VHsIPl1j62Q8kWJ8GeFD?=
 =?us-ascii?Q?TGg/zCj5udXg6sU4zaIRP7jnq5N2oTAZuKJjS/xHCBNKGP9ArBWUHKFFdXgq?=
 =?us-ascii?Q?SDUraNaKeMqElyKG2+wOiKjN8A3I3yZqDR08oQguRPs2uGBaC/qjWN1Sf9fy?=
 =?us-ascii?Q?hDmdkDTgaJ8RzPRa0HUeCdv6KvrZ64JawY5rHt66yjS0JAvAbizEdGtvvgRM?=
 =?us-ascii?Q?2DeKOZSrGiTyf/fZAfCxK1z3ubZYqG4nZMROPb3vDIEHrcrGjwVTQIKi/Csu?=
 =?us-ascii?Q?7tUGRIip1AyAmaCQ8cKTdZQ6VamWn02vNJ09M0WsFp7AkGYa4/Nc898UeYGP?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 95335e90-55eb-4730-a737-08dd420b9f7b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:26:24.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kpgHboQpk9gmFAeRR6YqozghBFpCOmFNOy0jD0hk5UC2J/zzs12yQNEew/DnJ5B3IBCA10bW0fGnwuydspKSAJDIhSaRrvO6Y/4GulB93s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 15:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210489

Hi all,

On 1/23/25 6:25 PM, Quentin Schulz via lists.openembedded.org wrote:
> Hi all,
>=20
> On 1/17/25 5:40 PM, Quentin Schulz wrote:
>> I am not sure this is actually a desirable backport as it's not a
>> bugfix, hence the RFC.
>>
>> Applies cleanly on top of all listed branch, nothing more done on my
>> side than that.
>>
>> It's just that I'll need to support extlinux config with overlays in a
>> few weeks for my BSP layer based on scarthgap and modifying the behavior
>> from my own layer is not a lot of fun I'm expecting.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> Quentin Schulz (2):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uboot-extlinux-config.bbclass: simp=
lify FDT/FDTDIR logic
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uboot-extlinux-config.bbclass: add =
support for DTBOs
>>
>=20
> Just to let you know that we would need to backport https://=20
> eur02.safelinks.protection.outlook.com/?=20
> url=3Dhttps%3A%2F%2Fgit.openembedded.org%2Fopenembedded-=20
> core%2Fcommit%2F%3Fid%3Da41fd633786a2404b5eee399ed0602e229c4be77&data=3D0=
5%7C02%7Cquentin.schulz%40cherry.de%7Ceaa9390edb094803200008dd3bd2fb5d%7C5e=
0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638732499539634128%7CUnknown%7CTWF=
pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj=
oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DKIVGxHBBRiA5kZN9mvrWI5GH%2B=
taXTE3%2BaJkavsHMcX8%3D&reserved=3D0 as well if we agree to backporting tho=
se two.
>=20

Just to let you know that because this is not a bug fix but a patch=20
adding a feature, we need to get TSC=20
(https://wiki.yoctoproject.org/wiki/TSC) approval before backporting.=20
Since this is a specific process, the LTS maintainer(s) would prefer to=20
do this only if there's some strong desire from the community to=20
backport the patches here. This doesn't seem to be the case for now as=20
this thread has stayed unanswered for two weeks. I myself declare this=20
patch series now abandoned seeing I'm the only one who would like this=20
backported for now. If this is a patch series you have interest in=20
having backported, please answer to this mail and if there's enough=20
interest it may be brought up to TSC later!

Cheers,
Quentin

