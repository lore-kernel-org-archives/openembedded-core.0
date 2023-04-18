Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EF3C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 04:29:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.880.1681792159369037399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 21:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=mZ/HgE+O;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681792159; x=1713328159;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SSO4AAwlo5jusJCKZyauDZ1eYXAleoNDeGcqWcc8dMA=;
  b=mZ/HgE+OkrQEqsg6JKd2b+Zmsap51PAX2p7g/3t2LNwCjtlddcW5IGbQ
   rUg33dl7V36LtY/VN/f9K1nafkUoKkQY4yhZ1YYGDa1nCfz6Y9+L0LcS0
   8j/tgqF3bsb9VF8GNa4+ldo8zP2gA3Wg1K/5qBQsd7cGdGSru288tPoRK
   7CbOp6gN8nslnZnXPxND0cUvtZ2X2xXb9J4AnuTJuZTI8pTyx7V4SQT8K
   serHjM3kExNDuSKWFdSACmfejSgST47CZum7V0Zgp4T2gcqXkhVDO+mbV
   wX63gKe4fOftQAaQUzgdN52+bdqmyM8nq9JtW4wUMx0gJyOQRHNAKEdQL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="342565594"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="342565594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 21:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760219519"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="760219519"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2023 21:29:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 21:29:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 21:29:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 21:29:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 21:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVZivbwv6hLlOonE2tDJXoMtCRArW9eeLvJIswaeKQUv3eMcgEy1uY6jThrBHKI7+adF5jdyxgEDRn4yrgToCrmv56ZQpWWcy5JHIL1CddqgZjXL1a02S9vX6l5obU6GrvExA9hLlahAMMAhZ4pEgbPdR+hD7EOVJVxw56fjEQfzVL/9wVm2nBXl8kSdvTj4J+8SKMzu20NIFbJ1rCurdQlEWJXtSD8ktQ1m/zb5duWrziECa3MAVqAqr80d3bdDGkPEueCvDHEopEWHMhMVvdk9htf2vEUX7EtTq7BD+YjEb8QO6Vxukkkv4TjfHy3Cijgk1S5C3paLQj1Z4xLquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klIqfkTNluHIz0mlIhgiYxU4bVZSOZlKoZzGjM3PDYw=;
 b=DyegxdBlCzYDcqq3nFhW35WKQaTT4rBh9CbNFgpfdT+9yNZFOWhmSjXOBKd0r640nsBneYTZENXwAszM6g3o77QpLkkZKXNTTZBOLTaG6zG5K4weBpyrNLFLQQsw2M69Hz6S4fM1tIKe0EVvzQ7VrnjyZ+dvK29d9Maox5D4Us2oWkYnAqT9akqDReLSQxxSALtwbKFM3Cpwu+5It/1X4oJLF5F8JryoCmcGoukrIqtbQyJPnHtXMHnPdvvzISs5tFdZxneKP5sXGvoOH1hKeqMvppRrpBiA1yYFZzrcEd0cgyccXXaIuaoNMNAWAW/Z0wWFHM1SgihED7HRTPl+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 04:29:16 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 04:29:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.9.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.9.rc1)
