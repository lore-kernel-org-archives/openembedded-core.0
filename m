Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F1ECCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 08:58:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.42])
 by mx.groups.io with SMTP id smtpd.web10.15711.1761209882276369891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 01:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ip/V3z0L;
 spf=pass (domain: cherry.de, ip: 52.101.69.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVct/R2BvYiHCTILU0X0zK2E51CkDxvcwriCUb8baxh5b7Dl32EaiWKl35purppErcbIpQICZxP3AJ+SDx8XEfAeYqiF8RynWmhSs+OnXLXrgu7o/Gk8HrOE6kxfN1eVkOphEgbtiUgw0cvV2h0Mx4eITGfKIvtdQ119d3OtE14t9UVEobOyNI5ojW+EvWJXc1CmhWhaTl0N4u6d7XdyXCzi61bPNk72gdbQ59XG1ZUd/GuIv9HarL+0F8NlTnQC302fAuPGnN/1C5KNNoH/Y6/0G0SqglUu1qnBDqsGbh/jWETewXFKQmLLtzcbUuYPV1RnYDv14jKBkPXuo7jRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix92Ms84sBkspxYtp44sywnVkXp2Czdf9/tW4J2tg3g=;
 b=Dxc4vW7nghMpEkTUhvJZg48zU9is81JFmp24gjj11kyysmsF2K9HzG7K8b82yW//v4fu4PATz+ZBDiADbKHUoTCCSLmkMcVuUGt18eFI2P1iUQ4nDt44dhi7s8QdfVgXCMrdCHDCy0MsFMc7GTHTExeU8A3uFQD6NlRqxv7fbPoOxuav1mBe3zGEhVhzywH0wu7klGp6HMN+zSK9E6sf4wUt9TrDZGeIqIJ2+Fp/kPGnAIjv6yi0zx541Zj46PgRj5/36eu3WIuCzS+T3Gxel9qGLJem5JKxFlAESq93aj/s/i8jUUC6Xdmw2RvhIUVxQd4Ge2rdP8PRTdgARFPmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix92Ms84sBkspxYtp44sywnVkXp2Czdf9/tW4J2tg3g=;
 b=Ip/V3z0LNpBwnw/7R9x1zXSCI4UbRHae8er+enudnZ7akUmdDE5kDOf2AulnMR/no5ufjB12TCoSYGIB2nkL5GxUUKDYXD6pgYzBhMeCYHTT2l/QSsPwq7CZ5KSfIR6bH/AK4ADKOieyK+kyedtkIZ9gjGMQN2g0Iswc5j/AIbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 08:57:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:57:56 +0000
Message-ID: <4ee61501-6bd8-402d-96e0-411b7fb6b618@cherry.de>
Date: Thu, 23 Oct 2025 10:57:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
To: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
 <20251023020636.2817-2-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251023020636.2817-2-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7678a9-e62e-4e3c-172b-08de1212421c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NnprRE9acFhHRDRRTjlzdTJTODBYRGhjN3ppM2VScGJYaHNEZlQwWUx3SElp?=
 =?utf-8?B?WndvcitkUkRNa3hhanZjemM2WGxSbzlQeDRSMndxUUxndTlGaWdBQ1poZnhw?=
 =?utf-8?B?MExybUI1MVpEY3ArS0ZuNGF5YlNiRWRVc2N5eUpoeGpuNXpKbkljTjFydndH?=
 =?utf-8?B?VnhpQmNrKytyYUZkZXZCdGtDVzNIL2F5UGdsaUVwRGpFQ1J1TnhrblphNit0?=
 =?utf-8?B?NGZ1R0d1WVkrTDZybS9lelZvUUhUSTVRYzhEQnNBcVNWejhVM3VvTXA4V29L?=
 =?utf-8?B?enFtWlVJbkR3RnExbWxScm9vZlFMKzFFREdCV0hSZ0QrVHFHQWxHRlh4ZnFL?=
 =?utf-8?B?VkRGNUVMRFc5RWVSbTFQUmVlZXV2QmMxK0pxYlZQdlVOMzRVOGFGaGhHZnVv?=
 =?utf-8?B?S3d6NlpHL0paeC9ZOHMwdk5jS2tIMTVhd0VtUHVuYkhLWTlkV2w5eW9TdEdk?=
 =?utf-8?B?a0RCZDRhY1VIMjdISStEQmR1dVVXbGw4L0IxME01VHVzbC9kaFovY0VHZVRG?=
 =?utf-8?B?dEE4SjcvVGw2UW1oSVRFZGhDUGUvaTNPdERtMmttNmtCSSsvVmNKNFE1bWJD?=
 =?utf-8?B?TUZLNktaOUwrUmZFSmdIeW11d01iaHEweVZESXZJWFdRY0cxbWE0UVVkbUx2?=
 =?utf-8?B?RllydHJqWERad2drRU5OV0xVSkM1b0ZPY2xvMlh0TmEvQWJocFpwM3o1djVH?=
 =?utf-8?B?Sm9helQrYUQ1YUtnSGlIWEZGTGREZkVUZkFJWHZhYVQybmVkWGdhVzhjME9B?=
 =?utf-8?B?bXBqUU0vQXpsQ2FZYzVDeWEvMlNYRWhVT2lOVFhVYUpXY1BLNTBDQ29pcWZ2?=
 =?utf-8?B?M3J6UGZRQnF4cTdwWHRyZ1BnL1EzVXpHNVNhN2RQMnN2RTQrbjM4MFNITnY5?=
 =?utf-8?B?WExJSUZpTDRlL2MyZW80V2pMakZEeDdpWXIwUys4NEF1RnZrRlc0ZUlPdjhG?=
 =?utf-8?B?SENwQjcrRjJtTTdHdkJya0I4bFJobmp5VGNpeUdyWXYzWUlIMEpRTTdxTVNv?=
 =?utf-8?B?ZWU3ZmNLVFBONFZlSkVxWkRRbVlTYmljMGhpWU5LQk5tckQrR1RZK0R2akR1?=
 =?utf-8?B?WkdkckorZnUxajNsZ0VNSm1lMzVXV09pODZKLzlvbGRJeHNKY3N4QXk2ZzNm?=
 =?utf-8?B?MndGamR6QkFCYzZnZnZpNUpHR1ZmUy9qeW1tYkJleWNqWWxvNFVLcCs1Qm1R?=
 =?utf-8?B?K3ZTTzNxSU5rQ0kyNVZEV2hTbzg1MExlZTcvN3REUUE1dlltNG9USmFqa3Rm?=
 =?utf-8?B?akJyTG9pMFc5SXQ3MkIvRzVYSkhvNUErUFpLWVFWdVl3RGN2TzB5aCtrcmlP?=
 =?utf-8?B?VWkyRDRxZEQvWkZVMldoWWovMVBvWkdJME8xNkFSemdKbUdkaHZmcVh5cEFs?=
 =?utf-8?B?TnR1dEVmV2JvTkFRS2hLbmpsaUV3RlhWeUVFbWRCbmg1TklhNHdreWpDa2xJ?=
 =?utf-8?B?Nk1LNTR2S2pBcHBBQU5TNEFWWUlJdldmYUs4NDdVL1ZkR3hueGw3Q1hkV0sz?=
 =?utf-8?B?ZTZSMyt5bHBuWXNScUhadW5LaGU4YjFPcW9HekgydE1DMWJvTWd4VFp4SEVD?=
 =?utf-8?B?ZmF4K0VFeWhqN2srNGhOd0pxSENQckhrYzZDSVYxUG81NzFQYUhJekQybkxr?=
 =?utf-8?B?THhMZ2tJejhrcklMTXJnM0YyZHorZHpZaWVCM085SVNFMlpsb0VaN2s4UHlW?=
 =?utf-8?B?MWVDZWZYTE5LY2YzZDVIeE5KN1dneFlkYjJtTUkzQlZGcDR6anEybEJzQlBV?=
 =?utf-8?B?a0VnWUF2QU1MaGE1NFZkdStHQzcyanI2SWJuYVdoMFhPQ1FlVHZVMHBGeFhp?=
 =?utf-8?B?L0tPczMydnFoS2JlVkkzbElGcjFvRmJMbWRoSnVPY2dwU0FscGVwZkFDLzdY?=
 =?utf-8?B?SWV2MUdwOXdDRmtsUTcwMTJTUnZCbEgwcGU4SFd0RDg4QlRRdzRaNHAvbncy?=
 =?utf-8?Q?o78C6pyWKYYX99oE2i6CLSDueNGUDIRq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2Z2NHBhK21EaFROV0d5aFYxQjNZdGZrQVk1L0phMGl2Z283eDBabGJieFBU?=
 =?utf-8?B?ZXVjdXhQZUNJeFRBZFRQZTJEZjA4ZzlHbWJ4WW1VaEZGTUozenpMdURuS1Zt?=
 =?utf-8?B?dS93SEFPUHRyWG5NRFQxR3dBNG9aZ1pUM29nZ20zdlFsVys2T25zTVlIUXlJ?=
 =?utf-8?B?MmkxRXhLRU5ObjFaRnZXTFpHZU9SZUEzVUlVS0pKOG16b2lla0Z1UVN4L1pO?=
 =?utf-8?B?ZExUb2RSZ213RUI1NlpZWjZNbEVPY25ubFcwdmlQa3RybDlhbXE3TDVpcjdt?=
 =?utf-8?B?ZnRtWHIwTjFhWE5aWDRWVnpLTjBzdFV2YXBUZjRXd2RzUXlYTkFUbWVYQ3Jp?=
 =?utf-8?B?Ukptcmpib3YvOFltWXBEdXBzVmV2VmlhVVIrZ0FjTWtjUEdMMVd5VStIWFpY?=
 =?utf-8?B?MWdlL21qZ2VaWUMyaDZlcXg1UHdnRmZGVVQ3blcvSWdnYURjcEZUdVpaWkFO?=
 =?utf-8?B?d2w4V0pWM0JQTDQ5UGhOZTRhWU55eUZSVVJ1ZFpxTXYvR3h5VXpUbzd1akdP?=
 =?utf-8?B?ZHMweStNLzI0Q0szclB0YTJUN1FkSG9yVElvaXNVWU4xUDZFeWlOaHEzVWt2?=
 =?utf-8?B?OGM5Q25kNVJUSVBySzVlMnllYktjdzhUQmlQTjNRWkJkMHpTNTFGb0xwWFFt?=
 =?utf-8?B?eUY4RzFDa3BVMnNkNnFFSGNDT0tNOEhlT1ZYdi8vTThDeEozMCtadUZVNDN4?=
 =?utf-8?B?RGRad2lCM21ySzFTa3JiWlV0YldhbjZaa2RCMExzNVdWRWp0M0dtSElrbFhi?=
 =?utf-8?B?ZTRrdVFzK3RrajBWaEllZnMzMld5aC84aG9EZnA4UUdJNG14NXBaOG1vbVZo?=
 =?utf-8?B?amFVN1dZSjI0NE4zL3o4eW9VQTV2OFdVWmVrU3lmK3I5emRZYTQ2eUE0Wkh4?=
 =?utf-8?B?cjZtTDJhZVJLMGcvby9udDdxUUVoWm1SWWFpdW0xSEhUcVBsUTBKKytRVTBT?=
 =?utf-8?B?ZXRQZjFLSmhYZVRjU3FTdkVHTDFrNHNiQzlmR2NEakRPVG1ERnN3SXhwVEY3?=
 =?utf-8?B?MGhCT3Q0Nzk2b0dxZTlCdW8zb0tsQnFxemFWS2FwQ0ZzaFRoMkVSYlN4Q3Vn?=
 =?utf-8?B?MVVXNVk2Z1ptQjdXeU1NMzF1K1JGdlZmM2o1Si9hbS9CNUViOWQrUFlScXRV?=
 =?utf-8?B?YjJZT3RZRlFXb3ptUW1nd2xmeHJPck8zWElaOWNnVUlUNlRzRTVTN1dxdS8z?=
 =?utf-8?B?YnFtdUpwUE1nN1BWdjJIYTdVZVZ6V1VmWEVZdFJybGZaYU9rbTFTU2xVeHJl?=
 =?utf-8?B?MUd5QlZGdkNjVzI5ODI0T00wMTduWnRhUG5vOWc0Wm5kVlZUeEFxSDRUUkdU?=
 =?utf-8?B?Mks2ZHJpNlJyMFhxRWFFSVlVdEdQNVMrUVFDNkZkdEphNjBEODJBSHdWTlli?=
 =?utf-8?B?eVpmZGQrUUFPWFFrMkE3U3orOEtQcmlIQjhjaFpLV1JCT3hwaUc5TE0yOGJa?=
 =?utf-8?B?OVd6Y0FwZUpDU2FPYUdlSm1SeldSampzcXFuTmJ2dkxzRGZQNzBpMDBuQ1RV?=
 =?utf-8?B?cGJCRlNldFNGVWo2NTVaek5VejcwRWZjUEE2YVpyY1J6VEYyOHBVeGtZY09G?=
 =?utf-8?B?RzBveGNYWHUzQWhqVXZXaE0xZkozbVBMQUt2YnNIdmZBczBrQUNHcExQRHNh?=
 =?utf-8?B?Y3BrWHI1RnBEZUhMNVZmMmFYZFMzTUs3aWZXeUlBQ2NQTzlJM2lRK1QvcTFm?=
 =?utf-8?B?ZS82SGN1Y2xvZXlERUpTa3lxSTRmTFhic0lmandubHRHbTd5SVRYeW1yM0hW?=
 =?utf-8?B?NzBKaWJuSEZQMnNtZ0JmajVHL0U4U0RPcm9TcG91U0hTK1lNZ2hoM1F0czNR?=
 =?utf-8?B?SEVHK3ZiSVlaQXBvT0x6a2J0Zm1kV1RCVCtyRGNlcElpR1BXUlZjcnZiMHVw?=
 =?utf-8?B?dW14a25hRS9iZTF4SURVVmg4NTRCdG5BQ1B4S2laSFFVOXUvUFlOYUNVWkta?=
 =?utf-8?B?RkFXQ2hEbXV0c0VWVXBuZXBkK2lZRlpUUy9MTk55dzV1cU10ZHdpNFlkZXpa?=
 =?utf-8?B?TkRtcWV1YkpzeVdETklpQkM3anM4ZXlGeEJnZlVtMFBHaGZKRzdoWDUySm0y?=
 =?utf-8?B?eWlxM0Rma0Y2aExVMmJTenhPb3QyQVdTSEZuWXAra01HZlQrbm4zK1NRT2xV?=
 =?utf-8?B?K3pqeSt6SmtmUFJqdUdNQzVSenU5UjJSQWp2ZWloc2lLN3dMSEE2T0VrbERs?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7678a9-e62e-4e3c-172b-08de1212421c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 08:57:56.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnHa14Ac7HSeJGZF0D8lPdOY10Tl1f89gH3saAQg5RS3hmKO+cNVkYPqqQ4MlJjLDrrGhbLzOsprtTaFjZImyBR687ny/wKF0dKQYCkLEcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 08:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225225

Hi Yiding Liu,

On 10/23/25 4:06 AM, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> After kea has been upgrade to 3.0.1,the build system changed to meson,but the config of build system is still be EXTRA_OECONF. So this commit fix it.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

