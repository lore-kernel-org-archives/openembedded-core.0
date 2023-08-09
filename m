Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1698C41513
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 05:58:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.82367.1691560705858663949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 22:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GR9wOuSH;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691560705; x=1723096705;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YS61vlux4VS0DvNuvw76jx9e3ubqTl7LCmW59h8CdsY=;
  b=GR9wOuSHc9ahGRWzGd6tUnQa1RnwgnZIK/X749elTh9xGGDmVhLncPFl
   KTrya9NmYWk+7HHHfNmePwGACsJkjKYYXGRqXkgyege6EWHWUYI7Httff
   u1kAOrxtpftAAzFe57583l0X4THnOs5ndl3iCqRdWPZg7arAyYvQhbu9T
   YTKRiVQOG17+1mK7fjVi88MW0c4znJgcq7vce9LT9L3HtvDUg3yaaKH2w
   pDXFRUjycdk2kYN/+6/GJj1KZy11whtmE8nSblj2ZTFcs8lYs5ietuK9C
   oQzTPPuST9Bnf6qmHPOeUOG7kA2NOiWScpyDhtd/cxwHoKTs4hadS+JRU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437396129"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="437396129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 22:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905502396"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="905502396"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 08 Aug 2023 22:58:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 22:58:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 22:58:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 22:58:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 22:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU9KaJFJ1TSexqCQay7BZ9cyYO3gvJ+mhfUDUY8QKFbbOLSoFv7p9f5mnirE50xRa+gkiI/9bcnu8c30g8odpG6AS4RDAy/XgLYAA6lT4SpaaMS9M39HDtQxx0aUmgIlMwwZyY7RgxkSx3c9qKP2Xy4u5eTc1VcvQaB9ML/PbpjJ9vZWdgjFBM8cf1XqIfF/2EjOsJIhvkuKwQwNisvcVxIPaCa3HC6Rrkec/tsVgEa4d4t/rpFVqy0SfYk01hEUBFl03r8oeBIf4dP7qotCUUJeUhBV9c9IRjYA+OM/vDR14LepElX1gIjZyVv8jMscJmP+Ib+a6mCXIgVdfsOONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c13BkHf7STNL3iDOQOt3n4K/48/MO/Bmjw2CEGvONk=;
 b=eeRcrDGVTseFlZapwbNeg+GtwMJ1Z5vTwk5AUBjoHjtoHUwxUpeKkKd6U1y/oEwrhyrl4nJ2aUC7YYjzb43br0lfgW0UWOYfbSKdAQIqtWHrp/O8/6bqL1blpGR/PkYOP+On41+A4dk06PgQMZBJfoJ+pI/rK+idhYvcYWOLq2JShObg1DDaQO5O8iZ7N6fSIw+1WgKLnyXDT0+z7WebF4eMccbh5bmfahSvmIEygdtNrUiTfLBVTziaM+YmIasE0C9KmjD7+HHZ+vIXLIrOcTBtySOH3HKPaRaZeyp0BjsQnoDhhEPKy2yo4loBo1JLGlt+n0p+AcOsGRktks45gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Wed, 9 Aug
 2023 05:58:21 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 05:58:21 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.12.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.12.rc2)
