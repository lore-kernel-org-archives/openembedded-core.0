Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9527D5B16E
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 04:10:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40653.1765771846114271393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 20:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=W359XxXK;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765771846; x=1797307846;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UyJU5ODYi1h56kih+W5R5Ysd9lJ5Iw4szDDq8cWx4Ys=;
  b=W359XxXKvu39QYop7DPHpWZLbv69sjB68h1W1e6emZ6nXxx4WY/LcRi8
   stgbXzQHY9b8K0PxAlFFUR0kRdnAXndS5Dr0TmTPoG/ily4ir778BgkWt
   9ULxtEXNQuLp/OoCDkYQ7kONyXdzJdYOU7KooVx2LttCR+ofmu5PinQvB
   e6lFhOC7YQF7jbfZHcjFPSFmO74tpLXq8HfmuEj3Ca8dF5zQyRlzdXMLi
   /+3ikxpS+ijSFfsRj+UYBBTKCFHpCfY9WyGm0BqHOeCAwHDjwMH1W0r7D
   wYlJBnmrL0IkqOLIzwnxRTMnz++XBIAR9HbfXULdnYSAzdCBlXUZ0DHek
   A==;
X-CSE-ConnectionGUID: e1GbnCWLR86vR8xc9ztEpA==
X-CSE-MsgGUID: 8WbXTgWgTj6z4+5DBtnBEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78785139"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78785139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:10:45 -0800
X-CSE-ConnectionGUID: lD1PiilLRASQ4x4xB688fQ==
X-CSE-MsgGUID: 2KGJ1TVDTAe5Pi2qxZUwjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="221016870"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:10:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 20:10:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 14 Dec 2025 20:10:45 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 20:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBK+fcT9MmrUDtHhkqlJ8oRKMbdICSbkA92hjIn+EeKjzgO7hUzziTco/6SmlNVNIBgnLNCaObCaet1amEMbGu/bYcTzANYN0LnFgmBbMcE65wMUgLoA0W4WsnLrDaOR4cbSIoKMaI3jPvuXMn6vxieLsFTMyvA7gFI0d4HxfHxSCKL66E9YMsNYTkjwhKoEwHD/RpRVR7RtrVd39r3d9v9peatWbFtF9F70KOhc9yQQpuJLG9CZinXt38Y6UGEgk9uaULjFM+M2RPtIPJ7h5Pz3+gxu9DCntdB3mpgC6/OC3V+SUBDjZl3avc/rmVSqYq5X/ufdUfd7osqMKtJAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnVqly5QwRlU0I7jZu6NPfT3+jNYY/3OxdJSamkpWMY=;
 b=R+k15vyFh70UdeGJxAtuK1mQetkp/8Ecxm6vRuHCe/gHy9DGVDdX7vyJL1bVdf9fzjmz31wwZxmxKXkp0scgRoRBb8OG6tVHYQt7fi5DsU8gpM3uuErAdBO8XV9/e1NgkLVE3gGX0B7Q74KmiW1n9jpSpkZMz3dbP9nDEKg1IeA4y1gqWomi6VwOQaqJWPcmOi/E1NZ2P8SPNtSakgAocMM9Bvah4pFCTMfPZs1UQSauhNBmEYJoSC+LCiuH8CBMJYJQEFwp3hAbpcIZqpK1tSna0tKtGuUL1WDzeU5H4mgy1RpklzTT9juiH2hcmLMUjHhAVPiJ0d3QLA0epNnkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 04:10:42 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 04:10:42 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.32.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.32.rc1)
