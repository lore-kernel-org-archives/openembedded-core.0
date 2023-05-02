Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24786C77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:40:36 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.5326.1683067230941266626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 15:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TjKM09Zp;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683067231;
  x=1714603231;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HHfpRGAqhSKj1htHXjvu6tIM6XLtZibIqsKL/z9r7iQ=;
  b=TjKM09ZpFjEZsggJzlwxUuGSn77DlE0yC32+PJ8vMJwR5XWRw9PQiu1C
   0BNGMiwErNNFE26Mty2MQwrxLVsZ0AWyfTzyUujjMIzIA0nGDiM3SZ5HQ
   K+sKmUXXguaoHj1Z/TMLoCpSEQM7ky4R16kPgy3aLxFcLWc0CNqholH+e
   nJ3vVp1/Wu0TRhZ3GfepxkBsK/Zq5gV2lsiSnVLKWm+CtK+UWT60198Cx
   JsjQW1zVBiU6pCsbHNc4BJ2d+4Hm6SCiWSgWJgWYYxQOV41u8w7/KwPzI
   CAdfaYQCWVi9/A8YR7pkWY3/w82Uoucf2Ajrt8+muorkWR+OUdgueylFr
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw3GpZK0kVw9ukAkq8S5peZ0zvto68IwQgAK1Ywa7VHYcH6TVb+IstH84tKJVLOfxNEFNbH4CNt0nor81rmXtq2NvVO7+G/j3TCcbp7ZuKJVuiI4E1TcJcJEaz/htd/NHJBDAdskUepl23GuzObwaM6AJMnowi3vDF7v+VyJnKWdpobKsWVMa3BNJnwz1sCoF4572s77SnzlcUG9UYYYgqY/oLj00ueW/7ryWf6h3yFDLJJ+Do4Qv9zXkIh0tBMieg7ravsPZlZ5peToox9q2HBBFRWiZl8sYrmchQW1FHMuXcLTKkeafB5y7LlfaxNiReqt/DmLHhMCfZdaDgynrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHfpRGAqhSKj1htHXjvu6tIM6XLtZibIqsKL/z9r7iQ=;
 b=bSK1v3J/vbi4Rfr9QL7LYwh/XnDhnbum/xDpvspvveefgVYBhzZFANcJ0+HshxVUXgjH9Zc07lMvCtJuN94Td16BAlobA74d1HiYYCiKEKrb050Z1WSLit3o27cgkWNfV+safnU3Np0Y2vVCM42yf6z2VY95j4u4vUUxQWMzRI45ogaHLBFllTJs0CJWjs0q21QdWHSzOMgD8CY4FLQog9ow8MAXixRreOo7RAUS+FTFQ4WYO+QlJI89v3NsbnHLgrfJdsgNoV5M+tng3UGOO1DI/1tFEaJMPI5J4Ki5mSp5hmOD4+Qbz2EeRWYWyJlGr1kyCG4fcAecpoN5Kv0S6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHfpRGAqhSKj1htHXjvu6tIM6XLtZibIqsKL/z9r7iQ=;
 b=mMDkZpWpUdS3Ykakgw3cjG1C6gKb8e6OSpxu2o6pJXSUB4hzYJaMRj5DBrJPi/9rLNrr+EpIj7iYmvjifjpaZH4VQOPSxxbM7PqJfYOpAZqWtVUeSSFk0VZVEzIyA51ThLPhyXDIf4uJ/2OIBTEft8RWbB9Xy5f0j2xUeSB4PqI=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Gamblin <tgamblin@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3] python3-calver: Add recipe
