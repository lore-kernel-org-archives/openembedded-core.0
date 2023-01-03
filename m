Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767B8C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:03:52 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.40])
 by mx.groups.io with SMTP id smtpd.web10.67629.1672761823329102948
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 08:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=RG3zRs7u;
 spf=pass (domain: weidmueller.com, ip: 40.107.104.40, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esgQzRjphBGAHvwuv1F9QkFs1ue+/t+Yw6DnT1TqgLfYnhHoju1KvRgAWdhKUhvMMd0Nw057cBhD3DP+L231Xw/BkEx/5f5L4z5eRhP4I/RpHGQViYPieKqG4UmI0BYnc2qC8WKNIMNZM3DX25eAzPkHkvWE1ovY4Sd26OtWY7dlGyTeH4foDV3/XbYQQGUutkECnAOgobOBnb+/qlN6Xbhn0iD04rZrBoPj7cug0jIuMH3+A6ma0fPvhGt+FI+X99RBHbF1eFv1t2cvV6r6IvLYPP1XCmgA3aY5TJ61P3xtDCIuzVp8cRZ0gE4m7f7kaEBLE1MnH3Ewh70ZpGlazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3zu1LYldjEO2hudBImxh9yoHvE6iyUOcPFFECkYeHg=;
 b=N5otDdTY0u8cBUsWUr3Hh/WN8WwzHC9cOA+8zbWB4LraDhKUy2KxzLPGRdsqccQL9ibBdZgM00J9dSAdW4pLCvhidjqlmUP6roMYFZBbUB0VGzuIJ2NQ/kUmYwjEygnGnWQWm3pp2t3lc073sMyQRaHbShol5rZQ/msYr9HWzSXENba7zJbPCyOn2EhmtwlcPmAhzu7bEnx80funDo8dVnvcHFGy4nSJSLGrisMBJX6I9uofuREeRJ2zlkIY86cdADJ4ZaXP5bSgHhEfVwKWAUicjfGNhcZCXyyKRi5SDgoe03rXl4mDh0JJcQP3S1imdX1z2vuIvM+oofEzCP477g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3zu1LYldjEO2hudBImxh9yoHvE6iyUOcPFFECkYeHg=;
 b=RG3zRs7ub5Fa+gDdivSLf0L7IzQHjn6/P4hxtmXGqvD95jC0PK3bZVs1IJyUu4WbKpDAhVetDFBwRi0qc6qLWbV5zgqXN5n3v7R4f54f6XsrytE+O+br29l6omeeSaOTb1GGPIEjIf8fCLXUu5rEMpr5gusbQ3miRhSmrF4IEck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI1PR08MB10148.eurprd08.prod.outlook.com (2603:10a6:800:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Tue, 3 Jan
 2023 16:03:38 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::5d99:289a:ffaa:f545]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::5d99:289a:ffaa:f545%6]) with mapi id 15.20.5986.009; Tue, 3 Jan 2023
 16:03:38 +0000
Message-ID: <bce338f8-59bb-8786-87d2-7553f800d176@weidmueller.com>
Date: Tue, 3 Jan 2023 17:03:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Martin.Jansa@gmail.com, Vyacheslav Yurkov <uvv.mail@gmail.com>,
 stefan.herbrechtsmeier@weidmueller.com, wonsang.ryu@lge.co,
 =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
 <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
