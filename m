Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1664FC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:03:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.20])
 by mx.groups.io with SMTP id smtpd.web09.733.1646939031511104699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=rzR+4veh;
 spf=pass (domain: outlook.com, ip: 40.92.66.20,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UumDx6p64yoOWz7ZOOeSZ8tk0A9KUq37DSbNvlDAVWEahKDprdSnczmifXCBI4LEpSzodB2FUnJQGmKakpEMoOGEX8951UW6jM7ly+IqdXxUVW9SbvERNGNG51xNbvufXOSg8cKntmNDY76gDYGGYekVFGBxAOVZ8fUopCOtbfoP6mGXWTs0diA6WfDxeAgzMfsJAW1mWSaYKGNtt3pUDMYnUYpf5LItF9uCkWUl/c369TiMcVoFZdW7d1MpUgKReP/fnnl32ufCG7m2DWBlgMb4NYa+tRtOvI1WG/P/C0KzKO7+EWXOtN4lVjC6Dqn86ra8OYLCb7XSgEryC1J6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fecpwU9iE2o912kcjLCSwoTLZTagHHHcEy5a1a9Xlao=;
 b=SEZfZ4nlH+wWSVj96vR78sWXTojoyjr8irckMF4qRLoLhe0ytWCplxlBbA7kqLRrcLWwHQb2cISuUF9oOGf0HPfr0PSa+5uZI2Vr2rY1TWFJMQINGRDMjo8hfapDAd83aph12VmhdIN3j8Abzyq1rHktsQli7aAz5ZLjh0K7NJBKPDaoxtnwOeZyx130D6696QEOi8i8wEo+J+hCnY/0uOsGTXTBfKEGXiAsmcsjmiQoY8q8k4v/pkTaRPIsTByKtrrYhJHBJdhR4oyCVQpl+MgZoO+WJZHhmGCEqffF5342lVM72ZeCZVsXlQlLNzK4ezpnnm3MAkMwgbdSPQnuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fecpwU9iE2o912kcjLCSwoTLZTagHHHcEy5a1a9Xlao=;
 b=rzR+4vehNVPBTNYWq1VRzL5dHdt4v3HYcxV9TWnM63guMcN2jjsZeryk3ikwXSg1n35Vo5ln3/s1ga/L/hZzzjuK/KHR8/GcNgML65oJF5zqR2077NDEA4XKGYKX1aGZWs7S2FcESK3LABDeD/1no/NBLcnQaeWyGv8ymOah9XMtr/esxLEWUFn7wfotvd83QQ4QisfZgV/2PFnm6u6NgDseaceG/sx2FHF79LWgJNw2o308dagIByYnIurcgVK4Ri/JCn5T+W8RF5h16rTNDx2B8CIv82LuobWTAfFZD7lUHTov72hySDgWFvvL+cCm85CUaScH+Q9Rqp6VhsERQw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by PA4PR09MB4766.eurprd09.prod.outlook.com (2603:10a6:102:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 19:03:48 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 19:03:47 +0000
Message-ID: 
 <AM9PR09MB46420D97FB3AE4F4349E2A4BA80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 10 Mar 2022 20:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
CC: openembedded-core@lists.openembedded.org
References: <20220310171656.3106028-1-ross.burton@arm.com>
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [NwKAFYwtjgVGEAxCdQVRKzy58nMuQLUJvISPT7AKans11l+Xt1sSl9Hsz8AugiTl]
X-ClientProxiedBy: AS8P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::6) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <67f8ce23-1ab5-3115-b17d-1ac3ad38920c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 887671c8-7be9-44ad-66a7-08da02c8b4cf
X-MS-TrafficTypeDiagnostic: PA4PR09MB4766:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WgO+zspY5BJpDkvwodF3yF8Yf7t5pEqBacpqaSOsMDtPXfWKCCL0TWKaI61rV5RmqgOcPkvK6AKqOUR5zgunxe7ARbDRt2F8+myeKfFbUdaPEVMvlOM0DpJs9nL/1nQDZ9vTMh1t8YN4JW6LrWu4uTDm+tZN2k7/ffQNAod72bqkY5v8EmOv7e75aYmXXK4AV7kGl6NPHYgXVWhU2XTZF16Z00gnGTNbXMhzz8Na4VVUNvxDutjVfkRpOMVGwoEvRMwqexC9/jJbRgPJHyqq9e+RzB+JRUoonUBjLEWas5YKqVGZBBaQJzq5gBi8ILqaxk/ICRx+vrlrfqgqu5pwtjv57QFrr7PNYyJIwtNMTyc8kV3M1NYKbsGGkGyVivNVtnjLPLU0cXCfMsn0SUxerHQtcY4OV7hWbFbRKgoFBxdo/aqdqN5XGC/MEWdv4N6OMrFn53VjGwTQgItXmOb4Mt+ID3Oj8Z+FEJW7DVhqSO8zqgRvwGFm0tnB9/00+tyekgQmqpLlGhhITTsAuOLBaHRJLsvrEF+2V2V57E822kdaIl51FtgC7WfPgc5IFavf8V0Sbs5TEc7pKaJ6GMt2G0jayosobfhhViOH0eMC3HERL5RePFdooXFKHW8muvcez+WYeETY2rBKJjLdYCsBB4jC2Ac2KmHjTntCuZLw0XI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uMUxvZkA8yu8BxLxj8l4U6zAhLFv/8OgQvNlRyk1Sm+ItqmnQQvlEU/FF9po?=
 =?us-ascii?Q?luSy60TXVnWejbvJiYb4GWJ1ldPVacXRon2nhFGarB6jT7TqX59rbve5gdx/?=
 =?us-ascii?Q?kpzs9ODukpKMTKH6IgpNq+qA4q5GFq03pZkwhkRqgLh6OwTEN7/++qS7+bJY?=
 =?us-ascii?Q?84iAr5DlFDd+4mMbt/AICsSb7EvgpusXakZPpJnrADuvUkP8xRSUrmMdX/V6?=
 =?us-ascii?Q?ieS3BH/9YsdTQYq282NqFX1eEKI4lnLsH6IAiHJZVxJEvo8UGWlaD4VHVZG/?=
 =?us-ascii?Q?NQHtWh7tjMm1TafniOmAoY1g08ZIO4wiWUjVkpbyV1tSeJ5ERdpzkZgTVL9l?=
 =?us-ascii?Q?hXezguJ7tcLXLIV4KEtuuAdQN2FHCnBkFcS8XHbUZc+b2rArT6s/So/TjUkG?=
 =?us-ascii?Q?wjQin0Hj75h6toRiFB3Wf3o1x1HixbtgAHob/8hm6DHF86PHApciUEQW1BjX?=
 =?us-ascii?Q?S5o1q4CmUOEX32wXkwbposuT+qiOdmIc3OjPBRAAIb18n891t8KkKfJkBaAr?=
 =?us-ascii?Q?4RxdAK5a5mEvt4gNJ+Bt+ZjQrhnO6H8bIE/ZqilX7i8LX6SuEX42OziTK1Dq?=
 =?us-ascii?Q?4+4V2VPnqWoMjkdlEQD3vxaHwpeH/7uzcN9UAH4U/cmdvvRW4MnFtYes3bAt?=
 =?us-ascii?Q?Jq4wSaMNrOovWY+p2uOcIDGGioMVmePaC8xctu0hKIDfy8+p5z+N2B/daTTj?=
 =?us-ascii?Q?OnaH0NE3sNqg6CwzSSxl3r0FMHLAWGtwKZboReFHGliUM5P+AfI3F1GEEmoJ?=
 =?us-ascii?Q?mfbH2RUzsCYm8dmVxzCIkqV73H7N9s27/2Ur8bLW56IZw/TYlvW+nnPnNylh?=
 =?us-ascii?Q?mXIIiWC3NGKA6iyoFJXaWQOLKKJaDKnq9KW4KY4lb005MyC6Oj+DxEmdyb5E?=
 =?us-ascii?Q?aXLdBQ36O0w4FEks8AoYJWzrwF7QJh2i1H4XoJP7tojiuBOZpIwqyr1hHJSR?=
 =?us-ascii?Q?su8/eGPngBAMquRQLymUZHT9o6q5N9dX7am++lQngA0+FOwjOA2gZhSi8CDf?=
 =?us-ascii?Q?rZcFSsJmW9zNNJZ3aBCE5OuuQgxaDJ12k5nLMEFfLeks8wrrqBFIXFHqUQjF?=
 =?us-ascii?Q?touVKNXq4DDPVhh2/t1Wxn5K80M1oaxPtFjmDcVP7qBcrZlhXJk7HAteEYwH?=
 =?us-ascii?Q?OtDuXDdQbAtgsSkl1Wc4t5n3T9oRt0S711RYFCxG2HdH8OgUMtan/UFUaJeP?=
 =?us-ascii?Q?zNcW+t9yooeij5mbm21hd/ws+zKe0+0wkOhEug=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 887671c8-7be9-44ad-66a7-08da02c8b4cf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 19:03:47.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 19:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163038



On 10.03.22 19:25, Ross Burton wrote:
>=20
> On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     Sorry to say that - but to me (even though it's more work) pip seems =
to
>     be the better option - the proposed tool is ~8 months old and not par=
t
>     of pypa community as it seems - so in comparison to pip this could no=
t
>     be labeled "battle proven".
>=20
>=20
> It=E2=80=99s not that unheard of, for example the flit_core bootstrap=20
> documentation says to use it:
>=20
> https://flit.readthedocs.io/en/latest/bootstrap.html=20
> <https://flit.readthedocs.io/en/latest/bootstrap.html>
>=20
> It also does one job and just one job, which is A Very Good Thing.

Still doesn't make it the best choice TBH.
Just diving into the code makes me wonder about a lot, like

- can this tool run on non arm/aarch64/x86/x86-64 hosts=20
(https://github.com/pradyunsg/installer/blob/fad2894a572d5497a3dceec58407c2=
76f21e8c11/src/installer/utils.py#L140)=20
- in its full feature set? - the assumptions made by this function,=20
makes me think, it doesn't
- support of this here https://github.com/pradyunsg/installer/issues/98,=20
should be given by a matured tool

>=20
>     Especially as the second patch of the series removes the possibility =
to
>     use the tooling proposed by python upstream for installing stuff.
>=20
>=20
> Do you mean Pip here? That=E2=80=99s one option.=C2=A0 Installing a wheel=
 is a=20
> glorified unzip, pip brings a lot of baggage that we don=E2=80=99t care a=
bout.
>=20
> I should make it clear that this class is not for installing arbitrary=20
> wheels, it installs a wheel we just built and in the future will build=20
> the wheel too.

Then that's definitely missing in the commit message, that this should=20
be an option and not the default

>=20
>     If one would want to have that kind of tooling the switch from pure
>     setup.py to toml and friends could have been done already a year ago
>     (python-build was the originally proposed tool iirc) - so this feels =
to
>     me like a step in the wrong direction (esp. the part that this would
>     rely on a tool **not** supported by upstream)
>=20
>=20
> Adding support for build is next on the list.
>=20
> Ross
>=20

Anyway, I think in before this patch series the switch to wheels was=20
good enough to work with it, now it's just introducing another tool -=20
that doesn't feel right to me, but I will stop arguing about that

