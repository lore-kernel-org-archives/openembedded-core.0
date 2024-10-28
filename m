Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0965AD13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 07:43:09 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web10.46210.1730101380496967705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 00:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=N8Mb0BYm;
 spf=pass (domain: axis.com, ip: 40.107.249.60, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHuKY00JXpGSWC62Ik6B4e5QtKQA5u38zaoyXgQp044IjHS7omNl2pvdbSeG6TWjKkvSirGTTbU2397gY8k/hVw7j0zu8YbsOEqy0X+RQ5ZIuMsNPYA+KGDRl36453ae/RQ57/yG4fY9eGyZW+pm/GxszuzTcjC9a1Riu0ujEZM00EmkksLgtYOBflNgxuqYcwIlkOk33uv83FI4mHzWhDElAKascQVIEDZV2n3ywMCdPKshHWQ5STNJjBxe6V/Zen3v9MiPRRCD0ymrOewOVqFSw334N0MyPf504tP6zE+e1sUYMdaEjPwpPJQb7RpM1/9DdMI24GxuMHVC8FthHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SExMl8+bpH23fqJpJlv+Mr8NB5CjMngn3feU2AP+sQo=;
 b=o3ZXDIig0T8h2A78H47U7JYt29yWne/tSvZeivaNag0drAPi9vHf1mJq1UFuYLLkjlMSWHsJTgCWpe2/sVplcN+vmzXOGYyD9s7ykvheAkfD3af8Q7aBS7V2hDp8qj9ow0arn4nz7fURomJu2vSHJQDR+QkJ1BWAt3Y6YlPYIeIbgZ6qUdHki4GXpKzb6S2BkKIqFJZJ9QbfnFQYZqoc7AvUiiugZTgJZoRDr1u1A2AVe8uC8u1QzsMyxw7n4VdH0IYwcRs+z6y0Sr6ebaL6/dYQhvFB2bWwIEb5p+CvzsRA03Ne6+btVwM/idafhlLjuKfDhcnLjaCE4sNObYmclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SExMl8+bpH23fqJpJlv+Mr8NB5CjMngn3feU2AP+sQo=;
 b=N8Mb0BYmSrjxC0SMACEFZUwPcaX/N+NNoBCfYYFCSTlUmMoP23j7oJSwM7P7v24bczTC8Jkpu79j8W+Kgo89KE+UJC63FX/oBuwefHWhXyuwlyM1y+ZV6+U9m+YHcs7cp9V5mMevY0+g60IFHBAN+KoOTzU8Q24+jzVrv3RJI14=
Received: from MW4PR03CA0192.namprd03.prod.outlook.com (2603:10b6:303:b8::17)
 by GVXPR02MB8350.eurprd02.prod.outlook.com (2603:10a6:150:68::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 07:42:54 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10b6:303:b8:cafe::b2) by MW4PR03CA0192.outlook.office365.com
 (2603:10b6:303:b8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Mon, 28 Oct 2024 07:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 07:42:52 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 08:42:41 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 08:42:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Oct 2024 08:42:41 +0100
Received: from pc58073-2410 (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DE6683A5;
	Mon, 28 Oct 2024 08:34:58 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: <olani@axis.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ffmpeg: Package example files in ffmpeg-examples
In-Reply-To: <CA+chaQfU4r3funtCDVafY67z3CM-wkMYQ7jXH9F+sD5Pi06fvA@mail.gmail.com>
	(Martin Jansa's message of "Sun, 27 Oct 2024 18:19:54 +0100")
References: <20240827090212.2192055-1-olani@axis.com>
	<CA+chaQfU4r3funtCDVafY67z3CM-wkMYQ7jXH9F+sD5Pi06fvA@mail.gmail.com>
User-Agent: mu4e 1.12.1; emacs 31.0.50
Date: Mon, 28 Oct 2024 08:34:58 +0100
Message-ID: <jwq5xpck7dp.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|GVXPR02MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b0de7a-3af0-4d8c-717d-08dcf7242130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|4022899009|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c2xRQ3NrM2I2dit2OVc0VzAxY3VseUlCdUl0VS9LMjNGRjRDOTNzcGZoN1lD?=
 =?utf-8?B?TDYraWRHMzVPQXkwQ3d4Q3hURFNtWnpsZXByTmhMV0gwcDBpN3kwRm9TdlVR?=
 =?utf-8?B?dU9SZW13eXVYNlVtRlc4ZGtQODFYbGZGR0dSa0s1UVA4OTNOUGVUbzNrak5L?=
 =?utf-8?B?T1BPTHRPM05qV29DbnVCczRnOHByY0ttZEJSRSt3enAwcFhneFN4blVtdDh2?=
 =?utf-8?B?VWZ1K1NJTWViSFRpMGREU3hrNXM3VGxmczRidTV2R1JyOGcyRk1HZFlsTXhN?=
 =?utf-8?B?WXRtOURMVzV0ZS8wZUVQVWZmU3U2KzAvTmFqSXFORDhFL3Q2MGJ5SVNzNmo5?=
 =?utf-8?B?eUx1TVA1YlZXQVlDVjA2YkorQ3NLblB5YkJKNFZKZG9PUWM2TFdxWStETU1k?=
 =?utf-8?B?TTNZcUNZN2FoSkIyNVVWVGVWY1Y4ZkF6S3hxOGh2am0wYVVzN0c1bmltREFa?=
 =?utf-8?B?QnRjR0tUK0E0Mk5ybzlGS0Y3bk5DZzh1YkxhUXMzSERIUElqTUpycnYyU1pB?=
 =?utf-8?B?WGhlZDlibGpYdmppRkZMbE5CMjZOUUM4eldWb3dvS2tsS2dRLzFJQzFvclFy?=
 =?utf-8?B?aDB4TERNaE4vbDdqbHkvNGtjY3lnUWthaElZQUVrNWhUK2NueDdFT0FITHcv?=
 =?utf-8?B?VVhUL1hBYllVY08vSnE2T1liU1p6bTJSTDVTaW9neEFBM1kydUJma0lVYXc4?=
 =?utf-8?B?VkMyYy92YVRBcUVvVHY2NThVQmRhNFBBVlM5K1JiQWc3Z3N5R3k3eGhQSmgx?=
 =?utf-8?B?bUxyaE1rN2QxeWg3U0x3aDVvZm5Fak5vOHFaT205ZTRkTHVTWW1pVVR5Uzda?=
 =?utf-8?B?L3QrclJoVkhwcmp4NTFGMFF6WWU4UERrVExDamJOekF3VHpvU1N4TXBQaFE4?=
 =?utf-8?B?bEMxUTJwVklWcUlFbzRxQ29DZHhrQjVMRjloQ0hGV0R4UnRCRXNDSDUxVUdi?=
 =?utf-8?B?RTNIODd6QjZTdGU1aEIxUmZDbUMwR2dTZFBQQ1hFSnBrbjJpVWx1M0RYNU04?=
 =?utf-8?B?bm8vU0NJdVZCWEl4Zkg0d2RPQVdDbmtBdmJRaEU4SmhEd0lhQlBrd2tjTE1B?=
 =?utf-8?B?YUoxc1JCSUVZeDVpWit0Qy80blJnSlhoREt1TmtnVmpmdTlJUm9md3M0bjlu?=
 =?utf-8?B?NkhEVGU1OTJnYjd3TVM4UmlobWJZU2VsalcyRGREZ2ppSWRyT2g3NDdiMGRp?=
 =?utf-8?B?TlY4SktWQzdsT3dtWEV6R3dJNzRZK21lMTdXWU5ONVV3dS9xdnNhblRvSTR2?=
 =?utf-8?B?bld3MVZ0bFRJaEZIRDNxM0dwY1AyeThqTGRORnlpS051YnhTQWxCMGd6bUN6?=
 =?utf-8?B?VDBHL29PMFYvc0Y5M0JQNnFqSW1NcjQveVMxNXk0RGJpQzV0eW1ibVVuancr?=
 =?utf-8?B?ZjlWdlBjSHFiREZ0bXdVTjVEbUk1bTNYMTZNZURLTnI3YUE3SjB3blNwdEk5?=
 =?utf-8?B?MFFiTC9NWkM0c3htV0d3NnM5aUhYSEZ5ZDVPS3J4VGQ3QUpOTldTemhnYkdO?=
 =?utf-8?B?cDJ4TVNGVFRsekFnSUhCVTJVc0xBSUZBdFRCT1ZUaUUzSG9uSVF0QnlYSFVQ?=
 =?utf-8?B?dDkvZ1ZiQVVOdWx1UXJtczQrR1g5ZjVzaCtGTS9JVjlrMUpPcW9HM0ZKTUg3?=
 =?utf-8?B?YUZXajZ6NXdyU0VubWRuQVZyeURUT1Q2UDRhMnFReksxM2J2dXVWQitDaEhq?=
 =?utf-8?B?SlpsYzQ3SnBDd21na2hyWjhOOEZPd0hocCtqcEFmT0lxdFBnQmZHbUtCWEps?=
 =?utf-8?B?RE5EaDVSWkRkK0JtL0EvN3F1d0JVdi93NlR4OXQ4L0xmMnEyb3NuUlQzU1FY?=
 =?utf-8?B?VW9paC83ZzEvTXhoaldNZHN5cnNNZXQzZGJ4SEl5ZDZPK2JuOXVSRU1ub2Rn?=
 =?utf-8?B?SUZVcWVubmJDUmgyMFlETWZEdWsyeUM2YVQrdVA3V3d5RUJVR0JIa25URHBN?=
 =?utf-8?Q?TC6Yuex3VQ8=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(4022899009)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:42:52.6849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b0de7a-3af0-4d8c-717d-08dcf7242130
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB8350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 07:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206421


Looks good to me.

/Ola

On Sun, Oct 27 2024, Martin Jansa wrote:

> Wasn't very future proof for multilib :) please review:
> https://lists.openembedded.org/g/openembedded-core/message/206410
>
> On Tue, Aug 27, 2024 at 11:02=E2=80=AFAM Ola x Nilsson via
> lists.openembedded.org <olani=3Daxis.com@lists.openembedded.org> wrote:
>>
>> From: Ola x Nilsson <olani@axis.com>
>>
>> The most future proof way to not always ship the example files is to
>> package them separately.
>>
>> Signed-off-by: Ola x Nilsson <olani@axis.com>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recip=
es-multimedia/ffmpeg/ffmpeg_6.1.1.bb
>> index fe34b87ccf..55313cc583 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
>> @@ -170,7 +170,8 @@ PACKAGES =3D+ "libavcodec \
>>               libavutil \
>>               libpostproc \
>>               libswresample \
>> -             libswscale"
>> +             libswscale \
>> +             ${PN}-examples"
>>
>>  FILES:libavcodec =3D "${libdir}/libavcodec${SOLIBS}"
>>  FILES:libavdevice =3D "${libdir}/libavdevice${SOLIBS}"
>> @@ -180,6 +181,7 @@ FILES:libavutil =3D "${libdir}/libavutil${SOLIBS}"
>>  FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS}"
>>  FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
>>  FILES:libswscale =3D "${libdir}/libswscale${SOLIBS}"
>> +FILES:${PN}-examples =3D "${datadir}/${PN}/examples"
>>
>>  # ffmpeg disables PIC on some platforms (e.g. x86-32)
>>  INSANE_SKIP:${MLPREFIX}libavcodec =3D "textrel"
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203818): https://lists.openembedded.org/g/openembedd=
ed-core/message/203818
>> Mute This Topic: https://lists.openembedded.org/mt/108120002/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

