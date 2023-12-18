Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BA2C46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:09:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.39433.1702886944856592428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gzK8IUTa;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702886945; x=1734422945;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q/U+2bptonvSYY/V7t+N2eWUDI7uDuz0xh/Fb1ijgj8=;
  b=gzK8IUTaQT/KBSPbqlCTcyh7PM0RPz4JZT9/Nro+bnjyRW91sy5GlZlj
   LcCtqo++7roG7OBCmPUBBtOwiszKOJIUjnivrAldycmL6jbTJgqWkd9CU
   jnDme2IVAjOwZ9Fjqcm250h5rY1cIJYrBnfdSAGvWwu+/GDu0EGfEvH63
   ui+zKssHJJOtKy9uy/erK0SWJ3OV9H9bBPIcEm1xZsrPwTY6/WpC0+Yj+
   dppOvYNt29E/TEGZ1hh9jVChnzAfbkfttrQ9HP/UCQMIQddT9IpuktO6I
   m/6Xd3taIDz9KOipf4vUS3kNl9VdmzpK4tsTJ31pHIERUjLioOivQL4pg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="17028104"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17028104"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="775480364"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="775480364"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 00:09:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 00:09:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 00:09:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 00:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH5WweqbWxWdbCwdfBi/17gLr42j13tJV5URu8VAQjr8vRyi+r+E40AqBqAiAmpGD5IYCf7hqrmWNV7laj6gEdXxIgkcXMuc6Z7tXzE5we70gdZUviCmFPrszaGcEuUzlCs0ywPzb1gw0+UHixJo7pvf+PLD6cXvHbwg7c7+1Ljd1lGYZPlkLXP02KbPu+l9vYoVmicn2ovN2JecziMeDc1kMq1pv4877oEltBZgH6KScH+2OFyBsoStTvO8VNlNGPjPI2+AoF4Ab9l5448Uat5RGjQmZAoIHdbGhxxq93CcZSTI1Bv5N/lXl9kv4GMLBhKXQtplLjsUqD0acxMc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKSsFWS9p6YXMtLX+tdZ+AM6wWVkITvOvFpRnref4wM=;
 b=DBspr/EFKXObe0VwY9Cw9ExI/GABIWXggauXDyFE8d0vwkHTUNGvFPCdz7DpXtxFi1UuxbqoLCVG/UO0Y/r/DBVziUXmsabiaJoLQ+GbjnjeBGyRLzmdTKa6lptB82p3A6uA+q910kjh/uAYU+qSCpnZZee225uI+R84MPBSNce3ltsbCTYEWUvGVgfuuVn6ua5tZ10pOJ42HHTaY8LuYB4vmGJV9M9D+CxulRSIxxvaKLx7yMZmWFx8zKMJgEl9LFN1VnQUnJkr51QMgf4ufqlZkYobvIY4aj5Ggcq9k0xf3eVKYr+FAovKVgtezJD7+1SXyiTZwN+A2PYRtt6fEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Mon, 18 Dec 2023 08:09:01 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:09:00 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc2)
