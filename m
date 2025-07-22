Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9060AC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 09:21:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.50])
 by mx.groups.io with SMTP id smtpd.web10.8128.1753176056241620583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 02:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NrZZRzu0;
 spf=pass (domain: cherry.de, ip: 40.107.159.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FC3MJ4PCfVLjlLciVZrdy0WD8gMIWTWxlkmYPsCajgHktVNa2j83r0wzKTuIoTLxB/XsZJ/p5xBai9FaurHQFzTa64hLyv2LNcaZiRAPFM8PtJ8vD5WFHxr9qxRku0nwVyszQJdZDXYTjl4AW/2YbOhqBABJIwKHucnxxeL01c2NteonIpgMGlBIuf9MiBhQLWkV3ClX5EEsSglCeLc8/MWVnHaH3CQRC8srJFNCXf7H3EEQPOhnlHOBd7WJmj83DCYIWg1k8rhscoKrw6OwLgKGNSgI1E/7zW3JWyP21vYY8dsJBSwZA+rIMCGVCUt25WwQDRWTGdxTYFyAQEmAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmXQxw/N+ccKTsQZhw0Mgd/j+rci8XJXNZeVQHmahMk=;
 b=EmbIOQhhqx8LeFwQIUhNz6CeOec8qLo1niO7bCOT9OQABFedR9xXrz3jyJNA2ABD3to6pk1RftoP7mf5hb0FrrJJw/S7oVAJhuo2RGkRwN4DuUg5Mzf1BKfkxd17rFrEsalsRg7YSH9cEFiqW/h6LP5yGM3J+poLAHosrpZdnfzClhTxNgEn3zJAUsZMm1gnnVzKJATNnErXFq30U9BEORes+k8JePl8mh0CgXV0oU6vDRk0NDfn59KspcEwDavWlxdZkSxWY/5QmFR8El9ps20aq/FgAwmUbQOwtFWvrEAGsUVq61gQzT3Vjx17lIRQwvGeDlzNiqsL4sT+58ovXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmXQxw/N+ccKTsQZhw0Mgd/j+rci8XJXNZeVQHmahMk=;
 b=NrZZRzu0XW9kHwkOTtDuJstRkBr1R7NyOSqt1h3RnxDCjk101eSt0RFRTjczjZkUr/XLa/jbHm3YuwjKPldMwr5ve6DYos2F9QbQZpOWYwA9O4IvET7Ei1n3OSNUq00dDq0+423tGkv4ZeWF4+eOhPTczx6tFxNmyFJK2ZMKzmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10876.eurprd04.prod.outlook.com (2603:10a6:150:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 09:20:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 09:20:49 +0000
Message-ID: <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
Date: Tue, 22 Jul 2025 11:20:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk
 <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
 <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10876:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ed7e2d-08e5-41d2-1443-08ddc9010c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGtjYzFuNUJtUlhtQXYyMjJVb0tOMWxWMXpxaGtTa2EyeWxab0xIdjVGanY3?=
 =?utf-8?B?NnBFbm8rSDlCKzc5ZFpZbjB5bkxqUjcwemp1RFZmbE53SGJzWjlESzhYZnVo?=
 =?utf-8?B?cjZMMmkxUHJ4R3V1RDFwOEs0K1BOd3NvMDVQYVFsSmtMNjFpTXJJdHNwNEt1?=
 =?utf-8?B?UFp0UmJBU0NUMGUrbVlnMmxJR0FXYnp6YVhyL1dsTFNYdXkxSHVoMGR4aThy?=
 =?utf-8?B?S0NXblVxVWxmYzF3MlIxdjF3Vk93Tm42N2JQbGhzQVQ3dXMxQW1VRWExczZo?=
 =?utf-8?B?a3d0WkY3ZlliZzBaWUVtU1ZudS9pc0puM1h5bFJFeUtoZEdSYTFlSXdVS0hY?=
 =?utf-8?B?V2xnRm5WME83bmVYMG9kdmdMYmNaK0QvTGhxbGxuNFcrOHd4K0UyMlFOZ21P?=
 =?utf-8?B?YzVFdkpCczFGT3AxSEV5VGtQSzcvQVNlbThVUGREMEZ0clNQd0tqOS9TK0Nw?=
 =?utf-8?B?Nm1HT2E2aUZFQlNLc3M3L1dscmUzWXpSMFc1QUZZSCtpTTdrUjRsdnBEVkFN?=
 =?utf-8?B?S0MzL0lKNXhrcTF1VU5Sa0pQQ1NRZXlZMm9Rek5wTEVmTlpyQTltNWpqc0F3?=
 =?utf-8?B?QTNmWEt0QVAwbzdkeXFidXJ5MDRVMmtybkt4Wm9nckxBbjJVQXlKZlF1WU1S?=
 =?utf-8?B?WjdGd3NaRC9GSE5rS202c0JKdlcxcWdkR3NNTExIeDZFYnBZTkJUUll4WG5k?=
 =?utf-8?B?dmNGZGo4WUJ3VmVRU2F2bjM3ZFEwUVd6TUVzTVpjNitUV3l0WGxuTUhGcEdl?=
 =?utf-8?B?R1d3a29na1htNkd2V1krRzBJRm9GQXhFMExVWkFpOFhyd1YrdGJGdUhqTlJR?=
 =?utf-8?B?NnZCWUVybmVnTlRsSkp5a1FjTlY2aGQxdVVwVy9keFZyVDluQWt5UjRNWldX?=
 =?utf-8?B?K2NUK1Vnd2V5K0p2VXVmQUlFMVdncEsrK2tHNVhaVllTcEtpajU1MTJwZ3p2?=
 =?utf-8?B?M2xWQkpob0NDTUJrRy83OFhHYXJndmZuU0VwSk9sSlFONklPSFg1RUhYUCs2?=
 =?utf-8?B?dk5KbGdhamtpd25iTVk4WE11OVBFWkRvbDFSREd1SWpNS0l3YklaazRHaFFT?=
 =?utf-8?B?WjZtZFpSK3htYTRjdy9vU21GMmZVb3ZwWi90dHRsT0xKU0VhcnF2S3l0T3ho?=
 =?utf-8?B?ajYxMm15U1dLeG1LbGtGVkczWjlyaDJPUHlWUzlqQmtQNlRNNGFuMVY3bEFj?=
 =?utf-8?B?YUg3UUVvV29yRlY0eFVzUmhXMVIzb0NzblZPcnNuQ041UGI2eG9HaXlvRGxv?=
 =?utf-8?B?OEY1cC9tRVpXY3Bjbk9UbGxoREM1WjRYVDdJa1paNDJ5UWpWRHVRTG4xa3Bx?=
 =?utf-8?B?NmtySVlUeUtYM0ZlVVJtamhGWDIzNHlXSUNIOElFZzdzd0JsNDhCdEF3T1Jl?=
 =?utf-8?B?OW1xQVlCcVZ4QzlRL09iU2FsNE9ITkNhRVpHTzBDQlJreWhGQWU0L0ErM2hU?=
 =?utf-8?B?b2RndVpqRUxqRExsaDVGYS9vMVVWMi9NTWJVVmlLeXVCM29CVFFZYm12WWJ5?=
 =?utf-8?B?OWI5dEZlUHBOVk1salJxS0lVL01JOXRuVjk2QVVNcTB5UXVIc0FtMTA5M2xS?=
 =?utf-8?B?YzkvaVU3ekZkam51SC9JMVcrZVdHTTZtNnRNWHFnTURveisyRVpMT3AyZXpa?=
 =?utf-8?B?K3c0ZUZMR3JTa01ERHROL0tnNE5zREFkbGRBODI5Y3AxYkdjODRsdjBYTkxB?=
 =?utf-8?B?c1RrbThQRmxwUnNPbjg5UTdIRUFkak55b0hwRE9Cd2RDSHdUbjVjSnkyL0V0?=
 =?utf-8?B?SGxrRWhSc2NUY3orTmlHdTRLNjlIL3psTDJBbXZuRDZzOVNERFA0OFRtZ25K?=
 =?utf-8?B?UW5xMDZ4bTNTVVZZK3ArUG1EZEMzMExxZjRTUG9KV2xRY25xM3gzUlhFaVZQ?=
 =?utf-8?B?cC9IZis2OTdXd2srZXVYS3pFRnJSRCtUTzNSa1hWSko3RVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXNqQm1sc3hwcUtJRGRQUUNVSFdMWkY5S0RLSHAwVURYMmQ2R1NKdmQxVTlQ?=
 =?utf-8?B?T0F6R05HcHh0eC9NVDFpUkVnSTdNWHhjb0JMZEZLZ3I3RDVhUTNEbzEyVjha?=
 =?utf-8?B?WDB3b0svRWVLQWw0em5KSUJPdmcxbkphcm9SS2o0QzJKRDRrT2tWT09pN2NL?=
 =?utf-8?B?K2x2Q3FGbW5PZVgvQ2R4V1BKaXVUOWsvV0o4ekloQXNneTM3ek4rbUo0NXQv?=
 =?utf-8?B?MS9LN2xMUW5uK0FrcHFDQVJjV1Q0cGNBYmEyQ3VVK3BvVXFETTBueUtXMFpU?=
 =?utf-8?B?NEpzdmlub0t1T0dwMHoydWFDQnhZY2ZXcitMWE9MeDB2ZklVWFMwQWNCZXFa?=
 =?utf-8?B?RmNhbHJ5enhNejRJR0RvQk5BdVJJanQzRmpqdUdYUGJkVGJFSm01cFlTcmg3?=
 =?utf-8?B?NDhtYjFiOG9VQ0crZ3o0SVh3c0tLcEVRQ0g4QnNJRVNDOFpadFI3OW00WWtF?=
 =?utf-8?B?aXFSWUlrbzY0eGRqd2VhZmh3UitTandJY3d5cy9QbFlXUHFyT3RtMlNvR3J5?=
 =?utf-8?B?RGJNSmIxQ2VyU09vQTd0aTJGb2pZZ3VkTk1BQ21pcjJBZ1AvNzArRm9mV3dU?=
 =?utf-8?B?Y2RQOWlYU2xQVEtGbmNHRGxTSHRBQWZwMmFGWXpSaStVV25ZNEc0TklxSmVh?=
 =?utf-8?B?WHVRcTU2b3hvaHd0cGJId2wxZGRMNjRtVSt3d21JRWpZNVc4TkFsM0wybGZZ?=
 =?utf-8?B?TGVwYjNibndFdVJORmJJWXhuQTR2bWo4RytXdk5NRUtnT09TbFFROHJyV0VK?=
 =?utf-8?B?Z3RIa1BHQVJrVUJTOEhhZW9ucVFuZmFlR2t2a2trNE1EenAzSWlkckNuKzNU?=
 =?utf-8?B?aFRUYTJwL1BOVUh6TGJDSEd5Y0xtd0lJb0ZYRUQzSjBTWFRmd1hPaFBiSFJ2?=
 =?utf-8?B?TktuZFdBK3UxZnhDcDI0clZvM1hvSDIrYUI1eEpkS1NVcDhaQ2ZlRVZEM3RU?=
 =?utf-8?B?cGEwOU11N0txeUhTVnRUb1p5R0tSWHkycVpTeGl3OG9ObjdoVEVCOWJvc3Vx?=
 =?utf-8?B?L2xXeWlrK014YWw0MHpHQnBEVkN1bitNczFQNmdHK2hKalQ4ZThxVHpGc0dq?=
 =?utf-8?B?U1lVNzd1dWNIU0Q1UWVRN2FRV2xtMFkwWjgwVitLTjZxWmVGdEd4MmhLV3Mx?=
 =?utf-8?B?cWZ2WTk5WEptV24yS1g1QlBQOTQ5UWJtcmREQUZJOWpWZnJyWmtDNTlHSmNj?=
 =?utf-8?B?YTJzeUttQUdCUmI4WVhIVEwzRE5kcWpzWmF2dGVSWUpraURjckhSWkNoQVNy?=
 =?utf-8?B?VEFqMHBIQnRlRXBMNHAwelhjK0ljWDhiK2gwRmJQenZ1WHAxaklrbnhuUUZT?=
 =?utf-8?B?S3FOdE5IUFBCeWp1Q29ZMUt6TkNpRithdStGa211OVdPbkZic3c0emxUWGp6?=
 =?utf-8?B?c2pFZG92TnRHcFhoV3VxeXlya2o3YjUyN1hrQ2JMWnh5YWFxWHBaMGVBeHFN?=
 =?utf-8?B?ZzNTdDJLaWdiemNnVmprSTVYUms0QjQ5S3E2dUJMNzhXV0RyeXZlSm5iYi9V?=
 =?utf-8?B?NmYyYVZmUGJVaVduci9jMXBOTWZNeC9ZSGhMd00zSVhieGhyeXZQS21jZ1F0?=
 =?utf-8?B?UkpNbjIrMHZRNHpJSzUwMERsZk1DeURUTlBiUDVvVDcxZS9YQXRCSnMvb2lJ?=
 =?utf-8?B?UEFmeWlNN0Q5bmZJMG8wTUdCQkVUbUVoUDI4Y2NxM1lmQW9Wc0VXdHY1aU93?=
 =?utf-8?B?d29sMUdITTcvZ2RQTVJMWmxNdFFnOWRWZjMrNGJaTEhLQU1iTTZSMGFnaUFD?=
 =?utf-8?B?TXhvMHJXdmVJZ1FJQW5vdTBzaXhsTllScDc2Z0hySFNzRXY2NUNZeVlEbHIy?=
 =?utf-8?B?cGw4TUxZcXdOUWV5YWMzOTdERUpFalBYWC9OUWlNZE4wUjlkS2RDQUZWTkwz?=
 =?utf-8?B?RlFHWHhEV29EVjJmZURZaTVCZWp0bUphRlYzb3BTdmFGc3Voa0VqUG5nWmpI?=
 =?utf-8?B?RG1mbU5id1VnOHQ0RkE5a0JIYUE5ZU9VNjRHMmVPU0dLUUxxY1JEWExvY09y?=
 =?utf-8?B?MC80dGpjbHozTEtBNkNFMVZjVmlqQWQwdDc5K05YenJwK0RZejh6b2Jscm1J?=
 =?utf-8?B?RU9pNW5TVTVjVkxNRjhIU29ZZ01OeGdnQkExOGx0UzJDcFVvQjVTbC9HRzNE?=
 =?utf-8?B?WGlRSlBqNEhScS9mOTlGcGpJWG5lT1BDdEFHejF2Tkd6Ui9vNUxCNXVvVGor?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ed7e2d-08e5-41d2-1443-08ddc9010c72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 09:20:49.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAMQg+eGdUXI30BdMztDHkcrPjjbVYjYDysUYOlpQntXfznKxlvt1onQNFWldoRBfcRV7UkyiNAbePBeyDmArf+nThOeC47LwDYEJ8n5Pjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 09:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220730

Hi Dmitry,

On 7/22/25 8:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 21, 2025 at 12:33:38PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> We're planning on reusing mesa.inc for a new mesa-tools-native recipe
>> which will require much less in terms of PACKAGECONFIG than the actual
>> mesa recipes.
>>
>> It also doesn't make a lot of sense to have a default PACKAGECONFIG in
>> an include file inherited by multiple recipes (here mesa and mesa-gl)
>> which is highlighted by the useless PACKAGECONFIG ??= that is in mesa-gl
>> since it was entirely replaced by the one from mesa.inc (hence why it's
>> removed in this commit).
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   meta/recipes-graphics/mesa/mesa-gl.bb | 14 ++++++++++++--
>>   meta/recipes-graphics/mesa/mesa.bb    | 12 ++++++++++++
>>   meta/recipes-graphics/mesa/mesa.inc   | 13 -------------
>>   3 files changed, 24 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
>> index e2f03c81c4588c6257ffec2892fef7fcbe9f82bf..8418f13bbc8aa84c6591eb8b46e1fa96d7aad9b6 100644
>> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
>> @@ -8,7 +8,17 @@ S = "${UNPACKDIR}/mesa-${PV}"
>>   
>>   TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
>>   
>> -# At least one DRI rendering engine is required to build mesa.
>> -PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> +PACKAGECONFIG = " \
>> +	gallium \
>> +	video-codecs \
>> +	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
>> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
> 
> Please omit EGL and GLES here. If I remember correctly, the whole point
> of the mesa-gl was to provide GL library in case there are
> vendor-provided GLES libraries.
> 

This seems to be hinted at by commit 015cb13a67c6 ("mesa-gl: add GL-only 
Mesa recipe") (poky).

@Ross do you have anything to add here maybe?

> But the fact than nobody complained raises a question: do we actually
> need the mesa-gl package?
> 

It actually would be just fine as I imagine most users would be using 
target mesa-gl which only has opengl and not the other ones (see the 
class-target OVERRIDES below). I'm not sure there would be a lot of 
people using mesa-gl-native anyway?

So maybe we do need mesa-gl target recipe still?

@Ross would you be aware of such users today? Maybe some ARM-based SoC's 
using some ancient (or yet unsupported) Mali only supported with 
libmali, or some Imagination GPU or whatever else? No clue what would 
make one use mesa-gl to be honest.

Cheers,
Quentin

