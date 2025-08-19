Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5FFCA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:23:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.48])
 by mx.groups.io with SMTP id smtpd.web11.9666.1755595413981331934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EjUzQa3Q;
 spf=pass (domain: cherry.de, ip: 52.101.72.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZVBKi/dh7PiEdwzxP63aURVGYRSAeMfYvi1s16O2LQOQ4mkS46WhoTww5sznhzAnuuGks0/R2ZVdxp8B/Ma+V5euz4SEU/aeIdjQJF1ASJIyiGgxgkxWhjKTfF92v0CC/N10U+e9t+tjiC+/6foMsUD6ORmdDPkQTgK+rsQCyB3fShAQUARgMaz/0MLQZ0adLW62YOrCrcBKxOSya0A9qgB3TZHhwBORN+fRyG1cBF9wKevvW0zyU5BgjZsO9tYnvP9zPBodp5njADUGvZtORbHqb7kD5XHG2X9LfrJgSTzyXwJEIEeU7LeqmAvX/orymoF3depbtLuBS/PRiuwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22o2sxrQCoGqTAs/4DvDchN15SxTtUv6eusEwkBSMOg=;
 b=GEoKbo4h0EfTtiIW1o/6ha/omFCGSKD6wDvDFxoXsx5b4a+QEnKM34dRXxRXHRP5hwaPjWK0zzI66GKHdpDf2iOK92cz0OgOutqLW0e7VhIgX1c4SvFpqHTGX3Q9wJmb05X6rNaRhzfaXXbnIFzo2KZEM6rz/pjWrtnwNR74KI4yZb5uTm9y49p/Pndlo0ICQGpI6gw7Mzk5/ZRWXJlq684k6O1bvcvnPIgya9/Wmk9wG2LbY8TFEhkNUtOjKG9im1o8KAjJHGY/FbKYwoNDAhhrekgsvGWrIqOeyr3rdzq7mjBCLjJshVM9g3qz7kzDGgx3ndGqTNFW2GZ/r8IG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22o2sxrQCoGqTAs/4DvDchN15SxTtUv6eusEwkBSMOg=;
 b=EjUzQa3Qurw/NZ7VJz+QmtdehL/13YGQ4CVomyOpK5xZHrbqe4+RBgCPiQGClxIkRwjhbCUCYncP7SrNIIn31U+PINR++L1Utp2j89E1Wbo7TFdOFPHjaZ60BqrXy/hIOyrqOnVWS6JEgeJ1cjnp3nrB8908oBNDUdZi+f/sEUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7380.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 09:23:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 09:23:09 +0000
Message-ID: <84a7dfba-41a4-4f23-9dc4-92125e0a21ea@cherry.de>
Date: Tue, 19 Aug 2025 11:23:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] bash: Stick to C17 std
To: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250817225816.2089232-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250817225816.2089232-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1ef25c-a8e1-44aa-417d-08dddf020327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHFwd1ZTWjgrTVFkRllncFVkMnR3ZWgwMU52UU9zR1JzUzlFY2NPck0yRE9u?=
 =?utf-8?B?ak9tYkJrOUgvbTNFbm40OTZrNHdvdm5nRUgxUnorNHMyYjBzZW9WVFhINnF0?=
 =?utf-8?B?eHhYZmx5a1N2WC9YcmoxWmtPS2NyancwY2JxUWM5NDRIRGhrbWp2N0pXbTdB?=
 =?utf-8?B?dzV3STBKRHpIZy9oK0pQcXU2dEtkOCt3TEJxT0NmZTJVakZhOE03d3hYZFlt?=
 =?utf-8?B?NTJSaGd0YlVROUhTV1ZsY2Zlb285dTM2d3NuV3hvWnc3R0o0MkoybnhHSjRL?=
 =?utf-8?B?VUl0QU1pb05ib1BmRFltOEVuS01Odno4bGF5Skl6WTJKa0NCZmdpYjg2NjRP?=
 =?utf-8?B?RTNOTytNOWxwaGZnNmF6WjRTbFMxNE8yQmxUWmlHbXdTem04bVI3eTd1WEtY?=
 =?utf-8?B?NDB6SlZIc1g5S1pSQU9sQUFpeGlVM01CcjZyWXpCWk1EdHgwT1M1WWpkMlp1?=
 =?utf-8?B?WERLM1FycVZic0VnMEtXWWNYRStEeWtLbW9IMU1ya0NkT0J6aXdGS1JZZjdu?=
 =?utf-8?B?aVhWdTlNamcydmhuRlRrcTZLWUMwZG1mK0dxd1hncnhpNUVVWXF6eE9nZ2dw?=
 =?utf-8?B?cXZQUnoyZW5sLzFsUTNMdGp0ZHFYeTY3ZWoyR05XTVBPU3RHc0haNEpxSUdC?=
 =?utf-8?B?Tk5hUkpGRjVpTVNuQW9LS1JxK2ZGWWljVEsvRTlVSXVEWVo0TmcvTXdJSEky?=
 =?utf-8?B?RHlQd3hzUlZ3SGh2YklodHN5dUFiaDVWb0RWb2FTbzVFemhqQUpLV3MwME1u?=
 =?utf-8?B?N2RKbmVXYjRmblVycTZ2QkJoUjZGckhpajJHTHFVZmF2QnN2NEtGMGZDQWlV?=
 =?utf-8?B?eWg0ck90S01CNEZONk9ZWFpheGZuZHNvTWFLWkNmQ1R2TkxnVVJZSXgwYlFU?=
 =?utf-8?B?MjdwWXNmQ081Nm96dnZBRWYvQlMxWFRGN3RrUFJRaUp4TGtDT010d1VTd2VG?=
 =?utf-8?B?dFdyS2VTK0ViWXczZ1J5WmVON3dITndmM3JKYjJFSWNXT0RxYkFTRjR6cDRy?=
 =?utf-8?B?a1I4cE1KeHNhTHIrSUNhV2gvVXFmblFwSmkvaEZGK2FySXc0MVFUekZRREg0?=
 =?utf-8?B?M2hTcVd6ZkdIQVk3bW9XaTgrb05CQ3BrQWEweVUrQ0gwWkhSWGVZd0pYbHdY?=
 =?utf-8?B?N1Rqb09vS1RJUFdkYmRJV1Y3Q0loV3dYOU5XT3o1V2tSdllvSHpKYVJLcFRh?=
 =?utf-8?B?aks1UUNVbm15cGdnL0FodjZjR0hxYWx2dzl0a0hpRjluRE8wSGZIZE94bEor?=
 =?utf-8?B?S04wck82YzRYWjlIeEF5Y2lNY1NVTzFEOXNJWHZsN3E2N3k1UTN6Qk0xZWZ4?=
 =?utf-8?B?ZHlEK2poRkVmREhTajZGb21HNzA5T0V5R0srV2hkR3ZIZzA5cTJLR2ZYbDNO?=
 =?utf-8?B?ZWc4dHVtKzBRdnF5dWxha3g3SXphN3dkOVQ0dktpS21LQkp6c3FRZFkwc1hF?=
 =?utf-8?B?UGFZZXo1V2RnMkVhRWxZVis0bnpWSURNWEkxTysyanEvMlk2RkNBNk9BRnlQ?=
 =?utf-8?B?bmRIRit3SlBoOWNpNGZMdGxiN1RPV2p1S3VEanlsUTlBYVprOEFYTCtnU21u?=
 =?utf-8?B?YXk5RTJRVUs1aEJraWR6Y1BxMUp3RS9PQ3NlUnJ6N0lQYkhaTE5HVW11T2F5?=
 =?utf-8?B?R0VMYm85TklzUHBNMkJkSm9CYkNlOVFNVmVYTTExMzgvT25tcG1Rc3NsWHIz?=
 =?utf-8?B?T0VVc2UvK3B4WGdDekwxQ1dSRTJITHZYdUpST2tCb1ZPR052U3Z2M2F2cXh3?=
 =?utf-8?B?OVoyQnV6WVQ5QTBvbEJZbEVRVWFiK3NmNnJ4VU96eWFaZDBSNlJVKzFnVmoz?=
 =?utf-8?Q?FdytyhITv7AInmWneEMAkCGYM0Sx4TYMacqCI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVVNYzkyRHF0U2xxeCttY1ArdFRvc3dXbklwQ1J0bGdCVzB6dENOa29PSzlO?=
 =?utf-8?B?ZDcxVFhzL09pajF5NHhtaW5zd29BNXZEUnpJNkdiY1IyWm1LMFBWQjJOT2x1?=
 =?utf-8?B?NmpvQ0VFRHYraStMYm9FaXpNSGUyd3BMN2lVcFFaSW0wVmhVa0NYUDZCSW1U?=
 =?utf-8?B?NmpJMkJuY285MjVHR2dXc2JsaVlvWUJkaXU2bGFaei9ZSWQ1MldBZy9OVlR0?=
 =?utf-8?B?RU9XcmxUQzJ3VHJ6bERDeXNYY0NrZ3hjaEkyTGxxcTV5S1ZBeHpyQVBTdnBj?=
 =?utf-8?B?Y1RBUFh4MzlER1llVTh5bzJ5SG9JSnlQdTI0Tm5VYmpuRmM0NG50a0NDWnA3?=
 =?utf-8?B?dXlZeWtlWUE5MzZ4TXVlZnVWU1o2NlRIMjAzUlhHcy8venozZzk2Z1lPbktK?=
 =?utf-8?B?cnoyWTQyZGxRTnNPM3BmK0dKZklNVXZkdk5OV1NGSWlnZE1Bd1VGRkxsWGMx?=
 =?utf-8?B?WjlXNitSa2F0aVRnMWk4alZPcWhwWFhGNHhsRktrUlVUOXdxcVJucWl1Q080?=
 =?utf-8?B?Q1oxdnlnVk81M2JJRmQ4R2hsWi9mUm8xM3VaVHZzTXh6MVAyN0lPOHZvS3hW?=
 =?utf-8?B?ckNwSnlIMmltQVVINmFXNFp0eS9xNlR2M2kxbzZ4UWpLR3ZRc2pMT1VyQTJ4?=
 =?utf-8?B?VkVHVVlQSUMwS1BqNHVkby90c25lOG5hZlVuKy9uSXorU0ViOGtIUkQ0RGtw?=
 =?utf-8?B?dHN2aGRPU0ExWGFIbEtNVXRtYnBlZFYveE1xeWFTVEVlQWQzVnhWZlFVUFVQ?=
 =?utf-8?B?Ri93UmNJM3B0enNiOXdsY2Q4WTE2ZGh0RzJSa0ZZNzhMdkxsRlhDVGRsSERH?=
 =?utf-8?B?ZW9mSVZEbDFKUzRoS01WZG8zSTJZZGpPOFVUWFE5K3VTZERnMnpIQm9qVUs5?=
 =?utf-8?B?WDBWbHNTMkwwYmpxR2Zad2ZPRGNwWFQ1MEFHcktRYlNRd3ZpbzQ1dW4zNDhR?=
 =?utf-8?B?Y2RmU3U2L1MyT253VzFCWlFKdFRmT0JZeWhOdFJwb0tnTENYbmVFMnZZTTJ2?=
 =?utf-8?B?aVRwUlBlMERQUWFjMG82bUdPZ1NCazZ6Wlh0R3RDaHBibkFUVGR0VUZ6OG9B?=
 =?utf-8?B?bDR6cjlsMHVTU1R4a3daTGZESE9OVUVsMHNVYkZMS25hOEZmR1ZlTTRZVFFG?=
 =?utf-8?B?b3p1WjhvVHgrY3ZlMXRZR0NWWWlMMml4WTQ0eEJpTEora1JpMjlka2tWRVRN?=
 =?utf-8?B?MExRcnZBNUVkQUg5L2plWmxkc3hKQmZCVkdVc0J0a3RJd3VCL3o2dVFzUUYr?=
 =?utf-8?B?cmM3MzVrSjByN3M5WWNYMjFBSXQ3ZVdrR3RFcTFkemFWOGt6ZHpTVnI0TWRQ?=
 =?utf-8?B?L1h6dW43aFczd2wxUHJ3dVpvaHlrR1gwL2lrTWRNOGgvSmZ3S2YrOXlVWHZr?=
 =?utf-8?B?eDRaVVAyWmNza1Jha3NqUnh0RlI0azVOSGNKMG5NdnFDRmQ5ZTFCQTgxeGxL?=
 =?utf-8?B?MWxocG5BZ0xKTTJEeUYyMDBVODlFYjNBREhoUU81MGZ3VlNkMGpvNUQ0MnJQ?=
 =?utf-8?B?TjdydDM0d1BDUGc5Z0c4QTM1OHdKUzJTMy9xNnVycXRmUWVFODhIWjhPVmI5?=
 =?utf-8?B?enAwWFp4bXVEMUJOTnd2ZDdvUzlRdjNNUHQxandtajVMMzE4cWFScGR0TUhx?=
 =?utf-8?B?Y1czd2FqQjRvbE1hYUVrQ0JBVGQ2SW80ZlRyNzEzVTk1VS9kSjlDUWE4a1dI?=
 =?utf-8?B?U0szVm14Vk92TWNyeE9RaVJUbHFCSUcrOXY2eVl5VXVGcFdXeHpBY25wSEc1?=
 =?utf-8?B?RzVXNGJKWGtXdHZEY1ZIRVplbFE1UU9QU0hQZUM0QWdWMXRzZVg2UE5qRnls?=
 =?utf-8?B?TWlRVXFJUGZsTnhuUXBRR0lMMTArbDV6QVZyNnZMMWtiY2lCYWRYWk1WWUJ4?=
 =?utf-8?B?cTdJeDY5NXUrYnZXdVEyOUo1d1h6eTRVUXNwb3VOWkFjbXUwcEQxQ3ZzM2sx?=
 =?utf-8?B?d01Ea2E2dWJncktqWG1GNFNFV0poQ0llRm12OE9GUThZMWFLRkdDY1owZm5x?=
 =?utf-8?B?bWlFdXo2amlvNm9KSDc4VFNZaUUxYVNVWi9vZjFJRGt5am1vQmxabm9PT3Zq?=
 =?utf-8?B?M2ZpUUlIOS9JUGRWMk1QNzkyN3MvRkxvVWQ1STNqNUhxRllqVDNndWpzUHdj?=
 =?utf-8?B?MHVJMjQ5R1JqUVhpNUJPemN2RmJMd25Dbzk2V2F6alE3NktoOTgxNitzazV0?=
 =?utf-8?B?cExxYkZPUFNYMCs1ZXA1OHI0cGgreDEwRkpDTU92YlNaQ0swNjNIWVV2UlhT?=
 =?utf-8?B?MHp4cGo4TWpIQWIyOW53VjNqNGhBPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1ef25c-a8e1-44aa-417d-08dddf020327
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:23:09.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xM0PrxfEmkNlmFmXAnEKhTd7hcRu0n1qq5T8WsYFZgGv30ct3T+BeFKXytmELbX5y30yOmin/+S9lC+EU/T0gjB6RMYJhIeq09I5r9oFlZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222091

Hi Martin,

On 8/18/25 12:58 AM, Martin Jansa via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> GCC 15 defaults to C23 and bash is not yet ready for that

Same remark as for the other series, do we actually support a distro for 
Scarthgap that has a GCC 15+ toolchain in its package feed?

> so keep using C17 like GCC 14 for now
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-extended/bash/bash_5.2.21.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
> index ccfe5c47a7..42ab02c440 100644
> --- a/meta/recipes-extended/bash/bash_5.2.21.bb
> +++ b/meta/recipes-extended/bash/bash_5.2.21.bb
> @@ -22,4 +22,6 @@ SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b
>   DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>   DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>   
> +CFLAGS += "-std=gnu17"
> +
>   BBCLASSEXTEND = "nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222028): https://lists.openembedded.org/g/openembedded-core/message/222028
> Mute This Topic: https://lists.openembedded.org/mt/114755403/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


