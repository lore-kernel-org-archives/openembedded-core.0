Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C908AC41513
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 04:24:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.788.1690777450806084887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 21:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=StZTI1TY;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690777450; x=1722313450;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=v3rApxdaWJ52L0w+i6lZB1HKYq/j57TB6FqO+rl9gR0=;
  b=StZTI1TYfP7YzKPtuQ3cA5Kiva4snjcWLs8JIrI/zZ05N2XbHe7Y0ETT
   Aes+AzJmv3ZvjR6IDt3gyqnMStyg47senkvpgOCbQKck+7dFiZ/6rxO1G
   deGs0q+LLeFKBl3n3VdyAtRakQuvF0VkABARGBEMhk5N0AK9nE/qpD4IP
   2e1Pz0HFe/cL5Ez+XXpJATDnOsHRllcES6OITtff361LV2XF3o4+moVsn
   UzMxhLF9eRRdZm1rKkgvouqDnYV52+gMCqdCnrffqtM1xPcHLXJnrD4/t
   LkI/AS30gWEIkbMivUTD/auAkRj59vJpw63XAw+rVyh6LW5kfC/ZLWEBT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="353829872"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="353829872"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 21:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="793566901"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="793566901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2023 21:24:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 21:24:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 21:24:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 21:24:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 21:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDIDSDCVPYDbP5/0kNy26L4rWzfFTUHn4UKYzrRBlx/7VVr3+VOJPNru2qwjorw7TsHsDZL+nVOshQEsPDxvLTm+WmrCgfb6oFwkBZCteuqy0IDT3tvojI4IFbK2mLCNOvjUKyG0T2LiGpUHIpUJ6CCaNnaYaX8NsGM8nVn5AzKqkhtfM2UFJno9MIC1sq9k1ZZWGpUvT9dp2ygLSzaXlCgREp35tCsws63CmvAeprEbhxx9ieZrVwqHIbDK5PRPZK2Jx9dmDpbv6MwzGLn1VsTpLZ2svQu2HVYmlW5EvIvUDPiiDgIxA5f4TFG2SiRjl+kiZuBrTaHwAqyTmjDTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f15VRMqdO/2Xt0N+WGCp/FeWYtnI4eB3LH8O3CTxnwM=;
 b=R7Y9PzpXNMzqKTfeP1bltDQ4CDRM+MApP1yC+MyZnbU/0+cEdZ2Bbbs26pg45t/dylHBeQwAHZz25JSI1ngwasKQkFfc057eo39ouoJOzr51Db/Anej7jjubzDwOr89ct0VE0V/vbnpTBGsGfozIlmW/shnfSwI/XKzRBKeMjjwUi4ZfVKs2AeAMuIV25gjWeikqhlZqSwO2Hf7hKZB0Ycs2JsGyjbE61x0PCpy+bYz1M7s6aiQYQD273mXrbdEOlRi9LZyA9KlcVh0+wO4RlDxt/O+f1qVD5YzvXJd95T4Po7ow3MDoUeH2EJvUne1M5yYmXbjvhRtxirsCFi3yBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 04:24:05 +0000
