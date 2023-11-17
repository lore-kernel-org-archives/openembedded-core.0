Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A85C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:45:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web11.8506.1700214343709939744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Rek2dD+4;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700214344; x=1731750344;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6DVZ1aT69avly47OC5YSo4yIdl/943zZLcc5dqafIls=;
  b=Rek2dD+4x3JE/OyVH3by7csdymaP5gt5K1k0urgtUa6DICDZywiwmAiB
   n6pvWW9bIgA+QG59wC4bQPlFR5sG94+dW++Whwkhuczl2LBrTNOn8Bhvb
   w4sgbX4rJlwF4qhEe8LbK5lOwHXrpAcuGumPWzTAqME3D61322qDb6CL5
   e6dl0Ye0cKFVhm1sFKH4+ov8jPWUgGPyPfSb3G4pC3B18x7dz0b5R+9km
   nd4b0AG9XlpTTjbSdFhOBl2J8GfOAmCbXaMObIN0FfD2PKdbom7WUVDmv
   DyhsoSCySbnAiAPV020n8ZLkOLaRuzNd3+6l6yZNjZ+Qw0xYDkpYstXmY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4410420"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4410420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 01:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="889188144"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889188144"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 01:45:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 01:45:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 01:45:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 01:45:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSdjI18pWl9nKZAPN1RKxahE1hpLzdIycvNHh3RRHlGAoL9TR3WAIMd2QemhT+Ql8fNhqaOR++BpsWvKBD7XZKbPVWkUtymNr0E7obtDosuUBfhK7iiE7agSnqVYUmVIaDbzd6OKpwDhZfhhw6bPJxZH1ztm9wCcfu1yFwXR26WVDzinso/C5UUHaD62lVRyqS3Zg3B5fRddCJYq9kYNqittUiGo5QhM51G6hlIR4N8JIqTrI4M6GzhNW5y6OgwVepa/+zWq7gm5z+f4vxN7Tq3Jah2+I1B/1MAQ5odkUEDXwcWDh72dqBwJwxpIm8Hp7KotD9IRp/8fRWLmim8fAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yznrrSBqKDJExCdhee/moH/9LbFv2z/nwzfsW/5zqFM=;
 b=I/XOZeMVPRkbm8R7mvUNeiFC/xdXqpBGn2Q+7cge2jk96cbiarV6KeiJIDT8rcYH+x/rTwFZFeKHiGqbYreXxorTQhmZj5y+0wKg5ig3QYNwFEnWm7R2u0HHyaV1aYnnfMWtCUO/DR7aIhHFjaobmEvsJ2ZfeIHseWp1ICPMJpHERCBJkjuiI2BEeb1YDlDfFhpyHPkfQHaTcuKwpcWWo2aYzSJRUIPfoC9IlRUJAQp11CXzhFkcgxLxLvYolgCBZyfjZqPG5r0KWu9rctYrGsTbQV3pQ4Uctq60k+qL49mfmFE8V16r0Q6VNbk7BOogQ1qW2q+PUF6S5uL7N981GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 09:45:39 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 09:45:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.4.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.4.rc3)