In-Reply-To: <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI1PR08MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fa405c-3fdb-4918-08c2-08daeda41382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	muoYDKhRwchK59CgsVn9Lbo4fNT0xZXYYKqVS8DXc5RO08zYTLQ6TayDNyCySzFMYJ5mnl+Oc5ljlcLgUcef/PxDGdv/VyAnPJyP/CtYKxXG0qZNzYulwuQ/drBHBjhbxMtl8hIjdq+3vQ3LufQcDNB5r+3N4UWIkyiJG2TngMLgPjvQ5tVkREGxnActMRNqPy59vQiboAGET9JoDAPtSyavO7q4Bq7vidZKDfxqK2ugR63sYMkgmE/cnghF2/aeKDvH4bc3dy37qTIYpudoKb0EiIwKjawuRbjJ1Jl6B9awD1Ton4jNN29p2VZRcCG3xq4Mgn3gKQKhQlCuRauucLEiTecEeLR78EV22EcPb38kzA7TITY9Jrxx2hvXXE+tQHGXozsQEpW1Pzk5ossGxCnBzHZyZyq4lwOiDJGk1rLDjeXDsAkdkx52nvqpy7qq6GYdFWXt4qSoiMh/qxbXRHqaktCwoFLGtqzvwilQbLhXxFBJlvwn/K5+0FKm08ZaP6KJCWHWrPQ2AK/pgAE575WlMSWLo2nxNZPV5jocAA0DIjWQojpQUMH5pwaKtzLCevLtCVE/YjOJmClBhC0pgW+0JQf13X/0GPjnfFjPeXxUtABC42VdPRaTvUfabnrxirBjeyoFYb3ZW/nJfF1heBxENaqefueztnPmgzQUMnx70l1NnbDmRg7sE4DoRXILK4OsJTPRiTpbtHLMQQ8zhWUctrD0kaPM3uze6ILGnsONFrVjo1my0Z7F13f1crZrDFcAFjAWFQj52T0ccvEedUQAZJOlxWt8KnqV6V2htXfPW/E8jN5S2Q8mOnbt67Kxh4aly5s+uJ0FEhRVNYPEoJbQ+IpAj3s3qXNvMiD7sE8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(53546011)(6506007)(36756003)(6666004)(2616005)(66556008)(26005)(5660300002)(38100700002)(186003)(38350700002)(6512007)(110136005)(2906002)(54906003)(966005)(6486002)(86362001)(66946007)(478600001)(31696002)(316002)(52116002)(66476007)(84970400001)(31686004)(66899015)(41300700001)(83380400001)(4326008)(8936002)(8676002)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0vH46FMfTO1iMSUUzPQHdGgWLOI5CxLPYbTqHQOEGp+aI9HwL2vVk7OGOSEq?=
 =?us-ascii?Q?NNKk0R/gWHrciXCTWuZN4XczOC09W+0WxaNFNrmqDJ0YBlX97u5umy33iqA5?=
 =?us-ascii?Q?l2LNA92Jmvyu2EBXCCUn0/cDuDezySVUDjv/gC40/zfbQCRIcTJH/pSAEpOm?=
 =?us-ascii?Q?JmmR9ccrppRrXuGzCbm9/JDADPWNeWEKz4OMMD+NY8OZA0zJdEnnLSnlZkc5?=
 =?us-ascii?Q?8wOH+nvxLNjwLB+I5ANV/rwYKs7wzDitjPmLsaiui0vl+ZEmKx7YQTOrZLnk?=
 =?us-ascii?Q?lWX3VuuI0/P7K5zSW8l+04j8Tto8owRz4w6d2kGx/izTJtrJgwWvt/ofDVwB?=
 =?us-ascii?Q?lf94my3NvQS97xK7+HSWOc2AKTHzNNLWwdA/OQf+pSraZ9qbJiQ7A2zvCLq9?=
 =?us-ascii?Q?i4iuvFkcsSre6dcbAsETHqqx/lrKxJQTz4Urq//jDhTdeEVqlQM7OXN8tbrA?=
 =?us-ascii?Q?11xyiLP5Okj68A/XOSYzWYx8YrrmuefIsqadjo38If8t8WSNhTf7Hr5ZsGgZ?=
 =?us-ascii?Q?4HJCU0VacSbAxlAOWtqTTWoO+rcy+76wweat0ZmDZzcwxR/xM8np7A2bGhhG?=
 =?us-ascii?Q?FUi5yslnWwLi8uP8GZTsqAJv+ZRtCpYSPmITevbK1KLgGssaGLNZqfMmX88R?=
 =?us-ascii?Q?kGRWsmlibpc1zBH5nArfltXd0bi7hUiZTUpPt6pnKmf6ZIwSuAypYKI5maCm?=
 =?us-ascii?Q?GYmPFL43oXN6Jnr6nQqofNSk0bB5xK4ytNBBH3j4J27rrlZu+AX+Slt96YE6?=
 =?us-ascii?Q?Yj1WEenAosX7ac3umvKW209wgFsKHWTcCGlmAvyTE/qQT6PzyG7p8a01jxd+?=
 =?us-ascii?Q?tRwgw8dojm/xma5Lo9lK8skAVz/hRWkUoPxPCynguwqIxtpe+3D1O6PFEAYX?=
 =?us-ascii?Q?w63xf0/h4gwkZ1eeO39UJnt+YSdMTk3BqjTB1IFzfVRlWxPVBY4Tpow8OPpw?=
 =?us-ascii?Q?ZVX3JnbdjPpG3U6bpoBvsP/YM95YwBI5dQWOfVMoVLJvE+1AV5QHS2/g/AhN?=
 =?us-ascii?Q?aQnyWgJWKIK0ekPo+qERgvzGtsWkbcIOkPUEfsRUrqVjWHEoTa6gWmxkjk2S?=
 =?us-ascii?Q?5s2Sk3gSw6gsXdLAE87FWAHpG7giDFPksVf3z+6Hibj+beMYrnuuQwdL8j+E?=
 =?us-ascii?Q?pgZ0wo9dNseyRtKbIw5yPl3aS3rU2KEY3STFQFQTYAopr2/xF7mtU69r6x+S?=
 =?us-ascii?Q?8mIw86FmHBVytHkScXyzO0sYgre4bJYjDtaUlmeIkNUQcGfmE/aaKVdGXstH?=
 =?us-ascii?Q?1xCH7cj9hMdqS8wQ2Fmr6EMk8znoYRR5Lb2E8JySiplvmxBhord/mgkTmY+I?=
 =?us-ascii?Q?jdonhGxgr/pgYdnjpREm+pGQtm8baF0xovC7Fl54Os4pVQENTKrwkdxEIKkL?=
 =?us-ascii?Q?JsZZSfB4F42pvuCgig1spwZuLEhXqP3NNnqUWibHBvZaj8qca0xVF7phKRLW?=
 =?us-ascii?Q?B+6Bw9ArSoEKzp9GOi2SxBfNKpX8Ne5UpdxbG9WXaYWI/zy8R4zpxUD1FdS7?=
 =?us-ascii?Q?Jb6uwLZv833Nb7bWpRWFm4yTlbOYCG6QQOMLdLBd4ygelNnAMibcuy00KCEt?=
 =?us-ascii?Q?MJ2XEqG2jpgFlDs+HBNHqTXzTYlhGLW5q3sYzzVmdms3RQBU3jRu1u3CnLNc?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fa405c-3fdb-4918-08c2-08daeda41382
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 16:03:38.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGnVDhHho6clkMLfv+/CZVyO1HvDQkndMI3b9RmejbcVEF8RJVyZJNURgt6kOTN0mo4u5wEnZfm6DTYw4W7O9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175360

