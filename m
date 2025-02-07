Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871D8C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 10:18:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.66440.1738923482416840693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 02:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OrTWdELS;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738923482; x=1770459482;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=P8n1SMnUCF3YGrNVd6dyHHUdEGxahXi3BYo/iZDr7iw=;
  b=OrTWdELSZZpcuKj88nTnDg7Lhdz66LfwSASDyR2eAtpK2iQeoygXdJ84
   PXXdJKuPG/bGMlkG10PkzwmkiwuTGuJ9UWdmQaDlMF+PY4AP9j1kHencS
   pTu//dajt54DQSknb62ROZ9pst8lBbRmUAriudrOm5GUYaRJY4khxtehY
   GZWWClaYCvf2nQVQ6wkqNcT+oXRtvJCcbx5/RdPWSK77Y66kSOIgrdeNm
   7u/WkE8Bk/my3NSwrxz+daUAGFJBQScd+duNqGzdfz7V/1I9i6I9/qFXE
   l724ZKvMbEmiG23+z05Qsq37EWtFfrtQYaWdZA68YoBQEhEnmcz14frGB
   w==;
X-CSE-ConnectionGUID: tUzuv8iIR6eooa4mlCuDjw==
X-CSE-MsgGUID: wN5YzOAlRyWdvsl+GPEC0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39466400"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39466400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:18:00 -0800
X-CSE-ConnectionGUID: bFMGdpDkTD6rzrkZycFHHw==
X-CSE-MsgGUID: YSPhuVTQQoKETRmUpaO+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111921251"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2025 02:18:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 02:18:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 02:18:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 02:17:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YztuTY51+xc8+1rrASXpyXR90gdKvyRQBzE9jrVXdwFdjM4AYh05+5YQqSsZ3/ocGxOuQpBW4wwxyfK/QnhOoASBT1z1yDXbsJk8XMptcOYCsnQGlj/UpijbWUFt5t3cGv23ZB3Qu3s7LEFVdoSh1q8LUANcDhbKJG+s2B9RbEx+cPa62dC4dZXyBGTWi7TZBuPhaqUFLxEMurHUyYwYrdzdiNNka3qa0MM8Tzaq0S7d5imnYTk8yhWCYQPO7B7eC6DdvJcSkpxsmvQKyNJmxTUcFUE9Xx9gGliqlPefp6AfyJrSpF2SQ7fT7gbP1nRhZXagiArgoFXH5zDhh2DPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH0H09BhMSmnnCgkzm3SBI5FMAoXaskBxhOsJkOsGw4=;
 b=yWQoKQsOzMucEbUSsDbTUHNlKSct7XixiG1hYLX7lwRdn+cutofHB1SQBkcILINW1cZ51/pL29A2OKdP+L4eYH4ksh5ACLKG49uF+1QYAJtNNFIUS/SdsOj+3k5aCUIMPfrZ1KSXxIvvMP2MBYPtH/KXyc8mwJ8V2+2S2xc/GTQE3/scgCkLtHxX11/61+c0kUmSGk7dJDhZI5KrA9EDb+35lRZrvgyjYP7fnxT1UbPpTgwgSGUViM9TwqOZ7C5BDIrX7uT72lJuHb4uM4ZEDJia5BClFmEhYSYOibR97GiifOWsL7sM5kiPti3yqukW85uHzfBFbR9AYscPJHUyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH0PR11MB7564.namprd11.prod.outlook.com (2603:10b6:510:288::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 10:17:39 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 10:17:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.7.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.7.rc2)
