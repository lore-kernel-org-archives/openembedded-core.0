Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDE4C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 07:07:20 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.95224.1680592037352570419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 00:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kO1J3D97nFybr3tmgd3zEiA7kL8ZTpdB2rFIKyUuTQVnfz5n3erd/nazKdfhPm7iIS74hR3h+Vcthj0SmBN92Rs9Ewk5KRzEbvhPR8gVXwx0RhpxrtWElHHPv5KVdkvPO/SA6Xe7XwcbfiknIlH7k8kfajuRUcA20PkxUwg6VwxsqbQfjoLwo0ylECCkMUvK/vdc12pUvaRNtDP8C2n6mNQnENUVu9bNk/X065wQlID/TEscFR5aVftFu3KmMfpGDKV8tFN5nfsxhpkwd0tUgTeD+GSgOPEIHDyeaJlFSLIVT+bXTikzREFVGEtYkkTku/mV9UCDc0kYjCW3fZE5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2bLWVbzJFtKdiD4nGGR9Lujl5UEnVyi550gFWYRC/A=;
 b=WXCSn1NaBvnF+XptuXkv8PT5MrQdayXLnIZL4oFBS8hXhVk5ptICk6DuQI95JOKnqmIdPBasyyUKTFBZSjGl4ydnBQO/YKT3SAWNKEa/lEsJa89AItZLVBXCCwsd3ItRdOwzyCWveWXetLFdzj7V7i/rQ2W4MHFhm2FlC5AClw4cKv6MU7jjbz1JLDYiGPss2n0iqsHx/oZplTkI0/ZT5T0gJLWkuVr7pEOMDcUr/kvs7lp2i0LE2eyYRhLaiO3wwsBELYfMp72FBX6A7BLkO0BCcQJmUG3163mCrFcF2rfkvgBjQPOYRjlLfrNybxi++laZH1BDTvBgT0DyR6HUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2bLWVbzJFtKdiD4nGGR9Lujl5UEnVyi550gFWYRC/A=;
 b=cj7M1RQty4IJvXawG1SNUovtgTy/LLj+c2TvY6aHLCuIpAzEVxdSXsxscYTqm1eI9tKFxetdj69YYC6eq/jeRiHTfMLZm/6E12Y4JwSrWHn348ny7wDVXvjWhGc6XIfPqQ0gDw5JbLPI3LOIwPudFVRS9c6qHoI3U8cSSeJREvo=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZY8a5n1BYMPkS6EGOCoicSWisQa8aCjeAgAC0VJ8=
Date: Tue, 4 Apr 2023 07:07:13 +0000
Message-ID: <DB4PR02MB10030EAC0D633CDD131D6642EE2939@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
 <974f5837cdf9f57176e1af6d02c49a5b2cb03db1.camel@linuxfoundation.org>
