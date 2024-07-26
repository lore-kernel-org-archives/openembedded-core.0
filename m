Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297E8C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:45:29 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.94])
 by mx.groups.io with SMTP id smtpd.web11.60562.1721997917822344449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=wgatOby9;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.94, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4tQ3QEr+5Uevi8Gv4/KS7XgFEyJn+6ENu6DD/q58+43h8Si9GcaNtWdDURwJlWnDEJq5GJiuFAMfWHALHAoM5vPbrp9zHibbu2avOQuIz19U79WmYmuVsLKRJ4tb4nlRfQs/74pBSHJg40FpJvw1PKIcfhNF5EPzmsewQqq6xOAwIbxXe/7vhyXMCBL6d90P2v8zl2wYUKIiSRm6x16HfQfzSXeshk9zGlXnYR1Gz546VHy9KEXCXeIt96bBoI6NK+Htw2iIMsL1fpo8FiexY8dVjAwd8vKDHZU1cCmlRd8if82iOWTRGM1SNmoKgsRtkNC5XZ+5gatVGYr3nyJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3Oq9CfIaPXaEoSrjG9rsBa1AXxO8t+Na3YIgIDxLuM=;
 b=R8SvrsUKA77lmMVF7hmnOjYbS9qzXDmJchjAlmrLMZq0FNSkKvCC/HkzXOsh3Ty6PnooN0+VdKLW65Hwz9ZMLs0Mqi+Z5KJrrxu1214u+yIIx+Hj7cqqfmJQVMtkyVq6Zit3Wdzy05dX/7x5X6uyz8qb+peXzAeYldtMaqf/NgHBMnpDoU7Bf3RFopXwOSRr3Ry9pzSju/uCyVpg31SxhmQRcWF3TWrP5J7ejX9iVPlQnb7e8neVwuYWxFdWUbnIaQ+HHdDsnB+2teGpAhuvhXDqfhP1ZhKeRkgifR3IQpa180aKIaPLUuN9gZS4Iba73IxgaVxEbfOBlc8jieEMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3Oq9CfIaPXaEoSrjG9rsBa1AXxO8t+Na3YIgIDxLuM=;
 b=wgatOby97j1BJio8138r2OYY1TROkjJRjMy+LwesoRJqTtPQoe2GM1X3lohlRNuBqWDU/3RQ4t+czgtyYvzCFYEhRLGvtfhtYFc4/qBhK4f3eQZJR405BPMLCDS2uzUWxpgKmk6tzp/UR19ODUY51USc9Z0C/V//X+HVjfSpcDHY9NgaUuo+jX75YYBh6vS759NnYL+DQTCTrO1q8ii4O08U9PIMmbcqfo2hFon9l706/hCC+zWm1TAHxwJzea4DE2qiSnn9+pn/MQP6vUsLNv8h2zbkaUErgnWzqmAwtLTapf2vVS1LoN11b7B/nWPFgYmqBWwHB61ZiJWJnYgITg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by DU5PR08MB10824.eurprd08.prod.outlook.com (2603:10a6:10:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 12:45:13 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15%4]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 12:45:13 +0000
Message-ID: <2bebf809-c400-4517-bcae-b4f14e1c1d7d@weidmueller.com>
Date: Fri, 26 Jul 2024 14:45:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] iptables: fix memory corruption when parsing nft
 rules
