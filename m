Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D198BC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 06:41:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.808.1787899298216207498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 23:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VDGgpUcD;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787899298; x=1819435298;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JUhu3j//NHTpsyX4H6fqpMETrA5r+o7byytD22yeGcw=;
  b=VDGgpUcDCpkhAPVE5ZnWFci9QGTc2NLPNomA/eT7f+iXDRDQR3vMYtBb
   sIj+3xMoPv+gM93Hs0VBgLYNg2or7oOWGPf1g2ZAQL2CLnZPUZJseYAQs
   U0gouhsbLi8IhhGy9qpc1og7p0Q/cK9RnnlVIqoi5A5ZReYGIQdDVYMxg
   NW2PUTRATK9fyTvNun6O/SLdxHcsOKghqfhucm7CZnOs9Ycc7pNTjFQ4R
   gknGopmhmmbAJKeE91UI6CEHIU/xQeO4+b9wIRyJz7hlaMRn1/XQvIgjh
   e/dtORBJtCi9CfgORKB7avjvhHhQT0ZGA1zc6Qd7EdRphZoU1BZgiDxRH
   g==;
X-CSE-ConnectionGUID: 5jZT2o2jTiWc5s9iJgSIdA==
X-CSE-MsgGUID: /fvPBV4ITzObnQhAW5H1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99756079"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99756079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 23:41:37 -0700
X-CSE-ConnectionGUID: t5fmPE/QTwOn4XYU3KKfyQ==
X-CSE-MsgGUID: m3E2fK2ZReKf20PB9bAtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="273332330"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 23:41:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:41:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 23:41:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCtw5j3reTiDCGdR9M7k1F8Gh6EvhlAuXKVQeQWGp1/cMo0M35YhBf3SMoIpFOe2jVD6OmLVju3KbL0XJvOvyDekSvVxo8Op+NnChLxzxnU8lZSvHdJp6p/mkHwKODw+lJw7/RgEuAWWkIrMAyiIMHrQfHrrlVJdGlOiwwnh4dHbrDRNYvIHP0wj5N0hNCsNbGa+h74OUEZquxVDvHh5gnO6qzweLWUSq1ediXvcQy2ujvUKy0IazXbmnlF513KfAAb4fEN9cEGcPl0hF0yxtrXwFNKVzPWo3StRdFwCMHAvlws6s68L/uEyn82M/0dpSsDjJa/0CmAxDsqLUJR9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4MEVDSkJ5j/SynlKvevHGa2fpiNWnzhJY7aWh+fv2M=;
 b=izpCJADvTwWfn/0T5Xg/+Lz72VBMdXUveZcMhMjcrqtKgrVM8z/K0Qw4tZ/Bg3Aabr5gBmLUhwgCO3WHiR+k76zq7PsW2xIJ0IX4K6AP//+BxtwKcGlY0JVHEI8xXVnuTZIAuRWCJfWPjysYGtrcSo5z+UTFGO7POvZWdLCp47v+ZpHpud94Np9SzJorJy3dzEvHB2XikViH2/5PeT2wiht94l3dQi2fx0ByCxDEmt/2mZmVJremaR4M/8ltT9RDvAa19RGidNtBUG7wmeERP8qsjS5iSaeZKGS2T1i+rW8WeUG6BOUQYuIprFdMWNoGGC4kfk1qToavPcV93zffXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 06:41:32 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 06:41:32 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.3.rc5)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.3.rc5)
Thread-Index: AQHdL+iQyugWHAjY8k+5RMGSZut/Pbas3P7wgAYy+7A=
Date: Fri, 28 Aug 2026 06:41:32 +0000
Message-ID: <SN7PR11MB70189BDB6D01F13D4A6F1609F4AC2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a01a76718d-b9001e6c-d0ae-4cfa-b512-6be5ae427a5b-000000@us-west-2.amazonses.com>
 <18CEAF066849E335.510612@lists.yoctoproject.org>
