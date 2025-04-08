Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39496C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:02:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web10.79773.1744128164595448629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QSmLnkBG;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744128164; x=1775664164;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NNJCxLvsPk1stsK7EREFAjAvWy9su9kFZ0empWoEwOI=;
  b=QSmLnkBGT8BCe9w9JqaEetf7pRbPrVMb6Ysbz4vLuvA2nXhU62NXIlyC
   n5eUzcJUBssdIMSC0Wdz0+Xo32BAqcl9cdfA4p5PdJk01eouhTQtfyycz
   mV8SQ7xBkDRFhu5SxS2n7cuOGP9F6x5C+gNGOQnXp3iFbnxCgmFW0rzsZ
   Bc/Jpfwsj7bnc59lUbK9uSR5UM1mF2zSCv7uX+43w7slQw0BBT/fs/d1e
   Y3fCtBE2k5Yw4pGic4T4nDJkY5Nn3ACSRgMrUoQ91Ti8VuEXcK24THfXk
   Dtfm8X6UMIndhYw3QBJ8e+IwBntnunv6msMeFDb57OZjFg7fjwpauunIh
   A==;
X-CSE-ConnectionGUID: HFLXblW/R3WSX0gu4K8wqQ==
X-CSE-MsgGUID: meG5N10CS2CqspEQFTd9rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49417546"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49417546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:02:34 -0700
X-CSE-ConnectionGUID: jBIdQN7fRWmov2mx4vkqHw==
X-CSE-MsgGUID: VtVMKl1wSlSOE1O/ZVFcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129157866"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:02:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 09:02:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 09:02:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 09:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeaP2Wi2ui9BLkO9ZnJi2TbqGADW9p6TN7z2zzGI4prD1pa9K52Wsh5HkEa+wgQ7/xayQzEULTfCbIVL2wZGvPmh3PpUgqdTpLwIkf2pShhKU1puUbpreMnHFn0BZsJP8voZauwqKsZJRBD7+qnlLoY7DN1tNmgLiWvP0OYlvMtsV8QNLoRKySiDbyG42pHhUuaBrIHJxm1+She/7peNZ/HhLsIeL+OmhAsWKEnIFIt98l3XnFCz9g+2VWJjQVvrgMKL7ZScxboKHQgtD9oDR7/1tsjG2UnkfkGE6Up5MW/hM37bgty/XpKWF+1cJzI6/4WygLVglW/Q3JlSpFGD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bG/vUrRwDfnACcNZR25OoOJnD50oPwgtqtpVtgAB7U=;
 b=HxqNa42NHTwu6zCPioxNaUxoJvkZduTA5GFpIuxP5Iup3h6k+y4cZFQLDbDeHh7w6STNGn7yod9KMauQzIPXtapSAYA2bS5r9j40jTyIOEkIAnsnyP1TmoxgB/WTKaU+PyjRFeTmEQFWb/tggKyTlZLR8hYcAlm3gDpbPD3P5f1XHy+9xCecTVvIrv9LadsHpzizHpni4flhcSjwVV/EVC+KeedZUTdqLWvv6Bk2qsJcQNmBN3dONeu3R2jzvJMvUN0JbkhAvNkrSP8Gcqrvn/A/00GmI00JNQALGVgsBxFSrJD3GjuAOXsQNtmD1qKvyjgIE9lsLvGH45TsgJjkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 16:02:27 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 16:02:27 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.26.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.26.rc1)
