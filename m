Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D46C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:59:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.30])
 by mx.groups.io with SMTP id smtpd.web11.56946.1722261590928188209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FOfJOPyw;
 spf=pass (domain: cherry.de, ip: 52.101.69.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8E1wVq+ifzkfCesoA/OGpW8+Qke2tda8xw/JiiqtXtBhAUh1TO1ZSncpwDckZmkW+eaVWHNjci3TAI+hToHA2CE0sOuX8ndwTJ4qYgrH0al6UVARE7yWBtM50J/CgEY1O6votrCcgrK0uikFlGm2JHLIwnQd5oZ92wXFzKe4fNagkr822D95okZmF29yYCX8W0C0lTsfrZMpBPBzLobcKnesnean++tHi4yUYg0sRFLAEv99McSL33umqAdCKn/Y/PNnMz/XSQWN5H3K8p/9i3Rscb0wlW9kxAxEpJy6/SfLCNazhTYZ/x/LHZ7tG2Gv1F2CcuFKAenwxMMYeLhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU+PROEvlZUUklbBwrSB2UAvpiLplHulV3iWEhlvO74=;
 b=xgXi2Ue0HH/EioRevXHZu3H93iTDhGvKMmp/1d+brM0TIaIPUSUh4dpzI3W1q2fiOL1onGAw07E7FYrZXI6ITgOV/8CqcS1VQ2sDecuVSuGcWe9U2FtuIpBwpeK9CmBD3il3UQ/AHICZ3OQJbD+wt0V7eoTGpwuV0+THpxsf6i2sQK4OS/oMobNqKPMUXyuOJh7JaztRyGpdg8a92OhDhNAZQ49ulzdRRVVlXPa7IFeeQBSACiQlppow4k+jKIml5pjiS49ziHmQ4WbpUbJOEXf3nmj0u0mMVNq8UfQU3DsHC9oBjVj0EeaIUSfEhEIsoclgJACmBW8yTrYiRZmLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU+PROEvlZUUklbBwrSB2UAvpiLplHulV3iWEhlvO74=;
 b=FOfJOPywQiSKIxk9o+UW/inetevWp4GxbTIsLJQH2119QvEaDJpoxsqai42nZDPeWnLcnr7qyLvvEuDQg8yupIPkM5xwDO7ggdEyytwcNLnhRuyayqEzTqSp4RPQpReE1l0EYNCPG6Vp9NUrzhrqtv1aiNFuh+B80ESXrPPOma0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 13:59:47 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.7784.020; Mon, 29 Jul 2024
 13:59:47 +0000
Message-ID: <f93e5b15-e469-459b-bd17-3e5fcb8d8102@cherry.de>
Date: Mon, 29 Jul 2024 15:59:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to contribute in meta-lts-mixins layer?
To: ranjitsinh.rathod@kpit.com,
 "Openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "alex@linutronix.de" <alex@linutronix.de>,
 Scott Murray <scott.murray@konsulko.com>
References: <MA0PR01MB91744DCAA3A1F5313FF521138FB72@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <MA0PR01MB91744DCAA3A1F5313FF521138FB72@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0335.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::28) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS8PR04MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: db223121-d4fd-458c-0ae9-08dcafd6b4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUlKWUt3dXp2ejE1Ny90RzNiUWJDcDdGUUNvTWp5MFBCSHJ4MWlFTkE3aGZH?=
 =?utf-8?B?MUlla0JqL2JQQVJpaWYzRWlFNi9qUWMzbFlTTndJVk1UMytJbm9Bc3hSS3Rw?=
 =?utf-8?B?dkJHUTBhNTF2ZWFxYTBPaFZYUmg3cDZValRFSG5LUzBWeTdqT3Rjck5Mb1Nt?=
 =?utf-8?B?ZGh3Nk4xTkdaN0ZaUlV4c2JoM0JxZ2ExRi83ZVRBQXVVVDRSZHZ2ZVJRc3Y2?=
 =?utf-8?B?VHQ2dytrQW5HYjBENHZKV3lwUExhL1NSNm9nSStaZlJDSkc4SGFkRFhhU01m?=
 =?utf-8?B?OWVUSDQxbGNQZWlPRnlGZUpOQVZBUWJlWXE3blo0TmdhdCtVSkExbzI5TmJt?=
 =?utf-8?B?K0dvZ2JOSityMGt1bjV4eDVOTThYemxxZVRJRnQwVGRhczBPSFFWN1JhY1dG?=
 =?utf-8?B?UG1PVjZxbDlkbWhkeU1EKzRZY3pGTStjUEJMK09kZEhGQk51eUw5RWMvNU5Z?=
 =?utf-8?B?T2FpbEwvbjZvVUhuMStZdCtralQxd2xKYTY5ZDJENFNWVVFKdDJEQzVMYmRG?=
 =?utf-8?B?dXRqajZGMitxZjlTd3BXRjFDSk40Sk9BZi9hak02TW9jdVdGWHpJR052SkFR?=
 =?utf-8?B?WkFYalFyQlRXSG9xaDA0cC9HdkJKTDhobzFIRXc5cjdwUGZpTEpIUXBZWnZz?=
 =?utf-8?B?aXhXdnFldFhUZTFOUUpqbE8rU3NMbWxlS1I5eXh5WTQzQ3hkbjZ4M1FJUVdJ?=
 =?utf-8?B?UjJUZHRpNkZpS2c4emUrait1M0Y2Y3dRRFBkc3NEVzU0RUl5aGMxQWRySXli?=
 =?utf-8?B?NTNLQWhUMkhNLzFHMU1sRWpaK1ZUbnEzdXZXZVlOTVhiRDRFbENJZTkzNjFO?=
 =?utf-8?B?Y1Z5SlRBMW1yMHNSeEh3S2UwZi9wNVpRWVV0YnJhdkFmR3ltRm9hNHBvZElQ?=
 =?utf-8?B?ajlqdDcyQVlFUERlbmFIZzJKL3VNTE1IdEw4cDhkV3ZuWmdvTi9jWDZPR2Nz?=
 =?utf-8?B?eTJhSTR6Uk15OXk4eWpKVExyYWxLTmgrc1VxcUNoK0htYXpMT3dQcGpnZlJh?=
 =?utf-8?B?WnlqNjRzdlBNYkxuYlp1d0dHVUNNZkFoM0lOd2Y0QVBWMkJjWEFDaDlTcW1F?=
 =?utf-8?B?T2RaYkJYWkZTd3B6QUlVNWkrdnlDbXBIUDJNNnRiL1ZhMXN6T0dJTzdnUTlo?=
 =?utf-8?B?V29ON1dyWm16WTVjMy9yV2wwZUJLUnhjMmUrYnlxanN1R1YyUHBBTFlacnhT?=
 =?utf-8?B?cFNxOU10RHpVVVp2QjE1cjF0WXJHdjhRdDdiaWkyWW1UTHpYb0k2a3lhN1NH?=
 =?utf-8?B?Ym03akFMdjB3MjNOd1ovbFNVNldqUU9NMHUzV2Z1V0NaekZYeHgrUjB2Q1ly?=
 =?utf-8?B?U3hrejUwSEo3M2lEaXNPU2ZIOXMyeFJRL1llTzZPYXdSOWNDNVlxK2EvV2lG?=
 =?utf-8?B?T0psRk5Ob01EYUlLSEpMd2hReTZoVzFEaVBhaXQ3Q0dRN0dIdG1jYXhodkI0?=
 =?utf-8?B?VE1Yd1p2aGRTUHp2REpQdTc5KzRzUkFMNURiYmd1SHN1Y2xUTnlDL3ErZGlj?=
 =?utf-8?B?NXk2a3luTHlGWkdBN1BMN2UxZ3ExZHVQUWJTNnFtZUpoeW1YcXRwejkzcTZS?=
 =?utf-8?B?cXc3Q0p2YVk1UCtaUGYrUTRha0dYZFM1UjJJTVJDUWpPNDJUb0VKK3FGcjZJ?=
 =?utf-8?B?b0tNTlpRWDJIRkN2UGtOYTEzemQreFQyRXliSFRiaDJzcU9ZeHY3aGNkSzdL?=
 =?utf-8?B?R0N2UHRhWUgza0tiNDFZYUFoNUR6OSt3SXRzUDBDcmRSTnVvdmw4OWZ1dmln?=
 =?utf-8?Q?mDIa2DUZvziy7jThpU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UW5MbjVPM1pGWGNyN3dKZDcrSGRoZ2ttNnVaTktMTU1xcWlDTkVMNmlWYytp?=
 =?utf-8?B?TVRIRGk2aDd5b0ZLbmM0V20rcGIrRkM0SS9HYVhsMkdJRCtvOERRL0lqNkxo?=
 =?utf-8?B?QjFvdTE3bUNrRjhXUllkdUxNVENhUE9xbDVYMEJ4K21YNHRPd1N4VGsrRFkz?=
 =?utf-8?B?Wng1dGxuT3VieE5odEgxT29OdzhmT2dxS2ZYNklPWGlzSUUyL0lsRWVXR1Bs?=
 =?utf-8?B?a3gvbStLejdRTXp2SWtzd0RvblVQZU9MK3BQZms3bTMvUm5yUVd2V0poZE9i?=
 =?utf-8?B?cXU4c01QQnlNcW1VbmFvdUg5THc2WkRDaDRYQzVFZjh2Q0V1enpmY3RNb2gw?=
 =?utf-8?B?Tld6NXRqYmhvZEVMeGxwZXFkd2MyTXZhWUFPMlNqbURyMjhNNVBPdTAwZlZC?=
 =?utf-8?B?Tlphb3ZIMGF6VDhWR2dmb0JJckVHK1RwOStrUUxYYzBhK3hMSWhyblNqZkRZ?=
 =?utf-8?B?RHh6aTBPTElqL3Znd3VGOUpMMzVoUUZkZENYaGc1STdkOHZCayt6R1dYT2lU?=
 =?utf-8?B?UXFJWFN1MS9pZ3UyWWE4ekJpbFVCS2VhTThPZFJHWmhYMXNPMzBIK0JBcVZr?=
 =?utf-8?B?bVZNMVh1L1pIWW1yMVlPSlZZMGF4QTFCeGZFbStvRkozSmo3QWg3UW4rbWRT?=
 =?utf-8?B?clNqYzRtQVJOSENYbkxiUHlsMFBVTm5mVjBONXh4Ky93dmM5N1dUMUVTSi9Z?=
 =?utf-8?B?YlluMjZkd3ExQm1pQ2U4Sm5rdnhidXQ4dlJ3WVl2ZlNPejJRNHRDcHNoUWdD?=
 =?utf-8?B?OUh3R3NDMUExS1RVQklPQVpDckREWXBLWUNqdGxBc2ZFU2dpUTJBQmo3RTht?=
 =?utf-8?B?OEs3Q0xINk1ENnhLWWRXcGkzNUtTYmRCTDY3YkZxeVNFRS9ERXBGeFR3T1pk?=
 =?utf-8?B?WmhJc1RuNDBneGJENlpaWUhLQ2taL21NYmhtbTJQWURDakJJbUNIdXlXU0Zx?=
 =?utf-8?B?cWhQWHE3Y08xd01UUXEwaEdNT0ZLYlBWcmlrR1piSkNhL2xZTFVxTVpLNmpu?=
 =?utf-8?B?WGVUZjBvdk9zWUNxYkwzT0dOejMyYnVjMHZnTkYxUlNPN1JoYzhLek5KZCt2?=
 =?utf-8?B?WnkwOWdraXJlUHFyc1ZiMXduUHZSU2NaK1VsakZpVHR1N0psZXlSQmtub1Qy?=
 =?utf-8?B?WmtXMkFVaEh1RUFXNVdXS0lKSzlxUW1EUVcvd1liaDJ2MVowTnU1c1B1aHkz?=
 =?utf-8?B?UFZnREFFc1JaaldIYzhtSmF2TE9oSDVTcDhDWDRaMC9EVUhFWnV6TGlpT3JZ?=
 =?utf-8?B?RFVZSzJqbEZTWjNJMi84NWV5SWRhbHR6c3NIK083S05pT2RGNkFuVDIyZG83?=
 =?utf-8?B?V2M1aFJXbERXL2lPcHB5S2F0dStkMVVXMDFuU1JQWVFkRkx3MDhLSmZ0b055?=
 =?utf-8?B?dGVKbTZpdEZYeEZOeG40T2dVeWMyT20vWmowMDIrZGduajZadCs2Q0hQNmdK?=
 =?utf-8?B?OXllSzZUNWJUb0M0VzhCUU9SOWNLV1ppUDlid0wrRTh0WUh3TTk4L0hkSXJC?=
 =?utf-8?B?RTJQaUdKSnBCTDJTVVpkOFhTM3RtYTlXSXozTWs4a2xENVdsdUZRVE5yUWh0?=
 =?utf-8?B?R1BVMTBGeU9yM2JMV25jRnlTU3dQSzJndXpjKytKUFZlM1Z4Q3JaemtPdmVs?=
 =?utf-8?B?dEFMYkZza1NnQjE4a0dtY3NLL2RuZnBndWV0ek1jemJabE0zQzV4L2RwOVU5?=
 =?utf-8?B?czlTRTVGVzNRZGo4Q1dJZ1cwLzBVYzFkcHEwYXYybWtKbmN2MWE1Ky9MbEFz?=
 =?utf-8?B?KzYyTjhMNjhXMnFRQUE1bUhPTzVHUGV6eUUxSlJvWkFVQTZ6aGxkTDJ5OEps?=
 =?utf-8?B?Z1RkZERiN0Vsd1JnaDlNOUVtSmZuMDBLVm1Xckxod3RRTjlhdm1TTVg2VHYx?=
 =?utf-8?B?R21IREFrc1M1OVV0SERqbjhocms2ckRLMVBzRnowTzVaNzdZWUdzNktwNTMw?=
 =?utf-8?B?b3JRSUlGVHkzdzh0N0hoV1VWYm1wWnJTSk5sV3NpRjVBRkI5a2JCdlB5V3Ex?=
 =?utf-8?B?UkUrWExMSmtPcDNON2ZmMnE2YmlNYXRtaEQ5VmxIQ29CRDlmM2dZcFpHdVpB?=
 =?utf-8?B?QnJtdmxRcTBTWGZXVG91alkwd0pZc1Z4d1RzUzJRV2dyK0pKYWpTa0QwYnEw?=
 =?utf-8?B?SnpKL1lvcnZoWVdPeG5ZRXljQzJTem9GSFM4LzV0R0U5OXczU2NvbXBjM3Ro?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db223121-d4fd-458c-0ae9-08dcafd6b4ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:59:47.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iANUdK0iQWiIPxjuw3ekvw7X7uTdHUggoMuO9Q++leqcZYAtJngMaHzYIuQsm+jqEldxq55U2ELzsjJiOjdzxQGhzV2ylt9UHijSoaoSAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202653

Hi Ranjitsinh,

On 7/29/24 3:52 PM, Ranjitsinh Rathod via lists.openembedded.org wrote:
> You don't often get email from ranjitsinh.rathod=kpit.com@lists.openembedded.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> Hello all,
> 
> I want to contribute for the layer meta-lts-mixins for kirkstone/rust branch. Does anyone suggest which email and labels to use to do contribution for this layer? I did not find any specific contribute guide or details in the repository. Any help is appreciated.
> 

I think yocto-patches is the appropriate ML?

https://lists.yoctoproject.org/g/yocto-patches/message/8 is a patch for 
meta-lts-mixins scarthgap/u-boot branch I think.

Adding the maintainer in Cc, they would/should know :)

Here's to hoping on of your first patch is adding this information to 
the different branches' README :)

Cheers,
Quentin

