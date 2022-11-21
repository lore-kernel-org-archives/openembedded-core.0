Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA510C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 06:40:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.32515.1669012837199399164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 22:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=DdU7hg2U;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669012837; x=1700548837;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oYqK1MjybONVOz6oZ8973Izuv3cuwM04Xz8nqHxodDg=;
  b=DdU7hg2UIKLo3jaYmioZ8SLNYwcI5SWKPy/YUQ8e3Z0qSNATxi2MOWsZ
   Vc14mPJHnDSTx/bbJn9ViqFgSXkr9Iws+jGNts2iNCxejnwcXBp0mnOkm
   E2ka9cKNGNfwfoPBaGp7dbCGVO4XRJtQSkmq2q92jH99oysR5ISYvfYVX
   +wt51EMPEOlso4hYcYsdCClpdPj2XKEus7Ydo1T8CsJ36GRH59/yLad97
   7aysCVY+f6NDbq8BjN+iB3179yaHs521rzfEgpw6XA/Q52v6tUROc4JJR
   XPtLYEfshrmnOW5xTp4NoZHrNFoYxxHwtik7Sm3E+VNPDmxy4smH4QJQ3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="377744834"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="377744834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 22:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="640909249"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="640909249"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 20 Nov 2022 22:40:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 22:40:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 22:40:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 20 Nov 2022 22:40:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 20 Nov 2022 22:40:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuynmlxcnjQOyV4b8mJ5wA4mO3tt1R6+4us2jYS4lo/Cx16/4VwGHElZMhZqyygsV28UTVGMpyeEtWRuy5LuX+lNPoqjf3bcHPVY2OnfqwBz5KIniaijzSJfo78/QC3OvAGAGB2BqGTe9AQ4ad/iVJtXH/lIiPeVnPlBIdyiwX/hZv6476Xu8mnaQLh83wwe/7z6gtqPTzN+h6CrfQS2xs9zdYGRlWO002j8y0wusy3p6L5ucj3xvO1vJZWwlmWBBE1vUjnVyP4bUpUqI6SJqVvrywnkMUjNI42b6ACjincMVJmq+4Keb6ZxyJFi3iWk5xZR2ST6zEhC3hLuPGeS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCzY9UASe3zLBc2joER1AorHlAJBAksxZu88aMwzJlo=;
 b=U8zpRL9qsCQ4RfPySp0bCjdNcj0Z5xbIMGFI0OAt4qJ4J/mkjNFFMbAmcN8J/wIdBdfeHORSfazpJcMFqZfz5nb51Zf2RO1fqoBLOYSArwaSr/ZUZdu47sL4XFZWWl7cfdv+wCgwGJhvGcHeG6O+zqgIfAIsiyPRAPbDPTq1jvHCBlzi5rHVLgzayRv0o7mNNAE2LLhUd0Mg2MOAshr65/vkorejPAO9svsxjxrM0s/ZSA32gscfHD7GOyAMCWzV4fg6Jud8urjrlmyfxuhWWQtO5/+zPLRSpgYCLX1fV+4AYKYdDDRXkPpJnOHf/gYGNc8IeCwy0Vh81BrQ+v/Lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Mon, 21 Nov
 2022 06:40:34 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4%7]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 06:40:33 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.1.rc1)
