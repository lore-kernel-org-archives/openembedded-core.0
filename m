Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BF1C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:36:28 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.115])
 by mx.groups.io with SMTP id smtpd.web12.5748.1654691781308706478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=R+4NNM/Z;
 spf=pass (domain: prevas.dk, ip: 40.107.0.115,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTornCY55/yVeTqXm0xKekhJlvXlPzKafbkNu24Y3sKtdLLlE9sb7bvbHkajLswL/9D6QW6atiwjgJ4y3f8iK1TN6MKUxW1NmADsTNl5ZhxvLA43rjICASgFMKYscpU07nttCmsaY7v5drXcPfPqNwLlbCdyoTiSji75boNCDMRS7MXK5bR6ABvwQGnm/zmjf6Lu6tEfJ/czRNxewKWW59nDxLxN6QhU3TbX+favMEvGCymzddbNH72FCRSp+MKSugO2jy0RivpUXfd1HyuWdOdpDfAZ1lOE24Mbf2hmBbKBp5p4jFTl9sE0bBWS+h8tzAeiXTo/sA45hl8T61G24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VtRTNF3hPh/CY0S94j6gg5rxuCvYTfT+MekrAk69Uo=;
 b=U3g+H7nbdBVPDkMSsxvCDRUwUwaSKuqcbUzXrPdMy3fHxjXVpXNEAzjzfd3OST4hm1BZ2v5f5z0a/SrlTYKvRk/3mXag5eDEijvwl58zPier1LYC/GTTsIFSUrkth3LyYH+bVFHHSnlVFwxKLOv0FuWaKFRVjirGCDtWg9vX8njTX5coig5zYSpkDL6tpM45uxv5EhnaRl1SEDuxBmcOugp6H25HtvQKmXvqtkP0c01zeciI+EIm3eROBpODy8NhHy1bK9BPHl960ExuVSY/i+D+0DDss3TlN/2zgJeH18LYqFL69kKwDmOwl1zXWC+yCSxDP2ck7RF4pWTPCIaAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VtRTNF3hPh/CY0S94j6gg5rxuCvYTfT+MekrAk69Uo=;
 b=R+4NNM/ZACcF1UmYVGSzqgtS2ZLRLK5FzoAWCxWh4dc9uLtBb8/279D1g5BAP6hQtVXVY1Zf2aPLLx5CrIJIydyeeU6FMCHMsCangB1HaLx4TzryjtHrUf3YZO9q2ocdw/P27N2kKjGRZhSVhq0Fc0Kq8of6+4dwiIsS598vb3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by VI1PR1001MB1280.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Wed, 8 Jun
 2022 12:36:17 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 12:36:17 +0000
Message-ID: <3bcb145f-cc37-c5c7-d247-76390834fa7e@prevas.dk>
Date: Wed, 8 Jun 2022 14:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH] vim: put xxd in its own package
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
 <29553.1654689480120240103@lists.openembedded.org>
 <b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk>
 <85ab03f4-72dc-6b9c-23fa-5319a6dbe6a8@gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <85ab03f4-72dc-6b9c-23fa-5319a6dbe6a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0061.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::28) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c89be93-5df1-4308-1a0a-08da494b7b76
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1280:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR1001MB12807FEB47561CEAF860BC5793A49@VI1PR1001MB1280.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	760hJvp0yezIVhHoElNc6ln9jzFZkBIvSzbhGD+BVirEhWmFHphf1pA8/ml+1/9RCXL4vjTB7SjQTrRUYd3ccefzQAw6XWJGZyaDTYZyzEHX0LFrSH0TjqyDOCZXOnXS+rqiBiPyoOpmv6rPY6sDjwGB+Bmr/XqulWx7DMLxF7KHKoxr/UhHFBQxNuhBhlwmboTB8JD3vB45qkuW6X/uJDCq2Vthf4ZdcVSyiL1NBeoxqrz4lPvTOJFg9d5oCGQ65SGylcxtSodxUbpTituzwMghBeOfz49dysjnNNxihl0Qiso5yQRpNLhkHc0pOZzaFR8UrSKbdi/BSzikH8nRstxiHavOi9hvzL0wOk/HAJsO3pZNsBPJUnWvzu8XaM8rWvqOdbH167si+9VtE4PNrv+/i6jU9L71pGI3RSkHU+Wg8Kc5cf9wXgGtOby88ZSGzcUtiS3O9srAOeUcY98gFO0mOIaqfqlld4rgn1H7/m/fwOUk2VHNjT275fBCk3TVSkG+T9sMT4MxPQpIHA+hVkYAavy7ubNjzjzeuw5TNV6pe5Rr8cfRZ0KjPU6/lQErKFm6hhfEZsQ3DYZmYGdUd/OZkBV5CF95zBoZ7ivzDN01hvlFbBkYOYcHH9A/dy3bXDJsZ3gadWcvHDF4OP8/3MDaPf+3/dGJjztbxSTVzUfLpilQFSV4yX1Zr53W8loQ9D296fgxOwqWNyHewJAfKsRWujnC47WdZfIVeLLSG/Dknshqrib6tKqO3xBn4/v+LEPhHmokjBJ1Q09e3TbNUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(316002)(4744005)(6512007)(38350700002)(31696002)(186003)(2906002)(6486002)(83380400001)(6506007)(508600001)(44832011)(2616005)(66946007)(66476007)(38100700002)(36756003)(52116002)(8976002)(53546011)(31686004)(8676002)(26005)(5660300002)(86362001)(6666004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmpnVDhybG5qekZRYkdtYm1PTXBRelBZZCt0YkUwTVNhUWlGOE0yZTFlVlJq?=
 =?utf-8?B?L3ByL01DMTZlUWlvUHlhdFVyRFpRY0cyMURpSFUwbHpjbnE2bVRsVmgxSTJ4?=
 =?utf-8?B?SXFLQ2pIWUpFS0syZlFwME94WFFnd3ZkYUxHUVMzNjgrdUdvMDRDWHB0VTlI?=
 =?utf-8?B?cFBWV2pKc2RNVjRjUzNocVc1bWNSRWtDRlozL3FZbHdsWWM1aUZpNXRoTHFU?=
 =?utf-8?B?VzhuakFCN0RzREV4bTd1eHUyZ0IwbFJIb01ZUjJ1TlN1dGY0c3hEOW1oVm4r?=
 =?utf-8?B?dWEwMk43YlZKakJzUEVUZHJ5dUxpd2JIV2pwRitGQnVTMnVCd1d3M1dOZXFy?=
 =?utf-8?B?YlJjUitVWExKc3lmUjczcEtJVlVXNkpqSDBEa2dEbW1VMU5tY0h5NkEyWFls?=
 =?utf-8?B?NWt4M1ZTOFVNQzdqQ1ArbktEQWU1dWZuMHlCQW5iLzFFZTNUbEVJTndVOVFp?=
 =?utf-8?B?SzRpb3AxemFaZGRpQVlMZGZZeWYwaGcxcTlMaEFtcHFzdmt1ZTJGdEVOYjQy?=
 =?utf-8?B?VGVaeDhsNXI5TFhuL1d6dktGVklZNGRTMElTVEJzQmFibWp1QllIQ3Vva2dh?=
 =?utf-8?B?TWVTVE5ZUnJjNGh2TkFtYVQ3eXVBdjdpSFhsaGJwdjh6WmtpMGUvZzVhNGxo?=
 =?utf-8?B?Z29mSlFXL1ROc3liSER3cGs0WTFKdEZWelN2VXFHSjlsOWVUbDZVdUd1aGlX?=
 =?utf-8?B?bG5odnRYd3pQTmxlMzI2NWhqeVFTWlVKNXh2R3VneFQ2RzZRaFVZcXIrVGlD?=
 =?utf-8?B?bDBabHZiRmVkN1c5L2VHZ0MxYmx1NFYyRjlOVUU3RnBTL2NJd2JzVkR6T3VD?=
 =?utf-8?B?bXV1akV0dEVUVU9HOEU0QzdwN2FnbXdXS3ZoRmltcUZla0tzTklFZXZyMHZT?=
 =?utf-8?B?T2dsU3RhaXkybXBlNWtPKzRRUlQ3K2R4WUt6ZEJEdFdDekh1c3ZuMVEzeXhy?=
 =?utf-8?B?aCttL0U4UG5FbGFzM3BXOCtJRE93M09yeWtjbTljaHFpOHJFcS9GRm4xYzhn?=
 =?utf-8?B?TlRhMVlrQ3FxM3NDZU8vR3Q3MThZbG01ZE9NOS9RaUxPK2s4TG84WkVHQzJJ?=
 =?utf-8?B?NHVzcll0WHp5amd0NXN6RFZvTUtxam4zZWNlSGVwM3dwWEQ5N0kxR0srVlBS?=
 =?utf-8?B?ZXlrNEVsVWpTQlYrM1JVYUNjYXNKVXdvRXR6VnFKRkRsUzRUN3Ard1kxcEpi?=
 =?utf-8?B?YXBTUzJNdmFpZ3oxRDc4SVhSNHBxSi9tN3VTZStoQTFScCsweVFPV0l2QXRU?=
 =?utf-8?B?UThPNGh1cFM2ejBlUU80c0R6RWY5YzJnTjF0QThyV1pCbnBwM0xCT3M4REw3?=
 =?utf-8?B?RVZmMEpiMEszRVErVTcxS1ZZVmpkejFSM24zS1dEY0Fvb0NnVEEvcGw5QUky?=
 =?utf-8?B?OG5IYVg0Rm40aGZpUUt0UHpWeEtQRWN1OGJiQkZJbWxKQWsrMWN6VHFja25m?=
 =?utf-8?B?bFRVUDUwclN5cW1NTWlCbjRiN2pyTktKYy84VEpQaDFzVFAxZ3oxR3gxUnJV?=
 =?utf-8?B?aHVHbE05RDBZOURQbmxGRXhVckJhbTA5azI1T05DQm1EMWU1bVV1cnV1OUdS?=
 =?utf-8?B?V3BjN3dDVkVLekVOMzN0UTJBbUFUdWNiendrUTZRcU9QNW16b2ZwcDdJajBG?=
 =?utf-8?B?QlVqZDdUVTFlQ2hZeWd2ZkdRT2R5QlBlR1VaUkhWMTZKZmowVWdHV3l0TTBK?=
 =?utf-8?B?am5xaTBmYWkrbTgrdnk1VDJqa3ZjRGRydVdzYmVTSVArbUhRSzVscWVlSEsy?=
 =?utf-8?B?NzBqSFVBd1hEUzdteFZNbTE0UXFWYVZNb2c5WTVTamw0cTRManRCQUg3VUNQ?=
 =?utf-8?B?VWQzcTU4WUFLYU9TNmoxTXVkRDh1Nnoram1nUkIyc3ROeVo3c2phY25nOGl5?=
 =?utf-8?B?cHZWWkQybnBva2F5MzZVeUozR3l1bm93S3V1RUh1aVA5V2pwdGZxdG55Uk02?=
 =?utf-8?B?RVJyK2JEVkwxUHYyRG9OMFhvQnFxMXBnaVMwMFFXdFRhdUZRemtGajJwbHI5?=
 =?utf-8?B?TUdGSzdCa2RvR1c0SW55eExlVkhRcjBJVnZxTVp6MVNha3hhRVRRcS8rYVUv?=
 =?utf-8?B?WlZPWWxXNGtudS9UME84MEIvbVNyelphSWhDbUtvS0pZdFM0VlZTRjB1U1lv?=
 =?utf-8?B?MCsvdlQ1T0VrNDY2MnE3ZnMrOE83NE9TOVNLemcrNXRDTDdnUlNPanozb1JV?=
 =?utf-8?B?RWsrU1lkZmgzY2ppTXJoUzloUC9LRVNhaTNsdDQvSWlPSnFjSDVmU1R4ZkNU?=
 =?utf-8?B?K29FaFRGY3NtYkFhZ1RGN3Y1c251aDVoTHpLNHd3MkNnZXhOQmpzV21ITFV4?=
 =?utf-8?B?ZEtXUG05R0Y4N0dHZWErY1g5dDNISC9aLy8yVVZ1cG1vd21Bd2RJVU9kNEg2?=
 =?utf-8?Q?XkJyITPbxfvTmo44=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c89be93-5df1-4308-1a0a-08da494b7b76
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 12:36:17.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IMZ2S3UUwln6j7GOAv6s71SHazV9dgfsuPg5SmYxJd5zeAhqFTNdcL1UxZCLpBZDk6+OToMHYX1SdlMfuAGIQUbMLsXBUne7YV1dOXMBXrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 12:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166705

On 08/06/2022 14.30, Paulo Neves wrote:
> On 6/8/22 14:13, Rasmus Villemoes wrote:
> 
>> On 08/06/2022 13.58, Paulo Neves via lists.openembedded.org wrote:
> I mean that your patch allows for a new standalone package ${PN}-xxd.
> Were somebody to use this package standalone, meaning without installing vim,
> the ncurses-terminfo-base would not be installed, possibly breaking xxd.
> 
> Before your patch this risk did not occur due to xxd being include in the ${PN}
> which had an RDEPENDS to ncurses-terminfo-base.

Thanks, now I understand what you were saying. And no, xxd does not in
any way depend on those terminfo files; it's a simple utility for
converting binary files to hex (or the reverse, which is what I happen
to need, taking input in the form of ascii hex chars and producing
binary output). Yes, I've tested it on target as well.

Rasmus