Thread-Topic: [OE-core][PATCH v3] python3-calver: Add recipe
Thread-Index: AQHZfR3pOPzfo/j5AUeP9yzDg2rwrq9HkAag
Date: Tue, 2 May 2023 22:40:27 +0000
Message-ID: <DB5PR02MB10213E17AFAED21E8AEC49827EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230502174529.2262518-1-tgamblin@baylibre.com>
In-Reply-To: <20230502174529.2262518-1-tgamblin@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS1PR02MB10347:EE_
x-ms-office365-filtering-correlation-id: 63193ee4-5195-4f29-6e27-08db4b5e39ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWzHKADvmfFJJDnW/XHnpLp9C+xiOr0urMMEyL8Dr2v31D9rmrWiulaMxleDUSJ37mkX1pIOS8vHcAR5mBCQ/WUYPNlmd3bQbn9bT6aZ5TuDzEdSRkPbRip2/ylE24b07qlsW7WQnEbTJhAj+h7P47tE2zjq5kDxKnkw39wrenAXxlgRtOh56s5s3JOl+0ZxfqvnAXPmwwMZmvFFAQc88m70gJBGQN2XH+qC3CS8UOuyZmGA1zSx65Krb3y66dGdRls25JeXq5DW5vB5Oaw9ESxNi4q+EnFdlqQc611PPhnwUNN6juaZekRvYKEzGxzA7xKN5FNw8Mn+qIu8hpn7z6kK8RCfgaMudwX0UHOWeVhhtMfmL6rXBF0JwTd+s7f6D8m0OyWS5F1g5mJk8mxXlyf1XnEeD+bmd/CqUZvHPbVsKvqZHM2YzuDG+lRClPPplMMvS7MmEiWh3lQGh7CZ9X8Jtc9/8lIMGDQY5vxJH1oPyQegNrwy8wc5xBw5+7aEFgeorivt5P9V1zgBil0D2A0pHT815aHTtcPszV5zyLVCDQzqp0Ks5grRpFnc93DQXi10UVGuVLkgmiuDKoT2zg1gtkUEhSg5IlOND12aUgg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(66476007)(2906002)(5660300002)(316002)(64756008)(76116006)(55016003)(41300700001)(8676002)(44832011)(66946007)(8936002)(52536014)(66556008)(66446008)(110136005)(7696005)(478600001)(71200400001)(53546011)(26005)(9686003)(83380400001)(186003)(33656002)(122000001)(6506007)(86362001)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P5wsEXdKSwuJCc9FKyUsE2VmyUfN7bu+d2Kylc+kOXzsA6f5K38a4yuilxM4?=
 =?us-ascii?Q?fQfgLK3AyBmMF1igzpviCK2Zl8m+TToMedeRutOmN+Iq/TWNHkebbyeQmVbr?=
 =?us-ascii?Q?XfcMXzWLjhQSli8/DV9OtoCYiSFqwhr9o6XPe3abSpF6gEC88cz8mkM3Xeo4?=
 =?us-ascii?Q?phUHXo/LvGcE4oPfnjTY7Ux+b40mEOyyD079HEAQMhNaoA2cF4zcxU1zyoRZ?=
 =?us-ascii?Q?igSyd10oQgSobmZfz0V623YS/WWfMRKm6t/UrgcjpT8ZDfIpGLC+5suDQQEs?=
 =?us-ascii?Q?6aBGmwpvWIR4v3AKbOx/6n7XaLoYX9SCbNQ06/pjveZibOn08izUHgaONKCB?=
 =?us-ascii?Q?a68QtSuZ9okvxgxKR1GpwNqkkygkrmHQS64eV3UfSE7797yicOBEWgKXTWWT?=
 =?us-ascii?Q?EPEu03Nc1iy+G5DbhGBV4Hdi/CKKnKZNvoG1qAO1JS7pZSj/PZu3n848VOl/?=
 =?us-ascii?Q?Jf3oAtjvdd41WxnStFGMHTphQ6a9ltONw/K2rpSgeQG4fHs9Jkl1q30XPdyZ?=
 =?us-ascii?Q?lyhCmE2xaZZexkNzMavy++Vn6z5LbNqrgVRTd2RNU39IRqQoUPjZ+L1CLLtK?=
 =?us-ascii?Q?qYr5/toEs71gRmkKWBYcNew+927Boge/HGBN0bugeTiRefWGEiSKmN9UWxYo?=
 =?us-ascii?Q?n3or38Rig7RUNbO9kN+a/maGSS25U7in91fINJkbIQy4YBt5rxoTva2VVwYU?=
 =?us-ascii?Q?NYtxZlYuvKbvVnN3FhVxjpYhq7rX4+LJqmNgTKsBvAamvODE6kWDZ54R3vAt?=
 =?us-ascii?Q?wE5Z9GAF37n/jl2kbxCyFRzqR6UisIxZ2yIS4unx/hW9G9j8/UgrtmDzJGce?=
 =?us-ascii?Q?x8u7hot6SE82nXaEVsRdWchBZzcytnrgnSP2h2FSZcohe5yDTE3TCZfC75Qy?=
 =?us-ascii?Q?Wbsv0Uct9M6fRCfMmoQTTDNXKAyoKZWAeZvWkvFscCMFZUKKJofWrLhZ8ZJY?=
 =?us-ascii?Q?E34coI43fJqlF+QPc3bef6Is0TDuK0bmCX3NpZUyWY3sKGkNxm1W8ULSK4PH?=
 =?us-ascii?Q?U7HqW+BPCQvowr8F/blclsuzDC2521GNFmusTZW0/WC3NF4vSxABMqry67oC?=
 =?us-ascii?Q?9uzz4/zd/WYaEjvfxI7g5n/cOXmC4E+ewHtiZ6MybNCP+Mnr3p1dw5gMihAB?=
 =?us-ascii?Q?kTf2aoavC7sN4aMyqJf724oVmRfFnAmFbjTqfThZV52daQu9Im0tWZHrDzQd?=
 =?us-ascii?Q?ClbVtT02QNtd70CDX1pKC7gXZbh5mRwYWGRQgjbgKTr/4y5LHDCXhtRUAXGS?=
 =?us-ascii?Q?bMW+l6dwiRqaf1uzrm986ldmkNH7yI+YZZHatHzTfvFeBQkT49DxECgS/MAE?=
 =?us-ascii?Q?s84pR7LRpR+QtFO5eFBmcvJRH0p2EdufzJxHXnb+VU6kK/UBXpuR1f5N1FE4?=
 =?us-ascii?Q?N82r5iMW29Ppb3TdXSoeDCx4/CNIfhgGGkn3pwMam+2yErmUJxiC5svImThV?=
 =?us-ascii?Q?0SNphX6teTdfRSK6k1DnuCw8cIAdHr6MvXs4D01Me+2lycAairLGruoB1o2c?=
 =?us-ascii?Q?FBLdAoxiSm82Mk0lnQikqB8MmRMklofZD1fTVmr3HIWTnhimZYLaOieYvu50?=
 =?us-ascii?Q?S6YOGgHhAHj1+JOdi9Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63193ee4-5195-4f29-6e27-08db4b5e39ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 22:40:27.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njoxg0StqTCiOzK1ckUjCfvLz2LOCu6303NElXGV7qlwoI5FcRnHSMiVTA6IhoLQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB10347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 22:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180776

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Trevor Gamblin
> Sent: den 2 maj 2023 19:45
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH v3] python3-calver: Add recipe
>=20
> calver is "a setuptools extension for automatically defining your Python
> package version as a calendar version." It is required for
> python3-trove-classifiers (another new recipe), which in turn is
> required for the upgrade of python3-hatchling from 1.13.0 to work.
>=20
> v3 clarifies that the recipe now includes ptests, where v2 didn't make
> this clear and v1 didn't have them at all.

