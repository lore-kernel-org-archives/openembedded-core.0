Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF97C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:49:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1622.1787338161099507084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=O6OgzUuY;
 spf=pass (domain: cherry.de, ip: 52.101.70.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aW4uFkREK8JhqO8V5iGuDK5yOIxq39lKyfE5Ejsky+PSAH8NDi3D+PkRpuXHzNM3LQiTunhMGuDAstGKXbl7C9dbRIgVzl5/lCRJIRwMKEu2GB7M1ZUEQOq+++u+JWmhSe+1WjkayFrCArlo/PjGFkWGPkSuooXfWYqDutjKrzbBhwmgZoQfdb4nJtLfQX4byklowrpelHEbS3nn3WhELty6V2x5XCEEg0kz6oq7B8ojekj9SjrHCRt7lNcfayStyXjCRuFYRjxIS8aPEfM8pABI7F24483kwrgDW1qHaZxiWAwCVhQfGnRG+gbsGCdz/OU3CXF/IKlSZBlIGLwmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am1DDsWoLTVpAyklzHh6pJousvRo1TORQzwUxp51MCo=;
 b=w8BsMQDoJqS+V2MjpeuBYXjNglAz2AIFp9SLDn3FQG5UvdFoJjs/WYpRShhXnAu81Z52jxQgx1WvhGBNYJK2IOgbHVKpQVgb04R2QQLKmNwSJ99A9rSVY3egD/vUfkxnwVXvWSQQrFi3U2mWJeIkqiSASS1UbjFAEwy5JDwcq4wB+6zaKQ2UdT5qU/CN5w16f4aPZFSk0dTHpwpgFes8QiYeRjTTUrLuv6Lbc4Tbjruw6RKpVnuxBoD46MFwMd94sWpo46rEUF6CNibCNbOnaOqKV0FWx3+UxNnZtHUp0fo62GBfBZhRunHFzhiwjcLodN5GT76yFw258zz0TqaXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am1DDsWoLTVpAyklzHh6pJousvRo1TORQzwUxp51MCo=;
 b=O6OgzUuY13LBcUzKqC+tGSMXE4euHyeHzA+1rhwZzQe0Yau7+Flqd/S73mGBdHfwJN21c4JO1V2vj18kepZJwU9cy7+ePT9Rv3xRLqe1YBv32tYHeERMcCCj6pn6MbQuQE7cr0qToRr2Kfw+YtTsvujn2DdxYkiFAHRihlbTZp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:49:15 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:49:15 +0000
Message-ID: <134d9ccd-40a4-403b-8d2e-dc71def6d328@cherry.de>
Date: Fri, 21 Aug 2026 16:01:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] meta/conf/fragments: harmonize fragment
 summaries and descriptions
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
 <20260821-sbom-cve-check-fragment-desc-v1-1-e06feb747b07@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-1-e06feb747b07@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f10d00-3e07-477c-9d31-08deffb4e5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|4143699003|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	PXesD8S1NEK3lhQdhrwxLJhUIGmO//c1TautYYCHLNAk3xfxgXyyMGhaIduZNWNTPS3hXyjcB4oAV+MLgN3r/G59SnD3NWJXOrhcsQ3VodO3m8PcU4lYOS27wmRUWd2Qm+lMlu1EmHCIF+lHWgVP4hmGRz2pKy60GF3F8b6i78XvioXu42Q06UsGqd+/dpMXSvc40vABzGk0/kgZAjuPoI1wCp4W1siAvSeUuUrXbGefMeqWapw8z7d2HiQ/BQli+k5QEwst4mbF1w5c3zv7iQ7Uv3zTg45TLXLqrT6ffVES4GKjgURyn5vEWlHDDpUwI5N82CdKcSZG3wkureyHX3pJS92M9zI+FO0R3cIDj/XGoJQhH1sK2Y/jk/5sLjsg++Olkjw0onP70c+5Um+i1AEvUyXFuFkUGD+cCT4qkFbNPV7/JenXb9NUjjz6lAPpczt79MfuPJ/I8FPsANZYn/fe53WObzh9CqWEQxjldVehF0eHJoZvK8K1To7K0atdANuv47Ljlxd9xJEnWXSNBU+comcoxNlFtvex7qDDT5h+DZPXynRP+l9+nliPfj8I0g6qWGB2Rjvh7F2FBUbPJKGBwxaAEAMhbyCEa0sU7n1i2+Gq4ZSy9RGkyr4dSaI0leVbnMsr/xmP0MBVk15DO9NRube16ueet5yr7Pg49D4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUl2M2VWM3M1YVp6Z3ZRTElRanFPOEcxVk0wWGl2U1JNbWplRGNRczR5TVlI?=
 =?utf-8?B?Znl4VW1KOGFtT2NrK2M4Q3NkNytSTmpsdk1iL3NYYW9MaFB2ZWdsMHpUem4y?=
 =?utf-8?B?SFByQWtLNURVeEt2NzRvZllxYVE2RkowTDBJOEREdHRMU3dhb0VzZEhtZW1x?=
 =?utf-8?B?TWs4ajZVa3lLVGZDaGJ6a3VhN0lIQjJVc0JTWmc0aGJOL09GdGlpb1JqTHMy?=
 =?utf-8?B?RDErZWozTHY4TzRkMXRVKzIrY2pUdHUzS1ZXdzRESFJNcEZqOWhscERvSWtJ?=
 =?utf-8?B?Q01UNjFGZGxneXBLOWpaWTdhRTFkMlhhL2tHTWFoRzhlMVg2WUplUXd6NzBR?=
 =?utf-8?B?RVZGQTRVdkg3NlBDMWdnUENGUmpNT0o4d0I1YlF1ZTdkWnRBWEZGRTZuMjlx?=
 =?utf-8?B?VTVBNzkwK2cxb1dyVkRlbzlyd0hwU0U5Q0d3MVB3NlFHMUFvWHhsYVlXTTFl?=
 =?utf-8?B?MW1CejNnbUhFc3ZCWjVySWRRUDg5MGRFcVcza1ZOYUFPQjlYK3dSR2VjYjdw?=
 =?utf-8?B?bU1VT1FDME5GbnZsaTBES3gwVmxYS1kvU1VVbGRnOTMrQXBWSGdIUmp5NERP?=
 =?utf-8?B?aFFjdjAzMVMzazlyalBUUFRkaThFaFZrR3JGQ0FjZWlsQTZ5UkxKR1dmdzEr?=
 =?utf-8?B?cUNrejlzU1pVSTBIbFZoVkVqVjNleDdxaVdjYjdQV1dYN1g2QTVXWDUwcTEz?=
 =?utf-8?B?RzBYM0dGWjBpTFF5OXdMZHJtcHlCVUlwUDlkczhscmh2OHJOVUQ3cXRxb3Qw?=
 =?utf-8?B?TzFSSmhzV3BZM0pEaWZ0Ukh0UmNxOUIwY1pHSzI0azk1QUV3R2kzMmxEOTc4?=
 =?utf-8?B?V2w4cm1ZckozdWk2WFF2WFp4QnhGWFhBengySjJOMmNiS2RqbHJKL1UrVG84?=
 =?utf-8?B?N2J4VGlXS2x0SnJ0Wi95R1IyM3U3SDlydXZYUm5mSzlMUGV0OGdhbDhZaWlt?=
 =?utf-8?B?bWVmZkVieXFNT3k4SkZuQko3Sm1lYjQ2OW5BeFhkZHVLSVVDMklOMEpHZDBU?=
 =?utf-8?B?Rm9OeEkxYXVYWTc0U3ZxUFlud1l2QXNLUXlURXd0ak1FUnA1dHhmZktyYWVV?=
 =?utf-8?B?b21sM2t4ZmlxK283VzQzYWZFd05pTFk5c3RkT1haVS9yaTFWdytxNGF5amZs?=
 =?utf-8?B?M1FUNjljUkpQenlrdWRqaHArV3BCM1h2aDdiYXN3ZTBwWUtOWkFpMEUvMDdO?=
 =?utf-8?B?N2hPQ2JhZUxORzNxY2xWWHRQQTR0YSswTkRaR3A3cVNxZUJZcnRMa0ZwT0pp?=
 =?utf-8?B?Y1hSaFZPdlZYUEoyZWhpMlhZeWZONVlCL2tLc25FQTdpR2tSYjRBS2NYT2Y4?=
 =?utf-8?B?N2FWQXlrM3VzV2FTcHB4djE4ZGtVYnBtWDJJOS9hSmNVTUxVU2d3SlBTcW9r?=
 =?utf-8?B?aVNMeVhYdHVkOEJ6Sml0ZHZ6VS9xeDdaU1ljOFFCRm1TYVlVdGlza3pWUmRD?=
 =?utf-8?B?WEtKTmJBUUR3NTVMSkRWajErV3Fabkc2MG5wWkl6bnlpZ2lKUjZ3ckZobUI0?=
 =?utf-8?B?NldaWTZYQi9KbGlTQnl2RDlPRkJEYmdwTFY0dWNBRUVIeUxBcUdGbEwvNEhz?=
 =?utf-8?B?U2MwQ1BkeW9sd3lITmx6RG9CaWpTQkhUaTFTR3ZRY0NuVmpqT1pySWpIWXBw?=
 =?utf-8?B?THprRzZLVkFQYlVHUm5jeHVoZHFGaC91VmFwZTZXOHQyT0dFZlBRSHMxcXd5?=
 =?utf-8?B?ZGI2c1lib3RaaEt4YXdOUnVoaGo4UUpRalhqUmdmSXlzcDdKWWRCaTVyVndG?=
 =?utf-8?B?N1UxUFFoQWtRTjRSZWxtbUhUbU1kTWZsZDBUcE5rOXdJcDV4LzcydnN1UW5n?=
 =?utf-8?B?L0JJMjNrZlZtYnh0bllmNnVOUVg5MkZUU3FVNG9TOEFFN1VSRjJSOVdkTmp2?=
 =?utf-8?B?aHJTcUdGYkZCVHpVNUx0Z1JSK1hNdUdreDNwSEc2NmFDSW44K0d0WFJjVXpZ?=
 =?utf-8?B?MHBPK1NVckRHRFpRbjJaUzBwMk1KUWo0OTNZZExna0x0ai9udU11VzFMb05M?=
 =?utf-8?B?NUxkbDNzaDdHYml2MEgrRFlaU3N2WjdqWU1pM2FrbjdvdFZCNi9YRlRZeUFz?=
 =?utf-8?B?TFhLMWtlZzJMSXlHaUxadHpJZGUwVGdRbCttemFEUkdNMkk4Y1NvdFhoKzA4?=
 =?utf-8?B?aUxTTVhiakkxc0FIZk9Lbk5GTzFKYWU1bkdadkp5Sk16S1J1R21wNjZVNUtL?=
 =?utf-8?B?NnpUZFIyYWc3c05peVJ5SUZsV0x3Nk1uL09pQjRFUEJwaFZBdnZlV3dDYklR?=
 =?utf-8?B?UWZRLzdjMjRvc0h6WG9jSWZ6K2N3UU0zejZpZVFuVk9IN2ZaM083NG45bXcr?=
 =?utf-8?B?OE11WjBhMjVyMlAxTGI1WFB0SWh3eS9WUDQ0bEJPNEZGem9WWnlUTDdFOGFJ?=
 =?utf-8?Q?BReVvpmSKRm8m2cbP6kK/kU50Z7XK6y1SVAhQRirt1cPL?=
