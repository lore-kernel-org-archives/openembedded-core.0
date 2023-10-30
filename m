Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E21FC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 06:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.143149.1698647011343565013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 23:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fhxZLAgw;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698647011; x=1730183011;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uYQP0IjWlrc3HWyodDq/h0wgkUA0DLfu4FRgMV4pKXY=;
  b=fhxZLAgwIa7cnE9A22IbdTtd+Ql6nSRy/uVKZHQVpF8EMMpl94xTNNHj
   0vidHwnimsifV+N9GbAXTMr+AnoV4oHjxiS9saN/G2fWa3Vm8oiIuYhBm
   wDPsnyC/kHIF2IhZQY+CoUV3aTsHt4CX56/dJ/AffPgMiXycHH4kcuIOU
   +LWAjaalQ1Cx/hR/6TrcIEMurLH/aQrETNst5XyxU8h2ePHnS3eOt6PO4
   4vz09ilYEIjgK07BR65tKyfqEM3xY1A1L9vaF2YtXDvxK5w1oKbdkwmSn
   T13BqirAgp92EjeBNdmRiUE06JrtEx2m1fGXG5Db2WvNmpalomIvXKB+m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="387833333"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="387833333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 23:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789363093"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="789363093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2023 23:23:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 23:23:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 29 Oct 2023 23:23:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 29 Oct 2023 23:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1oYVPfc3iDxNIWeDEhIFUYJ4hdJRstmAtPZ1GnBKmgrtNGoesj//xzcN0TxXXxy1nFuM8/VLmatr+IS3mpdx/CKidrmU5cf+UbV+71o/jxRWk72rvkn6axnXPeBw+waKY/RZV6Ctx+SkzH9YDNoa2IH+K5nzc8UpPECB1zvO8watBy0oBM2CZqgvGTHsK6Jnmh2UqF7XqV16Ce7dFJrz7ZNxo43itQr1pEec5OfRomq3rNUCcC8Nsd6u/BCMdWqlxRY4MYKZnbN0tmBBJ8GSoGqnF+puJQLT7k0B42e88jNMjGOYRy774jb6+RlAxD+8Ma/GBfzlH5bcFp58PAqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuOpPyb6y7zQZsiShuJADOSCwZs/eIYQmK9fveXKnn0=;
 b=YDXER3J6zmq9FXmTsZ5ajiNvTdLQgOzA4kx5XB4ArH0alraXZQ4+u22rzqdWa61PZNBUbCEqbuYWSqKEQCaZsdx9MsLkkoahq/njDxhB6ZzxSecmZxSJ5GcvWcFjkQ641kIGUw4EGsXU4nZ16syCdX3AmsbTayz1sQbM5A0zA6BEwCCk2EP0QPXfgyW881HHK+/WFxeVrbENyhEk0BlDQFAeXb8O2i5P+eqPSZHruYY81/uGPNMJZLNMwxT0Tr2JokfpKolHK+lmhuHfqMr4dIgbaMbUPgY39XBS5+A1YqUb//1Wm9bbncOwjH8gbmfXhgz6FWKwP99nj66q2+5FHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 06:23:26 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6933.024; Mon, 30 Oct 2023
 06:23:26 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.29.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.29.rc1)
