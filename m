Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55926FF8877
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 11:47:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9258.1777463250850346943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 04:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=O/NWwgtN;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777463250; x=1808999250;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rlX+DsyPq2bf9GbuFCExBwwmSnn3zLCU4uYPM5cqoio=;
  b=O/NWwgtNEU01Hfe3Umo7tragjd2RPGua1k4PW06Lbff8XWJaFBmr2iPk
   CEpJyGt34c9FxLF/s04ial/GOsmBpwV8qSbvNU+MFo/6zCJtBvkAPPA2N
   0BSVdMjBcfPjiO3gl0rKptkDQ8IB1x4ZKzM9r2W/1T3bK8HPz05S99ekz
   SyDEDhM0BsEDUGdfma2CT8aARnUCCRIlYWvdnHuvbEWnstAwr7CR0jOU2
   T/lFWj/cw/7zq8eV7q0JfWl1aaHmsK0u0GVzNPaagb0Zwxd7qcsuM4QaB
   /OD+5SCKYYowWicOoeh3w+XD5YwQaymxK6krqRnjOsdw5cl9mfPdHGlAt
   A==;
X-CSE-ConnectionGUID: eLEhc+CkQrGA85sBlgELHw==
X-CSE-MsgGUID: XTxGBGvGRLeNfxjdTOm1QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89084215"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="89084215"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 04:47:30 -0700
X-CSE-ConnectionGUID: UahoIvpQQ/yszHumxm3GOQ==
X-CSE-MsgGUID: gySMVFEbT/KOgY9XkFC94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234250735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 04:47:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 04:47:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 04:47:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 04:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtOBSXmUEV5IWiTzOjnCTIKh9P3+oYxSm3hqNHRNCy0FE6X5QMMsd5QTOQ6x2mTbElSLSPMvvEM6lcUcU3xhkZU/quU+fma8//HFeu5IRxZYihcqPryasp3Kz9jkgggN+UbdDnUmzCR/wHZLt/qYVRwe8TndJUFWC2GxryYlY13BD7Hm7JmjRSmZGObvBIFVPk8pTM/lVPgClQ4zfsux6isuKlswTQKpGMMGs20yq/zJ41v+YWL4mgNbhGIQ5EjXtYprJyHPkyF5Hhfj5jjXxFdvOTGULdN+5qscZoMzowFNyM3IjazCvXp2srpY4QYLlw2IrFRb3+Vj5lmaORz+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AUu0D8n6YekDC0dIxS0JDZPmH7/Wt/Krc28h38VBC0=;
 b=JmpDP0EmMjQN7Vfvgc75bQBD6akInAp7cPnyHE3VBoif4ivI+6V3QIZwk3oSbK1kx+gFwBDxrQsx6PsLcPSFWvNZuQIHdz7+Kjn0J7Ql7r+7M2hqWWF2MZPXP6ZUc/EyR8083CzIm6q0dFbDwpDl6+OLTrzE5XJn7g92b4XtDjDtMXg/PXADM6TUuF5srNEoLh9y9IUNZAjMJjsIGSvuu2s0dZa4HUGkhylSWxj05jpniK/HHiKOpfH0HkSDBfnzHWUEgBNpymrtCimFUumf76ojglMHQQSu/doal8MwNq5KKKgNOaWt/984mNC6vFktUlhlOz/AQuzrrDq3WJXyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 11:47:15 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 11:47:15 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto ML
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.4.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.4.rc3)
Thread-Index: AQHc0pU2zBOkIfItIE63n2DqAym9UbXsNn3wgAm/tjA=
Date: Wed, 29 Apr 2026 11:47:14 +0000
Message-ID: <SN7PR11MB70182C76A7D7EE473B727855F4342@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019db6d801cc-ff6f5500-d270-436b-9ca8-36ad2b5b62db-000000@us-west-2.amazonses.com>
 <18A8E9FFBC54E6E1.2028604@lists.yoctoproject.org>
