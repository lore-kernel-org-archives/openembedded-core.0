Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EF5E93815
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 04:37:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.264415.1776055037589761568
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 21:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=V9TeACxM;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776055038; x=1807591038;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=m+tAUJJqVBv6RwVyWrAKqaamQiKngh+IRFpivoPJXM8=;
  b=V9TeACxMHqj6SC9aIcWlQMnovAS4rAjcgVFN2/eYGtgtYUYUY9FTq60m
   p4g9dXQwBUn3l/fxv2d0fc3KhNIi8d1hRwUgwRjVErfJP7dyYbtkpCwEy
   WZ6i/6hEuXiYEMT0k4w9Xyj8amQ4uW8fHQ9/5mpt+BNv+qnKN79yWCO4z
   P0wh8I+ZAgwYcGgxHwGnMWkJZ2fNY3TmbWiJSHK8HiTZ82GOOQ58P/cIX
   7/ohUmBcL8+9ptSZXMwyoyup3E/uXs8Z9Kef18xcrlPQvJdb5UIXJ7l0a
   rhXNuyxbU66O6ZBc/+hdQI6aLDS4m7omoZeWGGCUUsIoQv0wg9kybbYEI
   Q==;
X-CSE-ConnectionGUID: lGsjkIl7TlSTJWH9qJ1IKw==
X-CSE-MsgGUID: NS1RG0YpTOCViXrLRKZMjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88367238"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="88367238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 21:37:17 -0700
X-CSE-ConnectionGUID: 1QjieWzzSiO5aPUby71qXg==
X-CSE-MsgGUID: OYGNReYkSRuzpK+fRkv6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="260131146"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 21:37:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:37:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 21:37:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2h3OlZ9lg8iiH9ED2GBul+nV+LwJ9xfbz4OcWjHQwKgqBdlkg1/ro8mclEb3YZTHKhdx0Z4Ac3+FeszlnaR9MnrbnmSSTyBi7HvhfwNlt2TQH0giv98auWTZkAK4FSdJAr0DvOnkMuOydYx5rcPh7o8W/KxvJKkKl7mpI3hA9jKfW38QtxuKZVzYZvhx3y3A1zwDPhzj5UHaS0+mCC0cP1V/oOham0ulr3YN4yaVlbgic7XiEnXMqcYqnlYE6vreNjOXhsm+zaJLy2M5ocQEy8PcrA3rJDsEJbuV6kygW5noblhy+lqddwSUd9k5m/hpukgxmCGycueeVQNouYvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd1j4vAfKlfNCRkcxuzSxxr18Ar51DFE5IvEyMZlKfE=;
 b=BkyTfPzBOwRtVT6QGobg/YHsWE5I09jYskodD69IgdxgdaAuLyPQxYaH/UmqiW6MVivnjEX+zqMsnOcOIG0SMJv+XsWw4WAGIZKvpfYoBNqs9we/xq/kKVAACDKG9YH4VO2mDq99m0KXLZTferOFpWnnsgn+iPBZspeX9coW4iOxoT6mSGh6lS3vdK1kAez5QGjskyWD6rmFGbYTwwaTu3LKwUJBOKy9qPy9G6kHb8akvEUqd+bbOpxvTUQLm+/3imrYHLPIKTb3jJdWgXvQeePR2lq0BFsVAy72B4UgGijuOcoh49Z0FuP9/iD6imeNRT9O7VgDQ0RmJG7jbUSXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 04:37:13 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 04:37:13 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0_M3.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0_M3.rc3)
