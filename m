Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456F7C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 08:02:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11932.1787558543834247155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 01:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ympfp7qz;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787558544; x=1819094544;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qGc4KCkAI4j2nA2+goUOdU+MOeoLRySBlx3kOZC9wys=;
  b=Ympfp7qz2/WweFXwPHyFZ+8NrmfqryxgZatcYCE6Q2S+s1DnUDh08PZQ
   AsEmTLjY4iKMfm6Rh666x8prtacTCZDdFC3ZPy7XRrkRnN1Gnm3/0KR1o
   qvlO3y0F46pl+qqq4NiYSitR5Z2FkdUNQUA2SrYGtu1seft5jy1cKM3Uu
   ggyTWyjOTmgRDLWK5olOdLc1rArwM15OjfElGs+B2uKnKRtoR8ni8SMwy
   ICKBxzS42UbazTExsvdIW644JTR8FlK2KjFjySsVA9xLlbbFK+Im/Gs1V
   736J+/GrhF9AfD1I7hjGzp03ayr5dURX+3jrE+Aq4Po0kx3yUhObv/2sk
   g==;
X-CSE-ConnectionGUID: Gh+22BkeTCmljIxZ26005Q==
X-CSE-MsgGUID: lozTNB4cQ6iJ/SeAI8MI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87767901"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87767901"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:02:24 -0700
X-CSE-ConnectionGUID: qryD/AwcTCejDU1Xq0sQWg==
X-CSE-MsgGUID: GGkDXcKMTrGegp9kDCYmMQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:02:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:02:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 01:02:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 01:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbp5Gozvdhc4d1e5nAMUaxMYT+ojSiIOKS15yoqs5zz4WKDk6qI5fwHkikoz9ENQlH1OQLjnl8znm7OEOjWDkn1t5zjIHTEOB7Qf23hk6B8qOyAQ1b4+VJ2A3u8kHTDAu4BNISt4ZCc5zrxnjoZyXFcAhwdNaeoSSyxLwf0fXG+gx+MGcxFVCDaswukdeiviqrJsvqNPtXIrjw8e+vImASEqQfT2DjJwweAf6p0oNeaEN7gwV8l9psN84vsn/wYwIjpecU1Uez+gsJxh5CD7KJtEKMI7Ff5HI9XRlCHsnE+bztQlJEZRqSVoAexrsuVL23Km9OMQ/4moSqmR4b31lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JmVohbt9eMOqNznzmCN0Bo56O7bQqC92L0KpYQ/63k=;
 b=nDfrvGp2akhcxJsdh58sfeEZ4NMQ4u6tc5AtwA+rpsR7nOIzhpw+uu7N+QTanPNlmDZuxmU5LkoGSKyV+l0aritfiivoYKHcTZ5BHG6mLZn5Hi1+f8zPphdcgIhLRnOS6wiYLG/OCdnAmCTRiERZ2skvjnW4wA8p4QEKY9atLlcSWyiPb2I9BrkYNn6Ws5Y8/pjHB3bMDTtwuierjRQAdDPI1yGNe728HjSWyqCQPbhirC5fbQLSY56R4K1wenYNWswe2LhyuxQziMh+5iwN6vVFEy/fkyeYBd8LysShG2mJynkQk+zDX+2iSTVloosD9pUuNT/ruEP8XuUxzFYP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by LV1PR11MB8817.namprd11.prod.outlook.com (2603:10b6:408:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Mon, 24 Aug
 2026 08:02:19 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 08:02:19 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.3.rc5)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.3.rc5)
