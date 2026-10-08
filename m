Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151AACA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 14:05:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16091.1791468296114874241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 07:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QzHvYZAg;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791468296; x=1823004296;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xyZ7qAM4aUrPED1u0AP2PE9iC24CndBweRCkE0q8IUc=;
  b=QzHvYZAgI/ektOcQIHjDla6wcc3+VR8xKssNsmGNs+29jO4ftSuJpyal
   vGvWbauVXgCKNoLxhkYcXEGJOZn2vZsEx9/wBjGENFOS+p8GGtP8CEKKt
   iL37Q7hVt7q/oaZI6KPX2s1VF7NoPyFOY0B2gBF0qdeT59O+UFAZCrfT9
   6lolAnJezyVxeCsZ/CaB2JFEo0aqjAwW04HW2FXQ1Sw7N82yB7+mt70lN
   PxQcaP+/hNlrDM8iioltvjrYm3QW/lVnitZtJ3fEWPuHdKTftNgdz3OoZ
   dbN++G7jPwp8TpzUl9ntGvxSPYnR2yiAwVls11/TcqvdLB4ub5nMDpRsg
   g==;
X-CSE-ConnectionGUID: K5vxuM7bTVepKgOAjVe8Wg==
X-CSE-MsgGUID: IpZWflf3QMKRhDvst/1RhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="133487"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="133487"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:04:55 -0700
X-CSE-ConnectionGUID: lBdM0cznTOaNzzd+aFX7fQ==
X-CSE-MsgGUID: Q+q7VPtKSd2XjT08NdDmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="8682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:04:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:04:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 07:04:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG5hUnjNZ0quZY6LBpbFPGiIhjo9qfnZGkqB5Tf/a+xi8Icddn3pkvCoofhmUz77LzNgvgp1NJfNm2EcI/1a1iKLenlqaHddLrjXXymcyrHHpwxKASvbAEzDqEaYe04Ul0YogsgUF4TwqqNyGhCTquncsxKx5aMj+rmhZiN8GFjpRux2qO+sOh2liIohv0pnQVmXZIzGtQLEAz60ZN/R+Woc/Bkfjmv6bsBBwJxqPjujCFkgexOdNsvVfPd2bC3n4oPvCm+FMCa4G3GPDnqrlxz5wQ298St8GwpDX0X8octjiv2dxEMIC/lT7tlt/dOM15oK4bzbj5J6Cwd+NSirCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE65Lt9KO8oI7uKYMOWiBM+Kz0gCZ6hhz82iYooAlYo=;
 b=s8Jr8I3t6f/iSWmmnmR6k30STKWTx1nWLMnrULVOPOwW1pxbcI7PkDuUtrP6vvF5hp1z2vIx2CC9zcYrdilTf3tJwxEPY0kOP4F0Ktc6Fd8abzniaQUUERImUVV52YkycVX8P3yPzC+plwLiUM/TOuAlz2ElagX/RsJll0mvPDF68lTpB+qh87inkJ5PrNpEdbL+3zraIQR2pWX7bstZjoW4XaG3c/AqESa5/sMZGsBlKNLv+MCEafSdF39ynJiPn/vnjQrUL8A/hutpO6u4X9obt1w2GUWOEokJWyn2A35Vx3eAMLRLP1a5FuQfutezdIqkCXkqMHRooCKS2P19bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 14:04:52 +0000
Received: from PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9]) by PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 14:04:52 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1.rc2)
Thread-Index: AQHdULbozLBli/so80OJ2k4SBzXywLboTqVggAtrsIA=
Date: Thu, 8 Oct 2026 14:04:52 +0000
Message-ID: <PH7PR11MB7027C69CBB52867EE6E6EC44F4932@PH7PR11MB7027.namprd11.prod.outlook.com>
References: <010101a0f175ca54-53721ace-bf65-423f-80a1-d3571be35508-000000@us-west-2.amazonses.com>
 <18DA5831D504449F.1648921@lists.yoctoproject.org>