Thread-Index: AQHcycZQiUdakyK6cEi12ISRY8r58rXcX5rg
Date: Mon, 13 Apr 2026 04:37:13 +0000
Message-ID: <SN7PR11MB70186AC76FEE163899F75824F4242@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d7d1e66ed-2b939a78-45d0-4b89-9c9f-9b37efa1d8d6-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019d7d1e66ed-2b939a78-45d0-4b89-9c9f-9b37efa1d8d6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SN7PR11MB6876:EE_
x-ms-office365-filtering-correlation-id: 06ff7193-8694-4143-97b3-08de99165581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: d3rcASsIITWjPeiZMFBI21iLZ+nYHb2/16ehP1/jTDsAREC2EhslcaxAQwCZKEopSUae6gTHXGC3AAs+4GpVatj68Kaya2vQFRcTDo5QuIUlRfrtmElrFJG4hwZ0jU48Cs5qbyKU5m+fKQIzRMzF/gc9+z0G9plIS53p2D/nOye3AV7RhkkGpeoc5R1futJYG0p4yCJwnNZg00YLukQtcpZTRtnhEAFqWCa9O/1W2ufTMpqJRS5J+7oGwh5Dn06msAq6OsNlhAM4Uj32TNPCAfhfUvJCD94pL8iJxfcgi+V66nKd5129iuv/K+fr673fXGD/KbPdsr5o990Qxyng7sSbiCziNNdHjgRrBmSsZq5aSOmP+fFTToim9JGG8IyKRlOzjj962WlHzlSbU1aTVc3ERytm3N+5OjpFE7jmWNiBGm+aBCGk22puAXvdghSwqp8Y0kHa2IFGqi+K58IuHKVjKVVpv/++nyugGaVLCM+nG43RWvimLXt6JXi/fF09KwOeORmjvKm2gtmJaslBWsvV7C/7sWnGuyj4KhLkULdF9QfXlhSnwr4oEgOH2bh2OKGyZ1Iki5OK8feet8ytALp2UqEbRocIf8gVhP9tNr6yQIpST/FlVxVvM/LjyLizP3IucokC2JM0U2dSRrG6XLEN6ZlX3O2JAXX1N9OVW9dhePHi7CbxwIRyDJAZdym7xFgeoKO6Hv3qqTteEOUe+oAtqhPgRi5crqmU//xXF21dn4rpk8skq3S+gepM3vib
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0HfaY5OcPhLkcdUXv3CBovKL4B29OwI/IWTVM3bTUNLkP4nWPFv98Db4wu2o?=
 =?us-ascii?Q?3zjj8K7sF1P8xI0kSNWuxDevrxMIes+UahvAN7eqgju2s8zEkEzh0MVOGIeS?=
 =?us-ascii?Q?6qPtjFRWjEHzVcp1GYMqSEdTkMmvefA3ZJkXroFyKPV3VEZvV4T6WIcPwhSS?=
 =?us-ascii?Q?xkZ/3LA0tOSTQSN4+UB2Rx0KWyjcg6a/6cFpLENDq66rw0CrR5b8Q0so7Uvm?=
 =?us-ascii?Q?xnPxSkqCg54juWqchIk8BujgP7bi3zLkbphAcFMyjDeV10WVwnmQuP9VKJqg?=
 =?us-ascii?Q?XaVh4f9w4reHVFbw18X5HMsJi30FctQ7j1JjKuUpoaHfyT2oGigO2xDHnDh+?=
 =?us-ascii?Q?U17F7kMuN5y5AcGz5InnIotVkePChZP3MgtmI+cR86YcnmY63jiOfa6kGl2V?=
 =?us-ascii?Q?3qbDlJlxzydKeOKu0fHSK25j4wdtSVjKDFb8Rf5j5ixd8y2ccrjo2SnB+50v?=
 =?us-ascii?Q?vKW2Pe79XfUxfA6E+uQXk+xuIERc+8i+ZNRvgjQgo804ifZVkoFG4EM9xtiU?=
 =?us-ascii?Q?HGZ+60O6FormqN9kAValt9vw/YxKg+lBI7CVCSTdaN61RFBDVPEPLt4qkNn1?=
 =?us-ascii?Q?mi1BEVSjzuLHpBPLXmfLum+O+aXAyIqd3HeI5ENOhCtPdTMXptqlslgNXa5o?=
 =?us-ascii?Q?Q0GsEQDg10Luhy3/s8NXFRTWhIRQGivqJ2Ui3JcYLhhqIk4rX/PgJFSy7RN3?=
 =?us-ascii?Q?I+1/ZutHrRCk16ow2Jr3XIdlV/AVIUKm+764480upYreFs+8Gxahbbvyrev5?=
 =?us-ascii?Q?GavNRBIZPJS0PLwgrBOftEWhJHg6hqmGK258cGqgdssFIGHKBxzKnt3LehRW?=
 =?us-ascii?Q?J1fSYn/yOli9hZyOed4yPSM1CPkPenwbzpC4jxHj27XVaqmqWz0gZp7dVA1q?=
 =?us-ascii?Q?h8CigmmLcf4NCqrNsM+cGf6BzsFR2V85Jm1EmA/0raNPu/OJ8jG0vwR7HSxi?=
 =?us-ascii?Q?jr3GUMxNzZuchKLuOtJX9ovgo1LC/oaExWB1GMl7PyDbguBObp9YTa0CqUdB?=
 =?us-ascii?Q?YSir6Y+dFyluGKwgWpYsWi2tMz+gVuo8usMmEccCNLjAVL/8rRMvJlOPN9n3?=
 =?us-ascii?Q?wjFfUzqEzFM+XhbSTcHS3XvYztkD12KeIvorleHNGdD6HbN9RexFBL8/gEv4?=
 =?us-ascii?Q?l1IxVLuzEi8PTXFohZ18Jh8uowVc1itHb6crZ5yvJmtMvskbiINAtHZ62l4D?=
 =?us-ascii?Q?l+EjrKM8QWJ4+CU0hejNciClTwJCro7VHyQ5xs6Ou8o5MbmTAkxKWgb7VaoD?=
 =?us-ascii?Q?mnHvq/A7MjVCxLNYDKwNnnfzmuXltlTXHRWLSaTyrfwoP+vQipL2ZyLM1EVq?=
 =?us-ascii?Q?jSH8g2egcaIrzQudANP6BcSjxzlOu1sTjbBkGAhGkJYvzzbFUUHdthG9AfAu?=
 =?us-ascii?Q?aRygE3o2Xb41NVWZ2CZHBq4gkWUCDbSAcnrz80UoGcq1r//9nklcgiLtROyo?=
 =?us-ascii?Q?rpMt3a4zsq57IdwxxquZdTt5nxrOEk7w0SnhFjwE4T5Lz3Wu0y6LcaOdubIY?=
 =?us-ascii?Q?CMhPQovccGXfUMW1kUt+Wa8f1aNZ2cs69XNS5vWkOQqR5Mss4d2iQ3Y7SlOR?=
 =?us-ascii?Q?pSgFosVnInW7p8k8dOgCygTq+gOh9U7uSVOxmAn4jYmel2Mjo94KgDaW1G5R?=
 =?us-ascii?Q?t0A5llPJUQxTp7acj4t2GEHRCVcVMxoD6GiLvT9F7kjCq98F9eF2Y0kyzNTR?=
 =?us-ascii?Q?VIWRKqN6zV957xHduato8cod77K77PyBh79gLTW0zG5hoFcfC03ERB161HbR?=
 =?us-ascii?Q?kM+zk6bBnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MiqSy+6s30nQldIPtcvKVbgUNBg0sgcpJWeSDnXGSRZ24NFUC/JXWQd4Na9nMJ8ZEqLmyVG4rSNefCCyYehkZ+EkbnY2020D8G5S6wPL+B8CRBfpfloLN7ImVXPUKIfPPkzXiwZKqj9EkUiMCvUWOGAm9KyZ/hyZIH3Xa0JR9UyAoe1o0VF35uL8puemzy7X6Dw2+g7G/yttNKlV/pgdUKP644f+nPs+bzTcgCa3/W2Fk79gba3ae7MNxMCFTLQkLGWhz2Qigibg99v0hmsvmECADPOJNU6A7K/ID+naP3hHbPGZFwGtDZGLzjbAWJJfVdWhjDuQNGpZQpwj4nMiwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ff7193-8694-4143-97b3-08de99165581
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 04:37:13.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/TAdyRgpE6UkLcIqAP6EGrHBQ8Gj2tdF78iKX3WJ1HYeNEqpKVQSHQ7dhfQHLtxT8Q7uqTTkcxWIhk6v1wEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 04:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235079

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0_M3.r=
c3. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw



