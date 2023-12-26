Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5003DC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 03:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web10.74394.1703560768427769995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 19:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=F5Ok9MwJ;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703560769; x=1735096769;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zPtLHezFw+Q/NrYkE98Zrx9M7Dzrl71kimKdcPIG4EU=;
  b=F5Ok9MwJvt/Cmf/MF8D4HiA3pnfPtXnhaSq5ral6EscbMGcDJIZwznj0
   kNRKKQfN20QcK6/eIOUSmzyzycV53PSb72YEvhVEvP2mpaBTWYQxn+qZq
   jVyo2OO9nlrLHo3dwJfbV4JV/ROW/it+qob5JpzP9FXmot1nIohsdlCMQ
   8HpLytV9+ZOHFJ8qozFbFBdEScUxwaehg8niurV+gkkmTdql7Sc/EX34c
   j7dxr4Woq4YqnD4Lp1bt409HO/xB7pOs+ApuNIkVEX4JDLUtp854Kgu3q
   sRwQATODhHum3xc7v9DpsBUEWuJ6NcfYk/YHE3QPV1h3tb1A62ZJWdvQN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3609960"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3609960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 19:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="727639672"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="727639672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Dec 2023 19:18:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Dec 2023 19:18:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Dec 2023 19:18:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Dec 2023 19:18:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Dec 2023 19:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTBjTUpUCBqQJ22aKkrnFDUux+ZDblrrveLYc4eL7k1PiRgSvtJRX046rqdHwK3q56xoLGbooYoVzCHd0vXEIfPfItpsRw2zTKKWUI7BXCjxWYJYD1iA4f/CimeBC9XDPnZRnlnLzjYey/gdfle5Aw2d+3b7t5zMPeuF0VB2HME6FjmB6smHenp9UWVeSdFY8qpPytVZoEMKORJ8vBCgCBdp5gASakwMqhPYKPTTM6bvCEobMWy6k38ybqn41M/bdZOlZpRtsEUBsbyg3v88RJUu5/BsMhHqIO33tXgR0OsMaq11ZLWAnG3eKj15v8kHD5cvcSCTKR7rAHa3gCxomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW9Mr8xAVqtKb9tr75sLfook//mNOwy9CgKHVOlGLPY=;
 b=jkackpwZXhrqysY2iASdD6Vaxqeer9afSdyj+eQe2LYWc1whAiF+rosI+xvRJT9T1nMTLMz8nQAGXmYZWZRO9GV58U21fIeSfYEyX+W0O568N4mB3Dn/SqDmYqdGiJBnAbd2a4l4ssKeiL16/PVs3uE4rDQ+XlN1O7l5NAy6nQw7i8f4gFwGQt9Nty9pOc6iKaF+AYvxnENdkxuwl3ljfOnVAPuzn3LTqnKl19oO7Z0BcNw012X0MSx8zRGiBFiAH7K5hBjAvAjBz7SxTRn9irKjn9VFJz2/jkm0x7O4DxPut2FuMdlH+HV90QgZzhCPekoVz4/ziTeCkctfNlfsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 03:18:13 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 03:18:13 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0_M1.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0_M1.rc3)
