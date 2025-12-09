Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14302D3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 08:47:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3233.1765270067546392349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 00:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VvGIGdaS;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765270068; x=1796806068;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=28hRgpRpkwYpQkRYrsSEK9eLCMxl/Zw1lGC8t3wCllM=;
  b=VvGIGdaS0Gfo+Iwe6ViINMBVROogYWA4HExIabqqFmUUOXPAKZ8kwdUd
   jkpppU6LYZNXsK3DZnNG9C8jM10yp7+Hk5kJWDXvbjHiRY9Dlyw+2Kado
   lJWaAsFg7FNDkGKW9GSnYm1aEiZawIobPsWCILljLby9ENmKQQAv3cGi/
   kzl4mxeL+Hz8NLdmvqhTkdkyqevpwo6OXr213yEJm6l+CQ3Lt/l0+MPnT
   TfYnZZjK1LPzDiMtuvaTmXdD0RnzItEcT2S475n0voFog/djN/eFYgaOp
   Cyl29SOaa0nVxyhaDUmIdf4w9oG79hAeJUTXZQ6e+8NSTx8Il21ideOpM
   A==;
X-CSE-ConnectionGUID: dEE0N0oWSLui72UCPu9kOg==
X-CSE-MsgGUID: PZOIaM7eRZya1/qFV+kCIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67274073"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67274073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 00:47:47 -0800
X-CSE-ConnectionGUID: X9ZYlhiuQ4uplOLxvO2sBQ==
X-CSE-MsgGUID: Bm0OihJfQ9WYEw1KnuaEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196462661"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 00:47:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 00:47:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 00:47:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 00:47:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI7GVjXPOp46WTb1tHzFnolveBl0lQUZZwm7kTqgRU9D9RnCWXnFImKMzjpEJ87UMrPqUro2FMwfwXNS81mq/u6z8bcUao7GDyVQIpDANXSKVYOxvdR325hnVlyFIIfOWP1nP8AlLTy9Wz+8++bUQ+uwQJvtGf0xOYqkoizjqu6XYAFOtFDovlhWerXuZMjrYrhtQZNj9Moe+zN5Tr2e+LLOdvWamUsIcBPa9xI+b86xRdaLEug+s2rVOU8yX5Z4lLM4pjYDagg5E7qIOjRe/RPbh0PXK3a6e83qyNsIebux/PiGbQ/Yc547rZ55XZ/LSLpn3aq6zK7/hiwi/imWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qph7biLcEKwEnNCC70lMzlvA50AUTt8ROPdmiSfS8Nk=;
 b=O/JUcHZoYUFUgGVl6uetelus0Af6/Rh4ZC8rqY3M+8QbUGK7HpA5hRlOCmW0dcp+ooOvY1T2KO5ztw2LsDI+7kwFlIioUy1BS4l0JZLfgsYiUs9W9iRYDhjFNSOg9yiYlDDvYZVlR9bhxq3+iSv6QSZgo4JohxWmCZzlv+lmuPaAaphZItqriCHMuW+uqFQzollSlat3N1PRjbuWwPdAq8zMhhJevkwdzsqcN9WNJu2KYjkQd/mf3iehuz91eIcfyLepqcnQTvt1ZozgXefGR8aoKVzoJ6ZiAmjSNkJxhYJ6kM+pMReOPduZEW5Nb0Gn0Rprdz4nEydmt8D7EQVigQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DM3PPFC89313B1C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 08:47:44 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 08:47:44 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.rc4)
