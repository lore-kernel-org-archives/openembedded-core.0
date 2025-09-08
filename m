Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3B3CA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 09:43:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.web11.9213.1757324592438857658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 02:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KrCU8nzQ;
 spf=pass (domain: cherry.de, ip: 52.101.70.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjkmVUOXS7F0HvuukMnbre/iTvgox1t1HyQPvlhS9k2T19mVa6vADoQgBu0lrlmCyJ2N0U92lHkmG2QSbDyERqP0AEwRjXCqCqGzOzOM3FARPMmt0QrlfNuEAIGUea+hiMUXIonJE3PFxZZw9FJa3BObSVy5+TcR0Gv/L9vcEl+0IheQptXtHRTxlPEhIPMM8CKOQKyg5ekEFwsLy6mpzOv3JzmkXTcaIoIOJs53VqIcd3Cd+QIb5wTQDvZ95rdI2gmW2aGjDY9G++igzq6buH31hlrBtzhryAIScydh4LmBNYulAvotoAqnVE7llbs8zjUNiFduVEqFzje4ExkcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks1pjyohdfKnG6v+7BYRoZG8ygFwH+shk1yE0Ok1iok=;
 b=FdDw4bBxnssruxRdaVOV5BwpCEFBOYLw8VwMfuyK8inlqRensaWcR1VqpWYBowBfCQao+0yxwyXyp7jSf+x6QMQRQwMtaedzGViThcNoLyF0qVi6OVXNlOLU37JgDBFtRCkK0+Tcooq17KRapqEGGCpFZnCnCcA6gruCDwEMr0X9FBU0jNIDZxB/e27ihEnVAucWEbRUZunzbF/t8eq4qBHvzo1nUn8ZH6bkWczxoojM5EsJeuAdg+lijM9qobqv9vn4fv9TKE97h4P5OAh3KETJ5VPsxqed9BmMm8DG24WBiktQBzAed5RNhcauqDxNKVv0UzirNXSxBq58NC5bPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks1pjyohdfKnG6v+7BYRoZG8ygFwH+shk1yE0Ok1iok=;
 b=KrCU8nzQeGb0z/IDyu2zks2OvgpG5RRBIR8dMIGPQ+z44j1p9hpzJ1hIe5BZoPG5muV3gIND+i9VGFF2WHPKkMp4G5pFuDfm9husChdj7gVXqRLVqAq++jM15Ixjh4Dx88gNFtbnxTsuUC+8COVWxFF/BHEkKGSnEyat1TdTMAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 09:43:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 09:43:08 +0000
Message-ID: <3ba69945-f763-482c-83c7-cb25faf6b7e1@cherry.de>
Date: Mon, 8 Sep 2025 11:43:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] connman: avoid hiding implementation-reserved
 symbols in version scripts
