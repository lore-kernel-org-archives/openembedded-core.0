Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A256FC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 09:16:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.104])
 by mx.groups.io with SMTP id smtpd.web11.17079.1736932568664097949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 01:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=G6n1EJKT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzqA775QbzrCKhSpO3bYVVDTD5L6aA6klgPt4p011fQyCqtVWFBoIXTZUemUU73WcBDxHb05r7WjFmjf3jgovgrBm4iaPA2rRKfcA58sHvXtHLJ5yCF2KXD9Sx5xhIB5MwMxtny8wxMA/hKAKYa5gkTbZW1bs/160vcNbD08xbdH90M2tglIL54TkoivKxYnQlqBzcidanvnuPgqzmm3ZL/FB4unE+feYYJji4qKrcf6DE3o0ptjooKFlX0QF22vEoyY4b9YAL/rMTab+bOke5wdCpnjegNf7IiahocfcJN46NCO6VvyHwKUfGBeZstjDccRFFNQXYZQY/izEtY7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2mX/oHq9B/5aGvPbXMKmCIm1/g1I2w37G9m6ZywWhY=;
 b=WUK36xGm+tPQh0EVvU5Bvbl0a9aWIRfL5SqXeRZcHul2DKHYvD3Vx779vEmQ/lpixPX9NstjGlduScF5ifEarKO09lhxcz7VGbnsZ0n9j3hlbUVTsYg151m/prazt6+/2Gy9VUteKQjhWFLemM8db2bzFLApjTmHMRfdtrGMbYUYceW193a1PCdJm0wbygrH+AuWZmho6oXcZqeUAdmgQMvgjdPAXqXr8/C74MRBLkBx3GiqX8yKQ750pIASb9cw6a/fjSXpYlqvOIo8OAlDvhZaI+Shr6EI+V56ZpCEENUh7uVR4fSBRNf56RAGq7MAf7OIehK5u6nrvO8QWfBTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mX/oHq9B/5aGvPbXMKmCIm1/g1I2w37G9m6ZywWhY=;
 b=G6n1EJKT0C90S2oyEANLS0G1zYC1K/1uXYD/QCEVif9bxbZ1t6hfRRHJItmUipBlu4sx317dY/4omAR4tvNwStLY9GQbpCuoJY7lnoEqDfYYGC8VMfdC615mGJPchl8IJ2yHCmGDU9ttUclxzKGfe5/2JWM3f0dUvnsW4sGZdP5bDWfgEkATSbyDnm4ElYKePbY7wwvZxHptxPzpxqtJycGTy1Qem4/yp0P1XFQwa4hFLFjlPEkxgu44qjv1I8azZBZi+dYW+9s2oU4KqUoGTLlR5DmGFjFUbFZjmG8SQYCfOBQljwQ/bemOa17tFqt0ybjjm5FbkoeKZ9FXKHTXpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB6856.eurprd06.prod.outlook.com (2603:10a6:10:1a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:16:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 09:16:05 +0000
Message-ID: <6a4510a2-f311-4dd6-a276-2d37b2b6736d@vaisala.com>
Date: Wed, 15 Jan 2025 11:16:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] vex.bbclass: Cease forced symlink creation
To: Marta Rybczynska <rybczynska@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
 <20250114153748.2358116-2-niko.mauno@vaisala.com>
 <CAApg2=Sw3-_bLF-ZQB1CW9CqhgsEj9skY_b9-NYCLVau_5pWrA@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAApg2=Sw3-_bLF-ZQB1CW9CqhgsEj9skY_b9-NYCLVau_5pWrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dac4e2-10df-44c6-b153-08dd35453d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kzjXXz/GA0SR7S9zFTsCnfbkY/QDtExMnhZAgSpAoFzF+cKPEarbNQXptmgD?=
 =?us-ascii?Q?81yqta570Hzfq9QZ8yU6uCt9SOod9K3ZSGNMfmnbmRfjCaIhZjqfXfciFd8T?=
 =?us-ascii?Q?qvFFtjn1ouef7+Yv5xvNP1pDK7yD/a/7BaC51mxPzGJ6or6Kmpo0RT1nd3Um?=
 =?us-ascii?Q?EyW2G+Fx09KJfo19pgn5eAp9RC55+/hUGkZZqEk0+fF5c+DPZ4kuuQIu4Irq?=
 =?us-ascii?Q?fhnAJuU6wjOrVgPX+1DvdMkJHHyBZW1/tNPbi/dSCN9RC3NTSaUMkeQTZvek?=
 =?us-ascii?Q?JCmh6W8zwOqeMShia1jckzs7oixKcEy3ASR6oi5Y4tq82qfKvC35LOXuBWVL?=
 =?us-ascii?Q?ZPOPpPForJ0aqcmnP9fqRmIUFvJT4zFFRj3HWpHfkxLJVc5Gh+FWrc2IEnWM?=
 =?us-ascii?Q?jaQLy0gExHB1he/ZwfS+T+uPcrB1xgbGRUUpDSIg8AzBawyrDc4Bjdsl6Erw?=
 =?us-ascii?Q?saqMGkBPvfJU4saeRB/1SXPoteAHFk737ccgCZRYF6pmRW8k3uv72THryXNy?=
 =?us-ascii?Q?9A58IHI7deHj05J3sEUUfJV7+IKn2XYw6+PpfGoLfIA0Lo3B5snH+jh1SOEZ?=
 =?us-ascii?Q?kTZV4io71H9OVZ5DNB7J/J5j3uGFKOH0WTURW6irvQLb7edFYgKnXGthnYJd?=
 =?us-ascii?Q?uVCPNptA2baOCGcFMngwItwrnYtu4bE0+F20jBX2RnVUoLYhn+V5aR5llIxz?=
 =?us-ascii?Q?YZ+c2vxeMHyS+gXe4DFppRwcWT4k79F0ZXoBHktSV/ldH/uLaR7WhqkhAWKg?=
 =?us-ascii?Q?7FNy9z9TER6kJqZl+v+maffYXUH3gSckdKs0+vqN0+UMw9w4hn4Vv/DTH4aZ?=
 =?us-ascii?Q?Pwv7mv7LTQ/UC+H6j2l8uF2KFZxdc8beQbEcdKb2eMRLRBFOSwapEYCRxmb/?=
 =?us-ascii?Q?8xiQwc5Ngn2yX0YlaFZHjbY4f+T7aQeA3q8eOeyxrKjCmxmsqkLDXyBp3K3f?=
 =?us-ascii?Q?QTpP1DdbjlNG7gAAVUfGefpQsBjv/D1xcPeKEQ7+gVwOvw8rnIef6WJuGmNb?=
 =?us-ascii?Q?bwP5Hnz9mCovMAn9xGMV//vjIrPqlGRgmP47sLqlSV0WpEa/NLljFgwQufMb?=
 =?us-ascii?Q?wr5hWGDHCH24OiVt2pHk2wgpQtEn0v2xzfckyKktN9Ov8iszaqp5sFR+GdyG?=
 =?us-ascii?Q?EloEVYlWMFX9MCP5Q4dyJhxzX5aiZVVPoUZcaGPRZ2Jug0kgBIS552XkBLL5?=
 =?us-ascii?Q?dqO9hkyg+Aa+sZuLwt6SVXZ6OiOJv21HQjTaDKaVSik2SVStAhhwlmpyejcp?=
 =?us-ascii?Q?2SCnPD6Z9OzoB1+6U6+c2h0GzW0hvQSg+d/WYtjKl1/n0xymq4t1C96tsVGD?=
 =?us-ascii?Q?d/84MmYqeJ5i/jcXaYnQxlGgz8qi6IfG3EMwLQhNCrGnLg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AqIqoJjZb1+K8jlPP4g+j9erkBMK2iyZOZMD0Uky5LbIPtbQQvGfRbGhFYic?=
 =?us-ascii?Q?SBcvHq17n4UXSLKDnz94UowMzfsebqAqzHV4GO+40s+wD7MomNnCI5BPJIL0?=
 =?us-ascii?Q?pOGVXutLES2CvwzXXUWmMmwDUfEnJOcdQl2AmUUyvHCvJ/TiG6oyfxaoTsb5?=
 =?us-ascii?Q?IqK0CO5ZsW8/JmaKOENaWoWdqv9kS94XdwukB7ay5P66opClcuIAo8KbyxDb?=
 =?us-ascii?Q?r8ppRfG6MvN5XsPCIEILsxPbcCK8zOADjpe7qan2H0PN5rvEQLZhcCBAj4sw?=
 =?us-ascii?Q?tTH0Lt2vlkpevHmlifZbtuo8NIPvBQ8OJ1gFhZRXLclssGQ2X/pgw/nAE8Dd?=
 =?us-ascii?Q?zVQTD8ZgSox/Y2mo5zRKb0sIOQSqtIRbofIZKQwf9hmp35+K9jk6YQu3xJ/z?=
 =?us-ascii?Q?nwxcnFEoIq/o3Wg30OTEZ1upKZziR9L+zYOcEF8KOEltR/vFpEpXEAbIDGQP?=
 =?us-ascii?Q?pq+sD3WhTVNVCs8wIopsOmyHOM2xAbbLb7x5xAVY80ygnWYBI+QPkiIZ0WGG?=
 =?us-ascii?Q?N/Q/pJTv9aBG52giCbaYl3TT6RxdFyp2iJYdpklHOjRxfdjoMSAl+9O+nAVO?=
 =?us-ascii?Q?3NGMpHemUGnytjDgxAOiFiw+hvRxYVinsCegprCavop7zffZ6p7LGy58/yT/?=
 =?us-ascii?Q?01nX2J2yVyWGVQztlTBX/jXLhOVlidMacMP5y28gW7ZhXfjaqBd/++cpuLTu?=
 =?us-ascii?Q?IC8wqBZHsrj+JlhyJltySAoU+c0PcbXp1Qk9CrJW5HGhq4JWdX7UqvWwVHFo?=
 =?us-ascii?Q?ORovML0XSbwrDJ2D5WWw3MpaakIf125Xd8Ly2vpZb2/m4bGpqCzyAMCCu9yu?=
 =?us-ascii?Q?jIHIsorgWxs21ynclVrq+K/g9kIfo1IXDOyhrgKyeH9Doh28SigamGsJO22r?=
 =?us-ascii?Q?sX3vQdFHKiL5FBFZ5WxSoxXwfmUuzu8/8RjuV+fb3O0lZvFr5D4OidvH9z3p?=
 =?us-ascii?Q?JNHxGzdTcYT6CD1E0WGx3ZE1DeLyPbZbcwhem/rh3q+osDURVM9TwW8CkCWm?=
 =?us-ascii?Q?ySu5n+ceoNpNuCFpIjan9TFVc1k/Vd0Bi0Etk4DNW37uG6/jZoPS9QZ0e6NR?=
 =?us-ascii?Q?A/vRNCiITmZO9p8SUI9K2slnnzMg1BbFPmnfnn4CgZHxKILpulINxPvLSnsk?=
 =?us-ascii?Q?TCu7acOjXLbIToQWKKja8i5CR2LPc3zpYfjweIlNvHr2zeLd+uxoNYmjRxDM?=
 =?us-ascii?Q?seqPYsljRtMbyyEkNpxA7y1MlqX/PXTRnVyBIHznYyUf0Tw+4l/1BcHOEK0C?=
 =?us-ascii?Q?Vu9/kOx30rDUA+4vY6zNR62n3ym/y6F4ezwpoCQ6GpD0VKhgkt/a7XNvCDvU?=
 =?us-ascii?Q?1ZrTNH5Swju+r/xdv8ikcsJ3kYM93+0y1AVl2zJfr+NAas61iLfgq0haeWO4?=
 =?us-ascii?Q?TPcSTpYYihNIXerIoOxNalSjYZQzCpPKCo7Ykv9tpo2rdRAW66T4Li3Ya75U?=
 =?us-ascii?Q?ia+Yday2xrkFcVnr0HY5QrCq7lkY/Irt/M4+6EBLQgKgAdESSJr/a7aLE4SN?=
 =?us-ascii?Q?t6i/i27U84si8A3CJOpopIjMejuxpbYrqSCDGMFkOIvuVFgWzNrkrNrFy2L3?=
 =?us-ascii?Q?FFOzrn10fF4GOIw2dZ1wqGGNvmQ+/Bm3DD+qGv1vrC0rW8Fhlsw3jqQXJaEL?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dac4e2-10df-44c6-b153-08dd35453d64
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:16:05.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVSppxaQ/FZWwNm4BNNjS4sUN50ayNAVScP9icaKbpsfPCfl941xmQ+HoWVK18NGIbQpG5D+fi+8UJSwZNWHcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6856
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 09:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209823

On 14.1.2025 17.57, Marta Rybczynska wrote:
>
> On Tue, Jan 14, 2025 at 4:38=E2=80=AFPM Niko Mauno via lists.openembedded=
.org <http://lists.openembedded.org/
>=20
> What about a common function to use in both cve-check.bbclass and vex.bbc=
lass?

I have so far been exposed to using cve-check.bbclass only, and I thought i=
t would make sense to fix the symlink-less use case in both bbclasses where=
 they seem to appear similarly. Making an architectural change was not in m=
y original scope, particularly when I am not familiar with vex.bbclass cont=
ext.

> Also, it would be helpful to document what happens when the variable is e=
mpty.

My intent in this series was to mitigate the behavior with respect to what =
is described in https://docs.yoctoproject.org/ref-manual/variables.html#ter=
m-IMAGE_LINK_NAME namely 'It is possible to set this to =E2=80=9C=E2=80=9D =
to disable symlink creation'. So my assumption was I could just update the =
document regarding the 'you also need to set IMAGE_NAME' part in case the t=
opmost commit in this series is integrated.

> Kind regards,
> Marta

BR, Niko

