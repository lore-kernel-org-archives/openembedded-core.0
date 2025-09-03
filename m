Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABFBCA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:39:29 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.web10.6234.1756881559669986760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=VUZTZff0;
 spf=pass (domain: axis.com, ip: 52.101.72.10, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwXhnNHOBbg0oDrLJ2TRZNHYR9tz0D19YvzeDXxSOutuWFxKvuKDQWid8kDiWe3p8zd8zcpEx6Givq0pr/0rSseH2WcmeunO7mCPa6UwYhFSLTvDcml5KP3pBnqoGhIGmyNcGBEoZ8P8/Q7IbzWrU8tdwo0rxyVOA/cs1Ggf9l/EvGyEfHvwH+ziFdf3SPoabfcEyuh7xMJTIBdETULXPskDf7Vmhk2nYZS9KzH/4ESm674pFCTXUVjJ50eUbRcSQZSvTjb85uu8GHsnS+dqUBnuv5NZsjIGePJA1TDFbcOQ1vgmPbE4EcF0hX60oE1oaY2zXlPV5+tjtOYoGx4Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2qe+EzqZS7pWdTCXSxBpqJMs1wK94WI+16ThCWHQgM=;
 b=k9MGi26bZMxQcRYdWTLOGX7xkTakscksh2GzXtoiSWPXAv04s49L55QuINcNoI0VuqBr6YO4ckipVFo8Eroi3uSuPY0y55U6XvooHD5lf+kFnLkFK8AclovrJDYhmD4Y+t1QjSLXIi5/DUbF1uZqcqiZcUeNlp5zSa5GXqZPVsOb28N8RIU8IC/G7N4dseOdYqrP2Iwj/JClrXo7ZwWtcQeJq3iHzHvuVlXaRG+CBOTrsJvIu7hQNoNFU7AfGGcp85/xT4UtqDVZDZxZuj0uQKWSPMuDXDJ47413NHt+HagQIJEMi8vxGbUAzvcL+0gxTzKZaG2HDdcjICCrvVoe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2qe+EzqZS7pWdTCXSxBpqJMs1wK94WI+16ThCWHQgM=;
 b=VUZTZff0LZHNM2XyYFnAuwpTR7NiNmbjPoNTnAJ4+NUvXvWOlKeSXsLUROdQ194BV2uz4B/nE+8F5zWEuftB+w/0udpQX0hxG01PvCY/nRsi+dziZdCOTIz3tsbll2ercqEZSaeiRVe/cpcWx1ln91KJEVigCP3QWPEL/hwb1vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by VI6PPF4FD20C3C8.eurprd02.prod.outlook.com (2603:10a6:808:1::30b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:39:14 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%3]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 06:39:13 +0000
Message-ID: <ddd29bec-10a7-4640-8d55-12a9a2e2bc9b@axis.com>
Date: Wed, 3 Sep 2025 08:39:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/4] influxdb: Update module cache content
To: openembedded-core@lists.openembedded.org
References: <1861B1DCDC3430F2.8194@lists.openembedded.org>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <1861B1DCDC3430F2.8194@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::31) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|VI6PPF4FD20C3C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 72193033-0bfd-45ad-f74a-08ddeab498d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SlVYaXBnNEZ6ZUJwNTRMb2dPOE9NTWNxMzlmS2RJMWQvOUN2N3Nia3F0bDc1?=
 =?utf-8?B?ZE15eCtJQVd2UEt2cmFVcUh2a0ZRNjlaMmthb29Rc3RTRUFlRC9xb1RCL0Uv?=
 =?utf-8?B?YzJRZkROdS8xWkxGay9xY0R5Rlg0aVYxNjFkZ3dhenhJTXRPSk94NXRPTU0v?=
 =?utf-8?B?ZWZsZkJUNTVuTWZuaHdyc1llVWYwcThVaWVPVGJmZmtubnBOSkxTa3FGaGxa?=
 =?utf-8?B?MkxicE5RcGZ0eUNTMWFpeWJsWVFDVXp6VWJmOC9qNEJKS1RjaXpRcWdRcXpz?=
 =?utf-8?B?VnJnbU95cUExMHd6Qk9OKzJqdG0vdDJzMjdQSWE2U3REM05qK1JaZ3RHRmo1?=
 =?utf-8?B?YzJ6OVVWRXRDWXlUQTRwanhtQUFpVVVacDVEcjBQOTJzUEpzTTZTbjFGeWVS?=
 =?utf-8?B?S245b0VISzhCei9tdVhYZkljUENGUGJyOEVNbDlhYStuekF2VEY2SEVxMUs1?=
 =?utf-8?B?MXE3dFlhQ292ZlZGb3RRSVVrN1J3Y1J1MlJJbFppWURXYnl4Z1M5c2FtS3Qv?=
 =?utf-8?B?VTZkSDI1eUlhQjYwcHVzSjRGVUM0ZVc4VmZORUFSMGxMUFdhcjRSN2orbEc4?=
 =?utf-8?B?RXg0RURxZHBXak1nbk5rZUxFNzJweEhlcWcrTzRFUzU0MGhoMWk0TENzVmRJ?=
 =?utf-8?B?c0N0T2xzMUU0ekQ3UFk3c3lMQ0hCbVdSOTg2akZ5ZXhUL09wWTV1bXBRbEtB?=
 =?utf-8?B?aG1oK2pQaCtmVk9YMjVuNTFreGhYaEtvUnhsVjN1QVptQlZEZ2tMWGJVeGpC?=
 =?utf-8?B?KzczNDBHc0dBYVFDQW9yajMwZk4wVmc5MmNrcVo1RHJna3JHTVRIR2FXUHZB?=
 =?utf-8?B?UzVDc2IrWDFJWlhOOE1SNGQwRzlrbWRuejVZRnU4TjREYmhoS1pVSVNkNkh1?=
 =?utf-8?B?Wjg4MHRTK1d5Rm4yejhDMFpFazQ3UngvODdwUnhFRDBuaGZCQXoxNU9HSVVL?=
 =?utf-8?B?NFhNQTZOZHRVbE5DR1RlTG1NUkFNSlZmc0h6MGVQYWRqZk5yWnFMbGJod1JU?=
 =?utf-8?B?VEtCdnlzVDdYTUpSbDYwNTN0NGluWnFTSUx2bllyMEFKYW1QYko4UHhJcjVF?=
 =?utf-8?B?YWJTdUFFcVNVcEpOSHBTN0NNV1d5dWMreDZ3YWp1WmVkYWZIaXI1WktITDVy?=
 =?utf-8?B?WktOc09iWmpSdWdyWEgrdStIb2dzcVBwQWN6YjVDdHlQcUlTVlZiWm1TV3hW?=
 =?utf-8?B?dXNSRm11STRUZjR2cDE1cW45eGlOK09KM1FkLzNUWVNqRjVBQ1JFMDdnU25K?=
 =?utf-8?B?WTNCNGdRM1dXaHRFQ2NPK203M2lPeWdPNnpzYkphSDFEc0ZBZTZac2YvWjV2?=
 =?utf-8?B?eWtQSk1jWkhNNmJ6em1NNTBJMmxZUXhZN3UxODV6bkNUaVlKdHFkcXFKQ1pY?=
 =?utf-8?B?cGIzRFNEV3hBd3RoS0Z5azJ5SVhPNVF5VVZjOVk1ZFRGNnRzZXZsM1NtRm9T?=
 =?utf-8?B?R09aV2hKd3VNMHAwWU5RRnMvSHRuT0prdm1MYjhBUzJQVXhDWWhlZTE0Y0xN?=
 =?utf-8?B?Z0V2YUN6djU2VTVQSndXa21pV2ZFckFLNTA2ajl1Y3ZSZHo4ZUxyUlF3ZXQ5?=
 =?utf-8?B?c0FEbVZYSW1QU0tzM3pVMU9ycWRZQ2hIdUlvOC9PN09pbzh1ZFdMOGlnN0hP?=
 =?utf-8?B?VWErRUlRaUNXZTZmMU13Ym5aSnlYUitwemFaYzI2a3dBdi8rVndOREZyaWFn?=
 =?utf-8?B?M3JtcSt3a0FuVDhNb2hKN3d1ZkhwbzBrSmp3QlpsbU96aGtnekhPZG1mcTNH?=
 =?utf-8?B?WDAweGlRbkVvVjkwbHZYWEQ3dWEzL2dPd3ZLazBMS2tvelVLcXZ2Zy8ybE5X?=
 =?utf-8?Q?FUHOBbFcLGCrl3FcF8FsCC1+s+ZSJvBk4LMLw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bERNek53QmVHK1BBVXF2LzV0L0xZL1dBb1Q1N0hJK2VaUnJ4d0dVRWJoT2g4?=
 =?utf-8?B?TTdZaEN1S1IrbEhXT3gzZXBEQTVRQmtwR0R4Sjh6Zkx4M1htUUtSOGVOcjlp?=
 =?utf-8?B?RGs1SkxXTGJvTTJtMHNlSnhmQ1BDNFlFSWV2VjRkbDRCYkNiM1dvdGZxMC96?=
 =?utf-8?B?dVZoM0NnNyt0MTN1bHZXWmhRditweURaMUpFSG9YZStxYVNxWWxvVGJVVmQ4?=
 =?utf-8?B?QlNLdzNUMjB0VS9qazhWckRPSEdKbGtLcHFRekxJdjRzVm5rQUdGelpmbmZm?=
 =?utf-8?B?V0xBVWkwSEs1U0ZMSGlsaHVEeFR0ckFaNkl4NXB1TDVuNHUvRFN0NUxiT0hw?=
 =?utf-8?B?MzhTUUQ3RWNvcjJtdHR1emVIZzd1c2l1blBjVnc3Q1FKTS8valVIcmgwdkNZ?=
 =?utf-8?B?cyt4MnpPbTBRYksvUTk4UmQ0bCt3YWRVT2JmNHVXUHI5eGNCTjhLbEZmNWht?=
 =?utf-8?B?NjEvUjBOMDNOTUFvNUUwQzZHVEJYZTk0czlkbndvbkxTZkd3WTdCUmgremNj?=
 =?utf-8?B?RlJiSEpsaFoxazR0ZEJlSVN6U09RTzVEaTcybmpXY2I4enM2eHBEdDVqZ3lQ?=
 =?utf-8?B?Z2F1WjdPTE9xNUtwdXN2OGNUSHV2c2hlWVIwa0RWZXJjQjJZY2xHRG5JTEZa?=
 =?utf-8?B?cHc0R3J3cm01RW5iMm8vdXMxZE5nejhBWWhaem5SSHJDWlFFektOVUdoUzZS?=
 =?utf-8?B?ZFExaEdDa3RKcmdIUm5xWVdnbFRyQ1ptRW8yRllSZTZ4SHRpTmFjSmJ4TElr?=
 =?utf-8?B?cExpYjgwSDJkQmFXVEg1aFZkeGFsU0J5K3VjQUVVbUxjdGRUOVRwYkNLUDZn?=
 =?utf-8?B?bis3KzFEblRELysxbmc3ajZLTHlyeTNvL2tkN3RwQ0NxdEFWOUJid2N6cUJT?=
 =?utf-8?B?UWlaSVQraUZpdzErRFJXdXFCMERWb0xSVUJYVm0wL3p3cHZ6N25GRXZLbGpS?=
 =?utf-8?B?ZVdCZ21MUzFzMlQyWkxzSEtnKytjYWtabFY4NDZucWdkYVZaUEVrSGVIV1cz?=
 =?utf-8?B?R0d6eFdPQjNBUmdjYmVsZHJvVGFlM0o0YlMwbEdYTjZqV2lCaEgxYkxwK3BR?=
 =?utf-8?B?RGpFeGZXYkRYeFVHUXJSWnZueFg1dUlERDlKWk1ZSCthSGJkNXZ6WmJBeGV5?=
 =?utf-8?B?TGpla0E0eHpXanpJSmFVYkxzNzh2T2RMM05WaU11MDk3c0FTcUZvb1NjcFBn?=
 =?utf-8?B?eHo5VEV6cnI2YTY3NFh4ZDFRalRrcjI1dUJxNnNGQTZUMHE2WGozYTArTWZD?=
 =?utf-8?B?Z2RuVUJocUV0OFAvbTRSNUNNbHVFZG1nOFlDYkJMRytHZm0wUWpnK2M3SkFV?=
 =?utf-8?B?enI0Y0ducVdmN3dBeDZWWVdJR09qSkZXL2lHenBzNnNtaDd2R3JZR2R4eGs3?=
 =?utf-8?B?SkJUOHJDU3FaZ0NQcERJcEt1anlmdEM2QThMY1A4bWVoMHNvRm56NDNvdDdI?=
 =?utf-8?B?VEJBYWsvUzZ5NVJRMWQvOHNId0RESHFjWWhibFNyY0dkTkxEaFpkQmxVZ05Q?=
 =?utf-8?B?ZGpuM1ZDME9NTk5PSlRIMm4vNmpaanVNSzM0WkwwNFlyYkQydyszeFVQNGdo?=
 =?utf-8?B?bTk3TTNyUHo0QkM5OThvcUtpNS9wNmFXbFZvMFl4bjNpS1lLS3VtSWs5b2RR?=
 =?utf-8?B?UHhHenBoQU0xVC9RM1VLWGh3TmZYWU1Ya0FuS2RkMDBqbTlDVGZsci9kOGFD?=
 =?utf-8?B?Ukx6ZkZrVXdISmZDb2lieklid0pXUVJtd1FWU3R4RllhaXM5d1dWeURFV1g1?=
 =?utf-8?B?VkpkMWN3TXZ3S0pkNnpTdFQxc09mTU0zYkc0cHRqWEhycllnVjlWdFZBalRI?=
 =?utf-8?B?bFB5QzM2Wll1RktsNFhsZGFVWm41UUE3WldaQllRZWQ0eUVFRC9VcmpJY3Uy?=
 =?utf-8?B?REhKVE5OZ0NHNXRSWFRBbWdhcVVqcDBUQUtGRFlSRzlydThiWndMbXdEbWZ1?=
 =?utf-8?B?U2RDWXpLdWxrNkMvQkh2Wm8zZHdsNUtkSXRNRmVEQi9ha2tEWHhSR1Z1ZkdQ?=
 =?utf-8?B?NGVyaG52eFpJbG9BeTJUbnNBVGlKRlJKeU12b1Zmd2Zyd1BoRTZZSG5VN2N5?=
 =?utf-8?B?MUxhRjZiWFVBR0hCeGZsNXdiMmpFa3pHekgydkw4QUFwcjhTV2kzVFp6VlV3?=
 =?utf-8?Q?iFV6NCMUVjDuaFsr82g0PwCXx?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72193033-0bfd-45ad-f74a-08ddeab498d2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:39:13.8118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1zdLQBxxkYUb4Qa0PqToV5SPzowO5JN0EqsJWrAaMOIyl6lrwUhzHgUHV1A2UbwN/3ESl+SthAeC+rNS/0ZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF4FD20C3C8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222848

