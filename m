Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD00C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:50:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.31])
 by mx.groups.io with SMTP id smtpd.web11.75909.1724759442112724811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KPCANb1X;
 spf=pass (domain: cherry.de, ip: 52.101.66.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF+qEiKh9DDJNaf6AQx6uIwboywHBaIa3kqYahlApZAJOcYLKgVzNixv8+J7x67OdD0nWNnmU7Efuxi1Yc6FDI6j4jlSL4yWRmIkOoCTxq+rmc33Ta0lun3ov99Gt2wJn6i3MyYnwai01IClkUlFn0k0q6AZprJkwPOBDFBKaGbAB8MkXlniqCu/VP3aC+mz/LaFaDd+U2bdBEkyxP18gRsT5bzqI92RRp21gdVxAXLOOKX2YPxRQ6UWSyVp0wMnpcGmd/Jz6FbLnjO9TB+jr2DF++In18fPZOWVQrHrZHTLiqWr2n3K2kQUXZ2xeDBJlpmsJyTgpXAkktHGIiECoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssSkcPSbsCe+gMEkFQtzZWSkOzzA/0bh/MLROghh6HE=;
 b=HFkadChrFonyso5lDTK3IqlZaOi9ACf9SHf22BiSz5Wj075OwX2QiRYHPsxhCtP1+9oj5i/ixoe3VBjTI2VDlLwPDz4AZnM7+ui2hqlb2bkpGJIUEcjIWN/1XjsS2VJMocNPoGNEh1A3wqyGPdhUcq5em/VcxPaRCK9bXcgFksHGKfbyF4XPTpLxGDQ73tfYJl2rQwFZFB8MKYxkDlYvy8Sz3wuDKFRvhb1AW+EMHj3uUWRZbPSYCghH63gcAu1m5y71p0QQw+eu8Ovzo6uIlgeVigOJnRPOdWUKnanbCvxk/cbdwxbF+4/yPdY3mR310Y1g7TBXs0dV8yLIIWbYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssSkcPSbsCe+gMEkFQtzZWSkOzzA/0bh/MLROghh6HE=;
 b=KPCANb1XQfeyKjkszhAuI7/ijgDB7byLdhFk0pcsT2ygipXTKvzHaEh1kFeJeivwWEdVItbF6GxziuVVz0/OyUrKVtkwYO0Iqtr5HKW/7k/kDJL/SMbKu2FnL/IMrzqga1JZjCnrDhMQv+eillEQyCuo57wXY+AZQqGW+TVmB08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by PA1PR04MB11033.eurprd04.prod.outlook.com (2603:10a6:102:484::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 11:50:32 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 11:50:32 +0000
Message-ID: <a1f39ba7-0aa3-4ba2-b847-a11d420b60be@cherry.de>
Date: Tue, 27 Aug 2024 13:50:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
 <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de>
 <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::14) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|PA1PR04MB11033:EE_
X-MS-Office365-Filtering-Correlation-Id: 93732102-9b48-4184-ba53-08dcc68e7469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TldoLzhKajBRQUVKdEJQdHRrKzRMdm1xT0s0Mk16T2FRemRNNXdES1J6TSs3?=
 =?utf-8?B?R2ZBaldGdmg1WkdGQ3UyWVJBODJlZ0o4N0VjZXZpVGM2NnhmbzVnZFh3QzlH?=
 =?utf-8?B?aTFCdXE4d3BjcnpQWVpLSEE0YUcvdlhkTVIzRW5VSjRSZWEvR3JzbHd3Qndt?=
 =?utf-8?B?RUdmQ3pINzI4UHFTdXpmbHljQ0JBMzNPNkw3TjFmOHEyOThGV2hjalJTb1hn?=
 =?utf-8?B?cndCcVBRZjJRVVgzclI3UkxCNDdxRjh3REZ3ZEJrOWdPbDFyUFdrSVNVWFhr?=
 =?utf-8?B?Szg4Nnhib0dmSnJBUFRVMkgwZ0lnWmwza2dpU1hCemNxOFh4UkxocnVrSjFm?=
 =?utf-8?B?VEtWYjhTNGF1YjFGQjJwem5sRFJCTmI2MEdES0ZxNnp0TEdxSUl3QnpHa25V?=
 =?utf-8?B?aEU3bDJjVXZ5bHhPaWxIdm5ocGRCd0w5WDFRbGFLV2VNSHZnODBuOWlHSU1q?=
 =?utf-8?B?aS9EUlRHNHg1TnBuVVdIcFJmSVpZN0N5Z0JnOUl1WUs3ejR2N29UNXArQ3hW?=
 =?utf-8?B?Z0dLelI4RlFPK3U4dzVoTE9pWG1tRzZzK0U3Y2FIdlRhQkFLOG5ibGw2Z25p?=
 =?utf-8?B?TXhHWWU0RUFOVWt4MDAzcTltc3JnZFRUOENkb2FkSE8raHRYNHJwcEhETU01?=
 =?utf-8?B?bG9UOWFidDRPL2ljSmNpcGRKNmczZnE1VU12bG95dTJrdkFBdWVMQ3NGcmZm?=
 =?utf-8?B?UEVGN3pLTFNHWFhpUi9peWw5N0kwRlQ2QkFTUkVONEdRQTcxb1BJTk5hR1Rq?=
 =?utf-8?B?NUhUS2tDSDUzUXVrNnA5V0RkTHQwVllPSlF4ck5ZYnFyNlF6SXJ1REQ0L2Nn?=
 =?utf-8?B?czhrK1FlSlpuUDVVc3Y3bzlQSEhkdEpUSzE2ZFlUbTNkekRRamlyR0J0SlNQ?=
 =?utf-8?B?alBQRXF5VzU2WWY0Z1hLeUc1cktjVFZ0UkFBRDhjV1B1NGtUSFFNdlF3OXlO?=
 =?utf-8?B?cW1udFkwNnRjMDU3RS9LVit2NVZTZFJjMklTRXY2WjNWYWVkRnJEQXV0ckpt?=
 =?utf-8?B?YU5SaEl0R2l3YXVrOWZyb05aM1NiS041bnNFeW1laEpiRkp5TTl6bjlWYkQ0?=
 =?utf-8?B?SXNWcHVSdk92Z0RXMWdpNGc0M2JCQVdpL2Z2WjlPTjRhT05LWlVuRXEwUEJ6?=
 =?utf-8?B?RGZOVjRieEdxLzhkYXZyZ1g2SEozZlZEUm9UY09IZlFhTUdtRGpXaWlSUWwr?=
 =?utf-8?B?c3I4am04VC95SlptNFI5RVpGd0hPblptb0ZGOGpWeXhBZUFFYXcydDlyWVd3?=
 =?utf-8?B?S3dnMXp1UTRBMWdPdEczVjM1WW5qQ1BDTU9peFNtUW9pSTc4VzVBUkthdXA2?=
 =?utf-8?B?dEpaVGFqeGFxYlU2UFZVS0Y2ajFqbCtRdXdOVXkxa3ZNajF6aFJHbmoyTWNX?=
 =?utf-8?B?cUtSWTIzbWc4eHdNbVNRcW1aaHh3UFQxWjBBeDBWT2wzNG8vOFFqNkhuNFNS?=
 =?utf-8?B?cmh5a2M5L3dhSGhCaUllbFJ3RVk5OEJNeHBwMDRsMmZsc1dhSHRRbWtlcERG?=
 =?utf-8?B?RXhJdTd3TEMxaHQ0ZmxOeFQxalFRcmRjMEVOMCt0ZnMyMzZDNnUyWWpYYzA1?=
 =?utf-8?B?WDhYRGJ4d0lOT2hJV2EyWmliYlRyRVU3aGh5TmlWRVRvVCtMY2lzK0hld1JX?=
 =?utf-8?B?UDFyQXBDdDdLNXE0djk2aVF1SE8rZUJWTW9ic2Z5bTVmcmlNM3BtOTBwcnhv?=
 =?utf-8?B?NUJ0dlZuZUhycmkrRkQ2NlBCZ3hXL1N6bVk4Y203RGljZEx1VXlmNmg2R21H?=
 =?utf-8?B?UDUraWhOb2gySVlSTXV6NkhzTnU5QUo3djczMDNRNG4wSUMzWHVUUm5hdmhL?=
 =?utf-8?Q?MeyeRH0cCUF/VEvWGIKgSswdvGxrGm7KpXnPE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cSs4VEVOOVdYNTEwVVE3ZHZKMk9HeWNBMVQwa1RTWkNwOFU0ekcrb3k0VzBn?=
 =?utf-8?B?SGZxUERvZ0xkOC8ramp4OGJTM2xUbnI2a05SUTBIM21rb1p1Sk9USW9BNlUr?=
 =?utf-8?B?SENHRytpODkreXdJZlU5cDlTNjlpUzVIbXNHOFpBMjdudWVjUnhpZ0FwZWsv?=
 =?utf-8?B?RHUrSUE1VFhFQko5OXQwV3FaUUM5QitDcDdyOHpDNnQvWVM2WmtzNEZSSHNZ?=
 =?utf-8?B?U21IUEs3c1JGcWpTNlBCS3ZzTE9ZKzRrL2YzdTBLRzdmcUNFVUQ3MXBpTGxC?=
 =?utf-8?B?QmljYnlMQ0RyaXFZcDVXV2w0bmJnWWJYeSsrU1JNbStISnZZRU1Ibzc4SjA0?=
 =?utf-8?B?eno5djZqUGF2MkxJVEVEc1g3dFJVYTBNdkZ0M1AxSEZrMDRHaXVKck5yZTNa?=
 =?utf-8?B?b1M2S0RwcXhScHMwK2gvcTZLelFuNFZxMlZsWUh5NysrNTVrOTFJK3JqcWUx?=
 =?utf-8?B?YWYxR0RUZmdLdFN2Z1VVYnVQWjFQY1hHNW01VVFYWDJ5Qmg1dXllUEJrS0tJ?=
 =?utf-8?B?ZHgwcFRQOElCQThvR01GQ0E5NVZEVEZETWNRdi85Mzg0Ri9UQ05kMkJnVm1a?=
 =?utf-8?B?UnBVaFR2c2pyNkZKRzJEMFlGaHVjOUpyK0sySmluZHlraUphQjR0U3RHQkxC?=
 =?utf-8?B?RmxTUTFjdytVVWg3dXVkQUFucUFlT2dlTFg0dlhTUldmUVVhaTBTdEdWOFc0?=
 =?utf-8?B?c1o4eUt2cGFEN000K0JLMHB5UE9vR205Mnk1ZUlUSFVWZ2cwQ05mTVhGczFR?=
 =?utf-8?B?RDhtTlB4TENMQVRmVlpaRVBiR0Y4MUtWZGtPV1VQYnBrVk1PaWhGLytIZytD?=
 =?utf-8?B?ejgvaXIrNWE3YjJIQmEwMEx0N0R3TUYrOER2c0tCdXZ5ajQzS2pyVFZUd3dt?=
 =?utf-8?B?SktTMG1FT0JnRExwc2k2K2NGMkI2bmM1N0VtQ2FkY0lqTHlsR29WdFpCNjZG?=
 =?utf-8?B?TUZMaDAxTkdMZzJNdXBtLzFGUlR1Tm4vOXFjS01IMkdIUTFnSk0xTW51dlJn?=
 =?utf-8?B?czhUNko5bVZwaE41eVpwREdWa0QwZmExcUdLYkxTcHRvdi9lLzA2R2hDakxM?=
 =?utf-8?B?RTVrLzlDK3lhRXVCWm5pNm9DZkdYMlI0UGprcjArbTFHcGkvRW5jOUZqR0th?=
 =?utf-8?B?NVI1OU42QmoyMWFQcEtZWTZyQVNtbnZkK2U2bFQyOUdqelhDMTl4YldoVXBD?=
 =?utf-8?B?Y1VEaGg1T2VQVExubXhWTUIrVW5zYW9PM3gydE01MGlyQ2o5d3k0SUttOEZs?=
 =?utf-8?B?L1BQZFZmOXN2ZG02MC83cFJmNGwyMmNQSUdEbG80SkdTQ05oZTRuQmpucnJ2?=
 =?utf-8?B?RVRVbVVZaVBUcytlZnJFOTlZNGF6cm1kY0xJR3Rsa2ZwNkEzQjZ4RmdJSDJT?=
 =?utf-8?B?M2lrY2UrekwyRWZrbEpQMVpycXVDTWc1dDUwcDJTZ2hzWXlOSEkvUDJ4aWhN?=
 =?utf-8?B?cDRWR1YyMEZYQndvbVpON2FUc1FTd2YyUEw3ZnZjRXJCVTRvVmlZb1M4cmJR?=
 =?utf-8?B?TG13TWZrbE5JR1U2VWtmYkFFQWdVS0pZNDRyNDVnSEJiVEFGSSswR2lINjB5?=
 =?utf-8?B?bDZhN3FqQ3ppL2Z3a2lBNHRnb1kyUTVORHlpdzJhSGlleEZkc2pUUVJzcW1x?=
 =?utf-8?B?RFJsVFJLZUhlRkhWV244WFllRjBhMGlQdHVOUmNjbU1ITXJPSm14VWkycXdt?=
 =?utf-8?B?Vm1TMDBWa0RNU0FJUWV3cnVLZFNMTkhSRmFSWVdFL1YzeXZwZ2VxQTNUcVIx?=
 =?utf-8?B?cVR1NjFMUDNhdndOdCtvaTRCRjlmdmhCZVZyc09Hc0hRTDJLZzdlSkR3T2NR?=
 =?utf-8?B?U3l5bU1NSUFPMmtvbHZTVTQrRjIwY1NTL1dZK01JSDlvMG9WdnJzODNLQ3Bh?=
 =?utf-8?B?ZDVyLzZXL2VjaXVHUnFQNjU0Zm82SGI0VXhOMFVWQjBIbU4xNlBJMDlNTTNS?=
 =?utf-8?B?OWI0NTFTcEI3dGs1dGlWOGQ3UXFnWWUyRkZhTVpSVUhFMVBnZGpuUElEL3RU?=
 =?utf-8?B?SFhwWjNvMGFVcEsrejBWeGN6VlkvSHdLSHRGbjgreGpqQjloYnc1cW1GR3VG?=
 =?utf-8?B?MGxkMWo4blBuQmJ5N2VvQVlHcW1rZW1vMkwrME5JRHNrOWh4c3ZwM1VidzVR?=
 =?utf-8?B?ZmxXa2ZQNkIxb24xYkJHVUhYS2VJbkU4MjJoZ3NYVk1uWjRQS25mNTVFY2x0?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93732102-9b48-4184-ba53-08dcc68e7469
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:50:32.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwuA1plJs6sRiOUZaaUWEmjS/9Fo/ibv9SDDp2/oXMvk8THVExkav2JjlDi0Dnz0RWMp9pQJl2d9ySQgdgBsqrQuWmhYmkfLlCbIZ0Ia9vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203835

Hi Dmitry,

On 8/27/24 1:35 PM, Dmitry Baryshkov wrote:
> Hi Quentin,
> 
> Excuse me, I missed your review before sending v2.
> 
> On Tue, 27 Aug 2024 at 13:25, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Dmitry,
>>
>> On 8/27/24 12:09 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
>>> Release 20240811 has restructured the locations of Qualcomm VPU
>>> firmware. Follow those changes and implement a single
>>> linux-firmware-qcom-vpu package holding all VPU firmware files. Use
>>> RPROVIDES to provide previously defined names.
>>>
>>
>> It'd be nice to hint at the commits in linux-firmware that do this reorg
>> for reference?
> 
> Ack
> 
>>
>> It's also not necessarily required to merge those together as we could
>> probably still have two different packages to avoid bringing in files we
>> don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU
>> 2.0 ?).
> 
> First of all, the original naming seems to be incorrect as
> demonstrated by the new file names:
> 
>   qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
>   qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
> qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
> 
> It is possible to split one file per package and let users pick up
> packages one by one, but granted that the whole size of the directory
> (4 different firmware files) is 4.3 MiB, it doesn't seem to make sense
> to me.
> 

4.3MiB is quite a lot if you want to be able to have a tiny filesystem :)

Ok so, if this 
(https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=36db650dae038be945fb04def591fc726255b09f) 
is the commit doing the change, we have an issue. We also need to 
maintain backward compatibility, not between different versions of 
Yocto/OE but between different versions of the kernel (I assume to be 
the reason of the need for backward compatibility).

See that they mention in the commit log that they provide 
backwards-compatible links, we need those as well. Otherwise we may 
broke older kernels we were compatible with in the past.

I did something similar to that in a previous update, c.f. 
cdcfdc1dc545fe381764795ed502a3fa0a48b87a in poky.

I would suggest the following:
- keep the packages split
- add the new file in qcom/vpu for each package
- keep the venus.mbn path (which is now a symlink)

Basically matching what I did for qcom-{qcm2290,qrb4210}-wifi?

Cheers,
Quentin

