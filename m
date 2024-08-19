Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C02C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:23:48 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.73])
 by mx.groups.io with SMTP id smtpd.web10.213221.1724081025068569248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Jxqt048E;
 spf=pass (domain: axis.com, ip: 40.107.247.73, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVnU1ZnQqosB2cuQkVCA19J8f8oNuhBo1y/4wJEUeBiEtjXi/v4qmd5MBvTtkJz9C7JTZpxqP6f+qoxUtSV7WL9X6V0sfqrWQTUKZNlIY0g5gxmMadQo9mDIKa34qmxYQxQ1ibMsBpCYLtNSoDYD5mmK8v9ILm3D/JD1+yCz+F1zhq+I6SDZN+/NcH6Rfg3XhpkGy2KNkUpj+hNfO7bohva1zoBI8+scwLNJKob23e9eMw2aa7/QjEv1B9T40CGnIJsAbndZEsUiN6DkikIR9RYBvnjgn9m0GxXJgT0OZDBLu9bfeMjMfHRyV6lDocCuk7vR6AGG1z3glF+Hg2WjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1Si8RCtGtqNKCisjD7CVwn6owSqkcMz4OQiknXTSXQ=;
 b=wv+cSpz87ya03PbWPUwFKgjiDZmoEeIeadRTR81DOphy5yLNKSBwIIpupQRNmQCBdBV9Rq1sR8u/iAjP3et76iItQhESffWXP7KUF01mpjgWMOlZpiHVPe4I82jRz4pallfpmLgl7vku8QdiUvBqfLL4OE2FgHvYMr7UECqxr8arPq28MejXX0nakiIuYHC3M+FzLomi/8Wp/ihiRhjGIfGHOrvJxYKf2dGbHokR3Cpn6o0Eac01mTWzrc0Gi2sAVmuyyn6he2ldZQ0O3hEGjuK0qey3DTmXw+CsTSaukc4TsOKcev4IaaORy4SgFLti2FYOADT3KeUlAPsggxBUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1Si8RCtGtqNKCisjD7CVwn6owSqkcMz4OQiknXTSXQ=;
 b=Jxqt048EQ4epXOZS+yPyLoKpiIgOuEFrNSh30gZCwoS2ISn4gZuv6vPGXs1ETFYtzznvlP0TrOfDF9z/CRuytj3EtqpkpGmbKFlO8AOymA4FoxdhDVLests68ItRtyYf1qmwFAwBMeMqtd5mHdEvlwqzFLFwW2UWRCrbnJ0yOfM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB10274.eurprd02.prod.outlook.com (2603:10a6:20b:645::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 15:23:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 15:23:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
Thread-Topic: [OE-core] [PATCH v4] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
Thread-Index: AQHa8iAlF1kmeai3oUGe++TTJ90VTbIur9JA
Date: Mon, 19 Aug 2024 15:23:41 +0000
Message-ID: 
 <DB5PR02MB102139C44977126DE9EC17914EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240819101025.2254095-1-niko.mauno@vaisala.com>
In-Reply-To: <20240819101025.2254095-1-niko.mauno@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB10274:EE_
x-ms-office365-filtering-correlation-id: 1ca32a94-bcc2-45fa-8fb4-08dcc062e87c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?rva9hW6oTY7TfqQ8qj5gSoNDiDpHiRSHqcmVupCcbLsMtGdvEr5GaApwdZgx?=
 =?us-ascii?Q?VcuC7YMWSJbFEJy1gHivr3Kk0zYkNf6ijhjW24hxDh7M8nND06w+EQtxkqJA?=
 =?us-ascii?Q?eaZQffZPRIsI5TCClaIEAmw2ane7N8ereUFZICflD9BAEQqmyO3KMMEX4f1/?=
 =?us-ascii?Q?PgOqwsWxYvQC7K5FCGHG/GMwso/ctq28ifSDEciJL1zvZyK1Kyk0NXsQUsZQ?=
 =?us-ascii?Q?7ErRG6amvEUK6xf+OmwyV6m3yC5YaDhxSpJ/GozBsGKeSWbiloqoeJUuY85W?=
 =?us-ascii?Q?mw6g4yL2ng9gdq68tMxD3K23I02yiELrBdtB241VGDEArREUy9Ux/9WeBhda?=
 =?us-ascii?Q?XmHIP4N5v+8iMq0yyhNZ9TnnlqHtCls6gkMOx3vG3T+S3d3UeMWgDGNUyk74?=
 =?us-ascii?Q?xLDoSHL45lXz2Yv/N4eut8avCmAdF6T2DZ6044XMexh8a8UcIV5/wv2C61TJ?=
 =?us-ascii?Q?RqEnjE1fB774J1KG7/Lvo2EGDbOzdeYs1kiND4tX7yATk01uVqWcsb95XSSz?=
 =?us-ascii?Q?CFoNPWRT9/hLBcdMjUYWl2NMP/S1ep61ec87WbzcPfmnpbzK6IUEdJLSs4XH?=
 =?us-ascii?Q?CZ+47tymNq4yBPSH9C6qlRX7lLq+0GH4x0Y3TK3Wm1xxPMmyCtCAzkVdqqTz?=
 =?us-ascii?Q?23MNv9+EpEYagO8po0vPMRREaXh0FQBLhtenmBcwUYzVKExGkePiZgxe/ggg?=
 =?us-ascii?Q?u+EQ9VQSrUyDJi1Gbx0wsse8m1cuzA/i29C+r1SGQwgrqCD+CNKjy6F3pR4o?=
 =?us-ascii?Q?8w7y3YZOu5R8mGj6LGCDtf9y2sTinpZpO0/ft/y8aYiw+ZIF2D0BKTwN1Wtw?=
 =?us-ascii?Q?OwUp23suK2pw0DamBsb810XrQyjYwF6JlZgBGQ6PxhlBIRAMDuR4JJhk93Pz?=
 =?us-ascii?Q?3jmsPGWFYn31s6FuwmcUtsDiMeKoUAvWJo8nZKZ/DXMpPy9XO3hrZyCWH9Wd?=
 =?us-ascii?Q?LZN3BC5HPvtoSMQFqORFLub9ft+JUpsaH39nt1zGIAACMJoXCTycVHSd9u2e?=
 =?us-ascii?Q?nTqGBW3u/9HCpjQ5kmeP8S13FtHrwaPRZ4uZcMFG6oMurSV4V3CKhg+QVMjQ?=
 =?us-ascii?Q?HI8cXOWHZ4DEKprkGtSdxxLmv7nluInUv8NOCu6XfsvhhbbNlJNw8dTR/NEq?=
 =?us-ascii?Q?FoDHUdV0cd4HIiugqU17PN9PTNLhw/z4rb0Gq0eW6wQ7+02XCmzowLG2WJom?=
 =?us-ascii?Q?GtXgqfQocSqwL24GofecbwRzQ9I3BmF1MYGKOMPO37qKrNz40F/RwMnU52OD?=
 =?us-ascii?Q?MEMil9TQwxNslYhbWt6jqVjCvUDp24Sfdjl6mIN92hDwcgW0bXjMTdUUw8F7?=
 =?us-ascii?Q?JAlp9ST4qbZaAdOQORNFnhIcFDMQ2zA+nCyFncI7hiWV3t9NbJpb/QTY5nOS?=
 =?us-ascii?Q?OaMUnrOrUI0E+JPeqg0u6qGspFgTlBlWeF+PHT9vY3HbLvVm+w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?74s85uNN+TgqXCwYNRy5mzC5oDtI3ir6ZzvCorkkR+5476kt5N/KJ9SwEUQI?=
 =?us-ascii?Q?Cpmh1KoRB0Z/PnBvYQLPzojZiuXpYc4MHXlgwJ8demEuT/AeKf3oJc00GF/A?=
 =?us-ascii?Q?qpkI7Hyv4E/JfM1ZcJTHqOIM6q1vp35tnghL7OZyde+AEbUrmTle8+aJPfff?=
 =?us-ascii?Q?i2HgikKnSUj5jmP/au3fZwo6tdO0bAR8wuiNI76xC96RDw+8ra+gze4b4VHw?=
 =?us-ascii?Q?RAd0DoSoM+2eJ14MYNvt2B8R2p0eVsVkUyWeKx+/OzHkpg0qMj+hzGVH0rrs?=
 =?us-ascii?Q?Q9GXmvIgy9hGsPHuwHmNjIiEIeb7V3Sc1R1YCGjqmS7TcgohWIvWQezcyaIT?=
 =?us-ascii?Q?4YcPW8gugtVAKdRqcmeqI3fl+iaYwB6GrkAjpDYXojEpQ6VcSutuvoLSCYfe?=
 =?us-ascii?Q?crzAAAEDS0sZ1ppdSzEuuoEH0hjmRCSPBuDCldVHVnQivIKoQjYzLTrOlkC4?=
 =?us-ascii?Q?bZElulZct78PT2GPZtyDLAkxsSH8rFxnylwBgfH9qguUB2SnCBx4QY/LyJ4k?=
 =?us-ascii?Q?2Uk2Hienr/AFrjBnf3VyBfpX2Mw34WK4HXbIKboWgmgyPd9XeEtVQkDSyn6B?=
 =?us-ascii?Q?uRo4WTLu9RVUxJnIRlhMlbZQHjwY+vJ0x4eDztBMc+RGUhC9zlnHLc9vr96f?=
 =?us-ascii?Q?UDOUkwhhZIIebgzfxkydiNiHK9Uj1Dofx7Exxv/sj0c7vg5kfkqvMyYnXkYK?=
 =?us-ascii?Q?2uUZeEowPtxQ6H8XiAB60cH8P/pB3y38SOTZmpNp5lbnsv8rNUiQ7TJ85Jdk?=
 =?us-ascii?Q?RVUwm1EWR18goEYbaR+DT0qvya+cSefSO/kCnPEp0oS3V4ns0W5YgY7b3oPm?=
 =?us-ascii?Q?ZnYjBCfJmhEUKbbdoGCos8fF882uTt+UDAvMatuKV2JoaubSR7W99FVUhnur?=
 =?us-ascii?Q?SjEcnS2g6eGQzXg92QmlzDGU5ZrvVYhHcJ/LxeL0gHA1Eaw7+7aGR6TBueDu?=
 =?us-ascii?Q?rjjSoKeMvvuudFQZktc6m2Y8Q4aSJlk6TDmVlttFyn+wwIJrQgmUD1QxVXQ0?=
 =?us-ascii?Q?REm7sRoU0dj+K4GstrCiYapkUEcAmAa8XsU1rGQcBixLY1uQEQgGW0fCQMmt?=
 =?us-ascii?Q?VEyP7+IsCRq5ugBBBc5ABpY/guRyidOCc+6DtUPRJkNigMmtk+GxEkl05KpD?=
 =?us-ascii?Q?dJuilOYiDhjdnfaw4ARyGRsuUHJbpra7JJObHOR80wfjiSyus7cMCMVz6cDB?=
 =?us-ascii?Q?sWbXN+xcar4e4aP4nWr5yy6LsqvguFkLvFE/4Qg+bLjzrZKsbP1kgCE7hG/O?=
 =?us-ascii?Q?6vNoEHacxF6uOfWoyiuRcqOTKtUGydt4WoxXARM0n1juWvI0mtXE3mbXKzSE?=
 =?us-ascii?Q?ZEgEJRqw1lVz+pMwE5/wUVPhRAMOOuiAPYq+CwB8fKKluwjGPFnwWjhs0flW?=
 =?us-ascii?Q?YZqz7PUPzzqoG5I+PiTyediBNaSzvAkdjxlBwbbpelr0XglHR16FlFVr3Etq?=
 =?us-ascii?Q?oHqjKt7E3k7m5U7PwGzvJRmLP+aDqpaY0vYQYfu1pTyx3A//pOiv0ES3oQ5l?=
 =?us-ascii?Q?/lfNGAPMYRf02u3dEZyOI1wAPVCfKGRgzNKdJZpFpUEu7kFWFM2WPfUyj4zo?=
 =?us-ascii?Q?meDwb89BmSCRF926dMQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca32a94-bcc2-45fa-8fb4-08dcc062e87c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 15:23:41.9454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: si4j8mSG8s56KjH4pqKjCB2RCPukpYTin05AlsQ11OkygSbjrh6XNYr51ldJ7/mG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203515

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Niko Mauno via lists.openembedded.org
> Sent: den 19 augusti 2024 12:10
> To: openembedded-core@lists.openembedded.org
> Cc: Niko Mauno <niko.mauno@vaisala.com>
> Subject: [OE-core] [PATCH v4] util-linux: Add PACKAGECONFIG option to mit=
igate rootfs remount error
>=20

[cut]

> ---
>  meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..0b36df8e1b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--w=
ithout-cryptsetup,cryptsetup"
>  PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>  PACKAGECONFIG[lastlog2] =3D "--enable-liblastlog2,--disable-liblastlog2,=
sqlite3"
> +# Using the new file descriptors based mount kernel API can cause rootfs=
 remount failure with some older kernels.
> +# Of currently supported LTS kernels, the old mount API should be used w=
ith:
> +# - versions prior to 6.6.18 in the 6.6.y series.
> +# - versions prior to 6.1.79 in the 6.1.y series.
> +# - versions till at least 5.15.164 in the 5.15.y series.
> +# - with 5.10.y, 5.4.y and 4.19.y series kernels, libmount seemed to use=
 the old API regardless of this option.
> +PACKAGECONFIG[no-new-mount-api] =3D "--disable-libmount-mountfd-support,=
--enable-libmount-mountfd-support"

Please avoid negative PACKAGECONFIGs. Instead use:

PACKAGECONFIG[new-mount-api] =3D "--enable-libmount-mountfd-support,--disab=
le-libmount-mountfd-support"

and add "new-mount-api" to the default for PACKAGECONFIG.

Also, how long will the "new" in "new-mount-api" be valid, i.e., what=20
happens when the next mount API comes along? It might be better to match=20
the feature name to the configuration option, e.g.:

PACKAGECONFIG[libmount-mountfd-support] =3D "--enable-libmount-mountfd-supp=
ort,--disable-libmount-mountfd-support"

>=20
>  EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS=
}'"
>=20
> --
> 2.39.2

//Peter


