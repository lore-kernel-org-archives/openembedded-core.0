Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21918CD1297
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 08:57:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web10.33674.1712221029536825590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Re5MEUQ2;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712221029; x=1743757029;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7PDYPgcXZBHLtHws9OTZl6rO1CxmUyERVJHUCYeoRMg=;
  b=Re5MEUQ2gNyn3SiWs1ZpDdFbFq2PDoHs0E3SvClOj+QP3Dj9E3dE6aGY
   oZ+eGJfsupBkU7z1r0SIcH8lQrLnsI63jme/MQGT0rAQmoOVw2NZJhjVT
   HcfolGAicTEIPUDO6OqLagf/FtCyDQwQxh/vASIW3QASvtfgzd2RSYa3f
   JblhXbLzgNMD5Mg9XJzFJBnEhk/eIf6fG3E018cb9OguM1DZ04Z0LTi0L
   p5PjKeIzfDCy+FYY1cenEXDaed5Vse6hlYi19lLxW6JXB2hrytgS7IxAK
   xtRlGRJz5xpIbC/y/iPVVdYMZWJnykb0YwrumAGOuVlU+lYBl8Hql1CtE
   A==;
X-CSE-ConnectionGUID: oSA83iydSqCfSdXwFpe9og==
X-CSE-MsgGUID: 9Ag4IOqwRTemx7xvZarIWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7726190"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7726190"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:57:08 -0700
X-CSE-ConnectionGUID: OLLzofzDRx2wSoLKmMO9Kg==
X-CSE-MsgGUID: Cih7h8nYTUyLaTBdfwXxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19148589"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Apr 2024 01:57:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 01:57:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 01:57:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 01:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcH8ZytjCGvFbY0z97gTGCssPVRBhyrLJsI7lNWdlZhFCOKqjS/s10Mtl9ytfQKbDsd1EFbD1qtUqxJiTsKhpE6o41XQT9jQvob5AtsOc8MGIyOLUga2xfaZwAsLw8YLpcNM2l6opTn1djWQ9t+ZB7ahXEYb+ixtUPeZMQ1iW8hdkgFjVDT5hr/6lzoR60l0aV3tnF+mhhfnp3LR2SBBLZSmusDmqQp83PplRyYTssp8EI/jA8oGTj7F2plegHl64zhUtKZV5+vq7lZuMQLomNnv4dNtfnsQerkkVOLOFqdOgiCaRfEFm3xJgzA1+vjtjDye9hxKeLj34AwDXMFlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPIln0m4QEqwdRghXVdRAoSah0KsKzQFmdiZ0IcwZSM=;
 b=hq/YceLgM0uCaZYwSUgNDgVmBDcpt+aG5mBFWnO4UJb++9AIHRe6r+8kDQ/EnbpPadUFUbuS3p9nwREeFQxs2NlhRKJzKid/+8cfT7rqvuat/jRSikHRMg7min/7/cNV0RmjQP2ems9Yb/UnR/fZ94g8Dmurh4Zrp31+ucjdUWVdqJKhJdTNnj2O+andZaAC09han0i0HpmIyBRobDjOkEoAqCDLPbYUy2DwKe/1PV4tv2SHxAl8v8DiRek1vfD29u04fEHbClD48DhR0PSwKKFzqQ5aPCJUUvWIv+GP1ckC5LLsFDVoEMLly35XJaI1D3foRHNmF5khFQxUcOTdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 08:57:06 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 08:57:06 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.4.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.4.rc2)
