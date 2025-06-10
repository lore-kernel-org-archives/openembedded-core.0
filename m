Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4E5C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.web11.83591.1749553028925705381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 03:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OK/h4Qp7;
 spf=pass (domain: cherry.de, ip: 40.107.162.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgfXH1KRxwU52IM2AM8a/HvSWIr9lCWpoeOi94ubk53eYystp9MYuir6ShlFLOzeOLevAjmkJds4wge14jVB9lBxeI+qVzrA2E8Tg4elCrL2RlxpqeCW5a8boxlnS1nB5YKP3PVH24P4FZY3KCmeI1kybz/m3xT6QbZavUDboqSd3ISlS3OIn0wOS/DblomCjkyUrQs8tfbB/pf8SpXfMyZOVeMKDPmtJAh4IjVTFiplP+9BuSUtvLx+cbgecjFGgOcSLWTUUOP3m9dF6k3Hz0uWjrgy25DZXu26AO49XvYuSTcmLmL3eqOzqE/yGEBysHhGqGL22VuODGmhOkg/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD74l6REF0nHrmup+AfF3gYalAUQ5YyzeUz7PigQzUU=;
 b=wRpcj+oWqh599QfYmAROHz8dUBQyfDbXNLoa8uAdjE9yjtSb9gg8h4w+y1GLwtvJ482rY/2jXoyFGW6l6E30EBXDHb3wCgbD4u9TvlHD4fCSu33SHvoTV9gnQNSREi/334r9iWX1APG4bFq7vOEVM+GH4qcZGXqUCeeKoKqY0UmnqWU1PMkL2BbfdpIztj2KUsvh6PROBoM137xWZ2lQQQkCxzFuQ4AmNpoZuXrpJtyl6TKDM7Bz5KRnZF/wA/9jtzbSkSxzPAZHCtemrLk6TqF5zeNa9WB1ZfXbwm8Qd4f5NMy9AwHe7jNfys37LesnqqVp1xEv2WbNiDLMnjyDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD74l6REF0nHrmup+AfF3gYalAUQ5YyzeUz7PigQzUU=;
 b=OK/h4Qp7sritQandkZbg5MIfJlWTjZ6D7rrsX+BGMXTcsqbcjNLo0GbJ0JkEBg048YT7ZzDJht/rlyx5uCjPpL4bmV+7m7etXooRMoLXp1kAxDwiEU/HfZ37tZxaBWIWxIGnKmIDMZzuXJLJf1dOjyEufaBq1+3CFGXlCO3l/k0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10842.eurprd04.prod.outlook.com (2603:10a6:102:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 10:57:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 10:57:02 +0000
Message-ID: <3e190ff1-9261-4a13-8c1c-daeb16671b44@cherry.de>
Date: Tue, 10 Jun 2025 12:57:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] reproducible: allow each layer to define its
 known non-repro packages
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250609152757.1153027-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250609152757.1153027-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10842:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f6ae71-5513-440b-7e0d-08dda80d87e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnZSTXBQQjFLZWwrVys0ZlExM1IyVVFSRFRUaEpSTlpabTVvMTNyYWZJSVhl?=
 =?utf-8?B?SnJBdHplVFVLbTIyNDh6RDVpUUdudlRtcEE3bGp3NHQyRjgvaUFEKzNZM1JJ?=
 =?utf-8?B?UEZHejJJelp0Q00vUDZWZElzUFZPcHQ4Q2ZhaVh0MnoxS2lLSVhJTUg3MVVC?=
 =?utf-8?B?Z2YwSHlpdEtqV2ZLbzV6Y2trNzBQVTFCMnBYRlRTWjZZalE4NC9MdklRK1JN?=
 =?utf-8?B?aUpGQTBscS9vM3lXdHJURzVsek5QMzY0emJPOGE3NmtBZENjZmRlSnFsVU1U?=
 =?utf-8?B?alBxT3o1RmpEbnkrZkxHM2pRcitYV1prd2ZUWENmUGs5elhaZnJDbXhoaWJv?=
 =?utf-8?B?UU1mbVAyKzdmcFZMVjlOVnI4ajBMcTBuR3FKQlkyellPYjdYZ1VGa1NNWjFn?=
 =?utf-8?B?a1ZEaHAwNlY2S3llSFpzNWVHaEVXOStpdkxJY0pNNXp3c0RaVGJtTVJvVURB?=
 =?utf-8?B?OG1HZ2M1RUd0M0t3QXlwQUYyb1RZWXVJaTJ0WDZ0WTZRRkVVc3dkNmJtcHBQ?=
 =?utf-8?B?YUIwWmN0c1ZCaWROWEc3SWxWS2NSUjZpZWR1YkRlQmhkQlpuM0lzbnZpV1hv?=
 =?utf-8?B?VG8rcmIyL2NwV3VhR21td0I4NzM0Zm1zUk5MTkV5djdVVUw0Y0VmZlJRZjVn?=
 =?utf-8?B?MGR5MjRjUyt6WGp2cG1VVzFDZXlzNzhhbEEzSUdFalIyaE84TDNyQjRTUk5P?=
 =?utf-8?B?YkM5RHpxK2hLT0oyZXR5c3pMK2VvWHMzbTRCNE5OWCt5UTVYTFlDQkhPRkk5?=
 =?utf-8?B?YSswVkt2UlRVT1ZIUjFnQzBuOGpCUUZhbWF5b0RDSWFzNkRwK2VabExiblhH?=
 =?utf-8?B?NmJUU09US3lxTEhLOFU1T2laWFBwcWpTcHlUVGtCTnB0ejFEcG9JdlhMclhM?=
 =?utf-8?B?bDFHS0p6YWlLeFBlaHNLc0VJVE1xN3ordEFxblIyelF3aDNpRlBxMER2Si9X?=
 =?utf-8?B?d1psUmtZbEdkRmhEVlAvNnZtSWlNRzJ2bUQyMUE1NmtpbXVXSlY5MTdGUkpR?=
 =?utf-8?B?dU1HTmkyTFBQeldrQ3Y5TG94T2ZyMnBieklVUnVqNGlVZU1OVFJFdWthYU0w?=
 =?utf-8?B?QyswWEZxbzF1eUVlQVZwS3UrYkpLenllbVp6Y3dCa1pOTUJhLzc1OWxlQUV1?=
 =?utf-8?B?djJwSDczdUVuZjExQ0V4dm9BY1IwVnZhZERjOEtXRUlKVDZRV29ka0FhU1Ru?=
 =?utf-8?B?b1ZtZkM2TG5UdDZRdWR6azczbUN5Ni9DbUMxMGF4d0I2aFhjamZEN0FWQTU3?=
 =?utf-8?B?ZTdGeHZ4Wkd1TlNxeGw3MlMyakdHOWRrYkRaNm0weGxoMTRpZDNYNk83MjZo?=
 =?utf-8?B?bVFRTjNHK0N0a3dENE81eEdIQytOWjJwbnBMeU9YQ3pjcjVkSU5RZHNkaTUr?=
 =?utf-8?B?SVZReU1aN0lNaG85UVMzOXFTNmM4Y245Tk5PVVZGYldneWxiT0hhSld3YTZ2?=
 =?utf-8?B?bkpOWFNUelgwVjNFbzNmZ2Zkb3d5N3hGelphQjkyOUdSSStzUUVTY01CeEE3?=
 =?utf-8?B?Qk5jYTJsMWpsNHRBczJiKzdIVlhnRTV2ZmpJdG1vdm0rNFNRbWVVNWJrVFdo?=
 =?utf-8?B?aGR0SERyeVNhYlNPbEt1b3pwOHBERW5KSVVvTEVyRDFkKzhQbmcrODQ3a2Ew?=
 =?utf-8?B?M1RkUUlOTGVodzJ1ZklyNnBHZy9ac0Z0d0FXallMWkMxZ3NrSlJManZZNGdY?=
 =?utf-8?B?K3g1Sm1VTklkL0N6bEpnYk9xMlRXd3NSTWJqZlAwUVBsMlBpTVNxcWEwUyta?=
 =?utf-8?B?Q1ZoZEprR2lTQWlqVVE1NEhLcHkzcnc0Uk5DYzhNK1VlMkhkbGVtVkI2ZFor?=
 =?utf-8?B?di9jQlkyb0NwaWpOYUJKTVlKQ0Y4Y3p2bjlLaFFhajNXeTlKTWI3aEVIQUZz?=
 =?utf-8?B?NlJoeTVoWWwzcTg0ZFp1REVJR2NiT1dtdzZVaEZPRG5RNlY1TmJia21iT1hp?=
 =?utf-8?Q?nCt94NkpyYQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0NhV28rNlhxSnNuclE2ZUQ4R1F4eEN2NE0wM0FKSDJjd3pWZzdJSy8vM2d0?=
 =?utf-8?B?b3lXNlpWT3VGSDE1b21GV1d4WVBxOW9kbWU1WkQwN25VVmhieTVOc1FuY2dN?=
 =?utf-8?B?VlU1bTdTeDZiSGJ0UjcxcStyQ2xBUXcxcGJud2FGT1h2djkzMnBFMDBPOWN6?=
 =?utf-8?B?QlE5cEp1R2dJMWFnTGZmUXpTSExKdVRuQ0NPcHYxb1BlbFVJVFV1TFVFYWha?=
 =?utf-8?B?ODdNZVl3anNDZ05mMWpxcWh4WUxZaWdualVCbldkQzVhNmVwdjVVWXhoNXVK?=
 =?utf-8?B?cWltdDJ6SUJOYzFEcElZYmwwdGF4aFVlS1RIalFjTEJrNjUvVU12OWJJTjIr?=
 =?utf-8?B?WlhWSHVXK29DZm50ZnJoRW1NUTFhR1hSSVMvUzFOUGd5M056MWdYMnE0T1JX?=
 =?utf-8?B?QUlZT0REbjRwVnF5akVoSE5oR2ovRkxqTWg2bWFTSzBScEhxVjZobnM5ZVY4?=
 =?utf-8?B?R0xkcmpDcU5kV2FET0dZc1FCOTlGYllRYmQzL0ppK09oc28rQ3VpTllRbDlo?=
 =?utf-8?B?ckl0VjY3N2ZEMjlMTTJEeGgxbEUzUndTTWg3emJCWVhBT0ExbnJFeUhQSVlE?=
 =?utf-8?B?ai9aNXc2dHd5N3l4ekRvdEtwZ0dESHY2anlZdjNCWlNmeXBmd0hQbmpVUndN?=
 =?utf-8?B?YXArSHNSNmMraE5oQ2dRVW15aGhBemdPak1sNHhHU2k0TUpRWnFrN0p0cFJr?=
 =?utf-8?B?N2NVVUlqaWZvNkdoR2dmdWt5RlA1MmlHMER2RUNURGhSVVVNbXpYdzRFOVZ4?=
 =?utf-8?B?Y1ZGeXE0M0p3bkVDVE44eVMrOExUNHRYeUZKYjJaREFySEUwSFFCancwd1hw?=
 =?utf-8?B?NlZnc1dyaGZDQ0d4RWEyejV0RUp2bVRKZVB0dnA2ZnpEQ3hzSUZuSFhiUWlk?=
 =?utf-8?B?ZHMrWFZnM3FWTENVcVIySFA1dnp5Q0MvZDF6Z3NMc1c1VDY4MDJGTlNyUnFS?=
 =?utf-8?B?dzlUM1VpcWljWWxDVzJtRDJVZVRwVVFRMGZBNHpVdHpGSkhjc2FhakM5bEpq?=
 =?utf-8?B?S3JsTUlOWTdmYmlYTzBSMUUrcHhpWStIWHBXbm9UcXI5R3ljbUpUeEExRlJY?=
 =?utf-8?B?cnRkT2pWMTV5SjZSZmd0VWxYMkVzR2Q3eXJObC9ZanVNS0ZTNi8rZCtvWFVh?=
 =?utf-8?B?di9kSWp6MjkxTDg3eE16L2lnSVpXYy9MWDJrVkdXeW5LNlpJMXVONEQzWExi?=
 =?utf-8?B?d2ZwbGFadlY0WG94dVQ1ZU1NQWQvRjZJZXFCaVJpdWlEeGZJVUs2b0o1VktV?=
 =?utf-8?B?TzJzQTg5QkNwU2ZYZFJCU0ttU2xaM2FPWUt5V0JRRHFmMXN5MjFLeWdCMXJ2?=
 =?utf-8?B?MnpqZU9ETGFaT2YvaUpsazBPeldlaWdvZlFsTXdjeWJoNll5cXIzSk1UalNp?=
 =?utf-8?B?ZTd6V1E2WDVHdkVyVzd6dkhRd1hLczgrdTJRY0YvRnI0UVo5MlpyZVUzZDVP?=
 =?utf-8?B?T1dBaGg0M1hRNTlMOVpEbW5jVkdidzl3bGRPd0xCK01tQ01tMUpIbWVVOW1I?=
 =?utf-8?B?cnVtZWRJUkZhZnpyY0MxZldweUxyODFJTW44SU1JMU9xQ2o5aVRiSTJ3Yml4?=
 =?utf-8?B?QlRiN1VlQzB4Z3M1WXkxbkxnZTdSR0tBV1RPeUg3L3dOMXp2bUs1VzQ5VGtT?=
 =?utf-8?B?UTZrUnp3ZlBKUEhMdVBHVzRncFpxN084RnNleE5wSlBNMUcxRWc0QlYrYVpY?=
 =?utf-8?B?WU5lWGcxaHJRWnFJd2M3WnlHWit3eFpTUlRzTzZ6WEdTNVd6Z09sVk8vQmJZ?=
 =?utf-8?B?K0c2MElmK0NXYlFhanJwYjhzVEFVZyt1SU5HVS94Y1lvU0FDQWtLYUJSV2t1?=
 =?utf-8?B?eGhHVWlBS0NQNHZiZnFNYk81T0NEMlBCaSs4NTRQVkwzeVhta2ZzdEg0cjVt?=
 =?utf-8?B?T2tlVEpaQk5pSjJBVDlibS9nQXNBdFhzZlpqZzl2Mm5ESmVadnJlT2ZIdmpS?=
 =?utf-8?B?c2hVTmk4WGlyWWZVbzRNWWZpbUN1WlN6ZUt2cmhMRm1SLzZkbitDbThBTHd1?=
 =?utf-8?B?TGc2ZGcvQjRTSnR1VUNwSkZ1VlJwazk2aUhiNS94cStIV1ROZFhUSVlGT0pw?=
 =?utf-8?B?cW1kbXJNTE4xR1FyMURaZVZyS3FpVkdSZXArd2dzSWUxOG9HendnM0ZXd013?=
 =?utf-8?B?WjRpU2t2aEhFRDkrOXFSMy9ROEJvMnZBRGtVY0IxckdKMm5ET1JaelphZ2pj?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f6ae71-5513-440b-7e0d-08dda80d87e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 10:57:02.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBxOj8py8OFCHYD0e8MLxEhQ1CrXEWbeCMkQFtynQf3349NshcRwUPiKwg9T1UyqodH9APY/WqktCjRrfQdXJjFQPqO10MAGZ7kUhG7iwn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10842
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 10:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218341

Hi Yoann,

On 6/9/25 5:27 PM, Yoann Congal via lists.openembedded.org wrote:
> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> 
> With this change, layers can use a conf/include/known_non_repro.inc file
> to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their own known
> non-reproducible packages to make them automatically excluded from the
> reproducible test.
> 
> Example of usage, in conf/include/known_non_repro.inc:
>    OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
>          this-package-is-not-reproducible \
>    "
> 
> This uses the new "include_all" in the reproducible test and will move
> the maintenance burden from AB config[0] to the layers themselves.
> 

Isn't this something that could already be handled by a simple

OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += "this-package-is-not-reproducible"

in the appropriate layer.conf file by any chance?

Cheers,
Quentin

