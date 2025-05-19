Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4B9C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:10:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.web10.47871.1747649389737934774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 03:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oEUXouun;
 spf=pass (domain: cherry.de, ip: 40.107.130.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0k/JGC6FGNUSRyC9CB+4rrJaL3SpEBnPAfUHVZmKNmNnKScwOk0Cmwvddefc0/Sb4ePSolJLP3uNomJk4UkWAKNmiRoylYQPQzYQoRsXmh/wIpodVOjcc791gKq21iTLNFWUCuvBe4xtLjLjiPcXSVpV2uPj/rNjqmYranNOm/yvaNcEel35dKyPhsdFD5ogYSv+WYPvkq3L7BLh06XUkd6QorLtwAriavwbFm0UksQNCuwseptLu3czQcgK6SPEwIpj/dSEmv6swxKRtv+Rjgpi05Hb6w/A7mHespu/jA4gCgz6F2p38tBR6jKQZD9+QTBwm7uwZValaw/+bxbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASU2yOuoPbeP2dF0brPYq+0OoJlYMSsjcgkff0FIF/Y=;
 b=TJdQiAdW15vcGJs+j/a3IjFpndyJJdm6kZgDZWKd++blAS4RVU8flUq1bOpEWL/99BkZm6nA96VNBGEwAABoZwHm3nstmMLn8/1x+nWNJ6YFQmoaQfHzxEjvI2FjFntM4U3RRDmZYoyxCNMMTlSBD6ijTIZjPQJ61doqLKOHoRIfznNb69WFOZ5eUnPZs1a77jq3iIKGY36FHoTc/Fc4i8Pm5TraEqQar8+48HG3iVvc6Q5XpZ0UZRE5MnNtUzwAXceXWAlPGtZr6SwRiYhqkmqr5T2jvVewEeJClaI/GP0eGnukaO8gzw0huWnZqaZcGavNPSZdzH6fbTm92QelOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASU2yOuoPbeP2dF0brPYq+0OoJlYMSsjcgkff0FIF/Y=;
 b=oEUXouunEc1qA8CwdBREalnaF2eV2q5gKKaZezjewjA93gWFU1GL3JXCtIYl4W+2XTO83XShauC3PqNIw4bHEjYrnuXNNiTiKL6zJ9mZP4yk/QJHSltic+mhjlIsqlXaWJPVKR3aSJv5yvGMTNrHjin1uGgX5Q9Iy9Hlw2t6ahY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 10:09:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:09:46 +0000
Message-ID: <ef31d362-0a1e-4005-823c-9eb092a86701@cherry.de>
Date: Mon, 19 May 2025 12:09:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1 2/2] uboot-sign: Add support for setting
 firmware property in FIT configuration