In-Reply-To: <18DA5831D504449F.1648921@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7027:EE_|DS0PR11MB6493:EE_
x-ms-office365-filtering-correlation-id: a3f90b7e-4d3e-448b-f412-08df25451fc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|4022899009|366016|1800799024|56012099006|38070700021|4143699003|11063799006|260925021311599003|10067099003|260925021911599003|260925022911599003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info: YWwSM2f0aBJ4W6kGzTHHOqTsRQHIPBKcY1+tPRm2HgfcXqXOhoo1ywhLD7QQtwNDelDO5p0bHV3xynV3Yw8G2m03j5+Zim6mUsqBjJK12HFpl6c+sVw65Md8biVyo4YfLLs+YyMLYcTWARUH6yukXuLjyCdxHxMjTSUaaNGA/ktEYSluAlqNdaCCgt1TBx8HbbM8pLGKLPJsnNg6QCO0Ayxki9ynBraIFdUFcfbbLPap7gIA8f/glcNP75TFjThFbIlOWQFOPWLLT5onyXzjGALqeS8S5NBRtVRdmo8gfg/4LYuupmuRuO0c0wATeFTOKBbiYiQQvoaGdMLY7MK5mqtq05bikhclf5vSJJ7p9NwvGDYPHbqL4pytoQFCGLcQGp0rEa50toX3MIByOzg4zJDKWrtMPD3HQlIWrUR8QY7WgrbWJEKKEyhY6uhiVeUHyZWlQBqmpUkoSSLnqfGoOKIn5dvBDt69O96vpVDr6MkpYokEzHEtbFh4K/BrfOsUSRdaiYMM/y+vQmrkyf0aygoUvz3/fcGuKQohA7y8F6Lz3CHjYYjqGQdkrA0DrR4dvJEg0Wu5mUv1SuBy8z7Pt+ijEWiOCz561BoiJ8EX7KNIRCnV7hcfp9f8+bi6bt8GsvPzsRhbxZToFQYxMIrVzszMV3YiWLVEtplBiHOb3Uw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7027.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(4022899009)(366016)(1800799024)(56012099006)(38070700021)(4143699003)(11063799006)(260925021311599003)(10067099003)(260925021911599003)(260925022911599003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TFIRs57CLadzEFrwt3xqGsSwcbKH0tuLEt2MUTicBIRE/2BzenuAQbgvqeSF?=
 =?us-ascii?Q?ep8Nr+rRVtg2N+tL4fd6PP85nxPYRWQwu18wPTFWVEEzRLqvl/yL67dREs2u?=
 =?us-ascii?Q?3XvWjFBVgH19D46biNdcC8o7sY3L4+kaMkrwwk7OPNXbBZvJKKudQOg6lBHH?=
 =?us-ascii?Q?Rs36uPSThxRzVfwQQuLMw8d1f5UdogMXD9PAVBilO03qa6W0xZrr1DDX0ww9?=
 =?us-ascii?Q?egjlwp6iuxA9XZ1MlheXt17bFSRcJISo8g1LY+flrm7XXoFWV0zeXeNwwQ5f?=
 =?us-ascii?Q?DM/TIOxs25aHBAfzEaTy6Dr1Q9+uc4Xw/5SOmCN7IsNpc9U+Z4b0h9injTc3?=
 =?us-ascii?Q?6go6FcJK2vJO6JeAOl2LPkt1jKFylgkjjGCC1CsbdW4EUOw2EqSOGlAQlV4y?=
 =?us-ascii?Q?yvC/91XCFdIPi6zy9rXZk3NbhB3wzcAoMW0NJSegVhopfkMFRdi9T6KUheUb?=
 =?us-ascii?Q?ttQZZGmci/SadLo5JDMfbJX2NgfWhcveLP/QLZvyaOLLnDyk796sVnJiD4Qa?=
 =?us-ascii?Q?bNeecbgAeXWHm09gdbp3pKT2P7gClU15KCsjb4JmoZ20hXYGBPEGsCCVTaRj?=
 =?us-ascii?Q?BFL8c/C9E8UmU/DoDcPY+M/61cQ45KxMe3cUs46ZBYcmGXFuR6sA+FQbLig0?=
 =?us-ascii?Q?qxYYyC7RN4MNGuPw+fsJeYgSUlbTwz2FF8zEjsNV2wHM9+TEm6tMFkAeOEnn?=
 =?us-ascii?Q?pzMFvQx4lUiXmP8RZZ2nE5Y7S5ael+2G9KkHyqMBSsv0h8gx0yT0T3w+AnaM?=
 =?us-ascii?Q?zztn+4IPK7r3dx1L1fOGWmXSK2ZQ6RHgDKvHACz8F8vg9gVrwZCEmADgzCN4?=
 =?us-ascii?Q?jeKkmyPJ6qxrHJ71LFpJtieDSkcDxyQTjwREU8jNQdw4sq7ufMyB7CR4Jxsr?=
 =?us-ascii?Q?Sn4m42EuZWi32VbCELI67A9tf1NqkuXIUogMfw6ICaFdM1Dlr/WpT8MgM8A0?=
 =?us-ascii?Q?um0gZb3c9SJkjPRDq3TNNLWA3klle6iD4Xldzugg3NNbO3ySE+V9aXkePFCR?=
 =?us-ascii?Q?yXhwsKtqVwtpeE+vX0zjDuQLdZwUvFBI8LUsyDfynNeH9CUD3WkjxiPd0seu?=
 =?us-ascii?Q?Gql0XIhn+Sv0tZ3a8sktcYqNJKgwVRsl2Z0+a+Z3OfsMHMX63OAVPTCPgrrP?=
 =?us-ascii?Q?hmjP03A4FyqbzMahuDfSfPKY9jlQvMIbaUuaHHVCUEuAkCg8uyMo8zdOJJEK?=
 =?us-ascii?Q?ZtkSCao9pTUQpau/8AAgLny66rEhDFBZuDYU3faSyqXeed4IGBcjCT+qciuZ?=
 =?us-ascii?Q?bBMhbL/7K5+BF+T7uxmVhY7+mYspsN3yHzZL8/JKitzcmhtACEgCC5RLVppO?=
 =?us-ascii?Q?IyvyLMS20txN1BgJQsDflw/0DkY+lTblf08tPkUZr2gjoq/t1gHjRotuGzlU?=
 =?us-ascii?Q?wBDYDO90/Yd6C9nOsgjPUGkmJMu0/DiPAR3dTPi90NH0XvluCIqEj5JvlNK1?=
 =?us-ascii?Q?hziOzwxJS6TEhmahg//daWmRIlfBBSrcXNakqvkl7oVFCDhRv44YpsZaD3eQ?=
 =?us-ascii?Q?aTTKwurj1WEMD2K7x1N15bp3QFZt46ggr09mOBieK0gIfZ9hPbyBCvA9XqiS?=
 =?us-ascii?Q?PHdgEEjnqg0ohNAQS5HQ3T2OPqMQxQNVJW4dyh8Op3HKIQWwocRenQ3oLDg+?=
 =?us-ascii?Q?S+Kb9X2oLzs4hrH6dJQQAWgQE6156v+5Cp57ZllGBsS3Ke8VpRRT8XF08hsC?=
 =?us-ascii?Q?W+aUXWejesJfyXDBvtaFqU4C8/NtjaXl1lEptmHEyl1ng8fz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q/xgD7Ac7EzoVt/jwdJQrNnc8jG4+PXumYUL71s/f0yt8VIXSBxGL77kVArjDwv/isB9wQYGCIh0Aw2TWX76AdTs2cNWLOt0Tt24n5Gzi9JSLcaOFbxaib2nF1owzJIYvPWHcwOv9Q9xklRVRkYHjSI9MyGEZgqpzqckJqTHG+Gys9ynUOTOK4QfLgkLqK9oAJrDtgcrvh7qewTofbTeUVBGaf8OXmiJFP/cqgp4k8VWCre0YxUXVKHvSPh1TRfkcx5xfWl7xCrXnZm/2ZNiRZ+7I+txmhot9t1RtPW1BH9ineG7yDzcKOmiGkpohvxo5gMeuQBuXn+Sz3aLOs5tBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f90b7e-4d3e-448b-f412-08df25451fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 14:04:52.5665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxKnFYbDDK2ZOomyoSUJF21rrWbRCeWZAJDRD3XC/x1U4cprEMc51TFl/oi4rGjwFw16KjAD1LxjskuSFHuUDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 14:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247431

Hi All,

QA for yocto-6.1.rc2 is completed. This is the full report for this release=
:=20
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
Sent: 01 October 2026 13:16
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.1.rc2)

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-6.1.rc2. We are=
 planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. Alder Lake-S
