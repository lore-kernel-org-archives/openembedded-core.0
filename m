Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D60DCCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:00:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.web11.18313.1761220807408189252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=IZtCFper;
 spf=pass (domain: axis.com, ip: 52.101.65.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDlZEWhp7RBGZzhvFcqfS5n8wf3ipPRwt5JTJJozYJy2nrnBHz3bXd5YMi6b8KwD8kVHU8eZxaE5VaMM52cxi1PeCvtJFCk8kDCf5itWk5MG8Q2bW+iYJ2tWsvMN9CPJG0mxGgnMfk+WovHrWJIIop2tJL5zvJsZOtP3SYjAXduqwMahjix/4eaXM755v6r9Byi+mogZ3xv387wbIajzOvZshFvHgT7pQGu5rjZrjAxoZtrKQt5huYlUQS8aLd3LQn+bEYHuA8zuuD1csPybYEmfKp2eT1RLc+YHy98XIRvmpgO0s34LzWPeIHE8/uhXSST0nwJ3KjbdvRKcsiQkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skqQUGFRiC2U+a0y/cGkUbokxcvnrVa/Teq5w+EJfYE=;
 b=RaOrv/T1PYoZQI2yuJH8bTUa5C0Ge1uO88AiIivbZWD7vI4r8v+vjxHgjy+9cuFcAzLc1alJ4NXEHXDmdx3dPcPzh+HHCk+2VGsRcbIWHVW+z95KUe/8O1P+HWZcGltLsxwU756TVwx66G5YCSUAFCiFqVTSluc5rSTxGqCM+539CgIOUVoPFHQND4BqWodj09uD8h8q67vLv7p+V6/bfIZhdTBToT5QvsV9PohX9NLyRVluuauxrjEsamL6rtMr1qi3GsIEYENSnmEYbADvSJHdPSnmPHCzrddcBDCDStpvE/mE9TCUXekQqtsVJB+3BkkNaDNlZWFsNMqzO52q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skqQUGFRiC2U+a0y/cGkUbokxcvnrVa/Teq5w+EJfYE=;
 b=IZtCFperCiZKigL5z6i4jbprVITuF2r9wfzUgP6XyOh2ZaHiwCDigg+9X1nvy78/Zc+JG7NmpLSTivDnaZyuEocBL8IyFqi0SYOW3TqfmOQW9TjHKKKmVkE5uCBvEbNMsYRFNuEM83QokEdd4E46GJhGVXbfE4Z8EjU2RX1B704=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB6754.eurprd02.prod.outlook.com (2603:10a6:20b:2c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:00:04 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:00:04 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for
 native and nativesdk builds
Thread-Topic: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for
 native and nativesdk builds
Thread-Index: AQHcRBEem0HZGAXo8kC2aA8gVgkyALTPn1Xg
Date: Thu, 23 Oct 2025 12:00:04 +0000
Message-ID: 
 <DB5PR02MB10213E4328893EEA9261CDC5BEFF0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB6754:EE_
x-ms-office365-filtering-correlation-id: 45164a42-c04f-4658-3299-08de122bb3c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ZQNFDEwa5k8iiW+2tiFGmlV1Vt8hZ4+TbAtLjmCwjVSYW8msHNsOITnKi5bF?=
 =?us-ascii?Q?AlESShWKwBBjLwHXB48uci3SuhbpwVv12b05v86aTHjpvK/BM5yxZThFBu5/?=
 =?us-ascii?Q?52bcNEzOu9C7felO4wG0a0g6R7U0oomh/dGah0mVG2Kx6m+Bkv+/B/ohgogr?=
 =?us-ascii?Q?6JrZ7qyPBvvvxcKCCk5ewh+pEGTV8B1gOtpK/IUuRw0O2qUBWTv7fwuvvOT+?=
 =?us-ascii?Q?K0f6bX6DoGO5D20ozwjylx9ysvaf/xhLJ4xZprR6/LN/eayDUwdD3SIZs2UM?=
 =?us-ascii?Q?2brd2BcmluPVLtIJHEmfKeI0f+snHpu869NXrmpUHkjht+OcHY0cdY6wESi9?=
 =?us-ascii?Q?rffOWIXMOe7B//Oxw06RGGe2XDp59qH72D70Mumx+xeNGcY1FRw81WcpC3ry?=
 =?us-ascii?Q?5hmezXDEfPpJ8jKSpOjweoWRy+wVlm81+EL9r9friSvuE8PDz6HCHftAqaIf?=
 =?us-ascii?Q?yieLJRzmWCURvtLL5G3jkvN+PqOwuOEP0pKkACxf6YGYr4go+oV1BfiggZWt?=
 =?us-ascii?Q?xj1tgMuA8vlcOLzQwC8D2t8LOmqDesJnC0ChE0VxxVTvgeK/4slw5stthiEX?=
 =?us-ascii?Q?mYkJAhFMuxZPWKh5/4m4vbL6+Gy/gimEW5NiVlMYOgZzVnd2uCCXzMU07Msz?=
 =?us-ascii?Q?X1p9BlPc6trtgVQhHfjUKKCUeO6uitd7jhRvkFwwETQIa/WplTu0IwZKsLWd?=
 =?us-ascii?Q?Gb5P1JX1dEoPhgjMmW4hOty/ZoBN9C+ENCuOpWy69BpomWGoUAf3U0Sbh74u?=
 =?us-ascii?Q?4Rv8gV9Wcd1rgZAo92hzsk7AUpDX2xYJJb5hMmDLNmrbCySp2U505z0382zy?=
 =?us-ascii?Q?Ncq5jwvl0QpnW/22LV99J4rCqWSwGeL0/3lII4WrBlFeYxRtJKuF8j5KSUyw?=
 =?us-ascii?Q?0/NXQKaKA2ASUpgKyMJAUCu4FJDR7jPnt6237wnQWGuPfh5fqokL2JMGujuB?=
 =?us-ascii?Q?C39chfRFKXBT6FAjzZZ3eqzV1zPyrclzR5btIi7qP3qNX/h3BxDXiqx8zqNN?=
 =?us-ascii?Q?9qaMxVNDnD0JcV55lKMrFA2Gc9O391S+/fTK7ZYOfWjdqx7cyxDxK/yKtiId?=
 =?us-ascii?Q?l7PFtHZ/IxSzmq/z3dg8o0a1loGjkrH1udfuEMM+u+3mCQGvvayFDXUkLbez?=
 =?us-ascii?Q?NPviFlChvvkM7E3VaMOsegEvOFqUpwWsPvKLY3ovhlPLb9jAbw//j58pI636?=
 =?us-ascii?Q?t4t6oJinsNoLBetCUPsd6NGfLInb5jZMOGHQRjgu7je1b8Y5itnlPxGR2DgD?=
 =?us-ascii?Q?iH+B8xGt/FnsAtX61rfJe6ED7s+Uqzbic0rJHHopQz4lSz15VsAVTCEfItwz?=
 =?us-ascii?Q?jrP7XPYMXHtiwqi+J79vxhWvYXtyIzvo/5jNdtyNH2DDRtsblfb1+2upEfnd?=
 =?us-ascii?Q?yL9d35qKK/VtIqXqosnGGMTgcXnTVoEQb1NoUjUlCikahrlesOCjz2aVDPkU?=
 =?us-ascii?Q?NiwvsRXOyjYdpPTqHJ/9j8eRRiNzMbcWLYMJV3MYRAhiWjt7qwE+zwIm8D4l?=
 =?us-ascii?Q?2E7ix06qnKIMCmhMX9XdDxp2/tDyXODDbqs/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qfWQj9BOmAfI2CtRbe9oC6wfJv4SUugwVW510L5WAselOpuY3rarc5eGNw4v?=
 =?us-ascii?Q?KpC1zQvc7bfmsWYhBYOXOQQWdA/iCt6BkJr+D/ZOBWj1p2RiQYiTh75aogTG?=
 =?us-ascii?Q?R/IuK4nrN4NwrsFB87Ligk5CHk3F7yrK7xhm2lG/vIVrfF/jtSAFdb8k+7yZ?=
 =?us-ascii?Q?+63DZNQ0M1/maXAV9Um2bN5NQFZjDOXK2nbqaw4iNSNWpdp3cGUbuvhO4AcM?=
 =?us-ascii?Q?MHcWhucMzs66hldHCBwdn/p9KKHiBeq37pKzbTmjXjvWvjTBB/5HPlIsivF3?=
 =?us-ascii?Q?UN/N1YqYGuQ3rZGVitOwAOz7hGqjtuhjg8oEMgdx/lixpx45CwgSIAllVulV?=
 =?us-ascii?Q?StX+eFtWb9iXymxUY4IxI+aUaIrHuiATTA4YOF+N1OCSKJ/ggsM/YllKlwy3?=
 =?us-ascii?Q?oymdqBNtwIQr7HUlu9SCNJcIJUbBHd35fMtgeVSh7FxwSH1q2fUCL+otZ4lX?=
 =?us-ascii?Q?CRE7Ron1XK7to/dfrHea8KUa2wxVmEfnhjapRM7b/Tm+7eZRj+JCDXv41iEI?=
 =?us-ascii?Q?7c3kFEqz9XZ1lVixOji74l7Emb5TJm3Y5U2ARdS6qnm3sEM8aZUe2Tw0avji?=
 =?us-ascii?Q?rbCCLoFi6SgqPxyBc1m8wtAqiGDYnYp+j/0d3A2VjiKuwmmnUH5/JPTx9XBi?=
 =?us-ascii?Q?4q7IRTaNNN8YvFVrhlIlX4MY1o+oaQJf0ASRjE9Yq2s/XRREZjZnf1MHIBuQ?=
 =?us-ascii?Q?UcwqfsG6ULsAOIOZEQH61WaEUjfbY5Rbn183gwNGLkVVXZdUrzvubpSwPvHI?=
 =?us-ascii?Q?qT0Utu6afXJ8KXgmFGGXZy4tMEUE1cuMb+t19RxxeWlNr9BygvdgHM0q5Rom?=
 =?us-ascii?Q?QitSYys1TK3b7t1xLiRO1FxuBOqohGhbv386V2eABAqHx64oKNvdpUFtzs7f?=
 =?us-ascii?Q?TaqDYXeYuQDLsP/z2gMPAdE3ycddT4xOA4uQFN9rtwnYyj+Y85AYyHxdmyev?=
 =?us-ascii?Q?OTfgFE/kL+9n+ofN62awTviWqi4IlweUthB/Qzr8YeVVkSV8ZXfrQt6H9I7O?=
 =?us-ascii?Q?+/5JXqnEYK3tW8R6P6SVD0KvysUgGO9DY84kxC5mo5cyddJXV+WE/EdlUw7M?=
 =?us-ascii?Q?+afyYH0h+VUFMJYiHLNJBPKcXoQyR2JBECUe5LMrk+K39Lp3is1QJNGcRPJL?=
 =?us-ascii?Q?Qj9Al01D/s46Jc43W18yfsXsoyy2NB1yQSNlVSKF3toqB+nVy4P3sYKBTFkX?=
 =?us-ascii?Q?IghHktOT1R5Dp9yYJwKYRYWzc+dEDpeVo8iYUoCPdf1DkiD7xWimJEalMvPl?=
 =?us-ascii?Q?fSDTsiU2d9lCvHB9995z5J/GYx0BSb/idSduUDtRgBD00B/sb1HVYldCsK2/?=
 =?us-ascii?Q?Vmb7aTRu21rMPdezSiqoRDbKf4ZoXsNhshw+YRffNiC1Miy/sMaZpwzjvtyt?=
 =?us-ascii?Q?He5axJvj12GXBV1B36cECcZpwQHK5M5MvxjG5MrKDdaNogNxmpHPJhUcKA44?=
 =?us-ascii?Q?Ao32Hn+N/XRSiUIQrXC7a6yEleI5R6pczOWkPIUtJwBTrzKsb4OI87UQaacQ?=
 =?us-ascii?Q?10k/D20D7bRdF4Um3cJPqUBz/w5SIa/b7jFcoZfni7ZJtBzMoSC6gzd8kA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45164a42-c04f-4658-3299-08de122bb3c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 12:00:04.1885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OthLszC/UYiAHBizqLiYL167GCoImwtDkzYfQSm8fYY+cnY0SBrNtUWjPpk/UfN2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225247

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Varatharajan, Deepesh via lists.openembedded.=
org
> Sent: den 23 oktober 2025 13:35
> To: openembedded-core@lists.openembedded.org
> Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
> Subject: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for nati=
ve and nativesdk builds
>=20
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> The native and nativesdk builds were previously using the '-Og -g' flags
> during debug builds. This resulted in increased disk usage and few linker
> memory issues due to the large debug information generated.
>=20
> Since native and nativesdk components do not require debug symbols,
> update the build flags to use '-O2' instead of '-Og -g' for these builds.
> This reduces build size and avoids memory-related issues during linking.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5406e542db..d8f9f6c312 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -663,7 +663,7 @@ DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
>  SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N DEBUG_BUILD"
>  # compiler flags for native/nativesdk
> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O=
2', d)}"
> +BUILD_OPTIMIZATION =3D '-O2'
>  BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
>=20
>  ##################################################################
> --
> 2.49.0

I am sorry, but I must be missing something. If I enable DEBUG_BUILD for=20
a native recipe, I definitely expect it to be compiled with -Og so I can=20
debug it in gdb.

If what you really want to do is enable debug for all target recipes,=20
then use DEBUG_BUILD:class-target =3D "1" in your local.conf instead.

//Peter