Martin,

first of all: thank you for testing the patches. As usual the corner=20
cases are the most tricky ones.

tl;dr: I'm working on an updated patch series to address the reported=20
issues.


I've looked into the issues and would like to give some explanation.

1) the first module you mention ('gonum.org/v1/gonum=20
<http://gonum.org/v1/gonum>') does not obey the go documentation for=20
resolving the modules source-code repository (see=20
https://go.dev/ref/mod#go-mod-download , Section 'Version control=20
systems'). The documentation states that there should be a html page,=20
queried by "?go-get=3D1", with a <meta>-tag which contains the original=20
URL to the source-code repository. For 'gonum' there is only a 404-page.=20
This page contains javascript-code that redirects to the actual gonum=20
package page. Unnecessary hard to process. I'll open an issue for that.=20
The second module 'code.cloudfoundry.org/clock=20
<http://code.cloudfoundry.org/clock>' has a broken certificate. I=20
already opend an issue on github for this.

I addressed this issue above by maintaining a list of modules and their=20
actual repo URLs inside the go-recipetool as an absolute fallback. Would=20
do you think about this solution?

2) yes, my bad :)

3) The problem is that some repositories have a prefix in their tags.=20
The tags usually only contain the semantic version string. I'm curretly=20
working on this issue.

Best regards

Lukas