Thread-Index: AQHZylD4g9odbdbTcEWBJ2DR0UEsoK/hdutg
Date: Wed, 9 Aug 2023 05:58:21 +0000
Message-ID: <BY5PR11MB415213B279314643A25B8D12A112A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010189d780e41f-1d695671-e532-44aa-8536-5470a6c0c916-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189d780e41f-1d695671-e532-44aa-8536-5470a6c0c916-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS0PR11MB8208:EE_
x-ms-office365-filtering-correlation-id: 94ed9581-6a0c-47fd-3f4b-08db989da330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sW+gJCZzjC/okoVG8AXrn4rGbumKxHggS3OIfb+STzKHKQtKgcDOR+9rud4fJCVvPC118hx4Xs4cKQlWY5YNpU6BaKdLFrazdlsTPNUMcEQTUGE6Si9MoU33RRKzVb4B6sPj6SqMfqd/uWb0S97bZqb2d9YauPZNEAzxUAC5opedv2viAKDmzjO5Doe7zGhIHhrIvj5N7natC2aqotdYGdMxsd4GCrwP04kob3vz7Jrwz/KNZFoEwHMG1zgFlQQh3gMoSq+awYD5XTFPRJL0mtoXvafuSW1dTbx/lI4lsJUiOFxCl/alsb23wO/DlrK+i2XwZBWNT3HxsxbpQda7jK70nFP8Y3A+Yfwwc/tAKAZ5jZhLe1YpqL9QMAgesJZIyHTqhcLgJGYZ1AS22ZOkmEgKjG/BB0qs4Tpmmsn9NZHhLz1Nh70gRXeniOtlKlDD0fWUS+/IFjrouDiHuIeipbAN3rTKgGUaPlLTaVF6r7ypRzlIAM68dJcckIMsQuBLN0WiR+y+kE58t8lkDXaAck3/qLpBay0NRuTe+OaS7T39M/G2Slyppg2gtJ2GGu/gB2rzcKNlCcVvr08h1ef7ShieUTVNdaI0LCqURlIcfDnvENRQBch6CyDA9waQSenhrthI3+MbfvTFE/+NP44OUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(186006)(1800799006)(26005)(76116006)(53546011)(6506007)(8676002)(66446008)(83380400001)(41300700001)(5660300002)(66476007)(8936002)(66946007)(316002)(64756008)(66556008)(7696005)(15650500001)(2906002)(9686003)(71200400001)(52536014)(110136005)(478600001)(966005)(122000001)(55016003)(82960400001)(38100700002)(86362001)(38070700005)(33656002)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tfkjUqju9rwv1m7iFdweU6DI0CH9bUldMw3vjarzszeWQO7OTjUkVds9Q2fc?=
 =?us-ascii?Q?RT7zUm0f0OIIxff+49djAek4eStwM5ENxqnDUKJGhkwIXbKaCjlj5qUUrHCd?=
 =?us-ascii?Q?4faur1rjAehn64e5ERz62yeiVXpYmKH94ef/LJu2nD4ptkiX8PMaR30dKYJR?=
 =?us-ascii?Q?asxCyB4TRkAvBaYt6lI1DKIE4nE2jvmsGc+mArkEwi+pL5vKdNFBIMssiAy8?=
 =?us-ascii?Q?mw/wZsWD/AWvjNJ/l07SzkugtpNg4NDtZuiLvaVKCBMf4C6RGfA9WD+dKHdY?=
 =?us-ascii?Q?oQh6PDFSd+QGWr0oAh25m8jnZqqujGaMKr6bCXsbi4EzmmIbSGdF1nZ7MY15?=
 =?us-ascii?Q?05EdL4cq/js+71b2Bl810KwJFpHJL1jHdKZIdv6et+m5zVnDWdgN1IB8jZIf?=
 =?us-ascii?Q?BciZJW84ZU+gOo9dhPn6jqFkBbjdhDdgwb5ZVuDF9Njfm6rROT21l7A4Xn+8?=
 =?us-ascii?Q?B94tVbfAPf6jtXmiCfklFeql5G4RmWH6sPTD6Hf/Wt2ASPeMHJ/tWMzjSrCc?=
 =?us-ascii?Q?r8LtE/bXAvZjqpHx1jcugj2kIvOXLjvYl1zhSiynsTFNzs0s6JW1YN45nEVe?=
 =?us-ascii?Q?TO86HN2CQbFZsFlXsImDlDoTZkuOVNNPhofRiAjyprFb9XrxtvL2nmd59I/h?=
 =?us-ascii?Q?oy0Nt+R2sd7RiKJMlh/lJ+Udd7Mxlv8lH6R1S3ncvOtp29BrjfKivJ4BbZ1L?=
 =?us-ascii?Q?K7+ceWmWgY7galMG+1H51vAaXruJD2Fxm64gDA0/rLVsbKkZGFmEeJR3oafa?=
 =?us-ascii?Q?x3/cYYe9jKHZjkSpOx8E9tXJ7eXxDwNRGx2RIxLQvPVkfV2PKlr440zxAESk?=
 =?us-ascii?Q?44qyIoT4vd9WZkxUhait0EgePsGAwezdicXUOueoFENIKgmqnYOGUkkzWlqR?=
 =?us-ascii?Q?XDvptOcddSi4WpKeQVZV+jNYCRocON+DY2rNU8k/dQUN0V4XTTIcpmXKxw49?=
 =?us-ascii?Q?K4r1YjekzPEYEmf1XyDz2rGeddFwhR3+q2g/P70nbFaKTmV/fjoD+IWrVch1?=
 =?us-ascii?Q?H7gblUdGgwhuwUuymM2hnf4KNe8RQq6Eer9+mP6s8XlAafa+31I1vZf+EoRQ?=
 =?us-ascii?Q?W0wQMznznFFiFUf5zo4Je/1uTwlvVge/UXQ8kmX/rW6zXTRhjFlxPTXFxegm?=
 =?us-ascii?Q?+c+MI9rZiwkF5vxYju6ZtEltFiAFoc5D1Yc6GAIPjixMy46+5rRKhsEkj6wY?=
 =?us-ascii?Q?GMbzk9LhzQlZvjW+CldJlw9fx8aXMphDXMooBhTmDFknJTXVruMy1/y8Yv2g?=
 =?us-ascii?Q?6gXMQ6hphvo9WHVb72fmI2VeHlOktpVrsT97kwhNNVYryt89i3Yjijt/mKTF?=
 =?us-ascii?Q?hYedUBw5reN8Uox431LdRWr4VNB3TkOwWTkahovUtYp6h8RVDMhgCwIp/JS3?=
 =?us-ascii?Q?ZmNAFttikbdg7enj8a+/iPZDjH/5naARuSmMKHaZ8iG+O77r3QRRzda0mTyv?=
 =?us-ascii?Q?Z6YCqCC58ZkxtO88leTZ3KRRO2MMbf4kWyfB4gdaTVy9TmnBvOdryHxQfPMM?=
 =?us-ascii?Q?s5+Vk8W0xK6lTIL7OM4N7HZNnN9ROj0kZNSDrxMeKIS5JoaSuL4fSnSkXYCz?=
 =?us-ascii?Q?bZVrsxOJ5EZqEP0ELRjF1AKmFYFQCm6TrYRw/kwe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ed9581-6a0c-47fd-3f4b-08db989da330
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 05:58:21.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TK54G8Y4YbDY7OgwTiLQ3ICnbRXNmZ2wj9F/gmy7+aF9TcearimshHErXOwnWXLjPxRxnB8QXeGALDV38L3OGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 05:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185686

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.12.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion next Wednesday, 16 Aug 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, August 9, 2023 7:35 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.12.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.12.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.12.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 41b6684489d0261753344956042be2cc4adb0159
> meta-agl: 45b1b63c35c52b8283e1893dfa099607baa0cdcc
> meta-arm: c39bb4ce3b60b73d35c5fb06af012432e70d6b38
> meta-aws: 723a8a04965af482fe65e8e56eabea858858bd88
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 1aacdb4ed1e639cc6e19c541b058264eb17eb093
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 4da92ed9be41734f6ced46b981958e2e868cbff2
> meta-virtualization: af02908efda1580e77b3fdeed25b124a2b8d9482
> oecore: e1a604db8d2cf8782038b4016cc2e2052467333b
> poky: d6b8790370500b99ca11f0d8a05c39b661ab2ba6
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
> View/Reply Online (#297): https://lists.yoctoproject.org/g/qa-build-
> notification/message/297
> Mute This Topic: https://lists.yoctoproject.org/mt/100633804/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


