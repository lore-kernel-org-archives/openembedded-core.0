Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA4AC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87676.1782721521015189272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 01:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bmM7rUgM;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782721521; x=1814257521;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ih5Mclpcv/TxFjokN/2iK6hBev2KqOak6uFJTvy8bew=;
  b=bmM7rUgM5XrQdbNmlYAwyqQncqRhvNTZMxSD7ZXxtje/eK+wdSSgbSp9
   Myer64kbSGDf2AFS/HXBZnvwS5qKlu5CWPzEEDiw/ymxoij0C8PcdBCDO
   LDMeFV4F1BOOCRcNGQcS2JtZGLSLBItMrhCgoNPlP9yU8wPFc93pTgUg2
   pRastI513eIghE6hgS3C8UUp7GFnXn8buUZVmXNPV+muf5n7FqEp0l4mx
   98ggIPD7Qa1txOthE6lGny0haBSTAorqKM+uuXwcPSGeLOPv4mzvLxWp/
   6PujfbywTI6pbWPZYVzAEzLAx3j5fVfbfCQi5+CGmSmdU5U+8Wc51cgcT
   A==;
X-CSE-ConnectionGUID: wgQ9p/R9TbW/cklPKhleYA==
X-CSE-MsgGUID: 2ZRd6L5pTa2DAM8Hc/BMNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83435491"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83435491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 01:25:20 -0700
X-CSE-ConnectionGUID: vYOpCIM1SKiWpD0cxCyokw==
X-CSE-MsgGUID: 3EOm8yI2Ri+XwvnihTE+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247914405"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 01:25:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 01:25:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 01:25:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 01:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbeYI9MYS/LbCYCXIsKh4jZ4BKAJs4H0aRILkzTXBWXpiss+WDjH2v25YfuwutCCd0OtZNkEz9D/7o27oek2WgVxxaJH7PjpwUmCtvbTd1WDOQGhwWfpuoKNMM5x4X5kwQnfc0XKB3VhTnDwtR2tymuTk7SSEAnNbx47RMoKQBwZUgW2xapSel3S8EP5SkVPhhRvJ2yyAjwIfRViqov7/HpaD8ucmndpwf66c9sqO+n8aHnT0ebg6gW9t483LVuQ7oczSLy0/kJqy/j9D0PKQbADE8JgCCdRn/qdzIv+FsgVh5wtWOCixlW9yIWV353mP/3QEikowZChtEGxzZv5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUhnPalm8J5FJ24pa5xXr84NBJdKtwb3RFLu8sv7xCw=;
 b=lgvyoD/ASokTQ94DLYTWD9girCWgGB9FGixXnZRDJweH8H+0wCd8CkyNUqt4LoRpi7qSjpLBz4hrXQfrPA1+EIjeYeCqU7kstVVW9APBWA4Er7qMeb78hl5DYVHzxAN2oqAaG7B/HDYcVmheuRp28s3Gq+qYVWWMRbEw7+dBYaKWZwdVwQmny2GiMQpBizSTkIZIr7lXLrYO3voVay7+FYVK89pcZKvvuTOQ11tk9gevptXF1z/FKrB6p2CAwvO9ITtiTTnMPXWFwUp2XCdNUqxTkwG/6vR9S4RjZ3ekmF5MJMcffDVj4XGmGAThG393CZXH1WbMHhBhlNVVUmf69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:25:17 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:25:17 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.2.rc1)
