Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6C5D25936
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:13:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3075.1769490820361362754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XotBJLDb;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769490821; x=1801026821;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=6jIKQJfvmlA5NLbQwaw0dF1RxJK8R7CuH+pY/9OnqxQ=;
  b=XotBJLDbDuweMRURFdnGufKRTbsfMo6tftZ3sBrnY+8YsClxfY7ch62B
   C83sADf49E8o7WnBsA5QWVNZb3MBZ2uxfOfH7YWZGy3zjVKaNeK+UdwM2
   sbfkqtYkyMfpWtaTEyjRXVE7eCzxiV7t46Jk1ZYvGwnvvkKZ9INQTiJaT
   BzRGG4tUfK5GVkJZCrbp0sNNyR6+vvQI5YENPn1mjKeXWDv7bRZjz0Ikx
   jUDWwpPONSz5AZIJOFrJBuCG3KJhKNVAhAvP+yKUx+OSnDsHCfuqbWN2v
   g86D4LiTR7dBXjL7yP71bNAQk/Tu523m8gWUsAtDGvvQPwyEP3rM4zU8n
   A==;
X-CSE-ConnectionGUID: Jrzt5+jnSmSe1oqSVrzRqA==
X-CSE-MsgGUID: hufzubs4TZ2aCv21xlPe8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74519780"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="txt'?scan'208";a="74519780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:13:40 -0800
X-CSE-ConnectionGUID: WEj7cn2rTC667GTGLQqWXw==
X-CSE-MsgGUID: 9YHB9NC6QrWjE57vCE514w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="txt'?scan'208";a="207754370"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:13:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 21:13:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 21:13:37 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 21:13:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5xxpS0/KD5NCvZa1fap5B+6nj+4Gtjt8ut3nSsuM384w+njGPnf36O/4hDS69v1A45+xSIzxI46rFGdcWYihSGRnRhmNSh+3C9Gnul8w8eiLXJ5aZQr8V6iy5o8jsMUstPIeU0HKtt1CGflImDIy0r38VqcI+S0yFkt+omqbTpDqWUgpE/F4I12WotAqvm+sN8ZK7rbUMKvRX7riwscC/flybLt7wBwkMFpC7+oQh+9JIu0rMqNM0evN35S8EykLz/9wNuimcokTDfoMs8zXcDD1h9h8fnhT56+UxHIeiwV7QCHWtGzvPWqns/K7vDuPTvTlKBAAt4xAKogwKoEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jY07xE+dejfNGfFHv+jASicjese62+P5fdcuKJtb84=;
 b=lzXq1Ei+Gzv7NbMD4jK9fwAZ2i+vHwHWqA36kxaaNIio741rpFD94BZznGOv+fLwRxer4zS2Lakp4m/broFFiManc3TJeBWtKrwTSBOZKk+H9MBaXGS3LbHFNqKAySW25XR1SwLZgf1uKxFcdoTfAQpWNK0LCJQCEIdwhPALSAGOTWWQoIHbnJxJHqYeM0VV3177TVCLb7hFP7KX91b2dDuRG80wHaQw6r8gCz3U6QraIHId0TSKGfPKYaAfha8wKzx4Xg6D7AuD82iHR//iH0FcL8nh49tk0lsGsHGnMnug7PRcKbGx8Gah+91OgY2cNY2EYEktcpReAKFvEQ/EbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 05:13:34 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 05:13:34 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [yocto] QA notification for completed autobuilder build
 (yocto-6.0_M1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-6.0_M1.rc1)
