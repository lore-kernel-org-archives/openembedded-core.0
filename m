Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EAAC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:10:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.67060.1679559057148640617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=P4czu2dH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2446a955f4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N7wFbc023715
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:10:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jeTlOTs3X2v5XtJ2sFyQE70jY/d5o6KvAzO/aLHxdYE=;
 b=P4czu2dHXaIYDPcQiztJvA90Dbo51ozd6/N+K9ad9764KTh7C33z6SC6+AopvQYyjY7E
 /eE67VIRiT3gmkSqqr6X2b2d3tZzNvtBdtjumcDqkzp135qWgrJvR5mnwqoZQMZLErqO
 EqFm4AOxCB0NBX3NiX6CQXuJC+3R27oT1uh98I28IdRG9RQ81OKoe4wnswimm/Rb8sEU
 Keu0rut+5eoKfSJHp/nz5UdcTRz/F2wDrHe1rODxfiTQA2ge682k7+ngkjdAISxDRdhI
 SSP1RZxij2PHIuSzHaKheqoLUg16K2I9HeWRJXHAOEKXIKWRnncM5Um+flNFLa2w5mJE fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb9fb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:10:56 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N8Atb8018649
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:10:55 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb9fb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 01:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXCxit8xlAvBmNxUnryJwWokJbDPR/4Ub83lDAJw+yPRljNzxuUy8OmePCmvaUqwmWMw16gWg7aezeTN6+vX02iXXjzztCLfZZ58s8JyxQf3+xZtXVaM8xtdEKa/gxCu3xqVmA2PX8Ed1Gte521aai7wwq17oeiy53SHfGXJEePBfCp53UvwfmlcYUENl75hLLzmZXkS7DakN6eNr5F9c2s5j6OGEmEbXkvS6wB8l/Gb30lkv+c/rM8744nVVkZQeC9tpxWzfz6P/sDF2qUHC6HhxrzJArMuZRM1+CrtTkXspsFT6Z18lWNYjTMC96CeBqZvJ3qFNha7deqH9wB3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeTlOTs3X2v5XtJ2sFyQE70jY/d5o6KvAzO/aLHxdYE=;
 b=K8xWdTeF7NrEwoWf/b67dX/MAfUC0dHOnVbq0KdqTQGbc1E2d/dW1QbfxJwFPdk28wmn2d95Sl3cJxXS/yUQvhsahJRn9HC23SZFRfHvdTsKBNMEsFF8wOaX66cvzqq5oFLA8JvrYj763dGcU9ni5CErzXL7vnPQL/h2ZoSxQ5J9xTsjG8kWF/NMP22kfBmTxmftXa6USM1SnN0OF8eI6rkftj8OkrL3pv+2PKPCSAvU1JSNND/dOE5zT7LZA7CwJk9daW0y71czjHThWwWbQdfFf/M6O+VavCh4VSJ4Qh783Z3dOn8aGSW4qUH1RJXzbn2cEKYVqUOgc2yq6ufHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 08:10:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:10:47 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] debugedit: add recipe
Thread-Topic: [OE-core][PATCH 1/2] debugedit: add recipe
Thread-Index: AQHZXAt5njD8p4dL/kOyns4/GAJwqK8HWWeAgACrZpA=
Date: Thu, 23 Mar 2023 08:10:47 +0000
Message-ID: 
 <CO6PR11MB5602934D4A53C1421BEACC26ED879@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
 <202303222153336e7e450d@mail.local>
