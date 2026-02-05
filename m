Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C3DE9128F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15959.1770278029893663053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ci0X4nSm;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770278029; x=1801814029;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XNH/iv+kw8ydIM+W2PhL97gQ61S2Y3Mmm6lzpiMLBJw=;
  b=ci0X4nSmrqlEFhzTT+itYDBcIFddDLQ0C4YSVVzNEjfTTOOQBW9SfCoX
   I1r7XM7c57PcIOe214PW11xAHyS2n4Rxwh641+8yCnhObuwUS6RrpBiFb
   KYucZHmclp1ovA6ZvybFpQa+i5OEpanmsPRSb8XIyv9/D1VAhNIIxhpXA
   GEnvU/IJCUeIacSEoGq1luvi9i7OHIEw6ihGQ0Z5n7TT/0Fdke+4coARU
   wCPEfFpqOHcSlT8ItCDkFjynaaR+kqSomGN5MIqC7/NaJlT9jIdndseI/
   yOZhwTzeVOixrJDypFK1Aorghivj5wDOf69pOXAnWcxMAMj+mZ5bQD/7V
   Q==;
X-CSE-ConnectionGUID: CnCdA2rgREuabmJeBymoDw==
X-CSE-MsgGUID: g9mv8oU2RnG1vwK3megijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74072810"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="74072810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 23:53:49 -0800
X-CSE-ConnectionGUID: nhN2ZxjdRMyTLdYemVRf5Q==
X-CSE-MsgGUID: BD9Rq50dR6u836XTJ0UQAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="210403667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 23:53:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 23:53:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 23:53:48 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 23:53:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGLYEc549mhGMc/Kgzz/+4JPjGQHBZG3uk0SyKLdngdQTndtUjZwnU01ovzMSEaQCGQyDY3E1zoN1lBKAldWfnA80qIGJwcC9JkxHtzFcgQsvjDqotIxC+9QuDNCvpeTlYlhXPsOSENyo8RHBLprh5lkimrRjcsqP+xcW8PQsAkyU8Oh3zhUnf7/HoAVToj5DMr29e7IeWXsHoL1iHqDXrClpVRbhAq9jXcTg3dmMPsXeqygOWGsdk/IkLO9siWxW//pHGjUqV8OfxKFmv/zY6PQEaiCkKcR9GvefgDqEtm6Qj/0MU4pEfPUdh8rh7x+EMRvIm9nYXrHYbSMvxXJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHR9y7Udis223TeB/N13s3lwBGHtvH3qU0CmjT1hfqQ=;
 b=xmlcqBNzC701b7CpLvNKEXZ7SnQDD9RyLCyhdNrmb6w8S6q0KDQalTC8VSuWeZVCB3ulRvaM310ULgqW/TS4iZGWd8Y48/XpKoT863VAdmjaeSRI0px3HSPBSiqYY2+VVeinWWKxIzyDpVS8SB1SI64jWH/G1MwrPvny7yhX64UstSSig7lIjk6ObcqWZI+fJc9kAILc76KrAv6wMut7liIXXkRkc/aHMFWVSJfPfoaeq/P+TYi35UukOvgtkexNVX0qIZDbppFzdo3hMBUuxWktFmaXQT+jP27waX49wp+JPKulrGbXZ9elD2jdVx46w1ReNn0797eLAY/TguFrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA3PR11MB9486.namprd11.prod.outlook.com (2603:10b6:806:47f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 07:53:42 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 07:53:41 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-6.0_M1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-6.0_M1.rc1)
Thread-Index: AQHcjIXYA0IcsNhQRk2f0+dzpzBEcbVlfaNggA5Ru5A=
Date: Thu, 5 Feb 2026 07:53:41 +0000
Message-ID: <SN7PR11MB701884DED3EF0ACC02D200E4F499A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bebb2c22c-d9c6e88a-4fb5-486f-8c4a-33fb4d49320e-000000@us-west-2.amazonses.com>
 <188E7E86ADF040A7.3927578@lists.yoctoproject.org>