Thread-Index: AQHca6RFVzvPzlhffEaTUfPIfqbt87UiGaHw
Date: Mon, 15 Dec 2025 04:10:41 +0000
Message-ID: <SN7PR11MB7018B823B619356958B96D36F4ADA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019b14356c46-c067d30b-d4f1-4c27-9264-0144cc80b869-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019b14356c46-c067d30b-d4f1-4c27-9264-0144cc80b869-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: bf70ce64-28b3-4b09-c6a1-08de3b8fe9b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?dBzd3yuYa3v1gnd9MNZBfc0/Njc6oM5t3nnvaO9mGJG5W3bMQpxiDVCv6o4G?=
 =?us-ascii?Q?K9/x0meTYZM4MBAuAep1fK+c46EcOuu87SPr47nYynbMahlI5xqUvkoLvWef?=
 =?us-ascii?Q?Py9W0VfgqAeid55LxHry+Jr56cAmbvwUxBXZFNHxaiK0hXpBoQF4EMlgyflF?=
 =?us-ascii?Q?u6gR/yEc8wvQEvNyLm5DsritdMLzngPRD77EhtNpYWWFErO3PaH4HcXcXVAb?=
 =?us-ascii?Q?KFq0DhWyhlItwINrYVix17kiy3ZfC17c8hc78On1Mn00tVTd4Zx0uaHR6myT?=
 =?us-ascii?Q?yyAJXA3MeV75On6AHx5Du5X9iREIduvsy29BrhAx1BW/8uqswO0PeAICugKn?=
 =?us-ascii?Q?vtIn04Sc/pOYj/dCt5TzyS0KikVVS+ArcWQMuqJtNa5ynwsB5t6fuhsk8G19?=
 =?us-ascii?Q?E4w8p9DbcZlpuCKjRwFpVrbRHm8MFOhPnoy0KLeQh8Q6D2JT30pa9wTZXIs1?=
 =?us-ascii?Q?zYkDLH+2Fit42MJEWz8o86/CVDWmtTmickUs3+IO+YXAhZc4UqtC1qqVOjJx?=
 =?us-ascii?Q?LxP7p6Jv0AT22qKfWyKtVyi586h0q8Kmbq/BW4hP1ne3UlJ7WHrbuNBMqQm4?=
 =?us-ascii?Q?+zmI16GRPDzHxUYLhXAGGDpNHOFjemPXShdBr9o/fprEtXfOaoPTenaMmsV/?=
 =?us-ascii?Q?jeuQbeisw3FRHl5G4c7bOhqU0V32bWckrIxpt4tU2sMLu6DkJisYJKNuNnOg?=
 =?us-ascii?Q?PB1ov6Euz1uvhqvHn7fou6Jx5MnX06DRy1CXW2pvHBwKxWe8W4r5yU0gT9mT?=
 =?us-ascii?Q?/SahxG09gD4Lhp/w2o9azzUM/pBONex1A7PjD119sq498e4989Abt8MrR75m?=
 =?us-ascii?Q?EF+Rsqqn1IQG3iR3NmIqQ8MP9ctR7Q43owUnllJLjMRvERNcRlyHDhxY/FTw?=
 =?us-ascii?Q?5hYZuwBXTuOFEL048bKq4pE/joyDBKSENDk/tMI9Zq6K2tXy7gw9ffeW5rLK?=
 =?us-ascii?Q?lovJALzIJIzgdriFpg5J7NBlXmW6C/a2T2iBgCp0IslzPLQOkG7873+UMyk5?=
 =?us-ascii?Q?gshnBxMGVe2iBILwJ51CdmEmXSDHn0tJgVgYjeWA2E6eOK0r1vbtYWF+/Qsa?=
 =?us-ascii?Q?4ytdLAvT93lmDQMITlyeykFkQdxZcITRYop4RCQiEMwhQVfsPjtMl+A+ZkI3?=
 =?us-ascii?Q?Hs3yYIgCh7jPHuLOdg3S4p93+0PhjSYkyHs3nVLgFEmw77ZewGRy0mZL8Nni?=
 =?us-ascii?Q?WuAaQLki1+5sIhduBlDyk85hpCGWlWP+cMy7SYowUm3lLyiehtaDAbwMKXCl?=
 =?us-ascii?Q?wTQSQ2h5xYL/uxdtsX25YuOT2eoEAvc5+vtpmCC2impka5lFMQnOnvQD272R?=
 =?us-ascii?Q?JKYqBhQnFBlGx+SAs4OdVnoQgtfAmR9TulI1s4dZyUY0DnxIqqQmojPiK2WO?=
 =?us-ascii?Q?FWu7wIkOUYqsmn/T0c4t/IKNCluHTYJqGTUiIWjueYOW5gz27fviUZp5+wUT?=
 =?us-ascii?Q?8iVKHUTLi2pV4AtH5HV4YCIW8HhtTSwHBl5zM3dl2S2m8PHdEeoWez7ufNk/?=
 =?us-ascii?Q?OuyDIqX03uo7h4ipFpuIrIdOqAOy96RFzPDf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MdqVNmTDeHLlsuuWYaj3bkcUBYMaBeX5iqVnNza7BdUntYFtr0wKKXGztStk?=
 =?us-ascii?Q?EWNrcAkc/OcjEFyvPxmFRQyAhqlqZRmvwjSFN90fobb5DCFhdlasd+CXWnDx?=
 =?us-ascii?Q?PKWL/QhmpjdosmJmZDzXdRzPvtPxvEiYPCa1d6ojoUj/Smvvmc4jPLXVewbq?=
 =?us-ascii?Q?LD+pjUGmXU7EW1vT+/WJEMNnNW+05gYWxUxmgRqBG+TZUDz8gCpH9E2XGrjZ?=
 =?us-ascii?Q?WG4MiVQJbdWWc0KnbElFM6uJ6kwS0M9HcVnBzygTE+vi5KqY54ePTN0Y0KrQ?=
 =?us-ascii?Q?Gw0IJRqBpGBMU5FwnjXkCwK/gBBTNkcbyBwRSSJn0cjlc+cz377Lv11ZDuAY?=
 =?us-ascii?Q?HWuidzJrNJZ8Ohn9CRSPytTrkzeE5QCW/yDF/JLSZaYVPi9uVjMrDDmpW7WV?=
 =?us-ascii?Q?mH44/19rrCIkKE8eXMfFyMWjHeObBSp1xtBtR1+IAs5zCxdNPVvOGvaXcRc8?=
 =?us-ascii?Q?fsXhDrL3JU0Rd5Cd+GKraiuZ/oHkonsn/fB6kYHBTYaWLJjcKK+dlt2JIljW?=
 =?us-ascii?Q?tWPyVBBSnh3kickS732pGfoSmrlQ2SYYMR9DQKRptLGaAT862r6vY59TVTgB?=
 =?us-ascii?Q?kzSFM+rLB9HlN03NxVIiDrkjh6DWUFPFhYD6mRxvrda90HeHceQoVzb31IrV?=
 =?us-ascii?Q?WPwo2HvVRouw6uvn3TX8/BhEEVYYyXO2Wcud/THTGq/TLkYANA8qWIpTSonw?=
 =?us-ascii?Q?XX5nqUUL5lAVjuc0wDd5Z+/5xGK1MSODnpVoy1tpXKXLuY/l+yZYdkFo67q/?=
 =?us-ascii?Q?4apmiuhmuycTKML3SGPRHRnvkXChEvKUMHJO8cFvYdyE1FT+rK+D1f+Lze4M?=
 =?us-ascii?Q?H4i6SIVoo4EfO8GahS5+HcR9xtIco/03PD+Bhktm8kLiWtRTH3h5QTmpOUNP?=
 =?us-ascii?Q?cyi+0ladzHTc4g26TpmdvHGgVgkwYJ7hkLYnF+j9FOU5gOy7miFWeT6rjeUV?=
 =?us-ascii?Q?8ROrZRye8EGX/ps6yw+fJYgO4AVCThnKIadaxA7cCHxYqUoaUGLgILzA6kJn?=
 =?us-ascii?Q?Ufl3j6ruoIxLIbirD2ZKmTfBtIbFloFpAZ4IdNEn9D9jOv03CMGVWLLoI7zT?=
 =?us-ascii?Q?wT8eh10zI6NKd6Ea2qVhDGCfdpwMXcP9KJLFWuRrHzCUt9HM5e6YCg9qWFoV?=
 =?us-ascii?Q?riNLitCB79MP+P+k89kZEKZvFg0wGSZ9jnM0hqrpMzesplBnsdzA0DqJyt2+?=
 =?us-ascii?Q?WivPvozX65GgiVKf/XE+9uXKl22LzeKhyOlMDDl9OON+5v9cboc8z0DLrICB?=
 =?us-ascii?Q?FP/t9TteoxJPZebgygRAfUpQ1V8HDTUQ1ft4A5R9e8524QTW8NlYebTvtolF?=
 =?us-ascii?Q?6TsKTR3QXfBwETKdr3md4j/pmxT0T2B1otxYxKWxHfAZOAQVrzTbmox50smD?=
 =?us-ascii?Q?/Y0od6jDwWcRTk9Tiq/bzsApaXT4riXxsM3RZr9fknRB9/Yxlz2AD9wQiaqN?=
 =?us-ascii?Q?IWSKqADapneTErObIfM/IPah9xGhE19IZibZcGT4QtQxwBgp5T9CPon151k9?=
 =?us-ascii?Q?Y22ZcStP2lu/POFiz6lk74LMngDhduJoWkugwDaiRJQYy45gjcOp/K/CatvJ?=
 =?us-ascii?Q?GyDkqMW0E1kq/WBXH25I5tv1xRJ6niO9V84NLyNH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf70ce64-28b3-4b09-c6a1-08de3b8fe9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 04:10:42.0488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVzL+H1ZH4uRHw85Mef6bUG0Sv2peUb0OthQBtswflwlZcvJ/FpzDWYz9C2eseNGVs5fd736vkz+jupbpsYorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227698

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.32.r=
c1. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