Thread-Index: AQHaMcCUJBUvZS8nWkmohJxdwZ0XpLC68Hrw
Date: Tue, 26 Dec 2023 03:18:12 +0000
Message-ID: <BY5PR11MB4152594EAE4BF1F8927986E6A198A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c7d619dc0-ba8b9b23-ffab-4656-ae64-fadc60b755dd-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c7d619dc0-ba8b9b23-ffab-4656-ae64-fadc60b755dd-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS0PR11MB7903:EE_
x-ms-office365-filtering-correlation-id: f101c666-75b4-4597-36eb-08dc05c14b33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mXDBWqymkjsgo5na6tbq+Pt9E42MkQL65LoG9a2X+XehIMCblBZFWgUhkXennohINA+R1aU+Qo06hqVdwlMHurWYSJGkrBSPgz7o8rkUhXTO8FbRuTFSpFMRxiyrHuXDaKdbEJjB75KzxAiERO6PhRqPBguQyObL9JCZchrGvBMcxsYroYMryT2C/IU69vIxvZbILrmsDymjNmWRyZy+Bvmogmpv6RIfFgwxvApT/VziywnUhZwo2IEd8kvSm8KsJcxfBWCG+zlhrc6WzM8qXCsAEkvZGsSB6AR/F0j5m/3Zj1RdLBpstztivZHuNCpuF6aOp8m3y1yJagj1u7J5G2ezv4Wq+IaQLJrSVBzTEni+1DLjJ7A1DJaJiCVVxeh0HOy0xbJ6xy0p1cSmGfUn3l3qsUb862/jxIQSoXqdcgXCMjNdz3Y6cVL8lXhTCnIO9tfA5onQ3ZpHw1boCDVn9uRLCKPqLNdvOnboN9Bh3djeN3vJ6luZV1jIIS1987+vjDDX+U1o1NWyEUXjVvzCk9URZOFGugwo31mb6S5xJvP+NGAJqoBWPNoU3qEQmh8O4jVGI1be30wKbr5OPJdmJlB5v9G5O4O+vyLlhowCTo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(15650500001)(2906002)(82960400001)(38100700002)(55016003)(122000001)(86362001)(52536014)(8936002)(8676002)(41300700001)(316002)(33656002)(66556008)(66446008)(66476007)(64756008)(66899024)(66946007)(76116006)(110136005)(83380400001)(26005)(478600001)(966005)(7696005)(9686003)(53546011)(6506007)(38070700009)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f9alvDDtjzuZ9WPNrTtgiUKk4JmOCnZ+AUIOhpMzcPewaQrpsi6TvJlpVwUy?=
 =?us-ascii?Q?KattJ8iBhwBcwdRle10y/hdm2edaepYer/vxHw68N4kCDDAhm5tls//Ii1WV?=
 =?us-ascii?Q?/6NC7ZriHnVY6fm4L7K4fr60ESu3Jr3awA5IOhsBIRg3pSH61Us25M5F5btZ?=
 =?us-ascii?Q?tl56ZbFhUqkytYdRMRth7uVJaxND/S3i8S4/c0hVBka4m1IqFmuvQvD/PzT1?=
 =?us-ascii?Q?hVpLNhpW+IevY90Lb7W/DvMyju7hD5go0DjFAVtDwfXtwXhTqHq2+C1iaTRI?=
 =?us-ascii?Q?h4AvMfszGpUG0/LHJVBfzKpAj4AfBgAeGkIAav1t7ocjEj4nA78M73dQlFwp?=
 =?us-ascii?Q?0BLblfWM9TFSsewNXpWD4WozUxP4S+QBk+HdYR1126jMJ576TKfB7JcX2MZX?=
 =?us-ascii?Q?ZRYa7PGFeHobQgx3BJxhiI2nPACJZvgm9BNdv4YdkM04v95lJdKESG7q9NgW?=
 =?us-ascii?Q?7TESZ+GMGo174KKK+oEjJuG1l0PoHPEAD/7MwQoYInGGRb57d6O1oH3XGeAU?=
 =?us-ascii?Q?egVCO8YLY7YFbU4F/IWYssJjWriW4dROKAloWDnMJlQPosKvn5ZrvmTDW2q6?=
 =?us-ascii?Q?tNDDwXJNb5PdebkWtDjwpNXzvBzk5/80KNToaN7KLnlvk3DtGRCTLr2HORbU?=
 =?us-ascii?Q?CsDBGckAq+PeZFtvULMtmx4HZh6jv1/g+Rs1DnqlVZE0me7ChvKtvltqchgm?=
 =?us-ascii?Q?Onjgh4YxrOokVRHokjTbMEDRAtJUeNgkkaxDsLbu0Q0MX8yYSpAwpXadbfT2?=
 =?us-ascii?Q?DXvpvFQkr7oAyGohg/l4ACl+J23ig9bwzQoZCIjJAfUnE8JysF5LmFyWy6yj?=
 =?us-ascii?Q?hfsV/ktyQ9Rjp/En1Rpqng5JNz6HXGlEYKxymkjEncIHHcBKsKHdURs0uhSl?=
 =?us-ascii?Q?xX7LnxfHH7ud45t4np8cYvWmACk0oWd0lg0tOUwtDX7jaYZf1yCiO9DblKh7?=
 =?us-ascii?Q?HTzAgSm28EaMDLx/WnMnnyQzaXKYC39j5OIBba4Gh+d/WaxoEZ6CA/s+pGGJ?=
 =?us-ascii?Q?0WC/RN2NP56X6GvO9h4DiOeGl09YI/M//VOTxhrYv+iwJHGpPo0f+tLA1loD?=
 =?us-ascii?Q?evJbu0l7xK5+geyhe+UDw4/1ZCL6a1n3DOy9CK+tx/d0kEVCbyQFXgBPvFFp?=
 =?us-ascii?Q?iYzFHrkpu3gfP6hq/lNmY44deLxEUC0fB7K8aZNMTV99fc7qojv5kCp+9TzI?=
 =?us-ascii?Q?0y1tOw6lpWa9J7ShbngiDVw4hb3yBHYfMmUNQBV1EO/OfvWdwk1z4sIBgrjC?=
 =?us-ascii?Q?wGCA1/aVvnU4NbNIxk8eK5YYyN9CyUDWFfitGUEPUgGh9yW1WOmbuLPkh8gn?=
 =?us-ascii?Q?FoASepKMueUaWBEko7/UJV4brqjFw7gmQUElIL9R+TFe/ipuOv8hP3HMg5o+?=
 =?us-ascii?Q?U9Qyr7k+4vgzKewDVKPOAwIrW2cBktdzztJxtP2wVB4434LnaQs42P/JmBuD?=
 =?us-ascii?Q?WFQ0LMx3JIKFsA+fmVwRenJKb+8wC0slOVCNbmOjQeejyfImIeKBi7f1XvNv?=
 =?us-ascii?Q?fvIdJYkd8NcQdXPUn5FuQwZt6M9vPjP63KN8eFz9MR+r03vzHw20VTCdUdc0?=
 =?us-ascii?Q?uFYDyRRYCKy59BFQu2vwkv4eB+u4cjRnKGInoEj3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f101c666-75b4-4597-36eb-08dc05c14b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2023 03:18:12.7987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIX06sEqUR0gaFUnxy0UWLUV1D7dnvqp7U6Xc/6SvABIBlihY7N3d8tAMOVTA1cfdqy7qK2Ye7hjrvL/V+XrNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 03:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192905