Thread-Index: AQHaLMHNkGq0UOk9vUyie/ARxhi8QbCuuQNA
Date: Mon, 18 Dec 2023 08:09:00 +0000
Message-ID: <BY5PR11MB4152733AE2A86A149F8FA13CA190A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c5ca512a7-ba5e6eeb-5046-4d6c-a260-eb3ca42437b1-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c5ca512a7-ba5e6eeb-5046-4d6c-a260-eb3ca42437b1-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB5972:EE_
x-ms-office365-filtering-correlation-id: 8969ee34-7562-466b-7caf-08dbffa097ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WNIYRj3rx7UkCHG6faqGx2gdYikKUxadeAlRK7+ctez79gvkGNbvEY7a5X/AkYzzu1FFBJ4gtxQh/v+GMJlCZp72KhC2+9xr1w1FwP6H3ebXSPIUeOAp5cc1rHqBR6YoW/ifUrYa0BhL4zzoEt6B53uLwwQOsCTAmSMto/zd8KGJTE6rg9/+8/CMUWvKFLLpoLgkVUoI7wyZHKibhSB0/bJzJ/7+HR1HC2gIRbVK6TIQ4lT4XX/n3VJhtB24my0eN5PyZ3gfTCgI6Om8pt3eyQa4f/I9JKp74Q5TzPl0ZUcmhFqhM+kizXZ9tI+dB4Qyb31ov1G1p1u/OLC6Z1nkXutQWwQbzg4UJ6Cuzl6ZWEBNNDdJnH39LR+YXT0GexauqLZt1D9Xtws3q/VqyGGr4tZAqJvq7EyKAGI2+qJcJsZXL6IHV17bZ7XlDc+fwU4DV7Whj8NnmuOY1fExT+pkiHI341irbQnTGZsLzWKe7+Un+7/ftuvtN5SJBeulkCEbVssuqkMDKXF3q/JKp4w8fm2mX41AWhAekg735y4jANktQIn8jCnYQLKiPUNtpJeYaE8stTxl0VagF5EbalQsktG6lik6R56NhicC1QoK1uInrqjJ/64Z9wLXfIs9KuCYdk2/gdqdVu+fIQ+Hvm+37Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(66946007)(66556008)(478600001)(55016003)(76116006)(66476007)(66446008)(64756008)(110136005)(316002)(38100700002)(26005)(966005)(52536014)(8676002)(8936002)(6506007)(53546011)(7696005)(9686003)(71200400001)(5660300002)(15650500001)(2906002)(33656002)(86362001)(122000001)(82960400001)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jSK8E5cG4NNBFEmTRk6frR/gTdO9Spu+3eyh+yVv1oJhYSvMJANdoQPxPwko?=
 =?us-ascii?Q?6s2foRaqv+f6C4Zl1RMfZ+3K33qiZIF9nj/XuxLtKvvmAG6aTjnekPAOPd2W?=
 =?us-ascii?Q?2ucNorF7/sL1wRn+25M+KmP/Pxbc14pI7qpRr172ZtMVbJKUcwYp1/6WLxnS?=
 =?us-ascii?Q?9iJh4+OZdTwH7XSqiO0xviXAbSGFtBAueaD2ogjt6tM2iny1QL9S2meR4KIm?=
 =?us-ascii?Q?jnvEM2fqUWeOFbPUqD3mSVU+KH9JNqn88YFTK1QCfjpQCDFsmYk5igdZLPqf?=
 =?us-ascii?Q?5oUJQUrb6lFiT1Hlb4rQw3WHaF5UDvsZaM0Nuzqz6m1Jxk7Hl6v/NLUQ7Kaq?=
 =?us-ascii?Q?0r8RtaBS8Vrq2noT/Usy8MWA+/EFcpszHy6nm+I4fJjCVNBYMNqbGcZYqjFk?=
 =?us-ascii?Q?Zzt2AvfUAlmJG5D7nfikUzWzAKC/N1OKuE1eN0Odo3kjcTcStTlQpEScWSmP?=
 =?us-ascii?Q?0Ku8XUcW0wxfCbdeEYRMqWLtNYcz86XxC4RVS+rlmN/gASm5hWlWR1KqSUYE?=
 =?us-ascii?Q?KDndHddZPfvcEGVMHV4DqxmthT1g/pC/SgHAa/X4mtPmIs7SfuLuy/dNNtAQ?=
 =?us-ascii?Q?2uOPYsNDcaETIbO6yzQC2MH0DgV1Offp4gMofc5ROivW0jpNYyIETURf/2BR?=
 =?us-ascii?Q?wu2ZXz8SPfPTS0BrQHN9akwUXKTbiihgZUfX8AvuYL+QIbAo6lns3AaGT/D0?=
 =?us-ascii?Q?iU9jMqIzSLfxod9lTVPMG8rHSb6sd+ZemRxSjtQEbuvATKhX/BqUEEsJEmXL?=
 =?us-ascii?Q?VWF8N/bSl/BNyKX8oQyOHFBG488OEjlh/YU7xGbcNWFAfEwtT1QulbFKUB5Q?=
 =?us-ascii?Q?Lz7ypH/hDdGUDod/xMOAzV7UnlTHvWYfVbklzLt5PpMgCdIU9XVrSvE1n+zg?=
 =?us-ascii?Q?t51Ux2NUNI1YFOZr292ZLnbeEGQKGz0V3isNURljm/Qk0+g7A4FkjLTDeM23?=
 =?us-ascii?Q?xtWwcQzseIGdSwfI/Z3BTMYVrCDXuaXlts2PTNrUbkAVInYnEMbcnUHESkLQ?=
 =?us-ascii?Q?ZZyyHmt+RjyaKC/wWo3/gdfxBNtKa+PZDNmotPxJX2J8d7weQkF3KkU4bUTV?=
 =?us-ascii?Q?xEZsOmkCNjmpGVzoqM4Q12dUL6zRapgVj0xmLYcFd9b9PnSv4wZ2dwVc4csu?=
 =?us-ascii?Q?kqCq8bCtxupxEWIG2uPkcD1zMSmOBDmuOMhtYgU8dg5GxBDnsucLLeqAkClE?=
 =?us-ascii?Q?/k7g4h6N7o+c0IyHttIKu3Wnp/TMiXnz8+ONAk6wFZnlh6+GLYUG8rBhkF6e?=
 =?us-ascii?Q?H5XJHjeeCcM6QFeDCPGmtQn1+63j4bJ70dQTEunYZ3o3ZoW9U2/gbagxDWok?=
 =?us-ascii?Q?KhtTPg3Vi+q+IBApd+KywXPcf02IarUTbnQdJ7TEptA7RdsWwST1a3i5S2r+?=
 =?us-ascii?Q?SQFMv+bfs0FI86ycg1ZqUcqr2OyoioFbxjzlCkOe9NWR15IobzSDCjfcWjsg?=
 =?us-ascii?Q?1KoYej3nKnrlcnH7bxZDAu/WvQBRL6DH4g513siJ0+wvpjn6IGTQtWDpH56t?=
 =?us-ascii?Q?dmbSu1bx4U+3O/pcfUx7ygB+vjID2cZXMbeUjgTYNhvtdR/cGyYrh6Hy8EeP?=
 =?us-ascii?Q?gLVUgN1YN/XD/ek2wR341uBs9/8dQkfxeQkOmhwE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8969ee34-7562-466b-7caf-08dbffa097ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 08:09:00.9246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzQDo70qM+CpVfL5tO36Z2IVy8cYQd13NLpzYi9na2bzr/3rIcW7OeO5d6Asl/wvSG5VHpen6y3ynoYAD7OGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192609

Hi All,
=20
QA for yocto-3.1.30.rc2 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Tuesday, December 12, 2023 2:10 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.30.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.30.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.30.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6320
>=20
> Build hash information:
>=20
> bitbake: c0d60794a32e3f8bbfbbd6800d87ef2782aacf2c
> meta-agl: 512d244d48ba0d33f609f425a6e8a907b178cdac
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: e317ca5861b23dad5d0b2468fbe3b4b1ef367194
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: 9135c7ea7350d5d241f4afc3b28087122ebe2d19
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 55157aa2f8b157b1cc63e1134d9eba6db0cf16da
> poky: dbe19706ec01c1eaa1d377a792e7d825054050b0
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

