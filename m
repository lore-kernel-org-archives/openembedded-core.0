Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B4C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:29:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.109])
 by mx.groups.io with SMTP id smtpd.web10.20359.1739377764015082259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=knKfsHKL;
 spf=pass (domain: weidmueller.com, ip: 52.101.67.109, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHKvC0YpXl5r2sC/SxIvRVUX5snjkQxVtXQIcj4Uy5FRQa9bNDamoym3CdINQRmlWFslHJeWCL5+b4bHeFE9ifz5ZaSZBGu+5nlGSl9DVOP1h8TRh0Gzon63Eqv9y4pTbfHytVI1V2VmGjbqCWwzgMMxxIwCBH/BSf/JPolaMlzEV/rb43jjjp+2IRlkkEKsEVddHn6yiWWWMdQY59RH+L0wM7lR9bX1ZH1C2JTlxQYbGH2SgZbo31Cwls+xHC2VuC1rOqbS9i1R1x+4cGmfEDdqWxeGd+UXnz10IxSl6f9z1G3iIuuBZ6znS3LaBPdbRCq/tQFfMFAZW6N1EIvKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFr4HEbyetu3jmrK4wmfAY1AeCYgPb/t5PVlKGPen8Y=;
 b=V1lGdl5E4r44XQ9KAfOXyE51QmK2gnhbf+8mXs6q4zKxC6f4ahYUwVQeYHoX825B4xxEvAVTPYVQUZjh6ffIChbdV5/WQWdkpHKfjUJaRJ+AOhwZT/VR3YKqWPVtXKPc7NCYodfyjwE+V2p2pzgZB9+l88rO1aAlnRev/OFsYKO4ADkWKJvoIf6/svkfDB71nKXNsRfHyRum+3PSJUlLLXu4Xz0WtM7hLKaJe1VonHMtLsNaamBcfCNz9snz9OvzBryBgO5VQE+Wi8S2wFe+e7VgimlBBtLPzMmwR6nfaIKerB2GzpN0kilx+OIGSYi4awTyyae3+9UOFJ8UgJ8Mnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFr4HEbyetu3jmrK4wmfAY1AeCYgPb/t5PVlKGPen8Y=;
 b=knKfsHKLiYEwG82ORd+e/fc9hTS33WvXG2UMUi2MGCVQxLXEe2nCWjjj3gO7JLxyThxAZdf7y/1fulAQtGernk00cyioOPe4B7jibMKKJhT7FhTY83NG+TzBofE4cK15FllPgJMVQYzCzihyxBwzcF4sxAcBNoebyvThsVv7edaJfRnkKoZiL+Lan7BfJgQv14X9UUhawiTdbOjMc8Vf+yEYbkL7TdT0omRmLGUUHfCgC3miWda8MwDRVvNYcqzEJdb1u3kq5Fqv/hyvIUORrXiidfbkz+HWh3g7X/ygo4cQQfNNL/kbjsarEjIrtcC+gN6+3X+lywfW1NqY7jtjww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 16:29:19 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:29:19 +0000
Content-Type: multipart/alternative;
 boundary="------------ZzdQxL5KIJ4QIh0X9STo0CLv"
Message-ID: <ed0bd088-529c-4e37-81b5-2749b0da3934@weidmueller.com>
Date: Wed, 12 Feb 2025 17:29:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 06/30] lib: oe: vendor: add cargo support
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DB9PR08MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7a7ab6-0121-4f0a-5174-08dd4b8266ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cE8vdzlzUTdVMnkvTTc3WHFuYTZxOVBseS9iYlFkT2VLNW5TbTByak42UWw3?=
 =?utf-8?B?dEpnU3htTEUzYytLaDRYdVJNak15c3FPcWxLYTNTU08yNzcrc0N4YWVzQ2ZI?=
 =?utf-8?B?V3c0NE5qaGcreWxNU042VHlYS1h1K3JKSWtmQUNnNEQ5TWFtSDZhM1NvaTgx?=
 =?utf-8?B?L0ZaSjEyT1lleFBYbDFnZlRGYlJQNzRsQXVEdWZsdE9FV0RVVWRzbWViOG4y?=
 =?utf-8?B?L21oY2xxdHh2R3RwUEhZMWtBY1Y5MVV5WVF0VXA5Z1JzUG5QdzVHYzFYWmh2?=
 =?utf-8?B?bFYxWDB2MVcwbjZlUklRRWFtdWRTMDltaXBnYTZPZW9XTnplUFRiZXF3Nkhh?=
 =?utf-8?B?Q2hUYXNXNXM3NEQzaFJmaWRxYTlDenFHcFlBVXVBRWlGYUQ5Njc2OHNuOEZz?=
 =?utf-8?B?Q2g2K1ByQUJ3OHdWaHhBR2d4MThlWjBmY3JWSk5IU0JzNUtlMWs5dFdrOHpN?=
 =?utf-8?B?MG5YaUcyWndqb3FIMDBadkhJbis2bUhDTzJtRG9oc2RLK21vcFB3bFRFVWZD?=
 =?utf-8?B?dkR0WHRFSUZtS3R5UUpab2dUL0tlRUpLKzM0bHF0RXJZb1NhbElnVDhnK0RH?=
 =?utf-8?B?Y3RLOEwxSnp6YXIxMmRxR2FWRUZzT1hvby8wVXluZGxMYitYb1d5b3UxTzJ2?=
 =?utf-8?B?ZEFISS9HM05DaC95eFdIWHpnWVZPQ2EyYTFNem81RWZiUDNycHN4YVhJQ0hG?=
 =?utf-8?B?emQxWXFtTkJqczFsTXlIaHJBWFRPenN4RTFFRyt3Y2t0dlBEbWgrNG9kUGJv?=
 =?utf-8?B?VXppQkFNaWhGQ0dKeGM4QkF1N1ZaSVhkd3FNd1pzT2hZelIxR0gvL05OOWVE?=
 =?utf-8?B?Y2pYeE9adlJaY1Z6RDN1VjEzOStUNUdDZS9NTGl6NFVJK2c3MEdzRmZnVlFT?=
 =?utf-8?B?MERkbjJUTFRSbTBHME5LbFRlOU1RSTJPUlRUTjdNc3Mrb3FrUklWRGw1Mkpx?=
 =?utf-8?B?N0FiamxVUEd5blhPc1ZZRVVKODlqQU9aYTZLL252djdmSm1POGhyTk9Odlov?=
 =?utf-8?B?TWxaWkd4eTcvNjZYaDVlek5kWlVqVmFNWnZYYWhOSWpxUUtQQzRwVnFYR0hQ?=
 =?utf-8?B?QmkvM3UrMTNqT0ZZSEEyYkxTWjRQd1lFV0trYnFsK3ZDRWRGZG82MjM2NG1j?=
 =?utf-8?B?RXp3c0FQVU03SUswS1hQOC84eXppVDYySkJ3dzVVVndjN2NrUWp3V3pxQWxa?=
 =?utf-8?B?MWxUWWhSY25KRzBCd1pMcUFaait6QWUrWklVSzlKaXJuOTVrcmRmcWprN1FE?=
 =?utf-8?B?aC92RWtJVlZxR3RraEhGMjdtek9hU1VHcFh6TjZxZTR3bFpIZXpXcDArWFIy?=
 =?utf-8?B?M2NCYm1CYmNOWFZTakwrN1NkRHdqcFRFbFlBWVhWRlpxYzVtZkxwRXRlWUE2?=
 =?utf-8?B?Uk53UnpOS2tDSE9aV1liYjRhUDg3ZkpkTklBbmN2d3lEMitOMktxOURNeGk5?=
 =?utf-8?B?SE5HZUQ2RCtyNGh3YTVaQ0d3b1VmVGRCRWl6TmpvSTBlKzJIZVM2UU5xWDRL?=
 =?utf-8?B?ZktRemRnd3JPa0dVaE5Nb3VlK1hDZURVbk9qYVpuTUs5dHVIQlFNcC9HRGRO?=
 =?utf-8?B?RWRlWEwvUVpQWWkwUDczRnlSa214TnhqNm5BdDM1KzZBcE16cmF5R0I2Z2I4?=
 =?utf-8?B?Qyt5bnhjK3FtU1pTR1dLMk5SajJUWlRlRlpoQUtMMEloWkxQbzFnYUNwZXZr?=
 =?utf-8?B?MWZpUjJCaFA0WERZTktUMlVReWhMaUZMQ2pOQWh4aFpZVFlqY0F3WVBCNElZ?=
 =?utf-8?Q?eqbj+9nZG77I4vrh2eSnHxUKKnxV1P+jWoRtg54?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sy9qekFKNWNNNHlsY2dwVEZnd2VmMmgyMXhFak5XaG8vS3NUUGdYRi9QQmQw?=
 =?utf-8?B?SVZlZlZtdzZmdy9hdzNmeGFyN0NBc01xQTJZMCtTcEk4Z2xJMzhXYXFtaktL?=
 =?utf-8?B?MzhBTUVvdGJJdWMxclJPcEdmN2NtdGVkTFlOUHM3VVdqeGtwTnBxeWtjeWdP?=
 =?utf-8?B?MlVwc085MXczc0FzVzdMUXh2NmJCSjc1U09rWDRSV04zQzhPOERWWjU5dmFB?=
 =?utf-8?B?MTc5dDVPRFRFcTYwNDBmdTZOSGpIY0txTklvZ3pYb01hdXpwZ21IcE5rZEd1?=
 =?utf-8?B?d2hMeFRoUXVPZjdoRXFRM1lQZ0IxWTF0Nm45VVZTdzdnemhnNGM5NEh4akpQ?=
 =?utf-8?B?dTVieDVoSlphc3o2ZXJhczdqc1JSbUhPSjFJU2hFcU81dFV1ZXd3UVZvbGl1?=
 =?utf-8?B?d1hFSXdkYVBwakdwWkhzdVBuajkvWk9ud29xc2JEOFNYb0ZucW9sbFBmUUYx?=
 =?utf-8?B?NVRxb3Jlb1UrVUJpQ1N6dzlPMnpoQzNId0FaS2RmSWRXYnhCdGJHUzdSSGg4?=
 =?utf-8?B?M3dMYnZ3V0VpUEVwaFh3cFZ5TzZBMHVPbldkS0E1Tlc0ajBNS3d6THVZMmNO?=
 =?utf-8?B?ZFlsOXV0NGJqV2tsWDh2VHNNc2wrTjcwVm1aWDVLakh4R0NhUjZIeG1sTHpi?=
 =?utf-8?B?UWl5bHhnbmVTOXZ2WFRqUW9pZFBQeTBwUU9WUkVONmlCN2VNZEZNaVhjaFBQ?=
 =?utf-8?B?enJjK0xWM3JXSWlxZkU4OHBrQytjcWZ3eGdUeWRZanJKTTJwM21IcFByRTlE?=
 =?utf-8?B?Si9kMmlDS2JmU3M1Rll1M3dtaVpYYlJjSUFxcWNOSUpRbVVDU3V5NklBRE1x?=
 =?utf-8?B?ZXZ6REExbGJyYXd5SmVCbkJVUjFuUVJXTjU1SzNraU83Z1l3WnVDbENLb1By?=
 =?utf-8?B?YUZIN2daSGhmcVpENHhhUHdPNWlCL3JJWUc2YlNQRCtWbXRnOHVsT0ozek00?=
 =?utf-8?B?UEhlOVpDcHZ5bmdCTGJJU1NuOFpRbVlZNDQxcjVySVVmUFVxeGJHS0dabVdX?=
 =?utf-8?B?K0V5MU5yUUxhcjgxZjExeWRZQmI2WWt2TjVUYUZLRzN6TU1xcWcxTm5ZQkxD?=
 =?utf-8?B?Y3VwNDkzZDg2OUZIZlA2SUwwQS9WQnZEb3ZFMVBPMDN3NXVlK01HV0piZGRB?=
 =?utf-8?B?NmMxaEZYaWU4VFBjYURHQmVpMmhGYnovYndPcHZ0WC95bk5BdDdOZTJCcEJE?=
 =?utf-8?B?S0YvS1d0Y0UwRXE5b3NKTDVET3dGTUQwcUNpSWt4cjBwM2FKenJFQ1Z5T0o0?=
 =?utf-8?B?UlNtU3phY0tzd1RHVWFvMVlCb1ptWWRFRWdzVGQzTm9kMzM3eDdQK1NnQ1d3?=
 =?utf-8?B?aDFwRU02dUEwU0RMRFcyNTBleVpVNmZETktrNEhlVmdydGF4QURlV1BtdkFh?=
 =?utf-8?B?ZG5RUGJxbU1JS3YwNzA2S3JLVXltWDRYQ0ltd1MxcHNpeUgrOGNKcW9uY3JI?=
 =?utf-8?B?R0Vnd0RxLzVBc01ySDhMOWxnK3RCU3dqY2VZaGk4NHk0RTUrYlIzbkRndW5s?=
 =?utf-8?B?RUxSQ2d0ejRBWVNheU1LcTduS1JxekdmMGdsMFU1N0thajBBd24vNzNncmFN?=
 =?utf-8?B?czBSME1MVnBwRnBJRTNWeU9zQ3dJU1MrYzB5eE5GWUNNUDVRL25hQStodThE?=
 =?utf-8?B?cTU4ZEovTUpIakg4Sys0WTI3SlVQMnBsNW9YVFdDZ3RMcUxEZTRRMjNlMWdj?=
 =?utf-8?B?MXUwVkd3QTh3RnFkNWJoM0U2VVMzUjExWWpzUVplbHJza015ZmVYYXB4QWh5?=
 =?utf-8?B?QlZYam1KZG1tRUJ1VU0xc015L3UxbWw0cjc4TmNpK01Ia1VFWDNQL2lSNTU2?=
 =?utf-8?B?R2JMakpnS0dNemVpWFMzSDNDYUZSa3pqamFIN0FzeXYzWkRlSzdxVWF3bkM3?=
 =?utf-8?B?citkRVdINFAxaWkrdXlHV3AwUGM4Y0xzYmVSZzh6MXMxbVorbFg4NTU1dGVD?=
 =?utf-8?B?amR0UFVmODhWVE01TEZxR2lYQlpOeHN3a3Z5SzloWDVIMm8rbjFjN0VGZ3V2?=
 =?utf-8?B?ZUorcXcxRHBnUmg1TWJkaXlvNG5GaXNURWl1V29aWm84Vzk0WnFxQklydmpU?=
 =?utf-8?B?T2N4cCtoTHNBU0Vjck5Wbi84Z2tRdFhmelZ4Q1FUcm9rNENpODQxbENTNnBx?=
 =?utf-8?B?Rkt2ZU4rRWkrVkQ5TXYvNXAwcWdHSVVnTkkrTmlQSHJReDdGS3gwRUYxRnZt?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7a7ab6-0121-4f0a-5174-08dd4b8266ae
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:29:19.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB1q6kZGx1HrMACfv7Y+fuKXhv7pfVOEX99vHsbC1HzIU5vANRTJ/Dv1hRKUv44547BYgAufhepk42E8ZjTnMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211261

