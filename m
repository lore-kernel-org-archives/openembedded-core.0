Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3189C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:05:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13456.1789045521193408330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FPVTAMEq;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789045521; x=1820581521;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=S4XVtNa0r0B+p0W2SDayjK3pOh4SyP08Ex73MrKyqps=;
  b=FPVTAMEqfI9bFwXYyhihm0rQUR1VyJVVAzOZhoHC7qzdNVPN8tIu8MZO
   oPRhCr5nb977n/QzgIccxlRh+XMK1by+r2n47MEXTNGiQe4MYemU5g+xN
   2T+llBT3T/qt23dM9raVpdHlCKZoV32tvgiA5iTxuT7+1h2WIrSBuVsQ7
   F9hZiQzRI94UEr6+5Tvqv8G/0YYDOxdO7IgKMOGcrwc+mF3Ukyw8ZuQ6H
   joFHjN43XE7Nnj+XoOxNO8sjb5bfdA8zg18Q894AFiCSSqLofU39Xgb3J
   E7kaYy4zVAWG6fEDVOTE0DFId0NTywAObu4jp2R5nfGrbtMqKcq6o6+cL
   g==;
X-CSE-ConnectionGUID: IgkQve0VQbe57t5KWX3itw==
X-CSE-MsgGUID: Zf5QsTQHQlit0nsSluGcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89534644"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89534644"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:05:21 -0700
X-CSE-ConnectionGUID: Tqm/PCzyQyubFtaDJeCegQ==
X-CSE-MsgGUID: efaFCdS2R7KQSvVV5T97Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271150225"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:05:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:05:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 06:05:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCSJVMKr00hDZuXXFTznMpmaVYWrDmPem9198+M8F92dE0692vyv299DdkKVGD3GHrv2L0EUb1jt6+rVou8/FpO7UMqLW6ECCSwoHuaDNqqyIrsmZSX7poId3hIzBs8+QQep74ra2V6Ju1Pzd/YdofwV2/LiTbLXjQZ2wlB7MAV8Io7CGKj9e5rmPNKxXcidzVNyLFIJ+xXswnpLKivTqK4Jnfia8TSSRsWort2fvHwwqb6jPIFTS/I52n8yDBYwMOYbW7ojytSp/YBJvUHJM+45+JeVTuUz0tcFhJce5sdiRdoT4T1NiGTDtqrebMYykdaiCwXzyTbB2+vkTqEROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko06IVJUufmRVP7Ji3LgcTc+nQxGpuyx4wjstJl3Mec=;
 b=rl8q9d+OzyHY5rbTOj7S+tNavEp4NKJyI+rVRKG/M9j3R6aX73sy5Q4Q/6Ys9zidJw4pePMW2aEONb2cKsvzis1qj9dbE4P/9gyamZtJ6FFVvoBt9vQlL93hCQNRILGYMeUw/fS3XPyNrd6Qv4YE8BfKe/8ZYiMEA+AcJAJRzeZyuddK3mqhBhpXovZ5heBoTNBitTRGPrmeQPj1IILbLOxiFdQnm9avf0S3mhzg3NJWP3LieswiF9ChOWDzQp6IajqDkyDHF9Eo3EFqYFnHvLAz6dmUprLTaMnN/T5RwlPRMRJY/YS9E1gv+3YdsoxayiiqFBWJCUFFVBmrrsrmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:05:13 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0382.012; Thu, 10 Sep 2026
 13:05:13 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M3.rc1)
