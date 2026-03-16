Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424C1F46452
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:21:11 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48024.1773660066543708769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=IJVmqBux;
 spf=pass (domain: axis.com, ip: 52.101.84.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTFqx53jJnAZNttVCp/qWtwBBT9bPrTLpQYh8+jAhh3JkF0A031pkXdonwOo0/i9gRedmS/JUudUJ0zoTfn/yRKPUb2FGZYBp3C6NrQOcTso6TXa+c1O3n6ASpyui3LHlCCyiZ42i7xNJ2TN8wIMSUqL4TPFHlmh5hRkYSeqS9JzxOe5tlt/huoT3BGIut7KZxtyj/zxtN+OSqCvPhzPrpRe/d1AP9SolLRU/7V3CJqrF3NeSgArpFEvCyA7A9T+Ob8DioV4PnUh3CBWZtgPCVEcDFi1k3ltc0Zoa+kLvAtrOLI6xo3GTOo5tIS+cPXSgFYxgOVM9AW7/tXPUDRr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5UoOpnPKa/e8doW/dbMlXkQE+McSue0lxeP417AhVE=;
 b=kWys2pA5/va1OvEREbcMIidxPT4plXXb2Io2vXzDKSVJKyMyyT+qSOOEiqA6pdOGvahHpopGIe8rt8CfJgDNiBfPG0tF+06ys+hn5Ci5wh9rmmRHZ6V2AF8ymaD7r9i+fUcERMpc1zgPmyXZbsSWz2NZ/1khTdeIqJSak+DhnmDu8xyDMyqszXI1RdHCDJgSSU8cZQHcNTALjeMuaSo84yadboGOx9roXGV/TC1Um108DPSsAMRu6pn3SNhptg2YMQf3UPZ+cc3462k9AnNwt4AXyTOYPg7Dg6RbeGh7YHzmLX93SMtq2j1kwhRhQZt5EUhctJi8qn4us2yyORG9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5UoOpnPKa/e8doW/dbMlXkQE+McSue0lxeP417AhVE=;
 b=IJVmqBuxbY23iEYlyZd0JcoKrNBc+jFCilZUXRBm32wGuUPB5EKsfaa9EyA/6GwdvvEFsDfsXbYufZeIw14eQel9JUhXGgj5nO1+YK4P1O27Bf/Hxz/jYhate4QrtKrE8DI+gjVyELXJHQBIHmmzFTtg2/3leEpnYI4ojRpRzM4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PPFEACE89EBF.eurprd02.prod.outlook.com (2603:10a6:20f:fff1::822) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 11:21:01 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 11:21:01 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
Thread-Topic: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
Thread-Index: AQHcs50kBh1WHvRh9EeNNO1NUSlroLWxBQYA
Date: Mon, 16 Mar 2026 11:21:01 +0000
Message-ID: 
 <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PPFEACE89EBF:EE_
x-ms-office365-filtering-correlation-id: f1de594c-22a6-4848-b77c-08de834e1b05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 N64k3W5RHOuVMbgTyYX8xlM08MhPWGsuHpDeFHK5PNQYdJTvSSTPus4HNYeE3rrcu9RIaA0vuhIU0kwiLZbA26xLq9bG5DLACol102nJQqDC/coBuA3k0zQ6MrL1zuZRuT+rwAQm+PziVUktVKdD2yy6CXXmqK+DyP/Z3Imp+HB3Rs8ZxwnvYYUCBSXE6/MtsVnRdKIitgrtZNOemqPzcgNCyLUXk/gJ8eZemwkJ7T05hO5JyjiH6Pca4Xh/LNiqDE3Rci1mz05rKKYYQ5w0dsLO1jUbSAepbLqh1hvZgQmYGzQCGmlgJ0vYbgLaKGS/1BHGQ0/oABidxgacWQYIK2s0rHaDjJhX9ad/hK83SlW2IjJ5mHR2NJ5TllpE4zj+sqxtJ60XUBBADF2zxUKICdWtPXVqYJfh3KLQckwVnWQ4iIFRAw6Xvmko7UICdo2/gwekKwYpVaIe/0rv3zFBNpX3L9kIu+Dv2Bf1Q6+wB16bxsnt06GlFbSXiKqrQl+caudCkOAlqjiJYRLc8xzMidbkEHS4wY9mShraeJasHtomBkolSH2We6k0HBHA5773SOsu+4l468icdwpZVUSu4SjnvpzwdVCaAyF+2R7e5H6oYzmngHFnsSWWW47uw9ShEjGkySHowAo4y6PLFYkuSIHKiQeZaohsPfk8hPxqwnTDB5tYSob5+4f04L9TXe5gUgJUt9yx0ksA2TpxzhjdTIxcIbY97qOB1NMDWk/D3R6K8VC8Wy5ruNTnbbuy5Adq0HOzcdC6jpIxklJDeOrkM5UvlZeSfP6EXyJE+N4z6RE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JMl5ISHjre4ot0EoNJiI4mGrKJVsYv2mb/agfRmagD2pclpXRq/ua0BqZYP7?=
 =?us-ascii?Q?2v6FxTW5bsK1NC/MD4nACXnleZVXzc1ysMh9XeQkTths8MZ1JOL+MCg5Xxhu?=
 =?us-ascii?Q?bGCmqFAzQRE9GXF2PwevRkCj4HKxuxHnx2MPIR966F6mU5Bfsc5TLL370sS7?=
 =?us-ascii?Q?DtGeKQ+HIXYpjSE41bbbC3/BUxEpJG9mZJBEEBYkjWnf1pkpAUpXsZC71lF2?=
 =?us-ascii?Q?e93UP/g0uq/LXlEwFuBTQ4Y5aHiJIsoT475k/dn/XrUOqHh0eDAT2af/0s+N?=
 =?us-ascii?Q?RVeLLPffhjNdNJYfK2aCuningFH6gCft0Yled+6vUHyyucQzDMuVSS8kGIlQ?=
 =?us-ascii?Q?6a18SSmKbe0W0DgqWt15oIEIATNiKs8U7WAZ1vRibBvBwhlJkXt0eUlyrEdN?=
 =?us-ascii?Q?2O5j+T/vAfAvhzGYS3uoHCiFEmcE2+i1/sP7NILHIj8qwbc0J5UPAZOZuAxA?=
 =?us-ascii?Q?BAAzfw6yYjz88IePjv331LMbrkFqJdX210CuJDZyu7ksZKHYJgwh+yWTh+Ym?=
 =?us-ascii?Q?rDVnR0TsU73YQCBORC/qCXvPRDdavdO+nv1mLXDv/cjBFMLSWlWRaa9pNwlp?=
 =?us-ascii?Q?N/ReEirjgJ3SRYQuXKAVY4je8jRAVWGaS/C5TOdgMiQGsndu5Cb3WryewG1b?=
 =?us-ascii?Q?A2aA7rz2VZCIfc8NA3HdaQExYOfwPO1XlLM9U+gMo4eBEYWfBmZ8Nt2pd9zd?=
 =?us-ascii?Q?8aNEUhMFTD1AjuAxtEjaig/P1+B77c90nuDb9ESlv0MAlxp9jdIsToyn5Nxq?=
 =?us-ascii?Q?RaqXyVIqbPzTm68KSy6g76518LFQ9x7SEZRcJ0DefZuFP30n8/5U1b6NE4ns?=
 =?us-ascii?Q?4pbD+CaoSxBprBDk6aYWtLD6N9vNCP9tliAVOnXOQ9WnFTZicImbl0N3nAdu?=
 =?us-ascii?Q?htSKJ7epIPhKo7aV2f/X3x+wFTMXFOKNotCeUOrUxXpGzXq7LFl+FwlZi2YB?=
 =?us-ascii?Q?XM2zW3qsBe2G0F+ZfY1ryw29EmtvLBhlCor2cZgj5RNT5LLuVeDWuFnvwiJ2?=
 =?us-ascii?Q?IeS6HVE1nN9Kcsmd+Dwm3cTY07reKq6tTAPjmzXpbMG3wivazQBPWRxv66hJ?=
 =?us-ascii?Q?ayoRMqUN6/ZlU3jT27wWMaaYhGyAAgN2xno3AurA+thGYFgVcB6qlAOHWhrJ?=
 =?us-ascii?Q?ll2s2oGmwUswXRMIaZT50slJee3UEGK7I/eu8GK8jMYvIFNIaA4oFitm0SGx?=
 =?us-ascii?Q?KD86gSpMCIVbraHuSpAlLsll2Z+BG4e1knUW1XbaYVEuKQ0pYJ+f3jISFaZe?=
 =?us-ascii?Q?10mdJ2wsQwr7ESv+7Zh9V4h3QPbcEFfvmr5ODVf0S2nHHhqQETNbyrU3g+rx?=
 =?us-ascii?Q?5Wc1JisvuJHDAAZ6B+invhY5TBKHTrTLyfBnpMnQkWv7ieSUD7Xk4jbLuJDK?=
 =?us-ascii?Q?dkqzXhFMls6rMpHmUXWXo9kUm3GVmqBNDshfUC0C5t2QT/JN1/q+OI0BRSye?=
 =?us-ascii?Q?fzhfweA/bT3ntzBMl1wRIDjNirC+sBeO2De+oTiEs/7bdAyoroGdAq3i6YS2?=
 =?us-ascii?Q?5p4j2zmg0/ft2/4nun5GXW/tgQ1H6+crzYLYPhjXFpWt74w+0YcHKGikIrNo?=
 =?us-ascii?Q?6zs/qsJxguSoMnaQ9dwfQaeXvNT8pbdMPg0s77vAUDT/WeDpfXtpCU3vZ7hB?=
 =?us-ascii?Q?p5wdduchy0tavBdxamEfrscXqLNo3+BQPvpn/9RSOU7wJOukTNRZcg+oJvAv?=
 =?us-ascii?Q?ohGo5mUUWZllMAF5fA2ZXoMBC7Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1de594c-22a6-4848-b77c-08de834e1b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 11:21:01.7177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oT/2Hb8F4ngekRQf7cG/QwerWomdM+M6bEmik0E+MHKWtbdgSPNp/3IZ3VPIfIR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFEACE89EBF
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233247

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie via lists.openembedded.org
> Sent: den 14 mars 2026 11:27
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package archi=
tectures into layer.conf settings
>=20
> Other layers need to be able to add dummy recipes. To do this add
> DUMMY_PACKAGE_ARCHS_SDK and DUMMY_PACKAGE_ARCHS_TARGET in layer.conf
> which can be used to add these to the right places in the code.
>=20
> Don't add the variables to task signatures as these only matter in the
> context of constructed images and not the recipes.
>=20
> d-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sstate.bbclass | 7 +++----
>  meta/conf/layer.conf               | 3 +++
>  meta/lib/oe/sstatesig.py           | 9 +++------
>  3 files changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index a7c3f5332a2..fe70a976869 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -86,14 +86,13 @@ SSTATE_ARCHS =3D " \
>      ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
>      ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
>      ${SDK_ARCH}-${SDKPKGSUFFIX} \
> -    buildtools-dummy-${SDKPKGSUFFIX} \
> -    sdk-provides-dummy-target \
> -    sdk-provides-dummy-${SDKPKGSUFFIX} \
> +    ${DUMMY_PACKAGE_ARCHS_SDK} \
> +    ${DUMMY_PACKAGE_ARCHS_TARGET} \
>      allarch \
>      ${SSTATE_ARCHS_TUNEPKG} \
>      ${PACKAGE_EXTRA_ARCHS} \
>      ${MACHINE_ARCH}"
> -SSTATE_ARCHS[vardepsexclude] =3D "ORIGNATIVELSBSTRING"
> +SSTATE_ARCHS[vardepsexclude] =3D "ORIGNATIVELSBSTRING DUMMY_PACKAGE_ARCH=
S_SDK DUMMY_PACKAGE_ARCHS_TARGET"
>=20
>  SSTATECREATEFUNCS +=3D "sstate_hardcode_path"
>  SSTATECREATEFUNCS[vardeps] =3D "SSTATE_SCAN_FILES"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index ba25ca30296..4794e660aed 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -133,6 +133,9 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
>  # dependency in the recipe.
>  SSTATE_EXCLUDEDEPS_SYSROOT +=3D ".*->autoconf-archive-native"
>=20
> +DUMMY_PACKAGE_ARCHS_SDK =3D "buildtools-dummy-${SDKPKGSUFFIX} sdk-provid=
es-dummy-${SDKPKGSUFFIX}"
> +DUMMY_PACKAGE_ARCHS_TARGET =3D "sdk-provides-dummy-target"

Wouldn't it be more appropriate to use +=3D for these two?
Otherwise one will have to use :append to add to them in other layers.

> +
>  # We need to keep bitbake tools in PATH
>  # Avoid empty path entries
>  BITBAKEPATH :=3D "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bi=
tbake'))}"
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 86d159ed209..cae12eb8781 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -494,7 +494,7 @@ def sstate_get_manifest_filename(task, d):
>          d2.setVar("SSTATE_PKGARCH", extrainf)
>      return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
>=20
> -@bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES",=
 "PACKAGE_EXTRA_ARCHS")