Am 22.12.2022 um 20:08 schrieb Martin Jansa via lists.openembedded.org:
> On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov <uvv.mail@gmail.com>=20
> wrote:
>
>     On 22.12.2022 17:48, Bruce Ashfield wrote:
>     > On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
>     > <richard.purdie@linuxfoundation.org> wrote:
>     >> This patch is not in master and is not a backport therefore not
>     >> eligible for kirkstone/langdale.
>
>     My bad, the intention was to have it in all three branches: master,
>     kirkstone, and langdale.
>
>     > 'nor should it go to master.
>     >
>     > If someone wants to allow go to fetch sources during builds, it
>     needs
>     > to be done in their own layers.
>     >
>     > Bruce
>
>     Probably I misunderstood the outcome of the discussion in my first
>     link.
>     Bruce and Richard, you both suggested to have it in go-mod with the
>     warning. I agree that it breaks reproducibility, and is considered
>     a bad
>     practice in general (I'm aware of a few more build systems with
>     the same
>     shortcoming).
>
>     My point is, until a proper solution is in place, it should be at
>     least
>     documented somewhere that this should be done in own layer/recipe.
>     Any
>     suggestions where this can be documented if not in OE-Core?
>
>
> Have you tried the changes submitted by Lukas/Stefan in:
> https://lists.openembedded.org/g/openembedded-architecture/message/1539
> ?
>
> It's not perfect, I was testing it on=20
> https://github.com/influxdata/telegraf/blob/master/go.mod and I've=20
> found some corner cases where it failed.
>
> But it seems like very good start and we should work with Lukas/Stefan=20
> to get it merged in master. Then all branches could consume recipes=20
> created in master and only the exceptions would need to have network=20
> access (instead of the bbclass enabling it for every go-mod user -=20
> go-vendor inherits go-mod as well).
>
> Lukas/Stefan: is there something we can do to help with v2 of your=20
> patches?
>
> I wanted to submit better review on submitted patches after more=20
> debugging, but here it is:
>
> 1) to resolve 2 deps:
> {'Path': 'gonum.org/v1/gonum <http://gonum.org/v1/gonum>', 'Version':=20
> 'v0.12.0'} due to 404 "ERROR: Error while fetching redirect page: HTTP=20
> Error 404: Not Found"
>
> {'Path': 'code.cloudfoundry.org/clock=20
> <http://code.cloudfoundry.org/clock>', 'Version': 'v1.0.0',=20
> 'Indirect': True} due to this being redirect to github.com=20
> <http://github.com> and failing with "ERROR: Error while fetching=20
> redirect page: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]=20
> certificate verify failed: Hostname mismatch, certificate is not valid=20
> for 'code.cloudfoundry.org <http://code.cloudfoundry.org>'. (_ssl.c:996)>=
"
> parse
>
> 2) some issues with LICENSEs:
> INFO: Please add the following line for=20
> 'docs/LICENSE_OF_DEPENDENCIES.md' to a 'lib/recipetool/licenses.csv'=20
> and replace `Unknown` with the license:
> c4807c5b058a56c02f592207b4e056b1,Unknown
> Traceback (most recent call last):
> =C2=A0 File "/OE/build/oe-core/openembedded-core/scripts/recipetool", lin=
e=20
> 111, in <module>
> =C2=A0 =C2=A0 ret =3D main()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^
> =C2=A0 File "/OE/build/oe-core/openembedded-core/scripts/recipetool", lin=
e=20
> 100, in main
> =C2=A0 =C2=A0 ret =3D args.func(args)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^
> =C2=A0 File=20
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py", line=20
> 746, in create_recipe
> =C2=A0 =C2=A0 handler.process(srctree_use, classes, lines_before, lines_a=
fter,=20
> handled, extravalues)
> =C2=A0 File=20
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",=20
> line 349, in process
> =C2=A0 =C2=A0 self._rewrite_lic_uri(lines_before)
> =C2=A0 File=20
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",=20
> line 380, in _rewrite_lic_uri
> =C2=A0 =C2=A0 updated, newlines =3D bb.utils.edit_metadata(lines_before,=
=20
> ['LIC_FILES_CHKSUM'], varfunc)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0 File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in=20
> edit_metadata
> =C2=A0 =C2=A0 if handle_var_end():
> =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^
> =C2=A0 File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in=20
> handle_var_end
> =C2=A0 =C2=A0 (newvalue, newop, indent, minbreak) =3D varfunc(in_var, ful=
l_value,=20
> op, newlines)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0 File=20
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",=20
> line 372, in varfunc
> =C2=A0 =C2=A0 uri, chksum =3D license.split(';', 1)
> =C2=A0 =C2=A0 ^^^^^^^^^^^
> ValueError: not enough values to unpack (expected 2, got 1)
>
> (the license was just '/')
>
> 3) some SRCREVs set to None leading to parsing failure:
>
> =C2=A0 File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in=20
> _latest_revision
> =C2=A0 =C2=A0 raise bb.fetch2.FetchError("Unable to resolve '%s' in upstr=
eam git=20
> repository in git ls-remote output for %s" % \
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV,=20
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception=20
> FetchError: Fetcher failure: Unable to resolve 'None' in upstream git=20
> repository in git ls-remote output for=20
> github.com/googleapis/google-cloud-go=20
> <http://github.com/googleapis/google-cloud-go>
> The variable dependency chain for the failure is: SRCPV -> PV -> BP ->=20
> FILESPATH
>
> ERROR: Parsing newly created recipe failed, moving recipe to=20
> /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed=
=20
> for reference. If this looks to be caused by the recipe itself, please=20
> report this error.
>
> It takes long time to fetch all telegraf dependencies, so I'll create=20
> some test recipe to more easily debug these 3 issues in isolation.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174971): https://lists.openembedded.org/g/openembedde=
d-core/message/174971
> Mute This Topic: https://lists.openembedded.org/mt/95827446/7344993
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [lu=
kas.funke-oss@weidmueller.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

