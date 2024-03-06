Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1BEC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web10.7428.1709712869599546755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VZyzK3XL;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709712870; x=1741248870;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=j5SS127Ti9wMhHgoWshnOZkUgo3AgcMjKP7oZneWq6Y=;
  b=VZyzK3XLzvZwPJMoMX6a+1XmssSdol9oee+8qypXzQeEkYqBADyNA30l
   UddXmtBC+hpHEZ63t9Q0tJ8HCWOefANSwfRQrMV35v1h8ayIZClIZtUuW
   BLruMvE6CxXIMnO2XxcfUnNMcnNIqQbXG3ycyV/jWhRt11GVoJ1uNCy3B
   WlZwh2kffAI0qkj+bAufc2e6BLCZh1jfCm3B2PZPE10Lxir99O2Oiuf+5
   tgQbYhb7bcZKY7PUI137Plolm5umX/Hi0JjJHi39w0iDVh9MntJolqFa5
   HyCBVtQG2k0Ww0QPmiG/H+jQpghUtuAZcuvmmlnJAEU0jQVD3JHfIZfeK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4196738"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4196738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 00:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="10072824"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Mar 2024 00:14:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 00:14:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 00:14:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 00:14:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVFHgW3mkA+Xy3tD/n+t+eXueEMEAPVErFI0rnM1TaTI/nVwjJXOw/6wW4d8VlkoN9ID1ykD2FsET5dOq4eUSwYNlsY6nD/Yom0lLsjIJ3I2ZQpxv459L6nO6HRQ0kb7KCX2h09fcqBpqnpNoOv4gRBYlhkoQOS1WYDbI8YHqebBZf+oSi9a0t96XIz2gLcj25xL4vhVwsZ/0RReGXs16tql1OZo6jjhNWn3eBODIQt1NSweVhMix/61LEhOx80vVY6Gz696vRabxRcdkLYvO9VBMHxqObITJ1+kf3w4gLsNrXHKyGK/QJN0cvCC4pqRkiSjzgYOTcHwQpUcZzUF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5gkci9ugRmLSsQJqCzUbzAyY72y5lBXt+LyH/IhffM=;
 b=gj6jjQ1O6kkeMwaN9NcpvA/FUwTqe7xrfiRcvQg77JnfDcWEvjt9FIx+iWde608XGvniZ7Vw7tTZkK7avT7YVbdoFHky5YKY3f17j2FuIxtgix6/qPl99DUrB6PBpdYcWa1lJjX7CT1txBpDy4PThuRWRLdrLwuoTLicnX13ULNYr4rBpc/hLWjgVVpnqUTPL74R/CeWNC81bNiScPmxWC1Yo9MBcZaIMGbXlRyRiFko1crC4+0DjKrjStpI8Eh2rz94sEPjrU21OzntfkCmBRpOjbQPR541om4zxbJyV5s5sLqUGLAmA9ekSTMDrxV00JjTB41hUxn04l/w9ZNLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 08:14:26 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 08:14:26 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.32.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.32.rc1)
