Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47D3C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 07:12:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web11.26163.1701241914722984059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 23:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yDBNZJ5f;
 spf=pass (domain: siemens.com, ip: 40.107.21.84, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuxITFAjhA4ArM2JnQS+oC/H3FlTmYSYqBzurTGsH/ByhYKqpGXG8to29g8c/3+tB4YARekvxoAPMXTD02/1l5HCdj8UJS+5gekEn6W5OICjtjQHjYM3bzW2DWuzLAi/zX046312Vxmotcl1n3yNeS21NixbkpL0UfeMo8EOPrxXEhj0Gc53wz59A3eaqrWRD9yyxQ81rCYNAvzWK09BmWPePCWEne0Xfr6/Mh9dYvuHiI7mLu7GVEqBWeNoAO2uT3noB7RtVykdz72kcBGqimBbBNeNzw8UST/spry2nS/c/6ZVvcjp+WKgcoB6Iq1xBib2O8dfrKWpvhNulyzR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EROP9NseYkxvutwqODUHsOl0okKWLqmcCwxM2IWH4Y=;
 b=XTKyQal8pnt6ZAFbCmajR2wQ96PCKM4l2b+WHJzyDktzfJ/blfU+ZfIm4a+ET6JNPgjtLHLpSPxFj4mlKLdpW5xcgBaRNOKhz7UB++F/NMoGUx5/8uaaSpgAsYPIvJgS+Z2lrjZYSfG4MMmK9gPzKYB10WV0ao0mYLBg/DZPlhI1c7kC//jf+vKqkVFxbhVQ7rALb5QPuffI4pMJChP6l2NDwLZ9RqCbosBwEBxdwu+aINrn/8od8eFI+YTYVLVLsNGsg6uWV/vjokzW4LZDGE13S3cIJrn3sGrYH/q/nIuWaxggg28OZbA/FT7r7dRhbgvdHpEn2JArHDagU2zY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EROP9NseYkxvutwqODUHsOl0okKWLqmcCwxM2IWH4Y=;
 b=yDBNZJ5f9zxHcjJVrzjvKSMP2PeroTHO6K5KxAKA5xQ26yLA3EQcmtJxieLlwbkvzp4iuB+fT9v7URjvWbcI9iEDAcwp5dcf9UBaCodSxCw9A+ZwfhedGCFA8eSB9YSmO0pTraq3aE83PHYS0qfbWmyNAUNSn1lmxjs/ngvBZzGO1K4GsW5E2IrM23NrQlwbqj23yWh3bhqrZ76mSms4D65D5kNN5tTKi9FMCJs62CSrLFqJu9GMetOacL1HWvR3LE8L6ZhrKbKPJbSWZdegiAOVKSJ+V2x6BAsnRiK5Pcq7akijzZYvGs79Dw0IMzjQkdLumI5//lLcMGWmX5uGgQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5414.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 07:11:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 07:11:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yocto@pengutronix.de" <yocto@pengutronix.de>, "mfe@pengutronix.de"
	<mfe@pengutronix.de>
Subject: RE: [OE-core] [PATCH] json-c: fix icecc compilation
Thread-Topic: [OE-core] [PATCH] json-c: fix icecc compilation
Thread-Index: AQHaIk0ikJaEWG+Mm06J1AMydwV+JbCQ4RPA
Date: Wed, 29 Nov 2023 07:11:50 +0000
Message-ID: 
 <AS1PR10MB569750733E9544DDFF316DC0FD83A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231128224743.2854095-1-m.felsch@pengutronix.de>
In-Reply-To: <20231128224743.2854095-1-m.felsch@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a1b805ee-07dc-405c-8ab4-72709f20d558;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-29T07:08:22Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5414:EE_
x-ms-office365-filtering-correlation-id: 9ec7bf78-b600-497f-096e-08dbf0aa7546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VwLsNPDAKmD5P7FSwpwGWb4QLWpQRSmGY1smw97Tm/JG1GDatnb89mqvyZboPdmrDpSY2ufZVkxi57Bx6BGZJDGGfveYlhgzuwa2lQkAxJjEBEx0zUlQzQ+qwWJK5932piEyGaQpAzT9A7SFzowGqLJ0i+xHfqP6IIbGTFNSHiRny9BZvxJ9SdCMWvAJC5IOL+382NNBGhHV25iVwMusiwaPo58duKyFE7Aq14TGvY6DshdImG5xAmUbn1hpMz8Gmzbnk5x6/QxPo8v51TMzzTwMl1EkSaDRJrC5w2AdAttsqyxRAq2KZJkPoWARbTeXGpF91RFS3OH7c4Umd6RaWzy3SjmUUggtA1irGVBTgd3tgP5g0qg4gErKulGS1RjsNZsGSzfOmMXsf5ZUN1Am/6M9Of8VOIOT9EHDmFfGEgKjH216TUS83RwLsfwkDwZOZzZoEiG8CYExJN8Z25bdX7y0HEhVqndmC7T9CeXIvinA+usLknHd0eGqkzNkFu1baz9JW2tfqJz58cogTJf9ta6zLO+kwfnYXn/EHfVLSkYmmxdr96e29UCNGu2yHy7tFKkjDd8MnbtubGLbRqECKEW6c49ZzK+UqXIZzC+pjWz5IO4Qkn5XgLE82dak/9oV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66556008)(54906003)(316002)(52536014)(66446008)(8936002)(8676002)(64756008)(4326008)(66946007)(478600001)(110136005)(76116006)(86362001)(5660300002)(41300700001)(2906002)(33656002)(122000001)(38100700002)(26005)(7696005)(6506007)(71200400001)(9686003)(53546011)(83380400001)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nhNm0OxlFuwBMJ3PjEF16K9eFm+hemx8GFaamfsju69R6jUqxHE+rhnW6mlE?=
 =?us-ascii?Q?NIOEkqOkzY030sNBa8XPF+UeSZOU6VYFMTN4FNIRunDHMfzuAFYI2j+c07mk?=
 =?us-ascii?Q?5si2wJtwBB4v8JC5Cpo6CVq0HWlkkEdBEVdDzE1hbGVEucCmpYqQiXWJ/VTj?=
 =?us-ascii?Q?WU05OE/CN/v1hvec75DhWdbzSp34U7tsNZ6vXJ6LOieXZlZTYfcwVzLYqD+u?=
 =?us-ascii?Q?dyQz3F0ELB5id06Via+bG39EFvpj8IIQ1+qNDuQRIW6L3GzBeFzejbJDsTC1?=
 =?us-ascii?Q?yqHS2P/tWUOA+JBsA6YW6VpX+oeISfRAwbzN1xK4cSStoDx+J4cGjeuywmxT?=
 =?us-ascii?Q?ndRrim5SoBAUlUZqUDZtM8KgvO8zwAGDwNYwvPTJofmU98ktxM7E0xUEdIvh?=
 =?us-ascii?Q?lFi1oZGrbzBuuI4pjR0h05cQ4UlXzmLbO9G3IJygt75zJ6CU2FsUEP8XPMdE?=
 =?us-ascii?Q?46J3lyBdVGYQm7S6p4UZJLxGxsc4sm+lqb8v4XXzxGrhA8VjkMwR7IOUC+BR?=
 =?us-ascii?Q?R0VgnR00+UcTdg7qgrYsN/44JcfxTiCmp0tdZGeVrsp6XHwZaivwynYOZB29?=
 =?us-ascii?Q?ma6qAXz7OjJBuqlWW5YeQFRi1Y+EY08oBQJFV2ihSEbgRl61drpkapjypzcC?=
 =?us-ascii?Q?ONawet90dlNWysGyMzqW0GbBGRn+TeBChzKgScLyVLFBQ1RlrH5o9WmXrq5V?=
 =?us-ascii?Q?jJUezKVSLB8bpYcRj8JV/W1DaWp1czsf93Pe6Zs1mkmmjAFBmtxIDMWokbVC?=
 =?us-ascii?Q?FTyUGbmbf4/xRQ5ELfsFylVK5wQZ2Y5gZFsUm5BY/v+eS4bBN7bVVpYThrRg?=
 =?us-ascii?Q?AinROcpqypEQJQZVHXRvKuLUH2UAvjEevOZ9dzwIf3IJdoF+rn2z9rGp5Kh5?=
 =?us-ascii?Q?I0SL2y1x0AhM6VKEwi2Pl4lUgTImjqYQZ2jDN0rHItQSZFwlYrqHIwdQePnN?=
 =?us-ascii?Q?Unrn99KIoiaGFBhecC323bRUp7NngQj7VDgAYLBuSJxwekRBDzMXKUiLxgv2?=
 =?us-ascii?Q?s/oU8whNpbWqzlQQzaarCYZvHcVKQE5XfbQD/ZleDJZ/qRyeGCN5QD8EhNgt?=
 =?us-ascii?Q?f9xIvXMD1o/mivtjP4Eh9TEw5cLubcCBwqkrdf6tTLgcJI0OSDqvsmSrUBIh?=
 =?us-ascii?Q?UkZlk/6dccNXXlzLPqq7w1sWfgQ0Yc7NSSjN3ZDfGKcKpNQ9Yk32nfGFUq7h?=
 =?us-ascii?Q?GaHbCL7KKALNobv1l4gq7KxG6NMVeH/lGtsq4EJrKpMYW0YERwuF+CHFYFeZ?=
 =?us-ascii?Q?wiBxY2Xr0BLdcR+IrodMDdHmNxSdoACRht6SukhwFFqu0lUuwD4WO2XiVCXx?=
 =?us-ascii?Q?xVmRPSVXRpmGOCZlOJEFGkJscjFGiuxXQIdXqg54G6PfGvDSCvZi6Gvy7jy3?=
 =?us-ascii?Q?TDCVNBk/Ku2jmn7TBhcQ3OKFyhb4F26p79s/yADiVg/nb4Dst/2qYHWJMxWA?=
 =?us-ascii?Q?T8MB+cif0fOB0VR0s6BrfXZmUzottg5jKrU3llQcXhSlsBvxNnLJbaKetkxs?=
 =?us-ascii?Q?HBCDH6ksp+Bour1K/Sf2tGFA28CODNePtH4WcUAQjM5etqjjo93tE5SZ1Xoe?=
 =?us-ascii?Q?o5xKTLZPvASl/bnm6U0ZLZ1vurqA5z860CB9sG8X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec7bf78-b600-497f-096e-08dbf0aa7546
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 07:11:50.5148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1y4rQEPZ+ao5nLYOqQetJRld3X6jzmZ//XR6TUmUqLTjlz529hnvlh4v4oZ31rrRgU7OMT5jS6gTL59gXqFPsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 07:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191430

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Marco Felsch via lists.openembedded.org
Sent: Tuesday, November 28, 2023 23:48
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de; mfe@pengutronix.de
Subject: [OE-core] [PATCH] json-c: fix icecc compilation

> Skip -Werror to make it possible to compile this recipe with ICECC else a=
ll fallthrough comments will be removed since we pre-process the files on t=
he host before sending them to the compile nodes which then cause errors be=
cause of default -Werror switch.
>
> Fixes: caf64f85b5c5 ("json-c: update 0.13.1 - > 0.14")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
>
> I'm not familar with the stable material but IMHO this would be somthing =
for kirkstone.

You need to send a separate patch for kirkstone as this one does not apply =
there.

>
> Regards,
>   Marco
>
>  meta/recipes-devtools/json-c/json-c_0.17.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-d=
evtools/json-c/json-c_0.17.bb
> index f4b7a32cea01..20bcece7685d 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.17.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
> @@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-=
\d+"
> =20
>  RPROVIDES:${PN} =3D "libjson"
> =20
> +# Required for ICECC builds
> +EXTRA_OECMAKE =3D "-DDISABLE_WERROR=3DON"

I don't like removing WERROR unconditionally which decreases quality checks=
.
Can we do it only in case ICECC is used?
Something like "${@'-DDISABLE_WERROR=3DON' if bb.data.inherits_class(icecc,=
 d) else ''}"

> +
>  inherit cmake ptest
> =20
>  do_install_ptest() {
--
2.39.2


