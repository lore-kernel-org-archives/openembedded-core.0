Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D51EF8FE3
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 13:30:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18034.1772631029278332154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 05:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EU/jA1Sd;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772631029; x=1804167029;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=V3GJ/vFtBSl6xrmDjOITBRE7rMk2XP0YVKNA8iwEwmE=;
  b=EU/jA1SdHOR8brwzbkwOakp4XxSd/AN6rjpU3M7JSuOhiD7PKBLpKqV2
   flTxEfxg4bNBSWX0ldbOqCHEdAHhrmStCj0M6jmuPjFkAb7N00hMX8WkV
   SIA3WYkKco+bFAjZsjchrNGDf5vKtzPcEua3pxZOfRBR+2srqbz7dJHni
   IiAOoIdIMC3WVatEnLDbCLpAJn2MjuW3GxRhsxl/GdRS/06pR3I+cdznu
   lT7StL6FrEjhbHs4vlDUIFbVgI11yyrgmKq1yz0yUifs916kHMwiKyrwu
   8U1Qx/QGDDZhnYHTHbdB2e6FmGw5jyv1xE+t4fbbH/QyXkQGVMiWnTqwI
   w==;
X-CSE-ConnectionGUID: VfR58v3kSomlrEmp1rXDVA==
X-CSE-MsgGUID: lYepTNrYQq+nkHIm/pnZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73737905"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73737905"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:30:28 -0800
X-CSE-ConnectionGUID: zNby5vLjSHmYbhTFEgHDeA==
X-CSE-MsgGUID: BonIbqzGR5msRk8yWivUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217498282"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:30:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:30:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:30:28 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:30:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCGCyorIQX6zTNZssNLo7i1vXKPFWxj7nhylzZMilLuHkMCDDzuAf5aHBXJ4sSygUbjZqFPYhMJdIojeZ+0MPr2abUsbdKcah+HSu+dq5jfIY51+CYAg9urwk2GIMMUEIQWu82VjpoIi4tsRXWXLxH6+iPsduMb3FflDKxwqorn3iFipXAA4PVJzkf2P6szY08zoG0F2PmyBzn14N/v2yhjviHnhed3+KM/YVMdF0qoKtryNTgAokaCnPFzrsAFDlAx7+XmCJHXJajEtQFwydh2enzYHZDgIOADWooIcDmGZyGQP7/dP2GFgLBd4dZO4zk8LXr/v51hKtpnoqi1wwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JadAB5ebbbASrAAi2FtnbdMB38F/fWZfSwa1ehzCq4Y=;
 b=MU3g6ANb7pKVXZubjBNVdgIJK48wnjUe8KGDNGegvY39wNj4jiOxu8Ya3YGEA6uSwiXiOS4X57MvhKVPJxNoy8h1dY5WQWSU8lWHmSJVe08ZzxpSlxrQlL/fqhb5KKvvSLqVrXqzZ+I8UCq6NeH8fTK0nUn0LQnZcEUdLbCwbEusfEaKYqaEht6uEJNZguO4dLurlOQBYuxQ363GfMiWeFG7xEud5jJaQAQOLhH9BdUIb0GQUZ/xwUAElxchlu9XR+jUTIUyUPJEOcDy1zBbVtzPtwrG7I1HEQKq4nEEufVQ1u81IqZjwbPNRmVtZrnM9cDnTbCVSeiqx7dJcQTB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 13:30:19 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:30:19 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.2.rc1)
Thread-Index: AQHcpNBOGA+GzuaVMk6epBwrcW3E47WWUCGggAga8xA=
Date: Wed, 4 Mar 2026 13:30:19 +0000
Message-ID: <SN7PR11MB7018F798040F08F5F34BC61FF47CA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019c8ae412ff-845f6e40-3349-408d-bf21-31af2cb42d7b-000000@us-west-2.amazonses.com>
 <1898113494191EDE.558139@lists.yoctoproject.org>