Received: from BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::d058:5851:d961:ad4e]) by BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::d058:5851:d961:ad4e%7]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 04:24:04 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.27.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.27.rc1)
Thread-Index: AQHZvbBfrOd1JmJ13EOoyHPRBAVAYa/TTv1Q
Date: Mon, 31 Jul 2023 04:24:04 +0000
Message-ID: <BN6PR11MB41457B15DCC4F814D7D084D0A105A@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <0101018984bfb447-6fef57b5-dfcc-4b0a-9cb8-11dd75284d77-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018984bfb447-6fef57b5-dfcc-4b0a-9cb8-11dd75284d77-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_|DM4PR11MB5390:EE_
x-ms-office365-filtering-correlation-id: 5dae4faf-221c-490f-7d6e-08db917df99b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1wIpHkk4gv07xDnT60yWzbMFM7FEFcG7ZeJ4QCQkohrFhtHl1LO3POOknwgoK12Xjd9pSICtjqHhhA3qckZs3Du+9TRg8lhAl4KJ3G8L3T+3J+r81UyEYw2Fk36Qe26tw8FLy0qqYpmiNjYIOyxjzxdELlA8eeixijGvjCj1NyqKapYAPk5/5tkrdukQUNeeK13XvAgSF5dEe/aK2HbZkQxAm5xc3di763phcjWVuNdcqg+tR/ETfcncVE//sd2LBgskFFtID2gSk1x98fxQKioVi8xU5Iwz5efn2YLiJqB3e8jaACOGOZ0VIE8NdNeW9F+O2sAWvUpEc6K497enslC73YdybmFf/iqGiNOuo/G1U0rgtg+JX3K7SzJ8NSKxMS/5Jj7XxzD0CKLVGwhGNXce3Yw48mtTqRPgvCUqqTLa1+bSchCdJQc2NxYtOd7kOsd3R860L3b+Wkhlp5vgmx1vumM3tv3EXK0Fp/ZFuaPjbvsHoyIu/GomAYgx/qwJQGS/VvQhiI4L92HKG1vNCs5v3xPY33FOzVEVc8ArOQElFHxlWPoBpDBQlgwFlvrdPi2chSU4p5oQre8dDFAz7Ul0QXItTVtWtx96LoXzJCZeWQEdYZTrJlM87kJO0QI9o5CpZlr/Rx/bLyXC7+ziA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4145.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(5660300002)(52536014)(6506007)(53546011)(8936002)(8676002)(186003)(83380400001)(26005)(478600001)(316002)(76116006)(66946007)(110136005)(66556008)(66476007)(66446008)(64756008)(7696005)(71200400001)(9686003)(966005)(41300700001)(86362001)(33656002)(55016003)(38070700005)(15650500001)(2906002)(82960400001)(38100700002)(122000001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tv75pgTHyaAWQFsPIHjFqQJwZ6SA91LTHRCk/aJc58KRquzqbMW5LjxiUzKG?=
 =?us-ascii?Q?Er5mGun5omhYdagB6n1d5IzrxaVxPvov0Mf9/iBGuGWBApNPb6J81TyC/Q12?=
 =?us-ascii?Q?Hl+LKuFdi0UvhkgoyvNdRs/6JYhgMNNgD0ch3MJU7K+i1XPWFFk9iTAIIU87?=
 =?us-ascii?Q?oCbVzPR7uT0TGHscjKq7hrKlmF0cUNJF3sUMryG/298A3XPjlEImPyOL3miJ?=
 =?us-ascii?Q?hhcIaYMtJe4QR0gE7hX6RAXlnjd08P0L8WXzmMlHI6Hx861P3/9I879Z/hDI?=
 =?us-ascii?Q?/ezREwS6bAzwDa3rKJlBXqDqblJTyJuVH7u0JI5we3vmpgV8dXxQH7jj4h/a?=
 =?us-ascii?Q?hmvdbdT+Wu+JIl5gJrP0tveKNsfTTRHRPhC7R6wScg9+0qKey8wbu6L4b/Ad?=
 =?us-ascii?Q?3IYx3WW4t4cHdJ1QlAbka6pI02lxHK+N5jLwFXlVnD3fJ8DECInT+UtKD3Jl?=
 =?us-ascii?Q?X7FLPjy2LJo5qLc0yqDCsTd74qJZ5Sw+y2Y5yIuPAWtZN72QEbvkGi1n1z1O?=
 =?us-ascii?Q?WB7bowqFAfMukbYG6bgG9ELh+IyywSdriR0WihD5GQnZD9bqFr1Q5BuUf81n?=
 =?us-ascii?Q?EhXt2ZBXNndY9Gc1fTOivSkncVLXMgiuB1yPfnI8cnSONgb7K8zbC2xLHnn1?=
 =?us-ascii?Q?OieSSiLMzyzZq1B/CF0gDjIcIQvQinDEXj7H2cny6E73SGryjEMSnCpGYhxH?=
 =?us-ascii?Q?2zLMbPG9nmS/fe9k603PDi6c5j92cIngLEYNDbLfb1bde8M0zparc3dQQrfQ?=
 =?us-ascii?Q?5FLq1i4l31Tq+3Rl6NKRuBiDq0yeF/pU7aYQWICj/3dshtTj58lC4AtEYMgF?=
 =?us-ascii?Q?2cdii67iBQXpLHdgG+mwddxnSfrpEeByssUNYCUf1D+WiPwEQf3a2ifwR2uU?=
 =?us-ascii?Q?pBiPxY6WBy6xEu2bIlY/OO2qDb+OYYDyANWOsfRf9f0WNi/ulp2V/mG6rg1N?=
 =?us-ascii?Q?zV19Ij65lkJCTd4n2mEK/gJf1ZQyVCoAX0uQrwghHaCGfU+McbvcL/cpVh4r?=
 =?us-ascii?Q?p8gwzxbpqnXQLUveFCgTkavexU1WcktmgI93OyzrQ5SfguQbecTu9o7Tu1MD?=
 =?us-ascii?Q?GINrSQT9GK5susSwrSHiYp8vfQZGRVthePDP/Nqw7VwObG4HRbsolN+/Cfm1?=
 =?us-ascii?Q?++LwMQmhhba8iUUxFkezyaeKcWEF9XyJ+OSVggUZIWvyuZIXy4ZYckPxUkhi?=
 =?us-ascii?Q?lAcIhkARdyJgOtF2dwk9y2vyccmxkR0aQf7SXHm2r6YvZHOyFbF3sKmf+XWd?=
 =?us-ascii?Q?7ohdzIH/pjJr7FfUK6TQn7116iu+KcDpjanU66EsFQAkZk3UzcFbMbj8BDVV?=
 =?us-ascii?Q?25xLeKPq03nzewyPpD+EwxzNSczKyRhsrJqPfzf+kcee8/+ZAPCGg372Qrv0?=
 =?us-ascii?Q?nDQzI+FMFz+XU4MFaU4b3TqCJwoKj8O0SzWYFkwtexMkze84wmn+la8gSw86?=
 =?us-ascii?Q?9anfUjwDPjc9BAFcrq5fqdsEtmHj89bS2vUQ3ZDD+QIMnOJ7Lhk0Tzdul+2M?=
 =?us-ascii?Q?VZ8jtHId33KSrdIqaBNA1R8btyFGPzuwUEh5607v3w9qMw5Ttpq/XJMoWnZZ?=
 =?us-ascii?Q?uMk39aoNCvNd1jD0c/gldHBVUUu+6cB560X45gbh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dae4faf-221c-490f-7d6e-08db917df99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 04:24:04.7522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s82V15LL1zGj3BKgXOiR5ajnDnQ38CNOQ38bn6XnFppkGJFYoZl0QEBmkVd9/P2w/JetgM7qc9aOaa1tMKLXmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 04:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185116

Hi All,
=20
QA for yocto-3.1.27.rc1 is completed. This is the full report for this rele=
ase: =20
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
> Sent: Monday, July 24, 2023 5:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.27.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.27.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.27.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b60c7085ec370473bea9b3b4b65826a17638837f
> meta-agl: 583f80f8e9d085a98f1cbab3a9d8082503ab739e
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 9d29db04581d732313a5b17a84d1df004056e002
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: b5282ece919f016d91a1043769676efb02b4f0fb
> meta-virtualization: 521459bf588435e847d981657485bae8d6f003b5
> oecore: ab6a0d053d910c3d50fcb06e9c2ca98430b673a4
> poky: df86cc15d0a39d8d85747f7acc2c887cccfd9fa7
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
> View/Reply Online (#282): https://lists.yoctoproject.org/g/qa-build-
> notification/message/282
> Mute This Topic: https://lists.yoctoproject.org/mt/100318994/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


