Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499C2C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 08:37:22 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.19])
 by mx.groups.io with SMTP id smtpd.web11.7676.1753173432160345587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 01:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RYCfaKHb;
 spf=pass (domain: cherry.de, ip: 52.101.71.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exIJyEcMlnk5rXEveHmbmuzAAQg29B8CElyHSy/3UnLffM1W5fRzGI98ovHdRjSyjP0BAmy18CLhRHAsPjtij4x6zDUPfEu5/ZmDykDFir4o8FudXuqqRqzbyFVzaBPZkiQ0wzLCRvo/TkCbPti9bzbMbOis1WUD44k3KVVszRTvDszglv5MwsjB/NnlE1HxltNnSfr7jNMIONq03RRUr3HK/S1Sf3pdQC6NKOBq9KrxH1c5Wk7bRLLgorUZQYhjqsUifaYDk1Z2SD2KN0TVy8SSWqrml19Dtqq5E17LfHFhA1b6tITSiYVg2EGoyGtdx1RYI6O+6lLVJd6WG/Nchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRLqLcB39FAAXEji4KUc2DpkdICwYpUdoQsfRlNxp68=;
 b=FT4Iz1hmRF++mGWk2f0KJJ4PLc1gTCJLHos0jb0hwmYIX0SH4EbpJKieOXiN5XdJjd5Cd7qpmkN7Zko7KSxKa7+R5IF18X0AY05EG4YjVXE2a5l+r3UYj/b2p1amBOZpRuvEQJSBIp9UUZxpiLLlxdcDGhRPVe3GK6AC48rOVltdacTP6/66C0SrsEtaSI1rPGCMiV9Vb3Oy+ulqZdk8s9fq5b4lhO3ONpwAVDgV3vjrvBNGlPKM9fPAe1uN9sEnFXqkQT+ae3JjMGd0P7gkGJGh1usOxtStCzTS94f4MPiCIyyYIA4XOKnYk5JPiCNCRgs1UNeZzhdSAItsNqSQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRLqLcB39FAAXEji4KUc2DpkdICwYpUdoQsfRlNxp68=;
 b=RYCfaKHb4fEV+3gIzOZSm/HEhVu4n+9w8KBNUinNxYEbnQq64v9fnBCX4ZFBSS21qkIcpUd5cFixhvoUFuzbBmjFnXONHnHypztTragsXK7ZyLt55jJFsmU3OecCFMF2Z45KsygkKt5frXlvALBEgyFcxj67Ef9arRZrB4fI+sQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 08:37:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 08:37:08 +0000
Message-ID: <1af2a290-983e-49c5-8c43-dfc0f46bd746@cherry.de>
Date: Tue, 22 Jul 2025 10:37:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20250721165844.3092533-1-raj.khem@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250721165844.3092533-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e882e2-bd83-4891-7ee3-08ddc8faf1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0lSZnJRVlFNbzN4ZURtN2V2bDUyZVlIVFlJV0tFMkw4RnRzWWdWejNJRFV1?=
 =?utf-8?B?TnBDQmtCcFpSK0lRdE5jV3VlWUhOU01oUFhVUENuTHZUTVd5MXBDZU9pVzkw?=
 =?utf-8?B?Y3dxU2tnRGU0N3NmbDJYN0VEYVcvdVNHUmp6aFo3cVQyWGtOWWpSNllCR2lY?=
 =?utf-8?B?RGdkVlozTWdqdmo4NkFqejNjU1dSU1NTejFUd2ovem16cjBwRUw1bGg3dXFK?=
 =?utf-8?B?S24zRXZ3M3B5T21vWGpiS3dCOXp0M29RTjZSMVNvQ2R1a0dsWm53cE9PRlFM?=
 =?utf-8?B?MVNuMUFuNlVkVWphbXgwWThiU0p1VksvaURlSzRCYTBKeEFvTFhHMXRzeFlQ?=
 =?utf-8?B?REFaTEVxOW5yRjdOUldUbDZaTm5vUDh5RERHaWp3RC80UnVWU2lZRWpNYXBV?=
 =?utf-8?B?cThpZ3ptYk1oSUIrWDdPUlFjTUorZHNNTlg4eWI0OEZtUEZ0SFNpenRUczNp?=
 =?utf-8?B?UUlBbHNISXgrakZKTGRvUzJtZnQzZmwrOU5XNlVteWp0MG1MakY4OVhTUGdJ?=
 =?utf-8?B?TWdFb2V5NUVjdDFwMUpYM29pZVNrNXBtU2NjVEU3VGVDZStYY1UxY2tSNTdC?=
 =?utf-8?B?clFtVmN5SFROS2l1M0UrdmI4dnJXR2pGWnE4Ti9VMG8rVkltdFMxbEp0Nzkx?=
 =?utf-8?B?N25oZ3c1Qnd5MFhRSDRpdW9BeFNaRTlFeHFHcENLaGh4Qy85UEZIbzFKdjQr?=
 =?utf-8?B?REkzWGo4ai9jZStkNU15eFJIdGxrS2EwTXplNGFKUlpMZ3hoNWp4b1U0NUNp?=
 =?utf-8?B?U3FiWVA4dllyRG90SUtMejNKSTB6dGhuTG9POWFpaThWakd6dFluNDhxNHlF?=
 =?utf-8?B?QS9lV1NLVHduLytBaVo5V0U5TitmRTN4Nm9zQlNtTy9jMXhFZVByNTN2Nmox?=
 =?utf-8?B?UnRRVGZEVXN5VjhCNXQ2RUwxQlNyM0lWMFNpbWsvUmw0b0dwVEFObHZzNnVh?=
 =?utf-8?B?a25KTW5OMlFDbHdEL2Z0UjBITTBURGVQNTVPSEkxeUR0TE5iSS9iblUwQkF1?=
 =?utf-8?B?UURKS0pucEkxMU9tc2cvalRpbjgyRVVDRXRVckNMdE5QaFQwdjhmV2htR09r?=
 =?utf-8?B?ZlFheUVxNjE2QnR1dFNsWXB1NkkxR1NBMURFcUhzWDZsZ1o1Ujg5OXpxZlFs?=
 =?utf-8?B?WWZyVW51a0lNMWF0L2hUNERhQTNwdE9rQ2hyU3RWVGJjS2YrTWUxL1FyMEFx?=
 =?utf-8?B?U01jQ0R6OFJzc0NWRlI3SzVvMXhoOWRXSlFic1FjMXJwUzBvQTZwVGFVTFh4?=
 =?utf-8?B?VklpdmhPN1M3bUdaYzZ2ZGFvbElsQnBaQ2xnNy9ldXZ0ZmtGS0hwMFNtM2tT?=
 =?utf-8?B?QXZyZVRGWkFxWDF5R2ZlaURWWi9TeS9OQ3EvelJCMnc0TXdnUFZUVWYxMmU1?=
 =?utf-8?B?a2FpcEVSeVN3eXVNTU1kV0k0UzVwTU5lQ0dRN3FSM3pnZndiaHRsRDJ5c1NS?=
 =?utf-8?B?R0VtUkZPZ0tvS2hSR1VuVSt0SVRxVmZQWkJVeGlhQncwazNRUXNuVEJnNnlJ?=
 =?utf-8?B?ZjhMSGVFTFd3Wk1QVUlpSW16K2RNZFlHSGF2NCtlMXpaSnc0QS9kNFNVQi9n?=
 =?utf-8?B?V3BPSXlDd2tQejVmV2hMYmFoZW9OTlZubG96QzdxamlnZmFlUnJaVmpLK2F6?=
 =?utf-8?B?b3NMQm1JNUdSYkpYTXgxM1haanU0T2pSWFN4ekprblZWRWhMMjNIVDhBcjJT?=
 =?utf-8?B?eDhhTUI5NTVKUmFpWUxoeE1PSmwyK2IvQWdjOTdpaG4yNTIwTHF1c2RNdFBr?=
 =?utf-8?B?SUhaeVZNMkxERmYxdkJmbjFRdVRzVWRUTVpKeTBoeTM2WS9Ocjh2TEtyN1Jw?=
 =?utf-8?Q?nU/2FNl6/dMOq8pgoiNfbpyS4hr7JHPW5SGSo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzROdnhpNGZBYTFGR3lCRUJBbnhUMVlXQjBYd05hMitZTnBlcFh3eHQyWGMw?=
 =?utf-8?B?R1lGenhGdXpQblRiWXZjUFZVVDRQU2FEeXZRY2RJbDdmWHY5TGR0OTVyVTc1?=
 =?utf-8?B?ZjA5b2VTNU5ILzloNlpVUkhFRC9FSSsvdW1vOWRkZmF5TW5jK1lCemVvdXBl?=
 =?utf-8?B?VFdnUzZ0cDhrVFMyN3EzSmVWcXRidFBSc25meGFNZEtDUlVqWXI0WFhVMzNp?=
 =?utf-8?B?YzFSV2JFU2VIQXVhTXRyQnRUTWIyUG5SaUFOVWpBamdlb2NjSUFuOTY4UTJa?=
 =?utf-8?B?L3ZaV3ZSSXRITTh5ZlQ4dmYxL3ZWZ0RidnEvTTdXd1VLVGtiem1KYUdWTEl6?=
 =?utf-8?B?Q1BXRVFsVG5kN0lpVFhHdXFZTXB3MHk3b2Y2V1RpOURNYUhxc2Z1cmFNNzcy?=
 =?utf-8?B?UW5KSFFObkhoOEpxMW84UDNaMXhrZ2tVVCt3b1BIK2VNOFBLcC9JcEhoanZl?=
 =?utf-8?B?SGRKTG5yT1dsdWFEWnJRekFCZVBuQjB3N0lBcWxiOG1GdkhEK1B1RStXVWNR?=
 =?utf-8?B?eVhZMXVGOCtRN05MK1NPWEFFMWx0enJXVHlvZGNKVkhoOEtlb3g2VUlEODYw?=
 =?utf-8?B?aFRLaWtKMCswTlBwaEhyS1QzRUlDQjgwcVVRRlM5V1FmeEdhQzJqUVA2dm1X?=
 =?utf-8?B?ZllRaGhyN0lWWDkxUkVtbjA2clQrK3MzWVhSUlhoM3IrWE5aVzdmaWQ5STZX?=
 =?utf-8?B?WHRxQzRUVEk1TVMzenNlVGxSME9FWlZMZkZuUUNuZkttKzZtT1lXN2xSdFlS?=
 =?utf-8?B?djNpRjY5M3NoQmIvTk52VWQrUHd5cjZjc0FGWVRqL0hDSlVGSVByZWtkWEda?=
 =?utf-8?B?L2RFNGprWmt1MmtGbExJSmR1ME8xWWFJQUhLUWQ4b2h0UXhTVXEyMjdieUUv?=
 =?utf-8?B?dU9zaFN5Z1orYnltUis1OVVxVkhYTFVjQVNrYnZkK096STA3REx2eU1od3Nq?=
 =?utf-8?B?ekVTdjVQaG93eElrNWNkVzhuUFV6SWZ5YkJnb1ZoY0VRbXAySUpZSzlXS29D?=
 =?utf-8?B?U215cFUyV1BUdXR6aTlFOFJqbU5XaU9rTW43aTNYVmxQOVIxcThYREtoeUhy?=
 =?utf-8?B?NVNDQWg5aGFwUFBtK0pWZGh5aG80QTRJejc1VVI0bXphYWN2Q2pMQXY4dG5o?=
 =?utf-8?B?bE5wLzhyWlA1RTNSYUpkTlRnRVN6R1MxNnFSY0xnMlBqTEJ3M2NKRnJ4TWhr?=
 =?utf-8?B?NlI3K3ROeFdwdXV5RU5ZY2JjdTF0cWp5aG52R29JWWY0WmVWdVM3REFUek83?=
 =?utf-8?B?dGt0VHY0SmVpaGduZlNyQVlrYkxiTjhEeTgvMDBtSGpmOVFVQjA2UU1tWFB3?=
 =?utf-8?B?STB0QktvVzRSamJoKzBhNFBVL0pnd3N2SHFESXZJa0h6TFE3ZUJFd3hLZ3Bk?=
 =?utf-8?B?Wkg2V2FWS3JFcFRtcXlrR3Z5dmRkdU9ObDZVM0MzKytEOG5peXJ5ZG52K0U2?=
 =?utf-8?B?ZjBZTFpsVjFldmRHM1o3dThCbURzR3VqaDlCZjc1YlhIK2ZSK29Sb0tEQTdp?=
 =?utf-8?B?azhINTdXYnFlaG5IS2tYVFE4dzUzQzBBSWJ3VytyUUlpR1VVOFRGYVVZVFE4?=
 =?utf-8?B?QXJWS0ttbExMcjVqNFBiMnBPOXhydWhXdzB1TDRIWmcvbGVva1hOSDd1dWh1?=
 =?utf-8?B?OVB4VkJxQVZGd0tMSE5YN2dwcVJqM3NmMkppRXlpSWZsNjRPOXBaUFh4TEJF?=
 =?utf-8?B?RGIvU250azdaQ1h1Ni8zcWdLb3lWSEJXeXBzdW9IWG9zUFF2S2R1YzdqekNo?=
 =?utf-8?B?Wks0QXNxZ01jNTFKV3N5bDZtMXlSNzNFOUZjNVdQK2F3VElQYzM0OVpmMVZG?=
 =?utf-8?B?enNpay9FU2hSS2xia3hwYWlMZnMrdjEzY2k3Y1F0eHNUNS9iUjBrSk1hdDA0?=
 =?utf-8?B?bFgxaWVwak91R3dYdGtoRUZ3TzJiQ09OdDd3RmE2d0NQcVBrU3FZK0FIT2hx?=
 =?utf-8?B?OEZFalhPa3pkbW04anpZNndJZnh5TWhmenY1ZlFrVElsRTdQaWUva2x1ZEhC?=
 =?utf-8?B?QU15T1V5K2taVkY3WHUreDgwRCtOWW9XVDdjMTJOVmU1aC94U2xmZEgrMHBM?=
 =?utf-8?B?R0JhbWROZmFVRjkwMTFGZGExSDNEQ1pDdXJYdENTKzZ5ZVhMV3dTSFYyTUJU?=
 =?utf-8?B?cU1VMkQ2blpMVytZa3Ztd1d0YzFaQTRIYk1oalFWUk1nNWQ3Q29nZTU5ZkRp?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e882e2-bd83-4891-7ee3-08ddc8faf1f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:37:08.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfu5Aa6klgwIlBBqxv07sEawpNG55tcouNFspBNXbmDz3dl9Z9FRPmTBRS3nDhAUPKrLw9m8jhCz2YFFyKJ3g3l4fCUC/EhBViimwNeb6lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220728

Hi Khem,

On 7/21/25 6:58 PM, Khem Raj wrote:
> When crypto is not in tune features then add +nocryto to
> -mcpu explicitly. This makes the behavior between clang
> and gcc match. Currently -mcpu=cortex-a72 has different
> behavior in clang and gcc in terms of what features are
> considered default. Clang's philosophy to enable common
> features but maximally, gcc on other hand takes minimal.

The docs seems to be saying the opposite though?

https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2

"""
Many of the supported CPUs implement optional architectural extensions. 
Where this is so the architectural extensions are normally enabled by 
default. If implementations that lack the extension exist, then the 
extension syntax can be used to disable those extensions that have been 
omitted.
"""

> Clang therefore enables crypto with default set but gcc
> does not. crypto is optional on cortext-a53 and cortex-a72
> while, this is not as common but Broadcom SOCs in
> raspberrypi3/4 have dropped crypto for cost reasons [1]
> This results in illegal instruction traps [2] [3] when building
> components e.g. chromium, qtwebengine, weston etc
> with clang using -mcpu=cortex-a72 for rpi4 target.
> 
> Adding +nocrypto makes it behave like gcc does today. We
> do have separate tune if crypto enabled cortex-a72 cores
> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> 

Not entirely clear from the commit log why we apply this unconditionally 
to all arm cores now.

I guess it could be as simple as adding

"""
armv8-[ar] and armv8.[1-6]a have +crypto and +nocrypto support, so let's 
explicitly disable crypto whenever it isn't requested.
"""

> [1] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
> [2] https://github.com/llvm/llvm-project/issues/85699
> [3] https://github.com/llvm/llvm-project/issues/90365
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>

Looks good to me otherwise, so

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

