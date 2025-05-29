Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3879C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:53:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web10.17153.1748512402920142565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ei/ez37V;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748512403; x=1780048403;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EMLOrzw1e7hj9gjkv7dSyjU8n/Bw8FYulIXZ0dx+Z+U=;
  b=Ei/ez37VzNqGqQEee067aOprw67LSPHHBOfwAc3B7SkS4BJZa7hx4gPV
   v3gOxGoCP6uFeviGvF9G0C9lpqrXpmOKzxiZbhueIk59H1gGSwTtn4MUV
   ebQgQKk6fAO9x0KMb9VRPk/jEZUBrNZCMmpPjLO5fSomYuaImY5VHwBRt
   fSUN1IaPu/e4TRGqYYTDOdFzMsDaLjK3mkcsFKfaF/GcmOoIVZvN0Bkik
   l6jyE3atdtR6Yw6pFEDIEp4Z2t/HM5aj/iW+6SNbOobBh2mB10LpUYJ9E
   pD20p8euicSc9IZdatUI0eTWcKfAW+SIrBTZi3z45t55ZwBt/n7M3QUVY
   g==;
X-CSE-ConnectionGUID: Bz1orsO3Q5mZNUomH6W+1Q==
X-CSE-MsgGUID: Yte1GyseSB6GGxK3sjTJDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54228433"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54228433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 02:53:22 -0700
X-CSE-ConnectionGUID: kCI4i/kPT2a+H3RLkCZ4cA==
X-CSE-MsgGUID: JrQZUgvXTK6B4QOPdkFHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143418018"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 02:53:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 02:53:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 02:53:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 02:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnq7NZflP523dyIBX0eN/wFvfSasNRtSuWgzq8mskFIpCZ5k/8Fzz8ct3wZjZgJNhhigZAMbihPwx1F//9nbHWn3wuZ7pDmVKcThSL33WMa4CX5GI3CsEU6nelFne4nJ68ZrMJjjqy9pxsppFx5TgD013zrfRH1y05hPjrRhZ6NaWCEwO8P3ru4R5bcootSAyskZ9oerqjBdsrvig9oJeppF/pC3XIYr1CoMieITNlpRh2I0Qd/EeqHzXr6nEpdQccdldcWg3Vnz4lEECvaXnx+llsnLYN8IzTkLcOMAdQuM/ooCNNwdWal4dNDKLpXmAP9VcgDgBDWG670gzDl+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9lle54c3iUr8DPzGnhLjTulO0c9bRDxEAfwgE5TU+s=;
 b=E1p7H1nU/2leOMzI6LDAfS4RgxSJE7p2qOKHaIs8enw+MR84/4jB/wtbe8AerDdpZ1CCIHq8kQ9sojOFNgEQ0OBZ9pf+3yu9xDA3Avu2UvBV1Q3ULGGsWRWGd4ifvuCw8zlF/4vZv66O+OIJbIjYp2iWJ4B18eRpBlWA412CLQ/4OpDnFG2oCFplOBDFeEIIEXpL05BkaQyYf1X7PdWa4DZojJmDH8hGMsxy5EjtBwmcntLWd1yVhuWbbUt2MHKZoWpYZjIEjKhJ6JiRnU71cIr6ViA8Kyc5ZE7gVU7gGJUE7180YOd9ZpVumJ8ZL7786/ogEJ2WJVTQYuJI9gv4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 09:53:12 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 09:53:12 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.2.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.2.1.rc1)
