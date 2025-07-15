Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6667AC83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web11.10802.1752591865701270269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n0eB6sYR;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752591866; x=1784127866;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XHbsEXnIwmRtOooU8vQKaqZm7KNDDHraSynDosPvW3g=;
  b=n0eB6sYRtpTPJChO+mWWvOUZkhAOhfvj+xSIgy7xT9OnFLmCNY5Gd/tV
   yqcuJTFVgAet2x/z+mv8TaPLXoy26cvrTzn0m7VaVJUbfO16jorHOWiVX
   8UNDbV6/roHN4b3xPEFGKegcB//o5QMtaQ+2vA4gzk8td6xTLtjhJ5YVU
   QL/9rwvMxjTZXcXKsgqHrxlLAoEhlSAs71cbpZew91a5HPWrgVpjiN+Q/
   xf4mrOJF6K9vHB92LuQfbgYuC5zwK8YQ6b95C0tZ3y/A910f1oend5STM
   nY7RTTMZUiZkF9DSkMsXjrUuJqrSZhBhyO7yMae8dwpBIUbJunsd6MLYy
   Q==;
X-CSE-ConnectionGUID: vjNpYBgLTgSmJhi0L84ACQ==
X-CSE-MsgGUID: im3gfZIPRfuokbu6Ke5+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54906551"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54906551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:04:25 -0700
X-CSE-ConnectionGUID: bsgD2Jc1T9CTJhS6zvfFMw==
X-CSE-MsgGUID: /0f5+0vBSrORTy85SLJCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157353535"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:04:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:04:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:04:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQ6tuWRItvcXC8t3y9ZWjUIbg/jseixcysDBFiOY/xc4qFNCsa3hLSUzxxS+nBIEPyE/j9CfKH9I+2w5W89884UVc3FJeS6ECq4j3VeXm22/R1rUCsHOd8+CssEboAie7+99pQYStn7el+3/wxFgX6C+XWDbQV7nwpvMmy/fJBnHaNUlMHQGV3zrpit3LgfebhDnu6E3Y2dJ4wyRx/i5+J0drGbQrtYqKjec9wtCOsS2poW8xoPrH9eC6JbYAJX5rUc8GWrg61dbvp85FtmKWVf6z8rkaTlSR7LZar9zPMVP6oSzYiQi+sEo7w3TYqYJIjTAQ5D1OhvLegg7FsUEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys3BlqgRMVHXUq3X6/ueTFTs7eB8D7XhSctSIdA/YqU=;
 b=e9fMCfiW0kDA8inxhfUCeTj9NcG+fCJEaZq3ANYcNh7W9CuJh4tsPyMcM5XKV0qQrFWb6k4gQXjM1fwg1nRXVLgkEc54eIlAQ6LHEwcWwtJEhzCDBkpuzJoDxDayxHOHUB7oMzhlaAXmcOr9zZNpcIHKS+2xzjb3eQA0zCS3nm+v32GNIJigK8fYtf1nvX88j2YdrTDfT5OOKx0QPN1oI0pRlg2zdMErro78JRIDtmts6UT+hA25ghOqHhFP4MG7Hd8Wub7uSqhI/SKiPT81kqALhk7p5yjIuvbM8v/ztvjF8DLh2z1SqyprDsK1fY/rC7ngCg5SPgt4Gr33C5bXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 15 Jul
 2025 15:04:05 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:04:04 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.11.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.11.rc1)
