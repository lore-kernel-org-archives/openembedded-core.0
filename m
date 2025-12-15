Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92D0D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45043.1765793116914646651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IvBXpSu/;
 spf=pass (domain: cherry.de, ip: 52.101.72.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdtYBnw6g2xcTNMDvmLkWkSGhzB2gDoGWOlGE3oHo5NEc0LOOBtX7pRA81IrH6khn2PYfXTAJKlNYGmhSHPjUyAlF3PHnrsgycZRRXqjTa2casgmWIkImfpvrtb6RK1iIhDXdncmTkB5b75XHTEwyM1d1+TVQHGJebxcwvKaXJVPcuaNccTpnJYtm8VV5IrjTT8CuhIEYKaPh+HweEt6cr99rpU8DJ5pU6HsHUiQL7VilffUQcAyoA5DsYyL0evLGCePUEDzY5JjoRzF6/NWB3uXssJJoEz3ORm+wcXAX6Ht91Fzg0fK3Wr6QL6MS7aOVcPIkVldSKHBx5DUT5R4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baWiMNVMHzAcX7ZkZ490QmBsJtiNe0YpFNxwyQN3yQQ=;
 b=CmSqmTEV3sxYzXPpzbnsba1vyR0Aj+Vgw6QvDyZDfBvxDUhftC1XwHD5Chil0A8ZMmCp5e+xRF8TaGno0bQurqAEzn6qR0YrPJXHddh70dlRjXJms/YUxS4eEMCBAnCsZsTJ3I7LnJrtAFL3jncNR04WPGu6sx3JHel8vq8HwprtVfNQ8SjfLJlIDmP4PbYHQGSQj98Ckn0faUc/dDdcQaNM0CNeMuk6o6+cYsE/CKog+wIoXK1/PRH9lP+KAC/HYvwyM2zJybBEGcuEjkKz24YNatQapQGLxpYpneOwARK+YuJptICVDlMHwQDFkgscJqto5f5f4slcC7iUJQ0Wzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baWiMNVMHzAcX7ZkZ490QmBsJtiNe0YpFNxwyQN3yQQ=;
 b=IvBXpSu/uZ3dWYyIdGMZCm8qYFXesFnPKoB2udDEiWR07iH5QDTJdAPVWQUbeiL4+7lqqiyyFQlaCQ2ee9s5H1XpwvL+kz+4VsqMKIzYR5ThAPJRp3U1zDEpZnUFnRSk4AN4H7vxqTdBBTWxigFjdkNYz3tau7TzmkGTGsGAHz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:05:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:05:11 +0000
Message-ID: <154cf3d4-bbed-4875-9a29-56878c3b55f2@cherry.de>
Date: Mon, 15 Dec 2025 11:04:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 2/4] mesa: enable virtio and gfxstream Vulkan
 drivers
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251213031200.2619204-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251213031200.2619204-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:802:2::40) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fca8ab-3d60-42aa-d566-08de3bc16f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nk5BS25yeUtjYk5oMGdiMnRtOG9hUi9YVG1sbG43cjdEVDdnMDJxb2tTQlc0?=
 =?utf-8?B?M3U0Vy80YVIwRm5XOFlmVjJMbWtaeUx0MGRXQ2R1SGIwRVJoVDhiZTQ2K0ZL?=
 =?utf-8?B?MDY5c3kxUy9rRFRHSlp0aUJCcGFGVmJuN2FjU2JtNHpnQms3dEwwRi8zdkV4?=
 =?utf-8?B?V08xNzRSSVJKY0prWjRnTHI3MXNYTzkrVXNzM2MvbW4wWjU5bWFBc0E3WTc2?=
 =?utf-8?B?TVlHWUFqelBUNVRmWlFlOE9DVVhYM1pQbzNtS2lvS29DQ0c2MkNwbGRSem1Y?=
 =?utf-8?B?aFJBOWJTUDJlVDV6SjJFL2FpUVlZanFuVG5qK3hzYTJXK3FFSmxnVkcvNHMy?=
 =?utf-8?B?TEhZbGF4RlpQZHhneEx5a0Uvd3Rhb3czM0wzNzdoRDZBS3hTZ0FLUmx0c2l6?=
 =?utf-8?B?UTZ6UUFzWTdHOWhFUVhnMXJPSDBNMDZOb0xoaVlYaDFJNlZmSk4yZERyTi8v?=
 =?utf-8?B?WHZ4azZpdHRSSzBwb0hPRER5TFNRZmhvbTk2V2NSZHA1dGdaSGZPcG1taVpP?=
 =?utf-8?B?SmxzMzVhUE8rY0UxanlmQ2V0WmFwOUJORnFEZHp5SThYZVE1b3RIOU1DNm8x?=
 =?utf-8?B?NE5IdTNuOER0ZCtvMEF2dGgvWkdqdmlrNDRGRVJWYi9GRnpucFVXMXczV1dS?=
 =?utf-8?B?ZVluNk9yYlVPWTFKM0dvcGZLM3JsUW5RNXUzRkxhSUlWNER3WVFZSGlZMG5w?=
 =?utf-8?B?SkVtQ250M1h5bkRsYU5JUGlMdW5ORW95M0pDTGNGaVNvTms2RVo4ekVRMHFx?=
 =?utf-8?B?UHY4SmdaMElFbnZWS3QzOWJLR0w5UUpUSDNKMFJDNXU0WUY4anlNaVdGa011?=
 =?utf-8?B?UkdvWklZV1dTOVJ5NDBoZnlaZStVR1lGT0FHZFJ6Wi84WmRjK3lQWjhjTkVG?=
 =?utf-8?B?N2RkNVp6SUxadUFhdDVYNGN6VjVGbG40d1JONFJKcjhLbjlBa1hhOTNMZzlT?=
 =?utf-8?B?aEx0S2Jkdjg3RlUwckVVb0J6NTduUkhpLzdEdEc5a1QvSUMvbElrd2RhRDhP?=
 =?utf-8?B?Wmh0eTd5M3phckVqeHVDbkFEb0cwL2RDQUk3NXRBeStrNWRQeXZOZDFEbjF5?=
 =?utf-8?B?cGRTT1RLMUJtQ1QyY1cxWFNpdEorYzdrVGltdDIvYzdnUTk3cm5nSDlRbm5G?=
 =?utf-8?B?MCtCNWJWaGtJT2RnMW1GNjRrcmZrYUdCRkZUZmsvWU9VTTQwYjZhT1VXelRF?=
 =?utf-8?B?bXZqdXRXcnRKVnVveHVxem9nNDJhUnlFSUhRRW5XdWhRYW5XQU9EZG9RME1E?=
 =?utf-8?B?RERNMnBDV093b09EN3ZZZm56cm55YlhyTHVneWQyWUlzQzgvVnkrUUdiQW1a?=
 =?utf-8?B?QVFZemt1OXBUeUpEQnp3YnBKQ0NabFA5bDZpZ3FUQjhPR1dlUDFrODEwOER2?=
 =?utf-8?B?U2hCUWpXUjJ5SkNuSENGeEtJTHpYQ0dUNkl5RWY5VWpKY1laTTJBaTh0WDgy?=
 =?utf-8?B?OVE2Z2djWGNhQXBLSDROY3RraEZMbFVOUnE1bmFraG5EUjJBZE82YmRQUHZK?=
 =?utf-8?B?T2tRQnVSSTQ0ZTVIaTBkS2pJcmd5cTE3bHdJaFJLLzVKdTdzd3hMUWdHb1B0?=
 =?utf-8?B?MjNXVUxVYkRNcEJVcnRvSVYrcTVkVkpLb3A5T0FxM3hPL2huaTRWUkV2RFEw?=
 =?utf-8?B?YlFmMnRFRWQvZ0VUU01zZWU4UFl0VXQzREZQSkQzcVBrREhUQzRITkcwaDJK?=
 =?utf-8?B?aEtzZ1YzNjIzS1c0OE4xbjdzcEpzTzhTVm1GdkRhWHc5dDgvYlNueG5pOEZw?=
 =?utf-8?B?aklxeHM1Y2tEbkRUWnhJbGQvVXA2elB4VTN0VHBRanZFNGVTbjRHZHQzVFVw?=
 =?utf-8?B?T1lYblJXM044SHk5Z0dZTnhPbWUvSkZscDg4NDUyL3o1VlBwRnVqdVNBTmgr?=
 =?utf-8?B?Z1J6WS93bXhsbzhVVFJzOTZFdGFKRk1vWGxIRVZOdFdpNjQzL1l6TmZwbTdT?=
 =?utf-8?Q?gy511wS95WZPn+NlCpSGVm8+LlEZOHiD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckZNM1dzWkc3VVQvRmk2cnFjM3dEVmpDR01US3U5NG9PT2dVc21xdjBWbHE0?=
 =?utf-8?B?bld3TTk4aVlLZno4dnNjdUZNVzlna0VXR2J2bnpSZDUxelFad1ZzL1dOODhW?=
 =?utf-8?B?VzdqMjRNSjk2elVYRHp5bGJOSGlYbC94MDZmK0hhUkJWR21xZjhYYWQ3NEE1?=
 =?utf-8?B?YW5EZ2MyT2pBamtCSm5ydzl1QnlBcXlNdUpRVjBaOXRVZHRmNnQ2dGgySmpI?=
 =?utf-8?B?SkVDOTJCSXVtZGVvNDA0R3JrcE5Qd05pMnlLeE1YQThVUDZBSDhQZVNtS01u?=
 =?utf-8?B?NlUyaGt0a29WeEdDNDJNbnlpOUhRNmVSdHVCdm83L0tyMmZ3SllJNktaa3g3?=
 =?utf-8?B?eTRKMm1VZUdpd3NYZUhycVVNeTBycGxseXM1d1NKVHQ0elRBUzNJdlpsV2cx?=
 =?utf-8?B?Y2Y0RnJNUG9mZEtUQ0laaGt1NVZsSkdHSitiMmdFbFFWVzdHcXBONGtwYmtx?=
 =?utf-8?B?UExPRTUyNXRKQUp3MWpBaXhTU0kzU2N2cGROMTVuWXNWOXVTT24zOFRDT3NH?=
 =?utf-8?B?MnN5MnM0cG5JdVFydzA1U21iWlNURHMzVUo4OUdmOEp1ejRQK1hnbDZTZThr?=
 =?utf-8?B?STdNaEk2UzRXODFqRThGcTNYWWVHVTNWZ1ZRMjVMNXh3eVUxTkUzaGdvcFl6?=
 =?utf-8?B?NzlkVTUvTzl5SWRaY1dFTE9pRUNtZ1RBTURzalN1YlRnTno1dENpWU9KUy8x?=
 =?utf-8?B?RGVHUEVQNEJ1QmlmUG1ZcDJXZFdNSVBoZEF4a0NsRE1rWTJXZUY0NDBDdndX?=
 =?utf-8?B?VUxGMDVxT1BxemhWSTFnd2lUMENRZWtrVlltYmk2aHdIczZWVS9wZ1pjcEJL?=
 =?utf-8?B?a2VvZm4rZ2taMnBLSjZ6TVZGeDZmcGpxMksrUHBoQXFqcm1XUFBRRnVoYnJE?=
 =?utf-8?B?TmxQR1gvb3EyNDZnM0g3bDdPVmp6TmV1b1NGbWdmR2l2NWEzdkxWTEhtSzBB?=
 =?utf-8?B?YXFMcFV5VzUyY1hLTDRPcUNEMm5mYWtZTWRieWQ5c2RISjBDNmc3YWdDWnBC?=
 =?utf-8?B?V2xhTndYM1pmbHBRMzc3ZFh0c0hRR1ZpYXRCcHFMS0NjWWhESmNMYzY0VjB5?=
 =?utf-8?B?NXhnT24yTUZUVk1xaWd6RDNQTHdHQ0c5c3dZQkxIS2t3bEVSRHc3MlJlSWVM?=
 =?utf-8?B?U1YwSjRNRnphZVhtN0VuMEVmdDdiRXgrOGlwaVJIMG5NR1dmZmNlYTdhQlh1?=
 =?utf-8?B?dm0vSUc3MUExWC9RSnAzcW1hSTUzVkplUVZHT01mdHVlYStoL3NoeE9RZG1V?=
 =?utf-8?B?TjAvNE16bVRkckJYd3padXZ2RTZ4RTN2ZnlpckcwZmpiU3I4bEJPN2YvZGo1?=
 =?utf-8?B?NnZOSVRhRUdwazJQajYwTGhqeEpUaHl6R1c5M3gyWE1ySnZKNVBURnVsQ0h4?=
 =?utf-8?B?NlFPdHdoMEkyWk5iMW9xYWRURmpFaFlrVzNodTdGZDlNMlJEZEprSDlEb1VN?=
 =?utf-8?B?cEtIV0VRS3VsMmlaWmpNOFJPbW13WUN4bXArSld2UlZQZVhzRHNnMEIwUGIy?=
 =?utf-8?B?UzZ4OUJmYjFlZzJ5TnNaTVRoSnppbFlKME5YYm9uNTd6aktHRC9qcnpia0Rp?=
 =?utf-8?B?T1Q3ZXVkdTk5dFFOQjl6d0FyRW5LZG5PUTVpcCtIbFNTNThwbTI0dnh4eEdD?=
 =?utf-8?B?aHMram91TGY3S0tZOGMweWJaSHdSaUhwVFBBOEFOL3lHT3ZhS01TeHhYeFJo?=
 =?utf-8?B?Ny9kU1ZqQW54dURLTVUvdkdQcm10TXlOcE4xaERPeVduU2FTdnE4MkRpUmds?=
 =?utf-8?B?ZHp5VGFkT0NiMmkyZ2lPd3loS2NHRml2elM3TE5jdzIvSUJLalo5T3ZCaHRK?=
 =?utf-8?B?ejRIcWc0NWJtVlpLVU04R0RHZ2EyUVd5WkNzV1pCSWM4NnBYSDlVeFVZYzEy?=
 =?utf-8?B?b2M0N0REZzBVWFNKU0JMOFVoVGRmZmxSRW9aZ3o0S0tmWFpFK250SzlHRGtZ?=
 =?utf-8?B?d1hRSzEvbjc0cXEwcWZ1OEFMMkNneGU5eVdoWkFQRFQwSlluRzR4TG5zQWN3?=
 =?utf-8?B?ZEtmajliNjcrRDAzTUtwZzcxSFJ6OFpzdGZLOVdsZEFWeEZkUVE2a0VtazF6?=
 =?utf-8?B?TlJkMXFraXFLNUxqZTJKMzJNckROQ1ZGTXRBdVNaUUVwVndRQlVGbE1MaEg5?=
 =?utf-8?B?N0QxMDBvR1FlOEk2bHRPV1JMVXBGY0xqNmR5cmk4c0l4Q1M2RUdLTnB2Rm1i?=
 =?utf-8?Q?Hy9iROWAaqLwdsIOg8SNkxI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fca8ab-3d60-42aa-d566-08de3bc16f4b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 10:05:11.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJwWHXWwHtaGgvSA1jLM4vW9Uejf/aNRazeMFhhnG9jGu8qz16g4b4rna0hIOW/MPEX4Tx9PS08lfAennKMflWhq3MKAP7vaxyZjCHfzFug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227712

Hi Dmitry,

On 12/13/25 4:11 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Enable two more virtual drivers: gfxstream and virtio. Replace the
> 'virgl' PACKAGECONFIG with 'virtio' which now governs all virtual
> drivers.
> 

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

