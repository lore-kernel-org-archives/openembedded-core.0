Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84960C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 02:13:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5794.1668651175456752210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 18:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Fsd5Vc7l;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668651175; x=1700187175;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=12AhNFKyxtYroUXzqBD1b/BKz+fYbVc+x+ruaP8uS5I=;
  b=Fsd5Vc7lxgsUr5kc+MbDFpcCgL13suLXJ5Qp/IXKvJHAcIHybRi6iTX5
   CTRlwe+vOOOIJIPiERhX7rsMoO3D7femTND9miLrA+2PAkytnoSksI/UJ
   8ZWUZc+6Qsi6rV/2bCpvDiw8aFsAwS1pBVJ8hRkv5jJAnhLEFi0alsfw6
   jzvawBAyRRwzwcbK67OCk+S0yRdEz509Bp5WQ0RMAhF2EiwYRsK/gE8Ad
   fhOQu/abaPiIq4bOVSiFu4659hCmuhK+0nRAWsryrgUpLV487f57Wkriz
   s2r4b/YOoZ7TvuG4mLMHmt5odYpELbxJ1eNgmD2yFISjiwlaen+8h26ar
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="296091633"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="296091633"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 18:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639603131"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="639603131"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 16 Nov 2022 18:12:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 18:12:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 18:12:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 18:12:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 18:12:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMimBEv5p7T+a2EfU3Yt+rs9mcsBL1srKMFn6TKY8vZhpG2TiBD/hRLN/yFXTh9o8bJ2xa5alkOr0Dg+/KBqD6TR90FuUjMtKweqoJnst7wVCHNp3povoCm3LQblOu5ThpWNaPN3Z9XQIkPMzZlVeH1sbMhcTbxU9grMHP3yVBnmwypUdG3SHBz6S94f6uEP//84yqmpxYgz9PuBBejeJxH7F+kgpLy4dCYmUh4mT1HEA3tBDl1RxNdMHoAY6GJsv/L1Ikq1iZGwkczzMT4N8ZEdzwQQomQ9/7IU2H2ta7aWEsvW2X3uqso/a39r3txF6KbxRUEjp9bR+WBXgmNOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFTMyx66JGRUk/eUiqMxEwyoVKG3MQ8IgbXnolRVdhE=;
 b=m6LzZE3KXMUE8h0GtIoCgrOfJ3tH1yV659lsPmXWSmFA7AdhN4tUy+RyCRYjH4TChUcOiVWAhTq8qagxO32V99fQIn2Uc+vdsGiOIyTdgmQFqbaB1+j0UxvigKPCfgvhupy8jbMKosfi/LN7KZdWRVFIvuxVDYm87UaEyWrPOpnkE4ChrwlK53PW4aaWa6B1Hm+HoVXj5zi9+s34QC7T1WUIG89SQ+9vqqXKxIlDUoR7PZ0E4JbA1NWHytCnBhW+cuffqhzjgmRBnpm9FRZnz86KQZGPKCDJgNA2c8X5cxbi52GkCPnaz8A175d1qF9lTOKGNXB1YgqiHIDfa/MqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 02:12:52 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4%7]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 02:12:52 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.1.rc1)