Thread-Index: AQHbpZT2IJMRM7bMbk6S4OJX30OdELOZ85EQ
Date: Tue, 8 Apr 2025 16:02:27 +0000
Message-ID: <DM4PR11MB776021A4110EE1CDE870F136A1B52@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019602345387-94562609-3f1a-436a-8818-f68b1f3cfc1f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019602345387-94562609-3f1a-436a-8818-f68b1f3cfc1f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB5924:EE_
x-ms-office365-filtering-correlation-id: 7b8d6c57-abeb-4200-ad15-08dd76b6c26f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?hm+EJS5N18FEZIsKbEKKdrvq7MLeWtGlfK2SFlstFA6i1DvIBFEj3VyISMsE?=
 =?us-ascii?Q?anoC/MR4Wc28eF/d5E42L1b1jvDzWZh2zGcnmB0Nofu2XbvmU8eax9v1MFXO?=
 =?us-ascii?Q?nMnnXNSwumdD6eJ/1OipUbBZfzlgPaLRRDfCzXKDoyMcnAhglt0jfapcDMot?=
 =?us-ascii?Q?ygM7Iy+Um5GSjk/DPVVehNjKeVCB8R7YFmXeq6Cp4F49v7DkxTrRcwRqjRq9?=
 =?us-ascii?Q?IulQXaFfb5lAm2m0gMkbXS9imY6PRu1ssyqpTDbe7DlTC+Fpyw5UYPh81yUb?=
 =?us-ascii?Q?4VSbNULs88FYDIxUUgFLTKuzN7AELIZPzJhEiv6D9J8bJNU1AF9tdAzpyC0l?=
 =?us-ascii?Q?juvxj7aZ++td3/vgsSTO3XUnMupaU/Vi+CozzSjL3pnV1CCzJ5025q3/WEsb?=
 =?us-ascii?Q?HTIRlflytkChENWAPqJxvca0yDAY8uzWukoEgCxCoW4en+J5PSQPFOO5beih?=
 =?us-ascii?Q?IS79H9eeINbYudajsA8QPc/3IaTz9Uf8g1uLA16aL40KV/PAzbstVtuRP7ci?=
 =?us-ascii?Q?3+q5pFyEQbQ5dsmsmUPjDPmtuvs7kSgwWeRwhqyIiVLHKYUtbZMFTboCs8Fa?=
 =?us-ascii?Q?mJztl5ygTsuKBDXqG4i4bAdhE8OxAf7xP2qIuE5D8RqtFOa6kRVQIIiau/rX?=
 =?us-ascii?Q?+2Gpar87SAuS6QgTFCFgSvsnCNo4boUc/B18YvjeckrYCNRQ1zTolGJdBjVC?=
 =?us-ascii?Q?FwAFfRENuUkHSqPfjyEqkp5GGL+os+vx7qQ/FF8pVksTdzgJapHOLXvYZNfX?=
 =?us-ascii?Q?LLfDbfXZDaSxACeh5TE4a1s5bSPOA++W8nur8e+Li9sPOOw2R7gheoCB7iAE?=
 =?us-ascii?Q?ytioYxCz4lUyezlO2CZPcLQlv1E4EttxjQfcej5VQDHfN106MBuO3QoXW0+J?=
 =?us-ascii?Q?vTiahQ9X4n2qOJmPrWY8BlMfeTdASobQzP90kOF0jDOL7obFoHaVJSu/Bqmm?=
 =?us-ascii?Q?tYxzM5WJ7kzPQn6K9KW2nM4CXbJEIRmLm1yto8buxfPM5IqrfxMOqhRijehh?=
 =?us-ascii?Q?5ZJs2g8lVbkk7ClAg1A9d6w/wkFhborQ0U9oGOtb40nxcuIpDrQoj1tELpYY?=
 =?us-ascii?Q?rJNhRUrzYKpz86YTXHbpKN+coJDOkUoUPakkIpulaWJb2cukpo/omh8igoXy?=
 =?us-ascii?Q?W8ibcxCPYc7oCR8bgP7w3w2pEQ3qHAkSuOkhOJBfU4++b8HDEcn4vauq/CC5?=
 =?us-ascii?Q?/NCghHVOpx9yfotDBFEhcSbrlXPedWp6JdtDIWpyuEEuaX/Zda3m5MIKbM5C?=
 =?us-ascii?Q?QIIbLQZ+t3CwnbB7XpsfPI+cxocdOoZ41INMwV+CcqvUOz4rMQqyx/q5npzv?=
 =?us-ascii?Q?A0pJ6C0xXFrY11Jjl1TaKbe4MmB57+M9/dY5AvIP/THj98jRIesMH9PW++5Y?=
 =?us-ascii?Q?3D4bzfRKGz1YwIBv+V7GPApX3cTOCMm1ghh2euySoq4Y+eUVqF5zsLaZE9pJ?=
 =?us-ascii?Q?eXevNcZtEP8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VnSRgNvTdaQYY59UD34jpYyi0KRmYxDcXGabe6zrl4bHLX97NUa3vNYbtkgn?=
 =?us-ascii?Q?LNVuZaZqH7O5q3DSjjn15jklVIPrROVVrIYCgI80LkJaotcDjm9ejaL74S8C?=
 =?us-ascii?Q?JAA2rEr9sv/LZOAcBMv4+3xCBMYUHU/1CVN8LCpJB5QFAT6xNZEmGQrL+0Su?=
 =?us-ascii?Q?biL7+GBfYjEaaaPgEmC67By06PM3T8X/CHeKpDZNkTkq4O2V9JYZKtvzz6iZ?=
 =?us-ascii?Q?ycp/2CQObV6cRC9+Hohxm/6M3mtKL+RP9ZDJkDNSQpgh0LNIfQ9pbOrY6rfX?=
 =?us-ascii?Q?TQFKtn8UcXUQZuOSE4HzhB1DHhm6MMcNr3qSjffR/1TYfAwoXpshTndJVpOi?=
 =?us-ascii?Q?Xd6OFQIi855iUfaeza2veapYYJSeK7ALdnEfBf8oigLd+4QHlQhpEba6ri/o?=
 =?us-ascii?Q?6J5si9xJrNPulpdi3ObzzcXxadlzUH6YpnoJ/I+8pyBci13eX/lOMJGBWl/k?=
 =?us-ascii?Q?TLTjy7dT3rTCWovrxlNJgdIR/JE6Gn4jT3EUoZtbpf1pVL9Lav15JHBLayvZ?=
 =?us-ascii?Q?zmpxDTPjWXP4MosUeomjZdfVb81DEtDCWp+A8rHtQ1lA39AYGesxmUgwXipy?=
 =?us-ascii?Q?hRrqMZ+DgxCmsZTZl5h5VJg3fS0FZ4rFQDRBIRZ4FJzoyD4c+nJMsuZX07pp?=
 =?us-ascii?Q?X0oRWfCt6rVnLAl1I1R3Jp23fLcHC3FzbdmJdAHxtuT/2bAm5WOamy6Ery8h?=
 =?us-ascii?Q?B64prz2qZKSPuuNVtPwBTtmDsn88VDZQ/VWw8tamOfjxLXF2rMWKBr/l3BHM?=
 =?us-ascii?Q?uFtkxbYUhp4KiCgSigSdcZs09ykouQbH3Ha43DhnYUg4RrfCqyP224xlOP7G?=
 =?us-ascii?Q?4ZMdiYLYBhCigA4N3qAYeuwXHztY/STgTDHF3CVygR2gDqoOwf+ULPU+UCbo?=
 =?us-ascii?Q?rA767nRvYjbwUtaSqTg9qJwm45pe1Mxf0eM5ZebwekHYCXwvjS/e84nGrtCZ?=
 =?us-ascii?Q?m03plGAChs4Jw+u4gvbU/PA77DfS/2d1ri+LdeV8iAntv85VWV8RClLFPWmp?=
 =?us-ascii?Q?hnR8N5b/u9C5Aw4QMJloaHFfc4SDNPBCTjzRbloF+Vv2oYw1KHcdPyC5rE1N?=
 =?us-ascii?Q?ZTpFchq58LkF2OqywkVth8LdDo2cAT6FkWmHWqN/vSWZI/0ua21KcnFJMqCR?=
 =?us-ascii?Q?tVE47ZD4qTNu6bkwJjHPK194GUNYybq8Q0gtd7jf90YCzaQgHHj29ApG3v/p?=
 =?us-ascii?Q?kTFyczJ5yFNNHKdTdcp2BW6VY2kirRJmcSX2XknbhUXH3ot5NYGI4Jvh+Vfh?=
 =?us-ascii?Q?FSes+4My4O6dWHn/2p1OKYNCTmVpxkwG7X7NvqYny7DUE33ZP6da961b8djk?=
 =?us-ascii?Q?tC3BmT9tG5+QrEypZgcBgMtTYCfBKHtgbcvH7sCEAWgTPhy6WtneFTzoPqBA?=
 =?us-ascii?Q?VYUD5x15kuhAMu7e4qmp/+bth6eLMc1dsTSMZAx7nv5w8LnhgePSQsQAx71V?=
 =?us-ascii?Q?QItD13yiRIDFXcdiBa8aPK9LyxsVJBdI5ZwpARcxeB2NHgfHv/+vvEpUdRis?=
 =?us-ascii?Q?ZlzuVCYtA6C1ENtCu5o3LuD+RR1H3X5CiUqZWvK8BIcuAhfXaXDnkOUNaMQ1?=
 =?us-ascii?Q?uNh0CFe0fSawr66WTbC+rfd+Jhujjcj9p7Z2yesy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8d6c57-abeb-4200-ad15-08dd76b6c26f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 16:02:27.4608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RECTUQgtsONMH752YGft0kF/Yl0W6iy0Yg1APWEKFEWRv2Kuv5l6B4YEmLP5qS1/waoM6v1SNynNPJFS5Dq9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 16:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214547

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.26.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion: next Monday, 14 April.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, April 5, 2025 3:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.26.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.26.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.26.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1341
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: 296d62ad1e6c45c04739645401056bf172e736cb
> meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
> meta-aws: 4dcae212fd121b16c525f57ac7c7ee32df3650e1
> meta-clang: 0356fab9b788e6071471f82743964aec1775cd71
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: f8dddbfcbfe502cb71375a7a907e61a92e8d4474
> meta-virtualization: 426530794bfc0df686566beed50e245f40565d6c
> oecore: 1efbe1004bc82e7c14c1e8bd4ce644f5015c3346
> poky: d70d287a77d5026b698ac237ab865b2dafd36bb8
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
> View/Reply Online (#537): https://lists.yoctoproject.org/g/qa-build-
> notification/message/537
> Mute This Topic: https://lists.yoctoproject.org/mt/112090603/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