Thread-Index: AQHdQF5En5O3RBTRZkyCCVJGUNFjDbbHn6aw
Date: Thu, 10 Sep 2026 13:05:13 +0000
Message-ID: <SN7PR11MB7018754CAD789474C30B026DF4BF2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a086555523-a038a5bc-9dfd-4244-be4d-20771adeff60-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a086555523-a038a5bc-9dfd-4244-be4d-20771adeff60-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|BL4PR11MB8870:EE_
x-ms-office365-filtering-correlation-id: df1342dd-cc93-456a-778c-08df0f3c26f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4022899009|38070700021|56012099006|6133799003|11063799006|22082099003|10067099003|18002099003;
x-microsoft-antispam-message-info: 8Y3hwhHLIOCs7GvjyK3KCGXkYr1fJxkCkzWWgUoIRIx6qMsdniI/fZy5LPvuJZy6NSIW43w4yV5x9iq1UzZO0dEE8SwxxZ0APbbVsQ0lzALo1PqaX/dJk9LFmit0zsTY3rAsrnDGF5y2eQ/+V81dpsqcyefcCiK9h0N7j4mhBek255lUJLjjGKcXSDz7RZbOtWkfczgnFtr15CWK9e9sOSKlCyrK7O4xKb76/PbOGK39ugElmnvaXKKw7zhfgW9qj+5uKZfDIpeqrY97mHRKMsbcsIrilqllwgkZEZ5Z0nFmRKxZcCUPSKTUxVu/4aM+SrXSoJWjmoJMUXu/qqQAkg7sywC/tiR1h5/1zwCwVSHeZENsu1LvxtRQh+P5HRoYA+JOrA1w6HgjoCP32t7wiLUX9DdVlmQUyzUXql+g5IMEQdwVhp68/R5vwQbQeWTMDjT07LucQPd7xEu9CCe0Tnead6/rmTfSxO1FnaB7pedeQ23d3m4lM0A9h9s8dZAicMHtnyhM6FlZOXgMQU9Dv3yPWVgKfDX0ihYD4qocW9s7nQL/fQ3BPf1awkZQRY7sYg8FnQmOGg2AtA7waFeS50N979gSXmKzC6xI7utnkuIMZFY2b6tlt5XU0jg7q0g25VfMav59qIN1Uitzz+SAD4H0lzaFIZCt57zdHqXQP6w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4022899009)(38070700021)(56012099006)(6133799003)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?COI+W+pupMTW9xM0P/1U/5wkSGWBMH+r6AtgK93Tc1NVrTa8O6mhQeB7/QZ3?=
 =?us-ascii?Q?o5zyzExIXbF/E/8dBICR6p0NLh9dO+i9g2xLrpou/gcORsTi27R0M4FnuRYL?=
 =?us-ascii?Q?QgtVnQ+LkqDwxLdjzI6GxZp0t3IIbdlfPxYfUfgIKIdPzeuNupqtbPewSvNr?=
 =?us-ascii?Q?FSnco8OroTeIfLqlafKWR3cWB15OU7EkF04CVoS6vhqbqV+qOFW7+gF+FNfk?=
 =?us-ascii?Q?hSZ8SCxgpm0cN4pftTQo8nVCTXAaWtcX6V+3fIzO3dBID43G7zyvOi5DJ373?=
 =?us-ascii?Q?T1rmM9C6pBlq/W2+aeo5Io2A6Xzahzy60vIkwYP4lQb+ksoNw11h4yeEfkfC?=
 =?us-ascii?Q?SWJCXzemYSl5WmpXS5qKS3tO30sRmXkE9Eb2c6tYhe1nA3Yk0+KxKKsHtM22?=
 =?us-ascii?Q?dBy5omcI0UuTY1j4fKupWCS+FS2YoVj11J5lj+1P245995kGJpSGsih6DVYY?=
 =?us-ascii?Q?AGdp9EZ+R7d3PtsqhHMA5v7f5e+4SnXRk/jRwFaMq3wvcdO82CsWuAT9M+TB?=
 =?us-ascii?Q?vu8SKQYV7GJotsEUUdmvQ588nqkcjr+LhqHWrmBWzVYKavdixGmF8++zLSYV?=
 =?us-ascii?Q?JvXRoSA+9NvkXIFQ3UJ8ah/RQwCwzRlXNRAeDzGYsKMaTR2/kwjeggVwqZcR?=
 =?us-ascii?Q?f8FMLnGm16WUp4eNusEFiS5PBu85u3rhd3yFgIZMizikKwYnttHh4wmrbmaQ?=
 =?us-ascii?Q?B1VYQ8+xTWYqk/GUCSBOxAaCUfnDG8Q+wBT3h7PXSSUUejKCNZfMtEWLqayg?=
 =?us-ascii?Q?/qVImcQIA9IpvBWtTRywOHCCFFuCqaM7+NE8EO4+JgBLpQUOsMTZvDe91CF/?=
 =?us-ascii?Q?Elr+yebJc/ozpjbQUozJvYs0oDTsqlTaw5KFfqqPbgbzfwYtGrv68m+Ay4+5?=
 =?us-ascii?Q?ACHEwg4HGRPx8kNX5HTRVwiw2KdL7IcB4SWFVcDXIalz/eNI6i/ZtVDHuMcS?=
 =?us-ascii?Q?hODw3teFE3THxg6NDTo0CzO3Fz7KcIDcO53aJCBGtSIr2iFWC2pQsWxZQ0Nv?=
 =?us-ascii?Q?/Zp6VGARhWiWUUiePw5/zC3BxtbIKgfqrONtB1dlxvzKeHZw0vSNKZuX5H5Z?=
 =?us-ascii?Q?wBIt4G2KQ/w9DLPHftU5ATxoMk1XqP1oQHwc2CjVXdRmk4ec5yrXkzTzLG07?=
 =?us-ascii?Q?5HLxfwpAMi/1pe67ypGlPg5UDKnH7Px1EA5z9UVipIUxkIJLliKITwgdje9S?=
 =?us-ascii?Q?ThLHOmKGmnTmaUQZGkMxQiceDYnQSftz6sXXzmueZyikCq3iM5VpoLFKK3Vq?=
 =?us-ascii?Q?IHh6CjAHJ5/c4sZJV4oZmvpqbtnEKPMzfaoQ9yjY4CWUBToYmoyXrQ8ewP1T?=
 =?us-ascii?Q?KLUS44d4Wusi2GjLA608ZElOrwmyPWVuQdIZAqmnhrAHVPeP9xzdpllAs9Np?=
 =?us-ascii?Q?uxUZjZFIkQWTDP+EDq6t/LYOkPn7SGSaDZulsImtjlXrCGJBKwAnmukp1i5E?=
 =?us-ascii?Q?BmSLZfdIWaoZxJ6E/jkYGQw+46v0D0OWh1LDvsrG0sHhhNmJE5HOZDMkEynt?=
 =?us-ascii?Q?Qk1Oe8j4pbZH9sFhm21bUd4C7UUGCKMmT/pKG8HijH2AhdgBu5tQaH1gN4eX?=
 =?us-ascii?Q?sp3acihn5R/wxKoTTli0VdsXnEDsUis+gsI2wF6ne/le2Xe9/anzPHtKWVju?=
 =?us-ascii?Q?3jZAU6L8xB2H8hQK3vV3se4AP0GSgaHWrgamPjkLntDbmTj0GkhRqERwE6kO?=
 =?us-ascii?Q?OoFK1rXtbnasSQ9oaKWzB+eNya6QW5Mb+lXIgqSEFJSqmEzC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iVfjTtO66elYVtJlT96W59LOABwG1N0lAlz1Tq9/vT6UPyT1B/CE/yaG9/zhxgv6lfEZD1/UBeK5NGW9Xsu/48q1n+xWC/7b2EHr67u/1jXn15MZZcc7tZ6YCCtRzeILNoAKxCGKJaOJ5XhrJ+pZfZJL9dkHMEIHBLou7JrBx/HqidG+8B1Zn5InrBi32tJ0NGiErlupdqRBHCdgcV65BEjsKspp4rOijM6yCdCKC3f7BLTZL6YHiXW724lRWrSwsp0HEfpFiAG86vwwG3mtYVo0qoXTss0ywlB4Zax5TQRVMM1+1q5rmXSOiBplFCtzWxjUfvhBMwAr9pCV0pjg+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1342dd-cc93-456a-778c-08df0f3c26f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 13:05:13.5549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QKtlkPvvmdACZH/YI5UOAH8g+1xKWXu3T6JMB2toFBjeyDKEEVG+DuyLrJtP/G8k14YWkOx9olZcAvzqpeKrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245562

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-6.1_M3.rc1. We =
are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. Alder Lake-S
2. Meteor Lake-P
3. Arrow lake
4. Bartlett lake-S
5. Amston lake
6. Twin lake

