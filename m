Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8DFC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 13:30:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.592.1787923823550693590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 06:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nhv+jZYs;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787923823; x=1819459823;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HPQnN2rd7hHDTgEiGTnGnqpWMf7q0tfhywmUmRRPvDk=;
  b=nhv+jZYsQ7cmAE82vwfdMp2I3YpFj6tYn1AbFrAobbPYnJDHKp+Vj3By
   NcVoOv2jAul2OAZYdwWD77ui2Kw06tfGLkahPxAsyGIqIAK5IPxj2phxo
   7I/A4Lvx0aUqjgQDDd65QUE/i7W47VesezLtpYa9hPJIzgP1b/oLf7nxW
   FKWAHXy6V1yAu+OoCFReFUSYQ8BRnUdIiJR0CrZIqngO/wKuAi4MERnKh
   /gWxN1D/J7EWN0jRClXuSrmtYs22GvU/0U0dzBef2iW1T8dBmCDY3dzHy
   VqUGLpURr5tixIzoAtmTKFO6ra64pHn2tgYxcpKdeAd1l7ZddoauviWQU
   Q==;
X-CSE-ConnectionGUID: Jl7LnUxfQ6G9KTeLH0V7IA==
X-CSE-MsgGUID: 6surnoQcSo64wEvST+WOEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88305047"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88305047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:59:13 -0700
X-CSE-ConnectionGUID: eWpKhEAcRE2h9Vni3Qk1xg==
X-CSE-MsgGUID: i3/cVGz/SiyZP9Tp3bfrmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291646776"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:59:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:59:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 05:59:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ1f+UHHsESv9CZsJ3JR80cmcTHdPMFrXAw5RC5UIQi2FCtam0fy9f0rQoAhQt6yiLaoBwagtGcvH8tCOpS1HHzH/+b2bUdiEcL5SwDP21fgn7pqdYayUmRIcc1dK6Liv/rkePM35/KN81JpSsjxpbVOX7dgYkDQCkAmLPUoLkX0JtGnDafKP4ZvOQFZrkEmKOCWnBqoLDPzZC+DSFIwFOXF+8fyFUo7fQSQHwamu3GKS0bJkgjlu9y7hP3QlPbjoaImDmHn+yErp2uyP3Nn8x01asjytZNndhEblTFnKxvJeVntIziF2v0agVkbgJnG/6FMS46m5N2JBvmLnnpZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5zPD2+LPvz45Kty2LgZxKZ7/XvrxUVX0oW5sTYqE/s=;
 b=MMIoKDPIEXiOtUHHCSyr9doHPFxnaF3DjFOnQHCx3kV0a4HBIWTD0rQTq6gzwf/9ovEm4u/SYfIp38T9XSH/m6cJDq4EOhpz175CdXjXRJ2gAAUzJ0ujQ195gusAWv77tFYd7LnBMpcCmjOQnmJnM820ck9Yjqbj3p0uJwPA8YSoClVViyOA/B8eFE0cUOdpaQnmHIo0r1+Lp6hhuD8+9fOPlqvP3ucTEHGpNZ4/E2WM+CoUDda21YNfaVcXigS99AmfivG0vejNojUIhvfA0+/8LIjnrE5goofXOSqOQjTHtlP+sxQu6rjcbEQ32Zr+p5vcp/IHEZp6H0g44BSoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CH0PR11MB5314.namprd11.prod.outlook.com (2603:10b6:610:bd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 12:59:10 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 12:59:10 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.20.rc3)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.20.rc3)
