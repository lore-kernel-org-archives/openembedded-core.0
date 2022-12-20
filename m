Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117B9C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 08:49:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.45963.1671526176624390169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 00:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Igl7fwvz;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671526176; x=1703062176;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7QPWTPCZC7M7pGEtts7lV2RI9kOLx0t88/834eCn47o=;
  b=Igl7fwvzM3XyXmQ/gK/CKyXV1sJVcyLimLt7MPmKq1qE4ib2ptKwDRkG
   VUV/jKaXnAhxaBgimrxlOuQN9oMpfZNOIJhVGmRVvklRAntRsaW22rt3N
   nOG8IbmpOdIWZfRs3pIR+0h3TTtsN9QKrmUgABgyIORI8PC/qZEqB4+X9
   Hf0krlilm/5pL1WtqBoJ/ur1gcHmwqVwD5s1VusDAOKU4U94GyXbTjUjD
   w2iCHmAsCrhjJzMzr9H4HkzW4PsQ1r2of16voOLowzEhOZOENNN7t3dS4
   J4jBgC6D7+I7YOy50J4QikYzD/8IMmXh+lHSXktKS8IrvEBgLpxv4LSvW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299239033"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299239033"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 00:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="757992618"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="757992618"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2022 00:49:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 00:49:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 20 Dec 2022 00:49:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 20 Dec 2022 00:49:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acpBkKN0sNwFLZj2iGm3ilhFNLwNgTd6JEK5PghxvYqSicW+Cy8m5hgnjI6g7FuTzt/MP2ydnkpbtIARsGlTiFCxEEvWH667OoUamkJW8L0LJITxLRMoeIbqTCy032U2wKShykAfFa4mfK7S7rqqIncgRNT47fvZfmbAZCZ3MRiOZpRbSjWQgGoESAtAZ+TlRbwemlqR5yoh0dm3wnIwJyZS+vxXC0ksBU4CbzeDcNNScoZXsF5Zvv4XrBszG9rd1LaM4iCDOMA3QXGvacGeLiugGQXPvcPw9/uChfqKFqA+cSS2Yqlxd6+hDTyyHS/AQbefZIAkSZE+SF6qArlJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDSvWEYZRLJcj3QlMdanArGkL6N5ofi751QHEcMHWWs=;
 b=HSILFc1p5/GmRepLbxHtkz3A1lvjiUtVzxViMPPdqJGDq+5UEPQLu8lqyP0ZfX7TobTMHyhtV+s3LJOkd5BytMyFXeS6qwmxpne3UmZppX6vHmLB7jh8b3ZzJInUoRPMA8HvBFWDKrJQPlb10ZfyfhG3VA84Fh9fDhNpXWbRVs/MxHa2L0QIhoohsFRJb/ouJihm3AFzFb7xNfAm6hszkV/yHB8ivvTMfYuJkYAI5gt3+kA4tkg9jkwrGcavLOblbRZ//jsaJSctY7/DaXG3a2PO7sAIBE0j6JpbbNE5HtKfIkoZJI8NDR7voS27UcTZNWSbxlf3zpyY638ljeueXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:49:29 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:49:29 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.6.rc1)