Thread-Index: AQHY+Hz2Ui4PD/Kh+0ucQNqDmVuKua5CYpSQ
Date: Thu, 17 Nov 2022 02:12:52 +0000
Message-ID: <BY5PR11MB4152DF7B5F66DB38434D4C47A1069@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184785f4742-33e68fde-a27c-4430-8b2f-3c0899f0ac52-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184785f4742-33e68fde-a27c-4430-8b2f-3c0899f0ac52-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|IA1PR11MB7272:EE_
x-ms-office365-filtering-correlation-id: ba42d638-9a5b-4bed-31f4-08dac8413b6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T7plQNYlmMvSs+EBb4B3tMg5MSGS+T1xvXURxA2OZzhxUmqxpfi9iHlB2WmMISQKiXdN0f7Hn92PaLyMRqjbhBIpDp3IgQGjoq+nVl/8uLk3ArGE9H6VLlylZFeoDDySuIYPOEmCSl3c7Y3VMwEG4D6PY0mlcP75fDN9sLa81u06Kz/Ewqgp6HNoDPkCfB1WXQnbhci6IaGK1b2z7T1uhEXjvcqgRTZ1y4fAoLJqC5ya5vQJBy2YwjnkdpkCNods1z5NrlFVR7RqUCZp1mmTEqZuuV1b3fyuy6Z+YKyxNkaWSse7XURf4REYIPuuZVNBAQMzxppOV75Pou9C6cFl3+ETm5NWQfkqRxzdzFGxobfEneUiB7NshqmPJRvIIPr8TK5WvooI661GlSJOyr+wpy++fZ3UzcWz3+N2QNsCRZw20/cataZhnM/MuBMTjKYXfWMYuBQsSfuiPIo5zKnhgwCYR/UhEOqmkTG6tvr43GsxOkQz6+x2qesA5pq3Xi9oKidnydDqXKLoUBQOE6dlwJKUN8c5lK3KxN6kEbF6F5xcD36Br5PEWUPvfulOPMCAn5t5d97uZGlompJRW5DqPRkP6ujyVZfP9/rZECfaKGYzhPx6gf6q944vmwezImjT3F9Xt0mQuzUmNmUsHvlLRGuftKtad7EMGruqyJPoM3P5Q0lDsmJpdtGjeXYLC4hAtJvn14wDx96qRne6gf28JLDJUCVUQcO67WjtJ+IytAc+CrYVFEqWnkZg635dX1nn/T3mE+W+19+c2pGiEhrCzI5B0osDLTeJEOKRzmQpK0bAqSF6QYbQ3KTwaq2ROZhB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199015)(76116006)(82960400001)(55016003)(8676002)(64756008)(66946007)(66476007)(66556008)(38100700002)(15650500001)(66446008)(83380400001)(41300700001)(2906002)(186003)(122000001)(966005)(8936002)(478600001)(52536014)(5660300002)(26005)(71200400001)(86362001)(316002)(33656002)(38070700005)(53546011)(110136005)(7696005)(9686003)(6506007)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jA+KSQUQ5++nTG+QSPCsXcNZBzlTmh3K5ZAC3uocJKxGIW4HItvXapgNuyBW?=
 =?us-ascii?Q?QpcBcLln8aM2uGekgCS2LvT/5fwrWvcKARZl8KMb8KDGtOvnmAeQ/af1xmjw?=
 =?us-ascii?Q?f3z7i3xp7wI/khQWj1zICS69Q/lOFoUuuGyp6yA1Q1vYJiOKQdgFhxzaA856?=
 =?us-ascii?Q?ftCOlh4U/+Rdisi/iuf5Z+qoXFyl/o8RZ8gkjZfwZFfYNAQu8MUyyf4YLVHu?=
 =?us-ascii?Q?X1UwtWwuoIKV8PIUYwV1U9tpw6BRWxAHCcA6KH+J0qBVgTSuXwdNF0A/ZyUP?=
 =?us-ascii?Q?aI3ZXrYPuK5h/THG0AdfjHXs0fWzZgUWJUr7j6/giLN9c2DR1i9vVEFQTrgr?=
 =?us-ascii?Q?LP4vXDi05ajrbwRfkyWCB9LxeCK1Y23O+5ORIwv1wwn5baAQvqBldNSk5I/y?=
 =?us-ascii?Q?MXvWOku1bXD8q9jBc+J/C96VpO6HKBSI/a4TsYifwrdI753AVsaqV9oHrM8X?=
 =?us-ascii?Q?YOMJxCP+oc1/RbPP6szFI7bZa8wprlUPvQZtesq+3wJJyh8wfTQIFbFZRgXO?=
 =?us-ascii?Q?Dps4ZmDzKGkrNTduEIwN4pDkiHCs/1tlh0n2JY58lc+AxRFgdaMCSMGySDaf?=
 =?us-ascii?Q?oMJoqJAF3ktqEewUiUwn8n8MXmnZAXeBnI5kZHA5obap+gfg0+iQ9ITQ82fI?=
 =?us-ascii?Q?Nnuk3iiCURltjqtFLW20pbv6DigSMmVUcbfclAcWSO9s1rmFhM4UwxAv+uqA?=
 =?us-ascii?Q?9oQFyCytjT50SCZl6D40iWovpY8HxHZfL3ZtaEwUBJTiccQhcWJwmg2oWYKG?=
 =?us-ascii?Q?TkA9AJ9kijEsRKXpgWLBPHGhBWyJhNDbKul+jQHPjyWYAZMUWd8f1+k7ToYp?=
 =?us-ascii?Q?q14oZP7R2ED+tUT83wHck6Drnh8piYTcppwceReaGcaUSorm4/ZGibSLxvbx?=
 =?us-ascii?Q?pVnnOgWrKbzDH3D/8UfR68p2yR0zESzefW47Q5aeL+YOzI2AMlYjaywSWZBC?=
 =?us-ascii?Q?rflXf9NOKqiHVphWfi2drJwMQMH+AvRNpxGcRBgNmlnvGOqcTqAFz0JJC0gA?=
 =?us-ascii?Q?JO8KgPwouWwEvFrJITSJF+ZEqXQJA1yIhdZ1ciQEni+mBvPOJWb6IgCi2uNi?=
 =?us-ascii?Q?0RwJKO47IHWsTSfG7cpFj0YS/kjEJmp9HhOs2TdiURCJyh967wVnWd/i913v?=
 =?us-ascii?Q?efbTC7yAFVe61oC9wg9h5/ZneTpI0J3b+2P2B6hARxVw6+8BItFtfOdsrpFA?=
 =?us-ascii?Q?zP0gqLASCYl3WNj9tlJ3KHHDFZ4M7z1xO01Sy5BE8w4HQzSucuhE+sMAhbYH?=
 =?us-ascii?Q?Hf4P7rqSpzjMBAmehWwlswp8SuROAxAKONAO/O1R45rdk14CAZAt9VTcGUog?=
 =?us-ascii?Q?e2Z/2n3VukaYcZKy6IrVXYNg7w3PqCFGy/uv+7JIe3Tj2RmpyXjCHlrM7l2Z?=
 =?us-ascii?Q?9yVb7+x9k1Sj+x7RBwc0oOiVm2v2VXw29gQ8fjX7Q0nDFMKKeC5ApQwT02oB?=
 =?us-ascii?Q?5Jwwk36ovRTidmuoIIVVgGHIC8/LxCv3BEPqE6DFvGnHO9rXRo785mhCYSUN?=
 =?us-ascii?Q?Pcx0x3ZMKfBjJkYSJPbIujaVmSR9R8UxOWl4a/vhVDzopUk/zv44Svme2Ten?=
 =?us-ascii?Q?ESDrvUbFw+bhIB8aHFQkU9+sJ3GeV/AoAhbST3sv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba42d638-9a5b-4bed-31f4-08dac8413b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 02:12:52.1540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtDH8JqmL/SUlqqJszcWqNkrQ9NKQRAL4ZYmcEyiFKSERIHs7oUzPWC7lpFyU186eTNQl4CJe1B3B3O87m2v+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 02:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173397

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.1.1.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion next Monday, November 21.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Tuesday, 15 November, 2022 7:00 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.1.1.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.1.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.1.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 138dd7883ee2c521900b29985b6d24a23d96563c
> meta-agl: e5dd276442a8c9268a8818a638b07ee96383b657
> meta-arm: ff9b6f29bf4a6e3fcead5c1025a413cffee7bc53
> meta-aws: 8537180c8645455ee2b57c696389df21fc17f63a
> meta-intel: f70cf173dc40131e5ed3955a4a459fff3aa010ed
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: c5668905a6d8a78fb72c2cbf8b20e91e686ceb86
> meta-virtualization: 8857b36ebfec3d548755755b009adc491ef320ab
> oecore: 9237ffc4feee2dd6ff5bdd672072509ef9e82f6d
> poky: d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

