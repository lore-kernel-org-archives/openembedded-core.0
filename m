Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23664C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:22:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web11.29005.1701163363022355227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 01:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=G1j3jXnU;
 spf=pass (domain: siemens.com, ip: 40.107.7.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq2dL639lZNrZiN3ggptJGNnrul88hZE/NX82NCXGlWJ9peLxElRFaC/Wz/4jM3hPJSslGI/S3ZuinDv9Tnkyv26Sp2R+/2U7v1WCvm8EOlseauFtz61+54uv/F71KZ+4uvRu6c0ZuXZpQiFcSNCMDFroJ6JYpWihFbGL7ZVva4iXf5kOqO2F+91O8dA7BLHc/oWEcFaafw6y/y9hUj3fhfuvjQC+2wQSR3f0LdgHqn38BmxkF45SY+fpeW6FOA7kbTsoNS3tNTBgcPVaoA0DZr7LkHaq07V3WAEn/666M5uB1hkh2MMVLsv66fmSKzltZ/V7OOEC4ucjxQGCe/Gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqfKa4wKOu//hbvKr9o3IZioLHHH2ezLs12CYYGZfr4=;
 b=Dr1yAXNPjwXmxAl/BeCfhW4c0UgTGNSYaUBhGUb0sjmiEs4M7nkmBKivmRF/UXtqA/7tFVqbarDH99Hsm64shcVtiH34ZeNi0tJsl2B5+sDGtbtj3mWzJm2Dq4ajLdkzLUdPPQBjenPzxmREtp0AP+LawURbfgi/oDaPhkIbQ8eOMBIi0leJYhM8BxKrjHGEg4a/lF/9zJ+wqDGwpeQdaofu0fOPW/KZASXhRlDLxS1xeM9zD8xIpKovXWbJnmKEVdvTQIU1mFBoC3WGiaE6znloayoRCYvkklBMOD4zVBnbSsgBPkA9SIeUGTXkG4bovQsPy4hnlqWxHl2fO7Bl2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqfKa4wKOu//hbvKr9o3IZioLHHH2ezLs12CYYGZfr4=;
 b=G1j3jXnUc+xnMo4caCeVnw2yKPZWOFCsy02QkhCPvS98OP+1X+KsxbXQ+4vwI1b2wBKEPNWy0gs/9fcvyHTqe73w9EoQV7eYZc/96nZN3cLwY8x3ZuR41uvLgUMuOkQH3YrlsiTFdnhGlmF2QHol0EAnf5W3PnormalojwUMqlcNH2lYUsEtVn9htfN5CnAsyYf9li1zGyFIuBuSLQ7uI+ENYZhTYdL+fTH8S402IXGAqmNP3Q7XqQ+PbgutuUly24BwgUzi8cUhThxXZ0ErC6lZ6xScmNPCHZfE3Ts1i535olrIxPuvcN1q2kVWFbh8vPyC7pZkVgBtHLlrnVr4cw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB6887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:324::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 09:22:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 09:22:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Lizhi.Xu@windriver.com" <Lizhi.Xu@windriver.com>
CC: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
Thread-Topic: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
Thread-Index: AQHaHp6CD9Fv8LQgREaA2+Y7DfjfXbCJr2gtgAVbNoCAAFti0IAACwoAgAAJfEA=
Date: Tue, 28 Nov 2023 09:22:39 +0000
Message-ID: 
 <AS1PR10MB56976CF4E49D53FACC1EA5A9FDBCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <AS1PR10MB5697DA509EB149355CE69BD4FDBCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <20231128084446.880869-1-lizhi.xu@windriver.com>
In-Reply-To: <20231128084446.880869-1-lizhi.xu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=40739a84-c2dc-4840-af74-a2b801291945;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-28T09:18:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB6887:EE_
x-ms-office365-filtering-correlation-id: 2b7273ad-b32e-4b59-dd2a-08dbeff39124
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nozIjT9Cb4sjsiFtSy4Ss/Ka/8uBWG6CEa23ZD5/KbV65FOnfXwzA98ULnlGIzWJAuJHayhd9Ick3IE7nppvrjIhyhsMUmkt/Pm438CxZwIbQWqSwjoFjcIJeLHO7j3njP8i53HPtoMIGR3/IRQjaEOcdNVkr74ooA7Z3Qywc4KvehcCwe5RHTbFZ6S7laz93mu/7056DfuwZ1xv04kB2v8M5qvMUhtGUSjD7SVS3+HJpVUkNtTaR1sIf9iW1yr/fqytzL0ig/i4x+eaL9c2nM4YRQcsvGt+1TES11qB0GlguuP/XIC7oda0Ft/ILue5Q4Zr1a0yxnJdSmyQNuDWt3x2CwOefVOyztdGYo1en32PYEUrtXfd7GvWpkbAIRAYQyRYNEtLdNmGiHpOsuRJ6R+PA+b7bCEMgSpYin8mgto/xTXTUjHQG8HA1FFS4hnSgBzC5kJx1uOK1k26kCmVsxj/i2S5pf6CRzp6kawomQmsyRQGfEaKVHHGXoFLNPe8TcIAvQrwPAYqxubitTlldMaoJxOSzEzIuBcFiS2fE1vfPwDgvw4mfIK4MzHpjF3BpUAtrU2Q0XSr0rzrW4XjnLABMr3iqdannYx+leo9b5xsU6J5fntOzN6jcsdgtHya
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(26005)(71200400001)(6506007)(7696005)(82960400001)(122000001)(33656002)(86362001)(38100700002)(38070700009)(5660300002)(83380400001)(8936002)(4326008)(52536014)(8676002)(2906002)(9686003)(53546011)(54906003)(316002)(76116006)(6916009)(66946007)(66556008)(66476007)(66446008)(64756008)(41300700001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1n8g+oUrR1qSHu7KST3PVwd0C2mPje3OlEyCcIUgcADkC/VKqkp1ZG2y/DkS?=
 =?us-ascii?Q?Sa9ppypA0A/h1wPbc68r766asF+mUlDAroZZGmtDxetpMGD4ZSaJndTjYb1o?=
 =?us-ascii?Q?x888McBiHJVP7MujZ2IE41Y9wsyunhAGvtC61lORm3VSAu9jMwXLPTJszLRt?=
 =?us-ascii?Q?YSc/RSFbYmA7MhaLq0r3teSvqn5G/EO3LU8w3p5zkhUrKu1/WUEzO+itNctv?=
 =?us-ascii?Q?l7vdZS7KqHwlTZQkLZnxJ0fzXMcwkPn42LoxbZifFVOlQgVWBBJfgxYFOSFv?=
 =?us-ascii?Q?gJwe7lfIXQnY/FkM0H2z9wF//7B7lVFr/seWD3GV1NI60mtQmkdt3yVfvnMi?=
 =?us-ascii?Q?gx6T+JBvVhHluis2ERPmT2pqIihuKy8REP55svZcsTpq3Nvr5+2OLrVVO8av?=
 =?us-ascii?Q?6qC7AVfUcJJYyqWIuSES1T0WCOeEGjtnzxExdGiJkfiZ6Imfm+XHP+ZVJ/xj?=
 =?us-ascii?Q?zRd4gUdnYLu1PAFtzVLPsuk7WOVxlyKfE7PP/6rJaEMTiC3oQ9+IVcSSnmfV?=
 =?us-ascii?Q?DHOSYvzujqQdIBQovYEe93Nuf79qFhLA0VDAdt4u8qUijGcl3uDftZANqf0b?=
 =?us-ascii?Q?LdVRVSVOaR6XHrNzSstyz5XQbSN4lnRbmgK13H7CsOEgCDsOP3TlQqqrJLPZ?=
 =?us-ascii?Q?hVGDcFYwUQPGULNnu1i2vJBSowSW08In8ZxBEZ7eo8pIh8qBHpyUQR3sCCvU?=
 =?us-ascii?Q?Xem2x2B2wz9s+vXd5gxyO0DE+VGccs9lfbrCnHKgc0CKBJ4aH0sU2zVz4gU2?=
 =?us-ascii?Q?51a4RejbjW0ximeuCPxUPFU/S8wEpR4tExXaEz3TdxdusbvsHHBZYAiuPP3h?=
 =?us-ascii?Q?6E3fRSBL5z+V51XfhY9wO7CFl2Z1m9OTaM243fRpIHpg0HRWgAbcFdstXnJa?=
 =?us-ascii?Q?3eTmpZ+IrDr5ZBXhoX4+YL1jrv47wIar7JqngH2Wpvwmx/raKfaALPMoO75s?=
 =?us-ascii?Q?riE3coXeNhz1DXx5YxT2uOV3SZKDtYXRY18TAjjsm7KfvO5qVHjbWxT3b/p4?=
 =?us-ascii?Q?CEZdlqVeo1aTvAGZ98gnYM00jnd/zjgpiw5CYQoXTY0CJlSE8699CKW70iBn?=
 =?us-ascii?Q?0GfHj3DrEBqt/bpPvGhdCNTlTWxGN/bGJz63wPN7mrriGkQmlEFDo3UZdZ46?=
 =?us-ascii?Q?RIgI3rIW0zGmcvJKDVMOAoB0FIbwChbuXm+HJOI6LGvhVkevEUdYgvpDg4RI?=
 =?us-ascii?Q?lLvd/xADJ6qp6JUdCDMnk2yJgkmpgV0yUVoFt3QDI78aF7vOkJwiq8OPvyed?=
 =?us-ascii?Q?wdp9LKi2HUXW3IbbgIXLRiyMhhlU1UeUgZfN1FRrB7V1a0XAS0PQuyD61ACE?=
 =?us-ascii?Q?WU+H8kP9kT+/ljObncJyCOUlL/EdCVpyNFRDJSig7hyWrny5O9EWX7M5XnCc?=
 =?us-ascii?Q?6RGFSxSZl1tJJu0ITjw+gxHj863M+bLuMH/7+9/0u5oJH+fqar6qKXm6zUpz?=
 =?us-ascii?Q?Ay7dDDbZlpF+mybQXlEkxj6GM1JpBvvlWKhQ/NdPympBwiZGk88lsZ39J8JA?=
 =?us-ascii?Q?ZTUJuMMuxy+QqjyHxQ3M9E2l7gRql7TWgkGm23Jb6xejrlVzQf9lVIqcf0is?=
 =?us-ascii?Q?8whn7I6z1LotNL5Ii71HLa3WaJ2ZQE6kV6J7HYvO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7273ad-b32e-4b59-dd2a-08dbeff39124
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 09:22:39.3907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCd9CAHuX1yjz690odgx7kCGHNty9LiIlG+JeHhVJ5GamKmhbOsh6SGhQ7mzNeJMMEbkOeL8IvWoKFp5nHeEqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191348

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Xu, Lizhi via lists.openembedded.org
Sent: Tuesday, November 28, 2023 9:45
To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Cc: alex.kiernan@gmail.com; openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration

> On Tue, 28 Nov 2023 08:13:57 +0000, Marko, Peter wrote:
> > > > > > tzdata.bb by default pulls in all possible timezone data=20
> > > > > > packages which increases size of the final root filesystem cons=
iderably.
> > > > > > The customer would like to have extra timezones configurable=20
> > > > > > so that only tzdata-core is chosen by default and rest of the z=
ones are optional.
> > > > > > This change would make the fs size a lot smaller.
> > > > > >
> > > > > > Comparison of customized package volume before and after:
> > > > > > When TZ_PACKAGES contains all tzdata packets, the image size of=
 tzdata is 7.4MB.
> > > > > > The difference in mirror size between the two is 7MB.
> > > > > >
> > > > > > When TZ_PACKAGES only retains one tzdata-core, the image size=20
> > > > > > generated by tzdata is 320KB.
> > > > > >
> > > > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > > > >
> > > > > I get what you're trying to do, but this looks horrid. How about=
=20
> > > > > splitting into multiple packages based on top level directory=20
> > > > > (plus the few which sit in the top level directory) using a new=20
> > > > > PACKAGESPLITFUNCS so you don't have to hardcode the list of packa=
ges?
> > > > >
> > > >
> > > > Foolishly, I didn't actually look at what was in the tzdata recipe=
=20
> > > > first and it already splits things... I'm lost, can't you just=20
> > > > remove things from TZ_PACKAGES to get what you're after?
> > > To achieve a final reduction in the size of the tzdata package, simpl=
y configuring TZ_PACKAGES is not enough. It is also necessary to delete the=
 corresponding zoneinfo when generating the final package, this requires pe=
rforming the corresponding deletion operation in the do_install() task simu=
ltaneously, which is too complex for users.
> > >
> > > Therefore, this patch is provided to simplify the step of reducing pa=
ckage size.
> > > After applying this patch, users only need to modify the OP_TZ in tzd=
.inc to determine which time zones are needed in the final generated packag=
e, in order to facilitate customization of the final size of the tzdata pac=
kage.
> > >
> > > Thanks,
> > > Lizhi
> >=20
> > This is the wrong way how to achieve smaller rootfs.
> > If you grep oe-core and meta-oe for tzdata, you'll see that you break t=
hings (e.g. glib-2.0 ptest depends on specific tzdata you're trying to remo=
ve).
> If the default value of "OP_TZ" is adjusted to the following value, the p=
roblem you described will not occur:
> OP_TZ =3D "tzdata-misc tzdata-posix tzdata-right tzdata-africa \
>     tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
>     tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \  "
> >=20
> > Yocto has concept of packages and tzdata is good example how to use the=
m.
> > Just install packages you need instead of generic tzdata package which =
pulls all.
> > If you need the empty main tzdata package because of its postinst, then=
 just reduce the list what is pulled here:
> > RDEPENDS:${PN} =3D "${TZ_PACKAGES}"
> I didn't understand what you said.=20
> If we don't adjust tzdata.bb and instead adjust all packages that depend =
on tzdata at runtime, the customer may lose patience.
>
> Lizhi

I meant that your patch can be probably reduced to following:
- RDEPENDS:${PN} =3D "${TZ_PACKAGES}"
+ MAIN_TZ_PACKAGES ?=3D "${TZ_PACKAGES}"
+ RDEPENDS:${PN} =3D "${MAIN_TZ_PACKAGES}"
And they you can just do following in your distro:
MAIN_TZ_PACKAGES:pn-tzdata =3D "tzdata-americas tzdata-europe"

Peter

