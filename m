Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BB2C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web11.12170.1746001751609480011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 01:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=J2L8u7pI;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746001752; x=1777537752;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=khT4s79ZVdbV+8cvQEWlgLA/i0kviA8s+QzVwYvlLn0=;
  b=J2L8u7pI5NuFoeuSAnc7VpGNzGW9TJ2nT/Cjux17nY98EZbTAGnVbYAf
   VolqKMNy76nSxZ9vVUdiePR0ztv9Vjrvqq9ek1IWv5IK8tbARBpmxeXgR
   QxHlXUu7xjmD/iT7gd3AxrMDTRSVWPG4f2osPRSxi2oRH9uuxP+fmUvDs
   e/1/qDeBk9YiOiVg4zWeM/W1Re6kvFQO4Jq5tNveGTRyp2HAUzeEZOPG8
   wpsxe+eJ7iaT41va1B9rBPzlmFqA25ZmA3xfXgH2fSW1uYsTOzjPJYowD
   3PNhdnGFFR9nVw1+Qij6KkKhfr1fn7TYjBJ0HrZIZE1k+PfWNYan2X7Tm
   A==;
X-CSE-ConnectionGUID: OWBiU1mVS7ycyf9pOCRYXw==
X-CSE-MsgGUID: 01wNU25HSU6Ua+TW45XxfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47532427"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47532427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:29:11 -0700
X-CSE-ConnectionGUID: A/M2dTklQAWyOn7vJK+b9g==
X-CSE-MsgGUID: OBOJe8Q+Ss6L3WWSkZ9ClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139033141"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:29:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 01:29:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 01:29:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 01:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ3T5ceO9mUntWijHXABG3znKri3vBfR6C1aybhZeUFLdClNTM6LFx9HwxZo1L+F6otHgEJWx0QwaFa0NWMlI3nZeHDBMeWEzaKGKUjCdyFjN1WwC3VVNCIaO3hUm6WLbMhldQXTEOmqiRAbLjQx1MYSeXrv5MnRl74e5gRxsh/8RTyZX0NLOQfoU3P8OG29tG8yPxPExd7GCIOTKl5v/FjAmFREHHPjkI0jFqSfjoptvyy4GLqPMkaZ9qg7HYBk2ArRwwvs9vMoX+HL8twbqyMTiItPX/virV9fNQzoSRY+r/LEjCwPceQHehqmMZNdfzBru0fiNrxW2XM1QYyQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AnuAc/ym1Gx2+Uts/Uo/So43TV0cpBbhjy/LEsOnYw=;
 b=Qwz+r+rAOLHaoXMvhRtIm5ghS6oRq0HLVhJvQ/Z9t/tZl6WaSbzNWdgSuZMQA5YblLuRyYM+lBOs1/4TSX6qqPUxR/tkKB/dM5hkfNV603GPdfEz4+O/HyTjCPzqbnCs7oN3eOcQWJhRpGNk4Az9SqE4V0iQkR90qM/91Bko0ZPWOQLdhcEZN1Jt6NBPctZDsB/rVQfQw6JvWZ2IKs3k5+dvntJ7Fm/GI4kZVdrFW5iIxrgUc6eNiwKiz9h4xXQb/aNq8yv5mUv7d22hubppcn8XcYuaYrfZdXqyKYMlvKxc9S/qSgoD69f6HVcw4vxCQrYppVHQCJfWMjF5cHZhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 08:28:26 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 08:28:26 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.rc2)