Thread-Index: AQHb8qMDBgu5lsgvhkid62so/8uazLQzR/0A
Date: Tue, 15 Jul 2025 15:04:04 +0000
Message-ID: <DM4PR11MB7760FD92E3F9ED80D88A1FA4A157A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197fb30e9d5-ef39166e-58fd-4885-a2c0-93efc95705c6-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197fb30e9d5-ef39166e-58fd-4885-a2c0-93efc95705c6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH8PR11MB6562:EE_
x-ms-office365-filtering-correlation-id: e51f9f75-db49-409d-3229-08ddc3b0d722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?CQuiG9tYabgb7XJ3rTqJsGmWYr7KvC8xhtg5Q1G8SzyrCdRQLcArJWqpVKpC?=
 =?us-ascii?Q?bgxjJZ0I3VP+SacB2xZ+gSrypsts7n47t6LIyW2+WUWcVKaWmUu3mcuo08Wf?=
 =?us-ascii?Q?DrAH+KTxSlLJ88Y1LQ7QQNdkGSg+V7SmKKBNVAXBwgmahwM3c7YJR6NDZxzp?=
 =?us-ascii?Q?sNXQi5H/0fe5wi2i86C/XjnGcahXATAjmW/gK8aGt4AwKEJyL9O8Q+VF9TEq?=
 =?us-ascii?Q?+bO8ZNv1Y6uPCVwhjAIOxm1OuRchnUrAQgNxsRsGjNoWBzyvxtVOQmH2jIQ4?=
 =?us-ascii?Q?h2sesYtB1W7qzwv9F7BEx4o3DGj2vAA+JUKhXB3cCR6LKaCtWuahijHVC7ME?=
 =?us-ascii?Q?ZSonbHUTqZL0qH9gUd9V6ifRbpM4HjMhwmgVcwAMkMyH4o9KgXTMVOkLfSse?=
 =?us-ascii?Q?zfVMhC7KrFWg01xf3qG3Pzoymi7ilaP/o0gtSogbOYsP52SgUA5mOPEPIekE?=
 =?us-ascii?Q?g2ycsYnqj4hK/f5Nq1A7hPGNZSfTGass0E3iMLM9ZHBTCnUSS8vMYR2kCz0b?=
 =?us-ascii?Q?P1kxnaB2lvxOxLJ40MNTKwQIj8vsYF+1YSSYyZvkTvBDeV+ncezGkJMv4evX?=
 =?us-ascii?Q?lGtQibXhu+YqlyXTPUqZaKxaAUHFZ6er+krXEtr02EAiJ0LQf9gnWT0WrSru?=
 =?us-ascii?Q?YDG/12DLP+84nGE0RpHqH+cLq77VgJVFQ29agZGrJvrvrHcydK+h+tqZovmQ?=
 =?us-ascii?Q?DHhjRz90IjU9I0eTr+Dhz+pOMmQmJchgH7D0W5y9QmGwOQLGrZ/x4kWFv8oU?=
 =?us-ascii?Q?pbK/zzxrqiFKr/eD994Z5EZqD4faNNNMdWu5grCkbwGTwTkgwYe1vF66en/M?=
 =?us-ascii?Q?jUEN+sqJX86Eshn3lyDO++Wc4NwL5SylhF74Psk+kQrOaUlHIDXr+SoC3kbJ?=
 =?us-ascii?Q?2yXu1GjR8HFnhaPZ8hhdychPx9QMjJ2YMFtnSGoLJY29R3vTyStH+rGVVknz?=
 =?us-ascii?Q?qPA2TMmFspY/0aDsCXVi+AdkejzRWxR0D5lKQ0zHih/TJ3kYZHAaWUvNzJSf?=
 =?us-ascii?Q?EuJPQ3VaGQl2wJ9bDCwJUKvRI4gpuw5cH+f4Jkgx6/05Bu0x85z+gdFppR3Q?=
 =?us-ascii?Q?6aJRh7eeL2rjjbQNBnIEmPyBfRveA3dWdOy3GtdvyCQk7uxwdnO+SDcPUZ3A?=
 =?us-ascii?Q?I35bdbY7un00iOeE4EqXPZNLqM6FoLTl7uPXNWch+nApdbUaLp2hiUMViq6u?=
 =?us-ascii?Q?mziHTVWXOzlcFx9+9gOQMI07S9H+xGujvbwOothy+y9BL8xXvNJTI5ZRhJYf?=
 =?us-ascii?Q?3tpSnXQvf+iO5w5xDUjtvfrJI77qjRDwxiMm1dR0sNbrBPri/3qWui5gdp+/?=
 =?us-ascii?Q?dNRJBg0ICWjyyxbZxR2CHV2b2G8QiPmAkO+LHZ5ebxqTJT6WB7rfv6qo031t?=
 =?us-ascii?Q?QmaSqIubzEIODpzxGn/ij+EEKqRGMqnUD44X9wzGDQzL+jOM3awMCztCBDSa?=
 =?us-ascii?Q?dHaE6ZRHkao=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CWXKXeWwhIIILEeJ+b4mByQ3K8FqFESMeUekoepRPn1XOamCW1zwAkechRtX?=
 =?us-ascii?Q?sfkut6M50nPe/K1BgPBNOE+x+2O4MuVqsFOxHBg6PTExPXIhrkcMGXzsw3YB?=
 =?us-ascii?Q?cAQdnFUdjvUwbhy5p+TJYQkV2gzEJJ9a75QhHR8u2Uxo2UjPJWiL/BaZKBvQ?=
 =?us-ascii?Q?N/OcQK8cg+f34lyj2jc4bD2brzM+AWTjNgQT/GLnkmiCgCDMfCYv5OSGInxa?=
 =?us-ascii?Q?bKRgMGMxXziH0HGgA/zQjl48Afp90kAS+QPD14xDHxQsxYC1u3ChgZQQIjdl?=
 =?us-ascii?Q?1/K0n9Ij2RBTZTEqZQzz+gL0sUD0zv5fC1TUMb3HPoHI7hl+VnEt9MSBI9BC?=
 =?us-ascii?Q?rlEogHDUUa27TyPvxVpxVLt5YQWWg6MRaMSLgDxvnXq0I2YcM0LVLVLQ0dmC?=
 =?us-ascii?Q?mBto/B+T83OTnPoyTxhgKzO15b5HjVC7G/RsSQD6DCsIjwAgmAqlq1SJ0Uif?=
 =?us-ascii?Q?8zLsOH3UZuBJv/l5IKaSCTVVs3UAmGIaKUgIK7R9/DPwLnSNfblWR2qGfrJ9?=
 =?us-ascii?Q?okA5+kJLfWDV/8E8cBNNcjcfKmxf9p+xeZ2cKvIJs44B5uSpKm9CxpyYVrRx?=
 =?us-ascii?Q?fYR7NWJVXKHn+drBgUxOX9tly2vDww7JAK8z/e6mw7vUXaiD3Y8O8hFtX7kJ?=
 =?us-ascii?Q?+kN5otxU2b2yjG2MeIPUOrnNMrWXOeE9bYETfTtzsJy/UT0A+mmUBu+7dqCz?=
 =?us-ascii?Q?XM44Xhcx9V/eB+AcBEalxygpVoWfb55g4mX4wtSRhVWQX/tX8pWLwd99vwpy?=
 =?us-ascii?Q?OoDihrT5NNnA/03940khv/YMokCH7vmakbDFifS0aO6/40KEi5DhKPe9xBJ9?=
 =?us-ascii?Q?7kGgGAEVsofcGt3SP90/WTxxG+UTMWs/3vFEV+kQFmOFP6GnVf2CCtsQOFOl?=
 =?us-ascii?Q?BBqBOTR/uP735uP1xgoCnW9+oERrrXrmUSobdXwqBgWb0kgR8aq5f3Cm29ae?=
 =?us-ascii?Q?NPb6j+j8tU0WD2tULELF9rkdsofpIBZZk8i79IghEKv1XT9i6h0kICpRUYMS?=
 =?us-ascii?Q?za4lGgzkVybWe56yaFE/0cYZHwQ0h6Wmw92bHlpSyYtb9IoIYq4BlVaoxTbr?=
 =?us-ascii?Q?hCL5+aN1CFrnA4zXUbCCF+ibRJRIKjOpcwNeFll7BwHlUs5GnfKJfrKlI1Gt?=
 =?us-ascii?Q?TEzoS5idFW1FHP8HnG9aOe5EmXXStXZMjxnuIOOqUN0AmAJ0lJx1VVhivh/k?=
 =?us-ascii?Q?EbYhqm4AOPPg6NXZye7LtaoaANlJnNy6dXq04vEUDl9zHfpTC3o+XvDusXA2?=
 =?us-ascii?Q?9hCldOXpw5EdbK14456T+hDhlBk3PYHGNjABRPWSnsBjhehc01qC1tywVvxL?=
 =?us-ascii?Q?EBudF6EotIc0sEyUigTjnkBwehOP+5Z+B19SXUIucCie9yoVgIGrDDup0yrP?=
 =?us-ascii?Q?BCueOzpo4xaQPL7YAcxV1iRpAAIMoQkeAf5VLLw5slA67mfd3FJxBkDQV5nC?=
 =?us-ascii?Q?tFZYRR2JV1bVcXoHgasKdALOKRYJmP9An2a+NV5m78x0s1U67ui1yP6l7Mth?=
 =?us-ascii?Q?n29/lNuP25qxi8rb563vh8M3pd6lsMvTuCPZJMjN/Oo9798/yvu+VgZrOhuo?=
 =?us-ascii?Q?nXuQGLRHQJ1rGMwYkCWA2vm6OMHl1owUIA3xFILS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51f9f75-db49-409d-3229-08ddc3b0d722
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 15:04:04.7352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XuCNRF8BHQeOzTCwtp1H9V6gtY61qnuzSv+ohJQ9JrmhwqvVAYB9w86dwL//u/4MiYb8H8UQoOAxY+74Bj9EcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220305

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.11.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion: Friday,18 July 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, July 12, 2025 4:33 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.11.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.11.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.11.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1997
>=20
>     Build hash information:
>=20
>     bitbake: 139f61fe9eec221745184a14b3618d2dfa650b91
> meta-agl: 6ffa98047a37d1c04f60ff07f29db625e1066e91
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: 99809c787fce30b657487518af3efb1ebfe7f64a
> meta-clang: aef850f7fa53121c74b244b7ae40d31fb9809ccf
> meta-intel: 38e75c8c1059e5f37659c140c010eaa203238fd2
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 727811eaf256b88fd135be99559f2cbf14c82fce
> meta-virtualization: a5449c0c50aa07d02186f548fe6bb6c1ce8823dc
> oecore: 7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b
> poky: ae2d52758fc2fcb0ed996aa234430464ebf4b310
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
> View/Reply Online (#571): https://lists.yoctoproject.org/g/qa-build-
> notification/message/571
> Mute This Topic: https://lists.yoctoproject.org/mt/114107581/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