Thread-Index: AQHZD0hkEl11XS3XMkCseMyMTIOpja52gOAA
Date: Tue, 20 Dec 2022 08:49:28 +0000
Message-ID: <BY5PR11MB4152FEA4E8AADA64D776B1AAA1EA9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101850dc2bb84-1a5e1940-c1ed-4638-9517-f86ee55e6b5d-000000@us-west-2.amazonses.com>
In-Reply-To: <010101850dc2bb84-1a5e1940-c1ed-4638-9517-f86ee55e6b5d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM6PR11MB4676:EE_
x-ms-office365-filtering-correlation-id: 02758fe9-65f2-44b4-a31c-08dae2671b11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8PH0w0KgE6o6wZ14aYlBiI0smmopw+aN4dsjyA4DEMoYXbu1P1CuJVyQUUb/4IKm+7AU88lww3apH4f4JuB11SFu7XoJ+ZqrgARJSaNjyKzUY30ZoKRzX1UTAtVu3XUStwv6onUBVMfLDkLh2M+IAotN84pwlcOHOZqbFqGmMUkBa2k1j+XoA/MyeOf6RPuIpkNHomLXsGqtr8203UbBpBxjfPDfXtPnCgd74uYjw2NWRhr/W3WczafnxqdfIavejwZfHYMyZwINMl3bcqYpYKvepiZwJQXYwrD4G/YHPPPWJ80+b7mxvnT0RXueadi9pynAbiVS/HqkZN6sgXMqHvW8/MxCPlblM7hNDEmwP82R2EO5Ch6IoWoTIAoDjnwH6DAE0VoFCzfdsc74jx9rQlBGcxPJ1f/1hHcKLEn2Vyz44a3wGGfIlGoWI5WnBaAiR8WZkBOPLYAYy9K1vuPA1Cr9LqpxC7cKHO7HwDhnNfzuYWSeMZavtg+snO7GbG2L1ThXfd9cd+fDGW/GlzQ/pQVP0sBns4/eiZ/dMrgLucuuLGIt8QbnaYcJ05al9coeW5cV/7l5KhlaWrCAzCvUzs4e/ELqbdgmK6oBXBIJojWMrWKrcc9JbAFJYlO6M/rOeHtp0IJm33/CO1GC9Jn9d2voMt7XCbet+DB5lVtCZPvOMFp1vGQ+0EEhSaFkK8eAuNAjEgmx9yMSxKJMCDYdp0tss83AATVf0UPHjO/AHjNzQ0StdmTdnjvp3QBjDk9D61HrAJIKYXKsQKM9v+yqbgDsQhtupSSavmtIeaiHSc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(83380400001)(86362001)(55016003)(33656002)(122000001)(66899015)(38070700005)(82960400001)(38100700002)(8936002)(316002)(52536014)(66446008)(66946007)(2906002)(110136005)(64756008)(76116006)(66556008)(66476007)(5660300002)(8676002)(186003)(9686003)(7696005)(41300700001)(6506007)(26005)(53546011)(15650500001)(478600001)(966005)(71200400001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?63a+MS0MFS83T3d6xnHuEPU9HsNEh1hVYo8zC1Jw10exjH1nij4dJO6ZJQBY?=
 =?us-ascii?Q?Nz2ZgFl75TBAy9pHeLt2vca2ME6mVnJvjMr7mZrGVn1e1HIVfiaUzj81UWtR?=
 =?us-ascii?Q?n2M0d8z2MJGw3eC08giHqNEgBqs6xE0kSLgiZFyltcHfuVdj12XbBT/ES662?=
 =?us-ascii?Q?Pw94fBy8XwG1S1QUSGs7Wd6VVop2+MYTW9HemvGSQFtO1CFap7k0NPDeVKQE?=
 =?us-ascii?Q?j+Y0LrV5N9jZROtMunEMXw5c5W0a5S9I904DfFhyHSSplgQS7aUt2Vdwu+LB?=
 =?us-ascii?Q?6aviWq/lzq+FnwM8Lmj+F38pQ1l8zJslqgtOkKTMB69HHVGsTWecsbfQKi6Y?=
 =?us-ascii?Q?3f2NM2r9OIFag1uTmQ5s+25Rv30N3cOQVj81+C6MzqfQY2yrHrWBFMu3bIym?=
 =?us-ascii?Q?ElknsWBoMk7Zq0oN9PIerOMBbHaKdSrdSXIc6eQRbREuDpDfY5riJZtfijJV?=
 =?us-ascii?Q?4vonBy+vaQlgsCtGLXmpGBix7iEfJlWJB8/1aHD7VRHlH0JB2kKy11cflPY7?=
 =?us-ascii?Q?6UddH5pg4DP22hncmCzmR2ylXTYqLazSfbJxk+gXC9zMbI/B/PR0ull/fWOh?=
 =?us-ascii?Q?Z5ENSmgQQbjLaHjzW5mlL6XglXBV2aZIaHBLDr6s9QpPl2o3ShnV/ZA8FdUX?=
 =?us-ascii?Q?ZwAbCsmEjAPPMV6OsKRJi3fUaWzatcFgNpSPO00Yd+QN6T+8J72rXRLhQSPK?=
 =?us-ascii?Q?X60+/4dhSGfwddDtEV0UvPEnWUSJUC5hdZRoFBSdYGWAiISOdArx1NAlKeKi?=
 =?us-ascii?Q?1mMExw4mE4q5dAJdXhOTqFpfV4jk5Zd7u15QWxMYFGLWT96QdX0EkLhBKbUF?=
 =?us-ascii?Q?PJuMjUbhOV7bcpvRCkG5bJ3wbfdnVPmf6Ezzx4cm/qiuHePnQrpoFylKBqOn?=
 =?us-ascii?Q?sAlYf/1gUzzXjDk5faz0bE8lzY5ff/442gHvNNNb/kjLflyn8Y9H5gkz3QQU?=
 =?us-ascii?Q?f6syoYHA2Bo1zl5E2KWONJcS8nPATUsvo8qXuyxD17h27KSHOt4hR9OLbwB+?=
 =?us-ascii?Q?uz2tVUV+4OzjkAI+vBwobeDDxvU+iYaU1aS7u57Deeb5wtYTK4gUmhFmHmX8?=
 =?us-ascii?Q?S3RneLA3w5fiZS+r48Ix/EBeHWvbOTXvYy1cLO7b5zf2di8qUCfNAY5WLcDU?=
 =?us-ascii?Q?EwRUd+v3DyFh2m8zcmFDOQU8wjUQFA4mu6Cyth2ijaiXksZHF998RWiyWSBk?=
 =?us-ascii?Q?r8TCOFaGkwvTriXwWirkkYUzM5vg/vxi2aJHAEPZe+6f9iShL5fQP8I4YXt+?=
 =?us-ascii?Q?eOoEVpyG01HNAymysHGYgcCEXHatjy6LaXGpAsqBkFn8BeWds099qvhAS3Jo?=
 =?us-ascii?Q?sgqp4rKQkxS4PKGFYCBjeP56yy9vB1ibGauo4XGgoLwOGMKlkpxrkNiw9OVk?=
 =?us-ascii?Q?/7/s5p03nrfCL737v5mpr47a6AtGVfqk4bI/Mh2orcTY5Z3gg215xujPwUvc?=
 =?us-ascii?Q?GxW3NMj8W2IeTJzyykriB8p0WPOFKNO/mLpgZuL9vR/lzLZShJ+wx/zqTO8E?=
 =?us-ascii?Q?LCXQrCs1KI1qGxfYXzY/hqlRAjmPiDEg8Zy5iHvr18mVZZevlNM6rzQN/rbz?=
 =?us-ascii?Q?DSSJuwjJDKqEqcvostQf5FD229rWDnOMXsNFWyhf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02758fe9-65f2-44b4-a31c-08dae2671b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 08:49:28.9683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5W7gXYW41NZOgY9kyfUBLHjvlVW9d9UzUn+HXI0hWSe06SQVN43MsSDAzYzjVeUfg+YCd4GFxjy0mP/rwIrHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 08:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174844

Hi All,
=20
QA for yocto-4.0.6.rc1 is completed. This is the full report for this relea=
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
> Sent: Wednesday, 14 December, 2022 7:12 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.6.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 7e268c107bb0240d583d2c34e24a71e373382509
> meta-agl: 5e3a4f5fa0e9adeae54a2a47d1daa80c64c7363a
> meta-arm: 67578fcfcd8ee8efcaef67ed7db1dfd55105872e
> meta-aws: 09db18354cfe358e38913754d24b71685f2a3ed3
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f529e0594a784546926e89ce8e78385e00d0b0a9
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79
> meta-virtualization: a0d0f4ff48f874703d9e24a5d969d816b524c8b8
> oecore: 45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2
> poky: c4e08719a782fd4119eaf643907b80cebf57f88f
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
> View/Reply Online (#204): https://lists.yoctoproject.org/g/qa-build-
> notification/message/204
> Mute This Topic: https://lists.yoctoproject.org/mt/95656394/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