To: jamin_lin@aspeedtech.com, openembedded-core@lists.openembedded.org
Cc: troy_lee@aspeedtech.com, vince_chang@aspeedtech.com
References: <20250519031732.1338100-1-jamin_lin@aspeedtech.com>
 <20250519031732.1338100-3-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519031732.1338100-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::31) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: cf952adc-547f-4b27-f77a-08dd96bd4860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHFqWVhjR2h2WWtTaEJiWEZrd1l2OHlTa0xMME56Zm1FNC9XeHBHVmFLM3Jj?=
 =?utf-8?B?NkZUZy9qSzdIR293MVFtZGt5MWdvVENyRWlaK2RZVlh2UTRNNkxXQnRhVDhq?=
 =?utf-8?B?ZTRTRGJycTl6ZVpEQjk3QUJmZThVa0JjWkdoRjFRQTdxSkRmWm1Bamt3Tmtp?=
 =?utf-8?B?VGd2WVRsNHZqc25Ba0lVM1ZjN0w4UWZaSEtvRW9TS01wdkY4ekhPR3pMMGFB?=
 =?utf-8?B?ZEt0OERZS0dmWHJMUzVxUEVWWlAweHBsREdpamNxVE5iUTVFRFFsb0Nxdm5M?=
 =?utf-8?B?LzQwc0Z4cU9ueFBRc0ZRMENrUVE3Vi9PS0pETTk0NjdJc0NWcE4rNVplY2pn?=
 =?utf-8?B?bzJySTVXLzg3TmVmOTRtemRSaWJGN1R0alU5NWlUZHlTck1EdnE5K2dMVjNW?=
 =?utf-8?B?VVFUcGMzOWNNS2thY1QrMURCdFdaNVZ1T0pxVVhtc0tWNmlQdWdHKzU3WVpD?=
 =?utf-8?B?OU1hYXhGaUNGQ0FCdkgxMzMyNWo1SlVYa1A3b3JOQkhVNEtuaUFmbndXZTFS?=
 =?utf-8?B?MTk5YkJ1TVBkK3hKR2ExT3o0bWl2M0t6QXFjbnRJQWZvREdpeHF0UTVpSVNp?=
 =?utf-8?B?RGdDTjBha240VjNLTk9uMkk1WWQzSUFZMlQrZ1FobUJYWGdyUGFmaTRkUmVN?=
 =?utf-8?B?aG92bS9ZbkhHVGxtemprN0lETHZzcVp5eVpNcWkxQjRyajk2NUprSTAzSEsx?=
 =?utf-8?B?bW03N1VYcTd1YVh5N2loL2lRbHZHTDQ5UWJ2Szk1ZTRWa1lqRG10RW9Nb0JX?=
 =?utf-8?B?dTk3UEtrUHAzV2hvbGkyS01pK3JXL0o2ZlN4eG90OGFzM085ZzkyTlE4NWZv?=
 =?utf-8?B?ZzZsYytsRUxPSXh2SFZTYjdTeVVOYzdJb2xGdGIydDQzRmR2QTluQVpoUThU?=
 =?utf-8?B?SEpQMDQ5NlBhdE5UUzVidThucEhLbEZPZDJXYk9uUWZ3VS80U2wvdnRvVi9C?=
 =?utf-8?B?SjVOSmtVemt3RUJ3TDJ1U2YvbUxZTzEyd0tOZy81TE50ZlJPOGxyQmkzbmty?=
 =?utf-8?B?aExCNXgxa2t5T2UyeGxINys4dk02aVRhNFJ0QlJMTHh5WXZlM0tTNGxpK3hs?=
 =?utf-8?B?aGIxOWVlTURNd0JMYUttZ1VYQU9SZEkyRUF2VDhOY1JWSnBQK29kR1VleFp0?=
 =?utf-8?B?K3FKTlhaZnNwSUVSVzBFRTBtckRVVzBxN0IyMGpJOEFzVGVvcUh3WlJJdmFt?=
 =?utf-8?B?TjJGNVVxRDlGZmRqTFhrN3dRVTlkVHlEWkpNZjcwYlBEa2dQRGFEL3V0QVNE?=
 =?utf-8?B?VEFjQ09KWlZEMVpzMEtWVERYa0xFYStSb2VHS29qVytQcEFLRWt1cnlyNWtP?=
 =?utf-8?B?TlNia2ZlQko1ZEsxckI2RnM0dExHeS9lOWxPZEJYckRZWkswOFVobXZHS0hM?=
 =?utf-8?B?VmQ2SEsxYksrVG5Id3dQUm1Ua0x6VTArNzEzMG12RzhobHI0WFJCelAzeGJo?=
 =?utf-8?B?KzQ2TkN4T0o4QXNLcjZFL1ZOR1hPcS9Jd3p2Z3RUdjVveTF6MCtTRVhkbTJl?=
 =?utf-8?B?VldhZTNsWUlEdmZuMDZnU0JXaDZvcDE3RGluNWxpUjIvVTNYMk5xNEFycVJ2?=
 =?utf-8?B?ZkdNS3p6aWVvVC96ZkdtRE9ROGJGTjJaK2RqQ1NkK1ZiY0lyUldUaDVNa0w0?=
 =?utf-8?B?VnhxcDJBb2pUZHcvd2tHVWt4cmRmVkh4MmpHakdndGE4VC9nRVRUYXFaY2dR?=
 =?utf-8?B?Q2grVzl0eDJ1dVBHRkxFZ05uL2VpSExWaVBJZ2xObXlpZXhySTlmTE9LYXdj?=
 =?utf-8?B?UWtlclJTcElmb3J5QnU4clh3dHNkTTR2UmFqcStSOVhnMzN1SVVxWmcyT3cx?=
 =?utf-8?B?aEt6V09BNmpCeHU3VmxySGQrWnJtcEJQbHF4V2VVN0NZdm9oUXBSSlRjNzUw?=
 =?utf-8?B?c3MyaUsxb2R4Tkx6NGtDa29FN2RGekdENU9Bei9jdGRkMmU5WnloUWtObXM1?=
 =?utf-8?Q?6xN0K9ebHx0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDg4YzMrOW9WNUVENGMyVU9RZlExTU1xTFdqLzYzL0tTU1NUZHVXRWhmc05r?=
 =?utf-8?B?V2ZscjZTeUlXeTR1TjBxZjV6M1FtWlFncm5QU1pLNERwUU4yN2JJTUVkdU1Q?=
 =?utf-8?B?UVN2V0xTZ05zbStEN051dU0yaCt1ZDNkYUhDTVc4VVNlSDA1b0xLL2RnWEc1?=
 =?utf-8?B?NERWaGF5S0hoakw0RDFJNEsrdk9BNi9tK1pKNWZuQUZCWitpamZ1WWV1bk15?=
 =?utf-8?B?bTV6VnVNNmtFZHhxQ2V1dkZFVHN2RFBTWkt0M1hYY2xVZlVtVmpJbER6OVZy?=
 =?utf-8?B?bndqY2Rhd3k3UHFpSW8zbzBVQW9jcm9NeWZhYUtnY0M5cnlyTmJJUVdsRHJ2?=
 =?utf-8?B?bzlJc2dXUVF3V0FZZVZJeE81NjhOV2dlZWp1TWpwSmh1N1dCdFFNQWRlVnVr?=
 =?utf-8?B?d2g4QWNXbjg5a083bnErRFp3Qi9PNXRoUWxBTnNXZ0w0SFptY2N0dmlXYTJS?=
 =?utf-8?B?bnhBUS81c2RDMTBTVm8rVGw0UlJDUzV1ZWNhNm1IZ0ZCbFpxWitWZURUcTJD?=
 =?utf-8?B?YXhYMDh3M0tpT0lIWnZDYm5GMEt3aGZKQXBqNzNUcjk3S0g4aW5NWWljSjlx?=
 =?utf-8?B?eGlQQUpTenhLZW8zalRla0FxcERXajZ5R0hvbTViWkJmRlo1eUp2eFhCTE1t?=
 =?utf-8?B?OXZQbzhtQkNtYkJuS253N0RoNTZsR000MVM1dUE5ODl4bCtHQnY2cUdjWUxH?=
 =?utf-8?B?dTlna1RZeUdYMzR2Z29rdVFxNFRRSDRaUkpZYkFQeVZEd3ZKRXA1Y3RhUHBz?=
 =?utf-8?B?cW9uTHRHTHl3RkpZYUhlOUNhdnRXTkQwT01YTTNtKytYL3hETHVQRldyUmtp?=
 =?utf-8?B?RFhJS1ZBdHNZTGh1bUdtYkdSYWhTc1B3dmd6QlhNV0V6NGJPK2x4aXdBRC85?=
 =?utf-8?B?cWh2M1o2RTJ5WDVPSkRieW41MzF6WkdZWEhSR1lIZjcwN3dDZ2kxMm9CRnZm?=
 =?utf-8?B?ZUc5WmRWMVY3akY5cllubU4vV0NtbHRHZnEvZjlhd2ZibzR4QWNXbjQwcktS?=
 =?utf-8?B?dWlBOSsrOXlQaEtXUjY0U2JOTGxqM0FwZ1hsZEptNFdwMW54ZHhhTWg0NnpC?=
 =?utf-8?B?YUpUOFhPOEh6cFJ4Q3lPcFVHMVZUYzVzb1dyOVptSi8yb2xFbUI1bVllOFEr?=
 =?utf-8?B?dTltQkRrdHc4WGJmbHNTQURXeUJTL3NJY0paREdCZUo3V1pmaUE4end6Zm9k?=
 =?utf-8?B?Y2htM0Q0cTZtUnFlZFJ4dEdteVVFTSt0aHVXUk1UTnBUREJxSTJjOEYvMXFq?=
 =?utf-8?B?U2p6cmZGYWp4RFdreG9ydkF6VUcySlRxR1ZuS1B2RWl5SFZmUHhKR3RzVGpO?=
 =?utf-8?B?UDMzeXkxbGVtZnNNSGlYRGIyZ0RVVE1KRGI0dTBndkZBTExKQUZjaUtBbzlB?=
 =?utf-8?B?TE5KYktTUng0QkVyVzlqL1JxMEdxcFV5eC9FYVp6cFpQSzdWd2RTRTVjQzg2?=
 =?utf-8?B?NVlXSm5qcFI2bS92T1NRSEtwaFIvWXR3WnVPSHhCN2FQSEJhR2hEOWc1MG9q?=
 =?utf-8?B?dUpqOHNqWDUwQ3NnbGs4VjBCdVZNYXFwT3pxUzdacjhJYUdCZVc3dFRUanpZ?=
 =?utf-8?B?Vi9TZ1htOTZtZ3d1RU9qT0VzVXRxQlBmemRTbEp6c251Y0RCbWc5b2twUEJ0?=
 =?utf-8?B?Z2kycUJ5YXlkWUc0eHFMS3dvamt0ais3WjBLS3hJa0ZQSkpkY1crSXNIck9s?=
 =?utf-8?B?U0Q3MkFlTTM0TUNLUFBJeDNsQlFJYmI5YU05RzhUQ1huT3FJZnBhR25wWWQ2?=
 =?utf-8?B?enRaVFFwblFPc3hDOXdERWtFOGdockNGdkNLMldWOHEzeGJTOEFaNGhuTFVj?=
 =?utf-8?B?Q3hFVXNuUGlIdkt1UG5QcForbmE1a0l3VkovRHlQOHpBZTN0NnJTRVd2YWVK?=
 =?utf-8?B?Yzh4L25uclQ1NU1WMS9idVliZU9XTWxEb0xZeUVIU2Y2dUNZbXRPM3RLWmNV?=
 =?utf-8?B?dDB5WUFlcHZtcTZPaFhMY280bWdROERWNFlDYlM5ZWtxWTFSUEN0bU5kdXVN?=
 =?utf-8?B?eW1ETHU2SWNJdTVDdU95YUNXTWxLU0RKcG9CS0ZKVXlRNHMwVkhROWxEcUJE?=
 =?utf-8?B?ci9Oclo4L0Z0ZGlSWHkwVnBVVkwrMjdTTHgvUzVIQ1lWdHo3cTJ1ZlFTRFBj?=
 =?utf-8?B?c2YrenhLMFU2aXM5L056WFpYeXNGTDcwU0JicFNSSEx0YVlMNmpHYjJUMEJs?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf952adc-547f-4b27-f77a-08dd96bd4860
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:09:46.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlW/O7RljE1gSX68Yacd72GbZE+DqSWNSXfqMRflWVpyhlxAXv7HLAaS28S3Tfm2WwFm/484iC+tRy9gGYLORKG0I/JDbpFkjvBIfjw2JyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216829

