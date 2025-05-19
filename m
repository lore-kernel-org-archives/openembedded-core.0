Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D07C3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:52:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.48425.1747651914843926089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 03:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=f7hq/1L9;
 spf=pass (domain: cherry.de, ip: 40.107.22.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP6FmWa8QIy7cSxSG7QvDek9eY6RzPo2FioxHgi4dAqwv/dwiEV1/9+J2I7H3hnMG//aLMG3lZUrOarcgrLAU7Ai9T28vJ27LyjxvgzLzJQVBpWwuwqoesBeKtyIuccp0pIikWsCwWzBBhJC5TrLUJNWi0lVaCod9mEOU7DsA8M3PuxlijGrSxoErPTofXewNEPV48+WvU8PnFZjtSQszM8X6xvZ2AF88fqz3aTiMVnixbTOMdodOrkijFGGkWzZC+t7ST/hUvelntakaTM3bZC0ONUidJ/qmb5A0d+smvjqZexqj/9//fZJraKirXVfhbOh+CSNq2CWW9u1QRck1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQVgMyyIe+1PFk++YcUWZXdsvfsQbIGrRLy7oFHae/Y=;
 b=Ee70ieqilbCZjhBL1pEKIzWp1gHJbMWvYujrEWChXgSl098X46duCOdq9oOVu/cR5L7KeIM27QN7wFWVR/jVfm9pzn3QpN/Iv/T7c9j5IfToaLqvmKCLj5O84DjfiZX+iBnkosfVSXzk67QKwhh34i5CC7JCYVKVikTfW9maaxjoE/SpKaplqTbjDsx3E40PkoXOvi9iV0a4uSvrcU9nxL4c5LH2FaIlwOvLWK0mzBfCMgzLECKA3Z2z84y8jVD7TRYwPNYYFpv5EZjDwYognFIqnTeRNQHnQOU56rm+uA/bPwnk1rurK2Jmw4dwS/qb3TSt/d4DZWbVEBO7BPpaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQVgMyyIe+1PFk++YcUWZXdsvfsQbIGrRLy7oFHae/Y=;
 b=f7hq/1L9R6RLavKmsKYlX+qPfu255u1N1FJ+kY1vjGGw59ViQe9x1gjvH1biL7bJwApqhcYnO+gV0jHDPBlE4uGQjApQ8bprnx+goQFNzWAhlIFKXorsvWcmm4PnVfl7O5x/xhmJmJn4m4JkaoqJGHaXZTwRrf2+VdozMQjk1Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10434.eurprd04.prod.outlook.com (2603:10a6:10:55e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 10:51:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:51:50 +0000
Message-ID: <64a0f247-a058-4adf-a18f-923f4537569a@cherry.de>
Date: Mon, 19 May 2025 12:51:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] clang: Include the libclang python bindings
 in the build
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250519083344.1646432-1-luca.fancellu@arm.com>
 <db0c30b2-7a27-4a62-b445-e13485a5585e@cherry.de>
 <6B5460E8-CF3E-44F0-B5B0-2532F7676BD3@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6B5460E8-CF3E-44F0-B5B0-2532F7676BD3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0377.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10434:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ccb1bd-d973-4765-bde1-08dd96c328ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TSROHtUlQ1AAgtRGxxEI+dX7yXX3TRJQ4qunl9+XyC7spxqJk+IiGFiZmDuL?=
 =?us-ascii?Q?L+IZX3zkrYg5gSy1BZKKrN38W8GS4ro0OM+x8QcHfWbIPUL0olPBxQNPcryh?=
 =?us-ascii?Q?j4ciY/ovGjCr8jSFA3qtGfkevoGUneTHdrWd9LU1olaCG0lFnMYeydvCAbDb?=
 =?us-ascii?Q?fZS7k35Gofr2T5ivRHhVVtMY0sM+LZOkhxUr3m8CrHWJbTE3XNeVjGQZn0EH?=
 =?us-ascii?Q?xsbroEOiYJlsZEQ8Zt7y6IyLja9p2uEKG6qzur6ZYbkJEJ1RewDaa0np9CoV?=
 =?us-ascii?Q?FCvuxybE6Qvd9406NBhytPP4ESMlEInZIzTk+7aOl3nxqd8+eAKdh2jja7Us?=
 =?us-ascii?Q?p7bPFkK7yD3GxUZrg9w4+zv8h/tShklv07VNppr2JnqzqASf3g8FfZz42vSq?=
 =?us-ascii?Q?PihDeOs7BPC806EtLmloTWplOY3y02/o0vWULiqu+JWC9wGunwP9cketK3aY?=
 =?us-ascii?Q?xO+sQXgKlBdXpEAfi+wOSg4mOhKsWbyNZ+H07xT03jY9seUYlphsSysuUwCp?=
 =?us-ascii?Q?UbKCVFadhNlUShj4dDInuNgxKVViReVbMbyGglpwmtU19axgWKxRDJ7i7/q8?=
 =?us-ascii?Q?2rypOED2sF42nv7zMizQvZ+huEHY2hjwv1KzK/803MQbogi5DDwh+apVDAgd?=
 =?us-ascii?Q?UVFHz4I/UoCV+btaAUL3SKZn+B8l7kk99Tm0m7o6TbrOYPWWczw7s5QOSPyd?=
 =?us-ascii?Q?3IIQ0hgxPyEL3xhUmKugq4HFOauznN3ZzYFOChL8NYKV+whf9XjkXm/vMq1c?=
 =?us-ascii?Q?jBTaq7nb+PsyKQ8LUzt2mYBw6m5zskSrLE+ErlBR106aULD856HvvyB/LAWl?=
 =?us-ascii?Q?DNd1PDiFiSMKzDTRsOKJYvPMi3qhorBbBPpBXPXa61pfdxy0kcmlpL96zKsw?=
 =?us-ascii?Q?aAk8eXgXho/SXsL/a524ZvZSm0aMggsFxMfU0jGKsiDMLTWjVoeiyAw3uwIm?=
 =?us-ascii?Q?pUxim2SZ/iRZa1gYGy8j0T8P85kJyeG3eFP6UVsyAsVVn1P99R2ovFTMPlmw?=
 =?us-ascii?Q?lcp+4b2sHd62KCjvq63GYIzs7ylg2bnP+9GAqTAB1KSlt8cIpbXuU6gnmmHT?=
 =?us-ascii?Q?95yMNRGKwjk/eWra9YEfBF6sfLDqUnuqe00Iq/IUSxdyfFWUtow3KteaUf8G?=
 =?us-ascii?Q?BeIw9Ybjm7an2n4Xg6Ojd/zDEltidlGGz+Oos+f7CXa+XIiT01Sdq65VZqwn?=
 =?us-ascii?Q?EyS2ruroA/QW4kL8D07P8aRBNOX7AtQwVjMdJAJSREJ0p3TRkdM4QMDXWrjJ?=
 =?us-ascii?Q?63sT9DfdVBkbg02C+7DqmWxBj76lI3QEtEFUq9748jbEgsYhTbLnpjnTJLql?=
 =?us-ascii?Q?o9zNUIUQs4GiCsuZ6K2vWivWBAsID1x32nzX5TTma/Pm40ivMc91wbWKOmRm?=
 =?us-ascii?Q?JAVq9xFZtbePXVNRlOxSOzfnJBN/GtxxKcLsEjG06uUI6dhbZmrI5B/3Wyii?=
 =?us-ascii?Q?RiMZt5sLYro=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5PQoqv4Gfvp1xoqngu3C5kXycAg1unjipzOgH5p6PLLjrqUA1xIyOXmj6AO6?=
 =?us-ascii?Q?poYO9MWwCBdpeWnpoa30JY49i6eQrR6Qw0JKAvdWeaZ3ompDT73/vMee2EN/?=
 =?us-ascii?Q?eAq6OWTI8QsYEX/zPJb5+3z23duDMbOpGovBJevU5Z0788kpyut6MHz74R5r?=
 =?us-ascii?Q?ykZZNgUZ0adtC471t8oNUX+j2XZIne5waYsrGfPGihikGcSYQxRf0Ke+2a6L?=
 =?us-ascii?Q?icA5KtxH8Z1neFgtIE+pz5TfK467NE2m0gXWvGPD1SvhftjU6UsgcjOkRrVF?=
 =?us-ascii?Q?ij9NTzkOdXP+NAnJ6kxncsDgQSpnCueUrvuV2Ac7TKXreCL5zjxqyno+YYGU?=
 =?us-ascii?Q?Q/iJoBU4krKlLvs0AAvUeOouzdD6VnfsiOpd6VL8Ntjxvs6i//Pbdo+0NBhI?=
 =?us-ascii?Q?r52MUS52669ktji4DTPFLUzte/j/4NHDkoFHrRgXbiSfBCGt1fct0EeOLkJp?=
 =?us-ascii?Q?VDvUfIOo+aSirg/pj2Zri9DAxKEfuYoho7nR6+TcPDYHzW0qZ+cU0lcOksAq?=
 =?us-ascii?Q?iJLkESSouF6iovB5i/7Y8/QORvIoT9wr0C8nO9kVIOBy+tBru1yeglt6iJQM?=
 =?us-ascii?Q?2Du/JJdniyZtPMA0ettAzpFa+9ORPbjfJJfqB88LWdjvBF6S6KnCxVszCky3?=
 =?us-ascii?Q?3dMmwDrV7kzzJnTxcNAD3uwRjF9APQt+vlQfftK1etIbNrwtbT4i1DDmgaUE?=
 =?us-ascii?Q?vji50N93+6HQdH4EQYCxpf8wAwma+p5wFmgh+fOAuWAbtaiIi4jaOePUyBCs?=
 =?us-ascii?Q?mkh20cMwRHSoJt4F9Wfso1/mcHSg65NfONA+GA+xu970kaOs3PF7djfcrvaX?=
 =?us-ascii?Q?7ZPs1AD/ynswovKy/Y70+hqJNLQKH/EbZnJWXHPExLM/QXpQ3WQWAOrAznOX?=
 =?us-ascii?Q?84gco40SOBbdXTO+bS8OUtrZV0PK3GUv+vFAydnVJhfXS7RxpjGSIMwOeUvi?=
 =?us-ascii?Q?3o7923ueSI2IuExbvcqF4gqO1VR02RhehmJIIGc9bRv0O1fXPL2+bvJ3lEB9?=
 =?us-ascii?Q?buskJM/LQSG0zQzVe7ExK+3TV7QPzaZObZD4cmaQlz2Kd0carCPt4G+7JOCl?=
 =?us-ascii?Q?17qYqKx8CYVTqCxMLCo8+gbgjlRX1OX6vIh5DOM2OMI8y1Cu6gFjpY8eSFgF?=
 =?us-ascii?Q?Tz/gdZNucLOGYF42NkA8tuRTsWpmTab4ZllGL0/KHX4UQ2mB2l9A8zvf/BLE?=
 =?us-ascii?Q?MS8HzYzC92CF3+07+MILv+rcPL+8ympRWohN5SnzAonSldbmH+KzcUiOwG5i?=
 =?us-ascii?Q?CaDOw0fIeJvvXqh3ycO10fnjFSpW6e3dy4xfTbqV9UvRhrVJ+N98XA0UwZ/v?=
 =?us-ascii?Q?tmrDRMUPi8LRphGsma71qg7IfM4YUWnYKyna2YZQLluQBYrPQqMKGBmYsWTd?=
 =?us-ascii?Q?89404MTCgZkZj+SOCv+CsNnEWZw7HYx1DfXapAS4cPXUhgSIi8qjojfouWxM?=
 =?us-ascii?Q?jpqdbOvzn6QuOaCM2PfXjkJgfBgAZwsjuEmTOJbnpzq75maHi+M/M7snzy7t?=
 =?us-ascii?Q?dCpbpSfl5DNF484Kjpr4TAlbGsKcCx0SVoAdyW6OEJYr9JgDIpTeSYNroRfL?=
 =?us-ascii?Q?8CtUy5jLeGaKQaBvDcTRG63T4yvfCGiIe7RYcL9eXFSXJD75FXjxxd8Zto72?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ccb1bd-d973-4765-bde1-08dd96c328ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:51:50.2777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqVo3Lb4X2yo9YtyHNLpJghFcrKIVVkLOPSGsDslPoa8jp/o5WZrH9wlyAzyYpd//b3miohGMxFh2qIbzh0X/2dwkxWwnGXoqmHv3OZvfs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216834

Hi Luca,

On 5/19/25 12:46 PM, Luca Fancellu wrote:
> Hi Quentin,
>=20
>> On 19 May 2025, at 11:43, Quentin Schulz <quentin.schulz@cherry.de> wrot=
e:
>>
>> Hi Luca,
>>
>> On 5/19/25 10:33 AM, luca fancellu via lists.openembedded.org wrote:
>>> Modify the clang recipe to provide also the python module
>>> 'clang' when building libclang.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v2 changes:
>>>   - used PACKAGECONFIG and default on
>>> ---
>>>   meta/recipes-devtools/clang/clang_git.bb | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
>>> index b41b700292c7..42f52af4056e 100644
>>> --- a/meta/recipes-devtools/clang/clang_git.bb
>>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>>> @@ -49,7 +49,7 @@ def get_clang_host_arch(bb, d):
>>>   def get_clang_target_arch(bb, d):
>>>       return get_clang_arch(bb, d, 'TARGET_ARCH')
>>>   -PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs=
 \
>>> +PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs l=
ibclang-python \
>>>                                 ${@bb.utils.contains('TC_CXX_RUNTIME', =
'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
>>>                                 "
>>>   @@ -90,6 +90,7 @@ PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DW=
ARF=3DON,-DLLVM_USE_SPLIT_DWARF=3DO
>>>   PACKAGECONFIG[terminfo] =3D "-DLLVM_ENABLE_TERMINFO=3DON -DCOMPILER_R=
T_TERMINFO_LIB=3DON,-DLLVM_ENABLE_TERMINFO=3DOFF -DCOMPILER_RT_TERMINFO_LIB=
=3DOFF,ncurses,"
>>>   PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS=
_INCDIR=3D${STAGING_INCDIR},,binutils,"
>>>   PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-=
DCLANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
>>> +PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=
=3D${PYTHON_BASEVERSION},,"
>>>     OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>>   @@ -312,7 +313,7 @@ PROVIDES:append:class-native =3D " llvm-native li=
bclc-native"
>>>   PROVIDES:append:class-target =3D " llvm libclc"
>>>   PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc=
"
>>>   -PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
>>> +PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python $=
{PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
>>>                libclang lldb lldb-server liblldb llvm-linker-tools"
>>>     @@ -342,6 +343,8 @@ FILES:${PN}-libclang-cpp =3D "${libdir}/libclan=
g-cpp.so.*"
>>>     FILES:${PN}-lldb-python =3D "${libdir}/python*/site-packages/lldb/*=
"
>>>   +FILES:${PN}-libclang-python =3D "${libdir}/python*/site-packages/cla=
ng/*"
>>> +
>>
>> Wondering if we cannot use ${PYTHON_SITEPACKAGES_DIR}/clang/* here from =
python3-dir.bbclass? (same for lldb-python and do_install:append()?).
>=20
> it would surely work, I can do the change on the bits I=E2=80=99m touchin=
g, but I=E2=80=99m not confident to change the rest,
> is that ok for you?
>=20

It's a good start :)

PYTHON_SITEPACKAGES_DIR has a harcoded python version, so I hope that=20
this is fine. I assume this shouldn't be an issue for the native class=20
as we don't generate packages for the native class anyway if I remember=20
correctly (considering that I'm not sure whether we take python from the=20
host (as it is an actual dependency of BitBake already) or from the=20
native sysroot). So, the change in do_install:append() is probably not=20
the best idea for that reason.

Cheers,
Quentin

