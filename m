Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7BCC369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:12:27 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.22933.1745741545326406424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=NPRpAOeO;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745741545; x=1777277545;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Kci6nS1g3j/yKjzdeswgH9d1/epeS2md6YpiMuP60Ys=;
  b=NPRpAOeOx+DT+FhuG/CSCAS11yYlQ8Pcha0im6Sdjtf8B000E/YB4sz3
   NrE1aGD9QO8dNczF4wc9/9Lf8R7del+M6KohBZwc68tn7WGthWu9wQF4D
   kHNk7JyqNI0aC2fGyNbVuBvvTn3mpSn9d+rq//D7Qh1NOqQB89K+ldcfz
   RDtjrsxd82zo0E9p6+EXIPt++txIA5yC8ImGZzuyaBrIQ9vpUUcRoZ4z5
   9t39YcCc7sV71lycNYdqJgWWl0306HypgS8zO5/MT9olN7buDm7AtUowW
   pBGUY8ofMi0/RJiHVy4Y/DS+OOe0qae95hUz6c+lhOO5o24Y3pv2rzi4j
   w==;
X-CSE-ConnectionGUID: +FSJzx2mQFC5Gai7nGkwJA==
X-CSE-MsgGUID: MsVtii/JTLqG6BCFbXw1Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="65288419"
X-IronPort-AV: E=Sophos;i="6.15,243,1739804400"; 
   d="scan'208";a="65288419"
