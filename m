Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE5CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:14:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web11.28153.1701159240692571547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CzETbgT7;
 spf=pass (domain: siemens.com, ip: 40.107.20.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+o3u3JleyJBYgLHtkdVPsUJIFoJVGtKASQlYvogi6n4y1Ijf4yKxLUIHMOxkm3asXwb4xzOyiT7qZMc2WjLFxitCXeSmoi7umCxdV/c03vmS7xpnXgo0Cw7Vp+fgFx2NjKx7sGwokFKaVgU5qjWWWtzvlornRNm0oVLKEE69ebOD/0nX2oHZ9h7THHpg/ZopOzv7VGoWauoAGI2TiJUSTv8dVT94n3AAz3sBY8CNEqCTQsNAx3uUtkBgcQDABfSXyfV2kJ2llQQ1s/Vg6IcH8mS+TjKa51tMjgaJMMVsqH9lE++wsPzb7Jxg7C/g/OFY3RcxtzWf+uLnvC959R1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSuxLxSJGnWgqKtQQ7Ftfjm327/BBmmoNriLg2qBPh0=;
 b=KJ+yb1wo64xgrJH8/5li4fu9adgQSbkEPBfvoHN7YR3cCms7GAJ1dHAB/tvUgPQ4Vq9gTt47I2SsBk8sVvXMO8eEOq1b/XPXAiP8ymZYJNQhlo8U/4WbP+c+OYoRtvIk9DHZ4G438CouhY0mGOrxiAYEA6nT0YHZuADJAhoE/9cY4IMmBKy8izf4zHQ8ekNYJsyF51qUICIBi3emNu3IFGKtOLyQ04MMjwYxMmR3Dw75l9IzJauzAzIPLx7xAhAnpcesoJBmAtydryXJKck6PSj15qqcpN9EzKvtu8kZHoaZrsTrGwKbjhJvZYhQBFPdjE+ow+N6j4mprC0PvkD2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSuxLxSJGnWgqKtQQ7Ftfjm327/BBmmoNriLg2qBPh0=;
 b=CzETbgT7aAycLR0CGToPICN8dD+K/hjM1gA/oqN7kHReC3uBV/LIV1NNpqZdgCke0eFp4vwUTFlB5RpW7GPU8et3yktBnAkr1ZVWMQyVwxRtE+i4xJ5+i/Q93d/2SY2xQg8qlw2zx4W+EGcrz6LTr/N1iNPys4LzBvGf7qb6+HluJK2vWNc2C0qrx8Y9QUpxjJCp7d3UD+M3F9KkxUbdeTxjcwskfsRIg9FqK6qYEMtptNfb1gLWJe/T/4M9idfD2ZV9UFrannx6PlQLy6j0yqsgOJ82GcrzZS4z99NFkt3lz1uPI+kuMvfjSVXsIFK5lqp+/6TEKzyyo7X4MNIzOA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 08:13:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:13:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Lizhi.Xu@windriver.com" <Lizhi.Xu@windriver.com>,
	"alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
Thread-Topic: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
Thread-Index: AQHaHp6CD9Fv8LQgREaA2+Y7DfjfXbCJr2gtgAVbNoCAAFti0A==
Date: Tue, 28 Nov 2023 08:13:57 +0000
Message-ID: 
 <AS1PR10MB5697DA509EB149355CE69BD4FDBCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAO5Uq5R5JP8FJWVnidjMCxRqiBME6_4rP9V6kqSPwciWkCmUZw@mail.gmail.com>
 <20231128023811.2475084-1-lizhi.xu@windriver.com>
In-Reply-To: <20231128023811.2475084-1-lizhi.xu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e977427e-c011-4826-b1dc-6e9d32946500;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-28T08:05:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6181:EE_
x-ms-office365-filtering-correlation-id: 0f39ab44-711f-4708-5b04-08dbefe9f852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 koNRiZG+wf4Fp3r7N14kHY9uhg46HhYQVAT1MeZCYAG97ahuLKjVMYVMM34hAU/ifqRzIlizM9uZx6/NNNxq5blbtRKIa51Az1CZ8QMSs35r7fRujjQiQ6xpnHzdOzhSp/CixNOcRXuQrmXNjr0gQi/NwlOeQD9zu5+iP2aEDAiOSaIfDh0WyL3W0krb5LiENWEyvFcuQPRFZWn5JyJ+QRAKWx/iAq0zrXK8/8DtsmUuscd1MmCeAfRbZo/j/0zRx/iImYgUfTS4jES5emCjThtwmXUy1M21HpuE9eS8LYgf0SWTQe5+Dufcavq4LYrfUqi61KgUPTffvGHkM/Ol41sUDgtaKvJAXro1jMRwbAmkmTv34xUHuJK8V8HfdX4YSonpWKLepgnd+BXYgV6+89ZoAyj36jzKRDsPhuG9eVPNDFoiHzYdm8wWiV8Js5eOY9m89Kz/0bSgqba1Q7S8E04NIpSEhSAQWsCZQu59awPJ1SKbMwMRGSkWcu84E8YI9febrR1Ak1K/WhAnKQIouHQ6OdOYfm+X3tbjd63cnI4sXgGpw4GgXo+PBwwiN82JGkPBcG3SA0VKc54G4VXSDdzpzyYBX9YR95xJ8I6s5eCr9kzpkmcu0Yxobv9UI73t
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(55016003)(26005)(478600001)(71200400001)(53546011)(6506007)(7696005)(9686003)(122000001)(38100700002)(38070700009)(82960400001)(86362001)(33656002)(2906002)(41300700001)(4326008)(83380400001)(5660300002)(110136005)(76116006)(316002)(64756008)(66446008)(66476007)(66946007)(66556008)(8936002)(52536014)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b6fEsnhFnOdTPIB4ndlkw5enkCqe7hKNiBmt3DG06x/bVtbvnwGyIQK+YoYT?=
 =?us-ascii?Q?w6StKB8/tgBtdZc4zRGsVSPIR7U3UcUL1AcKAvNYbJBFDfs/8m2RhFzEKPdf?=
 =?us-ascii?Q?TPDg4QEm2WP2jUjMmn3BF8cRLXSqvpWD2mT+6+PSYROR77A8a0AYJe5NZBNG?=
 =?us-ascii?Q?pQAcbuUPXEA+FDitSlAyuRPsMf2CZEpjtfAS6K3TjcLddCJxbjQ0jVzYV9iq?=
 =?us-ascii?Q?lTTAEUdj9Y01xJVupA1AN84fyydVQHj+5hBQ/meMsfsuqyRG2XmnIufiZqIF?=
 =?us-ascii?Q?nXsRZQyPk97qKfPmnAwK540gFP3jBp0hksq0vLHVbBd+iwXWRUJCuuTO9bda?=
 =?us-ascii?Q?Hrl43T9fmJ6Da2QuRU+xDLBU5cfMdsKBekLsvC0NWIryhz9gHbrhVu5tPT5Q?=
 =?us-ascii?Q?3E4daOxNusCGdMHor3qU3HHAA0hKlMzUQ0c+nkbSIH1WEcJvkjcIO1nd8EDa?=
 =?us-ascii?Q?As+aP/IUygjGwkV8wUHqcRhToTFCrVmxpFV7zYDSZH1FU3CtVifpdWlrV7gU?=
 =?us-ascii?Q?muNp9Mfe1blLW4qH+jSCvcWCN89ZlJxRUZXnYkmBDGxVi6Q/jOxRYAI1dNtb?=
 =?us-ascii?Q?piDXZAM3de1sXVFXjt4wrCHgwsqJXeyqQTOAN3Cf5j0RCeZrX/CEI3Rij120?=
 =?us-ascii?Q?fXsoWFiDNyqHbWhcCkqYQkU02uQZAOE8sl+gFl+1W8Zq9dQbQlgYH0ikoW9g?=
 =?us-ascii?Q?Oz1yw6gPnuffXojeNk0CePuBsTI7+f8txll19xajm/+TbW4sT3hCIspT5hZD?=
 =?us-ascii?Q?UiggQ1Lg3TEp+MH0Nk2P6HBBPbcjJV8eejG5gsNpZeQs+BdlMTBzsOH01pSt?=
 =?us-ascii?Q?kmO13EnZg8i1vCIe8NsSCbeKTdM3VUvvjnbMU1Z18iPfZCr09RibBm0smeW9?=
 =?us-ascii?Q?NU44/IsEuv4LB7vQJ8sWmbpepO+d5ddsSHhYsbTfE+IKw+jtZ10axRad03ND?=
 =?us-ascii?Q?BOwEpmmRsVBC1HO9+nfo7fp0kP6d8UAzeigThxrQHtkUmfQ6IX0kFqmRBq3K?=
 =?us-ascii?Q?6O1dzBOhEVy3J08Q2VCfit9R/B2YxjBQ57QDT46Nqtu63k6n8QRRmAzsm/n0?=
 =?us-ascii?Q?nId2cIY2PdO315cOtZpDATCqDPrnA1sNqAh+WaPJszmdVaScW04F8I4jWKGb?=
 =?us-ascii?Q?YwdXmvJyDVLxCGHNCsnf7KzLAYCWlaYAF4qzrB1ngxfYw3ynTHEmtEiuf4fh?=
 =?us-ascii?Q?pcjyLEF+6CTdZbvTSIq2Z/BGtB4m3vTbu2/lfAcdXfuQygqQfruAoKKthSp1?=
 =?us-ascii?Q?mXkFVfj7n9f47551Jy6YYl34eSZ8W5zvulgUaCgMStXLIhb5nHjV3PNNHyCC?=
 =?us-ascii?Q?LJPyDwwj/PeUICcXpmtANjVpnYwhUqoPUUw5V1eEa39Q/8rf0fBkO8Nqh/qL?=
 =?us-ascii?Q?ZroLAHt1gpdj7ko0w+9t3xAKESWwNcXZcqOtfV/aVB8EgcVxK62KtQGNqy/x?=
 =?us-ascii?Q?RCOvXuxxxs1Jhw3YN8zRZA1STWfld51K4Uy2E/pOaygNnJIjeDFBbgzp9dv6?=
 =?us-ascii?Q?h8D0KlLFz1t4Lti1HhtzkiclQLBijDD5bTSjjRMomj8iWGsl5a9ii0XvLcf3?=
 =?us-ascii?Q?8uEtYMjvbwbUG2E6Wj/THMJyXAgOv6oWZl6K3FCr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f39ab44-711f-4708-5b04-08dbefe9f852
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 08:13:57.5439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMPcNOCuYwnIJjQVhWHftX2bN8ggY3jBDrTmGNlSf73+PKBdy9vyVBNaXxCU/Q1wakANZrrrCdN/uB8PXyXznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 08:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191345

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Xu, Lizhi via lists.openembedded.org
Sent: Tuesday, November 28, 2023 3:38
To: alex.kiernan@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration

> On Fri, 24 Nov 2023 16:50:04 +0000, Alex Kiernan wrote:
> > > > tzdata.bb by default pulls in all possible timezone data packages=20
> > > > which increases size of the final root filesystem considerably.
> > > > The customer would like to have extra timezones configurable so=20
> > > > that only tzdata-core is chosen by default and rest of the zones ar=
e optional.
> > > > This change would make the fs size a lot smaller.
> > > >
> > > > Comparison of customized package volume before and after:
> > > > When TZ_PACKAGES contains all tzdata packets, the image size of tzd=
ata is 7.4MB.
> > > > The difference in mirror size between the two is 7MB.
> > > >
> > > > When TZ_PACKAGES only retains one tzdata-core, the image size=20
> > > > generated by tzdata is 320KB.
> > > >
> > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > >
> > > I get what you're trying to do, but this looks horrid. How about=20
> > > splitting into multiple packages based on top level directory (plus=20
> > > the few which sit in the top level directory) using a new=20
> > > PACKAGESPLITFUNCS so you don't have to hardcode the list of packages?
> > >
> >=20
> > Foolishly, I didn't actually look at what was in the tzdata recipe=20
> > first and it already splits things... I'm lost, can't you just remove=20
> > things from TZ_PACKAGES to get what you're after?
> To achieve a final reduction in the size of the tzdata package, simply co=
nfiguring TZ_PACKAGES is not enough. It is also necessary to delete the cor=
responding zoneinfo when generating the final package, this requires perfor=
ming the corresponding deletion operation in the do_install() task simultan=
eously, which is too complex for users.=20
>
> Therefore, this patch is provided to simplify the step of reducing packag=
e size.
> After applying this patch, users only need to modify the OP_TZ in tzd.inc=
 to determine which time zones are needed in the final generated package, i=
n order to facilitate customization of the final size of the tzdata package=
.
>
> Thanks,
> Lizhi

This is the wrong way how to achieve smaller rootfs.
If you grep oe-core and meta-oe for tzdata, you'll see that you break thing=
s (e.g. glib-2.0 ptest depends on specific tzdata you're trying to remove).

Yocto has concept of packages and tzdata is good example how to use them.
Just install packages you need instead of generic tzdata package which pull=
s all.
If you need the empty main tzdata package because of its postinst, then jus=
t reduce the list what is pulled here:
RDEPENDS:${PN} =3D "${TZ_PACKAGES}"

Peter


