Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513CACCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 17:23:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.129])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23128.1762881774477300935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 09:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=WvH6JnLr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.129, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ29nTyIux6plPE4HUzOiUBb/AGMS6ctndjo8LN1BNomVwwHQ6jl96yGn/C/vMK/EkTtSJxC0GMz9eFksQx3xQB3UNFcbjh78t8I/El85Wv+I11hTeYZPBw3t5vCh0FAkfsK4sPXkrgitbEuaMUABkdMHUERnqfN39RJGgwLBt/s6YYh3pFD9ro/G/u+cgXHDyxhhJt+AihmvuUV+GHYthhl9EoZPxLniccpej6o67MQWy3MKWKY9IX862Xv1rkEc0TpQqtfOcR3FRnuJzVonvBqrEF1jfcIsqbtqGkH1Ym+4KRY1by0jzjeAql5O8JY8fZCIHNYtoR7puk6kYTJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjIgEIPH6+Evjm+gRqnrjfDxEFmEz1gCP5+mlK+gMgQ=;
 b=mIu4kAbReqVfn8Pxte18g+zB5VtVeYmBj8pmA4/iSubRAQzq9Cq7J/PWf2RVlOQRgPgfl4p0Z47yHbHVONIaKyWRN+8mPTyPnxbTbP82Z/tbG1JLTI19TkCaSVFvhMON1ze/Y4dlIEr2rgZxgyAYy5BT7JuhfOrp7WyIXel8VKW2WwukivZzF/tZjSECydrydXpPKil/QagX/vtzwW6qFOBc4MgWUcpKuRgjT0Eq08QnISRIcVvLbQWusM0XxaavKirXX/W3212hHK4v8inOWnu83g/XKzNadGVkMuYvFMvvPfhJHxs9kORw1n8+yqhT3zNwlo5uVHdLIRPsOyLA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjIgEIPH6+Evjm+gRqnrjfDxEFmEz1gCP5+mlK+gMgQ=;
 b=WvH6JnLrn8/9btSKCmMzA12FjJUnsMOJE2AKxq4sRjHH+rDD/LwQQuBW8/AYzQVSsxXg9M46qqi2Y6TLy212v2+brrSvTGho543ivjDMzKQJvJeYWSzTKcuuCcXBiZn8qW029rNRm2mzHLBQwqVYKbOoKcXqWEWLraoQJKw8xtsgdgyM2EXISYriS5ygj18CAvcXh4+eFKRI/bcEOXzw9jT3B3r3xozmKf23ghKPYmwl8rqKRaBfkAKafTagtt4tIQJ8nZwjHd3HHeuUdbHZAxY4QkgAcEy84y3m7YSeU62jMe5pcCMvqWC9JSQKqBn8Ac7T3hRznCZLy0Bozn9+ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by PA4PR06MB7312.eurprd06.prod.outlook.com (2603:10a6:102:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:22:50 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:22:50 +0000
Message-ID: <870b459d-b277-4509-8f36-49fddb0f7488@vaisala.com>
Date: Tue, 11 Nov 2025 19:22:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
To: Marta Rybczynska <rybczynska@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 peter.marko@siemens.com, mhalstead@linuxfoundation.org
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com>
 <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF00014AEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::318) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|PA4PR06MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: afad5b5c-d288-41ab-4e41-08de2146f096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?knoa6SizpVpuahQBpWM979XLPzyQP6H+9wlBrcQaOzfGVYRG9fEcOe5/K8lw?=
 =?us-ascii?Q?UQ1C9hhJVA0EB0t20dmNoxIZnMh1A9luSyLi1pjBz9kRkeAp9omPvHqyGgsv?=
 =?us-ascii?Q?LcBBGJ8B5JXTPoS+7/Gtyn+Mdbb0JA4X9+P/6d6Ny9pPEdO9jfGGfbqOtLzL?=
 =?us-ascii?Q?YVWuR3B3N4IZq+WUYiOESL1Yf+nF4y1uL79Vbo1oy6k1yzQbKMwCajUKsb9d?=
 =?us-ascii?Q?WK0KS/ol+n79Oz2gDZCOqOvEbLKbtw3zB5REDeEUr+TbGmPAUkVeh6tkV0mf?=
 =?us-ascii?Q?o91JJxh5nGlCwaM3OQVHSe5w5KYkMIq4/TrKulZRMC9v6TEf7inBXS5D5qCI?=
 =?us-ascii?Q?uyFr9kQY95e3BjhrVwrdcK0raGyQyyaVGC8QKy+htOUZRHVgrs6ON7gW/8vi?=
 =?us-ascii?Q?+9+19+AoOOMQ3scY0z4otYR3d5KeBBozGG+B94+hxIo52xj7pvC8cJWX5/qD?=
 =?us-ascii?Q?kAzyXQOLI5Drm6zpDRmU8+FC1KWw6dXL9/ukqDsTsqGMno00EHCTgr1Dver4?=
 =?us-ascii?Q?3G6vxnz5yc1NLnwZxf+xmKe0mvC8KFlOuKmVZriRtqmIDOQk4MpZkMaCB73+?=
 =?us-ascii?Q?4SzdTuxdrfAMvMF0Z1FfuV5g55iPNYVsMF1xdehuwZa7MZxFdmYofJGyUdGX?=
 =?us-ascii?Q?TRapJdZ/UGMAxotAQ8VP5ML7fB2B9/65twyf2XXBtcYZ2yYs7kjCUdw9C5Gi?=
 =?us-ascii?Q?RXIovRtTaCKe+5LDy2I78QJDZVNippkv/8LVGkpfNmi17yLN+x+B6CsQs5pt?=
 =?us-ascii?Q?7MHidZ6spGM/mEPfLpISMur8vu9kcV7tOReO0eTvEDnC2VwV9e/7p/N4JTSj?=
 =?us-ascii?Q?doYdrr9PK80RbRG3P6gfJhF8mNYwUi1cFARUxvcOOVafB46kml09LjX1PlY2?=
 =?us-ascii?Q?afbZcmuFv2U/Obphl8xzOyMfNNDat0Qq+TkbMY6K2DGQ4W3ToZS3bgZ8ZxKU?=
 =?us-ascii?Q?IjHKFnq2oahyIqCiHgRc4wNn/a3Dd8FXXUGwYPgU/Y45u0IzMt0miZJczJ0o?=
 =?us-ascii?Q?PS96oTJp078MxL7Nk1Otbu3UBeaGfsZD+sITbH/PKY4g3QHL96SaXYIAof+1?=
 =?us-ascii?Q?DX8zhFFz4vd0km1rwXYmnQI9I5tuv9SMf1/k3eRt4VRoKR8wSzqLMnj/NKMY?=
 =?us-ascii?Q?g5NZTh9zz/0ZXeZmfn9Wz8Jr4Ho85hBA94cu7hY4UZ+N1YMZFXvEkB49ysUF?=
 =?us-ascii?Q?cPkmd4Jj+Kx56sjxhJhjwWm7GkYEPXRrt4lCas0B7y4ehuRShk+rSlxQZf8Z?=
 =?us-ascii?Q?O64K3Z0pbvdCoj8SVDTTQ+JayxNUFGDkOwOJpVA0Ocmuu7CtBRdrtJlzj/X3?=
 =?us-ascii?Q?8HpwNHF7w5JNYNib48j040bgI2oy66hM4ASIZ+NUKGeTWxHw4h5sXcPkC+if?=
 =?us-ascii?Q?6zawJD1js/6w282OSbpVQZzDTs+va+Tu2x4ST0zF789aFPU3rQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2KNkCn9Nijj3PT064/1IA5PGS3+1CBKznHO4UCEbkNnrBQmEGGAHs+SuItRt?=
 =?us-ascii?Q?TqZ9eiTGr34lG6NOXv4HYuPRA5C1BZjWIW/IPP+DEc1qkhjCSbkqMgmVyNGY?=
 =?us-ascii?Q?Mx0Ir1m0E04OIZfHWE2gZGdPEIW8lUqrb2kFPsoseLp4TJ19N0ZDj72GMHZj?=
 =?us-ascii?Q?1+K8KCdoHqkWxUNZhIhNhWnspWp/5pPir6e0Xdm89WLa/5lhf+rFKi0K6q8Z?=
 =?us-ascii?Q?SoAmaLPvNR4KGXidrkZ9ddsWDnTUdTPpzMDOMJ8wCnv8VMwLJtPw53RinPG6?=
 =?us-ascii?Q?GU8MDvwYswq1QHXlSfdMt2W/v0Txuj8ZUz5/oDRSeURAanh6ECixKrzaI4mr?=
 =?us-ascii?Q?j67780icPbeQQSJLZQdxayxYWXNq2J2N/lyZmfpnu81ss0yP/G34hgF/ySws?=
 =?us-ascii?Q?HOJqOu8lPmzZwMtRs1Sccho/b9+IDH/mftHbeBwHvoA5W8Xim91xSMqqqOdN?=
 =?us-ascii?Q?GVjhDMYDO7gzFwHRW4uH1OS4I8/vX7/uZKhez3Q5jjEGI+nxB2FUKe2CWKkA?=
 =?us-ascii?Q?tDWBsO9hMjLX/i+3zlsq5tCmYXOEnkB12/XZ34gMek5oPl2Nu5ezjFfojwTr?=
 =?us-ascii?Q?xOovPR3pNZwKaoV2y3av92zNkxU32GV/ADt6DrSzMaNAC32PukUgBAH2obtU?=
 =?us-ascii?Q?BpmLUl7Xdk0OyPLaeN2vrGGPil/X3QrMKE6fkoAUNJv6ea9PbiUB8vf14lUt?=
 =?us-ascii?Q?IGbTvI3T0Lhv81TIxchgCxNCI7LFB381Lf9fcaIcrYbd4Rr1vGQL7lSOjPpX?=
 =?us-ascii?Q?9GRpTthAdkC05NuA33uSC78+xbHv07w54xKlbkNSHOJrLgjT6sjHTcqyGu5j?=
 =?us-ascii?Q?9ODKT62EGdR5u0lMqzDTdhM6AwM0/+2RqaHwqjFNJsrZxM+hk5Kz7S0ER/eU?=
 =?us-ascii?Q?xvAkNmTmD0OrdCzB4EZC73Tdv7ZV800wv5C8Boem8SaNSFNhV07R5PiELAYi?=
 =?us-ascii?Q?HdnyCR9dPX8FdiyIHTuKGFd3IgDwRVVsXMBYCeSXCCDH4sPMrzO1feR8IHoV?=
 =?us-ascii?Q?LIru/ukri6Wv9jOXJY5guJ5MCYO7P2xpfZr0qw1CBHAOuH9hU3FBTQl2hXBZ?=
 =?us-ascii?Q?4beNNNOXACMZI/TGGowuOgNS+v7THjYVHnPHhhKd9mvtJDiZtqTV79wJ2RhT?=
 =?us-ascii?Q?QDwFbJyY5U35djnNWw+3/ZVfSpoBIKhlriVg/Pn9NF1v6oeo0Y3MNuO2WNvm?=
 =?us-ascii?Q?Slp5LQFTvyuTCttPlWKfcYOejqMj0+pnrrCpapL9Iu+2BENF3UD+y4gMqWZn?=
 =?us-ascii?Q?ZyLl21BAVzd7RG95Rn1Kj8VCrQLDnCPvg9km3tMxcwiZr+m/+cO4BosTA7VC?=
 =?us-ascii?Q?wCFZwc1UmzQTfr1EfKyRGq9KwqDWzYzSfqVrRmONz6F36cJGEibqqeJpxJ7b?=
 =?us-ascii?Q?NnyAgGT0nqQUUZpG/yymNXotm1ZrANX+j8ELox4IJk97ecBImVICoBjU9pZM?=
 =?us-ascii?Q?jEZMAITf4H+I4xYev+rFLKYQUb2q11TMeub8f1NOW2oE234fDi9OXT2lG3/v?=
 =?us-ascii?Q?of1CHucLV5WdXqJl38mwhJiZMyFYOUM1nQqfHEQb4JifZD73zyRFhxVVkBKr?=
 =?us-ascii?Q?Fn5wuuYckIX8Bdn111/xEuZ84cjyJgveppdTTaWDFIqkF09LamCWUx33GG4+?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afad5b5c-d288-41ab-4e41-08de2146f096
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:22:50.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfl2I4syOxmXpWhL/bLahkXnO6P0bC3DJotEUg0BnprwLDWccCzBo32nEpq/gRlTCZCTlVBgFv4Rx9yTqQ35oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7312
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 17:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226186