Hi Jamin,

On 5/19/25 5:17 AM, Jamin Lin via lists.openembedded.org wrote:
> Add the ability to set the "firmware" property in the FIT configuration node
> by introducing the UBOOT_FIT_CONF_FIRMWARE variable.
> 
> This property defines the primary image to be executed during boot. If it is
> set, its value will be written into the FIT configuration under the "firmware"
> field. If not set, the bootloader will fall back to using the first entry in
> the "loadables" list.
> 
> Using this property improves control over the boot sequence, especially in
> multi-binary boot scenarios.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   meta/classes-recipe/uboot-sign.bbclass | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index dcf94b7179..92bd620f8e 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -101,6 +101,10 @@ UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
>   # User specific settings
>   UBOOT_FIT_USER_SETTINGS ?= ""
>   
> +# Sets the firmware property to select the image to boot first.
> +# If not set, the first entry in "loadables" is used instead.
> +UBOOT_FIT_CONF_FIRMWARE ?= ""
> +
>   # Unit name containing a list of users additional binaries to be loaded.
>   # It is a comma-separated list of strings.
>   UBOOT_FIT_CONF_USER_LOADABLES ?= ''
> @@ -439,6 +443,13 @@ EOF
>           default = "conf";
>           conf {
>               description = "Boot with signed U-Boot FIT";
> +EOF
> +	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
> +		cat << EOF >> ${UBOOT_ITS}
> +            firmware = "${UBOOT_FIT_CONF_FIRMWARE}";
> +EOF
> +	fi
> +	cat << EOF >> ${UBOOT_ITS}

Maybe we should rather follow the same way loadables is set?

e.g.

         if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
             firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
         fi

         cat << EOF >> ${UBOOT_ITS}
     };

     configurations {
         default = "conf";
         conf {
             description = "Boot with signed U-Boot FIT";
             loadables = ${conf_loadables};
             ${firmware}
             fdt = "fdt";
         };
     };
};
EOF

for example?

That should make the configurations node either to read in-code?

Please also consider sending a patch to the yocto-docs project for this 
new variable.

Cheers,
Quentin