In-Reply-To: <18CEAF066849E335.510612@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CO1PR11MB4979:EE_
x-ms-office365-filtering-correlation-id: 76dda54f-a54e-4119-42ce-08df04cf661e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|23010399003|22082099003|18002099003|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 5fAyjz/IMwOAVxIa4T6CXuFQnBi6pQYWJcm93ena8mctlecWQc2fsg89QNbC96PdHk4GV43NQycr2gyFK70pPERmJza9gECxihXpyUhNSg29ILjwIMi8NlQ6H9QtSp7oaLpzRT3QZga1EK9t7N5LeS/2Pg/rmE53aBPJxk2HAvFh4X6jrzVoAHsKneMONA1EWMrXbGp6qSD5Wd8580fAuke8UYPxjJlNj3qUZWkk42CYiE6POwFpGUFAoM8HRx1m2dA9a0MAWl5YaM5LWH/4z7Ax3AWIufTR+Ogndj5+cFy3jmDTAb2+s5+nn17/MqLsF++IvkvstnTLjztYHS4rcsBd4nQFr8WfgS4Uzg36GAkgr3EOB6rsA1565Edl9GsRW7jTzT4ZKPrBZBUn9XkFyjappLeN4xMa61lM8hLdvxGZgC8FRWFpysOidxAlbd6XoFYlO8XU3ODJYGxQn/pOn7UYcRDmXh2Anh2NF0vQoCrogWx+qN6+5jjNT2UOaXbVlbdAycbigg5wLDJDGibcS6o/l4+gHIVNsZd5pEqRSBnVfcsrLv7S5R1jxw2l1Sswm3X1he1r1AJtDLNkZOJ/YPQHwdnXrg4VPDpjP2TohGsreOdvCPByT/SBO/FyVSOdvqkJzQM/VsFJkl+/uLGPXzAoJAqJ0cK+SyxYb2JyVo8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qA51sZ/ycH3Bs6s1KrPXmmf+dhCjy7PcR4Zc+oPvjmRoQ8b6bCk500SNKQg4?=
 =?us-ascii?Q?wVRg5q+llUa7ZNJ85WQoxUyhqv6Vu302sqzld/jobZKoGpCT6biq06uUz+nN?=
 =?us-ascii?Q?POf3FxkwDh0UnUZRXoxW7ILRN7MdPPxuVldPsuSlahWyRK60FSwymeXdxAMS?=
 =?us-ascii?Q?YkOnhH5+Jmo39zneaj976K7oixpJg+Jm41pDQT10KFBYGx5DRNtG6dpILO1M?=
 =?us-ascii?Q?Nx9lMr7M+Rv+Z95YwIgQTSYwiXyGBO/u56r2ZKuvuxdfeSHG+liJ4yHZ1AAl?=
 =?us-ascii?Q?gbsKD+vxW7Xx4KIHHfR9zhtR448lx9XFrpV7LfjqfssCj6rikDFd4nMp7/3v?=
 =?us-ascii?Q?Cr8Eyqk8i19n1oEgfUqaXVubqpdTaHQyXpLMXEpRA8dTRjUwabeoThjIn1zk?=
 =?us-ascii?Q?8MdoAVhNV95bA8iYAhis60dwGQiX81GsP5rT9y0CbbJFrSkIsf0VnPI/gd/6?=
 =?us-ascii?Q?8bd7kgCcjnwoMpU/xvxQH32L3U1T8d66Pg6lu8ZqkKf3Cl8kP5JHfdcVl4f2?=
 =?us-ascii?Q?LcfYu7LhqoUHI7S6nkv3U4F6VQs7ERFBAsaTwZxD3sAGzy1qpZdQP1t0+r2W?=
 =?us-ascii?Q?qnmQ9NH3WEgIW3AF/51/c4cxdk2QNejQry3foy1pVKV36HrFT5OcYa4WGNVd?=
 =?us-ascii?Q?5UQqnEDpQ52c4sZDJt0I7L6ngYRlzyFGeB7o4JneKwNyR9cTaQjekSdFIW17?=
 =?us-ascii?Q?keBwboKzBHP5av+Ayux+Pzc6DbCIiTe9NplCVPj/j13WlXrxsTTnz2fud7wn?=
 =?us-ascii?Q?53TNV/fXNZX9oPFiSgaIFDsP3Q0MGADlyYSKq9Z8na6vG198+00pap1TvAw1?=
 =?us-ascii?Q?N5uPUztzj05X8panCsIXNEswdlrEws/3YjdiCYp08BQPUA7o/wwAWvOicJ9I?=
 =?us-ascii?Q?PEjHtn65BPPz7t6eHh1ron4/RZ+Q8bZ2kMnw5sBZkw0jrs9RDTBUNbkntMAS?=
 =?us-ascii?Q?mPL3i7xEMZlWLbv0w9DZTK9Lh4/Ff7VGUMCK2Cw5ab6p3Dd17Jd9CZnN+S8u?=
 =?us-ascii?Q?vOek8YZGQ++r05/a3xSHxXQyhdAhdM30aVBKaLfCg3zORNkGLH1f+WnngaP0?=
 =?us-ascii?Q?GNCuPQlercNu0RHb8uoPy1cP/d/O4taX20vdbFp8aaId8Y9m4Qe8FiEWNf3P?=
 =?us-ascii?Q?dW72DzBnU226rbWRv7XSeBEkahc1hFN6rHZ34I1d0anT9SYTqqPgS0Z0nGqh?=
 =?us-ascii?Q?GDET9diHUryBdV2DHl9sATBNx5Sj2yJy2XCNBYiI57OQ7jVI9NqmQmm3LRKi?=
 =?us-ascii?Q?lS0dQtsQkYGFVbVwgYUD5FiTOl+OBk7Y8Y/PEOHib/xXaUfBZ4zXaQn1wX2Y?=
 =?us-ascii?Q?DrKxalYSUUdWNOhhJtVVIue3kscG1OnrEvqKKCMZxGFJWfqoKx/865tHRWJB?=
 =?us-ascii?Q?W9Av4F8dQZIW5g+KtV7jmxQGYOlzNUQ7CACJh9nNlS/QTwLNzMGXCKBagaKQ?=
 =?us-ascii?Q?VregJ+tKGXH4sgJoVwb2RK6vioIAU55HbhLEXRju8XjeO2Rt20nFqyjEkPVh?=
 =?us-ascii?Q?SN8plEyzMxrB/qORHaIzjteXbbulYfPq+wJVmt5SaJAeRvmlvtdHBVR3dRWG?=
 =?us-ascii?Q?BU93AGC8w6KpN83zOdWqf3gYhR5diojPJtKkxudn80x5mH1ApNykj0y2nNnG?=
 =?us-ascii?Q?akRWwE6xTVRh32Lv5nHR/YcZWbtZe0xEdD4gb8/PCn/5smbIvSFpgNWY4W2o?=
 =?us-ascii?Q?NH8FHtFu2A6JOrpUon4qEXUD8EL+ka9R+FyG4h7C7w7MfPnJiUUBADH1efJl?=
 =?us-ascii?Q?shuRFj2L2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q4fFUUIBWFXd0/G88/YPeNpFymvfWrLGP9zLPxlftpth5kSoSwj2GPwXHJjcNyL1JGsoUAqCscSTVvWZ62CMKijR4wMWdwA4nYCJQOQISjEnlqHqDsKDFGydnMwfprl6kX9jCyfkqGDK0SwqGfRWI4ZrRftRnPdKvJKV67F+TJnDROTTYfPsUfFi83SAgDoM1nfh0bYFtsug1nbPCVmlJ6fyfqgWYz27qw0xcDJ2r+L6ehTl9h5jqSjNIxBpqR+TMY9Weawi9pvVCHSRtkuWqHplNS0lyHtBNcrSVFt0WEQxxtptgEpAIbHmqFjbO88Lx0yyDbFZiU1pfSmEdp+Mzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dda54f-a54e-4119-42ce-08df04cf661e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 06:41:32.7716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iaLXfMSlKafKGJ7mCfObMSCoZLhbJ23xDlFCqTe37D+MV8P7TceUWF5SzwAkhxNECJ+VnNZmOf9Bb+9MjEoCGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 06:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244515


