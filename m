Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72EBC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:01:01 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.4745.1743562859897442443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=lypNdrre;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743562861; x=1775098861;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LsgPEOeYEh8zn0CKzODd0XLP2oiTkVEb/Q1OzPLw6mA=;
  b=lypNdrre3/BR3tvbX/NkArWqzD/DaQ9QeNQHZbQ/WUDoU0GOQBNMIQ+2
   9H+NQdygN0UyfJra+83WUXWIEEmay0QwRbgLQjX5QSRVrmq2cZRerDyQh
   X2Y7GWLbSilu37bpgfo24Qzve1CdqhC8EAgIvYqJV5AYh6z584izHYEed
   mk9NkqNz9LKTxX6QzFSLIBCLSq70O4CnG+hAtf2qUYN63/VZfxBqBcXDO
   5t0AN494GZtlmyAi9ehobbp3yRVp7aMtRifcl6eC6u3Yl2SCIqlhNIaLE
   SHYfs44Z74zfAxoPmdCFNF33n70GDjwHO9GDGr2VpDSNr7QD8Um3jt9Wv
   Q==;
X-CSE-ConnectionGUID: wvSqhwMwTsiw8PozrlAcZA==
X-CSE-MsgGUID: aUepfjW0TfK1UMlrBf6rWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="151017125"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="151017125"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 12:00:57 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTXx0i2mztCrAzKt2us+qKqItRj8gXqLXj9wVi3e4D/8P9mXCPkQUg0NEh4ii8qoK8YRX42TmFZl74cADLvTYKBD6Flc3DXUbt8yVXDJxiEGR0piCyiZJhVTQP/1Y3IdzzGuF6lhV3LcJd94RMaAo1s4S95Sj8N+vpOPPX9CRRs0YOtnVGMVtiyLuwp0q0ARaXtyh6O3R4IILINr6M6U9ge+MUpj+FuSROsNj8T0SeMu1sRzTudkUv296SqohMqD6ZtgyRWMj4Y8j2ZvqydIRp8GKHOqYmv8qYLKVUwxLfRj27esKN2MOHqTSe6t3A2E24ZOk+v6MIQ9s7vw37f0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsgPEOeYEh8zn0CKzODd0XLP2oiTkVEb/Q1OzPLw6mA=;
 b=gfixk1EVHhNom2SWPNZqNCsr3Mh81adzkka12mJ6s18ubgJAIIbH5svUvVYO4ZGnSkNXOFhlPnwWp+u0sVYkRPinvp0TBrmI/AzwGbpCN1+74IuPUlb+//prv3/OKlSrMVSBErYnleoJ+5I9MoeG3znST9fqUJX8JmmlZUqrcUmJbHl6jCkntJ7O2m7oe6iZ3kp6tw4M28NAPvfo1OztwT0zhmBIu+HtHTcJkQrUVNlP1p8PbNti4aA2KvtcwaULznP3zlCMdjIRn23QvLJWZtUPCnWpznkvXFCwFSnmejgxtNJOWmXMEbreduI3Qi1LEuqhCfK+u688vksxyQ+8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYRPR01MB12271.jpnprd01.prod.outlook.com
 (2603:1096:405:103::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 03:00:49 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%3]) with mapi id 15.20.8583.033; Wed, 2 Apr 2025
 03:00:49 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>, Richard Purdie
	<rpurdie@rpsys.net>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, Jose Quaresma <quaresma.jose@gmail.com>
CC: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Topic: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Index: AQHbogkGJxz1EXBtJEyQiTQWqmrGHLOM/biAgAABbYCAAaaMAIAA8v3QgAAZwsA=
Date: Wed, 2 Apr 2025 03:00:48 +0000
Message-ID: 
 <TY3PR01MB110569F4DAA67465F79B56CA7A0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
	 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
	 <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com>
 <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
 <18325E1AAD0415AA.16050@lists.openembedded.org>
In-Reply-To: <18325E1AAD0415AA.16050@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZDQyZTY2MzUtODE5Ni00ZGFmLTgxMGEtMzQ0ZmQyNjNm?=
 =?utf-8?B?NDhlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAyVDAxOjI3OjIyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYRPR01MB12271:EE_