Thread-Index: AQHZbY95r7KNq6lyIUic2qx9gQnmsa8wgV3w
Date: Tue, 18 Apr 2023 04:29:16 +0000
Message-ID: <BY5PR11MB4152902AC610E3FA39097BA4A19D9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187779e6a8a-9f7af2b6-6b9f-429d-8340-d75d26017f8d-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187779e6a8a-9f7af2b6-6b9f-429d-8340-d75d26017f8d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ2PR11MB7428:EE_
x-ms-office365-filtering-correlation-id: 90c8d67d-4b29-4045-80a7-08db3fc5788a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njbd3xuBsHbRIEZT9Ud3lD9rJ1EaHtapt1N84rx4j9KxVYqDoGZDIncKV3FHx9hZKGvrivZFUwJTgGo5IRT0uSiLKKf5+iE1Ma4RYSEh/I2IbxV2aED41VeXLxrz/7iECcq+UJT4+ZJ2EVUsO1F6gGIlDCaRB5J1Zx+g+Qlf9NP5p6B3meTLpI8Z5sKdc5mcpHXhj29NSVrUVLaEIiT0b9/TJwgY5sGRBAZC2Mj6tBl9qoA0Ovf7iccE3VShMMbY+1EflchcR2FupSX75FRNoeCZHs+XJI4IzLCaiek/thBgLSzEj1nP6f6H/PZ6wjKKCFK4JURQxZs8nlUpRbdBHaqTMLqtJViJfE1iY+5L52J7nKiAzpvXO4HI6Alo4QmFmV6hrUkwvWQ1eFF/umqe64d6rVvZG09nGf/iAOBPuIBjYazcBSIzqnGy8i4zq+g1wmX4uGIKzef9WdumJqn+myJf/iNX6pw8iNQSYoJ0k7JLE1L58Styep4z8PiOIWjzgtJhrRezANzQivH0hPXrS8KJ1ryM3UdI5iriOuIldNzN5GQETjj97sQuFFvMcZ5phYu6ipZ3iG0m/ublxkhqIb+KBPaeP33OlR+qd1mpWGBcvkefeOaOAiv007S7tDxnBdTVorOoSDswyYbpHyO4rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(33656002)(76116006)(110136005)(316002)(66446008)(64756008)(66946007)(66556008)(66476007)(966005)(71200400001)(7696005)(478600001)(41300700001)(5660300002)(8676002)(55016003)(8936002)(15650500001)(2906002)(52536014)(38070700005)(86362001)(82960400001)(122000001)(38100700002)(6506007)(9686003)(26005)(186003)(53546011)(83380400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?byO12N5mitxOQlkd0+x32UjdF5CpeAQNEzM6huaRSqG6+3VuujTFaPFVdpXB?=
 =?us-ascii?Q?ttTsr1itw9SLje21ximgxwnVWMhdxT5U/ZmOpAjMM/JXpLBGse4uTAFSj7ID?=
 =?us-ascii?Q?8zzCIT1x2KiofK/d0lJac8wR2yijesk/Cssjxaew4XPAPpHh5zM+CCsspVm1?=
 =?us-ascii?Q?p/GGZhDFwIjj6rH+ffZaFf2EGEpdGqopF0jJHa5PC0CFcM8VJ157R5DR23sA?=
 =?us-ascii?Q?XxwOxBx9Goy0f2LHQ07wwS2n9I0UyGTT7sl/4MYfq8RLZdmGeqFI1yeZKTnL?=
 =?us-ascii?Q?ZSbwJh+8ifzgzCrrNBucWuWJpFmagcsYcrLY4Q8410E3qR4kv/wrXcsFjST/?=
 =?us-ascii?Q?PPz+N0t6KSWXH2AnzqF2p1LXd8k/5SyDUGRVMhCtMzGnKELq7kSJrZDJeLQa?=
 =?us-ascii?Q?RJvJqEOt1KHE7heW/XM8eHUria5UD+bj9X872X+75FXK+M5UcAGzN/jf4FCS?=
 =?us-ascii?Q?XPq/629QAhYibrBOhgbYGmLfc+CSADG5NhUCTUOQnx6ho8nKJu6jZFrKzd20?=
 =?us-ascii?Q?lJuOiYtRsEqJFAnCkEg1zr2jKKMye8+Qc9FIaku6Vk/bzFCckkrfMXneli/d?=
 =?us-ascii?Q?rPO79vGAbjWrWEl/MVThYYHWfCWNLPGCzbb1f/t6mziuDhzDoekzFD0pfl+a?=
 =?us-ascii?Q?xZwk6gg7Zk0qzh9nXdbC1czbmuI5GmV7GidR3y4Cfckq3f6FcHtExI2xgls4?=
 =?us-ascii?Q?+byqNNPKgmJlpJxCi87gbNw3OAknMTDXf51PfzYeOXTd0hQffcW5Y63CtyOd?=
 =?us-ascii?Q?XbE/p7F5DvEfeuqgKkgZRb4PFudFZyhSu88nDQ9e8gX2uULFKNAqN19eHfCo?=
 =?us-ascii?Q?JsDN1vNyrKmu/6K5shwKMTSa825KFhojMnJ1P/YEywUnN3BMVqvVkVyBY0dc?=
 =?us-ascii?Q?DxTwJiTXEc9gv9YhaNlT5BZ8uEaZlRsJH3tUM9Pgk8jhgVh6kQd6VRQIRUvO?=
 =?us-ascii?Q?tuZ2YVaXk1iHDhNi+ybNNFZhjBTEtUmHZEV39CECu+pFakbAKf6DyigcRRcw?=
 =?us-ascii?Q?e4Yg32h95XGwmx1MgQrsY80AntqUBLaY8ZfQibbhlL4kad86lKmHONXyupz6?=
 =?us-ascii?Q?/wfU2dOgyAc+A3ieg+EY43qvKVL6XT87UWCnGQ8EsE9dBO1kUAUOEWiI7R2m?=
 =?us-ascii?Q?v8FoNMkwlIay22YD/LrQOidF8BVA4AiJEB3aLZjYum67oPyUau7PLiNKdWQn?=
 =?us-ascii?Q?tOxyspV3rrBg7JHWcNoWbZgTI7ReYvWFqWT1eNSa6kaGOFPi5lxr8ZFcB6KA?=
 =?us-ascii?Q?KBIGurNEQMqYERpNu9xqwSkhlACUx5g6mHwL2hCDnOQNpxqRvcSxLRtXhhJY?=
 =?us-ascii?Q?daykroaQSmBn8+oGboTXhlawfpF3+q0PRqLtJo5qqZSPz6DafTnNEEsOF73D?=
 =?us-ascii?Q?V6+ldgZHyvCoaS/mtEa2c+ZHzctm9PDt4V9fyfZJa7FlnFf8y2cdzY9s4ei5?=
 =?us-ascii?Q?wxlu1gMMZdnUKOAHFF4h9xuCEl/o+F3bsbWNJY1V4BaiEYzvFNKMhL49Hzaw?=
 =?us-ascii?Q?Y5VcLsCLpEvMxXSKU9JQoJX1f3SUdim9ZS5kBseyYHPNkSb7TgiGla2znNGc?=
 =?us-ascii?Q?oNBnT4tg+XDpAg5zYiiY7s5KRskzWmY04ICn/OYC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c8d67d-4b29-4045-80a7-08db3fc5788a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 04:29:16.6055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0a7P3MWjFsPxX2E/9PY6GNeBsAQiwEEb7RvVeKnbihIDA9r4D7gF981+eP3qXsIRQQtvILWOsGoGxSgvoIn3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 04:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180176

Hi All,
=20
QA for yocto-4.0.9.rc1 is completed. This is the full report for this relea=
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
> Sent: Thursday, April 13, 2023 6:38 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.9.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.9.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.9.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 2802adb572eb73a3eb2725a74a9bbdaafc543fa7
> meta-agl: 535bc8f54ce5fcb4a94204df5f2b3317beb53f23
> meta-arm: a0216a41bde3f191037332a9238648bedfbc61bd
> meta-aws: 3f7ab5912239d667764e7df885776b267eddf265
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 4c6cc14669d0e9de36e1a050ce4084ca14181722
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 571e36e20e9d1f27af0eb4545291beeb64f280e2
> meta-virtualization: bfa6727718bc4eb550c24e2c03a4118b4e7bc842
> oecore: ff4b57ffff903a93b710284c7c7f916ddd74712f
> poky: 09def309f91929f47c6cce386016ccb777bd2cfc
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
> View/Reply Online (#243): https://lists.yoctoproject.org/g/qa-build-
> notification/message/243
> Mute This Topic: https://lists.yoctoproject.org/mt/98230059/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