Thread-Index: AQHcYGjOUVM0QjQgbk+MueYjHge/KbUZD5Og
Date: Tue, 9 Dec 2025 08:47:44 +0000
Message-ID: <SN7PR11MB70183DDB16709A723D6FCA9AF4A3A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019aca98d702-1232ac58-8150-4171-beb4-d8721b8ea2b5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019aca98d702-1232ac58-8150-4171-beb4-d8721b8ea2b5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DM3PPFC89313B1C:EE_
x-ms-office365-filtering-correlation-id: c24c6c59-6bd8-45e8-9348-08de36ff9f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?pOCEgJzBWkZg1T77theHvYPiu2ZLlkvDfzpNH6LtQzpWco/fW1Kp6XaRL5HE?=
 =?us-ascii?Q?UIMFcp9jYEWpDuy+ediUwCHg6vovl6wWY6aLBgFe2u9Nl4yv5bRNPgwv2BCe?=
 =?us-ascii?Q?HcFS6SPoGk7t728KZexAWoAGBUeB3Cg0pSkuaL92B0sKNO9UwwY41ckHPPBN?=
 =?us-ascii?Q?yDstwWkvgq/KBR5gir241yordTJl9uoCZwLK+/h2lZiplwmsbwYFkJe1NQk3?=
 =?us-ascii?Q?FB02clXyglyJP/JMFLCRSk/fvQeMQ4RBUW76Rg3l9+QaiEy3Egz2KEFS9GcK?=
 =?us-ascii?Q?Nv20sLXVlJVPhy908e62UUoK8H0W0duWfdI9ExIgpr1rpIpnPuN6+ixuR+wm?=
 =?us-ascii?Q?U2OD2GFY8k3EWNcsp9JJ2S7V8ynmY0qnGA9tT+9BuB9cjs7KntzCyAgEZp2t?=
 =?us-ascii?Q?lPLdkPShGecp/ldP6p+AJr2qS6fZFYyVyhbBgBscFGUySZ+wZ2F26e5NZd0+?=
 =?us-ascii?Q?goz1c8pPdmzCmbSSpriarsvGDl4zXs9vC/8eeM5VfJLxwY+Xa7SvGj+HwbeN?=
 =?us-ascii?Q?NbEcZ98MAgV7M+2Bn5hFr+KnFvzCLYZZseY7ajv3A89/MJk+jWxjeMLYpHcI?=
 =?us-ascii?Q?Ktw3o59Jnj1ZlwcEc/66ORfevtuuBnbZ1ukU8cdvCch+pPPYB494LZfMXzmd?=
 =?us-ascii?Q?spuSZT6unrUbVZZ4oMUVItv8Z96DuAEXsV53AswBqaS+ezXnDH7lh+zsdyM2?=
 =?us-ascii?Q?3/JXQpoQlGhlPX0mmVlPgUomGaH+EyEd9/ah5Klf9bhqGiyK+p130zmA28fc?=
 =?us-ascii?Q?TXWZuvamvd/3iiCPOGlrAQlA4I7UrkzO3kkYPjUCUOuZ+nusodVZjYXhiwTG?=
 =?us-ascii?Q?luBPc7xkUvW+BjJ0rbzdG5d+W6n/j2zuDiqS60yDzXmLGzVRJa89s9ahA797?=
 =?us-ascii?Q?dPIatHKSHvM0cHcdjOSXtA6plsQ3lVsXmTmZ5y+fNv1vYoPkEvSsXNtE2OLo?=
 =?us-ascii?Q?pWPl6U/+IzjQl5FASrO4MEAFOXdhota+cqKibd/SuMuqP27/ePigEAMKZwHX?=
 =?us-ascii?Q?FFV+Gur+Ghbdq84KwtktWGxpqVtRalzvA4cVkZ3r7z51vdJVO2f/iSHw42PZ?=
 =?us-ascii?Q?7jHWW88YfIh1u1hxDG6+d+U/cpwbT5hE27ECTwmBum/0jNiwU985zSz2tFBG?=
 =?us-ascii?Q?TuSX6WjloZpVR7MBDUiUc4Fvkmmi3U5/sg2Mab6E2DlvU0LMt9Khm2//A8AE?=
 =?us-ascii?Q?vdWBXMdAyqLHzWVp/SP4wzYMNGJ9eEC567SNhXrwNd6sqFpWXrA4Hh3v5uDR?=
 =?us-ascii?Q?nTEXU9udPy1fPLXTZ74/GWCs/qUO0wQbR0o+dURvEVV+3NTTfneW6JNuVn7W?=
 =?us-ascii?Q?dBZVAhwAmCT9FjH5opAa1J8vC+evoaj/iImJqycL8nx20zsvUI5zKpArvDuN?=
 =?us-ascii?Q?uSOejLCIMoxAYNFNYQpFhKBLwL1OVgZARsiX38Y9jDNs4mL+IwRlOY1Y1sN1?=
 =?us-ascii?Q?WZZNjZ0Fja5w3/6iAdQQ2zoEJsZXamaPzgDekiJYct7N/5Oi/wAv684BQAET?=
 =?us-ascii?Q?haz6Gx+p6pV3YlTyHh3EN6CE28rami6yAcOA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GIsQ/I4lhva9LR1UYx86WHqYwdLVgN/5UY2UiV3AUNZF2ph9psx6cfjAchtm?=
 =?us-ascii?Q?l4jqCrleo076wELz8rUX7z1igmbeBnSqygt/HuapEG1usAQnY2Z/1qKAEnQK?=
 =?us-ascii?Q?Oqrdwo7+oL0kICY/BCUzaBP9wlrwEDk071E/AYTffl0epHW+samlJgYVFNyN?=
 =?us-ascii?Q?w33QK7RxjgnnWLDkz6KoHtf1lLnZg1T8kQ2NTXvf/RSeaUm9jzc+e7oCOYCQ?=
 =?us-ascii?Q?BI4uxmQZt+ku6SXe3omO9UHgxbdLRt876Ho1W886GSMOQqaQaVWOkC9Rr1rB?=
 =?us-ascii?Q?kgMIQPjntAzdUaqr108mXYPzaiiQh2Eq9oejWxuhbzxDJ7h6Uio8yu0TOI30?=
 =?us-ascii?Q?vVAsBYuSxXx/dV19vj1PlBPxFnU39yTMXlKlkjrynz760xiBhigosUT56TFM?=
 =?us-ascii?Q?TjffA53/rRympkOWfvEN7p7uQXBwjSdGj2xtnelrmoGpgB6wLTyx+CRHW8RG?=
 =?us-ascii?Q?0sgmINS89e/llO2ajELfIlwV1lreZhsR1noHTHNFTBvJgqF4JJa7ZEvKM1n5?=
 =?us-ascii?Q?Dcs08SO6RlRNWuN3ZtU3rlUmRkUsh7HIv+azh1bmTaIQPxj0EocoYIZU4+tR?=
 =?us-ascii?Q?lq0t9sqTIrMJbeazOJkqaFrqyLMPubPDvqket89j6IL+dK921t3M83BFc0du?=
 =?us-ascii?Q?hHS9u+Bv7+n/iu+Dm1cPBWIgvfQrycKVB7KeAD2KArXggdoKy4puKiDC6MVe?=
 =?us-ascii?Q?Gy4ZVtizvuP63nCQEzdsy4+/nTLUAQS8jjIi7V+SCZ+smG2rVMGNarfIPBkD?=
 =?us-ascii?Q?4ZqAXSWqXmuJ8HBAvRxyi4rdngkNP+neML76E5/UT4zE05NOp4rws6+H19qs?=
 =?us-ascii?Q?/iSaFKTP4a3/igr+Q7HX4UGpPFWpIla27QHj4Sdd4vhGXvViCA7sfkqgDEd/?=
 =?us-ascii?Q?hwZfIkIqwfj304ROkCxoU+WQmmrOUc0ZWGnz5vbdQ8R8gdPtgHYciyy4yndx?=
 =?us-ascii?Q?N00d4SeNRuVUDnq1klnt8DrVRPgr+n1hmskbMvTEX0ofUIvJlV5Bnj6ANhyQ?=
 =?us-ascii?Q?V0zHZ1Y+NREjFKRBmUrVkAO3P1FRtC36Vh2hfJwm2gYLFxeiddjoGw8ygHFR?=
 =?us-ascii?Q?VIy1u06xkAVpV2s1tmp4NaAyxNTdXJICTw8OO3/fkRh4s06sFZuDhDD4HkEU?=
 =?us-ascii?Q?QxJKDJwj64+O08GMSz+eQfLtSKtBqzdzngw4LFKbyJFqI3jCv/440XkPV6CV?=
 =?us-ascii?Q?BksPdOmhV7K/F2WF6qWgDCPVrrIT7LdIqw7VF5le+hElo46FcPbWj1Kcm8Tb?=
 =?us-ascii?Q?kDDcAYfE2hAYVSobokspsQ9MJH8uSuuKXmqUlsEIh1lPW0zXTadIhQIu1Tqh?=
 =?us-ascii?Q?MeOLV4wntfy4OgmxeOxlOdTJbCOK5jx4ERTdORZ3l0WG1EKIxoKXW89PmBVn?=
 =?us-ascii?Q?l1/iGZPRsMEneWAAjawu1iaABOH2YOSMVWzGsUQHkHpw7cWhYlJwRXtoKbiz?=
 =?us-ascii?Q?yaTn6j5T1JCaRzNDwsgVYFCIDEleyLqLfackEixGfGyjIb+sK8nRF2h4vtCu?=
 =?us-ascii?Q?lREC5YOXRdkILBB1rQVV0EQZaJGvUz+Nw4e1Do4qyiGWZr46Bx+xhnMfH1fK?=
 =?us-ascii?Q?Q8KtolGtN5lp1LID+5DpzcrdP0B6g4O3i6fLWtne?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24c6c59-6bd8-45e8-9348-08de36ff9f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 08:47:44.7276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBp2jxzVjAyN+owb1TCghgaAyTom+nF7H16jaGvbB1xBrVFgVs7mlfB0bCb1iO3NRme3vou4OI3aHXqcBI+6aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC89313B1C
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 08:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227416