Thread-Index: AQHbcFtSqXLb+EvkTEKJcY0wk1hRu7M7sbMQ
Date: Fri, 7 Feb 2025 10:17:39 +0000
Message-ID: <DM4PR11MB77603C729CFACF43473F908AA1F12@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010194a5634f05-e6e0d901-d559-4bfc-9eaa-2ed66dbf896e-000000@us-west-2.amazonses.com>
In-Reply-To: <01010194a5634f05-e6e0d901-d559-4bfc-9eaa-2ed66dbf896e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH0PR11MB7564:EE_
x-ms-office365-filtering-correlation-id: 80b70dc5-4a89-4b91-6935-08dd4760a671
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?4rLfFMCGDRyRH09bVvsytQAlo6l6K50u3dRl4LTDKy+RcG7NhsZiov2Ycpam?=
 =?us-ascii?Q?g57LPUBPE+8aQ3e8srDxHsoupEQMVdqhCXOp7sUcywHIdJCArDzcO3ytuiUC?=
 =?us-ascii?Q?VZLldNP1bledxPA0CrjCXug4BKpUXpvAXD8fD8LcpSrDMPIvTc17C4RSG39M?=
 =?us-ascii?Q?5l4h1R//QaroCtwL5M8fBQ6Ozr97seEdHJdPm47fAqmzE31SC6w43QOAAIEY?=
 =?us-ascii?Q?PKNcsZ4Rw/QlprYL3qDnNGMvRA53YI1fedzWvWFAaaKFEmCitUv8JEhG4SUg?=
 =?us-ascii?Q?8CNtWr25l0fwqaF51rSD21ltWzjm7s0hNUHobpKkC0+S1JEa0Ui8Ag935XTP?=
 =?us-ascii?Q?wke79JpH1AA+Qh/nn8kitxiyLzmNVCrLhNw82wqipEO9/SThHdC/BhfNocgF?=
 =?us-ascii?Q?s48/2wkgluTt9f903cjclI7C9rknDsBvCCskaG/7ED/aHlGkswFgsLMvFCcI?=
 =?us-ascii?Q?3Bo/3ERBbL4ZmWwu8cLGlouVU+lDgCjRTDFovDi4QqExAIpMZDlnvtM2cJXq?=
 =?us-ascii?Q?SMI8tXBBSDQaHiot8F7WF0xJgUn9Rk87N9SWbGClkU8ZIW9FYTX4ExrOFTuw?=
 =?us-ascii?Q?RuUznuzcrJNBszoDRvDxe4a9UqsPNJX62qGyQQJm9NP4q/MHK1obqYYZrNPz?=
 =?us-ascii?Q?OtoEI6Rkwo9qekv5whnl7xsALymjeceNH/kqseAKT5MX7gyvPUi2IJ2FS+oN?=
 =?us-ascii?Q?KgCaO8twOtrhoBIHOu83YDzaRbTzxtlBX+h3kfYaOKt9nAzm76zwxQ/ANQt8?=
 =?us-ascii?Q?mLBIk0zGVFIkP8S8HOsNHxWo1HCgBu3tffYcoGdptYp3J5pIoH0E/SARzNkx?=
 =?us-ascii?Q?eLHfr1mxU63ij7Acztvey+DkHHN00SbP2NpBHM9kuPK8S6SPmeo/BxgTr+l+?=
 =?us-ascii?Q?aVWHQpKV94qM6rK2AKC2NP+FCPU92bv5TbjV7rwZz0ZspLdVjSHyVqr/QsU9?=
 =?us-ascii?Q?HG0jMOznrCE81Lt7fg6CfbMXYTkRcbxY7qn1m/u8wIaJ21qytDgYuit0umbu?=
 =?us-ascii?Q?3d+SUiFMRW1LlgbO1fdnxTi9vFQhrNOetmnsujd8sBjcsbxt5ug/YR5oWf6l?=
 =?us-ascii?Q?ETwERX12ERwYpDqS6XWmcMFNVAFg7FXfNK86KbNsPagInXyWrI49quXRIDzI?=
 =?us-ascii?Q?wYDB1tzkkFxaz29fCD9xriQiozZtyJ/irkhZQyWsO3rSZykp9uqA3bZnRj9J?=
 =?us-ascii?Q?9xMbZYgIUI90/0CGAceAswD6K3Fb/Iq4G1lndb01268XVOmk5kmizbj6ZMUU?=
 =?us-ascii?Q?ej120wWmD+ZxEAJIxL8L1NpnRmStEeIxVmp20eXaoDNiYDWhP2Mrd29OpSmL?=
 =?us-ascii?Q?PROQvThtKJ4HQ23pf7lQPUWORSdBSyfeUV7BskfzW2Z9383KGOob4Gw3DTCw?=
 =?us-ascii?Q?v1IEA38IG92zVADvWh9ByDshzRuo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PpcBf/J1HO9wrAhcjDWCwtawXXQPwo7fTO2DmBrfnZ8IMDKYDJy2kPcJrJLH?=
 =?us-ascii?Q?O7dxz3SzGH6AZRlnd1C6Qno21MEU6motARp2xikh1HdXb51s6lGz9O/Lc0Ct?=
 =?us-ascii?Q?t+onME5kFS9UMtWgYgnJu7SdtFY+15h/+8+IVDb2XhKAW5GJEuMmKDMUxvZH?=
 =?us-ascii?Q?9ROu9THMX3RFswbDt5K/mBXDbsL8HoSW5YmOzWMQSJivzOteTJkjG/wZ2/v/?=
 =?us-ascii?Q?ATaWqx3YJNugr2UcyJy3yLDtnjJaIWCRGB7muEOlmVDHViUjYel2e2cdEVGn?=
 =?us-ascii?Q?oy8Qk5P5izpHkGZXOAX5E5bCEmwlgYcVVho2bVJVzXIyquwcbBZYknoTAOOH?=
 =?us-ascii?Q?+4v4Z4sRUMhvgj3PUvDW56Gfbjy9+MLr50TC3/5BSxwVUwnmKNn/oDuD1A0J?=
 =?us-ascii?Q?ayigNalYfiT+LA7RufuElbu3NvV6H2CjbyOU8N6j9hG8QoeyWd6Fx0gzd8A2?=
 =?us-ascii?Q?X+hSG0frN+NszQ2JeiZASSJGgCVhcFZahSrk4Z0I1qjnmETJSmn2JaVPjn/P?=
 =?us-ascii?Q?YjPL2EX5hqixljIyfrV9rBvmfp5Q2xgoceodtJu6fFb7KcigcWCE4w8BR6+A?=
 =?us-ascii?Q?Zc9Y/Z1b1QV57Yu4D2m9eWkXD4O2UYIwwME964MLJ4fEStgeS+1v98q5/ZgC?=
 =?us-ascii?Q?ih75iHecLoFVn7TowRcFmO50niW+KDHduamNKWHYMvxPzgnYJvfpRKI7Q4D+?=
 =?us-ascii?Q?4PVxze5h1V2hXuQEe8u41R+0C7UDE4hydJUM94gn3SZDgs3Ob3qF0RxoJsc4?=
 =?us-ascii?Q?WF0hMZ38N2/6/iNlgAQBFyt3CjAnf6Cx0i0lRCy+xi4WhyAZshdJUnYFN7Vw?=
 =?us-ascii?Q?kizGkyLA/I8R37cFhIB057DXLkPkcE/LtYrkr0REB7wfniTIsiyiQrqkVSFL?=
 =?us-ascii?Q?IaN/LB/P5W5LL4PVMd+wBQAB5IZib53aZFYqV8svRFSYA7pxdlAsURXP8Oby?=
 =?us-ascii?Q?bqcLV/0KhhHxKkDBzlhCtJQPZRYNCO1N/Uc2G8NTi/XdenLFC5YTOtY20P7d?=
 =?us-ascii?Q?c28HHKMhKQEXRjXUX/5Yi6MMZwizXw0d4UM79Cl6D6QcP9pTVDx/QKo55ja9?=
 =?us-ascii?Q?w/q4FX+MisFxohjCYGZJPAOmlVHhMYjbB1bObx5GxEwlBAO+mPqY0rJJRnoa?=
 =?us-ascii?Q?bjMHaMphqcb5KzIsqACY/4KzVhjfzt5cDBlgdXoOJGUB3Pt3ykLE6pJw7C3b?=
 =?us-ascii?Q?L06J18MYRMrsmWl17jD69Ke78Sd/OKLo8a5wzQ6DAsx2QAkFyhZ37caB5bS6?=
 =?us-ascii?Q?Da8oMCksfLZr3r1PFGdv/s7Je45z/pDy9Dxk1NhxrZF0vtjfVOTloX0IfhuN?=
 =?us-ascii?Q?ZnRA4+G2v5Z1TyDAwzY4+ycKPq6nybn7AhVhtkPWujHjlAhZ3G8RAmhG4VA8?=
 =?us-ascii?Q?G3mx7aDkcedt4PD0bKbpVldM1jEsOOJJdXjnKDknvtPEXR/cMF4YGc89P8PT?=
 =?us-ascii?Q?dquHXDGIVEfM/5GcLDVVnMaG9bkh/pJNRvPNlKGQzGrjM7ClEUJftW3ji1hk?=
 =?us-ascii?Q?beZlQsjuEwbg+df0coQnIr+MjvGuK3M4MKkrAhSjPAzk2uJU+bgTUuLK8OOO?=
 =?us-ascii?Q?1BQvRhLL0UdvFV9p6v2HUahJCWKrL/mzQI2ZRCqA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b70dc5-4a89-4b91-6935-08dd4760a671
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 10:17:39.1045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZxhgX4lGscVkk2fh+NK3Mx/Vm4i3pnqdPp/96pkrK2QrKnIqyqIU8lPHFLv0NUGfkBvXK96ca2xjNq3zLXLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7564
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 10:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210978

Hi All,
=20
QA for yocto-5.0.7.rc2 is completed. This is the full report for this relea=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Monday, January 27, 2025 9:32 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.7.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.7.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.7.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/893
>=20
>     Build hash information:
>=20
>     bitbake: aa0e540fc31a1c26839efd2c7785a751ce24ebfb
> meta-agl: 45428e8d626b06a809686fa0db8a3892498b96a4
> meta-arm: a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
> meta-aws: 4f45b4b2a940577bef4301a69dcafe743af1826b
> meta-clang: 8c77b427408db01b8de4c04bd3d247c13c154f92
> meta-intel: 0be954e82f09d235d2b5e5ea01bb62ffa8d0b5f7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: dda0d53326017d6758ec6bdfdaf2f484c089d13f
> meta-virtualization: 2ec66285d050ef3cd29a5ea57c71341e6b17b36f
> oecore: 62cb12967391db709315820d48853ffa4c6b4740
> poky: 7dad83c7e5e9637c0ff5d5712409611fd4a14946
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
> View/Reply Online (#505): https://lists.yoctoproject.org/g/qa-build-
> notification/message/505
> Mute This Topic: https://lists.yoctoproject.org/mt/110832130/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


