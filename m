Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2674C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:23:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.113])
 by mx.groups.io with SMTP id smtpd.web11.206043.1724055810439239844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=M8/5kP4U;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG4cAWOtE81t54JAJY0SCTWEPTzcStlz7IcDULWjBbdIfkXmu3kDXNC4Px3mgIpROagf3Iz0LFThOo1MzGJNY1tH2vxCLFg7NAguc2Y9baQEy3Bu1AQHehlOHi91V2qOSlBnhRz+w1POq1/MTaPD2TbMY2BQ5fGc1Zi0IncJZM2yU+UkkmcWi1uLgriHRcyQAy7GHz0/dUYZf9345NRn/NUIA9ez9Dq6hzXYz2xYTDWGGgd6v5qI64kdkJehO8t6jfxgKE3Z13UCvt91EyebI4YkC0GKww8w7mKOb3DzW5FNDCrxLQlh6OhJ1y27E8QQURzSAoi0AFyPjcmO3X1XbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2SzNwIPRAMRCnRHBI2MorPhYjNmcPpBgiX9TE3onDA=;
 b=c12nUjHvL2Xsv78qG1RNYjcsZGNVSIZcToLsGUGYCIQ65VdKCPfGf9+LQ2P+AAstqE/zp7z5PdqFxgK3bY1lNrzcc5pqYH5KGxCEgo4SKqpOKfTBRO3SSOml4RtcdXnsViKpfFgAEBWQSxsMKiDUO91dgj1JLPnzVrAIQSdVgCebUNhSBZcV08t2v+bpZnB41UbGEsi6symUmj7EJGQLbXPBYO9nZH6IbtY5TAF/fZgbfeA5OseufAuu9QSk4qH+fTgNeXix4Li4c+o4ogE/YwzRx1k6Q+VnLewF/Gm23Q4B+NdJ1E+V95Az90WOiWiIObHVEjzuLEhIPKLPaUQA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2SzNwIPRAMRCnRHBI2MorPhYjNmcPpBgiX9TE3onDA=;
 b=M8/5kP4UdIW9/2TNz54voebAaDxbZXmcM4iJDkeljYjbgfC0oWAtRtJMujvdf/Mz7q7JjDVtyqpIpveK7PZrz5A+jcp6prftj0JexMx6iFc6/a+i8QDeu4U26q7w6g7KkjvOP7RUzRDpye9tmtKvlsRF5AYLSNI0AaNgqNi+bZoQXguQ9bNNcHohJ8WSmJgt/OaAbatrJSJmucs8YMSPrNi+62WvarmhvXI9r7fQb7vpFRMN3XrIpTBsvrzylMmgeBDiCA/xmxbdzvedJwZTP8A/CPZb9j5V2LMCzn2TPGAq6KGvYf0ljnyKKHckGF8yqaFoM8AKmVTFq44lKBKEZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7249.eurprd06.prod.outlook.com (2603:10a6:20b:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:23:27 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:23:27 +0000
Message-ID: <7945c00f-a795-487b-80bb-0f963339068e@vaisala.com>
Date: Mon, 19 Aug 2024 11:23:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] util-linux: Add 'no-libmount-mountfd'
 PACKAGECONFIG option
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240816140422.1665537-1-niko.mauno@vaisala.com>
 <CANNYZj8v_jOZ73FkfyL9kaE7RcfT6wOqO4Vz1jDNeeie3mZLwg@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj8v_jOZ73FkfyL9kaE7RcfT6wOqO4Vz1jDNeeie3mZLwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: fe867204-40f4-4b4e-806f-08dcc028337e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmtmUk5Td0NhN1NvNzkxVHFrTHVCYUl5OS9URmtpVkQwVWFIVUZYSEtjN1dW?=
 =?utf-8?B?Qmc2SGc0WkZkU3B3WmpKUXIyVytyNjZCN1N5bkNMWkw5TEFNU2tJOTBCREhh?=
 =?utf-8?B?RThVN08za0g4WTBlUk1meEd4SWdoT3kvK0JNVVZRUXFOMEdmMUt2L3lxTWM0?=
 =?utf-8?B?Z1huZ0t5T01jK2NpU1VIN1JDK2x6WXdnYzdpT052OGZNKytRdFh1eS92RytO?=
 =?utf-8?B?QkFoQTU5Q3hQZFY3ejFTNjRoMGpobkFINGhTekJtUFV0N3BIOHdFOVVMTFpG?=
 =?utf-8?B?Um84bE8rcHhiMWRtSCtEUytnZjdGc2k1a1Qrdzd6NnhLcDl2N2wvN1hUUVBE?=
 =?utf-8?B?QUJMQXpmSU43Z1puUjMzaE1OTTJmcEJCWWFja1dOUzdKQlBHa0xBSk5sM2hz?=
 =?utf-8?B?L1Y0YVRtSWs4b010a1VjTnpXbFhjK1h2ZXB4Z1JkSTNtZDVpSldYU3F1cm4v?=
 =?utf-8?B?d3FqU05pSDZYUk5oeHcxVEk1TGJHTk5RQWlpWHdWM05sdWZoTmIxNUZLOVJr?=
 =?utf-8?B?dVhSK1AveTlXUU1mYktNc1dVRDl3dkxreDJKSTZnTkx5K1VkaEZQSmZ3RE1J?=
 =?utf-8?B?TGlPaldGaGZ1czNjR1paNlJmMGtaRFExbTI5Mk8wRnlwc2crb2RhOG9CQVZ2?=
 =?utf-8?B?c0Jicy9EclVkS1pSRUNBdmpxRjBaOHdmT0h6VURXRVl6b3ZPdmNwaUgrT1Vk?=
 =?utf-8?B?YUpBYnhrWHlSV2JtRGxWNkVKdkpZRERaQU9CcnhsM2hkQWVzUmRhY0ZQYWdW?=
 =?utf-8?B?ZDdPc0MzTXBsWGxqUS81aE11b3hiZlFCeFpBWmg0WUxnZ21tNnBKd3hMUkJi?=
 =?utf-8?B?RmRLaFlyRG9BeUlmSytLV1k4WVJ2amx4TnplRXdscUxTemR1ck94QzNpeE9X?=
 =?utf-8?B?MkcxQWdScVArT3RDUGFIU29HazhWWk9QQWduSmI1TTUwQU5qelBWNGhqd25q?=
 =?utf-8?B?b0NCcWp3bUhkcy83alorczBKQ3VKcXBNRnRxeTBxQnc5aUliMzI1bnk5cTZ2?=
 =?utf-8?B?NXgwaUhCVVU3RWMzb2xsR2VFTjM2VE1ObXpIeVExWlNtVklYekU3ZHRlbFl4?=
 =?utf-8?B?a2JBUndVOVZtb0tvN1RqVWErN1FRVHR4TzJPdXQ5MzE2eXZaRWZhU1UzRTJt?=
 =?utf-8?B?N2QxU3V6ZFdjNzZCdDdwalhXL2JsOTBhVnVzcjExTzNRaDUrRlA5eThKenFB?=
 =?utf-8?B?Q0dQNklzVzlZTnlrM1FMNUd6TEZZUVl5M3ZRYnpTelBKR29LdDY5NEUrcVpP?=
 =?utf-8?B?OTltNmx3RnJ1MGxjZUI5cC9WR0E2T28yVEhBaVJsb21kbUMyTlQ5U2FSWVh2?=
 =?utf-8?B?ZnFkemg5Y2xlS0hyQXF6ZlM2bUNvUkJ5R2VBQUloYmMrL25LaURCbWl4M0du?=
 =?utf-8?B?WWNZYjNlUE9KNmlPUmo2bGVkZFBaS1lPMThqTFkwNmVibzI1NTY4cGFJWlZZ?=
 =?utf-8?B?YVdmK0kvSy9JRkxyTWk0QlBaTGJkV2QwV0Q0c0M1YmpITkxYY3A5cUpVREhM?=
 =?utf-8?B?ZHI4M3Rqb2RLbnA2bnMzVi9jZjJFdWdtT296akU1NTFORU4yU3VZdkZkODZo?=
 =?utf-8?B?VHVnOEJrU2RIcENKcTZIK01OY0cyWjA5T3NsQkJEQWhhTURoNmlZY0VDRjBj?=
 =?utf-8?B?SDlTUlliZzdvbDhzWnJoVXlHcy8zWnMzN0JvZ2lqOUZNN1pWcU5DVUVlbUF6?=
 =?utf-8?B?OFB0dEJUUFBrNjk0SnFXcittTm4wSTRjWEZPOCtwM2c3TXZLSWIvNTJpbnNy?=
 =?utf-8?B?eDFCR3VIVm1BSjZZdS9Wdkt3U1E2OWRUcS9ySTc1enFkdzVoUzZGVXV0R1Yv?=
 =?utf-8?B?cTJFeUhHM2NPRnIzYUVmdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzdROTN3TGtqRElZbmxQK2ZjNWFDV29KbC9QM3hnNUZqNzUyNThUQ205enIv?=
 =?utf-8?B?TXpVUjlYUWd0TU8wdXgrSzYzYVFGWjd6a3Z5VWMrMWJ4RFlHNDcwdXQyenpY?=
 =?utf-8?B?NDczMFkxUU5vODlrc1pObklINkF1VlZvUmUzSi95YlRnb2hLbHBGM2ZjbUNT?=
 =?utf-8?B?ZUVRaGhZamdoRTRUSktvSElmWHE0c2JTaFJuZmlQODUxODc2dnRVeTBOTldr?=
 =?utf-8?B?ekYxbGtJZjZIblJzay9Uak05ckN2U2xLRlFaQXI1b0VRbllrV3YvT1NiUWh2?=
 =?utf-8?B?ejV3Sm5IMGVDdFN0VlBwTzZvbGZha2hSMS9HU1I2SnVQUmFtY0szQmlYaXRw?=
 =?utf-8?B?QkRpbEJOZEh3RjhTYXhISWQyVGdWcnFHbHZmUEpVeGYxVHh6c1JEbE5heGo4?=
 =?utf-8?B?c3ZFV1h2UkNBU05ERk9lYTlGYS9zcTZ6UlcwdEltbUh0bEpCWUlJUy9HeFUr?=
 =?utf-8?B?NnUrMlBEUy80N1FibG5DdW50RjdVRWQybmQvdDBJaUZFNWcvaXNtdC9Fbkxa?=
 =?utf-8?B?Y1hEQ3RRNEJicWtNZ3Vma2R0L1pIbzZEcW1kMTJrZHJ5QzIxYkVKWG8vanNR?=
 =?utf-8?B?dkttYi9zTFp3eEY5NmxEZXFmQzlwZXo1eHpiVWl4NnJXNTVpNzVFRmxERE1T?=
 =?utf-8?B?c1NzZEF3NUNRRTdvT255VXlnMnlIMTZNQTZzWTZLenY3Rk9WRG1FQVIxMkRo?=
 =?utf-8?B?YStkbk1lajRDUXZMMEw0QnEyWmVNUkttWUdiVk03cU5IcmM0d2FrZU11SElG?=
 =?utf-8?B?WGo5UkR0L3Z3T0h3MjU1aXlZd2M0Qi9aRFNrZFdFaElGeE1BS1JHSXg1bzBp?=
 =?utf-8?B?dUkxWTdmL3FvWmRFRXEyaUZ3dERBelZYc2N2ZXA4OUlXSUFEcGVzVnYxNWIx?=
 =?utf-8?B?d01lZnFsRzNMZnQveFJiMkdFV2I1d2VnVzA5aEZjbUhkb01wSWpnS0EvRUFV?=
 =?utf-8?B?WFMyZjhtWkNlOWhWZkV1bjJ3K1lORlNrdTU2bDZ6dzVlWGkvQUVlYkhtdFNv?=
 =?utf-8?B?NzVMOHhvVDU5bGhLNU5kRWk2cVNZRzR2TzVyc1lOSThmbnR2eHppb09jclBT?=
 =?utf-8?B?T0M4VHBObWw4bTFUWnVnUmlHd1lWeHpYcm5YcEQ3MUpISC9UL216aElJUjlO?=
 =?utf-8?B?aUU4RW0wbUM1RXBJcFBjeUJGTkZaRG9Eb3I5aTh2enYxQ3B2UU5TUFVEa2xh?=
 =?utf-8?B?N1FvdzdnRWtUenJCYU56SmV1MzhGdWZqd0x1ZU9RZnlhWXZBVU5mQ3VNMlZs?=
 =?utf-8?B?Z2hpNkNQQzA1b2kyUGloQkJaZUVNamdzZlY5T25nMlV4NVo1VVpkSU0rdlVV?=
 =?utf-8?B?QVJxTDhwZUYzSHZnWm5Qc1A1aTFBVDRCQkZEZXliUGkrZWdmTE9MOG1TV3dk?=
 =?utf-8?B?V0ZJMTlCYnlaMXhzMk5qV1hscUVMRmRnb05SalhzMnBSbVdzRzhnMXdRMWRl?=
 =?utf-8?B?cy9JTnp5VUhiTmFOTDAxVTBzMTNwVWRaeUsrR3VMNUFkalhPbE1WWlpRcHg4?=
 =?utf-8?B?eTNOYXZjek9XQm9CcU5JRWZIbTNyTWpuNzh4UjE3bVpiUUFncUNPVVd0Y0JW?=
 =?utf-8?B?S2ZSSFBFdmJxQzVJKytDVjhTVUxzeklmMGRzb1lJamdTbkFNSmxkNzdlUDhB?=
 =?utf-8?B?cVcwSFR3eklqV1JzeUxWUGZYbmdwMiswanl3d3ZuSFQ3d05pbW8rZlRtalBY?=
 =?utf-8?B?UEthbkNsVjc0U01kR2R1LzVJYUpNM05ObTIxZjRNNUlGMXlJTzYySThwUGY3?=
 =?utf-8?B?bThKTW1qZmo3S1A5N1AxMFNoL3N6bmVMSGhxaUpDeWd0dFlMWnROQklGaXRP?=
 =?utf-8?B?VGFRcVUwV2xkMmlXV3M5elM4aS9GNEJUYi9oUW9Lb2R0UkxqMURuOTBoVi9I?=
 =?utf-8?B?b1VGQk1ZR0szTUgvVkRxaXZTcUtkZlA4TmQrdGRoa0l0c3hpajJ5aWU5Wk9G?=
 =?utf-8?B?dFF0Q0twSzhITmpnUmF3QTFEMFhBenVPMG5QSjlzOXFLRkIvZHV6UFdqSENS?=
 =?utf-8?B?WWRkaVRCYmdjSGZMM2N4S3dyV0J2Qm5NY3hNSURVZE5Wb1lOaDc1bXpZSmFu?=
 =?utf-8?B?aXYrZFB0aUJCcGp1OTZKSEZPNnlaV2dqaXk1QThPU3Vua1NzZ3lCVmFFc3Ez?=
 =?utf-8?B?ZjBpeGhBcGlSZHZadFlNbm1LdVRJL3I2RkN0L0dUY1l3UTY4ZFk5NXB1TmVp?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe867204-40f4-4b4e-806f-08dcc028337e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:23:27.5854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUKB+17BR8xmqGBeNVjaO83jXzjRgyaxwI/+xbs8chIma4gd3wxzqVP6dmcsqekPATEphF8fFxxNQWa/4yaSWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203487

On 16.8.2024 17.24, Alexander Kanavin wrote:
> On Fri, 16 Aug 2024 at 16:04, Niko Mauno via lists.openembedded.org
> <niko.mauno=vaisala.com@lists.openembedded.org> wrote:
> 
>> Taking the above findings into consideration, add a new PACKAGECONFIG
>> option which allows to conveniently opt-out from prematurely using a
>> feature which can cause issues with a bit older kernels.
>> +PACKAGECONFIG[no-libmount-mountfd] = "--disable-libmount-mountfd-support"
> 
> The option's definition should include both enabling and disabling
> options so that the resulting component configuration is deterministic
> (e.g. not left to autodetection by upstream) both when it's enabled
> and when it is not. It also helps to add a comment just above
> explaining that only the newer kernels have the required API, and
> ideally also mention which is the minimum required kernel version.

Thanks, submitted v2 which addresses aforementioned aspects, and also 
now defaults to disabling the new mount API by default.
-Niko