To: peter.tatrai.ext@siemens.com, openembedded-core@lists.openembedded.org
References: <20250907104528.2828-1-peter.tatrai.ext@siemens.com>
Content-Language: en-US
Cc: Ross Burton <ross.burton@arm.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250907104528.2828-1-peter.tatrai.ext@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 093c4b57-dbb1-4526-8440-08ddeebc1e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckZpOUo4c0YxQklIdXZpRHhFa3dpU0wveEdJT29SS0cwZmR4Z0k3UkxkZlpF?=
 =?utf-8?B?RDV1RFRMd3p1Q21PSEF5QVIzenlFWVNDUUxTRnZEbEFXZG52ZmYxU3VDTVVo?=
 =?utf-8?B?MUN0Zy9GYzFzY1gzWmxEWmRsekFyYlNUajdPUnBRbXBhZENMZHFjVXkwaVlm?=
 =?utf-8?B?ekh4dmJKNVY2cEJKbC8yTjROb3FScXRNbCtEZ0pPSTZTU0JTNkdFOU1kcXlB?=
 =?utf-8?B?TDJOaXBza0kxZTFEOVhPd0FZWGRZWEdPUkVxL2J3cldieEdUdDMrRjc4ODl3?=
 =?utf-8?B?RkJ1aXlyS21LTThPNWtzd2JraU00SHlWcXZYeHV1Yk5HaHM2bjhqOU1jUW9E?=
 =?utf-8?B?Nkc0WmtnM3kwdUxTcFQwa21NOWNhb2gvaU44SHc4ZlhVNGcrWnkwYzFxV1lR?=
 =?utf-8?B?eGFzTDNVV3ZxWnhPQ1l5a3cyNXhxK3c4UnVyUzJSUGdnMXRKZnEreEVoUGx6?=
 =?utf-8?B?cE5IVTNPd0o0MlA5Y0djUGRybGdFcFhyeDBLeTA0THdiTkdEYjZWVVpiZitN?=
 =?utf-8?B?R0dibDY0VGpMaTltZ0NYZFRFc1kzd2N4WW9oNjFsNlUzbzlFejdUV012SjYr?=
 =?utf-8?B?aEJRYVlCcjlzM1h6VU9Rcm01OE8xOXhCZ2I3ZDFZSjFtbU51VVRIdGZrdVZ6?=
 =?utf-8?B?cmo1NXVXUnVJbGFPR3FxZFpZdFFSck5DbXJCSlc5UWc5SHRrN3NvRndpSnNu?=
 =?utf-8?B?d1lJTnpGY3hSRys1OGlCek0yeHJZN2ZGalczME5tMUxiU0VRYTFTNGlscW9D?=
 =?utf-8?B?eG5uWG5jak1CZjdIRmZ1WGxkcWVzVXBxaGdNV1Z3cWw4cUVYMnVsTkxDOHRS?=
 =?utf-8?B?Qm0rRUJ4Nk0vRTdWcDhoNllkbWxOdUtoWGY2K05hSXkwSjJhMXhwREFDd3kz?=
 =?utf-8?B?ZEpGeisvcUJaM0lnWUhCRDFVMTNabCt2cjRQZ29BaDB5czZaOHZsVkRpbGYv?=
 =?utf-8?B?bzQ2STdLRGdGQnFmQlRUOUdqdXBPd3l3ZlBZN0IwRmFXVjA1V01vNy8yTUVG?=
 =?utf-8?B?SXRwdkJUNmh5WHdUOU4vZTZjbS96bVhycUlWTXpWWGdOTzJ3OHJ3RTFOVkNu?=
 =?utf-8?B?d0Ira2lMd3lJd3dIa2kxYkNmMlpxQTllbWcvNGw0UnlCRXkyZWJvSzZnRnRP?=
 =?utf-8?B?M0tDMHBvbXZOTmxoa3hUMGdzODF2VFNSS2pueSsrMFp4MHZLVGUzNmFYUzJn?=
 =?utf-8?B?b3BSTlJGU3hVaFdTWncxZ0Z4a2ZHdkVZMHVua2JOeTJaOU9KUmYyREwvNVVj?=
 =?utf-8?B?S3NRNlBwVEM4WjlYSVVkSTFRandzenhGL29JNUN4bHBZUEZxZUQ0SzBPcTQw?=
 =?utf-8?B?SHZ0UjE3WDI5bVdaODN0ZU9lMWVDQWx6R2VQQVRJRms1bVRUbEN0M2tJL09a?=
 =?utf-8?B?bEVnaTlCdTduZk9NSjd6VXBDSFlJWlpkaDJBNy9JZnIzUVhLREhFdUVVZkZq?=
 =?utf-8?B?bkQrUEZmM2ZlWGtVQnZqTFcxemlONzdQbFEybVZXTFZRR2k1VlRQVjhHUWh2?=
 =?utf-8?B?a0VLYnNabEEyanR3VGxpZ3ZuZzdCcWpIT1J0N0NiajJ1QXJraEx4Z3FTWFRj?=
 =?utf-8?B?ekZmNEtRMU1RdnRxUkpvU0N0ZlJVTVFOSVlhSGxRSllGU1QvWVlSSTkxTGNr?=
 =?utf-8?B?UVBEWjVIWklvd09GUjBNRzBiclVpMkt5NzlNQW5IWHBBRldKTmpocVNDaTFR?=
 =?utf-8?B?MWx0UmV2R2RJYjRKT1d4ZjduZlZyU1ZMR2ExcEVEMlhiUFU5Uk5mSXVib3h2?=
 =?utf-8?B?OFh2Qkk5eWpReGNBWncvTTgvSWZMdUFiVTk5d1UvMzlUOThKTXcyL3RaY05t?=
 =?utf-8?Q?2qqOGk1taIEXY2T7p7EuQs7RYPZLm/MoMm5Cw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHRsemtBZzZXQ0xncS9YTW1YNDM2L2pBVVVMa1doWXA0aEo3OCtGcnBsNGxj?=
 =?utf-8?B?c25HeVBYZERXcWw2MjBpMnBEdnJXR2xIQ2Nua1V6RWVTRit6L3hQWHJCd1RS?=
 =?utf-8?B?Vm1NNkdLcytLUjlQTEtDT3Z3Qm1RNVR3a210U01RcXVpbDNCOE1zN3l0MVZl?=
 =?utf-8?B?S1NQTUlOcDBpdStpRmUrUlN3bmp1dUZEZkgwRVovSy9qZ29YMk11VUd1L2Zn?=
 =?utf-8?B?cnI3UEc1NlZuamFIL3dicDNSV3NJLzVvdVR5Tk1DR2JyVllwSU94cThnUDdo?=
 =?utf-8?B?Z3lYSmU5SHNUSWdnNlVFL1dUZ0V3akFIbThZMFExbjluZXFUd2ZvU0xkcDJz?=
 =?utf-8?B?bjZEUmd0b3NlOGIyTWNkL3ZtSUU3K3pYVGhQRFJWYWlwU2tpNUlPaFlpQzRM?=
 =?utf-8?B?MDZHUUdRSWdGWUZndm5mcVpxc2JFR1Q2dHk2N2JqMGR0bXhpZ0ZYTS9USTZP?=
 =?utf-8?B?alkwbzlLMXo1QjFueE9kcVhYMUs1WXF6L3c3RHR3d1hSNW1VbWVQdGY5TDNX?=
 =?utf-8?B?Wmo1V0VOOEV6VHZFNzlQbUdaVVYxOW5CcEw3Vkk2OGdNUzN4MGNDK05vOGhm?=
 =?utf-8?B?b3NiT3c2SVVDU2pWZDJudlYydG9weE93ODJvMmUvZHV3TGlJT0pVR01lNExw?=
 =?utf-8?B?Q0hReGhWT1cveWVvZ3pWUStOZzhXclgvUzZWdGJHM1h6MmdscDNSWHNUaytm?=
 =?utf-8?B?T214ZkxaT0owb1JMbXRka2kxMkxoWnR0R0NmaXlmVXZ5d3lPZ0N5WWNFWTZH?=
 =?utf-8?B?eGZFVW1tbXFPN1BPN21uOUdtU25zSGQwbk96R1VUazhEazB3RGdOTWxNQWZE?=
 =?utf-8?B?Nnd1ZVVMRnZQQWlva3B6aGRicFhRNDVlaTJhRU91NS9RNjNMQlByaThqc1pm?=
 =?utf-8?B?RFlZMWFESUFhUENMQmdGRTIxdmZZNHI1c1pkK1Nid2xiTEVXVmc4VStQVHQw?=
 =?utf-8?B?bThkOFplMkI0K1FvUGllS0Z6ZEE1amUwWFJFSlR2YzNmL3JmVnFYRWhvbzRL?=
 =?utf-8?B?ZlBoMGlWT0Y1cnM3alVlL0QrT25vdnBYWHp1SUw1VnhtZmY0bnlKLzQ0M283?=
 =?utf-8?B?WmpUSGhwMU5UMVNQMy9GNmpleWhIcDNrQkRyL2Z0aDVZS0J2dUZEdnpJeTc4?=
 =?utf-8?B?aTBncmd0Zkp4RUJFT1llcWpDaVpJK05ibGNCc0RqVXlFY3RiQWwvaFdZZ0lB?=
 =?utf-8?B?cmkrOEhiS1B5VmgybDNRRGF5U1U1ZHZubUp6OHFKWFk1YUx1Z1F4bk8yZkds?=
 =?utf-8?B?WDJxUllqZkROb1BWbWZJVU1wdWFkUFNxb09TU3RwTE1tZk5NUVRPdzhTL3lj?=
 =?utf-8?B?QVdmMGpnZnJrM2pTNjk0REpsenFwb1h1bkx6RUhyWEVESGlXb3NMbkhUOGEy?=
 =?utf-8?B?UnRCcVlCV29aVG9pN0xGSjViOEJrdG5qUlJxa25HV3NzNXpFOGRoZEJEQ1d1?=
 =?utf-8?B?UC9XdjVUcjBoMGw2dFh4SXBtNTVrSGJONldFVmlteGRwQUZUcE9XZnJyZ1kz?=
 =?utf-8?B?RHpLMEZFZ0R0bnJlSXR0dVpXSHRvYzE4MDNVVEh1cXdaTkY3bkdzdk15c0dO?=
 =?utf-8?B?R2RiaVpKWENnSzcvTTFLc1RCZlhZWFc4K1NJOGpHdWZueXpyZXFPcnlQWGtZ?=
 =?utf-8?B?M3BOOGtoQy9jYUd4cUpTYjJHdG54NWJ5bzNjV3hvODYxUDQyc0hvbXhtRlRB?=
 =?utf-8?B?OXJsRHJzUENWcFkwSVdyc3Y4RHpxdDNlZ0xMOGVWRkl3aSswOGtBNXo3dW9Z?=
 =?utf-8?B?aUwyMklmeW1JU3Y4MHh6RHo0WUM2czJGT25CYWtRcGVCQWRxSmRnUlN6djVN?=
 =?utf-8?B?MGF4TXg1N0hGS01YZXVobndCSnJrQ2diRDlxU3p2NVZTU1Q3V1dtdDBYTFdq?=
 =?utf-8?B?RWlGbHJLaVp1SjhWZklpSmhxOW1nNlhGL0NXaHRQQlY1eDB4TGJTWjZtN2pG?=
 =?utf-8?B?Qk41U2p1cmJrVHpVZ1ZBNHBjR1dQeTZuMm91VjFGejFFUStyVmFYVG54aEZU?=
 =?utf-8?B?MEg2UkRUWUplOWFUdWdNcDZ4T0czQWR2ZWppdElQOTJOTEtodG9wK2ZvRzl4?=
 =?utf-8?B?WFFGQ1Q5ZkJvZmF2YVdTclJiOXdMYnVXYkZxSXhhOTBwazJGcnZ2UjhPOWNI?=
 =?utf-8?B?VUFiWWZWWkd0RitLdkh4NVVoZm1hdFlKQjA0cTJzcGNCY3ljQ1htM0tGdFJj?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 093c4b57-dbb1-4526-8440-08ddeebc1e13
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:43:08.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/c5a5ajVba1RMteZ9lgPrr0wfjATxSWAny6XFR07YstnHvAuGc0iWKYpe0V/P2ybC25IZc3B2+T3gOAjGuHhPO4iFeswzIpfkydZsh6hio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 09:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223062