In-Reply-To: <974f5837cdf9f57176e1af6d02c49a5b2cb03db1.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AM7PR02MB6226:EE_
x-ms-office365-filtering-correlation-id: a7d8b915-2c25-4716-8bf0-08db34db372d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75+TQjBX7OzlNMnsAGWvKd83nYvaq5+8Iw3cQcARVf0YqZb9fJJF9tiZlFV7fh23TPkh9++wRo/znrm72CHXaAdnlO3dzVn5Dk8RyWjDbEwotVo7ykqDc4VYzrNdaggsolt8IpmvkdLhPgN2Q8kSXAzMcjfm8tijr4uW73VWcLs+nZnWpwJqYEPxaGjcSzURM8Z48+RRDRXjcJoA0pC56P6ywNvBV+I1G8PfkumryinoDdt4CGiZ3zv8Jv8oxg/NFI9u69EbPt3AguPZ4ggemC1jvFA85us94d706kuA47Aqfo71E2fSBCwH5wwTpQ2L5uoF87mRsJ7Snezqm49et1dgAf+WBkiNc7ePHIMIcjM/eTBha0esmJvlLKBNpWXnffkhkRZoL0Y8s0alxYDrqCEo8Lh24OBCD/MXrOK8igDyyZMoZoRzG/PqwgzMZeDV/oxC2VDa6tRrQbiNsbCf9uwQ/L5E8KN/1q6/OyVPBURuz0usNcD4T2XGCsEChTHgc4pldawagxboloM9q/m4l1wKjQzOKgwXgAEEsJMmR93jZcW38vulTch1wUC8Se1SI6JdNCD0nGhw1XYU4km0cILjIC7mM0PhWAReoH3AJDU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(451199021)(66476007)(64756008)(66556008)(41300700001)(8676002)(52536014)(66946007)(91956017)(76116006)(66446008)(316002)(8936002)(5660300002)(478600001)(9686003)(7696005)(6506007)(26005)(53546011)(186003)(83380400001)(110136005)(966005)(33656002)(122000001)(86362001)(38100700002)(2906002)(71200400001)(38070700005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?mUiFwMV2nl5TNiYcsym8IqyTYsE/8ay7Pp4IXvkP4rKjYi93BneDFMcrFa?=
 =?iso-8859-2?Q?+VFiEIxkxNR205bse7rF9388feZZ8QuPE2vTUDFIcSWIfrE6/h9+OOYyHH?=
 =?iso-8859-2?Q?EmBXcgwCxs/v/BaQibODHT9IOYsfs+zM78mhUHL044xZ3CtVgv6gE9baCZ?=
 =?iso-8859-2?Q?KMzeukvES/izVXKr5dV3gh1xfK9qh0G6J7hGrh2PfgkMvVEKXrwAH+N4yQ?=
 =?iso-8859-2?Q?IdytLf3RlUW/qN6/FnkifnHnwEV5pboe3FHyYpM74AVvp1QXXlxcDNdC8v?=
 =?iso-8859-2?Q?hDfK9IR9InwPYkpsukILtQVNohfPwOGHnUq6EmE9PK4FJfJhR4BuXrlGAS?=
 =?iso-8859-2?Q?f8u+lnHQF0JRBO5oSrEqDyMhyyCCecfQmGVaLOnPJ9gJfvwZbsG1zSxrGf?=
 =?iso-8859-2?Q?ux+GoYixn8a0xIr7h0F36jSSqvrZjNGd8yBHW6Nt9cI4zgmHqpcNRUAqnf?=
 =?iso-8859-2?Q?lMOH42a2BtI9QPXlrjIXhl6aEvW/XShq4jgsoIxuBtU0zjdxMFgKVwXN8t?=
 =?iso-8859-2?Q?qYS+bC4e4lhyP4l0Xs5d6EDOu4TaMetzz4wgsvWoAD7QAuiupiVmEgs2Kw?=
 =?iso-8859-2?Q?gEOxRDxeGz/8Q3deNQpo7QTAtHLEFNnfklzXbpy6MBUWKArFrXuJlue+NM?=
 =?iso-8859-2?Q?aGQXVXiJfBLw+TVGdWCLVa+Mib9Hx4wpX0f+MoLLSgVFPSb4MEr7TuZUoV?=
 =?iso-8859-2?Q?sakDp0iAYyJsLzDc/5ijQ2N8vrwRBCoKPTlV2ZOb+ZnxCB/QQTAY1qffFt?=
 =?iso-8859-2?Q?HMLaZe5dJkEeL1rWvaXjGB/iAxzmYI25/U7c5gbWPyRjBa692xWuIBslcX?=
 =?iso-8859-2?Q?fuayfp24/pFkbmE1muSHSv9SBTd+6iyVU9l+0D+HINHCJ5+NKw5GRNHdbm?=
 =?iso-8859-2?Q?MZkRHpRI6DHbCOpcWe++04HCIHshqtW4vDPLmebUsLbThMGgkGPjjWIxjX?=
 =?iso-8859-2?Q?9kaXhIInYlQ8wERrQ0jUCDRp5E3CkTo3uldOryYucU5dTUm/KDfxJkDlvT?=
 =?iso-8859-2?Q?zeRVeP303Y8rWMdg/+XAMLx9NmZ/WUZt76CE2gRsh+9/rA4S/E36gfo8d4?=
 =?iso-8859-2?Q?faOHtPVzAINlDHZK67cgJT865GHE4lFZTUc4AjVhrizoAFsg9YJd+l8j+x?=
 =?iso-8859-2?Q?gYvmsJhB6wsy5EVh6/cVSGvB7cA+IJiYGmtpkDChVPLwefqOy9wqo8RlM0?=
 =?iso-8859-2?Q?0CpkeWwCoc1pBYlLeA3RCkW2rMxihOmVCLU+fG4UBOsD2HGNg6UpXrkMzA?=
 =?iso-8859-2?Q?WfOWanT+m3/gi0Pd+u9xUpnpYO9zWOqP2ZUZa35+Kt7xEPbib3FT9OIp6z?=
 =?iso-8859-2?Q?mrfoxSrXitOK2bXHDhHsktT5g8WKpdjngnHtWyaxMeLeG6aoSsXDJq4S4J?=
 =?iso-8859-2?Q?SM/xZblndZGED5zmDUZiDR0AUZvOjJ7C87eW0uorgXD31aHih5AeIYgTVS?=
 =?iso-8859-2?Q?SlUdccVT3OMxbDyBro+kL4bZs2K1Qvv1IhFlt8rRydsYUhBVZzg7XyDmZy?=
 =?iso-8859-2?Q?jsBS9trc+P5o4zszVgb52LsIXKNX6eIXfz+K8faiax85cs9iZAZ9elSwTW?=
 =?iso-8859-2?Q?hp+XEryB+Sd/Z2toRO4X5NoJKaITfcgIWN9jTOOisCm1rXpBzh9lGEpy+0?=
 =?iso-8859-2?Q?+q4KuH28tr6Y0=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d8b915-2c25-4716-8bf0-08db34db372d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 07:07:13.1016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5hjt7q3OiUYlRRSrfvytDTGWvRbgOh4nedy10euWWJaMiFYeCnjMKUDEggdBdSU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179673

Yes, that's the problem.=0A=
=0A=
I realized `bitbake -k world` cannot succeed for the x32 architecture so I =
didn't know how to test it. Now I see I should have executed `bitbake core-=
image-minimal core-image-sato -k`. I will send the patch once this command =
passes on my side.=0A=
=0A=
Best Regards,=0A=
Petr=0A=
=0A=
________________________________________=0A=
From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Monday, April 3, 2023 10:14 PM=0A=
To: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce depend=
encies=0A=
=0A=
On Fri, 2023-03-31 at 13:46 +0200, Petr Kubiz=F2=E1k wrote:=0A=
> When GI_DATA_ENABLED is 'False' (e.g. because=0A=
> 'gobject-introspection-data' is not in DISTRO_FEATURES),=0A=
> gobject-introspection, gobject-introspection-native and qemu-native=0A=
> should not be added to DEPENDS. This is to reduce dependency chain=0A=
> when g-i is disabled.=0A=
>=0A=
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>=0A=
> ---=0A=
>  meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----=0A=
>  1 file changed, 7 insertions(+), 5 deletions(-)=0A=
>=0A=
> diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/cla=
sses-recipe/gobject-introspection.bbclass=0A=
> index 0c7b7d200a..98edb93761 100644=0A=
> --- a/meta/classes-recipe/gobject-introspection.bbclass=0A=
> +++ b/meta/classes-recipe/gobject-introspection.bbclass=0A=
> @@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '${G=
IRMESONBUILD}'][d.getVar('G=0A=
>=0A=
>  # Generating introspection data depends on a combination of native and t=
arget=0A=
>  # introspection tools, and qemu to run the target tools.=0A=
> -DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native"=0A=
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection gobject-introspection-native qemu-native',=
 '', d)}"=0A=
>=0A=
>  # Even though introspection is disabled on -native, gobject-introspectio=
n package is still=0A=
>  # needed for m4 macros.=0A=
> @@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk =3D " gobject-introspe=
ction-native"=0A=
>  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"=0A=
>=0A=
>  do_configure:prepend:class-target () {=0A=
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet=
=0A=
> -    # have our fixes=0A=
> -    mkdir -p ${S}/m4=0A=
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4=
=0A=
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"=
 =3D "1" ] ; then=0A=
> +        # introspection.m4 pre-packaged with upstream tarballs does not =
yet=0A=
> +        # have our fixes=0A=
> +        mkdir -p ${S}/m4=0A=
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S=
}/m4=0A=
> +    fi=0A=
>  }=0A=
=0A=
Automated testing picked up this issue:=0A=
=0A=
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6802=0A=
=0A=
which looks like a missing glib2.0-native dependency for vte?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=

