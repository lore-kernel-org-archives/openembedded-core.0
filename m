Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B00C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 15:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web11.54461.1720021452974460661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 08:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nUna4C4X;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720021453; x=1751557453;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ddV0BYd4o1FwCkLFVdo3RxRiDQ98dQlpXdPGpc1lv/Q=;
  b=nUna4C4XfMKefOXWOvVDHQL3QS84NpawHsYItzc2pOEGHiQ8zDEl24HY
   AWJ9Py2kw7BB28kONVds7pCZ0XUX37IyaN4Hj8LsTiN8PoFGL9jXMZgQZ
   RmakyCPV/FN+3SGiUI/Ph2BIZEx+UNPdH3Lkm7HxK2440Y7rU21KUr8lC
   V01KOZ+wVRjTDaJO1YVyaffkOnQfnhzRTP/letLK9YAYYOnavkzMDh1iM
   m0+YV66xnsIaZGCOI/tcMerjmBDgCsqM+E5X3Yvfb8/cDmdKjo+sKMGil
   DniAD9aQJOVhQhb0tZZinm2xmoPS60Pk97P0q80SQE9tApE8FFG4Bgz4s
   A==;
X-CSE-ConnectionGUID: DHbQ0dFoTbGGM7V/XYYjkA==
X-CSE-MsgGUID: 2MbfZuK6Sd6GvQGPYl/zxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17129286"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="17129286"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 08:44:13 -0700
X-CSE-ConnectionGUID: LUhd6SY6TxqHVpiZLNPMgA==
X-CSE-MsgGUID: 4urQNHrCQlG8QrDnDLwMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46959288"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jul 2024 08:44:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 08:44:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 08:44:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 08:44:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 08:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5rMQjPrgoTYI47EjKqjUeU5OhYyP1jWq/HwilTKkE+uUbSZLq+INOjQkEa9pbLCVIyHB9lmKhce0BTAYd8pcq/VUhEkQCEeBdnX6KQT+netNMw/SbxSh4suZPLR3CMYBE+G6Bwwduutw6jwxIOA0gWIyC4v5+9cR0F7nwm1QJpY6U91jsmX+/faF9Te2eP/9KcOdf0D+Y8gnVsL9Ah3AADoKq8p3YaNksFxuv6Wb1HkZa+DADqDyH258XYiNjF0lvusPv9LbZnFck5KFfpYTRZBxsRSSUn4OMB+HYr7o3QN+iDhAHTGGjVpjsGIgJ/8BUheBgYGoyfrvQkgYGlt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OON6CpQp1Ni5ptwtrTwjlwB/7LTDXuBC3UcUIn0dm1c=;
 b=nbnsdFklDvM45LPMl3RqVmUsDZDTpRa3K+8OeyHAhLzwPNt+zHmfTn/cLVs1AgH5QGET6khDq3ZQ3fofAuA7jwFzgjAlR5ZyjCCYL6ZLgjxTSetodoW78kJXfeV7KqIa1mHWwEml/vdKnL+UgwVcPsX6O38XwYX7YUCT1L3myjcMrxUiJyU87OB/CUsJ0lzHSnN0ff2quhtyc6lawJ2TzFAIZa3y/TGHYDdP8ixwrwDtnDhtmmAj3prS32TiUQHX7l6Vmy/1j7TF/JpZgIm5ABWZixUqOxQN01kZJirc+ng18wWQe4qKLeJvv7AVCyUyJzDjfc2VKYP6sYYye3Hwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 15:44:08 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 15:44:04 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.2.rc1)
