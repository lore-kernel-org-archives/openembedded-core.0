Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14DDE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 08:33:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web11.59503.1735547599331836544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 00:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=f1eRhuoJ;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735547599; x=1767083599;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=p4TnajoBHDbqfuZ9Ih52av79p+lyBG9nulmMOBRBQU0=;
  b=f1eRhuoJtuNAQwuCMkSvgQiF64flPTScrMOoCbENlaEv2Kt5YpyV92Pk
   xmMtxPit58qAJWRSiJ92tp4p1G8WQ9F18RAL9Wpj6BtwpmKpVsK4MZmKG
   jDBddr1zrZJMSa91RoFDYYLpPg0NBhb7lgoqd9ZKDZ5OUI0YJdY5nW95Q
   QPRYi2mxETcTfvDqUi1Ogon/y18NzLFybx/KQkKKTUIw+HehKm5Qb+nEz
   rUOdb2IgrnhKpx3CBpffD3xU8h5UZXE07TFhabxsEUp6J6w8i87l8Pb32
   LNqYDvjEj3WGLz7ikOS9ClMSC02efDcyvF6Gsbnpugp3d0l6smJ0Lpl3G
   g==;
X-CSE-ConnectionGUID: ZysTco+4RT6Q2CEBkBmoSA==
X-CSE-MsgGUID: J6B5bTiZTMSalwcDL+JO/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35945687"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="35945687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 00:33:19 -0800
X-CSE-ConnectionGUID: WivCkkTlTo25rK+kTBKCYQ==
X-CSE-MsgGUID: f0eRGfY5R5mxk9Ya9I1WYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104798902"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Dec 2024 00:33:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 00:33:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 00:33:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 00:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHiaSlb4GyLId4eZspTsmeCgiSSrcnX3jfubmyT87mcFi4zhXPLz7UgzBJ3qYjnQlHC1+MYwFO/k+F8CCCRhjJoXyaIWSS7imIYn3WyjmYwSzwtCeyXlsaO8mvmUalWrbFNwqfyusb8aXiNOIhlxHy+GewwQu4eegXyuzuUZipq3Zf+wc7clOrrv3kgMIcwcrxYCPukVDs3isLyyM7fEUwqSbEGv59vlx+80L5KJBUGj+yTtSOktyTjDwIG2Y0kX83HxYPjBdmFSN13+dSbuUMCsdNrsCj6QxkTfqFF6Fr7/9pTuHxi0ZTxh4hMCTneJcA+d8iaZIKbknZkvUdVklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4TnajoBHDbqfuZ9Ih52av79p+lyBG9nulmMOBRBQU0=;
 b=Xt9h28Oc18m3UIbtVeGYmR8wvPjsOiBWGTA7kdEgmQkqDxDNd4vGqakpdI15FDGEOEe+h3qCObfzu2gBb8i1q6aAunvV7TLIG+rELBwgM3Q4HgF4uS3Gl6VCEtGqfdcyYMQdp5UnUYoNOE3bR1AImZ3me4sWAN3fhxa3IhkVmBVrkSYUkb34OnPWXb19QfQnjKLjQp5GJI+Cqoi8ylemF7g6VIiLTkDb1E3265VFVLsCk2ntfJdXBctJ44Uzu3vNVNlcng51UtyCFCE6k10ES6GGUKFTgUFkbxJqPDZ/A19xbECjA/Itu2de6vqqnCveb3Pkm7M4smnkIG1jo0AByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 08:33:05 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 08:33:05 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Recall: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Index: AQHbWpVyssKAbcHMkUuAsAxvdPFKQg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 30 Dec 2024 08:33:05 +0000
