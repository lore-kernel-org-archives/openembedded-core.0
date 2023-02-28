Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B97C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 01:07:55 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.12691.1677546465805116900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 17:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=b7C6OWVu;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677546465; x=1709082465;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JuoMG26pq/c8ezvipXszVMlo2A59VzEsXWZb9LVZWj4=;
  b=b7C6OWVuiMwURMtP18MAmoBtX66ELy0kOEQqwAG1YFEL4ionLbBVux7t
   D+OehyTYB+3t6B+IKqulmT1Q0PX+rdkV62eitQWJzGYm2fuIdcZUPkvtW
   XV7cC6p4EWUW8HkyDnb+sLd7HjU4l87WKXhKCywKHIfjt9tLTOrzmhnaD
   uvdcCXD47eCnrzz3ybYor91kkE/uoIBQIX13UTQ5Y1c19l/kFXy6K+Ojy
   Rf8roVJPWRT7GVeez9LVGyQK5nx4uZH15Foz9xk7jtYtKZiqmoF7qKfdV
   zHsLyJzcowIbwbEaxXwq2UpuxUy6AnYh5EpAVpLv53frkyBX34K7FEn+1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="331490858"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="331490858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 17:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742786293"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="742786293"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2023 17:07:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 17:07:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 17:07:42 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 17:07:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1p8fIglX7EiZiEk9FUcOH5+3yhalWxRwGU/dsXv9SD2a+UWSAKwLBU9jpAI+SuFqMu0qLUqJUzKuZr3kgweVEcxO625b5sDhtSTl2saVw0lQH+mVglQwNjf7twYDzcrcuINF6oLceQtFXX2XrbKNouEW1QIfGp5EmvPnx4l79nh/gsV7GrySUSg8rM+au2Qjpq3+KAfAkA1vN7IYil6OWyPSwM5sJFjOwB8JlS2t0LrbNoDyM12VZzoYnARAmUMKCG3lN35SrnvOJ3FRYnDK3yF6kOiyV3JvI5M93BxRQYlD1cNSd78Qu7fO2D4H+cce5Un59jAZernEBvl3aTglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jimK0Tcv4Sj1AutsiqY/ehEj8bKNM8t0JqV7+TMKTCE=;
 b=c+S/+qKqGIJUpnVADXxU+Wnx/AQWutIYuT65w7iCM0hFCc5P7e6Gk7b+bzSUjc8qIzXS3mtqjXbq+OYrTRhlr782acY+fvLbZZbiGuhdC8iL8oRaNufdN8XMGpuZn0nP3CVTiiShGcC6UTiBXHj34XQFespkX9AvGfHaFKx5+MaacoUAvnSzusehZs416SnKgMtBqaTO7USRxCPt9crsh44xOhzePVzVkKzmW9qPUU0skYFfnR0/Apq9mK9fvdz9vGF3aanfgzESuKiQJ2nwgdfG8Wlo6eeTLy1q2+Sd+U3AT/FXIyCJvpusz7ld/7/kNynuVvsH/boUGxQpL9lRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Tue, 28 Feb
 2023 01:07:40 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6134.027; Tue, 28 Feb 2023
 01:07:40 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M3.rc1)
