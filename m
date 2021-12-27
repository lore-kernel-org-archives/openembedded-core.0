Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFDBC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:53:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web08.27075.1640616793975896104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=wfPhMCNq;
 spf=pass (domain: vaisala.com, ip: 40.107.8.54,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJoPQTpqhrL4y4K5oM1C7KSiTh+uEztyndh3to3dEAU4hJ+riXXYvWPOdXZQhLIqqSYPTgA9bTXu9paZDnfxgCqpHby1h/FqrrvjcZJ/sC2RVjJ06TtyXXpapgQHUNSOUQLPpzIUFxDyIudTUsxKerAT9DG20bODLktqw3r1XEn6fbUbcOr73ZSafBGPeXThFFtMRcHDmVoqBnBS8R8z+/4V7N6JgRMOApm+TcDlgfAV2s6nhTw4pi5/w5FzmCASqJfgB0Jb0DXZNMi40PYBu5XcaKJgE3dFMvhEWCmMhNc/+4v6V+x64ElIxewSokfzqGCJeYK6PJveQ7BZC3h7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7ArmXe88ou1Lda/1bzzomjd/xMMd5dL2+XtWZQ7od4=;
 b=dc366+NrZqnjTMRDooBNx9vELgqA/EhE4jYoFM2xG+Wb2a0BTAYNgBgBEJwop3yaZaN4BPvLKNTC1eL0kVWtXwqXzftkZY+s+KY73rsG4GWVB5VUffi6k+ANnArc/0Ho5TNF0qsTIrBr5S5X34h74l+QoGcDHT4k19ioA1p+/MYaQ9LOnbz1AAc5uwwZDHPpsvu/SgSoFxjlBxJdDDbdtTx4QapTxDl3JOwybOcQkHU0bbjrIdNqFyITG8QvXQWlaAiEXTXnThvSfE7Drek2x2w6X09OlPGOf580mUZErTNWbWzxKOcbwB/AP0RwkML9Vq0Zd0FECnVofqXLJCKYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7ArmXe88ou1Lda/1bzzomjd/xMMd5dL2+XtWZQ7od4=;
 b=wfPhMCNq7GKbzDshQsRv5KZuwSmy2v0WBI0xK8XlY4Awm8ofDlwOmQnFeHN8Kg+0nQGqYNSSQeIBAxMrSunlSLSdW7d7Ih2AIbvwE5xkzR6tog3gDGQKX3KBJBQ/t8Kddf0NLvANVaPFWbDT+JbZ79K1Tf9v9C4eEfLfIlITQui2on/vLSyQacTr1bglnZ1AVpr5XiaoTyPEJh/d6DmcD81K/Dt1dcuSmS855QsVwq/uWkQ5TDsqEZ5GABi6GjUkQLg5bHLEjHpXKITSzW/cBAFdk8T19k6hbWJqNEpTV69RUyti6FTypUB9e1xVv4goniDyMg6a/5WIOGyNZWJJ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com (2603:10a6:7:23::31)
 by HE1PR0601MB2348.eurprd06.prod.outlook.com (2603:10a6:3:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Mon, 27 Dec
 2021 14:53:09 +0000
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::592c:1af5:a42f:4eba]) by HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::592c:1af5:a42f:4eba%4]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 14:53:09 +0000
Message-ID: <aa9599c301afd46cfceb0122b01b2dab758fcbcc.camel@vaisala.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: stefan@herbrechtsmeier.net, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Dec 2021 16:54:33 +0200
In-Reply-To: <5f6b7b04-7570-5662-e00d-6a8212b1bcee@herbrechtsmeier.net>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
	 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
	 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
	 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
	 <5f6b7b04-7570-5662-e00d-6a8212b1bcee@herbrechtsmeier.net>
