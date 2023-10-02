Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6465E784B0
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 09:41:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.77936.1696239670650482403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=P+ElXwKq;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696239670; x=1727775670;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pgzBJtCmi7GbGU6meHClpirQiKRrEMV4puSO0YcezEg=;
  b=P+ElXwKqI7dO7mWALyBZFuq7MG3HAHvj9bDUuhzYtHNoob2sPqDm6wC1
   Irce9CnwuxFEPUS2mNNwS/xTrGJnOOdHwiExoV98+20OpqTVFLeHalBlm
   3wOT9ISzXxsShyqQ5f24IncC7oOzWe8Yuze1PaZyDN0Ocry6KtlwAlu8M
   2VXq4g1kNLgpPaVqqV9n3EY1mhMdx61nCn2NKqb/XtKel6DjV8O7chi4u
   Mi36bPhSpP2DgTKPnO6GZvSmd2bxF4dhO9unwGxlbr6rHEx7Vsx40lklu
   rUPhfSaAb5e4KvXEC138tA+j/ixHRll6tr/QpJmygdOAtN5/XtZKogLc9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381494387"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381494387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 02:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="744064348"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="744064348"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Oct 2023 02:41:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 02:41:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 02:41:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 02:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJkxx8OnY1wE7FPWjXB+43Z4XSlNohr7jJnRnM1Y8ae35BtpBJD1EFx42u5YjP/VUnTQSf8I3xTtGneEQ16NWHPcBhaSsf0Y3nTe4BQoUu0zjWFoFZoOyYvzv0ySsUsU/MbQTIEpDtHL7Gn8Tis4ITbkESSL7oiaI2xEf5RcoJ4yfBif7R2CZ68pgpYS/mawKBwTv+a9+Fiia61LUgmGeahlezpDUbVcNrtnum3YK/XnokPD/a5BjqnnW5iSVuHbZfSNkWpzPnx56uNzkUvADKzfGUOj3IPE7IPi+PP3mwhpptWrURbup47ZDjqVf2bOgqndwWAJVoV2QQ33SQ2Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+0wlGBtVAhCv6F/t2rg5cI8XZ9i1yCyL3qnM6za9V0=;
 b=UQGPE8tfAx1wgMMePkkuPZT4FJBapIYzFwg+U5DI/GLsZvwv4clU3PWo4nQ4UEmzs9iIdYVGNKg87t+gO3f9RLFuCkdU43XJ2n93368Kk+D/CvuweZTO1Oy12NELfAjH+SjYsdVJT8ptrnKoGwP8jqCqCHQRJQ47IVq4x1GYe4EJS8stfi9m+rucI9h240WtNFbVEOkDK+t3hBWxVM6XFbJnPxFG61R7T4xYXSwi7IjpR8VR7twUb5gQlfKejIK8rzGc7h56jTogQjgvPT+crLkLC5xMUkWbKm/XjO7VfGg29ITE63jtYNSVYGoOs/DAcfFV9hA257erEetMmH+C/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 09:41:05 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 09:41:05 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M3.rc9)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M3.rc9)
