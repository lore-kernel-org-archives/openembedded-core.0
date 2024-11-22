Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2025AE69174
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:22:17 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.85])
 by mx.groups.io with SMTP id smtpd.web11.28594.1732292529472247516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ERrOMwt6;
 spf=pass (domain: cherry.de, ip: 40.107.104.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVTHLjUe5qRIA9gxHeNRQB5D+/9/kUo+S5LX8oN2BcbWtlhJruRc6n7aWpcGan++RlmT61Y8B2g9SDNkJulPCIGijHZ/Fg9BIhmdMwwi6aCMdQA5W3N6fJ+IcwODJjbrGciIzCAN0RhLctOsVG2BD2Wy9FtgQD/z7MjR86vjvNRa0dumY5+N9MRegqU6BYMetKDWHX+I3Vhb7188VzTgNpA88Ze4NT2w9ELAsfjNZijgf4O6oONr8TfOZEWzJRdGcy9A29Oxn+Mc1Z0zPSgf2/0IJ5cE+j0dyKYP100hCmX9LnKImkNuX6GAt88GRe1yRx5/0pBzmx3CWWq2Me6eOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuCJVL8LTDTcUcFF0FpllJoCamLWsUVNB0P30zavscs=;
 b=VB2MoZO/vwZbssIJV9mW2zqOpmKEThL7Me100hlpq7yagdpVKPBp8rAc8xW+2QpNA/0iBh2aa0OiIACnIwBklVRE/Q8dHJDFyB6kLLCPyqAcq72kqH7eSoP9VIlhAz4YdTvI4dqEUoprDoShd3LDn5ivZMcvyQYXLAB3SOk2eTCmWpvcKgo/WZYHXZlTKlUai8dLmt+cU7PvCtOF0b2O7PHswNbeAYDxnMn80hWRs4il1M089BRvFkS9J3R4OUn4MLj9sEe6wDnoi6rrRs8HKfruL011tvzKn8ZIjlKUOx++jYlg8UVyGnMeBZqO//DKgnrekXXIQx45lP6YD/TM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuCJVL8LTDTcUcFF0FpllJoCamLWsUVNB0P30zavscs=;
 b=ERrOMwt6mCaqDE6AplBMwvZnTSvwo8OLEe9Y5ybFKD2+OaYMTUph635mPBwOoVjRG8g+SHstuArTFZwR/c0vJAFccr61yAiK6IQsSd0jcSw6nKio1qxQaYHnzif1J7uNnqBLMl8+A2Ess99vHMhCvR6Fp1O+6ThVSr5R6Bx5tyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6834.eurprd04.prod.outlook.com (2603:10a6:208:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 16:22:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 16:22:06 +0000
Message-ID: <40520d80-5548-4195-9c70-bc7fbfbd8ab1@cherry.de>
Date: Fri, 22 Nov 2024 17:22:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] spdx: Fix SPDX tasks not running when code
 changes
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
References: <20241122154939.2133845-1-JPEWhacker@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241122154939.2133845-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b58ef95-aac5-43f1-2f23-08dd0b11cb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZHdlNUF3eTBzWnRqT0Y1aVR0TkpRSTFhT3F6V3VUaHA3cDRBTGxzbWxNN0dn?=
 =?utf-8?B?elFyQ2NWU0hocHQ3dVJmZk50NkR5bnNHMFJveGlpNGhTbm04cXNML1FCMmZa?=
 =?utf-8?B?aFZuYTk2WVBXM0F2UUJVaCt5MlFIZStpOEo0dVNIemlVaG8wZkVEaW5jT3ZK?=
 =?utf-8?B?Ry8vRkg3MTBuRklOckdTTHlpaUkyUkhaU1pTMnRrWEIxV004Tkx1MlByUEJQ?=
 =?utf-8?B?dkR5eTZ3S25Udy9EMGx0OEZuOVdxNk5ZTlQwSTUyYVBjNEkzSzJnZjUxcWcv?=
 =?utf-8?B?aGpHVERpS3pzTGhyQ05HSmRHNlpTTkxzRkF6b1VjTTg1c3Y2RDZuNTNxcnUy?=
 =?utf-8?B?WDcxZ0J3OXVxUis2M2xyNFpJSHZ6cWN1SnA2NEtpVkxldnpWUmgvY21FMGQy?=
 =?utf-8?B?TXByamo1T3pobkwzcmtOVlBjYldXTElKbHVjLy91Y0d4RHhXM0E1eEhYRzRD?=
 =?utf-8?B?R3dUSUMvQXBtamY2MTgwS3ZnTDV6Qkh6eE5UV0pTWVh2bkdwWXp6NFRmT2l4?=
 =?utf-8?B?MzVrbDlMUnhDS0Z0WnB5NGU5RVMwMkRnMWRjNFo2dVVNcjN4Yi9zbmFPNmY2?=
 =?utf-8?B?aVZUTnJpOVR1b01seU9EUmE1UDZjaTE2YTdqZGwzbjNMN0xlT1dPcEFGQnUv?=
 =?utf-8?B?OFdZSG4wT0o1cXhyNlU0eGRVZ09nU2ZFTXprMlNOTkRmNlN6S3RpbTJTeS9E?=
 =?utf-8?B?RUtubklJVGxISEdKRUpPMUxETXI0ZitSckQwU2NDc0xsUFgva01yeWhlcnBU?=
 =?utf-8?B?WjE3SnhhYys2V21MdUdYeEk1M2JKQ1BHYWl1ZGJzUFcxMjRWZ1R5V253OHpm?=
 =?utf-8?B?bVBkWEgweHBVeHl6d2dBL01FZml3Ulg4NzI3UEExaVdVWlFJQlhTK3pTb2Vr?=
 =?utf-8?B?VXdEZWQ2cEtpM1lJbjk3bGhGQmF3VFBzU1NhMjZDVnFUSVQwb0NCdXpTT0dn?=
 =?utf-8?B?OGRadllrRnZLWFB0RlI3Yk1xTVV4NWUvZGtoL2lxbzkxVXZnSzFEaElrMXR0?=
 =?utf-8?B?UXVPMUtSU3RKRkhGbzl1MC9INnliWTdYVmE4ay9mM3BVTFlhZTlIYUVGdk1h?=
 =?utf-8?B?UDFCMTVmNWxiUmN4cHVlT2hEMU5hRFJQczk0TWxRZGRZM2JkWkhET25TRG8v?=
 =?utf-8?B?RkxOMmhRNEd2NjhucEhWYmZpU0JWYWdZZHFwYTV4K1ExU2JZT1A1bkl0ZjA5?=
 =?utf-8?B?azcwK0VpOXBudGR2UXpGb0p6N1JhNU5YbDU2RCsydnhJNFlCU21uWnVOdmlH?=
 =?utf-8?B?M3FLaFBZdFFoNjZSWWpjTDcrcXlGZ2xBRjIwbHVxU0V0Z2Q3dTVQanhkT1Nr?=
 =?utf-8?B?QWhTYzBBRVBkOEVzdWNXZFpEcEluVnNWZ2JaWTBYdmNQOE9ucUdEUU8rbVF2?=
 =?utf-8?B?dGlZU3BZOXdya3FjNTJmcTROajhQL3hVb0VpT2NucVdnUDNkS09ERXI0Sldx?=
 =?utf-8?B?SWo4dC9Ca2lmVjZWaXBrNVdsRnVsTElIUkUzVytwTklJRVhjSDRONFpONHMx?=
 =?utf-8?B?SUhTdms1cU1weUZMZDdGSFdHbzYyZmd1eXVVRm1ZZ0NoTndIcmJyMittbTBo?=
 =?utf-8?B?MDY4YUw5MkNTRllBcklkSUc5bm9XVjV4ODdIeUQ3c2FQNXpzbGthcmtWeWJl?=
 =?utf-8?B?a21yYmdOV0RlcHV4RndxL0VlaS9NQk9iSE56U3BXaHVTNmE2dU5WT01teEhN?=
 =?utf-8?B?djZYSkk1akNLZjYwTGpRVW12U3ZCMHRKczhjVS8zc1pmWFAra2RmNzgvR0Mr?=
 =?utf-8?Q?4P9ttYOUSJlf4fpNcY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OE91YmpOc2puVDdsZ25Wd0RQTmNTbWcwYXNNRFdQVGwybTA5Q0EwYXR5aHla?=
 =?utf-8?B?cHo5dFN5TEQwUEF3MDRMZkVnQVhrb1lxcjBoNVlrY1pHdmhtbytsb1huZHlU?=
 =?utf-8?B?ZHZ4dDNxY3Qrb2JhT2NoRHNsNDJwNEs5N2t4OXBhUm53bGpDYnBHSlU1RktO?=
 =?utf-8?B?dDZld0pVMTJ2N3VEbkxmdjdEQldQWmYzKzZaN05mbVhjenJYVHNzQXkwdzVw?=
 =?utf-8?B?NmdHTHJ5WGRqdEVJTjlKZFRJWXBwdGd5aGZ2WlpUc1Y1U1FDZXU5UExCazNP?=
 =?utf-8?B?SUx6c2hWTzdBWWNZTVZmc1FhM3dlblppTFllWDVkNnBQSllXUmoyUTBReG9J?=
 =?utf-8?B?ajhmb0krV2dOMG9hTDQyS1ZvNmN4QjNoYlpaQ2JPMWNkOVU1Zmw2cHdjM3k0?=
 =?utf-8?B?cmFKMWRpWHZKSHpxMnFGRHp5QXh3SmxjdlU0bGFJTFBibng3UENVWGg0Sk5m?=
 =?utf-8?B?dFZjeGIyQVNVc08rcGxCZFc2Y2l1SEZxUkptOTMyTjcrdnlJU0NtNnUwS3Rn?=
 =?utf-8?B?WUd0Si9YTnpPbUo0YU5pMEl1dTNFTUpLSjBDdmk3UFRud1Q0Ujl6cEUxODZa?=
 =?utf-8?B?SUh0ZFV0cmZaUW95Z0xlSldSRDBTSkIvajJXaVc5dTVSMXBRelJSUlZyQi9w?=
 =?utf-8?B?UCs0MU93THVTN1dpa3ZoQVNTK3pZZThZOTZRc0t4ekFmTDFaUjZPZTl5S2VJ?=
 =?utf-8?B?OFVLTUU5NVVWcTduN1NReVJVanpBVkE5MDQxU3U1clRSenRrVDJUL2JISWQz?=
 =?utf-8?B?U3lTT2RaamduVWFyaWVPajQ2OWpxNUFGY0Q1aTB5blZMZUIyOFM5dGhoODQ3?=
 =?utf-8?B?aXJCcURMWGhqL0VXYlY0NVhCTisxejFNbEpJdysxQkhrZGZZdGs3c1lQemI2?=
 =?utf-8?B?MllHNk9qeTJYRmQvS05aNGZQUitjMVhMdW85SkE3Ujh4Ym5sOSs2eEZ2N05z?=
 =?utf-8?B?SnpRYWVmM2F3aTNzS1Fjc1ZkM0hpZ1paL0xSOTlCckpvZEkrQ3dETUNZeENs?=
 =?utf-8?B?cjFzR2k2dHU5QkFPZmZ6UEdXRStUVnU5YXZZU2h5Y1F1a0QxV2IxV2ZJdEF1?=
 =?utf-8?B?Y0h4b1FFeUVoUTdhVXJPNndvQmFqK1FIdmdJRmozcllId0gvODA2Rzh1U3FC?=
 =?utf-8?B?TkEydVpXNnRxZFFVRWkzOGV4ZnRMYUtIL0FkWTcxbXlrbUxIbkYzekY5TVYy?=
 =?utf-8?B?Ym1sMk1CT0d6M29meW5iVVZDSThhbW5vMzYzZVdlU3NxN3VSR3hTbWs0cWhC?=
 =?utf-8?B?RUJZOGhXT3loNDlUeUNyLzc3TTczSUIzaW5telJVSnA4SjFmNzdrWUF6Q2Jx?=
 =?utf-8?B?RktZMzBOMlR3N2d4UnpTUStVT3h3WS9yTytmRDd0MGpNOTQyOGc0K2pSbnRB?=
 =?utf-8?B?MEZoNk9xS2FjYlFlUXh2QWtOTHNGNFNRdnJKTTBzbXBQZ2tyNjEyUE04RWRo?=
 =?utf-8?B?YndEMGpVOXlwektjOVFkZkZtR3ViK2xEdGN5Umd3QTdZUEJnY3JIV2V6TDky?=
 =?utf-8?B?RDBrTXVpVDVubjQ3K0xLZHk2TDFqakVQZjhkeml5Y2NYTi9sT291aUdDYUVQ?=
 =?utf-8?B?N25oYTdOSEY2OU9BYitSYldnTXY3T2tpYlBqbVU1ZStRTElmNjZxeHVOWVNW?=
 =?utf-8?B?dkx1U0EzbnRnTmR5cjFEeXlyamRJTDduZ3BzNDFKcU81TWVDQ0Vka3JkN0ZD?=
 =?utf-8?B?V0huTFI3YkxTYTN5cXB6RXBEbFY0TTBrZkYycEozVm8zUDc2d3Z6WWw3Q1gy?=
 =?utf-8?B?SXcrVit3bUV0Zmc3bWx1eWE3WVBmOGtIbGNjclQ4aWFBZXptZUVjc1VpdGRx?=
 =?utf-8?B?aEVka040Q083cGo1OXlJVERGWEVLZFM0KzRzTjlFMTI2TVA4VGJEeW9qbHYw?=
 =?utf-8?B?Y1FTS0k1QVdsMGIwMEs2Y0gwclFBdWlqT21Ya0g1Y2FFVmN0cXZOcDFmYW1N?=
 =?utf-8?B?NlIxM0lpWHd4cTJqZG9LaHViRlpmN3oyTmZ3cnNWZkVBNllCN3hZeUlHZFkx?=
 =?utf-8?B?M1BzSlRNZFFXeUNWeTZGOHJEV0QxdXNDanIxblhJTk4rV3VUT1RNRnRrYi9W?=
 =?utf-8?B?L2NtUWY2QmdsT2JKMEx0NFJoSlduRDZrTSt1cEhBSEw0aTB3dWJqelNvdXNR?=
 =?utf-8?Q?yRZ2ATHc1HxbhbbleU5nhshBf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b58ef95-aac5-43f1-2f23-08dd0b11cb54
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 16:22:05.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO+XLdYFzB8GpWReBuAuxSR3nAFS42myBjagWdkzwJnxDy0n4IDKHizfre2soEAFqVlodKRNV2zVSTveeKDhrz9jQAlQoMoDmyZh4WxEIkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207627

Hi Joshua,

On 11/22/24 4:49 PM, Joshua Watt via lists.openembedded.org wrote:
> The SPDX code makes heavy use of python classes. While this works very
> well, the bitbake dependency parser is unable to understand how to deal
> with them, and thus changes to the class code do not cause rebuilds to
> occur. To correct this, add the library files that include SPDX code as
> file checksums for the SPDX tasks. If this method works well for SPDX,
> we will look at implementing something similar in the bitbake dependency
> parser that should allow correct checksums without having to explicitly
> add them to each class.
> 

Oooooh that reminds me of this very issue happening at my previous company.

I'm wondering if we shouldn't just add this file-checksums dependency at 
the global level somehow? Since one needs to call addpylib 
layer-dir/path directory in order to be able to import those modules in 
tasks/functions. Maybe there's something we can hook there somehow? The 
issue being we would either blindly reparse/rebuild all recipes when 
those changes or we need a way to check which task(s) import those modules?

Another option could be to forbid addpylib on a conf file and force it 
inside recipes only, but I guess this means we cannot use those in 
inline python in conf files anymore? which we do use in 
meta/conf/bitbake.conf.

The change itself looks fine to me though, wish I had this idea at my 
previous company :)