In-Reply-To: <202303222153336e7e450d@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MN0PR11MB6256:EE_
x-ms-office365-filtering-correlation-id: f24dc7ba-7b7e-44cf-400b-08db2b761b8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kIqKgX5GKQzHNoYNwmc9PK90G2lMB5CyfGBink3RhZaPGsyHZwzTRPovFC5P6sgCdq8oAINkDsM0tZW15N+dDtf3hZIItTXD/uVdvAV+N0kegPrWEfl9F4qFIWGqZw47gte3gPi9xvx6+qLZFMPsU15UN8qcEn5+ZbRvqI/5rtLI8aRl1CrBCMyiPC2g8z4UvTVIO0y7nRsImN3jCcrXpRxXv+hfrxRP+5mbDnMYYFjHxBlGPCQkiMqSMeYxO9ymSLplg5nhbfW1Wo/7/YPe+Km/Sr+9hA/lkO6kWl3Oeu43k2QUeHMzQbVtMdwD61DASuopy7U+BI5vuzuKccSgsSDvXEC6kvn/2oRi/JR1po34WgqBtBXnhoEN0qPrlXyzehDDNaKXy9VGgvgQiJMQQjh8shloh2lk3x1vDc5j4CyV566B1RGPcZpnAe3BJz8a7YbO4B2LJ0zmnvTlZLUAShuUscCOHM4o9qIe4SFBipK1BxgzYXXf44bQkj1fdQ45tlUNlIobvTG1m1TeMTkVK32i/Cl69EwQDg+qk/ETIKnaEHYeMTiPcTasEdd2Z52lCjaynemUCdrPSVtNTfHu0ovDlDmChDFIftQ3airG3+C+hbneQyepMK5UeT66d42Ua4eh3roQWCYE/EolBAgBGqKIkAyU7cwOcxOrukF4MvSc70uLaFdAnJoRK5zXKh3a946eSyZ7MkRG1AQFon8MHqagfbKv564fj0vRt4Nu32w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(451199018)(8676002)(64756008)(66556008)(66476007)(7696005)(66946007)(66446008)(6916009)(55016003)(76116006)(4326008)(71200400001)(5660300002)(966005)(52536014)(8936002)(9686003)(33656002)(66899018)(186003)(2906002)(122000001)(83380400001)(86362001)(53546011)(316002)(26005)(6506007)(38070700005)(38100700002)(41300700001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7zBnD0IUNcZGqxqJZBoPM+27ciISROJBn0uN1ritqSXFgMXR2EiADUK06JS+?=
 =?us-ascii?Q?WBi2mjmJiyNBlzON309a5irb4IOUZUzaH4tHOLPcpiaR03MNgU62YeuSW9EX?=
 =?us-ascii?Q?s64EA9pVFCxV28zf5TI93BYEo13BoMPyvAVGWE8zcm0SdVsS3S7rW0lEBGji?=
 =?us-ascii?Q?/uvNDnrJSEz0FeZ33Rk1t2tUsqaaXrnr5kKNXP96DUlQN7jFtqvb3lH/qJOb?=
 =?us-ascii?Q?xYx9X5BeQjdcmQA5HA/k6Pi1Woy4D6Of4/l4TpU1DbYJMzcivdDzQekTwFvE?=
 =?us-ascii?Q?/Ep+2keJPjoSw3iHpnujDK8CcLBLxSAGUC3ATZ0i9TNNH4ze/vKOJTasSMY4?=
 =?us-ascii?Q?M67XIi5Spdwh7EjaWpwQfSe3LlKrRsB3XCUxm4t6djL0cEgW+QRNcSDAweiw?=
 =?us-ascii?Q?SySGP1soBWmMtraEfl3rhbgfru8GTDLbv1xC6EKlrgPgHaBlIH6ubzu7ll83?=
 =?us-ascii?Q?rbwVpDscOwdA8bCYdtxa3y/bN4o+ySazFneMb7JyQ2mdUIl2Ze3jBi2vtV6X?=
 =?us-ascii?Q?sfKGnubGrhUgoh3lD7FKTzg7cF4v/5lbhTqbXV+ZALRwnAruqiCqO9PbJAwo?=
 =?us-ascii?Q?qbVMf2byTa+rAc/DhhWy9Nd4J1JB2X8ZfRYQ6y+u28Qecxos+3sL1+9K8FUG?=
 =?us-ascii?Q?+jUJfnzXIA3YIZC9GRKWLhdr+th4ZOz/HBm/DoLMCOTmPhr81nYLjx+BRAcN?=
 =?us-ascii?Q?TG7XTddu9vHZm9OQtun4Hvml4dCs/iJxIuyr51dHLkpIJ82OIxwAV/UfN1Ho?=
 =?us-ascii?Q?+IjsQ3fMoewjoVuKlB+/acRI2WJLE3Cics1jqMO6QYLqjz1/ZKSarityOYni?=
 =?us-ascii?Q?Cxe7JouPQnK2UY5hr91aogTcHbWjDiJejSFE4L/SO143UiGiyE9YRmmpAlNV?=
 =?us-ascii?Q?37RE45SRLiCnaIQOEM8Tp2aEqfEunvqR6jxXLX1EktmYyYcgWxr7CiZmTW1V?=
 =?us-ascii?Q?/3tgA8+dDTK371CA9DMVomiiIVNErH7HuFoZcsRc+aUJxXrr4a2PX80azzvu?=
 =?us-ascii?Q?DnM6MI1d52r+0gAe3Bja948czcDzgnW9z+Dt3ixLbbqC5eavJharUyVMFBY4?=
 =?us-ascii?Q?f+Wsuk2HRd7ZHtQ232gQ645sXFYfLwcqYrc++i3Rs2kYWIpVg2b2YqL+xYTH?=
 =?us-ascii?Q?SmY29b9chKWQuqvqeGRxViB/Rt9Jc/Kj9Ce0XFROnXxza70r+dX58MUjs/+W?=
 =?us-ascii?Q?w8HUazTvDeeOUBDS5HkZzXPgiP+5Urh7LvRlh0jXk39vHsdZZWhABtFxvIzt?=
 =?us-ascii?Q?mg70w07BDVKESc41lyLxR/HgqIreLSeNxT+5RWK+sLcZZwbOxFZdszO3P1i1?=
 =?us-ascii?Q?cOmkIIb3Gx0TW5x2f/A4xDE7RtTmEQqr05rJ5+88qCGpjX/eOsTTAsypJBUZ?=
 =?us-ascii?Q?8NfUjst1WkuH5GF5ceB5IoDoA/zlpsBMA4TyqVpSgCPI2hdZLdy/rT1aNIbD?=
 =?us-ascii?Q?Vd4jSk4l3VI2BiZnsjfUDJcaYZTI9aOsXTN4xZ0zoaRe0o0QjzByjBWLeLuE?=
 =?us-ascii?Q?Qa8+j0hBfCEEhhR8CAbIVjfdpiJRYenz4EqK0d6bUqzQ0gHAnda9mRqy9Fj5?=
 =?us-ascii?Q?U6B3YHbnZq/vjZk1ZS1xuWwYAcA3VjgXYXbexz/7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24dc7ba-7b7e-44cf-400b-08db2b761b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 08:10:47.1211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pAvxx+EP/s6Sx65HgXzGXNvjElqfFkRS0wa/8HMMk5Vv6JvIA6db5I9ShkPuIW9VF+IDzAACEPyLdif9K4oHqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
X-Proofpoint-ORIG-GUID: pJFWYt4w14Vjkd-tNXWfv2cqhp8kqO_y
X-Proofpoint-GUID: E9wgw-6jCOwces83DqoJuJddPSJMSZbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303230061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178966

I've fixed the failure and sent out V2. I noticed there're some patches (fr=
om Khem) in oe-core that fix similar issues for musl, and I referenced them=
. Thanks Khem.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Thursday, March 23, 2023 5:54 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] debugedit: add recipe

