Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0208D41D64
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:54:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12845.1765468474265698498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KvmXDG8z;
 spf=pass (domain: cherry.de, ip: 52.101.69.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/EnW5R7joDJ2vTYpdTOf6c5V++Z1xL5guuKyFqDOEYduyGwP/caQACpgNvoH6RM1d8WFwh7Dge0mVZA5v2/OWW7HTe+b4HTO7FzFIWJG0CdoGi/20iYz4xA5q67cQU6bEMPvHB67462J8S6ffwLe12gXxWeI3nfpzO40xjyRm40cMBfKzg3/+QuS7WebMT719OiWeOmDU/nlLg9paAACiRejmLHyKr3trUQhhq29yaT7gi//Os4yn9WJqadB9WG0EqHsR961mxfT0uRjjgkdDrwDu9ESVOw88mKY0NuCU5/JT4bUt0DWu5BCnb5Hd0hJJheh9A4Jo/DP+Y7U2UALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NsbjMODQscGk4heHzNFjXysGmVTzqEPr0BIX7SeODc=;
 b=vfZ3C1O1ZWL18wdPGGg7W9jiMQEPL0YrzDgJSnDUWtfMjU7231GmDfJViKZFqTPSkbTYZ01bi3LfHMKIyQVEbN4N5w0l5FyaRObNGuDWgi3StDotqLrNOQBJazoRv2efl2UT+IewYXNseVzl41oVMTdwJdE/kneJCReyCMW3rBVEFHJYKn0MITA6Dh4KtpX/uWdb5yP1jqYA1Kqq6/aYTEes7Y4JdrRhLox7IFY4TQA6stGJ2n2WcEY5vE8DYq9txE+0ruGbWtihaZh8p4XY/c2izwJrx06GHOq03HePsIW4qqtltfSc8KPLXb1ZKL/fD+MmOvUOJxz2NfYgvrvhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NsbjMODQscGk4heHzNFjXysGmVTzqEPr0BIX7SeODc=;
 b=KvmXDG8zHJ1sFLEv2scAG4WIPgsvrS0Oaw0Vw7PMqCtJMwDaKHjje4DzhzMIggKnhHmIb8+vzvaEdR7mEXlo6HRAdXPrIF0IomXSdqrHg4I48mM1f5sIrmkTTQIdvVt01ufbMM18g1wRLN3DMO8Bwnf8qDyz7yYtYhfCPHfyv8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 15:54:29 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 15:54:29 +0000
Message-ID: <aca495cc-d6c1-42c8-9dda-1bdaf2011230@cherry.de>
Date: Thu, 11 Dec 2025 16:54:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oelint: Remove obsolete class
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20251211152936.1267124-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
Cc: liezhi.yang@windriver.com, Chong.Lu@windriver.com
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211152936.1267124-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0065.eurprd02.prod.outlook.com
 (2603:10a6:802:14::36) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: acb8759c-2c12-4e0a-e767-08de38cd9173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzVxSXRITGRSYk0zQ0dGVEFEY0VMRUhTMm84UFh5eFBPT0I5WHpKVFBjcm96?=
 =?utf-8?B?bzEzcVZpU1RvOHZhOEl6Z0JHR3lKSDBGa2dDZFRCcjB5QUhVQnhkOVpndkZq?=
 =?utf-8?B?R012TGljVTgxcEpWOHZ4TkxRM3kyS2YzQXlBZ0JncDlOU2pEWTFIQmpqY3Nl?=
 =?utf-8?B?ejZFblp1L3RpS0YyL1Nsdms3dTVObGdUR2hDTE5CUkF4eG16WHNnb3E4eHlk?=
 =?utf-8?B?S2xBa2ZIeHJaWTNsUlJsTlFMazNhUDgzT3hjWjZDbFN1R1FwUVhKNERBSUh6?=
 =?utf-8?B?bHZ0M09PdEZyS3dqUWFmVGgyMjRKQTBNSTlFNlVpQ256ck9Vb2VYTlNKQ0Z0?=
 =?utf-8?B?c1ZId2RMK2xtN1BKc3hUdDhsUncwUWFvRlIvNTNUZ3paeXBDWnpyK0NzTGsy?=
 =?utf-8?B?Nkt0UlRkRW9HdE5UWkFOM3FjL3p2L2F3Yjl2bmJzTHpFZVhBakVLWW9nMjQ1?=
 =?utf-8?B?UVBHTWdXaDI3eXdHOFpBRDJQTW14S3hISzlyREI5dFZKVzVVZWMyYmlpZFNr?=
 =?utf-8?B?TjEzakNYVEd0RWx6Q1NNWWxCTWVjRSs3a1pFRFZDaGd2N1FLL250bUhlS2Iv?=
 =?utf-8?B?Q0pIR3o3Vit2YWFxZXZtbUcyQmdyeXUvQkFNR09hSlk1c2hHa3FOdTk4UXpx?=
 =?utf-8?B?aWhaZGs2NGNhRkJ3dnorNnFvZEVpZGVYeG9mVUhiMGZvR0VGTmsrL1JpVVBC?=
 =?utf-8?B?ZCtUa3NCaG9LeC9zYjA3YTFqblV6b3B3QmpuY29pTFdlditmWmhPaWIzS3d1?=
 =?utf-8?B?M1E5Y2NLVWphdyt6VGtFbzY1YXFHZlo3Y3B1RkhqRWlYYUdQZmdkQm1IWFpS?=
 =?utf-8?B?NXdrZEd0THVSYVIzRUpTTnhhUVFTUFRTcmRhMlJQek5DSHRvRTByNE1Yb3Jt?=
 =?utf-8?B?TWJsQU1jamo0U3FmZGgvdTJGdjVMNWtzZHBiZXBCWml4MUdwVHBzdHpySElt?=
 =?utf-8?B?c21WN0FVWjZoTytwSnNpK0M5Uy8yVFM4YVpDL1JOMWE1THdSR0M0T0Z4b3U1?=
 =?utf-8?B?Mmw4RWdwUUlZRU8vN1FyMUFUYWUvYmlCVXhaRmRqK3czTUFLQ0UrekZrRFVt?=
 =?utf-8?B?Z2VITnhGYlNVZ3F3ZE95VEFLUS9LN0psUHVqV3ZiWkpVUXpJVWF1dUdkcVZU?=
 =?utf-8?B?SWtLSy9rdFlaRDFuZWc4cWFtVWFzNHNFVEdKUXlocTFpdkpjS0NmcjNkOUpT?=
 =?utf-8?B?L2cyZGZkSGQ5UHJCNDBjOXN2SVZnaG9GT2MwUFVRUlg2MHd1WllOSmNQZk1M?=
 =?utf-8?B?djgya1Y1Ui9MVjlGWTh1UEhIWWxsclh6dDIvQkNrR3J4bVlIYkI3L1Y1WU96?=
 =?utf-8?B?UGY1Z1dGUnBNT3ZMKzZKWmloWmRHTENScWRYai9kR2p3V0llMVBhRk1jbFk5?=
 =?utf-8?B?MndBeW1lRnUwQktVSzUyQ1V0NWgwN0FFWTVoSHBWR21HdmZsaTUrYnl6RHo5?=
 =?utf-8?B?VkpwdldvaDlQcU9HY2lUQmZXVGNIdjhZa2JBd1NxMWg4QWFhT3pXaERoQThZ?=
 =?utf-8?B?aG44d0UyQkpWK084aHE4ek1obTkxdWo3aGtoaHNCUTAyZU9nQVVTOU5aSVVI?=
 =?utf-8?B?QkhLNDNVS1ZTTnh3a0wyRXFDVUxPQjVYRmpJM3hYcmFPTEZYUjZLc3BWMjRJ?=
 =?utf-8?B?aFlUc2t3WkJiNVRUd3pnZmtWRzR6VXBINnZYZnBwRWkxRVh3QkhSU29tSExF?=
 =?utf-8?B?QWl1MGY1MGpNTkpOdExYekRrKzN4c1RHQno1NUs2WHkveHVCdWtlYXA3QmRz?=
 =?utf-8?B?SWtTaHM5emtuaGoyRmoxb2NGNXgvazlLZnZWNnhUNVZMMmN2RXZyUXNZREkw?=
 =?utf-8?B?WkpaK1B5WFk0Qm43dU95dVJxZXpTb2FZR0w3VDVQTzNiS280MnZZWW9lelN6?=
 =?utf-8?B?eGpPVHdyS2xYdHNISXhVSjEwSVhtMGtrczBmTjUwMTdzQW1KR1I1QlZWc2VO?=
 =?utf-8?Q?jzpiWzE4a/Xe9Dq3/7wXA8ogVbmk9viG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUx5NkMvQVFIUlk1TExJdzFvVm1Cc3diYXRNYnRQTUgxOTZzQzl0Rm15bTNy?=
 =?utf-8?B?OWcwcmxIWllOUUFMYkpjeWdyS2lnS1ZtVkk5ZEp1L0ZRUlVKYTJ6eUw0UmRk?=
 =?utf-8?B?KzZESldJQlpteDZaNkg2ajFxR3prdy92WVZ3eTNwa0JqbWxDZ1BkbDdrQzBW?=
 =?utf-8?B?TlNYMzlWSzJZTnA3OEVBV0tzZ0ZzNUJFRDdvTVhaeVdHNTFzbi9XeFp1Qjdr?=
 =?utf-8?B?TTVTczNaK2VnSmJtSURHVXk1UFowSFN1ZjB6d0VjMzFwK3hwSEZ5ekpVY29I?=
 =?utf-8?B?WVRSU1JuUmdsWnlsZWM3WnNxajRmQ0VrejdoMnZrSGVuWGRudnpYUTY0dFU0?=
 =?utf-8?B?a2IvNGp2Qk9PMXI1RjZqTWlmbnVqOXl6amJqZmY2WVkwUkZJMFFadG5mV292?=
 =?utf-8?B?TlZkQ055WFI1RVJUYVE0VkpqbkVhMHJ1WTEwamh0Ti9vMGEvZGQ0VDhpdjdO?=
 =?utf-8?B?VThpNFdvRzU5NHd5UTQ2R1labTFjQmozaTlySkNaREJSMkV4a0ZVRHE0K3hh?=
 =?utf-8?B?QUFuTklzVXFobHc2dURSUlVqb0VTa0YxN2I5bDJSRm9BdmVxaHFTK2ltcExu?=
 =?utf-8?B?eFJzL0NZZUUzVTdnTTBZbGI3ZXdOak4zcktNM0JLMDYwNENOK0Z6YmNKUlFo?=
 =?utf-8?B?MXg4ZS9qcGZvWGJQNlM5eHA2ZnQvYnJQYXQ1VUpPTTNxZWlwd2lQejY1N3g0?=
 =?utf-8?B?L1hrRzk0TzgwZUg2YmRhSElQR1Y2c0E3eHVQRy9xNStLdThmOG5WakQ0Q2Yv?=
 =?utf-8?B?M1VLZ2x0SU51TXEyZWJCSTlsZXh0OGdQa3NINS9iVjhoa3BQL1pSTEU1bVFI?=
 =?utf-8?B?WVJIUlhNVkgwQkIrU1I0TVppZkRXY0VydEtpQjFhNWVMM29uZXdUQ2ZjbnJE?=
 =?utf-8?B?VWFJejJMMlpVRVBLN25sS0xlcFBmR3dXVmMzWnFTQW9abmFQM0QwL09OeFMw?=
 =?utf-8?B?TS96NXl3NUVPdUZhTEIyeHVEYllDcnRSUjJGKzBZQmsrQ25UZmlIMDBsYU12?=
 =?utf-8?B?UDJXTjdBeCtsNXhtR2lYYUI3eTF0emZBUEYrZ0EvM3IvMG13VkFmRzVQTzdz?=
 =?utf-8?B?bHRMNlNJMUJTcWxBYWs1MEQ4aUhLQVBOSDlkbVpYSGIwak16a3dzTzlGQWQ1?=
 =?utf-8?B?Q1kvWFAya1YwbmhKZW93Y1R3QjA4SUdCMFlwdFd0b2pXQjh5NnprcVpaZWpH?=
 =?utf-8?B?bUsySG1uWno1VHBhd3Q1Zm9PWGk1MzVkRVZBNVl6MUFSd0lzK2RkenRlaThW?=
 =?utf-8?B?aSt0aVQxNyswaGYwSmVHSDIrNllWT0tPZFJOSXRHOS8rU3BiZkFPdHhnblU0?=
 =?utf-8?B?MHZNWi91UWl0eEU2cFZUS28wbW9sdU5LeTRKUEVaREFnbUJ3SklFTWNSTmY3?=
 =?utf-8?B?K0lxRjFmZTJNc21BZUtURDZQa2FHSVd5RlZiY2pVTTlJcWdVK25ES3ZSUTdq?=
 =?utf-8?B?cDV4RG9Ia3Nwd1d5b1IyTlJBa3BkWkplZkZ4SkVSOWxyNFRFYm9mRVRFZ3BF?=
 =?utf-8?B?UUo0Tk54OHZUOEI5SnZKMXc3RmxUeEJ6UmhvR1dCV1VLaUhMVU9uaytqekEw?=
 =?utf-8?B?RTFXVzlwSmpKblRrQ1Bod2tLdDhUQkNLVkQxenkvTGs3NkRFRnNzOWU3dDRF?=
 =?utf-8?B?N2xUZFJlTE5KOWVqeU9BYXB3aXRnRGJqaWh3YW1wUk9SUC9TeU10VzBuVHlO?=
 =?utf-8?B?OXFMYTZreTROUW56SWVCQ0Z5V29ZcFJSRHp3U1RubUg2dFUrQ3JweVdQTlBm?=
 =?utf-8?B?ZlMrTkN4U3YyOFp0aXZZN2tNck1xN3hKTGRDZ0ExbkFEWCtINjk5ZVFKZkgy?=
 =?utf-8?B?bGFlNFY5RjlRQWRBY3VmamV6djRWYXhzVURuTE9kdjBVcmFuckd6NzJLM2I5?=
 =?utf-8?B?QWhHUWpsWmpTaStSYmpmUDhLSmkzNmdXRkkwSHdvUFcxa29zbnRSeFlWZ0xv?=
 =?utf-8?B?WW53NVMvcFJqVXRsVytyRXo1WjNrNm16ekR5eWR3N01XZDZuc0l1Y3VDQkI0?=
 =?utf-8?B?MldIaG16ZkxvZ0cxZmdRc21BdGxOTDRJR3hBcDhIWUUvZ0VDMnRlVGp0Mngz?=
 =?utf-8?B?aVRGMXFoaVcrL2YvWTNFVjMveUZEbVV3c3dkZktiOWd6NDVsQ2kzOEg2dWdY?=
 =?utf-8?B?SkVOUVAyMzJZU0hvbTJqbzB2NWZCMEo0Z2lNQWRoU2RwVUpmN2x6TTB4eGtM?=
 =?utf-8?Q?/vaILymC4sopZu6CbigsUR8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: acb8759c-2c12-4e0a-e767-08de38cd9173
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:54:29.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39P0RlKp94uH0kq7R+Gz72Pe/55YCZXz4SWIk76nEtoaJssoks3oAAJeyg1TVd5WBk63snSTrJ4qIhzwrHrJYRuM3d60br+QaCWPaicfDtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227550

Hi Richard,

On 12/11/25 4:29 PM, Richard Purdie via lists.openembedded.org wrote:
> Most of the checks in this class are covered by other areas of the code now.
> If there is anyting important missing, it should be added elsewhere. The
> code hasn't had meaningful changes since 2014. Drop it.
> 

I think the other important piece of information is that nothing seems 
to have ever (since we migrated to git 20 years ago) inherited this 
class in oe-core or meta-openembedded.

So this looks fine for me as it changes nothing to the current state of 
affairs. Adding WindRiver folks for awareness as they were the ones who 
added and modified stuff the most "recently" (10 years ago) so maybe 
they want to have this in their own layer(s) now.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/oelint.bbclass | 90 -------------------------------------
>   1 file changed, 90 deletions(-)
>   delete mode 100644 meta/classes/oelint.bbclass
> 
> diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
> deleted file mode 100644
> index 458a25ecc39..00000000000
> --- a/meta/classes/oelint.bbclass
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: MIT
> -#
> -
> -addtask lint before do_build
> -do_lint[nostamp] = "1"
> -python do_lint() {
> -    pkgname = d.getVar("PN")
> -
> -    ##############################
> -    # Test that DESCRIPTION exists
> -    #
> -    description = d.getVar("DESCRIPTION", False)
> -    if description[1:10] == '{SUMMARY}':
> -        bb.warn("%s: DESCRIPTION is not set" % pkgname)
> -
> -
> -    ##############################
> -    # Test that HOMEPAGE exists
> -    #
> -    homepage = d.getVar("HOMEPAGE", False)
> -    if homepage == '':
> -        bb.warn("%s: HOMEPAGE is not set" % pkgname)
> -    elif not homepage.startswith("http://") and not homepage.startswith("https://"):
> -        bb.warn("%s: HOMEPAGE doesn't start with http:// or https://" % pkgname)
> -

We may want to check whether HOMEPAGE is an HTTP URI and if it's 
mandatory (Ross says no, the docs say yes) whether it's present...

> -
> -    ##############################
> -    # Test for valid SECTION
> -    #
> -    section = d.getVar("SECTION", False)
> -    if section == '':
> -        bb.warn("%s: SECTION is not set" % pkgname)
> -    elif not section.islower():
> -        bb.warn("%s: SECTION should only use lower case" % pkgname)
> -

that SECTION is all lower-case and present...

> -
> -    ##############################
> -    # Check that all patches have Signed-off-by and Upstream-Status
> -    #
> -    srcuri = d.getVar("SRC_URI", False).split()
> -    fpaths = (d.getVar('FILESPATH') or '').split(':')
> -
> -    def findPatch(patchname):
> -        for dir in fpaths:
> -            patchpath = dir + patchname
> -            if os.path.exists(patchpath):
> -                 return patchpath
> -
> -    def findKey(path, key):
> -        ret = True
> -        f = open('%s' % path, mode = 'r')
> -        line = f.readline()
> -        while line:
> -            if line.find(key) != -1:
> -                ret = False
> -            line = f.readline()
> -        f.close()
> -        return ret
> -
> -    def checkPN(pkgname, varname, str):
> -        if str.find("{PN}") != -1:
> -            bb.warn("%s: should use BPN instead of PN in %s" % (pkgname, varname))
> -        if str.find("{P}") != -1:
> -            bb.warn("%s: should use BP instead of P in %s" % (pkgname, varname))
> -
> -    length = len("file://")
> -    for item in srcuri:
> -        if item.startswith("file://"):
> -            item = item[length:]
> -            if item.endswith(".patch") or item.endswith(".diff"):
> -                path = findPatch(item)
> -                if findKey(path, "Signed-off-by"):
> -                    bb.warn("%s: %s doesn't have Signed-off-by" % (pkgname, item))
> -                if findKey(path, "Upstream-Status"):
> -                    bb.warn("%s: %s doesn't have Upstream-Status" % (pkgname, item))
> -

figure out whether a patch has a missing Signed-off-by or 
Upstream-Status (we already do this but via patchtest, which I'm not 
sure how to use as part of the build like with insane.bbclass)...

> -
> -    ##############################
> -    # Check for ${PN} or ${P} usage in SRC_URI or S
> -    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
> -    #
> -    for s in srcuri:
> -        if not s.startswith("file://"):
> -            checkPN(pkgname, 'SRC_URI', s)
> -

and check whether SRC_URI contains ${PN} or ${P}, all in insane.bbclass 
maybe?

Not a blocker for merging that patch here, just making sure what we want 
to do next with checks that were in here (but again, unused as the class 
wasn't included!).

Cheers,
Quentin