In-Reply-To: <1898113494191EDE.558139@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|LV1PR11MB8841:EE_
x-ms-office365-filtering-correlation-id: 07029f66-fa2a-4c46-fb09-08de79f22deb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700021|7142099003|7053199007;
x-microsoft-antispam-message-info: +vzZFn6fbzkqOaDebm7W7S8J0Az8M5+ZtiglP5WJY8nELgWdPpE8+PPyghjj/YQ95dRIK0t3xQeN/5bNll+NpbG7ROPUGzXcai6wNUi/jH6AyN+rrPGnETWreG5ErcbWgshDKdmEynNbgZZIpnFuVRVX3ezW5+/g7Ih1U+edS762UR2etHXzdGSQwoTWPwCr9J3ftprkwGyw/TRRD1uQ3Gk8sG14y8ldNcOw5dQB/9kE0IqEZSucbXKnqax59Eqe3WJm4I3YPkXDSFsep47ELy04k0RruCdik8JlRYq7aX/JOB5+4Ed/gun6MhOtLx2huyG8YoWqrbi0acvreH7FJjEoi2GSrGj9+zq8Uj46IqBJxu7G1ThUv/ICU2juivQsI215+vESMqAEo2nEnD+Md56nZcsYulFBdSQepCyRu+1PQT0owmKCvT9HE3n9OuPSvK3JaSDqiYaqdolFzXjnX0SjagRNaCii76R+XUDo7NRZG51+VTc5ODyov/z2PNOFfTEK9NqdNZsygCiCCpLoZMKHd/L6okPDVm+XsY/hNaiGjEzqQ5kGDG1oJb7QRn6bodgqtYXLJY+kurk0Fg3bw25axBZvnlrJt5XzTw4chrq4FGaRAK/kg/yvxJ27c4YpgcvJykxsFcQQkwwVxX+IBlylK/jpPVmX+GAT0LIMd066wgPC2ZtZBZjvFXZKGShUoj1dUzQ2Syu/3q42vbhF1a4NikrfGR8b/cpQfbiDjj2Ya9OZpIg3Awy3gxKfX2ng
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700021)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yMaBvpiTei3SSj4Xm6zF9Uaq+/GOAti2gY09/2JZfmXAwAJI1WhedyCw0/9Y?=
 =?us-ascii?Q?Uv9fAX1y1/6vLvvEKErFKUjaG5w6FBYHhWJtVJiuErKwM4VjIN08McMXzgG4?=
 =?us-ascii?Q?oLy1yGfwQCIry7z7z9CiCscNBjfWv0m6DKxQYznXwcv0tCyjyDEaBAf4pyjJ?=
 =?us-ascii?Q?iwpRg2Bn3hTP3DG2B9UEHo0uqDeSVhA8Wd5H5Qeqt+D9eQ5zr9VzU+JoohTu?=
 =?us-ascii?Q?Yiw7LFGO47PfZehwGx49sNk+juWg3Dd3py3FtVoHljqF7sfEIdSZ9oMGFni8?=
 =?us-ascii?Q?HoU7uheDCdU6nCOhDIygdjQnwiolfgU/rao8YzBD9YwRxagdixjFqCd5irHQ?=
 =?us-ascii?Q?pvp9iCKZsDQEU22BpyIkCQ2ggRs+B1MOOJXnG7v3BJHdZd2rzeSpzkcyCctX?=
 =?us-ascii?Q?9Id3QmkUE7Ds3p5zhS1C1LIVmvhiwQEFEiaJYLumdAuD0yW4G2vDy3g+KLas?=
 =?us-ascii?Q?uoOYEOX6YKkw1elVCuQePLUlAz/iQ+DTA80VIlioueYIxbfO2L1eo/s+iDLJ?=
 =?us-ascii?Q?bf9VJ5YybOxHLqZ8CZqGXZVYy4A4C2qfxbNoVl4ZbxLYDLTdv3+h7sx4YpQJ?=
 =?us-ascii?Q?zFuZ3O/zT3vCg7sfURwrDmR24/oWC/vN2ekzbJi6MhvkzYqVnhCmbdasSpyY?=
 =?us-ascii?Q?ObVHd2fAxKQlyc911eKl3LvGYjBjvDwcDhJ91Vj0kKl/HT8X3vIC3bPOzh78?=
 =?us-ascii?Q?/mBYLUw1ZZNXydsAD51nwUOMbPy5lJDv+OMQVdKrfkR9G+JKxFidmzIhmdCf?=
 =?us-ascii?Q?2VUzeBockOOBdFqrRhlochvaUBtJoCz0WkfdVC4WgbeEGYtPpzjpUABcyi4s?=
 =?us-ascii?Q?w70mjEgAinrEmdG/P0yTIXI0bOhj/k1eEMk7tRphYaFFbhMDPqEQ6ChSlq6r?=
 =?us-ascii?Q?DkeDE8VSsW32p10J9mgghXQZap/UkKu7iF6W1RvQUEtejmeQGhdtQx0cHEHG?=
 =?us-ascii?Q?D4e66egMGzDqRknA1iYCQJp5Qs8XSadtuWpCvPp1zeoWWDdHHxz03xwc6uDK?=
 =?us-ascii?Q?Fgn75BtCYvtmxu2M8WRDGgaLsHck7z0f+3QQNR4o4yv7ywapmQTDUzbHBIcy?=
 =?us-ascii?Q?S7GdS+qrm/LSfzXR5d+ECvns65iZbmK0HD/zD2Tah+KE6He5AgG1SMnDBhgY?=
 =?us-ascii?Q?7makFRk4ugLJn9C7g9Njejw4ng5RK835UMDZQYMRgo2XH2FWqZwfxqUX/wu0?=
 =?us-ascii?Q?4Ma3tATEhKe8fCuHMUxZ+aZQxBFZIe4FVObvp213o5WiP1G5Xl8ZeLGzjsUY?=
 =?us-ascii?Q?i0hVfFYprYGfKo4P39HSEpGf07Fho1sGlGLanPyK9F5aEl4R1ljnjdRIuZWn?=
 =?us-ascii?Q?UMBt5wxGZi6QH9pTm7SQZ0iRMKXlLHQ2hIArTJ8DhYUxr8eZzn5sNe20Mv2c?=
 =?us-ascii?Q?pKZvD/IJISzHEpezgL+/K2+LohS32gW1nkKJz7JEZ31DHskRbibkq+Ozi/KH?=
 =?us-ascii?Q?9kbxd/pJXKKGoc2uB054jDWya7o/Hqo+WvevU64sViozoZ11J70HyUJ2zIAs?=
 =?us-ascii?Q?VVXOoQ4liH7LJaftfC58ZNpt91Mc7SN9O9HF+JnC7Wt4hcR9jkJADNK48aol?=
 =?us-ascii?Q?EjEeCuPKjAnUpm+0ed7J53Dh/xdVXxJHEfM4cJTByWdj+Lt59Wl4pAcEQznO?=
 =?us-ascii?Q?V3NInTwd6wvZI6navpLcEL2lJ3zjK6oD873A+ab0y+rT7I6HnsG+38QFc8IR?=
 =?us-ascii?Q?fmAOqhPU3DbuCY03lnpC1pxZz3FViC0HW4vv8Nxjsr/j+D5p9j0ob0cudUji?=
 =?us-ascii?Q?uIs17ms8Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nWtBLUZSAx4urvPKT6aq+fdKMFGIHwgaFTGYVJ73fXYe6Ws7XnEcliVJeceaWuVQ3dU758JyYa8NRMzwG8qzKSDNj92Lvz5Gn/IEKpZ6s3yXoJ6AvLdcbRtNEOtTuArnbSeTaUSFZmLyxRz7pBBiFGscddC809OVFOO9ky2yNVig2/rYiynt0LbM1KLiFCqIvcy2vkHbvVMQzybOAQ8+m1BS5y+8R6rDMVz11QxXFBEpgEJujjL5SGTRlpDY344lStEYQrfuHTgY+5kX9+0vNRL0yHdek1OcU60TTVEYzx6WXpn89xc9MY4lUnKTGlk/JY6iDdCDQof2+4HJzyUqGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07029f66-fa2a-4c46-fb09-08de79f22deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 13:30:19.2565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+SDggH0GnStiGwVRCQ5iUdmrbBZH0/NnjAF2eeik4X7yBf5GO7JAEL2BCvJgjBCnF7ytOOOv9eGvQtbIW5nvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 13:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232380

