Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE023C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 17:46:16 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.42])
 by mx.groups.io with SMTP id smtpd.web12.324.1642095974500238908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=VbE6HvDZ;
 spf=pass (domain: outlook.com, ip: 40.92.69.42,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwuuyXrTeLWvTiwupw61fT1kBbnflVw7S3v9RBiJZkS0xH8PwErawbhZqOb400g5Q8TCY3CsDNs+Uhc1A3gnxdKjVRgZ7FCG0XWm8Ds9+jAAjQ1r170VYs6CVvu3VNn4w8RybcpfGRFKjZakp55K+0sTTKmhinQMBbzd4X1AcyHiLlm7Rrv/PaZLzLdVg8wWw+sH+aObc+M/SKfdTALRMowHjDZvL+jelKQkSnSVjMyJBm//33R3Z+/tkkL99OHov/VGWc+I0Qr0zM6HB+qhnBciz4/pu7CovJAJJsmF+ONtIBb1mftS/ujP1SfsIkXgQgS5BmiY7ZZFbpWP+TBQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qucJ4ftlxtTQpTjvrXAUQQ4xmJuJ84vKCf2uy01SDm8=;
 b=PPvt/zqBKBq9mEcZm5zWOcw6lmZlA6Tx8t4iPEfQRZUg/URbhFKt7PdquSc6F2tbY6FyAU4rrvobkzFOe/9tLZLKlwrWjN9Luc4nFnlYcLYwraE8ViREQ1w6Kpet2sX45X0qOgemhqgHMKScolX+wxGuPjiWOqWJobdhZW25C9ccUv51Rmjo8h54OguzihfQ5SArvKXTHoJj3w7jiQ0zNKP8JU6xsNrD+k+ofaETslHXQPGhUvp0gnoT8LHwG3dtp3fc11TlOqZylaQSzpccuun4MmplnJmH+cgImtQ/wEV/UjnSCGV1twKN5CzUoERupvkKOKFvE5NDx/bw+BvgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qucJ4ftlxtTQpTjvrXAUQQ4xmJuJ84vKCf2uy01SDm8=;
 b=VbE6HvDZ3Jk/Fol0XyERkYOx51Qlk60CVQUm9ShTbaYyAudzXPSs1AZV71xvkfSkdgQbUJVlZqwBiONTrFanzOA3FWJ+UJFTVpQ+NU8Fc5Tftn/ZBvfv07ogaStzu7PNmEewkFYVhaI7EUgfpYwF97hxNYy57acNrmoA/STRTn10NKJW7MRc7SsnjCRUWebPThY/qC9n4rCZ56H/x4lR676BrRwReSNX/RExKmGANu8rhs5vfiH3tHw9PxxB8TbD7U80vO52oLR0eONT/udgqVDUs8yYEBqtEntSI4KfZNJOKVTRkxyngtk428crJNfO0aqtiwjBPRxtLRTNW+RpOQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DBBPR09MB3046.eurprd09.prod.outlook.com (2603:10a6:10:f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 17:46:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:46:10 +0000
Subject: Re: [OE-core] [PATCH] valgrind: Enable network for ptest builds
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20220113173555.1925441-1-raj.khem@gmail.com>
 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642C9029183D8A03387674BA8539@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 13 Jan 2022 18:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [nB9SC9j4/rTKVbh10KBofuxvSA3DcqZgJfRt9j4CAlAiFcB5Qy2nAv1x5HclSpTb]
X-ClientProxiedBy: PR3P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <159250c8-a977-d4c6-856d-9858183eda1d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73446089-b614-456a-07cd-08d9d6bc95bb
X-MS-TrafficTypeDiagnostic: DBBPR09MB3046:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RWZGZvCEqlMMdZL9Kj2nHIr0rAESJZSi5zCP957H3fIg6mjsQpcu93nGXIuVbzTeriy5Pc28SMSbAkTvysmB8COTSPf5llFnoWAzeVnHEqD5yXFGUVdtbHA0XE7C4bXn81M4rctr/tKRb/pWXe/LA7Qn6c/cL3RtGADfU/c/sqWeTo5F7Npgbp5p13dfz+7WoOfSxw/71D/PQYyprxrAkOJi7QONVnj2iDQV+HcxMVmol1Roqe6Sz9gOltLprBQ6Dn94hGld80kPZ57BembV2d4RUwWavfKLVf+Ex6ZZ/ebxRMbdc+iXSM3bL41rlmOBGwr7WPJVsHLI1tX2JBDyCotITZlTQoSYaQJgneMkaP7RHQ5euVVr7RD2KNYGDJO3AiPCzcuxLo2dNQikrXddsDvdAdK+6mcRIdBCuI7IeAnwgJ0R6/laTMlLwFyQIQTE5Z8ugR6j2o7aPYElXqIA/T5Uv+/NW1yEc5iXZQ+mgn6VwnOS7ttFQq8XWeWgjTFu7S3cwm38JfPxO1s8yycHiuEyNuWmzqgUexjBx11I6Vlzn4daK66ZejuWYwzD77bxgx+R9PFeYkgyt4gaOSRBMO9cvKTiwoXfCkl0altVJ4RKHN/m20/KtafzrWjRQtF5uf8apO32URS2vwREOdbq8aEv/HawY9B2n5LBbohhb8I=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m98uNGVvqXRrs8YRrcDpbPQMFLFvM2C3zdWaUGvOmtqoaU1WQLnCgaYmeblB?=
 =?us-ascii?Q?GpyN24yxpWAzgIeHKswg6OG06aZ2RasMWYtedfu29LM9m5yY0J1mEAlv3Sjw?=
 =?us-ascii?Q?Pd/7n0M+ccSqCI4iPFt2hGgDg29TeSQThmGdg2vVBnxpiuKlIUdaYfijNDLx?=
 =?us-ascii?Q?7K2UEHsMc5zeRdH7CP7RautEwgyvHkgC8l6iKS5DCPTlKkDgjfZPiZfYAhFW?=
 =?us-ascii?Q?bQoR77ucu80n8PSxr51CY/XMF9FXV1ZotK1J8xSzHn6l2Ad3ITUAKOIYtdsB?=
 =?us-ascii?Q?sxZ6Mo+QSz+hkH6bqnuYMYvqwGStTtQrxTR/QaMxIE1sKg9MHgx8EmEvAO98?=
 =?us-ascii?Q?y3kEQT5k42kQ6OqCMPI80ErCp3QFWfeq3xsPtmuD0Mk/Qk85iAHnmhNlVwHg?=
 =?us-ascii?Q?mxxOjD17E9VksHtVy5XOW04GoNAhRqH8CTvQi+NH0+zahGs7wswnUCJVPCuh?=
 =?us-ascii?Q?F3WVj61Fq4xePv2UPLT7nYDv7qJCkhX1+15d6iR3PWQk/FQY0wZ6S5zahGGT?=
 =?us-ascii?Q?EDl7x33PnIGAhRM2BQnoaZuLMLK/EnhVCvnkt6kUa+gf+N9+sifXgOCzvZm3?=
 =?us-ascii?Q?K3WST+FXlX3K69dPZeedODtML8ipxz9UQ9G5bleD/M4t5wenz1rIRWY0ESer?=
 =?us-ascii?Q?s8bcUeQjtxSkd0Ii7aU8LBT0rpUDXqLLQsJn7PjHxGCsY1JDY0FnoHX+bGrV?=
 =?us-ascii?Q?SKyC2HkHn7U7n261/UmHQj0pq2aOrlxbpiqubVShsUqoS5CW05VOz2R8Q5mo?=
 =?us-ascii?Q?VHXfJKdeKNEPkke9jRU06PE1Oq2+k6E1fpXwMsZYLYV64MQDO6Kffv7zwp43?=
 =?us-ascii?Q?7rJWRkjKGFhVPpcl99ehWiq7LwSu2zsQGP+i/+JP7M3LbF2WpAziH+79X3Pk?=
 =?us-ascii?Q?ZbugQJwLFjlLET4Xb7Cg3cyhCe4+6LCOE10iPuzRZUNnI8eW62Kl75b4v0kw?=
 =?us-ascii?Q?pscr8u9jexcUZ5QKQzrEMEx/hWK2TAfaPyaTFe5rfC8JufElveRdl3FCwxU4?=
 =?us-ascii?Q?sOVicRj5G3QOmJi18iL+hTgysA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 73446089-b614-456a-07cd-08d9d6bc95bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 17:46:10.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR09MB3046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 17:46:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160528

My understanding is to add

--nonet

to XMLLINT_FLAGS =3D --noblanks --noout --xinclude --postvalid --noent

in docs/Makefile.in

and we should be good - haven't tried it yet but it should do the trick

On 13.01.22 18:39, Alexander Kanavin wrote:
> Why wasn't this exposed by AB testing? And can there be a better=20
> solution (e.g. skip the validation step), since this would still break=20
> on hosts without internet.
>=20
> Alex
>=20
> On Thu, 13 Jan 2022 at 18:36, Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     do_compile_ptest_base uses xmllint which accesses internet for
>     validating DTD
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.co=
m>>
>     ---
>      =C2=A0meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
>     <http://valgrind_3.18.1.bb> | 5 +++++
>      =C2=A01 file changed, 5 insertions(+)
>=20
>     diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
>     <http://valgrind_3.18.1.bb>
>     b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
>     <http://valgrind_3.18.1.bb>
>     index 7837034f92e..5ebcae467fa 100644
>     --- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
>     <http://valgrind_3.18.1.bb>
>     +++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
>     <http://valgrind_3.18.1.bb>
>     @@ -98,6 +98,11 @@ CACHED_CONFIGUREVARS +=3D
>     "ac_cv_path_PERL=3D'/usr/bin/env perl'"
>      =C2=A0# which fixes build path issue in DWARF.
>      =C2=A0SELECTED_OPTIMIZATION =3D "${DEBUG_FLAGS}"
>=20
>     +# This is needed because xmllint needs access to network to
>     +# validate DTD 4.3 onwards it uses --dtdvalid
>     http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd
>     <http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd>
>     +# to xmllint, allow it to access internet
>     +do_compile_ptest_base[network] =3D "1"
>     +
>      =C2=A0do_configure:prepend () {
>      =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/config.h
>      =C2=A0 =C2=A0 =C2=A0sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/pt=
est:g'
>     ${S}/none/tests/Makefile.am
>     --=20
>     2.34.1
>=20
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160527): https://lists.openembedded.org/g/openembedde=
d-core/message/160527
> Mute This Topic: https://lists.openembedded.org/mt/88401996/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