Thread-Index: AQHaCSHEX1uaUMFZi0GPLlSuvK/R5bBh4GkQ
Date: Mon, 30 Oct 2023 06:23:26 +0000
Message-ID: <BY5PR11MB4152ABDC8FA9CCD20376B675A1A1A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b732bfffb-12002d52-9058-4b77-ab53-1fa728765bda-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b732bfffb-12002d52-9058-4b77-ab53-1fa728765bda-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BY1PR11MB8007:EE_
x-ms-office365-filtering-correlation-id: 086343f9-25d9-4bbb-2f33-08dbd910b9b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLcR0z4S586U8wiP0bV2uw5FsYgZjMduYzxf6QGm4F8CEAs9WZahQDhu4qT9kjPnoJGNaSXh9QFyxJYdxnf7jLU57HnQlZE9nR4vRQp/dfH691v8hXsLl9bPMVAOKNHhvRs4aixRXGpZVvjlAbqZ5LKZ6BI25SKAecligpjeOFOHmmv4435LJWdVzZSa89eiuREtKax98ktnCEIHQYoE7toMkmXiIvxPtdZQIKv26YRpy9Axx+7EOm7jSgFLwypUfAvVf/oGEet9VV4uUo//q3dzcVy/B121ixUvwArOIWqzeektuZTIHkmIF85U8DYg/Nmb8ftP5LZg8luNYhxf9KHGX5QpMdcCQVeoiv/LM01uyN8Oq4317bTM2DdFaxWXZ2H5AMaa3RgEHQZA+n0vqkRlsbCjNxM+GSlmiFMEYSPCpOLkTN8Q7scTCfrtFgnkLcuPcmY+lbi8k15moV/C+FJxLqcBByPcMbMwEovakREEcdo4g7WdsZM+pe8ud6pKi3T/aknwXiTGZaRixMhqIU6wnSGe3TJcj3mmCqyEHhv4sEgWtqcGrjKeSD1zhz/RCaYinNCmMnjEkdnU+gUJzJEibKlp33EohBIbb4riv+D3Ui36o+1jGJnsy1Pp/0bliCOhPK8G7+9LBwNdjfEDfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(2906002)(66446008)(66476007)(64756008)(66556008)(76116006)(66946007)(82960400001)(122000001)(316002)(38100700002)(71200400001)(6506007)(7696005)(53546011)(966005)(9686003)(478600001)(110136005)(83380400001)(26005)(41300700001)(5660300002)(15650500001)(8936002)(8676002)(86362001)(33656002)(52536014)(38070700009)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Eh1BF4ZQ5/qVhfeQ0T8a0BGZxPO2Iq0nw/qQLaY2EAJxShXxmzB6eIYOZSRe?=
 =?us-ascii?Q?4qNbebbeTDbo8UDDuX2OuygywmPV5py1VfxM2+W4uoKnSL5Aaa+HhLMnZeeT?=
 =?us-ascii?Q?TQNC0WrXmjVgA+ha06sIx6p0VUN2fLfvzjN60dG5fawKkJs9F1WOn5ZiGiaf?=
 =?us-ascii?Q?iEocgUUx/vzdNfiY1qv+fetlC539gAmaoYyscbWrHgsgUX6AE85Kwx0yc9/D?=
 =?us-ascii?Q?hzPjmhCZtegRT+VjGIj3nGR/jBaOwoXHS4lTTFFMhBNdC8KNzzIpl07daC88?=
 =?us-ascii?Q?lElVptSH89mjc8TZ0rk3WYfW0v/aJZCAixK6rtSYrR6ez1ON5+zz8sZHoYZd?=
 =?us-ascii?Q?88VA81TMFBfkVNW6G+F4t3r4CSxhujhbSgJPROb/CGPIdpYbxe+8/aLSfIXD?=
 =?us-ascii?Q?c1XnXG3Wek2ntAhUjt902DJZVhgXXk6O52mRSSmqVXVBWAdjb43FrcVWP6rT?=
 =?us-ascii?Q?Ed0DhmGWFcY/JW7OdR761p/nwU8c7vE8VJcXTasiy7UF8VlLqdWw/NHRvESg?=
 =?us-ascii?Q?LhvMez/l5ESBzlAyijX+yUs4vY7H3g3vTxw0p1bWol9VNGl+S5oO4ISXkjHD?=
 =?us-ascii?Q?XojD53sV1T59c0kQGMli+ZQDOg2lPfJPmh0v51wclf+Juy6mQdwCvHrCrIKW?=
 =?us-ascii?Q?K44V7UaBB+G1nOqU6UAwy2UTo2WAun9y1UAoCneuoVxLkYndDpA8CW8AmKsm?=
 =?us-ascii?Q?VjPYTCQs9FLniJJNUpsvrb6CsvArQoPbuokf+r1dqWH1S+TCY89SGp9d3+K+?=
 =?us-ascii?Q?frVomR/ZpVSVoOfYCXf/5jkBLP85V3R+piVbdUSDrYfl+VhHA124sAN1RjL8?=
 =?us-ascii?Q?ull45GJ5HlKnWr/KqLQdEI2zH2dn9ta3DdClASyPJ0PTMgdUvwS/fHMv2Ksi?=
 =?us-ascii?Q?GKjCfxQ8w409LdxpzxPACuPTUif/hRs1JK0kKEmnlsTe5TSgebCKNeFrGc1r?=
 =?us-ascii?Q?aQEHR8014b6m+XuB/LlRIRwZz5yv2rwrmsfgmjo/AHWOr7BHIIdB7XzR8SnA?=
 =?us-ascii?Q?jOh719bKU5uf4kNQ6KUYb1hpX++9h6/809vyTy/Mum+qbOZHZ7GBciI2ERWl?=
 =?us-ascii?Q?RMrDONv8VcQH2DyNEVH4SZ1R5LihTNO2OrPuLi3XEpWZcroLuhKHx53fU06F?=
 =?us-ascii?Q?SR/L5ouzHv/9cblaavCHtI7PWfE0PUqx/p0YTqIyg80sBBY9Z6UNm8To8uG2?=
 =?us-ascii?Q?1zhpFmIhHEcczPezv/SSvSjqgzjZhHEo0Tdhe3NISGO56BkBWqGOa6vTPqC0?=
 =?us-ascii?Q?MLh3dmNjmF3KGMNl7BdsnEyEes4j63S+47puiMTyoNs+gbYR97KnYqfpO+47?=
 =?us-ascii?Q?sFxACbrnFY03bUzh2IfvXAQMgvW66fAdiOb5MhIau+QMOYYlZUM0SaHmFmly?=
 =?us-ascii?Q?u+4mDMLkTNKBst6tU7a22IshzmYUm757vPu/LAFmJHSsGz1RJtk3T9omc4PM?=
 =?us-ascii?Q?jiNtYe/E0uo8cS1xYJ5NoCyrbGaLPPcr549lwyV/X+9Aue+4eXFwNfb7eMPR?=
 =?us-ascii?Q?8zvgg+QHJ6Q309j41r2PuNOaI7nvjEFqN1ZG55vytzdrEsiBge6WfdLJf54l?=
 =?us-ascii?Q?R5fu0FeSFX+ZTRL9NoqcV0h2/e1ZWqXaI5BYEXEz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086343f9-25d9-4bbb-2f33-08dbd910b9b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 06:23:26.0831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1eGp8fdhHlWKNpYWx4s5ciXFGWf44sy7k3WIAdMQC0NUz1udjwBdYjVdRLyyjgBuLb4PmFp/5jZrGTmuCQjctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 06:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189790

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.29.r=
c1. We are planning to execute following tests for this cycle:
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
ETA for completion Thursday, 2 November 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, October 28, 2023 6:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.29.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.29.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.29.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6111
>=20
> Build hash information:
>=20
> bitbake: dd826595414c5dc1a649f45a9dd2430bf6d4699b
> meta-agl: 280f7e70af30eefd885f6e60bd29863b46bb2eab
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 6e3ace380b609dadf58c81c734ef2061e9636914
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: 300be975359fdb3a3b2bf7c6fe15dea7acac575d
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 0dbf3a15321b8033ff8ed86c6aa261fdb9c3d5bb
> poky: aeac1034661725b5c83e79f76238429fb236b090
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
> View/Reply Online (#332): https://lists.yoctoproject.org/g/qa-build-
> notification/message/332
> Mute This Topic: https://lists.yoctoproject.org/mt/102231153/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


