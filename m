Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF820C28D13
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 02:21:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.27386.1661221277739972846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 19:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=A+OUdiuk;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661221277; x=1692757277;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=t9ljiK4+TtUuSVtnUWmUObLgVgPbpBxmt9B/XP8U2gE=;
  b=A+OUdiukyNxEO3rQAZB1deaFDQ1SQboZY1rko5tzNyg+gu5SeCq4iwKq
   VHw/0jJ5y7BJg1VQMhx4AFGLdJG8HH8VtIHkgPS3Yv6jz92ag2DSygNt3
   0WBp74ASkRJxEhw7AvBtds8oXmMjEXC9hSai2vT4HvKo4R4Gc/TVxvm0/
   9NGQm/Z/czCw2MV6jVGvJ7AvTDmA1BZbfvtGHjh157S/yFKGEZKQI/Ahb
   dO6VTKBt7I0ibWdhE9FX862vI7MawdEBGUMZOi9YWjCEJHB+W0puHIbyG
   Vljbh/HBHZXEtrF9VIq/HdkcpsrAeo1bxpWIV2qrHRpti4XoI9IqaEwth
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355301337"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200";
   d="scan'208";a="355301337"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 19:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200";
   d="scan'208";a="669815461"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2022 19:21:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 19:21:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 19:21:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 22 Aug 2022 19:21:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 22 Aug 2022 19:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iON29r3Pbl8qa4Dyhx7221wljFH8BAWooXfBa7ErcnkUz3kWeOZRDAo07jsNdlRTpcKtlak/2Ts7TlXDBRMAsocoqG8ik/m1z+Tbgwoh+IXHKzEx/7C11zurJXYxjINPjLuqgGr/jLCXuOxb52ah2ARqRDX/TjNEAjRCuK6BzYpfHvHJgyWh+x0/e7Rif9FY2oeVhhZXmMP7TCT2UNKyApeJCbm7UqU75MpnzzyLPJVyN1+XqC/u/1GDRNpvve6CzV/pbcAAwFXy2E8IrFiubQ6/sM4ZMXX16qvSskP39YGMFtZJ+clb5sNGTPunLRJn2LBjwC+lZOJu8VR5SyfLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir5RyolV3g/6tx5GnJ76kRCFyBMSacVXY9yTK0QQxG8=;
 b=IYN7h1dDVxIRHGXSwg5WjwfMjJVwjCZvJAE+d06/20Y7ilPqG+nK9nRixEwYd1AUNhL3Vj8v/ZV6UpEuUAvQUbMC85jHruJ0iB0JKL9OPnSEnQxO2C0nz0bVGMiL9FP9Vq2RQl8zgsbrKvF5DZoZpZsdHEEJKdXt9thhNi9wh3OzKqlU3+NoTmRd+pZcKII2SKtHtYB58Qiu5v6Jl2AaArbyrTI7uppwh8cUxNgqjOZhWd+Bfo24MZCpy9qS52q8gQwwwhoo62hv2oZBXuBqowLsifwqaSwdQJ+URb2FgvaDBBgNSe4BZWUnU4NQMeDeXjOYYGEGx/3HbcXNYGxVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BL0PR11MB2977.namprd11.prod.outlook.com (2603:10b6:208:7d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 02:21:14 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::9d81:b1a5:afe4:dc6a]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::9d81:b1a5:afe4:dc6a%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 02:21:13 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.19.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.19.rc1)
Thread-Index: AQHYtnJbQIJIOxjT40e45Lm87YmpB627wKRg
Date: Tue, 23 Aug 2022 02:21:13 +0000
Message-ID: 
 <DM5PR1101MB234860A9F974CE54C6D382EBBB709@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010182c7908155-549934cb-cc80-456d-8a05-57f85ccb8c14-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010182c7908155-549934cb-cc80-456d-8a05-57f85ccb8c14-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: 87f653b4-d2ac-4480-0b88-08da84ae26f1