To: openembedded-core@lists.openembedded.org
References: <17E51ABD1A5159E6.10920@lists.openembedded.org>
From: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
In-Reply-To: <17E51ABD1A5159E6.10920@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::11) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|DU5PR08MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba5bac2-d8d7-49ad-1d59-08dcad70cb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mmxjc0pieEtTZ3FiN1pEMDR5OWM5d25peWlteGpvQlhIUjU2T1dYT3VFemFt?=
 =?utf-8?B?LzJCcWtpZldJbXRlaEtrVmVFY1lxVTdiN2lveEZvRVpWQmF2UngxeGhFTmNl?=
 =?utf-8?B?d1lWNkFhdVozbFVod3NmbUhOdXNJcE8ySzc3bThJTTBqWXdpUGJ1aTVwT1ZK?=
 =?utf-8?B?alcrSE1vaEVoZTBTZFU4bGlFQjJGYUYvSkM2bjk5d1IrS2U0aFZ6WituYWVr?=
 =?utf-8?B?OTViN0FadWM2L2ZQVHpzK2N6Z0dQM054elpPR0s2Qk9jRFZpZjQydXVoTmFS?=
 =?utf-8?B?MEE0WEJUdGtLOW1UYWxrM093UVlSd0t6QklFTmY3M2FpYU1zbEFyaUdDcWdo?=
 =?utf-8?B?K3d1WGd3NmpnVkN2QkVGTUU5UmV4aU1zWWo1U0gzVlBGQzJ1WVlacmlMdHZ4?=
 =?utf-8?B?bXpndkN1VzVmQ3Fhdm9lSUdFYzBBdjNxWGtETW95S2xvbEJkeFovRi9oQ2Ra?=
 =?utf-8?B?UlkzL3YyYkwrNXhlc2tnYlQybzY1NDVFZDRqSjdabjhGWHA1OTRQVGkwRlBW?=
 =?utf-8?B?R3FWRGQ4TWhiQURJeFl5alM4dGxEVnJkY1U2K2pvdHhxOUhRYXY4aXhqZXIv?=
 =?utf-8?B?Vk52bElhbjczT0IrSkdzblVPR1k2RFJsc2QyMk5iaVBxOWpyOEgwQTR1SHdp?=
 =?utf-8?B?Q0VCcXIrdk9ka2RVeVJIYk1oNDVWR2VCaWdWTVc2Z0Vta0wzdExVVk1iNjJh?=
 =?utf-8?B?NnNoSjh2cldmSkJMZlFQZ2M5ZFViN3g3SE5oZEE1WXNrNktINDhrNHFFRzJZ?=
 =?utf-8?B?NUp2ZDd4OGNSVHdXS3NNUUF0cmVtb2h5aEtsZTNoTGtlMERaenNKYUcyOTM0?=
 =?utf-8?B?bEJiT2Z1QmVVSy9nOU9DVWo5R0VPbjREaFhDcFpMMmlUVU1RVWdocUo0RGMz?=
 =?utf-8?B?U2g2cVQ1bGlYQmoySFNodWloVE1ZNE9sMm9oc2FtY2JPNGpXbDJGcW53WnFl?=
 =?utf-8?B?dFp4SUF0My9xVG9QaXF6R1NxWXlxd3RQTnQzNllZYldpdFF4V2VuTGJPY0E2?=
 =?utf-8?B?eVV1QnFPa2ErUTQ4TkdPU0w1N3JNUklCeE5GaXA5TU5uS2R2MFdzSEFBQks1?=
 =?utf-8?B?cVZ0cEM4KzEvQk12NVNnbEFBWXNlQ0drRVJ5SXVGdjVDSzhFTTBhaHlWamd1?=
 =?utf-8?B?Z3JNMEFVZ3g0R0NKUXlHdWh0UlpqYVVCcEc4eTk4NFRtbmtXc1RvWXNvVUdB?=
 =?utf-8?B?a3RHbm9UTG1hZDltNHpIRG9xTmxUSG00eDJHdGNSU3FIT0wwOUU3RWtObzZr?=
 =?utf-8?B?bzdNSUVwbU9SbXZHOHFkdHFkZWRCUXZVMDFkRi9SS0ZIM1l0M3VndW0vMkVj?=
 =?utf-8?B?eUFHVmRsaDBzLzBROGt2amxkcEhRV1FjdnJDQ3o0YVJNUzZCdzFHRkpONmxa?=
 =?utf-8?B?cFFLTkFES1ZLYktKU2JEMk9DcFlBNk1hRmZqaUllVGlyK3JJTDEyMzVJVjNk?=
 =?utf-8?B?emFwNmxiaE54V0FTVkY3YngwWVkvZlhNeEFKUTlkeEVSb05peGVBMGtMNG4w?=
 =?utf-8?B?cVRuaTNsU2hkdnFKdDk2U29vODZveHEzdUdiMXhDaXpDMmpNbTVRS3JxWi83?=
 =?utf-8?B?cUdhSVVlTSswUVJ4ZWNUQVg0OStXS1FmMGtVZ3VGVDJKeGhHVk9TV09NeXVJ?=
 =?utf-8?B?ZlcrRE9ZaEZCYlgwc1hPOVY5RWd2N2JteStxT3QvSWdzNFVzZEM0M0JMVXVP?=
 =?utf-8?B?dXE4OWRGSFBjV1dtY2Ziazk4Z3pJM2tpRGZnSVNDVVBlaFlhUTlPQUNJL0tK?=
 =?utf-8?Q?exhiOidsynkk9HCCOg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cytyNDNrRzMzc1ozdUwwTE1Ka0Z4TmhIQTlmL0duTVJLdnpHV1hhOFZuZWEr?=
 =?utf-8?B?UWh5NExYWkhGQUc2c2FOVUJaL05pcU5jRWZqYkE4TzhTYTQ5WUtFSU5pME1k?=
 =?utf-8?B?bGdRK2VDNS9Rbys4eVBSRXp1MGZ3M0RRVkVOTVBPekdpdmlpRW9YYlhQUEdM?=
 =?utf-8?B?QUw2dGNySFpNMnJOQlFmZC9uUTg3NjNpUFJXQ1VISmhjeDVRWm5oS0dDK2ti?=
 =?utf-8?B?c3NKa1RhYW5QUFpNcGRWSVp3NHJDcWtQbUZqc29rYkJYWEdzSDRxc0p5MXhS?=
 =?utf-8?B?OGZ4SENSbHRDY1djOHc1ckx5bXFMTERmc1ZmZTVzM3Q3QjdFQVEvWUNGck9E?=
 =?utf-8?B?MlNBN05LNmJOaWZwOXpRM1NZNDZPeFoyN0NRU2UzL2lrcTdYOE1vOTgvbjgv?=
 =?utf-8?B?aFI1QlhoSng5c1hlWS90L3RLRjhnQVI4Nm5WMjNaenpWVWFlNWVXMkhiS0ZS?=
 =?utf-8?B?Mis2ZjM2ei9teFl5OWJKUGxaSlNsNzF4TjJoT3ZUa0JvZFdEZTFhejZIT0hn?=
 =?utf-8?B?UVNPWlNyTFZvRklKeXhPcVNSVXR0ZTdKVlYyZ29JY2RYR2xKVXJCbldncm9X?=
 =?utf-8?B?bDY5Z1g0YWRienJZWDR3Yk1Fcks4anorRkJSOW14enM5UWl2bm9RSS8rdEZw?=
 =?utf-8?B?ZUFnYzdIa1k3RnJzNzZHOGhzclU3NEYyb1Z6TDBYSThIVVBzOEpXa1VwTVJ0?=
 =?utf-8?B?UFlqc1Z4NHlzZ2pJdVA0NTNJeGF2M1YvaHhnZkw2TlpQRWRiRWtJNHFVSjhY?=
 =?utf-8?B?UTBRWDM1Vi9KOHplenRYNEFmR3Y2dGk0TzVOMklXYUlNa25IL0lGbENWbDNG?=
 =?utf-8?B?c1l4YkNnT21FWXhsaVN2dzU1aitTWlFVZlNkQkd3bjRIYXBqZXY5TWh4N01I?=
 =?utf-8?B?aFZQa0szbVpJZmczczU4YitFV2xUNmt4OTdpZDZBcVlveDZEdDZhMGpXenQ4?=
 =?utf-8?B?OWhlUmIwNnZMSFNVdlgxcHNRM0J0VzJHK3ozaXRLWE1SYWFNcjMzSm5TS251?=
 =?utf-8?B?YVc1OHRIS2xCdDA0bHFOTStGeUcrcnEvK2VSOWxZY0s3M2NheXJhSkRWYVVp?=
 =?utf-8?B?Sk53dCtJQUFMYjVGYm9JMHV5d0R0R0VKRXlZclJ3QlB3NCtGaFZzbnYwTTFC?=
 =?utf-8?B?a3BZWUJrZmZTZVlSZ1JTZXBrZjJBWHFSK1FCajdMUWNaakYvdXpkNzhZOFJh?=
 =?utf-8?B?MnliUkRrb3VrOUtNRURsUzc2T1Mydlk2LzlBQVNPU2U5QXgrdkFmZE5VWGha?=
 =?utf-8?B?M3Y5YmhVZjdzVlcvZGtmWnBwTk90clZobmdFcXdWUEhIaTR0L01ZS21tQ0F0?=
 =?utf-8?B?aU9KdEl3akpDOUlrMlE1eUZVdW5ubFh5SHdvYnRvUVdDQTFqc3RQWC93Rkxp?=
 =?utf-8?B?MjIycjRGOVpoalJ3eFp4L0h6bWh4RlVHY0J1WGovUVFsdGV3TU80VitLWFA1?=
 =?utf-8?B?YVJzQ1BWM3hrU3lGeGdTVDFSaEN6VXdHUi9McDQvMUVIZjJXK3RJV0lFVlZS?=
 =?utf-8?B?eEZlODBzTW0yZisvb3N4QmNrVEpndmdYOGVTM1V5bUpZRk8vdFJ5RTNzM0c2?=
 =?utf-8?B?NEFhQXpSR2YyYU5LOUFXNkxqR0oybUlPRGZwV0VRZ3lTdDRUeXRQZXZ0UXgv?=
 =?utf-8?B?endqcW0wb1hJQW9NRzNpaGRxbnJ3Z05XZGRMd21wZUVYejBjZW0vRGthREhs?=
 =?utf-8?B?QlNCQUhSRlh0NGgxb1M2R3JNY3JkcUV3Nlh5OWFwbTlNQ1c2UHRTNVdZL1JT?=
 =?utf-8?B?U3VnRG1UN1hUM3p6SUkxYmw0V0c1SXpBUXliU2pIN3I4a1p1T0tVdnluaThC?=
 =?utf-8?B?MnZaRjZEK2VWQnh4bTZ3Z05xUFJ4eDNrNHo0L2pnRVc4eXMvR0ZiRDlEcTBt?=
 =?utf-8?B?eTdJSXNCcVpUUFJjS25oOUtUdDFHK3lxdnZ2RitxU0pnY1c2UTdBRjNlNmYz?=
 =?utf-8?B?c3VsS1gzdkZUeXdwb1V0TnZsUGlscy9senUyeGo5UUNLdU1aVUhMWEZ0ekps?=
 =?utf-8?B?V0cwSVEyVlJhcnNRelcyQ0o2OFRSZ3hrTkdKWDhSUUgveDBHWlJlTFIreWlV?=
 =?utf-8?B?NmRuTG5yZk9ab0lSbnA0d2ZWS0ZpVTBZNENKTjkzMVNZb0FPQlZxUzVqWWdo?=
 =?utf-8?B?KzBFbEI4bW1GclJvSDdBWjg3UlFMNFV5ZTQ3cnh0empVMGpWa2Z5SW1jSE5i?=
 =?utf-8?Q?2WtRivFecKDFBDBjuJqdXjE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba5bac2-d8d7-49ad-1d59-08dcad70cb04
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:45:13.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21psAI54CggSYfDeD+cFSiuh7TxU186C+d3iwLExKzNiA6gLDK+58Dof3b/m0r0v4rsdn3bKht3zM11wjXD6TlBp8xQEYQURLkxhuMYFVwaZ7hXpg2ZhbzuE1f4jOitS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202536

