Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BFCF33817
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71321.1773737293764148794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 01:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RirYgZxp;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737293; x=1805273293;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1PjaLy0uBZhR4PNDY/dMbDpnKkrOVvlQZsR9aZp9biw=;
  b=RirYgZxpbfoBS/FJUNIW8VuC5NMFgGeVNfclWGW+pxqQI1KxwpB1Cefx
   YYD4WXq4xCX95RbnB0twI/u8+sSpRjq8p1KEq8FxmjmiqH+DMBOvCz+4W
   Lr/NALCvsnfayvgdCrT1OjuxtM6veuoF6lv6PemV8u9Gl7IurVD5RutoH
   cxUa0Ys/3EZUhl0RJaIiHuOT3YliiUDYq+j0r0feizG+D8ydNJSZPSVOA
   +d56x5/Zqu2mPCclF+xuojOgGmWXPCUqEQKooPCRPhbM6QdSw/DXkGO7O
   QQGuXSO7M0m8NFW1e7TST8ADXqyEZJX8XBQfNSK6PX+yQTOTc+fTYhcfl
   g==;
X-CSE-ConnectionGUID: mMGu+IaUTOWDCmktxDKaZw==
X-CSE-MsgGUID: A9pJXS9pSPyw0JO3zLJcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100219074"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100219074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:48:13 -0700
X-CSE-ConnectionGUID: wol/YvFNRlCeSWV8jhkSYA==
X-CSE-MsgGUID: R2+j6XhGSeSHH550SgzN3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226326386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:48:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:48:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 01:48:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amFwnP1o3BMsaztAUZQV9BoKXrwg9rk1uX0+csD0l2xqgDD/TeiBuqcGhI1LooE9JZ5yfeof8eH+DQ1jusQwFpwaZGCd04JWOEcwoSKEauktIpQ/AGl/MXkELJAbnrRuEFpmjKRBZtmS8M9QagsVsz6icwv8azmn4frMsS0F9KQKrDIc1bUS/XjZBIv+Md8HVVTHA/OmvLCJgzr4WZw2LRfMIZUEZm5V2chOPy9AHwnf9JNWhjT4/2ZP8mCHoa5hE6KakclLPdRQROORhVYnZfqyQy2ZKR2FR1nD2ylORrc9pzQdZhHfU+BDSUNJjM75FdbmmnwDO8cPKuoiQXTLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/sXCSVGp2W/Q1Dt9wtCKmgQQ/I93ReARJTDJA4+KzM=;
 b=GPmynXbSozKstVlDjs/uisCtwEtK2NQ8pG4zBE+7HrTFPEHSOYAtY9eyut4sjZ9c0n3bKs70GMVlsKde0ViVX5R84YGKWt741gf2kV7Aa0ECGYy7MuoLodo0BnznXof8nOHSnjBb7UOWMmowOm6+S2h8GWiooVSMn6x0XXtrru6QdLeRgjGwLQWFwYxvfZbmmjZAphGu5MPvLinofvxYLLGYaNNxzsCf9f5Ebsu7+bAcuCHbIFQwfVrfTo0a+bAUd8gtMQMD7dvvn5hZvdNThGlk6O2GZo/htQA2XiIS8ZwsOZrbr+vx21Kz8J3ZpBe+/vsX2Q4DVn9TOBnlmos2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 08:48:09 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 08:48:09 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.3.rc2)
