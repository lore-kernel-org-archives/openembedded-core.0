Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5224DC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 05:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.64047.1698298490265515544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 22:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HZa6QZKR;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698298490; x=1729834490;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Pdx8N6CMCHYlpPqcQpo4lF2BRN9bnPiqKmM/pTWI3SE=;
  b=HZa6QZKRJWW/Y0WXZ7eWP3rOjuMdInGNftVtO94I7BWN4mI/XkOm0XzT
   U57NR0iZtGEVqijU4ma0QEoD8pZq5f7Y8wZn7nAaH1Cwa+IUK7L91W8zx
   om8K5f/YID4M9VTWmGFxCJxNGnEbxEUtXE1lXP9paZ50roGpKZR6bDneW
   zY0Bqi5dZQo5xDVbrODrTQbIrFTUvn3pOx+uWgwV2BfshwvMkULLdmsOU
   7HBufQu3WtC4SWvYUqN4DRBvt6/s6GSQj1tAQZKINs+mwpkR6Agjbo+1G
   Q7NhugDpthXer1L0Bf4RnbFd6TF1pwFVIXsDbPJOjUIZAeSc72dJWRl1H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367676077"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="367676077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7123003"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2023 22:34:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 22:34:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 22:34:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 22:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXKJZJ8qHQSNdHedH12VhAbybYTYT1H9VMJE0A28gCSimvVma7yggExRH+hVMxHB5P2/clou6CFRElLtHDDAfSqhRSYrK//im14UiLzPDZrs1jUgk30MG1sOiyehzCuEGS0kMhcgxq3swldQnkLmCFz0n5JyHvz5uZheivnsjaiJoETzm/T+dddhMo9ow3CKxFtOlASIZ3hiGdxIigh8pbw8FHbC6/hfhZuRbSMUh6rCTA6hb36K9KgmBE2FBCJMrI8aLyqNrfIKJDaSx4hJ2MrwHBeRDAz5JplkgqJZUNvEu0tAwRcVflMzzU+uimauXcsV9HSnZoM2o0YNbHtjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHDfWnlw9/bEQ8V5FWR1n6mI/F2PF/P5CGEOBIahGUw=;
 b=NSth1bwNCS98RKwy27QaTqSXDxM36B4qq4zRc6RXInlvZD7fUQ6ciJOI3pDEWJO9zHvIlNZKGXXGPv7DatC7W2Ltf8DawHNY9NPRHZIi5xbpHAt40VwPkBz+zeRLQWcwIBfmeHUnXWBXCiZ4KWuJMzmnt4jdGR5IH4oWaGSSyP8eJiSAdbQnESBaYivuAtRnzkU099/LyLGJm1TtM7/yOdFgQzDMwjJbhqBWM7BiOflfIPAn7kQUqnk9I78kVDRDy6t35+/pyfwPt+buusW6PEORzBtxGxFTc2tmqJcmneA13yAgjyfSZrcxN0nykzYx4BxFJJsnUCVsuWCuCDQAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 05:34:44 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 05:34:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.rc2)
