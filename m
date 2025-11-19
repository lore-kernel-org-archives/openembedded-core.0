Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB17CF2593
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:39:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1701.1763537938475573065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VV6md+0j;
 spf=temperror, err=temporary DNS error (domain: intel.com, ip: 192.198.163.12, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763537938; x=1795073938;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EcYT4zs/TYQs3wzlGcXaxU2eEyOTccUdVxX90xpmBrE=;
  b=VV6md+0jhycwMfmXzoIgsLl56Xkj6v8kmqa1e+3hkS7NwCWOX6xVTacu
   UfMMsxA/1XnQ5IjXtZB53jUWeWhEBrX0slVGPxzDn2DCiur9Wl3UqIMSz
   wjlLDMN4bb7VWlbE5FycVEdAKrxnkT1HJWVj8xtZeketMjv3QUnAMGBtS
   qZ6Lw35AJ5O486Uxtb4hWftaqbodjM/2sPUkmJThE8te2JomNQOq9U3Oy
   VzIOFE32hx+lSJUvkb1q34a/6joUKuJJL2gLBn4f8lkFdLM1bg2KuEjuB
   C9mRlWyU3kGJasLkpc7JC4CP+BwH00PXrdteFuM2Mnh9MJlznR0JPzpLN
   g==;
X-CSE-ConnectionGUID: 5M/BJiDQR7KPdJAjeLRmCg==
X-CSE-MsgGUID: t4aYSvqgQBOOiLFDHR1jyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69440103"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69440103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:38:58 -0800
X-CSE-ConnectionGUID: 0dFcU+O+QlyLB93Mb8laDQ==
X-CSE-MsgGUID: dIUgFo93SNykpSVv2DRlaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195292101"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:38:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 23:38:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 23:38:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 23:38:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9G2z2gmOJDfAvm0NOH7+kTFTe65C0K40b14yaCm2wa+3NuBiIMoIcEyMJInnU7hqn1h8ucMv8R1V/iAY6I7z3DnHWjVfFh3s8LbWIM7o8eOC93WYja9QeE7k2tIyIKtpiJpNfYssrB/YFtriMBnZwJaTU16jLDuanqgDJ2g8PcVD6SvK3bPLD65edFTNigJUb0Qd/Z01qdbC9djvPD4rQ51sglfpLWahy0mHZJ1z069yszgb4Ps9PYQbEvTqMlOX+cdZnCTiZTZ/oyLN59oSwKWJ39WFIw1OGvEozFm9D17oY2cc5kvXFJDDkKmM7ktPEFR92atMZqSjYEyOu06SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwY31y5EAMOaBoOz2N11oq0rwKn4RJ1xHcZ6wNRd1oY=;
 b=hATyZpSYFw9nBufC5Ua2p1TeOL+M0hJ2kn1qi9XcMVrgMmlgmQMjmM1UrTvBIML+IPO4pyLowIkR/HPPDU2oWrNQDb8b/MK6ZKxMzurQA5Mu8hfGurzJ33m3ZH5ptVcWXZDzP8kie6T+oGrPe2wAaHV045up7uoJ4iA0u6kKsqLAg/uGOS8vdIepqHGKGiC5HsjYwd8egCz61EzMUaC0SAl4WNBYXwklbEEAc1YMLLduO/LdHFL8MGP1HfjC1aojjxJfdCzPhpJsDCXzjgx9ORQr0x0nFDgkmzcqS08y1TJR8L/y5BgbZJV5XfxYF/DQZeUms5PvZLeGyl4UkSqzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:38:52 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 07:38:52 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.14.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.14.rc3)