Cheers,
Quentin

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes-recipe/create-spdx-image-3.0.bbclass | 3 +++
>   meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 2 ++
>   meta/classes/create-spdx-3.0.bbclass              | 9 +++++++++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> index 18e6cf6dfa2..51446162857 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -36,6 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
>   do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
>   do_create_rootfs_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_create_rootfs_spdx[cleandirs] += "${SPDXROOTFSDEPLOY}"
> +do_create_rootfs_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_rootfs_spdx_setscene() {
>       sstate_setscene(d)
> @@ -53,6 +54,7 @@ do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
>   do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
>   do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
>   do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
> +do_create_image_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_image_spdx_setscene() {
>       sstate_setscene(d)
> @@ -72,6 +74,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
>   do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
>   do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
>   do_create_image_sbom_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
> +do_create_image_sbom_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_image_sbom_spdx_setscene() {
>       sstate_setscene(d)
> diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> index ea01a21cc59..855fb3d09f9 100644
> --- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> @@ -8,12 +8,14 @@
>   do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
>   do_populate_sdk[postfuncs] += "sdk_create_sbom"
> +do_populate_sdk[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
>   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
>   
>   do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
>   do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
>   do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
> +do_populate_sdk_ext[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
>   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
>   
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
> index bc23d2d2115..640f5490bda 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -122,6 +122,13 @@ oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNE
>   oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
>   
>   
> +# SPDX library code makes heavy use of classes, which bitbake cannot easily
> +# parse out dependencies. As such, the library code files that make use of
> +# classes are explicitly added as file checksum dependencies.
> +SPDX3_LIB_DEP_FILES = "\
> +    ${COREBASE}/meta/lib/oe/sbom30.py:True \
> +    ${COREBASE}/meta/lib/oe/spdx30.py:True \
> +    "
>   
>   python do_create_spdx() {
>       import oe.spdx30_tasks
> @@ -137,6 +144,7 @@ addtask do_create_spdx after \
>   SSTATETASKS += "do_create_spdx"
>   do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
>   do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
> +do_create_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_spdx_setscene () {
>       sstate_setscene(d)
> @@ -160,6 +168,7 @@ addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
>   SSTATETASKS += "do_create_package_spdx"
>   do_create_package_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
>   do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
> +do_create_package_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
>   
>   python do_create_package_spdx_setscene () {
>       sstate_setscene(d)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207626): https://lists.openembedded.org/g/openembedded-core/message/207626
> Mute This Topic: https://lists.openembedded.org/mt/109724577/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