Thread-Index: AQHaFsjDZGusHAzObEC8MuCDfpihkbB+R1kw
Date: Fri, 17 Nov 2023 09:45:39 +0000
Message-ID: <BY5PR11MB41527CB1E583D439D5FA7C0DA1B7A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018bcca4d9a1-91c73446-5e5e-4431-9379-e87da1b67ecf-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018bcca4d9a1-91c73446-5e5e-4431-9379-e87da1b67ecf-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB7292:EE_
x-ms-office365-filtering-correlation-id: 9c4ff136-4469-4e20-a3da-08dbe751f511
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J6QK3/LpWDXgUdjWyoSz7qaYUpbbGSqdYXXe7+TNpokAD7jAIzSZyh9dJjsg1/oWY6wxL1/SdHirBjqHVuFSlJJ2rLHbea0/sEy/07OdG2v8R/JuEKt92Fmnga1hrv/VKB2OQezlg9DQFIMYA+hJhsTI/rFf4Z4GRauazUOiIoG4HA2tJqTDLDrwod6aFpBWUyBaf/ek+81m9u/e3Jx1SptTLKo2jsIMYvCN745tYoiWbwxUSDVjCetFwG3yxmHq2q6EYbhdowopo/PdJKhDCThDhVfW0FGgvQLRXTbOGEQzoicF1I2z49uH4LEcuXaf7W1M6dYWaQIuy9k+k+x+ikjsLHaVCvRSJmAnXiMcUcnuOszGudRQWeGQ2L8HgEwHof4wwEqnANoHWx01tLvhEEJtaEzlZ9R2pAdWluRc7pLrNztsAnhjseUVYX6preNqmDdkTvJkQRlJdkhDrCbiNGjwQ1JxFW4/VJOFP22dY1THxnm2pnpfN0UZab2yJxifiE6oYNS8SdSodzy0Q3jbIP7SNiKBOTe+gBYFCi7bHAUn2IFd8Xpy/2494maeCYPodNyUmZhknysBVM/hcGXN8SmdPAWaeOe1apkS/RdFtOG0fDmZH5J3nrpJvqc7oU8pg3naO2uolkI21xrZaRSiNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(82960400001)(83380400001)(478600001)(966005)(9686003)(71200400001)(122000001)(41300700001)(7696005)(6506007)(53546011)(26005)(110136005)(38100700002)(66899024)(64756008)(86362001)(66556008)(66446008)(76116006)(66946007)(316002)(66476007)(52536014)(38070700009)(2906002)(15650500001)(5660300002)(8676002)(8936002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I1nmmzpG8lN755lNhjBEK3uAuL6xMxuClZ39U5VWq4xIGgoXmdtc9DznRwNs?=
 =?us-ascii?Q?Rmqs2xLU/sXX1McAieOgYcszM0Ad56OPi8qqmjdNsAFz76msru+z90Tpzi9m?=
 =?us-ascii?Q?d/TJCz66mDyz0tJo8Z6HpEKyACa4J7a4+vpNsgHsShqxlkSzn17uQnv9PG7C?=
 =?us-ascii?Q?xpgm2fc64tH3+lAZKG3bEd+oVEXnOqk8A2rFj5hyVUTYM0KLynbSeXQAnNgl?=
 =?us-ascii?Q?IGah/boa90esQ92hZ0rA/xufUHbOX5EUDTc3XdrNpSrHp4S9FoDuSFZwIHLG?=
 =?us-ascii?Q?XjtZwVObD0KVF6TkM+yMBzoGXigz2FuvrWLXstB+flcuJ/rdxLPToaVzVC9u?=
 =?us-ascii?Q?figuSiWhZlRX2tY7fmeT0/VYOrWhH2cTTntg+gCN/kaTbG0bGbzBBYXON+gY?=
 =?us-ascii?Q?LFkx7xmfSfaR/JAM6TBueQC2RLQ0TtFSOQgmaGTfNjaUoT08QJKg2L77c824?=
 =?us-ascii?Q?NtVeBFK/20/fMVpEURTnv08D5phtNfmqEJ5SjuzQvIwt64E/F+527qmsY3W3?=
 =?us-ascii?Q?AP4/Fpz/OhcWAZB9nuS1WORIN6OQ5yPFjEgjYrXES6X7xy+PJaJLZVbYmzrn?=
 =?us-ascii?Q?QXA0s1Mp7QDemGyCozFhA4FClhilWo0lcqXSfiyMlmfbEs8UTXqIw7qx0cQw?=
 =?us-ascii?Q?hmewY3IWCtGuBUmqKQZ17aCN9vX86R0DasCDyHWc1HDGi4t2u0xJ/Lcf6EOE?=
 =?us-ascii?Q?/SguorQlgnnPySWC4sGeJCaCyMEcBgVVxTOyAO6HYnhL7zxnr43oX4MSy+MO?=
 =?us-ascii?Q?fn7coN3WJ0qdNyUNLr2R5sQClaFoUnZ8ci5qCJnih+4tznfUnoKtx5mOOr1E?=
 =?us-ascii?Q?xBWSba8UU8wkr2h75SN+SlCTUPRr03lFvmVPpAmcNgfZz3mFgfNL1VqpXdsE?=
 =?us-ascii?Q?sn57UqVmfnsoXXlR8BGh2Bbu/f96IJM5s6BxnGCgwzfG6yv3OXDU4RB4atBn?=
 =?us-ascii?Q?ygn1jkEKQg2gxTkPqtgEWDTlhnamkGs+zCuxYyqVcMheRpTcXEihGzfv2Z9E?=
 =?us-ascii?Q?AZXZVVr5P7+SXhEXdjg5dKz7uPudlG37u3YA6vEWwLX3y6YLwQ2Umd3k11Yx?=
 =?us-ascii?Q?jmD8f5IQSDp7C4Di8ODaxZCfjAouC3097qFyNm3thtVuXyd/QXFq3htPhNvX?=
 =?us-ascii?Q?14eqN0EEb2Sx/smJSzFQU34YfLyQV52Qj+2yQ0znTT9p0Qt+vb9gW7je9y5r?=
 =?us-ascii?Q?pA/lWSt0+vVmDAph+i/3aEQ3hWW2w1GQWCmaYXYA/Y5oRhfrC0x45fUXsQ4q?=
 =?us-ascii?Q?lGio4y7Z4dK1YMhEuh1i0L/8eOPRa0SuaTd1B7fb+DF8wrm8jdl8XGDCSUq1?=
 =?us-ascii?Q?AevyksWXq6gy+07TCaRTTL3+Zqk+qTbonyPZ+Pz7cXO4WCjpd5fqxMNT6yXu?=
 =?us-ascii?Q?jNt8v8z3w+a0pOwIKNuli7ZQAnNxKYY3P5GycXMPMscp8m8nThZopZiKAOum?=
 =?us-ascii?Q?Fkfpd8PzG5m+lEewwfjWsJwMQIqXy3NdeV98endLX0ME5J7t2ASMbEE/htMa?=
 =?us-ascii?Q?lIk2uASKquCLCsLv/yGUP7pCZmCPh45TcYMP3NDAUgdCZNRU9pZfGTtQdP3a?=
 =?us-ascii?Q?pBtpaBtkm8tkg0nd0ENbSewalF96LYHOfARHK82t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4ff136-4469-4e20-a3da-08dbe751f511
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:45:39.2682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mw08R8OoVQmKm5Lq+izp09nnw5dBUeBj/GlOgSyFTWnWOQVnNekrQBOL+d79oD2lhoBJWGYWePit6mR5PKn4TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 09:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190834

Hi All,
=20
QA for yocto-4.2.4.rc3 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, November 14, 2023 3:04 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.4.rc3)
>=20
>=20
>     A build flagged for QA (yocto-4.2.4.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.4.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6188
>=20
>     Build hash information:
>=20
>     bitbake: c7e094ec3beccef0bbbf67c100147c449d9c6836
> meta-agl: bf791cba6a3bc53864bf719dc913cea352146f75
> meta-arm: 9bcc166bd5bb717aa86bb0464621a36abc51fa19
> meta-aws: b288fb9d29f67af79de07f039429fcf921e2abd3
> meta-intel: 0ed9b8ed178782bbbb74b80dbf713f50aa253dcd
> meta-mingw: d87d4f00b9c6068fff03929a4b0f231a942d3873
> meta-openembedded: 39968837196cb48209b71e8852dd04a2f8ccdca8
> meta-virtualization: b8db7002764712f2902fe9dea098c171b1128076
> oecore: 23b5141400b2c676c806df3308f023f7c04e34e0
> poky: 7235399a86b134e57d5eb783d7f1f57ca0439ae5
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#344): https://lists.yoctoproject.org/g/qa-build-
> notification/message/344
> Mute This Topic: https://lists.yoctoproject.org/mt/102579220/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