Thread-Index: AQHZSgQZSxXhWlgkfkmu8uUs4GDl3a7jjMhw
Date: Tue, 28 Feb 2023 01:07:39 +0000
Message-ID: <BY5PR11MB4152F4128D7449B83467538CA1AC9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101868eacc66b-daeb66ac-dd84-4824-a627-e50e12406540-000000@us-west-2.amazonses.com>
In-Reply-To: <010101868eacc66b-daeb66ac-dd84-4824-a627-e50e12406540-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BN9PR11MB5259:EE_
x-ms-office365-filtering-correlation-id: 329dbe67-be8c-416c-ac6c-08db1928300b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eC5zoc9pkNn/erYFLYylZiCrtPRUjx40nQkYOiCOtXgySf9IxJ8P254UUjk0roQF1jHtH+/54e73NOr+Ic13b7/n0fUBagriGX2LpQwf3aQlGqhO02UO3ErrNMtRTo7OXxR24WvesvHggObT19EQc1gRuOAV1GInjvDwDVUfKunOYUmwS7Gi5qb3LH2Dj/JUldetBj77xHm/0s2LxnQVDv9kSPXJAHsuhYnt7kBxxYup39FaDN1gHpmZ46BDlzviRkZueAYSiF+k8AhsewefrLnJ3abxOMFcPyVN2Jj/1RJv1DBhpqgnazTZBgQAnsAcHwZ8sMA3jivXz+48G735dZpdWq+ObSyDCNWF7OeI5uTfNvP8erShfzIDK6I/7GKFQPm/Q8DHhEm2W3IEjW6L9IvEmiQCz5c38Iqb4/FeGrGi5ZxlSoPSzmkhrXuern3PlHaZoRz1oszJQEP56H1QTIswVjhS2rg6QZw1dPG56BUGfx1QqE39lf5e/64qbngxlAvEBQ9WM+vvvnWFNjxFz3ytBUAHPyiswRuqf9sMhEAvUPIx0a9wzPSEoavB7jk0egNXM4TM33a2cwVY6u64uKwEpAB3i9tt+BpsJpxH16DcPNtxlW8oEQdREWHsIAPy9ZMB7K0LihX2E2aevfHSBZu3QfY6WV0KbelB/9aCpiVARAjgT4ibIvuhoZ+sdNQ0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199018)(8676002)(122000001)(8936002)(52536014)(110136005)(316002)(9686003)(38070700005)(53546011)(186003)(26005)(7696005)(33656002)(478600001)(966005)(71200400001)(86362001)(6506007)(15650500001)(2906002)(55016003)(38100700002)(82960400001)(5660300002)(83380400001)(64756008)(76116006)(66446008)(66476007)(66556008)(66946007)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dNJ/s3LKkUWiReLfTc7MQ9mVEezeZDwswvWUZSd7KhWCDUp60R7Ajm8FpJIk?=
 =?us-ascii?Q?YlWPQjgiTcpxUxWuUGexntiLdo8leVINCfd+zLsFfqqOhdu7CgMUjnsdh/RJ?=
 =?us-ascii?Q?/nsLJEXWYr+xvpRdBqFCMzoFUFa0UVhPSrni5Ft0mWc/F4aTS7/iJywuU92g?=
 =?us-ascii?Q?ug3a6PEXkFn2iqfXw0lr3V4ae9bbFRdk1yM1EiYvOJn980mEU22pn7HJZxmS?=
 =?us-ascii?Q?Cq6cMmmVHBAEGeAm+DEkBWj3zN1Qpfs+GpOG/ObnP1J+tg+KVj/V3IpcFsjg?=
 =?us-ascii?Q?lEIuXWr+a9Zf8HT12Z3g0yXX2hYhy6Gimm+8uULpt0m27qtaO0er6PRrv1lx?=
 =?us-ascii?Q?VVlxqHySSyEGr7lx7ChyON7X9uGduaaVXDCJG4RUizsmsqTJJPpSay2IWYvj?=
 =?us-ascii?Q?rU6DWx0eZsb7c1lEecFIwvc5RPk8iQMPeAV3B+DdmsiWt80glaNhf5EJ40mP?=
 =?us-ascii?Q?FYjpF+Oc8coM9QWyVRJgLsoySEu3DBVeCIg9UA0rvOU7TTuYZNj0xOIxIrT0?=
 =?us-ascii?Q?m07NcLCg4xu7Xb5YyxduN3Za1vn4WPIsM0HXXVDfrl3mAe6heph8+sNv6QKe?=
 =?us-ascii?Q?sfCKm8KflycgE/+LVaQtk8QCqtclnjq3zx4dBDWucOB2c2Fr9jU2aJKabkF2?=
 =?us-ascii?Q?uZzS87BCxSlqHlxqY833pKMTypxFSeQeKeVT6Aa6oGUZFscsWNn9ed3s7ajW?=
 =?us-ascii?Q?MkDmVRbiUtZZhlZ1c9sfOIf6F4EfUe0ANj3vxXUSxkycDis8uxSNfDxMxVnZ?=
 =?us-ascii?Q?QkLCSwDNy9oXI9U1F/5j/j6XAz5kGcVZr7RBvSlm4wkLLT8dzMmlP5GevGIe?=
 =?us-ascii?Q?I0Rp1xrW0S+V5deItWlETLv0mYCuzrlMOIaR36+vNSf7BO1wO3zXk8v5y2T/?=
 =?us-ascii?Q?6QmuJSmAobQXQo3liSxrzSbd74BVJndwkE0Oj2gudHu8pUYVS3FFay/RQf6m?=
 =?us-ascii?Q?o7zAvqtbehUFslbDfmsohek5GJTz+laD5LdBFro8rNGf63DcsLWkwxrGrf9K?=
 =?us-ascii?Q?eyazPzuzW7sNR5Y/noP/SdkHW8zxS/HxwywuQk0fvpkaqQCR3eU5mR5uOoba?=
 =?us-ascii?Q?HnDuOBNFuDH6xEdvb05K/fIFB60cj5j40RW4p1k5AFrwLgI53i2gRA8FnDjC?=
 =?us-ascii?Q?Pj3QE6+q9nGAzlCLzwADhfgrXsvOFA98CziDUxOs5e+dbOSYdk0VLBKdy3tb?=
 =?us-ascii?Q?OKvc4Q4Xnt1zo8HQ9pcajjG3Wh/SxXXQ2QBBA+s1XvL9d5V9z+uRo9IEeIUa?=
 =?us-ascii?Q?ZB+u0Fd+FZzQjRYM68B3WR/i2JQPqPEF8WD9Mf1bBOO97ktKRQKvZug4QIUQ?=
 =?us-ascii?Q?XTpjAtjmeB5OcCEVrQjQdC0f9xK8/Tv0oTZR+2IrfW5IJlzAtrF3Y3jNQPTV?=
 =?us-ascii?Q?jJlt/YkDXQyCWqBb/kb0BZ432jFwUHThLISPYl7McBpjsO5AST5Vk7f2z8//?=
 =?us-ascii?Q?8bV/cPQ5ga/+LaVBmEkK9M+RbFtKlthLpVK+aixSiezfIzlE3Kl+QXrHeGEe?=
 =?us-ascii?Q?M85KIr3imZEhFXBtlUer2dvcAYn8zqt+R280+6dtcMmkZm53fXryCRhyXMeO?=
 =?us-ascii?Q?oVgVhnu9qjP4joLbimdKHHi7iFNa1yKVhlXps74A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329dbe67-be8c-416c-ac6c-08db1928300b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 01:07:39.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSGsOR2ygi23woWcy1bCnsn13R5hIToh2DyhZ9GiiHzW4F7w0f9N7qcbQoFDWdsesA1QOBli5iY9dkjb8QXZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177811

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2_M3.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion Thursday, 2nd March.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Monday, 27 February, 2023 1:02 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2_M3.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 6bc65e6402a74c9a65e29333a7e0f1f85dcbcf58
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: d5c024f1f5326fb19de33928acea34df4b58e9ba
> meta-aws: c0d336fa28dfb75b71e403802f532723a619d9cb
> meta-intel: d5ddfa0354fc6025bd2d42f56b70943429c06dd3
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: 3f2aee1b080e2f9ab2d0a7326581dad2f07ca6ef
> meta-virtualization: 369749ad2947921d7452a31e7a4ce6eb0f8e8ccb
> oecore: f6ac666c99da115ab4a214d24282978a06c36efa
> poky: c45d58f003e8d8b323169ca9d479dc49c43a9974
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

