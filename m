Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3521CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:06:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5457.1782302780409414870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N7Yi3rfT;
 spf=pass (domain: cherry.de, ip: 52.101.66.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaR8eEdP9v8zbqzmK89PGSxHwGakAaLuEamPbuh/pouQ69+FpMpUTkbbutzMw4Qd+Orfc92sTmpKJkpgsnSY0d0cMPsPrrM5myZniCIDXiqLeuVjjfGfIlDOBGSiVHnavvw6ZPHtASNHUSP5j1WsnTmbKhofM0FMppmaeH1Sz6NyQMwQ8z6s/XliU13E1zHzr48Nj/oie/kKRSINMp14n4QM87olP3FtW6Ddg4G5R0NM9OPr4DsiGSXL+lIphztmvS9sUXdWyT+YF+9LQGOJorxrTxI1wxUgirREnUzVeiPbyhVEd39RbYlzWL3kit+e80rZ6gityZxb1krbHyIE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey6okRkv58aiBJ13AEqA9uP4KXmt/wjlUTVpThhH6S4=;
 b=DE7K/tErTJjr14GhONrnx1MWzJPacmXRayNyue0Ss5sLVPbDrR9fR49oGvyCR2UH3Wh5FcHJp72Jh51Ubhisdb1Fld4opoMBwydNlrdIZJi/+4Tx7Pl78RSdxAiEpNdJilu95fYHOlQoXtEDzMQrFcA1ZainSdowmo+pmoqEsdcEBIenpDMIpVxPvmcv0LEVFfJMlW3SEhxNSsyMtlAmMIVEtWD+/eQ4pjGD8iA5hCIQj1L8keVzvNIod0vQvExWSpPzN5iq8FWNe3fW7miSKS+0qQ1+B/vl4S7nFiAGiEgfeiFDqUBybBDAsq6wh5PoVh1B7XLUuUHIvwCh5LVCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey6okRkv58aiBJ13AEqA9uP4KXmt/wjlUTVpThhH6S4=;
 b=N7Yi3rfTqCMbpbYOCly2GEnZt+6wT1pS5r7Ii2Mt+36UG91Fg8vxwyHU6WhnjglJyyZAjEDJeDmDPmeHqQ+gU7FEbFB9zgLm7MwU8qKeWu6tDNzJxJfYSpgI6Gw2Et6D1kAiR0EFAjW/g4ob/tbRVihTUGTxEmZQtb/ErW8fLTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 12:06:13 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 12:06:13 +0000
Message-ID: <e89fea6a-4cf6-4e1c-9661-48a40e07bba5@cherry.de>
Date: Wed, 24 Jun 2026 14:06:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/4] wget: remove pcre packageconfig option
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20260617173129.1013998-1-peter.marko@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260617173129.1013998-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0167.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::13) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f238df-16bd-4b77-ff8c-08ded1e8fc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	YztTzutxW6w8O8P9WkZaqwTF9N4Ofm2EwOK+A8e5fIdWyPNOiS8DmmnagoWysraSPGveZvuxLjhH834vZHdBm6OGGmdODB8CjYlsWiRX/kT8OIHGfYhbnFfbEynftF7RSPu5QU7wLxWBQGyhpBqdCpHaZAI4x34UWNqDCkaML/xZb7Mej8rO4k7er5LtQnvoQZ9ksPf1GsPsM6/uTOMq0pFeo7wiiJ+aHcFLOwZY4mA7Sso1+EJvSr1NeWPUJqag4PPRkeo5mcKW8zY/qSHYmb5gmaOdP/5RpU8SPDDTBIfqJ0nElAkfsC5A6mU143yYOdlMxHMSzTfP7uZSk4femRXN9LJiWKh2iVo7zA4yBYC9x/a4I92VKOxf1CkQWD3YnUsdBZ3sMEe55kFCI/bm3FTFcppwj/igmaY4/fMl5xuZTsJGKG+RbVvD/TpeOt6oCrqs2qLEBDUHOh49xebVunSehloyE7qPo2/hBA3fh6esAuTcZhSaHegqZu9gkou+jy3qDb97xthbDIpVA/g94Q20blbGRsm6MiSHoXW0cq8lC7j0/lTjwcP0BHtT2sfNHjuWpZ6pYTr1kZ4hI9E6ZRVFwSCRum6El0JRrfsM1y1QoM5wxgMGsHW/TVrusfr8/OaNS5nYJeWd7py7/vP+eNOkTIYvx3rtV+MnJeaIJdM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWFMa1pNNk16TG52OHZmU1NGSUtKNmZ0cUVITHhvL1BBdTJXVXNiZG5yM24z?=
 =?utf-8?B?SXBWeU8xeDY1WFJjZzFSZ0pPSXNINEJod1B6cmhCVXVVemZmdW9mam94QThs?=
 =?utf-8?B?UXhsYlFQM1cwTWhDdVA5RjNqcU1jOG40Nk5oWXkyQ2NqalBBOElJUEh6Qzk0?=
 =?utf-8?B?eUUvWm04cjZpdlh2MEVYWVdpdmt6aUc5RSt0VmpWUEtkSHQ0eEJQWk9UUkF0?=
 =?utf-8?B?bGF6aEJ4OE16Q2ZhTnh6amprazcrRHBpK0VZbHJ6SktRYmRDTUZUR0I0NDUw?=
 =?utf-8?B?cU13QTI2MExRT1FpSkVQYVBJOXBjSURSQXY5Y2RvRFhZRjhVcFNac1Y5MmNp?=
 =?utf-8?B?dEx4S3c2bGhtVnJDdkJ3U3ZqSjh4WXpGWG5GRlBzOXRTeEFoSS8vUVh5aHJj?=
 =?utf-8?B?TDNZVnhONm1YbFBEa28zRFFlK0lEbTBjMk4zK2hwNkphZXhXeFR3NzNydXFv?=
 =?utf-8?B?RUpQcFNsNitWYzB5OGcxUzFaR2VGY0NXYm9NS0o1djcwQzZQcmxIdGF0U0Vx?=
 =?utf-8?B?VUxET09waGUzTGQ4bkpValZWY1dtRkptT1hqVXlvS25oRkFWYzVKaE1qQUNY?=
 =?utf-8?B?d0lubExKVWp0TEFDVmpZdDJwT1hpMG95aGtWSENiZ2FqNkpzb254QnVTVjBL?=
 =?utf-8?B?bVdCeVBGcVAvbnpGTFVpbVkxaFByVHRiZ3FqazE0ZU9MVEN2MWRHd3c1dzdW?=
 =?utf-8?B?UWE2NkNoNFh0Y2ZoWjdoOUIxVElDbEdITEl6TnUxOWdPM2ZZK1d3c3JTUlI2?=
 =?utf-8?B?M0pWQ3NPSGxjRmhQSy9IZjRCR0FjcCtqNkFpZ1RiSWQ2N29KVWhSTUpBWk9C?=
 =?utf-8?B?YzRIdEdSYkR4WnVTL2szWjNjYmU5Zy9iV21YZGw3bHdvVXFpMksxcjYvK0xC?=
 =?utf-8?B?V2dsY1FhZTc5VmQ2ZE8zVktEUllMSmNudU5DSUdQTEMvNXpRdUUxUGo2L0lF?=
 =?utf-8?B?czZ5TzhrRGlZMjJ2WjFwRklvd0R3NldjcUpUanlOS3pmb3RvT1REcGZGd3Bn?=
 =?utf-8?B?TUN1UGx4YndaaG1MZFJjT0U1SlJsOGJpcFhrbnprcmM4SFNicmpmRkNlQ0tv?=
 =?utf-8?B?RGlaczh1WGE2QmV4ZUxDa2NIU2dFMjBDblBVdEg3TWRPcU5QMDBLVWpua0M0?=
 =?utf-8?B?dVhvYXFScmNTaGwrSHJNWVp2dmc2YmREM3BZUFlZanNNVGZ0c0JnSGE3OTlt?=
 =?utf-8?B?WXE0bldDbVQ3OTEwUjFpQzByZXFZM0UveFUwRGdieTU4WHhxalRRSEVtN3NG?=
 =?utf-8?B?K1lTOTdEcm5zUVVLQUhxRGRLejJlaW9na2xBbDZ6MWZScUpoMlQ1NGVpMStJ?=
 =?utf-8?B?T1A0a2ZTYm9oaUtVZDRVcHhwZ1EyNGY0Tmc2aklPT2V5U1pIQVlQdC8zTzkz?=
 =?utf-8?B?Wk8vZnR6TFQycyticlJsZ3dMQjVpUGlpeXNaNVk3d0RvY1UyNm4vTlZLdFd1?=
 =?utf-8?B?S3l5VUdoaE5XUE5yUi9KSU9SdzB3dFYvRndCY3BuN2NBYWFlL216bGtTWG0w?=
 =?utf-8?B?SGpOaDhGSmtSNnNyUmdjWGtVNlVBSFZSWW81SGRLRHoyam51WGNCOTlLdGtF?=
 =?utf-8?B?Z3lQRUlpUmp3NlFPekxiZURaZVBFZ2cwZXhIWHFmblVmZ3h4M08yMkFiVnhS?=
 =?utf-8?B?OHkrMUozTFRPY1hZZEhML3JnUlVCcVdoT2xpYlV0amsrSm1LUFVlM09zVTEv?=
 =?utf-8?B?Tk9ZU0pya0loUHRNQ2hvanpUMFZQQU5zazFLYTU1L1hVcDV1YnZGUk1COXZF?=
 =?utf-8?B?UjdmWWZZR2pnb05saFZlbFZqVUxEMnFDRE5YN0dWcTY5Nk0wSGlNdi9McjF6?=
 =?utf-8?B?VnNRdGR2UWlaeUVubW1VZk1LWC9VTTRjZEFOTWpSdFRXSnRaQ1pndk1hVHFN?=
 =?utf-8?B?SjN3UVVpbHVtRW82b21BdGhQaEZhSE5COS9XNTBQRllxaVpNSGVRQWtiaDRR?=
 =?utf-8?B?SHB5Y0w4YmlEa0NHTlBOaXJBLzZVVmF6MHhId0k1VHpIdm5OZVBoTFlRdUx0?=
 =?utf-8?B?ZmJPR29iMFhBMTk2TGswajFZS3lBdFVKbzFTVXdweVB0aTZrcHVjUDJIRnd1?=
 =?utf-8?B?Y3BHRGdzbmxRUFB6VjJFd1R6a1lQSDNCQ0ptandCdCsxVC84a0I5R1J5SUtk?=
 =?utf-8?B?OTl3empQRXR3RGZTNWVZSjlzeDJ2Wkd4TTlKalBGMjkvUVUrOXVVamVTREdw?=
 =?utf-8?B?NHJZQTA1WkVRc3FkRGhORmEzWXRrd3Z4NEJCUFRZUmJlUEx3WW5QTU9SaXFQ?=
 =?utf-8?B?ZkViY2o3SVp2NGd6Y2I3SWVkTXU2NmVWRXZPVFdGYi9YTjRUd2MxMVVPa0hw?=
 =?utf-8?B?Wm05ZnJUb2VEN2h2WVZoVXlzNnZhVWlROTNpQzE1eUFBU29qQzVPZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f238df-16bd-4b77-ff8c-08ded1e8fc7e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:06:13.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5G6xxJXHnPicW8oRAUcwEyDhBjrd1izEnP/P7qzJdS2uwF22U2jz7Guy13G0nyQPaJCgKLRpxBg9Vo3H6rS3QQmLDGuwyU0pahXNmZKCoIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239491

Hi Peter,

On 6/17/26 7:31 PM, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> libpcre is obsolete project replaced by libpcre2.
> Also libpcre2 is the current default packageconfig option.
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   meta/recipes-extended/wget/wget_1.25.0.bb | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
> index f0d3458462..e6650594d8 100644
> --- a/meta/recipes-extended/wget/wget_1.25.0.bb
> +++ b/meta/recipes-extended/wget/wget_1.25.0.bb
> @@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
>   SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
>   
>   EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
> -                --disable-rpath"
> +                --disable-rpath --disable-pcre"
>   
>   EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
>                    DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
> @@ -34,7 +34,6 @@ PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
>   PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
>   PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
>   PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
> -PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"

But why? pcre isn't selected by default so it should be fine to leave 
PACKAGECONFIG[pcre] even if libpcre recipe is moved to meta-oe? 
Similarly to what you've done for slang for which you kept 
PACKAGECONFIG[pcre] but removed it from the default value of PACKAGECONFIG?

Cheers,
Quentin