x-ms-traffictypediagnostic: BL0PR11MB2977:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CxNUnNDizB6DSRDOHqmtS7eQkZRqtfGnc4Heo9xD6iPQMPMWWzN6MyWGvxtW1aEi1vNDlXeuHZl603sSDhNyxU+mWTukQCPqbUXlmcAB2yekNwnNJb0VSaNuxwFmz27gUXihwFDKF4Yw6C+hlZl0puIWBCsLq30JncSI0HOokISDqAwxpiiuAOyoevZjg/B/SEzKBvo5VtMp+qt/RqKvz1iVn4BQ9kr2v1wnTKcQzWzAHXoJGWUcuqo3kA04wboEdSZPr8JnyxosxPyrfe2cZx7UrhTMv+fRzz4jAw1FWI7y7cipuJ577yEuVVkLuch9k7+mYUEBZ+LsXLNUYAMz1daVgST26YXjEeBwKKPl3nVLMCL65bht2iiHV0jd+GNGn6iXdZ6/euSOAxZbAhnhS1H/nWP0nwPhPubyQNQWwiErvZbWZRkDJ54/cbRGB9jGSUzekNHZzlJ6Hz80nabLdJrR60HGnWAB9b3rVLAxHDjXT1GXXZUPoO4IcCJahzdO1/ad1FZkU/XoXmLbKWN3KQnyhTQCfD7vR0zishCRawSTXT6OmG3rcg1fdBseFvNCPuA1WaViW26R4g/hMVDMz4ibHKSSU4Ptpfx2JCLQSt22SuV+Qu4UkNlqsRjsV1tT0wWpa2CsA3eiQLlNhvLwvuO9iXPjI6XVKI/XsLdqLwB9BCks879N1b93GZWF5lUueBPJYjPY5smAZDWflfgLg9m+72vf1b5zy13LT4CJsHwU12y1zn0lsevmMd+mebFXJmQ9DuATznfepLqa7sZOGDOx/OEpwuz2nuFtzVUdD7PyTyz7VS1ju6kc6jt5P27nIpc9yLPU2MeRsl8ZVGrnDg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(122000001)(38070700005)(86362001)(82960400001)(38100700002)(316002)(15650500001)(110136005)(2906002)(8676002)(66476007)(76116006)(66446008)(52536014)(66946007)(66556008)(64756008)(8936002)(966005)(55016003)(186003)(5660300002)(55236004)(83380400001)(41300700001)(71200400001)(478600001)(26005)(6506007)(53546011)(9686003)(7696005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hzSqCmbLyCUIFiUkKkudU+dzdJzGRSTPIEBLpbwxmSwLCuGlN/jN55FJi3i1?=
 =?us-ascii?Q?7hspTVh5/ZZRG5tPMbeosMr8s4OVtw8BjFmOsSTnshzJj+Y4Zgsj89wdzcEM?=
 =?us-ascii?Q?iml45GOU5sbjbeE+Mn9I2HzuiN1jit1Zs+DVaBM9qgwRDRFm4QfAs3DLG8jb?=
 =?us-ascii?Q?Z3w2LZD0XPyMOnazCCgd3NJ+vMnlLLxqWc91JZpJcWQ04+aNDrbkdSE4LvwG?=
 =?us-ascii?Q?71UVSAKjCmahOBt0DyL5hG3N78fWze4mQtQUiRvvlOh8TuwG0A31fAlXSOOn?=
 =?us-ascii?Q?S471QiZJKpbF4PrLTrt00n8OwfR1cboLanDIs4Nf9qwX5Ee7lXZTbF3pZ/43?=
 =?us-ascii?Q?vJaq2QvyVelnWOYQ66tgk2aGTw+hDhmgqKmBT1NoHCOwjgD6PUvE2pvvNQka?=
 =?us-ascii?Q?TgxwkGjzlXvocd+nFwQm00VlF6Ec1IfYFpiM+NF6GQvZjR81cBd8L1uTLYmn?=
 =?us-ascii?Q?JOvskFQnEXwK6SWrLLfQYJjyruxg7zNz5FCYs6vrfNFWngxknYO7yTsFDERT?=
 =?us-ascii?Q?4nbCFtEz5BEsnKCkkKodzslc/qL1MG90FqRz6JwjdLfYHyO2tcirGxg4zOTz?=
 =?us-ascii?Q?Ty4LDzWUycVChGVX3LDmXUI2P4aqs+242/0Iy6GcrmEiZStQBdX9uXsZAJea?=
 =?us-ascii?Q?H4lB4gzABZVfJVnf8sdss+sJ5uqN/ychQk/Nq+0SKMpXrSjF7Q3nj25WtUXp?=
 =?us-ascii?Q?W/IYV1MeS3AJZvYzHIsbXDigViefGY4orR5bVAvVm3QX7IXCheoAwjsPUfLU?=
 =?us-ascii?Q?qO48mJVLGdxwAc8XXLlGrYddrQ6akj+RHiqwlPU51rUlv+kUmledp7LjmWy7?=
 =?us-ascii?Q?aEQWvCeBtLY/g6rfOYWB8iCuTLQP0Z6DI/VuIOSxYOWpyCl94Y0Z8hsV2x0A?=
 =?us-ascii?Q?S+szTp/aAEZer0vFHwWoN4q9d5qZZDFlYHrl8YaQdTZPrnmYjOYxi56o53D5?=
 =?us-ascii?Q?XSOd2638pK/dOJ80hqpPDbiMmbVxz5T4TVld5zQHJGwgvINVsKxL6VqRX5Ps?=
 =?us-ascii?Q?lTQArXThJlbSyFL2XkfsIpzmv3jxF0nkKpi/fBx79aeH+cOD6U4afatN49WQ?=
 =?us-ascii?Q?UObWgk7bl89Be+6zHPDxgmu6WPRH21FMmax0SoQmGeR4Tll6O2c2H+snt+AL?=
 =?us-ascii?Q?0deOteRmftHuf4oeOE0cBe09sw4QFHvm8pFWfQ+kY3nI+bvVUTouBhR01BYk?=
 =?us-ascii?Q?y4Q/teCx7UKQ925wILaVKSbiDfcGUb+zUbVhawHxo5QG1AutsfwR8Zis1DoW?=
 =?us-ascii?Q?zgc7RUvoRdjj/SabyZyv42BjQytsq6tgA4fDuvlEr5TUR9+OplAuEOlLYEHC?=
 =?us-ascii?Q?ct872c7huaLw1Ib7D3Inn2CBYMy6wBpKD3s9sjubnxNEpILpjW66bLHIdCm6?=
 =?us-ascii?Q?5OyCTr15LDEtek+ozV3TZYovzHalG2ZwGSXHsLjnFNROxur6ZnHWihcSSpQG?=
 =?us-ascii?Q?0DzMYmaL799N4yuslzxFbrQvkFgwuLmm/R1fOb8hkDo/w2dJDMZCiAmc2A0l?=
 =?us-ascii?Q?EIeYLejkApwdbWAr5T0RDHa9EV4CsXaLUt/57X6cx636GTaqAk1JetQIJ44c?=
 =?us-ascii?Q?Fmw+YEV3T9FMwzg0eHSxfoN9SKw0gFbh1P8OvWOV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87f653b4-d2ac-4480-0b88-08da84ae26f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 02:21:13.8385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uYCEfi+o5q/cFZTip0j6L6aAMFHG0L2SDUB8uAaGOqBzrv2nz+7Jn8uViecvl2Utgc4Rzor78P+ZSLEqsoxIIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2977
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 02:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169692

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.19.r=
c1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion this Friday, August 26.

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 23 August, 2022 5:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.19.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.19.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.19.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 17be38290d1e971cd89785e6bf44caef0a6416f8
> meta-agl: 8ce71214c1935c2160d139140972f328afacabee
> meta-arm: 69547052727a461f33967e64630aa03b34a7eadd
> meta-aws: bc38cc397e98c6d6d8d4b701de5944f72d169108
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 8ed6f20cfb116e88e573ee6a08637aa5ac12e1c5
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: f22bf6efaae61a8fd9272be64e7d75223c58922e
> meta-virtualization: a63a54df3170fed387f810f23cdc2f483ad587df
> oecore: a3cba15142e98177119ef36c09f553d09acf35ef
> poky: 4aad5914efe9789755789856882aac53de6c4ed3
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
> View/Reply Online (#173): https://lists.yoctoproject.org/g/qa-build-
> notification/message/173
> Mute This Topic: https://lists.yoctoproject.org/mt/93192448/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