> +@bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES",=
 "PACKAGE_EXTRA_ARCHS", "DUMMY_PACKAGE_ARCHS_SDK", "DUMMY_PACKAGE_ARCHS_TAR=
GET")
>  def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache=
):
>      d2 =3D d
>      variant =3D ''
> @@ -513,10 +513,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskna=
me, d, multilibcache):
>      if taskdata.endswith("-native"):
>          pkgarchs =3D ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTR=
ING}"]
>      elif taskdata.startswith("nativesdk-") or "-cross-canadian" in taskd=
ata:
> -        pkgarchs =3D ["${SDK_ARCH}-${SDKPKGSUFFIX}",
> -                    "allarch",
> -                    "buildtools-dummy-${SDKPKGSUFFIX}",
> -                    "sdk-provides-dummy-${SDKPKGSUFFIX}"]
> +        pkgarchs =3D ["${SDK_ARCH}-${SDKPKGSUFFIX}", "allarch", (d.getVa=
r("DUMMY_PACKAGE_ARCHS_SDK") or "").split()]
>      elif "-cross-" in taskdata:
>          pkgarchs =3D ["${BUILD_ARCH}"]
>      elif "-crosssdk" in taskdata:
> @@ -525,7 +522,7 @@ def find_sstate_manifest(taskdata, taskdata2, tasknam=
e, d, multilibcache):
>          pkgarchs =3D ['${MACHINE_ARCH}']
>          pkgarchs =3D pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_A=
RCHS").split()))
>          pkgarchs.append('allarch')
> -        pkgarchs.append('sdk-provides-dummy-target')
> +        pkgarchs.extend((d.getVar("DUMMY_PACKAGE_ARCHS_TARGET") or "").s=
plit() )
>          pkgarchs.append('${SDK_ARCH}-${SDKPKGSUFFIX}')
>=20
>      searched_manifests =3D []

//Peter