Thread-Index: AQHbzM6OLZWY5mm8X0ejtkUdfgw417PpZQKA
Date: Thu, 29 May 2025 09:53:12 +0000
Message-ID: <DM4PR11MB7760A88BAE44DF5C79D99CF7A166A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101970344de7e-a0658898-c111-477b-b2ac-093e5ac89415-000000@us-west-2.amazonses.com>
In-Reply-To: <010101970344de7e-a0658898-c111-477b-b2ac-093e5ac89415-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: 9db01516-dc77-46eb-5222-08dd9e969ff2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?3zvLvQMJaCDYrXXglggfBIjY0JANxiYaAUSEUklW/ZwXbKnh4CGnhvUDckW8?=
 =?us-ascii?Q?xrsntXhw51pXszb0984VK+dkgdHRR2FWWuZKFHwKR6vWxjzO8QIxNtpihoKR?=
 =?us-ascii?Q?e6t/w5O9cj0MqFDLWnnuKPo1Xsl5cnAzqyz3wnc3WZGNmNJ9/rq+IcP2lCvX?=
 =?us-ascii?Q?WvOBlcV5B9x42sJo9F8DEZs505bLk9wlwMbNPUW0xkGIT+KER3XzwWFjH2pl?=
 =?us-ascii?Q?e65FJ25WCye4o3EmuHhZjszvuUNOAKy20p4kWYj9X6enms4gPwGivhwCgmwd?=
 =?us-ascii?Q?uzLMrsAV7O8KCXVRicG7ezF1dfMrnvqlpfAOE0/zfpQQ7iKoAz0iOymh6UmX?=
 =?us-ascii?Q?NGKTeSwolHNMPYt4WlLPg4ltAHVx/2j3i0S4cDcrIXhDmI9r9KTFhuqZmt1D?=
 =?us-ascii?Q?MJe4H3SNpQ0pQbskY3qeT606EDhOWEeCf3zFwt1C+oSbnNiI0Y+OnMLywW9d?=
 =?us-ascii?Q?6KkBIg2NwENkhBkSPHeFqYx6V1JJR1oHw0XVx91Alwh8iDyd2Taf+1qQ/L8D?=
 =?us-ascii?Q?9WIBS0CcaXRzBltET4iZlqg85MFq8fmE4ww1D4R6WXsTg1ouykLjUFtJ2QBt?=
 =?us-ascii?Q?2LULqC66VkX/MYpYr5HMAXjdajdquxgAVZfZYWTjnfZrOOI73TNCmX3bKg53?=
 =?us-ascii?Q?bEi3KyUuYFYwmiQiw7j6mdC72oecz8n2XzGzAKn8Lt71FyW5q64qx9Hdj1Pq?=
 =?us-ascii?Q?NFtWFKgL5FZlw287YkrqhdNoHdsemr/h4cqEOn9UhNvMlNtGKFGHo0jmL9Li?=
 =?us-ascii?Q?ZwUxjoWdd29ujqH1GgQmfSd/Tk9vUmQaqhMag7IJoVrbTI2Wld077IXWge03?=
 =?us-ascii?Q?5mtFfhsyeeDQY5hL6d7eelfOaDOSaQX7ebNQlDNBA6AUOvrfMfWwAHIgsctH?=
 =?us-ascii?Q?fMGvJl2K9gAd1Snx4ZE5vQtf9ytXluqtqruTDTzoGSmm66M0I7stZ/H5dkv0?=
 =?us-ascii?Q?vI/zYSxv+SufwnNl8Qhe6PyWkga03Bx+nJXx6G/GPh1hDqQd1+lrNTpp7+CV?=
 =?us-ascii?Q?qIwnycuCj3VojYoxPDMPfiL/Zz5Dl3oiru9FVkE2WctrZuX70MJeKcvN1ACj?=
 =?us-ascii?Q?mXpExyJbxYg15CUExAzEpOVditktCoc6mbSolJNH2sGrZvXhRJaEiCGrH3h1?=
 =?us-ascii?Q?PSMtB3Tudlq2wA+Wl/C/E5jNmOyXVYdR/NBCteJ4NvUo7AM3gj1Txa4XIjTd?=
 =?us-ascii?Q?TvTRA8c86ZSbTnQCcIb+iwSB2r97leR8uB4XRdOdhq8V1OrN3/4I7CmXzEGK?=
 =?us-ascii?Q?SA2MR4zK9mkF67Uw8k4g6sUCfzLo3YphhB+29fRBFEVc8O0/i1k4YrnQsiAJ?=
 =?us-ascii?Q?LYYsNUU8wfCH5ejA5kt/xMTajPUUsXvVQ1xbEwqWoxMmRJbVqRBA+hNmXjJ9?=
 =?us-ascii?Q?5i/IB+ml/QtyvLGDLfxek0EvAGa4/vWG+CaslBtdeXCAh9jsQFRo0v6S/vpa?=
 =?us-ascii?Q?O/wheg405KE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?55kGownX2AsuVs0w2Z2vYtYBm5eK7YzgCVMmue85yasm/aaKGVB68/lBtl0/?=
 =?us-ascii?Q?Vm60R+VI7VNldtmQjjywFrEfMXZV9ACIn9Usc+2dJe5qj6thGnZ5GuakN3v9?=
 =?us-ascii?Q?g7MLx4qluTP+MvBwuyzZ8S+2rdK4zBdY+0esrsezx+Y9rDJtg57jtjkE1ZEE?=
 =?us-ascii?Q?247qUKiuf6jG4e8BPyhAuNL59YnCfDgj2GQr3DvONChJIyBhgX/b6Nv0n5WN?=
 =?us-ascii?Q?7C46ti1B+FkyvaiLuUJMvaQtuKUdCBWhjwO7jJyuzguPDU4S9ezWPJlYM6vs?=
 =?us-ascii?Q?99dFSjEsNIOCQ9CQdc/euoVj8Blt2GnH+jt5mGlBOKGDj3vK2m7sX7rrSGIk?=
 =?us-ascii?Q?Z2RQsqdyflLTVGFhs5kcXta+uk+JWyVCQwbZY0xlT4JlCVfo9YLvzmiar7Ni?=
 =?us-ascii?Q?40c3B/4n+AcConS36EBwttkBPKMa96oozKMhq5p8Cd7eDSz8kkFYlos3RbYL?=
 =?us-ascii?Q?w/nveO03MPua8vziumRkQ2T6NUMUIOYxfZuNpKBRYYGqOzXmlnHXvENxl19o?=
 =?us-ascii?Q?J/yMNX1AQfLFs35JkJ5j8e8ONUpWJIsabX3glbSVYFaUat+tDBsUaU92QjMP?=
 =?us-ascii?Q?OfGK6Maw8nfsfWiy7r9VT+DC/5sVxCo+a6jMsTGQBfPuPVitrZA6sX5at14T?=
 =?us-ascii?Q?Tof7AKc6NMQT0RIImcdCy5H2dCAsusDtRukKZ7ZdBzq6RVosDRckorzSk6rS?=
 =?us-ascii?Q?7fYqrw5e/r//BYTYw80QFrkK5vt8xE3gAU/C2rTJge9pP/bzYPXMXNGNd1uR?=
 =?us-ascii?Q?RXd9Mnl6lx8dm/RDX+vYsQC2l+tsipwqxUwKKAnZVHhMET7rmWeCLLV55YAw?=
 =?us-ascii?Q?q16WG0Mt36sPrl003Nuhp/4bG7GyKd0FkWEBNicvhRrdgDIZpRrO6q1pr+vR?=
 =?us-ascii?Q?qHx8/mMR2tIocDzEoniIVVCcz5P0NQPsXarHskrsh6YdVAcueeqhhY8HP1p8?=
 =?us-ascii?Q?xW3hwJ7Huc474KCVLRsR0RjqB3/G/uFC/VyBKBkN9IXw9Tk/2ACyib/E4Vn1?=
 =?us-ascii?Q?aL0og+RIg2MJbjM6uIOBgY1wShtOtSgE2FNT9eEJhOpphOqyUtV1z7xfRJwR?=
 =?us-ascii?Q?zUuROOm28HJhZihsfacI5LtETY/pNiZbEFzrbe3F1oFcmQ769rBE7DwY0z1h?=
 =?us-ascii?Q?4kmuF2LWaFNpc732KycY3v0luFgCinY9FXsNQ1VQbFMYr0QuCPQEbeXwddss?=
 =?us-ascii?Q?6OnPfVl6VQ6todtmDPQaxChw70PKaFp6sokMLkN6atbG64q7ODOUrQl/HRH4?=
 =?us-ascii?Q?e3ZOhbztUqFB9Fq+Q3ls1cHhhBvhW4D14EhX/Zf4K2fkQYML9GjYOBNiKfkE?=
 =?us-ascii?Q?S2fq7/1Wkf8Q+t0+ZPntCp6xv1gEQpfvK81guXOM3vOgUx71+Krqr6lWIhnT?=
 =?us-ascii?Q?Td0JR+LB5rmvEjTvmUUdIErQRK5Lml4L9A0tTGRygBJyp0aEIPl4RxT8u6Xm?=
 =?us-ascii?Q?gdTVvqwVCZOQ7VgnRKn0uqFBPdosTJCbpx4DpsDxPGYk+YYzM1DzLvNPDRxd?=
 =?us-ascii?Q?eSZpKDTHAV91P3lSApt4ewShZFwnttrzQklg0b/ft6kh5ZJXjmnIUqfuzxTK?=
 =?us-ascii?Q?0GsrImDXKAuoqdctyoU12jUnFcV+brrvColytfcH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db01516-dc77-46eb-5222-08dd9e969ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 09:53:12.1684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdWAzUU5fNgbVG/AEtP2Vk+7Exn6JI1ci3h6DAhMcjkYo8AnJk9r4tn8JD1JLLj0rEk5NMXO117PZxq8nCp0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217407

Hi All,
=20

QA for yocto-5.2.1.rc1 is completed. This is the full report for this relea=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Sunday, May 25, 2025 1:09 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.2.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2.1.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1654
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: e66db9b71ee6566d5931f590e5491661e94b5e13
> meta-arm: 4f8d2f4b2fa23b89098a8e7347d6bb26228acd68
> meta-aws: a28a159b336db6531e5482ca5c6f92b25231b184
> meta-clang: b3e5449f0156884d18c17efff99654cde8251411
> meta-intel: b5c65864faeff4ed95f4f75daf5535a95a809e5e
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 2169c9afcc0945045bea49f58011080942d4ddb4
> meta-virtualization: b54f05a85be5e2b80c111506b7c4d35d7d4eb54d
> oecore: 17affdaa600896282e07fb4d64cb23195673baa1
> poky: fd9b605507a20d850a9991316cd190c1d20dc4a6
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