X-MS-Exchange-AntiSpam-MessageData-1: J3kTqglOdzwST2wuNOILquk+1CTYpIAV0EA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f10d00-3e07-477c-9d31-08deffb4e5eb
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:49:15.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cv9d1/5tP3+aCRprtc80VJS2/8MIv0UVVBLpurKnDVQ1PBY+46XPRFpGePFDuuaGWO0NQpTF6VrsN2aPCVHlb7isHxR/W0pXEhhyNws87RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 18:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243952

Hi Antonin,

On 8/21/26 2:26 PM, Antonin Godard via lists.openembedded.org wrote:
> Use the present tense for fragment summaries, so that the
> 'bitbake-config-build list-fragments' has a coherent output.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../fragments/yocto-autobuilder/autobuilder-resource-constraints.conf | 4 ++--
>   meta/conf/fragments/yocto-autobuilder/autobuilder.conf                | 4 ++--
>   meta/conf/fragments/yocto/sbom-cve-check.conf                         | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
> index 58cadd92b6..c3fc9990eb 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
> @@ -1,5 +1,5 @@
> -BB_CONF_FRAGMENT_SUMMARY = "Resource constraint variables used on the Yocto Projects autobuilder"
> -BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables used on the Yocto Projects autobuilder"
> +BB_CONF_FRAGMENT_SUMMARY = "Set resource constraint variables for Yocto Project Autobuilder builds"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables for Yocto Project Autobuilder builds"
>   
>   BB_NUMBER_THREADS = '16'
>   BB_NUMBER_PARSE_THREADS = '16'
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> index 81adebe5ae..1f16c87d98 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -1,5 +1,5 @@
> -BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
> -BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
> +BB_CONF_FRAGMENT_SUMMARY = "Set default variables for Yocto Project Autobuilder builds"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Default variables for Yocto Project Autobuilder builds"
>   
>   QEMU_USE_KVM ?= 'True'
>   INHERIT += 'report-error'
> diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fragments/yocto/sbom-cve-check.conf
> index 46f6965a0d..f4178af4ec 100644
> --- a/meta/conf/fragments/yocto/sbom-cve-check.conf
> +++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
> @@ -1,4 +1,4 @@
> -BB_CONF_FRAGMENT_SUMMARY = "This fragment enables sbom-cve-check with recommended default options"
> +BB_CONF_FRAGMENT_SUMMARY = "Enable sbom-cve-check with recommended default options"
>   BB_CONF_FRAGMENT_DESCRIPTION = "Enables sbom-cve-check and applies the following configurations: \

This denotes from the rest of this patch in two ways:
- has a verb while other BB_CONF_FRAGMENT_DESCRIPTION above don't,
- uses the (implicit) third person while the rest uses imperative (I 
believe that's the correct term?),

It also denotes from the tense used in its own BB_CONF_FRAGMENT_SUMMARY 
(Enable/Enables and applies).

Cheers,
Quentin

