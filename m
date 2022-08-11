Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08349C25B0C
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 03:51:17 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.2629.1660189869401655965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 20:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=O4HLWUTt;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660189869; x=1691725869;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NrM/M8iLtYP2bdUslekTkVi8jAKFToqPGLCDvxnyosY=;
  b=O4HLWUTtHDajom7TyXlk46dpurSEGW4O/BgKqydhye1HoiB5l2KdusOr
   URAUz9cjl1TSXRaSmVy1gKijkYZ+K9YHDwsfgUcaOGEBxb7bBZX7a8wQM
   7FkuWY+h1aGMXZSxPeX42w73z1uBlgmfCGWaBDxyozIPQ86lrTApqg9yq
   uYF9OB9GxsVWlwVE6Z6mTvjlNAoVQmlQC+C6A2aj7cpQecXBAk9mTuJ3A
   v/q8UgjgugI65jIuxVWSp8gF/v7d+DbYLnij+8vJlE9WWwK5I6KwIGYoF
   WFhbc/3POHJqouPVVaoFgdsx8LFqccxTS8BF5DB/Z7EDL+Lt3ytXGyFUU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="377541625"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200";
   d="scan'208";a="377541625"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 20:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200";
   d="scan'208";a="781457305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 10 Aug 2022 20:51:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 20:51:08 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 20:51:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 20:51:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 10 Aug 2022 20:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN6FDnglNtroDbnCr8kZTQUc2GtJB+WpTJ3hpSgtGhyag40rEDvmrA2Sz4xcsM++k2hmiJDhrMruYWpvNj58007JaI92qXgL8GTmFvH5+MIIorCUZPciSofANaRsZ4ccNSb2LC6QxNWwY0qeNIExwgBnuVulfoNHaisO9OLuZJxk60FBcXmFlufkEc5zBdN40+zsp4YkkoHCLsU6NLOtbXQ7poIaYrj+ANXSRzxGqHIBxopKpITQSIawlU2EPi8nTxktD8j07V/UnQEGKiawx+MsTb7mZ/UX5LCm5tETow7NPAV8B1XAYkdM+vDdt8MR93p1Fq+pov7kFHfkr/WOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk47G9tzjn9UkFSWxR6gYs59jdBGcQn9IPGk+muLbeE=;
 b=k6j/U8BmNFnKAPRDE7DVTDbniDGAExoL5QZOeGvI2N6X3RRXkenH085DpgvbU5eoBm/w2gSvrl06CftLsovB//rw+c2hVwPvlu5LGs3ZrvTP2WpazURd8urqiSAZgx/dXnCkjKM2o4iTKan1GRAl6MthheL73bGzdpe5wU6+V08pLXX72Mpe456uh9+qaLnDti8F1+M657Wkc7ypGFyPNmoOTLGFcoY8aZI4yYCkRi871mQXGVrMFRTTgTeh8l9jK8/EuNzCjn3VQkd9pDAB1VPJT6EqLS8wcBVuNGCqQleQr0GXcI/VCC0EKBWck/rquBTfbchiFgG7IiMuvG2k3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM5PR11MB1513.namprd11.prod.outlook.com (2603:10b6:4:9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.22; Thu, 11 Aug 2022 03:51:06 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5504.023; Thu, 11 Aug 2022
 03:51:06 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.3.rc1)
Thread-Index: AQHYrO0DKJqanzOEKEeerb3Yk+1fnq2pERNw
Date: Thu, 11 Aug 2022 03:51:06 +0000
Message-ID: 
 <DM5PR1101MB2348BC25B4C48DD74A28E2DEBB649@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010182892b36b2-4fcb2ae7-b8ca-4547-9fa3-8136464d7fad-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010182892b36b2-4fcb2ae7-b8ca-4547-9fa3-8136464d7fad-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ac9bdbf-8e69-4185-2213-08da7b4cb84a