Hi All,

QA for yocto-6.0.3.rc5 is completed. This is the full report for this relea=
se:=20
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
Sent: 24 August 2026 13:32
To: qa-build-notification@lists.yoctoproject.org; yocto@lists.yoctoproject.=
org; openembedded-core <openembedded-core@lists.openembedded.org>; Pokybuil=
d User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0.3.rc5)

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-6.0.3.rc5. We a=
re planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

Alder Lake
Panther Lake
Arrow lake
Bartlett lake-S
Amston lake
Twin lake

ETA for completion: 26/08/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 19 August 2026 20:09
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.3.rc5)


    A build flagged for QA (yocto-6.0.3.rc5) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.3.rc5


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4513

    Build hash information:=20

    bitbake: fae9db3168dbff1b8c76fe9c6726a9687ff97514
meta-agl: 3c55b45bf920bec93938af02f2452cd698d3bacc
meta-arm: 0979b80429099f1a42dc0026c8c466cee780bc74
meta-aws: 5e7cc95f7d55a0ba0ae6a7e6e43e6323811a140a
meta-clang: ef0d22f21910a0c30c967eeb17d8f209806e2d81
meta-intel: 79a9681ce83f6bf36aede3aeb8c1707d29bca329
meta-mingw: 5876c193da3ad86b5e23012374b5350e49b0c755
meta-openembedded: 6bf0d8ad57b33950bab4c7f6c037e1ccb6f6e2eb
meta-qcom: bfa25fcfda87cb483aeb8259494b0a7ba65f7422
meta-virtualization: 30f1a9d7e5ef1b41c64ff4c3c40951133d548ed8
meta-yocto: 1b132647002eea43a2c7a7f857f63f42dacbc26c
oecore: ef022bf82d79015802309d14c28b13373ebe53f5
yocto-docs: 5b1ff88511d90634bb3077b878176de577464e12


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#739): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/739
Mute This Topic: https://lists.yoctoproject.org/mt/120830443/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



