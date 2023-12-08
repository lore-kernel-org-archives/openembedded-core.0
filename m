Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37944C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 23:36:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.26619.1702078560980797288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 15:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=gLGPhcSt;
 spf=pass (domain: axis.com, ip: 40.107.22.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKdL9Eoak6iZJEUEEMK9h8/3/NcpsttbZJ8RzUVOsnl1Y9xWun+ds0cbC+cWjwaroe2ygDBzIJBuosOqfTj1JdV9RIrLeornJCeikzzLS243tz7Aaxc4W6nO9j2/3ZfLgKwsYl9t8veBNEWC/GijFG2YGczbd7A/fkJOccz7+aEMOR4eZ6AQnOrt5/N01W5Yl34iqks9UwG8V7T2ioVnyKzs4dk8LFr+gIHnDHcNpreI7kykS0yh8OrmtpYO04JEplA9eHqAHL6kPANXBASZIKUoqylAxksBjmThCZniciFtwfugnRPTigbrr2isv9GbrmgDqlN07rbaji7WxAsPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFij9zugaeKZAkUBLVseqhqbxIStWugX1kRNUq9JIEU=;
 b=etjFOi8KdGk1dOQwpj58SSLFvvAJPXoXER4Js1/kRjbJgTY+LloIjn2TT9bHnP5hISP+J+7XHs0dZh6C6KOsL+IUENAUHS6EXmbU8+fLGevnFnU7oqa89zTSXGxSQS88zwNmK1xzKJuzEA/keHgNEGejohQVJ3Wy8bWgXmUGAbl/Un0Zu4uTL08Skc6Qmhzmi7l59xSHQekgMt4gl1I4uejPJQzrKBV1cQYX6+1nw4LYwv4A33NqyChNvY2ffustXnG87UsHW7tp//TDwmO8V1FKYFNSR4MmiT2qR6jJksECg+10gXRKnFsgtUZsEpFl2JXTtYxt7QCNR2hafHSgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFij9zugaeKZAkUBLVseqhqbxIStWugX1kRNUq9JIEU=;
 b=gLGPhcStaGtl9U1B/h08jGhtwfEVH1O4OX//0kx0Tb7VVoEYm66KkRqI4sgP100x69UEmV4BcAfLk7rDyVrrjd9ZMGmEQKtTacJFwCIMHJ/MmnY+71U9h3Yk5zr8yP3vBwElZ/itQ/1KA3qd3Y0cjh57kDrEJlAsHtE1o+39U90=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB6907.eurprd02.prod.outlook.com (2603:10a6:10:229::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29; Fri, 8 Dec
 2023 23:35:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 23:35:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/5] base-files: update dirs1777 and volatiles
 according to VOLATILE_TMP_DIR
Thread-Topic: [OE-core] [PATCH 2/5] base-files: update dirs1777 and volatiles
 according to VOLATILE_TMP_DIR
Thread-Index: AQHaKb819cbcBBs6TE6sfLi6OmR1yLCgCkwA
Date: Fri, 8 Dec 2023 23:35:57 +0000
Message-ID: 
 <DB5PR02MB102131828BB5FA88EF7D86B59EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231208101253.4042712-1-changqing.li@windriver.com>
 <20231208101253.4042712-4-changqing.li@windriver.com>
