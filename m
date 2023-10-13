Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34061CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:55:39 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web11.34999.1697190929860911753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=XndSxDGr;
 spf=pass (domain: navimatix.de, ip: 40.107.8.40, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXOIRTbu77rpy4u01ep+O/KfBF+xK2sJdDjx2gM7HwRFivZndd+G0cOyi8L2GXMHsr8s7yybsE2YJEFqv42nHrAvJQeBOHB4BoXRT8CBHuwBapMk8SnloNUfnmBoiNQBfKD0IMGtPbrxDvH3jM1tAZ6T4qxxyCYvfjMPiwbrQEgN/maOQCCgK53aJY7YFw5c0oOPJq5Whvd14PYmq/A2amUvWcNTbAWNmC+MPZOrcU66bP/FBuB5ig8NrpZEM4rY1CqvIstLP5y64MMdhwEuDe3YstwmSPi90x9LOZeJGnYLsqtLu2mOfFUQaqEPh5S9ZO/3otZIuhBPfXtMBSsE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Y/YHxboABZP2DE5Gp7C5PlcIgqDmRx9osrm0UwXy4=;
 b=WI3C9f1i8WCKCOjYRy2/gnFDzxy40Sch3q5ddvK+dGRVPE0DY7hHqN0Yqle5E3lbMLTDX0gVggZOE95/FOg3PlB1Iyi5DmlpTZInxfxDea6DGl9gpUM+wNPuWbXpT8z42wm8z4zgzbRr9bISB2ftbonkyTME1Hzu6pB214KuT88lLn/+8ndKazThbmFuwYeAoeASlcxtq0SaoCgl4Z/o1Xhj4ujb2tktbsVVJmGUGq8hECZgkuD4S7ZFhHGSIp8XLZVrTz5nvlu9blQYEz7EVtLJ6oDQ7sMP74GQeVMnpmgbuQmOtr6/AhJ4x7pdf9VI1gXqUnyFIfjjqeQDmdLACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9Y/YHxboABZP2DE5Gp7C5PlcIgqDmRx9osrm0UwXy4=;
 b=XndSxDGrsc4rwEd6MygCAHwGQ/xCZjwn1ZE0IWHpjXUFhNCblHDveUPQ5xcWHa9fHFDXbM9EQZO/duEoHzV09eiy7Kc22c4wvuvmjHJQ5f0InhCJLom0VSzGsjQY9z85IZUlUFkqRYE1nfNYEtvTIb22/Gd8v9L4xfPvy5dmOAw=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DU2PR01MB8847.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fe::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30; Fri, 13 Oct
 2023 09:55:25 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Fri, 13 Oct 2023
 09:55:25 +0000
From: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: Dan McGregor <danismostlikely@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Thread-Index: AQHZ/SoUs5cu4AOz5kq5+rnJ1FDFq7BGY5vLgAAidYCAAPYoUw==
Date: Fri, 13 Oct 2023 09:55:25 +0000
Message-ID: 
 <VI1PR0102MB31364AA647984179332621E5FCD2A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
References: <178D69637BC0FE4A.21112@lists.openembedded.org>
 <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
 <CACS+7ZSSvH5=H0j2EENJ0wYR5p0rsGNEwWLyVYQq-++dfBjuSg@mail.gmail.com>
In-Reply-To: 
 <CACS+7ZSSvH5=H0j2EENJ0wYR5p0rsGNEwWLyVYQq-++dfBjuSg@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|DU2PR01MB8847:EE_
x-ms-office365-filtering-correlation-id: 4f36b498-73ad-4179-1e41-08dbcbd28600
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OrB9+mnCHsiUknU15JS9gO2S+HkIplw2Dcnpv3S8KndLjEeUa3zYe0zwhOLm8QrPrAgdDjBpCAtEXus+mFcIAqiq1EZ0GRBpgoj4/MN0wP6vFG/uidm/dpF9RpVtbnJjUXOQRb90Y+klGGxNUkd65iLUXE4IEOcFec268oo76aEAAUGpyQioMK8R5uGuE84cpch1iB2JQhPJAHfIMumIFk5kjTLNtTIhaylfLSBqkzZt3hT0LG/61dZyAhg/at3GyFgVunEeKOps4D1J0KdvmhL+dur7h5AZMzTJCZS8MyeJf7kaQj7IPplN0Ip35+Fll+aH52XieHdOMZRgoTSyfBQr7GMrGNLD3RJyAL/bdkUzrfmBGkx20eySr0DPKOxEKyGN0Geb0f/CqgTL+qV/iYhDBOZeErftdURJ5T7W/ZWgDjUepYRNOBTuvm9v2d9jsEX5ChGXKzXszqEbFCeO1r9ptrb6Yw9AHXT5Dl14qnEiXfUBT34/qte42PXJumnYsS8SMoD5mPD3tVCrxTrTAswN28aDqaLc/XtQG57ZDp3jw2b6oIGzD2qSecTXNjqKWtthcNX/JBp1YbWddKXFWjS5IaB8dxGHT62jgMWgV7nW0d41guJ9AEkw5rsPTQQf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(7696005)(6506007)(53546011)(478600001)(38100700002)(26005)(55016003)(66574015)(122000001)(52536014)(9686003)(38070700005)(71200400001)(33656002)(86362001)(2906002)(66476007)(41300700001)(8676002)(8936002)(4326008)(5660300002)(64756008)(6916009)(66556008)(91956017)(76116006)(66946007)(66446008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3SIw2RKYSwGHoE7Ue8/7YaWjIGcSuWOMFZOK4tGRCpnL7knwbcjJ0ou3Hd?=
 =?iso-8859-1?Q?lS8dvZBzPmhP0CH/ATRqSFi9Xw1MkgzrbWQdgbRhi0l6/dWzTGdm+nXDHE?=
 =?iso-8859-1?Q?2ZYQ9lXCAUg0WOlwB09BPv8NE3mrhYHU5RJyyYfoyZN7t9RJC0KTbXDUoo?=
 =?iso-8859-1?Q?8IA7XgbY8SgVK6q3JxPyNZvYfWiyk9i7tCp/7qMMAP7V9E+t/vi3n2Am0C?=
 =?iso-8859-1?Q?tTzrhuNJhaRmqrS9csSdExt5kUPTQg8mkDYgr5uU2ZFB/7Y0GgB4jzdO/P?=
 =?iso-8859-1?Q?3L6f9SbGb9G5gvgn6t1bJr2YxnNDyOm85FK3jXi9n9bG96cgaNYEbmzc3b?=
 =?iso-8859-1?Q?NJOd5zOvZQj1DH9qwMFfAKPhppSEmejFdRCO1uxe3hrshtrrM+ZN+RcKAc?=
 =?iso-8859-1?Q?96J8IwHRBAmWuV6HFHvrHRy92uewuqio8mXVrJqEy4II2xoNRmqccr3MRh?=
 =?iso-8859-1?Q?k12fckuMvZNKjKMDLHlJEzW3PgFyeaKULGcu5+/bwB2iIaVcVbCSW8CQ7q?=
 =?iso-8859-1?Q?ZLEMrD0rMs2o1gN7L4+nVMFSQi+gUposH2rR4XIThFFNxXzNDuS/AuaZU8?=
 =?iso-8859-1?Q?9eBiRdos7plH98otoKQTwXQ45s++DQofLdn7Il0YIVJnI0pu3AjlXw63Am?=
 =?iso-8859-1?Q?oZA4z4Nn8jkDlMZ7lvFbTqSILYwCYDZmrWPFGky+PFfqToQS073Dd5kCdX?=
 =?iso-8859-1?Q?qyknSN9l/AREbpsk5U4gTJ0+IDHFggotQ1RgOnAHVUaSfHHtJcHhJKHhVO?=
 =?iso-8859-1?Q?Q5H6ZQKKfqTYXA3qvgP0rTshfh4kxUZbNoeOvI/KxlDrNKTXL/fd6COJxc?=
 =?iso-8859-1?Q?G+cTik/Wh026b2A2DApLaAQH47G+J3MRDCL8YX+rxhTxryek80GcUcJ8c7?=
 =?iso-8859-1?Q?k5mQ7YndihjcJ+Vwgh2D+dpiWB8rFkd8zUET0ijF3DSzbfX5hLnDeIVNu1?=
 =?iso-8859-1?Q?vuUt/I21xhgYlO9SxMVEtBGkNjblc82BBAKOEXqo3pUS+/3blB56NzVW58?=
 =?iso-8859-1?Q?bF7ww9DvLbr3cNfggrPttpFp8BAeVfh7LqccQEZ4i+ec63l2icv99GU+Hh?=
 =?iso-8859-1?Q?vG2SxCkVBzUCMCvo36xp7goO9p/JSyfcCOFh1wRsb2AY5tpTPjZMVBFXVf?=
 =?iso-8859-1?Q?n8r36ZpE0dLjO5PRGpnWGCsFPi9UmKLOnOKVECn9JmjlTXL2uENFzQXe0o?=
 =?iso-8859-1?Q?XU4r5/oZvzqVMGPZJ3g91DyrB9yXVt6+QNO3s4FGsqr7Pz8tbKkJ7DlTkr?=
 =?iso-8859-1?Q?MHAh3ugdlRzyS2TAvni78OmQw5r0tVtLuhESEHSvILfcdslqi1oVTVnGch?=
 =?iso-8859-1?Q?PO6voZDkeBcH8VeH4hyihbgU7bcCrS7W9IgoJ66mLuz5XMxLVxZiK9jOyz?=
 =?iso-8859-1?Q?uSMTFaXaPtb2ryCDoMpGLJ3J0/UfF+mnYv2JPqn60HpvPxkkTKTBo2X5pM?=
 =?iso-8859-1?Q?oD+OWmDC5pyXaDhSCWAghqK3zQDuh575cnjaOfyeeyBuiLOc8f37bflQSm?=
 =?iso-8859-1?Q?uUl+aDhtNoa4MWj1EN+Qbe+xHLjVoIL5gH34Cn8OPHw1U9m9pJG8G5n/Xq?=
 =?iso-8859-1?Q?Sg3h0vLr+HXVRgM7TcZd+n2VUy5B03GcAhO+YJneXGPINM0DGvAftkIUo2?=
 =?iso-8859-1?Q?6oZc7ZQPu0EI/b+D1H3VyCuc0if3Jc1WLX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f36b498-73ad-4179-1e41-08dbcbd28600
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 09:55:25.4483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbpP05+NvKwolyNzExzWC3mo6bgzgD+b1dn4R806NpHPELDX/lFq6rgN4m/Ruli+GIMeojwvL+a7bBRBPhLafK0XD9xP/GLkq7LBBs2JCT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189057

On 12 October 2023 21:13, Dan McGregor wrote:=0A=
> On Thu, 12 Oct 2023 at 11:10, J=F6rg Sommer via lists.openembedded.org=0A=
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:=0A=
> >=0A=
> > This is only a minor change, because oelint-adv had warned about the sp=
ace after " of PACKAGECONFIG.=0A=
> >=0A=
> > ________________________________=0A=
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of J=F6rg Sommer via lists.openembedded.org <j=
oerg.sommer=3Dnavimatix.de@lists.openembedded.org>=0A=
> > Sent: Thursday, 12 October 2023 18:34=0A=
> > To: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org>=0A=
> > Cc: J=F6rg Sommer <joerg.sommer@navimatix.de>=0A=
> > Subject: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES=
=0A=
> >=0A=
> > If the ipv6 feature for the distribution is not set, the package should=
 not=0A=
> > contain settings for ipv6. This makes rpcbind doesn't try to bind to a =
IPv6=0A=
> > socket, and complain that this fails.=0A=
=0A=
> > +PACKAGECONFIG ??=3D "\=0A=
> > + =A0 =A0${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \=0A=
> > +"=0A=
> > +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"=0A=
> =0A=
> Looks like this will conflict with recent changes I made to master, so=0A=
> hopefully those can be resolved automatically.=0A=
=0A=
I'm happy to provide a new version that applies on master, if it's needed. =
Let me know if I should create it.=0A=
=0A=
-- =0A=
Navimatix GmbH=0A=
Tatzendpromenade 2=0A=
07745 Jena =A0=0A=
Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley=0A=
Registergericht: Amtsgericht Jena, HRB 501480=0A=

