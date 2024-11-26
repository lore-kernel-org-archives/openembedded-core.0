Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612D9D65540
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:11:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.51])
 by mx.groups.io with SMTP id smtpd.web10.53063.1732644671948350398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DKHbFMrz;
 spf=pass (domain: siemens.com, ip: 52.101.65.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frCakjwrp9zpv3AU6tC6QcrYP7E/zUtTuawxHqaump/lBdeEJoP0WTk5esZQ3t0m2z8Ryw54tjR+edV4F/j98wNZtkhwxLVrXwiB9dmNejt0NuYBwFolLLNtnbwNFg/Ig0A/fP0mWzzSEQySBaMkZeJnbWyyjmBuEfzcCqWMq13ayIUqopErJvmQkJU8KZ0Wjh+atl/h6Rz3rbyjLaJzLxSxKCQauLY/88A2Hl8tHhUzY8eKpc91gZX4RQjdtEj7QlKBMtm6kY5f9gwaVYuXuJb1nOenVfoKmHEYF6EkEM5BHMHHmQ950XSvyJHv8qpD/RvBfya3oDyH8lKAC1Cs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUK01G+VH/Ryqa1ERi1/fEA36MZrQTBe5BTOUJ4fx60=;
 b=G6Ex7xErdHWjTBkmZY+jN5lDm/r6y8Ce42HZEWQ8DS5FGl2zrmNXGEXQ4YOEQz+k8fxtTk39UiFgdgMk2HGMbe6WvSBBUUOAbzCmPqtt+wv/OfXt+A9w0ymba/JtGg8iqjF8Y9JJ6e/LD8StmYJRgIrDGwo2JTdmll3ZAi8QdWWj72PQ+fb1sK0a/lG5pXR+8B5A0IWeEEmih9owPgsX9cbu1Eucc9qcCaFRn6Y/eOSh0J5uWw8XQ7/pb/6NchbbCsSSweq6hvVdkivY4dFtO3zXMCnUfgHLK7k10+ORn7eeFXOSxbjJwsvwJSFlcVIniD8tzu6i/CEZvvTn04U5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUK01G+VH/Ryqa1ERi1/fEA36MZrQTBe5BTOUJ4fx60=;
 b=DKHbFMrzZJzHK3IPez3JcudI5ZHdV7i/2QLUyiwlyNOuzEJwlG/4gXTnlNkTzgyssQX7YhX61pTpRe3+p/3s5sCS2VwWrkwXja4giLYZMBv6yPTLKh84zPWxucz6y8vzqB+tWwhEnWib5U0+7Jn7v8PwCeGFvZMXHJWZneGfL+r9JL/j09j8x9i0yxfElXUwW+xsXij6SmM1g32a6NcuDEYIF5/Nk2B3eag0WZvwGw2e/kuHxD1DIKftc7ZyVONBxehL3QxjTrG1seOfI6+YrofuipKQhptIISjzZcaeY9/9ODIqVf+NNq664Wobj2ZNgGTxK83vbDl8e6RnDN+A9A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6358.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.11; Tue, 26 Nov
 2024 18:11:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 18:11:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-RUNTIME_keymaps
 for all init managers
Thread-Topic: [OE-core][PATCH 2/2] init-manager: define
 VIRTUAL-RUNTIME_keymaps for all init managers
Thread-Index: AQHbP2kxZTRguqlinkSSvoNpgmv8ZLLJ2pUAgAACYOA=
Date: Tue, 26 Nov 2024 18:11:08 +0000
Message-ID: 
 <AS1PR10MB56976866FE52DA166E4F7C55FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241125183636.15293-1-peter.marko@siemens.com>
 <20241125183636.15293-2-peter.marko@siemens.com>
 <DB5PR02MB1021365C2D8618C66EC1C2721EF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB1021365C2D8618C66EC1C2721EF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=03b2427c-3f75-4dd4-b6c9-90adce813bc9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-26T18:06:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6358:EE_
x-ms-office365-filtering-correlation-id: 9af522f2-c1b0-4828-0e63-08dd0e45b393
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6tLlxQbyfKB6hdTWW7N0YBv5HlclHUAUYead9/QUPPiOlXHhOYwoy6+MHI0K?=
 =?us-ascii?Q?nfUTLrhc8DqDkS2arelOx5YR4livsphivGDohAnVwR1y08Ry1hEMhSsMHabC?=
 =?us-ascii?Q?QTsUAyV0MMSQtf/Wii4YbZLi4lRfwwGtgML6W5WCanvCeSP2gAsesW/g9UkO?=
 =?us-ascii?Q?ONQDV7/Ee7gx4J29EE/sfTxzZ2bnz/IrzNdDMGbD/SoXe7+WHYA5/O/2P2hb?=
 =?us-ascii?Q?F+SgEUvQMHFaXANG0aVD6iO3kOnAEmzTKDt8I2VTe8iv/3Q39/9QODRvG2c2?=
 =?us-ascii?Q?8b5zumfYY8rIV/oZlwU4ou3IpYnydHz5CytspiYRjaxa4nczzIrUbtB9ebFM?=
 =?us-ascii?Q?b6IKH4h0603Pi79mFyxAQLbatVBqSA3HmVN1wqq2EJ8mTzkgUilY7bm2LeHb?=
 =?us-ascii?Q?IeYqHKDpjosSXGbZg8icy7vEkdabZMZxjb6nB2dKP7RZIdKw+ZnTFjS5+QaP?=
 =?us-ascii?Q?WX9XIge6nEO7PLb2qco/jFFPc7vnJaIkAmmr1ErRSX61brRA4N1yB7EksfrK?=
 =?us-ascii?Q?6nNAGSzLGXsHR9ROd+Dmsnhn2RFFeVvkvP+pZn4VnmUF/YiRmtg7ZLBl7L+a?=
 =?us-ascii?Q?O+Idb4sSzg3ajlngSyErCFYKVqRBzziqQJWB2LTcA85/x00FBcxBkpFJunBm?=
 =?us-ascii?Q?wJAZRn8rVkvzpz3r2nsGowpsht30BvQpqqCNvftCbEBLY54sWPZGYElNte2M?=
 =?us-ascii?Q?oqq3+5vRimtdyFZoF9atiDH3uQ6jbkiDRaBq2YTfylwEXtXlMcVuWJVmaWz+?=
 =?us-ascii?Q?foktHOip50GyHEKgy5P+k/t3sgnY2Jd1AG/mMlhr+KCUMSe4gx/wsP7vK1Ix?=
 =?us-ascii?Q?YWCPUhtadXRFMBD4rQDHasqWvEaz930xDMXDoc/RsMyZU/prhmIwgRz4Ke06?=
 =?us-ascii?Q?tF1FmQxTLilSESgph4XOfs3+NV5eucN36Lqrk+IhRwkrqYef6l8NYFE9YSNK?=
 =?us-ascii?Q?N2KyYiEkydLJ3gqzZSCeA3qO4OnUp9S9YoOIegxWoOv62g0wN6chBTqegEBr?=
 =?us-ascii?Q?ENr5QJrj8TCaT2fV5M4GwqjCiKhGHoFJdIUTlNdK/dhTePvmHJ9MNBJa3oxB?=
 =?us-ascii?Q?h7ooepPpxdQFC39OB/ui4nik58xxP8o3lQskFbaEgoRntPlGKxLK6GY/NqgX?=
 =?us-ascii?Q?yDj22+sMoLbIvi5pm2OX+lGXY15rs1W9Jye1LyrJs1jzMR+kNm5GpgdkoubW?=
 =?us-ascii?Q?o1nqr5cG83H8Nf5jLjulUtkcs8i8HRx7hmz6SPdPZN5NffrJZFBQAtG9Hxs/?=
 =?us-ascii?Q?yE1rHuue9ToZ7mqZtEy9qqOTwYWBoIMz7Y6dMz6yPH/rMFc/YsMkfVn9+4pa?=
 =?us-ascii?Q?kaH9nIrG3GLCSTpxafqJLA48aiftK23oCpzHWHF+sZyAMn32P2pfisAcctCV?=
 =?us-ascii?Q?KwLcUlfnL4N4zSUmwp1D5IIs16e1kn8mBW3U42VfKYgZnxO/hg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Cnj6vpZ9KpiFr3Y3sTcBt8IGVGYQ57b4GGQZFU+wTjGPgeP46DqERrP9tG/U?=
 =?us-ascii?Q?Ff4yFADJ4BEdZjWXo5rISt1Oms0tH1kTG+Yr1wNEjaNbiV8ffqdkPG4DMUq0?=
 =?us-ascii?Q?nndm85npGUW18hK02VyJfi745gfboXcWyN52Iv+ceIvdU+Vz55eD7e+ETnHH?=
 =?us-ascii?Q?4bPzWG8TF3ZRYatUa4+Ry8NhFggGizeSmzpjwtpoQciI7dumKQOSUsaRUOy5?=
 =?us-ascii?Q?H70j4t0VX+iCVet1rNlIzx1Zh4kXkmevMQGFxw4ZM92pVBKWtRurSMI4CnU8?=
 =?us-ascii?Q?YIy0y0RaJJzzz+lu61WL50nk21I7UrzV7vtt5nn6qeSGwkvUakNSkRk9nPiv?=
 =?us-ascii?Q?EiaDNSunPaGX4TVsz+5s7ruO+Q5oVTj6RsOBo3Zp5flBkYuSkelQnY1qkT8L?=
 =?us-ascii?Q?SQaTbpzJZ6uCawDEskThXF3eXfOlFyzxlw0AnXXXbisjpn5uSj1tDta/uRDS?=
 =?us-ascii?Q?67TuNy+NIib94cPg56G6wwPwBQm2PHNyqcQYQnruBOLqJm0/osvCBwuJyBqW?=
 =?us-ascii?Q?qGlmLNs18tEVoYGi+BiJcteqe233f8rzInR5dOxqYj9oOZTt5V7mPWt6SdPP?=
 =?us-ascii?Q?EII/GcRdgvtUEPnKhg9rI3RKj3T0FWeOCgu0oJe3sCaVjpq9UDonVyeiWvQs?=
 =?us-ascii?Q?7A3V+nVfGemwkV+lsJ564TVn8UyaIUssx78005mqymIER2NJO1IwO8/ur79P?=
 =?us-ascii?Q?gK0qdh7KKIkXxJHyapNT1y97o1j/91EDFSbjHEM9FICwYgDpTA+RhKM35sfE?=
 =?us-ascii?Q?MGRpjsxXlPH7et7P/qCw+kPkZK/Ifnl6Ve15dtmNrdh+p/czTQD7KJE1CtME?=
 =?us-ascii?Q?tkwuuK0yeRGhu6Kw7+CFB9jVbq6Z1Z3dO7Ky9rkH41mpuRvAjriUJrUojDX1?=
 =?us-ascii?Q?pEtRF+u6iuefzDwU6xzqnCRv3BbdTpiOg6vdbdv9VnyEW59PvR1ILxrC7ypA?=
 =?us-ascii?Q?mE6247QRPt1++SCHcnEIVU32zyaLdMHxhmAmNHpBoXvGePzv78eHu3b/IRJz?=
 =?us-ascii?Q?LDJKhZOhVE9DyPtDaap0865Mr6fOwcPrqxA3QY8bb569S2b1isx1MOEduwVx?=
 =?us-ascii?Q?r4UohYz5Y2IUGhcDJCSc9hoVotBpO+JwgpWlIaZ55q8ULnVZzmNp2Jklm5Ph?=
 =?us-ascii?Q?sHAwv8tQhVUCqhnWpu8YjXSKvQeiQoREEWsngnahEqEhBumoaZKngyK/R8GC?=
 =?us-ascii?Q?kEPeu29/3hz55GslTtkyK2iOCdJyYdaW5p5QuutquhKZ4yoYRPJDmrvKoAaS?=
 =?us-ascii?Q?m+S+e1gHKsUlFLSog2pRFs9BQPWRqlfgefbdmkMrdNo2DXAMbKylSTKeV5s5?=
 =?us-ascii?Q?+xy1m1vU4hDQji2AC1WgN2slGRsDpyzKDjQLJUP5u0ppymQkT8FJbi13QuaX?=
 =?us-ascii?Q?KljyjpPUhVGt5RyaK429gNiVUNZ1q6DLZiz4BlR3sLAmr6pDMfWiZGshu3N5?=
 =?us-ascii?Q?TW+VfNZYCEMVffHCaof4TYCqrfD3vzrpfuiOgIqN8HUovZC4/ANrYBK+7ay9?=
 =?us-ascii?Q?Bh3hBgknLVeEqxvEQdL9xuzIj8Z50omOzOO+MWZ95Rs87ONQ9PZqkky6eYlR?=
 =?us-ascii?Q?al06GiEA81SZmFk+BlWs8uHWzcD8ulhxXdeytGpa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af522f2-c1b0-4828-0e63-08dd0e45b393
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 18:11:08.4369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dV0N3qCrtIkvqpXRnrlJ2q8Gil6NMdMta3oH21SDpFxhLPe66DecvAdpEKpvvBaT6eesAhC3ZvYccPyG3duPcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207881

-----Original Message-----
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Sent: Tuesday, November 26, 2024 18:58
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-
> RUNTIME_keymaps for all init managers
>=20
>  -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> > lists.openembedded.org
> > Sent: den 25 november 2024 19:37
> > To: openembedded-core@lists.openembedded.org
> > Cc: Peter Marko <peter.marko@siemens.com>
> > Subject: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-
> RUNTIME_keymaps for all init managers
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > VIRTUAL-RUNTIME_keymaps is defined in some init managers and also in
> > some package groups. Defining distro features in recipes is wrong.
> > Define it in all init managers instead.
>=20
> How is keymaps related to whichever init manager is used?
> Wouldn't it be better to remove it from init-manager-mdev-busybox.inc
> and rely on the defaults in the packagegroups that use
> ${VIRTUAL-RUNTIME_keymaps}?
>=20
> //Peter
>=20

What I don't like there is that it's initialized only in two different reci=
pes (although identical)
and not globally anymore. Someone may already use it with busybox distro.
Maybe better would be to move it to meta/conf/distro/include/default-provid=
ers.inc?
Who can decide?

Peter

> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/conf/distro/include/init-manager-none.inc            | 1 +
> >  meta/conf/distro/include/init-manager-systemd.inc         | 1 +
> >  meta/conf/distro/include/init-manager-sysvinit.inc        | 1 +
> >  meta/recipes-core/packagegroups/packagegroup-base.bb      | 3 ---
> >  meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 3 ---
> >  5 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/init-manager-none.inc
> > b/meta/conf/distro/include/init-manager-none.inc
> > index 6ece5c9906..3972e6d8aa 100644
> > --- a/meta/conf/distro/include/init-manager-none.inc
> > +++ b/meta/conf/distro/include/init-manager-none.inc
> > @@ -2,3 +2,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> > b/meta/conf/distro/include/init-manager-systemd.inc
> > index 0a76647459..8132135c25 100644
> > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -5,5 +5,6 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> >  # systemd hardcodes /root in its source codes, other values are not
> > offically supported
> >  ROOT_HOME ?=3D "/root"
> > diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc
> > b/meta/conf/distro/include/init-manager-sysvinit.inc
> > index e2d17b358d..cfb3438632 100644
> > --- a/meta/conf/distro/include/init-manager-sysvinit.inc
> > +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> > @@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > index 70a1035003..cb9d1f07af 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -39,9 +39,6 @@ PACKAGES =3D ' \
> >              \
> >              '
> >
> > -# Override by distro if needed
> > -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > -
> >  #
> >  # packagegroup-base contain stuff needed for base system (machine
> > related)
> >  #
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > index fa06092e27..5cdd161811 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > @@ -9,9 +9,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  inherit packagegroup
> >
> > -# Distro can override the following VIRTUAL-RUNTIME providers:
> > -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > -
> >  EFI_PROVIDER ??=3D "grub-efi"
> >
> >  SYSVINIT_SCRIPTS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'rtc',
> > '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
> > --
> > 2.30.2


