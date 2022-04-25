Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB983C63682
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.27801.1650884423848856681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Km1oB43v;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650884423; x=1682420423;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gyNmVCZ62NM8zQlPsFU0HQ9BNIDNgrIMvi+CAnBW92Y=;
  b=Km1oB43vzOgiqMXIP0NU9gjVs3j8FRqlXeTlcrIzVpWzajYZfMlHX+bO
   MJBFS2vqYO3vgVzFO35TJqglYonabh4cb8HiuHji4XmuIed40hVOR2LTo
   oFMJ+/Y20F+jMCxYlGSuhtH1vqcB25Bj3u7Bj3qlqYRq4+ABJJf8wguQ0
   0fDW+2Lwdbwq4fwQttlPHqz9BYaHgREKrcEx+6f0waBa4LCh1Dp2pF6AL
   HlXk63Jnx8ysv9AkbZEWQfM2W0+lxXRQqaJz3+5GwIY9cuEqDonFS0yqj
   Yos+f5Ao9tsEKPn+YtABDqaVODHNtN+yK8Q0437Q3D4RxA+toHXprHJGT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="247140728"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400";
   d="scan'208";a="247140728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400";
   d="scan'208";a="729678528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 25 Apr 2022 04:00:23 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 04:00:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 25 Apr 2022 04:00:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Apr 2022 04:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ6sytcedez/EUTcqK8kK/T/2Se2709n9yHAavbEGpg+Y8TRtvsdP0hjAk8S6i4YY1s5/E5Mce7KskgHmrD793Ny5rh8HbAB3pkFDX+FgpqjDW7Q37EcgDQHOsOEimGgMYErUM6pIOBg6jcOFs+sz22IMl2KXA22oUJ8YYyqKiFzxJ/eK7MNisMbQptAVLL9CuAzgTxjMnVUEts5H/rZ9WzPLM1hde2AygUPVurJejhm4xLYFsC4Yq/hOXtrHVwvGA/7G5GOw77ZPLOTrk4ImM2k1Q7ZdRMDoLuItEFd9PcJ5a8Dw3ubX5M329AsN+dokyHVwoSZtM5jwutx3bCNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8mZZBv5Izzr9TF2viNipLZn2QF4ipA0qpWU9E/69Xk=;
 b=TtJQLszAd3zoga8ISS61CHR0H/aYiGpLR3lVzLYEBvT/58NXyZQfuHJl+pNp/By7DfnUKklZVUiffs2vDe0OwT+vXPv7SsmJyAOYuTMxdvWPrvsJi9jd4OstmamFE+oEsWklnvA9RiLgwlrxf++8NWUxhWFJnt/EsGGUc7zLWsJ7lwjoOFYyAka23b1KIq6s+0SGSap4nZ1BkBJZaIrYno83+Mkg2pqpX9JPW70+1Zg0Ptp38GjvGc/BdNXCdiDaztwfFmA/1H6YlfD8IVEPXPke9pWM9LqwU8vn8gOajH4/wlBtga/6kcn7LxCIKY/fEdj1bXtwyUT3broaqU2kZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 11:00:15 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:00:15 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.6.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.6.rc1)
Thread-Index: AQHYVHxAgVoaQxMCBkKgq963S2O0sa0AfiXQ
Date: Mon, 25 Apr 2022 11:00:15 +0000
Message-ID: 
 <DM5PR1101MB23488C2188CF1D91D056EBADBBF89@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018045908f0d-aec445aa-251d-4dcd-a10d-8d0ead780069-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018045908f0d-aec445aa-251d-4dcd-a10d-8d0ead780069-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bba50e1-5920-4d4f-52ac-08da26aac727
