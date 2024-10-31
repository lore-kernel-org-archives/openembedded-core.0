Return-Path: <katariina.lounento@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBE4D767C3
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:47:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.135])
 by mx.groups.io with SMTP id smtpd.web11.12870.1730382452865008806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=a7Ul3dnG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.135, mailfrom: katariina.lounento@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+YNfn/M3MRopExgnC3+9RXOcwyf5AnG90R7+pTq2XIEqvmXw+N+OZ0nx3RvlvHNSFjvSiZPYZ8tz0oZzIGVx+2YCNfg+cLxz4RNfhHqkCZ54AcLObY2hFpOzOs1KI5oCWa6mn42NfhQLOfp4bisS7DQEaGtSoHuhMX/Gg5TD1vL/KAM8R8iExNkQsOKNNSeS7VopE6ThOIFCT4tSDwKFM+w+9ftJJqVlIH7wACAY80gaATh7VDrxw4ZlT+TT34sKxA3zpUGQHX3hJzUuG7OhrqGAQE+owUtZrYmsa5d4jDZ8Jy8CvvTcax0EmzW/9xBuGVj8i48Ne1iyLlmZGNl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUt8Adal0GKFClURn7LqRc+U7OSVBVk3Lx+lPMD7Jdo=;
 b=sVQQBSsY//4MvNJhLxzJHoT7my3I3IqhxJpqI3a/iypXuJ86Oj3ChEK0GVMTYWHMkEu4+r8yQSLMiPAPJ2AexRK0xpaAOBwVHLnTrumdhwXLOAyDC1+3gTfX+gvoG+T72LFiMyKLPI4HLeeBvsb1soJO2uP3CVcZnXyynBL3MzirCOexQCo7YOTkSjuIp4YR635excii4ZqnCbsiQrpZ97o0Hnjf9W45K0Rvq63Cg33z3VB/b6llPp+Q3UH5lFmxBEz/64wrNCIiH4ZZpFlZE4LNY3YKoNr00bvX2JM9qwTh74Y5XB87zwQWpa05Td4AFJffy7Px0ZiNVxY9HKTbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUt8Adal0GKFClURn7LqRc+U7OSVBVk3Lx+lPMD7Jdo=;
 b=a7Ul3dnGJcmh+3ZSJItF0gNxCamYjY15OLu8WDV0/NGQrYJbBjFE2F0/belfdCNQVhQtFxZU69CXkmpMgbedcEkgJh8huwTwOrWpCVs75Hq0/IS3xaZRrvRg/ulGL4/wQHzIN1/64aYsXOvutcMhFP/9OSHTalsONiN/1zl2YVJ2UPlN28N/650D6II7/kcxH9Ved/7cO0toUZgUwO63TrqMrZAs9OKA7w4b+dUo2P4/5i+Tz/mrzAO7cZzNloI7ryW6MNUsPfMgmd3mVIeAHIw4044fJXvwwYUmBXDsFtu0Rv/mRKR22luPeKtdYwuVACNqTabNEiG8+w12gZVT/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM8PR06MB7025.eurprd06.prod.outlook.com (2603:10a6:20b:1dc::21)
 by VE1PR06MB7072.eurprd06.prod.outlook.com (2603:10a6:800:1ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 13:47:28 +0000
Received: from AM8PR06MB7025.eurprd06.prod.outlook.com
 ([fe80::6cb2:6e3b:4911:fbd6]) by AM8PR06MB7025.eurprd06.prod.outlook.com
 ([fe80::6cb2:6e3b:4911:fbd6%5]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 13:47:28 +0000
Message-ID: <92e65adb-406e-4641-803f-f7ae47017d89@vaisala.com>
Date: Thu, 31 Oct 2024 15:47:26 +0200
User-Agent: Mozilla Thunderbird
From: Katariina Lounento <katariina.lounento@vaisala.com>
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20241008063325.62462-1-katariina.lounento@vaisala.com>
 <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
 <b39c48040837f4648c227e46db2f12ab1fd09216.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <b39c48040837f4648c227e46db2f12ab1fd09216.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To AM8PR06MB7025.eurprd06.prod.outlook.com
 (2603:10a6:20b:1dc::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR06MB7025:EE_|VE1PR06MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 81877ee7-7732-427b-486c-08dcf9b28f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zGD0Su4+GuYUxzE+EpO7sxhwBqENcar4Rgc9XkWmQmq3VZK6/Hc/0fxBJ4hE?=
 =?us-ascii?Q?Kj4z1SMxkrgYEzgzwrOYXzsuI76mMJ9jX0emGDFSWM05w4Gmnsj2Ngn5j4VT?=
 =?us-ascii?Q?08bb2YhX+69TVD+hfRuVsXsT8UATNLmJkCbe2hciUG+K4DR6rNIp1NqdEXgx?=
 =?us-ascii?Q?lEtyRvHFlMBZBRp34nYVHBMzK1ppuRnTVXoLBxQLbwsBjK9bVFeik+FdzTfD?=
 =?us-ascii?Q?YklsPCAMWBBmqr6qVp+/5M8S11wUUBNi8P8LXIzl8vAoe84XhyHD70JJC4G2?=
 =?us-ascii?Q?81rBzAiIyBsYezCsLgr5mPYAU0FqPvLA35kOOz8cjfH1e8qye34WyJ3TkVXq?=
 =?us-ascii?Q?gcD8OKfdU6aVQtmMEnGiHm56cQU5SBJ4oTMGt4hh5msMm1fyyMs9GGQWuXha?=
 =?us-ascii?Q?pghCjCpjhjZZlxSpTCk8NIY4/W3n/1fv3aFX7OfFDeiztUS3YLi3JFKM/J/d?=
 =?us-ascii?Q?nFbsOQj4047oSUpqlyO4Yagibn6CyNwEE95HXLs52BtE2UBSBMjYz/PnawGW?=
 =?us-ascii?Q?TUSrkRgjfDopDL07aJnhnGV3aMVDCaz2vGcRA4SbI/TaAWxaF9mzJ0TY8yDC?=
 =?us-ascii?Q?f1+zk6onyvUU08QaLFXxUCUx6E9FLmGiJ4ieRNBZgN71qPpLbKbfV9aCP5y0?=
 =?us-ascii?Q?Vd5EaCnahheatWI+m6B2bq1guKDsOlX8TMKF5EwQ8ZxndBe3cYStyZc2EUHn?=
 =?us-ascii?Q?Qg+M2SPpiozIXuVDRK6LgnJv/TiQC02ahzm7avZiCaTr0KzVWl7P3p8GbLev?=
 =?us-ascii?Q?zyT9ua1hhQg8VdZfib9hO3PobJWe9O1oLGg9zcft0mfNVw++fbSGu0GSSLxG?=
 =?us-ascii?Q?zAXrtVsXMnZEHzaM5jzHnsfGs+zrpBzh3ALX+kKmZNRK6GHtJLnrYH2e2zPw?=
 =?us-ascii?Q?TX9jahBLJGjOznjfqtG3jZ6/ZNurIJr0RZnuJi9rJp/NpWTtwb9s0n9pgkV1?=
 =?us-ascii?Q?FasYRhmvP//RPCTdFXVAwDd2Oj8w4TRfHWxDHLr4a5qJygcBe/03SsvsLoOH?=
 =?us-ascii?Q?mCiivf3CKgr7s4ErtGqvzJxSJovPOo4uEYnDpBLyw+X3VvWX977ww2b9NoZv?=
 =?us-ascii?Q?Bfzf35PABhzqP/Cn/D/P/0xbfubzGPFEeb5lfM5Yz3ZDbTsA7lp1Zy2xHDvv?=
 =?us-ascii?Q?Iz4Q1FBuh+1YNhOO9aHPKP1QavFEhyuVw+SdmSPVqwMcnhgfU2jk515XSwIL?=
 =?us-ascii?Q?Q3xv6WpAWu2s2v8qHB1DB/B6RjmMEpzEB9MOdklnlvB+bPav558HM8ZUHid8?=
 =?us-ascii?Q?FRlSME4EcMuT5JHHiV8ciQ1n+UT8zlTqxmcEHYT3wrCA8XdFoIWV9u97GmGG?=
 =?us-ascii?Q?MHYI5d+XYUaUJNHlqZXO5H9g?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7025.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rbLH2lXH9vpJB/Vth7S3PnpGKWC2pwVlKy6GZhbXBbkWWwVyxVA6XHNcfhyX?=
 =?us-ascii?Q?vBUJNO/21yYuB1vrYEwdgbsfid6N3yyVT26vmgsAWYyUsU/CaMCTb6nc/l8O?=
 =?us-ascii?Q?amLlxiX+V6mqyHuIYsEpdWYLXqpwuJsGLkPLvltPFb9gbs7ChPvoJ0tdGHZL?=
 =?us-ascii?Q?H+Nf1d9DN7i9mRZ2Lhcg1oxN/VkPaM5ZY2WA5ZNSaKln3e0hfe96+F+mXg3W?=
 =?us-ascii?Q?+pQUTfYlmfctyxrXmjhJTjKuqaG1wMklPRRH4VZXn7FIgAXjay36QEwe2raz?=
 =?us-ascii?Q?GZOsA41/ucSwPOBv6dM3V9DBTYBhyFhw+Qa5bkQdHvCzASQFFdbL9Qxc/2ko?=
 =?us-ascii?Q?Dyx3hjpATPjYFJv1wLYIDVoJWm8GNo/1k7nw8DH66cE/DW/fhGco2uMPextu?=
 =?us-ascii?Q?Vd2lb4WhTlBjh8wt51/o4YGEe5KlVRm7RlFWLVTAE7pV1VenT5UElwSx6Pyv?=
 =?us-ascii?Q?dmHzi13eDk7ujvbKWUC3q04Rzk94o3Kep6pBJ9BTidETATauJ+LrlSWSG3RO?=
 =?us-ascii?Q?KDMAgqY8vg6ds3EKphrEsGQvSBdkIcvNyX0gZqkrl6j0icbEGxvRrmdoczKI?=
 =?us-ascii?Q?j23FLyLB6Vzsq1LJax/itrmrqjQMjqTQCT13Fbh3xw/f2n//1fivMUzJBF9r?=
 =?us-ascii?Q?fe8KN8t0UqVPgkO7Q3d6s+NwPLxiATwWrBkv/H/rG3TiHaDBEDEbdKwco71D?=
 =?us-ascii?Q?8epEixaV3awbJ1f+i+BuX8YCtebNJpUgcduTr4RI4aZ0jv4vJISEALPvWuNs?=
 =?us-ascii?Q?iMpBXSIb/C7L5wK8V0xx3qmHpe9kTO1kTemDX9rBxpYhMamMLcUab4KEW5AC?=
 =?us-ascii?Q?Gl6ZuIc3deFAq8CGxwXeAW1D+7rV7n/c91P56ggb6bIIQbD6IWdiAoL5//eK?=
 =?us-ascii?Q?JjHKQcIEqelg9A96BDnpfMZzjrjk+cZDeNnCkdZcJH/16UXWNyxX1M6qu1Vl?=
 =?us-ascii?Q?hQEme5hoJbAelUKSGErSLWzyVf+MXzgi6KK852x1o8x0xd3EoY/QK0jI3GeL?=
 =?us-ascii?Q?rKF58nC+7TCL9k1KIDopUJEilqRLBDgSRnlIog+TYpzKwZ5J8mnj/KaEuwe2?=
 =?us-ascii?Q?Wl6dEY33Zvywoo4SwOufA/MRWFsmmIamlBbcFA0U2YLOMXzXL2dc+jquLzwq?=
 =?us-ascii?Q?4tjeTCeAyecMsrU4UvIMMlgCpPeb160BBwVsTVtBUy6dAhAq5Ns1KnKg/7pH?=
 =?us-ascii?Q?FQMVKTyQ/0xrvFbQqgZQFstYOW3AH1WKBgaYkQTXqu9Z7bM2yrnUjvovaYQD?=
 =?us-ascii?Q?iPNs1tJqLrG+cuhcSBX4e8yaaSG8WQtepLSSk66l30CL8EJjQjkscX1ZJaIo?=
 =?us-ascii?Q?U8+0dqtvizqkMxkFBJq5z/0qn66v0/tY0m+A0rRQBnlngvQmIf0t0Zs4TQ/y?=
 =?us-ascii?Q?XRH1KLP/7ZOLtGa+W+C2pWeK4yzBGMFMoJqMTbegGXnF2qTn990F01FwtHtl?=
 =?us-ascii?Q?ANgaF3EL/UatNics5FqbJsdPHe09SD9ytdX5btL4bBSZtBnpevdcDdvwQN7w?=
 =?us-ascii?Q?0W4KWCUC6gpfG8a9qc6d7U2q+VnqbYDrZbTXAR/5T/8kQ3J/6T8j8yQGYP7A?=
 =?us-ascii?Q?d+8RkKTRONxz0s3mN7rXTfs97bmUWFn7lKtc8QhrjCRppA+GMuuQewnEdYda?=
 =?us-ascii?Q?6XtYprrqEetHsupGfKVJhlA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81877ee7-7732-427b-486c-08dcf9b28f24
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7025.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:47:28.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u4BXsZmqBk/XEUaiNnEInSRlfXW/9ML5AIVWjPbiGjcjTj3A/RwI+qYFTQ97cubbpDtLFmL9/43Mbf/FOREyBuQ1NLqGbTLLNDyPWcAYpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206584

Hi Richard and Alex,

On 10/14/24 13:34, Richard Purdie wrote:
> On Mon, 2024-10-14 at 12:21 +0200, Quentin Schulz via lists.openembedded.=
org wrote:
>> Hi Katariina,
>>
>> On 10/8/24 8:33 AM, Katariina Lounento via lists.openembedded.org wrote:
>>> From: Katariina Lounento <katariina.lounento@vaisala.com>
>>>
>>> The list of valid statuses (`upstream_status_literal_valid_status`) was
>>> missing "Inactive-Upstream", which caused patchtest to fail the test
>>> test_patch.TestPatch.test_upstream_status_presence_format for patches
>>> containing lines like:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 +Upstream-Status: Inactive-Upstream [lastrele=
ase: 2013 lastcommit: 2013]
>>>
>>> with the error:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 FAIL: test Upstream-Status presence: Upstream=
-Status is in incorrect format (test_patch.TestPatch.test_upstream_status_p=
resence_format)
>>>
>>> "Inactive-Upstream" is documented in the Yocto Project and OpenEmbedded
>>> Contributor Guide [1]:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 Inactive-Upstream [lastcommit: when (and/or) =
lastrelease: when]
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The upstream is no lo=
nger available. This typically means a
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defunct project where=
 no activity has happened for a long time =E2=80=94
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 measured in years. To=
 make that judgement, it is recommended to
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 look at not only when=
 the last release happened, but also when
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the last commit happe=
ned, and whether newly made bug reports and
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 merge requests since =
that time receive no reaction. It is also
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recommended to add to=
 the patch description any relevant links
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 where the inactivity =
can be clearly seen.
>>>
>>
>> I'm wondering if we simply shouldn't remove this status?
>=20
> We (as a project) have had this discussion before. There are indeed two
> sides to this and I can see them both.
>=20
>> I believe even if the project is inactive, we should still aim at
>> submitting patches in the event the project starts again, or maybe it's
>> just that nobody has sent a patch for years and the SW works good enough
>> for all people involved.
>=20
> Some of the inactive software has no place to actually visibly share
> patches. The other advantage to having a separate state is that it more
> easily allows people to focus on the areas where we can make a
> difference. It also gives us a big hint about which software poses a
> different set of risks if there is no active maintenance being done on
> it.
>=20
> Overall, I think having the state does have some benefits. I do agree
> we should submit where we possibly can though.

On 10/14/24 13:52, Alexander Kanavin wrote:
> On Mon, 14 Oct 2024 at 12:21, Quentin Schulz via
> lists.openembedded.org
> <quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>> I believe even if the project is inactive, we should still aim at
>> submitting patches in the event the project starts again, or maybe it's
>> just that nobody has sent a patch for years and the SW works good enough
>> for all people involved.
>>
>> What do you think?
>
> As someone (you could say, the only one) who actually does the work of
> submitting the existing Pending patches in oe-core and assignes
> Inactive-Upstream, I strongly object.
>
> Inactive-Upstream is not assigned lightly, and we do it only for
> projects which are clearly abandoned, and have tons of open PRs and
> issues that no one reacts to and in all likelihood never will.
>
> If the project starts up again (e.g. makes a release or someone
> discovers a promising active fork), then the patches can be easily
> reassigned to a status appropriate for an active project and submitted
> with the knowledge that someone will actually look at them and act on
> them.
>
> Alex

Sorry for a delayed reply, but based on your replies I thought a=20
conclusion was already reached that the inactive upstream status is=20
useful. And regardless, I think patchtest should work according to the=20
currently documented conventions.

It seems the patch hasn't landed in openembedded-core or poky master or=20
master-next though, so please let me know if there's anything that=20
should be changed.

(I just checked the patch still applies cleanly.)

Thanks,
--=20
Katariina Lounento
katariina.lounento@vaisala.com