Thread-Index: AQHdNK7OThEQfuESKEmWIYdhN1iYcLazb8WQ
Date: Fri, 28 Aug 2026 12:59:10 +0000
Message-ID: <SN7PR11MB7018E9B3EAC6999C98C1DC6DF4AC2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a039c0788a-1266317b-65ae-4f5a-be4e-1c4cb507bc5f-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a039c0788a-1266317b-65ae-4f5a-be4e-1c4cb507bc5f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CH0PR11MB5314:EE_
x-ms-office365-filtering-correlation-id: a1f805f4-a47a-443b-07ab-08df05042700
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: JsqHFlyQHhpfvUtxp14t0VeY38ZgO0VYAeTFTd+AvOyrPXgB0OKQ+YYsvTrryXPpJt2znJny6zbkptFKrlqgA5fLluMubscHTLBzquNZsn70nxrJ3DUj+H4gystN+Yy9tHjKQ09we6f+yBHZgwA7ez4FU2WUGRGQcFqxsh+RAXLCoMut0ja7DtN467WVi96B/3NKSSCa8lhIsS+elTBU2z5ZoB2c6Vix8pVSzZnZkVA91Xyc5PDojXEG0KgToElSTXni39oYkltsTrwSKvin4xSxUR5/Q/Bs20n60No3mCr8LJTLUGLaadXeG/+qXp+JUWAKbR2lNiOwPiqK/VB3j576UeX6AMpSiz4Op9koVn5Pt8guoHU5VJhvuNjOlLdgdRlMy/CddTA2W/BSqCl9yvUtA9+ldiGXzxyEcA9Rpj6Y+ULmuTiZpj3vcXhyoUN4+wxt27mxRVmph1IlbgBz5q18WTBuVbWEUpJP6aogxK0FkuUxp7BE2GItDpvpwlH3T/08gfkQWQfeNv5TGltupwlfuZ4qvADHBgHLzUyjv3NScQWTVG6phflKar7calKmwurelkbQOdkr/Ypby4JAC6lkImknHRjqb504LJHc6HeiRN70vYezV4dOWRVtTFQMjQ+VdEMsXFW5zRdlAz3D8MyPBVNQi2LXQnLgWFAK+BU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ejtuJh/8lOy3E7vo9aEnfw6nnKmlw5lCcMMHkD0UmqdAFEcQV7LSEkIjE8eO?=
 =?us-ascii?Q?QOv8NRCmyBIaWx+Gqe0Bj5QXGZqku7/zdtGoF+87d6O87vmWH+8asSyE2imY?=
 =?us-ascii?Q?9H5v2+PpZfohxk1Pj6GaksMdwlCc67R0Wd1hnCfd1W0H+IWJFep04ayFyCZM?=
 =?us-ascii?Q?8us98x3qhdw/ZtuIjzAAbPBS9xw8Vq9AtjUWIZV81H4klZjonts4GEWE4gGL?=
 =?us-ascii?Q?a6OzXtwbxcHqZAMQQPibf58YCpLGnKR4g4mFkgqDvmhaBwxp8K+KGNqurV8Y?=
 =?us-ascii?Q?F3ucNsEuZbBrSMD+nYprCUFTEvaa0YCR7JV21u2uFGQYFLMS2nxDMsgrwBbC?=
 =?us-ascii?Q?XOLSGSZPnQcLhEXINQ17KJ1WF9Y5fe7hGmu3vAqoI+nurFx5e6KfScJk7wkX?=
 =?us-ascii?Q?QSwTrovQC8dwcGptKpxcZX0lyGNMhHZPJpLPztuV1ZfxHHsdSRXZpnXcPjtJ?=
 =?us-ascii?Q?itBT53IYCtsh2ZyDtdtem+Xzj++G3ldQmbQ2QxVvUmZi2wXaEX5y29w8o9ut?=
 =?us-ascii?Q?Vif2+fZRTWilRVWyVyT40rDo+ykqHQCvOLwmOvx3bvVAjm6JMDf41sy5a9xZ?=
 =?us-ascii?Q?4vYF/bADT0aw1ZBZxhGu/i5iM6hxrvv2fjqWWGFscS2bdkqSSIHuPWs92O5e?=
 =?us-ascii?Q?638FT4I+PSXbr5Ks1C0bqJ0mDp0i2V3OOX/XBTZGyaHe3wuZUfPeggoSC16K?=
 =?us-ascii?Q?IApSrO85EzjjNT9xUp5DZl1kYZV4qQpTMPUl45giTYTkUyeyF/o+1p3FOhC4?=
 =?us-ascii?Q?0liZLPKYMRS4Rk04QpOEbVA5P5qphvnwE1pAMbuhWCMw/5oxCmanlrqFimyf?=
 =?us-ascii?Q?7s6MtwAH1yopE+vBkR4gq4ZIbpGRCrmH+mL/MNbh0LRwEraKDkIE0flW2tEO?=
 =?us-ascii?Q?jCjPgBplbMCQdUO4nrF3MchHRh+BLXKrYrF03oCGmJFHR268vAP0g/hRwYbw?=
 =?us-ascii?Q?TSkCo+fMZ/c2B1iy6PnRdhCwZg8aqzExS9h2bKGbVcSXvj9dqObRTGsRSCu+?=
 =?us-ascii?Q?CsHHiBrRHfBBvll3MksreLQIegSE5s+tpf1fXVUfGxMgWDhnOQKN73UMMgaV?=
 =?us-ascii?Q?DW29zhgVIJZxFQ2ds4RpzqfxE2jZwuurY4qpkNuyc41PLyccAIFzkvVmfA9L?=
 =?us-ascii?Q?QZp47UGqkAFaXUnj7/nx6myhfYWnbvBQlDqLdi6bpi1M+LVzOueP+BSiwoMv?=
 =?us-ascii?Q?5jgBC55Duw3KXF3gO9hdADfaeCpA7PaWvdbzrgsbXzY0gMyf4T6/x7KKVgpW?=
 =?us-ascii?Q?RG4BKP4dMI+tkXGcDoA8/lIuUtcpJunZUae1C+IqIBmKr81hSbxPL4ewvMdP?=
 =?us-ascii?Q?k/QZuOdBo2Orsh9SUYfYvPToSPJOAXBIgSniHfuRk4YiWYT5iNIsp0undMvn?=
 =?us-ascii?Q?qLDGudrSJ3L4p3mToFbcsCXhHt6mdHvdt7tO/C/uXKecrCH8+eganFrSbGnP?=
 =?us-ascii?Q?jLVsj4skD/hyLhD6cwrF9NUjyP34BpDZ9u5zRHDAVsY5xYI290r0vkdKpzGe?=
 =?us-ascii?Q?m0qnVYr/Y9Q++2p9EMzMLpElpZsSGL27TbcgS2WI6qU4Ma0/4ntvtU2z78WB?=
 =?us-ascii?Q?JUEtVOM/klzUnarcCwq2hSFcLt37zfgFTDaQ4/SEt3No9vIi7pHuRl/23ZHK?=
 =?us-ascii?Q?pztdNYaC3L/1a9XJw6CKfjKHlKArlRWvmueP7ZxKL4AtbqFFbu+PzGTDStAm?=
 =?us-ascii?Q?RAmzOGWTiUkkSikgk+POwX1mLqaHF0FmiVdtEciMxyBE4CS3LEe+rIujW947?=
 =?us-ascii?Q?HsHpXna5Aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ssm1FHvHAzEbJh6RsRgHJm3Cg/rBUe5b0TtvH82KYhT2o0pLzZ3eeEot+NURL3ojpxqNyRDb4ymJYlwm0UI+7k6h0Q/wnIp58kTsHRQfkPEOEGE8aVSPNiuew9j/624sSt5X7gcJTH/CCZWiS53yyd3/PUan1NqhLBQMP4fp0No0fbIj/bA9M9cwWtRul5kFnkVoF8vesccSReRZAU89eol0+/jspurLQuNMFSxJqj9kOQn6TeWnYneMQ50AP3jZk5b4bP0o7Z5ODC8OQW51e7135CA8rJ8wyurOwEMjfLcL5J12XD+6krSQY0dB7S4ioIUWCp0JfDjjbmTjPyiDAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f805f4-a47a-443b-07ab-08df05042700
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 12:59:10.1922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYGkK6+T/bwzQ4WzyXBcv4MThzGrkSSqMwMA3VW5LOOchWULfQErx48B7mudjX0ihBkEL3wCOs8mQVr2jBbxlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5314
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244541

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-5.0.20.rc3. We =
are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. Amston Lake
2. Bartlett Lake
3. Meteor Lake
4. Alder Lake-S
5. Raptor Lake-P


ETA for completion: 1/09/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 25 August 2026 21:59
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.0=
.20.rc3)


    A build flagged for QA (yocto-5.0.20.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.20.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4572

    Build hash information:=20

    bitbake: cff3be6f664f8f07a40727ff63eeeb24d6f5e00b
meta-agl: 97aaedbe2774c1deda43432b4bfbe725c55f9894
meta-arm: 045eb74bd9abe7d9ccf365a2417e440ce83bcbb0
meta-aws: cad59b89c00012ab67d8b4f105714c8aaa5c16a4
meta-clang: cc29beb210ab94eacc53bbd67e287e4e33ede342
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: a2065f321a3dbca1e69f070502917c76653d9105
meta-openembedded: bec755063a8b5da65df626f5749496aadaa4f4bb
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: f980aefbc8b3eeafb8d144e7fdac3c3b701a4fea
meta-yocto: 961c2399d06fbdb04ee27d06079e186d2c4a14ad
oecore: 70dc15941dd33270a92d1001174efb3093e79bdf
poky: 64e69ed23703f6358ec431d3f5f1f8483f974cae
yocto-docs: fe46d5de41930a2762a9ad2543d50e0f4e10463b


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20

