Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA06C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 08:43:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.7723.1675154606993005058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 00:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Lt5+LSnb;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675154607; x=1706690607;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9ZLyQILwYwLwgd1275LJrZDyUjSRYNR6sc8Ls3+PqDk=;
  b=Lt5+LSnbflod7cSlXPZGxLloPntFttdriuCwtvtw0zv5ORqXfqtzUmpA
   +xTU4sROC1OOuD1OeHXIp+Iip+D/FLy2bwyQL2diNjlqd4XhzNxumii/x
   4jJ6dhxU7gyNLu3ZmzNVSF64R/RJoZ31qXcoLWWd1VFsrj5YQm1ysf6Uw
   mP6LGf4+/yahju4f1b0M3eyGT2IRAiVZRK8X0lPOp5VIdDg56wokDSxDT
   SmPz6cSo9k+O7Aj64S7ywx/RYb8Nmdb2638rFyXKdcfY1h6JBHNehYxjz
   4ZfMKw8SseTtjgSovzvt6EPrGyFm+zSEKakbuy4+oHp3usFuJ03Wn/Hrn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329894856"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="329894856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="666411609"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="666411609"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 00:43:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 00:43:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 00:43:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 00:43:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 00:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qquu3S4XFmWcTclstL6+6HALgTW1l8rwtH7ASPVKqmVusUef8PW3r5GX/AvHJWqBz2Qa7X9xP0eBscKknMWffYqvPzipeyadu2YUQHqxibTy52SY+IIGDBnwCCWruKpAif38JGpWnwrxevZ6IVWYY5sMY/bX7NxDBQm3A2XGHWmdnAuEnJmCQ6wdKmclzQxq01Guin+LgjEoPWJYb+ethiUTgPHy0kWLlzcTayfD6pPnQxQA5+gcstVLb28dKD71Jo+xMa9N0pY0Ii1I9fNX8UzK5HBCbluRM5Wd++QeYYYQIt7UoxFrgSYvgBoZWbwKcVEGNNhL2SBFKQwwc3ED1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3GwRZfkpoeE09koXgymkprE006qx2jmzSoS6L8HZQE=;
 b=YgRUVXqRNwkcgd27oCf8CSWQ9N1+RN/BagEg4yDY6rilv2yDPvpaZ2eW2Y1N122/WPTS+wv995/kZnPEn6pfaSK0La80XjXawdNC3YdmdPmmQQfpAe98sSYxK0iUFvjHMvhMc2ythoADX2Nhj0hFPBkOqa4N9rxtUz35yBC1l4Vks/pX/v9lqC9Q9BGmTVxU309zGodZVv0P67Y4yxfedT80R00XPjqNd9bryqbbEVWHPKgBp7bkqyPvVi9w2i9A3RueDf5jseexRH3mrsXR6OLJXE2OLuyOJC4x0D+ymfG8TMq7IEodvPTm0jE0Qq2IFpIrtYx/WG9hThV+qnHvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 08:43:23 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%5]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 08:43:22 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2_M2.rc2)