Thanks for applying this fix to master.

Should i send another patch for scarthgap or is this automatically 
ported to scarthgap?

Regards,
Christian

On 24.07.2024 11:03, Taedcke, Christian via lists.openembedded.org wrote:
> From: Christian Taedcke <christian.taedcke@weidmueller.com>
> 
> This commit fixes a memory corruption issue when iptables (with
> enabled PACKAGECONFIG libnftnl) is used to access rules created by
> nft.
> 
> To reproduce the issue:
> nft add chain ip filter TESTCHAIN { meta mark set 123 \;}
> iptables -t filter -n -L TESTCHAIN
> 
> This produced the following output:
> Chain TESTCHAIN (0 references)
> target prot opt source     destination
> MARK   0    --  0.0.0.0/0  0.0.0.0/0     MARK set 0x7b
> malloc(): corrupted top size
> Aborted (core dumped)
> 
> This commit fixes this issue.
> 
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> ---
>   ...se-Add-missing-braces-around-ternary.patch | 37 +++++++++++++++++++
>   .../iptables/iptables_1.8.10.bb               |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
> 
> diff --git a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
> new file mode 100644
> index 0000000000..4cbc8bdaf4
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
> @@ -0,0 +1,37 @@
> +From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
> +From: Phil Sutter <phil@nwl.cc>
> +Date: Fri, 26 Jan 2024 18:43:10 +0100
> +Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
> +
> +The expression evaluated the sum before the ternay, consequently not
> +adding target->size if tgsize was zero.
> +
> +Identified by ASAN for a simple rule using standard target:
> +| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
> +| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
> +| =================================================================
> +| ==18925==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
> +| READ of size 8 at 0x603000000120 thread T0
> +| [...]
> +
> +Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
> +
> +Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
> +Signed-off-by: Phil Sutter <phil@nwl.cc>
> +---
> + iptables/nft-ruleparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
> +index 0bbdf44faf..3b1cbe4fa1 100644
> +--- a/iptables/nft-ruleparse.c
> ++++ b/iptables/nft-ruleparse.c
> +@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const char *name, size_t tgsize)
> + 	if (!target)
> + 		return NULL;
> +
> +-	size = XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
> ++	size = XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
> +
> + 	target->t = xtables_calloc(1, size);
> + 	target->t->u.target_size = size;
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> index 81eba6c967..a94e4749ae 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
>              file://ip6tables.service \
>              file://ip6tables.rules \
>              file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
> +           file://0002-nft-ruleparse-Add-missing-braces-around-ternary.patch \
>              "
>   SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202431): https://lists.openembedded.org/g/openembedded-core/message/202431
> Mute This Topic: https://lists.openembedded.org/mt/107520169/7654653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christian.taedcke-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

