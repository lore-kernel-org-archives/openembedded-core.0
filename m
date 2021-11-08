Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0567DC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 23:24:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.4607.1636413869293480162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 15:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=qbYKRMlK;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293174803"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800";
   d="scan'208";a="293174803"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 15:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800";
   d="scan'208";a="491421584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 08 Nov 2021 15:24:27 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 15:24:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 15:24:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 8 Nov 2021 15:24:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 8 Nov 2021 15:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzvEoPRX+0SJEmml73TY7paaq7K4cbSDmRlLwQ2TYb3Yob8r553mhMx18f+lN0N3WbMn/S6YnaHKW9enb2F8myJJnSIkbwl4Hxt1JUhp4nWS+HZ3Xw8lto/HZRM95YMrVB5Ctv22eSwgYnZFN7mtpMDGCQEEsQuGU0uIOZ+lpwId93yXUDudbxSaEws8NoZ+JiitYiNUhjGl9M9wU2aQorVIX21o/khYAWissCwOi79UfR2j7ik7mSjlcIMFJAx+Uawd0vA3SeyRC0qH3bH6kUTbdFLCbyAxVgltGOiVKtP9F1TZFLkhMUpXhMij6ESOB6t0zh6JJXqxBKan1p7orQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvNwkMHHMhjRQVo7W86LOfa9OVi9RHCni3O0Qai+BFk=;
 b=MHCy/7d84Pa81VJqAjKOStpTZ84cFCzaz/Km3MZh5CxB57Tuz5fK7bIGZwqI3/JJ8H/YLkoirNQdcB9TgbuKK15WevRVjEnahkFnqgihfH/lhnOP3y2DeDc4qmJD/VcDiJhRt46NDfK8F+RjPuF3gZck6I+3m1VejD0DJT16c1xBc8/YxUEG4VQ032MyMe8mpOx5qJxgn7g5BTVUBxGGTh4Sy3l9QvbCR/OBsZzT45KCvY6o5Sqy2USwS6tPmoHf6Sifntyb67pkuJF0c0+Nrmf4e2cV3haq7tI25bC4bV2iRMw5L/zCBZbd6BdqHKNtCIqhPIOgjob74ReaxEl9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvNwkMHHMhjRQVo7W86LOfa9OVi9RHCni3O0Qai+BFk=;
 b=qbYKRMlKxouBvD5WjkIC+AW0OsiKBwL+YTofd86DNuFjvHSGlZO6wKj44C2O77MRGsB6qU+iC8o4SaZqdETmPaR8LFGwWaCcti1sh/Zt6si83Pas5S4s6IF4/ERMDggbWXaLdUq0U0WU8MK33Mekc2mPxdYwSqotEdXvX7gzohk=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4259.namprd11.prod.outlook.com (2603:10b6:a03:1be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 23:24:24 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 23:24:24 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [honister][PATCH 00/24] Pull request (cover letter
 only)
Thread-Topic: [OE-core] [honister][PATCH 00/24] Pull request (cover letter
 only)
Thread-Index: AQHX0l3eTkTf6oZbEUm5UE0NX/7OKqv6SqNg
Date: Mon, 8 Nov 2021 23:24:24 +0000
Message-ID: 
 <SJ0PR11MB48961A0EC54A5C0D771E2F1BF8919@SJ0PR11MB4896.namprd11.prod.outlook.com>
References: <16B4B199D231080D.22718@lists.openembedded.org>
In-Reply-To: <16B4B199D231080D.22718@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f8ae625-0cbe-41b5-e266-08d9a30ee6ea
x-ms-traffictypediagnostic: BY5PR11MB4259:
x-microsoft-antispam-prvs: 
 <BY5PR11MB42599253C51815649CA9DEB4F8919@BY5PR11MB4259.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cOC7rlcCJdcya1fUYEywX4MzFCdpshyt2wRx7Ez3aSaywhhXa+fYt37MpVm4aYOFyZ89gYn6oZn/6wswbIQ7egRMP8XHsuDNj1+/pTUfn0a+ha82kcGPZ3UQ8dZ4lKfHAt+RDC33KW0RBxa30F3JjWUAtLv1HR6FqkyJ/wYy0sCn+kbNobEsfJzWCwDfGgeS6+bEkLIpgY0sKwPvhMQmY8mAPWo66rJ0mHuSk7ybWYe+HlpJAHaJ/ha8ZLJT900piIi16W16On3CiEHe0BePZYo9SzLs/PvTJBOjMgBrCDokLGQ9BzElrufveiEWd7C9MYXItG1NCUnt32w/6uwyF+vtgZdjT1qtXZcogMLBzwgtX3r3ZOdwyN9W5x7CwJgSBCxI4xj5lgGj4rIwtySRYHtF28ICx7KPtBd1/z4RV/IUQ/rMCY77TeF1s+/fS6bAc6UPqJNRPXAXvNFuYRfFdlDkkgIfeRrOKEAlndHdUertB5T3hAMHqnsfZNXRwe+GsRTWNe02X4X4V/SwoO+avQxmMXBoTL0MLvJdio9dhULNFrTBgEQRyBmDhEQ7/8HkQQ3jrHYbvjwyh19JL2tAMrC5B+mly6XfGBugciQTr4DR9PoLttedr2XTTVEXLl9kD84/d2hTeWxM5NNywPPXMP91A7I7mVmSKMw6lsU2mhmBvSrmupAmMyirzgYra+G+47fxBw2cvQB9f55KO/iKXA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33656002)(38100700002)(122000001)(52536014)(82960400001)(8936002)(4001150100001)(26005)(186003)(508600001)(66946007)(6916009)(53546011)(71200400001)(2906002)(6506007)(76116006)(5660300002)(55016002)(9686003)(86362001)(8676002)(66556008)(83380400001)(64756008)(7696005)(38070700005)(66476007)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TZen0t2a3zcUJjkIZfaYumtbtwl1O/Y7wteNOATSKK4ZQgWujXxa2QUiyjM3?=
 =?us-ascii?Q?6AfflOsfiBH6T04bqmsjKwVgcprzTFq4wVCyzJuYo6ybU3+sCVZJUDzxzQrB?=
 =?us-ascii?Q?n34AdWTaEnLNF0ca3XKMCJkmkcpUzY+A+huiUYE7qbIMFJzyrC3tGt8hGdUI?=
 =?us-ascii?Q?LwjVSf1VB2frh6D6VHVTt3NTnn8NgeAA7YJqHW3AjJpcE7at1MULYULcZHCC?=
 =?us-ascii?Q?atqjOA+vbHjkCv4Qiusemql4PFpB2KIIGCkgxRzsvKyV8d6N8JDU1Eu9eAFE?=
 =?us-ascii?Q?tudDiwdUISjrxolZPDhPDofUOAEyqSURLet89iP4IT+6Vk0obhIe6xqYKZ5E?=
 =?us-ascii?Q?HFuw5ul+SgIA9H8wm1N+3BpLLUIq13GDg5apAgWjA+iGa/++9FdJnS3OXihF?=
 =?us-ascii?Q?AFnQyCa939L91oPZ2Gt41lZhJB5/PilVgo9h8rSoEwdyPxLX+t1Hj3YtKLeZ?=
 =?us-ascii?Q?mjMSJlBJE7CPLsFo31x++Vo+pdghS0U0W6NKWywpLIsEMxKeCT6L8wMaL9mn?=
 =?us-ascii?Q?XZehVSkOdDgVgaCLjlWmvn568sGqc2PW/030EqAat288vNcASvB0sf3I5gEB?=
 =?us-ascii?Q?fO5mLGyfJ7jOUXO88ZL32yfbCEyEQTKEA+22cb+0a65XSKceVzS/ZY91dXCu?=
 =?us-ascii?Q?K5W82+XaPLhXNpQzMICturk4WGBPXfQwCATpRNEsyL4q3J4ByMwy2Ao96NUe?=
 =?us-ascii?Q?KQqqHD1r+2yKQ1/0BFm49/FP+Ih70VrrvsqrWoepzH3NFAoiVOARjFTOX8eC?=
 =?us-ascii?Q?9PDgOAj1OQAXhQVT16OSDgIot42fMMevEGjHtAVauhrk+VSlkJFWtK+hZZSG?=
 =?us-ascii?Q?SAP7RKjihZ5subC5lKwW5V3D06WrW8J+rQ/B32rgqzSJBEVIqovJMHFX1hx9?=
 =?us-ascii?Q?a5vhAN4H1pyh/tqutBnTep7CZ+D4nvE9X79Y7DY5ezxwlpZgQStRUcRZsNxd?=
 =?us-ascii?Q?YC8dTAt3J3rz23FnuoRg5QifC9fvCd1EbkvP64bhwdoROh0kUDCCOFjRkZr6?=
 =?us-ascii?Q?0ITBgyrBpRi4iovYXGL+nH0A2BDFXbd/9DpJE7FU2w2Qd9OneYXqwmyOHeKP?=
 =?us-ascii?Q?UMsX3fqfCbNXtbsgqbcqLA2AAlFw1kHCX5B31HxJ0nTjW6suI6nD73Aza71e?=
 =?us-ascii?Q?69H/YaNbbGkdPNVnSWv6QNnZKoYT1OUTkQZ3AVbvqZ5wbfBBaG9lfPEUyCD1?=
 =?us-ascii?Q?YlXB+1n4cmRKivAKieLIfz0v17RHbiI41K4iyjx9YXyuYabjAlvTQw+wOdCa?=
 =?us-ascii?Q?kjlPE2adOrbj2o8eUJlgTmHMx1d5Rkh/eJBx4cPCJRmLobavgzb5fYVk3j8r?=
 =?us-ascii?Q?CyvISqipBOYj5W4UfGoGt9Owp9mqUMijzah3+KX6pl598fviHjRWpHqTZIA7?=
 =?us-ascii?Q?/ubC+FZqNSmofeXzNuGhmU5eELLllrP2ow6zPblPqviVU9e+pzumX/71OihE?=
 =?us-ascii?Q?ACRZIxX9keD8AoIHFef25POdEYaaaDgz/sz0Q7qoacfGkfnc+Q0Yr3tUmx4X?=
 =?us-ascii?Q?hsnxJZVJOnjkicu5g4BNf+WS9IG+EY4VORDfARN3UWncAK0IPjyAtmgYpNCx?=
 =?us-ascii?Q?reZwWwRUcLmJs7I8R9F3m4geBfAlxpIukcS7E1U8Va44AWkrmARirn9Cx9hq?=
 =?us-ascii?Q?nNk+l8BCHEOld2+Ewn4KqTc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f8ae625-0cbe-41b5-e266-08d9a30ee6ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 23:24:24.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PgVYEGsKOQ+1I1wGyug5MssM07DOsSr0hQhWEmU7nsxaWcyI7lL50zV4VJTERXAhMuvNMbCDx3hWpH33tkTMXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4259
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 23:24:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157994

