Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9862AC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:27:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.103])
 by mx.groups.io with SMTP id smtpd.web10.21965.1739381234285373900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=oU88gAk7;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.103, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISgYcBvDVlgHrI3QtJ1Y7DVL/TusNNWb8UsxfX100e1G88L9C0Di/GpJdWtTq+r5EOMsF1jboj96uEG0uJPkl2dBnQV3LWo2p0z32en2JmBzeoKxGYs6ORJTZpYtHy4ZwE7vcy8JCcXLnRiZv/sCHhdQCcRHMYjyT8bsN+xVju+v/ajCJh47wOnkNflbpThiadnHwHXe6g9iahAdpZo5F0f3YXURWjjMSngYrvJb5A0MUzC/xclao6XpXE8d+nV+LjsM9NhauBhn6PyH95x7bCHKbb15xh2ngBecGpdaFAjgX/FmTt93CdvTp0dIGX7YsOxd6xkdeMxezTBU2K/9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lakXzqo5sZOTgbuXoFPVcGecie/0PWSRmbSe9jBX85w=;
 b=i8eZpigsTqBKV3EMMBAsXoaRTHPosqGR3t8TZQAGmVr3PY/AZU2CNEXP8xw9PjJnqaSoyGgK3r4hLaFe1bjZ8fyYwbYGNUMX0IHOSAP3aQfENUDIYQtHaf4DJRJPjm70ZOZP8Chb7w0WSk/SOg2EtqG5/W/AQbrjnnWadWbFlSMvvo6DF9HALmGcJtzIYV5pu/9HRRl5N/QK3x9jh4QpLBWKT61O8Zr3UOgKCsl80Cfh5v3k2XoWg5IE8iM9ktMMhPttheKMY7h0FaI/ILNI9dMUeZeld/KhKI4owfrcHCZnYEciOeOKBaX6YgH8ag1Kg63pOt7bkIVfHWPAmiuNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lakXzqo5sZOTgbuXoFPVcGecie/0PWSRmbSe9jBX85w=;
 b=oU88gAk7RxLa5nxXy8B4EMxMfpe+mlH0s6A0TF1f7HcX9AaL9rg+hARiFHXMWU0npe6pMaH7cYoaMvdL0dpX2By41dUyN2dGJU9bLg106XOLKe73VpEBgPuHQp6xxZKA/plW8i7Hrh7JuwidzT0zFjOo9lMy/wqmA0jhdCrlhZDpcIhLUR9Eg/sO9oUS+PSQJ2KYZtsD1eSNIn+pC5b5+yPYmHQ3+roTW0WhjLyQD5Rz5vR2uPbNiMZ2d7EHiTkK7seJPyPB1VStVx+V0AihF75xSHh5Enkz4ZUP6qN21IZ6PpCcYTNMakLfemGeoeajj2Ar3hNw6mD8XCj9tDnHdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DB9PR08MB6665.eurprd08.prod.outlook.com (2603:10a6:10:2ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 17:27:10 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 17:27:07 +0000
Content-Type: multipart/alternative;
 boundary="------------dR00lyIKp1lhCGG0FuDqAjLl"
Message-ID: <d38daeed-c58e-4425-85b0-75a2889f6daa@weidmueller.com>
Date: Wed, 12 Feb 2025 18:27:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
 <8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org>
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DB9PR08MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: b7445828-99da-4a6f-797c-08dd4b8a7998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d2VUTCtWOXc2WGRjd290clJKcHBITkpZUHBWMDdScFRlRGhKUTRrZmVkU0c5?=
 =?utf-8?B?ZncwZkdzMFNwb2dMNGJaSFd6UVNEakpabzJ6R0NYWWdFdG9pQlRkeDc1RjhL?=
 =?utf-8?B?TURtcGRXZXZpeUozd0RzYW5wR2Y3ZTJjMVlZTnQvRFAyYzB4cGw1SFlTOXFx?=
 =?utf-8?B?Z01UVXlKMTV6dGpSTFBETC9IUE1zalE3MnpXVGZDN2NydDdxUG4wd0hXMEF1?=
 =?utf-8?B?UUt6YzhlbjE5Rm1aZFY0SEM0KzZBQ0ZGdXA3TUFwM1dzc1Y5NktCRzhRcnVu?=
 =?utf-8?B?bWx3cUlDOFJYbTJkeE9LTTZZd1QzQXVLRUhFZXNaZWlwVXFkeTExdHlhaENa?=
 =?utf-8?B?cys2MWpTdUQ4dm1WamVTVnBJbkw5WCtVVGZsdEkzcXBMRkdqdGE2bU5IbXBX?=
 =?utf-8?B?WTBTZk0vQ2tBM3g1VXpVZXV0c0Z0eno2NWJESGdJendLdDNOMWs2YVdkRDFo?=
 =?utf-8?B?R0ZCbHhtQk9wY2xzWVVDSW9HaHlGakVQUVBDaWtOaEw5RHJWQWhEZ3hvbjQ3?=
 =?utf-8?B?bnRWckdEbTZrVFJWN0Jkam8rbXd4bTB3eVVXc2VvbFJnT1Y5S01aQndzSERz?=
 =?utf-8?B?WjQrL2JKdTRhT0t4U0pmajJyWXNGSTYrWGFkS2JScm84WllnQ21KL0FIWk5G?=
 =?utf-8?B?U3M0Mm1IT0RRNmhDNk54RVNRaVNFU3FzZ2pRai9kV2IraE1SUUMyL3BnVkdD?=
 =?utf-8?B?MmNsdjU4aGNlWEl2em5hbHpicmxvNjZlR1VlSDdtY0JkTmF1NzFZaGxFbWxJ?=
 =?utf-8?B?QlA5WnZsN3paMnRXaUdkSXBEalpKTnVVcE14UEgrM1lTZW5rZ0wwMHdzTHow?=
 =?utf-8?B?Q3pvWTFXeVhJYWlhV0gxazlaV3ZTY1NNMzdsQWJNQ2ErdUpvajRqTWFHUGVK?=
 =?utf-8?B?cjNIbzFEekdYWVdjT3NhOUFLaXRsdXhPVGtNdEhXN1VnUVF5QkNkM1hYSkFE?=
 =?utf-8?B?aUczQStJWnpMUWx6eVdwWjg2S3p1K0RUV1RLd3cvTE1aU3VpY3ZZaGViVFVX?=
 =?utf-8?B?SHVzaTJKcytqbm40NGtmdGtxcmdpeWovMDBpSEpyOWE0akF5QVBGdXhDb24z?=
 =?utf-8?B?MjI1Sm9DclFNK2txL1M0LzZ1OFNqbkNYamg5OHdPbzY2d1VrN1dSaHhRZytH?=
 =?utf-8?B?VzhkUkZEcXN2VDgwZ2Q4LzNrbTVCOEgwbVhXa0dzTW02NDI3VmRwanFtcVda?=
 =?utf-8?B?WWNhWmZsWmxlQ3pkOXZsb1hjdDRidVRweTJkVVhGWWxFQXdGWWRFSXFyWmw3?=
 =?utf-8?B?bjhpWTRGVTdIWm01MFhmUytNN2VPVXR5NzRsTkJpQjJpdFhndjMrRnJBVnpD?=
 =?utf-8?B?NlhSYnZoWTRIRzFadkpxQ04wb1ptNXR4Mm1wWTRjWGd1NnZwL09OQ1lUcCsr?=
 =?utf-8?B?WWhaYnVZU0pTV3VsUEpZb3FDaktiWllHY25ZTXNDUFBWU1B6SGZNRTczNE5Q?=
 =?utf-8?B?N01PNitTMkZFMHJrbDFHSWJ2ZDJmazRNSVhCellpaVZrVDcrVTBSVWM2dmI5?=
 =?utf-8?B?UXF2UFdWMG1Qd2lIVXUwYXBFaTBudzE0cmJPK20rMmluTE9nMlJJbU9jZHUv?=
 =?utf-8?B?cjNRWldMMjluMU10c29DTUpRUFBkRXhwUHJQdlNkMUkvQ21jbk9LWXB2eGEr?=
 =?utf-8?B?SGl6K1pIVmttK0ZPTFVPUnhMZWFFVlVSclJJMUNtVjZEVzZJMmpxRHRuL1c1?=
 =?utf-8?B?T2JpNERoQk9HQUlwRVptZGJDb3dBdW1VcFd5RXVXaDZYYmgzcmFHbGh4UDNr?=
 =?utf-8?B?UGRjVjVPY2d5SjRZVXVXVk1sQ1BKamN4MFRqUHU4REhLaTExQlBmOE5ISS9j?=
 =?utf-8?B?VnlJY1FTem81cVhESzJ5Y2FOL05wUUJzd2pBMzE4S0toSGdrdU9LOVRTcU9U?=
 =?utf-8?Q?fupvENFnKmWTs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MG1TUVY2WWpmMGV5b3ZPWnVlSGVXK3g1S1grQnhyRjNXbGhUNUd0aGtKMlht?=
 =?utf-8?B?aFUxL0NwSWdyUHBXZ1kxNU1qS2ttWVdTazNOVldKakFwRkhoK0VaV3d5SlpJ?=
 =?utf-8?B?dWd5U1F5ZE9pSG1ESTl1WVVCMjA0SXkxc1Q1RFp1T3NGOUdXR0JKa2gxL2ov?=
 =?utf-8?B?VGJzUkVBNWIvbENVTTdHMSs4Q3RBQUtDNGRZeEI0ZjF1QmpoSDF6YmFQYmpt?=
 =?utf-8?B?OGs5bm8vQktnQ1hVVHZKVGJ3cGEzWmx2K0Q4NkRvUnE2WjdWdUJRQkRlVEdx?=
 =?utf-8?B?Y1RtNGx0aUZtSVpUMDBHUnYyc2dpckdmQmFQQUwrRjQrSU5GdkdrWHdNbzZQ?=
 =?utf-8?B?SVBjRjlyMjNSUjdUaStPb21xczhWK3RiQ0lNeGdDU0VuOUI5SmF1WnV5UWN3?=
 =?utf-8?B?bWppRzZWVFNwYUlHQUFmOStsbDZ6K2Jpb2hFWWhMSlNrbEpKWkRwWWcrZXJF?=
 =?utf-8?B?clVUUklLbHdZMEU4RFh2Nk93MXlhaVBqUk9KYU1aUjhxdUtacUk0QkFzcUtX?=
 =?utf-8?B?ekcyUFNUa1M5cFN1bEk4c05pWXlnb0V1ZmJFL3VlUzAzZUQyMU14QlpNSC8y?=
 =?utf-8?B?SVFNUEtRQkdybFM1ajhWYm9JdWlveFAwMUtvVVRyYmwwRnlnenBIOXRGK290?=
 =?utf-8?B?eS9RMUZQWEFxV2ZhMTF2dUZCY2Vkc3l5Y2R1dHFTT1lPYmNRNFJCY1dzRHNT?=
 =?utf-8?B?QWZVVXR4Y3hxMmVFZTlZTUFtSUI3alV4VmhOMURNSlZGWUUzMEt0eFlIdVpE?=
 =?utf-8?B?bUx0SnlLSUUxbzdRak85TFY0TDZ1ZkZYSnZBVThrWFQwYjdCRHRYNW00RUZp?=
 =?utf-8?B?WU9Uakp4SXpDelIyMFhDcFhIbytINTVRY3A3MXVEZ0xMdDFJTjY4WDRqSXhl?=
 =?utf-8?B?ZXBaSFp0QjluM2lmR3JjSm43MmJsMzkwby9wcmh0Sy9SdDVIelpOT0hiS2lK?=
 =?utf-8?B?SWZ5S2NXTXRrWUZFbGZwdzF6dXkyZ2hDNDJyR3lHNUdQaU1GQUgwc1hzT2Z1?=
 =?utf-8?B?V0VPQWY0TGZUYVVwQVhiODNjdGQ0aStFOWJ1b0R4bVFVVFQ4U2IrWEREVy9W?=
 =?utf-8?B?dkN1eWJwWlg5WXpqSy9xZ0xiNk9GdUVpTFhQRkJNNjhrV2RGazNxbVJwUlBO?=
 =?utf-8?B?b204VGRwbDE2WkgyVTBZUDdaOXlEaXJ2djY2SnB2RTVoUzVOZVJlYjVLeHNR?=
 =?utf-8?B?WFg0R1RXMjRMWnF1U2ZMRVlDRjhuTStpNEtjd0czZmRya1lhdUNPdVdma2dE?=
 =?utf-8?B?L0ZPU2FOZEl0c0c0bnNuV3B0UmU2aUcyUkR5Y09UdWFDZXRPMzBKZ3dsMk5P?=
 =?utf-8?B?cC91RjZjelE5c1dUM3hGZ29pV0lXN3oxMG1iNlZsK1owZWR2bTN3U1hFY3Fl?=
 =?utf-8?B?Rm9kUjNjK2hjTndyQWYzTTBGeEFIR1AvdUJ5ZHNvR3lRYkI3S3UxOFM4Vlhm?=
 =?utf-8?B?NG5qQ0hxYWRsUm9oeTFZVTd6MElVYTY1UHFlczQ2UG1lNUIrUEVrY0srMG0z?=
 =?utf-8?B?OFlXc2VKenpZb0trc0QrTUM4ek5WYmpvWkJwTkFHQWVxaWtpeXVSZE85SHlZ?=
 =?utf-8?B?VHIwRnQ3aGV6ZERXVFBZR0d1a01kQkRHWEx4MnZ4dm9IRVNHL2hhYlJSdER3?=
 =?utf-8?B?ZTFVck11V1FkN3U4dXFreGtYZE9HeEpQRjNsMGNHZHFabURqUmd5OFpmcHgv?=
 =?utf-8?B?aXVzS0g1bGptREh2c2QxTWh5Ym8yRU55TmNJUThuQnd2a2p5Q2hUOGQrZ25X?=
 =?utf-8?B?NEtXYXcvYjFhVTg0VlMwcVF5WThYeWJEbzZsRzI4YnNKdXpFbmw4RUpZcmFa?=
 =?utf-8?B?LzBxWHRhd0ZSc0NHZG5xL0ZoK0Q4MFdIQUs0dUFjcG1CRkwzVkpBamhvOVJh?=
 =?utf-8?B?RVoza3JtNXNRTGlnNTBRaU1CZXpUeTdpYWRBZDBEeVF2dncxVW9ZZ3QzQ1c4?=
 =?utf-8?B?ZVlsR0s4THpqYlBPKzZHNVlHWGdFbzhDcHptUDNwM1BIQTdNNzJBZ1RNRFc0?=
 =?utf-8?B?bVphOWNBN1oybCtnem42RmZuc21NMldjcTdKalR3VnBScXJvVXY2SVp1T2VF?=
 =?utf-8?B?dkxOekpkVU9oY29sTTZEZTdXNDNLZ1dFMElaczRuN1IrUTM2UGdnalBSQi9M?=
 =?utf-8?B?MjJRaTFxNDdqN0NYUEFCNjh6Y2RWVnllczZ3cXlocTloRi9hdmNmUFREVm1G?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7445828-99da-4a6f-797c-08dd4b8a7998
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 17:27:07.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu4Cd3gSy9njKK5TRkqWyZkrNtGVEXzkrciZoezb8e91FefngivhGk4Mtj8Xlv6ZO3creebHJ5DMV8YinTk0Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211263

--------------dR00lyIKp1lhCGG0FuDqAjLl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 16:06 schrieb Richard Purdie:
> On Wed, 2025-02-12 at 15:36 +0100, Stefan Herbrechtsmeier wrote:
>> My problem is the double standards. We support a fetcher which
>> dynamic resolve dependencies and without manual update step since
>> years. Nobody suggests to make the gitsm fetcher obsolete and
>> requests the users to run an update task after a SRC_URI change to
>> create a .inc file with the SRC_URIs of all the recursive submodules.
>> Nobody complains about the missing components in the recipe.
> FWIW there have been problems and complaints about gitsm. There were
> some people who explicitly converted gitsm recipes into git urls due to
> issues with the fetcher.
>
> We have on the most part dealt with the worst issues in gitsm now but
> there are still some who don't use it.
>
> With git there is at least a relatively wide understanding of the
> technology. With many other areas like node, go and rust, the tools are
> much younger without some of the features we sometimes need, at least
> in the past and people's overall trust is much lower as a result.
>
> At this point I'm not sure there would be demand to change gitsm but
> there are still the concerns about that approach.

>>   Whether we have hard requirements and introduce a git submodule
>> support which satisfy the requirements or we accept the advantages of
>> a simple user interface and minimize the disadvantages.
>>
>>   It doesn't matter if we run the resolve function inside a resolve,
>> fetch or update task. The questions is do we want to support dynamic
>> SRC_URIs or do we want an manual update task. The task needs to be
>> manual run after a SRC_URI change and can produces a lot of noise in
>> the update commit. In any case the manual editing of the SRC_URI
>> isn't practical and the users will use the package manager to update
>> dependencies and its recursive dependencies.
>>   
>> As a compromise we could add a new feature to generate .inc cache
>> files before the main bitbake run. This would eliminate the manual
>> update run and the commit noise as well as special fetch, unpack and
>> patch task.
> I've partly being trying to channel some of the feelings I've been
> hearing expressed in different places, as I do want any new solution to
> meet the needs of the widest group we can. If the .inc is generated but
> not checked in (to remove the commit noise), I suspect it loses some of
> the value that people have wanted.

It would be helpful if more people participation in the discussion. It 
is hard to understand why the .inc is needed if the lock file contains 
the same information and common tools exists to manipulate the lock file.

> I'm personally very torn. I get pushed many different ways, which
> include robustness, simplicity and complexity reduction, performance
> and various extremes of auditing. I feel I'm doing a bad job of trying
> to represent everything :(.
I'm sorry for that.

> I do see that there are basically two conflicting approaches and I'm
> not sure everyone is going to be happy with either. This does worry me
> a lot and puts me in a difficult place too.

Would you accept both solutions?

--------------dR00lyIKp1lhCGG0FuDqAjLl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 16:06 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type="cite" cite="mid:8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Wed, 2025-02-12 at 15:36 +0100, Stefan Herbrechtsmeier wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">My problem is the double standards. We support a fetcher which
dynamic resolve dependencies and without manual update step since
years. Nobody suggests to make the gitsm fetcher obsolete and
requests the users to run an update task after a SRC_URI change to
create a .inc file with the SRC_URIs of all the recursive submodules.
Nobody&nbsp;complains about the missing components in the recipe.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
FWIW there have been problems and complaints about gitsm. There were
some people who explicitly converted gitsm recipes into git urls due to
issues with the fetcher.

We have on the most part dealt with the worst issues in gitsm now but
there are still some who don't use it.

With git there is at least a relatively wide understanding of the
technology. With many other areas like node, go and rust, the tools are
much younger without some of the features we sometimes need, at least
in the past and people's overall trust is much lower as a result.

At this point I'm not sure there would be demand to change gitsm but
there are still the concerns about that approach.</pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp;Whether we have hard requirements and introduce a git submodule
support which satisfy the requirements or we accept the advantages of
a simple user interface and minimize the disadvantages.

&nbsp;It doesn't matter if we run the resolve function inside a resolve,
fetch or&nbsp;update task. The questions is do we want to support dynamic
SRC_URIs or do we want an manual update task. The task needs to be
manual run after a SRC_URI change and can produces a lot of noise in
the update commit. In any case the manual editing of the SRC_URI
isn't practical and the users will use the package manager to update
dependencies and its recursive dependencies.
&nbsp;
As a compromise we could add a new feature to generate .inc cache
files before the main bitbake run. This would eliminate the manual
update run and the commit noise as well as special fetch, unpack and
patch task.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I've partly being trying to channel some of the feelings I've been
hearing expressed in different places, as I do want any new solution to
meet the needs of the widest group we can. If the .inc is generated but
not checked in (to remove the commit noise), I suspect it loses some of
the value that people have wanted.</pre>
    </blockquote>
    <p>It would be helpful if more people participation in the
      discussion. It is hard to understand why the .inc is needed if the
      lock file contains the same information and common tools exists to
      manipulate the lock file.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I'm personally very torn. I get pushed many different ways, which
include robustness, simplicity and complexity reduction, performance
and various extremes of auditing. I feel I'm doing a bad job of trying
to represent everything :(.</pre>
    </blockquote>
    I'm sorry for that.<br>
    <br>
    <blockquote type="cite" cite="mid:8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I do see that there are basically two conflicting approaches and I'm
not sure everyone is going to be happy with either. This does worry me
a lot and puts me in a difficult place too.
</pre>
    </blockquote>
    <p>Would you accept both solutions?</p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------dR00lyIKp1lhCGG0FuDqAjLl--