In-Reply-To: <20231208101253.4042712-4-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB6907:EE_
x-ms-office365-filtering-correlation-id: d508a223-8e6b-459f-1aa8-08dbf8466da3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pQ3IRT4DGRSkwIxloWtUQv1uCDgO2wQtl4IYsilj6EmCNKAVlqlkCCrbSPYhGx6ARShO4VmRgBXRzUueoEO5ga7R1y7uDnDNe+KA2Z9dfBILBN4sM4Ap4IYuk8iDn4htDnJAQwh06ohFpcQ5tY4APqSd02tal0HWiycRflmAtC1Rka4bmdJS93wmEit2AL7YUiTWgEYr5RvWpe2i9IE9UYTkmb6OcU1Um3GCS6SyYkngGxAIRrGRVzPsdgvVpUuDA4yf7WzU7XxWAugH9XCBKYTso0nXoneHWtG3AejDasq7pjeqBm/oJsfHjRnVlwuWf27P5xphysbJdwPy3mX7uBCuPGFWEnCgooDv3CNv0ga21tfJNMo43N6DH454uGwL12VnKDuA8wgO3uZ3RHvp1foWu89j3jToIjffTAAGQigfYMdBJc4MgAATmeh2WmxRk2ic4BJeKyVyEq/EMYGTMqSH+ItwN7u8H8bT1OSVHVsIJQ8kKcESQ6RGkdBkQx/Es1zY8M+J7Q2rJ7PrLk5QzhtL6E8x9N1l+7aoSuF8rH9AkIz9HPiM5qtE+C6fEOnfsvCZoUyZoPqTYtWsIn+0AqDoH99rbaEEk2tH6AQ+bcWNRrFWbP5j73sDrkT8jK7o
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(316002)(66446008)(64756008)(66556008)(66946007)(66476007)(110136005)(76116006)(7696005)(6506007)(71200400001)(53546011)(86362001)(478600001)(55016003)(26005)(8936002)(8676002)(52536014)(5660300002)(9686003)(44832011)(15650500001)(122000001)(38100700002)(41300700001)(33656002)(2906002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?N75y37h3SKMOfoyOAl9jKABOKjLEfPlEJa95cF5Ym8CGhCZEoQjV45y0PFvw?=
 =?us-ascii?Q?EDSN2SzFRLHJPW1jTwnGipTR4ylyNmQ8zleRaxvufZcdVUl2m1CxKEecb0FY?=
 =?us-ascii?Q?E01pKaZ2f3x3VjEbWsYTmZU8CEab/LvgnZhwzU+5zpMhqHmJBH2xqhfTgjmL?=
 =?us-ascii?Q?lZtmEXEE32md9NAfuqrm/4lndik8/zE3wdjQ7diy1X8SAA+NdypVLSPoakfK?=
 =?us-ascii?Q?hRHXa51gdTHj0FhXn20DbUFpVHBfTfVyFMGzKavm8nxktXp7ZPRXEHBPMBNN?=
 =?us-ascii?Q?OUUZQbQtRmo0hTVWxAAw15NY8mf8nm9VMFJi0nKKEtvED1QyJWvSJCunrCpx?=
 =?us-ascii?Q?U+PaybraqU7QR8/HyS4okH0A+PlYN9Yq1lM56d42dTRL/k3eeuuLGj5uW9hQ?=
 =?us-ascii?Q?ymEy23q1TrvuuuX/p5ygrPWpTwpHisFkaFhgboXuiPNUYgYClk3ur5VjCnQ2?=
 =?us-ascii?Q?87f8AXJ5AGDofsKLt36VTIpCU254Dkeesad72bNjcIJf4cWmbl36hD8IPFsa?=
 =?us-ascii?Q?erxPoIDesEfrbTNcLKAKVapyV53il1ObREoe2PvYC6bDEkimYzRas8z9CYC5?=
 =?us-ascii?Q?li0ddj3oIZQuusC3D89G2sd6KbleN+dSH9KTCfneTpAKeOS1WJ5NDTH0PI6P?=
 =?us-ascii?Q?xfxskOOhVsAwnZuUuzihZNYV7SZ2vqX5/B8kqX2LKJZUp/QwaiE1oiiYg/ft?=
 =?us-ascii?Q?7Pa4g/Uz99ze9G2juB69iFNRQXZx+LcqkG7BRPfAFAK9CP3XwnrhQJv6ib0d?=
 =?us-ascii?Q?6LMYVdhtnF+PP9CXdTWQ7roEbuP5fdfNFeTLnoUxv4GgRwY7kpIUV5fVwGJ0?=
 =?us-ascii?Q?5397i2IXiNx5knr8tZpY8LsfaugI81k7Ayt4myiJGIbqFskIYdnaNAL//iQn?=
 =?us-ascii?Q?d8uF6IrDAiLEdfU8qkThXPT+v39F74n8GLYiv9vaqpbtJ2hYXN5UoZyh6yDm?=
 =?us-ascii?Q?57auXjQ9sFVpMGBD6FgIrGuu2hj0w1qnOIIgFwvjVxeH3fwIKj6b74fMn52N?=
 =?us-ascii?Q?qfRx8zzVWr6yBcdl4EvaYiZsAbrXm2P48RZ1kBAZkiBinrqdvHMhmzk3IHql?=
 =?us-ascii?Q?u+wH+fTQUhic2+rm4GnmuY/tON66mySGHMSyvw+ONwEsZ5uFrASn11aCYt9s?=
 =?us-ascii?Q?kR2PFSgPi9mUV4nHbcnlwOpH8iCRdUgtKWnRX4Xl49YTgXCSjgo1llrC2AVw?=
 =?us-ascii?Q?O33rP2r+RhDP3m3OkmeFNYPu2Lddk5n1dzBugJKu77ab0l3SxrTPo+X5xKN4?=
 =?us-ascii?Q?ZKaiC/gc3xMv1QFVSGEJsxf1h6iof6O7ibIbo4aAHIAbSJDnpkMFoK+sVj3x?=
 =?us-ascii?Q?nFlqAuNBUsfeEzWt8BIoHZmPQU/TiRhXM8f8BPNLwiUp8G5e+RP2Kcy1LW5c?=
 =?us-ascii?Q?nuc5nMKGoSwynuZhO/tWS8tqG2wHCTKC4ZykrCAwp7fv7VyCGRbZpxbnYkmZ?=
 =?us-ascii?Q?EUb5BVIih7YeTOPm2nFFNOlI0L5OvodIcw7+/30stwOjmLzVPiIY4WpUysXa?=
 =?us-ascii?Q?1DKOsiUKklXB//21SVhnMrX4LCmXjThFL4V45OGdDNe+Y8vkpNeRLb8OXOOn?=
 =?us-ascii?Q?3YHUNif5DMU55x2+Cu0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d508a223-8e6b-459f-1aa8-08dbf8466da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 23:35:57.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u49zqWIFOqcwRan2uDQhQShZ1g3Czpd2YTEUfy98/PcFvnZp7TZeqCDBNgWvqAWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 23:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192086

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li
> Sent: den 8 december 2023 11:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/5] base-files: update dirs1777 and volatiles =
according to VOLATILE_TMP_DIR
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> * update dirs1777 so that only create /var/volatiles/tmp when
> VOLATILE_TMP_DIR set to yes, create /var/tmp when VOLATILE_TMP_DIR set
> to no
>=20
> * update volatiles so that only symlink /var/tmp to /var/volatiles/tmp
> when VOLATILE_TMP_DIR set to yes
>=20
> * mount /tmp as tmpfs fs when VOLATILE_TMP_DIR set to no and init
> manager is sysvinit
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 9fab53ce63..01d076369d 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -30,7 +30,7 @@ S =3D "${WORKDIR}"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>=20
>  docdir:append =3D "/${P}"
> -dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
> +dirs1777 =3D "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('=
${VOLATILE_TMP_DIR}') else ''}tmp"
>  dirs2775 =3D ""
>  dirs555 =3D "/sys /proc"
>  dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> @@ -54,7 +54,8 @@ dirs755-lsb =3D "/srv  \
>                 ${prefix}/lib/locale"
>  dirs2775-lsb =3D "/var/mail"
>=20
> -volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else =
''} tmp"
> +volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else =
''} \
> +             ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''=
}"
>  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>               ${sysconfdir}/issue /${sysconfdir}/issue.net \
>               ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
> @@ -122,6 +123,9 @@ do_install () {
>  	fi
>=20
>  	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
> +    if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } =3D False ] && ${=
@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)} ;then
> +        echo "tmpfs   /tmp  tmpfs mode=3D1777,strictatime,nosuid,nodev,s=
ize=3D50%,nr_inodes=3D1m   0  0" >> ${D}${sysconfdir}/fstab
> +    fi

Inconsistent indentation. Please use tabs to indent shell code in=20
recipes in OE-Core. This also applies to patches 4 and 5 in this series.

>  	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>  	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
>          sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
> --
> 2.25.1

//Peter