Thread-Index: AQHdL+iQyugWHAjY8k+5RMGSZut/Pbas3P7w
Date: Mon, 24 Aug 2026 08:02:17 +0000
Message-ID: <SN7PR11MB70188AC8C5DB2097EAB04D4FF4A02@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a01a76718d-b9001e6c-d0ae-4cfa-b512-6be5ae427a5b-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a01a76718d-b9001e6c-d0ae-4cfa-b512-6be5ae427a5b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|LV1PR11MB8817:EE_
x-ms-office365-filtering-correlation-id: 32059886-d8af-430d-fd87-08df01b604b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|23010399003|1800799024|366016|38070700021|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: urZkCdHWZfUDlkAj7GyeWdiKXdAbmHNZo0eQUb4g8u3eHlyVTpB1rz6RsSZozQy7XDq+eOGkVv+XPigq5o2hnrAV+AGVMk7UxFzV/Hb/zgHK/fQ7cqRudwhpvNhkL7AYiT5IFGsaO+1pvrCl3e+BqqFPWWQX53LA2GckLm514sp40Gw3TmlB8J+mQGpBD+EjYk7lo9bVs7qgWC118skK0bURpQpQT5zxZDrP/7jTVDr5sp3BIOfv7El9GIOQvPmekdxjhCyRkKDsUOKapMx/hW3Qr92CpoLdNMVFqLSapLF1PY2zfAZR+t73WLZAcIy+WyIs028923JA0zcYHizK/6iUnJTjK6jT4FyD1sRc2aBXKebhBU68fgrcbY2Svyh09/OOU3jZIGzSwfsy+1fDXca3hywI/KYH25eGU5nkd9Jp5Oom7tCi/xoYWZOvqiguf3gJh7/cQ4nOHW+mUq39FRUY8XmFAu7RV1JY49DgtI67Ia/ynWAOzvKCHIm3K5ekZkTSNfLm/og47nE21D0SF7Yi46NgJ91boEHE1PCVa4by6eX9S4E3cbP/ndS7puYVNrDpS7aP6SLZmGxTOHrWR2LXFbjc3KWgI2Tsma223foCo2fIINbftmBSAeFEvBPnlFnyGxhfhvi2CYchEGuBKnuhdR8/wEJKqIJz7rrcOv0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?etEdk1BUe44ev5ES9n2FR6sSUfH5eSsqv1O3yjOrheXPMjMjBL1JMO1o9v/V?=
 =?us-ascii?Q?0G7DaWVkfKR0jvZrDAva2Aiu0j5/ARarmo23RRdjonR8LVOQe44V68WuXoRF?=
 =?us-ascii?Q?+5Y9/65lN0x5SAWPZ25nhwxD8ujiKdHWV5W5sGkRN1KI0Cda0RsY/JiOinFb?=
 =?us-ascii?Q?gvSJBj+RtJy7XJEJIho8B0bhbWhAO+mGO+OVo3FgDG9E264qUg9z8UzdFb5Y?=
 =?us-ascii?Q?bwQ7RredU+KsilefFmyStVFJ12xO7PtqZh2vw7L+VGXauvmhadsYfqjGJMKe?=
 =?us-ascii?Q?gQlKdvVsSvJZIHZGfttXaO2iH100uX2A7MyvghxThQFP/onixd5NeJbHYHu5?=
 =?us-ascii?Q?IQB21NnCTzTac7vOWMoaaLNnTu5cUSBQW7I82bCF7CNQx9po3YKpWCIuNWET?=
 =?us-ascii?Q?c8UYLxJOwUz5iNoTnbjrNv6tjhRKr8jKczhg0F/OEDA4POAK2tf96CSReaXp?=
 =?us-ascii?Q?fo49xs4l8o9m8E2wBdwk+VdKo+GwTxQgbELCrXL5fm2o+2MomcYPXY8TdrTN?=
 =?us-ascii?Q?UkFYvD1wypPfW3bkrKsi/agEX73laGstLJBbSqyRBoN6J86ux27slI6tTJ3u?=
 =?us-ascii?Q?t66gKqWSFjFSxkXUL9D7TXId1wNu5qpJ9MaEk807YUMRVrpKM5RZO1ai7OQM?=
 =?us-ascii?Q?IZpPYrLMyW7CBNv1P5iLCaun433HahE1tWfffWLJVdL083HqAn/TuTK39icA?=
 =?us-ascii?Q?t+ytKE+F/g91LRitfHYPOLVU0QPXCQZO70Q8omtU3icTPhBZuzkhW8juDJix?=
 =?us-ascii?Q?GdjGSi47EnYWZWAFTqHCunzOMZKQ89WffgBSqA1C5VjiFzSATYMjPdDLSYLu?=
 =?us-ascii?Q?CxDsgKHdAw5e8XD0aN68HGqBTLw2BS6ni9ImWyriGRpE1IRsGuf55Q/YTarY?=
 =?us-ascii?Q?HrSO4/ifgaPaTTGQe1KGH9kha3roKkPTg9ajU3Y/4YvlwYtWEs6iRJvWs8ZB?=
 =?us-ascii?Q?zIgWRhCYWBFo35EFa8EOXZdDuM5sI4aFgBMugkxXOjH9+kdoq43Z9/Qw28/z?=
 =?us-ascii?Q?XfNwsGGdlCecWpExVzmZG4AGNhyF0scYupLE8/4s3Qkl5qVrso5da3VuZBYj?=
 =?us-ascii?Q?n+C6bx+76wga3239vynVbmz9kJNkyNIlxTor1AKae4b211J4csmp+ouFH/iH?=
 =?us-ascii?Q?1aqtFadKZtkYTrdB2mRjSWDK3HO9nBanC68OlS7p6eM6WQQ7lpYMQrKJ8zcx?=
 =?us-ascii?Q?vFqn3bW9Fv0vFQxnr2X5A6SYfWSXJ/DYsVkW6DTTOIuViZCkK3dzjWsWpWe/?=
 =?us-ascii?Q?7G0xyeAZiBk/KUlfSaIt5Ebbnv4qPI2arkqS9JYwgqEfEj/qe4ls+a2RlmDk?=
 =?us-ascii?Q?RPkK6qLg/h9gopquz/MfHeuxV4s5bme7nf3z8GFUE+/RtpsGzgal7STEEvb+?=
 =?us-ascii?Q?5ZkkMaiKcs7ZraZRXYoOvmMCNi+EY2RXarZggteFaX2Mywx9McwrJYsfXlqR?=
 =?us-ascii?Q?vYkcAaYC3e4Y9qYl8w7HKAtLz3BYn8H3VMPS4KdItKUmLUIL39DBEmkOvORs?=
 =?us-ascii?Q?KyVK3lyVWHKmgW9mQsOWsAv1EYZTaoIEb1MM9WFJosBqaajCT5j4M4KKYLeu?=
 =?us-ascii?Q?MBERGYLNh7/Z3Tvuvf/BjIG8g3xpqet6x1k9vQQb00OgiUjoG6sGXmOjE5GH?=
 =?us-ascii?Q?kb8a/JMEqjs8RGSF++dgbF3RqkkewisDa/oAi6kMg8nj9QKMjvvFr2luqYQ0?=
 =?us-ascii?Q?F34OueM9uW6xYqSXp+WpqGWe5x/Li5zDg/8hPo5VhJpT+xF+7hTvbjpkIbwh?=
 =?us-ascii?Q?8OC14+/uJg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hVwllwyf7OsfA1SF//RnmuDR4g0DbvFMEYBaI4sm5rQ5OUB5OZFlsFeCDB+ye9DE0Q453eSnzi/KGAWKxZBuP0QXQii5ySwqnwwzo2UIriqhtIKOB/Y/RNDHoHZc4E/5qGtt1bgbNUx3Xsc1qR8krAdn4rQLV4zmHAKq3S1of8mBBwn6fvwlP9qR9ZxXJ30nxBgWmRBPuAWcqAZhhRcvzyPCHL9PPv8e1vKQkAuWn/oUKGSM0JXVekrN1RFpcEclvlyD+e5mGhV2qTV2xYj8KiVTEC+A9Z2FgqzUHApTYAOiArkl2vEAz+R9SQl1p2xJWFMOyZqTRj+oKOlIOv6BMw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32059886-d8af-430d-fd87-08df01b604b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 08:02:18.3247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPH1Yt4rNCbdholsrgrcYVvPLRofk8TRwoa+r/hTdcK8k8/720D00/aBsh9ZGRkWXMqNLaHIFo4yQkZlNCwL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8817
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 08:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244072

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
View/Reply Online (#737): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/737
Mute This Topic: https://lists.yoctoproject.org/mt/120830443/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



