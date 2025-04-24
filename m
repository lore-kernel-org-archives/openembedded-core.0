Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2709C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.12010.1745491105608717400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PctoJh3d;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745491106; x=1777027106;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=u6HnuHmgFxMjmFmj2tRlOt3kd61qYD4kSgjQVhkmxng=;
  b=PctoJh3dz4ed0pyOvU6xtofKU1DE2AgJwU/8GRSTlTRsReQ/8/r6tR6j
   H5f7UqAz6rZphKmRzVo28ufjwGnwvUidXShB/N6hFaeq+KqBRdin9fuZ3
   sDgm92WxoncRMrJ58Pr7IPBo/u4c3mCKxr2D8sxGuldK80Hvl/6fzTsNj
   lmksm2q3dZ+1cslkznxys4Gg6TyaI6pNtC5nR31wlyxbd7guiBrH54BtR
   8hDSAA0Oxky8i+mf5x7DOEDH3TRHSKocnHcnZFkkf5QB+V6tkuZXvwVIn
   wMCs8MSzo5cr9STG5MELNqo+/MVT8D+5cKxn3tbdKk3a67o3onYh6YKJl
   g==;
X-CSE-ConnectionGUID: i4cYODJuTye610gEdP69rw==
X-CSE-MsgGUID: ymFDs7eHQ4yrAhz7XcrWpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57312203"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="57312203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:38:26 -0700
X-CSE-ConnectionGUID: wws5NOZESIKwevn1KIdX8g==
X-CSE-MsgGUID: BDUhBPYgQ2iKYXmeVB2RLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132463184"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:38:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:38:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:38:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:38:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+qk4eEzmT0qvZUlaSSSoPnSPzwMnPco1hNzBO1Zt6vEp6EqG/G5UXHYA49XfrxHxXZd+jeJy1LXqLXM0a0DzemMO67SKHFduUkPi/bLLHBVJCtGkOJBqhwtgKv0NTOujur96ibVW5PsMRSIFFTF5X6CwaLnc5TUryRBaT0X3VMLUxDQRV9MDaxLSS8ozY7fvwmXck+g0IhNhxhKQZkBqE2LjJmhmXZOKxiVZ7swUDGQ+9d2MHWwO85E+2HQBb/Hxqa3vaULbxinXkhbIGnYI3KL8GFMsGK21dC2Pifxc7F4gZllI6FN/pa6RcwpkxPhzykei3Kl8IHMROXFe7SmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMbbPKYd+Vn5LosqA3g11+mRQP2QprwbUnsMa6MKdWQ=;
 b=mCxq1hO3Yi8AiAv9dYmkZBpzmkVPF+1iZy94bsEL8KBky3TwxlAPHdGisDY326O+9gi+ZLk5Q1ifrhqjjYJXwwbuq09nUcUeO/BdqjCPEZB8aHyBT1XfDe+6pE383Ym7urbWZ0hcKIekH1PpvE8y8iGoBsNzeS4eWq9pWBbQSQYTXuGtsPu1BRB7UlZOZOewEHORXfRXYBCcp4D/zKsTGEasDDwpSQ6BUZWWQZ0buTaqaEWcmyYLfNF5g8zaz2bh1X26WAeL6EGpmZ85ae9Or+XANpovUaFxobtre9/4I8kFgQZAVFORutoTQ3shrhl+8dsMkn13/j9KNk4qewukKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:38:02 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:38:01 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.9.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.9.rc1)
