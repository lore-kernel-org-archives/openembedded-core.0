Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEECC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 10:00:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.5823.1646215206105713975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 02:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YZmkjdu/;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646215206; x=1677751206;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=82kT57Ho7eIRsbV/k4hJecPHjESTy+Qc10Fn6SAX6zc=;
  b=YZmkjdu/47xuoF+FMidH8RxMKHmYkdDyvOkbHoTw/PvtasrXQG5ZwCXM
   InLfnMIOf8WNVazuh6nsFvRRfiFq6I7JKkILesjocTkv+lHMbFoG1CCnk
   fhxxzJ0Dc7iaI3X6qYAYwDeEOqjeWf5fwEX2SW4PPp0bF8tGF7U3AiuX1
   MaEAQzVTU+9HO5hDC7T0Abe0Nhlc5Oj3fCTwa+Wl63jQOFkM8RlQw/fJL
   hNq3atw7QhaJACGkLjYEreSQWM1xMp3UxBeSheNNY8NZXOPBWx4ovhDq5
   lCouCAKLgilTn2+BDsnve0jFxmH3GU8kq/dfd/fSMJH4nLol5Fbuisn8p
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="339795053"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400";
   d="scan'208";a="339795053"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400";
   d="scan'208";a="576054959"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2022 02:00:05 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 02:00:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 02:00:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 2 Mar 2022 02:00:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhwEEcNw8FTICNKfiSAhsWjTJy7vSg62iNFZOgmJDlHjdm0bUZz6C3lHZvukmpD6JSH3fNDMgtLfQbabCQe48AusvfA2SFAwn/SVsKJ2rYZ15bC6cCo6h4Bu+jAQRkVVIZspzfBTPGMg9l+UFCCGLKzxYdsvPQQtXHN5Zokp3quLdDDm5hYsq5nniA8/85ZejBt/DZeO9PXunN79DQpva+03QZ/2kLyw3Ce8jKvUEzDmj8DavCx9X14EaK2kBKaiC7W5ybEsfEHQlAis2cLm1LTQ/t0HWlVfxteUB4bbiHPkwlFnfBUG7M19Z+LlXqsMcN6DF3k88PC4bR7OxvNhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izw9l8tE7wMtT378gBBhp0OalxDPIYmDjRq6ExJmbcA=;
 b=T3brzO6kX5dtzTSNSmL+RN3/vTbZb4Oqmm2O1T/7S0O9JBPoTaMAk5wjK3x1p526qO0BbJE1IiQGL6qAM2hjARRceFoEKY9EEThhAx1EdZAhDagKbrCcQ2HfFSu3urJrSVqPPFidEYZ/WOsmnm5pHNiJ8MVTqfmG4+CvWkL3cVLDPCH1zYBQajhSP1arziDzGatgXEjHP6pADvgOTpBtqhphMvYvaNICqoxD4AfKxBGQhrpFuY/puJGKEnzlEL+pSWuxbaKhwJETpsn0NxAo7UaxrmElUr3F6gIBg9w5p92frcejm9tB14HXa3tuH+NPiykcAeFa9NUgKNVmB88WJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 10:00:03 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260%9]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 10:00:03 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] package: do_package should depend on binutils
Thread-Topic: [OE-core] [PATCH] package: do_package should depend on binutils
Thread-Index: AQHYLYCgDdTm/AYITEmodk8AZCTDuKyr2+QQ
Date: Wed, 2 Mar 2022 10:00:02 +0000
Message-ID: 
 <DM5PR1101MB23611A133D363C0E91C9748AB9039@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <20220301152535.1958806-1-ross.burton@arm.com>