Message-ID: <DM4PR11MB7760295E3E9D6E29DB30BD4BA1092@DM4PR11MB7760.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ2PR11MB8472:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0d4e061-40fd-40db-2b50-08dd28ac94eb
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QNod1GRO6DtZUvvDhfEt6Y+COZae9xWQoQ3oD1YBmjIcb2ybz/Ii6obpzwUN?=
 =?us-ascii?Q?dHBcI4jpYlBhf/aH+Xv1Mdf77e4YPVwYrNkIZQwZU4SeMOQOnZngObwnhzS2?=
 =?us-ascii?Q?p9jUA7l8i7KcKq4duUnntNWwK+2+T2NFvmkgacjG/6cLrvWpIj9YcJP7EvsR?=
 =?us-ascii?Q?0aTu9lpQvdscm6vYKUvFg9DzaMilHJTFZkfaOvSwL7Q7IG0XIb/UhFSzpUgs?=
 =?us-ascii?Q?wKkDeZ1ZVMFaakGrBNqB32gLdISMJKMPhcSxu0xd/DGORS4rTGaGcryl+3+i?=
 =?us-ascii?Q?RNIyofFZK8vq+hZjR7btNNP84SpDQvpdcIV2rhxxRGtr4ZQ38fnyRS/oSniy?=
 =?us-ascii?Q?uTEsd7GB49ilTPyujqGI/kZ5Y66Ze8b7jZODJ2eOJkpWhMxMdu7YTFO4GV2E?=
 =?us-ascii?Q?UEYTFyn7PcO0oSJjlxrCPPPl7ztdN1EsEgfOJldGDCEdvelR3EcpeXbr4F0e?=
 =?us-ascii?Q?xqTyUqONqNpPeGZVzVtnxUp7DR3VEr7avOMSqEyFJAQclXQB4VC15wDLp/FI?=
 =?us-ascii?Q?I9adMDJCG9UPl8V8kAp4mbrx08Jz+WNEsDiRFeKvTOMkA02WynwFgJJhFtkW?=
 =?us-ascii?Q?gedC3L3hOL6Njt9SdgFmVAct+UaPM++KjIw3J9H1B0aK4dok2CFgraNiZ/WE?=
 =?us-ascii?Q?Zi+Yiaupy1msIw74GxonEIihZsIFbB7xFJdpsK+rrbe/Tms4V45oJvt1gRYf?=
 =?us-ascii?Q?33ehnBV7PPPLBU1b/C1s4Rz5jK2Vb7qBLSYW576dcfJjjSOK7uO3RMLsPLMX?=
 =?us-ascii?Q?8yvCOcHgUM8/RCA/Fd9oH1sSpUNPjuHXHo01lYrTQdWuQzD79WrJmxKaOnF3?=
 =?us-ascii?Q?gcAAZUF6czAS1iLk7kn9IsCPJdm/UnKy+ttowhFL/7eST7vUpBBJmkwSO99n?=
 =?us-ascii?Q?CXeSWaOFhwmzZWlitfUnjSWKwuNNOMjw/G9EgoUwl8jZYJdr7iP1QzWOLKD1?=
 =?us-ascii?Q?7vXHG1rVhXUZXtCQ3aT37nsgFRbazO/gR4iaRdkdO7pGLNjR1V2O1v5hQNqh?=
 =?us-ascii?Q?1OgY3HX86Qk9F6sboYb317PvH8PO76ttX+sd374fQBSx3fAW6CBuToTxtorC?=
 =?us-ascii?Q?xie1SBkTOadS8c9BK2LBO9zJZQl40eT9uEWsT6ZgVRDwY4PeNN8fGTRpUN86?=
 =?us-ascii?Q?tINlZPm9SP4zd5DPZipcn6ZYuQ8d6Hvy2kmVzAzNHQSlH2Q3f/VblgD0++ll?=
 =?us-ascii?Q?ZIl1lb+ONCGn5t6QkHeedOK8k+dTQGngLhuCAq5GnxbQuDhfBvLYEwYx3Pkq?=
 =?us-ascii?Q?KpzS/am09YD2kcufG6BkMvBNrSbh25/4Y61yup2taNh5lwVoAuBH35qj5ghg?=
 =?us-ascii?Q?mULT7i72ULpUCs9DCE+AnbI8IOgSxcPbRQdyePe7UKkSRxXoUuWC5QxQt92u?=
 =?us-ascii?Q?VIASXC9PJDHeOYplfyiRxjAkd+lsTlb3hIDcoqKA7BdgEq4gaUtjP+LjRHOA?=
 =?us-ascii?Q?YM67iI3btM1DfMi83lHmvaVDb5Rlsiio?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FFtwaKk4WxpDd2aitXVSugg7WzI21D1VRhKMYVLOuNZMHfzA8gUAz8PrwqJO?=
 =?us-ascii?Q?CTNqqkLqAhH4CyUZf27x5iBCbp1WYsITsg+c56uH5IMqmLAY/rZG1cNjPNPE?=
 =?us-ascii?Q?2lofIzllOWlcw+fUBudbOof15ye5d+HXgZiQ9fCzyebaZVZL4A7o/axogtjU?=
 =?us-ascii?Q?2cn1jFcBAXbhfODiaeV4v+1PsTi4tvDwkyazhLMiY1RrKdPVYupYThNN1Rlm?=
 =?us-ascii?Q?49iKehnbiv3Upw0wkLg265oZOCd2AahAcVY79il/Q7nMg2qZTRe4UYPh+t5J?=
 =?us-ascii?Q?YfHQ2HJkz2JI1EXvxKH2eDzTlWy4tzda3XZp9hpFOK3d0KXENexGTVOWBGSV?=
 =?us-ascii?Q?OzFgdjoGpzt/jYEhkB0MHpciiVhPCSXaL+Q3Cvvpn889RVKl3nPhGcr1jFa9?=
 =?us-ascii?Q?TH10LoWFFEkqLwDLzc5S3nbzjlji6QJZquG0qO2+9g1w73fZ67PLRqvNGP42?=
 =?us-ascii?Q?bW5IzcZ3GbZyj5dbt+X0Odt9X3KLv6J79ljkWWgLxhl+rTil+PCXaLHchEm4?=
 =?us-ascii?Q?9f3w4b+DG6S1ctwhUqhZuoAzj5rcCAVGy8JZ9lZsOMyouApZz9j2KzOZZPA1?=
 =?us-ascii?Q?l3dpB2ojb36Dse1sKb8PPFxYVjVnNbCuLxZ7kLfxF+thm4JvtoJRt6/m3yyu?=
 =?us-ascii?Q?TJp4bTN9y+plpw6wl+7ev3OBmQhQqK+L4bwRFMYTHHMPA1BGJYmeaj++6Pmv?=
 =?us-ascii?Q?SpekmW+wO+TSbeaCFr4ToUSp6XXMrCbKv6plgaKidf/djFrpFY178x/9bIa9?=
 =?us-ascii?Q?Neud8LCKMPt7M80KP8aUMvFkH1LHK3IfG9OdMtEDXVzb+MyQ0XoPakdEd2RL?=
 =?us-ascii?Q?42zrUvh+kLe5NEgp1h/hClqsKvzRGF8H47kGPdyfX1ikniBIX1O3IVIbFjmK?=
 =?us-ascii?Q?3cYo2K6v+OgT/lCpos2tCJ0d7CC4sDUPbSTFvvANYdfmfxq/5N8BjUYFPUhf?=
 =?us-ascii?Q?Qq6CobaCnpW5LQQDGrXepXt/lW8U/0QumV2Sxo+XNNdAGBlY7NOoqEvJC5qt?=
 =?us-ascii?Q?6lH/Rv7gri9MvmxzLzfhvcGLyIH9u21C76PZ3nKnzfTlmrH/49E6mUXIJyql?=
 =?us-ascii?Q?25+S18xIC4w8IshqktolDK+I8zjEoYLdZgmN+9M10xWGiReltaasvJYHKAS6?=
 =?us-ascii?Q?m+e4OObMDntCkrrmRIORxzI2e3M2rgfy/6oMJngm+MOx1DHfo6Mf+9q0Z+gS?=
 =?us-ascii?Q?dI6rrRHwwZdXcQEo0EMUVbwPJWpzevluHiN7yio6oYAj2aLmBIKZOXGstbMZ?=
 =?us-ascii?Q?CL6LDIeWW1qSuP8jn0IaDvBu16n/vX1wCMOTLHA+f7U0Z9xtYeNefZTvNqH6?=
 =?us-ascii?Q?MXNDFQcfEZzcgYbHw6hZfybwqhyLWWVjDNkmymjjSkWQco1sd/tMa1TXSAtX?=
 =?us-ascii?Q?SDrFwtt7U+3oRbFQ28Ld38c0ao+2cGkiKUn/ix+0JgUIjieRmBS5rMp+UTP+?=
 =?us-ascii?Q?aumS9YMODq3rW/BtmPheBiM9PCxPf0zuOI5WZJghaS/dMtbFV1U9Nw8l+tHB?=
 =?us-ascii?Q?G8eVbgOivV+HfUp0NON1l9E5GCxBcZMrHyh58M2cLJS7mmQWTPtuouzhIOFW?=
 =?us-ascii?Q?cJFxc6E9UjisKxuFD86NaPvGuYokVHTl4ZoXuclI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d4e061-40fd-40db-2b50-08dd28ac94eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 08:33:05.4032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Tm8AUst0iD4rBpNljazTK6mWbfTAQeeFcAOcXUmnJK/KWhWw9ZHzJAOaORQ1MMS83XuMYoUFQRTwxCdAAmwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 08:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209152

Tham, Jing Hui would like to recall the message, "[qa-build-notification] Q=
A notification for completed autobuilder build (yocto-5.2_M1.rc2)".=