Thread-Index: AQHZ8VvYaqL4N0CU90ypi/JSSfVdjbA2RGog
Date: Mon, 2 Oct 2023 09:41:04 +0000
Message-ID: <BY5PR11MB4152A33637E7DA2FC2C8E991A1C5A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018ad75ed749-5e2db305-e6df-4377-a252-c0a5c90026f3-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018ad75ed749-5e2db305-e6df-4377-a252-c0a5c90026f3-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|IA0PR11MB8417:EE_
x-ms-office365-filtering-correlation-id: d534c2d0-2f4e-4ec1-0749-08dbc32bb297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wrq3mufa4ow2Rw61vbJvUBYJa0ju//esIoDBa74BtYrEkuJ3Fvhfa6TBYV/MAXPtxkoVJmlmwdbqpaBVecDVUDCwG4PBrUkllrjBEZTEbAnGSlAEFwXveQ2iImKMSf+aNDfTyzzJ/FGZtwJRJPmNhwSZ9MDJ1UZ3J73avrOjCKxUQ0oHxyqhhF0DRPNf017pUyaR7OAUez6SkE4OdaZ50iZT0IHer1jY8mHBoZMNZb81c7q5NtPQtERt1WXTfHj9Wy4GES4r1IJq7PhwObbI3mp263yXYkjVLfl+aLPdllI9Yt8FhkwH2zQDEZTcwnNGH2KP8EtVJ6MBSrafnCFnmoh5V980fQp2GIvhSTwnnn6hw1COw0PT743YiQGAJWF6um25nInNypy5G06HwScsXImMNJYb8yOFkUfXKa88SKfsBBIah1HzmufZECrbl7234l82Yfaz3twy/3WvxaASW9PnGMAv2hxv+H/SKr34qtewESdxfyH5xpGc+6cPAGjz1TiAolG7LnWNLd4vdHUZ7TtjZrzliIxd+GjoWVALn6ODWjKi+poe3VpAg3CdFo4/ExHaWMUr3wHrPJapWOaEHjUAU8WOL47zilcUooUpeGY3d8X5Z97rUak14ytVToemmx62/vQ4QPwM2grLkq2C0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(55016003)(6506007)(7696005)(71200400001)(53546011)(478600001)(966005)(38100700002)(122000001)(38070700005)(86362001)(82960400001)(15650500001)(2906002)(41300700001)(83380400001)(9686003)(26005)(33656002)(66476007)(66446008)(64756008)(5660300002)(316002)(76116006)(66556008)(110136005)(66946007)(8676002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PFRBy+QA4aYIJHG60V5tSCbJpO6JgYwXAi/640GlGPGGWsuEklbnAkJjC2gf?=
 =?us-ascii?Q?J/e/RNG97C0QodP8QKjRFU7koTq/yyK6aNxokmbHkfs3aw2SKatDoPG8fS3m?=
 =?us-ascii?Q?HdVVEHxFQGG6/pAA5pVMrEn0U8w0STIL2JGpxXoQg/yf0h1URcwVOGyqSBBj?=
 =?us-ascii?Q?0tfKwe0NblY70FtUWE4aTTuskalPpNzJP2SnwTy2LHc5buXCXD2XYBZI3cUT?=
 =?us-ascii?Q?l9JN2tz5qdmx9ss34iBg2+xsMAvWzaqQJbRaGqezJhEhvTkx/Lf8x/6XKPUS?=
 =?us-ascii?Q?+n7TZO/0i3MWwhU33LFqb1WyiAdQHoJKWDFEnXnFk7+DBNhg4EXbVp4XUtHQ?=
 =?us-ascii?Q?f5qWbrTlSjIuwPlGcXw6+/TE7RU24CdkInbHmuGeu+t2LyjBVzbAERGpfiJo?=
 =?us-ascii?Q?BsDnmFHRFSCIzwVd3gDDmHSY+ys/Pgz6E2soUziG9JlGRJyQzz5eVV2kmRKA?=
 =?us-ascii?Q?0C1DcDgzZFLoXGv71pT+IkXrY7FyR7iCTJNk1a+akWcCB9eUVEnU851cii9A?=
 =?us-ascii?Q?70ZurESoAiDe0lww7LGSJ0QkvMNWKUdRpR1AlFH7plrHllhrY8agrvukZQ0i?=
 =?us-ascii?Q?RUFqBAcLmUdb0Lid8pNRoIBBxZbrJD5MiM1+3Ul2E7u4eguahICxLvHOeZvq?=
 =?us-ascii?Q?L5l/vnYkGpk/ecUj2/d3Y0ZjYJDlWkk5e45jxjdu8efYpcSxN2SbaohxAWrs?=
 =?us-ascii?Q?8nBofpBceRb2tvO61uaJtnAo7AU/+h36NLPmWkJcARmWtaxJzL39W7NvS9OD?=
 =?us-ascii?Q?nJ/PaoBJKvion+FdVWND0cU5GnS+zfbPB9x5yzM/gPCni6HPmQs1wSDRETga?=
 =?us-ascii?Q?KhOcNjgBXx9fj9GMZnCSR3nDkgWQxjEvXz5vFF2ZCOgxPPFnAguDvJP6PEmz?=
 =?us-ascii?Q?PpC9n80xrZqJH6lQlOz7h4tSVemmRuRM1b0vB8Tt/6GlkBo9AzqFXWnhUMeZ?=
 =?us-ascii?Q?7N0GLFxMtshrO5UiCtAze48TkxFZs4io15XvwMvrht3HHyy5J6fGLa029HqO?=
 =?us-ascii?Q?JruunP1I+c99k6tN1o2aEHblTuXSu3cZ83fb/5QDTGcXvt34zxHN8HCy/pKe?=
 =?us-ascii?Q?/EnkqHsVHEUP6ZecH0vtIG2QGbdzF6kkTNE//CcyPFrZjMy+twhdtlaaF46/?=
 =?us-ascii?Q?bzyIsf+4gpM1M9mTtp2jGEdVQrJ73SdJPNZE8I7lQJEPf+DLTTdv3Uue5uqF?=
 =?us-ascii?Q?voyeYAC4EzWq9ZzQazT8LpAlLCBey/42ysfzhHUCpcVIBlNBiZRtYuucSMeu?=
 =?us-ascii?Q?YGCZHEc+hhzwkCzrPs4Ri2nmAinXKURuPqMZ4GcE0qPcKioL3okQgo2J4uo9?=
 =?us-ascii?Q?TwWDz6UhC/7IV7E/GoThEmnMUy4i6X7ZU879dHjRq9VxYaFfTFddNdRZscFu?=
 =?us-ascii?Q?4DK/MN7fFC0d1v7ibyyDElo8+eWkNX8CgMpkS3NOzcMMUFzqhKGdDr7WtSE4?=
 =?us-ascii?Q?EbRpmZtFIy3oG6QAdHGKKV6BXH3dnqTaVAzwSw7X4aWKmDARlSswXU45akLi?=
 =?us-ascii?Q?AzczRgsTohrhPDG8xQXR6Q78ETSZMnn07gR+ZUU81Cw3YoyGmCy3nEBZjeF6?=
 =?us-ascii?Q?UYRkcMsYHdapwgTZGHPYMv7Ui0pYlqS7QF6e/+sc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d534c2d0-2f4e-4ec1-0749-08dbc32bb297
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 09:41:04.9999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8q0spnT9Xq3BCpuTBHB+mRch17OxPzQ/Oh6wvh4YNQJi2XdtNLSIN5bxS97yePtQKZsc3POlATLXhRQ6NKIzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 09:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188593

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3_M3.r=
c9. We are planning to execute following tests for this cycle:
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
	6. Beaglebone