Comments related to the patch versions should go after the "---" below=20
as they will otherwise become part of the commit message, where they=20
typically do not make any sense.

>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26=
.bb
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 2f83132aeb..bd95a13ff6 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -56,6 +56,7 @@ PTESTS_FAST =3D "\
>      popt \
>      python3-atomicwrites \
>      python3-bcrypt \
> +    python3-calver \
>      python3-hypothesis \
>      python3-jinja2 \
>      python3-jsonpointer \
> diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/m=
eta/recipes-devtools/python/python3-calver_2022.6.26.bb
> new file mode 100644
> index 0000000000..32b6cfbd42
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Setuptools extension for CalVer package versions"
> +HOMEPAGE =3D "https://github.com/di/calver"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +SRC_URI =3D " \
> +    git://github.com/di/calver;branch=3Dmaster;protocol=3Dhttps \
> +    file://run-ptest \
> +"
> +SRC_URI[sha256sum] =3D "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d3=
3fd4a52d74894f8b"

This recipe uses Git, and thus should not need a SHA-256 checksum.

> +SRCREV ?=3D "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"

Change `?=3D` to `=3D`.

> +
> +inherit python_setuptools_build_meta ptest
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pretend \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests ${D}${PTEST_PATH}/

Shell code in OE-Core is expected to be tab-indented.

> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.0

//Peter