In-Reply-To: <18A8E9FFBC54E6E1.2028604@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DS7PR11MB7690:EE_
x-ms-office365-filtering-correlation-id: 893f4784-6cd2-40bb-ffd4-08dea5e50f0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Hv3Cw3GezmHZZhxvF8Z3W9Y4ATYGXp4aGDHY8AQRtyJl3Xu7UfZwcg6so7TLNFwuyY6mvwI/rvfI4Oaz9hsuaAEwzE9MGKWCBWeqZBV/s3iCDKxQmWbWEdgKfhwn+6TwSC4CUdsE3vmjaPUHRCRdP63RxevFoa3VfkN6dyrl/7orX58LZAFVAMtDk7XBwtnNNZx8y3Z9qZB/GaIs5LKn43Cs3CdM9t0n1Ho+gtPBQhslSUPvN3QrOcm6yAUgtWKM8vFWYmSxhAl97HGTBRu4ftQGhtLEP3EIfTMXlhfA39c+kYtlGHFsyDi4Bp/Rb3WS3sDsevDsagkPrsLtSbCPcEBc9OKdmnbbuL6IwXNYz2VwT7BNKoJCcSi6oM1nRGl+rklhehLtrNWgJXltCV4Hl6AgL3ig/a8TrEOuTMvMT2+TD6sk9Z0u0gVxpzHS5Uj4Q3TWgVWzyT0ouzytuLQgZ8ZF8lwhqqpmKMbfHQFSs6hxxVO621rkhfMZvHi0JfR7KRE/MtGfvUHuYu9DJvU2LmI/WS28TGAfBPXvKgPZAEYOfiStKevc3xbZZomjaltDDiAF8PBe00E7UwWxrV6B9Vg5yrGHIYRS0ukCFzTsUAE+b9gYWhGHq7NVuh5PrGrfcurZx7UUWEsYillRslUUm7/ZjUM4IdjEejEuHBR7poKO02tV7NK1vSfsqORaHl3VYbK1/aLhbkT41pVfdlo0CgUbSutRSo7gJmVKRvTW+ROHAiayTSRMWrjnCNtX63J6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kDx47keL/gkNOSu1y5XPQNHoNDB2bYKb/EUSRq5DXi/g+S9iAEhp+HKE1LOL?=
 =?us-ascii?Q?msMGbSKDKWRXrI9btTGJgdHsTcIMX7bMwFJKYGfK6b9u1As5+Y/rjlDscdTl?=
 =?us-ascii?Q?yxmtHPvGWSRDOZajxvsx0TkZp11vc+u8ZQmqqgjt6H9+E/WyCrnPYobMUCCf?=
 =?us-ascii?Q?9Sim0cO+0tST4atChPzCsMNAGY/HCDti8AepXZ05m2/8zmDz2rzAVNvxsADK?=
 =?us-ascii?Q?tzZZb5NmTxQTzNJBl5C45Hp+oDSdRYpUoJHH5iC+pOJcy12Yenruv3UEy4j9?=
 =?us-ascii?Q?zs7erPly24y3gYgNJf2Ih25Hcr1VB92OoeqjwCqv6dZYi+FJSXNihhkOrNyo?=
 =?us-ascii?Q?Wx1lGaRXygqkNBzQmvvRM1jEwKVtI2VTQk0J4J0GRQohmUs3RC04Ia/XfDt6?=
 =?us-ascii?Q?q9sng9Az9PQmdI38HDRktGDWJ0ZiRqsgq9RHBxWCeEp9755Qa8cmKNDFjj3z?=
 =?us-ascii?Q?SiNGSxCo4/WMf6rfE/ZnB0l+l2yb/dBgOi8aG0nmJ97jz3KdUGasjRXbVvTE?=
 =?us-ascii?Q?JF0rXdMc30SieawiVeXwdlR2rhbXataQjXlFHKBx+X2pYj10TrRbIUY+Zioz?=
 =?us-ascii?Q?UG5PxHj9ZfV5Vm6I+GkoJQNL5sVd/4FpZlns6VaxNbQd+HjBdctYP0Arnef6?=
 =?us-ascii?Q?JlyS8/2UdSnu0JRV8e1xE2pK2Oiii19J4H1p9/DvyD/i9WMWpHImtfmOaEGu?=
 =?us-ascii?Q?InZJcpApM2c7rwOiZ7afceuQcACDvpajzWEqVjL4OFYVSaXMzgGXa4nq9tbW?=
 =?us-ascii?Q?rJkhBolEYhrhMVFV00ncoWESX0heFFhxm/98hFEs6ANEgBgUyPMP6knafkXV?=
 =?us-ascii?Q?JrXE8yTkTgyPTOYfsH7uuiLdYwXentau8+5i8yrX2OEIv5tkYaYiGafZ4R5W?=
 =?us-ascii?Q?eheh136QQrJW68ly8fTcRqp1hK3z0VOZQoiFmjptUSLW5ZxPpq8V9pU/aEBs?=
 =?us-ascii?Q?xt0NSspE0Z5i1Ziqu5/tppBvHEusvEyMixogwOm1QBZphoSPOJ/U8MI944Fv?=
 =?us-ascii?Q?D1+wevT42hvE2H5rqJYGmW6b9Qs0w5VvF5Idz3qnARifOEGt7c1fsE64QSvk?=
 =?us-ascii?Q?Kpu36nC/hGnT7ULMrP455Li6x0qs7qw+Dl5xF5kUgdP6fgaPPvGxOFACv37Q?=
 =?us-ascii?Q?NHbidCUy8bEnN9oEcWqQe/5TAbhUNV2MX8M409sN4AA37tDr97eYtl2ghmSW?=
 =?us-ascii?Q?JN9gv5Yil50cTsKyQFgu5Nl2H7Pku+dujMyRPRviklQb2O0bsKrRefqRtoV0?=
 =?us-ascii?Q?TAaoOnkzrGIqWDJCpdrbkJCL1rxLFcvywjQdm6gfwfhtL2OHHif+pnbGGk2s?=
 =?us-ascii?Q?T7nQES18l9Nwg0nggIZbVePapbjriXlz947vl1PzF7KXHll1Rq2Ql91isqmA?=
 =?us-ascii?Q?ZIroTSHNE8W38sptiZVxmbuWEUWurOLy60yCawd5+assWHvEbHAo9L7wMLmN?=
 =?us-ascii?Q?Xme4IwFtEfyO9D1RrzFHL4E/p/06K4QT342byeh9FeCIlY2fxDwD+umqHjsZ?=
 =?us-ascii?Q?E0BU9f32OGrqilpxD8jUkCygncY0fNxeHG7ekTV68mca0zLoai+e4ITwAfor?=
 =?us-ascii?Q?dk6VjT2dAFqoslYSUNW8jfRI+dVyHVI+yDopvfX4N7D3UhAlqUv4GYMqLJmp?=
 =?us-ascii?Q?lORIqYfloSTiQUbJ2t/2HyLO/O+y10XDJfFfQp70p7FQmiYxpz3mRqk6mj0H?=
 =?us-ascii?Q?VcFv+Ib3JelbEoYFEPAErrVvOFhTbaWiL6EvBBJkL9RAeNLaGSP9RlYo4svE?=
 =?us-ascii?Q?8Sd6ZKVJeA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aC9+C9qBcQW/zREvSq8WOOfXWTFdlqToxJm/Txnp1mdgQbELttdz+0PduPwFtjEqJChjOgmBAjjvpUgLv0IP5NILZV/NRLdkNXMgg5qLi5Ju7Q3R3gRk10w49EHXu/W3Mwb7aI43reRKk4F64eWMEknTcpRiLvrwK52+GmF3CfcAWFV3GmDtgxh0OArWNYvjgkcYf7/Lo3kQP8sTLX08MMNBAQXW77rlvy01Bafwt5TpiW9OLrIZCPBednZlO8yi3AvmG/4phWWDv8O5u43WZGE7/Yt6RbIOiYwufMjEGufIYKPIV6y+jXRqv6wmNXQyLVPZgL+YIvw+nARkLpthSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893f4784-6cd2-40bb-ffd4-08dea5e50f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 11:47:15.1022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEBJWUU9jnIge9LuRl3HeBUNpATZdf/3ZuB1T0UFV3twYiKSdjeS9ziYzIgNW9ywx6Q1LUTZKP5ZE4DFEevyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 11:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236097

