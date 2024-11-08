Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55762D5E147
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 07:45:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.93])
 by mx.groups.io with SMTP id smtpd.web10.8062.1731051920605021319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 23:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Xlch7vDC;
 spf=pass (domain: outlook.com, ip: 40.92.90.93, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtotrwcR6dJiZWYDZgxaBfM7fwN1QXsZYfYsbvwIKFdDaQghVoRTfsKWicKQyaLLBQ9fR5ZInIw2p281Xqr+2OcwKePKWML2EvozYRYWGtLAEpxsO8ZWZVB/tUHbFS2rv0dLA4r38Pl0xMdu4WoheM9Qkm4iWNFYr2o93JXzUwX8VnP1cjjJVyFX6FApfwW3U42qy7dumKf67B5mVTPFC8O1kYhQIcBGY5xPQ2afS6iCm+hwPc4AGhqlAAWIVbzzIaljuf0uyfFmTbbv7GIRN0XXg2S+oaBccD8C0LoxT5nepG7WyEaHaWAxdR5sY8NhsxjFl1GIUqo/4Y5b5zEG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKcNoplRQ8+Faf19ZaBfvmIeRT3sWgctPsaZY63aWJI=;
 b=Nb/k1eM/9SZNxqRubAV9LZQLra3nQhPSt4gNrbUAnjurE4zjxFrl/x5huiRnhB01mi7AuYlvu8Xm3BKNVZxKzFxOuVApzziCii9GuSV5kMdL/QiZ6QgNqGvRyW6WVJz0qlLDiUnfmUaTmzQtpGO9wD01cwf00JhuALgTUgLSZ6cY7CMBIfHQ2xD5QJF6GsNgdzSH88N+QZ8HLUTVrL3XgakAYtxd5MJKDfDD2mKQprshs89v8O8V3K8cG2Eiaeph3B8Wp9df8Fpy2BnlPQ1tWmWyCgUFJxwkd6r1GGCawOSalgGUe/99LbFG50HR3+5+bdp+bfpirwmjxn0TqjGNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKcNoplRQ8+Faf19ZaBfvmIeRT3sWgctPsaZY63aWJI=;
 b=Xlch7vDCy/i1P3k1wXnY+QVjaiPsBm1svWRnEDRuUbz9CgMMjWXNa/xNbfMQxAs7PCWXwR+IChk6Pz2zNJxTP0cJ2YqaIfqbftZGg8k2sWhWYa7GyjRFpwFoXgW+8zHGcoE4uszDJ7xzYuESQn2P74gtP9nUjNY/kwkREqCRnke1Pl3Wt6mFCBv7iCLeMFQtO/M8i3HAEGdAvwjiECaJRrwAQ1aP6F/CGBrXRyzOxk53ZdVRA76S44+6ojzOmgQzfufNHxVtnezyRR6wWLILHf2ulh25bUwjUcbZHnIXjf5W8tFHxMcFkClo512lzuvkQ5Ojn6YhVXE4pDJfdDHxvw==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AS8PR07MB8326.eurprd07.prod.outlook.com (2603:10a6:20b:441::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 07:45:16 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 07:45:16 +0000
Message-ID: <GV1PR07MB9120975AAD8724E746D5F7EFA85D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Fri, 8 Nov 2024 08:45:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241105215644.1884070-2-ross.burton@arm.com>
 <2650.1730917856955683740@lists.openembedded.org>
 <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <fdf3b0d0-6816-4d93-a4bc-1490697d4b75@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AS8PR07MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: a6591491-b17a-4b3d-0c97-08dcffc948ff
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|19110799003|5072599009|461199028|6090799003|15080799006|8060799006|7092599003|3412199025|4302099013|440099028|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?61uHKw4ZmTUbrVZL0ExOfcylpz2rk6j5k2h/qqZGSUTfKf6yg8kLSNhF3JyX?=
 =?us-ascii?Q?LDwX6xigfYYip7eJsAilbw/wnUvcxUXLcC/bFFIE80tg4ZTB0nz3ybidBtZ9?=
 =?us-ascii?Q?GcnmDLT9VZDjEJm/qSMmaflP3ut5XOG6mNUd4gZidYXX4qropmKuIoIOqkhR?=
 =?us-ascii?Q?eT3lZu1+x27ZsKFSI5OXjhMmU9oKk3wABxhiCUFTEGMpEIW9TkQTgYriwZ4r?=
 =?us-ascii?Q?aGW2PCSu1GbILxcL28GafZBGScPFcYbDYkwuvw5id1vTzwfwLFWZoRYDgw7E?=
 =?us-ascii?Q?1jACmIj/y6FwLE/FPSCKQLs3usTepkTMTt5gVO3rpu2JI/yfta+8aDr4SlfM?=
 =?us-ascii?Q?VrCoG4CUybG2NqOqVlSPph7FkRmdq+iMBQfxHNmPrq1sCKER+v5gAauEQRo0?=
 =?us-ascii?Q?NRPcpirvNGUpeZPEJjBPrq0d+fMoFaRXl0RaQF7FqJiMhW6159ngSTDFt0EJ?=
 =?us-ascii?Q?p8XEUycD5aG0i/W4NQLUndT8l5gyrQKRWqGxhXDvUMwBGV2wU12GTOX+DT9P?=
 =?us-ascii?Q?kVPFDJ53Eu5+VsZLgHnflBPM3o4sGUVrlMS+iBVNbc4H6L1ZGExTGtmMkClX?=
 =?us-ascii?Q?5iG9/MZFm/+3tjAsZWDBD/mYOtn2W8AJR9Y+mq5sHT+ces9/NMY3/EIwjPR9?=
 =?us-ascii?Q?3R2tCTDfxA+uuwqYPVgR1z6Ycqz5Wt9Y536tdiq/4mixOjzOPy8kTFbX39bj?=
 =?us-ascii?Q?hFQys6oe06iQaj1YAUZ17anRO3kejpshoEuMVgosCnmLsCYAfInsxK3iQdo5?=
 =?us-ascii?Q?41BXakwLGOLqdT1weeRaacTf67qWySNmxlo1QEnnj9LxLAuoDhxqVuG5nzYW?=
 =?us-ascii?Q?RPdjM/prrNLlw418Ql2WUl6epO0dfkFrEwo5j4C9nXMPoiUlELh/F+MG12lt?=
 =?us-ascii?Q?1lf4YoDhBwGJAHij0OF/uQrnZ6dl8ENIM+mqPEaLt+e0tffg3RuBHCN0CR1Q?=
 =?us-ascii?Q?+zVPHvNtJ1RA7DA2sxJ9yj3+LcTtN9bn5AjY64K6mHQOKFYapV6RITw/Z95i?=
 =?us-ascii?Q?CHfUde+SFCrZmGARjnt+QTnyzcDTM6ysJT4lOJ6hqYAIOtkEXLC8kqDusW0S?=
 =?us-ascii?Q?YyMLvcWif8innWxy4r9ENKwaorxunVi08U+Lw/8Y4oV3TANOgmb5piYvpCPt?=
 =?us-ascii?Q?TLx+wgdYqBnXn7AuKKlvx9oQhzcj7C2iVtvSvF+olHAdc/yEgWobah0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dl5S2Nwou6TFD0vNUg3LafnQqGcSeQRvJc868xWb5aaVCo1sSwVzEkQoOTCp?=
 =?us-ascii?Q?Vyy9n8v0zMtUcspxgdzO4mKg8s/103+Kp4Xf2YJZ6n69LVy07xua8ia0nyD/?=
 =?us-ascii?Q?tuTmd+QC9HNzp4kXG7VLmFdPws+biAJqZ+BWAl418Qou4zm+XWkv5AofgIEd?=
 =?us-ascii?Q?EURS8cczRDr//st//MIld3hxsUPnyPHDe6Po7gwBcaOlScZWE8omhE1kxYRA?=
 =?us-ascii?Q?olG6kIUZrNfv8A4tTFSBLMLml6mCoHXmn4xmfvfWAGE4keHFKHPMFmEdW6SE?=
 =?us-ascii?Q?wbIVXEuZ3xi5wuz5a1kWGinmxcIdnIlh735zR8ZBcOUR1sCMqkuxXV7u0jk8?=
 =?us-ascii?Q?NNO7hFPO4uwTCeKUlH8NbgB9HViTlUK4pRwMqkHdCbyZmRzNuwD/vkfTAMCq?=
 =?us-ascii?Q?z/d8/VnWsqI/IPV5gIdML1flkrnFD5DabCdcp8DwnzqxfPhC/KB38Gn05Yfd?=
 =?us-ascii?Q?jIZV5vEUW+br5CTZKgYFxmbj9jUnKT2vgt2MorkHWll6i141TPdXZa/BC3LR?=
 =?us-ascii?Q?j0DTqBwmtSWLniEddbDJsZd/0mLbHEoS3nVTiIqiYq8La5ISrkRvM0uUmlr7?=
 =?us-ascii?Q?DjSIQW2NCFRzuEgJcgX/OMUpV24pcGayNrBb8+6leOYUsCSfaqeNq6gbzoBp?=
 =?us-ascii?Q?0hJrLyQ/Gb+xjp/fJi62n/NxMf+axqIJBN7LVHLj4elRJpXIW4VZrF9SstyR?=
 =?us-ascii?Q?UHC4xhqG4NI3DuUuIeXRf/NxRWGe9ThaZnIfveFLRZa5GGs4r5Q2ZvIGBjdz?=
 =?us-ascii?Q?qP2JCMPrcf8lTtHcUu+mfBwNozq0RCex0n1C65/3fBYQiYsPji7NL/qAg9ta?=
 =?us-ascii?Q?ue1ifx8PANLkNRLTQm3bMw6DwzpauQUDxq6qSMR4tc0UhxYX5qb30nThOSAB?=
 =?us-ascii?Q?s1el7Fsq7rRLtc8hjXhnyoBJhd6OBx49s3u9p4hBkIOgMLlwuidDEUi7rHl8?=
 =?us-ascii?Q?5eRzNvXzc9JshgMLb+w0FJQWWW87Q2Hm94UWwjaKls5csgzVYBPnCoxoRCZF?=
 =?us-ascii?Q?Q8EW4bIJAbt8SuKLIs8ciYToQdnNTP6871kntjYrUYm1jo5tP8ZEzTdtTLYl?=
 =?us-ascii?Q?VOhRaqSIQsGyU7dUoKDb/zBy3f5ag6N2MWKSkj621AhMSKpXF35WR5tuvVFf?=
 =?us-ascii?Q?bWbr1LSP/5oJiafiFdcoCxIxRI/i7Y2lClBPknHUGuLnF59Yh46SG3AgPBrF?=
 =?us-ascii?Q?IAMG3v2KRd7tYAL4BvNvth61md17iBjj9Lox2nOy+t2eJpNLaQuEZLbABo89?=
 =?us-ascii?Q?WM3JjFCXdPSGk+MlOKSC5q8LdjnhL0x3swIatFhKSj8Ksn4hV3Y1lDjkxqht?=
 =?us-ascii?Q?5bo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6591491-b17a-4b3d-0c97-08dcffc948ff
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:45:16.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 07:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206857



On 07.11.24 22:40, Ross Burton wrote:
> On 6 Nov 2024, at 18:30, Konrad Weihmann via lists.openembedded.org <kwei=
hmann=3Doutlook.com@lists.openembedded.org> wrote:
>>
>> On Tue, Nov 5, 2024 at 01:56 PM, Ross Burton wrote:
>>
>> I find that patch incredibly risky, as there is no really opt-out.
>> As the main beneficiary is pandas (which is not in core), which not add =
it there as a patch?
>=20
> You can opt out by setting PARALLEL_MAKE to -j1.  Pandas is where I notic=
ed, but I expect it will make a difference for any package that builds exte=
nsions with setuptools.
>=20
>> Also other suggest that all that can be achieved with  --global-option=
=3D"build_ext" --global-option=3D"-j5"
>> set by PEP517_BUILD_OPTS, which would find the much better options here.
>>
>> Something like
>>
>> PARALLEL_PEP517_BUILD ?=3D " --global-option=3D"build_ext" --global-opti=
on=3D"-j<job count>""
>> PEP517_BUILD_OPTS:append =3D " ${PARALLEL_PEP517_BUILD}=E2=80=9D
>=20
> That=E2=80=99s possibly a neater solution, yes. I tried using global-opti=
on but couldn=E2=80=99t get it to work right.
>=20
> Ross
>=20

Maybe as an addition, why I would like this feature to added in a very tran=
sparent and easy to undo way:
https://github.com/pypa/setuptools/issues/3119 - I'm a bit worried that in =
the wider ecosystem things will
fall apart easily, if parallel builds are the default.

And as comment for the v2 of the patch:
I believe --bdist-dir does set the build dir to a path of your choice alrea=
dy