On 11/10/25 16:59, Marta Rybczynska wrote:
>=20
>=20
> On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org <mailto:richard.purdie@linuxfoundation.org>> wrote:
>=20
>     On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via lists.openembedded.=
org <http://lists.openembedded.org/> wrote:
>      > This should help to avoid problems that will occur if the modifica=
tion
>      > time of database file itself is altered e.g. by unassociated
>      > process(es) on the file system which hosts the database file.
>      >
>      > Since this change updates the database structure by adding a new t=
able,
>      > bump the 'minor' version number in database file names to enforce =
full
>      > database fetch. This should also iron out e.g. situation where the
>      > database might have inconspicuously omitted entries due to way in =
which
>      > the mtime of database file itself was relied upon.
>      >
>      > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com <mailto:niko.mau=
no@vaisala.com>>
>      > ---
>      > =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>      > =C2=A0.../recipes-core/meta/cve-update-db-native.bb <http://cve-up=
date-db-native.bb/> |=C2=A0 3 +
>      > =C2=A0meta/recipes-core/meta/cve-update-native.inc=C2=A0 | 59 ++++=
++++++++-------
>      > =C2=A0.../meta/cve-update-nvd2-native.bb <http://cve-update-nvd2-n=
ative.bb/>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +
>      > =C2=A04 files changed, 46 insertions(+), 21 deletions(-)
>=20
>     I am a bit worried about this since it takes what is a simple mtime
>     comparison and means that to check the database you now have to lock
>     and open it which is comparatively expensive.