Thread-Index: AQHctWdKUpItgltfjk2YxaJiPMK5EbWyaTig
Date: Tue, 17 Mar 2026 08:48:09 +0000
Message-ID: <SN7PR11MB70186F291F441D3218C1A067F441A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019cf79d32a8-dcb852f5-e466-4b80-9e02-65463eec7210-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019cf79d32a8-dcb852f5-e466-4b80-9e02-65463eec7210-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CYXPR11MB8729:EE_
x-ms-office365-filtering-correlation-id: 77cae763-d518-49e2-74ee-08de8401ea2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700021|22082099003|18002099003|56012099003|7053199007;
x-microsoft-antispam-message-info: ud7vMKa5g2Mb4AZD4MbD0wnx2+EvNP4NRrcvgc2Opi62rZzgyaQ8PFOPJoAyGNpUv9isnrd6TvKQ2yRLZhY+PM1YBsixG//IGBntaLOIwO4hChA2qXDn9tTKbG6jS28lKljXtRtEkqbUvduhMYIzKNS9gGZEIm16wpu35ljAc0A74a8xrKJ++TU7T6/VWV/ych5z/lYD2kDrDTsf2SIUFptIRzbTCtm1ofyi0qwgXbnzuWIaxaIZzcRSjOkxcTSG8lFkUO0xfhrFkV8FOPQnB9B8sI3OQ5M9UCHunjpYPNcpatiUUwDs/EJioNPHFuVbQy/Swu/ZAbXE1KlNvD9MRl27iRorqAB4aF/ofN0xW9dmaWePaEJxhrV5mm4rfOeJBa2p3eF0pPlbCv6QZwHYfXEPkd9ihHuZUsIclhjYiplsJfHZxL0IcH1/GtND1SGPXrfvk+eux1MsIaUfGQOENSktFOoD4SWV5ffIhZEY1WU2N2XM+8NWwdvHM83Zgwc3W2tEJaAC+LLWsidpeoqAllV1sdiL11/RniwmYtry88DDb9DtmYYlMfkRWyDvbEPdfowvYhZqsZSxD5heVfwZze3mBeL9+KNosqWFMktaQIEX9nyoimNnuMCQ1Y9tM4VgtvfXgjsXmnzBgl1qVp60dlByRiwj9UpO+ZQeU3wovCS+GCaIFM9kH4xdoG22yHhvP42MquczEh8uWrOMGu/slGxl4HaOpnBTLzAWZ9XclxlulgYeqOo9qGW1XUbS+KBB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TuAJxR82zqu4YAcEdiDq1qrZv6qzzI5FAnYJ4WmvNwm1lDbzB5S3bKNqdQJu?=
 =?us-ascii?Q?OQcYa2UYU73agdB1Hxay3xdjkiP2OKfrXEYyYAuh10hJldx31Ag9wOdLnZA/?=
 =?us-ascii?Q?qhkoqU4vrZz2+eZ9Ug7HOuHBduNofSLA9dITaKxy1SLcShrETq1Pjmg372vK?=
 =?us-ascii?Q?Oshk94KdTDIy33TZyw+5fPu80ThGliARdXRKVgDWQvNiw7TqOyyUzl3IHSIf?=
 =?us-ascii?Q?HgbiAj1bz0tVmiDXhXdu4KrzDOhmmAo06gABiu89VaF1ZHMqJ60nhW4A7rMF?=
 =?us-ascii?Q?EC/4eJx6UwipaKqHhmB9kyPvy20qGQUjsDDUXCDBRTIssYoktrHMHByGTNNd?=
 =?us-ascii?Q?YWP6mcUvNCDpIj57jn+A9QpWe713gd5I7rQfcxWEgCnbYb2jxnhIdXm0v5qA?=
 =?us-ascii?Q?LXSH1++FQo7c0Cta2Myp+U4Ct5MDiJkFDAXJt+nb7+vpNNIOfhInzzRD3RH0?=
 =?us-ascii?Q?hCe4qKR9etZoNa/s9HVM2Fa8E5RGfrRbJ5JNH1D+FBUgQXhVG/NIQ8GOZ96x?=
 =?us-ascii?Q?W8IcawbldG42SGZKvgwvEMHjrMxIhQstDLIB5zX4n0VwGrkGv0Oks/s8vARa?=
 =?us-ascii?Q?DuA5vSU65zQJNCqdbc62D3utHIR2qJ97whM0qDIuAqFWvggprqQfeJeWTOuT?=
 =?us-ascii?Q?0fhsuwxdsCARwy+K3EdLFwNbNJRJ7v8xR2GHjZ2nOWpEGrP63pC3xeiWut7z?=
 =?us-ascii?Q?gaE/3yeaXOA6ztwv3Ma6e/ACS5UkiArYDo5QSVmmXAVh1HWwRp+kfAx7H0bd?=
 =?us-ascii?Q?UrABNoF6kbVOsXL24aUVK7J019AUZ2OBPXD5mkuMh5VuPbevwOiMiAQ+MzeA?=
 =?us-ascii?Q?OdXTL1aIW7EhVT65f1pkr58eFnOhC9P2ZGuwU1+WyJyGeb6RMoT7wsXlXBQi?=
 =?us-ascii?Q?cAO9laXggbAu8pnJ/SDqN15vlgsuz2pyxWVzudyeNPdzO6MvoN3puci9pjIA?=
 =?us-ascii?Q?xCp1VyDaj3KXfmfr8PK+OKkD5g9tsa/RXU6Hh3ulbw0yShtqYwF8SEZH5NFI?=
 =?us-ascii?Q?83fAuZwbFqeM8q1IwKpUdYYqFwDp0xjZ/i7C+HgFqTmqNWAHBgIApNv+DZU2?=
 =?us-ascii?Q?Scr1MUGsykg1Q+7oPouoaDpf8C5b1oGLUhYAJL68UJsPucECcHZaVgj3vuOp?=
 =?us-ascii?Q?G5cHP6usNXlRj0TgJO00GAwgxxJ71HDa6vJ8nNsFhsvGnM3xxxa5u3A1drco?=
 =?us-ascii?Q?IHV6BD/MYCnQiyaAZ4DI7WQXuUiMukX+VeAglskFG2tkHGZtR7Y3Lav7otp1?=
 =?us-ascii?Q?Ui2p56S5D25iE8DaOShwWZUlQ7zQanTnXnNJwPzRaLVRSQigi7leFcJOd0gK?=
 =?us-ascii?Q?bYdP7LC4TMib729WcyN73oNjjrkczVt64sXAG5x4jTZV8PXf80oO5VmzTfc8?=
 =?us-ascii?Q?jQMEcKcuWhuBv7jrwd9hw3ZSagrzAXqzNTXSVYwNj7suRWyCtR4ZfQS1Iwv3?=
 =?us-ascii?Q?xX20CgZx1VM944GT+czV2+HcV9DTsxOi1rf5n3sOJ0viIu78hI9AQ7mmHTGk?=
 =?us-ascii?Q?bVilKbpSALC/YmyUWs4iB8MSPx0+DyvnXSKvHHvZ0ScODlexw39np1AdQcYZ?=
 =?us-ascii?Q?dVnak8B1iNtm6ZulEwhGkkqvZOcOqXo+W2UFdHNMxn0Hj/hQ7KCduh4qozR/?=
 =?us-ascii?Q?vR/qVGL9G5SF7KsfZmtoWW2YTUBOHW5my4yLfN0MYyWcAVb0xtzYhqBcU1FU?=
 =?us-ascii?Q?hlT8q/GRVMOv1JmUDOa9J9E3KWwMKD1/yb+iJqiNsSJFSauPviY/sNB9GnGX?=
 =?us-ascii?Q?fHp6L3ZqeA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mObocrBQ9++jxxb6oXE2N5fFWkruYfIuw7dLxD8bkFA+pFo1g+tuvutQrhefXmIhqhRHBZo26rYFyICxROQXUpnkW/RBuSsIH4zg/UDb2U6/fxoCD9iXeEYOpDw7b2kX3JBxWzMAwewWVDSMMiDK11QOkHAYHOqrNAnlaaU/D6bRyaIldhScDHH6qRD/QCY6ZhK6Nz1XmURfPRrBHceqxIgrPnj4kYEMHeYhaDrDLVLdBtMNVWeZ7oVFNIdlOjexB2hzgVF0bPE5eXIObo46cuu64PwGUOT1NYYW45Q45cZplh7hYXZC/atA47JAGaU6LyuAZLOaUfrQJfxp7G3gMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cae763-d518-49e2-74ee-08de8401ea2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 08:48:09.1314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mbyh2EVGE7IBC0LDf6fbQeW5AjtYRbIFtwLIU9p6MJuvBWgii/dMJvyGHINM9Hm9gRDmEiWZDnUnshNC7nwYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233306

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.3.3.rc=
2. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay

ETA for completion: 23/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 16 March 2026 22:37
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.3.rc2)


    A build flagged for QA (yocto-5.3.3.rc2) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.3.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3433

    Build hash information:=20

    bitbake: 7af7e04f3adc8ba144d9e2e6b37ed4ddb3b59df0
meta-agl: c1761e898d7fca3d8438e9b010eaf234f94fa407
meta-arm: 73460c53949658ab6c8b46269c3a69caccd3f745
meta-aws: 361115903050329832a005bd2c98ed40b6e8dfd8
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: fc9bc44c9da5e7e7bae38313615aaff5873b843f
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: 12fc4c6584e001f89108a6691ccf2028eb05ed5a
meta-qcom: 08826f0bdc9b36db8d5bcdd980b11648b185a930
meta-virtualization: 8f03a0cc8950ef5d5e4f11d9ae494946d1991e45
meta-yocto: 9b98ec5e6cfb6c9dc74d3c2e6304eeb274f7c487
oecore: ab57471acad7ce2a037480dc7b301104620f1ebf
yocto-docs: 82bd1a71e6e6a707d0009725969976cf2256af36


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#673): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/673
Mute This Topic: https://lists.yoctoproject.org/mt/118349130/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