x-ms-office365-filtering-correlation-id: 13db1901-b916-4701-b756-08dd71929244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bmZPSjJQc0JXMGFpcmhxUTFlUThRSk1NUktNTzlOTGpIZEJtVnM2eUY0UjBL?=
 =?utf-8?B?eXZBcEY2eGJtaENBQS9ETEFpbW5KV29qeEtzcU80NWJIR2RudnVsbUw0RnVw?=
 =?utf-8?B?K1dyUHd5cVExUFhWQjdNMlFqSkVxUWpVMkNYRW5RL3Y2eE9VWG1PUjFDbFZC?=
 =?utf-8?B?eUhZR3NUVnlXenVxaUxQb1J2UkhOa0IyNnlaamc0SWlVL0wzSlYyNXozRGdK?=
 =?utf-8?B?eWZMVlF0QjBZdHdHYmF0bUhJVG0xNDF6M20zNjFEU2loZldsOERYSEhjYmFj?=
 =?utf-8?B?dnN1WVQwS1N4cUpNWEtLQUZQMnZYdXEvaUVCbGZjeHJEQmVINU1sMFhCblNC?=
 =?utf-8?B?clhLMEVJOU9SSURXQVVhcmxOS0VtdGEvdUdYYXpkeUlZeTBWWWhGTURVaVRY?=
 =?utf-8?B?QWE5WklMS3BWTG1WVnFMZDFINmN0VWxNdXEvV2RaYmRReEFobWVKdGMvVVFx?=
 =?utf-8?B?YW5sa2I3R2hCUDBoRytFZzdGbmdabW1XazBGcEFnVCsrWG1EY0QzRE8rOWVj?=
 =?utf-8?B?Yy9BVldpdmJzd2pYMEhaNzZmM283VGZHZjVaR0ExcHB0aWtTdmFlZnd2a0d4?=
 =?utf-8?B?Z05qUWRNczVYQWQ4YkZobDJlOTFkYkczbVNaQ294WVJidy9iUXRxRDhQTjV1?=
 =?utf-8?B?WTIydXdrMWpLajhsZWZYZzdrOEtrNnVMZDBoMXRMTmUydjFEd215ZWtFak5w?=
 =?utf-8?B?Q1lkbG52QWdDRHVBdHYwUTA3Skc3NUhaVk04OHVTSlh5eUN0eFFEa0pVeEtw?=
 =?utf-8?B?Z1VLTGpWdWxMOElBMjdHZ2QwT3RjSUhtWXRFaURZME5IcnpZUnZmbUphSlNB?=
 =?utf-8?B?RldESGFoNE1SbFpQMlBweEYwTGNIVUY3Szhwd2FlMHlZVkltQk9qdkVaSnRt?=
 =?utf-8?B?RzJla3ZsL1IrZUpQTTV5dzc1Zktmd0ZKRkZFeU9IU2tSQ1hhb3ZJbDkva3hy?=
 =?utf-8?B?VzJTWlI3M3Q0YUhmT3Q1N2hzdUF3VnlONXY1ZFlCVFFvS2tzYkhoSVRNUHVm?=
 =?utf-8?B?ZXpJcjdQTkVZbmY2TXZZMEhZaC83NzMxOTEzTmdHRkxZaVI1UTZzbEJSRjg2?=
 =?utf-8?B?VHR5TjlwZ1UrQTI4ZmoyUlJXQm9MRUUwV1dxcjJKRVJHSHRodE1BWTExSW12?=
 =?utf-8?B?ZnY1OVRUc2I4a3VnZGV5V3g4bnBpeXpOQUhETWxiVGhDelNSTmM0djY0WHBY?=
 =?utf-8?B?N1NZcnVlYUhvTk1ZNFp4TzlibmVtUGtnOGlJS0pZNlhCWW5yQ2cvd25Mejc0?=
 =?utf-8?B?LzdiYitKSEtYNlNveWM0NC82WnZ4MHhwNXNUeDFqUGhOY1dvRFY1TFZRLzdK?=
 =?utf-8?B?YVpRRE9Yb2pTOWJWaVVCVU5wd0JVZnhyTHlXMXA0Q3hiY2ZkUVc1M3MyS200?=
 =?utf-8?B?NnVEUzRocmNhK2FSWGFJVFRLdDhnZHhGVGFzZU1UOEhmMzdVbHN4YjJXS250?=
 =?utf-8?B?ampVdFZoa05KN0c5V1J4ZkZiR2haVDVJQUk2RGFOV294SFdmVUkvZ21FRVlN?=
 =?utf-8?B?KzRDbkM2cGlTcmRZMnJRSHhGeVFwOUFLOVJwSWt3K1VYQXdlMFg5dzl4OXVy?=
 =?utf-8?B?L3RWQ0owMEg2Vy9SckZTNEJaOW1PTnN0ZjNTRWZBb1dVUFFpa3ZrVFNPMDk4?=
 =?utf-8?B?ZlExYkcrdjc2NkUrVmQ2VzVaN29tV0lmUGczbFIybUJDNGNlUzl4MjVOMVYr?=
 =?utf-8?B?N1ZRTklhNkk1bGdXV3FZcFozdDVuRjNGaHhQSytPNFhjRkRVZjhFQitCdkVr?=
 =?utf-8?B?T2tvT3NBcEVkR0s0UW16b3hVb2RLWHEyOHNNR3N1YlRBcFhCUHZ0L2RWalM0?=
 =?utf-8?B?QnZQK0hGYk5JWnYyVnpJVUo4Ri9HQSt4djZkcVZzRjE0VzFiSFdacXRBL3ht?=
 =?utf-8?B?MzUvT3Jva21BTnphZHRUQk11bWZkeGFndUpERlN4c3JVSmJNSWNFRXZHbDRq?=
 =?utf-8?Q?Bq9Ge634wB4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UjJNYjVTYkF6VURiNUt3RVVHR0tnejBpaXhZMWc0Ymc4bjZnYnpKZkdVbVVi?=
 =?utf-8?B?S2x5dnVQSFFzeUNrMEtIUlh3OWlVMWsrdFJQTlhSQllDU2JqNjB5U2RpTERY?=
 =?utf-8?B?WEhJTm5hR3NVdDdDWWpHaXdmV2tzYlp4UjdlcGdFL3loMVFINWNmUXF1VU83?=
 =?utf-8?B?RHg5SHV2Um03bnJZcUtUZ0xEL3J3c2pBK21kUVAvZ1NuZDNjbzV2RFlGTS85?=
 =?utf-8?B?anJONGw3V3lwWlRKaUhYUnM0WmpkTkJFcGlrMW1BQUNialZrUS9Lemt5ejRR?=
 =?utf-8?B?eVBLdDZUL3J4K0pYdE05TTFRUi83MzZVUFhacDBIUm11MTA3TnY0S0k1YTZ5?=
 =?utf-8?B?QWRRQkorbnVMM3c5ejB2RnVNRmIyNTMzVzh5eFN4SFR3Vm5SKzJmYmM3VTdI?=
 =?utf-8?B?UG5ycmpXTnYzMzhZZkhEKzJXa0psSUY1cEs1Rm8raEVFZG0wUS9rOG1IcjJa?=
 =?utf-8?B?djFHaXBuS1NjKzFRL3A4Q0NJZFkyQno4a3oraDRwWTJNRi9sNHl4VmZnbTVO?=
 =?utf-8?B?TnVNN215eDd4aXBNKzRvWkV5eS9BQUZwZmV3M2lkUmY1S0dRZllyNjBLekJT?=
 =?utf-8?B?MkZ1OGRMU2t4ZWRqdnE2Nys4V1VNanJPaUJvN3prdjNIMkNHRWFLMjdERjlX?=
 =?utf-8?B?K2p1bS9oWElZYk1YRksvbmQ4MzFZZGE2eUpBZlU4T0U3N1k3cXdVZHE5MWRB?=
 =?utf-8?B?SjlaT1phTzNDVkg5TDg5bmRHeXhjZ01iT3hQbnI0UFFlUVNXN0tmNXg2WFh5?=
 =?utf-8?B?SGIxUjVuQmxIRHd6R3h5TGcwNGo0QytsTXpkWG1wTTZVQ3ozbVlVcXhEY01z?=
 =?utf-8?B?UW03TXE4cUVHTUV6eWszMFJaRDZmcExwc1JrbWFnTEc1Rk1EekdSeEhSQ2Qr?=
 =?utf-8?B?QnlRa2V2Z1JrdmZRMkNST2N4Wjg4MTRyMU1JaTdTdG5DZ0h0b1E1SU5pbm1J?=
 =?utf-8?B?ODRkdEJ3L203cVJmSjBqeUQwSXNJd2dlZnBKNHlmN25ZZW1ZelpxOGN1Y0Ro?=
 =?utf-8?B?Qm1UOVVMVlJua2hxTmRMNGFaeThYODZMMkZ0UzJVc0F3RXZia1lQbkZiOTdi?=
 =?utf-8?B?aGx4RmhONDYvTFJqVGlnM3gzODRmNU0xdEJiQU1HbDZSaDU0RmVSV2FYWmNU?=
 =?utf-8?B?TFJoZEhFL3dSN3hPTFJaeWQ1UDRoTUlzeEVXK0wwelNTQ1ZYWkF0M3g5Nndh?=
 =?utf-8?B?bk5ZcXZ3UFFTSjE3SDM3dEs2aTFVOEtTQUkwZnhDdUNUSTZZS1JFQUExTmV0?=
 =?utf-8?B?b1YxTjFhdXlTUTZTZ2RWV2JmZkFRSi9DR2tlVmlJb0FGdStLSUhnU1BseTBl?=
 =?utf-8?B?N2IyRzBaSWtnOE4yMHk2Wld3NkJHVUpTUlJTdGZ0eDZCTkVuc3UyZWw2SDV5?=
 =?utf-8?B?WTFQanhEczFCRG5wcVhTUWM3K29QMERuYWlmWkpyUUxJcWs2NlJnbGk1S01w?=
 =?utf-8?B?VjZWWXZmZXB0SjRmMHQ1YnpraUFQRVRCbTFkV09HcHVZSkpjZDZ3L3ViNUx6?=
 =?utf-8?B?V2VialRsRGJXenFCUm5pNHlSYkNxV1RZSUp5OVpCRm1hMUc1WDNRNVdnckww?=
 =?utf-8?B?ZVdkSE9VbUN1Z2RXdFo3TXhmV2JCYk5JRmJqK3pkaFJ4dFAxbVRHd0FzVEls?=
 =?utf-8?B?dkszalBrUFd1b3FuVmcyeXJVNTVScldKMDlUNzdhVm1FZkJadkFZT3RITDFw?=
 =?utf-8?B?b1pqODRIRUlUWUpIT2Q0RUJvVUZ1WFNxMXRlT0xCTmhXTktlenkyOWIyMEdp?=
 =?utf-8?B?YWFtVXpXOWNtOEZXZitFSVNlMGxyaC9leng4eFFpUzlDcXlnNkpHNCtkSGdH?=
 =?utf-8?B?OFZtV0ttdGY0WTZ1WUUxdEx6M0o1V1ZNdWY5SEhMTmZuVFAzejNlZHh6aENs?=
 =?utf-8?B?aUM4MmlrN0w1b3QrQ3RwdGNkQWNxQTFkS2VvSzRUS0hYY05EOGxsTXNGdExL?=
 =?utf-8?B?aTlROGdxblpEYUJsaGxFVVhDeUU2dkI4YTRGVHRRVnFndVBOb1l1Ym1hT2RT?=
 =?utf-8?B?VWxHYWNHcXdiTG5TREUxSExuajdRdXZaWXdrcG9aVVA1Z2E2K1FKOFFrSmZH?=
 =?utf-8?B?RjBwN0tWckhraGJXM0k5ZHZaUzdycWNxeWcvbi91Zjc0d1RPQXdSd04wOC9p?=
 =?utf-8?Q?1lYwQDjelyoXCtdsixm2wh0tk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q9UghRbC5C1wZTgh2dMW2bL1isue2RqIH1OKeXGtCuPtKDx1BE/mA6x2XUa7ktQlG6uBiIst+shbVO33oIPoAu7k9yIVz0QPgVIczkgrr0w6Qm+StU+2HqOoogUn2d/xO8IwUQNrwaiKIICkoNnc2ooOI+ChfmrGtV7Kn7ql0Co8kZzlXJAgxDMmvg9bGNvAqojJdZ+Zc23gUi45ej/x5j/A8i7Sh5Oq0APJczvP6SOVR++ycHhDtUV2zOfqVLRRm2UTvTmzVy67NuOlUGAIYwUIY3RqLA2UrT05b/0wQ6j6/3dU+mSnvbGjbuT2MOE0Zmh+kGQLqBalvNaSUnqtqzlu4AphbN/LFYiYwsdOp78u2djZmL/uqEFcloEHjmLt847JAqtUHrnulxW/RFB2n50t+M5HFdm8BLJKrmqkpVu7vCTAPQoyj4djUTz1J4IX2uqMaF6tyhCUlCRVnbEY4By6kWUGtDn8WMpNU10zaz69laMzEBxKbqjB7WqME32fAy6TMLSwxkV7dA0puZhs7NARAJz6DOSJhLRA5SxkIjSwKMThHTShPc4UKJAxMEe75garzxcfE3dyEMVNmG451k+1VLd7A13q3RisazI94d2BeLYYepMcsWFkwZI3TZS/
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13db1901-b916-4701-b756-08dd71929244
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 03:00:48.9254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rp67o/lQsADUHv+MRCrZZTOJiOE91E+6uetTl+08KJSRLK84Kh9v+ilxquYoPZxet6Us94Mun+mbizNYSN4IGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 03:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214168

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aSB2aWENCj4gbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDIsIDIwMjUgMTA6MDQgQU0NCj4g
VG86IFJpY2hhcmQgUHVyZGllIDxycHVyZGllQHJwc3lzLm5ldD47IG1hdGhpZXUuZHVib2lzLWJy
aWFuZEBib290bGluLmNvbTsNCj4gSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5j
b20+DQo+IENjOiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPjsNCj4gb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQYXRjaCB2MyAwMS8xMF0gZ3N0LWRldnRvb2xzOiB1cGdyYWRlIDEuMjQuMTIgLT4gMS4y
Ni4wDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSA8cnB1cmRpZUBycHN5cy5uZXQ+DQo+ID4gU2VudDogVHVlc2RheSwg
QXByaWwgMSwgMjAyNSA2OjU4IFBNDQo+ID4gVG86IG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290
bGluLmNvbTsgTGVpLCBNYW9odWkv6Zu3IOiMguaFpw0KPiA+IDxsZWltYW9odWlAZnVqaXRzdS5j
b20+OyBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4NCj4gPiBDYzogQW51
aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT47DQo+ID4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BhdGNo
IHYzIDAxLzEwXSBnc3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNC4xMg0KPiA+IC0+IDEuMjYuMA0K
PiA+DQo+ID4gT24gTW9uLCAyMDI1LTAzLTMxIGF0IDExOjQ1ICswMjAwLCBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQgdmlhDQo+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiA+IE9u
IE1vbiBNYXIgMzEsIDIwMjUgYXQgMTE6NDAgQU0gQ0VTVCwgTWF0aGlldSBEdWJvaXMtQnJpYW5k
IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24gTWFyIDMxLCAyMDI1IGF0IDg6NDggQU0gQ0VTVCwgbGVp
bWFvaHVpIHZpYQ0KPiA+ID4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+ID4g
PiA+IERpc2FibGUgbmV3IG1lc29uIG9wdGlvbiBkb3RzX3ZpZXdlcg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0K
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPg0KPiA+ID4gPiBIaSBMZWksDQo+ID4gPiA+DQo+ID4gPiA+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gPiA+ID4NCj4gPiA+ID4gSXQgbG9va3MgbGlrZSB3
ZSBnZXQgc29tZSBuZXcgcHRlc3QgaXNzdWVzIG9uIGdzdHJlYW1lciB3aGVuDQo+ID4gPiA+IGJ1
aWxkaW5nIG9uIHRoZSBhdXRvYnVpbGRlcjoNCj4gPiA+ID4NCj4gPiA+ID4gRmFpbGVkIHB0ZXN0
czoNCj4gPiA+ID4geydnc3RyZWFtZXIxLjAnOiBbJ2dzdHJlYW1lci9lbGVtZW50c19xdWV1ZS50
ZXN0J119DQo+ID4gPiA+DQo+ID4gPiA+IE1vcmUgZGV0YWlscyBhYm91dCB0aGUgcHRlc3RzIGZh
aWx1cmVzIGNhbiBiZSBzZWVuIGhlcmU6DQo+ID4gPiA+DQo+ID4gPiA+IGh0dHBzOi8vdmFsa3ly
aWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjUwMzMxLTUyL3Rlc3RyZXN1bHRzLw0KPiA+
ID4gPiBxZSBtdXg4Ni02NC1wdGVzdC9jb3JlLWltYWdlLXB0ZXN0LWdzdHJlYW1lcjEuMC8NCj4g
PiA+ID4NCj4gPiA+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVzZSBmYWlsdXJlcyBwbGVh
c2U/DQo+ID4gPg0KPiA+ID4gSXQgYWxzbyBsb29rcyBsaWtlIHdlIGdldCBhIGJ1aWxkaW5nIGVy
cm9yLCBJJ20gbm90IHN1cmUgd2h5IGl0IG9ubHkNCj4gPiA+IGhhcHBlbnMgb24gc29tZSBwbGF0
Zm9ybXM6DQo+ID4gPg0KPiA+ID4gRVJST1I6IGdzdHJlYW1lcjEuMC0xLjI2LjAtcjAgZG9fY29t
cGlsZTogRXhlY3V0aW9uIG9mDQo+ID4gPiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3Fl
bXVhcm12NS9idWlsZC9idWlsZC90bXAvd29yay9hcm12NWUtDQo+ID4gPiBwb2t5LWxpbnV4LWdu
dWVhYmkvZ3N0cmVhbWVyMS4wLzEuMjYuMC90ZW1wL3J1bi5kb19jb21waWxlLjk5ODk2Jw0KPiA+
ID4gZmFpbGVkIHdpdGggZXhpdCBjb2RlIDENCj4gPiA+IC4uLg0KPiA+ID4gPg0KPiA+DQo+IC9z
cnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11YXJtdjUvYnVpbGQvYnVpbGQvdG1wL3dvcmsv
YXJtdjVlLXBva3kNCj4gPiAtbGludXgtZ251ZWFiaS9nc3RyZWFtZXIxLjAvMS4yNi4wL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1wDQo+ID4gb2t5LWxpDQo+ID4gbnV4LWdudWVh
YmkvLi4vLi4vbGliZXhlYy9hcm0tcG9reS1saW51eC1nbnVlYWJpL2djYy9hcm0tcG9reS1saW51
eC1nbg0KPiA+IHVlYWJpDQo+ID4gLzE0LjIuMC9sZDogZ3N0L2xpYmdzdHJlYW1lci0xLjAuc28u
MC4yNjAwLjAucC9nc3RidWZmZXIuYy5vOiBpbg0KPiA+IGZ1bmN0aW9uDQo+ID4gYGdzdF9hdG9t
aWNfaW50NjRfaW5jJzoNCj4gPiA+ID4gL3Vzci9zcmMvZGVidWcvZ3N0cmVhbWVyMS4wLzEuMjYu
MC9nc3QvZ3N0YnVmZmVyLmM6MTgwOigudGV4dCsweDM4DQo+ID4gPiA+IGMNCj4gPiA+ID4gOCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2ZldGNoX2FkZF84Jw0KPiA+ID4gPiBj
b2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMNCj4gPiA+DQo+ID4gPiBo
dHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy84
MC9idWlsZHMvMQ0KPiA+ID4gMjENCj4gPiA+IDYNCj4gPiA+DQo+ID4NCj4gPiBUaGlzIGFsc28g
cGFzc2VkIGluIG15IHRlc3Rpbmcgc28gSSdtIGEgYml0IHdvcnJpZWQgYWJvdXQgdGhpcy4gV2Un
bGwNCj4gPiBsaWtlbHkgbm93IGhhdmUgdmFsaWQgc3N0YXRlLCBqdXN0IHRvIGNvbXBsaWNhdGUg
dGhpcy4NCj4gDQo+IEkgbm90aWNlZCB0aGlzIGlzc3VlIHJlcHJvZHVjZWQgYWdhaW4gaW4gYnVp
bGQNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvODAvYnVpbGRzLzEyMjQNCj4gDQo+IFNpbmNlIEkgZG9uJ3Qga25vdyBob3cgdG8gcmVw
cm9kdWNlIHRoaXMgaXNzdWUsIGFueSBzdWdnZXN0aW9ucyBub3c/DQoNCkkgaGF2ZSBjcmVhdGVk
IGEgaXNzdWUgaW4gdXBzdHJlYW0NCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyLy0vaXNzdWVzLzQzMzgNCg0KSSBhbHNvIG5vdGljZWQgc2ltaWxhciBp
c3N1ZSBpbiBvdGhlciBjb21tdW5pdGllcywgaG9wZSB0aGlzIHdpbGwgaGVscA0KaHR0cHM6Ly9n
aXRodWIuY29tL05peE9TL25peC9wdWxsLzMxMTQvZmlsZXMNCmh0dHBzOi8vZ2l0aHViLmNvbS9t
YXR0aGV3YmF1ZXIvbml4L2NvbW1pdC83NGI0NzM3ZDhmMGUxOTIyZWY1MzE0YTE1ODI3MWFjZjgx
Y2Q3OWY4DQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0K

