Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30B5CCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 17:05:54 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.web10.2696.1760979944548637842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 10:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YxNsCKCR;
 spf=pass (domain: cherry.de, ip: 52.101.83.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq08dwjR6DJPDkeLJXeBPjzUrJV//55Alt9usy5t1FjTf2JVsyhoaR3hnn0EYq1/A6fQMgD9eT5tU+Q9YJAJUbdcxj6MlnRufjjQrpSRdFAHvAPHxajZUTqHX244FRk04VfKipc3TWD08Wxc+D1OE4JHf0Q63101dGTW9qnZAaI193xVLoQoP0PSs0xG7FSAGetn6d7buDWXHvconhWiWiMDIKy+uso04V1QywKSgVI/+8miE50v2tsJyM4d0ZVCXauIK3mX/3cYEN7TBfkSxkUmyttCJzsxgNW16nlYMC0NCk2EcVzpc3IZ2d5qB6m87bkAUPDUlcAEWnZBkueXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTCCIIpSARdLUyLhqmUt0NPSsNY9VgVe2RPg7akIT0o=;
 b=csWYqOBMyOo3CUiCZ7oStehxlflp0nD6H9GTzLqN46h3kwPGZvB7X8r07r7q/6U2QOEnFpQlXmoOVzHti+CgJVUuMp6C/NL1NHP69CcYHG/wNJaxx0R9vxWa2l08KNRls1hFpzjZgasO97Q/pdGq5/Iwsw5jBj+sUeXfGcAmIcaoe0NopyTMIbnqTT8PoxAjOKb8YmpfWGhinsYffCbxGSpexwei2eAKC5YRkDGYOhZfje1jzxxROA0/O9urfishpvLtNK3DubCJKev3OTuYXEh+3/T1rpuGTD2fmKJ0Sl6unI9OOwB3F/tLt4qDQuy+LHSHGgOp4JJ6VNI0DWV5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTCCIIpSARdLUyLhqmUt0NPSsNY9VgVe2RPg7akIT0o=;
 b=YxNsCKCRMaQbRy+kEJFyk13YKn6t8M7iuKMlvDEGpDvdun5weWYAx1oSY9g7HyUatEbI5Onl24o5ml6oiykwZelZmBu246hH8ekJpxKyzLlTLseaRdduY30VpRXntcQ5csjBujuo9ZOx9r+j/4HtSuBs7XUBaASZbVkELCUhDmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB8004.eurprd04.prod.outlook.com (2603:10a6:20b:248::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 17:05:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 17:05:37 +0000
Message-ID: <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
Date: Mon, 20 Oct 2025 19:05:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
To: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
 <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 184facbc-c6e3-4383-1ca9-08de0ffae3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzFOVEZuYXRqcGdIWnBpNW9sMlNmOTFmMjJZZHdpYTVIemdhZWRRTGJYYTBp?=
 =?utf-8?B?WVpIY0FEUER1RnBFQTdhbmlUcUxrYmpDZFpROUorWG94N0RETHl3dFN1czRi?=
 =?utf-8?B?WWR3L3FlMXpmUm9YVlRlRkZVUXFmKzVJaHkzWjdJOGtTYWlodFY2SVRRT0xG?=
 =?utf-8?B?NVlaTlZGZEZWSGNob0ZQSnpmR3JjVENxNnV4dXZBUFBaU0Y1MmVoa3daa1Jz?=
 =?utf-8?B?TCtla3grUXkwQUlXc0twQm9aYU41UHY5K1dIdHpuc0dyRmJ6eDExMFljT3VO?=
 =?utf-8?B?djF3VHc2NUdUVStFSytJTGZtVHRyVW0wTEdDMENIcFUvOFhXMlpETDRybFNv?=
 =?utf-8?B?cU1MeG1TTzdlMGpSWjZGU2ZWa3hEWVlWd091ZTdiTW1oWXVWckg3SWozdFdl?=
 =?utf-8?B?bWtnQ1ltZzJhUWN3OU1GQUxlYUNzTkUxcEVKckFiem04UmlEUE5mOW1Cc1J5?=
 =?utf-8?B?NWU4bS9rNTVhdmZudmw4ZytOZWVQcTlqUDdPYmtydTdVZy9JZzFDR0VxWHBT?=
 =?utf-8?B?M1crMDNxbm9vLzJwbitXNWk3Ujl2YVVJV0JVay96VHgrQVEwVVFSamdINFlC?=
 =?utf-8?B?SE9jMXVnaXhieGxtZTIvNlV5UW9CUWtTRlNJRjlORDhaWXhGQWpxakNueUJu?=
 =?utf-8?B?WEpqRnpVcTIwa2lzQ2pMTlU1azFEQ0tyQXZzWTVCZnB0aTc2SUFla1hNU1BI?=
 =?utf-8?B?RXVpd1JNZHl3cm94czVVTGxGUThUUHpPY3dKMUxRNThCY3dkZnhOUE9zL2sz?=
 =?utf-8?B?bU8yVEpST3pFSEVIZDd6K3hVL2l0N01aZ1YrYnN6T1hOekNjdUxNd3RpeGhx?=
 =?utf-8?B?aVliS2tzRHYxTkxlWmNJTXBaSjRWQmZRK1hHNVhIa3ozVlVCZWZWb2lIT0pV?=
 =?utf-8?B?NXlWcitLRDlQUlJ4MytDZlB4VFBDeVBlbThRSGtSMnVBQ3hyMGYyMVR5WCtU?=
 =?utf-8?B?eitOb2dZclhOZUkrTTluUFgrYkphY0FiYWlxWnp4bkFxN29tOERpS0hWc1dq?=
 =?utf-8?B?QnJKb3NERzRCU3JMK3Ztdk41SmNjTlN5SEwvQ2RFZ2dZeVBvOEdQaWZVelY1?=
 =?utf-8?B?VUpYUHNOdnlvWE5TeWlIWE0wQlFPazZabU0zVUxhS0JQaWR3ZExVOU54c00z?=
 =?utf-8?B?Uyt2YnFIMDFIKzRQRFBYcEp4SVZ5cDdxYU1ZdG5OcU53V2w4OTBnVEFXL2kr?=
 =?utf-8?B?S2dmNElIRjBvU3E0T1pMR3BneHEvZGt4Nm9GcWsrYTFCaVczUG5nc29nYXcz?=
 =?utf-8?B?QnRrSllRRmZlcllDWnJRS2FrRXZ6L2lmNVNiQlE5YTQ5SnhMNVpudXhTa0ht?=
 =?utf-8?B?S0doaFRhY1N0M2lWYm9RWHVDS1U2ak1PblB5bEw4Mkd0NmhDc0wvK1NQY3hM?=
 =?utf-8?B?RnYvR01VOTdnZE1lbHpuUnRDUWFWOFdtMWFQWkNjcXduMXJCVTBCQmNMUFo0?=
 =?utf-8?B?dUM2S2hhZnhKcFUxUW9TYUNXZTBHMnBCZEx0dHpxSEJBdHFJYTMxNzVvL2VK?=
 =?utf-8?B?Sko2bzdFM3hvYTdHN1ZUMEphRTVSSUtBT2pXc3NrL0ltVnprbEY1dVkxRW9E?=
 =?utf-8?B?VWNsS1ptYlRGQkJNQTVYRVpKYy9EUGlZNWhYWVRvNmpLU2VGUmprb2JhQ0lO?=
 =?utf-8?B?RU9OR1Bmais1TXEyam04WFVZWjUxVnYwMC93U2VseTc1dkdVbXVVdncxMlQw?=
 =?utf-8?B?aE9udUg3ZzdTVTdFYXNybE9BY3doNzJzbkF4WW1yRDlleUl5Sy9tTy9xSVpQ?=
 =?utf-8?B?Szl5OTlxaWc2Qk8wdnNlbE5TR0ZiRFI4aDRudFVKdzFuWWd6dTRscG11V3JV?=
 =?utf-8?B?K2RuTlU5Vzh0QmFoeTdZeHBwR2VjNVVvQUZwaDdHZkNrN2VSaVNsYmF6cTNm?=
 =?utf-8?B?T2xxRXB2R21EWnlETlFXQVFWNHJyVEVFajZVeUh5OVIzQURRMlVQWFhuMnor?=
 =?utf-8?Q?AXWPmh195t3pj77tpDFutsX0JnA4RMv8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2JBQUV1Q1E0WGFtdDRtVHNqWjN1ZGN0M0N0ekFRYzZSYlI4TDA1ZkF1TlJt?=
 =?utf-8?B?ZWVYMFZobWRmeDJkWlV6QlNKT0k3bDFyYkV1clJFTGVOSitLZlVPMldlRVo5?=
 =?utf-8?B?eWFVQ3NIQzZkSFk5a3RjRWJiTDJrOWlMZmJaYTRHOWNkYXFtUnlMUmNUMXox?=
 =?utf-8?B?MDE2YjluUndTcUZuNXN5dVB6SFlBeEV5K3ZoVkV0eTRVSFpMcTRGU1JoMHdp?=
 =?utf-8?B?cXRrTkVCcjVTZlpDYnErZmFXYjhreGY1VWQzcXpSTnFDQzJQaDUzVFMrdTVi?=
 =?utf-8?B?RXZhZlJRS1R3ZzloaFJnS0IySjNnS1o4WEc1cUVuai8rYzcwNnVaMW1qMmhV?=
 =?utf-8?B?TDJFTWZtS1JHTUJZeWUycXYyVW1nREM2dDVpZFRQYnVXNUFDbVFNdVNrcjdN?=
 =?utf-8?B?c0NZL09JWXI2QldhMTdndlF2QzFqS3FJUUx0ckRsWHVyWlczaHh6R2J3emEr?=
 =?utf-8?B?UjR6S3c0bGIwcDZ0QjN2bFVpWkNCUVROSjJBVWZQUStMVDFPOGdXekRxTSt2?=
 =?utf-8?B?MFo1Rm9iRkxkVzJUaVpMQzNZcjF2K2J2d1VyTXk3QkJGVGxPU1IxbmVxWGQ0?=
 =?utf-8?B?SXpLOE1JUFo0MHNEd1J6ZU10VXowcWY5R3FNN0lTcE9BU1JJbTdpQTdOc3pL?=
 =?utf-8?B?T1ljUURWSkRSZU0yVjhwVlI0bG92cVpvd3ovb2FuMFhhMHp1Zm40ZHFYNzBU?=
 =?utf-8?B?dlpaUFNOZVhJeFo4cGNSRWkwTzhCVUpMTXdzUHl1MUdJV0ZQY2thalBNZDlF?=
 =?utf-8?B?M3ZvNlNTRnBDa3JTbmZUQVB2WDB4MDJBdU5GN0M3dkk3QkhNaFpDaFlWdml6?=
 =?utf-8?B?b0RPM05RZFVTVG9XRTZ1bGZZMkRqS0lrVjhJUk5xbXRZRHVIczJSMFR3V0Za?=
 =?utf-8?B?VEdOakhMU1pmVklSbFVjcEtDa1p6eUkzSEtmTHVJTFlkRis4NGdQaFlvaGF1?=
 =?utf-8?B?NkJGRmxidHpFb2ZHYzhNZU9JR3kwcmZ5U2cyRmh1NFBMZzh1MFc3MGFlaXpp?=
 =?utf-8?B?Z1pFZ3BNNmsxZ3pJcHBxNGJNcUQvbzlQM0dtTGc0WTZTcWlGSkR1dkFYMUx2?=
 =?utf-8?B?TmF0MFZ1S3hqeE5ubjBYcXVHZ0grYW5JbFFZQjJJUzRHZEJsei84bTVlZ2lX?=
 =?utf-8?B?ZW0yZmpmM1A1dE9LemhXOXViTkRZTG9zd2VkeUFLSC9ab1ZxaDFMQmdzc25D?=
 =?utf-8?B?amNMZXRRS01mbVJPdGhpTnVvMWp3RjVGVnRyazFtNU12Ti9kU01iOXc2ckFo?=
 =?utf-8?B?R3pCN201eFV4VzJOaTc0MVJ4U3hibys1dHpoU2RmSndjTmhYeGw2TmRKYWpv?=
 =?utf-8?B?emFmTFRSQWNLeE5XODBkdVNJangxV09SV2NjaXpBQW8rZlF2QjdOT3dzNmxQ?=
 =?utf-8?B?R05RSllSaXUxZktZRUcwWVlBSTI1aDNZQmVxYlU2N3l6Q3AwL0c0QjJWSVVj?=
 =?utf-8?B?NnN3ZEw5MndxVU5lNVNIV2VSc0FqaHBYT1JoNTlPTjBtYWhxSkNEbXg2UzM1?=
 =?utf-8?B?bk9SaWdPYXUwRE5Sa0VkcHdNdXRMOU5EcVFmR0JDZFVXUlNTVVpBb1NqSkty?=
 =?utf-8?B?VC80OXd0ekw5eWtneCtnZC9KMERCVFZnWCtkaG9LazFscU9zUDAxMGhQNFdV?=
 =?utf-8?B?WDhkcUdLL3FqZlQ1azN5M2YyQ1VjSmxOc3YwVXhieWlKbTY5djVBNEpYK0xo?=
 =?utf-8?B?dHIzVEJXeitjdGJhQnh2Q3ptaWx2MGFUNWZtbUxlTk5UTmZ0V0t5Q2liT1Zz?=
 =?utf-8?B?aHIyQ3FObWFvRFAzeHNNclpQWGhRSmNSUXZkSHVlQTVBcjgrUmFxUmg0M3Y3?=
 =?utf-8?B?V0NtUVZlTUlhTE1VcjVtbXlOVUlJYVVsYlZ1cXFJeE1vNFhWblVkTEhBb1By?=
 =?utf-8?B?cTJKYkIxa3p2TzAxS2NWdys2NXFiWEdoMWxENmh4czhwelpud1VJUFVWMWJR?=
 =?utf-8?B?NjNGbUZtRy9zVzVLQm5BNEwveEVxQzFxNzlyUzNrSFNrNmFHTEpUMERWbW9U?=
 =?utf-8?B?TXV4V2NqVGlzREQ2amNWdHExYzFheE50RC8xWSt3TnJmSFl0ZXNTWEZocU1U?=
 =?utf-8?B?K1U0QjduaFExQSswbTVwS2VETTU0WGJhUlpQdHdjT3BEN0pHMGdmQnhrOWhU?=
 =?utf-8?B?bncxTUFJZ0F1YlZIRko4bE0rS0w0UUthZnd5U2xmQ0h4TlI0dnVJalVWNE82?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 184facbc-c6e3-4383-1ca9-08de0ffae3e3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 17:05:37.3920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsYcbwBk2WGs+dICyBsMr1gKGVxJtd8qAR2dKpDvjHyNwVzszjc6/CaJJ4DRYoO5n+bxycj3se7ZwnVkmM6UidaShfHiwvWIrvfqXc+vHVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 17:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225127

Hi Yiding Liu,

On 10/20/25 4:39 AM, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> After kea has been upgrade to 3.0.1,the build system changed to meson,but the config of build system is still be EXTRA_OECONF. So this commit fix it.
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>   meta/recipes-connectivity/kea/kea_3.0.1.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> index cc34c05093..06f1a5edc3 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a
>   
>   inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
>   
> -EXTRA_OECONF += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
> +EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
>   
>   INITSCRIPT_NAME = "kea-dhcp4-server"
>   INITSCRIPT_PARAMS = "defaults 30"
> @@ -72,6 +72,7 @@ do_install:append() {
>              -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
>              ${D}${sbindir}/kea-admin
>       rm -rf ${D}${datadir}/${BPN}/meson-info
> +    rm -rf ${D}${runtimedir}

This change seems unrelated to the meson build system change (maybe it 
isn't?). Can you explain why this is needed?

Cheers,
Quentin