Ping

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Anuj Mittal
> Sent: Friday, November 5, 2021 11:57 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [honister][PATCH 00/24] Pull request (cover letter onl=
y)
>=20
> Please merge these changes.
>=20
> Thanks,
>=20
> Anuj
>=20
> The following changes since commit 6ca6c9c12c93c6df7b18f49ebdbfb69433ff51=
58:
>=20
>   bootchart2: Don't compile python modules (2021-10-26 21:42:27 +0800)
>=20
> are available in the Git repository at:
>=20
>   git://push.openembedded.org/openembedded-core-contrib stable/honister-n=
ext
>=20
> Ahmed Hossam (1):
>   go.bbclass: Allow adding parameters to go ldflags
>=20
> Alexander Kanavin (4):
>   waffle: convert to git, website is down
>   stress-ng: convert to git, website is down
>   tzdata: upgrade 2021a -> 2021d
>   tzdata: update 2021d -> 2021e
>=20
> Bruce Ashfield (7):
>   linux-yocto/5.10: update to v5.10.73
>   linux-yocto/5.14: update to v5.14.12
>   linux-yocto/5.14: update to v5.14.13
>   linux-yocto/5.10: update to v5.10.74
>   linux-yocto/5.14: common-pc: enable CONFIG_ATA_PIIX as built-in
>   linux-yocto/5.14: update to v5.14.14
>   linux-yocto/5.10: update to v5.10.75
>=20
> Hsia-Jun(Randy) Li (1):
>   meson: install native file in sdk
>=20
> Joshua Watt (1):
>   classes/populate_sdk_base: Add setscene tasks
>=20
> Peter Kjellerstedt (2):
>   meson.bblcass: Remove empty egg-info directories before running meson
>   qemu.inc: Remove empty egg-info directories before running meson
>=20
> Randy Li (1):
>   meson: move lang args to the right section
>=20
> Richard Purdie (1):
>   staging: Fix autoconf-native rebuild failure
>=20
> Ross Burton (1):
>   strace: show test suite log on failure
>=20
> Saul Wold (3):
>   spdx.py: Add annotation to relationship
>   create-spdx: add create_annotation function
>   create-spdx: cross recipes are native also
>=20
> Teoh Jay Shen (1):
>   oeqa/runtime/parselogs: modified drm error in common errors list
>=20
> Tim Orling (1):
>   python3-setuptools: _distutils/sysconfig fix
>=20
>  meta/classes/create-spdx.bbclass              | 22 +++++---
>  meta/classes/go.bbclass                       |  3 +-
>  meta/classes/meson.bbclass                    | 10 ++++
>  meta/classes/populate_sdk_base.bbclass        |  4 ++
>  meta/classes/staging.bbclass                  |  2 +-
>  meta/lib/oe/spdx.py                           |  6 ++-
>  meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
>  .../meson/meson/meson-setup.py                |  8 +++
>  .../meson/meson/meson-wrapper                 |  1 +
>  .../meson/nativesdk-meson_0.58.1.bb           | 52 ++++++++++++++++++-
>  ...nfig-append-STAGING_LIBDIR-python-sy.patch | 34 ++++++++++++
>  .../python/python3-setuptools_57.4.0.bb       |  5 +-
>  meta/recipes-devtools/qemu/qemu.inc           |  8 ++-
>  meta/recipes-devtools/strace/strace/run-ptest |  9 ++++  ...write-the-ti=
mestamp-into-
> compressed-.patch | 26 ++++++++++
>  .../stress-ng/stress-ng_0.13.00.bb            |  8 +--
>  meta/recipes-extended/timezone/timezone.inc   |  7 +--
>  meta/recipes-graphics/waffle/waffle_1.6.1.bb  | 10 ++--
>  .../linux/linux-yocto-rt_5.10.bb              |  6 +--
>  .../linux/linux-yocto-rt_5.14.bb              |  6 +--
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
>  .../linux/linux-yocto-tiny_5.14.bb            |  8 +--
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++-----  meta/recip=
es-
> kernel/linux/linux-yocto_5.14.bb | 26 +++++-----
>  24 files changed, 227 insertions(+), 68 deletions(-)  create mode 100644=
 meta/recipes-
> devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-
> STAGING_LIBDIR-python-sy.patch
>  create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefi=
le-do-not-
> write-the-timestamp-into-compressed-.patch
>=20
> --
> 2.31.1


