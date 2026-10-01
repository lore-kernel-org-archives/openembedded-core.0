Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD03ACA5FC5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 07:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6122.1790840772535602263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 00:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IfP0NDLh;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790840772; x=1822376772;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tnWmKpWsgbP1RvPBdvA0gr0BNKV6i0SPoGDaeqeKp0A=;
  b=IfP0NDLhDKl9voESAxZNFPCyA9h/hLAuVGeIDmPn6imM8wCJp276iHU3
   C7bkXYt8xLEU822R40Y2tg7EJVBOwPCeU09jMXbPXrN38h+Qz3DLM1aIc
   cfJ9srEXCyAWNyCSgEobWr9Ym08pVd3FP9ZsaZfExROCl2c/TwHr7jPRR
   D0K2yYV/g3Ru5dsL/N9z+OyOo8frBFEcycborbmqi2ohUMLsIXI2seV4P
   6bd3fRX5qS41eh/3XhLEXESN0x2z7uOwfQXU4kFTJVcDl9aZ/WqP9Lsi/
   cTSUiCFUrPlEFDay0S8Z/l3Qo7TbBqCQjvR1Cz/R0+V3D7HK0SJMrqGJY
   Q==;
X-CSE-ConnectionGUID: MBJavs3VSE27kPUTdCFAQg==
X-CSE-MsgGUID: IKgwqsTPSvWvYnATrW2R6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101750548"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101750548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:46:12 -0700
X-CSE-ConnectionGUID: P+wxXuBpR16IrtPK3VhYkQ==
X-CSE-MsgGUID: VbcGtLeZT8Om966Fx4PK3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275963909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:46:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:46:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:46:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5crw1yZwSd/zTxVuNcRUa//rCiXV/MDS/+Qru+7XB42X2jr1w7KL1B67OLA0NaFuu78ld3k6+xyQTYBbjH0ZmjBJINUJn3Hbej7tOL6F9s0cwRbBn1YVJ4kohBHyK8/IpbN21/JTPHH+dAh2nnR1Nm9vSLbK3qtRvTwKt6SpaEkKIcOlRCPIFvPDqfn1mVLtDMEi+ExhtpUPzT1MfaxilGA6h+cQyRCgmJMrAzRJ/0M9x0LYv+UVfJyNSncW1R+WxA8GPHkgx0r9sJzGG7LOS2XRsCL6AR3vewYP2OG6Ct6OTqTVUp02ozSuF7YiDZlvFebqgg9u9D5KfF1uu/TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HcphjLsQet0OKdGGQ00bs7MYXWFzdzJdi+J9m288Cw=;
 b=WyBS0qRkHv4sc0ygs4/YW1KAvOR1JnHv7fQyd8Bddm1xg9Vu6mCOfSYJDKN+YCETv75OiW6SASPd8DN4q2p4grRGFDkE4bEeHC5ncoEd9W4Br/weur8QmY1Jnr9Tp1NTZthx3HDBfg2rAed6nOvOVuGtyGYO8p9zRlKYq5Qj6KEDQYRb+Ery1SqR8S8QF0b6iTyfZarQ2uee+/S2E6J9Uh9lqso5JL2uoUB/aU6fQchczKxNVb2QumMi7CObi3UEWKbPab+lVcv/wIb8uHG/CFyVV7hVfvwRsjeFpRGBSEGUWuGkEmymCgyqp3CJ+imVV1ZRDZEQp+ajnOUdHliWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DSVPR11MB938433.namprd11.prod.outlook.com (2603:10b6:8:37a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 07:46:09 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 07:46:09 +0000
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
Thread-Index: AQHdULbozLBli/so80OJ2k4SBzXywLboTqVg
Date: Thu, 1 Oct 2026 07:46:09 +0000
Message-ID: <SN7PR11MB70183FA6CDBF2C483F424013F48A2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a0f175ca54-53721ace-bf65-423f-80a1-d3571be35508-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a0f175ca54-53721ace-bf65-423f-80a1-d3571be35508-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DSVPR11MB938433:EE_
x-ms-office365-filtering-correlation-id: c8207881-b51b-4ef9-17df-08df1f900ec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4022899009|38070700021|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 7N3ZnleNTkR6C6ibqUdpjii4WbysSjDrsaYn8embV5y+m3h8xNuuxWA+6G0U4snBecw2q5GzjEgeMED69vw0bAORqYLRqLcDkZ+XmQOnKzshAGBVZnXQPdUsRM5ikYM5QZbDWGIM8oHioI1+8OmR8rR8Il3B8o8r50VccI8MCsWr80TqvTcoGSUB/OgYgDiZhCDz5BRkmqC8SBKjeLYTnU8FoMmBG1U7leRdu5Pw3ocqKcBHrLpTpo7h4BHXBWrZOZgEoFOFROhyMcywbpzWyVP/cHHjVnCc+0ND/ylNphHLCo1sN0+q0bHKN0I3VSt8M6oVhj3l5f5dxIQaYNV7eFntwp4ID2rz1Rd8PWic+6HKmOm6LQ4MkZqcDCqLsmoWAR9fix+enB03rTu8wIOPGjICihYH3MgafIeH9ZCgIFGEjHNwEervdwooCTpJJLFJGYUiKnP7tMZ07/nRIEQInjpmJ8KpXjKoYcmxoDFBREQ8RvZMPLEJFQP6lYBezZhilX95iFEb0Wtor6AtiF1hI7+b0oetFJUMJhE39PfejiamteYD4UAAIJssjByP6oFLdMvuZKeSk5oRD6BGs7F2snEn4Iy1FhWYXN0H0whbdIAXLtrCc98wxcBS/wAo7gbQSJCtDjlUUoXZ2gnJK2ceyKvD/eR14slvMwjhBjloj7s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4022899009)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8Sck2+KY6lYJCgQLmMxjJuhiMgYL4DJsDykfUWYNuhcmm5j3Z5Fv2BUwudQn?=
 =?us-ascii?Q?L4xGjX1m/80EfXstdOosjiDZB5zP6h6jVJ7cZ053a0jYDMXbJ8AsfRhpsEWj?=
 =?us-ascii?Q?Gz4wSSp8ryf1PwNGliuOGIRQqFq6Nok/nEUOz63Vwi3zH0E4m9zIqD5dk8ve?=
 =?us-ascii?Q?39hEzFsGBupOjMqxrZ5SuEasocAmJHGUBrKIzhRhPNT0cUxHhM3pAqeAfTLL?=
 =?us-ascii?Q?1aOJjoxp5qSJSghjKqhbV7+wH4MhXVBbM5d9qwmHBFzZVdcs4gsgsW2JhfyA?=
 =?us-ascii?Q?T90pIMesu5okXYI9Ul2L/V+5H8poZD/f6G/QgmYmAg1zoLsCna1kyoPHTWWl?=
 =?us-ascii?Q?8gZJuhj7NQMf55CO5TSwq9UCXy4J7HkLV4ivQFob0tPr66B54xQ7eH3gdwfe?=
 =?us-ascii?Q?U/kh0B+2dpfDtgGEMx2RnPNnUc1Vgil/3q3B4rppjeDYjoYJ7rqZ3yY01bQT?=
 =?us-ascii?Q?8f7cPeMvzqFocntEmOowDTD+rcmo8TOPO3l6LlfSq17Ev3DWtg8VqKrnt5Mb?=
 =?us-ascii?Q?0vcHJThksu5ZCF2sajXxpkqoUF5NTVN/faVXegvk6NrtYZ9+BK82vHukAquQ?=
 =?us-ascii?Q?vVlL0wCxS/xIJ3iy6L6TVyd4TavYu9tNMyLuWztzxFnPizhtS2KKv9HWDcFv?=
 =?us-ascii?Q?TPJyBRkbcB26zBix1igCzY5iQuv91lT5/vKfcJsd8ljm5eBi1bjdqnxBX3iw?=
 =?us-ascii?Q?cYF7foKzBLKVVzwpHPqHE+SViTm9CEHY0sZhsSjQlUPJa5PdERTs7EtPZ+DG?=
 =?us-ascii?Q?PEnobg3kYe1CLIjsEmDlN9fY8sU6HH8ONslD3s1gEJutM3sd1ebTeEFjXC9C?=
 =?us-ascii?Q?/KCbcCu50vUYvhUgeppUilDWN28qKUjTg4lnI/cM9L1Z3Js7dzUSTdUyPESZ?=
 =?us-ascii?Q?An4caXsRWGodeMaG+uiv8ojYdITsDYAWGcffRXIT03fyPlNTwWtKtvdq3g2Q?=
 =?us-ascii?Q?KreMvDdnsOYNSDwKpHXviD+bLwDK2D5pNeQ74eFmh7nd7/vjJp7hU6i4RSUe?=
 =?us-ascii?Q?cAfXv72qAAJkCkZmcCYu3bVvnQrZnNu4O65XivIDCk4ZsdLyhFwmWhkJeCHR?=
 =?us-ascii?Q?/J4mBkieUbekvBMsjpHk2NgMqMXDDuZAD5p2vbyuqm8lm/odlkqYwsLJs5U7?=
 =?us-ascii?Q?YHU38XQ8C1cqYx88xC1aPzsMeL7IewJZ16uvZcbPDNUJeHKW7K8O2iWl3K8A?=
 =?us-ascii?Q?hxfnxm22ZSFoV5hX+v5Cf0rTruZV5T+33Q9V1VveXUF5SHEXAnFCGxPWTdkd?=
 =?us-ascii?Q?8kDpjwcRlOcnqjQ4BGPWt8sIyWMmFsf4jijFOpzlvgvcCqvltZ09WoZVI9yV?=
 =?us-ascii?Q?8K15LfO96MdxxCpsWKtQPRFGtb60/EzNf/FveSqYLEOfzICEWKzgK/R6WJa3?=
 =?us-ascii?Q?y3rXwm/17yYn8g1PyKmGL3qutjVLZ9oKQiqFlNzJ+LnHDOUwbANmTmoDqolu?=
 =?us-ascii?Q?OgOOnt6NomWMXD7v6xe7JrAP9+s37Al85pQ0wUGzqJdKOK/rhETRbYg2sZhu?=
 =?us-ascii?Q?+sqz+lCACCLOM1Phb1Q1qR//pGO34BQu6HTmUbe0sgmfY7iJ16uXOUThJWkJ?=
 =?us-ascii?Q?5WXQp72BHv66jdJWAy22CVjbZ5FX4YYoH6i+0q9Dr7ogiLO9gw8/U+rXfa67?=
 =?us-ascii?Q?THob1DMhq2yw2NDS114gy79Aq8C2ksVnXHK0KWcr3Hxt9lDGPHpJgsqfsXgx?=
 =?us-ascii?Q?W8r3pzAq5plGQXMW4g5hHndscaP//2AV8XHSnCqpsnjKZSEv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vuK3NomllRlLH/Eyh+jomSh8vLh6Tpv/40yplgQ1PKas3ixx7F/lyCBigDax4aMnqsyCPfHxXQ+htw5JPOeEKoLnNo5paISn/m3/retDkFfuC+ij3ICsq0TgO0Q/+wVXZ0zQBkR8t8DLHK3h25a3ohnMClnHB2Lm8g66DDCEL9P16uxPIVpeSrVkYIvyKVreszbuzFq89RGcFclza4FLA8KKnUH696/+G8JjGNRoprTE5H/N5pF+m1s9YTOl7clJ+HpvU7hm+/kDwsaRbLfPTl+ton/9P9ablfBCut8QTwqZMSJT6vQ445zGvHNlnltNyL6kmrR2ctdZTtTjCyYQlg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8207881-b51b-4ef9-17df-08df1f900ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 07:46:09.3426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQWTw5bdo9OhiQO5tu4Ntwp7y0Xe2lhAEfhaUqPX0vry4KDsggXathU9srxOXg8AIBTDkKdSMEpMY/GDi8ivCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB938433
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 07:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247014

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
View/Reply Online (#751): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/751
Mute This Topic: https://lists.yoctoproject.org/mt/121505173/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