--------------ZzdQxL5KIJ4QIh0X9STo0CLv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 13:45 schrieb Frédéric Martinsons:
>
> On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org> wrote:
>
>     From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
>     Add a vendor module for cargo to resolve dependencies and populate
>     vendor directories from a Cargo.lock file.
>
>
>
> Hello,
>
> Have you looked at vendor subcommand of cargo : 
> https://doc.rust-lang.org/cargo/commands/cargo-vendor.html ?
> I didn't read the series but the commit message makes me think that 
> "cargo vendor" already exists for resolving dependencies
> and populating a vendor directory.
>
The class uses the bitbake fetcher (wget / git) to create a vendor 
directory and emulate the cargo vendor command.


--------------ZzdQxL5KIJ4QIh0X9STo0CLv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 13:45 schrieb Frédéric
      Martinsons:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Tue, 11 Feb 2025 at
            16:01, Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" moz-do-not-send="true">lists.openembedded.org</a>
            &lt;stefan.herbrechtsmeier-oss=<a href="mailto:weidmueller.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">weidmueller.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
            Stefan Herbrechtsmeier &lt;<a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<br>
            <br>
            Add a vendor module for cargo to resolve dependencies and
            populate<br>
            vendor directories from a Cargo.lock file.<br>
            <br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Hello,&nbsp;</div>
          <div><br>
          </div>
          <div>Have you looked at vendor subcommand of cargo :&nbsp;<a href="https://doc.rust-lang.org/cargo/commands/cargo-vendor.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://doc.rust-lang.org/cargo/commands/cargo-vendor.html</a>
            ?</div>
          <div>I didn't read the series but the commit message makes me
            think that &quot;cargo vendor&quot; already exists for resolving
            dependencies</div>
          <div>and populating a vendor directory.<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The class uses the bitbake fetcher (wget / git) to create a
      vendor directory and emulate the cargo vendor command.<br>
      <br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------ZzdQxL5KIJ4QIh0X9STo0CLv--