Hello Richard,

To me it seemed that the overhead of the additional database access which i=
s performed once or twice during BitBake execution lifecycle is really negl=
ible, and in relative terms, very cheap compared to producing false negativ=
e CVE checks.

This change also hopes to close a window of opportunity by sampling the dat=
abase mtime timestamp value before the fetch operation is performed, in con=
trast to former when the file mtime is (supposedly) updated only after the =
fetch has been performed and the database write completed.

>     What kind of "unassociated processes" are updating the mtime?

Seems this question was kindly filled in by Peter and Michael on AB behalf =
-- for my own behalf, please see the response below in Marta's "seconding" =
question.

>=20
> I second Richard here. If we would really want to keep the date somewhere=
 else than the file
> timestamp, we could create a simple file that stores it, what is way simp=
ler and doesn't require
> to open the database just to see if you want to update it.

Hello Marta,

I fail to see what is the real benefit in using a separate file for the pur=
pose, and somehow I doubt the operations involved would be that much simple=
r, or provide any significant edge performance wise. With this change we ju=
st move away from using file mtime and still keep the timestamp along in th=
e one and same database file.

> I second Richard's question: in what kind of a situation have you seen an=
 issue?

Personally I was bitten by the file mtime dependency about an year ago when=
 there were serious issues with downloading the database updates from the N=
