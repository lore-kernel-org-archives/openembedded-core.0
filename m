Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8982C46467
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.77])
 by mx.groups.io with SMTP id smtpd.web08.991.1649869129412674721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=SezXJSQ8;
 spf=pass (domain: outlook.com, ip: 40.92.67.77,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4K03VAWp9pyPbSJ9yNtnAYT5ChXnsj45sktel9Ilwwa9Widym9+QMLCV3Rud7b8c/PuoTibUT9VaPnYSphz/2TfMjnLJ9LCQ9N08VTuyOUABI491MgZXUI3lV25P+VdXMydfNr4RSsHiQQzoaVIbzO4Oz2dQZykT9lZeDvzbSrBQC9bIjqt+kpY4Uts2RyM0hqI8diDM3oI5Tzn0gJhfC0gvIA2lf6vRPCXhqkox3+3ZDUDCCfmVxDajjJBwosSutnKasjjwIn7LimFbXBo7dZADQ6Yr5k7L510+BqSe+iF2Qo0NCMzeZq0FhM4aec4m/ou8EKDzYr4FqiOQkgoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQTdoJ+uf4SmBC4u9/a2sAo5FrqO2FvHTn/2NC0qj5Q=;
 b=i7W2qT/ZlD7eUJWErog4kNYuEfXJPg4jbOwluXW1QNazrXrWyRBV7h4YLkwizfWJg5cpu2JcOxyVOukMIo2gWubyy+s84ZxcH4dCZavyO8hINkwgKdhwnOr9hEv+kkph+NiJ0okYO3/Cvn1YxPK5nqu8wDJX8Jm8N+yISyn+JOVlH8AMfnTKkz7cwAXVBZA0AYWEHCKR92vWZcW4u2S0W+fbFCC6jlWC/TsrRQo6un+orjMb8bTXIXd67j0TV3B8IKWbrAMvCe8xKdNZ+PR5BhsaKXQfTYWeIurOQ6MxZGxyxMpOuq2WYmtsHYOXvEo8vKP+uDcKHktWhe1Km9Ul/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQTdoJ+uf4SmBC4u9/a2sAo5FrqO2FvHTn/2NC0qj5Q=;
 b=SezXJSQ8F0V19PJMqXDwVAKmLsEuJP0AedZv2DmW5/b8Rr1oYU/No1tHxntoaZju2ANS5MmQV4jhRH8CWV2txm83sLxexGnpIygtLfJHzvl4PzDbUQZo7+ehSjcixq4eYBF0qj921gORdMGgVVFGYn4+iy/1lUgP0wjsyJKDmRnRk+eMDzlX+o2yEnDuOv3VEtM0SQ15vIt/+ofW8dVMsC22povRJ9Zi1wyuWyTm7EbAExZYp31psLgvYcsaj6uovU6Nhtvp5H+chrQwNOqK/6EXh/mM7UOmqYtbbxfTVziOwXmS8yqKidjZNrANd+WqedjBKq/1NHuyvKDevpS9yg==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by PR2PR09MB3178.eurprd09.prod.outlook.com (2603:10a6:101:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 16:58:46 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 16:58:46 +0000
Message-ID: 
 <HE1PR0902MB18014C89FEB8DA61741A1CC8A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
Date: Wed, 13 Apr 2022 18:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] git: correct license
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: 
 <HE1PR0902MB1801D263944083BC60D94282A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
 <CANPvuRkSufucyWjP7a4dmUmxaFMuq2KNoX3uFnzjxeax3Pm5ww@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CANPvuRkSufucyWjP7a4dmUmxaFMuq2KNoX3uFnzjxeax3Pm5ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [xRiNIspD0g2flgX5Ij00nPi9NO08c5e4N3z5zzeIr8u2JtSvBhd6u7HYnsKrJ/YP]
X-ClientProxiedBy: AS9PR06CA0729.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::24) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <3c75ae2b-531f-5bdc-0872-6427c7be8714@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ca01784-4128-4042-0d37-08da1d6edf80
X-MS-TrafficTypeDiagnostic: PR2PR09MB3178:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NGpbbonJPb5WOJ0FFYTFpkwlj2N5WErvAu44eD0G8ZSU54HqI/aHeEA3Ondr+FB/v1RuYCb/+lapGlVHTYV8al2KjS7c9GIrBcyi553X+h/QLpzUQklB6DJC0mH8CQ7u/RLzg9sJarFyieu9pA+Z4+NzWAQy03alV2W9Qat2V86MUQbb5B+yRHMY1pU7nNZwIKKGdZopgt9MSBWTvugDu32b6+O1z0dBZF5WdGPuASMIONERQy4n87HV6lLVVuNFdUf0F3aolUGCGn24Hz++kEWjp8NPnWQjMaBYD6SWcElM41AdhSYmh78LCjWXkrogp4osenaYdUuktOSEmGDP/UlUkweB9ol1i2XKM+Bq+cnVA3cJLUsK/va9pCyn7e9AbhkQP0RJ4rJ9zh6HmFO4wfmTtGITph6JII6eReLmGv10yJwrlX1gkWZURmiFGFmm69rMptH1HdrDiSp/lYyMPgRHctF+vNke5xoHUS2D11DC2GK+ooeWflRtkkPTmY/jqLRkZs4KsOcWdBtaAkq+0b8wigsffBxGwn6eaXittSoFiIGWBy2u/YVxjGgSZd9rC1nb/6fbOlMU5B1QseDAf7U57zLszIjRhToUsitfovpOLCyRgj9xhwvlGxyOO2lPZo2o5bz2FUkzbCye6g5jxC4/UfEcUiVULbBB3L3/G/o=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ge/iJWUBL1NR8dkNZvyyNxo1VQ6C4YgOxH8wZjWKFTvWt0lLrbSFNpbZ3B+j?=
 =?us-ascii?Q?nqtySut7tyi7U/2mNbU24HrQ4UcJlINZnEQ8XW1+c25G8ZASo4s5wSQsZbpS?=
 =?us-ascii?Q?UCaV4LpnY7/53uJXCInwJSlKHwYMYqYNruo0ozE/aEXC9CsnjgMGF2iXKeNt?=
 =?us-ascii?Q?k66/6aNABg8yTgY/6kgkM27Y/HEjiElQO4eWx7S0pM8O9bZLhxI+kBJRCJaV?=
 =?us-ascii?Q?72lPaMBfOuZz91vkusuMgJoR7rGTsBshmhPItGPp+5aznWEtiSirwKzSLYI0?=
 =?us-ascii?Q?9GvqQj6wESaPuyJp47Bfp6xlyvH65oO+ZuqkTBBPZRteiY5h8tYQhzO+5rQb?=
 =?us-ascii?Q?RSlB5MmRwm5/hHesCRK07WCeRS0ut4RqA6MIoKHaabDHtVV1QnJvcZqRxp96?=
 =?us-ascii?Q?ExJy464wUKwOcQRs48QDZV5SMPsBjvdQZ1/rP+tRtE2u85dIlT1lHow+BFHW?=
 =?us-ascii?Q?XEBCO29okXc9eJOPkoldMFmDFyUv3JgBFiN+9daohYIhInQpXkZXkb/9LlOx?=
 =?us-ascii?Q?YzFNdMaf9BugO3sEPyJqlwKMkqM+Zk3dbBIT27RDvYKwUJOsLHA8GHwgRh+E?=
 =?us-ascii?Q?FSTlNtCfP3CDAWjA7J8xtah3piOuS5E0xx7aEFjUFjpaAVbz37LT15L72uV4?=
 =?us-ascii?Q?9OLMED/g1YeBbhsSfTawaIqBXk64ygRJzb1wJPrzGCQ4UgYjCXLZVaPAk7Ya?=
 =?us-ascii?Q?BxLEjPS525Kt3YOT/QfKrLg27jQUEqFqR2uVkJFDx8pkV1edp++u5ovZ9EEy?=
 =?us-ascii?Q?W9vog/9p5T57IMCW62VjnP8rXmaErXzjA0lKZaUh++MhRBjcbgR8hWtB87CV?=
 =?us-ascii?Q?TbZVMAsrl9Jbi7zSguwUWWoDEqFOywLdNqaQHzGhqfch9PSfuyaxCVMBQu2b?=
 =?us-ascii?Q?Irp34RGoQqsPrxdN4ukfaynFDOkke8Dj7xw8hbhqivZ5YsUD/F3ErdMUgCyG?=
 =?us-ascii?Q?cLk4r0vpE3OIRILLGov6qZ688fX919OyBr52DBWMmtPbX3FLanrShh03c9my?=
 =?us-ascii?Q?c79tmRIoHFRp7CcS0/RwNq09Gk494N4Cezo8fPe544YtiFv29TwNBPJKzt72?=
 =?us-ascii?Q?LjgTM/xLGQf6HIbmL03FP7iu/g0bBotEHRfJjzPUmtc9Tmya5XAiZWdgzXyw?=
 =?us-ascii?Q?h8giQR15VcJVWMtmnqnd4x6VcZZ+vJs/PchTY+/+aIn61J3h0WF6EXmYJRg6?=
 =?us-ascii?Q?wO8ai0+4aMBOhhjk0/Qx/mBDRplnrnI2sWCcsPFI133bZfIUDKtZw+hh4BBI?=
 =?us-ascii?Q?etIPfAe0TQ+605SRrNDRwRa49iH9EGaLxpvx7F8JLHEdg2HbWtBSBO+/P4y/?=
 =?us-ascii?Q?y0iRZw5ZgG/GgeAh15l5Hd1Nt+1K7GpROscVN/cldx3L28lnIsCDHaK0T720?=
 =?us-ascii?Q?P2/+YyalTjtIQ2OBAlkimXyKaJCURi8wJfvfE72drzO3ltzajT0wuOYQyT+C?=
 =?us-ascii?Q?BpdZL2IfDvWCoZMy1L/A0EoiPfRt/UQ7RMUcbVNyTSCAjSg1qGLvpcw8fM43?=
 =?us-ascii?Q?aRwDq5o6Xc1iouQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ca01784-4128-4042-0d37-08da1d6edf80
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 16:58:46.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR09MB3178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164344

