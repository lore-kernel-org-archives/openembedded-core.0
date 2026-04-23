Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84B7F9EDFD
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1776927337335930393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 23:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jRt6GtwI;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776927337; x=1808463337;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+aIajpr9xR6e8CwItFNj08bFuApBIcXfPxdc8COWzj8=;
  b=jRt6GtwIZ5I/ondkczQXGdMrJLWuvEAqb+wNDx5viaINut/02dXNfo+v
   lokScSZz9E8UkJidyXYtt5ht9YwWMjD+kE3DsknagRIALs4ySPtKPdnVZ
   7ffHf75urV/Tjwu0mFRFIKWlEpX6/u8a8eGOHPWg6WdIhnufYYVbqaE6y
   v1Let5uV7nG/bB73eZ3Zo27WiZWoXJiTsAUhzlfs4+kgIZNGDpGWfX+qG
   GUwL+Fw+Rr9katc92O401PCO3s9iYqQCDqqQSAK8WsgNnlKJ9TT9LftOV
   Voscw2plv9QdojNkkp7wTbv8qxNWdG/HK+3jBl6PwmAdirEFe2t8uT3m+
   Q==;
X-CSE-ConnectionGUID: W4nMYWw1Rxm6fCbTJ+IN1w==
X-CSE-MsgGUID: NUE87YjkTCyH0auNx5Fy/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77772410"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77772410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 23:55:37 -0700
X-CSE-ConnectionGUID: +uHQCPifShKg3w4XepEjWg==
X-CSE-MsgGUID: xDJM+zlmTo2AkHUkO7xfww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="231535362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 23:55:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 23:55:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 23:55:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 23:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGSto7V1C5Zb91YMDCGjQfILqhatygkM7WWoCA77vLc6MJR8xxK5MBc3jPoTk6jzogy1X/r307U6wIBvexdQy0KPO+I5OsShYI5MmX5t3zT0TEU7rM8Kbaq1C/Uc0PhMD3XcmMUbbgbKtxyDwfCcb83QhRwSeOT4jH2VfuV6BGYDbqOnB5okI0cmxZc1Dw7xVKk8sM68Ecsx+7xu3KrFXTyS+sqCUuYbgNWNY6mb0kyZ7AesvUM9pafysMCgW9fkn87rnznxUoxSIVjZBqLPdHHdlmWfQSQuo1WkfQSPBotInWh61lxu2JSDKubNa2JuZe3ISdW7QhSWSJaeS7cRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyDWeLi6XJAwUjvO3m/601EVDiKQ6DcUwlkP4B1nOsU=;
 b=MbBtAFWIDnlsAFyix5hW0L17jQ5sl2EYgpLjPGZaj0xTlBaDdOATpITq1G31nbR+LR7vROEKj7+YLYhok8KUkkqzGTcTPv8CAQGHctwXA/sYjSV1o5Yr9HmjUY3q3KFJ14axeSbZ9ykJYcuRoKIIw0scK0P1JFnYeKHnABCjeWf9GuyAB4N0xzvIJXUOjft7bcf1pBBdVWTXkdObxRytWePkry1vsrOd9gEqJBUZs7OQvsFDlUiRAlyFTRiqLS+jaZNYx7rnAmOeVnVvaVG/0eWONyfNylLgeWxoBTjPUq5rzGTw1bNlAEyghYllt4M9C8nx84whOXlcH8Gku52FSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 06:55:34 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 06:55:34 +0000
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
Thread-Index: AQHc0pU2zBOkIfItIE63n2DqAym9UbXsNn3w
Date: Thu, 23 Apr 2026 06:55:33 +0000
Message-ID: <MW4PR11MB7029F070F2AC8852BD586D47F42A2@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019db6d801cc-ff6f5500-d270-436b-9ca8-36ad2b5b62db-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019db6d801cc-ff6f5500-d270-436b-9ca8-36ad2b5b62db-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|SA2PR11MB4940:EE_
x-ms-office365-filtering-correlation-id: aaa086fc-c751-42d5-b795-08dea1055113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: FAVf1QCFX7npN7jMhViid/yc8xeo99nKG99uL8NO6iWLitqjsik+lccMkLxenHWEwFvsdeHyZva/GcDvi8uViO8hHqP2Xm10OIM/cXDV/aiGgy6WsLDZzmFCOXTOdyvjAvMSxR9sOuq7VEQ9qP9SsXmT2HANiq+G/iAba11C7sqNYuU2heG9kHiy9hzov2Dm7LRJrTC2AN6QyA7PkVBkZYildefCbcXYWzMHbtWoKCglgyr2TseesI3bqW/FbWjbV0rTi/5b5DY58SfCQa6/rP/RLUuByCwcQwSEtVgY1lDPWzm47kZGahFV7byzTQBupn3umuhyntlHGv4gN761iKqKKwoP1Len6Q1DE0amPQE4H+VfKQ9ENozCxQhD5eaiMG/SQjmfCcSygLMRW+ECOOhcEM0GsMW+doe4WfHGcn2+lyrkMOVMBWw/rG/caryqqmuBx7/doYc3/o3LDwuYWJIsjsJAbmgLPpEsJbjp4booSxPDwSzmorwCtFdvt5HXx5CcpORlZQz4977oCUfIIUYwmPtq77VUYSi6ynnP0vL9Nd+XblpTdUejvK330M5fhlT+xsvZIEVAXiQHpzU2YDGEhVdzbW2SLU9dUwS/Y8Nwrr9HuJW9I9RR1xeQcJrtGCwA6zG2YsB4iDLjfXPskO0jjAZjsOGC5EEerQt26uouDaNTkCFUTzINdAMIcSYJD5u5/ShV1O7nOUzSkMSqHNmf2YNLdX7oVh0xXb8RgzvrNLvOW0eq+57U9g72eshz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BfiD8mRze8MlzS6k5p8Px8arl7sjggEk5G1xg/yCMZYxOInbpuk0+i3o71Ux?=
 =?us-ascii?Q?kvJEIkEXu1sLweDdoRqpYXQ9+65ed2mB5fnr7RJIhrbfk8oRMFDTbDMVXcuK?=
 =?us-ascii?Q?tIm/mYh/mCzSrF9c/C0Avck4k3YqghBPrHizMotvpreUTmFBG3954rf2hOK/?=
 =?us-ascii?Q?aqCFmfCom/cozBOSXQnAAID2IWe+VJ8+OlDVf81flf4mVWGCXrqC7quhn2sh?=
 =?us-ascii?Q?lsSi8Wu0cEnT1glNDEb1Vp5OKQOUWq1bDXhNCMOT7pCHMTnvcqxU0NJ4Ev8z?=
 =?us-ascii?Q?GiJx//mNe5lqJDirT+rp4T5kNzbw+OznNGA1D04qJ/h7bGqFArALoJBx8k5x?=
 =?us-ascii?Q?l8HlBUHYwW4nsww4ZpFwdrSazm/5ijwlVZDsAcdgJNYePGms2fbcanhj9YP1?=
 =?us-ascii?Q?S5FIGMwUNOmULA9tkjjEaNcSobOxZLYlBk6NympMX4HqgKUwrXs324ihHOXa?=
 =?us-ascii?Q?ezHDVZ1I4ebtJ3N2D5NytXBs29JQXmRUK+NQAe8EMeZrfE9ZFwdy4Fl5iLjh?=
 =?us-ascii?Q?gi2OWNK2DcJywHuQbeapsmm0N1kaks1+DhTPmeIaVjm/ZTWKzk3ptQRMWl3l?=
 =?us-ascii?Q?RsaCYhsd12jJYgO/ELG0MLVDXKl0gdZ2j8v4Nf8Xi6vMHwe8eHc8FOJK4uYq?=
 =?us-ascii?Q?4LmkY2Dw974gyklIUzK1JxPWpPTZ3pp18Kh+8/yGXQVGM7aeUPlbHGteC5DC?=
 =?us-ascii?Q?rXwCfMcB39l1PU3gVpfvv7v5CMu8XYTOHxCxsA9302aSs0X6GyY2u2+BmLdK?=
 =?us-ascii?Q?Zt+x8/WpkTEA0Ap9JWplV3RVN3TVsKWnBzCGB2Q2lNc4gYFTX2fPGL/00IOr?=
 =?us-ascii?Q?vvaK4dJspjnr5USbzKu1j8EycDPDsMz1L5HnMlCk/K/bHWbb1DYPjirAZppX?=
 =?us-ascii?Q?rpSytFJ+ZIec9tt8HEykxXqIgaXXhbfMgP+Y1L9ecMiayIEWS6lpuDzNmVHj?=
 =?us-ascii?Q?+mT2WmZR28H4MYORtMdJM5UPKoJ+eqNmX6K0G/OnsxIbM4ujZHItuJyaDGEe?=
 =?us-ascii?Q?b9OnO/K00JxO4De2vUQxn8vYciiBEbTsxfsqLNwOf5y1l7qolBQfadF9j6SU?=
 =?us-ascii?Q?mjdAOiviu3X25Wf0C7aR5IGeWFewdJdyMJr+TsoW5vIhSvavvrI+3XPJrOCj?=
 =?us-ascii?Q?dPehvMTbUScEP99qaEc/FF7oV6OsIe+k5BztBUhPF5/JZbljFSAZoAtSs7tH?=
 =?us-ascii?Q?82qm/ttyOsnM5HkyrCeXnHUjNj9wqS+RJLyjZspPJ5uz1/qbMzZBwYb/+d7M?=
 =?us-ascii?Q?AfmhiLFDD1pheX+OQUgDuiLNqqJYSq7BUw16xj7Cmv06kim2YBC7bF2PFTI6?=
 =?us-ascii?Q?M6jE84p7PwOBtTRUQiIRO2I6cIM+Coe/GJZSlChxEe/RD70fdBg/Asbh4JnD?=
 =?us-ascii?Q?hnJJiop/3oISB4dRxVI5xdqdrNUf3/fDiaXFvJM+Xow6GriGMvMZ+1Uk2qq6?=
 =?us-ascii?Q?xzQ4C9EIU5KUSldx3YBDNyEhZw9M8ClP43uZUj9RFbiebtn5og2iyHqmcWCs?=
 =?us-ascii?Q?+VVJEOELih3r0VwpaTkNd541D2TZTp4btaVNKw8C0y+MpUyUptgkLTzs4EZV?=
 =?us-ascii?Q?EmwQcZdRuniiO05jGx5/4SH1KcnqDklfCr3BH1DBvAP3MlcsyYfXrK3VxBFC?=
 =?us-ascii?Q?3ed/7nfGVtdvMMaEE45DlhaIlW8WjHKuwaqrKupumMxozZOVPrEbpWqRk7cm?=
 =?us-ascii?Q?gCJVzGWPmxJkxUHjkEaNIT+UVli4zeZE7kZXfQFscyUhzy+OMY+xNedfXx36?=
 =?us-ascii?Q?0FAvq0BTBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Zz3T69/5JCYWxdMEpRxH705HPJmOeMi0TgX3rfuSbrePAfZJPLhtl/YArPWCTIpaZXkunbFIwTQPhodlWyYgibk+WONnmgGqCZfEDT35XJOzK+QSSMzBW0zFeHuOyQRfkAmZLgbYffs9nL1A8jgmZtZW1ER+aSbOLK2vAlOijR88/yL4dBtTGKypTXkZ0JvdPe+aWz5YfeUMvuW4rAELyDT22u3nWSXEoWeuhxnF0QHg/6cO2SWGZzER2i1lDDmAXHSrMpOQxCwtSjPCL1N69vyCFJ//sbFBIcRK78QoSyqQcU/D0f44+YRefzg/Ltpt93UBWONe97NmDu+jnzYsmg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa086fc-c751-42d5-b795-08dea1055113
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 06:55:33.9237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xu0y39/t2Hqap5eV/1xFA31aFMQWSxJSHnHiUd/gdtOgK0zzrPWzAksMHBBpxbsWIC5KTyjHJuMCsJNOpJPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235742

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
View/Reply Online (#697): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/697
Mute This Topic: https://lists.yoctoproject.org/mt/118961674/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