Organization: Vaisala
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0029.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::20) To HE1PR0602MB3340.eurprd06.prod.outlook.com
 (2603:10a6:7:23::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0886d52c-d285-450c-cbc0-08d9c948991f
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2348:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0601MB2348E5FFB18AE87848A77CB3F5429@HE1PR0601MB2348.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4H8aDTKlziO9P0v18+PzhMlJ7wvovqy0iyWBsVwoHfzHVlB71YEWZVm7zwm3hv0vJBhBB2Sac9HQIvXcu8IzSwIsqJamBx7/yEGZRzULrQM3smdnWpcWUB3QQTg7OOlH2NveT2G/59s+jSwbfiznu7t/FcT6G/ehoiwMIGXerjl9lAtkQWw/NoZcSsBLjE9L95bta5IWd90MSas9rDk5/sxJFeCKpgE0WquUAGq5qTdwWStaesqcfzGwik7nPYcm5HM83v+xbZFgo/DSDAuAwnvokyMU/lfMymZg3Zv1LaQznEk/pCxsZMmsv6HVVefbOT8iWLmAnOtH6ghmQmhxxAGuY1n843cZ24mE+XlDfyk/i12/4SlobcaDDjRvV+FYE4YVvuQaxTuMWzsvoR9rsn2BZxo0kRf6lNxBO5t+J/fxtpIwpj3Ue12FrrFSHH9e0+UQHb1/9UBSKVrySaxDoZKejpBX3xzuuRry1iBUPe2X8OV4T61tRJZmGYqTPB/nZXq4fl/hY9Av80EJmcpcv16ZopLUsvlr5VCFU00+Vq37Gr8HW1tDpjhNZGJSeJPmHZarOK3GhaQb3vbNUMi7hBeyyh3+o7xzUOX3iHlFp24iVp0Waxe3Z2AGbEXwtkqEWlFoeFwUAWWwAzZntaokA1pR6f5LVEh2dZDfcN7ysT4g1u/9tUXPrFfTzkM32b5FcTI6tuOOuE94TzUMUYt6caHiAGFGurtX2o93f0BFsKY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3340.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2906002)(508600001)(6666004)(44832011)(2616005)(4326008)(38100700002)(6486002)(316002)(6512007)(36916002)(52116002)(26005)(6506007)(8676002)(6916009)(86362001)(66946007)(5660300002)(186003)(54906003)(83380400001)(38350700002)(66556008)(66476007)(8936002)(4001150100001)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S21ydVlyMDdOVGZMUzVFRVYzZ0VDZ2xoN2l3RTlJU2E2VFlZQ2sxVjRqcmlV?=
 =?utf-8?B?Q2p0MnRoL29GNGRFRHlEcmxISkdpSUkvdEsrTmNjN1ZqdHBUNFRsc1lVYUpQ?=
 =?utf-8?B?SThpOVJ2UllPdjhqMlBaZTRvQzhDaytKd29ra3lJaHZlZFRLSUNsVi9ha1Qz?=
 =?utf-8?B?a01nOEVvMThIWXQrSFBwc25yY1lHT3Rzc1RQOUdsWWNVaitINXJSVzBNU0Qz?=
 =?utf-8?B?MFoxQ1FnOFpySEo0eHRDcjUySnAydG9IbGpVRS90N0FUQmVETnhoNEFFK0VN?=
 =?utf-8?B?N0o5STJIQ1AzaFR6WngwSlNWRFN1SmVNZFQ1SUdzL09jTml4b2EralJndWFv?=
 =?utf-8?B?WjVEczJKbUdmWVNNZUJDNm5LbWc3Z1Z3TkJpUnZFMDJjazVORnplREh2YXNs?=
 =?utf-8?B?K2tFT2FBR005czQ5OUxhamtLQVBTTnFDOW00SEF4Z0hIMGdnejBkTVlXWjZy?=
 =?utf-8?B?RXh2M29LdytrQU5uYWZnU3ZmMGdyOG5QRG5GZnZ2NUNXM3RuOStZYWRxTUov?=
 =?utf-8?B?SkI3bm1ISzNNL3V2OHROR28zSUhmZEQvay8wd2pMbDlONXdDam1zY1hZc3JN?=
 =?utf-8?B?ZFRyaTdRVFFXemk3TUtZUDVnZUpUOU9CbjEzdnYvek9QQjNQMmxWVGNmcC9I?=
 =?utf-8?B?Nkc2aDg3VWtIQXYvbzd5eSt0UVEzUW1vVUpPWXFaU3ZrTUhSVG5YZ3FGa0FM?=
 =?utf-8?B?aXIxakdqWjRlZ0xBeG1hNFZpMURFM1RFc2lBQzhmZ2RBWkEvWWRkYmhjaGow?=
 =?utf-8?B?MGllc0FzZDcwS2FiUjFnL04rK01oaGpFaE95ZUcrQkhkVDlORmt0THFmd2la?=
 =?utf-8?B?UWY0UHZlZHlJT0pLSXNtTGFqR0E4RjdzZHI3dzFMOUd0MWtjcERma0ZCZnRE?=
 =?utf-8?B?UnE4WERxbnNYdkVJZml3VHdPdFZrc281VVZrYjdsYzFQeHUxUlEvbkdxVnJT?=
 =?utf-8?B?Vk9YZDAydUFqemJnd1RXdUtPcWdlZVlUTDkyT2tEb1hJYnFuekJIVmdTanJZ?=
 =?utf-8?B?SmloR25Yb2hzWVZNa0hzU0VXekdtb2hmMjg1b2M1WHpxWXZUaVVTQ2hDVGZG?=
 =?utf-8?B?UFgwVWRmZHpZUWxKTFlWRmJubGNhWFQ1SmYxaUtLaWJIOFJmVmticGluMThn?=
 =?utf-8?B?bUhMVWNlZC8ySFpxK2dDUkY1U1lqalhNeEZtTitsLzgvRndzendKV2pRZFJo?=
 =?utf-8?B?UmlDbmtqcUpRaS9xRHd6NFVseE5BNXlzUVUvMmJhVUdmQ1dqU3orY214SXJx?=
 =?utf-8?B?QklEalk4VkhVcmJmYnd2S0FhS0w5MjRaWlIwRlFmNlQrQkdXd0h0WmVBNzFs?=
 =?utf-8?B?MEhVQ002bmFNNW1ia2R2cGlnZTlMUW1JVW1xMjgwTGNsUitUUnhmVWhnQ2s0?=
 =?utf-8?B?L1FiVjNuQ21xMVBBZ21JUDN4N3FQVklibzJwNHpudHByYU1FdmxUTDRlS0tI?=
 =?utf-8?B?ajAyWUxmdk1NL2xzd2N2T2hiUWd6Y0JvNVlVYzlHMzRQaDV4MHRUM3liUitC?=
 =?utf-8?B?SHBONTZJc1o4T1g4alpQT2JjS0poN0hHMkdWeEZJM0IzYlVkei9xZ3BMbTRo?=
 =?utf-8?B?bm5SVXRSK0p2NmI1Y2RGck84aVMyNU1DME43cjdhNEpPQVBqTjRKcFBnSWxT?=
 =?utf-8?B?ZWtlMXVTa0NUNUx5UjZ0SzJpWTdpZU1WMlFvaHBNa2grRWlBa3ZaclZmd0dU?=
 =?utf-8?B?VXcrQU1wUWhmdGwzU0tJQXVCRmtUNmFKbXphWEdqSXdMSUZ1RndjMXdpZThh?=
 =?utf-8?B?OFdBaHd0a01JcHAzVWZzZEc4aWhoaFRpVis0MzN2VDhETUl4cmZYemQwWU5I?=
 =?utf-8?B?Z09VS3Zzb0gxdnQvNTRveUlBU0dxQkZJRjRQRGxMNlFIQnQwMCswZGJMRWFV?=
 =?utf-8?B?N0l0cXduS1dzakMwZE5KK1JYRU82SkZoeStGZThpL3V4dEJoSXBJTU05NjFs?=
 =?utf-8?B?OUkvUm12K3JsSEdJeHFJQ0ozUjg0S0NMUnMyQ21sMjZoUTIram1rekhJQU1q?=
 =?utf-8?B?Q3Y0RndyaFBFUjFxZXlIWS9WbitWR0kwSHdRbEt3dDJiMThhZmc2MWNkNGhL?=
 =?utf-8?B?SnZzdE0rWjNvTFNlanExcnZ2UjZabDlZL2ZUYVBHM2srUTdpU1FQK3dkWlJa?=
 =?utf-8?B?MVVVcVlHZFZIai9adUNkcHM5eExrYWVaNit6MWcvVmJLOUlUMTdEZ3dBeVdr?=
 =?utf-8?B?N1pNcW1MeXZEOGhSVkJXelg4OXBxZExvM0NiNjV5VTBiYnBGSnk1dzkyV3l6?=
 =?utf-8?Q?EM50uRoMXLPlMLlmsFrk1pOp7toJKkDYPsDYx/wvvg=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0886d52c-d285-450c-cbc0-08d9c948991f
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3340.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 14:53:09.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cql7hgdkU8u/DjaLG6S+9bLOYLHVbc7hVw2EZTlwMgI3fLpYAnmtZwakMlVnehOSl9EPdSqVp0TP/Oh+CacOs9XqMD0LhdorcuAco1AkN5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2348
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:53:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160031

