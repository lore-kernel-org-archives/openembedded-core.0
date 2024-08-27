Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67554C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:32:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.10])
 by mx.groups.io with SMTP id smtpd.web10.76159.1724758331671768501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jYZVU+ZW;
 spf=pass (domain: cherry.de, ip: 52.101.67.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO4dYrm17v14zwqSw5K5REgqqVtngchhVoj4rMNfuUa9J5snnczHbXh+jXBha01cXa+12sFsBa+56seXcFn7LxPJUY7LduqkJB4rz2v5A0SP5i/uRELsw7LCMU6EknoyNMr7o1Ea6k5caNLtguy5j+muH3l4lYaC7LikqPr5FUnJVn4KbtL/SK9k8gpahPv4+rardAU3fcACC9gZwaX7ZD89zoR6TcV/YJ1puKH+aBvL5OEo4LZ6bZzhKL1+b4BGzmrbRf6V0qZvOMJVO447tXwQqu07seUKT7YtPYRBni3Th4Hy7HdcleQtMBMBhF4dplOkiKzxDkXcKyUfClV20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IPg2yIe4o1wYENQYy9EZw1iwgUaIyawawCLoMmXsRY=;
 b=u5k4pVDQRKyjDBRDusIuxmDRaUJOxSPF5QEtlGh6lh4RgdL93NDGi5wp6U+R6pP+4tC+jlDjd/mosv/8DvGUiwQiOt7E0eQ5SpOJZaYeW5ZlAnzRpCb3t/lp2NYNmUDAPZY+ZsquBpHgPTReyFyJ7Cke6WRTUZrCiJx7HSAKY5Oa3MU8WSYXMU0Iyixyt1B54nl2iTu83yCf+sz+F3C9GrZxU7tL1w7LbzOydQW+sn9dul6i8vcQ0mPqg2o7rEu1n2rD7GX36YhYjTnHOimCOpFRhxu9Nlch0vC5smIhCRuJ/l2wtwRAKylsRJz2/MkCb/J4Z+2HVmOJ1TOVFMjfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IPg2yIe4o1wYENQYy9EZw1iwgUaIyawawCLoMmXsRY=;
 b=jYZVU+ZWPzB6gf5FwOYMy0ALlKKzAh9ISe41jWC6Z+ItsbZeGQfmuyzyT9KeMOAqo8DSIUU5ee8v8XQkDCY89878/21mL4Ctxc0G6zbxuSJnXy+JEf2jYcUnhSRYsHV1oyq2Z8hxYaW6OEkfd4GU6pSO2VCn/UwQfnjdevIzgIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by AM9PR04MB8486.eurprd04.prod.outlook.com (2603:10a6:20b:419::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:32:07 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 11:32:07 +0000
Message-ID: <e30c7d94-0e6d-4e82-8ff0-511cd3526387@cherry.de>
Date: Tue, 27 Aug 2024 13:32:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH v2] linux-firmware: add a package for
 ath12k firmware
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240827100343.127172-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240827100343.127172-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::20) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|AM9PR04MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ec89b8-6d5f-46fc-8d70-08dcc68be101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHA2U2huVnpnSk5zMVhwSzRLdzd2aWoyQzEyWEsxR2xLUWk1WStVUCtiTVF6?=
 =?utf-8?B?M2hoMnJ0OUVwV21HRVlBLzloTml4M0RjM1ZPQ2tPTS9KQWt5OEhOK2tvd3V3?=
 =?utf-8?B?d0J3TExhSmpOcEpnOGZaSkpaQTl2MXVXT1RYeWtPckVPa1M3MkRHZTlyUUJy?=
 =?utf-8?B?MUlyWGNtbWkwU0xRelJQcTlMYWxXMmJSMDk3bFRDTDJmaEVMcWE0OE9yMnZY?=
 =?utf-8?B?MEkyWnJaVkV3Z1I4dDUzSlNUUXFkWUNrK2dwK2Y1MXk4b0lkYlUwbjgzbnBY?=
 =?utf-8?B?UmpLVUZjTEQ1S0NUMWVZdllpSWhMVU9tLy9UMzljcDlSUzZhZzlDV3BXeDNm?=
 =?utf-8?B?VlpiTWJoMmhCa00rRlliL3N3cGIwU29kOWRybDZSdHlZN2FiVzFpQXJySUZt?=
 =?utf-8?B?MDBtUk5pZ0JnMTVVOEN3WEZ5Z1h3cytmcVB3WHJuREZtbHhZVk5HYi83aHhM?=
 =?utf-8?B?dmhiZlNzTmltRkgybjFuOEp6eXVRT29hWEZGVXR0Y0wydnFMLzJZV3ZmQlAy?=
 =?utf-8?B?WHNrYmJYZHVIQTQvSGZtNHpwUHg2cUVvYVRjMXBFMm40Ull6ZFY1YUJLaC9t?=
 =?utf-8?B?QVF0NkJLcU5mRFZ2LytuWnVSclBpdVI5SHgxUWhOcE9LWEhLamVqaWl5dCti?=
 =?utf-8?B?K3YzWGlLM0VNZ2dsRzdaTWFiVDB2V1lQczh2QUtaYjd4VS9GdW9qY3B0aGN3?=
 =?utf-8?B?dXBxOGU3QUNFc083eDdabUJ3SzdJdEd1Y2VFRlNLQVcrbURhd3Q1NUVtWFl5?=
 =?utf-8?B?UVh0S0J3Vkl3aElGTkdnS0FpVUc3Rys2cS9lZ2tVVHFnY3ZXeTFOKzhsSjFN?=
 =?utf-8?B?ZXVHcFQ0cGdzUVEyUGdUa0REeVdRbUlCSmp1dDcrU08rbUwrL0srTnp2OFdN?=
 =?utf-8?B?VU5zV05QQm9LZFhmOUY3WSs2THpRWmdxdWIrL0hUaDF5R1BOV3d0V0pKVEdP?=
 =?utf-8?B?a3RTQkNGNTlXSlV1NnBhVFpiSi9rZ3hEeUdLekpER1E1L0dPcDJ1c3VlUWNa?=
 =?utf-8?B?QW85RjBNMkpvRHNha3pMK3VwNTNJUlpsdGJIRmdVOUJIVzdyczJ2bkthS3hk?=
 =?utf-8?B?MFg2WVdJMWdBelNibmxJenltelJ2WW4wSEYxTlVsNGZHTFVTSjRTSG9CRXA0?=
 =?utf-8?B?N1E1ZzF4RE1yQk5nTzNLQVVnUStKMDJ1eHJaREdvVUtnKytIcjFjR2ZmZG40?=
 =?utf-8?B?eU5VSGpoZ3NrbnhIR0hZYXNNREdNTldjUXo3WGh2MWNZMXU2R3BSZ21EWHlu?=
 =?utf-8?B?NGRLZlk2VzhFdURIYVc4TnpYejZIbU4xN08vZDB5cWRoV1dyeHdyVUhFeXhw?=
 =?utf-8?B?TzhjRm5yMHZCSHhKV0swQytDL2FHQUR1UkVWT2xaNjJSeXo3K0dxRnlpLyta?=
 =?utf-8?B?aEtCc2sxbXFNZ1gyNzR0Y3BZeHZtMHVHUzY2OGY5dTFDR1VFSDdZSklydTdt?=
 =?utf-8?B?eGQ5cXZtMEpXRWo3b2FpUXJDMFk0STByUFhuQUpoS2V4WHN6YkRJUURpSmxy?=
 =?utf-8?B?K21ranc5cTNaa29xWjhGL28wTGJUMTBWUGpEYW9rN1pzbXhuU2tnMjVSbkZ1?=
 =?utf-8?B?Mmc1UE4rNUlCVkFXcmdlYmhTS3crTFpNeEpRTmI5YjBhY3poS1RLemtJM2FT?=
 =?utf-8?B?R2kzWXZ1KzNpQWJUUHM0NThiNUNSa05sUnM2RjArSWh4OWhQNXJ3a3o4aFhS?=
 =?utf-8?B?WndWUithbC90T21INlc2WUdSbUNnVjFaWmxHczM2eWhqWEZaOEhlK0ZSbWJI?=
 =?utf-8?B?NWY3RERwekcwNGthSkxTK1R3ZzcrRld2TjFVZVk2b1RDQ0NNMnEwenB5YVIx?=
 =?utf-8?B?U3FkK0IvcGpzVHZyZHpLZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3MzTmlvNXAySnNDZkNpNXY0d2pZZkx3YnBtQ25qSGJ3WFJvdjg2MmQzcUtG?=
 =?utf-8?B?N3VsdngwekV5LzdkSFRRV1UxSU9sSGNycVVTRDdwSWZTOFA4dnE3d3gvNEtu?=
 =?utf-8?B?V08vYUQ0SWgzcW4ycnJPQXZNejRyTW9IZVJPWldYV0xEb0hoUGZVRzdRNmpk?=
 =?utf-8?B?NE11Ry9uVE9TRGt0K1JscHFtdEhGQ1I4TmF4ZDBtNVNYU0hCaHRvU1J5SzBV?=
 =?utf-8?B?bTBJcUtZVVNMTXhJcmRRdHF1ZHFoUDIxaG42cWJ2eVZxZzc3WVVCZXVkdE9T?=
 =?utf-8?B?aU5uWjNxRXhJSFpVc05WVmpadjZGR1pjUG0vN09rRy90T1d6QUg5ZjVVbGpZ?=
 =?utf-8?B?ZEJhZWlDM0w0SEh1NnZsZHZwelVheXF2V1BuVklaVGFnZGNJRjRmRFFsVFFO?=
 =?utf-8?B?bkU1K1RRUDNDNFp4SDJ0L0dxN1YxZ1IwYnplc2QrOHRLcXVIajVMS2NXNmpy?=
 =?utf-8?B?alE5WnhCem41Sm5KdmtNUXZEUC9kZGRUeTZGcGtBUkVkMXNodTR6M3RCTjVU?=
 =?utf-8?B?Y2ZWSkh5ekFMUWdsdjU4cm41dXVXNndVYTlQTm12TEJORlNMMXNaUUNJbkVr?=
 =?utf-8?B?a0QvUy9reSs1MnRRRm1tY0p6T295Z08rTFc0c0h4WDYvNDBacmhUbDFUa0Vo?=
 =?utf-8?B?MExOYUlJejY4cHZ6M3FqSzczOWRPeTVRakNEZjBxdXJudlRaVUtiTGorMXVY?=
 =?utf-8?B?d2M4d0lXbzM1eW9hREVmTGVveFJWKzRpN3F4a21QbmoydWhNaW9lL1JFYW4r?=
 =?utf-8?B?a2dTZ1d6OEgwelQ5UUZGVEZqS0hzUkVYVGxQY2drWlU1S0pyM1c2SGJzQnJ1?=
 =?utf-8?B?WklhUzNlODR1ajZKZnQvMnlFKzlsVGluS3lYbXBMNXp1dStsZVdybTFSYlFL?=
 =?utf-8?B?SHF3eDhtYjFyR0h4YnB3UGl1UXQ5dmVLbDJPbE1PUi8xUTNCNTJvTmthbEk2?=
 =?utf-8?B?aVVCMXQxTDZ0M2NsVEErVUlxOHlhZ3ZVZnBkYk1BOGJKRjZiYWc3bnJ2RCtz?=
 =?utf-8?B?NElXamE2YWJiRmM0MUxQVGVCaFp2MkxuVEdVQXRnNXdtSkllRFdQQm5YM1Ru?=
 =?utf-8?B?RDFLUUZ3YS83RGo3aFpiUHJGRmNzTXN6MUpscjc2eEJHcEpsS1pOc25rclIv?=
 =?utf-8?B?U2FsTkdRMFZGRHZMd0lsZWM5WXRHVUN1TzREVnhNemtrYWl2ejRaR3BmbTRY?=
 =?utf-8?B?bWt4d1docW5jWE83ODB0eDcxSkVHMktsWXNOdVI0Rzd6dmlMQXZvelRUUk9G?=
 =?utf-8?B?YmN0MzJiYjU1dkd1SXZRWUdKaEEvNTVWcmNpN0Vob2FyYS9jUk0xT2Q3dTY1?=
 =?utf-8?B?UEhqZmNpNjVCZTd4dkl3ci9MNGkzQUVjQko1ZGZDc3V3NEwxeWF3TVZnZjNk?=
 =?utf-8?B?dzVaTmJpVm5CbjBmd3FIODZHNEY5c24vLzJnNlNyNnNCMldLZUpYVFlETnY2?=
 =?utf-8?B?Mkxoc3BMZ2xCZGQ4Uko0RzhBYlUvN1NndEI5VlBhRkJTdHRkdE5vTy9pQnRa?=
 =?utf-8?B?N1ExNjZjUGs0WjdwT2JRZzVaMjBMMHI5UFBNc3pjQ0xYUWRGRFhOYitXZlc4?=
 =?utf-8?B?WnZtR2JzanRxOTRrZ3lESE9ueS9KeHRrQnp5S2RpZUdqK3Jhd2M5cVpvS1Yw?=
 =?utf-8?B?WHd2NzZnWFVCckVlL1Q0cU5qOEZCdzlvRDlidHBNU1dCVjVxNmlVMUN6QTFV?=
 =?utf-8?B?MHhYTDdaek9GTzYrRGpwRnV3OEE2WmxRSWNlaUJ5WFlkVHJVWHBIYlZVaktQ?=
 =?utf-8?B?MWs4N0lZUWRnbVRkbEtEbjl6MjFsK2tITzZVMWNXbldpbXZSYjJPSDkzQ0FO?=
 =?utf-8?B?bWtERXNXd3VDWjBEVm90dU0xRDNueU1oN0VSemlIU1piZGFHd25yUXczc09T?=
 =?utf-8?B?bHRFSUcxc2RQcTRnOHNybWRQKzdXZnJvKzVGK1BGazJHNHU0c28yRm1DdHM0?=
 =?utf-8?B?Vng5Y3lSTE56R1BKZ3FiSHJGVzdOclhEdytYbkdQcDFWK0tqY01ha3o5MzAy?=
 =?utf-8?B?OGN1dnlGZzVGd0M3akdVODFQVGtWK0ZCV2NTSzMxakVFV2p4Nmc5QUFEVGZ5?=
 =?utf-8?B?NDNXVU0zTlRZb09WM1hSS3F6Z0JNYWpwdTlPWnlGVmsySG9zbkZwa2kyR2VR?=
 =?utf-8?B?b255Qm0rbWExTlhPNkN4Sk1aMnRMTXRObmlVR2R0ckd4T2cxY3Zhb0w3ajVa?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ec89b8-6d5f-46fc-8d70-08dcc68be101
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:32:07.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJoh7bsgCRBJyFgKt7b8Ei3UKngHn8jwzwjguVw0Ue1efYYc17dtBTQXxgARmFcmCvRiE+QYzh+QXUSVCF00k4/OGuDbX8JDLUglvU9Fd1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8486
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203831

Hi Dmitry,

On 8/27/24 12:03 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the firmware package for the ATH12K module.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> [DB: added rdepends from PN to PN-ath12k]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>   - Added PN-ath12k to RDEPENDS:PN as not to break users expecting ath12k
>     from linux-firmware (Quentin Schulz)
> 

Was it really part of the linux-firmware package? I hadn't checked 
myself, it was an assumption.

Cheers,
Quentin