Thread-Index: AQHZMg4OSdKFhjV8A0WSPKyx5g08za64O1qA
Date: Tue, 31 Jan 2023 08:43:22 +0000
Message-ID: <BY5PR11MB415295BE3F428434E3580069A1D09@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185f1a4b508-6e5da1df-b525-4798-ad94-58ea11a96b76-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185f1a4b508-6e5da1df-b525-4798-ad94-58ea11a96b76-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB5550:EE_
x-ms-office365-filtering-correlation-id: 66e493d9-3fad-49a9-8a9c-08db03673634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqRZhLnZgMSygp98tu2hWn7FJrEXY+kfYGjUs/l1bOTSMsu1CsxAxskKst3OIDksdmyWF+FS7r1BU/93C8Eei2GTLB6jwysnaDUaCuAIzNR6hbp4Z22HCszVaKOhKTZXsS3jp+21WB6IWAUTo6tPYdrMAf5dImk2p/C2SkIzyPsTRKxnBggjO5T4Cg7fLUehrXdyry0XFATVpL1xknqTmOAZg7d1iz2D7bvim337rkHc9rdzNX7xV+mC+NNf+c7mW/gBRzft+pIV4b5vToYAzNQA8BxLYBLwhxXRymlj7tdKMZqIQqb1Iti7ehWRe+vZFXASMWqp38Uzxe3ybfOsbOgTQENLUAzqpNMS/E2/ZAfpfP82pwz0azMLd/LClvipnSynkWHS/xpBWKPIxLHjNGgSG596d0JF5z4KSD/tBshThYYC+EcLM2jtp2occTwHywwz8APtGMRuisIKKnm16Ir2ac40V5ECQiBPdwJVsZK09YjLTogJANZ4TrEYo5jGYtK2OgHL9JibewwOWhyqWm48dXqmioALzK98aXYYaUhTjJhpmKpR4BWvqAcGOzdQxlIH0PTrD4w5KBrIk2aCfngWmymsvo9inEe3uaMAyzdbaqBO/pZQm3jBNRjUWeiHIFzTI9tdwDuzkfYnllHZ3eCXZEZcftECzSOKx1JPwXQc1oN3mXJ6P3KDj5hwUVKUB0Txnz5SGT+NhO6aV2mwjUrE3q4CzuWmtt1xYpHOp62NTP6HuEV5xKmXX1W9b1rBBiIqoppUfNjsQyM7NaDapQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(7696005)(38100700002)(122000001)(82960400001)(52536014)(86362001)(8936002)(5660300002)(110136005)(316002)(38070700005)(55016003)(33656002)(41300700001)(71200400001)(15650500001)(2906002)(83380400001)(6506007)(9686003)(8676002)(66899018)(64756008)(26005)(186003)(478600001)(66556008)(66446008)(66476007)(53546011)(966005)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wUQ0tL2XgG3brJ0AIB0AE3FzNh4dEMqBvJCvbBJSFJ+m+nz/GJJOQal4mYoN?=
 =?us-ascii?Q?PKixSsR5GR/zpTTCxM5mOIBdTO0oobX5u9nXjF/jjyGiSefrzM4yRywKcIme?=
 =?us-ascii?Q?zgmZgES/AY+HbWeombPXZxsdQoTv5KAuL6KvmL3FTuA2VEk5U3TFFcQGNMeY?=
 =?us-ascii?Q?qJTiBFyk5BCa9ztsu1z1jdcWjUB3vFTxURMN3tGp/IQByn0bmti1dON70ZpO?=
 =?us-ascii?Q?QiyP3wSJSiCOdUT4WtXnMv7Up/ngZZ2mFmzFMkesKW8vIu8nQqp++hgTZs8K?=
 =?us-ascii?Q?a4YyyBkkPbN7X3aqVaRQrPhrC2jlAAy6u0KTP+4LfVpj+Z5GDwo/9qOqTdi+?=
 =?us-ascii?Q?WIVbGC2qbVVS3FbsY0QgZbyt56wwJYe5NUvXW2pRtW2xNwHqJY4KbnY5eDIU?=
 =?us-ascii?Q?Yegq0hIIdEkPKSoETF5RYsXxz3IObn2Bgux7CYosM/TjgPjgcZgKDC6750Rd?=
 =?us-ascii?Q?fJYIh3T8h348NnqX7vuR/98tfLrGPb3I/VsTWKqrTtrWcZLi3Hrb6rdnShSR?=
 =?us-ascii?Q?6N1PIv/llDjqBqjp+lj1tWQUx/cXBlhBFfVm+5INNNxY+rkV22rGsbwlXuUi?=
 =?us-ascii?Q?cN/RN+p60CpZgDTX6r2G+j8uSZOy+HOAts3cOKadGnvXAEzfgLdo2cNN1PjI?=
 =?us-ascii?Q?QI2/7IjkFGz9vmGuBWWcLYhQlcjyR3PfJJsqU3ZIHVsavqkYOB9A9jYcbNIk?=
 =?us-ascii?Q?IpB03MfC8IIxtPnCtSkeW2tt2zKkHC+I5RqPlfmFhwf+2AzFBlR03cIkrROL?=
 =?us-ascii?Q?e6t0chwkhXVjwZudP3TLoe6dICnhmkObQXyGrhcEJ+CI2fxZfGBnlh3dTrr6?=
 =?us-ascii?Q?WUFK5xZtAjll0VV6Gx9g+VOfcuAbkIPPchNxdbUO7CAzR821fEEypmYZfB4Z?=
 =?us-ascii?Q?hylRSJmnoGYPm4MTDk/j8SDykSJWLxwch8IZ1xqa1eTaxd1zLN6dE7kXE7Xi?=
 =?us-ascii?Q?CLUzNO7qfv9mvV8Hg0nrywVqAPgLHWOTf3GlFZFYMzWnylHlOd+oy35F+NR2?=
 =?us-ascii?Q?OJWr/elJ95G7iOTuEJ3LOfgxJ92gEw6PUueK8pFDKdr4QYtyDug02DG9i6xt?=
 =?us-ascii?Q?8F4U6IvI1U/j7g/FGyiX8nJ3ifqd8GZ/CsxfWEFxVckhLsWii2XWpQhPvVS5?=
 =?us-ascii?Q?RX2z22WDuf+QYY+E0sLsk7Ejs600pc94/ylyhrENdKl7bdnfXrgKMIXXgdrs?=
 =?us-ascii?Q?f7YiqOXamk2QoCSqJsg2qXeug0+zO39BenaRHqpPHZ/NssdHJ7C3QC0hxH7Y?=
 =?us-ascii?Q?9nSSGYat66Yh6OiVs18g4zdBGnjCC84YFx7YJ41onGe1ZpEced8qC2V7Jd8y?=
 =?us-ascii?Q?YiFlU2WfExSTMEk0gRncCoRKjJ3fe9cAHaUMNMNxI3vwtnexI3DBZbDzLMtf?=
 =?us-ascii?Q?WKqXSjQeOMRYPi7RizAUjW+tOTyu08AXMu4Tp8B/f2m8Tj2+VK4w5QSEcbal?=
 =?us-ascii?Q?c5cC3H8fB7QJpQIfssSY6G2+und5ETAeTRl3xLu9wg95KkE8SV5e952ESh/r?=
 =?us-ascii?Q?tZwgiTwB+igrpI2D7+ogcpSy+MhNj3JUW6AyiTk+VZh5ulNBzggAWBvk27Ds?=
 =?us-ascii?Q?Ccc2HFdS/IeT3KnzvDdnhyIeFDFRJ1sWezd95jCQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e493d9-3fad-49a9-8a9c-08db03673634
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 08:43:22.8360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSeSOdJo+OVZ/eplpChZEMahPR4EvViXuAeoGVtY67GbZh+aOEr2OZBXl+0Z4LGRjVj6yaxA2A6cjA5xshz8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5550
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 08:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176512

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2_M2.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion Wednesday, 1st Feb.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, 27 January, 2023 1:13 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2_M2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.2_M2.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2_M2.rc2
>=20
>=20
>     Build hash information:
>=20
>     bitbake: c19035e8e71c419c5688a86bfc9c946c96f638e8
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: d8383c11f3f8220d2b989ec73604e5faff988299
> meta-aws: 7b4f54b3e1f675e2033f6a589ac519e44e62b58b
> meta-intel: b3c7d3ee44e4ab71df44b5be3c48d2f47d89d8a0
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: ceceffcb1e3ef4f9ba7708f77c27e30a7aea61e5
> meta-virtualization: 31954471605ae3b41627a0ab7b0dcfe8c5851bd7
> oecore: 493f2d163718d78560a2b3ad5d3c0fb34caae8c0
> poky: 5e249ec855517765f4b99e8039cb888ffa09c211
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
> View/Reply Online (#214): https://lists.yoctoproject.org/g/qa-build-
> notification/message/214
> Mute This Topic: https://lists.yoctoproject.org/mt/96560410/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