Thread-Index: AQHdA/tAexVBEP4UsUONorivJ3Sc27ZVOOUg
Date: Mon, 29 Jun 2026 08:25:16 +0000
Message-ID: <MW4PR11MB70292F4A6C9E77DD7BD396B7F4E82@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019efa95152e-9cba1b64-0ddf-41fb-90cf-0a6759e35a91-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019efa95152e-9cba1b64-0ddf-41fb-90cf-0a6759e35a91-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|CY8PR11MB7034:EE_
x-ms-office365-filtering-correlation-id: 58ceb867-90e8-4a63-0f55-08ded5b7f34a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|4022899009|366016|38070700021|6133799003|22082099003|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info: wFwUrhCujYx9sZfOp1T8TCjaxo0qUj2pVqT/TdqcjGJZ8mz8mhDLY6IlsnSnUU9r3RJRaW5xJcq0FZVePs4nZ1FmBaNLPGSEkWQhrusb+UUJ+n5h+bxxJ4naeuUVtIzJpMpI4Qo3uaDlDlcZA4v4B3rPKufPVqYuicqGp4f5K6Ukptwazi0O/mptfUysQv/cMTry0GpnHOMA3OWJSkzc00XTzwOVwi7jSVhZptUswkIUwa9iioZlDmmFeLpuvNWgWIC+LMKU8knpUO3u7Ko0Zkb20v6C76QqD+bBnO7CWFlD5rX8xBvZ0jZxvhaB9z4lq2HQ8c/2vy+I6kYcE8xCyf6xI/pRoUKa7pW/j89OW78B4q+nAz+sZW3wnuX1xyfVVLeJ1A1nISKT8UHuybgorTySMfe9MbT4AXy0gzw/tVx9ryeAU3aBRc57Oh88elQM2AlnG6cFriGUoAvnzm633THwqXMoTuO0hkuAUhMG+ZsV5ypWZBAeSiAvTDxQ2CesYu7/HnbD5R7cMWn+mAflbZnxQZCTny2kA/qRIEA/B2N63NYRlyPcp14TbZhh47qc+NLo1IRGbjHWO/fduj1Mjc5xr6xBHFnxbw5CUr6HSNxEI9iRRIvj0rAJrHfDvLUl1sBSWygSm7aoW17moo6sE02zZseeYSIBC3lO8Xb2shE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(4022899009)(366016)(38070700021)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g+2Zf91j7zGLtA4oDL6uNhISlYlyemMMwVax7gpJ5mCYIc0VQ5bp0F8ri9s/?=
 =?us-ascii?Q?2uGVMYfyaSPMlU1fFadzVaPC4hJAi0bLFuenMEgpfoGr/aLsDoWUfz+kvBqC?=
 =?us-ascii?Q?b/O7lrKzMLv4VbSkim+sQGJSt3iYxj+/Ht3mw6We4uQV8rJx9n9LWwtUmduk?=
 =?us-ascii?Q?N00dRDssdIWRiZog2uqnjEQB9jCrgyIe+HtT758SRBR+KCM3F6EayzsYXHtS?=
 =?us-ascii?Q?QNH4c0DsS8a+xVnKhHhstKQYpLQYeOXVbYlm0XoiIaWTNbIIHJOI2EBMYLaZ?=
 =?us-ascii?Q?9FlNCc7vxFjpKd6hos8VsuLEjyAgUFmLsUYOJjPmW08jztvuJ0GaRhUkSMol?=
 =?us-ascii?Q?ieNjaKPM7NEBvyiNuTkZ3wCQENg1KyxRN8Wh3jv+ddxErny53CMKbh7Et+55?=
 =?us-ascii?Q?WYPZfTzUmMo5dKpiqW9J4KnPAKOySw42dCBo3AGj/TI2U0qvrRh8poMuZ5YT?=
 =?us-ascii?Q?mopkVWqcikAUinytMmJ2VFJG74gSXzY7BLSSK4+zqQxuLuRFYVkP6kZmBEuA?=
 =?us-ascii?Q?01xrMaCrNKm6pcBcKx3GnilKpU3goPtD/dfzAOdcJ1w1VSwRO4wMOlAHhtfn?=
 =?us-ascii?Q?s+xarCU88rRwaNOnjBz6saotL6JP9LCgimmXiEo/3hWXsKESE+udb8UJwKdu?=
 =?us-ascii?Q?HusWc+7mGoiv5Hlzms6E8fq1eRYnEsk3X84kVMCUq8LkOu6WKk2ZwLz1si4H?=
 =?us-ascii?Q?FEje34lbNxdCvL2Fopm7Wxv55FrmD5W5ZCJAJlepedZwt0BwgDk92Qe+94Dv?=
 =?us-ascii?Q?sWo/eQtUdRLacK6cmZdGvn7RxcV2/rgcIVb46xA8cLvaLgpsAGYltzmYBKsM?=
 =?us-ascii?Q?5CcWxmS5LuNZv8mQu+y5OwFYqxlEWTmKQcM2PphijavNxc84AGb5IdbdT2l4?=
 =?us-ascii?Q?zxJH5Oht2sk2xndeEXjX+sm52RQLs88bn975BDvWnIJCVHHN1aY6587CWzNN?=
 =?us-ascii?Q?EKU/kkVu00WfnID3gHt8z7SdYQJFc7L/gWyy0t0XwHUE4qjhltzGMLVi5d1I?=
 =?us-ascii?Q?gmxYGGyV3SXcYOrJzVTYDXxGSwfEe85l/DR2zjpOu6Zc6Jk7ULmByxseeT+f?=
 =?us-ascii?Q?75JeGABadRgOGvsFEPpBSVTUzDmrvjuIjleflNgx8GXbrO5jQOcQxs+kWFGn?=
 =?us-ascii?Q?I+SRpIOSdrZFvdEZ6MedTCelxub8omaAyi0iVkB1QPPaHfp6Ja4TZcsxskoP?=
 =?us-ascii?Q?54Swax2PVDslQUtM6a6E1oSg6ERLmN4N0TpxU5ND6v5e6LxgHkCnY6UXV1rm?=
 =?us-ascii?Q?FxiZNtrjrOEXpBCZwoz3lZkcP0iPnftsyQR2vn38nsH20m76T5snR5qRHajV?=
 =?us-ascii?Q?+FW7mY+g4GxMSO3sRxhl62SZc8XNWau/703PcyUAZNZzgBoc5+4wC3jfNfab?=
 =?us-ascii?Q?m8t9C0Nxs734Fibk7eQS0EuDPnvcvHJKdgKVdHPjhuqQ2PDhAdGe9pUaM9ZR?=
 =?us-ascii?Q?SUCFlhUyIh3QNfctTIcNNXy9rRt6T3IUGnLQqSwPz4hdiUchydQxZezByG+x?=
 =?us-ascii?Q?gU65jLroJY44h5RSXKQ40TOE4FZkXQihwl9YwVMxBFvaMduSN6awFDhKWIRV?=
 =?us-ascii?Q?RKOHzO7slGtvWqIATDgL5FUVPcq9tBb2JuZ/4tDXxWG812UuELlKO28KS9MA?=
 =?us-ascii?Q?p0yIjEv6akDPjdKqqvxoKN/mSYbnybnp5dvYTcWeZC7JoMWgAAEoB+2c32H5?=
 =?us-ascii?Q?vC8wUXD7doERGu+K+OSlkxyoZABq0/AzPuTiEAnWueKwQSdi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eg/Lvmd8JCK9ta5rv5YFet70H+5tGLf5Bpblolalo3VtSH6vCMdqhnH3bunCH2dabbUfVAc3Df/Pe5T+jocz4mP66KkQYzpUJwxcWQC1qL2mA9cl7O8JbujRZ7zjy0htfP2qX0Zm7ASUqToPL19+tZOG/XJeevz19Yvsp8PyvLBh43WBHWEJrACBCGOVVPU70XzPRBqOpzT7ckY6PSSToW70MurRg9hJ0vhZDTPHcvfPZ/AhWWsjrNJDbZnBWWoqyFIjPW0twNq1GlHCoBZnvf9bByrLaaJ0rX4+rUhmoCKta4E+Irrps4H8mfkd2JxyEnIy4ENQxpbThBqs1TcB4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ceb867-90e8-4a63-0f55-08ded5b7f34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 08:25:17.0377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zKKEcyOABsYft7q9cHS2sGj4HcusLumYvHIKg7c+u3YplH4jyUR18EfVNVXrC6oaJjw1ZXq0za5b5qty8rfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239736

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.2.rc=
1. We are planning to execute the following tests for this cycle:

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
Beaglebone
BeaglePlay


ETA for completion: 03/07/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 24 June 2026 22:32
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.2.rc1)


    A build flagged for QA (yocto-6.0.2.rc1) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.2.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4076

    Build hash information:=20

    bitbake: acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
meta-agl: 3c55b45bf920bec93938af02f2452cd698d3bacc
meta-arm: 01c33e494636781e0787ccafa46cc0102dd68869
meta-aws: 5e7cc95f7d55a0ba0ae6a7e6e43e6323811a140a
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: efa8a9b22ffaeecfdd113673074496d377ca290c
meta-mingw: e2aac06ec74e46d08b7e68f61043047c761ae9f9
meta-openembedded: 100027977216601000cbefc42c2ff6cf667e7b5e
meta-qcom: 61c71e0c6d6ae13c325d60fb6003e3bc5ecf85eb
meta-virtualization: 781735b97ae5013cacabbecd38e6da6b510cf3fb
meta-yocto: 24c24cef5d1523fefe43a3e3d34667b37ae551f3
oecore: 5d1aa5c806c061a2994f4decb59016610f093213
yocto-docs: 2c59a23fc39d92831cb55a0e5f713d20f94730d4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#721): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/721
Mute This Topic: https://lists.yoctoproject.org/mt/119960549/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