On Mon, 2021-12-27 at 14:38 +0100, Stefan Herbrechtsmeier via
lists.openembedded.org wrote:
> Hi Alex,
> 
> Am 25.12.21 um 20:41 schrieb Alexander Kanavin:
> > On Sat, 25 Dec 2021 at 20:32, Stefan Herbrechtsmeier 
> > <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>>
> > wrote:
> > 
> >      > I'm not sure how to deal with that, so there aren't that
> > many options here.
> > 
> >     This is a common problem for all language specific package
> > managers
> >     (python / pip, Node.js / npm, Rust / Carge, go) and we need a
> > common solution.
> > 
> > 
> > I tend to think that the best (and the hardest) option is to
> > improve these tools so that they're usable inside do_fetch (e.g.
> > fulfil the caching/reproducibility criteria for a bitbake fetcher),
> > and the needed changes are acceptable to upstreams.
> 
> The real problem is the different philosophy between OE and the
> package manager. The package manager doesn't care about duplicate
> versions, maintenance versions, version updates of indirect
> dependencies, license compliance, CVE checks or dead code (examples,
> documentations, test, 
> ...) and if they care every package manager have its own solution.

The Java OSS ecosystem has had fairly well defined build time and
runtime dependency metadata commonly available for many years now. The
more widely used build tools are capable of using this metadata to
calculate a solution Set(lib, version) that satisfies the version
requirements of the dependency graph - or report that no solution is
available. Cryptographic hashes are however by default provided by the
artifact server(s).

For Python distribution packages, the 2020 pip resolver is advertised
to be better at calculating solutions to required package
dependencies. Cryptographic hashes are specified for pip, use is
optional. The PyPA Core metadata includes some potentially useful
fields, such as the license and what the project requires.

The language specific package managers could potentially be used to
export dependency metadata, and also potentially to check "with (foo
i.j.k) and (bar x.y.z), is there a set of compatible package versions
available for baz and it's dependencies?"


Regards,
Eero Aaltonen