2. Meteor Lake-P
3. Raptor Lake
4. Bartlett lake-S
5. Amston lake
6. Twin lake

ETA for completion: 05/10/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 30 September 2026 14:07
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.1.rc2)


    A build flagged for QA (yocto-6.1.rc2) was completed on the autobuilder=
 and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.1.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4836

    Build hash information:=20

    bitbake: 634f8dede6b9d71b5a6691499fd05a8678b46eae
meta-agl: c36f0e0bbed6000f28cfd10417c280c9fdca37cd
meta-arm: 02a2fa96623cf2559580d9695cdd57528503788d
meta-aws: 815c340ce256d0935281e07f0c4162d92fe5a6d6
meta-clang: a2c51ce7e4b582a358b707e5c144c05690d2cf71
meta-intel: 8877caca6b1fe6efe33c756698ce6ecdcaea2238
meta-mingw: 2697806adf824708e86d57ad68e0978a0af812fb
meta-openembedded: 4ec8afbfcf4ce50d8a5273065214c9a8d5eca27a
meta-qcom: d4cccd3c7729250d69cdb2318e2df26635d9c630
meta-virtualization: 847867aa6be383eb2fe745aa3b74a432b81ecec4
meta-yocto: 43946d08974e61361f6313ae348c5d87c12be934
mixin-wrynose-linux-firmware: 71dfb81bd98f59ca2127d39b100ecbb8ce1e0ba3
oecore: 419c1b0f1ed0e3ce22b1022061f763d007883121
yocto-docs: f26faba8568a3c8fc81d81d3650cc419847a4e17


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#756): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/756
Mute This Topic: https://lists.yoctoproject.org/mt/121505173/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