Thread-Index: AQHcWHXWpbgJI7M/vEuUcWSr0ls5hrT5nHCQ
Date: Wed, 19 Nov 2025 07:38:52 +0000
Message-ID: <SN7PR11MB7018E5A7C36F4569B57C5EE5F4D7A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019a968062c8-61ef3fcd-751e-403d-a784-298837785707-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019a968062c8-61ef3fcd-751e-403d-a784-298837785707-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DS4PPF10012BF96:EE_
x-ms-office365-filtering-correlation-id: 73008cf7-3fd1-45e9-0244-08de273eaffa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?0EE/37oc5OHW7GbpznaqsI1d1MJsVX+NPZMoDc2MBleBj8UBcE7YwgwoZClK?=
 =?us-ascii?Q?PtZ3kj6mZsJTDpyLHIyTMCygHefzONgV7i5oXyol51zrs3DTmaUumSqox6Or?=
 =?us-ascii?Q?uAv4Am4tEDFwMcF2LKTJP9R1TFMOj5qA0B849aif/PFvnDp0V2sA58Ac4bit?=
 =?us-ascii?Q?i0woS/ixFMMkLwtoSm8zcp+6OS1TAkhBoo+YvU4/TwS4hOx+DU8UAFAWkXIc?=
 =?us-ascii?Q?jwRM8bQW4y7N18210RLWfAN2DhxTBhiP9J4NBCIIGzcBemsV1c8OU/pJOm8W?=
 =?us-ascii?Q?C9UXr5sMwMFssQHqTwhwArvn9o1u5qkmx6f+SIyRI16QG7hjRYOamz7r+WEs?=
 =?us-ascii?Q?Ee7+cgeV//HX+V8Z4/FVdbtqW0mS3sq2ovygWsQQc78LADRp34wpnN4QNTdx?=
 =?us-ascii?Q?cpWfHIfQE7atD9FY2EU61GI+2vu1b0NPzVEJja5QfI/KW2sfGhmDwdB9zEpB?=
 =?us-ascii?Q?tH/6kD4EzwaVUtUNJjOMo/H511E/HVzh6fz3RuBxARK55caytRuhVKfSKL2y?=
 =?us-ascii?Q?IWRGHPxjJlIzLST8uKOqanI63UiNlMPM/j0USdXG5Com1f+8uzDu/f+Vz99H?=
 =?us-ascii?Q?JzirCfJZkC8YnI0Vw7ArKaHsE5iyqUx8YGkCuqNqD07hMVKf8tFMM1Cn6fuU?=
 =?us-ascii?Q?hr9MeDKlwbbzrak9HcOHj2XMITX/ELvi/9rWv7dZG1ZoalJIJg+Im3qoDB5c?=
 =?us-ascii?Q?gdXuWsgR3s5Q2IazJCLhzvz1BNxYTIeeogYLg2zxkOF2rQDyGSvVBoebOFZJ?=
 =?us-ascii?Q?P5i0zARuZr6CSm3qPLrAJIY86N6rOjyNqMaze+1SXIhTn3HzwWC4SHW5sODm?=
 =?us-ascii?Q?Syt9dqbnlmOIfdvWKjMurr7lGEnAaZp4Y4G7BVO/SPA1LLaSFH+ZUZ0t/fNO?=
 =?us-ascii?Q?6vsX3GY4dFEKr8pa+ljumLPGGbiPFgQbSsT0fORToptsgcUj8oO+zrz4UyLy?=
 =?us-ascii?Q?Zkvpvf9i05Bjmdp9ABHNX8XK+tCWffksvnnTZqhgc/YLkyNSZa7Gd6eugj5i?=
 =?us-ascii?Q?VKJQyMFmV596VvYaRG8R9eJuSdw3k6HCdWAHY/toiqT2aTuLS2iMsVLr4soS?=
 =?us-ascii?Q?lDykk92hkzYIIuWpacVWLO8k/s9xaUxsKS4f9/zlQbvJiTLx55hROunaBNUP?=
 =?us-ascii?Q?Jf2TQ7zG6He6F6x2I20vXc10jeZb9KyU58tkmSo38vQXQMKAeOkd/Phq8mx7?=
 =?us-ascii?Q?KjSpEpZUEy9NP+VgWNkuvI1MvbZEQPyp7Q/SFxx3Kk73hZbhuuQoTpg8O37O?=
 =?us-ascii?Q?o5x08juEx8vmTiukm3nvWLh0jW3T5/pvk+kJeDhMgHPeCOXeVNi8GVdMn9dy?=
 =?us-ascii?Q?l7yCMWg0sDzgzK+yRaKXyCpRBhGxmoecmrkV3hSHwe+ZwPkTaoN+Udvt4YhX?=
 =?us-ascii?Q?2KRqYIqxW/mOEqpvUWliAJO3MX2qmnR8JT3kQFx4teDZRUTjlC7opikKge6V?=
 =?us-ascii?Q?S5+rGEZwGCpopPfb59qp/WdlqJNiIWzAiqOijg8uDEE/6h8LEECsqA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vzrtO0uY43sFPkcZGPEzK/s+WFreUHq1iqdEeZV+RwgFbU+k4M1gunetxYy/?=
 =?us-ascii?Q?1HG9o+bqUaE/k/1tEbFZdvcGcV037tJyst93BnHMuIERGlbUYUfzBQnRW1bd?=
 =?us-ascii?Q?b/LCX2qQiI9KngXTj/nMbok8A92kqol4S7OYamr/Linw9upgsgqkmoyPdp7J?=
 =?us-ascii?Q?DL7Cdq3+sI1xR/RdZubHxXIN90y7i6FKxzLgkefA1pgoCtjQYAel4ZoKbgKc?=
 =?us-ascii?Q?sN4FA+9Fw1UcycAQR2zDOoXEU58wmW12tEVrlBjnOESlKtBwZxW/t9Jqhw2c?=
 =?us-ascii?Q?VzL2yb1MXa3EKWNAJmsRccmwIT5RDelLXnJwxFIpGy7Y7v2d0qCybAcd/qqa?=
 =?us-ascii?Q?tcpG3R5WyHsMwQxR0pYzr1mO2Z79reDPCLemxMs6vpJR2jW3uzzecEqc1D59?=
 =?us-ascii?Q?K0V92FMBcJNlg1cSjG33gv5iAtixXndievGoWtF5xzPAZfjlBrMa4B8yKZj1?=
 =?us-ascii?Q?707S4s34fOEQu1228jfQviIZ7nfxg1xw9RE3+x3Lo3BNNV1bKqa8jv0wrj+K?=
 =?us-ascii?Q?YM2apzH5OKcSp597OumhDbcNvkNbTXticgRwvwvdnXusd4EnlsUFpdOGJWFh?=
 =?us-ascii?Q?i0C8h694qH7cgPZTUL98IvA2F++xaC04qZUZl5l7dN+MdwtghBVPXZHBWIEW?=
 =?us-ascii?Q?Jok+ylBQL5nDF5HjnOS8L4k++y2zzlqBN9MsK0hzyiWW9hqmTG/EYH5Vf1NW?=
 =?us-ascii?Q?IaUZg2yVaNxujBy4mVtXcjSG3Uq2KOyGdQlC03gKuzb9xZHOcHdXB1qkOwlt?=
 =?us-ascii?Q?A2TUyG78UWPYyBRFsK/W3HSUrg0HnQSSx6n9z7sEWnMI33s8/gDubnWNj9Vj?=
 =?us-ascii?Q?nuaFPcEQFDICLXGBLWmuvkPQT7ZJ9qTB7ptCr9d1RWdhPNBdJKp9q/24bl4H?=
 =?us-ascii?Q?SW2caOAExUfet4e6wmn775XgAoWMK79XwRl63F1sGAZAUfPcMdRB6Me1K1pn?=
 =?us-ascii?Q?FBbkouAdSQQsKbOD/mV9l9OCDAzlJCx3cApyUGjvFYH5r7X8HnGOiYQui4nm?=
 =?us-ascii?Q?Q+tjT0RoF+6S0zqYjL8WIHLueXeX2FaT2/MR0Brq+8eoo9+w53l1cDWASwcN?=
 =?us-ascii?Q?B4hbHqluxYQJxkZFzvLRVhVyhrldBY9tpKZsG0HCVaRBllPlzUxYj5JsneN3?=
 =?us-ascii?Q?fpYPW1xDY/7HojAKTWhAELpTO6MXSK7mMELLZF2bjhxfXyDiZYzkEbWb8+yH?=
 =?us-ascii?Q?+wOWciLV+RNTtPwVm0Z3X/sWuL+F/D1nusmptrSlWvkEgIHM7lmktCSvrGEl?=
 =?us-ascii?Q?4zgSZd61aGH/S+ZeVUx0KYwt9pEqV1/gwxNL8OpMN4RTIMtGbOQ9E4L/njUN?=
 =?us-ascii?Q?zM5HT3OjY7IesvZm539/rXfnF2tM8VITqaDNydGNOhoq02l0M9JLd9vZRlL2?=
 =?us-ascii?Q?1m92HQh96/HNh3FUM5fJuPJ8Xomp9cnPpwjfhm90z7W+dcSHfVOP60tmaxEI?=
 =?us-ascii?Q?P3mJ7GcCAnUiDW6tJo+EHhQQC5WNnrDlOYIcIMXr4O+sTan7+ypKAfjkDJeY?=
 =?us-ascii?Q?bSKA6QMKjDklGi07TsNrWjTRqmaxB9/Fg39o5ijLXGRIBXF3wmq/EA2DH9BR?=
 =?us-ascii?Q?3IGihyrsQJObJb8X+9mHFRI5kxzIJpzoAi2p2SKd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73008cf7-3fd1-45e9-0244-08de273eaffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:38:52.4075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw16cXtJ/M+YymTj5sSLSIF9YTLhR/qlIBVS1YrBb6FZkTOELQNKElwEsGzh5GdIS78lhQIYtw3Kchg4cK0Eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226538

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.14.r=
c3. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone Black


ETA for completion: 25/11/2025.

Best regards,
Ghosh, Debal

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 18 November 2025 15:56
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.14.rc3)


    A build flagged for QA (yocto-5.0.14.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.14.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2738

    Build hash information:=20

    bitbake: 8dcf084522b9c66a6639b5f117f554fde9b6b45a
meta-agl: 8a94f23d8d81c02c74268ea18c35469c47a94b5a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: fe840436ba483533afa9b34aa2d1a64e7e9a3a88
meta-clang: 731488911f55ebfe746068512b426351192f82f2
meta-intel: 6fc37057c7f0293a2345e303588901889df8b937
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: f1f248262d662315159ee96c604f97415d1dbe6a
meta-virtualization: af1db2042caf8021d767dce1b26c08b59b96f3d1
meta-yocto: bf6aea52c4009e08f26565c33ce432eec7cfb090
oecore: 471adaa5f77fa3b974eab60a2ded48e360042828
poky: 7e8674996b0164b07e56bc066d0fba790e627061
yocto-docs: a8687e4bb2e822670b6ad110613a12fa02943d3d


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#620): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/620
Mute This Topic: https://lists.yoctoproject.org/mt/116353983/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



