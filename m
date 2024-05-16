Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D01CC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 08:33:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.75])
 by mx.groups.io with SMTP id smtpd.web11.8539.1715848418226547299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 01:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=HDWUq+iX;
 spf=pass (domain: prevas.dk, ip: 40.107.20.75, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFu8GsZL6WFkWokgTUTGZcMFfsmcOjNeXL+HVJW5Z1QOxdGeXPvyxBUPRb/y4JxR1XdoY3ktvWTbHTdeCXVaBg5XszsscDz2dbjsOWOejaRRn9GK0ZfOL8aXcc9uVgy2PUnbxmI64bCxWnEAhS4NF4saM1D/2FBvEu12yA1QlSkOkHiA05hWBHDNFFgLMc6k583ZYUmUlKW570UPh0QDJdo3obZRRLypvj1uVUHUenbLqtjehFqlL9dpjpqBmd+LCRxs2UXwCcsVCq8roKISiqt4i2N4yjd+oUnysHmcHc3ed1RRv1rzwW/s5OlB0UaNu3H178FzCFZB3WcmKB5VOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DFv5ofHLKm7a6CNLFswojctYTMSqEL39i1uv+DaMTU=;
 b=KDpMv9EPFaohJ3xCWF5UNUP/ejNEGnUoJ5W80r5UcdhQEg/M71CouKmEQwKUycGoPQJQjR7khDUXcqiEtKVkJm9EvmXrTft2SprPqGRcAnhhC6HQWCKRxOV7URFtzj+MM8g9nsTL0I5AREfVucShVCBq86PcRXl8vrgw44Pc0HVyc1yrjyey6WM+2fTPZrpMoOTodu2Q4TDNcCaW9D4XyAJkIwaMpysYxZw9vnGJ2Q13f1+/TQ8a0crJL4+hG41SsosE+bo2u/2P4WEFdqs0grFvvhBzuwUOl9UxOWAxq6F0Ko9It28BittEiZjl1AViqfmQX+FY6Sqs2kPmpTrTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DFv5ofHLKm7a6CNLFswojctYTMSqEL39i1uv+DaMTU=;
 b=HDWUq+iXE4tA0Y9ufu/vzc3tLgRycY67xmuO/uMXtuFhq+b+BOxDmQDvFcyYAh76fJJ3FUt+DgDprCoJ+Rg4N2ae8vOBIjbFTSrXsO6Po2PcT4FjfTmueqjOpB3Bo5mkSN0NiRe8zC2/IXGf0lDikbc07fVZ0w4a4MHMoEqOevU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DU4PR10MB8921.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 08:33:34 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 08:33:34 +0000
Message-ID: <820da29b-2a8e-4cd0-909d-106798cf114f@prevas.dk>
Date: Thu, 16 May 2024 10:33:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] git: set --with-gitconfig=/etc/gitconfig for
 -native builds
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Robert Yang <liezhi.yang@windriver.com>
References: <17C8E0445B70A464.5511@lists.openembedded.org>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <17C8E0445B70A464.5511@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0073.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::23) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DU4PR10MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: ef483c21-a715-4e00-6a12-08dc7582dff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXpOU1VPc3ZrN1lpYm1GRWlTVXNKQlZUV3VCV05wZ2JnQkI5aWRMT3BYZjlV?=
 =?utf-8?B?Rkp4UXRkWGxPMmdRVFBDbHhpMUtrd3dIV095Qkt3SzIzK0EzU3dTcUxIdFpQ?=
 =?utf-8?B?N0hsc2xwN2JKcEVXaFRzSVV0SktCby9oeFpBM2FnRFBmZk44L0tIOU5uQXlT?=
 =?utf-8?B?RDhMd2tUbXlMM09BTGIwWStpR1ZhTFVBSzViVGJWOTJrRy9MNUdvSkNzaVFL?=
 =?utf-8?B?MTVjMEdzVENVaEJXKzdDOU1pcThuVDFPOERvcmduTmNMUUNnakJvYTJNRTZF?=
 =?utf-8?B?U0svSG9WUEY5UUtQaEFvdXRtWTRyayt0VG1USksraFkvaVA1VmFxZFBLcFIw?=
 =?utf-8?B?NDhkK01KOG1Fd3hNaDJteUlHcHkrOFdRSUFBRGh3cW1BSXAzS0ZPWGdkWmpx?=
 =?utf-8?B?VnFqVzZOb0s1NlpYanptZyt4UmlNTDVMbC9HT1hqMzV6UjJncHJpbVRzMUxl?=
 =?utf-8?B?L2JreG4vQnZmM0JTWWpPNTZDb01tRnBsb1I1UlhuN1VvWUd2YnNqUXowR2Ir?=
 =?utf-8?B?NjE4YUNYU09NRXVjbE1NUFQ5V2pCWTZJSkQweVA1Z1AxYUZyUm5nL2p2R1pR?=
 =?utf-8?B?dE90cXhtcTczRStmblAwZTF2R0pBVXk3OWpPVjhTRmpVMUVuM3prSjlUYVlq?=
 =?utf-8?B?ZExsbmQ3cCtxUEdEcHZmTnQ0eHhqM3ZLYU8xdko5ZmY3d1NPZEMvVXhUcmR0?=
 =?utf-8?B?dndDMG9GWGJ4OHcxckdBdW01dFFWVTh6bFVDNTUrNFcxSUtydlYxRzhjN05C?=
 =?utf-8?B?eTJLL2tEVXpQdmJ6RkdmVkdkNUozMDVPM3ZiNElwUHZmaUphcGRGdnF3bUti?=
 =?utf-8?B?eW9pYWZTM2U4YTU2WGV6SXJpWWFHRnR5bXZBZlFUeFRpazc1Z3hmZEdHOEVX?=
 =?utf-8?B?Q3ROOW9mc2djaGdkbEo4WFoyMDI4Vk9HOWNZNEV4cUxwNUdieFV0ZFJCc09r?=
 =?utf-8?B?T1ZrRk1ld3hpYnVuUkMxYnBxbU1vMXdQbjZ2U2JEemY2elp0VFhya3orUGlT?=
 =?utf-8?B?VW9aZ25ZZnlaQzBxT0Fyd3E3MTFyTUZKTW5CcXJXcHR6VGV5ak53czFYdXA1?=
 =?utf-8?B?K082UGhzL2RJbXpuUXQ0ZG9WbmVNQkhxUENLYldidTJRMzJ5K05rQktKWWJ4?=
 =?utf-8?B?bVk3UmVxYlVWY3gwR1ZKbzFkeThsY1k4dmsrQktEVVRGdnZJV05jWFZiT0lS?=
 =?utf-8?B?eUVYdVVZWEtZSGttcmFCbTQvSlprT2R4aDFOMjZTZnZCMGlCZHc2OWtGeHlw?=
 =?utf-8?B?ejhXOUpjVnczSGRkNjZSci9zc1ZuN1o3eUpMMkE3dks0aFN4bURmREhFcFRs?=
 =?utf-8?B?OXM3MmJCblg3ZVR5WHQyUGQyY3BIQ3dWdHVHdjgrMGp6Yld1VTRMY0JZa2tB?=
 =?utf-8?B?L0F4bUNsbk9DZnBhVCtZczRBT2REY0VQZmZkQ2dJdUo2SXBlUVcxVVZqcmRQ?=
 =?utf-8?B?MzNwR1dzSG9qOFFGTDhaVnJCelB4cDBhZ0ljdzE0MzJ4VU5ZeHRSb2tpMCtK?=
 =?utf-8?B?eXFQTlZwZ2ltam1oR0NjU3lZNVorQWxHYmRzMW15d0N0VTJEM3VMYW5pL3E3?=
 =?utf-8?B?Y2NZSEFqbTBsaU96M0psVVRkdXBhSVNuM2pxTWx3NmVaRXptdTAyRFpBMVJ4?=
 =?utf-8?Q?vwlgyQ1GKEA6y8gxLMoyQYxeKyq4arAUCrjI37074F9A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3dDakRlYTBWOGNaaHZpeTRJSlZ5Nk5GQ0dhSUR6Tit4aWdBQ25iMTJidVB2?=
 =?utf-8?B?REF5NEppWGtmSkdLTnNNUW80VWthZm02MmZWVEY2NVhmQzhTK3ZiYmVQVXFv?=
 =?utf-8?B?b2R4YXZZeXBzOFYzTEwwNVFwa3M2U0RaWTFxcWV2Vks1WGtjdkNsenBYSTI4?=
 =?utf-8?B?a3h3elVHT0lYOWpGZmVPUktPdVk4OTNTWGVzWkYyM1VpS1R5VEdUcW40ZGpi?=
 =?utf-8?B?ekV5VGFJOHBCcklpUlNCejRldy9oTWVucENvVTNqM1Y1WTAyTUdXUUw3OGVC?=
 =?utf-8?B?T3BFck9zSDRXZXJ5clBVZDBOckg5b1JXeENmWktreVJXWVcrVXZnc2hnNWRV?=
 =?utf-8?B?Y2thSlFIamRXOHk2V1l6KzVXb1VRTkhRUXpHWEJoYm1pR1pBN3pQUk56ZU11?=
 =?utf-8?B?RjUvamlYeHZyMDd5NVdzdUtibThwb3d5WHNRRUp2VlM3L2IxUERKUTN4K2NQ?=
 =?utf-8?B?ZGlDZ0lOVkljeUZZOExJVk9NQS9iOVB0OEpObG9YRHRxQnZKWElMWTUyR2V1?=
 =?utf-8?B?RVlKc1hHeEU2SUxOS0VDejNTcVU3WTdXMGErc2Fta2RsdkhNcFYvZTYrTjMz?=
 =?utf-8?B?aHc3SVZCQUZPWTBpaHZ3SzJKMVlEWGhuWnJ2R2xxSEFPN2laaFc3NGRkWDZx?=
 =?utf-8?B?bGNuVDJrclczM2NIdjVsSnVSN2cwcHo5dWNYdjJQLy9yRkc1NlJrR0l4bzFh?=
 =?utf-8?B?a1JrdU1ycDFuSWFsMGQwTWpJRkZiQTNHVzZrVHpRaDRwdkREU2xEU1R2aEta?=
 =?utf-8?B?T05IbjBBb3h4bUVJTEhyeDMzWVBoS3hYdXlqQXJITERxUUNqOTN5Q0pzbjU4?=
 =?utf-8?B?OUlGeE5Qclh0OE5pZ3B6ME5neEx1bWF4b0FwRWtwOHdXNzAvRCs4RVp4MFFJ?=
 =?utf-8?B?bUNYNWl6eXV4NFV3OUk1RWFDcnEvRzMxeUNRcE9uZDVaM1lyU0ZRTDNZV0dv?=
 =?utf-8?B?ZE5lOVRvV2gvRUNFRlRaYVpHVEg0cGpaSzIyMVN6WlFJSy8zMVpFeVkwT0ZI?=
 =?utf-8?B?OXVxSjdkTVorS2VubE5pUUExMGFhRytXSVBJVTd4VENkNVE5Z09OTFF0Tnda?=
 =?utf-8?B?NFJUblhRYWFIVnZYZURxc215ZmNyS0NXMk1lSWpMbkZFcGlmSXpTekRrRDJ4?=
 =?utf-8?B?TU5vT1JnVzVzeERZYmpuMUxkVEMvdUtkUXN3RFZTcGxoOG1vNWZiSVRmMXFw?=
 =?utf-8?B?TnB5b0grMm1vQVNKSmdEazNvUXBEWUxYbTNkanhpdGcvWGhWVExWaG9SVm1x?=
 =?utf-8?B?TTBkVnprUktpL0NzcklLZEdaZXJ2Nk4vWld2OUtsRzcrV0hvSEhwWmllZUZQ?=
 =?utf-8?B?SndxcU05OW5sdFZCVXlBNURUQ0JiNEdZTUZHNkJkR1g4UWpxUWtCRlpkcXFJ?=
 =?utf-8?B?Q2JCRU9wUHIyMEhaU1FRUzhaZWZ1SjhIdUNuaUVCbnlkOGJwVkFqTXFGUmJ6?=
 =?utf-8?B?Tmx0OFJ3WXBQdjNtV3lvQnFDOXJMK2U1cmdnV0twN3J4NmpKNnNaMDhiSEhm?=
 =?utf-8?B?UDlFU01RRTBzQ1ZmS2xmU1dJQk1wRi9ZNmxYT2lCT1pvOExOLzM5akZ0Qkwy?=
 =?utf-8?B?bUk0emcweWZrQ1A3djJKSk8rU3g4TUJydEliaXdsaWkyUFRqTHJJdTkzcUVh?=
 =?utf-8?B?V2VEM01MRjBRRjM1UUQ4d2FyWGZ1WXErU29aSFNGR0htWlN0OVlTZE0yRVVT?=
 =?utf-8?B?VS83VnlVblhtRWp4R1M5aDVPYUNPRFhDM0FtVVVWQXU4ZVBkUWpxOUhjQzlk?=
 =?utf-8?B?YWlaNlFHUlJZaGpVSjliSjB6cTh3dGhlTHFXSW50ZVVWNnQ1dHphTms4cGlC?=
 =?utf-8?B?RzZjdEU2d2NkTlh4SHUzWDNOeTZmSUFWV3R2N0JmUWFDbGVyNVByNDJZN3NH?=
 =?utf-8?B?Z2x6TnE1VS90aFBJQnBoVkw2YmkvMkZJNUNZU25uZVFGNmw2N2FSZFh6c1Ji?=
 =?utf-8?B?am40ODhRUGYxaitSNTNZa2l5bjFrazZRYzJDVmlUOXhOK1BDR2pFS0VNclN0?=
 =?utf-8?B?aFZjKzZMcTEvU2xJL3p4WHlneFRTRTRVREV1djAyZVRjdC9HSlg0eDM3aUs1?=
 =?utf-8?B?bDlNNnRYQTA1TmwyRTBOaEVPMlRlc2JYcjc0S2tqK3Y1dTRHbFpzc1RPMjI2?=
 =?utf-8?B?cXR6UWRiZ2UwVWFjSTYvWExIbFU1bHZqTTBBOXJaelQ4T2Z6eC9pNkNreVRE?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ef483c21-a715-4e00-6a12-08dc7582dff0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 08:33:34.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F+z5AznuMezjGphtN7YbVna92BP63Koa1yeo4gOe1w5+qOFhCSzQZggiDQI+QjiRxdzYkC1VXrZ062EO0eOpOYVYuLqsIZgm87tOMfe+Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 08:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199445