Thread-Index: AQHagwLBLQUhrxGsLkSF1GAS46PCOLFX1PRA
Date: Thu, 4 Apr 2024 08:57:06 +0000
Message-ID: <DM4PR11MB77604FB9676065B9ADD96176A13C2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e91eacff0-19ec5ff7-4f94-46f3-b8a2-3614dca53175-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e91eacff0-19ec5ff7-4f94-46f3-b8a2-3614dca53175-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MW4PR11MB6620:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkqoId3C4gEeexuBeiAm0qXdKeGxfGoGjU5X8DncwAWyYgiHJVlh7FcgaOqoPDKi47Fms+8OkaaUcgTT2j/IV+kI8Xo2O80zGXJQwTMrMiU8cDl2c15en2oxQ3jDeSDH203G3LqXm1450dMqBnI2beNaTwJWD5h2Hi399iShs5XsTEHQGgg2tcg1ZqvHvzgFfxTZccL4K9cMWIYAoZuYy04m6d8WOAyQ4Vd8Yfss5DcbEat5afCpWXsfzlzi7ZWsu9jZmewUIh1WmWnyWm/Q5182oPHTjlQBXHPNJ7BvtmkSo3pM5Qouu0kx22tIXG/PIi1sSw98wDI/Tf7Tyz5OJmxGpqmtauZvawMHFXww62Aovanzwrq3YL6cs4Nn+t1+OHdGTM1d2RTZTlwIkbnQRhdqYgsFJXt5iCq9fNQ5id3is/fT6eyJIWP+cyG+fltIJYxN+hpXNn8lLCvIsJGPOjaOy9fp1FC0jARb8uXo9UvZngFcIMEzR94lfPgI2vV/mQKbbT7DYRBUEAmcyPO2q3SkUnnnOz6cb0iFePSiIpfzPMR9tE4pRS3UiTWrCh0JB7pvsosT1BHyMzPNZ1rELfTuZe58sB4ujfYS2/RYFbd4UB+AGbTcTM9IzBW91A7Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jG8paB70lVn8+EntuYo311QP4g+JsPAWIJBAXYAk8xTyFKt53KDVyhNPgAO+?=
 =?us-ascii?Q?TROpbhS2zhvSuy54LK5cse9iS2o9/mlzdgVLvRC551N7JvE+MNij6jzhcAHS?=
 =?us-ascii?Q?owr919UXODCja05I8R4cSEmxu/aikjme/Lfb2s57j//MKR2BBBDpoiDS1397?=
 =?us-ascii?Q?fn5zjxIuLo4JpTVqTPxwDaCAF4J0xtxfaE3NT21w4sUZ+C7Ip8OBfjak1ERv?=
 =?us-ascii?Q?2zkwL+CAfFSECKUumZ9YhAZEecAlUTaEr4PlZcphXhAjk/d021nrgEqw7U0Q?=
 =?us-ascii?Q?VkemA0E0OLrmUpT1aiw+yOyc5RLXNV/Wtzm7JTU4sxGd2ET9RIE9TvtoyaFj?=
 =?us-ascii?Q?ysQ5ngs+U3BQ4QIeZxNiMhfE9lFxN/xSGTgtEAwr8F6u1oWuDmldMnC6ipBW?=
 =?us-ascii?Q?MQ2ruEC3nX2EThuyLmYeSspwCHE3GtSYUXmQ9DY90kXTssL5foU9yrUnMlbr?=
 =?us-ascii?Q?pKAKSI1YuIpMh7UuNVD/l8OJblHZKKbOR7c6h18LFgE2NBZTC9ysvIQWae3A?=
 =?us-ascii?Q?RUc4b8JSOXzJ9doEIN40JfiHNqGbc0TOrPrAW5dpJkLRy9JILWWwJC9vDBrK?=
 =?us-ascii?Q?QhxS4T958qCcH7BkmHzr5SUO11RXswC8AWy1Wj+zBurQxrkF53Ts5e5h2TpC?=
 =?us-ascii?Q?39dE56BIostltta9mQOfjGhy2vdlF0ZaTXed6dQP5PccPdRexfYLfY01MuKb?=
 =?us-ascii?Q?igqDx2lRA6Dl3ydpnYkzvoIuYA0/qKEhcb+7qKe8qlhhvD/JVIqpZh/DAkNq?=
 =?us-ascii?Q?xSEIYVLI+l3tLuOgnV/UV0Qoxhca+BZmdDhM2gvA1e/RB+k2eUgIMZNbmgwm?=
 =?us-ascii?Q?NEu+hxsnuZerriCTa/YFbneIS3kilCe+dx0iWB0jqSbd3ng+DSTRLGEcQ8Sb?=
 =?us-ascii?Q?Ad/j2myenFglxcL9TT2K/yRn2GuLH4tRDD+oJ9Qc217KT7HyAAb18mWFmj3u?=
 =?us-ascii?Q?9dcu98QB8SdAXaBIxdvhMQ0NUO/7ib6mtNXchHY1QI9s1W/wIHehBYNrSQ/G?=
 =?us-ascii?Q?qKrjyEdNo8aEgDcQcDEyCh+1T3u8rxPblk433GSLsBoXxN4NrZ2JWY/e05ia?=
 =?us-ascii?Q?OnF2awbdOD2KKy0ZaZkNVc7uqhrsh4fKF+1YPBn2ScNiBs+VkPR9qUjui75m?=
 =?us-ascii?Q?5SRfCHhN5AOKMAcM7xGhKY2kaVrVgxym76YtktgvKKsi82LOz8gF09I+daZs?=
 =?us-ascii?Q?h2mk8AA3BoHfdb2Ybmsk9XttBCB7GwANeOOR5y5nzEoyi/TXMIkM6b0lvDuQ?=
 =?us-ascii?Q?P5b+MLdB/CWt/5VhwqPP5ndqPAxDh+mJMG9q5WiT1128jD/TG0mnkK2Y0QfM?=
 =?us-ascii?Q?2/Qm3kXzf3CIPX8BQL7hX/cYMFkae9eYhqHaaz2BRugbSDnOBZLhC9fBXGse?=
 =?us-ascii?Q?i9mil0ATXbUiASRVE8AO6Vxq+dqr///lAzdoCvIvynkrBqlzV/++fHoffuLJ?=
 =?us-ascii?Q?+hXQsvp08ghTyxRsdaR1b1OXxMpzmBUKHXI3HEoCap03udO8z1FzaQ0jvdOj?=
 =?us-ascii?Q?Rop/ywEmxI5NT/zCfoA8KQY4XLaZ7A11WcGJrZGoYihIMRwHiRlBDvOMgZzY?=
 =?us-ascii?Q?SgaBgGtFEH50xsyoEDQ8aYLkV0+GGf6+7LftA7O1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b32042-2bc9-4f3a-682e-08dc5485342e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 08:57:06.2129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8wZ0rpHmp36k0USJJ2z/SOH8tliOi0uRog10Phu6SGE+EdJjlISXNXz8xzxUqhPHrmrDQ7a37FWyGDo6P/a4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 08:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197950