On 13.04.22 18:56, Jose Quaresma wrote:
> Hi
>=20
> Konrad Weihmann <kweihmann@outlook.com <mailto:kweihmann@outlook.com>>=20
> escreveu no dia quarta, 13/04/2022 =C3=A0(s) 17:34:
>=20
>     by default git pulls in several code fragments not being licensed
>     under just GPL-2.0-only.
>     In fact obstack and poll are taken from glib, being licensed
>     under GPL-2.0-or-later - as this includes GPL-2.0-only, use this inst=
ead
>=20
>     Furthermore
>     reftable being BSD-3-Clause
>     sha1dc and inet_ntop being MIT
>     netmalloc being Bosst-1.0 aka BSL-1.0
>     regex being LGPL-2.1-or-later
>=20
>     Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>     ---
>      =C2=A0meta/recipes-devtools/git/git_2.35.1.bb <http://git_2.35.1.bb>=
 |
>     13 +++++++++++--
>      =C2=A01 file changed, 11 insertions(+), 2 deletions(-)
>=20
>     diff --git a/meta/recipes-devtools/git/git_2.35.1.bb
>     <http://git_2.35.1.bb> b/meta/recipes-devtools/git/git_2.35.1.bb
>     <http://git_2.35.1.bb>
>     index 47c2211864..f8756b6dec 100644
>     --- a/meta/recipes-devtools/git/git_2.35.1.bb <http://git_2.35.1.bb>
>     +++ b/meta/recipes-devtools/git/git_2.35.1.bb <http://git_2.35.1.bb>
>     @@ -2,7 +2,7 @@ SUMMARY =3D "Distributed version control system"
>      =C2=A0HOMEPAGE =3D "http://git-scm.com <http://git-scm.com>"
>      =C2=A0DESCRIPTION =3D "Git is a free and open source distributed ver=
sion
>     control system designed to handle everything from small to very
>     large projects with speed and efficiency."
>      =C2=A0SECTION =3D "console/utils"
>     -LICENSE =3D "GPL-2.0-only"
>     +LICENSE =3D "GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 &
>     LGPL-2.1-or-later"
>      =C2=A0DEPENDS =3D "openssl zlib"
>=20
>      =C2=A0PROVIDES:append:class-native =3D " git-replacement-native"
>     @@ -14,7 +14,16 @@ SRC_URI =3D
>     "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=3Dtarball=
 \