In-Reply-To: <20220301152535.1958806-1-ross.burton@arm.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f865f60-c118-4ddc-04e9-08d9fc336bce
x-ms-traffictypediagnostic: SA0PR11MB4637:EE_
x-microsoft-antispam-prvs: 
 <SA0PR11MB46373A7B66843547AF55A083B9039@SA0PR11MB4637.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4sWkvGpwz60cJXIeG378GDp8LpWJ2+/foyyn/kbhewweX6ddc2byi3dq/IzPk4hrtrIrObW9zSHMc8pZFNDqa/M6YF9QOWETmE/Gny3ssRsvKeA0ZaVX8Qyd9kA5LVpHy8lXGLde6B0tMXZqj1ILHF7GxakhZ6SQvAd7m7AGVFwVrDbk5irBj2WqXn+NdwnRifUrrPYfzfVV0lYc6Sz/oxquB/vMQKe31PcJR7n3olBOuWdixCARRGK3XQz86QjOgxmcifnnxsuYtxSpcHRBOuwCAkC50WzlXTZU43KroemvHV3H/WLuqezr8fGEbLFmLgQAvewymOfBu0m4yPxksbjLwfZAHqpZp1RN3g2VcN0sX29ICK/3wqbebmNp5ZAyA4taq/EyOBjhFYIGhpLzPMtrZk7j5M9X5NDv7mdpONMuCLxdH3H353po/ctJ4BUI0A47TAhhQD0HVXoiueSydV5N+EOPIQDzVTc23dZDjWR6F+2mBkfJvoPNSDKN9oduuZoIEYc5a7vIBLjnOWd/DIngocFHKl+ybbdxB011g2fFGObZSCrU9rMmnjSiF9BCG8bOaWrnoWHe4U28QPxrFxDvT2FWxU9QboPhj/ijnKGlvl/7EsSNPto6FHwt5Mj6q260UOxVMd7P88LDM8rmwcY71qm5Mxg1ZxunhCBAUOEiCyRs67AnMPRnlo995yo2OKd2v0wTtBAogWDDCYxBRpnDc1NnDnnBgK7omJ/Ez8UMFzJZNipopTGdjAPnjny8kwPlHugEFNm/4VcYaJ/shdabKjp4XVyKA8+Pmsz4ZWZPQiMks3RocESQfXrWi30nX7GpvPGWAkbZ//HnUM0XEQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(8936002)(52536014)(83380400001)(86362001)(966005)(71200400001)(55016003)(186003)(5660300002)(110136005)(316002)(66556008)(66946007)(64756008)(66476007)(66446008)(122000001)(38070700005)(8676002)(33656002)(38100700002)(53546011)(6506007)(7696005)(9686003)(82960400001)(2906002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gfGn42+GeAMnpJT3MPNWNIedbMzL20/bRHnl0wcwWLodQnsbVCboRQo5zW2K?=
 =?us-ascii?Q?RauZmGtifeAr4Y2485booCVUBtJy5LPvvlr0SnXQ4QJdyMN44nVYv2zuDgmu?=
 =?us-ascii?Q?WLm9LIhzCmagxI4QgRQVbpIsHwZw13Ds1rNlBXzXlrqab3OGC52RDYppEYnN?=
 =?us-ascii?Q?qftgQQygQstYiQbLjcezZZg2ze3OmGiSVUlGxSFzeL4jN7vVNF9JffneyCIN?=
 =?us-ascii?Q?0WSOlVrB7tjL0vb7YXPlz3sKqr11f5konZ6YMh44hg0nEG3uxvc7GSbJ3I+X?=
 =?us-ascii?Q?Amsjm7aNod/oKlS4dwcRJQb+o3JcPeRb9GI0aBnEq0o1fi8s7yHnUVu62GIl?=
 =?us-ascii?Q?wONR/M3ZxuG9HQonjudgyea5r8WkIvP1ZhdZgOpZ3njjHRGWIcsKVURNiX4i?=
 =?us-ascii?Q?8RX7dnqA1xK9nzxYyO2HyrVKd4kT9hcInrx2fErlo8X2Zba9XBXFTUfVOwUJ?=
 =?us-ascii?Q?TS0xaIuBzjU71o7mFFCJWa0TvIlrelYOITSaywqKeLyKqF+yej389taQCJ4a?=
 =?us-ascii?Q?QhnlfIoShIgi9UbFB6MIOSUPXusIf6DK7v5K2T8lAezJolkzMRRac+j1N37c?=
 =?us-ascii?Q?hiJAfyQOeW8owcByzdT/Gpz4rP2QVa0caLq2jVQJKAqk2vKpmVVcNF1M4U9P?=
 =?us-ascii?Q?/IjMVXQC9xrLkgp9bV57BHNiA9eU6RWScYl5etQMyNW3izBsR+d50J9+EUU2?=
 =?us-ascii?Q?uB7UoecB2KFLM3AEp68CeQhgE6x1RFWOB7GtUT6s0qer2P81tWKGXxkDjUKB?=
 =?us-ascii?Q?9hjnQtcntGwUe7r27+A1cerIKaKvpAXV3GPSACXx6Qtfad46GomiFXX4lmhU?=
 =?us-ascii?Q?yPh0Kz8DpbGAY7ahJL4P15RuKjdCVqZoUnt9bNXCa0dErzf4huDGpouUPt1n?=
 =?us-ascii?Q?S6M2bJeXF42F2cOSCr63gIuw1rfwE+wdwTLfeIZm0yBXyldUzZoPuO7uCrQw?=
 =?us-ascii?Q?OuqgHMQITKWjGn4VYF7LeMlxxTxAYrc1vkyTCp+0k+L0P6EA3LXL8U9wSmtz?=
 =?us-ascii?Q?CPRjboDs1bQHCKNZojZQuyuYU2UUUqiV18LkRn45D8jw31aovqnVe0A0D4Q5?=
 =?us-ascii?Q?XPkPjMrq7eTNNsjwgVCzRKhNWYLFbw6LAwtp8k3YgLAUdXl7O3oWPXodmIYl?=
 =?us-ascii?Q?7y6JdUQW2xKfaXRBg2LV+3vNM8XiC9EYZmxO38iOPm5Y5H480obQOAEmKWtJ?=
 =?us-ascii?Q?SB9icFqXj9OshK86bYnEKj9foH4+FUxj7XLp2ctsxb2kCH4i/kY46AjLKkTT?=
 =?us-ascii?Q?rW44db1A7hMjKYTmC2LSpdkWiRecbq5uEbzIZiLg/QzeqAGAaNbKEQotb3xY?=
 =?us-ascii?Q?CSlH/f7yXi6iiFKlsoSqizXYnRx+D5kOffkihEEysEN1j0kdVWjWctUYnuNc?=
 =?us-ascii?Q?QXMMsDm35dVKclRFEW71RjJspnZbLBjlOKhIKJCWHzj1TqBt1uWGOrXqxXoY?=
 =?us-ascii?Q?zcOiriGeKEloyr816a7ftudqB8AAFFyH6H10rDeTdyjsS6LW0gEjfdt0Y72P?=
 =?us-ascii?Q?VVadG0z7rwJgnOr9ft10fK1dxfZAM5PHYaCsm+gbJhsT+Rr+04qHMdxhWgJh?=
 =?us-ascii?Q?OVeJDOfUJXbpby8nVRR4/GabKCrHJYNqAxRMS+d97P2tFjd27/X0HGJ+P9Ps?=
 =?us-ascii?Q?B3dpwR+p5FaWSX/FGNmzlJR7X70uWXhFBGk9FwQ+LjSzjSToxo0VCV8rJNp5?=
 =?us-ascii?Q?kWhw6790FQGft0bqRKmVWRH4Jrc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f865f60-c118-4ddc-04e9-08d9fc336bce
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 10:00:02.9643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 /PUgGZYLUztDf1AbWbZDFYnRPeR34zmZGqGRtNT/MD6RCqlfFpM2Oeno2QXmv5/2nA48ZTzagCig8yFHkqoC/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 10:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162603

Looks like this is causing problem with multilib=20
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844/step=
s/11/logs/errors


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: Tuesday, 1 March, 2022 11:26 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] package: do_package should depend on binutils
>=20
> splitdebuginfo() in do_package uses objcopy, but there is no dependency.
> It usually gets pulled in via the toolchain but if INHIBIT_DEFAULT_DEPS=
=3D"1"
> there is no dependency on a toolchain, so make it explicit.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/package.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index f822258150..4b72bf2039 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -53,6 +53,8 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D
> "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
>  # rpm is used for the per-file dependency identification  # dwarfsrcfile=
s is
> used to determine the list of debug source files  PACKAGE_DEPENDS +=3D
> "rpm-native dwarfsrcfiles-native"
> +PACKAGE_DEPENDS:append:class-target =3D "
> virtual/${TARGET_PREFIX}binutils"
> +PACKAGE_DEPENDS:append:class-nativesdk =3D "
> virtual/${SDK_PREFIX}binutils-crosssdk"
>=20
>=20
>  # If your postinstall can execute at rootfs creation time rather than on
> --
> 2.25.1


