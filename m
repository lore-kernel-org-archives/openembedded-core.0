Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7576DC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:15 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18360.1786020132134149960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FzERkLvv;
 spf=pass (domain: cherry.de, ip: 52.101.83.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvJoXYql4Pxe82caDf8/UfHGuYuIpD31MVpuMuERSgjtygdPyVnqJfIuFPt96FJqRjIiK6Hktca6/wxauDqq1BqQtLYPG/4xqHBoWg0gX6auwz68oYft+iCkWMz+MhEBrBWX7XdcqKNtyfTL9lorWBuTnLKAQphtmL4ZEfDHAIJVxVkta3OJWEuYApQsUUFYLnqCnesNHBnR+Nvwx7/cAvb6uTubZ89PDnbmNiL+8p+7VNMtPmaf+SG43MlXIrnluEGh1Rz6GUPiqg9/hVKVjqHp4vJIb4UGDOnc+dl+UU+pUKnqE/RutgbRo6WzZD/251UAuTmKAhGBE3eWDdqcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDyTi2Tx79ICVaMYuCVLOSGd4+YQdn1vLWyOdr0CHOs=;
 b=N5zxGEoQCtiw1a84kVKsENLJIaTqNQ5ADZ/VmKPa/S97/lTcyQ3HEro4fI6uCv1/DitQ+dwAI3s5orBC8gFR4PsrCl1uAljHv7eqxH88X97nGHHLNlkhL5mhQe2ap8Pgo8MGPU8Cmg4/+GmSquOMCB6vnBhQj9I1TE7NqxBmfp38jNmPkjwHESEo2SFcb10WmQ3cX/cbDyUb2NvaUQNt7LqpEvSntJYxHXvRbC1qtZaTGvKnOoMFRYI5e5HmfcV9ACbZx6nfSJXjzMV6EYVuzI/DODBbZp8RLJbgNGJtVywMHeqjyhNdFNqjpPHHGuB/h8DiVQAnoYuvq3hGv4lHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDyTi2Tx79ICVaMYuCVLOSGd4+YQdn1vLWyOdr0CHOs=;
 b=FzERkLvvsw08lbpavMmQupxmbTAVMzthbkKWCT9PHapzw1UrbaUpmCLtzDstDiGg4IjK32EQwKvf3XBuoEDw2QHGdrn7vLB9tOR+uhmTHgOPSKtgyFgBV2ptu55T9g8fxDPXRKimbjOJSJ/sd0YFZzAbuC6wbf8/zQB8eNJ3tuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:07 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:06 +0000
Message-ID: <37264213-bd7e-4e4d-b584-3468cd946865@cherry.de>
Date: Thu, 6 Aug 2026 10:20:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: always use GCC to build
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260804114134.4028175-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260804114134.4028175-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: c152cbf5-63f4-4dc8-9869-08def3b81fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HcE3d5REiQeMuAeLMKWjwEK/bnrSbl1/Loef/qS5b0kJ+Ee1DTvw79GcVoAa9o9JFF6VcpNi08Y335Byc2R3TMIlrf9kuWFtPkzeYMzhx8Qj3+qp4hSgBnQTH6r6VE7ZnKJWIT8mSw4Gq2qcEA4qcqyYv35PSiXcwju3mOO/4FSuCBOWyaY3ex10cT0p/zkcO1kUo1o4/cx2/kBhoMepO4ZhUpXdEwFIo+OCxygtiRHmKkzVdXI/eVSR6D1Nol2fSURoKzNtM/hEjIlcpPPzrAhL4MUvWzEacH54Hzxx020nlVWFBj38n7rYIRALjMe0ijJUSgJ1LLrmvFV41vJUqkiYhP8eW2XKt/hHHfzJl53MCvwHKI1+UVpWnlmepqc/329UJDHVNFIZlT9+Qe8ahYuq74wzq0iJzj8teqAkluzoh140cwp0cvezou/PuZh8LGieDCg/zG0YQ2bVaisp5A4xUekpowZNVngAB6O+SGkpvTJ7w/ezu5j2NT5nGO8dMC92QTvWzj+5ZekUQIL/PsTZXK9+FXVRtq9RzwURhOQRgJOo61DQ2HQs7t4SpMlsAmkkuaOVKk/Mnobpgk4zlGwQJJ5NKVvWh2tXtWss8MIfbcXF8X9FB2VSU0ZDupo0pUWw1cVJ2jIHwofkWhowA89AnDgD4VuFw67wxId79LQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3hBMEtnemZ4RkRSWEVtTWxRUDdyUFR3d1J4Qy9QMUd2S0x3V3NldUhGanBr?=
 =?utf-8?B?ZHZBNm9RWEtyWTYxaFBrYmJUYTNhVGE0Q2JIRlY0bmp5bFBzZW9heVdQbWRI?=
 =?utf-8?B?RGlrYVhvR0tucVNNZDZQS2RIVTZhZWp2azNVUjRrUEYrdHhXMGo3WjlVOXFv?=
 =?utf-8?B?eFhLWDI4bXhSYlJOL1A1M0JNcnRUSC9Td044N3lxY1FEVkxyYi9qZmZXQTFE?=
 =?utf-8?B?VC8zNi9QM0RDcXR3OXVXK1pnRVp5bngyWHRGZnY0RTFqY0ZPcWxiQ0g2U2FJ?=
 =?utf-8?B?eGRrUHlpUURYNTRVQ3FHNlU2cEVkM0pUbGdlT0dzcmV1ZFc5ckVOZmNPQVpH?=
 =?utf-8?B?bVFIeVVnbVJrNGloSnFCZ3NsYTljT3VKWEI0ejU3dGNGeVFHUmlyRUoxbTc2?=
 =?utf-8?B?L0FGTEliVVM2M1diV1Y4bG5uSHF1UGVCeGQvV0ZMcjUydjRic0N3R29mcGwr?=
 =?utf-8?B?bnJlSTAzeDBMM0MwRktRSWJPbG9WQVN1TnBjTWZSbnFZMDZILytwWUNjWEEx?=
 =?utf-8?B?RW1ETHdwUlpQY1d6NG9FZEw4ckRRNTdHbVRSaTNubStFNjJleWpZcE5JVFJw?=
 =?utf-8?B?amR5UDVHd0NWZVJzbVRlRTJxUVB5MU9LaXQ1U2p6aGpoSWxYRGdGK0ZHd1lk?=
 =?utf-8?B?OC9jaTVnZGRjQnhsektjNlQyYVBGQ0IwN3FvL0dSR1FBeUlYcE4vVkx4Vzl3?=
 =?utf-8?B?dHM3cml6VlEzeWViY2tNT29JdmhONkErdjJzTU5BS2tPSXRYalp4VFFKMzQy?=
 =?utf-8?B?c0IvcEUybDBNZ3VlZnJKM09JNWptUS8yRGxDQm9hd2RKY05Vbjd0S1AwZ29j?=
 =?utf-8?B?czFVcW4wNy9yU1Vaem42WE84Rk1zSjRBd0JSM2loenZCVm0vMVovQ2pMTGlr?=
 =?utf-8?B?YVRKRm9teUhzUFJTZVBnK0laVGZqSlJBcUlxZitmeUc0aTErYUk3enpyWTJz?=
 =?utf-8?B?NUM2c090cmVuWVdHL05Qa1NRWnhuVUJGcXBENlNYMnBCeUFicUo3eExvU2Nv?=
 =?utf-8?B?eWxiZW9FS1lsMTI1cHhXN0kranlMM2hvUU1JZGZybnRFNEhNVSt3bXVZWVUw?=
 =?utf-8?B?NFhsSkhYOHM2VGp3U1RwdjdVYnhFc2Q4RjNQZDNqa3pnWHBQZE1KQlpGUjhB?=
 =?utf-8?B?NGN1OWJWSTNQNGZWdG1IL0N5Qjk5UFcxK2duZVZZbm1zMGU4Sk5ub2hKcTRl?=
 =?utf-8?B?cnI0OTNjL3FwSmUzVTJUVmV4TXA5UG94Y2RTSWI4ZWtGN1BuZ29NRERodURZ?=
 =?utf-8?B?Nk44WkFBQXo3SXFNeThRanlORTBQc3pVMHdTbW5NaGduSVluNkk4eWthM1pU?=
 =?utf-8?B?MmEvNTNWVTdoUDlDaTR3QmdYUXlZK0ZFUXAwUjJSOVk5UFJSb24zV25QZHRm?=
 =?utf-8?B?cEptWHM3VDUyRjY0MnBNV2JwbXpFUnRZYkNvbnhKOHcwV3VKbFMremVTYlNH?=
 =?utf-8?B?dkF0Rll3QTBDb3Z4U3V5UzExZHA3QmdaR2ViNkdKdU5JRFNURnhmM2FQbFln?=
 =?utf-8?B?R3JOb1ZOdnA4Z0VSMXhFZFI4V2RKRktHaUZjT3pHVStoTXZHZlFidHpTMjRa?=
 =?utf-8?B?d3RSRWNlTmIyb0JRZ0VrbTBGellvV1BRRmdtQUNBRXh5VlRkVkxneDUvczRN?=
 =?utf-8?B?V1R4Y0FzY1pSUHdHTENrVzcxUWh1VlhReW5pbklBNFdMSkVuZjM0Z2tpVGtT?=
 =?utf-8?B?Ym9FMFNOaGlUcWEyWWEwVWJnck8vTjNFbk9FdGIwaTNWMFBscUhocGUxTGZ4?=
 =?utf-8?B?V0FhUHhaSGRGWkZFZHVJNTMvSisxMkJIMnpaNDJJSVJEWVFJU3RIUmErMjli?=
 =?utf-8?B?Zjl5WXRoTFBVdk9QNW1uZ3IyRFUxaVBNcWxXVjRNZXpRZWhIdUhLSGN3WlFJ?=
 =?utf-8?B?NU9hY1djREpqYnBCUThTanY5Y0liTDA3a2NKWWEzSjQyQkFuRXUwLzEzL2NG?=
 =?utf-8?B?cU14T0tXMTZKTlJqaWpSNWRvUWoyL09NTGtVaWN3cFFMODNLdkpCcnF6enFZ?=
 =?utf-8?B?LzdjQ3JHTXoybGhHNnlFeFBqLzBZbnJmdUtOVE9wNC9OOG9lVVBWeGYvYmIz?=
 =?utf-8?B?bDdhZGFlK2lScno1OXF3a3JDb3kxUjk5Um43aFRNRXJFQ2FkSGt3NEtFNkhV?=
 =?utf-8?B?L3V2OUphYzFLNlJocXB6ZFBlb1o4MkxHVmJYUTY5RWd1VmV0V21YL1ZQbXRh?=
 =?utf-8?B?UlEyd0tLOS9xL0V4enBwZndaS21QNHQxWjZVQmM0UlVCczRMZTQyTzZWTGpG?=
 =?utf-8?B?VGRJaUl6N2hWMEFKNGZ1UU1WVGVyWUZKTlFuVGlBZFhCelIzRTAwN05KaG80?=
 =?utf-8?B?UXphYldEbFZoN0JnYXprbklDWTd2VFRDTkJtNnZYMXhOTjdaTHdkMmxDSENp?=
 =?utf-8?Q?cV7ke7Y6iulOin8EzeqVAFy2Rukq9Io/qz9gUcZEP414n?=
X-MS-Exchange-AntiSpam-MessageData-1: PDKfB2r+xptz07E7e4WOihNnZv7cl4XEgNU=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c152cbf5-63f4-4dc8-9869-08def3b81fc9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:06.7667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOs0j6jXT6OqtLW8tpkrlQEH0wngNx4XlNE0FoE72uj5rjdACZDcGW0z3brLsnsdDgB15SXnLH1xSOFTcEFr3hDYe3s/Yp+LxysbKlot62U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242940

Hi Ross,

On 8/4/26 1:41 PM, Ross Burton via lists.openembedded.org wrote:
> Previously, u-boot was almost always built with GCC because the
> kernel-arch inherit set TOOLCHAIN to KERNEL_TOOLCHAIN, which defaulted
> to 'gcc'.
> 
> However, since kernel-arch inherit was removed, u-boot in theory now
> respects the default toolchain. In practise, the recipe hard-codes CC
> to be gcc, and there are known caveats building u-boot with clang[2].
> 
> In the long term we should be able to make this recipe respect TOOLCHAIN,
> as the upstream u-boot CI does build and test with clang, but for now
> fix the build by restoring the explicit use of gcc.
> 

You don't say what is the issue we encounter when building this recipe 
with clang so this can be summed up to "fix issue" which isn't 
particularly helpful :) Could you consider providing a bit more info 
about build breakage in the commit log? I've built semi-recently (a few 
months ago) Rockchip (ARM and ARM64) devices with clang and couldn't 
build any of the ARM (thus 32b) SoCs at that time. I am traveling right 
now so cannot give you a link to the U-Boot ML archive but look for 
"Couple of clang warnings for Rockchip boards" from April 22nd, 2026.

Cheers,
Quentin

