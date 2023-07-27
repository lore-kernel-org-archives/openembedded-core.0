Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6B2C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:25:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.6.1690428343910931852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 20:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fQeSNdit;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690428343; x=1721964343;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GOfSOkybWINMVr9DDnF++1Fahj/GyxWS8B0w55h8cmE=;
  b=fQeSNditloBa/vdCDtWVsu5f3MRoLnmfjsCf2QCj3aYDJFGv2OR8ehuZ
   rteDvi9WPUF0UOe87zP3Fu6IEvEAmymeOnG2aDjl/TaQPCCkjEhdfZ+OU
   7TZjyQvBhy0cI2xTLDI5S/o9DUtkcwMRQJySQnFeTzFsePF6Ri4TqZHpK
   cOUestFmLDvdXkJthoDljFY+eN0vKuWqrtimpp0pmgjIsaI4Ndp7C8IP6
   X0lRYXjsSLzGPrqMbtiUFcflfgPF/pAPz0kHxzKNk0+0JwT5ZIa5dx0nm
   Cxan10k5abRYRgyAIWkp3ZAzXGSUXg+rTm/6thtKQRgJ9sEKur1hNX8CA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365649410"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="365649410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 20:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850695662"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="850695662"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 20:25:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 20:25:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 20:25:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 20:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKwb3QwEYU2AnbzlRd3E8XQugOtR5l3yZYJjUxzQtuJPGW1knTPoQi3zWLV2I14gWKVuDYFeI5JWHCrIxzIyzaO2nkob2vtjQ3Jo3xXGTF8ZEo95DVeo1/kJPdQk9sqWL71E/GZ2Wqr6jP+LBziyJCz7jzPP2EI4KAOdvx73Hnb9+uFVIuBYmNXqndCpsOh6AsVo+fkAhYZCedoOGab/oEmrYGzuebPfQiAntQsrf8P1eDb5mHOhgnrJK29Jo4458y0+MJEb7egmXwgjctME8i7Xflcog4x3RN1ZNCpptVqRqLS9xbBxrwAFCMPAGuFw2IQkJOCSnQju15pNbsH+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtGgsC7NqiHfDikX+49APwGFhms+VJEDE9jSyLinF6k=;
 b=M/wyfQS0usySYPo+wgXzv9ZE41ixv7NgcgD/YLFLVb0s4lWqYi3x+3YOilrkYk+fOLGy6PPE5a0lV4bKT+6+zusDqs6rWBWRxkEcAzdfvRo158J4c7ER5/hBkPRh3zqwEob8GEfJSrmK6psKUmdUM7uTU+VbIC5AhSdA49KqFp2Q6YEw9+bxDUS1UDB55CgCeykvW0sa/LRjjGsnF8FgzOPUmNHDuhJIQvFnlNrCHbSqmmBydVpb4vR+mJlIvxjwqKWf+hechdjF1VZ73/OSeZKHMeoh4Icai4pc/ZaGtu8T0dGoGO2i3op2UuCljzfLvY+A6/dYoWy6ANILxlATrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:25:39 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::d9b2:da24:5b68:eed6]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::d9b2:da24:5b68:eed6%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:25:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M2.rc2)
