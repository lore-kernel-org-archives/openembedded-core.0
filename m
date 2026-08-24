Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19F6C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 16:18:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1441.1787588295569706271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 09:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mCXHF+eb;
 spf=pass (domain: siemens.com, ip: 52.101.70.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAgOPu52CZZ5iyeX/Ibxw9ZRGnEHKTs30cwkwwC9Uugq0gdYcIQXBLIUD4ytYy0sdGXdpbtLcZhEJufdHWQhz1R03CH2PBOSQhfib0f6wBl1NbQZRr+1KJkspG1jeqRiF+xjGJqZrox7vCu1Jm/NPkmrqzWkAMgDTPRfI0OwBI2o/InSX/zOD17vJrSQw0XcmPjtk4tyrRet8R+VvdSSnYQWy3zjSS3b/ESpY22YudKojS+QE3bkW/Tc3R42gKIBrEM/rYXlXhQauDDD+2iEuBFtX0e88V/ysCy2CU7plO7pe8t1mfxL+x7riF2B/vOEL3BQ+anzktBVrHk3b7dz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZckvJVfqtzT7nPMV44Q71CfgcvGa6PmcaHVvOgrWQ4=;
 b=UZ2vlb/pCXqcu+ceHXg8U4jzQVPyB9oZYGUM0hXn7ceARsVEYjE2VbpXF+TNiz3lwGobHzGYTuKMPA1B9vIbCI9RRyf00k9TELssBtyrO8b/9NaDwP9t9YIByc6fCxCZjxPVJX+BQRhX/DkJ2vYc1TOluwg3Kbb7FWjJa/6eckCaOaBsW7QlF2F4acwpYXbT66lD6WARxjCb/3EmSk/uRCnhgCkI//p7VGqmhYLh7FuLFSp/U+lL4/PxCdkdrodvdl7zBa6/2SVOwS/sZsxJfatClOEBUkcZbi6xGTc/yFteGPksRDQJWNIBxwL6AGUc0cbXgZ9pU7na4NMYmc+gtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZckvJVfqtzT7nPMV44Q71CfgcvGa6PmcaHVvOgrWQ4=;
 b=mCXHF+ebd0Zp+s6MLbQnel0EaDvTVg7knwLvnTbMybe6v9w6MNrHy4wu8vrwBzuqR3njTsW36QPu2NothLYfFs7ySG5gKgypYNOEakcMvs6wFU5DHkNF10odqhN0+mzzEYXC1NALD322NAq4fx2rHWvrsx5siti7KHmLxvLaBQKyOoDXSIXQREETXR6iYPrVOP9UoBirvTiIXqe7lHLWCCZzHvMnSSrEYkT82Wwf+CifCdkAs3eOeRVAgOc4z8DkD/DikhgZFGgAEUnNyn9kfUrL+bzeDhpOM941dNPERY344pcaRJs6iTpT+fK1a40ZAuh4LBfx17j0r27XIRUWHA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB6004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:18:11 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 16:18:10 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"rs@ti.com" <rs@ti.com>
Subject: RE: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usrmerge
 to merge bin+sbin
Thread-Topic: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
Thread-Index: AQHdM8bjDhLQ0pu5WkKZw70h40FOzratKW2ggAAmaACAAA9bYA==
Date: Mon, 24 Aug 2026 16:18:09 +0000
Message-ID: 
 <AS8PR10MB50732C47CFA301A1F642E994FDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
 <AS8PR10MB50735EBE95086FAA8CE99FEBFDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <aoxfc-dRzSygEkAb@navimatix.de>
In-Reply-To: <aoxfc-dRzSygEkAb@navimatix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5c47856e-acc5-4282-8ed2-1170662bc9d0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-24T16:12:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB6004:EE_
x-ms-office365-filtering-correlation-id: 54ede9c1-d8c1-44e9-c743-08df01fb4a05
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|3023799007|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 O1KODplFRUwviYGTJfRaUbsxhw9WQ9JEFjizN7+TKOX4AtrRqfej93AblrnoTho3p/AD02cSob8RglWaSyfMnZBCIvb6wqzoV0wCp9TCXCAX0S8ZkO43QY312ujpqhzilkgsqGOWvTEXQXHTAVjbXDCQ0K0FzKMM8WhpkhAjYE3gBAS4HHJ1VVE2z8b2EPd0ALzBrx8SJViztUf5LNojstCPCLHF/Lt4sk+cIAaN213MB+L96CWeI2KRsYM4ih0IcLPDeW2Bl5H0V160wZVRqL+NsuG04RoAZFxdntDYRQoRYYZMHZjLxx4z+uxaN5TRStEfc2r06XHH1R1ppwvW6oYEacel3bNSx7enl477ecQ2KO72E2Uk4TtFhLBGWyaXpba2muCmeI8mvuSLbeQnjfoIvPWBMWSaGeUI5RF4jntge6FJi/dkuwOmdjmoyg36FDmWea+HTkESJaCV+YzajG1fkvBUCSzmoJznINN8dcoQqS3U5v/QtjWCVnTxcPMJDj7LTd1PicsfgrW7FIB81BsgsT+4zgEigdgxXpcNBSrZ3Ok2Gt7gqp+s93Jwicy25u3fEO/EE2n8jPlhHn1+txMAro5t6jGG6ve+UJobdamkjyQEFJ0mme89NC8vIcm0HpufxjP9ukIt6ENJYwMuaOwzsUik27MsJOV4EKYhGwU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?8ZQTf1yrPUsyXXWiSUiEpNE+SHsW5zTgBRG4YRWxO8li20o5+OQPzd/pqC?=
 =?iso-8859-1?Q?INxMfcJOQaE2V8K/FJ8GHIo+hGDWrKK2dU2RbGTWx8YJk4Q39hBNrIg6XS?=
 =?iso-8859-1?Q?3uW/AuYawRCxMid3jN7ny9LRo2wm4dntnnsrjBzlpSiIyjjc8Dk7xAkvcR?=
 =?iso-8859-1?Q?eMHwTqIFjM/I+4NGsypTpuQSmDyi2uvDbV71rKHzAoP2ZIBcqJxIv1mjsI?=
 =?iso-8859-1?Q?Ny7lPSkbe0L9K4Cnt01qY4BVxJe146GOd6+6exAT9ijoN9tyHg4yG8tREM?=
 =?iso-8859-1?Q?bEtNa9CWM/Yz3ZmEwvy6bE9Z+p8GhXZ2EjkCvGQ643PGP9LjBdlHtfTyEV?=
 =?iso-8859-1?Q?geVCEVZNcfhsX5nIJNBfl5JjFhtRPY/1kAG0huPeoI9TyXAKzSQdCKYmex?=
 =?iso-8859-1?Q?aZ0khfFtk4arUXN2nyPQ+fK19tK/fj6zWj1tC5jnc4vZiUNkONUfvWyreJ?=
 =?iso-8859-1?Q?xLztL6Eb1ZGjY3bRDhh20QuzEsNv4WJ/0CA8LT0u0B3hQzcrDntLGd+I8s?=
 =?iso-8859-1?Q?vzarbiYBDKRkluikY9sz+9FtoNbdYQG/CYIStX7HpbfjgboIBCg0nooKIx?=
 =?iso-8859-1?Q?l6/yDkgZD6QHxTe1hTSQvLpvIlhhPxOd34SPpYrcp2H8bXfHVEf3Mg62Cr?=
 =?iso-8859-1?Q?zB9dNqu1Xw7+O+T7+tluoE/hUTreEsclvBysXuz29bjpKbAJ/dWi2w58Da?=
 =?iso-8859-1?Q?r/mNXpCVfmbQp4D4s/6xZ2SYx58H6rwX6bGyWDGkA71NeeI4BQ8Y75j7JC?=
 =?iso-8859-1?Q?9j4dgvDgyvNazULMMIT0HxBte0CjYa4M+kiiUG03JSvZiod8ex+IsZqvpb?=
 =?iso-8859-1?Q?Q6OwmCCUXtcPnSyy8Hb2vlkUl6mmx2W9SF+OT8mbj/n4TMPLJBfhYpk7M/?=
 =?iso-8859-1?Q?IHLUxSRGfY/85epadwCYSECI8unvrIBhjXlPRuBs1+IPI1vdeA6BBrq6Is?=
 =?iso-8859-1?Q?Zfe9YU4NqUC+9s3aOvrzVtqAA7T6jXJVwiOamg6dVHJS25rOkDpKYsBzXk?=
 =?iso-8859-1?Q?oivmSoTFpXuhSPMfJvGBsEk4OWkwoldS087BYZYNStHC9WrZObgX6eQHBb?=
 =?iso-8859-1?Q?rpCbey5sgZDqww2m26/+kcPFDY/dtZE/OKPqM5FGuwJMOU8jGW52fDhHx9?=
 =?iso-8859-1?Q?5NX8+YB/IsYH5Uj07DSvoHJWehpUWHKsVjm83zaQ/NsTYXvrpYjACGj9BJ?=
 =?iso-8859-1?Q?uLo7M9/di4iUcluKqHOqgbYv9z0nqwlidQbtjkBYgrgz+yngRW/cS9thGo?=
 =?iso-8859-1?Q?r3fJHEwl9pptBDQoBHS9pllqmaWL6bI449RVFA2MIXD0kqCLRuKutQAlJl?=
 =?iso-8859-1?Q?OsM0ZIoe0enot36I6sPwWgPQC3RXjz0/P+NIOcTs/2B4wKD4qff5Tb/1rK?=
 =?iso-8859-1?Q?/asCFkN4ulu8rincMaN+z1uKdD2XT+CS9B57xEzCsvAA7rHT+vXdxj13bK?=
 =?iso-8859-1?Q?LtoFJl+RcEunBnqprWnoBGo+4X08t3ZKZQbcS4WGoWwI6LQax/B18xW5VF?=
 =?iso-8859-1?Q?5qPcG8ppjgLku57d5vJdJzKAvnJRQggSA2t2VZ6LwW1ZmGnmuqE/3BPU2u?=
 =?iso-8859-1?Q?Kx2vDJWOrmoZC/OTnPmgoBhpTPnUkSFvY8oS+nf/AEhjIXiiLbndljB3Ub?=
 =?iso-8859-1?Q?M2jHqio4N1jlZ0QqySxX7VJHm7Sl8CKefHQ5hhi2/hDp3imOGwXG12jzNR?=
 =?iso-8859-1?Q?zKVc1fc0N7YUlZP6vwyZzvWKGz5Oe8e3FJwKAxl39V/SnoecS2A8n7gC7H?=
 =?iso-8859-1?Q?T8Wde9JkOH4z3KMr7beY034y2le3OU4w72Y4KlQPMUNkeKu2vrRK1OcJWW?=
 =?iso-8859-1?Q?kX9BjeHSdw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ede9c1-d8c1-44e9-c743-08df01fb4a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 16:18:09.9941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4b0ErXvXFxMYgCXQPMfF+E9IpcubNnmNxlTiJZB/b4YirvGHtl6entEPZ1WViY8yZ1D8WF53aUJMhE4/0KFoTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244138



> -----Original Message-----
> From: joerg.sommer@navimatix.de <joerg.sommer@navimatix.de>
> Sent: Monday, August 24, 2026 5:18 PM
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org; mathieu.dubois-
> briand@bootlin.com; rs@ti.com
> Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usr=
merge to
> merge bin+sbin
>=20
> Marko, Peter schrieb am Mo 24. Aug, 13:11 (+0000):
> > [You don't often get email from peter.marko@siemens.com. Learn why this=
 is
> important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > systemd recipe has:
> > REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> > So the changes in systemd recipe can be made unconditional.
>=20
> I can update the commit, but with the current version, if someone doesn't
> like the bin-merge he can revert it and stay with usr-merge only.

I failed to find a way how to revert bin-merge with systemd as INIT_MANAGER=
.
I think you can control this only for mdev-busybox or systemv init managers=
 and in those you can't build system recipe...

Peter

>=20
> But does really someone want this? Maybe somewhen systemd will require th=
e
> bin-merge, too.
>=20
> Any votes for or against hard-coding bin-merge?
>=20
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of J=F6rg Sommer via
> > > lists.openembedded.org
> > > Sent: Monday, August 24, 2026 2:48 PM
> > > To: openembedded-core@lists.openembedded.org; mathieu.dubois-
> > > briand@bootlin.com; rs@ti.com; joerg.sommer@navimatix.de
> > > Cc: mathieu.dubois-briand@bootlin.com; Randolph Sapp <rs@ti.com>; J=
=F6rg
> > > Sommer <joerg.sommer@navimatix.de>
> > > Subject: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usr=
merge to
> > > merge bin+sbin
> > >
> > > From: Randolph Sapp <rs@ti.com>
> > >
> > > The split of bin and sbin became more artificial over time, and it is=
 no
> > > longer clear why programmes goes into the one or the other directory;=
 e.g.
> > > forever normal users have used sendmail in /usr/sbin, and fdisk and m=
kfs
> > > learned to operate on files to create images long ago.
> > >
> > > Because systemd drives this movement to have only /usr/bin and symlin=
k /bin,
> > > /sbin and /usr/sbin to there, the usrmerge feature (started by system=
d too)
> > > should be extended to include the binmerge. For a system with split b=
in/sbin
> > > `systemctl status` reports the system as tainted for *unmerged-bin.*
> > >
> > > Override most sbin variables to point to their bin equivalent when
> > > usermerge is enabled, with the exception being base_sbindir_native an=
d
> > > sbindir_native. There is no guarantee the host machine is using this
> > > filesystem scheme.
> > >
> > > This check was added to systemd back in 2024 [2].
> > >
> > > [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesys=
tem/-
> > > /blob/main/PKGBUILD
> > > [2]
> > > https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e
> > > 4a6aa6d9f0d
> > >
> > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > > Changes in v3:
> > >
> > > * rebase on systemd 261.2
> > >
> > > Changes in v2:
> > >
> > > * I took Randolph's version and reworked it a bit. But the idea stays=
 the same.
> > >
> > > Reference to v1:
> > >
> > > * https://lists.openembedded.org/g/openembedded-core/message/234858
> > >
> > >  meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
> > >  meta/conf/bitbake.conf                        | 8 ++++----
> > >  meta/recipes-core/systemd/systemd_261.2.bb    | 6 +++---
> > >  3 files changed, 9 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/cla=
sses-
> > > recipe/populate_sdk_base.bbclass
> > > index f32e9add01..f9367d0d17 100644
> > > --- a/meta/classes-recipe/populate_sdk_base.bbclass
> > > +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> > > @@ -188,6 +188,8 @@ create_merged_usr_symlinks() {
> > >      install -d $root${base_bindir} $root${base_sbindir} $root${base_=
libdir}
> > >      ln -rs $root${base_bindir} $root/bin
> > >      ln -rs $root${base_sbindir} $root/sbin
> > > +    # if base_sbindir =3D=3D base_bindir, aka binmerge
> > > +    test -e $root/usr/sbin || ln -rs $root${base_bindir} $root/usr/s=
bin
> > >      ln -rs $root${base_libdir} $root/${baselib}
> > >
> > >      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 41e98ce629..a6833f98de 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATU=
RES',
> > > 'usrmerge', '${exec_prefi
> > >
> > >  # Base paths
> > >  export base_bindir =3D "${root_prefix}/bin"
> > > -export base_sbindir =3D "${root_prefix}/sbin"
> > > +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'us=
rmerge',
> > > '${base_bindir}', '${root_prefix}/sbin', d)}"
> > >  export base_libdir =3D "${root_prefix}/${baselib}"
> > >  export nonarch_base_libdir =3D "${root_prefix}/lib"
> > >
> > > @@ -44,7 +44,7 @@ firmwaredir =3D "${nonarch_base_libdir}/firmware"
> > >
> > >  # Architecture dependent paths
> > >  export bindir =3D "${exec_prefix}/bin"
> > > -export sbindir =3D "${exec_prefix}/sbin"
> > > +export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerg=
e',
> > > '${bindir}', '${exec_prefix}/sbin', d)}"
> > >  export libdir =3D "${exec_prefix}/${baselib}"
> > >  export libexecdir =3D "${exec_prefix}/libexec"
> > >  export includedir =3D "${exec_prefix}/include"
> > > @@ -66,9 +66,9 @@ bindir_cross =3D "/bin"
> > >  bindir_crossscripts =3D "${bindir}/crossscripts"
> > >  prefix_nativesdk =3D "/usr"
> > >  bindir_nativesdk =3D "${prefix_nativesdk}/bin"
> > > -sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
> > > +sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrm=
erge',
> > > '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
> > >  base_bindir_nativesdk =3D "/bin"
> > > -base_sbindir_nativesdk =3D "/sbin"
> > > +base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES',
> > > 'usrmerge', '${base_bindir_nativesdk}', '/sbin', d)}"
> > >  includedir_nativesdk =3D "${prefix_nativesdk}/include"
> > >  libdir_nativesdk =3D "${prefix_nativesdk}/lib"
> > >  base_libdir_nativesdk =3D "/lib"
> > > diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipe=
s-
> > > core/systemd/systemd_261.2.bb
> > > index 8237b040a5..4475fb2514 100644
> > > --- a/meta/recipes-core/systemd/systemd_261.2.bb
> > > +++ b/meta/recipes-core/systemd/systemd_261.2.bb
> > > @@ -196,7 +196,6 @@ def build_epoch(d):
> > >  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=
=3D0"
> > >  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse=
"
> > >  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse=
"
> > > -PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue=
"
> > >  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
> > >  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
> > >  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> > > @@ -227,6 +226,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> > >                    -Dtranslations=3D${@'false' if d.getVar('USE_NLS')=
 =3D=3D 'no' else 'true'} \
> > >                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf'=
, '-Ddefault-
> > > mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
> > >                    -Ddbus=3Ddisabled \
> > > +                  -Dsplit-bin=3D${@'false' if '${bindir}' =3D=3D '${=
sbindir}' else 'true'} \
> > >                    -Dtests=3Dfalse \
> > >                    -Dlibc=3D${TCLIBC} \
> > >                    "
> > > @@ -343,8 +343,8 @@ do_install() {
> > >               install -m 0644
> > > ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/=
dbus-
> > > 1/system.d/
> > >       fi
> > >
> > > -     # create link for existing udev rules
> > > -     ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> > > +     # create link for old udev rules
> > > +     test -e ${D}${base_sbindir}/udevadm || ln -s ${base_bindir}/ude=
vadm
> > > ${D}${base_sbindir}/udevadm
> > >
> > >       # install default policy for presets
> > >       # https://www.freedesktop.org/wiki/Software/systemd/Preset/#how=
to
> > > --
> > > 2.53.0
> >
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>=20
> Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480