Thread-Index: AQHY+Hz2Ui4PD/Kh+0ucQNqDmVuKua5I9u0A
Date: Mon, 21 Nov 2022 06:40:33 +0000
Message-ID: <BY5PR11MB4152DEF85C313BE1A4B23329A10A9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184785f4742-33e68fde-a27c-4430-8b2f-3c0899f0ac52-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184785f4742-33e68fde-a27c-4430-8b2f-3c0899f0ac52-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH7PR11MB5885:EE_
x-ms-office365-filtering-correlation-id: 2b9c4201-b611-4562-48b7-08dacb8b4a87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zAbNMRQGrpLhscM8shGOsC4eAKqCuZXbbSyjoNHEA5sUrKZ501qa1n2/8qj2AhhwTeEpZ6zrj6iVqBNL/BNM/4zcFpH3jV82VK9gTj24d3VRVQ9+PFLbPrLBYO0nSSJE5KSiOb/ZxoR5HbMuO9DXyH3OXZaSWDN9NbOmC1x18zbIrTajVdYiw+D1SRw7oacXY9c1ShiLwykEmmonKabuap1ccDDprcvRiCmX4og+TRmgMwnL65EesbFhJ8H9Q2rNBDZVo2ETUc1dV6UM5IEHbWWxLUAIGViyaEPZxiVGPkGy7K0ZpOxob+QxaxWPjrMUri6mWFbJ/S7DdTPFyHn0+CcCnAhfjIE8gO6K/FRKIwQwXcYSj5R9HCIfC7MvS1cwivqVKtNVGLemdCQBZw4boQd3eISuFCIloeCHXFomAJbEXYJ/0a9yKexrxTOsWjX5EKecYRCRLfdDXZZLfglWWwOweC0je5bKNAucOmpI9BiQzCA0iWVO13R/Qm48GhpziGzKPvcTQE0LjHfcSgaNqMh1Ef5sCuaAJNA9TnJcV5TBVqasIDWcy/8on4kiMkmJcRhpSnArScS7P9Gqt9TVdHEwf2xsNgRwY78KvU8zxVIYC+46l/koDUHJ1UQJDumq2xcQD5Qot+/Ohq8NqvPIyzHrSBl0X/CO1yiCo+yrlqr16sCnh+K98gH5MINOiCw5CBn/8/DtmPeK76SyWq+7UH63RV6kzOZVg7mOZ4InSeAEFztKEzzH9notJinc6x0BLUBIhGqNZLznv9mWpaEnfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(66946007)(66446008)(66476007)(8676002)(76116006)(82960400001)(55016003)(64756008)(38100700002)(15650500001)(66556008)(83380400001)(2906002)(5660300002)(41300700001)(186003)(966005)(122000001)(478600001)(52536014)(8936002)(26005)(86362001)(71200400001)(316002)(38070700005)(110136005)(33656002)(53546011)(9686003)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2TNoOR2pdgk+rh9YIGufkVkYfO/ukVF4KbcZJ73Jj36drPzGLnGB7VX+yb/u?=
 =?us-ascii?Q?k5FjdClFbq79pn6MTJV/xCbhZCKuAFP1g4Dmz5wtt+HQOuiPgklwhyk4/Jol?=
 =?us-ascii?Q?GeP4ztTGIokZoZv0ignfSiVfXSCL4nV7i2j+7Mr3z2fW+80H9/Ozj2rf8D8u?=
 =?us-ascii?Q?pU5YPclnHqpdNdki82veqipBHucJKF7m4UehZt4hUk1ttjM39CSYbe8n2DDb?=
 =?us-ascii?Q?WuvZbuBpIDALQdxMfwo+3C0Rle4ISTNXQt86aemUYlinXZehqRwybJq6LqQc?=
 =?us-ascii?Q?7GTrnXq+yp45cJC6vuGAkvL/UbsNKeHQx87xiP/6VSRttm7655l/JNXvyVj5?=
 =?us-ascii?Q?/Pq96MjHCVEe8kQbEYICNfejNBF/5qMv+2KqFgryQ6aDBUJeuKiY/kk3CAZt?=
 =?us-ascii?Q?it4JFTeCWRKizK7O6uQk1/G5VVr2btkRFHM+4YoI9aZjOxeBnjPca7dJPjZZ?=
 =?us-ascii?Q?t0XzuoYpjaGBJnaYFKYdmghLDUBCL+Qfzhs2Zgr7h8ALJPzU8zTzL54r3j9c?=
 =?us-ascii?Q?ouwCcS+P3T0pGNOCD0TcJEgPDkxDtp592IMj0SME24JhJQZ0JpWSNDU5K18N?=
 =?us-ascii?Q?ELySPIW2mNTzF6QLbLU/XVoRKLBzj2f4uEIPPZn3X2II984LcK8X9xp3mVrN?=
 =?us-ascii?Q?ik5bSjU0uokKTC7YhYI60clLwWPEjy9ALymzY+V0Hwrc1/2RB5yBjTYDIv7L?=
 =?us-ascii?Q?wnB/yRyr8gadrAte8XZi+s8pTPKnnIiJtr3fvdiHlCaXVyoG7MUqSVbbsFrL?=
 =?us-ascii?Q?+ln9URlJvuj0B9B5slsJIpoeQ7Uw1SK3CMxJ+hcD7DhVqoTGuoIhL+e45XcT?=
 =?us-ascii?Q?hkzfaThA27XOgFGck/7Q5bVPXLPqxP2YOOPoQaPggr9dhmTxxOYjmB+17ySs?=
 =?us-ascii?Q?dWDM+BaAFl9aryFlDbpXgbBFXggJkygSL2o9WdLLBGvxye9+k0nGzPhweKN9?=
 =?us-ascii?Q?cGJCD4ndfh9iNUcyBr/VgYDEpcE3lcFcCAlSIbSkTNYE6IpXvd+H+Er7KBge?=
 =?us-ascii?Q?ZcKo+oT9+DMhwQguRkfo4gugYNtsiB5r6kt8VRFOr4jVsSGUGFfeORjRH45L?=
 =?us-ascii?Q?u7LnD4UQuGm0r+qEkpd5fdJ3gncHiDdc4PF00ZYgiuPrBYWst9CKfxG99AJD?=
 =?us-ascii?Q?v1UmWqijJlRVNfuizmvF1MIIWf+7I98N9ffmUKaDGTsqiawMb5Rg9ATlz+y/?=
 =?us-ascii?Q?YgXJb3PAVKPiIgRvsC0V0QPLnK68uYagRYlFX8p6qmL7rD25yEqefx/tOOTe?=
 =?us-ascii?Q?gkX7R5emZvgGgkLZDG0gWc3aZRex8/JdFqNVQRhHqotgHEfvh/FN47rnXuWE?=
 =?us-ascii?Q?WojQgsm8XkbnQZl1YzIDrtpqC61r1fogGXuqThzVm9HJk9RBm6hRQviTl8wQ?=
 =?us-ascii?Q?IwSwzzYZSbQxPGoGR6RzlhmtUJ7sLbsI7vd7olBUVKx9hAWSGUeWTmskpRL2?=
 =?us-ascii?Q?t0TlXA5vdU3jlenKt7KfmoYr2SE8vtAfICCw/ZYF4SFCLUib/HkxojyDjYVU?=
 =?us-ascii?Q?RR6gRr3p/ly+nLX5z7lu7N7exNCtKzpu8fn1Lxs2T3Qnc+3ysJiEZ6oO6sT9?=
 =?us-ascii?Q?6rcAJ1tW116Re+aDdhR9VMg6Wc6zJj4d9Ah6GORh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9c4201-b611-4562-48b7-08dacb8b4a87
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 06:40:33.6994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/DB7eYpdzVdW6p2VcJVZ/NYGGCUo7T1Y+xuan3k8Z/KXI9pkMK/SZi4Y5KvekUFLCK/uhH1wnqexfDz+g+RvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 06:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173646

Hi All,
=20
QA for yocto-4.11.rc1 is completed. This is the full report for this releas=
e: =20
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

