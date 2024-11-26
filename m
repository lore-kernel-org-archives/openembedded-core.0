Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB304D3B9BD
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 21:48:35 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.web10.58141.1732657714286686727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 13:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=XIpD8tpN;
 spf=pass (domain: axis.com, ip: 52.101.70.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/9QPSOMmjhUt0LaQxZ8Z2g3oeQcsGq0CuNfelOtZf7+sbcGwhzEMUQzgYZ6PzKVW4z6zOkzrrB2X6asK3QUBuJSuQhdvJ8FqvKDLgOGodeMZRPZgApbBdNxPa/N/4800VhYrFOTQASpL2tvGWE0tzOA5uFYqQF5DGiYNb6BcY2knSNmTa88tGh96LzzcHdivx0pcoW5E0fQQabnOLtErTM8YbehTE8+aRT3K9RFUgXHcCrrR5T6JHG1WcNdAjFKF7BW774uOk0m0JdBnf8QZ6iPns5mWtNm0+4XCOebbTuHA+EKg12HcJpD2MxbtY9sXUkN+gTaJeT2jZsvxAVnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VbSvtFwmijp0gyJqhzXXjYNRrMSKllNISWsMzkTA+Y=;
 b=dEdM0JiLlLvywYkIZQWHY9JJ6USv4U+YBaYzR35cpFkYQxbXJ/vbaAz6or1/kwE7d2MK9aVcqUL7lSPNxnyXbrndzt4RgKM2aDzc/MVyq4V9AVnv332PDPzw94SXsnLqbpdorasN3y/SHtad3CmX4LkkhfIIYcVWlwWEl+lJV3DM0A++uInRrPe7sz/uwSiLUInA998jGfw7YWx+QMjs4MBTf0CHAdSzVXebp5Lh/9eDHTmav3E6auQU3rqFxjgyinu36hkzMHJkGQ+rP/43YLr8flru6oAqW6l8nf2pNnOA/LbTX2hSHdE1m21rDhF2J7+yKcTwK8aGDcl2LU5SOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VbSvtFwmijp0gyJqhzXXjYNRrMSKllNISWsMzkTA+Y=;
 b=XIpD8tpN4UXZPqtRSO6yAjYp4zllLn7uiw0KbJB6u1gg+mV/+uEBowYm7VbNnahQzA+LOdE5Cz7vjgAM72V53p9shYypDwEcWV1C8Nvp+x0IHC0K3vAWxB2L/lIp39W0GIZgqChoEjR09lg5FvvkqLX5TVXLQYV2bdWHQaskscw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB10271.eurprd02.prod.outlook.com (2603:10a6:20b:634::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 21:48:30 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 21:48:30 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-RUNTIME_keymaps
 for all init managers
Thread-Topic: [OE-core][PATCH 2/2] init-manager: define
 VIRTUAL-RUNTIME_keymaps for all init managers
Thread-Index: AQHbP2lDeQ5IitGa+kuFV4oZ9VGbnbLJ2StwgAAFJACAADxEsA==
Date: Tue, 26 Nov 2024 21:48:30 +0000
Message-ID: 
 <DB5PR02MB102136EF02524C048B66F87DFEF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241125183636.15293-1-peter.marko@siemens.com>
 <20241125183636.15293-2-peter.marko@siemens.com>
 <DB5PR02MB1021365C2D8618C66EC1C2721EF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <AS1PR10MB56976866FE52DA166E4F7C55FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56976866FE52DA166E4F7C55FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=03b2427c-3f75-4dd4-b6c9-90adce813bc9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-26T18:06:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB10271:EE_
x-ms-office365-filtering-correlation-id: 0dfffb6f-12c8-46f6-aaa5-08dd0e641119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?VHfP0mHlRRo4P2SbfAapxrKSMGGtZifl5vV3+mfUdQuShryoZehzWHZDsxD1?=
 =?us-ascii?Q?0BfbeUYrL2TT7/OzaFiceZ3/mWsazDg/hCfwDN+0n8UMD64aEQW3NEpuc5fm?=
 =?us-ascii?Q?QeI/tWPzYjCk53Mhl/tsg2da2Jfs1dsD/1E2gT745UFgnNjttiG3Ki1Jm/w5?=
 =?us-ascii?Q?HGU4/mdg1D7HdwLcr2s5YfG1sXqJaQHTa1lLs7QwgaRXZFMMcdMDbzFKyBfm?=
 =?us-ascii?Q?O4FeavLOzFg/vNs1q4/b8RnZ6vH4eGgt2QUtFtkjc91f2MKRzdtzPAGv9O6J?=
 =?us-ascii?Q?WB1WLQ4Dwfw4M0RFDMTZ86TqDhtkPajOfTsJGMwnZa7AErR6mBTUn1LYiNhB?=
 =?us-ascii?Q?Xfi1ZjVOo9zPaboudLj9E7K0NAuYiOcS/ZzU+nr4I4Hv3M3v4QUD6o8gFn+d?=
 =?us-ascii?Q?ZbtgVWxxy6FQ+NPe1fw4eDuWhrgUYDnd0XrepF/VS/ru4H5F9ub5I2dabme1?=
 =?us-ascii?Q?waNXwd3m0GpCfJFXB9TFs7x2HxNlVsBrJQdV8q7p/cmS6qOzvDfWHA648rc/?=
 =?us-ascii?Q?+kT/sPINNQ8B50asnT/IIlgepEhCes6aJFUoGzLVDwV8XIFtQv+yvCLX5UzA?=
 =?us-ascii?Q?R7+jWnLNUVm+/lUM2dXSBfpkJbMclVICa9WQEOFONeW6jfo0nFM3RsGb8UYR?=
 =?us-ascii?Q?VyPPNFXuOwDYgtW6muc2JT0bC8sxAq/5vLR1wr3G3Wshbrp7pFr/VNMVAclq?=
 =?us-ascii?Q?EWYiAadrp7DNz6jUOayc9bKBDBzRdvLoTfV2OTt7/zYqLLId4AMaGqRTbpJ0?=
 =?us-ascii?Q?eNOy82f9Ca+JadPVD/4KDtTY+YDR831Pyq4WobJod85p0MXDAhipvT6XNcnn?=
 =?us-ascii?Q?kIMMJoi3Hmbb18NRdAdP/7fjhmJHbWpgXkq+ZIrlFzkIzeWPCBwNSGN1nzRv?=
 =?us-ascii?Q?bgmcSS+rgOQXDg0D6lMNBpLIIGUN68OToIHtsnIu2CwPLXLi9sl2BbTaCccK?=
 =?us-ascii?Q?cBjVfuGH6XPgQSVGbj5jWNofyN2UtQX7K8sBXf/i7xludN8Su+PQ8SWTazYH?=
 =?us-ascii?Q?JGHh94u/wGlJ2DW82LguDwW8lWdVAW3IIvC280V+z6MOOUV7+J5AQSH3QqI/?=
 =?us-ascii?Q?mUlEDxpTfDF8Ng6+wQqWgV0sT1Rc4hC0AJ63qv0G9ki5ABBl85d/H+7BIRgZ?=
 =?us-ascii?Q?n85fFRAFJKVywPcENVVnwA/Xh044Ouyi+zYHb+ruP39iMq8zhZnNvoo1AYV7?=
 =?us-ascii?Q?2djcblz8kx+xBr/BKC2+cFHs7sKyKlHmFGbu18eTtSc+Zjxf1GM2In4vsNbC?=
 =?us-ascii?Q?Y32RUkhamQuMdJh59f+zda4bAomllI7IQPWurR9gn/CiGQlqmdGYSPzW+zQ+?=
 =?us-ascii?Q?KiZoTA71Jw4NQuF+SsYz4gyKe9yQ5l50+HC/pN1AbuTTDx3mRuzUCp2lbW3j?=
 =?us-ascii?Q?PxnVxC5G5VnO/G+SgmxsqYx7s8l7lYiRuHC+9M7wuA/r1kn1Ow=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3PKR39q2FAskuXVCgcSTmJJLN6WSQF7sEsTEwgSHfo8Yj9n92YLnZnMvdfgA?=
 =?us-ascii?Q?3joe3dFy+P68hoaxWVT/pXSIN9P/RSF5gd2pRz0mfFbwCGFC5xjxfYEEy2ns?=
 =?us-ascii?Q?wI773hxZJHXcKnmtIgqzeLOX4qFkaRi9v2HQ8ENKrWAoUHz1eVgwrsZMSw++?=
 =?us-ascii?Q?g/nx8AZPJcg86HPEDlUS4RvFKk2qNIcUogVMu2Qnd0E6xWq88P1x0ypWwU0d?=
 =?us-ascii?Q?mzP4no9mL5m9fB82N+TijTu/VhHC0rHyc3NyDLV77WpWhufdZp5D0eDth2eV?=
 =?us-ascii?Q?9586gQ0zqKNJ1we9IL86558DFSS62l9pLADv2qgqxpiMuyFjIj/6YuCSEqBQ?=
 =?us-ascii?Q?BGNzEcmjzWVKTWFAtFHVSK/m9bvPwfHXxKac2F0UOByftYGrp2ct7TiM9fKy?=
 =?us-ascii?Q?aiNVp71UVBYoJHl0YV1iJ+4boZ9vnCpNuqDAPLzSX0VGHbo4kalOW7aQ576j?=
 =?us-ascii?Q?y33XjlwT4WkkNPEpYxDGtUUGswJu9i8ONFuoJs/R3myu0KueHAQbbV33ua7U?=
 =?us-ascii?Q?jjg+Mnug6gjI93UGgbyPYMUNsytQYyImxddwND5q2pC+1T0iDGJMklZoHu/x?=
 =?us-ascii?Q?Jms+8tsm1V8PzRfC1hOn8f1vYM79upW5hU8xmt6j4//FwGyFKiT/kLQse52p?=
 =?us-ascii?Q?gGWDuNdQadOiHpfHxmyl9fRtHFgNrKffXpG7Q0amUvVdhOO5T8S13wP8gIi7?=
 =?us-ascii?Q?XaPl7bJMz9Ce6+NYynLg+MB7/i5dCb/w51fDZyjHPH04W2QLH2i6yHXSkamt?=
 =?us-ascii?Q?RKon2RpLvJSBx7K74no3LWcUg8HJWrxeH/unM+L1/eEh2IEzVomFISBIjeuR?=
 =?us-ascii?Q?ErZ6FzUE0Cu1PkmzyzDWx6Ox3tCKx+sFJEcU21t5gaHA8+Zm+MT7Rw31z5l/?=
 =?us-ascii?Q?LvSdZ4jGdQI8pXzDaebPn6l14CAhdlqLAWl+omg8uo1Iq55mG5aq2Lg5OnIp?=
 =?us-ascii?Q?quZkcyQHIkJtjAQPAy+uunJ3bIhmLKJg4Tq2Np7hcoDve7mU0+RiN2koUSKf?=
 =?us-ascii?Q?4H8doSJ9rBg3Th8tcp/sw60CZtt9JSZGsEupPMXwS21OxuppStJNjKN4xqwr?=
 =?us-ascii?Q?lb5nai7m5O1OFBKtp1905TNK0+/V4P1ZNj3yypAVgRKkJIaSopmjFZAtW9eY?=
 =?us-ascii?Q?34J006JxFg4iYiIXYI2D5G4XlBpXx3xo60EtP/CaFEst/imPyB2PvFAdj0ck?=
 =?us-ascii?Q?n45kvw9Jn/t9H4/FqZWwJXwpb0pM7Yr3WJK1uT49xN0aGLT1YwLH9pfKdXdR?=
 =?us-ascii?Q?D/bioag5dFFzm0HUn+mVzEp5gIcMEBspVOymytQdJHESojWZsHMxktX2DzJK?=
 =?us-ascii?Q?gbr5Xej0mH6Kqt9Arl7/IPDqKjnFgXZmUfWVDtrcRMllCVhtD+pv+grFl7qh?=
 =?us-ascii?Q?vnYIiBcMPYtlksl/8wQahy3vz0Ix5/K0pKq8ybMI8prLw55ER7aK/n1q2CH5?=
 =?us-ascii?Q?+a0I3Dm8B1yKQ14nPuwvNQydOidgFWwEyasDOU+FvjA+v51Do7Pj+jRWcx1b?=
 =?us-ascii?Q?yzpPLdgMyPedVis05Sd4Cxn5c1sJS7Hf3GP7MaPauytgSaE7UZROrYiyAh8U?=
 =?us-ascii?Q?z1LSCIFnPRz8EUjjGF0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfffb6f-12c8-46f6-aaa5-08dd0e641119
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 21:48:30.2812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQLptmKRwhlttFH9zPLHpL1sOG3ADDYs86ok+pQXB0+RCHrlna3fa2g82lwDE6NK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 21:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207886

> -----Original Message-----
> From: Marko, Peter <Peter.Marko@siemens.com>
> Sent: den 26 november 2024 19:11
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-
> RUNTIME_keymaps for all init managers
>=20
> -----Original Message-----
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Sent: Tuesday, November 26, 2024 18:58
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-
> > RUNTIME_keymaps for all init managers
> >
> >  -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Marko via
> > > lists.openembedded.org
> > > Sent: den 25 november 2024 19:37
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Peter Marko <peter.marko@siemens.com>
> > > Subject: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-
> > RUNTIME_keymaps for all init managers
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > VIRTUAL-RUNTIME_keymaps is defined in some init managers and also in
> > > some package groups. Defining distro features in recipes is wrong.
> > > Define it in all init managers instead.
> >
> > How is keymaps related to whichever init manager is used?
> > Wouldn't it be better to remove it from init-manager-mdev-busybox.inc
> > and rely on the defaults in the packagegroups that use
> > ${VIRTUAL-RUNTIME_keymaps}?
> >
> > //Peter
> >
>=20
> What I don't like there is that it's initialized only in two different
> recipes (although identical)
> and not globally anymore. Someone may already use it with busybox distro.
> Maybe better would be to move it to meta/conf/distro/include/default-
> providers.inc?

I find it reasonable to move them to default-providers.inc.

> Who can decide?

Send a patch. ;)

//Peter

> Peter
>=20
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/conf/distro/include/init-manager-none.inc            | 1 +
> > >  meta/conf/distro/include/init-manager-systemd.inc         | 1 +
> > >  meta/conf/distro/include/init-manager-sysvinit.inc        | 1 +
> > >  meta/recipes-core/packagegroups/packagegroup-base.bb      | 3 ---
> > >  meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 3 ---
> > >  5 files changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/conf/distro/include/init-manager-none.inc
> > > b/meta/conf/distro/include/init-manager-none.inc
> > > index 6ece5c9906..3972e6d8aa 100644
> > > --- a/meta/conf/distro/include/init-manager-none.inc
> > > +++ b/meta/conf/distro/include/init-manager-none.inc
> > > @@ -2,3 +2,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
> > >  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> > >  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
> > >  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> > > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> > > b/meta/conf/distro/include/init-manager-systemd.inc
> > > index 0a76647459..8132135c25 100644
> > > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > > @@ -5,5 +5,6 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> > >  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
> > >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> > >  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> > > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > >  # systemd hardcodes /root in its source codes, other values are not
> > > offically supported
> > >  ROOT_HOME ?=3D "/root"
> > > diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc
> > > b/meta/conf/distro/include/init-manager-sysvinit.inc
> > > index e2d17b358d..cfb3438632 100644
> > > --- a/meta/conf/distro/include/init-manager-sysvinit.inc
> > > +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> > > @@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
> > >  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> > >  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
> > >  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> > > +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > index 70a1035003..cb9d1f07af 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > @@ -39,9 +39,6 @@ PACKAGES =3D ' \
> > >              \
> > >              '
> > >
> > > -# Override by distro if needed
> > > -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > > -
> > >  #
> > >  # packagegroup-base contain stuff needed for base system (machine
> > > related)
> > >  #
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.b=
b
> > > b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > > index fa06092e27..5cdd161811 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > > @@ -9,9 +9,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >
> > >  inherit packagegroup
> > >
> > > -# Distro can override the following VIRTUAL-RUNTIME providers:
> > > -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> > > -
> > >  EFI_PROVIDER ??=3D "grub-efi"
> > >
> > >  SYSVINIT_SCRIPTS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'rtc'=
,
> > > '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
> > > --
> > > 2.30.2


