Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD74CD5BB6
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:45:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18205.1779461118904562213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 07:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UfsFwdr0;
 spf=pass (domain: cherry.de, ip: 40.107.130.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDQ2VOzfHe3hSs380cJ72u8k8tX5UWWpNaOWcG73UuhpaU6aKYBPWEOi9qsSNABrkNIafgCcmqbR3diAODv8xBuuzsVa14HCcMwr6Qi+S4F4i208oGTtGQwTW32IBW23exCWUDWc1kxeeiqaf2SfYrZXgax1Qcb43LZL5QNbFbXBm6n5jV/awVHaZw0Tg9SPLgkv/nY/idsha2UETJbf3XZg+V1HRczALH4fYLYO/7RP8HyfBWN70z2YAJA0u41jnlPpYFsAc8BfITqh1+w75WQV1Tfr2H3/u4FrozlRJ1771oe16ux8UAO1Vao0zL1ttSALRapUTlK1HLozd0Pw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59cOBD3AdnhS4dktiUeG/qygMU01/RLWNRhLmrmZ/mI=;
 b=F8HKlEV2qpP9J/WbzS6LFKTqgZ/SpJ7qaVpXD3gY3o2gcjvWf/h1vuaHw7n4P0WDUvISDMU8X1gffjsmXHlVcqW9NLZ03W3KyHSRkS3/sndmufCbEslQjyR5cQOrf4u8g5HbeFKiK8LT0WajZ+4vqpRS28zJ0umTq76JueElmFfWKbtHF/6DbhudcvJDzt5c101XTlvlElyHN+5LvkQdCaLdtzLfzz7j8mWDPx04CYidfG72X5WbMlJgev+LtuZuSYXFRXj+2bi6+lAZ+hS9T2EUrzWr2eb1pEDiXF42NeBBhLWLJJ5B6f5GTUx3ZvGUpeKCwSR83WOsJZ2kdTAxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59cOBD3AdnhS4dktiUeG/qygMU01/RLWNRhLmrmZ/mI=;
 b=UfsFwdr0z0yLEge5bM3RS8ZV8o68DOp511gOZ1UIHTKN3nQsKOuEE20KnkhrV+kG905YP0slHCjU1OPngjlDiIFL8ycuEjG2++otSinmIX9vFuq2rBVJaWcKvwJOkl9Fk7y9Rye/DwSwwUyvzKqWTu/jMf3xU5pGH60QRqgb/Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:45:13 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:45:13 +0000
Message-ID: <1477eb14-768f-4267-99cc-b737466c1cc8@cherry.de>
Date: Fri, 22 May 2026 16:45:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] curl: fix mbedtls detection
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260522130620.3973656-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260522130620.3973656-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 9849de86-419d-4ff5-362b-08deb810bb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zos5u1DKR9EIRvabaXpLqtl8PMKVYTG11jR92kpsmIiVRMGtQByn02PspnNvq0r5bcCDVxJNaUfB73BvR9or+Y3f5rh8+cOEXgtp4Z33HYyDLc/ByziFYbNsdC2dqBKTw7AXcv6NAJapPaJ7wWNhjV8CG3wOEdH2qMUqRes2sSe1pE0VXzMmL/EfFZG0dlaNJGqHxyoZYjQN9PNX9IACiSLhsWj2thcJWgBec5s2+swGE1AGayDkK7YIMTFMlxNR6tyTlBh7AM05QksILuJDsWOtSUfvemYldqfL7BBEXDT6zvM8OSJH14yV4Iggs8uC7Br49Alb6WV1DiwZST58AaV5Rq9cQfOvSSS6TOVlPXYw8H7FYk+rukcEiTTIOLY1H/sPq46yfC+e6MeXonX6chvlCkjdFfVLLmhtneJcG6SgnPw10Qesb7hJjbbMH6bJbCNTYBDKKT6tYBw2lUrSHLOZt40oGkXJRH+ICO1SnWybofuNsUvTSDt8ghVXM2dqd8J7VG3jrgp/fYJmTF69zhw3nEKdrxuzpSUAfpSRpDM+pOQ4SWt1HFXmZVPSj9B7UDcPJl049Y4NtBlFtlmc5vWFQtjUICYd6Q9z4R7J7G+jlMEoTtqYtch3Um65SjPDF3EVh9oXCkHw4k+Jpshr6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFZCM005dy9iRVVPUkR1V1F2ZUtkRTlLbWg1dnM5cGtmOW1BNGpOR0tERTR3?=
 =?utf-8?B?bThZQmk5cUlqRHM0RmtCclZwbTdRaDVTTEpaZTk4dGJTaEYvcDd0OTNrZEtF?=
 =?utf-8?B?K0hJOWRXUWR2d0ZpbWlRRVE4dXV0aFR6djUxSzBsQmc4eC9hMFFVc3JmNlRG?=
 =?utf-8?B?ZzZCTDR2cG5NYTZWMzN1MzhXOHFIbCsvUUdnNUd3ZlF5SCtURDZoUjZYT0p0?=
 =?utf-8?B?TVVaNndQRXlXYkNvbkFnVm9SVGZzTVZ0YVlaRUMwazR5TzBCRWhxVk8yWnA5?=
 =?utf-8?B?ZjRFREpzVXo0QVdpRHZPaHpURXVVLzZzU3FKcXRwY2dzc3k1eUVMaWJUL2sy?=
 =?utf-8?B?WFZkRTE1TGNlSVQvTXVXWEhTNzlOakFiMGZrN3BXcFVpQWZzbmhndCtlY1pC?=
 =?utf-8?B?RmU2L2xuUGhhTXhsY3VWMDNFY043Szl1NnYra2lzbnMxMlFFQ3c2b3BwUmV3?=
 =?utf-8?B?aUJLZ0sxeENhVHY0Wi8zOUlzVTl2bkVqUnhQbzNDZWw3SE83NE9zajFiQ05E?=
 =?utf-8?B?ZHc1WmdxRHEvZTZadVUxQjBNUUcrcGVQbjBEWUR2eGRHY0RDZ2JVUlo3ditu?=
 =?utf-8?B?WUZlbnRFd0I2ZUtGb0VRS3hOVGFWeTBaQ0VBUnNidFFNUmlWN0EzUXRHZTJz?=
 =?utf-8?B?TXBSei9RY0t6Y1FacjBjTUJIY1FWL0VWVUFqcVdwbE8wdVJxa3czUm9OTDMw?=
 =?utf-8?B?NGgvVzhpZGVNVklkeUxhSWc1Z3huQUVpUTRhNXRJYytlM04xSk5PZWRRRk9R?=
 =?utf-8?B?RGpOMUprbytNL2ZTOFBwWDFhRlp2YWU5RXlUbnlJVDhvV01uTHBpcmJ5MVdE?=
 =?utf-8?B?dnMrbXc0eUhhSDlYWlE1dVNIRlhuYStLTm5DdElsdXYvRWFCTzY0WGMzSnM2?=
 =?utf-8?B?cTBTME9tUm8rSEVvM2xvVEdacEY5cVRNQUpqYzN4NkFHMlphYnpUUjNUZE5S?=
 =?utf-8?B?MnlQTHFhRUhBc2plVDVpZlhZSnU0cW4wQUVhMjJsNHdhaWplMnE5bTJLUjNi?=
 =?utf-8?B?c1hqZTZXZmlReEljcCt1bGV5RWR3OWRueDBLT2ZrRVlUdGVnMUZ6a2hVekFn?=
 =?utf-8?B?V0E2QXVrSGVDY3VDREVZRERSbThTTE5TRTdXYXVubFNFQ2VlUnZhalRXOURM?=
 =?utf-8?B?TVVOK2ZRd3pBd2tFRWQ0UE1Ta1d2MkZwS3lTRzF3TWNGaHBKbzlYTTdrVFd0?=
 =?utf-8?B?OER3Y3ROeHhXcmdQMWxDWjlZcUpZME51T3M3Y0U1cDN0YkJiN01sUHJsVHVF?=
 =?utf-8?B?bWtBdHJhUWhSR0RYU1RjL2dmdXRYSGM2eGdqY3pSNTB1allRbWhNU2lJTlNu?=
 =?utf-8?B?alk0Nkpnc3FZcnNzL2pwUmVGTXdWWXZhUzBTV0ZwU2ttVTZjVUpuaUdGZVo0?=
 =?utf-8?B?a20zMjQzSUpMWFAvaExIaGpvRDhFcVZSZm11TnNxL2lZTHY1aUFwQjNBa3Y1?=
 =?utf-8?B?S0ZhZkl1Z0lpbm1JeldGbnFFMlZLcFF3dStrSnNjTHYvVnJ1TGRTb0xmUERi?=
 =?utf-8?B?c1NoaUxqR1lxV3dFVVBzSE9ZMWZpbG5XZDU3SDNwTXd0WkFJWkxJbWl5clcw?=
 =?utf-8?B?WXk0Q3puc3RHOTBtRnBiSGRheVZrYnVJeGl3Z3hLVTlYUzlvdVY1MU9jV3NX?=
 =?utf-8?B?ZkxKU0ZDTjNNamJVOGowMmpvME9rVWJnM3ZEQjJFQ0dzS2ZmeFVFQituOEh4?=
 =?utf-8?B?U015cUhGVHhLbldMK0VZNE9FQ0lwTmRvYi9nS2ErT2lpUFZmTE42Mnd2aGhl?=
 =?utf-8?B?OFZlV2gxbWZpSklkVEt0bEtxb2FFZFBuZ0l6a2xDVVpIeFJlV0t1WXpmUis1?=
 =?utf-8?B?d1R1UU9wbW50TTJlYzBCdFpqWlRVMjFMUExWVTlzSUZTTk1yQVhzYzYvYi9N?=
 =?utf-8?B?VTZyM2VodGo2OVVXaGs4VTBnK1JvRVFLUE5JRVdFMWJWSDZrY2luZng4YlJm?=
 =?utf-8?B?RDl5emdTcXF1dlR3N2FvWWhXSVNTZXUxbzNJcmNyK2lhUzdKR2d0cXRUZE5p?=
 =?utf-8?B?enJpYUMveEYxK1JVMXR5UWtsajl4L3RxckhjeCtzcGtMZ242NzA1VTQ0K0ds?=
 =?utf-8?B?Zi90R1ZVTVB2RDBLWmJRaXhMSFFPamRtV0toVWoxRWZaTHJZSlJuK2ZqSG0z?=
 =?utf-8?B?d1NPRE1pcHUzL09JRStjK0hJdm5JUmdBZWVFYXkrQjJIdW9VbGowTzBpUTdW?=
 =?utf-8?B?UnRlY3pORmtyN2VFK1ovQjFmK1FGU2ZyTURBYis5Z0dXSVhjdHZiSFRpM0Fp?=
 =?utf-8?B?anQxU2RNSXFoenNTS2ZtTVN4MzlFbGZENmQ3NC9JOEx6d1Bic2o5aWpEeG9P?=
 =?utf-8?B?QnQrUnFqUUxyR2tWRVA1QjA1S3c2WTB0c2dlWENIcVZYeTdmSmRBZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9849de86-419d-4ff5-362b-08deb810bb04
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:45:13.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yyvCigCA4sqwYmIf7yi5TWmXcH1GylqotbGHX9IjKhBgo340CQ9O9QviM3fNiEEqllDJCOMpTf/ryhFu4HmktKVtGq1GjqaFiANcG9dSHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 14:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237553

Hi Ross,

On 5/22/26 3:06 PM, Ross Burton via lists.openembedded.org wrote:
> The mbedtls detection logic in curl is broken and resulted in build
> paths leaking into curl-config and libcurl.pc.  Fix the detection by
> looking for a symbol that wasn't removed in mbedtls 3.0 five years ago,
> and remove the explicit sysroot reference as it is no longer needed.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-support/curl/curl/mbedtls.patch | 11 +++++++++++
>   meta/recipes-support/curl/curl_8.19.0.bb     |  3 ++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch
> 
> diff --git a/meta/recipes-support/curl/curl/mbedtls.patch b/meta/recipes-support/curl/curl/mbedtls.patch
> new file mode 100644
> index 0000000000..fb69d304d0
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/mbedtls.patch
> @@ -0,0 +1,11 @@
> +Fix the mbedtls detection, mbedtls_havege_init was removed
> +from mbedtls in the 3.0.0 release.
> +
> +Upstream-Status: Submitted [https://github.com/curl/curl/issues/21727]

This is an "issue", not a PR, so it may be misleading to say the patch 
was submitted? Maybe Pending (still with the link)?

Cheers,
Quentin