Hi All,


QA for yocto-5.3.rc4 is completed. This is the full report for this release=
:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
No new issue found.


Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 28 November 2025 18:43
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.rc4)


    A build flagged for QA (yocto-5.3.rc4) was completed on the autobuilder=
 and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.rc4


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2800

    Build hash information:=20

    bitbake: 720df1a53452983c1c832f624490e255cf389204
meta-agl: aa0d68572f54d2a4359d03c0e00446e91840c53e
meta-arm: aff67cb5d748aafcba1ee589a758d51191f061c2
meta-aws: 8e242eab3d44acab70f97a3c26fe9cfc4423920c
meta-clang: d0a67c76b7a3b585dbe2ba8ad509dc0fe0e58af2
meta-intel: af904290f574ee9b1f62aade9f55dacdd9fb6cdb
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: 09c7f76c196876a4366f220b360f4bdb93ab95c0
meta-virtualization: c2185cd5ef225c6606341745ad9ffb02efe364d9
meta-yocto: d02d3faaf4d6075ea03e9eb47654ec7639f929a0
oecore: 8519978592483bb096ed5192fff7af6c887b799e
yocto-docs: 79cd33b06e87c04e4f873a5afd9d53714bc5047f


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#628): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/628
Mute This Topic: https://lists.yoctoproject.org/mt/116512706/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