Thread-Index: AQHcjIXYA0IcsNhQRk2f0+dzpzBEcbVlfaNg
Date: Tue, 27 Jan 2026 05:13:34 +0000
Message-ID: <SN7PR11MB7018BE1A427D9F9C09B75EF8F490A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bebb2c22c-d9c6e88a-4fb5-486f-8c4a-33fb4d49320e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019bebb2c22c-d9c6e88a-4fb5-486f-8c4a-33fb4d49320e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|MW3PR11MB4524:EE_
x-ms-office365-filtering-correlation-id: 673996fc-3e41-4831-4b8e-08de5d62d23a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4053099003|4013099003|7142099003|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?CLxT3eI/+4Sl5yICpoYDNXqCNS4sWzeqq74a1rGT47Uw8NvZM1eNMe1e/71Q?=
 =?us-ascii?Q?UsCTlNbTy367xhGupZHIB+IoBgtrwhvMIkfBwY6/Fdw1lWcxKQQSFH9jtWXO?=
 =?us-ascii?Q?wd0paUMiD/imNSalg7pZWjrVmctouAPKFB4Q6vHM+jTq3mDeLILGBvRaoow9?=
 =?us-ascii?Q?8FNVOHMZJQdwker0aOgkaE6S9GXtZRvVrAteXnT2HVtHjHlBLD/LiR3qeTmv?=
 =?us-ascii?Q?rZn2YKh4aysJXMAF3v8rjYjCmUK2i3kI84KdI/fa77vinQDReFgnxjPfvg76?=
 =?us-ascii?Q?esuxelPjtkuBzVksezeUAjr9zn8YN6vcU0PRL5JHiJYSR4iX/A7TRj5ECsYV?=
 =?us-ascii?Q?cSnDkaVW5fSY5hP0VWT+ls5GaWJrOShhMI22aF4JJRSd32q/06oKAo34CT96?=
 =?us-ascii?Q?O+xGNXAc8N3vRha/fjv7jZD55BOqAqmC/yMWpYsJjHk2o9ro7k6Lipu7AAM5?=
 =?us-ascii?Q?PrqKdYUXNclJUGoXR98ieS+U5+OERrd9B6IcafIkHMaRrlaE6WzsBTPikkwP?=
 =?us-ascii?Q?dm04DRHw3OaqRbL4auEOTpjMWTf3kfRbMfONRFmf3Cqu0czbqZe15GcQulEh?=
 =?us-ascii?Q?xLdCjoje1LHr7kYFLHHmFnd2VFR9qAsLxKvCDVAlnceAHiiaAoWZJdCUrRE5?=
 =?us-ascii?Q?OHSky3XbXKlYx0onYI7hGaoOqdSC3TjyhzS1J9C6l3AiA6T8Gf81zmyDi/Ke?=
 =?us-ascii?Q?N7Pvejum0D5L7z/YMdFa6RXsBtqJtIf8dx8KnZMgT0JFhTL7wgeiujIj5S99?=
 =?us-ascii?Q?O6ICffWNvPZO2hSCb4en57d0zr3v8i+IMpnZr90JUr6mTiRvSn71kBXBjuso?=
 =?us-ascii?Q?aFTn2BKfb7DjLHopeEbkbjS2XnGUGGiFyhmjDPLGR83R+zp5BoUNJLkOiWQ7?=
 =?us-ascii?Q?sgcjtmWYQXqqmVKsLreQr5usjODkaP0+xy8dmmiYZHCwN4hDJQweKfTA3hTt?=
 =?us-ascii?Q?IPSpi1KWc6UXpdzqA2Ecx5C1Vj6nNrMhquo1TLpYOw5wtTAcQmLqCiwbHICz?=
 =?us-ascii?Q?Vg/2y31s4oA+uB8uzTaXE7VuxZf8ssQetwB0itNrPDsQK8H1Yt/Y3oZKyEtJ?=
 =?us-ascii?Q?6VQCZ4QSG2c+3+Xh0cq8dxtaZkzNp3QpM+oPJ8o4baxH5pkf784TfeyMZ+tu?=
 =?us-ascii?Q?9AEvFtSoohGFGKJ1LS6N9PrzRRRpwIxNOVfYCGklg2XYEYBRCn+I88bGx6Qq?=
 =?us-ascii?Q?imc5/4Y6IhUrM6nVy+rzjbqzIPKBvBG0LJZZzd1xErf3tsBeqDTRxikPuLv9?=
 =?us-ascii?Q?T5ogxkG/xBjUk4LeyweuBF8LOD+E/G9CwVCPIYr1Sq/BlJe+3NDAftqzqLpy?=
 =?us-ascii?Q?XOWFXm6K38ts89+zOf3eX5QZu67t8VfvcuZQkDR56mN0eCbyQIkZfGjfTtOq?=
 =?us-ascii?Q?p7ZuXFibdiNQhNplOlZ/QCZUoA3GIjlBORTscgRfx1jtA7Pcxhq5VpiiO6+Y?=
 =?us-ascii?Q?abLs+CqAN+ot2J9AP0tWyuzVjmP33FNILNdNeZ+whPfIxZV1/zoK8TON6znn?=
 =?us-ascii?Q?+W2AbtZhPC7PNnl/8LPw9dcKyQ52dXPvJ2y8na7wvof6kw2ckD1APllAMlCf?=
 =?us-ascii?Q?k0KveoiuRM+JCGgLFZCvtYsYsWJtpLqaRAV8fQw6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(4013099003)(7142099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wo0jr67zm2CM7/E95AhdjKqyPUREBqeDz5upAwMptlhwUiNwhcpfRSq9G7xl?=
 =?us-ascii?Q?AJTt4WahiCyBuZBtDQgPzZaI0bTbUm9W1LkILZzJIrdivE+q/+Z2sAgZ5ZUU?=
 =?us-ascii?Q?3UKKDmQFZBp6lMPsByKyHbYI44wb/c0z0Qqj0vlxPg5CpOJkhE3HcoHqkaGG?=
 =?us-ascii?Q?T1OOmKPnpoOBd0U0WYE7bBRSKqDPEgFLbY481sQJiEpQflrF9emZ1ra+eThm?=
 =?us-ascii?Q?QGifUIs08AmYiTxn358FA4mV0FDjQ3Sq7lKny6kOFMGyjSfTNwneKi64/VPW?=
 =?us-ascii?Q?/P8LthRHXtELdijVyThQmXyoTy+N/JTrcWDzLs5OaRNV4/vByT+CSEtK7BdC?=
 =?us-ascii?Q?nZOV356eYjdtrituqwRXTRpsFz7RrPcHgrE1ovuWFDR5DVXLaAmayL4BPVmP?=
 =?us-ascii?Q?qIBWfZ+ZbafF335zdvg39E4cyQeJy47LhJb74k2rnsOqfKw/SW8Rw0tvRKHb?=
 =?us-ascii?Q?V+vYUxFWduIcx8DOFC8l0X2+1xRAAJpCFYk4Anc1HAnw8o93C4P1lngL4APD?=
 =?us-ascii?Q?JXd/6vwrz7F2E5dxfW2V/HvzvDgBuFA9r3pBHSVEU6rK71W1oREdc7ecQ6WN?=
 =?us-ascii?Q?b2R9oYJp75tXph2VIXywVOUGQcQwcuZ8PBZayYgQ2FZ8hA9+c+LFqdmUukXo?=
 =?us-ascii?Q?7yZ47qrNKvwv5CoBw6DoB4hRUxaRVNidi6Cs7KnSvolirCYOCJKp8E0I7Fk0?=
 =?us-ascii?Q?eOjeX6gKP5UM5Kkd00S67PK/8k1/Xy0gy5y4Hdk2ZAu6X93xxaF4mbv13sop?=
 =?us-ascii?Q?1b0BSeivj40/zBp4fmRvKu52dnXfxC45OT829qFPkSA9NXYR7QlRB2OEiKaT?=
 =?us-ascii?Q?FMdwetuXH/w5wuPQaKC03jLQFXq+NI8vHIcqCPev9wh37fo3PncvRHNCTvJh?=
 =?us-ascii?Q?AcQglyUiAdinVxVhqZypBaMC8+QVFLqKDlLXhgM9/5F1c0emJidnWu8s1F66?=
 =?us-ascii?Q?7kM8ShpN/cIX3BElFNRquj82h5I7aZBlnHYIzMbQ8a0i2GH+WcWHwSHXNWv0?=
 =?us-ascii?Q?VqyM8p+TYQOHxO7smV/3/YVOc7mWfdKCENObNPSeanKyH6QhQifGAJB9aHwq?=
 =?us-ascii?Q?aXiUHsTizt4Ap+t3nfawi970SiKRtQOIV4lVQ5aBvOrjnkPVOzkpIFiIHu1F?=
 =?us-ascii?Q?jhXAjSLHaXKHVsDInewtWOj60+vCZrRIOxhg8+LtiQ1F0VimHK6UBFk44Iom?=
 =?us-ascii?Q?52AHg30fqNhb1ZK9azdrp/lwerCDi6uaTCy0oM0NmDpInmJzLCzbNaK1gXYt?=
 =?us-ascii?Q?Sw77sl4kCqr22hZCEGLmkyo5ERnqG9RallXx5WezKPvwYvL63XPlKk/Ql18y?=
 =?us-ascii?Q?ZtglQXyMFKFF0x3A4uz5vhTsLXuG4pWamUJpxtYjGAAmoXl66PI8P8Od4Kxj?=
 =?us-ascii?Q?z9qfVX+ISd6CjHK7CPccabuVNV62elLjPq+fe8/77M7psex8o3dp6lICtzx6?=
 =?us-ascii?Q?CdCvOPZeTSXkGfsv/TetwdJGpXnnJnr3uB5/gvYlXYTZvQlFhZe//sdC/kSb?=
 =?us-ascii?Q?t2MIxi71pIosgk8tF7CR3bRQcADZMVxmIuR3TfXZxb5QIndCyfDEhFDe2Nv3?=
 =?us-ascii?Q?05322PU6NnaN34+IKF69qby+SRCVwCDYpYiQmSi/C1MAHv8eqz5wyiQ7W0nN?=
 =?us-ascii?Q?PlZyQbwZfezmNakaOPlvu6cx9PREO3/jDMNip0yu573rKg7OUxrqNZGx+TMn?=
 =?us-ascii?Q?PPhlxryiMhjuSg9gOZuewSrO9Fe/M+2rjlvcxV+DldGLgWen9DO3HPsm/IL1?=
 =?us-ascii?Q?k1f6loCP+g=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_002_SN7PR11MB7018BE1A427D9F9C09B75EF8F490ASN7PR11MB7018namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673996fc-3e41-4831-4b8e-08de5d62d23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 05:13:34.7969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPZVHkLhVFy3pn1htW2ePjZEQMdoKPQd/9WvN9BwgfZlvLZC/v7EBPMFiEuLbNX365VpNHGAFLjSP3tsVRjl0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 05:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230028

--_002_SN7PR11MB7018BE1A427D9F9C09B75EF8F490ASN7PR11MB7018namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0_M1.r=
c1. We are planning to execute the following tests for this cycle:

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


ETA for completion: 03/02/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 23 January 2026 22:02
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-6.0=
_M1.rc1)


    A build flagged for QA (yocto-6.0_M1.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0_M1.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3116

    Build hash information:=20

    bitbake: cdd79c1768ac396a9c6577e38098da4331507f24
meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10
meta-arm: c3c97a6b8f39afa7459ec21ac55fa04164c0fe92
meta-aws: 72441d9befcb4416952f31bdd245f44d9d80f8ae
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: c62b2d0e99e6526d0ff0d0bcdb23816cfdcb6292
meta-mingw: 11666fce6a3cc98bcff6fe2c6bdd9e48faf03767
meta-openembedded: 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6
meta-qcom: 18c6e3f42ddb07f4b4a87f44324b3fb60e6c3a2e
meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
meta-yocto: c23c19e0b300812bad314f1d0a901965315271ae
oecore: 6c31c2a731858108e790acaf38679a01b0d1a035
yocto-docs: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20

--_002_SN7PR11MB7018BE1A427D9F9C09B75EF8F490ASN7PR11MB7018namp_
Content-Type: text/plain; name="ATT00001.txt"
Content-Description: ATT00001.txt
Content-Disposition: attachment; filename="ATT00001.txt"; size=391;
	creation-date="Fri, 23 Jan 2026 16:32:20 GMT";
	modification-date="Tue, 27 Jan 2026 05:13:34 GMT"
Content-ID: <31654900CE1B684A937B1941B5E30B9F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

DQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzY2MTgzKTogaHR0cHM6
Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vbWVzc2FnZS82NjE4Mw0KTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTE3NDIwOTk0Lzk5NzYx
MjcNCkdyb3VwIE93bmVyOiB5b2N0bytvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vdW5zdWIgW2Rl
YmFsLmdob3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg==

--_002_SN7PR11MB7018BE1A427D9F9C09B75EF8F490ASN7PR11MB7018namp_--