Thread-Index: AQHbtJ8E0uM7d2AGOkq8ZRx0Xa6gcbO76kBg
Date: Wed, 30 Apr 2025 08:28:26 +0000
Message-ID: <DM4PR11MB77606D306C61E763FC2775F8A1832@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019664c3ea31-a6e3bc5a-d6fb-4dc3-9815-29e1bb0591c8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019664c3ea31-a6e3bc5a-d6fb-4dc3-9815-29e1bb0591c8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|BL1PR11MB5977:EE_
x-ms-office365-filtering-correlation-id: 5763f598-af96-4fee-0c54-08dd87c0fa83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p6J9ucxfmMapDNPrAbkDR1urMntteYuPdUfHg1EJqx2aTVrSn2GRllYGHD16?=
 =?us-ascii?Q?4LPLCQTsTCZtoCUSRBwhhByLoJZIjs4sBmRU8DicjVoQljVwLtEkCG5xTSZH?=
 =?us-ascii?Q?UzWLrkt3hul+mAVNCSFDg7IJWxUOtQ2c9HtVDqRyUhQWHHf3skaO36Tj04/6?=
 =?us-ascii?Q?qCfJHFcYEh5xBpnd0QQ26lUSNzQF/ak/kHKnfROd1j455HOjJkAeAbNYMlOl?=
 =?us-ascii?Q?eENzHMEgvTfPBYMON//mKrN9fmawMSmGNwWUdsoOO+CQ4zhWCJ3iY0DL4edc?=
 =?us-ascii?Q?pzZkltcqXmXz1aRNXOml9KkCEv+pikfomr5ifGibn+ioHn9d4Y3DqREGAjut?=
 =?us-ascii?Q?g/d4kifzryZHvc/cuFiBIj3zquk++UzC9vOT+jCtke6G4M+8WIrORRG1ESgg?=
 =?us-ascii?Q?waLhH8vtaQOY30gUJYhGcnNkbjYNiGY3GStblcsRRQwkiPqqBO6DhPzJkiRk?=
 =?us-ascii?Q?ZqVKkBKtgLDCiF/QjCQ/XLbACVdZdOdvMx4n3J3SAM5JgDUjDbuEdJ67jj9G?=
 =?us-ascii?Q?DXgK7zXzjRu2baJTCjO0sWqyk9ctJm+W47QVw2WOyXPrSEtIE6GdsEIGrxiT?=
 =?us-ascii?Q?Ku9hcWgmkqNskaLBhP8H1njeUbCmq5o+HFqf50OCWMjYC69gEs1MAeN4tYCS?=
 =?us-ascii?Q?NKHFl1lwlI8SRylwL4ywLbpbVqv+jGbPbN8tDIl5IpBUGfR9VBPMnIhSkH5o?=
 =?us-ascii?Q?oAGIiMrpbxxfuLVUqvzhR8QtXIvJht8yaPVvU/baDPareNzCJE58rJvjiqvd?=
 =?us-ascii?Q?DMeVU7Yitlz3oPcEIGHyF92FbYCfrgexwPK+6wNdqlX7ZyA5eBHfw0TOGeqH?=
 =?us-ascii?Q?gzJ3Alpqfuv6AFtBdw6G0cCTGPRArjKYqqRXYD3MGxugj6dwEZzAUhgYRz2J?=
 =?us-ascii?Q?sd0a4/kGpQW4+WVt1EYPPHN9lBT4aHpFWUbrKi1KG59BsNXogei0+2ePbmnm?=
 =?us-ascii?Q?mUnQRhZ66OZFTsAL5xx5B+YD0rnjkNIURFUZ0hPeuLiAMDWjNevF8jbHkuDE?=
 =?us-ascii?Q?yhrO+tROuuXa6ReTfyyU2dGdA1VmH3eFP950GjgHqA68FVXQPBFtMMyQf+Ev?=
 =?us-ascii?Q?x+GkitzAx5cAaKl3VqepabJNkFrGuQRCqbBeMkf/AxsJj26p0N5OXqIcTfS5?=
 =?us-ascii?Q?8g4HlIxGvLxny52JMkNs3tnXwcY5rQSynWpx1gV36dX9d6YBvWavRwmMVdhh?=
 =?us-ascii?Q?TNCC3FTxrDsgTRjZTGDH8AYfa8GMo8GhHe4dy04HG76lPTR4uFAU+o053jUX?=
 =?us-ascii?Q?Wx7Soemt2Kdo79gkm6A9OifV+BpG8QvOlg/u7hqJ+RLN8SlGEGWz9xasqwWS?=
 =?us-ascii?Q?3Vh5s7QtE68kSMdFajsXRYiiKvCR08bUVi3MfEPIFEPrr4snzk9bqI8wWnm5?=
 =?us-ascii?Q?jEwQWEBSVaMPrrCoDUnbJpuSWU+osK+aB2soWyYI65lpOCiiPXKIZ1WCu0TZ?=
 =?us-ascii?Q?oO55g9uEaMs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j4WXmWZ0Na0SlM/kPh3WrrqYS8HMcf/v4ylUB8O9EtuDD/LM4fUIkJhQkBDt?=
 =?us-ascii?Q?EiT0QK54b+0u+SRxwHi7J0E34L/zzlEaKI0EbwJmOWeXUCSOZcv1AybBTljS?=
 =?us-ascii?Q?fNknkbgGv6UFpd3Pdd81D87evjBDyT+e+kwZJw4oENCb3LZEHdvdhpN5XmXK?=
 =?us-ascii?Q?Ht0ZA5jvrTS486LVnzwcT/C2foBIU4Wk/DOoOnZ4LPl/9Zv6PArwIaQSTq8t?=
 =?us-ascii?Q?HZLQvGOzqGSVgro6JmtDhZvkEtbnSbl0tikdxkC+nSGN1R9DW08B2E4lHBcM?=
 =?us-ascii?Q?rTnAwRJ/R1JU6PWLjck+pRb1iBPJ0m2zOoyrvpMrAu42AydZ+L+XOfjzHfQ9?=
 =?us-ascii?Q?QwAw0lBdhLXc1r0/KjY17z/XcnglmgXNRvy3Zi5Hl0YnrHDUFYR8zT9lfObu?=
 =?us-ascii?Q?DhT2jDkqRZ5zZN7hFj7F+D1Leex27L1bc6V7SUoWr57N3LvatlxKtIWnAn/3?=
 =?us-ascii?Q?rwdi5qo2nRhdCdcRnOnHBE8ZN+VAAvUZdkMZHaQbfV1lIfOJMKQZuylC64A9?=
 =?us-ascii?Q?JYHmA+hnaSgr8otGUuVtQ+cLlQu0i/844YkKD/95ZxYiQ7lGiNzzWTU/x/YR?=
 =?us-ascii?Q?PNr1gV0WH2WmpYee1y+ApVJfZf+lflBc9S8lj6wzNDw6vDrl2yyUkGeiJPXK?=
 =?us-ascii?Q?O10G8OPUL2UdxbsemgoeY1ya+y6V4vKr1GzisPheTo9cHNE9F9La4zIAMBK6?=
 =?us-ascii?Q?48hj0cJS/0QfYW14EhxN8W+ng3VWrAi8XIwzFJfxiah55B3xmxunLw1158fT?=
 =?us-ascii?Q?oGxw6P2CA+T43ikj30kid2izEbkSTRCJImNtfeTJub8tPy0PJJRTSchbhZfi?=
 =?us-ascii?Q?TekNho6cz6yBlW9PFqtXCcsAl5DiuNqkolnCUJAxm8PVhY5stc8OP9KIuAZh?=
 =?us-ascii?Q?RTxW3QYC7ls5aVOnAHKwrWjsIuN0bQFub0FwBVhLoZrLU+plomDJhidJpCPP?=
 =?us-ascii?Q?gFJN6a5s/bhDikgYg5fEmawqGdAq5C60lVIh+tY3ycsnYGaauYuTW4swFoMj?=
 =?us-ascii?Q?9uM1tZjIe7d5V3bvf7F/Qsm/ekf/qjncnywYODnKOVfaCOlFBii0PXQ4SF5L?=
 =?us-ascii?Q?JhpyVXUF9OoEPOp1F99UmnZkGa4iaeI3tY8VM412NN7ClP6F/HeRMsP2Z/y0?=
 =?us-ascii?Q?FVNAP72Ck7Ppw/b9ZiQPmabgwk7Nkwjf5Fian5YLlVDqbRadPMp6wyD4utrB?=
 =?us-ascii?Q?nVEo5AXrPGnnpmm8r+0sTNdaqzNDgQHCqtkZrT8IsdQlK+aZq03Yn4oFUOeP?=
 =?us-ascii?Q?WmhWyoaFW2TxpqNwgKfyTmJ4i/FL0TAKnOAhxnypt9FTtZxg6gS0jHM9jlKI?=
 =?us-ascii?Q?GxVXXS4wIjLCZ1PRBExsIQjWcDUIf992n0BAT+RF1CMsZQcVT3vJr0pP5t6h?=
 =?us-ascii?Q?LoGroOPaEous5BnYcf6XUQNKEfyiNswRgQH9f105m+zv99kGDNfpR3KSJ8g2?=
 =?us-ascii?Q?DJTV22HylmCu3mpMJRGiRzb0zgaKVY0OmG6g5aSqNeuSyJL164wL6W2lC47D?=
 =?us-ascii?Q?1FN4XWxf+OHRnoLc1I11DdxruwfOUT8re5URz3tpAGwB8qkrid44bFwRfkWo?=
 =?us-ascii?Q?mU4dHcKs6kDiMEImwYCdvllPv4JBTPxrZ4Wb3EbU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5763f598-af96-4fee-0c54-08dd87c0fa83
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 08:28:26.2453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iXsX4lLrj5z9FGBCO6zIxeCoX+etLc4TiMXlc+Yh0vasRGiurMILCss1X74mB90SqDdSpHi/fHvNDQLM7KkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215727

Hi All,
=20
QA for yocto-5.2.rc2 is completed. This is the full report for this release=
: =20
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
> Sent: Thursday, April 24, 2025 6:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1451
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: 39eae92ac42a4ae6900ee012324614714750ce36
> meta-arm: 42928dcc171629b495bbfcd8eda17ef6b8bdbfa3
> meta-aws: 519cf7e251d7344014eeb7e979d2dee16fa9c748
> meta-clang: 2c9678cce413fa6c6c84a8a631f4635a4f862f11
> meta-intel: f1b9bf5f10a03b357fc9dc58c0fa0614baf6b855
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 0d2d2d193a1619b6dbebaf335f1ef785478049e3
> meta-virtualization: 4fedb61ebf60745a367d857af255006bd3509a39
> oecore: 6ec2c52b938302b894f119f701ffcf0a847eee85
> poky: 9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5
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
> View/Reply Online (#545): https://lists.yoctoproject.org/g/qa-build-
> notification/message/545
> Mute This Topic: https://lists.yoctoproject.org/mt/112423836/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