Hi Peter,

Thanks for taking care of that!

+Cc Ross for awareness.

On 9/7/25 12:45 PM, Tatrai, Peter via lists.openembedded.org wrote:
> [You don't often get email from peter.tatrai.ext=siemens.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
> 
> This commit adds a patch to ConnMan that modifies the version scripts
> (src/connman.ver and vpn/vpn.ver) to avoid hiding implementation-reserved
> symbols (such as _IO_stdin_used). Previously, using 'local: *;' in the
> version script caused glibc's libio to misdetect the libc version,
> resulting in a crash when printing to stdout (e.g., running 'connmand
> --help') on PowerPC.
> 
> The new patch changes 'local: *;' to 'local: [!_]*;', following the
> recommendation in glibc bug 17908
> (https://sourceware.org/bugzilla/show_bug.cgi?id=17908). This ensures
> that symbols starting with an underscore are not hidden, allowing libio
> to correctly detect the libc version and preventing the crash.
> 
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>   ...d-hiding-implementation-reserved-sym.patch | 50 +++++++++++++++++++
>   .../connman/connman_1.45.bb                   |  1 +
>   2 files changed, 51 insertions(+)
>   create mode 100755 meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
> new file mode 100755
> index 0000000000..5a4d9b72a5
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
> @@ -0,0 +1,50 @@
> +From eac489c872c775c88bbd85b4cec6c1d47ad9e6a6 Mon Sep 17 00:00:00 2001
> +From: Peter Tatrai <peter.tatrai.ext@siemens.com>
> +Date: Sun, 7 Sep 2025 09:25:20 +0200
> +Subject: [PATCH] connman, vpn: avoid hiding implementation-reserved symbols
> +
> +When using 'local: *;' in the version script, all symbols, including those
> +reserved for the implementation (such as _IO_stdin_used), are hidden. This
> +causes glibc's libio to misdetect the libc version, leading to a crash when
> +glibc prints to stdout (e.g., with connmand --help) on PowerPC.
> +
> +Change 'local: *;' to 'local: [!_]*;' to avoid hiding symbols starting with an
> +underscore, as recommended in glibc bug 17908
> +(https://sourceware.org/bugzilla/show_bug.cgi?id=17908). This ensures libio can
> +correctly detect the libc version and prevents the crash.
> +
> +Reference: https://sourceware.org/bugzilla/show_bug.cgi?id=17908
> +
> +Upstream-Status: Submitted [connman@lists.linux.dev]
> +

You can put 
https://lore.kernel.org/connman/20250907081844.1558-1-peter.tatrai.ext@siemens.com/ 
here instead so we can follow discussions if there's any :)

I don't have feedback on the content of the patch otherwise.

Cheers,
Quentin