Hi All,

QA for yocto-5.3.4.rc3 is completed.=20


This is the full report for this release:=20
https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 23 April 2026 12:26
To: qa-build-notification@lists.yoctoproject.org; Yocto ML <yocto@lists.yoc=
toproject.org>; openembedded-core <openembedded-core@lists.openembedded.org=
>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.3.4.rc3)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.3.4.rc=
3. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay


ETA for completion: 29/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User
Sent: 23 April 2026 01:48
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.4.rc3)


    A build flagged for QA (yocto-5.3.4.rc3) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.4.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3713

    Build hash information:=20

    bitbake: 713fbbdb9ecc195ceb2216a2345e0d79dbee2135
meta-agl: 335bfb321925d37675d45f0f869c446ded8972ce
meta-arm: 4dc2a7bf29c1853b95dda53d9527f0a23049295f
meta-aws: c570c7c325a60e4da29a28db014769be0f7f621e
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: fc9bc44c9da5e7e7bae38313615aaff5873b843f
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: 8bcdb0cc1dab116253b409e78fb868ced7d8397c
meta-qcom: 96edf508b3f2b83c10cc2f80cee5396af360cff4
meta-virtualization: 8f03a0cc8950ef5d5e4f11d9ae494946d1991e45
meta-yocto: 3f2e6b6fadfa542f0fe3738375a2f9fcbd4c1f6e
oecore: 8751ec83421192fc0f8495fb95798f9eb7be77a0
yocto-docs: 10818445a22c524de0934901547cf676256c2b9d


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#699): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/699
Mute This Topic: https://lists.yoctoproject.org/mt/118961674/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



