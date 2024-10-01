Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221A7CEB2D9
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 01:54:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.71666.1727747670717071978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 18:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gjt3yAxK;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727747671; x=1759283671;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2j1RLtVAhMIT4Gh2c7DKW80YFllUii6bt9dTaL8WcL8=;
  b=gjt3yAxKe/JiexENfz6+rAPzmXwA+HwdaJv3sDAOwbqfE7cpYMtrELJq
   jKlt2zk52DeEE68cTl6xBGqJET3lsmVkLmYpEVyCxidUKveOwWAt5vs8w
   xabvzCp8WWXqnqTAH2jJh4ZPZNALuStPf54DA3l3dP7VCKdNrKDaQmIa2
   7o5zC8MJXe2WxUoenSFQoO9CYn6bIEM0T5kdc8epiEnULtEBLPfQopHa1
   acIHDjRDkXMKvSTBScdgTkgLJqFDNiiJH2KUv2ATIslgQycjueIHZcR7s
   yY28h1G68YakHzGLAN33KJDQxjAGh4FI1/Bl+t6D6tBN9ZiL1Plsb7t5Z
   g==;
X-CSE-ConnectionGUID: ecjFNWsiRnyQwtV03Mj/1Q==
X-CSE-MsgGUID: mT9uXj5uT2ywHxHOmOEviQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37448109"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37448109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 18:54:30 -0700
X-CSE-ConnectionGUID: WlJ3CfsuQquaeGUIvuxzeg==
X-CSE-MsgGUID: pO81CuAwRz6E/pi6pN3g/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73758934"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Sep 2024 18:54:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 18:54:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 18:54:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 18:54:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 18:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3uQ1f6I28ZX9xuAzIs8e/WZk18ShG5vOKfQQ7dHjfvp+z/zvlrBRP650jExSwfbFXBAht0ZYnSGnsQGWIhdoRkPQ3bGpURSw6ct2D1IOPsheiuwE6/ga8GwSZLhyLp9c4aGjQ3GrVq2xUvYRTuAbuS01hgE85yRL95LPiG68cEM4IRFynT393euhbJrW8HHOnHWSRGIgTkGyCZM8P6HJpPYL01UaAr924/f8svW3xw7JG5AURbi51OnQcDqUMg28dd3E5sdxpwldRpJyrOlG1hCQzsD2nnDyRUzjKm9EOUGkfoUY5m/qN3Ac9ur/QhCtmq/TRvln5ec6uBacwnncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfkl+lqvcQtGmY5gPdC0nsDk2C25vyPN/MszuQBZVOc=;
 b=HEE9Edrxyt3pyfMTIclZL/Oe4hjN5NFqmpsWDA5nMU8U6WCdL1lk2cgTe/zhcgG99d9G6tP6qe0uLoiWmc62Q44oKXSRZWGo17VPADXs4STNBmRvUzAqX+rtd79yZqVTGL3MYUfOodv/qKmr2gO4kMQqlc7Rk3/UwFcsUqxH7dFPpETGP25OHOUmZTllYvSdExgwPNWa9B4N/obTL6Me6Y1n52dN3mZlb/88UwITSNL2nePL1ZC+zMJ3u294YXSlnnbe8lYkrTMXCkz2Ce6wm0El54B2zL5gs2wXmWsNVB2s4pLvUwoLx5IkEEMAB5FBKZIkQe4A3M3sCLnt1SjgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:54:25 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:54:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.4.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.4.rc3)