x-ms-traffictypediagnostic: DM5PR11MB1513:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ku644Xvl6O18gKNlfowV3GPCtbZ/RQ5dG6CkjLwQYXjjv9l2rMlgUXtF7A94VdEHl1pfP/h3LNWvlG6hVABQ0wBG7DxgfxC7XBgCDP8jI3E9UYErdbbLTmkx5rku2Bsq244X779gEjdQkIQlrNzoDbbu60ZYEhkuneNIG0A49Q8dro94LE4EN58q1DQX5F5Ipb9MIOX6W+96yUTqFddntG1kn46wMVYRhlUBK5b3dRAEvZvYAkdVgczbRF96OjBHUmC88ke326rn9HM+/RD+h7sz72Nauyqkx22YFGDy2oGpnKpYFgB8X307y9ByiqkIC1Z2PjfzprUQTCyfsHV0m5cxv8BAAhG2kik5HlCEKbr/FXnTsRWfuRJf2Vd1o8jP6VtQxWcDQMFSEAtOFrCd9eK9CTn8a/nZaEy6FjPv3BMCX0886Odxw0JL+znzp+LCeuO03OTJ7jws1NjOqNHYyCVct9fAh6AyYSkEWl+h1vb16OWYfOZl7X9q9/RLQeeMavT9tk18dXAoGyQujlZPdcysSrkFPGfJTe0zEOmplqjUiAXKnvQMm08bTsIgnN65YaEfHQBM7AWQSHwxKZCVTDUYhdEFiU+5L0PrgrCev5ecyiJ4z0mtVfxhck6i3oC8FM3mFFaurS3JuEx2dPIB8J5EWrheE9MgIxNcR2teEXCUE+LZi7ysoGuugWcY0YdvX47kZ5kzpxDbZtWzxD/KSdXqqWILpoFOKkDoqeLpEYqwGoryAHuEzlzBK7z1iKym+XNUFn3Nlk/koa6AqQUT945gxkvevMQ6zoJdr8FyWJn+z27Kz6ie8wk5jmhGYkGPMHoW/D9B8dhmkiyljUgsHw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(39860400002)(376002)(366004)(186003)(38070700005)(86362001)(26005)(9686003)(82960400001)(53546011)(38100700002)(7696005)(6506007)(2906002)(83380400001)(55236004)(122000001)(15650500001)(316002)(33656002)(5660300002)(478600001)(8676002)(66946007)(66446008)(66476007)(66556008)(71200400001)(76116006)(64756008)(110136005)(52536014)(8936002)(966005)(55016003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mz112GJSnRdiye/rl1OwSaCuDW4kFHBvRm6eqZOawGazihcXhP9WyhqPYMHU?=
 =?us-ascii?Q?A/HtuVmwzSI1Lrr/z/r2YLPBVRVBK98PHPJDmJvRqrUVN2PBvUJZqD/7SOT+?=
 =?us-ascii?Q?gUKkwKM4G35+OuRS0u6LvQ4WjKMxbjyqO9f+gckf9Kf35NPJ+T66msHDmUIf?=
 =?us-ascii?Q?dIRAJETexK4LtfugDRletWfHcUw5WXx1krBX3WUZ0MqOeIdi2DzHQLsd9g81?=
 =?us-ascii?Q?9dwRFGnu+tau9cxUDwnBCJq7pTmjYr4CveHltCHrwmEIdKZeFZKBHE5Criiq?=
 =?us-ascii?Q?P7rE5cBlZUxPuUT+sbC3sfdjutp0YuUbNJuTlnO6ubJr9oxwBwoZ9nzDShQs?=
 =?us-ascii?Q?EA9o8CBgroIa5zFQlYWvkm7C1y336jaOZaPnEuuL/M2YcBHuwkh3hPjXdSug?=
 =?us-ascii?Q?SDdIhmvOknGnP54Sg5kTqD443GprO0bNwE04PLihq+dmtZJ9zDEwE465j0E9?=
 =?us-ascii?Q?WtLKSW+p1ImJpg4Jjd3CDMFjYtr3OMCgoIlOB6r6JqltmFvQZIFhzAgr7mTt?=
 =?us-ascii?Q?2mn3ieEnIJl9wrhLOjICGUn/+dGUD6xtH9fartNWXKQJLM830aoE5inrkWb4?=
 =?us-ascii?Q?dnANHAfIgLRCcBmpe9jwGQSimnRLarRrSTGT5jHDItBqPnzTpXRfidzhPR74?=
 =?us-ascii?Q?YC+8HZjSdtengfc9eaJ7J30l0ZSUWoRg5vtU64Rk2PMpT1b5Y+SR7AyVyD/f?=
 =?us-ascii?Q?bOI4pr+LCSvXIXKUaR/vQ01ALgahgbJ1UaebqPvL+oZ+d4q6yU392T8tyhZV?=
 =?us-ascii?Q?92XuTyo7VEFk+Sh0e7hKB/Mp0cdxG+sSfhTQMS+bOcCdM+yM7HMmDTuUTJUD?=
 =?us-ascii?Q?VvmetDJc4HGYeEaFtshl7VtPYKK6SW2dpV81wzNB0SEpNqY2MUx9bb2WC8/7?=
 =?us-ascii?Q?TrsN/O/P7NIweLW3bffoZ4Wtck61YwnuYiaqb23rh8rufh9Fq6tghrgVguJ7?=
 =?us-ascii?Q?7GQd4iZTL7l9Q0YWKAAXftW43cGh4wrli44KfXYxx4WnR+XYUIejraaWKTHl?=
 =?us-ascii?Q?eL9hCh49xVyh2Eyy1uQ1FsHrZF2Ykcn81VmwcfZlug0jrmTucJty3S5IMQWZ?=
 =?us-ascii?Q?RN49hVQmgR6OBGj6pS6cDjwk0zbBsEEA8kVL4qvtegL5O+fj5nosW14flR/d?=
 =?us-ascii?Q?gr+1A7J4uKWwD36/vNRTJ3DglWrdycsOHaXsRE7oxEGWGNNk/9kTKJf9wfFo?=
 =?us-ascii?Q?J2fJs7LoJumMqBputzfym5auepvdJixrTSfst+MrlckrEGfRm0KV976jGkIE?=
 =?us-ascii?Q?GwfUxU4FTAwKON6HmlCyLa7AZrHqxCrfbLK8v/q7a+633c9fwdCg4B26D3YY?=
 =?us-ascii?Q?3VSsWxtDhj/ScCbTPHnMlXCdxGgg3320JSXFD0gDyWxkNkPMDeU7W62xiAss?=
 =?us-ascii?Q?5Fmd66wodtxIkUxXb33wBFolinz/pEcTY7cW3zFsPjxC8mOTIQjcIiaR1M9k?=
 =?us-ascii?Q?tz3r/qo6yVFkRszxVPlpSpUUhh5M/dIph8naXQQram3QZLCDmJVyxgGH/IPR?=
 =?us-ascii?Q?oRumJTieBFk3wix5EsXApSeBW5/hO2XGHZNpFC6vc/jnLxjyuZdB4C+gQS6q?=
 =?us-ascii?Q?urrwn8nZM77DxMA0ZGtoNok8NxujvFXpDz2lI4/d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ac9bdbf-8e69-4185-2213-08da7b4cb84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 03:51:06.5631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 gl8y8DhK946i84qanldflIZlAK7X9Esj3q5FEXhbZP6FsbGGm/v6DvsBE2cZm7iB/SlMq1mUPY47rVGliepygA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1513
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 03:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169226

Hello all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.3.rc=
1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Tuesday, August 16.

Thanks,
Jay
> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, 11 August, 2022 3:11 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.3.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b8fd6f5d9959d27176ea016c249cf6d35ac8ba03
> meta-agl: 3ff972228b08c37adf41b760c2bbc5313b90715f
> meta-arm: cf9365fcec2e741c56ad88db7f3838f636e29cae
> meta-aws: 4ffc63cf28ff925bb67477cbaf7e390e968b1f8e
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: ef3aa3064b9bbfa19f600eafb1e7d3473f62af74
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 8f2dc1023482863e2630d1b94052c41ce748b38f
> meta-virtualization: 26a361a39ff5ab6fae22efbdc582f84d13330ba2
> oecore: 2cafa6ed5f0aa9df5a120b6353755d56c7c7800d
> poky: 387ab5f18b17c3af3e9e30dc58584641a70f359f
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
> View/Reply Online (#170): https://lists.yoctoproject.org/g/qa-build-
> notification/message/170
> Mute This Topic: https://lists.yoctoproject.org/mt/92943671/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


