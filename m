Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0860CC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 17:10:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.web11.100.1753377005904637699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 10:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cu3bGrkA;
 spf=pass (domain: cherry.de, ip: 52.101.69.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfGFk5z9iLNaZKpuql3lLDidzR+m2eB4yuW7wXKujWnZf3w6DeAKBgEzfiOHsSUmmxQWv0Vt3DzJUqXFi269BhL9gUxHrVDomn3IK5GQ4LJ09hVadMHXJboVq1ErCzveOD3u3h3heoVkBOUHTHeVpIb/RiwGa/G319YoL1T/aNj0iAVmUrKUVCLljqiJdFs/KviNLrMTEQsSBkruUq0xdIQ+/h7C60CTr4pD/lKI5cCL9s3z9rXtcp2i/OJcrbNGGf5v1pD7dsGNyWq06D2Qd2rm7QbABOox58xR9ynepE6NtPKabqtXnRUeaNwnSdXERceKFfQ4xxMA3ECsambNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjxXBxOy6yR1CaePkp3FeVHYS5sdHCy+uPLswUdvkg0=;
 b=aU8Kl4sdXWGb+5HDDbP0ntgUmN77Ug+TqN6CqFK7wIy0zuf3lm1w/Wzq4r++uW/Yq42wTRgP2DobL8u0nR5mua1Dzx5II1YFjFstx4i/mlNOVQiwhTM2k6h9lLOn7OmAfaDUZwp5S9tuXToiyFdHCQglDmOMEe9VD0Mof3VAlT9HDHk36/eiMqSqYIAeKLxbU1PXOBzRMLHfpUqCwwMALjc5hfOJIA4aDbQLi7yR5Wr4rMrwlN5mlrg0NZqYJp3ysij5IokirTQwH4ivQqEYfjX0j/ZQlW6qK2hjLwgy2m3R6NEK8Uls0r1Mydlaa0NtDmCGIBQMmFOO6E1pA/U4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjxXBxOy6yR1CaePkp3FeVHYS5sdHCy+uPLswUdvkg0=;
 b=Cu3bGrkAgpqYIT4sWdj9DjMPFusF9pMkZu5G2lbTAaBrJOlTSKYY97TIJjCjASNqo/OCS4YVqpYGKBdiq2EI89v6mpxxblNzfVurO950TImnqboNUT82cPTODYLiXntS+t5ILbgI5vqUCARmOdU7kK4d0XYZET+EeIJGa0pYb1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10464.eurprd04.prod.outlook.com (2603:10a6:800:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 17:10:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 17:09:59 +0000
Message-ID: <d4128d48-9dda-461c-a932-d31edfe1f43c@cherry.de>
Date: Thu, 24 Jul 2025 19:09:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20250724170600.1113476-1-raj.khem@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250724170600.1113476-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:803:64::43) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10464:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d138825-d37e-4e26-7490-08ddcad4ebff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VlFxbjJZMWZZbFh2cUpocjMvM29heG0xcUF4cWk0TWRNNy9LdExEVTJCbHpy?=
 =?utf-8?B?UUUrQ0FyNmtzUG5yanlWQTF6cVFCWVFhb1ErVG1xRUR2LzIwMmp2ZTczcGJx?=
 =?utf-8?B?bnc1NjU3VUVmNWVIeGJzZGdDVEVDNTdpRFpCU3oydEhHSmtTWjZsOVJLSllU?=
 =?utf-8?B?a3BITG5YK1htbnJINkp1Z0dET2JuRHkwRGJLSUVqb2VDMllpaW1RZ0I5MmRa?=
 =?utf-8?B?Vm94VmI0VmNVTXU1TktVOVhPYzI5N1dOakpuVDR2L0FKclduYys4eWVIdjBw?=
 =?utf-8?B?emxNQ3RZcXhpRStqMHRFZ2hTTkJSb1FHVTZZTG82VTJEU3RZSzZGRVczbzlI?=
 =?utf-8?B?YVJ0cmdXMzVZb0NiMmpuS0thSUFSaWs1SHpzU0hDbkZQU1VodkZqKzNZQ2to?=
 =?utf-8?B?dTNxR2dtQzQ4UStQQlYxeWpmTVRDbEQ3Ykw3VHE2NG5DdmQrVU0xTEFxREJE?=
 =?utf-8?B?WTdhYzY2YXdCZ3c2NkhSVGZ0ZTNkV2NFVGJWSmRoN3hKMHZQWUh1a25pcVVl?=
 =?utf-8?B?d3U1MDVUbWxpbGY3NzJub0puMTN5OFV2YW81M1hVZUVNTG9WQjkycXZ4ck5a?=
 =?utf-8?B?dmpUVHJBUXZmREI5bHhsbFMrUll4eGI2eWF3OUVWdkpNUGNqeUJrb2NianFF?=
 =?utf-8?B?NlR2M2ZnRTRLdnFqQUVWMVVBZUxEUGd4eXpuZElIZHBDT3c4YndsL3NoN054?=
 =?utf-8?B?eHp2a3dpaUdMNDZpUFFYZ2dKQWR5VUR2Vml2MWpqQW83N1dhZ29QaXZqKzdQ?=
 =?utf-8?B?dG9SVnV6REEwek1seTFJc3JsZHc2L2RtekJZUTNTd2tRSEJDTE1Sdk9FcHpo?=
 =?utf-8?B?dCtaR0dib3VQTnB0T283dnppQzVaaTJCc08zMEJabVdZSjJ0cFhjV1duNk0r?=
 =?utf-8?B?eWY2Wm84K0RzSEpvMnlTbWxwYzhBbXg5MXpSQ0JaWityK2ZTY1J6SnExb2ZU?=
 =?utf-8?B?NEhGemE5ZnJNbFBHVTJiVENyc0djYnBtVUdXOUt4ZUIzTS8zbS9NQUduckps?=
 =?utf-8?B?QkJHTW5HZk1FNnJEL0YzK3BtRzVnMmJ6azJkdHZlTjZ3cWJrS3FsYisyRXZr?=
 =?utf-8?B?SjNXVkZZYUdhdXZTZkxmOTdmUUJ2NFZwV3UvazFQV0dyWEgrZEk1NmhlUE8r?=
 =?utf-8?B?YmsxOHNQaE16dEVkY3VMRExmWUhBYjk4WnVZV0hXQVozb1RCQndwOCtzUzNy?=
 =?utf-8?B?RXRPRTF6bFVLbk1xYmw3YThyN1pUTG1BdUlGd0lFNFZXVWx5UHZCOGpmUVdG?=
 =?utf-8?B?RWh5bFplcUNhbVg3bXVTYmRuQ3BXKzRTSlhLM1E1VHgrMnJuS2dsTVcwNkdE?=
 =?utf-8?B?bW5VUHl0dHRpZ1QrWVU0c0lTSXErL29WZUJiRGRCdElDektmY0JUL0xnVHFw?=
 =?utf-8?B?emZJTXNESEZVS2o2UHdJRWhGY2FPb3VPNmlEN3RHdC91YjdPbUNoVzdmbTBU?=
 =?utf-8?B?bTBwMlZMRittM2lxV1ZpNGZUZjFOTjZNME50V3VHNENGaUxiUlFrOTgxNjB1?=
 =?utf-8?B?MENRVVRtZ1ZVcnB2NHhxcncvdXRJWUxmY2RYd3c4TzNDVXJWYkJvMVd1Yzkv?=
 =?utf-8?B?S1B2R0s2ZGtQTFExc3hnQWdxWUdQMWRuMzJLWk5JbUhVK2NNRGFnSmNSK1Aw?=
 =?utf-8?B?aUFjeXRmTE0zL3gyaHFzdHg4TjRNNnlQcGczWmZORlZhSGVENHk3QTZ6Z1lE?=
 =?utf-8?B?RFU5YWxkVkFTdUpXQ2VtZTBKVytLTmdRVFNDRXNNdjlxQ0RFRWF3ZEFKS29O?=
 =?utf-8?B?Y3Nva3hTdGU3dUMra2R1L1RiODRhcFp0YWtDdVJZN3N0cmtIbUs2VDZsWjc0?=
 =?utf-8?B?aXJzNCs4QUdYU0JFSmZIdjZDNUJ3alNWdFNZWXc0M1BORm1zZHlYOHlhWmYz?=
 =?utf-8?B?NUYzU25VT2NwYkk0RUVQY3BZcmJUNDQ5dklWV1RQRmpVc1FIdi9rQURXb1ps?=
 =?utf-8?Q?/GAFlwi568Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dC9QY3pEb2x2MnVNdjZ4dTdJZll4Vkd4TkEzQjVoR3AyZVNTSFg0aTRSZXlr?=
 =?utf-8?B?UDBQcUJOSm5IMjF1U3Z0RUw0bmFrVGc5bU9vQ2lxWkxNOUdHa2p3dTZ0d3F6?=
 =?utf-8?B?SXR4RDBadnNOVUVNb0IwR2FFUVlZZXRPVVdqTFZUb2U2QVpuZ3ozM2lxdnBj?=
 =?utf-8?B?Q0l5Q2JEMG5CT0xTZCszTlhkZllBL3hnK09KQi90a1lkbHhSS2s4V05jZTY1?=
 =?utf-8?B?bWZER3A5eEthRytuNlBKNjRjVXh0SEVFSWc0ZmZsdWhaOHJrVUNRQ0h2MXBL?=
 =?utf-8?B?SVdSa2V0YklYNy9lOFl6UmZucHc2TURWUjM3ZjdDamRNY3VWVjFTUEdoTjRV?=
 =?utf-8?B?UHlRbjVKNXB3QVZMSDRHZHVyL0FhNjFMZjJSdXpDMjhVSHVuajVSS1YzT09r?=
 =?utf-8?B?ajRoZ3lUcUMvemc3SFZmWjFkQ1FOc1Z1eUVXSGlEQStFT3N5a1hoVW53VGpq?=
 =?utf-8?B?bk5nd3h6ajNvK3NsamhURjl1M3JFMU9rWVlLaGVqMGViWjR2NDhPdXFUcS80?=
 =?utf-8?B?OUpMM1NpOTUvMVZiSlNCQnFrL2VXc2lvT3dCYTU4cUVMSmpjTy82UW8zZ0ls?=
 =?utf-8?B?ZGlxV09nR3FjOUhtWUlDbWRxVncxMzZpM2RuRGRnSlJTMmIyMXY4S09JbWVC?=
 =?utf-8?B?Vjk3a080K25SK2pSNzZoUWtTZWdEamhvK3hSYUZjL1gvWlZyN0x5aWtBSXhT?=
 =?utf-8?B?YkVCM21MYTAvazkwc0U0UUQ1bHhrc0FhR05vM0Q1bXBPL08vbHhDOG5rd2M2?=
 =?utf-8?B?b0JMdjArQzVaTSthQmV2Z0Z0bVI0Y2JKVFJLSENnQ3g3VDQwV3ptNWp0eHQ5?=
 =?utf-8?B?MTR4b203dFZoeGQ0TkxSOVlySnZyZ0k1SW0zUXRpY29DSnlldnROMFFyUy9X?=
 =?utf-8?B?OWJDWUZWSmVYbE5tbU9rSE1XRDY1UVVWM2pFZ0lhZmE5NnRhdFNzcDNZY08v?=
 =?utf-8?B?OWdxWVg3bUd5VEpOT3ZnakxEVFBQSzhoMG9PMWZUVldOM296UXNVc0lwS3hj?=
 =?utf-8?B?WXkyTXJGSUNCUk5ZRXVPdENlQXFPeHVGSnNGSU9HUXRJbU42a0hsaVFPQnA3?=
 =?utf-8?B?VDlKYThxS29BSHVtZ0I4Y1dRNW1DeE45ZGFsdXFPK1pYbCthcGIxRmJkcy9u?=
 =?utf-8?B?bEZiLzJJMzFuN0FnQlJ4dmsrRjE4bWJ3aW95MFcvQ1A0S090T3pPa1pkakww?=
 =?utf-8?B?MUIzQ29jdnpHQ20wUHR6aTVOaTB6Sk9uT0dML2pmWElrTm1tYmxiRnYrY0NW?=
 =?utf-8?B?Uld0dFYrYkx2aWN6dWd4YUl1WUk0SmVJZ0ZmSkRITDdZeGlKWkZTZk16c2tC?=
 =?utf-8?B?ckpLOEkyUTRiSlE1a2twdWdoQ3pqWXAvRTJwRzBTWTZsTkJGR1VUQ01jTlVC?=
 =?utf-8?B?ZEcrSXVXczR1clhQNWpmOXJsR1FqTC8wNGQ3WFpMYzg3VzgzWmJpM1NtVXlj?=
 =?utf-8?B?Qy82TXpER0V3NEZTWjNkcGo5UWJyZkZwRkxGeVNtaDkyY080cHVRZ2ttVjA5?=
 =?utf-8?B?a2tXdy9Wc1EwN1Yya0tkREZhQzhZUUNkUCszY2VZeEVwVHl0STNVZURFQmZG?=
 =?utf-8?B?YjI4cGF3RG9BWmg1dks1U1FzVk96QXQvUlhFSUtScnRqd3ZmbmJxcWEzMHpl?=
 =?utf-8?B?eTBpZ0REUHJpcUJ4Mm90QjQwTUZFWkFlRlg0Nmw1R01CU2NyZmJ4blBmb0Y2?=
 =?utf-8?B?SUhJRHJ2NHZkU1V5VmRrcUIvWjVWSjE4eWpiZldZSHZ6dVhvNEszWGNEdGFJ?=
 =?utf-8?B?S3NBalVyTHdCK3RqRHdOZ3IzNkZjRzRhV3VHUjJCcVcveENSaXFQQUVQU1dX?=
 =?utf-8?B?dE1hQnVlWm1yYnhPKzhCbldOMG1DQkloYzlrd2p5TTBiOEgvdmlWSzZTSlRN?=
 =?utf-8?B?bExYL2VpYklmRVo5VUFPQUlFV29wUXJXQzhHZjhBbldkVDBneTlDQlU3QnVE?=
 =?utf-8?B?ZUhGVGx0ejNpNng5Q2xHaHZ2eEtRTTFCQVNyZDlESzEvV0VDTWlVTzRXN2cx?=
 =?utf-8?B?L2w1Zk4rTnNUc0k1U21CYVliLzJZL1gxNnF0Q01iV3Z0bGZPL0x2YTV5V2x0?=
 =?utf-8?B?SFJqVDFQR0VFR1hDQTVmdldHbkNqNXpkU3FMaHgrSmtoMzh3UGVSWHZtbTN5?=
 =?utf-8?B?UEc5NHlGcVEyeDZlZlpaN25PdStMZHFPcnp2Y1RnNllwR0g0TWZ4ZWZuekpi?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d138825-d37e-4e26-7490-08ddcad4ebff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 17:09:59.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HKe79oxctRZwtGi1xLSjvSc8jdARLnDVI9rXoPw9uRLhDKL2RKhfpLlNTgf2pPZn60dAtjJMX8zqa76XwoDNR2VYaySJ2ECg8+cSJRw0g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 17:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220854

Hi Khem

On 7/24/25 7:06 PM, Khem Raj wrote:
> When crypto is not in tune features then add +nocryto to
> -mcpu explicitly. This makes the behavior between clang
> and gcc match. Currently -mcpu=cortex-a72 has different
> behavior in clang and gcc in terms of what features are
> considered default. Clang enables different set of common
> features than gcc on other hand. For example clang
> enables crypto with default set but gcc
> does not, gcc recommends to disable unavailable extensions
> in -mcpu [1] explicitly. crypto is optional on cortex-a53
> and cortex-a72. This is not as common but Broadcom
> SOCs in raspberrypi3/4 have dropped crypto for cost
> reasons [2]. This results in illegal instruction
> traps [3] [4] when building components e.g. chromium,
> qtwebengine, weston etc. with clang using -mcpu=cortex-a72
> for rpi4 target.
> 
> Adding +nocrypto makes clang behave like gcc does today. We
> do have separate tune if crypto enabled cortex-a72 cores
> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> 
> They are added to default feature file since crypto extension
> is available in multiple arm architecture versions e.g. armv8,
> armv9. It is optional extension as per spec [5]
> 
> Extensions can be enabled and disabled with -mcpu using the same
> syntax as with -march, and have same effect thats why it is
> intrumented via TUNE_CCARGS_MARCH_OPTS
> 

I believe this is incorrect. TUNE_CCARGS_MARCH_OPTS applies to -march, 
not -mcpu.

If that is correct, then The whole explanation should be targeting march 
and not mcpu as we're changing march and not mcpu (though I assume they 
trickle from march to mcpu inside the toolchain).

Cheers,
Quentin

