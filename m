Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C598E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:23:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.36133.1736821290340380544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 18:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ELTO+8GE;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: munirah.izyani.mohammad.amin@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736821290; x=1768357290;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=F2Of1EC5sCp0lx5RbcQ9St7L2TtIWdX9hkH/KAOQemo=;
  b=ELTO+8GEYW5ybdjmW5JsxtwiJUY4uEYbizEjxs9N7gugCQ4bPiKh+pnr
   dx4tUC1j7YqV2TTPIsS8B2LjUCkGDZRIUsQPr4L3t6YM+EUGBT0mYTRnm
   2pqvh0qhq0yFYjWW/uclJsON8vxbxxJyr+59Yrmdy93iQyPfNMZfOWRjt
   I2ojClUBmD9J1sC6wHgJoHZEiO1w0dN6x088u2vsUdWvwp1NBTewEBf89
   di83Ghr/HQUllNeNL4VpAP0P9TO/tRlTKFZ0NDMed5qNfZd5xYlWnXyc1
   U4o743jgFn5Hci/c+ODC07sqFWOWE/HB4sTsv3P6+LjQNQLu4fElzL8iD
   w==;
X-CSE-ConnectionGUID: TN/fAhzVRWCpIJHWt8HBPg==
X-CSE-MsgGUID: ZbuYUoBZTIa01klijez//g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40872302"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208,217";a="40872302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 18:21:28 -0800
X-CSE-ConnectionGUID: 8L+7XW3TRn2hj3s8+CVcVw==
X-CSE-MsgGUID: l/Sx20kdTJG5ji1udk/PBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208,217";a="109292391"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 18:21:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 18:21:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 18:21:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 18:21:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtdUj50/LncJD/zhEaVYYMtpLwr6weCI6m4zhIBq85sVrb70EKPjahqW6ZCy/ENs/tyZhPIn+eVZVvY2bKcBIan6HJQQS64eURmni8ZDgize0md4QFLQED0bVshXFcTmWrjYLYv8uNQ9k6pa3HKEu+X97/5IoS6JJB5a3hkPi4P1FZmEZx+kMFsWp8xFNl1t+bRG1he48YAHwoh5IiwdHvnqgQwgty3HPTOF4XYnFpPyCYUOqmpWw6HRzURYs3rhMEYqBBT/w5j5LkUyLxV7zKpkn5xW5OKNWyFHQjrjC2Cs2x9oztGik1HRIVE07WpR8UaaaoPFjjsjE7lTeRrG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+M9v+U9R0KwOCHpnjkEETOSJjJ0ye8wxh5rkTCePIg=;
 b=Ne9wM14YMvD4FmzfROAQ63yTzzWfCyoKh7gp2pKGxwFkmn0ReNPMb56h1GVgH7E3favF6Z6TnbrbUSsAoicqjb+pbX0zcd+fSZtT/T9rPYqCpG9MrquOceWJWe2O9yvyOsWsOqDNLpnYYa4Z0kGrelsuMeOWJaTTprZ5RwzfSvYxnMAtIFQEODYayeqPMErnaonN1ksKtISOah4BKja7nV7y7AT/LHo3HAbiBze8JbdtSFCxXL0kESWDTGRf3Enpf8j9hUZcjbSx2QHrom9GuyY7D/7c2NWDpegTaMfVYQVsfQHqf5yRRi7swyF2FwWx4VOrQ/uS69c4PrHzd8X7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 02:20:58 +0000