VD website. I tried to mitigate the problem by using a centralized job for =
downloading the database (with very lenient settings so it wouldn't time ou=
t or so) and then distributed the database file to several build servers. B=
ut with this approach the mtime value was always recently updated before th=
e database update attempt, and it took a while for me to realize the mtime =
check prevented the database update from occurring. I don't recall what was=
 the cause of the file mtime getting updated at that time, the database fil=
e was compressed+decompressed as part of the flow and resided behind NFS mo=
unt.

Later I also noticed that others seemed to have encountered issues which co=
uld also be related to use of "external" file mtime provided timestamp
  - https://lists.openembedded.org/g/openembedded-core/topic/110179038#msg2=
08869
  - https://git.yoctoproject.org/poky/commit/?id=3D9d2dcd798322748cfdead0db=
320a5242e4b2cf31

These made me wonder if there could be some less flaky alternative to the f=
ile mtime reliance, which seemed under some circumstances to lead to incons=
picuous issues in form of false negative CVE checks due to omitted CVEs in =
the database.

> Kind regards,
> Marta

Finally, considering Marta's advise in her other reply in this thread, quot=
ing her comment here:

> So for people who want to use the NVD data directly from the source still=
, I think it makes sense to implement the download
> of the JSON 2.0 feeds (should be closer to the nvd-native than nvd2-nativ=
e, and *faster*) and then decommission both nvd1
> and the current nvd2 (API based).

If it helps I can e.g. rework the series such that only the changes in the =
topmost "keep mtime in database itself" commit would be applied in the two =
recipes independently, which would still help to avoid the current mtime ch=
eck from occasionally biting unsuspecting users.

-Niko