Polite ping.

On 23/04/2024 11.57, Rasmus Villemoes via lists.openembedded.org wrote:
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> 
> Commit 6c2ae2346db0 (kern-tools: depend on git-replacement-native)
> broke our kernel builds. For saving space and time, we have a DL_DIR
> shared between multiple users/buildbots, not all of which run with the
> same uid (and with appropriate sticky bits set so that files
> downloaded by one user become owned by a common group and are readable
> by others). This works fine also for git sources because the docker
> images we use all have a /etc/gitconfig with
> 
>   [safe]
>     directory = *
> 
> But with the mentioned commit, the host's git is no longer used for
> do_unpack (nor for do_fetch if re-building and sysroot has already
> been populated by a previous build), causing spurious "fatal: detected
> dubious ownership..." failures.
> 
> Currently, the path where the git-native binary searches for system
> gitconfig is the sysroot from it was built, which obviously doesn't
> contain a /etc/gitconfig. As for the nativesdk variant, respect the
> host's /etc/gitconfig if present.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/recipes-devtools/git/git_2.44.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.0.bb
> index 90e555eba7..78b00dd19f 100644
> --- a/meta/recipes-devtools/git/git_2.44.0.bb
> +++ b/meta/recipes-devtools/git/git_2.44.0.bb
> @@ -40,6 +40,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
>  		--without-iconv \
>  "
>  EXTRA_OECONF:append:class-nativesdk = " --with-gitconfig=/etc/gitconfig "
> +EXTRA_OECONF:append:class-native = " --with-gitconfig=/etc/gitconfig "
>  
>  # Needs brokensep as this doesn't use automake
>  inherit autotools-brokensep perlnative bash-completion manpages
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198611): https://lists.openembedded.org/g/openembedded-core/message/198611
> Mute This Topic: https://lists.openembedded.org/mt/105686820/4164276
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rasmus.villemoes@prevas.dk]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


