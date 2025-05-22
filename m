Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F34C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:29:39 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.40])
 by mx.groups.io with SMTP id smtpd.web11.22871.1747916969624778268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=G4XBKTvR;
 spf=pass (domain: cherry.de, ip: 40.107.103.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWnNNSMCxyZqU8wYuhtrDvuf4627n6RW8dW+PyTkyYChkcwD37+yMDV7j0gPdJ9IBnB1BCzmA8/jyQH05bATC9YNIUUdfKnjgMwxKCBkCKW5riml4fSYKxS+XV0C7JtM8GbRxvJ893Mz32sju6iOxdAGG4A5B98qwczL30UOhfsCSWBxonczIEIAhTxDX1GnFq34ZcWqNGdP9SA7+sSrKK3iNT6Zi1chScc07+C0HR50PltdcCd7nx3K+nfa4QgVCmS8aMICQ43SUA+kGc79qRNcppyVPchIS/WeVZdyhyXnIgk0zr1uPojUHZR8W/IJ+6UaqEbEDDDj32apjjrl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zBmjX3sO3ow6Dkj3y3b18x95kQ6eQRE58BHSUve194=;
 b=lqnBPQtO4RJ2skVbbyUpRsDQ7OBhSS5WS/FCe6bqXB9+BHr/Cuo7nllEjFkFO3XCAOuwCqE8/cqG3a27/ieQgDgw/89UwV5PEQt6z46ftao+i2r8ONWl7RRN4ZgIOBRL9Iqfvqk5qrSGClgvxbtp8TjF/unAIjLeTT/zkjVPmkYZZKFRGwHhYHCQuJwYP5AjdcfhHskeL99sidDiveOWUxYyk824YtF3TsrVDXvAxbPy7w7OYlNb98tOLsB9vsCNQGEcKmgQqd6BBdATFv+gHcRjIUwuTZmhCbPQHCJ8ieNWoqaCkN4WzcT9jG+78vXiFBquBg9fD8vSYeUlxRqwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zBmjX3sO3ow6Dkj3y3b18x95kQ6eQRE58BHSUve194=;
 b=G4XBKTvRhSHm5+hd8gzOnvMf629u2SNnfXTUObd0+dAH8c5MoE9ojoDLto56hwTqRIhINg4fEaQyG59SVnkdd1noSZJ76shSRefpqB7CDN0lMt/3dxxR6MfZPV19aJgQu/ZuQGtrtKlsDdgK6JDG0V1p2PuDHLwD5GNeckLF+wI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 12:29:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:29:23 +0000
Message-ID: <001eb60e-fbb0-43ad-92aa-8f47dc32ef32@cherry.de>
Date: Thu, 22 May 2025 14:29:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: consolidate rust-llvm dependencies
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250521191449.1486927-1-ross.burton@arm.com>
 <20250521191449.1486927-2-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250521191449.1486927-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c76ad4d-0219-48d2-00a8-08dd992c4893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NHJLSmwyb0xzMlpzdzFaekVxOHZhVHZtL3VyQ2ptV3Q2VlpkQ3RTcjlqK1pR?=
 =?utf-8?B?NmgvY1pQVjhnTi9MMkUyTFhEQU5mUG92Ky94V3VaUFhNL0MveEhWZlArQUZM?=
 =?utf-8?B?QXdqRFc3WVJkSVRjNnVZSGpPSnp6d1B1VHU1VE5IaWhtWFd3YlNRdUYwVEU2?=
 =?utf-8?B?SFJZUjRZbjd2MTJvTmhIS3MrSG9PbU1hVVhkMTRBdWdPNHVRb2hRS3RDLzc2?=
 =?utf-8?B?YlNxdnA5YmxQUjdVdnlyc01LQUF5eUpBTDFUUzE2eHIrNTcwWFV2b1I0Tytn?=
 =?utf-8?B?RHlYcDE3TC8wLzlLR1hPRm5hb2p1dWMySWNKL0xEUDZuUFVtU0tQTDZzNEF0?=
 =?utf-8?B?aisyTDA2R2EwTjV0NXRkODJVaG9VZE5QRDN5WGVpdEVaNEFvK29YL2tVd0hX?=
 =?utf-8?B?c3pHdHBBbWZ6cXJyN01NRDlIamFVbnFsc0VyYURadVVYMHF0amNEUDNvanZj?=
 =?utf-8?B?Znp1MHgxY0lGSmtjSjFWNFhRaW9SaHhjbEE2bllIMmNvSkVoWmYwK2VPSFpX?=
 =?utf-8?B?MDlreCtORTQ5SUdBTU5SVWJPMDVvSitpUG1yMXQ5bk84MjQ5N2NpUllwU0R2?=
 =?utf-8?B?N0M3OWFzTGY1T21vQWhZbmM5Z3Y0MWhKK25qV0ZRMXVKWWUwTXZxbmc5Mk5h?=
 =?utf-8?B?RVIwWmFOeHpTaGZrOE1wOGVCcm1OVHBMMmplQ0JjK1RKU3I2NnkzQTBRbkZ1?=
 =?utf-8?B?aHdGK2pHbnRBNW11N2JtYTdhUlIwTnJZak53cHVIQ1h2MmcyQXdMSWVVMkQz?=
 =?utf-8?B?ZFBKZ0g1TEZGMFpmbGNmckhVZnBLM0ord2RqQjR3dW5BdHpBTWtsb3EwSnVz?=
 =?utf-8?B?RXMxeE9YQm54UDVJbHE5SXR3b05oYjdiWkhJamhKeTd1dXdkdU1IZHllOUpT?=
 =?utf-8?B?SVZkSW1pRk9lQ29kNWF5aW9aTFVRei9Qb0xWVlFVNmlvd28xZE5lcDFNYnhJ?=
 =?utf-8?B?c2xYbXQ2T1l6MGY5TzNLNzkvMkxUc0QvYzlHdXlub2l3MS9NYVNhSEE5RFlK?=
 =?utf-8?B?c0t3b3BFNFkvY0piQVBYM3A0T3NvdE94ZGhVVVdiVC9TbFJSd3VFVVpwbzhi?=
 =?utf-8?B?dzZwSXdkVVVONmpNNi9VZkVicU9MNXFNblFDUXBZZWNIYnBuamRwUTNwNExs?=
 =?utf-8?B?eFJxcFVUaTZBbldNSDEzVXdqN0EvZHJkWTVnc2REV3A2bmIxQUEzT0hmcUJj?=
 =?utf-8?B?ZVRUSndsNk5hSnFVWnpINXZON3l2eEVXeGFVTitCaWJQb2cvSmk4eHdBKzRD?=
 =?utf-8?B?ZXlvR0ZXRlZ0TDFTcmZrdnBhV3ZublBhYWFZOGJxeFhCLzZUVXo3dUZOV2h3?=
 =?utf-8?B?TDhiUlRvZElWUVIrN1pGa004NVZBT2hhUUV2d0J3a1ZuSEU1WkpsampkVFRC?=
 =?utf-8?B?TjE3bUE2TFJPbUJqUWMyUmNKTVNvaVVrWWg2RnVZaXZHSXRqSnhzekdkNlRL?=
 =?utf-8?B?WVVicE5pNVgxaXBZcXVTeVRWSHhnSTlCalFpM0l6L1piTlVlNmFLd0t2azgy?=
 =?utf-8?B?TWZnMmVQUURrZkFrdENnUGk3OEIwV2NYVHlXcnpnSC9rSkt1amlTZ3hLbHRl?=
 =?utf-8?B?cjVLS2xxNlVoTjMwNlgwL21Lcnh5VnM2d1dBazF3aEpWUmtLYzZqdnlMdy9l?=
 =?utf-8?B?RmFxNFRtNmp6V1hLdDVHbjlWdEJpU1RWMXJaM1lKYlpLMEVXR015ZzhhWGtv?=
 =?utf-8?B?VG5mMC8xRmJ5d3Myanc2amFSS2ViYjRVZCtCRzhNMVRTTWY0alFzUG52WUNh?=
 =?utf-8?B?UnRPU2ZPZHJsa2F4WGFQVXJCdUhySGZCU1MzbUVQdDBqZ05ucmtQd3FJMjZH?=
 =?utf-8?B?bGlOamdWVXJvWjg5N2RJd0U5UHpDRWIxY1FIL3pDcWdGemw5ckc2NmlNa2hu?=
 =?utf-8?B?OGNYenErOHk1SHV4QTNWY1VBT0FORTluTHNFN0o5WVo5YkIrL1dJOVdEbEhk?=
 =?utf-8?Q?Q8fZI4qRmZA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clAzRm9iTHZmalVCRmcrVEJkMHNJbzlwSlFQRzU5cmRFVjNlQ2pDS1drZ1Uy?=
 =?utf-8?B?Vm5nTU9UZ25RSkx5TlVNb3dzcU4xK1U1dFd3Q2N6U29uR3YxdDJqd3JrZERS?=
 =?utf-8?B?Mms1bkxPKy95SHBQRGZHU21OVDFEVyt0V1dWTFFSOEZwQm9YUWZMSWZXMmQ0?=
 =?utf-8?B?R0RmQStkUS9mL1pJZXhnMitGS21EK1h5SjZMVTZEdkRPRHMvWjd0M1VwUXI1?=
 =?utf-8?B?R2p1L3pxZGtRVWQ2cDYvWk5nd0J2RzM2WHIvQis4YlRsSzloangxRFF0STFw?=
 =?utf-8?B?WElYNFhzTUNybW9XeDhsSVhwTkFpaXI1aCt5ZmR6WmFMRlJNUU1VQVJpa1cx?=
 =?utf-8?B?Sm5kVEE2RGJiTzRqS21MRlBKd0p3Rmp4eGIvRDF2aTNOcmFIVCtoVm5pbWNj?=
 =?utf-8?B?Q2xSSHRVVHN3M296bE9NVy9QSHRKc3lTaWgyZHlZVERJZFkwZmtheUZyUyty?=
 =?utf-8?B?NmpJZ3J4NFhPQWtSampFWmdkN0l6MUJreG1RQTR1b2IvckRhdGFlUGJDTWwr?=
 =?utf-8?B?M0pKa1p1Ym40dlMwbzJtTCtFbzNVYXFvZFNiUlpIQlJPL2JXYVJ4R0xWd0FL?=
 =?utf-8?B?Y0ZoK2RsVVM2U1NjYVlCSklibjRHNkQxUkNEdS9haHZCdFpVTHBQRWNpd1pR?=
 =?utf-8?B?YmxrTWlCdyt2MUI2L0hzMFBVVlZRd2lLNTM0RTJJdEN2ZlpmWVNycHpEL1pM?=
 =?utf-8?B?SkE3UTUwYWJnVXF0VUllbHlzYzNTV1JnMGJQUjVNQmMvYS9kNkRmRHZLVVo0?=
 =?utf-8?B?c2pKTVEyTUptWWRhaHhVdmJYNUdMcXZidUp3MkhROHBjbDFEWFVvSDJlaFYz?=
 =?utf-8?B?dU5sSlhSd3k5Y3hOOVRtS3JZcjAxWDNwVzFrZGpZdkpkOEhEQXNzcE13Q0JX?=
 =?utf-8?B?V280TEtRbjl4Sm82QVVFUDF0SWZRSFpucEhpMk94SjdsUHRLZkpnZ2FUdnc4?=
 =?utf-8?B?WThYeitneHpKWlg2d3NmS1M2cmF3VlRDUmIzNjRFaVlNNzIwK01nZ0l1VzRF?=
 =?utf-8?B?N0VNK0J2eFhwUDViMlphc3hlV0RsQk03RG9tQ04ranJtTFlaZFlsRmN0ZExv?=
 =?utf-8?B?c1FNY1MzNGhMdVFFczY4UCtBK3djK3JabHg3Y25rbHp6b2hnZ2tkS3Y4Zzhu?=
 =?utf-8?B?YkRlajRxTGtISjNzekltcjYvendqWFVXNVlTWnpNdHdpRmViQmFvSTBqWmda?=
 =?utf-8?B?YW1rRjl2bFRaT2ovTWU5ai9CdWJ6NlNHWjUrQXhUNm50Q25ISWhMMmlOaHdk?=
 =?utf-8?B?RWVwd05pN3Z0RFhic0t6M05MQXliYkVXV3I5dGM3d3B2VEYxQjh2eDEyamFt?=
 =?utf-8?B?MjZSdkdma2RzNmdVcTlUMUtjTDh3SUxvZkpKM1FhTitvUE9NZnBFbERPTjlw?=
 =?utf-8?B?NkZUdWt3em56TjZuTllVaGEwYmxlbWxOWXZ1RDMvK0F3dHdCSTVFQVVLVUk3?=
 =?utf-8?B?RFdZNDJ3VDd5RXR6SHlxbU1ueGJUQ3JYZERMbzJ3MUZVbG9Rd2UzMURLbDU0?=
 =?utf-8?B?YnZqTkl3TUkwM1VRSXlyckYxTlFXTmZoVG80RDc4anJ3MUNIQ1Q3MkdYZTQ2?=
 =?utf-8?B?eHZLN0JVOE8ra3M2ZXlObEE5MTlFUlRacWlPTWdjNmRjWTVEVUZZRkNyamc5?=
 =?utf-8?B?Q1kwVDBQWjNYVkxYU0xNVGl1YnVXNEZyZml3Z3U5a2JyNU9IeFozSlM2WmxG?=
 =?utf-8?B?TXJrU3orU1NQR2NjNUZieXNkVDlxQTV3Vm9ub2RPRTNtdWZtQzJqU01VenA2?=
 =?utf-8?B?UEtYeGt1SWhqU2dLajkrVlhaYk1iZ2p6ZUJjbFJTdXNVWXZ3NnROWUFYRS9W?=
 =?utf-8?B?WWl4UzdEd2wwVXpPNkp2b2J4VktaaUhIRnAvNWxLejVKY0puc0w1MEdRbkFy?=
 =?utf-8?B?Z3BDUU4vZTA3eUJHUVpOSVFFY2NsbUxEZWl1aGU5QkpiNFM4RmVIMG9XL2cv?=
 =?utf-8?B?SHR4NTRuMmZraURBTm1LclNYRU01MjRncVY5bXcvRVBXTkU1clA3cTJZZGdY?=
 =?utf-8?B?VWhLdXppbkVHUGhjQXBTdzZvSXcxRXUxdUdBK0lhRk95ekpnRlM5ajBTdkpj?=
 =?utf-8?B?R1g5aHNhblF0UDdYcUxXMTFFU1drY2cvaHpkbjFFa2doKytRcElCZnBBTTNQ?=
 =?utf-8?B?YmEwSytBU2xiZ1NZVkJvWHBvc3F5a0FKL2kyZ09LRTRaOXl0TzI5ZXloR1hH?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c76ad4d-0219-48d2-00a8-08dd992c4893
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:29:23.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI18/BqUeFFuoRAyFTUwBP7xFT4gpvaAgnyM933wQ8V2RVmpp3bVHnTXyrIf26GvBOee+Z7YV1u8ukjYjUX6WLWWm09NAZi+r23+kbHVWO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217095

Hi Ross,

On 5/21/25 9:14 PM, Ross Burton via lists.openembedded.org wrote:
> There's no need to have multiple overrides for this, as BBCLASSEXTEND
> will automatically map the dependencies as needed.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/rust/rust_1.85.1.bb | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
> index 583437f1f3e..6411e43c961 100644
> --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
> @@ -7,17 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9c0fae516fe8aaea2fb601db4800daf7"
>   inherit rust
>   inherit cargo_common
>   
> -DEPENDS += "file-native"
> -DEPENDS:append:class-native = " rust-llvm-native"
> -DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
> -
> +DEPENDS += "file-native rust-llvm"
>   # native rust uses cargo/rustc from binary snapshots to bootstrap
>   # but everything else should use our native builds
>   DEPENDS:append:class-target = " cargo-native rust-native"
>   DEPENDS:append:class-nativesdk = " cargo-native rust-native"
>   
> -DEPENDS += "rust-llvm (=${PV})"
> -

We do lose the force version dependency here, would that be an issue?

I assume this would be if we forget to sync rust recipe with rust-llvm 
recipe or if someone decides to port/override only one or the other 
recipe (but then, do we care :) ?)?

Cheers,
Quentin

