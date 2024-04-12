Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFD5C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 16:15:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.51343.1712938548519111815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 09:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HX6SPS1W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4832677a0f=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43C5C6sg012476
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 09:15:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=s/849M/JGgWw3dpgh7Iak7C9vbOqc/RgBOWjEGAT8IQ=; b=
	HX6SPS1WQdxrhoTvwfgiZ42f69cuGE2xVxQONV5uP65Tdl8kTxA6mpGf0Lt4RfHA
	tfTPuPLyjCSEzw+vvaEIe28A26HcmI7fm3on5MNF0WOozDu/j2OYqy8VGP0MhtvT
	WRr82kL/XapToZUCfamG58rdMxhhOi0A349Us+9qNJ+OAutdC3F4T1zTkp0TfFkB
	bmOLUfKMBHpe2Ks6HS3dMivF/wS+iFLWvSr26ynlOjo6IupChs/fXLMIYP8fYrlN
	Q5wY20JcTUzrhYHqgcQ6ddMG1dxcGs8t3gmb890i0jKjQVv2ulll/scRaFazZsfg
	oBEzc6R8kd09f+FuEJR1Lw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgqk4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 09:15:47 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43CGCmhw032755
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 09:15:47 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgqk4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaQziTD4eajS7d+G+gtL+nsPyvVCKaCeKKKOz2OtpBvqk3QcjommyTYDdMhJOT+KTXnDY3tUzwibK2qxU793OXRbVTijPYfZcM2wqhgoqnmDQJwUlw4kXKKdcFibokdn8kxj+3ZV7oFJF4RPgstsM8xe61oEYbwZoCIkTRz5HETNu0H4wRaXTkPMczoIj19fc4izwNeV9gZlKwWMQaHddx0UAQJHBq6wuvxHmdaUqcfvGAJMRNmVVkCnOif8XKuNR1JJWjlF8DevABBLKmoVh2r4qCWygepRvnyiHiRRMvMuhWwmFoDBJyZjvwc9ZBr1YcWToUZ3WFu2RMz59l8kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/849M/JGgWw3dpgh7Iak7C9vbOqc/RgBOWjEGAT8IQ=;
 b=PF8nUSsFqkSvIyjn5aQvS62oB/rkBAN76WiNPb3r5msuwPJAR9E5qkbHMff52IW1ozMTwjiq9nlQMJ234VLwZH/5zWaS+2evJr5ZWnUBl9iH1CSZgX3X4i2AUqT6k4m9SBPxI/pFnOyk8VXeRpB3H8hbyGtk5PTODIPIUhJoyrhxfqAtqc9LS9uxmKAGGNoJKy9hpb+SYCmMAzMxX4w+tg+TmeDFmhY071+RSJAq7+ZTXCQ2NHyggCvi3xkjDEHapkofTo9AXPRwGXyTswZfRdYrUlEq2cJv5oZKGmlz8Qz/xHyfjLd55MAtihWpWP/6YZRvpichw9VtNcJTjd+tJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 16:15:44 +0000
Received: from DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4]) by DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 16:15:44 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Ross Burton <Ross.Burton@arm.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        OE-core
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Topic: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Index: AQHai64R2830e6F6tEehZUoBI5is2bFizyuAgABQT4CAAAl84IABRh6AgABiHKA=
Date: Fri, 12 Apr 2024 16:15:44 +0000
Message-ID: 
 <DS0PR11MB728705D0B2BCE2D91852AF8788042@DS0PR11MB7287.namprd11.prod.outlook.com>
References: <20240411011745.574202-1-joe.slater@windriver.com>
 <20240411011745.574202-2-joe.slater@windriver.com>
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
 <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
 <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
 <20240412102145f2fb8036@mail.local>