Thread-Index: AQHbEGPIxLAcA7K9r06kbfAQ8OfHz7JxJ5iw
Date: Tue, 1 Oct 2024 01:54:25 +0000
Message-ID: <DM4PR11MB7760D12B0DC040F34C08ABA9A1772@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019230758073-d0f599c5-884b-48cd-bed3-7ed67d2ec5b0-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019230758073-d0f599c5-884b-48cd-bed3-7ed67d2ec5b0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB4796:EE_
x-ms-office365-filtering-correlation-id: 59b0753a-a999-4f70-bd92-08dce1bbfa72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rezaO7NmLb9fwwohfLkFmRTtIRSQv929twclrdRWgPbz4qutUd6ABfBbhkbE?=
 =?us-ascii?Q?QNgRg+tSg6g0R0tGdefSdHaAWDpoMULwvVUYq1bsavruY2iv1YYc//kIr3i+?=
 =?us-ascii?Q?AuoKIJ6G8LaoveT7a0Fqyrg53V9UJewEc3IpZPn/uq9sALv7pTNKibAVG+b4?=
 =?us-ascii?Q?pybHZMUPMsau5BeESH9j3p3N8DMbQC2POnDjZqSDkuudFJFCuo34nkKWh4mZ?=
 =?us-ascii?Q?Tpdk5vJYcJYWVz04FFqPWnKDec1v43hDipfKb+PzbxFI/kNp12IHdf7O9oqu?=
 =?us-ascii?Q?1rYFxoAPNtb+xmKkNpM6ctJZPuzWvc4tEKZuJxlrjUIklkL9dUB+QP2hpjYa?=
 =?us-ascii?Q?Q4haC+y9nzKzfdqeGCCwNsBhpSfDq1VtWGVQyvhCa3mkG+6RtJhpuZ5jf3yC?=
 =?us-ascii?Q?VEkLgeNFi2uxVBf9iShkl5PdLte8PRgm1gFUetyHbwFkZC83DVASGyzMvnf5?=
 =?us-ascii?Q?HNWQDpZvel1twiFq3UlGUpYzYWC5sWeecd4KM1hJlmWVIoI2p/WpQRq0C2JZ?=
 =?us-ascii?Q?MyemQSc+0zhUNlcZ49E6gaHpDs+gGa/M4R07AXjxGeLNNcjbhSujAVxNKOah?=
 =?us-ascii?Q?+JYPxR+LzHvXqdhLUKi4Gj7ixbXTB5evbGIO/WxEUNmXQTouYSovEx4mY6lC?=
 =?us-ascii?Q?7Dg8h+lTtt5AiGn420fhSN4X7vgZsHlQohcZvnbp4zo5DpTn15dns18eirDC?=
 =?us-ascii?Q?m2TUbFaF+3jJSy5UKUsnYRSsAOqbL3E9PPHf7KK2I0a0/FalXmSJEKrlUl2t?=
 =?us-ascii?Q?04nB8F3Yt755ri4SaSydPSnz0q3kMYSkssj563t3AENptMDayBmRAnAI39NV?=
 =?us-ascii?Q?ps4PluCL4EBCEnI/trXeHj0uSQAimgvCc8ciQwsVsWq3edR7E5omy6yNn3EY?=
 =?us-ascii?Q?y+kZgyYykgSqRJgyYnKMDFFm1VA4W9RpWToK96mgb0PLw/+pRh0dYzxQFK6p?=
 =?us-ascii?Q?sCsbY1lqcS7d9+lzUuNrfxh/pFnf6sduE2bhm4N47pvPQ2hsdE4QiTZ20Deq?=
 =?us-ascii?Q?NcvmdZ5vltd2798TzO1WNJ/wsO7wXjY1uEUMMg3rpkeIkBr+TNE7y0CCJ/C2?=
 =?us-ascii?Q?HNBUaC4F9ck4TlkseYIw6HurTLa9Y2tMPXiNDklVv5rFacCjYdJnUML5R/xQ?=
 =?us-ascii?Q?Hn8Czx3WVwMEJgujF63Sc3AN5Ha4MEAknAanMgs8Vk6XUe983V0NX1++JMzn?=
 =?us-ascii?Q?noJ1mWog7Ug1wCNVUFazfpaPcnem25E6IWOSgTxKlTl6xHgbP2Ld7U1EZ9GC?=
 =?us-ascii?Q?ypVPbsG8H2R54DY4PFG2A1iB/lb1f/AlSwKzo4Cf1N+IS/zBU0Tobm1YCFPW?=
 =?us-ascii?Q?f+Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zhrOyZy+xTsV3ODC/8asy/virmZ8vvquLnc5MUkFAL/aPu5++nTDZZBD0UTk?=
 =?us-ascii?Q?ej6ZO9Q1L/8vk4/o5Gfq3MYtEhztkBQp6iNct0wSCE6y8XuLE17q+7ffVL4X?=
 =?us-ascii?Q?qhImdOK2nTbRiSo8SEN3OE3um6d/2Xk1qOhcaG3RBabbhGET6FoxPyiYRfxB?=
 =?us-ascii?Q?yPQ/GZEUNZ5R0jTg9FNnC0FCdhg0kOOKqh/98ddNYXjNDfIlIN7+eXoeGMDI?=
 =?us-ascii?Q?10UYAg7ysAmuqIR6djhoYW/yU0/spfYhW3hQJvXTu05ToGTlk6uwMCZrIg5R?=
 =?us-ascii?Q?aO37oGVzmNY/WFL/gryQl3avqGZ21C+dsUD0OPRIOMfYlsz94syWT1KUBtpy?=
 =?us-ascii?Q?krkJhxHPj8W0ocGzxxKFxSzdOdR7u4IbQibpgVo423cFmoGLBkxG4veSayFd?=
 =?us-ascii?Q?cuJ6iXW1TywY0ZM/g6C61ntad+h1VRXPI09j5d0rIKJjlly7fDkjBymXx9vM?=
 =?us-ascii?Q?5exOFl7EuBS13/x0+pZfrjzFweO9s91FhefyKRrCNfBjsCINAgiYDe/TNdOI?=
 =?us-ascii?Q?oPLS30JB7HRWbJuwSEl/97RRRjFtaorfxIBFP7r3oHVNDHkA2NG2Qfq5MRRF?=
 =?us-ascii?Q?/jTrhSZXxOcPfHo926w9MggZvkCGFa+P1tV0E8fg5eBh5yGx0DRVsSzWy9G+?=
 =?us-ascii?Q?OUa+WkElDVMnBEhLnF8hnnssAQy9QANvnKEw0hsMgieorfB8AKJUgLZ24HhR?=
 =?us-ascii?Q?4uF+8ozHnjqvUsXoDi5I0hJmcVTXc0WftON2txP/+xJN/dHwFCBUTJrTpdN2?=
 =?us-ascii?Q?VF87QAhGvjV8/G/OORfI1gwM50Jc9Z5Ys7HXPtJgifyHNveKybzh0xblCbQm?=
 =?us-ascii?Q?Rsh2wbcJAASfksFcdnxMnnliF/WYCFqkYf5j4INl09+ivhzFKqHiZUrja98E?=
 =?us-ascii?Q?POmUEeJXD99rhex1OdYDz6f0zkUMz0Utbfr1qNrUojQPvDea+GdWtV0Tir9a?=
 =?us-ascii?Q?vDZDQNK1uXhk1PLvN3UAss9OFgQyntAoAwKMpyLnKkMy8ah9t5MhmJ0z9VT+?=
 =?us-ascii?Q?875r2XCPdpiGpH6Ta0Jc7I9e2sbDmG5ZSxwXacTKzO9PfdhjoLGrpjwu0ASx?=
 =?us-ascii?Q?XP/6uYNeCqufyxRcCBRFgc/gQq2AvZhTORX5u+DqsVfuzPZcQT6X5tfcLuUh?=
 =?us-ascii?Q?+TP6eNNGMpv31QhSIer5zmnnmMrAqWpwhJPBkeK/mVEdqH/C3zPUlyftBvUL?=
 =?us-ascii?Q?t+6hkGZcbQZc5tFmxt8IEri4PHxO87OC4nN2wm3rluBoS4YRIrHzfCWfpshk?=
 =?us-ascii?Q?7vy8EoxObvO72fev+unBAxRa8hhNmAS95r/hbe+orAT7doil9uBcA+oW3OFg?=
 =?us-ascii?Q?QSbQABGEZBtvGZfPRS5ztsn+wXFH4wCllyam/wd4v7W5BZoR+i3MAxYHnl/j?=
 =?us-ascii?Q?mTjgSrVOLrx1HogJIRsEw9l/wafpV6lo/gXwM480QaMHiS7sjm+lUOjMuAUZ?=
 =?us-ascii?Q?gmRlnkgRrVOZFwj/m9WNc+MUBZ0ETNA3x+PwyxpovvgZJPp4Z99Ebxclj9Ax?=
 =?us-ascii?Q?/6c96QiT53fl/HO/piPJ6Os3RqA/1OHN+MnyqIHB5o8/li8LjMjAJP3V7gPX?=
 =?us-ascii?Q?xFVmySg1s1uNUMOscWv7mTP08576m4e3lPqc1id5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b0753a-a999-4f70-bd92-08dce1bbfa72
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 01:54:25.6134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+GIjnN278Z9CeuKn2afRL8ZecC35hECSka9I6pwZ+hrmH1bi3GrGhilWzeWzX3IHy/+y5DGg3CtKlU1VuaVrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205129