>=20
>      =C2=A0S =3D "${WORKDIR}/git-${PV}"
>=20
>     -LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e1"
>     +LIC_FILES_CHKSUM =3D "\
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D7c0d7ef03a7eb04ce795=
b0f60e68e7e1 \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://reftable/LICENSE;md5=3D1a6424cafc4=
c9c88c689848e165af33b \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://sha1dc/LICENSE.txt;md5=3D9bbe4c990=
a9e98ea4b98ef5d3bcb8a7a \
>     +    =20
>      =C2=A0file://compat/nedmalloc/License.txt;md5=3De4224ccaecb14d942c71=
d31bef20d78c \
>     +    =20
>      =C2=A0file://compat/inet_ntop.c;md5=3D76593c6f74e8ced5b24520175688d5=
9b;endline=3D16 \
>     +    =20
>      =C2=A0file://compat/obstack.h;md5=3D08ad25fee5428cd879ceef451ce3a22e=
;endline=3D18 \
>     +    =20
>      =C2=A0file://compat/poll/poll.h;md5=3D9fc00170a53b8e3e52157c91ac688d=
d1;endline=3D19 \
>     +    =20
>      =C2=A0file://compat/regex/regex.h;md5=3D30cc8af0e6f0f8a25acec6d8783b=
b763;beginline=3D4;endline=3D22 \
>     +"
>=20
>=20
> I don't know if it is possible but if we can add a compat PACKAGECONFIG=20
> will be great
> so we can disable this part which simplifies a little the license.

That would be indeed nice to have - from my understanding of the=20
makefile those are build unconditionally, so it would require a upstream=20
work first I guess.

For now my patch is just reflecting what is actually used

>=20
> Jose
>=20
>=20
>      =C2=A0CVE_PRODUCT =3D "git-scm:git"
>=20
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#164341):
>     https://lists.openembedded.org/g/openembedded-core/message/164341
>     <https://lists.openembedded.org/g/openembedded-core/message/164341>
>     Mute This Topic: https://lists.openembedded.org/mt/90444706/5052612
>     <https://lists.openembedded.org/mt/90444706/5052612>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [quaresma.jose@gmail.com <mailto:quaresma.jose@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
> --=20
> Best regards,
>=20
> Jos=C3=A9 Quaresma