Received: from CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf]) by CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf%2]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 02:20:58 +0000
From: "Mohammad Amin, Munirah Izyani" <munirah.izyani.mohammad.amin@intel.com>
To: "Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-5.1.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.2.rc1)
Thread-Index: AQHbZfthhNWYoaek00S80gITBlHx1bMVh+QJ
Date: Tue, 14 Jan 2025 02:20:58 +0000
Message-ID: <CO6PR11MB56350BF93F80DEBB2D162F248C182@CO6PR11MB5635.namprd11.prod.outlook.com>
References: <CAOSpxdYu46-Ex3O_uyVhKc7rqSJhoYO8VXBOjTGm1tOOt4y=3Q@mail.gmail.com>
In-Reply-To: <CAOSpxdYu46-Ex3O_uyVhKc7rqSJhoYO8VXBOjTGm1tOOt4y=3Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5635:EE_|SA1PR11MB7064:EE_
x-ms-office365-filtering-correlation-id: 260813e8-a524-49ea-3bae-08dd34421516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YdL+h0GhG+tszEFp8GoEhjNMqSowsFJa2KY1BKxfueAkYhBxVnE/Ic/qmA?=
 =?iso-8859-1?Q?eo4xuVg7PhzPbg3Kmz1WE7OTwYlzUQeU1fLGhFPoJpqsx4kPMJbR/3NR43?=
 =?iso-8859-1?Q?w93EGY9YQhcE0s2qYJTcsRg2WdVFvKC1JY0mSq9iTSog9r3Q5WgrxpVOuS?=
 =?iso-8859-1?Q?OWoag9s7UwF1QYhKza0HiT28OdwpErru1ELEMsM7IvlXR4HHpmEqx5/nG6?=
 =?iso-8859-1?Q?LwBx6JfuGvzpDTwlqyWsrPOuzyAxoOlGR+pq+/qbFfT5uVt6CyxfRPkuX6?=
 =?iso-8859-1?Q?HDPI1WT4zA9cqKHrBrk3LrQKSRuBWjH0ucr6xz1jpqBSUCKa2D6Qmpk42L?=
 =?iso-8859-1?Q?lw7LSE4wmyrvqRABhiHE4rHusQjh+Y5gU8cL3AXq0bs6XYPkPPC04DCeUY?=
 =?iso-8859-1?Q?m3FPBbLoyKYMO/txT/+y7BsRJpnWwaOtwY9hpWIf7pgpCjElZR+MTMFGdk?=
 =?iso-8859-1?Q?+0UbDeIqGiqEeW2qMu/LN7Xs6574zFWKGNK/Jx9z0aKzcb9d7xtwD5Gcn3?=
 =?iso-8859-1?Q?sKBlEBn8Scwgc+zYRv0+IvYCzcz15NmiwTz3ZAi5hZZjQNsHzUzle6KHe/?=
 =?iso-8859-1?Q?8I8pmzIYK/0THmpg4UB77Bcjc16hG1jbcyHc3FxbIftTl6b6GRyppmr9Jx?=
 =?iso-8859-1?Q?NAvwBWSOLhXD581V7JY14pDhZVE1Idqy78MEFkG7E1ob7wbC4FAmRY9Bo5?=
 =?iso-8859-1?Q?8ljCuKEx85w1Zpkn5PRw+SJMvp0yNpEmB5srJwodChLGOE7CSj0olD5Lxm?=
 =?iso-8859-1?Q?j2qku7zwlpQ8Ih0wqpqWoijMc7ZBsJaqOiOG0svnE+bE6dThEriu7BCBfF?=
 =?iso-8859-1?Q?pB7xsHnBSw9kKd0Xrf1wodmioEqQDVx0XUH5iTNWZzvvkReqI7zhDkyy2W?=
 =?iso-8859-1?Q?FcTNlWUFBsqYY6aRmrr/zISbwLZFc7oK0BlIHbjLhR4f+YHhWP3wBbZDqC?=
 =?iso-8859-1?Q?yW/MHBbwIHuJ8DvICOYGNADeQznMjtCG/3uX2xA+l/rGJq3ntIz7bDmfxf?=
 =?iso-8859-1?Q?yCb4qbanUdpix9C3qTM4feW26pSBASCdgaK/EFPKgm1MPpL0z06O25Znfk?=
 =?iso-8859-1?Q?J9eEsFdcWuDC4P1r9zZjlov62elDkgEcVLAnkGRyIXBOV0sKWWqTSAxMcd?=
 =?iso-8859-1?Q?CtIBCscpQUIZBviRjY3mEtUqQ7eDF1Dk+L90mVTRuCJzXR8Y2qWUI5q5NF?=
 =?iso-8859-1?Q?CkLlyhCAZfMjLkObJ0ayRm62OA700AyYGrLgX8A7ZUf86oYw1kq+AmI95l?=
 =?iso-8859-1?Q?JPwShJ9lW+cxHiMdTvdXPo+JyRO5JlLWOhEEtyWsa+ijZrI4T7Fj5HIV7A?=
 =?iso-8859-1?Q?ySZxV2uNUq77FOj+E0zY3QDWm1WzlggYis8qRkJFyDDSIRXji1IldDFZoe?=
 =?iso-8859-1?Q?C0IGn665nemapvm9YOv7sNpxbe8RJoHON4GEhxNKD3XtCKV2ga5sCRUmVq?=
 =?iso-8859-1?Q?vHq94NfsbbMeoi3N?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5635.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NVwLw9fsfMFvmKy8zmLumj/iiBnzREH50fgCk/HbJqNJnhdrlDjtYijr+f?=
 =?iso-8859-1?Q?TvOw8s3jE8ZC95FYRUdnWpSngtdQc6yVllAGGa/BvnglKBAj46M5zYx8Dn?=
 =?iso-8859-1?Q?Adl/aA4O1BVvkCNQz3A7za4U8a3CxkNFgftDbGHkEcFuVpabF8tM7Aevnm?=
 =?iso-8859-1?Q?dQYzWaTwgarS8BzWWoHWrfFc+qA8CzHIRbCzB2Ax+Kp4xeVHTXjhVNm6Y2?=
 =?iso-8859-1?Q?VERgVeoLRxGK5BkfhXBinnBowOD82Tzs3bAU48GeCOn7inWO+a6shph8ty?=
 =?iso-8859-1?Q?x9laDJNYbXcE+20zlyTfYuVRdX3Td7RKEcXXDcXAqH7wv1NfK7ahhZ7vCu?=
 =?iso-8859-1?Q?n2NjF8koQ+lScaXsEg6tUb2P6mPc6tjMQ1d7cZ7ef1NzS/U7d1yJEEbSlX?=
 =?iso-8859-1?Q?jBx3YIBXmPL5fZ9zWvxf3soj9iFp4wjrXhX6GUZkdqQawOM979aHAqJkwS?=
 =?iso-8859-1?Q?/bJsDUX9dKCcMZuKpCTGmWSCYFJJ8p1/EOGmOK40LFcTiKZTN0clzilA9o?=
 =?iso-8859-1?Q?ezi1HNWzoKIo7f59AoTIIJKXZRNQxJ6ZPu1tUzrD/8PYi3MLLkgN5xw/7d?=
 =?iso-8859-1?Q?XesKaB5rbJdJfynIEa/OqoZX7Nf1retcSoFOgdsMonwn5x/0Rl0SSLsc30?=
 =?iso-8859-1?Q?GGVQNieyyb0B/OlLvWNTUU9s8s694oysRxHiNLRN1jNDP/hoN7e9psOwEF?=
 =?iso-8859-1?Q?SHvHjzXYrNOex2oRJiCsUViQAO/A8ZHl+Nta9TS/zSpVn99tauyGEOFvXL?=
 =?iso-8859-1?Q?w1UTZGMMgzVSFaUaDAdJ6HdDGFKARynhBymJ7a7T4bgC3Sk1Rxo2v/mDNb?=
 =?iso-8859-1?Q?WbsXsbVISOj3ch6zVmLVR0/X4eRwOC298Ry7Zj+Kh5Ptpfs8O4EsxiEfWo?=
 =?iso-8859-1?Q?rxQILCVaf2eLJQGe//SwhG/tKeddvABh+7WBTb7KdSTiaVIYRb2eqeOIP9?=
 =?iso-8859-1?Q?VQwe3HiByj1HaxEl7UQhMDqXpOYJ0ygFKOZq7ypFpbRVJvpdbDjAdoJwMd?=
 =?iso-8859-1?Q?n4UN48HW3+mKRxhg97/1xhMLN3pLQxCUDODP5TFFg5eVjKnXEUkOy45MYm?=
 =?iso-8859-1?Q?CQBsRk76+mTRyp2PZ6hfR+/iY1jG/hWgP8KjbKj42RksGe0PJ8MXYNhmgl?=
 =?iso-8859-1?Q?HqzADQIjuAtpOAnpfGmrbPPlQrmKLAPM0si/YY20tdc051nL/YZwjaPtmc?=
 =?iso-8859-1?Q?9e3qfRgZ6/8jUwQoY8ts1WRhS9Dg79hlIRIL0TA/ErpzDaUzVVn598oNTp?=
 =?iso-8859-1?Q?F2o98ALXfUwXiW+SeRiB0SU6OT3QN4Otl9Nyrni3d8a+2ABWsnI1TlYWmO?=
 =?iso-8859-1?Q?UiPvsyXMAuabq7Rd9aoXDGlRzwErv85Z3Ecfsr5PLyTvpdvw6WW0zkSQB2?=
 =?iso-8859-1?Q?6nbaFlO5tQHoUa14dUgtlHqF186CvhuF61qTcwi9weloRY7PcrAaYGe3X4?=
 =?iso-8859-1?Q?hwWnYlTzkzXbm22U5fDA29oS6IZnHMWFIOgqjmYpReWnDKZBMniIviJ+QH?=
 =?iso-8859-1?Q?aX6DpTGtEf+7pGiC1qEoKIMhFR6hzuc521ib35tUj1OSWg/2l2I3vXMPnq?=
 =?iso-8859-1?Q?TgWC4HPwzuKZO9o0aXrB3xo9kqgUfAosm72q1vVR2c56Kgu7JTLb0KjSgB?=
 =?iso-8859-1?Q?109fYPfyhRybEESzkNtQXyMmnCr+/sCrsYOdlHSNRpksIWDuSyavbMS/l4?=
 =?iso-8859-1?Q?dVnnoo6a+JzGhgI41ws=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5635.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260813e8-a524-49ea-3bae-08dd34421516
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 02:20:58.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ij5e+186iUCL/MnPxn6vVtlUMWMY3G99NEyQ2gPKo75eQg3gwObMlgPSxG6RN15Jx8YvfxJL+v0+ENEzubrVOjLaPLQvHm7UILCYVKuY2F7mwMjph3o78xN/djZqy0XA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB56350BF93F80DEBB2D162F248C182CO6PR11MB5635namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209790