Thread-Index: AQHZwCLWR2cbuHfYpU+JHkhunZuH7q/M8vVQ
Date: Thu, 27 Jul 2023 03:25:38 +0000
Message-ID: <BY5PR11MB41528C1D181F08D8412FDB9FA101A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018994c968db-984564f2-0172-43ae-a91a-82b306fdc587-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018994c968db-984564f2-0172-43ae-a91a-82b306fdc587-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB7038:EE_
x-ms-office365-filtering-correlation-id: b5aca536-d37f-4e63-77fe-08db8e512657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6VajZLfbNGEY3mvzRgnOXCvfMjbyQpcqRMCPBxw9NOPLwhHOot3lNSoNwUDl36/G5GNiKlOPIYpoSldh25gd7+9Kzj4qjMqvGn1HY3YwsVuXn6HKErqqq4sdHwFyQYNuzfjTu97xf/W1TTEQKecaL6VhrOfztie8Waw1fhnSNhIYNfMrrsNUaE3rYDkZE/kuDd0VsaQtHqvfBKixl2zTrGrwEHg/PuPAx9xphJSpdKbhuXGypVOFORaH0wkgNMiQCQypFSkuTF4nRxFjWUcsUsSm22n1uPMMkS+7q1IAOkNRRbgHpCNcuNYgw7KA5GZuWStNl4ctP/VRQ+jt1b25WWYMZ26l8KTW277LDTtseCliZ/FgBpLZE/BgiW+qHuw6VYZi4T68Zkk1ntwT+If+UV8sFkF0uZZAFwlQNVSQa1xJ+RrCLOY9waMzS1QlK584oHA8/UU3H/XPAYlF7b3BcZAyHyVYuDU/zLyn8ewoqUyXWPNB4Az1dO7ptKlDR4QAPRIz/a+ZhFudw3GiVFca3N2zbKcnHyG2RJp9NoVmjt6BHSRhqcQZDuMU2CvND7WhQeaoL5yEmcPb6DWjnJTmEaeFxazaLj7I8vUtIlGZvaxMKk8ir5qk+5l2F5aHyJatP7GNxB978837UirwYDLmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(66899021)(41300700001)(2906002)(316002)(5660300002)(52536014)(38070700005)(15650500001)(8936002)(8676002)(33656002)(55016003)(86362001)(9686003)(966005)(6506007)(53546011)(26005)(478600001)(71200400001)(7696005)(82960400001)(83380400001)(38100700002)(186003)(64756008)(66446008)(66476007)(66946007)(76116006)(110136005)(122000001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mb2u4uL8vVKYyDEm9c8hrbuFLmrYrJdotyc3IFoY+C5DLzrbfQlJAUV4CJOZ?=
 =?us-ascii?Q?33r5Mb2UxFMxaEKP9SyzpDDp41k3+E30cHsF/rVZ9ZW/tFUNrFJ8Nh46AlSq?=
 =?us-ascii?Q?ZFOwjF+4tXvOKnvEc+i/aUR+qnY3dMYptp93rviJHgR1U2sF32zXFwxYQYJH?=
 =?us-ascii?Q?n6Tuobv5o+naNgCsZQvwwf5m/L7ZDnkC1OoOYkQaB/AOWGPX0dqPFsK33eJk?=
 =?us-ascii?Q?MSLVIibvOzxnfyD09JaZAczNXebrFGUiE5b9dL9AWz1o+jARMHzlMEGlDbby?=
 =?us-ascii?Q?nKfK4CvTGtf5qHR/gdMQqr1so4s0vzumlVhef9ng71EzwsdX1/8aVkuJDpPi?=
 =?us-ascii?Q?+eTy2Ri/2sIvcy1TyruA5r8UfEmoiGduxFpexLvTyuIiMA19/gRAWC9U14yl?=
 =?us-ascii?Q?UaocEipm8sUGKHzVm+WAFnDx/0FLzPE1pHFNdjrb/za5Bgu5oqDENJzkE6I7?=
 =?us-ascii?Q?bbTbQJUusdajdDk0BcvAi8e2dfqYd1zGOY/Hyx1Xfp/OLHWMtmabfOuKLq3k?=
 =?us-ascii?Q?Fgvmr05GOtwmtdGlVgvIQwfv3uafKUxXCUi68YYogFXYZhtsggxN3e6S2kAq?=
 =?us-ascii?Q?8MhqvVM6cm7h2Ucl3c4IrdCGUe8aXnslMmfqUDhnCxo8DXA4BYURL77BksVS?=
 =?us-ascii?Q?uVk0EVo5o6saVNavBSaswiOM9pDsIIz3NBqK2Izg0Pt4obkPpivaSHLRBodU?=
 =?us-ascii?Q?qtc49hC3tYqnNuSeSdSVW7Cvn8jZRTZJqOHDoRrkALRoY8+UEuNawcpJqtUn?=
 =?us-ascii?Q?1vcbpogOomaoTrQ3NtDhwOxrIHVpR/BKhPkQyEFQ+r3j9kzBoDcUw6k4xW0r?=
 =?us-ascii?Q?GGxboXd59a+an/61MC2A2d6KGBy4kZPRgHQ5tdvb7qobpCrc0FgQjWJV9M5J?=
 =?us-ascii?Q?y6QTgSTTy99eQ80WWIk07fYEpnK4PwvBZvGx40urg374bW7+ZUms9hXTfV/A?=
 =?us-ascii?Q?Af2270F9a50T5UCS/leX2sLbpRTmr5LyYBpT20iTaQlFX7k6PeI3Owyrxvfe?=
 =?us-ascii?Q?+1myOEvgcstm776RT1O88/NprOHXvnsnFL9RjDcaA92JDWq78HDTzIpZjQZV?=
 =?us-ascii?Q?dIKOSgX1NBsQrRRhHvo65piqBHK5319gE15CYL474DH+GQl/2uT1Bw7qp6sU?=
 =?us-ascii?Q?eEUx0C8kLLEQIfN1OwPrsjPlEh5TjfY86TvUhJkIS18z9v2prM9/0ZScX3+d?=
 =?us-ascii?Q?f7AIxN52LFq1cHmcyDR9C9PQ6n3/QLsgLnAsCfAu83655j9lWB8BEkT2uFvm?=
 =?us-ascii?Q?TnoO198kWUXH3j4mDEnDiMvA7IsRGg/rZPsr3mqAamD0+RbtPm2yLVQbIhwV?=
 =?us-ascii?Q?5FlTCVY7bmLpDmF3JO4LU5dHFrbMGAJdew8ptkd/Iu6lbzDKh45caIyVT4gs?=
 =?us-ascii?Q?N1Q3/IfJVJ/C+BFnx/0g1YckICibd4ZTS/kiO9/r8AgjsCqldarePfVndNYN?=
 =?us-ascii?Q?8AfjU3sRXB0p71CAs+uVY0YJCpwMbLRnTxt1MkUAdeus+wldXObtsTMUYmTF?=
 =?us-ascii?Q?Q8+LhjPlR57kH5kTtN6fwU50wJ2+IKtLwephFDvQo3HRXen/2+wpZbzhH0AC?=
 =?us-ascii?Q?2TLWFLFMTlzgbEveGVTNq0NqLx0rSOomzspZNmNh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aca536-d37f-4e63-77fe-08db8e512657
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:25:38.9569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wi30xSKjQnFGKeoahdewxoWWEFwYUh2uOeQzOCYEQAZD6FR782NSCMri3Qhg/uijoZpzzIK+OuI1fuPq6toxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7038
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 03:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184905

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3_M2.r=
c2. We are planning to execute following tests for this cycle:
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
ETA for completion Monday, 7 Aug 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, July 27, 2023 8:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M2.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M2.rc2
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 64bc00a46d1aacc23fe7e8d9a46a126f3a4bc318
> meta-agl: 25410a640b879405d4f93585f3d74c328f487cad
> meta-arm: cfcc8a4d13c26793ecab2d8da9274eb98b8cb4ce
> meta-aws: 86966086b2dfabd7113253bc5647f87fd6d42423
> meta-intel: f2bcad2943b11b8c9d9ecdd25551a841ba98eda0
> meta-mingw: 92258028e1b5664a9f832541d5c4f6de0bd05e07
> meta-openembedded: 74e70284acb2eb2f2a47a1ab1aa5ee0928d46344
> meta-virtualization: c5079557091b215663458807a8f617752614a6bd
> oecore: 6ac110c8954e5fdb71d5495e3eebc1ca3958dc19
> poky: 3eff0eb5ea77de20d85a2ffc64652579cbd7755c
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
> View/Reply Online (#285): https://lists.yoctoproject.org/g/qa-build-
> notification/message/285
> Mute This Topic: https://lists.yoctoproject.org/mt/100382706/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