Hi All,
=20
QA for yocto-5.0.4.rc3 is completed. This is the full report for this relea=
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
> Sent: Friday, September 27, 2024 6:31 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.4.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0.4.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.4.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7360
>=20
>     Build hash information:
>=20
>     bitbake: d251668d9a7a8dd25bd8767efb30d6d9ff8b1ad3
> meta-agl: 6debcd5420b798dd8c0b3052620cc5d8f3bcbff7
> meta-arm: 1947c000299c0330e8a866996505221a14c0e1ea
> meta-aws: 1bc413ef26efe835d7c2f68859cc36ebd4233903
> meta-clang: 2b7433611d80f6d0ee1b04156fa91fc73d3c2665
> meta-intel: c2bc8e27e9cc83654a23e8d89525fd9b1e781eb6
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 735ae0310870ffce07ce0c55c4f87c20ac161ff9
> meta-virtualization: 66ee8d268db25a9f2848bda6858c284c745f549f
> oecore: f888dd911529a828820799a7a1b75dfd3a44847c
> poky: 2034fc38eb4e63984d9bd6b260aa1bf95ce562e4
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
> View/Reply Online (#468): https://lists.yoctoproject.org/g/qa-build-
> notification/message/468
> Mute This Topic: https://lists.yoctoproject.org/mt/108677431/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