Hi All,
=20
QA for yocto-5.0_M1.rc3 is completed. This is the full report for this rele=
ase: =20
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
> Sent: Monday, December 18, 2023 10:43 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0_M1.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M1.rc3) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M1.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6345
>=20
>     Build hash information:
>=20
>     bitbake: 8295ac1b6672c25bee595cff6e000b2af817f904
> meta-agl: 266ac5373b4458d7fcb78b1e8948eb2b33f18b5d
> meta-arm: e6e7ac4d99f103d26a0ffefd6d0a5d2deef5b17c
> meta-aws: 7915e6bafd876ab3d654a26629dbf501479caae0
> meta-intel: 5cfefd9a8ff1f5a3534c1ba9d7d7f6971ed5d56f
> meta-mingw: e01d47d183945caeaf3c5c086539af0a925ddc32
> meta-openembedded: 0a0ea87b8dda01a2887a525cef78eb6c3f4c2c32
> meta-virtualization: caa14c63f158fdd13382ccf1ff4e20a8ba6ad667
> oecore: 6b729088dce302eb3a967cb6839f00488025be0e
> poky: 33112178d164ddd9ef0b1115c254ad4341ec3ad1
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
> View/Reply Online (#365): https://lists.yoctoproject.org/g/qa-build-
> notification/message/365
> Mute This Topic: https://lists.yoctoproject.org/mt/103243393/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


