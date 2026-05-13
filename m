Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E26CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:55:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3983.1778666136992837322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 02:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QR6js3Bm;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778666137; x=1810202137;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vN0PbQWfxTbROw6Ztrsn/aFtzUBxQw/Y+X9NG5LI6J8=;
  b=QR6js3Bm3v1CRsRTvJvrcFdPZxdLCnMnTaU56MXWEK2N25H0v7T2OjU8
   F0mJxH1hj8/koOe6eLE06UG4Gso2thwwy6+H603XNWi0YCkJf4R3xzwHy
   +F4h3TepgT+phL2VBlVCoMxprwei8WAGMAWtIFrD5PTH6T9FFLjp8IB6x
   wuJ6fJl1UYy73CHTQg0i0uW7/4MiTc7w5oPJPPb58Ct5N4uF6odSl7MUZ
   XO4PS0fAKPcJHcMe092FVfro0UlBQPSTz+jenBowROgk8RohBz9CAYXin
   6y5+kosMiW9o1WEPY6TryT6lv8+aqbrfhzW6CQRr5d+rkh8VPWuCGa5u2
   w==;
X-CSE-ConnectionGUID: /U0yPfFyThWtp1QHRaiISA==
X-CSE-MsgGUID: ihrI8fiWTBiEvNAubU/6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="67117837"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="67117837"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:55:37 -0700
X-CSE-ConnectionGUID: nUWYU0k6TO6pq3gcn0HNfA==
X-CSE-MsgGUID: 5oUaUwgkTAyiYLnzZhMBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237188240"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:55:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 02:55:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 02:55:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 02:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuyAUi+vsbVJ2rJtRFdJgtfoIhmyke+6U9f1mYyd4CxQQ64jhZ6pCnqJu+83VBgwf9aDXY5Rwt4woKOqBuow2AO0X8uiXmiyAmrjDbBinQ+vUqBUW8gNdAe/Dox0oKCzH/THdYtSJK9h9aSUJXM1IV3klg7J7kduI+WZn93SHUgkRV8+fyuLu77JkEvnz1F73Q0DCNarH1TFV1Re0USpL49xkGsO9tovC7amHpx7CgP+II9fh/rVR+E3NhaoKkVxwiSr+RuVsaPjb8/XvD+lrOR1kDqJ87My+/usDmbs69lLf1UBo4yE/KTuWYiFfNcoFvtFhsrOLZQ0iObg89reAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB08robLZNjvzFsdASZ7ApO2APnZdlrGXH6ldBhgq8g=;
 b=Ttw8TLscOZrhy+ueiwR14eYrn+GEQWsBmpmcKbIpd1iOgPRSbz6FKN1v1i3WX6xZZ64mkLc2loD+k/f1UEJUSr+0m5NV+x59llJVX27Xoe19q+FOFXiudRP5rTp37aBTj2xgvf/qM8b7TMMcQO9rIb4SDiiEHIeMnrUSB4z4u0uu1SfEvSIAybbEL8bd75WXjCmlY66v+tGzgai3vInsnw3uhtPKME+FF3/GMQhoopUJmihk4AhdzxeVP1rrqAC/5Nf44hRkQ5qadjOEddwdDzX014JGX08tIspwXwQigL9tPOmmsYzPJMIeTNsck6BtvgPGEFhs61ZuACaUP5MoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 09:55:33 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.20.9891.019; Wed, 13 May 2026
 09:55:32 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.18.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.18.rc3)