Sorry, wrong list.

On 03/09/2025 08:28, Christian Lindeberg via lists.openembedded.org wrote:
> From: Christian Lindeberg <christian.lindeberg@axis.com>
>
> The Go module cache content URIs has been regenerated by listing
> dependencies with "${GO_INSTALL}" instead of "${GO_IMPORT}/..." as the
> package patterns.
>
> Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
> ---
> Changes in v2:
> - Reverted unintended change of github.com/klauspost/cpuid to go.mod
>    file only caused by change of GOARCH when listing dependencies.
>
>   meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
> index e191426431..e151404cbf 100644
> --- a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
> +++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
> @@ -144,7 +144,7 @@ SRC_URI += "\
>       gomod://github.com/mwitkow/go-conntrack;version=v0.0.0-20161129095857-cc309e4a2223;mod=1;sha256sum=3f15a518f37228f2d08c6b43762d43869a5ab8ae7ba3b5124bf961035e71cc18 \
>       gomod://github.com/opentracing/opentracing-go;version=v1.0.2;mod=1;sha256sum=5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea49655d7 \
>       gomod://github.com/opentracing/opentracing-go;version=v1.0.3-0.20180606204148-bd9c31933947;sha256sum=9f713f45fe865453738633a69f35c8279ecb88f130ca2a140a7b44385656f776 \
> -    gomod://github.com/paulbellamy/ratecounter;version=v0.2.0;sha256sum=fb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
> +    gomod://github.com/paulbellamy/ratecounter;version=v0.2.0;mod=1;sha256sum=775c317e0e805101aacf9509f43a700e945f81a5348fd963b4db1a47d7c1b3bd \
>       gomod://github.com/peterh/liner;version=v1.0.1-0.20180619022028-8c1271fcf47f;sha256sum=0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b6284306a82a21430f \
>       gomod://github.com/philhofer/fwd;version=v1.0.0;sha256sum=b4e79b1f5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
>       gomod://github.com/pierrec/lz4;version=v2.0.5+incompatible;mod=1;sha256sum=2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f84ebae9 \
> @@ -161,7 +161,7 @@ SRC_URI += "\
>       gomod://github.com/prometheus/common;version=v0.6.0;sha256sum=6fb74cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
>       gomod://github.com/prometheus/procfs;version=v0.0.0-20181005140218-185b4288413d;mod=1;sha256sum=52ded709607588200eff4bcfbd61fce32bb0c3f0efdd32d846e3ea150b196352 \
>       gomod://github.com/prometheus/procfs;version=v0.0.2;sha256sum=d5e9430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
> -    gomod://github.com/retailnext/hllpp;version=v1.0.1-0.20180308014038-101a6d2f8b52;sha256sum=7863938cb01dfe9d4495df3c6608bedceec2d1195da05612f3c1b0e27d37729d \
> +    gomod://github.com/retailnext/hllpp;version=v1.0.1-0.20180308014038-101a6d2f8b52;mod=1;sha256sum=57ec187307e4b0d0457a8a28a6a32f683e4cfa374d2449fa72838a18b1230e2e \
>       gomod://github.com/rogpeppe/go-internal;version=v1.3.0;mod=1;sha256sum=33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b \
>       gomod://github.com/segmentio/kafka-go;version=v0.1.0;mod=1;sha256sum=02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
>       gomod://github.com/segmentio/kafka-go;version=v0.2.0;sha256sum=b2a88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
> @@ -170,7 +170,7 @@ SRC_URI += "\
>       gomod://github.com/smartystreets/assertions;version=v0.0.0-20180927180507-b2de0cb4f26d;mod=1;sha256sum=75ccd8771f23a04379e7631044c4fb70b49b27a09650299752ee712f08a6add7 \
>       gomod://github.com/smartystreets/goconvey;version=v1.6.4;mod=1;sha256sum=37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd05 \
>       gomod://github.com/spaolacci/murmur3;version=v0.0.0-20180118202830-f09979ecbc72;mod=1;sha256sum=55565ffdc59d315a952774815afa98668ab9011e8cc11e35be5243e63a23260d \
> -    gomod://github.com/spf13/cast;version=v1.3.0;sha256sum=001ed519a3ec007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
> +    gomod://github.com/spf13/cast;version=v1.3.0;mod=1;sha256sum=b98f2c1774e0b7c0c5747531a6a0c6c8c25a37cf397ff05f1971bbdd97d52fae \
>       gomod://github.com/spf13/cobra;version=v0.0.3;mod=1;sha256sum=41ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
>       gomod://github.com/spf13/pflag;version=v1.0.3;mod=1;sha256sum=c0119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
>       gomod://github.com/stretchr/objx;version=v0.1.0;mod=1;sha256sum=1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222846): https://lists.openembedded.org/g/openembedded-core/message/222846
> Mute This Topic: https://lists.openembedded.org/mt/115041336/7582853
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christian.lindeberg@axis.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