Thread-Index: AQHabCYtFInFTKZEv0S6lV58EKbk97EqY/Xg
Date: Wed, 6 Mar 2024 08:14:25 +0000
Message-ID: <DM4PR11MB7760C5D6E5D51A8DBCAA3B09A1212@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018dfc174a49-a1f49584-e024-4894-9905-cc8c0c222f15-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018dfc174a49-a1f49584-e024-4894-9905-cc8c0c222f15-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM6PR11MB4596:EE_
x-ms-office365-filtering-correlation-id: 626dd30a-8f31-4632-ee15-08dc3db57028
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jK2eXFRH/nikgLknLrMsZ1x2d4POthMdm9JbNCB4bPRQbXX4G2qOCv3YRrAIZKQ5VtpGIxOzn+NQ+V2hB37WUVMV3lt0l1nkSXP/pjFh5E1YkYeDWYLrnRAyqgJX1CB2Ubzrd4O14jIN292CgJU9fCskRWG8QlX7dYnJDWCgNHEBw8fxU6ibyvJRD3Dj+OKyQrm93WGgRcg26Has1drfrZQN+Pp7VU38vUaEqgtilhRCfATfTJ6GWauB3xPla5ggLqWO+XwpX3ZmcfFp32GLA0Gqi8z90Mg/NRbxkzUcT1XfHOJrmicvTX1N4bdX8fUHOlwNeh7Gl4W7bnKVMMId1JD8mijZZudvNAhfK/DxFBBSln5vE2yuiP40AmCyP5OxHUqjxQlMPw28AEgc3lj5RnBOv5aCJtVchLyfXLg9KeWCGk//IIrEAofB/LsCeC6z4Q0vfwx1FrqDlO/Fq1av5VYuLuIJ97K2ngq1l5db6UOsKFJQxcdW/C2fPgCz9ws9s7ByGzXNvFhIMW4wOOsSWuFD0OAUtqNmQoU1KTrYJgxjSHulz+zSb65pil+5R4RR5RzjMcacGd7P5VDFQ6Knb49eUuWbpRlbI58ek/yu5wWvl4KeUCxLvzMl77odgjqEOz6iF6cKh//M8X7OMFVvlSIeo19tL8Id2wyQKWxfVQ6ne4lTAJI55LYz4PKLTs2g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ISlyL35UbiybsE8URDwvGR1JhRV7njmrUo2JiMwb5sJRb7SC94W23x4+fG9A?=
 =?us-ascii?Q?Cp68zshc9+/zS+b6KaM366WEMTt4TCUq/onUIHJoMOGJqruZvp8r4vEGpNgE?=
 =?us-ascii?Q?F8YcuFmeKUWNcmvFIs1eABx86Opw/Z1tbkgUQcOFx7gxUfD5Ns4ogsGQoyPi?=
 =?us-ascii?Q?uW4IM0T3L/DEV67acThysuphWmhWnPUOLIWhCymxG328kcam9RzfG1lcZ1Jp?=
 =?us-ascii?Q?vmx5TZ1EjUinfCFH9BDn9CQMm5pvHl2mG3TtHeELgDIMUzUzSqQEYwgBcejJ?=
 =?us-ascii?Q?01lvgM52TC2+LG9stBZjlmp8BVUqvlh1nuISqPCQKMWUOQGgJaQsdx2/5REM?=
 =?us-ascii?Q?KsVwY6gyVJFbaHkrN02PIz9nHOa5Q/LsZDm651IKVP8Apo4aEm2HUR9N+MQC?=
 =?us-ascii?Q?A3t8QZePPVlfZWRd4KnzDe9rTj/T3KxBmAY7Y1OmzxSTTZUhjKbBhxyi8YAb?=
 =?us-ascii?Q?FAe9Vx80hYUeOcVAsQdGCKEy8hs8KIDabo9XCQEhLLUnmTIqjgm2ZBcqGPoO?=
 =?us-ascii?Q?+G2MU0/N63hFB7UdjizM+EDAEb6fTngCY+TZfq3OaoY7sXz7U3wGUSC+p16H?=
 =?us-ascii?Q?PubvVfi18l2n5GSe7L/CswKL5O7LCFymhvD4uAgzVsyEYuJeuW3Dhu3vvjLZ?=
 =?us-ascii?Q?TFPihAUBMqMxn5PzToPcoKkQTy60PWfBCmebsfi3bAu4nW4kkYIBPgLvlFYJ?=
 =?us-ascii?Q?aqW0r8d9Gawy1JmT++7mS38FBP+5zMcCokzIQjOdAWVUXgTEJkZ4cn17IZBX?=
 =?us-ascii?Q?BoXZjRN8gQhOe7L1CjE+OlMvoEC2jLmcNnpQ+/pglY4cMn0PEjBQkiRhZ+Xi?=
 =?us-ascii?Q?aRJFA8Yf/tVDrjoCwDjFvHljimrktZ212je2VULHGKP3R69AeZSTbZTEhx4j?=
 =?us-ascii?Q?yoN6mCcarvAbueZwvZZMZ9Ei5YgY+42LdGncaND6lBC9kd5BznbXmGUsZh8e?=
 =?us-ascii?Q?Bsht5kw0xjTTWjj64pQiy7SvT9wMPPJ7GdlA5Z4llugxUDtywDLn6AqE+4FZ?=
 =?us-ascii?Q?WtGaq2fUNScb2Mh9C+fj9fOyExUUQYJQm5UmZ+MsEUtFhEgkZnK7Tt7A0lnM?=
 =?us-ascii?Q?draZeDVGH8cx4U24qq8NMBpgTckD/FLHZbLXojKbsTQd9H6a7AlTDeE+qSsu?=
 =?us-ascii?Q?jWCe09WRDsGQ8L0AJPIHxENEfMOFWTJcgcUE2uFlSWvJ7gngZuha4BspqFXK?=
 =?us-ascii?Q?VZ5giR1zCbL3pSq3CjmBVk1rnFIr5y2bN9coyiGPgt+1YyfknGxukQkrcsik?=
 =?us-ascii?Q?gsdFnvshP2w9V5I4JphM1B+zL41amGlHwRsaCqLKyeuB5LWS8mhn/Lf9XFyO?=
 =?us-ascii?Q?NIdLRKw/+gAkvCI0SXE2YUvY7DMweuIF03UCvK5YaB4PxxmSYHrPgLfGSqXD?=
 =?us-ascii?Q?zp2KCCHOVAg1t1f//QDrQxVJMyu7+QbAJ3eEFE5fDer/H4ztmCG2ZR7JgGLQ?=
 =?us-ascii?Q?NUShElNLiwvo5pUd87iJh1Dqy3fZ+D3nOdSexniaFAswA8fURipCokxSLqxW?=
 =?us-ascii?Q?jsdB1db026TMqtV8/u7tpLLbmj7fy4kLLvTT7D45069HIR2terw/Fz7mXyX0?=
 =?us-ascii?Q?VKNs/Qo25hUFMaUZi1w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626dd30a-8f31-4632-ee15-08dc3db57028
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 08:14:25.9792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGyyNiediSp9NM9HHM1UJmxhujbNUSj2ITkPCZDTtXCUJIg5+NChuycpfZgGMW+eO+vHKCvP7UGKQqMVamhKYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196660

Hi All,
=20
QA for yocto-3.1.32.rc1 is completed. This is the full report for this rele=
ase: =20
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
> Sent: Saturday, March 2, 2024 6:17 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.32.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.32.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.32.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6633
>=20
> Build hash information:
>=20
> bitbake: 7ce4107bf824b3e115b40558336de25f99af31f8
> meta-agl: 6779dc072af75f1f606b0aecafff80fca8bc8419
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: 6304ff33b112512b31919a7aaf145ab2ceed67a1
> meta-clang: fc56d6c8014f75fbc5a3f272c62ae201888e65d5
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: daa4619fe3fbf8c28f342c4a7163a84a330f7653
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: b49b0a3dd74c24f3a011c9c0b5cf8f6530956cfa
> poky: 54d8a1f631543ce01ba513e7cdae756e2a8e1968
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
> View/Reply Online (#388): https://lists.yoctoproject.org/g/qa-build-
> notification/message/388
> Mute This Topic: https://lists.yoctoproject.org/mt/104675615/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