=20
ETA for completion Friday, October 9th. Please do expect some delay due to =
holiday in China, will proceed to submit test report once completed.=20
Sorry for any inconvenience caused.
=20

Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, September 28, 2023 12:01 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M3.rc9)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M3.rc9) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M3.rc9
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5949
>=20
>     Build hash information:
>=20
>     bitbake: 612bdf09416ff96d08b22cf92b077516d23d0963
> meta-agl: 4a14356a535dcd47f16f788ac830d0d03457c9da
> meta-arm: be9bbaa16ed0d60490fb8f915fc48e40d14478a5
> meta-aws: ba6a653f0b5a4fa55e71646f0fe1fd0673d2c947
> meta-intel: cc04677a2717be485bf9cecf4a3d48f8a1e601cc
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: c40aebd422e60126c3b18e35c20a1cb38a795a52
> meta-virtualization: b65fe24b8cbcf8797f31d058a79f8a21985e955d
> oecore: 1adf70729dafc9729e665986ad2e2250cbd25c5b
> poky: 6cb490713ed30f1f13d25978aa0d377ce66b1861
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
> View/Reply Online (#317): https://lists.yoctoproject.org/g/qa-build-
> notification/message/317
> Mute This Topic: https://lists.yoctoproject.org/mt/101605286/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