Hi All,


QA for yocto-5.3.2.rc1 is completed.=20
The minnowboard hardware-system we wanted to test upon is currently in tran=
sit from Penang, MY to Bengaluru, IND : we could not include minnowboard in=
to this QA cycle.

This is the full report for this release:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh


-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 27 February 2026 15:13
To: qa-build-notification@lists.yoctoproject.org; Yocto Project <yocto@list=
s.yoctoproject.org>; openembedded-core <openembedded-core@lists.openembedde=
d.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.3.2.rc1)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.3.2.rc=
1. We are planning to execute the following tests for this cycle:


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


ETA for completion: 10/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 23 February 2026 19:55
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.2.rc1)


    A build flagged for QA (yocto-5.3.2.rc1) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.2.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3262

    Build hash information:=20

    bitbake: 7af7e04f3adc8ba144d9e2e6b37ed4ddb3b59df0
meta-agl: c1761e898d7fca3d8438e9b010eaf234f94fa407
meta-arm: 73460c53949658ab6c8b46269c3a69caccd3f745
meta-aws: 49ee51b051ffa9a0eb3325cb8fea351eaf8cb9d6
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: 8ca2f37f456db6693e696174ada1f4317e3ebee2
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: d28d0a23615f4d91d125fdcd247a71245087dab3
meta-qcom: 49bc2113adb0b86d463c311d32d4fb1007fe4845
meta-virtualization: 8f03a0cc8950ef5d5e4f11d9ae494946d1991e45
meta-yocto: 691ff0fbeab54eceb26d90140d7a8f672532235b
oecore: 21314665e198c1abe458d0bad5c4d14d4c3ad856
yocto-docs: 9c363d270ab45f3443391fb7275817db69d8a5d4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#661): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/661
Mute This Topic: https://lists.yoctoproject.org/mt/117957391/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