Thread-Index: AQHbsZsTJ1MG8iEGekiT5qXLRVeIR7Oypngw
Date: Thu, 24 Apr 2025 10:38:01 +0000
Message-ID: <DM4PR11MB7760BF7C8BF955CA1B8B0024A1852@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101965100f948-c358e3d8-c280-4c1c-96eb-083f635841c9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101965100f948-c358e3d8-c280-4c1c-96eb-083f635841c9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH0PR11MB4998:EE_
x-ms-office365-filtering-correlation-id: 7ce4ee81-dde4-4c95-0276-08dd831c167a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007|38070700018|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?X/WuKEipt2B/+LM20H5HcZ8+7F1LQ3TiO1MTOnQk5ZSRuVt2vJ4FZH5AsWmR?=
 =?us-ascii?Q?ngTWoveAo2lPI+w9Bubu7XaHMIGfrSsuqdqYayFoas8LSMGYaJtRC1JJblzz?=
 =?us-ascii?Q?XSoZOzMQfI2WJQyh4RpUrQhmfp5Z22JT9hDmqYQnOrf/wSJeQRrugR/a5cFC?=
 =?us-ascii?Q?h2hqN1v2EN6hmDs1Tndb2HSANnvElXyRLdQA80RD3qooFdQvsRSNFwj67RPL?=
 =?us-ascii?Q?xKRE0QOvN4HSC18T8gIX7N7S6OFGFujSfh9Hb2fBUhX4eqoJ0NNrbqMDCu6L?=
 =?us-ascii?Q?m40ty8vGfyAJXteXDz/dB/Tm5zsg0lLZqi3yspHPjNSkK+o8BJTVtMZHfMZK?=
 =?us-ascii?Q?fD8OC53ZS8KrH9OKnacf6CZyql2vUAR5lyM/HnX160g196kMi6it4y34Eefg?=
 =?us-ascii?Q?yJhSTxhsNbbnIFMV3Zgcxra3BQG28GjhiDU5o+/e2W7iPGlb+ZmDUvRta7bK?=
 =?us-ascii?Q?XlnR1pYQBdwJty7tDD6fGKuZ9lDo36QxfG7zIj4xJoiiy1MEyDytrJ3R6Hr9?=
 =?us-ascii?Q?xJp+SmIXJFjQIpPCEweIyzQYBZ6gT+QWrofcRemZqJXkiNKBm6nO8Y1NXe5M?=
 =?us-ascii?Q?CUJdHMhay+xtWPNkOk4JKReJY+U9vdspQS16aX2tl7h44QyYuGLqNVtySLl3?=
 =?us-ascii?Q?g+oY+up4hFcEkNHQkHpYoV2tajusD8PuXx3wjuAu6+rIKf5JQmVIFjd1xlJw?=
 =?us-ascii?Q?DQ5WvvRfA0SMzPsg2gyv3Wz4Xx8OSuf8xAHSHMt/Vc28Wk/lXfmzP8/3D/ro?=
 =?us-ascii?Q?+lXlzjQyHuGWTUkULPcAysXgeZauZiidG5XVjENzbHWmRImq7cFAvQCotuP1?=
 =?us-ascii?Q?PXV75g2NPYtGhZn/TxdAajMo+Zdu89No8gwFJ/dLxX8jZc12bb6MDnBXHbX7?=
 =?us-ascii?Q?dmEYYLhmev2ZccAz3zXS+qAKyE5YWEv46bQnjLKLc6uMyu5B9wV00tJO5egd?=
 =?us-ascii?Q?vncJe5WJVJabk0TP3YJXdXzjNERCmIBsTArzr5y6VdSFc0ksv8NGf2N6w70Q?=
 =?us-ascii?Q?O8EjH499GfDA9AHHOpMWONv3ULt5twoQbH7JMpdd3DAU2rtBPxpUhfynfGmh?=
 =?us-ascii?Q?onncpSLK3tqXTGs3BXoSgh7F+PMNNqcKM+lAzEnwCg3+KNNNmMn3TMIpO2bC?=
 =?us-ascii?Q?XKHH46apKDNaHM8tBm5/7koJixPeIylFll/FNAHdSdx6jibRZWXl5ZX2TwRJ?=
 =?us-ascii?Q?7802gGFSHb47ebTWHTfchsfY3smcWnLODVCd/SAUFKccGWTyZM0wDB7ZOH+f?=
 =?us-ascii?Q?+uU3ReghowUE/UzOrGo0JmagN2bM7j5g2tE70ganwqYtNdsOFje2XQopRRnD?=
 =?us-ascii?Q?lnMVT3zYB85KmOrNw3278bD6bFYcWniC4lx5W1PsktjPe88KGqAHSf0UfQXq?=
 =?us-ascii?Q?5jYhWUoXrEzTgkJlrv/rrOisQmON+us4Mc0Obh2o9RXQfomZ/q26S6RVOCjk?=
 =?us-ascii?Q?AEUChldjIc8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HqP7WGTvb9+pE5j7w9Sc5vPLt9UOGdfxhHCTEx1aU0qFD4347/tA0nJvKBvR?=
 =?us-ascii?Q?DJqnJKu5k2yEx7u9aY6KcCEb2KEDzgAMBre+eYoB4a6UYt7V22SM7pRYGULl?=
 =?us-ascii?Q?E9U45mGH9SGRjw+Op2A6QIGpxk+qj+rnbvoq94OoxkPrXx9CPgNwYrqDsZ0o?=
 =?us-ascii?Q?4zeG/Vl93zwrtyS/LCmaZcioVKzGM4mmDbPah2/GVAqKga81qsWOxw5aLa4E?=
 =?us-ascii?Q?htOzXcQaA4pKHRMwcdWf2P0VzKdVc7r+R7qJE3NzJpUZYF6qRRZXRDXDrvb3?=
 =?us-ascii?Q?YpqNL+tKCncy6MCSRQrH9B2QuTa0PzuKWTa1pRSXy9sElTIIeKmkdeR1hZow?=
 =?us-ascii?Q?EtQC7pIDgIryIZt/fkctey/0biZd8DY8qt5jb+O9+S0JVxCTtksrDjh8+6QR?=
 =?us-ascii?Q?Xf0/15oq8+bYXHSZHFbUP7VAlsGZNnzJXEFO4vuGojAIR8kIT3VANeWnfe8H?=
 =?us-ascii?Q?SjTRwtsB2r7+f+qyRejcDNX9/I5rLHZ0Cx56nKFMYBr2Za0vMrEVqMC4G80J?=
 =?us-ascii?Q?lEuxAV5/6rV0rzfZAhBpMuQT7R8PhCCrZqLbZH+4CEBkLaz7NYjiJKi81oyv?=
 =?us-ascii?Q?lLQZ+kPUX+uneDsfnW53ckvFFJyQ447Tg8TkjexYpm72IYB1QAIkqIFT6NXW?=
 =?us-ascii?Q?r+WdNMVi4LjZ2045tFe7CmRZ5TR8wHBkAlkaRI0yKOchw86vIxMilx3lY0aM?=
 =?us-ascii?Q?ZjVIKBRUoe7GN8ymwBU96AxU2BsBmPDKY28ncjs5ddTfdSDsmROXv6r6Pr17?=
 =?us-ascii?Q?JrSuRBUS9x/7UarbzGs4kHRHhgsq16UFzvcWikcGWiWQO4+QEGYF2klSL9If?=
 =?us-ascii?Q?tK8WgmVjCAhFHCIVgNiNGmdVAvdclWGi3uGeheJnKh99BMbSS5The88CPCvo?=
 =?us-ascii?Q?znT8SzV7ZckgYe74OUhAc5Ql7Pm4SPPQLFB0HpObpILqsPCQByfqTEPb6gjJ?=
 =?us-ascii?Q?5xhRJQemYFcuHxc5ByUH0yzQK3Vmj9SzijTGAW2y+X7j0fzCZb6ysKBAVjAH?=
 =?us-ascii?Q?VkzAxw+xTTcwtEVH19ZWSQMify/S64zgRch75CmHRO8FXoZ16MT2B5zTkOOr?=
 =?us-ascii?Q?fWmfExxb8wy+/XLM6YFeU7sDWLXBPhB1aLqVRJMmt6LIvPsTZdgKSU0Y0WiK?=
 =?us-ascii?Q?tM46pen4PaEnI/jUR7AO3/gnOdze7Jusl2s3yDaPRV6rSgNPyVpcQZ9GafW7?=
 =?us-ascii?Q?gw2TKhXmACszBx9qFqt/txhxNlFkguKMpms/oBW5Mt8AA8AAmGVDXVGG7ReV?=
 =?us-ascii?Q?ZQpLmMuWUjROEpYz5UbXFei1XPxYHqRsszk7IgyzeWpPFCpe6yNfX4ywkBbE?=
 =?us-ascii?Q?rVcgpcFwXshOqTdhkhYpDB7ijlrMYwnWUmJNyQc4qaWIKAjGLyPxE+VTS9Fs?=
 =?us-ascii?Q?pOK5ba8ZhlQx9L9fTmkvINu7NEAdzlT7YsqV/xoczpaw93iXJX2HyYhW/3uW?=
 =?us-ascii?Q?+uHuhW4lh0vgomYvpy2mTuBH8aOl9Gkepom9BSY+mkOvzTIuX7bVasVlGipr?=
 =?us-ascii?Q?U+T3VdWmhTWidMAA2GHzjoNnPJV4vJN6p2K6L44fIOaLGQ5AVM7oAwYCdppF?=
 =?us-ascii?Q?LhVVXFhO4WJFewdnNZxj9WN1FiPQt+rPJgcnwKyy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce4ee81-dde4-4c95-0276-08dd831c167a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:38:01.5706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okvAeWEEYtJue/7ovFqlE5bqHpp2/dH5RQ03wHLABKO/uNHR7biLocnIXciZRKtUBndzQw243ePEcyJ/a92MQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215352

Hi All,
=20
QA for yocto-5.0.9.rc1 is completed. This is the full report for this relea=
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
> Sent: Sunday, April 20, 2025 10:22 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-5.0.9.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.9.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.9.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1423
>=20
>     Build hash information:
>=20
>     bitbake: 696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
> meta-agl: 70d6b766edd16428e5a3e61c82b4bbb2dfea2de2
> meta-arm: f3640941c600d03ea53ce5b9254f0fead18f8bc0
> meta-aws: 66780aa4542c6603420b2a0c2edf9e15e8b99c40
> meta-clang: eaa08939eaec9f620b14742ff3ac568553683034
> meta-intel: 1a7ccdcaedc965f019a9263364437356b8a2ba29
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 67ad83dd7c2485dae0c90eac345007af6195b84d
> meta-virtualization: 9287a355b338361e42027ce371444111a791d64f
> oecore: 04038ecd1edd6592b826665a2b787387bb7074fa
> poky: bab0f9f62af9af580744948dd3240f648a99879a
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
> View/Reply Online (#542): https://lists.yoctoproject.org/g/qa-build-
> notification/message/542
> Mute This Topic: https://lists.yoctoproject.org/mt/112356251/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