In-Reply-To: <188E7E86ADF040A7.3927578@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA3PR11MB9486:EE_
x-ms-office365-filtering-correlation-id: 94289635-9395-42dc-1fb2-08de648bae19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|7142099003|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?EXe8PkgTtRtYlro8CaZ+fvkAuAbNvH8eBHrk/Gfe1gkteHeKkSLuY5rUB1ey?=
 =?us-ascii?Q?c2EK1n473ApbS64doCfCyhf/fIH1jq2Dc9rtJjeI1STvcO3dao+ijtQZVRMe?=
 =?us-ascii?Q?iYAnxNObJFF3x0u9Sis/z1uRTryzW6LPL9WcNhBfC5DxICJnEM1XBPSDjZtV?=
 =?us-ascii?Q?8mB+FOqZS2gYjwJAD6btkmgVrM97PBpk2QMf4Mbc9s6L/IMc6ok0BgcWmHiF?=
 =?us-ascii?Q?4DsO+5+2QDMu2eAQNxOAu5mHMNgiza5ovKGi2ra+JltyZ6fUlGF1hQoWsY5l?=
 =?us-ascii?Q?3DT1ULrNeldrlYO5vzo/dDLeqOTcSFzvYSIPoxSXuqXdASwjyerN3lwG+9+6?=
 =?us-ascii?Q?WhkrpAUH41EFRMP63pj55SQsLBceYBtPO8MczNpX/azi2sLmIgl3I6ErExW1?=
 =?us-ascii?Q?F7yLoA8qcFJ9tbRV88jYG0aGsq9vo1ADYxwCNHLTOoY4inj+IKOy07KUTN54?=
 =?us-ascii?Q?nIHI1yO2k1TBorIzMOonDeZQmbNOksu0Qw/7sG5K7xPYzH2hM5JBvSYbgip+?=
 =?us-ascii?Q?zMsxKctc9Ed/6C58JZ+TGI0tobhA3JZ8cEOaKwIMRoqXRy0YdxhhtCQ/0R2x?=
 =?us-ascii?Q?aUdumNB1aMpPJXK9TIUljFbMZdGPpa5SY34milUww6WTswE5XuDqQNIl+t1z?=
 =?us-ascii?Q?RHCD3Up3Qqjy12g+S0EyrCJ+47HPEukcTAbP3vNHaXS+bo8VVHhFiLHjhJx+?=
 =?us-ascii?Q?hQh5UV9A+7KLUclplAy3JlGelnWoAt4Q3FjePOUfvUq3NltCvFK1Ltx8rwZM?=
 =?us-ascii?Q?8VWM+cYKzOEpDUJlduBinmwC54Yuw0dCA47k3p8oGJzSjHfK16nM21Sj40kj?=
 =?us-ascii?Q?Y9OCggHKgNu8rDymunUYJrjjJIrMnkRR55ivqorR36mKxDvFgbed9wGp2H6c?=
 =?us-ascii?Q?JeI+zSzWyq7uwtsxjsONUrCYTCNg1BCf+sXjXHFE+bXvUsrYi/JrZN/FXWxF?=
 =?us-ascii?Q?UpHIJ3pQUGtBMbEbj1fvt6eKPoXSoLb88bhYmr5d2erYyyrmWvSLL0IByzRV?=
 =?us-ascii?Q?I0mHHJ3hu9affVmx/hozzpICvkn1qDe1/mdCIACRhZDyIRJA56GPt9ZjHPk6?=
 =?us-ascii?Q?eDZyjoRSIpQjFHvQV9/zLwqWsp9vgfuwPReu5n4VUO3NswwbjpgrujZXr6wB?=
 =?us-ascii?Q?tNlMtSsq2mLolBc4fs2uVQADl9vgXT15uEdNskTl7B/ryb6ytMogfbVrz02w?=
 =?us-ascii?Q?A/JhcyJGlIyNUZ4RV6RTG4hXf4FR6Ny/dtUxc8LNahkA14CW4wl+8I0keyTZ?=
 =?us-ascii?Q?o54OVTc7l0pXrBob/DcmKT0IyeZwtiR+YSuoOtyE0lp73m+fKfKIQoo1/nPD?=
 =?us-ascii?Q?i7Rf0adMKqw3AEvViMlT7Sko87zGioGvvEmSv9DXxJAxw2G+jqONaYqbByKi?=
 =?us-ascii?Q?PRSRWzoc+iQfGtfRt2VPgXKPQgNGJ2SBs3VWyPt2G5S6dOxir5lD1D3ENSd8?=
 =?us-ascii?Q?6kMSYuCwho8BXeclXHTQ/lj2rQBxxVUwA1Wj36sV8Y9nfO2T/zIqXv6B4GPt?=
 =?us-ascii?Q?Y8yB/gZh/6wgmGPAmm/XjzovAOErdHxMGunAKRhAGmG7rfJxczB2PLy/EVhq?=
 =?us-ascii?Q?pX7C/XIC3LXoatIHx5RlDyAg6R6nq3Oz1gxhnV3M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(7142099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tx1/nUqZ7Y3p7Nt698T/iFCUzC4+d97nAeMgYLPq38P6CKOFtdpMacBu9kub?=
 =?us-ascii?Q?mlK+QAsGM3sEq/P4Yiixvlg3XqYpmYA0TLZcQv3ItsIWkG+e8u4lAC5jjy20?=
 =?us-ascii?Q?mZ00Ck27e1X/YIvGXa9wF6FqTpkjsEZcFsof6rvUKsyu2Wuz3Vk+Wv5Lqyvs?=
 =?us-ascii?Q?sl0orrshzKQy1Q4IG8smcR+yIFVFcmnKlBFL/VKvdWiY6gI90qJGH+i3gRy8?=
 =?us-ascii?Q?qNgmUyoktMSeQZp9HYs+KTl5U0lDkNt26EV0OpQwSR05h3TuSGyH3YKbPny8?=
 =?us-ascii?Q?qY52Fbuhwj2DVux1wCrS0zB91T2ofbVFY6VXp2KGZ9lKH/hSvZTrMNkGe172?=
 =?us-ascii?Q?vUlW4psI21SZ9PpWVGulrF+BqJZkAnQV37B6uAiHRYzoXyd/nqrzTFG5VZ0Q?=
 =?us-ascii?Q?9Do3e+Z9jz/YgxedBi9Cj4zioeG1i7+T0sWfSCqa8XF849UImECYc9fJns6n?=
 =?us-ascii?Q?y9i+6p0J8xJgEfoXqowV/dYfJbRx/R7GhB+mWyy48O17y3fMmLmkt2WES9fm?=
 =?us-ascii?Q?iUMUjSuajFFq7CiBtHHVccEuyYoy/imoja+xA6PS2a0469ynWemWSbsPmvrh?=
 =?us-ascii?Q?DbJyh9crrEfD9QgPJFOAxEauuzPno2mXBGMlyEvFccae/gVunclLdWo42W60?=
 =?us-ascii?Q?pUURrmRX+GFj4LC+fbYXHVOfzNkU7Jq8DofXNkdX3dSm2BH3Ka6tr+FH6Mr2?=
 =?us-ascii?Q?YaPdb8PIgC0fBifCzgpT6A/+fxaBDQqQ3kmb1+5F0B/8SMPBaWYAsQA/2v7X?=
 =?us-ascii?Q?r2nErpUt14hNZBcat2cFNGDTpWFi9swNA9llsf9StIdSxkIeljxvY/lAMbDP?=
 =?us-ascii?Q?x9OfDlUYQifbNixpuiJRXpgIexuX7KdRqD8rf2b6YIAZF7DEqTDfg06AeBh8?=
 =?us-ascii?Q?DmAGwAKm2zUKHqBQ0xn9NLYnofcDHEqzMBzAt7ILCxb5cxoKqgI43qLbmUX8?=
 =?us-ascii?Q?xSV7s1Fus3cyvj0aD6vCaSHSaE/U5/AS7Ry6v8NU5ZR8uxH9p+EJ8TetNV2h?=
 =?us-ascii?Q?B4ikIL6Bsz75/8v9+No+W7lacwmiexOvp+nQzF1hZhqbkx2L/k1qfya1/oJD?=
 =?us-ascii?Q?uUME+mEpZKGvaeDPOMzDQIxsyDyhv/5EO/0UVidzL6JC/olqeCn/AActm6VX?=
 =?us-ascii?Q?XJ78pxNVBqL5MQjOHWZLEdYwdxxYx8mgxFVL5sL3HEJZ8qzaHtlPwSaFRmwE?=
 =?us-ascii?Q?ealldo7jg8Ksu6yNWVV1xj0BXc2c7cY/1D/+ZkjuCJQAtAxO+5ReEyqlPJik?=
 =?us-ascii?Q?sGdD4HmwqJ+auJRk/SSYHSfQTsoNYfGJTTmpjbYVRe9uyVs5PYn/dBOvovcP?=
 =?us-ascii?Q?FNFc040JYGOhgNZ7HrEFWp45FQSRmINYkqdjchk0n9dtIiLv9Ur+hE1R4K3Z?=
 =?us-ascii?Q?qs6XCYTX56FwEBG1Jvqz0Mpn+o+s288oZgRY2GdNIUn7rHlBfPRr7h6qicwU?=
 =?us-ascii?Q?vJ317JKaHIc2pWXztkFvGWC0DMlSDwBBVvvzYqraqLEqVq27wwUYwwx646ll?=
 =?us-ascii?Q?EIanv4Gc6oSX5nvV3RUYL3a3OyfxUmujqYFQiaAS1FkDql4CCWd9KZaANhsa?=
 =?us-ascii?Q?6AD+HmAwZkD8TVIMK18dxu8n3K0oopJ6dPGHXk9Hep4ybuYTyNLGtvUFgdOL?=
 =?us-ascii?Q?ObCGAWLrtK4dPobo1dMrTVbqhCorvCuBh1x8VU3d81JIWqhJR+9AN/ZjfmHJ?=
 =?us-ascii?Q?oCyXX2yG7Fom41HCnMWYU5BTYP/KmDziaaz4R4FkOWYFWZodA4COy1LQ9iEL?=
 =?us-ascii?Q?oqsiv86xdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94289635-9395-42dc-1fb2-08de648bae19
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 07:53:41.7223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZaWm7ALuYq3n68k3+REpTAvNnJfQaBDVK3H/NMIHmcroWgs0ErgzuBXvwsXJt+Gx8/ngeaPizqz1R/edWz18w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9486
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 07:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230565

Hi All,



QA for yocto-6.0_M1.rc1 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.


Thanks,
Debal Ghosh


-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 27 January 2026 10:44
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: [qa-build-notification] FW: [yocto] QA notification for completed =
autobuilder build (yocto-6.0_M1.rc1)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0_M1.r=
c1. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:
OE-Core
BSP-hw

Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay


ETA for completion: 03/02/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 23 January 2026 22:02
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-6.0=
_M1.rc1)


    A build flagged for QA (yocto-6.0_M1.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0_M1.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3116

    Build hash information:=20

    bitbake: cdd79c1768ac396a9c6577e38098da4331507f24
meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10
meta-arm: c3c97a6b8f39afa7459ec21ac55fa04164c0fe92
meta-aws: 72441d9befcb4416952f31bdd245f44d9d80f8ae
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: c62b2d0e99e6526d0ff0d0bcdb23816cfdcb6292
meta-mingw: 11666fce6a3cc98bcff6fe2c6bdd9e48faf03767
meta-openembedded: 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6
meta-qcom: 18c6e3f42ddb07f4b4a87f44324b3fb60e6c3a2e
meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
meta-yocto: c23c19e0b300812bad314f1d0a901965315271ae
oecore: 6c31c2a731858108e790acaf38679a01b0d1a035
yocto-docs: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#648): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/648
Mute This Topic: https://lists.yoctoproject.org/mt/117484166/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