1. MinnowBoard Turbot - 32bit
2. Kaby Lake
3. Tiger Lake
4. Alder Lake-S
5. Raptor Lake-P
6. Edgerouter
7. Beaglebone


ETA for completion: 23/12/2025.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 13 December 2025 01:47
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.32.rc1)


A build flagged for QA (yocto-4.0.32.rc1) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.32.rc1


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/2852

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: 3dc8b04c14305720cf7e92bbb9e541e03403764c
meta-arm: c3e9fb12aa31d25e33d8392c4a233ed1275a3278
meta-aws: e27c0573a292038f33f8d1fca05f02257ab1011d
meta-clang: 26de1c560ef3caf3cf641cd54ed0b7cbdc219ed9
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 97d4be2839754dadfc326c21948472c2fc2985ce
meta-virtualization: c474ae21b11a816be607eb7b44d2cf77d1125bce
meta-yocto: 77b40877c179ea3ce5c37c7ba1831e9c0e289266
oecore: 2ed3f8b938579dbbb804e04c45a968cc57761db7
poky: 2c05660b21c7cc1082aeac8b75d8a2d82e249f63
yocto-docs: 4b9df539fa06fb19ed8b51ef2d46e5c56779de81



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#632): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/632
Mute This Topic: https://lists.yoctoproject.org/mt/116752728/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