Received: from mail-japanwestazlp17010001.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.1])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 17:12:21 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7L13AXebnUSwwwGqxj5leGZ+2K23jTCIfhCWmlgxsHg1WANJCm8pGUoL0qxJGUfzo1Y1Evvqoi/INbfOWTLjpAGAyYC3fsFKUWxwfgsToa17Pqe9JULwNvXTNnU2bTxohaWQw/VUyyEsoekx0p0+UFjULK7CPQ9iRQFFwPOMvKfEuK2W5hyv22f9TpaYSx64OMwLvtuAlhDuh751elAtx04BRPkaYizb7YUPnhKrtGJALfNbCsGzFEO9Nzesx9aNYiUKwNT0tAE/se6YpwPp/zhGLUciVE/C8vBC1dGUOtoZmcynb3SNUMKlGH2+F0Vo0qCwdRvw9FKZBeGSXV8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kci6nS1g3j/yKjzdeswgH9d1/epeS2md6YpiMuP60Ys=;
 b=goPDkK9dU0c0D1ZivN27RLOlBmuMA6P6I5SmZBLZFB/nR0DwkA7IGS9E9JPjPpu2DNniJLsUB0tA9NmuQZLZ9BYahkAytfcTIS6Q1tQLwj/O/gJH0LvGwDKIRQ8OX5nuChsI7tQAipLNg6IAyk0S5azfNRiGEs/ow3Bhs6rJ4f+794Q8agYBL+VySdGLP9p7Pz9RtnKTEsOLg/R0fCUEh/IpVNeKSEybt3OZV3BKMIwZS4ncQVlQTfiVHBdcrxmkvkpHpEEGrUa2qRNLs1T1IQXCV5uQdfSJwkdSxTgwBf/gBxB38fSO8bYoKOutpztw6OyXxRpwVRahAxrF8YkdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TY7PR01MB16024.jpnprd01.prod.outlook.com
 (2603:1096:405:2a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 08:12:13 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 08:12:13 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?UkU6IOWbnuWkjTogW09FLWNvcmVdIFtQQVRDSF0gZ3ppcDogdXBncmFkZSAx?=
 =?utf-8?Q?.13_->_1.14?=
Thread-Topic: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBnemlwOiB1cGdyYWRlIDEuMTMg?=
 =?utf-8?Q?->_1.14?=
Thread-Index: AQHbs5rA1x12pWUPQ0GMaF72EP0tTrOwmFWwgAIL4gCABIt5EA==
Date: Sun, 27 Apr 2025 08:12:12 +0000
Message-ID: 
 <OSRPR01MB11597AD42F2247E09B46F949B9B862@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250417102130.800-1-leimaohui@fujitsu.com>
	 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
	 <OSRPR01MB11597271B174135C69A00BCAE9BBA2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <65e531299bccf821eafb9bd889edeefa7a77a0c6.camel@linuxfoundation.org>
In-Reply-To: 
 <65e531299bccf821eafb9bd889edeefa7a77a0c6.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MTA1ZDZiYTAtMmQyNS00MDA2LTljMTgtOWM4Zjc5MDAw?=
 =?utf-8?B?OWIwO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTI3VDA4OjA3OjQ1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TY7PR01MB16024:EE_
x-ms-office365-filtering-correlation-id: eccc098e-9939-4baa-8781-08dd8563370b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cHh1L0NaYTIwREtxQjA3a0REcUNSaEoyelBhN1o2ZHpsd2Fhc0tEcW95L292?=
 =?utf-8?B?TUYvS0o3NDB5emFpNTAyS2lGMGZzV3FSbWZqSk11Nk5QeFhOU1FxUkc4QWty?=
 =?utf-8?B?K1hEVExuMW5jb05jM0J5ZDNEbW5MaWt6S1VtSVZoelpLUTFvUGc0MHhqWW1r?=
 =?utf-8?B?eDdFc21QSWlaVUYzdkhYSnd6cjBwdkY5WDZYcVhnRit5V0RGb01uMkhCaUIr?=
 =?utf-8?B?WmZmN2lDWUhRb3pUUW9sWHZWTi83MVlvU3VwZFpOQ3lUYXpHcFBVSkhmZldr?=
 =?utf-8?B?aTU2MFFOYktEWVZUNHdBVUVjODFDTitUdzhRQ1hMZUVBeWlDWVVZdGppcUVo?=
 =?utf-8?B?R0xlQmkxTXhlc0Rmb3B3THFTOEQvTll4QnA0SXQ3UVFJbnRNSFl5SXJCNmls?=
 =?utf-8?B?alEzd1dvQlFleElBN1doN0grWlIzZTMvR0lEK21Ob3ROTUtIMUpCSGNWdGZn?=
 =?utf-8?B?RkZYOUFJZE15ajhjWUpaVkN4Y2g3dURYbWVxQUhVMFV5QWN4OCsycEhidEFG?=
 =?utf-8?B?M3hVNzQzdkhJY1d5aVRpTysvL3Q2WVJ4SERIU1BPV1NidE8waGFHN1JqKzJD?=
 =?utf-8?B?THlmNGZsY1FYdmVlWWYwTGN3U2V0VVV0SGxVeWN0LzZuNUNYK2U3T0pOUHNl?=
 =?utf-8?B?Z3ZmVGNCZW1vbXN3bHNRYldxcEFJSytIZHNLMjBiZ3R4dTNTSEw3amdNRTB0?=
 =?utf-8?B?RzJKVEw3VmJvN1lZVUtCN2h5MlRtTEZDMFNMWGJ4eE1YZTY0TVpTZXg2a1VC?=
 =?utf-8?B?d3RZSXhmalBobzhXYXoxZzVWTTNSRUhhTzZQWUhYWWMwYUpMOFExZUdoTDVa?=
 =?utf-8?B?OU8xeXBibm9oVTlISFZ6THpzYmlIN1NIQk82TjFGWDhVemVIU2VFSFpnbWlM?=
 =?utf-8?B?cm5iWUhFaVE1dk5zMDdFems0WGppdlVzQ3F4bUN1YUVGeGVXSGg1bHhMMEdh?=
 =?utf-8?B?OEsvY2xBcHYwNmNMUnI2OUI3Z2ZtcGRXR0pJVkJZQmdha2IyclkyS1lwVVNs?=
 =?utf-8?B?TDcvRy9paDlpRkxvNEZlRndaVTd3eDJBbWVYc2lrWWhNbStVV2xKd2dLaU0x?=
 =?utf-8?B?anV1ajN3ZGRycHBicFJPYnFhYTh4V1lyY2tMdDJmTXFwU09vZmE5aEZIejl2?=
 =?utf-8?B?dExYYk1kMWM1aERJeGtzM1pJUjFhVGhBNWxQWllLYVhLZlMxTHJKV25Td2tP?=
 =?utf-8?B?TURBQTZjYmJyanBXMGlxK2p2c0xNdVYyUnFON1FLTUcxdmlYUkt4UXJMNmhZ?=
 =?utf-8?B?RFdDVTZUWXVGTkZYUW9XSHhhSTd0cTBFd0ZiTFZsV0EzdnNLazZnWTIwT3po?=
 =?utf-8?B?Wk5XdUxrQWRwZzNQeVAxWVYwbXhWNklTTkIxR3pPUVpack9LWGNsSnJwVElk?=
 =?utf-8?B?OEVjOGVNZEZ2aEZKdGY1bEpFQmJxM0xYdXkwekxldng1aXZqczAzUVYxTi9C?=
 =?utf-8?B?WldGN0M1dFRFMm05QS9VRzU4c1hsNXJ3MUVkaVl5Z0RsK0YxTHoyaldJNnJ3?=
 =?utf-8?B?cjFWRHRJSUFNV0g1Tjd4STRVLzFnR05tTlJzaEM0b1BFcGs1ZEp0cENkdTZZ?=
 =?utf-8?B?UjlhbTFvYlJ1R0FqWnZaQmk1QytURmdvT3RnSTB5Y0dqdkVGSDkrVFlzYmdQ?=
 =?utf-8?B?Zy9rZnFERUN1UGtUNFh5TVpZbzVKclI3NUVyL08rK2dkTVFIT01nMlJ5Ykhr?=
 =?utf-8?B?b2FxME9VWTlFQkIvWEVTRHlSNC9FdUxBS0VadzJzckVZSGI3U21uVm8yTTZM?=
 =?utf-8?B?cVRKaTNSYXBKRS9lNWdYcmpUalA2NVo0RlFmaTZNbDJESE1wTGUyNUtLb2c0?=
 =?utf-8?B?aVBJNDhKd2ptRGtTMVd4SEF0MXZTTjB5dnZJVDV2K0pPc3A2SnNNcjZLKytB?=
 =?utf-8?B?MGJnekhUSFRKMlVYck14WkZtZ2RxY3Z4bm1ZTDk2Q2NCaDdGTFBqMm1XZDAz?=
 =?utf-8?B?SGZPYUZKbWF0cGlhc05IYysyVjBVYlhCSnNUQjFrbkNsRU5WdVpKU3l0S0dt?=
 =?utf-8?B?Wk5Hc3hXdTA3SDZuV05EOGRjVkt0U25tbHRacFJjdXI3eXQwUlhDTDA5YnB4?=
 =?utf-8?Q?IYMCsl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emZXNkRpR1Flc3BZRTY0bGxHSmtPdm1Vc3RETzZ1dlBxaFl5TFJkNUJPWmln?=
 =?utf-8?B?aHpCbHZHQ3NIcjNGcVFld3ZBNjRPZEsvRFhOMDZRdVNZMXlXS2ZsTU84QjFE?=
 =?utf-8?B?WENScEFGelNQbXl5L0drSWM5V1ZoQ1FXRFVYb1QwclFHNS9qVzdtRGErWWE3?=
 =?utf-8?B?Q252SFc0ZnB5OUo4RjFhQ25sMzdhbjhnOXFLWCsxU3pJUFc3UHppYVpwUitW?=
 =?utf-8?B?RkpEVkFHWEg4VURoU2NjcnlMZkdZcVdGcUwrV3VPL2xKTkU3RzFyaG43UjRV?=
 =?utf-8?B?ZkZ0cmlGRnplKzlBa0hFdXVrbldTWnJnN1BWWEh5VjdJOHJuV21USG42eWp2?=
 =?utf-8?B?Q1Rjd2sxczQrT1ZPSDVab3VoWFZKWWhLbGpvdGpKanYvZThxVkgremRxYmJm?=
 =?utf-8?B?T2RnTnNCQ1lYV1RkblNpYytTOTBRNzF1dUtIMlFiSVNnT0RodmNnbjF3c1B3?=
 =?utf-8?B?SWxoYkRGSWx2eTZiQlk4SEtseHgwMGpXbXEvT1dBcFJ3SW53MlloTDUyN0cz?=
 =?utf-8?B?NGIxeU1kM1Z4Yi8rMDBJS2N4UzFxN21oQUJybTRwYmpDU0hSSzFqYlo2OHpO?=
 =?utf-8?B?TXdyY25PdXJNeGM0RlBTMUpvcFYvN0VDUGNwNVZYaHlWeXlPaWRMeXNhMXkv?=
 =?utf-8?B?c013dFB6SXM2RGE1SXhlZ1hSNkw2QjVjNW5HS1dlaFZORk1zOVN0Um5TWHJ4?=
 =?utf-8?B?L1FEcFNDbFk4ZXE3Y0ZTVTNxeVdrbkYyL1k1TU1HR29BSDdKbVJyd0JUeGZi?=
 =?utf-8?B?dTIzRFVFc0QyczJ1SlV0ZnArdTZhYytWUXRSVTIrREMwTVlzU2tYTXZkZ1Z5?=
 =?utf-8?B?Z1grVlVIMFdXcjArcWJSVGlncVdZZzRWallnZDFBcjdWUC9WTXMyS1UyUVBp?=
 =?utf-8?B?a1lwRFErcFk2REdTbDVDRktyKzdHc1F4Q21NNis5c2xIeldoYURZWEdnbVBo?=
 =?utf-8?B?VnZTVDFFMlhSSUFGYVVidmVkeTFiTkFMZ29qSU1WMVl0Q3RxMmVBY0ZYWmpW?=
 =?utf-8?B?dWFiNzdFTUpyOU5pdnRUNk4yeUcrSGxEWkxJR2htcUx0SHZhMExTL2tsZ2Ni?=
 =?utf-8?B?L2thL2V0WkFNYWVKK3BXYlZjKzFCUEFac21FVHREMGpmd3VycURMdFl6eTVY?=
 =?utf-8?B?SUxnMmpGY1hSdDVwb2Y3dEhOWTF3UG9qUUZrM2ZwK3VvNThGcVpyMEpQRmxG?=
 =?utf-8?B?Y3lYSVBseXYycXNoaGZjUnhORURGeFpBVExlM2xWQXFZNHJaek10WU4zL1Ir?=
 =?utf-8?B?eVEyM292UDdadmR1elhkejdNbFQrdXUrNzd4d0FQYk1VOVhUamNEY3BKei94?=
 =?utf-8?B?cjBrc0o3SHpLNGdxb3R6RG1aZm84VTROU09RSW1ORWpFR2Y1TlQxY3lHV0FD?=
 =?utf-8?B?T1p4djM3Tk10T2d5V2lrRG0rWXB1VnBrZ1d1Mzc2U2FJVk1QYjFMaUhNRFpM?=
 =?utf-8?B?WitiNUsxY29qdjZ3VmRvaTl0VmxuMVcxWS9BVTZnMFI2NkFxemtYYU5lRHo5?=
 =?utf-8?B?S05RdWhuek4rQXB6d3pKVzlUZVgxMk1KcUFmRTJtTFdwRTBJYWtIMSt5dG9B?=
 =?utf-8?B?WVpEOXc1YXdrQllRMHFQZU5zTG1SSzJzaUFyZkIzbHFDRGM3TXFlWG80N2JN?=
 =?utf-8?B?NENiWkUvQUp5dmdtR2h2aUR1cHdFOWFGOHRlTmFSYUs2NjdXUE4vaUlDaEdI?=
 =?utf-8?B?d2JxYzdKMGpRRGlkRm8vNm9Ea2NWU1ZnQVh2SUd2S2pjYmMwK1hkZm1XM08w?=
 =?utf-8?B?SlF4RTRLTWxWakQzQWZBL2FPVHBZWnJ0Q09xMGh4TklncjdCcG03YzZPbk1t?=
 =?utf-8?B?ZTRYaWlnQlFYSGl6aUt0V04rMnRPQUUvU0F2QXBmRThBV1c2ditTRFR6T1lJ?=
 =?utf-8?B?bFVFZ2c1RS9XWkxILzhIUGpmYjVpcmV3VGsweWdBdldrOTErYm4zdDVoMm5Q?=
 =?utf-8?B?OFdmam82YWh4NXozTEsrWGExc3VwM2VQVDArQVpvODBpMUEyMnQwOURLc3dz?=
 =?utf-8?B?aXBqL1phakVJNmhGYzZWMjhmOXQ0SkZBNzcxVEFTZUJnY2tzQUJZTzdkbEtL?=
 =?utf-8?B?eHJZNExBTXAxL1NvOWJQU1FQYXdoZC9aamU5dmY0TVZsbjZmSDEyZ2FxWkpF?=
 =?utf-8?Q?XSxpht2VU8o42zxVS2GR25hmj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ixosLkL9rbiTXphBWlEIDyfPv/4Ny5BkTkNdM5pCyzOoZ2gm4ivxpcjFW78ViccNqKy42jnZ4x9jmRZI4XCTbuZUvE9uEf4kBOyZuSi14QmhZ+2fz0KkuUM5kq3BZnlsFjrXuwDmET080GmklzjiDeKs+5aDn2+Rgihanuyd/EQWrKqZP5SUjraj9PxxUFXNzifz5Yaqw2T2J/Z0N/UHJDpgP03eyoVNUVI8sMdKVsrEub1iPbKSIL0tzw0D5T/mRbV8Kfu66vqpkVfuykmhUqdDzSr72qoJtIx5fgH9HyUAcs4PUp5QrBhIZflurlUjHhiNfJx0GwN2KO4EIjjNaNxA5GSRpMsXMAEIcXKGvCGx2WgcFELRhxB4uPrV3QY0LTUmMtV2ytV86XwxVYtk8K8b/9hvwWVEnVjMm2uftCz0asMAWmE0f3/eEm5u4c1g/R4n1AuXAaffBIOnKcKzOKWo8IvjNN9UIJBv5aTdoduMQRl+rQ2Rjxr6tg0697OnLAVqEnH8LyB0kSwYD25/N6GGXWbNvDqlU1Ee8kY60r9weWGDfht3uy1CCT3lmSoGuckge34/nEWBXDjaQWmFXTqH8krD/Nsawa8MrVIHGyWNQaHrDssKynR6sTvRL7T1
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccc098e-9939-4baa-8781-08dd8563370b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2025 08:12:12.7792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OL1CDInMQ0/VqB886xxUD3QLxQbGUKOcsa3k7ubTq/BASZyRzJQqPKLGf4gfFnf+5K50UBG8DRS4Pm3RiUsNaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215545

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IDIwMjXlubQ05pyI
MjTml6UgMTg6NDMNCj4gVG86IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVq
aXRzdS5jb20+OyBhbGV4LmthbmF2aW5AZ21haWwuY29tOw0KPiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBDYzogRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9yZz47DQo+
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IOWbnuWkjTogW09FLWNvcmVdIFtQQVRDSF0gZ3ppcDogdXBncmFkZSAxLjEzIC0+IDEuMTQNCj4g
DQo+IE9uIFdlZCwgMjAyNS0wNC0yMyBhdCAwMzo1MyArMDAwMCwgWWlkaW5nIExpdSAoRnVqaXRz
dSkgd3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiA+ID4g
5Y+R5Lu25Lq6OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4g
PiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g5Luj6KGoIEFsZXhh
bmRlciBLYW5hdmluDQo+IHZpYQ0KPiA+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4g
5Y+R6YCB5pe26Ze0OiAyMDI15bm0NOaciDIy5pelIDIzOjI1DQo+ID4gPiDmlLbku7bkuro6IExl
aSwgTWFvaHVpL+mbtyDojILmhacgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+IOaKhOmA
gTogRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9yZz47DQo+ID4gPiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiDkuLvpopg6IFJlOiBbT0UtY29y
ZV0gW1BBVENIXSBnemlwOiB1cGdyYWRlIDEuMTMgLT4gMS4xNA0KPiA+ID4NCj4gPiA+IE9uIFRo
dSwgMTcgQXByIDIwMjUgYXQgMTI6MjEsIGxlaW1hb2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+ID4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gPiA+ID4gK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHMvcmVmZXJlbmNlOiBmaXgg
aW52YWxpZCBvcHRpb24gb2Ygb2QgaXNzdWUNCj4gPiA+ID4gKw0KPiA+ID4gPiArcHRlc3QgaXNz
dWU6DQo+ID4gPiA+ICt8IG9kOiBpbnZhbGlkIG9wdGlvbiAtLSAnQScNCj4gPiA+ID4gK3wgQnVz
eUJveCB2MS4zNy4wICgpIG11bHRpLWNhbGwgYmluYXJ5Lg0KPiA+ID4NCj4gPiA+IEluc3RlYWQg
b2Ygd29ya2luZyBhcm91bmQgYnVzeWJveCBvZCBsaW1pdGF0aW9ucyB3aXRoIGEgcGF0Y2gsIHB0
ZXN0DQo+ID4gPiBwYWNrYWdlIHNob3VsZCByZGVwZW5kIG9uIGNvcmV1dGlscyB0byBwdWxsIGlu
IHRoZSByZWFsIG9yaWdpbmFsIG9kLg0KPiA+IEkgd2lsbCBjb250aW51ZSB0aGlzIHBhdGNoIG9u
IGJlaGFsZiBvZiBteSBjb2xsZWFndWUNCj4gPg0KPiA+IFRoYW5rIHlvdSwgSSBrbm93IGFkZCBy
ZGVwZW5kIG9uIGNvcmV1dGlscyBpcyB0aGUgdXN1YWwgYXBwcm9hY2ggdGFrZW4gYnkNCj4gb2Ut
Y29yZSBmb3Igc3VjaCBjYXNlcy4NCj4gPiBCdXQgaGF2ZSB5b3Ugbm90aWNlZCB0aGF0IGd6aXAg
c291cmNlIGNvZGUgcmVjb21tZW5kZWQgdG8gdXNlIHBlcmwgaW5zdGVhZCBvZg0KPiAib2QiIGlm
ICIgSWYgdXNpbmcgIm9kIg0KPiA+IGlzIG5vdCBwb3J0YWJsZSBlbm91Z2giIHJpZ2h0IGJlZm9y
ZSB0aGUgZXJyb3IgcG9pbnQNCj4gPg0KPiA+DQo+ID4gJCB2aSBnemlwLTEuMTQvIHRlc3RzL3Jl
ZmVyZW5jZQ0KPiA+IDQyICMgRW5zdXJlIHRoYXQgY29tcHJlc3NpbmcgdGhlc2Ugc2ltcGxlIHN0
cmluZ3MgYWx3YXlzIHByb2R1Y2VzIHRoZSBzYW1lDQo+IGJ5dGVzLg0KPiA+IDQzICMgSWYgdXNp
bmcgIm9kIiBpcyBub3QgcG9ydGFibGUgZW5vdWdoLCBjb25zaWRlciB1c2luZyB0aGlzOg0KPiA+
IDQ0ICMgcGVybCAtbmUgJ3ByaW50ZiAiJTAyeCAiLCBvcmQoJF8pIGZvciBzcGxpdCAvLycNCj4g
DQo+IEl0IGlzIGEgbWFpbnRhaW5hYmlsaXR5IHF1ZXN0aW9uLiBJcyBjYXJyeWluZyBhIHBhdGNo
IGRvaW5nIHRoaXMgd29ydGggdGhlIGVmZm9ydCBvZg0KPiBkb2luZyBzbz8gSXQgYWRkcyBtYWlu
dGVuYW5jZSBvdmVyaGVhZCBmb3IgdXMgYW5kIEknbSBub3Qgc3VyZSB3ZSBnYWluIGFueQ0KPiBz
aWduaWZpY2FudCBiZW5lZml0cyBmcm9tIGl0Lg0KPiANCj4gSSB0aGluayBJJ2QgcHJlZmVyIGp1
c3QgdG8gYWRkIGEgcHRlc3QgcGFja2FnZSBzcGVjaWZpYyBkZXBlbmRlbmN5IG9uIGNvcmV1dGls
cw0KPiByYXRoZXIgdGhhbiBjYXJyeWluZyBhIHBhdGNoIHdlIGNvdWxkIG5ldmVyIHVwc3RyZWFt
LiBXZSBzaG91bGQgYWRkIGENCj4gY29tbWVudCBhYm91dCB3aHkgaXQgaXMgbmVlZGVkLg0KPiAN
Cj4gTWVudGlvbmluZyB0aGUgaXNzdWUgdG8gdXBzdHJlYW0gbWlnaHQgYWJsZSBiZSBoZWxwZnVs
IGFzIHRoZXkgbWlnaHQgY2hhbmdlDQo+IHRoZWlyIHRlc3QgaWYgdGhleSBrbm93IGl0IGRvZXMg
Y2F1c2UgZG93bnN0cmVhbXMgc29tZSBjaGFsbGVuZ2VzLg0KVGhhbmsgeW91DQpQbGVhc2UgcmVm
ZXIgdG8gVjIgcGF0Y2ggYW5kIEkgaGF2ZSByZXBvcnRlZCB0byB1cHN0cmVhbSB0aGF0IHdlIGhh
dmUgbWV0IHRoaXMgaXNzdWUNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