x-ms-traffictypediagnostic: SA2PR11MB4858:EE_
x-microsoft-antispam-prvs: 
 <SA2PR11MB485800640BDC99CD974128BCBBF89@SA2PR11MB4858.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JK15XdCRpmXjRBOjX3KSogr1RqNdZRTUc8wRw8io1oBkJmJQKjrIYblxyqM3ak3uHEuzbxTk6kNGRlEcYJNeILv+yTka92uoyDTDN+q2jT8tD40qj3jWMabta3kTUe0S+0UWyoyrDGbslaOAAm+Ypy+Slk21Ir4vZZ/JPK9xXstwS3wWFvNr7CmdTaTBAH2gDqZf04fgI8W1UPTHnfV8JGU2yIIy3Z9iywGKBxenVjLJuXjF+O3KH2o2hqecFeyYx/pHeaRi3T25Pgf2gEg0DwlRUnXhf1QeoBgLBjywaHDaL6di8Bq8ts5nvYnUqo1jY933ixcEmVR3+pEa8sRXB+2SF6XnOvS+Hobx/sUXOLTTpFzRxs7c+WnazAgPAuH3ZvzmC9AFFo6+BNDgfdPrbGfLNv1cTHWZw1ydaZtGLNqGWCVMj6HtRJ1PSk/9RNTQGO9TXibgywmQap7N8C5aOciQ+KWAL4RMDH2Ij+rVt57dtspQQ+SIAnNLsk2wYHMNNC84pB46V6l65mE6ydQ5obex54oNC4XLYAP6C16/uaT7b1F5NKqdqLir6JNtAFhmcCVbNKsmrSUhFYIXTODwxTnz+zRvFUxVQ5zkYncyaBPTuHoM1g1pEYxZUoeaN2C0IIPO5T5z77Qe7zLspht6BfxCpTQscOZnCgUbZhl7qiEK81JC0qh9+gsfYpfyRKFlqLOOc3vz5wf47zFfEbnanT6WkqQuC8C0h9GfQtypXRWg1hPq09r70wB3WK03UDyBx1kgAuM6S2bwHFqK3W4QceR1ohsCP1PF9diMqzLX+RizGU6eB41+tL+uitSWmV2va1N+4vlG/ENOyicY7mbFrQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(66946007)(76116006)(33656002)(15650500001)(86362001)(26005)(8936002)(66556008)(66446008)(71200400001)(52536014)(110136005)(316002)(8676002)(5660300002)(64756008)(508600001)(4326008)(966005)(66476007)(122000001)(2906002)(186003)(38070700005)(38100700002)(83380400001)(55016003)(53546011)(82960400001)(55236004)(7696005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ofG1LkwqNVOU50YgAay2FemsU1FOHlLsYcFzunFw7JoA0DuBP72+UtbXf7mx?=
 =?us-ascii?Q?48uFh8AQIMHjMVrdNgTrH7OlbrcaxKLvJpl+dAOympuNqH/U6FV50BtSQG0a?=
 =?us-ascii?Q?MK+oqT4MSLnBFvievUY+S4LIOelDnm+kFHqSNAAchfULtCtP7TJ7ofbhGB1l?=
 =?us-ascii?Q?7NAGKqrQ/BKaIfL2J1GjbSFMniIasclfwmQPZx5DOZgSAAkbdlNJYR6EOxMB?=
 =?us-ascii?Q?7Vo1WkaFsdE4GLaYpvTHTGnMIde9YXGUUk/ig0bDiz8Rebyb4fKDHNXTA4LI?=
 =?us-ascii?Q?8S5vbe3eDp/w9sqm7lo51nHXSEGb8xUaqX9c9eEqat2BHPoeCkXnlz4acBoW?=
 =?us-ascii?Q?59I8Bpmfianp7ON/PkbbB4tLlq/QtD3XLhEbw+S2KBTjwEIANNy1RmsdzwjW?=
 =?us-ascii?Q?xiEQnmvelmAZUyCE776WukDQAKHj2DUv8eqUoXh07pTKpSGFZdgj3Ff2CtIT?=
 =?us-ascii?Q?P4PkW6ZkvRLf084wTv5/TBN/XMOwhkJ3aRyP2jxaceLu1Se75lWxsRS1sNk9?=
 =?us-ascii?Q?yXoyC0R2FuxUH7EA/uQTeusVllE8xYortJOBmYkTx1rZYkbZYDegDrSWp7v4?=
 =?us-ascii?Q?vKs3b2Ym5GVqkMRaF+TT1Tco57SyDFvCOYfyVbbuzso7QKo7G/+t/1XVYIG0?=
 =?us-ascii?Q?7tr4JyCGPUBKyXzCFJeHs8C9PkcIl2zDNFwRyIzuYmF2x/Ct2+47EjyOUcre?=
 =?us-ascii?Q?xn6VKdu6sf012AJXYIW7j6yWJ+JW5kDIFqZ94X0k9nA06hidlsx2fKNHyuH9?=
 =?us-ascii?Q?cxuKHvFQLypeU9UBYmDe0tu9dFFvkkqp7vRho6g+siII19rh00ilzbn/+t5N?=
 =?us-ascii?Q?WTKKwtq1Z1fUQja/BwsNhRHoTczQqFiV+HVmQk9otrMmqmUp4cw11gIblzop?=
 =?us-ascii?Q?pUMSkx+ku5F49FhnKdPrf9L5INMNkZcNmxGbcN9Sp7KZPWcJgQM2gQ7fEvXv?=
 =?us-ascii?Q?LXGmGNioysTZ6jHoUxMm/XF96Z5nbt+tX9dqpQgIvaNGbxTTzW7nTgIc9X7q?=
 =?us-ascii?Q?ZGuMWmLcSn+W+bcXo4RIFKW2eLuJfAS+jjN7WMd/ANhThIlIqN1Ienj5FTlF?=
 =?us-ascii?Q?SHUWBaSfY4ANnVYOYIl9BUf1KTnp6H8J4hit78ni/bsJAyBB58zkVPfJ8YWG?=
 =?us-ascii?Q?CbADG9p0JnL6NdmVHcO9K7jpiy/SmmLKZ7BeGUGp2XQ6181LCg7hZ6u8DqtB?=
 =?us-ascii?Q?YblSos7G9hAQxclUfTZoBV53ZSAwFrvq/o3FFwIr8+LV+BI+y0yMf+Yq/8a4?=
 =?us-ascii?Q?Rm3QFFRaKXy4JrumAJf0gj2bvorD0IGqET/Z+8uckhsKtYzTcmPIrAerg+gd?=
 =?us-ascii?Q?9w1OF5O1+Bg/90uqFSWTZoEVEq9ZLS6bKAiP2RoVNi78dflRZZQQ1GwagiXF?=
 =?us-ascii?Q?Oafqojqv7tcKgo3hMYOgaETfHBwrWW2tp0upmHBSpxy6gJ1mFBvEgbUEFvMD?=
 =?us-ascii?Q?sDJ/+ol8O6YQpLFZZyqeUAThoiemZW04hEl0u3WP3ZvJL2R/drxXRi378FwV?=
 =?us-ascii?Q?Iqj/4xKo4RPRHsHP+qo5I6Ut7JwNqie72d549Jmq+0Yj/7Rsa+tW/TYSduj4?=
 =?us-ascii?Q?dAtoYGb40NnInISFGkN1xHvOoUf1zhT3TUlPhkyghigniTxhy2e3XjRYdeLG?=
 =?us-ascii?Q?zdzEqytHI9wWEDQoHIswu3k5LS3mHQuI6wySFTahbXSBILxQZh4AZgsph3hj?=
 =?us-ascii?Q?veZP6S4op90zSawEfJHfTjkF1lSqK9KzxTk/EEL3XxLn+FXxyrGH+xVv5Q87?=
 =?us-ascii?Q?mpykji4ZgQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bba50e1-5920-4d4f-52ac-08da26aac727
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 11:00:15.3416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Alv8SsmHzSe4e2mCNrrALZkBOkbc25VZXAjiZ5WkOBk/dvoCC/pW+MwU/2rB7hSB3UXnJYdxyOefiMrAWG2M8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164816

Hello everyone,

This is the full report for yocto-3.3.6.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Jay
> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 20 April, 2022 2:02 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3.6.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: d01d8326331cfe59208674cfc53aa26c0028b313
> meta-agl: ca53308f8803fb50709b3f17bb1f9e476366bb62
> meta-arm: 878fabbfc720da7d634ed9a2c0e24d4b8845ea20
> meta-aws: 6801abf40bb255a31bce5061c5c6b72f5e2a8f58
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 16bfef2d1e0d0c8c596741d0bbb820541c432f6d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> meta-openembedded: a970ee45c2335c37041ad1658323481874bb4f0e
> oecore: fbbb689c8df7f82644b8a9bc5bb6884bc6516660
> poky: eee9fba7b4d5d7a268a495688039027390894e6d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