ETA for completion: 14/09/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 09 September 2026 18:52
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.1_M3.rc1)


    A build flagged for QA (yocto-6.1_M3.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.1_M3.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4701

    Build hash information:=20

    bitbake: 046a90b0e9b7b914b7a95aec579cdc3fc9c7617a
meta-agl: 3c55b45bf920bec93938af02f2452cd698d3bacc
meta-arm: b0ff16aba48a197070daff28ef7ad67067fd3d88
meta-aws: 3ab2281500fbf683cfbf4fd43e449e0ef14c1164
meta-clang: 5e16f9749e210fe9d17f1302b089ee98f8b71a47
meta-intel: 8877caca6b1fe6efe33c756698ce6ecdcaea2238
meta-mingw: bab5f06f3f4ea50185a8ddbf5d61b46dad9aafed
meta-openembedded: cbec9a20d78add94235042c601e991574151e36e
meta-qcom: 2832e2bbabf9a71755e031d396f17652e95bbde1
meta-virtualization: fd4fa494c9878346e913ca9a7788bac0063a3ba6
meta-yocto: 7e41504cd63b099b214f10d92cfdaf358ab98c5f
oecore: 544846662cdac370497d7c13a125d8730c7ebd47
yocto-docs: e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#747): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/747
Mute This Topic: https://lists.yoctoproject.org/mt/121162005/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