--_000_CO6PR11MB56350BF93F80DEBB2D162F248C182CO6PR11MB5635namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.2.rc=
1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
        1. MinnowBoard Turbot - 32bit
        2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
        3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
        4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
        5. Beaglebone


ETA for completion: Friday, 17 January 2025.

Best regards,
Munirah




________________________________
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> on behalf=
 of Steve Sakoman <steve@sakoman.com>
Sent: Tuesday, January 14, 2025 4:39 AM
To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>
Cc: qa-build-notification@lists.yoctoproject.org <qa-build-notification@lis=
ts.yoctoproject.org>
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.1=
.2.rc1)

A build flagged for QA (yocto-5.1.2.rc1) was completed on the
autobuilder and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-5.1.2.rc1


Build URL: https://valkyrie.yoctoproject.org/#/builders/29/builds/801

Build hash information:

bitbake: 1452e74cc4ddfaadc6537a049877a66cec253c8d
meta-agl: 4ba957670efcaca623b69f24a377cf7666af193c
meta-arm: 0ef5fd96829b68977e6eb0d3b5e092283ce89f6f
meta-aws: 758084f63000fde083af5c76d2bda438e804c709
meta-clang: c709a5196f1e8654425b43b478064395386c36d4
meta-intel: d2e28940027808ea56f9d38deadb200a99a89805
meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
meta-openembedded: 5d54a52fbeb69dba7b8ae11db98af4813951fa61
meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
oecore: 62dfe689246d648f9970a5476716e486b1a33765
poky: ff9ca74e170480578fcdb1f7bcd897f0e69e46a5



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org

