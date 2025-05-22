Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59201C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:34:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.25280.1747924458616884826
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=l2UAk7PP;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747924459; x=1779460459;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=p7fznhPseZROurqEPBZhjwwsm5oHTzH/+SeA98TJb8s=;
  b=l2UAk7PP2XOBrKE8GGv5wYB2G/nOb0+7X7h//N22lFqs0R6MZOeQnDGq
   0rir/84TaQsQ6BYWPuRXa9Z33Z05C5WTfTE4S7rl4vF6tCM1MmWg/xYU6
   zmwMly8PGcqOGe/LOqdp/mukykCg/JUaZdFiTKCY+fL+jQ6ZWzzlITpd3
   H9HivbiG8Snv8U4jES1cEYLNlAjHowdy97pBGegNC9R3fwKHzSF/Q7K0h
   8UPudXYP3hhqxz0rvhriE868CCGs2MuTgop+eym258ToBvTB90KqM7foF
   +7DvKaUcpW2C5+KhkZrYMEBaKUTVWum+8z2YKBGOUNZUuxN2LHkOHwFth
   g==;
X-CSE-ConnectionGUID: Fxofl9nhScGwBc+y/RxOsw==
X-CSE-MsgGUID: 6JgNiTtxT1SnjCcSgNFU5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49872044"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49872044"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:34:18 -0700
X-CSE-ConnectionGUID: 9Zhcx/THRRKGS1YPpLXDHQ==
X-CSE-MsgGUID: 7kPz7EomTi6oIIIDUaEq2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140507175"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:34:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 07:34:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 07:34:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 07:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oo6OmQA7ilH4N2Bc/yWdfR2w7MZxoEun33o7xEkhUW0KTORGazO41IchpbuGRg69BqkpK3xc+RmUlFz2z0lPNIoJ/NjxjAaANzY8jvyUvm7eqoO5yeTNGy9Hy7ze8oDaL/Z46xFzoqlPUPrHAzSeIo8t/wCAwyQmx7h/2eR/alaRRKOqzwL9noe0p9VGMBUAKEQMlQAX/2EHDXN+r2GUODgZQXdj5lCQRuojo68w+1p5lM/QKK/QfSdXSRyKxRPrjywOjEPjQ1g/RkvS6DqqMcgiWjKY32PY9irzy4LolkA52h/v9q9gHEalxhORBHbsDIMyDZLDL1ZZD7HzgmU/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2iZW8AKI8nOqVvUypWfUCd6SLju3NZRhQMXZOn8NRQ=;
 b=JsFJqUXjbOeSmt/+j3zZSJ0KUIxtVJNv+imTmN5y2mQ2FH5Qsteez4ibHoKfVeKF0VpQt1ewwrrAaBi3ZD9aH1GgUeuaramVzUPCokD7DLIyM8sVRnF5mEykuMoO+YIuzJX0Qerm4q+GibDY+eGqcngJOwubz7sLW2lkk604wZPEVrSZgEh5CHZrJJf1xiNt7Mebu1ZgHyIrRMrSpZUMx5kej1rRAkQfQ5ybyOx+pvAPrkhSXDEWpo4bDLVzjTCE5oYMWNcU16s9fYQVxbgBVZnAR8Q16LK1wXzgs06mXxotynua6QE2Z+mXLoZ0dwbkmC8QK0rznjAsgS0JDc1iwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 14:34:01 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 14:34:00 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.27.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.27.rc1)