Thread-Index: AQHaAyJ4RVzgeYR7u0aCw4IO3F76wLBbla4A
Date: Thu, 26 Oct 2023 05:34:43 +0000
Message-ID: <BY5PR11MB4152E73428F58A5847AAAFF8A1DDA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b4bde33b6-a3fab4b0-bd55-4084-8c36-15407b954459-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b4bde33b6-a3fab4b0-bd55-4084-8c36-15407b954459-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SN7PR11MB6850:EE_
x-ms-office365-filtering-correlation-id: 1e579cda-b68d-44ea-f803-08dbd5e5422b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q2pIuOJ1zf84NzE6uFfPkyG0GYYvgMQyAwgqg1NuwrlRGj1JoZq4Pkm1J8MAZbxPdzBs0yT0HKG5kpMdUrkxuPzJOKpfZUmLt6IVrZELfKMS/Ocf2/59OPA5augXG3IW6xS7P858pGhAprFJI5DBpJmV8vp8A8Y1ct3e2No6wxHetNoNB1k+9ioyNKxY1gaBkXKHPMQCnh6RUu0CFcOUkDBP1b4o3W8zZuGJ1bfIenoo4a7SwQo7eK50G+Yxbz8yP56IR7MVX3d9B4Qnfezqpe+hXbWwYZZsmxYqARhNyvK0Zlxlz/pp49oOGesj2xYX3RWaSFlTOMZmilT6KsGpn3+fvPuXQ5t0J9hO+xXrnIhJqVbq8rQ6IlLjgiIL5jVXl2MrnEIbMkEYStjMkib71fdKNhrNt7z0LWX0l0jYLvzMaTCAhrA07TiZzKA0a/iBIzgfi5WRtf4rH/LjN1am7YIOYQoE0n0gvGX91jNzANn8KWptaJ+ZWEw20ql+xsk7OBL5obYcrHTjT9MOmTF0yyGYF9QXuUU+EFvfJ/5ATq5P/B1LXHKmjF1TBVyUKWVZ4s38KDaZrD5cKTxaA13b1V8lgenHevf0Z4UGIK3m90VpLaS0fAzNkX02s7EqpXrwaHGEcattFnkObfIa0/51FQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82960400001)(66899024)(9686003)(41300700001)(122000001)(5660300002)(55016003)(26005)(966005)(8676002)(8936002)(478600001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(110136005)(38070700009)(6506007)(7696005)(53546011)(52536014)(71200400001)(86362001)(33656002)(38100700002)(2906002)(83380400001)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bOgeoJ0NtMMKy3XAD9vtlnrw0mhQ0VoYevb48KyyuO0xrVzE0jG3p46K8Gdl?=
 =?us-ascii?Q?Eg8UNLWCj/DqmI5q0rxPHd1LZFfFImpvf/LcCWjgW7mjSvNv8CPgLdMG2CtI?=
 =?us-ascii?Q?SXd01jT/s1BXRj+m24s0SdyoXkpiYDdVU8MOAagqHf8219eh7wyETiaZg6z1?=
 =?us-ascii?Q?+TU0XhuL1pwPG0W/v82I7T3Tjp4ELtMF8yOR1Lvkb0/fQBYAErr4Nexv2cn1?=
 =?us-ascii?Q?+A84oQD0CtRQS8OhGIT5iX4jK1nK89VIHuLKk5E4lwHmnRHRtzqETKvDgn7I?=
 =?us-ascii?Q?r9J8sb01nocV6TFMDEuxFGgXa1eTbUBjMY3cRE+/MClnppR9DzXUFD9gaQLT?=
 =?us-ascii?Q?1ppUzzoUfaQMbVJRQHxwKlidBr1o+AC7kDMOtpdUa/eqPZcON68iIniD6la+?=
 =?us-ascii?Q?7j/iuJSbEw+LUgnjgnh9EmEYrxk2QGFmweBlW9otlrEvbSNEun23rmpHwtbC?=
 =?us-ascii?Q?9nix91j11KGSPQw6gSppzTK8v1f+4XG6fEmRQlTG5C82h0Fslxw7lcbAqDCO?=
 =?us-ascii?Q?SzNshYUNcmL0P1Sv8qVtc9zfvaWpyXzKCRab1yIzRUX3chQPHJpRr9phNKL6?=
 =?us-ascii?Q?ydIJhEcv9wg4OA6YVGSB7oSdENRkLh1+Tygq37w3J7dPE4Q8b8hKR7sXaY9V?=
 =?us-ascii?Q?E9y5R90WOiCOm8leLzNowOqNC3GHSp+N/H//hnPpcnyQXGuSnBkRoMAIse60?=
 =?us-ascii?Q?wzmZqzZqIaPgaSkkwbkDjX+e/RvunxgdHAXLUWdjzOtrqraM8CAaO9c1w0RL?=
 =?us-ascii?Q?QOiG3L3PWhXQKxeysieLORDBcNMXkZaas0aDZIRV8y/GS5SVzng1foaHr369?=
 =?us-ascii?Q?oLEKzMrVGHNxcKzKuwmTMFbdk3l2/j/A/Yg29Apa6CjHh6wBogwzWUDQXhW6?=
 =?us-ascii?Q?quAiNBHDPcQhY+5f/F0VHzYH3k4FMb/CfGWZl8eSN/O+suhBkXZIephxKYPJ?=
 =?us-ascii?Q?t464IwqpH46K7IDwfM5Nxu9/8YkOOm63N0QXV3AabwKZMQPxhWroRUS36v8P?=
 =?us-ascii?Q?l9OEKBrYvOfc3m5wC1K2VB66Ysg2Wie5jAnyMb+/QbfNsNr6DXtihYwtuVJg?=
 =?us-ascii?Q?cot42stlLsHRLjaQBzQTodKmKxhLR9INoKTVSQYRqZUs/wAg4g3MvtS+RQoq?=
 =?us-ascii?Q?uznMrwyRyzdrC2DNrNECvhefcVuNUjD/IMgJ2dkpYOEfUpTGmzw6jwwG56b2?=
 =?us-ascii?Q?bI5WYOBBmzUj7yeiiCFQ9rjGR9Dw0NmWZwo6k47h3c3jgLQMLOTXuDVleiKD?=
 =?us-ascii?Q?F9BV81D05/ipTR+5i/A9faSA1nXInl7D+Fg5tzBvCMeikJUM6UwiievcBES4?=
 =?us-ascii?Q?FjAcY8OFlNCsLYrHoEwzzwWPcvQPNyBFKO1ENaO34XB4hws6ekeBHU9VqbgR?=
 =?us-ascii?Q?Rsc/8gWO+GHVyYjVyvjqPna2ytw+3IiSh3iAJxBTg6J7TS6z16PImw3rY5L5?=
 =?us-ascii?Q?UxelPl9ZeEsEvoOLvc5unl3uWJCLhO/GmYtEcwvHaHMUeAhKxI0Ecx7cFEiH?=
 =?us-ascii?Q?xPHEQaXngYcVSXNfqqDl7a1FrWTnPA8HtCsKRzz0rW45ryM9Gf02pqT5eGSp?=
 =?us-ascii?Q?hclrq9x+6LZO8/d2+Rpu0xTEpoRykNPhmGeOADkR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e579cda-b68d-44ea-f803-08dbd5e5422b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 05:34:43.6917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbe5DlGFCrpVCT4srqzdmmBGtthuX1jGMqWTcaNMDUASwx1nuKWCzqLz3ZZte/MYMPPYZfZcwx5Kaqo85ZpeTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 05:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189697

Hi All,
=20
QA for yocto-4.3.rc2 is completed. This is the full report for this release=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, October 20, 2023 2:56 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.3.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6080
>=20
>     Build hash information:
>=20
>     bitbake: 5419a8473d6d4cd1d01537de68ad8d72cf5be0b2
> meta-agl: 4063b4f9a712e32337c1d9678b2f2481dde2a346
> meta-arm: 4bf3246b7b1147e29d42a835631c89279a6ce520
> meta-aws: a30a2b66f1447dc5abdbca6c5de743e39c08b99b
> meta-intel: 1bca60610c597571769edc4a057a04bfdbd2f994
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: c66ec8776ec6f467937918a114bdefa28ac036a9
> meta-virtualization: 827092c2ec925ea3a024dcda9ccfd738e351e6ba
> oecore: 4c261f8cbdf0c7196a74daad041d04eb093015f3
> poky: 15b576c4101231d248fda7ae0824e1780e1a8901
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
> View/Reply Online (#329): https://lists.yoctoproject.org/g/qa-build-
> notification/message/329
> Mute This Topic: https://lists.yoctoproject.org/mt/102076568/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