--_000_CO6PR11MB56350BF93F80DEBB2D162F248C182CO6PR11MB5635namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi all,<br>
&nbsp;<br>
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.2.rc=
1. We are planning to execute following tests for this cycle:<br>
&nbsp;<br>
OEQA-manual tests for following module:<br>
1. OE-Core<br>
2. BSP-hw<br>
&nbsp;<br>
Runtime auto test for following platforms:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. MinnowBoard Turbot - 32bit<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Alder Lake-S (12th Generation=
 Intel(r) Core(tm) Processors)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. Raptor Lake-P (13th Generatio=
n Intel(r) Core(tm) Processors)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4. Meteor Lake-P (14th Generatio=
n Intel(r) Core(tm) Processors)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5. Beaglebone<br>
&nbsp;<br>
&nbsp;<br>
ETA for completion: Friday, 17 January 2025.<br>
&nbsp;<br>
Best regards,<br>
Munirah</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
&nbsp;<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> yocto@lists.yoctoproj=
ect.org &lt;yocto@lists.yoctoproject.org&gt; on behalf of Steve Sakoman &lt=
;steve@sakoman.com&gt;<br>
<b>Sent:</b> Tuesday, January 14, 2025 4:39 AM<br>
<b>To:</b> Yocto (yocto@lists.yoctoproject.org) &lt;yocto@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc:</b> qa-build-notification@lists.yoctoproject.org &lt;qa-build-notifi=
cation@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [yocto] QA notification for completed autobuilder build (yo=
cto-5.1.2.rc1)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">A build flagged for QA (yocto-5.1.2.rc1) was compl=
eted on the<br>
autobuilder and is available at:<br>
<br>
<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://valkyrie.yocto.io/pub/releases/yocto-=
5.1.2.rc1" data-auth=3D"NotApplicable">
https://valkyrie.yocto.io/pub/releases/yocto-5.1.2.rc1</a><br>
<br>
<br>
Build URL: <a href=3D"https://valkyrie.yoctoproject.org/#/builders/29/build=
s/801" data-auth=3D"NotApplicable">
https://valkyrie.yoctoproject.org/#/builders/29/builds/801</a><br>
<br>
Build hash information:<br>
<br>
bitbake: 1452e74cc4ddfaadc6537a049877a66cec253c8d<br>
meta-agl: 4ba957670efcaca623b69f24a377cf7666af193c<br>
meta-arm: 0ef5fd96829b68977e6eb0d3b5e092283ce89f6f<br>
meta-aws: 758084f63000fde083af5c76d2bda438e804c709<br>
meta-clang: c709a5196f1e8654425b43b478064395386c36d4<br>
meta-intel: d2e28940027808ea56f9d38deadb200a99a89805<br>
meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9<br>
meta-openembedded: 5d54a52fbeb69dba7b8ae11db98af4813951fa61<br>
meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374<br>
oecore: 62dfe689246d648f9970a5476716e486b1a33765<br>
poky: ff9ca74e170480578fcdb1f7bcd897f0e69e46a5<br>
<br>
<br>
<br>
This is an automated message from the Yocto Project Autobuilder<br>
Git: git://git.yoctoproject.org/yocto-autobuilder2<br>
Email: richard.purdie@linuxfoundation.org<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB56350BF93F80DEBB2D162F248C182CO6PR11MB5635namp_--