Thread-Index: AQHc4oAA72+C/Eyrc02yIrvB+7/c8bYLtaiA
Date: Wed, 13 May 2026 09:55:32 +0000
Message-ID: <MW4PR11MB7029B0C4949D4E98A6815170F4062@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019e1f289234-2033e3f6-4878-4f43-bfa5-332e58f449f1-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019e1f289234-2033e3f6-4878-4f43-bfa5-332e58f449f1-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|IA0PR11MB7751:EE_
x-ms-office365-filtering-correlation-id: 95ff0bf6-9d30-4062-c3f2-08deb0d5c5da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700021|11063799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: GoAaPHu0TV+DOIvB1PGeOHitRhYpA/x6oADyYR7SzA3VcbxSW0DrPNZnvZBekdFVuAP3Bwk/QPivF2kJ8FFqWxC4qGXD2z0BrdUS9H9zJL4QtBEZBhxwPTFtIq7i7jP2d3qQ9mM+l8JJmDZnyw3mvjv4t1IGbF6/l2oLLK2inZcefhygy00JWZJif6pvzFPNpG/Tm2v+R9qYlcUyghqS5VwY7VZ4lC93vp8cIsKtqfGBhg2w7U5o4HVKKNWhIBpRywM3vZqTx+QeR8skPp34hoZkB/o6olD5AzQWgPsYV6AmDu2VBDPdAlhE1OsofIlwuT/E4ne4mqBRbuIKiwPmZVf94HQx93i8t+yt62tFf3PG1itcr6Mj/pjE+4udXQSS88K1qTBaqIvyI2X8q/ArWZSq+Vzbzj2Ld+9yrhngw41wN3h9dZO0kiHfR8cfwTFD5LXpY8kun1uhArfgvs4u1I6tdIAwynd7tHt6fDkGrd30wY/mcLJH32fZex1laFrcqOczta0Eygl6ozKc7TRFJ9bgrXFpG1WRXyzWsIanpqkBy88qNCQPRBuThQTrgYS5flmfwcoe+qqaZUUOuEm/g704eapVU+H1GeeUQXgaC5e+WiUr6j0ImIavrYCmdP2/0kbniNgSpjnd+nZixtH2tmwNHhWg5syjG61pp3QGnlRwsEXTqQwdLlUBtsdS5TV4uaeeITz/LnNAfxfU/UEX5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700021)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+aMTOXXJrPp23CIw/lEYAvcDNS4fJND784FwqEK4st4BKYFfEUOr6KUIiItU?=
 =?us-ascii?Q?ooOu2ng5Dy7y9AtMcOLs1KTYKcBiqNEBIefqIaBXr/dPvkLZ+AR8aDsDSoh3?=
 =?us-ascii?Q?784ozZapfqbRpVdm6jUMEn/dl76eLA944dgmiQUn0twDKHDHnZ5r5Tk020nJ?=
 =?us-ascii?Q?B7b5T01SZe9GVGcXjSgKXkC3LphVF4LsHpbi7CpyWbBwMTiGIIxMqrAEu+1B?=
 =?us-ascii?Q?Fi3U3sMuKG7IC54G18rvjzbp6fWT9aK/+gythBb1tUGgeMYflsKl4A5aDhKx?=
 =?us-ascii?Q?AjYZI2riXn/R1WqkHvnFST0hmesfOUX6HO1q4T0JNEmwcCpCC5TIwhXdvfcL?=
 =?us-ascii?Q?ozy/9nfmqALuM5jRUdeKrrgcsmFTf4SQ1SgK90EDWnRSNLvbk3RxEIbF4FoF?=
 =?us-ascii?Q?vCAKGbZHP6vSfbNA56+QOWUF09X5OWxZ9gZloZV/nq5BKcHQO7jgtS1x3DUm?=
 =?us-ascii?Q?an/HrqNWTr3CG/t6nayqjB1kyvHjeGynCJ81MG/ueUr+FkEOMd3k7a3+6KY7?=
 =?us-ascii?Q?U2KY5boBfLJhT9ZBHMchqXVOWlupoowV62obJqt9h6Txu+ljbLN5xDiNuw0m?=
 =?us-ascii?Q?ZlMf8RZ37QJlSdQGfMvG5VbXG+EG24ImHF2wXxXoS7LfpLbt09BRnREXSYyr?=
 =?us-ascii?Q?UUL1ECJf1HK7y3NVFI5f+c3Mmz/PoskN2cYdC3MxWXmO+uvLNRXQOUmefyYE?=
 =?us-ascii?Q?CloQOUA4ebJUkdUXxxYWDRpeqGgjkPNqCpqRDF+ffERLZUB7clFq0hera6pn?=
 =?us-ascii?Q?pvDq7N/KmYbwK06cQHpGGH5Ct8zcaEp/R6DR1YUGLEYVLMh09NXhQxf/mP89?=
 =?us-ascii?Q?0nxJM/hajet3ePl445em5T4Fqwu1CVTtffEtkCb7VlRazMlVNHOHCddStAfL?=
 =?us-ascii?Q?7b3UK9+6DvHZ9R8VVg3Hst1RJRyXb/vHDYzNQZlj+H197DA8hCSaHRITxn82?=
 =?us-ascii?Q?+94NAuq1NiqXQQYefVkRpd2MyAQIhX6Cz14EUBjKaBIaVKtEd+OsCfmJKQTS?=
 =?us-ascii?Q?avwj/ulWKmNvbzQeYqwutAsi4zqlCQ9aVeUKNiu61F81V1lN6dIOO1/xcXm3?=
 =?us-ascii?Q?PiCQgl6Bi7KSJFaSDZex/WVT3+BKG1PEWI1sTPa+HYk+ov7XukfixQV+yT9N?=
 =?us-ascii?Q?bEhZMQRfBWjt9d4iNO+5SmOZqOiGRvirbDEe9P7xaBor55StJAS2TcuDQQom?=
 =?us-ascii?Q?+D6M0N9ZXvR9zX+QuQ8Yrl4fPJ8ntqBhGND6EYuX6an1O+PihYzfoRPGEEYT?=
 =?us-ascii?Q?/6PLYzEHuXQ6w4rlOiFb9FqsM2W+eaABAM6LgaawHmRNBAJdCnmTej7R6kOH?=
 =?us-ascii?Q?S1E4QIbJvqGUGRgokk+5ueSEKXHzYbLm4Xo9KyaKHDGAbBQ3VRiIcgPpcpqT?=
 =?us-ascii?Q?KErIdFJNT7FfkZOC8B8rk0Y4CGpxedQEqKXHdpnOdm7mUUPDf6czCSir2U1M?=
 =?us-ascii?Q?8BKlXJj16ICN6x0CcgcmGn+eakil1R//sw+Uq2IEvQjQ2Yyvil14Du+3y59d?=
 =?us-ascii?Q?Gqw8jb+Od095BIpNsBhhHQBMCvhWzmU5fEfnYmsVH53zliJNjIS3pqURK7lw?=
 =?us-ascii?Q?8ljDFfqr5a0oxakmoDxozoUmPoEXDjFaT6zLrUSD5+xXNbUGRv6jOkJM4t9k?=
 =?us-ascii?Q?cVNOBMQZgTChL8BGUy4FS6lP/CjUO39HdKdwGAWaaTQ2Bh2fznrzKxaC37WB?=
 =?us-ascii?Q?B1GA0bhPh+ba7xGCbgapV9CZfPllB2FBeZmWegp/adt//n3G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vdty+i8f75fUB3jYeMfhvnBQiXyVPl5ximUSN2bH5nJHC4qNzMBxV2eMPO+1tlpcoNp4BibfztZAHnkoUcAj1x+jP08bPWhk/vhZIdJAmUgsdUm8lDVinA6ySWV1Nm1dbVNIVVe8QZWgKP4INUgkLBMa13Am0LNHbRMa9TrmXgIK/+s/CPNy8/2DtWJZCEHx0IcRmcGLqOyxzOzmoRuvOnebTtImuXVr5hD79plEbeXpCzgwdnTweUicyhjJ6xGBHyL5xfAc9NzcVl9GcgG6pYrsFdsHx5XwihIXYhMn38eEi6dvaDbYyPG2lJTibxZRJFlsuiogKlM68z/QjIelnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ff0bf6-9d30-4062-c3f2-08deb0d5c5da
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 09:55:32.2762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQb7/V2uNujkeiSpsVRS5m5xHpnRDIgxa5AbVsmYHdi6V/N5Ivn1FMz9OA0WX040VsrzPt+9Et0GRDo0rmBElw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236956

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.18.r=
c3. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

AlderLake
MeteorLake
TwinLake
AmstonLake
RaptorLake
PantherLake
BartlettLakeS
ArrowLakeH
Beaglebone

ETA for completion: 25/05/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 13 May 2026 07:57
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.18.rc3)


    A build flagged for QA (yocto-5.0.18.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.18.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3818

    Build hash information:=20

    bitbake: b2404004135b669f8258c85c7b5aed4570a805c7
meta-agl: 5116ec52656f7c7dd78b2f60326a0bdb984aa663
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 437d3207ee2ca178a98531b34c0d9623154aa059
meta-clang: 5bce7e26a38a58bb52242494e54ab2af40009574
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: ae7dfb12245c7f9b9a353499e2688015bd4e6413
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 8409bc0c8b9209327add72d8fa72571cdeb5521e
meta-yocto: ca5a51aadaf651881d640688dc3e1e123aa30bf6
oecore: 5cac91ecea8720e38a2384a8c5873da3392aabb2
poky: db668121d98162b8ad196ba6d8637f8330a1787d
yocto-docs: 1c5e7f136d7460fa5ad4c8a49ab1de31bd670e59


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#707): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/707
Mute This Topic: https://lists.yoctoproject.org/mt/119291802/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