Hi All,
=20
QA for yocto-4.3.4.rc2 is completed. This is the full report for this relea=
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
> Sent: Sunday, March 31, 2024 8:31 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.4.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.3.4.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.4.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6745
>=20
>     Build hash information:
>=20
>     bitbake: 380a9ac97de5774378ded5e37d40b79b96761a0c
> meta-agl: 5d487f3f281cd632d02b5aa16b2b1e0470f9afd8
> meta-arm: 150169d01f2f57dcd65854a2a43aebef87ee8d98
> meta-aws: 46ece2480cebc6be90a6056361f480d39976240e
> meta-clang: 73c00a5a0bebc871854e43cc1f0fe5bd5e5ad1d7
> meta-intel: e0c541c10f561b9c0087fd07ad5b79b0a534dab1
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: da9063bdfbe130f424ba487f167da68e0ce90e7d
> meta-virtualization: ac125d881f34ff356390e19e02964f8980d4ec38
> oecore: d0e68072d138ccc1fb5957fdc46a91871eb6a3e1
> poky: 7b8aa378d069ee31373f22caba3bd7fc7863f447
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
> View/Reply Online (#402): https://lists.yoctoproject.org/g/qa-build-
> notification/message/402
> Mute This Topic: https://lists.yoctoproject.org/mt/105241076/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