Hello,

Unfortunately, this fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6868/step=
s/12/logs/stdio

On 21/03/2023 23:40:15+0800, Chen Qi wrote:
> This recipe provides find-debuginfo which is used by rpm, more=20
> specifically rpmbuild.
>=20
> RPM upstream removed find-debuginfo and switched to use debugedit in=20
> the following commit.
>=20
>  =20
> https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd94
> 66fb9dc717846f5bf15518cc
>=20
> Without debugedit, rpmbuild fails to generate debuginfo package when=20
> %debug_package is added to spec file.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../debugedit/debugedit_5.0.bb                | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/recipes-devtools/debugedit/debugedit_5.0.bb
>=20
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb=20
> b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> new file mode 100644
> index 0000000000..624adf0416
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Tools for creating debuginfo and source file distributions"
> +DESCRIPTION =3D "debugedit provides programs and scripts for creating \=
=20
> +debuginfo and source file distributions, collect build-ids and=20
> +rewrite \ source paths in DWARF data for debugging, tracing and profilin=
g."
> +HOMEPAGE =3D "https://sourceware.org/debugedit/"
> +
> +LICENSE =3D "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
> +                    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a=
5b0a1 \
> +                    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae5=
04"
> +
> +SRC_URI =3D "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.=
tar.xz"
> +SRC_URI[sha256sum] =3D "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b30=
44b38d7899aa553e"
> +
> +DEPENDS =3D "elfutils"
> +
> +inherit pkgconfig autotools
> +
> +RDEPENDS:${PN} +=3D "bash elfutils-binutils"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178889): https://lists.openembedded.org/g/openembedde=
d-core/message/178889
> Mute This Topic: https://lists.openembedded.org/mt/97757563/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

