Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318D0C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 01:19:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.6432.1685063935880185737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 18:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=kw02pC6O;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685063935; x=1716599935;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yRdgUD1YVsVSFabOe9yrb2W70rSbV4kAS9scPCwvqL4=;
  b=kw02pC6OKHsEemStTpSXwJ4MnytNhom56UjNR/yj2cjHK/3rG41MEeRi
   hpiQzu2SsC8Kp4P+V1b0A/rlbI0tAoUyQg2w9hA0WQdRXKorM34r7KygO
   OCxy+EdB5i2kYKfZMNei6J6jlM3CdPL+wd8r+R+tZpXRrC7ki7hDZMbD3
   tv4K1AMDLLcF3lMTiztEk0hU/2JRHv1XcyF7+CIAo+tGIY8gJd6LCNcUL
   X7vuxR+ovYf0wjbcMLTWz2liaods4Cv6yutoilfkxldIPvKVBetGIer0A
   i1h3Q6xy3OWwWNyJ1+O8mj4I+7UujMxrfj5Y+9nC8EyxCFp8pskorHiBC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354098483"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; 
   d="scan'208";a="354098483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 18:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="849394873"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; 
   d="scan'208";a="849394873"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 25 May 2023 18:18:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 18:18:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 18:18:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 18:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f24Vt/oeq69wSeff86zslfOMqitHfsHTFF+nWRxTahAGuViXPqGKV6Kt8CoNE8Tu06Ccbrk8DpsEyuymAqz+Nf2I3h0JROUshLF97xo7iHJJcdNE/uUkZOiNUDD4Zui5uX8sCs39M2J/w8XR/ETmOOtcw9d1vEf6g7+Nwe3znwuzx00NTxD9ssSTNDl2xdJkMj73a6YnGQQdP7xoetj6mecKDQGBbuz1IYPjjrh2iCcS/LnJx/M/QyHGohHOHVPrj417kg1aFAUImYUzK/RoR5f2blhiCaH8dc6Zued4OSw85kApygjZwUFS9C2oPTEo00uhMAUyUX2aUZ5nIBPGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8QWZdi69DZL4LG2LxpkbTX5Zx1ziJH3LNi30FqcE38=;
 b=C6No2bnuz6joZE2vZoVOfgOUDo3PRrmHEUcQrvzINfoAOrq8oZr0SPELPhkSRgHKhkOjlgphlvfE/xxRYoOyW/ci7TKRJVfgPChyhHRda1gltDtkBK90rCz5jps02cpU+mLxwU+UqJldzsXJ9z7FKdL9Ch8MQN39RnXzoTAR178hh08c62wdO56jHnGFJqKo80Kb55ioZAf1YC62djLYgeFJ0rBl55Gt3daz9LCecL1YTVKAH2fqay/QmgykEa2eMBviVJN+yjoB7UmpN8TXyxlGKx+f/w66qwt7cwNHtlzft0u/TaooG5YfQLfuk35Flic2qDhrNbwgNy9nVzbdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Fri, 26 May
 2023 01:18:02 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d%4]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 01:18:01 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.1)
