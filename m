Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6473AC433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 15:11:26 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.135])
 by mx.groups.io with SMTP id smtpd.web09.867.1632841884807778408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 08:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=kTaR6JAT;
 spf=pass (domain: melinkcorp.com, ip: 40.107.212.135,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ0y0p1jysvG4zwhCJbsbyB+QcrFDVOVUwMZjISC/tqtzt0r9RzOK8s6z98n5kC4F2KncLxhrJd+5KYUDsJt1xfK+878jHaOxTDVq9GrkX7a5sVfe9srPN6N+oRbFPx8ACeLNDhm2DrtM29q+RqjtF9Aqk5ReWc2kuc8A0nCg/St7I4HCGQ/RvqFKdo7MCuluAa9BtbA9Eb8fWjZFO34IekcdRStzXoexLYpMxLKBLndKN6H4eoGIxzRDBtAhT/mYulkvg/j+8A9dCpCXPypMizP6cpDGN3K4cciE/SwiYoWaH/jxyDTrZpio9ABjmv/bcGXpovCbMlJPSGZActVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rP6+nXekTDa8tt8jbeIJNIuD6ze6/eYdiNeoB/iJglk=;
 b=Z0BZ+0/rxTrDQ89TGulzpT3KurgNy674RQmZo0ZjXSsylp1oH5j97TZ5z+pKrox/FK1RIyWa9MNj+TAsdL3rJ7zop8+8Y7+6uUEnJhvY3dNYC1MWQZn5nchZhGgvUIkYXrkuYd8ROIs3qXGO655MtZaDm2bCqSpwxU7f0TNn1hAD0NPqFwyYEkzwN8Rf5X3ymmMfKlNtwGX8ui8ebry5gXbTmRCJ8Bqj4N9FtLV5sGAEVK+ifjmkDNZhIypKsiQlM7O32KRDdlHSjDFxuVQinyzONU3YhP8V0nxzue28fusanE44NGLm2KZW/4SgeZhPVTsXwfzVrUDTfNjsVXlbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rP6+nXekTDa8tt8jbeIJNIuD6ze6/eYdiNeoB/iJglk=;
 b=kTaR6JATLuY2kcPChjbuL0UK5A97ng47LCiz6eVshyic9Jw9/gxCYl7by/1M1tPM8/xHfAubbHu1iKIWWjSR6ioK55EozCJnVSBeYtevDQUVx3slXd/H7OsJe/MvaRlbnlEvdTglWZc9ZU1Rs5sILQjhUlPzhKCKTJsgVUKu0A84fu6kHUvIenI2ZgAAPhceUOQ3xJIYV3AAREPgYW6aj3SkyBouBHhMl9IjGC7nLcfEJ3BWuzQSvXYSNiUI/rJl0fm36XVRlTYdl9K6W3X7urgTWvYM38kdxbDYH51hRBwwzOHc5u8/RSZ0YOMtigMeTw009fDODSrtf8W83UGcgg==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by CH0PR20MB3963.namprd20.prod.outlook.com (2603:10b6:610:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 15:11:22 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d%6]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 15:11:22 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: binutils: compilation error 'unknown pseudo-op: `.l`'
Thread-Topic: binutils: compilation error 'unknown pseudo-op: `.l`'
Thread-Index: Ade0dPErc6hpxrTpRla0paDgkYmB+g==
Date: Tue, 28 Sep 2021 15:11:22 +0000
Message-ID: 
 <CH0PR20MB3948E4BB526801B6B1E0B7F6BBA89@CH0PR20MB3948.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 941ed60c-7776-4a63-8dd8-c7024949499e
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3f09843-de7e-4b33-ebea-08d982923b8d
x-ms-traffictypediagnostic: CH0PR20MB3963:
x-microsoft-antispam-prvs: 
 <CH0PR20MB3963CC5D8134A5C839CC2B4EBBA89@CH0PR20MB3963.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HAXJsnQ+PfOiKMCDpSVbgKXs0899N6EJtRoAH58y+WqeO6eHkin8iGdkJLTIGIVIuFwDMyUvZQLnRrSQ0mR4Tc20mSEX2Qx+jO3RvBz6SvjJWtzDKSLZpbXt7mDDFDDWMTHHV4X8JFTtbCg+8QvsjNsxQyL5FPWtzpFWxO4ICvLYUzaIjCF5yMg/PaFfKfuos67I09o01FV8avjRlxuV5JAxfX5xZicWmH3NHl8GMNWY1GZC4DtlISD+1Xcx0RnuwcZgvkSL0rNFs7QtvslEmRmDMU1NQd7aCi6vXXtuYsa71Sd7per+w8kcURH8zStSGrrNUe6R+/kgrdPYqGm/3DUZEWm//QZ+kuUzk4s10mML+PxKvVVfX5aGMN9dSytqMHllaHO8OcI/Lvnkpm82BCRzdWzJ5CbBBoPveyY3pXZ+0NFD3lrlREs6Ms61ZV1KDrbwI5VuVeoc8Q9Me9/UrN/Y2sAlmxB8a1h8A4WbxtvTYQ8JO7pf9QAoDV8+ujHIGchscjHttqZUAYkhGfPDhxq+LyTav5Pbogz38oVBWtb/EHUS5GJEA9AHHLFcwTCyMiR3iLmKV9iWXWI/01ZBJV+3JISBf4DijJwNwkANWdhFWS8DSZTlWGmtu+2SvyAER0/NpRTI9JMqRn7vVoMi2AK5AKrDzDSg22hwIGXFt4A47+MkK0GI0PIOv1/oiFzBh4+VmglpAdAzjl/TwIRT3OBTa4bsBqglXJiHUznI810crmu2eA9br8e0uu32kTsoyBkV1FE2Qk63R/nRd5hz8V+mzQbSEjrqmVSDzO48s8c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39840400004)(366004)(7696005)(6916009)(83380400001)(66574015)(122000001)(38100700002)(8936002)(8676002)(316002)(186003)(26005)(6506007)(33656002)(55016002)(9686003)(52536014)(86362001)(508600001)(5660300002)(66946007)(76116006)(66446008)(66476007)(64756008)(66556008)(2906002)(38070700005)(71200400001)(81973001)(473944003)(414714003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SeUM+YRf6bErHmYSlIUx9bEd4l3yzhCVnHC5Low9oTNqV93A/WwDW8wtkzOy?=
 =?us-ascii?Q?0DtKof0ziv3IlZtmKXHO/gG4nR5lCBRI+TK9lsgCoYyPhtpkIFupeii7fTX7?=
 =?us-ascii?Q?6nbhM4OC9KubGaGckBQ2bdIpbKUABenYgzsNP6RchzAPR/nmyif1ppekIYYW?=
 =?us-ascii?Q?yDKvicEdQDgEnwO12WvZX6tFqW8Dfb3XNepVF8o56li8TKxkVf4mWS63jq03?=
 =?us-ascii?Q?1wzuRc5zFUDswbo2+LkRIxiKxZzUy0nrT3pCc/tunfuK4vPvGQeexiE+2fA9?=
 =?us-ascii?Q?dnf5+TZZWKnk2Egk21zAYhgzJtMJmZQfoUFk3mhoEr4pnEPSIOIcvzHBAbfs?=
 =?us-ascii?Q?D43WEPrCPWZBXfEd+qg/QyUAqdHwJdcRJr096KQpDKYyQwt/3CcuqtX+Dzeq?=
 =?us-ascii?Q?ASlmC41bpWCT3HyiewB/yA4EJFNHP5IrL9knH4TkS7+3nX2s5o/yGQXH684a?=
 =?us-ascii?Q?WYEduQ794UnrbRzp130jCqm4OLIIU/s5w5vPdCtF638op79/uqnigiuBD2Tq?=
 =?us-ascii?Q?+vFZMedcAcIsAvUL8WDbkt/H8ZTywbOPzIYvUUsJOmxJh9bFaGKqIUa1f3Gq?=
 =?us-ascii?Q?xQb6EIdQFciJPd3f+nY8FEMU1nTups46cK5RkSCPZO09pH7H8h3xGabWO5i3?=
 =?us-ascii?Q?QyA9zmu5RVwKk1Usw5Y8K3jMfLdOZBrRZlsOl20xyng7IlfxSQAmW1kG8cRq?=
 =?us-ascii?Q?MpfCwjZaJ6X/M/yj72eTi5EwIrp2oTxOlwTcQfFTgfiMeYsZx+1rNHDvSGpK?=
 =?us-ascii?Q?wSlpjPWwEzBR3xV9QlBxMaX4uJFlwugB07HRpN13GemXrRlaA/RaZoWhPbfF?=
 =?us-ascii?Q?f5jwqaTxVCmviIMTdVBjGDG8RZPtGcj8PkTv8bZn2WTixe3+s1gq0WbNtO4B?=
 =?us-ascii?Q?+36xgcS4B/HwDzoRxJ8DapWvpaTuwwzLRaCa6m/TYyrmo8dqEQ/fweHqQ0aF?=
 =?us-ascii?Q?WvsjIfj/CZm7OSbLnaBzzh0gcfNLiiSPjlcxpkete4+ecDjj0MUTHX2wjPIm?=
 =?us-ascii?Q?+jdKrg8AK6uaDG+SflqyN+iNZp9vZYQ/2bsj+I2PkyiEicVHsWr7KKuqbMSF?=
 =?us-ascii?Q?9D1CtzSIM90NwjEPw0i3DynZD8BlvxUZr+zl+84s1DDedRAJvKY3f9RWhZzR?=
 =?us-ascii?Q?tN8IGHZMex0UOdDZzhYY42y1YU/+is/jNZiQszJit5H4LPk5f7MS1KkLdkFw?=
 =?us-ascii?Q?db0GrINcWPLgQa6xKOoAaFR1Qkw1ihtV/JI/K46q7jZZYo6xhFvMnFMi/v7H?=
 =?us-ascii?Q?Y8DSs6iXiRorFWLawWnJH8Atl9EEJWMBJCgIBWL7dzsH2dJzxhXI1m9dUfrW?=
 =?us-ascii?Q?zp2wxkO+lzPxNUACMVFDGbzX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3f09843-de7e-4b33-ebea-08d982923b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 15:11:22.3617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lo/lbNH6KexpHfulMEcuRorsEdUlRRXijdOKzqYme2/eopnDzizrNTTvyCpMjgVRmlARPy0ceOvmcTl+QUpe3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB3963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:11:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156424

All,

I have a AT91SAM9G25 based system that has been built and works using yocto=
-2.2 (morty).  I am in the process of upgrading my build tools to the lates=
t.  The build image is a custom image that is based off of core-image-minim=
al with a few additional packages.  I'm using Ubuntu 18.04.06 LTS for my ho=
st environment.  I'm up to yocto-2.7.4 (warrior) and I hit some build issue=
s that I'm looking for some help in solving.

Here is some build configuration details (with details I don't want spread =
over the internet removed):
Build Configuration:
BB_VERSION           =3D "1.42.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "at91sam9x5ek"
DISTRO_VERSION       =3D "2.7.4"
TUNE_FEATURES        =3D "arm armv5 thumb dsp"
TARGET_FPU           =3D "soft"
meta-bacnet          =3D "master:49ebde9269e8533a8e4ce9c335addced6bfb79b6"
meta-atmel           =3D "warrior:102d92bfc7bd772387ea89c149d33cc5ebf9179c"
meta-qt5             =3D "warrior:6310c5c17380ad5e3bdaf1938e025d713066e7ee"
meta                =20
meta-poky           =20
meta-yocto-bsp       =3D "warrior:eb163bd6aa0911a9541702cd12a3df684fe5fbb1"
meta-oe             =20
meta-networking     =20
meta-python          =3D "warrior:a24acf94d48d635eca668ea34598c6e5c857e3f8"

I'm getting following error when the system is compiling binutils:

In file included from ../../gold/powerpc.cc:43:
../../gold/gc.h:375:1: note: parameter passing for argument of type 'std::v=
ector<long long unsigned int>::iterator' {aka '__gnu_cxx::__normal_iterator=
<long long unsigned int*, std::vector<long long unsigned int> >'} changed i=
n GCC 7.1
 }
 ^
../../gold/gc.h:375:1: note: parameter passing for argument of type 'std::v=
ector<long long unsigned int>::iterator' {aka '__gnu_cxx::__normal_iterator=
<long long unsigned int*, std::vector<long long unsigned int> >'} changed i=
n GCC 7.1
{standard input}: Assembler messages:
{standard input}:347600: Warning: end of file not at end of a line; newline=
 inserted
{standard input}:347687: Error: unknown pseudo-op: `.l'
{standard input}: Error: open CFI at the end of file; missing .cfi_endproc =
directive
arm-poky-linux-gnueabi-g++: fatal error: Killed signal terminated program c=
c1plus
compilation terminated.
Makefile:1137: recipe for target 'powerpc.o' failed

I have looked through the Git log for meta/recipes-devtools/binutils up thr=
ough master HEAD, and I don't see any references to a problem similar to th=
is one.  Has anyone seen a problem like this before?  If so, does anyone kn=
ow how to fix it?

Thanks,
Bryan