In-Reply-To: <20240412102145f2fb8036@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7287:EE_|SJ2PR11MB7646:EE_
x-ms-office365-filtering-correlation-id: 01a77d6e-5864-4287-9f6b-08dc5b0bce55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kSaIlV2dtlb1U5CT6CVdSxdn3UafaEco4phGHbfjBhxAdWg3+a8ChsYGhfE++xZkE8lwk/Q3nthe+ohjXwvIVg1c2CWta9qjjCEQ0Tp/nVdA9u6P5D1CHNojojTZShyiia+RNMsX+zqMwAl3iCQTjqqy+cXmT7RK6g7Qi6NvdCWRf0YysNJaCRx90Amd41IPnDzvQichAE2asGGcpDAercpTeZXMTuq2OyPNP8q6k7upxLYIjxsQGR6tJLt7LX+EJ/5OTUL255zkR6u3euFkFmdq34bYkZhivzT+QhU4E4I4yfV8XG7A86N8F1zRDyaOJGZ/5iP+Bi0N4LIG/MKcGEt3L1xrEAQnJc1HWH86LrrCn6pICWkHyEfecaBh6sYlu+0VUsJBZMf9PdI6hiwFCYsh7O0Wy1haCVY9xNApid09EHe2ek8jGvfLapyARCyXpbYbodqqfiU4sOojaB0BM4v//7RRA248l5KUwts+PyWnt2TthnrFNGQVeg0BhnDltfxyud5uiecpm8Yqi/46ywGpEc3hTuREMKhJ1VAQq3QYmLRcgfJfMtCvs+oUVjwzF64QR4yqG91IO7aWRCbtEuoPR3iNj+r2HkJ+4s0IByzl564Pb9AZZE6VwN9h5KsVo/u/EeZajGnN3r0+L5PPCCWRdrt3Pb18mKgHrp2EoRQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ANi3GvX8BjiLGixxzkAhu40aYnI24XV2EJ3qdOt8+af5qOkT3qYhjgVvfk0J?=
 =?us-ascii?Q?k4dAZNpBr7cqCc5aC8Dv7Mxpe0jQ5NQQVnf09yOtEl46wH5/6/Qvl68GECqO?=
 =?us-ascii?Q?FrbmmmxiRHsiFiSDrFXxdFJc90sObKKkjHGsAHosPp5v0yfUpH3oaLsS8j2R?=
 =?us-ascii?Q?Gy3CPDD1WXoZbrvI5Z+N5LfuNqgQx3Z9f2PisiinKN0wduERLnLIWGDZrmrS?=
 =?us-ascii?Q?mo8mGSTabqU0whB/aDaEBSlt/Zjklgr6jMLMdapBNZIxJm75dYBYuz05i1sK?=
 =?us-ascii?Q?9iYxUFn4b5nTBeRVMmKI+Hd1H1yJYzutglTfQhdOm5KaXYxc1ff1hQIcGl8g?=
 =?us-ascii?Q?xHIt82RW0pxvSBTrQOhDVGmQOFeosNNQlvWZjFnECh/wuPt46OOgdRndhJVE?=
 =?us-ascii?Q?ycEox+glWcQ1ZLRjGi2NGJP3+TDSGHNp7BOF6vlVJyYS+52elorXDaVH7vdk?=
 =?us-ascii?Q?JiS84ME7Mm0rNhWT55IXLFUWKmWllgPsNTIJQspX5dvYWhtHM600E47zrEU6?=
 =?us-ascii?Q?lJvEeIuz+BZlUU+LsOXN8FyL7T0iXe3JA13vjN8qNZe6XMeNmS7UTntfdubi?=
 =?us-ascii?Q?WcwU1o/LE390n9vR6vWK+vJfQslsR7/ZQDUb2QNv+1ZoCRRBsvShJo1iE3dp?=
 =?us-ascii?Q?SZjYXeNUFQTnrAS6FAtSTemecYqueX50RTNaE0xqspVAwmpciNxjrRRvu1mS?=
 =?us-ascii?Q?ViKNDLUvUrsdbWql2AM82YML3NRAttja1ndBQJ7b2mSx6C8qPWwMCvAZEwIw?=
 =?us-ascii?Q?rbhLjrztp2o8e2bm5gMAIgzZYe6CDt5ne6QqFLP0z6maqkW3xzjbZZkvpVHm?=
 =?us-ascii?Q?sGUC/SlfmGJZcN2T4xWE+DXCZelfFTsOhpxJ676kMgKqQT6IxPTN1w/PZXQx?=
 =?us-ascii?Q?WWiDcx1ftQHcLMhhYtIaixqm8s7WGoBjItYczmnadxBWRbG2w99z3Pgc0hrI?=
 =?us-ascii?Q?DVwEMlL7jNZf7QY4abPbKgX3vBHQ5B7/Zw0JCgP9uoxnLEv/T4wQvsH749k5?=
 =?us-ascii?Q?ehZSxAy7VBzzR+Exgk4R9Fi7HfVG5xNrZS0yHrX9pww507ikEnySCyiFS1sW?=
 =?us-ascii?Q?6o1rNkklSQYzTrpvX5nlcYknATI26tn3+3Wa1VpvrcNJE+aMbFRHqhZvQThR?=
 =?us-ascii?Q?IA/4155UyYr7dPElyCXnH92WtgoxnGiiCJ+bp6vZ3u1pyc0EK/VR4qJcpH87?=
 =?us-ascii?Q?IvjuI5bobo14oCt91BS+ueToNXULgGH+D8Nm2HUhAt3C7urFKZ1y2lt42OWQ?=
 =?us-ascii?Q?8SbH5fof2ben+BQq3J+dYprqOiueQv8bSnb5fsFVojDsmDMffYGf2i1RBUsl?=
 =?us-ascii?Q?Gnn16FroL6QeXN//drGaWqgILQgRNaomSKn7GwpMwbQ6X1FGWUj3UxZ4AIfr?=
 =?us-ascii?Q?+AktTuf3yTKpabYiZTszl3LGmNicveA+5r76zAmkxg85wh7HVxZd/qLJafcV?=
 =?us-ascii?Q?ZMHyektpY3X3CMJH9kuqQUrfBK7bBsBuLvY5toF4D9hxZo20EXJiGSH0remE?=
 =?us-ascii?Q?EifVk5u18ZGJOYPH8qE62n26LkFK4ZUe1bJDu4a8i/nmdbXqdUxJA/MNfLqJ?=
 =?us-ascii?Q?jOOtg5zeUZkPXFTCbsXhrpjJOARVizWPQB/SrEbB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a77d6e-5864-4287-9f6b-08dc5b0bce55
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 16:15:44.3882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kdgIcQn2NbySDlp8DI2T3CMFiybMLHPuoDwjiXBo/MegIeD/a/RFRNPJ4pKG0n4zxuCfPVfd+97srjlTVkW8Z6Q2m75iX+RA/1trNGRwkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
X-Proofpoint-GUID: 5oYDFTsie7qi6NIKlR8fTnfe4ASp0yyA
X-Proofpoint-ORIG-GUID: EdlA0nbn9b7LdsZHYVFw6234ATB6Ug3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404120118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 16:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198176



> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Friday, April 12, 2024 3:22 AM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: Ross Burton <Ross.Burton@arm.com>; Richard Purdie
> <richard.purdie@linuxfoundation.org>; OE-core <openembedded-
> core@lists.openembedded.org>; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend
> ifupdown
>=20
> On 11/04/2024 14:58:40+0000, Joe Slater via lists.openembedded.org wrote:
> >
> >
> > > -----Original Message-----
> > > From: Ross Burton <Ross.Burton@arm.com>
> > > Sent: Thursday, April 11, 2024 7:21 AM
> > > To: Richard Purdie <richard.purdie@linuxfoundation.org>; Slater,
> > > Joseph <joe.slater@windriver.com>
> > > Cc: OE-core <openembedded-core@lists.openembedded.org>; MacLeod,
> > > Randy <Randy.MacLeod@windriver.com>
> > > Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend
> > > ifupdown
> > >
> > > On 11 Apr 2024, at 10:33, Richard Purdie via lists.openembedded.org
> > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > >> ---
> > > >> a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/inter
> > > >> faces
> > > >> +++ /dev/null
> > > >> @@ -1,5 +0,0 @@
> > > >> -# /etc/network/interfaces -- configuration file for ifup(8),
> > > >> ifdown(8)
> > > >> -
> > > >> -# The loopback interface
> > > >> -auto lo
> > > >> -iface lo inet loopback
> > > >
> > > > Is this patch meant to touch ifupdown as well as the packagegroup?
> > >
> > > I suspect not, given that runqemu manually brings up network devices
> > > and the last thing we want is DHCP running again.
> > >
> > > Joe, please remove this chunk.
> >
> > This was accidental since I removed the qemuall/interfaces in order to =
use the
> main one with qemu.  I'm sending new patches.  Maybe, though, we don't re=
ally
> need the qemuall stuff.
>=20
> This broke all the tests of this build:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6786

The V2 patch doesn't change the interfaces file and should not cause any is=
sues.

Joe

>=20
> >
> > Joe
> > >
> > > Ross
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198136):
> > https://lists.openembedded.org/g/openembedded-core/message/198136
> > Mute This Topic: https://lists.openembedded.org/mt/105454861/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> engineering https://bootlin.com