Thread-Index: AQHZiqjD65yCQ2LAJUGAXgzuf6yK6a9ryfiA
Date: Fri, 26 May 2023 01:18:01 +0000
Message-ID: <BY5PR11MB41527BC737B6D26DC63AF562A1479@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101883651a427-23e1e997-8226-40f6-918a-0e48838ecd82-000000@us-west-2.amazonses.com>
In-Reply-To: <010101883651a427-23e1e997-8226-40f6-918a-0e48838ecd82-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA3PR11MB7979:EE_
x-ms-office365-filtering-correlation-id: b621f25f-4de4-4320-4ba8-08db5d870caf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KCkcKbywpeOUYUvm7tDgkW3/3bFYVZl80pTb9fpN5mBuplUHWwxAcXReBlm0Qzd+yCPpTzUPGOWmPlQyD8XhTSsVCeOvJ7dpIGWEARi6nnuflwFYMYwISaLYOw456JQFeuiULKn3phRrdQjVfVTS9uGYkHRnBl0SIU5c1qkZZnm0ZNA+z6wshfhCjaw/Cjrm6QuE76slJa8aBT/Ph/Mykiz27XIzqgKg2PzZHC21f/tTBi/L50h/+vqarHTvP5nQ/UHlX65Ogp6pvWi/cwivT8EkWUDMZ6RbwECHEwCR2+VGT+pvbZcCLtS1ihLT4KVRqxHS9uX5amyf79k7xsyz+d2+SD51MdYEZkmDUY6pE8bD/Yn36onO3fQNzlkzqJchYUl/QalZuOs61hezHQ5BxzzpVl7Yf6PCnXVcfWfSljf0Czy7mzUdORspLY4rTZXZgaLTWfH2inwXyH+rTiKVCATFPK0U8u1paAJb21K1lxoIZLEkVRPuUa+l3PO6Khh4242cy73r4AD8vpFHPotJVO4ycswtK2NJ5yhDXuzHFmnGrNK6GW/MuCK2J0nC2KIc7e2IZ4F3Uc1F2w0nhUjTqkVy4PH/Zuuvp5yN3mbYTVrtLd92LITSpGfFQcVIyJ4iRnQ3E6QOlJvrJ7cJfV7s+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(66899021)(7696005)(33656002)(71200400001)(122000001)(2906002)(82960400001)(55016003)(15650500001)(8936002)(66476007)(66446008)(66946007)(64756008)(8676002)(66556008)(41300700001)(38070700005)(76116006)(38100700002)(5660300002)(52536014)(316002)(966005)(478600001)(110136005)(186003)(53546011)(9686003)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k9lbJtXaREcozEpsJtP8I+YPJAh3tEjuU1jJ36fGepFZaMpOgxYx8R0FJs9J?=
 =?us-ascii?Q?usCq42UDtFPgqRtCdKkjiM9Khz9VYs+s8xHqiZbkf9oQ7a9r4+oyNZzjbeTa?=
 =?us-ascii?Q?Nmx6sZw7rmLB5TY0jVHaKvgZ33KJ4gIg8fg0JxPiTg3nYIrgKleyD7tJ7N1T?=
 =?us-ascii?Q?MuALUjfFUBNSGGoxiklGJrCPIbDRkdnnGyo3tKArKy2XYYzdqh6fGWPuTKej?=
 =?us-ascii?Q?tZN5HF0t3jR3bJ6jpv3hs1O8kC0GryGBXYiDBjmnKHXsNkVN5naKTtNvKbbo?=
 =?us-ascii?Q?5s37JfPFtB7gI0wTh6WRPdvYncj2JuEEIqRWDjGDfVRlL5h39yJqDC4S0kM2?=
 =?us-ascii?Q?6sL5ttNYd+PRzg8D7cZyH3ensu0BuC99S3Dh09DCA8weJnXd37e879J7tb2l?=
 =?us-ascii?Q?9whFIJRr3d5lbTp9aDX5hqDHNwrSRb5qKOdquHFYBkPzQdw/dRJKeeFQvCqC?=
 =?us-ascii?Q?lzZRXC0u1cB1RbOaVGahYuDhZuoF6Qm9cLQmom/h7RIxbKgvjTCVD31sh3ZQ?=
 =?us-ascii?Q?W0NyQqlDvpSmQLZnWgOEjywn0Jf4rCKtKM1ic2FsqWcX3giaxMTBJDyXCNDD?=
 =?us-ascii?Q?vRCAMDPasd1pB618S7ytCphp889mNRy2FTPvX2U4MlP05UaXrLgiIQAG71F2?=
 =?us-ascii?Q?JVmqQiuyly26R/7VHRfB5+dVGGIQhmUtM5drCe2j43tgWN98A/qBoANy+4JH?=
 =?us-ascii?Q?awH2I5qZ1RiZTl/BPgAbbGrtv/te0w388uMSxNjNB+QdUDVQuIX7Y2LexI8+?=
 =?us-ascii?Q?3YbXDIFx8ZG1rSKSoicTlAAA+/Ql62s1yO+CSZzoRxtl3yEVu6k4hmcS/KCV?=
 =?us-ascii?Q?yecbBKhbKKZaNIkOo+U9Gmw1xKUg+TAtRnEQO9jx5lA7Ee1qdqiJc/aC6nLL?=
 =?us-ascii?Q?OEmaksp8EkmeBU+E5VVHW+/wg02AU9k5+mqvbTvUeqTqGAWHkltAKgyyR+w0?=
 =?us-ascii?Q?fvkwY8jMfAn3D4F8B/5lf96aESVbj+kdj1XXRd6WhL5SlB25Fcj8Ob9NF1JQ?=
 =?us-ascii?Q?OgxkixIUWqU/dZ2ZPqJAxrgWXPCXXJSxrfapYAuihWrS7uXWB9SzEYtLbsgQ?=
 =?us-ascii?Q?3ubdh8v/QnT4B2K/mtSB6KfCpkTh24e85iXNmoaFoChrs1jiGRf77PoCBqqw?=
 =?us-ascii?Q?047ZUtSt+RtUCg4q0YbnBTzvj563eDYFfIRLhPdTibjwBJKDki/hQt5rjyRd?=
 =?us-ascii?Q?koQZLqrisGjqwJUl9oCgkCd0dBnq/G4W3mwjESkqf+60YMsQybvF9+N6ryvS?=
 =?us-ascii?Q?3bZPAKKdosGH7Sx12/aTpubc2DlqbcgUxygpGaYVKlKBWbIrehe9tOvi4xkl?=
 =?us-ascii?Q?NbHGNkFQW6dBlk3zGn699aZIh9I32RpKxllwhsL0xMLbGG9SVJf2VcRtT5jI?=
 =?us-ascii?Q?7bVms1sS9C4EAlPsv3Zhq/mCbyOX7eijaTxOYgxvHMS5vmdFZEESGuDpW/jy?=
 =?us-ascii?Q?t8TxB0dQdmNZUHDoF3vnrvKgQREiLX+3exdabtPIpuuwn0IdjohqxXPgimMQ?=
 =?us-ascii?Q?6gcx406rfKUu1iiqdJxA8h+2BY2KleoHakqrVMM/rwA0BZkQz4gLai9pm98l?=
 =?us-ascii?Q?ki4B9kocSsVAUV1nCAmgrVIxVSFzCX/uKlJoJ5/7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b621f25f-4de4-4320-4ba8-08db5d870caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 01:18:01.7230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AYpPQNBbw5BslhD2Fedxn0/Np/VeXpfrazo7MvONC3olFRG937Wx+KO64o9Xf88JJE1dao1+Im+2U3/55i+9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 01:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181730

Hi All,
=20
QA for yocto-4.2.1.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Saturday, May 20, 2023 7:22 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.1) was completed on the autobuilder=
 and
> is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 68509775774d9cf304e2b422927f2a9636525155
> meta-aws: 98efcdaf375df31c53d0f8d28240a079dae7b4d9
> meta-intel: a0ea4e5d395579e70f1057f1f1222c8a2b55bd96
> meta-mingw: cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e
> meta-openembedded: 54b177f4acb3048d21a68f180fc183d0fdf47a94
> meta-virtualization: 1e338cbfd80dc34f90f13f92fba2e810f6858ed6
> oecore: 20cd64812d286c920bd766145ab1cd968e72667e
> poky: c5c69f78fc7ce4ba361363c14352e4264ce7813f
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
> View/Reply Online (#260): https://lists.yoctoproject.org/g/qa-build-
> notification/message/260
> Mute This Topic: https://lists.yoctoproject.org/mt/99022866/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