Thread-Index: AQHaxtb2+J04oyLUQkeiuWKBC3BQdbHlMcLA
Date: Wed, 3 Jul 2024 15:44:04 +0000
Message-ID: <DM4PR11MB77602C33878D4611D259B4C3A1DD2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101904e70e071-638d333c-a229-48ce-96b2-86cc080208a9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101904e70e071-638d333c-a229-48ce-96b2-86cc080208a9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|BN9PR11MB5323:EE_
x-ms-office365-filtering-correlation-id: 3a287f4e-e214-43a7-fe07-08dc9b76f7f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pBMk4t7vrJtSk4qEoDHStfHSu/kNf3RWhbhUwgqwnIZjI0OAtl3Qota7OD55?=
 =?us-ascii?Q?g8S5JQ5qGI03970wLyNQrGitho3JqAHHXZdw/bgBCOXftpwkDDAm4n+QVbWL?=
 =?us-ascii?Q?F6lZf3oVcsQeHgPpSqmBFAtu6UhZn+XZlPxZSYpmy/OY2+4fuqOx9VRS7y8g?=
 =?us-ascii?Q?f7m5YKMkKtZU/fUQlzsnm2nvEly6wq90YCa/KQEaCWRE+w4fE7LNHLZeeh9A?=
 =?us-ascii?Q?7qTPs+KuRvN58at4u9u+MU7UU+uwzeSV5evHxkmfuGgGS9sGAouQpQcAaX5y?=
 =?us-ascii?Q?OqZDbf1vUjGoS8r99u5dEAiqbr6HN49j+0drCL1jSOqE7sYyWAiDSAMR4Slb?=
 =?us-ascii?Q?sZscBQ62JiIukDJoSeayZnTLLv4pGQ/qLHOyFjJlwMFXYZPuQ4gOpa1/0l3l?=
 =?us-ascii?Q?8AtfzjWaQFA7Wlau5k6zRKOL1Ts6bUrIjptua0epeZ8mseQ/FBwfLqIxjztM?=
 =?us-ascii?Q?aCvoIbD5a9jKz65gzJ8VZmb2LJMMD2Ib932PR0pmmgw53sHZLo9zVDqI6qqq?=
 =?us-ascii?Q?Kndjn801Mdi9TXiMBttX/SSdtV58wBqD7sP/pnT/EszZOt0LUpTuyGaEBbmX?=
 =?us-ascii?Q?HG0kqvGviIPyxJfcTYCcFJFM7MWoNHoRV7nRj97WcAuujj7p39Docxp0dGre?=
 =?us-ascii?Q?SZ5ptz9OMMY8+O++r5OoEM98uhrCXYu4PBd0KWQfPjyMiF2PuD+HPrZwt5me?=
 =?us-ascii?Q?KQiG1IqTPms3YxZMetPFY3iw/IgGmYgXHTVn9InW9ILJWpSCWZpWZVM/ufrf?=
 =?us-ascii?Q?zqtAeu4HVWrjQiw/pW4BpoljMOlTSBd8hCPkwi1pQ57Gz1ALnmDBLYvnXO7g?=
 =?us-ascii?Q?fJu2vKCC6gTYToCAM5dqRUAYhvxvm/iSbDLzRYJrHzM+GZcCNb9nAJGSYW5R?=
 =?us-ascii?Q?3giWH20nz9UcjX7k9l/keRBRssKOku+M0TIHPTtNNutsgXklqN3C/CfUsMtu?=
 =?us-ascii?Q?UDFD+vSEIc9RABohPysdWNXDp1WMyR4w5HISnqGGhIAAYiuW7DVgcJIdhfNp?=
 =?us-ascii?Q?pnoo8gZmZ6cQKNFzJMGs0HSIdBCnkFyk3QFt1SMS0LbFRf76kqqqyDCECFON?=
 =?us-ascii?Q?aRnGuYzbKbItt/qH7fvSNzEkYKenLMoRCo8Bw5V9mCJNJTuYxbMHMi53wO4G?=
 =?us-ascii?Q?LSZ+NmBRbc4N9KA3fI1XLIIpsTG97DNCY9YnkRHxp0jmN52NQsF6oAufBuD4?=
 =?us-ascii?Q?nL2pXVvMAuyAr7mrLbsSS/azx57877yC6sO6E7tDZq3uU+YjbBK6mP+auS4Q?=
 =?us-ascii?Q?zE7oR+XV+CgtgANaUcbtVuDgym49YYRpyzcGEMAp19zRik+Cwi/vPB57IrNi?=
 =?us-ascii?Q?4Yw+wb2wTWzukFuffJp2Pv0jWlphmsP/l5KxMtZeF3cZktQqr3Vh3PthAHYu?=
 =?us-ascii?Q?8gkbREY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E44vCzPFy+axOTf395wVo0Vm4lgkNZgc7avMwYeZ9mxNHq5XUfFi6nbCjvFA?=
 =?us-ascii?Q?bj0mjqZhkiJD6Yp4/QNklizEP7fzVfSeVn/vacfJexVHD1cjGo4BBTSut728?=
 =?us-ascii?Q?C4AWlpzX3MFZ9YW1ungH1cHYPMwuat9+UWMDCcZ5bwXDTjwg6xNJNUjYOsqq?=
 =?us-ascii?Q?3qmWnG+eiDDtdBolWsHAwggg5X1nLieA9iOxD1mNMWsQ8RyNLP/ibbIgHNkd?=
 =?us-ascii?Q?tEyO4TJRCpDocvSWdF8+UhWwlUSbsiIxNUj5dFfoQw8IL4C2/mLaPY12zAgc?=
 =?us-ascii?Q?pKUXpDFLZoX27NmZBBNdmuj3GbYhxvo2qkAt3PM3SQgv98l39eldtRO5gPyE?=
 =?us-ascii?Q?DJ9ZgGvnADpxLjHmVjc8WdVbPvRzStJ41CxVxCS+BMxNXAZrHB/Fqcf0RmU5?=
 =?us-ascii?Q?mFJ9pR+9h63r+hDKw1opeoB68vSUSUm1YNIfYjlDyQx8L5USPiYiLM3j8jDg?=
 =?us-ascii?Q?Atni4hPBDWsCZzxY445xVRpNOGrz5bxxXPltQgM7MRwNPs1j9Dm+aw4uwJP+?=
 =?us-ascii?Q?77M1xo5XUJyQuSUdMeW07E+gT4xgYua6kSIVq5zNjrxBvkFQkUhn9yyoVOD1?=
 =?us-ascii?Q?vT5WLT2dvt+CtnDExU1UMuM1VXHAiB2Piu1BMKc3DsvSze59O1gYWEkYcNiv?=
 =?us-ascii?Q?blQxFrxaI4+IWhXZ1VjkvZlsXPIZpLpxxi8tpROfjMYk2aiLdtLRvtLwGl+P?=
 =?us-ascii?Q?evPpnJIADCgcYTGJdv7dP2qBya9J82gan/sdHRpUVbvhMe33iXIhFbX1J2PD?=
 =?us-ascii?Q?meZkA1sgLwfmpbz0sez9/ur5NM0fAl8zXPU2JBt4e3LgJK51WyDoR6RfFKo7?=
 =?us-ascii?Q?QtCka4QInYd+ZEqFBb52ys4v5MDzxRbtSvR1mzoNpitC2G4+czNkhwbcWc3T?=
 =?us-ascii?Q?3g/kl7jC9eDnV3LhUKQmMfVSUvaixVXrCZsY27pRlfPu7hkwXrcrmH0Gj5RX?=
 =?us-ascii?Q?JvBJTfjSs+17o9KDgqk/8nzb294oMgIA0ZHLO/l6HuWy+5nAdmYynCOLUglq?=
 =?us-ascii?Q?ddYkKStqYw7o9j54RYvymufaYs9Wx+46tAP27jZeqZCu3T0NbzbKpm05zHLo?=
 =?us-ascii?Q?XkwfFvrXqT3jhZKpzpGTF6IQadphugIgSOuoPAHzblLnsXqo8i5E4SfxnYY5?=
 =?us-ascii?Q?/SOlzVlbCzjshWSjJT2uotNYHkGDgPAo3oRBU3RRaTyY6W9HRyqr7KORw07Q?=
 =?us-ascii?Q?qGrSTRCK18PLjvk4GtLIb4DokTygc5TkwEv66kBbNk7gaESOIK3KicCn8GVS?=
 =?us-ascii?Q?wd433MQ/bp0XIHlnghH2Pa9YwWSEFaQysmTAbamEoGdqtifscKynA9XGQqx1?=
 =?us-ascii?Q?fvmA2ucWaiJtd24yqP/B6Si1gm3U/JQzDadxKdQ1+YVid41t4adj/SFSKNzo?=
 =?us-ascii?Q?ddByJuy3cmR7lf9QyUs7gfknoUKgzhGaYOvnAop+2XkUJjs1uMnJYitcw2Aq?=
 =?us-ascii?Q?gZm3xmFeIn2eGmOp4hTN65I9ercbjWNWCrObavGPQZYM3bolX29ob0ytL8Lx?=
 =?us-ascii?Q?ZRx+FDADIgxvjP9OiNesDGFGobU/eBu4jcuadn7zej0qc5I7A3UOJgzhMHOq?=
 =?us-ascii?Q?qh7Qi4jyCZZjHPmT3uTiijEx3Bl/79XXKGRo0Smc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a287f4e-e214-43a7-fe07-08dc9b76f7f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 15:44:04.7862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwRjBQOjNu+mnW7a6D0jY97uzKR5+OERSEtFG7nu8uUPlPBsKgIiAqnsENjBXpcEyLY0TqNwGHvKGO0WbK5BHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 15:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201494

Hi All,
=20
QA for yocto-5.0.2.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Tuesday, June 25, 2024 4:09 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.2.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7076
>=20
>     Build hash information:
>=20
>     bitbake: 8714a02e13477a9d97858b3642e05f28247454b5
> meta-agl: e1a0adc8cfdc3b306537fc64f8b29c3c53f744ca
> meta-arm: 29799b787d57d623dce140012a87568f314f3460
> meta-aws: e3e4c876830c76aa1112b51ace6bb6fe35d5f0f4
> meta-clang: 83e93bcda1654477802ed18b5f440fba7a733caf
> meta-intel: d172a00f487a8ea4391b96e0f6cef5279c5a07d7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 4a7bb77f7ebe0ac8be5bab5103d8bd993e17e18d
> meta-virtualization: 37c06acf58f9020bccfc61954eeefe160642d5f3
> oecore: 803cc32e72b4fc2fc28d92090e61f5dd288a10cb
> poky: f7def85be9f99dcb4ba488bead201f670304379b
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
> View/Reply Online (#443): https://lists.yoctoproject.org/g/qa-build-
> notification/message/443
> Mute This Topic: https://lists.yoctoproject.org/mt/106866039/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