Runtime auto test for following platforms:

Alder Lake-S
Arrow lake
Bartlett lake-S
Amston lake
Raptor Lake
Twin lake
Panther Lake
Beaglebone
BeaglePlay




ETA for completion: 17/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 11 April 2026 20:47
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0_M3.rc3)


    A build flagged for QA (yocto-6.0_M3.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0_M3.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3643

    Build hash information:=20

    bitbake: 5d722b5d65e4eef7befe6376983385421e993f86
meta-agl: f5590359796fc6453a17849904a281095257ee38
meta-arm: d987a5945802dcbbc06be91a0d34f00431ea840e
meta-aws: 172c1f12366c50f58c317a4ed58d6de79e7afa1c
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: bf06e8360baf2c84257e82f4153e13e62708568a
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: d793c367e067c49956d38caf6eb84cb112c9c9b7
meta-qcom: 5d1eabf99f52bc5ed4c629ba4a28f567ee69e564
meta-virtualization: b59fb87c0e991aa95f62627c3b2a606956ef6377
meta-yocto: 49cbb01d52521bfe557395c9ebfae6b1c162581e
oecore: f235ffc43c7783a84e1ac0dce8489fcba8354e12
yocto-docs: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#687): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/687
Mute This Topic: https://lists.yoctoproject.org/mt/118776275/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