Thread-Index: AQHbxppjaze1LuyhKkCwb7U7F8ONErPev6lg
Date: Thu, 22 May 2025 14:34:00 +0000
Message-ID: <DM4PR11MB77607685D6F8EC6A6DAA5CDBA199A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010196da9c898e-ea7e03e6-5552-402b-a021-4e0f3dc851d0-000000@us-west-2.amazonses.com>
In-Reply-To: <01010196da9c898e-ea7e03e6-5552-402b-a021-4e0f3dc851d0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB5817:EE_
x-ms-office365-filtering-correlation-id: 5bdfa259-bd81-43a5-eb07-08dd993db197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?qHtc4FQ8rxYPw8WkwEQGmSmcRRj895M4jXntExFm4R3cftAz7IaPELNULLSp?=
 =?us-ascii?Q?akdAxqnAgzbUg/5wuHuv4/7LCOmXAdJWXwYNhWhOSq0dCSNrCCFrhqUf5I/3?=
 =?us-ascii?Q?69Zxhc6DSgcACW4/O3wtYN0WnfthC8DlKLne8NqirkucuK0T9duXEEAL19K3?=
 =?us-ascii?Q?SabnFm7s5IgvSfC3vcY1Yc+nj85meK+PQ3MOLkRrAVfQs0ufY5IZt3118riM?=
 =?us-ascii?Q?i+kCwrLk+l5F2GYTbY3gxHozN3uKlyKnurZNAgP7z6Ut6c9IYGf31mXdfS6Z?=
 =?us-ascii?Q?enevmxMxN+d0eoR91zAviv6WybfVwYc+ySmCJfZNafdfWb1PYFubjLaVArEl?=
 =?us-ascii?Q?T0LqkG0m0nsI5UE+aW0Ye+zP6+lW//MLoXKqwjSvrMpxoKbO5eRULA7T2822?=
 =?us-ascii?Q?xEt8qK+PHhs5SHu1PPEHE7NV+YaaGv/XAoxJVchkD2JJtPBOh11WrVQkNvff?=
 =?us-ascii?Q?PZAEA0bs2/DFIFNDqL4kLB7DQhVmiU55LqCiTseddZR/vdbq7SESWMoTLU80?=
 =?us-ascii?Q?k+dnTGilTiAWGZ+TEpKvGfoeEfR9zmrZ2jFlRoaLkp7fTNC+ED30RrEvS99R?=
 =?us-ascii?Q?N3KvFo2UFVUXVhaD2UWmdzFt2k6a5Yziq7Lg6ScA7Qqs1DAQHBPHG90CkyeJ?=
 =?us-ascii?Q?D1qGmmDoK4gM9tm+ODh/iy9d9wkLKNLaQXmZUcJa4Mssx47Fr6dbOG6T2Kh+?=
 =?us-ascii?Q?SDFNMB+KNAwOGerk1wE5f/8LD2Ac9ykP4WRT+E2AwmO+OARFkUyyRZVxgCDs?=
 =?us-ascii?Q?Ci6aZxcR0Ts2VCCtKZEm1vbDDMvUJjzQPT2oKYYcVtE2VW9iUCErUpdot7CE?=
 =?us-ascii?Q?LkwMdOz7H67VYpTLMAr7lPyGcRi3358QDf/Lvh7GfNmc7RFnnlqW03sNm5Yo?=
 =?us-ascii?Q?T1bEMaXPt79VDhQDWcdP+HxCeWAuhYqMWroplMkQsXuRte41KTsKNfshMsH0?=
 =?us-ascii?Q?w0xv0AX5MWRAAW+6AqTjSGTxa8VbiythWcG3wYx0yuEmk2jdJ+ItuLqYmlmg?=
 =?us-ascii?Q?cwh+iwjyeBxgLXAxyOIYFL2sZ5+49gVNikQEiQzonPPRVnSJ/w2p0d3+rC9s?=
 =?us-ascii?Q?gpUnPuy2lXwgQaCAbKWqQ8f7qr/JRIgitfCnEI1Bb3JIAn+oKS6wSSB8XUDa?=
 =?us-ascii?Q?FuGhqAIxpgrF5EPJxac2/5wGzfln4C8U8Q/WPmneoZ8QL6WEx4cU2bjXRq6a?=
 =?us-ascii?Q?o4C0uamNuAXXFLxbsj05CMFdfrwtInAhQi4Osnze9ONhlHnWs/UNTHTgGDEy?=
 =?us-ascii?Q?xOwD25gFCtA1aahYBfuzslh9zGMj1HPXQyWMFghSUyoQq+XmPO2nYT8HrFqR?=
 =?us-ascii?Q?OZLvtgBEY17jSRpLjB46y+n0qpPJ26qQQPNkM0zB44KATKdQ0v24iLD0f+QV?=
 =?us-ascii?Q?tEmVq0xvfdQIZfANy0WZXrWm8+PaaKuockfVcGvmuGbcvWZzzNVvwEbnTBb8?=
 =?us-ascii?Q?xIDbdP72B0w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NNiRGdvoYFWizfpOK7+GIvOuLj4DUKL/XaNP7LNdxKfU6Ecyk0XCur5WshgX?=
 =?us-ascii?Q?uI99eK8hfSCiybaoEmmUzFtDhzahS384WoiJvZ7tF2CQQJYVJxkkQAQX0OGl?=
 =?us-ascii?Q?wYJo3KPM6tG68hOPo6Soc4p8fxpML3T4KUMek3q2gbwZNsOX32NDWWXWEBpk?=
 =?us-ascii?Q?o2336dkMPTSjmPQt96mV8SVg9TX9cmoODPLw8Eka4u2IfGrlQeyd/TpgHmGt?=
 =?us-ascii?Q?z/hJlpeqpu6ueFZOo+Zms/4X30mHV87iWeVwB3/WMxNOALvd4dfDrAzVv9MQ?=
 =?us-ascii?Q?uNuFjDzjao0vOE5DvVgRwFjTF+cP2JTrBibnDPbhku+irrEGP4VXDbZ+Hzvo?=
 =?us-ascii?Q?PqK8JrMEqaqXN0ikL0bevddqQP21/em903i0ZczGX+YBSFMBVFcYZd5pPtAr?=
 =?us-ascii?Q?INx+90iTUnwTko+T49iJipa1JRpLrDc5ALq9Ni/bano9Ma6OKaM+Wf/Xx3zr?=
 =?us-ascii?Q?Irru+o1LaUa4iNjrRpKIuY85XoCOL0bpVpnI4TrAwVO3c0gk/C5kB/WPwqNz?=
 =?us-ascii?Q?kxYKqo0dLK2UCYQ7yWY/E0jt3bVj8o9mtjX92NattsV0zJR/9XkR5soBtOKQ?=
 =?us-ascii?Q?3kKD5yMfV9LlHEnjN5m1J/1NbT3SOLvJpVJ1TMTweroGmpuMBcviGjVPDbGZ?=
 =?us-ascii?Q?Vngx/mD2RPtzljLFVhtz+cDeFiErkKwKGTgd2iuEByGliGa/KuCd9pfoY4qs?=
 =?us-ascii?Q?dsvwlSs9GUtbs4H+lwBuXkVvEmVN0V6gi21315lTCgflB2iIC6fuqL0VmaeK?=
 =?us-ascii?Q?8Mn66WdvLAS2nxPzm/Q5d1EFdpKcLQRM9lN/kv4AImfcgo28GitGnRAMOBu+?=
 =?us-ascii?Q?jjAcPGJwgQOg58wAO6wdsoJ9rLpScaCdcr9XJqf8iWwIvX77tQ1N5rFeK16C?=
 =?us-ascii?Q?d8yVeUbXAvlwUJV1Pa3eK8lEI+U+dGLrQIfPa37s5w1K1Uw9wHMT6XaCLKbT?=
 =?us-ascii?Q?Ckixu9pn2zeoGZhGQLkjbJ4Pbhc16Ps664gpOC/MQ/gl6nuAAbS1JwFSzDTn?=
 =?us-ascii?Q?I/jyijmQgQATqfh4KaaxGsRCraeL3GlDWFrbwtiqXyhKxZuaPGYwofsYXhrk?=
 =?us-ascii?Q?vryZgpES4szU7X1fJxEaHNFcs67S3CMc0karwbbGo6wH0Z9wbGDqcPl6cI02?=
 =?us-ascii?Q?ERNKkkId3c/G4ZlEJNuIIx1RKWqEJEPzgFFAOxqKyDR/ULp6wSqYoRGk1vnF?=
 =?us-ascii?Q?TJYxqpEUEVM8Zmx717mB686syvCyhUDjbnAugVED9f6tml1EGKiVK/J1Qs5S?=
 =?us-ascii?Q?Gn+0gnvhijQAq++rU345q2xIhgu/OzPyu3kuc+98hTw8fRi2DicKPLhRHNlB?=
 =?us-ascii?Q?JMcxvsZ4+/Q1+0SVNlrA/MOVl0tatrqyl4bCirG7VHnBLTFMAGUNaYkioMBs?=
 =?us-ascii?Q?kHGvoZ5WXS6MbRVqrWjr/hgqVqIG5P09/tu71eAyMMAZiid+w3NUMU1fTD/L?=
 =?us-ascii?Q?IrLrIDopjD5bl+zsBwg80gZTGpYhvyr9dW3eBpBU7siTM+fmBeuPiGe7GBkD?=
 =?us-ascii?Q?7u13nrjLuKlOSWSVgtysrEnneQyvnx0BdQn8AVNFmOiVqfDsSCCHNsRQ4N8L?=
 =?us-ascii?Q?eOxLVA9U9SWluC3T+7OBIkV1/IlO9dd+hdSrpLZn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdfa259-bd81-43a5-eb07-08dd993db197
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 14:34:00.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tULJgmtlcj+SLif0zt3jU/fBd7aCC/LKTagPb1UEifA99R08zuBaqC1f61Bs4AYcnTCIhNpIvergbsAiW5AKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217110

Hi All,
=20
QA for yocto-4.0.27.rc1 is completed. This is the full report for this rele=
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
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Saturday, May 17, 2025 3:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.27.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.27.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.27.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1605
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: d655b47bb267e6e167baaa49421b1ae26c25f74c
> meta-arm: 6b2d97cecd1b0e4bf4caee9a65595d279b57a686
> meta-aws: 9dd75f69c59f19125ac96a796bc97f06c4dc8a40
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: e42549cef364ae09b3b7c8b64bbeab32e50f1bb0
> meta-virtualization: 227cefa1261daf20b7d9737541994ec2bba629fc
> oecore: e8be08a624b2d024715a5c8b0c37f2345a02336b
> poky: ab9a994a8cd8e06b519a693db444030999d273b7
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

