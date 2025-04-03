Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286C7C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 01:32:17 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web10.3330.1743643928671215520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 18:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=msItXhZp;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743643928; x=1775179928;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aMo+7AIlBDJUFyKkXnYZwnfH9AYLze5LEpeH5NkZNKo=;
  b=msItXhZprxRGlVfaWwEvNo70Z2X9nA5TYUJIj+xVDM9d4d2hb7MSEaKG
   4E13uXMLlS61KTtPFfptlyai1qjOnx2aeYQN9RedAeSRGqgp7pcQrB6e8
   1Iu0BdKD42Dv4WzAqcn1JwO8n2cDqSgAD/z97Q9KKR8ZX7Uu0sjkdy1Ra
   +cLN1u4AMPMmGyo03vrCywY3xtvEAmavT+rx/J3gRY1RYEGXsHrfbMz9h
   Kfx9z2ASWPV6hdJfTNgIU2aiBX5Agz/pK4c8Fq8v5SFDMDh99rfW+1SAt
   v3r2DQr7GlWsNzK/ZYJ6ejSiuoay5BUdcDyPVH/+q2WsbVHwVIfRtxll3
   g==;
X-CSE-ConnectionGUID: 6YFEIh4MTnmO48pAQpN+EA==
X-CSE-MsgGUID: 5K/Vqlw7QVSRe+ASvPEdAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="151720936"
X-IronPort-AV: E=Sophos;i="6.15,183,1739804400"; 
   d="scan'208";a="151720936"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 10:32:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyv2ehDxwTJI7WDGseEqgY3wt9q20xSsmPq/tayDsXc1/GDUJEyIUlcLYET9L3OLy+Jn9KH5dzCIhB0xuM8NZC9p3WAqW0AFblX5q5E1XULK+cefyE5bPWBWY2Coc1H+/FAqEiV5wKPO3gCjMDRD8NUJl7zO+7Pv+TzObSJbFPcsSF6bW/YS5Ws0flYsl5ALEKuu7gwne6fSG3oPhkOTKtNNfr2QxDa8S4uTCjMKmCvEbmZaFMB+UZLxzkDt3OuSMLxfY6ypncJPvhlSyo0oZ5LUCsA1hox1a46YoXBV9Z9hsfSPC10pbYaB2vUOgRNt7utdv/Gjj4JZI230C9jW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMo+7AIlBDJUFyKkXnYZwnfH9AYLze5LEpeH5NkZNKo=;
 b=vABzchEw9CGC7ZM4PjA5vDpqwzQjTs0TdzbgW0bFhGpx5fpNP/gegX46tPgsIGjPkyOwYPR+81OTkVfNfKF3+gSe/5nIY+vErLuCvefNHF8/puLiH0eTEsqeCMVKLLuClFAf5G8E6AGqIucUrOtp8jBdidp7PXBE29UaaMnGSHgwg+ui+k4GA3YpLJlsA3wv/n41Dv0+jB7TS3z8lyDvTljZwe7kDby3XY8mlEkZWUNe4+ujLtiExBO3+BBLinPdn+K2njWlJ+kdNLW5fRPEBmEKTWb07wXOC3NY0R+K9oHEfZtt6lu9H5J72YiF61j/AHOloWIUubfX26YqKNz7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 (2603:1096:400:3a7::12) by TYTPR01MB10901.jpnprd01.prod.outlook.com
 (2603:1096:400:39a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 01:31:57 +0000
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::7de5:ed1f:f149:174c]) by TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::7de5:ed1f:f149:174c%6]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 01:31:57 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: Alexander Kanavin <alex@linutronix.de>, Jose Quaresma
	<quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Thread-Topic: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Thread-Index: AQHbo668Ef4/Bm2frkerRB8Kl6F44bOQI6MAgAAB+4CAAAeFYIAACskAgADwxqA=
Date: Thu, 3 Apr 2025 01:31:56 +0000
Message-ID: 
 <TYCPR01MB11055F24D7FE80BA32DB31461A0AE2@TYCPR01MB11055.jpnprd01.prod.outlook.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
	 <20250402090749.2119-2-leimaohui@fujitsu.com>
	 <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
	 <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
	 <TY3PR01MB11056551D94171A6BC8F06F4AA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org>
In-Reply-To: 
 <5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NTllMWYwMTQtNjAyNS00Y2ExLTk0ODYtNDFhY2FlZjkw?=
 =?utf-8?B?NDYyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAzVDAxOjMwOjU1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11055:EE_|TYTPR01MB10901:EE_
x-ms-office365-filtering-correlation-id: b2b327d6-b73f-4278-0b1e-08dd724f5279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SEpIN0VWQWFJMHBzSWRZeUdhdElKOWpYZm1xa1puZWgyU3d2ckFGYVZGTTFB?=
 =?utf-8?B?elEyVmVGcm43TjV5RGNac3FPTVJpb1RKOWNaSHJSWmIrZ2hCeW5nandJQ1h1?=
 =?utf-8?B?b2ZTZjRqb3Y4Yjhpbk51ajdKU3JwQ0IrQnB3OFNneFVEZUFlMkZtaXdkclYv?=
 =?utf-8?B?T2N0SDVqSUZ5ZVNYME5XK1ZYT3hER1gxYWl6UDVKTndOWVRRNXJtSXcySmpo?=
 =?utf-8?B?THh2dExTZU5YMTBlTURJVGZmV1RUUDluTFZyVW45eURzYjgwUkwzMEVCcDUz?=
 =?utf-8?B?aDlHZE1kRzRBcG1TQUw5S2pIYVhHcUgvdm5XTkZORUp6QmdIVmNPTTRUWHk5?=
 =?utf-8?B?UkQ0bkdWbm5tMjBjUGZlN1NBUWlDUGVOYW1WZUExNlRUeGFON21ueVdtVnJP?=
 =?utf-8?B?Z0krSmRod3U4eS9FNmVpQ1I2ZVEzM00wQUhKUWh0MTFUVWhPdGZEMlpocXFW?=
 =?utf-8?B?YTlIMkVjeWcyUVhRYWlaNG1Xb1E2OUhJMS9rZWV2eExvVUlIRjNJZXFzZng2?=
 =?utf-8?B?RjRLMVl0RFNEN2RlaGZyRFVjZS8xRW5kMTB6dUZwc3huWG1jODkxQ1ozUXkz?=
 =?utf-8?B?VDlxM2twOE5UZzZTcEp1VytFSU5NT1VKd1NsRnJSS2p1UWN5cDB3SG5iTGpx?=
 =?utf-8?B?RzVHVStRazdWUGo4TG0vV3BoN0tEVU1yUTQ2RFVMdkozem5DbUF2ZGZHWE9l?=
 =?utf-8?B?UDJqbzVWdUlJaXIvZHZreXo4ZzZyR3JHSjNsZ3pFMmIybmU5amhmdkFiaUpU?=
 =?utf-8?B?N0FjWWpXazhMVW1qbnVYSExFdHo5WmU0UHRCS0hVblk5TFlTbGNLZjJIMTRP?=
 =?utf-8?B?QU1hdklXbnJVTkNKTjJmQ0RGNnYxWTZaajhiR1pINzlWaXk2VkF2c0tqbEF0?=
 =?utf-8?B?MnZ1UlBDRm9XZmlyVXBDcG5yRjZ0clNEU09CcDBBa0JQb3RLbVlpa1ZHbGlP?=
 =?utf-8?B?YU1YYlIrdnh4cDVGQk1jZWpkYnovRENqemQrWTVtMTJ6SUpBT21lODhObm9R?=
 =?utf-8?B?R2NiTElqL0FYZlRXYmErVGVxSGhBMWZmM3JTWGRQZkhSUTBYcEhFdllpSzYz?=
 =?utf-8?B?bURFWDZORkRPOVNjdmhMeW9OdjBWZnRraGgzSGJFSFc1WTJMUGZtSGVZZExw?=
 =?utf-8?B?aVd4QkRTTFI1b0F0YTdTNHBYQ05yejV5cEdsWmVBaWVweEJMUVRVaUhNdjhJ?=
 =?utf-8?B?V2RxVjcrTGRvc3FhWFJlNW5HUGp2UDZrYlRxampxMDBZMnlRa1FlM3R1WGxz?=
 =?utf-8?B?WmxjYnhzLzZrSVRrUWZZWkR1R3BDOXN2WDhEWm8yaXVHWG9xL25jeHZpT1pS?=
 =?utf-8?B?aDBQTWtnNVJ0Rzl4ODZXV2kwVlZBMmVpaEdUcWwwVXgrRG5CSFZLaXpocWRl?=
 =?utf-8?B?cUZpQ2VTUitSaXdTamo3RXdseHNHejRDZWJTc2gyeVlNRUxXcjA0dC9YNGg0?=
 =?utf-8?B?bkhEQ2lGRlRFVzRvS28rRTFsZE83Y290T0hDMkpZZTFCL3Eyc2xTc1BDaG5R?=
 =?utf-8?B?UW1KRFdQWmZUT2s0bUJxT3BvcHV0R1I3L3VFdEVOcHM0SlZDRHJUWE56TW9z?=
 =?utf-8?B?QVY5L0NzY0dqS0htSWtpaHJPbU9Ud2RHMGVXWWlUWFpITndGWFBtalVnYk9G?=
 =?utf-8?B?RU5pSVduUlp1YVdNblk5RUFqaEgvYncyakFsVDB5MUFLcGNZOXdIQ3FjalN2?=
 =?utf-8?B?dHlTUFNnUXlsODBNVkF1N1ZscXNjdElUSmpkaVN4Q0lWdmhreTQrQ3dldXRl?=
 =?utf-8?B?WDd1eUQ4cFpmaVU3OXk1WXdNZzNZT3V1SmZqblk4MUhHSURHZUoydks4R05o?=
 =?utf-8?B?OFV3bzE4RXBhR3o2TlNmN1JkMlV3M3lRaXEvbVM5R0FhakZPcWgrMjkrU3NB?=
 =?utf-8?B?SXRJRG9BWjg1cFRheHFzbnVOTURkOFU0SGdObUczUTVBQmRrSm4vc3hoS0dv?=
 =?utf-8?Q?12QMSyg3PPU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11055.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UzBUcjZvN05ZK3krKzNwajV0UGFtZ2h1c0FybWkrM3ZBSWk2VWZPdG9ZU254?=
 =?utf-8?B?TU1md0xLZ2JoY3hpeGZNQk94WFdiMHVNcW1CZWJDSzlkM1RYTGF3dVdKYkx2?=
 =?utf-8?B?bWdlSDV4L2Nsa0ZLZy9PTEVEcFBJYlBjMHJRay9ja1VEUGdCRnphRld4Uzlh?=
 =?utf-8?B?MzZwNkdoVFNLWGhzWUlCZ0szRDhlVmw1WmtnRUNVU0djVEJjYlFqL0NpTmt6?=
 =?utf-8?B?MnRsZWd6L3p4OVhLWm5KMlRHSEJ6RVNYNTZEQThtT0FWOEl1WURwd2xDT0VL?=
 =?utf-8?B?RDZRWThIZGZjRDhVbm9IV3ErcFJHYlRvRVpXbm42QytoL1c2cXpDWUFsY3NK?=
 =?utf-8?B?UmlGczBEUGVrU29jT2ZubHlSNkpXQyt0ZkdaZmZMd2hKRVlmVkJsaXR5b2VE?=
 =?utf-8?B?ZUlka1dQZ2dzRk85dDdTcEljU0pOdC9xZjNXQXV6WWdhR2p3RTJQcHdTWThV?=
 =?utf-8?B?aG91RHFuL3pZMzFLWFVnUHRvVXl6YXR2dW96RTZKa2NmT1pHNlVCQ0FlQ0RI?=
 =?utf-8?B?ZWNjUDhFb3dKMkNFKzRjT2t5eXNSbVlTYXJHYWtrWkRic0w0NnZROFFPeEdB?=
 =?utf-8?B?MG8xaWF6YVpnUmQ0YUdsZnpJekhocDEyTGxzM1hrTU5OYXdHL3VlWFdnaWJE?=
 =?utf-8?B?VGZVRWpTSE1zY2pZamtVQWRmYzRudTBzZ2QwSnRPbkJwSlFNcFJHSGhLZU8x?=
 =?utf-8?B?cCtvRUoyeWtJUThWL1BoeXJHS1E0NGJSQSt2LzM4b21jdzFJTmJUK2ZOMWxT?=
 =?utf-8?B?T2FEbmk5RytUMW1rSk9jcmFTNWlKYkJrZmpzRXorTTUyT1AxcmNUWTVESzZn?=
 =?utf-8?B?N01kQU1xZm9VWkk0bEIrM2p6TGFldEYxcnYrLzBKc3NuNDVhRGNmSzBJTHhQ?=
 =?utf-8?B?c3g3UEhKb1VNZlgrQWs3eDFxSDdMdkltWWorUlRCeG5pUEZnTnBMYmZIcXZv?=
 =?utf-8?B?a0FnTHlEVFhOVUtpZFhyL1JtOHhBcEt5Sk9GQlRqQ1QzUlp6dkJrbDMzdWYx?=
 =?utf-8?B?T2Z2UGxpdUFmWG9KV2VpbUx4WE9BQStXZWZhcnFtMCtPeXlaRURYTm9FL2Yx?=
 =?utf-8?B?OHBrZkw5TjFGaldKVjdTQWVmUmZjL0xSTjNEL1BvNUllN21LUGpUNzdxejBM?=
 =?utf-8?B?Uk5IQmR1UTYvVWJBNit0RkMxZDZqNTVuMkxCdThlOG5JU1M2WFNydHpSVTlh?=
 =?utf-8?B?Nkw1aExZMkU3ZUFHRXFwVkQ5T2xnVFVWd09RS2FBNUltNTZoWWRvZlZwdHY3?=
 =?utf-8?B?WWlzb0g1bWlQaVBGZG1DWDQzLzZ4TXE3S0RlQk9wTkxXQ3k2UFd4M1RWUEhz?=
 =?utf-8?B?ZGFGcC9UdEhuVWtqRVlNYmhBcjJUNm1SVmlJbDZ3ajU2b0d4OEY1WkVCMXVs?=
 =?utf-8?B?NWZueWI2SUtRa2UwZ2Y4ajA2VzJxLzd1eWhBaVdYc3lRL2IzaUphTnN0cVF4?=
 =?utf-8?B?bExWZkZWbHI2eFJVYStpdHhOcG9lN3FoTWNQQjdXcTZRWnNkMDNhTWNGK1Vq?=
 =?utf-8?B?RFN1K05rK3VVNnkvOFVVYzhjL1Q5QW5BWDZBSStBUFlYZE5XY1hRN1hnT0dt?=
 =?utf-8?B?Y2NhWmd2b2RiZ0dmS0FrdUdKZ1ZkYmFYbHk4T2lvMTRsU2lFclJPSHcrM2dw?=
 =?utf-8?B?R1FOTUR5YzliY0Z1cXdxWWUrVVhOM2pLMkxmZEFQZVRVQnZheHJLVExPN3hk?=
 =?utf-8?B?MnBlMG9raXZYSDh6eFJ2Yzc4R3pTYnFSMTNuRjdFWlc2a3Q3TEMxdUs2anAv?=
 =?utf-8?B?UWlIeGhkaGkzbUpPVFFBZnBUNkEvcFlzN2p0cTlpeTJ1ZThpaStHMjQ4b256?=
 =?utf-8?B?TUlERjRYc0ZhdVpkR0dMNVJ4UTlVWFFpaURibXF5YWsxbDRwaHNCZ0hGbDBS?=
 =?utf-8?B?dG85YmhPeEoxdVc0VTYyazJncXFhakFSRnYwMHhCNXFDWkxydm50Lyt6ZFhJ?=
 =?utf-8?B?eWJFdCt1YUs1ZEVQUWJkbWFkRENudk80ZmFSQ3NnWlVqNk4rTFJaclNCVEZr?=
 =?utf-8?B?YkZEQm1tZFBEa3BQMDI0elQ3UU10OEdCK1M2bEV0MjVQcVhqd1FIS2h2SE5F?=
 =?utf-8?B?S3Z1dTZpeVRHQzdxK29OeUU4TTBqZS9wbEJ3L3hVRHNNbE4wbTFkRGZQOTBC?=
 =?utf-8?Q?ZIBkUmLVhY8iR/lkUNnZ4+MMW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gQ+9KCkq+mxH+o//ETw/9F4ANNTJ/Z4gXkVEur3PBtsQbtdZOMeaCkU6eW4s9TSw//8anhWSNCoVc6p9zeFeC6sv3bXSxS6gvTZekaLeo5kWsvqpEEMqiJInRy7cJT/h/+mVwzorIETJnZRA7X/Dc66O7b+bcJ3hLnt5GWtYABkuknal2mlQUN43x33htHW+21FvYHzlYdngvkdV1T2u+Hny0bnwcOgWbKP4JrG9VEULZYqfTJo1xqVoq1siYLwrGXFYF0CEiPQ1RuthnWSrV1UbX5SpWvfBjCeD2eqkVKdmWUCD5CTLBsWRNSKTO0+PGQobvZ9u4lV6n5PpUYVICSVXDE01ElxPmdzX/WucWiRZsgIx3Z1DRhe6OJi7fGbzLg2jj4/2+DXbVlFDr+xJI00jC6ojTRXLSC0MsQCmwzuae8Tfr7gZgHVBV6nBLrwzRIK1/dBMQvPYQg3rXpQAJ5r/7/ppTB2UKZZDKCHsQAEYfMmazZ8Pw9mNjI7wcC5AjAbqwJ19vwJXd3N1gxOlxYFl/rNSARCmgy6TjVNMdvqDwsqGkaKIHtXis0+SAC+OoyHmV16G/Ic0WgrrlirjKkx9oJBOzwMcRNHiMgy3J2cZCKCZ6GdMGANuO3vPQq9i
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11055.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b327d6-b73f-4278-0b1e-08dd724f5279
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 01:31:56.7801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYSIp5s+CxlqDNIIiSMi7Zs/pJ/C2uAFgM3J9pzgDtVeNcmd95ufZXTtZame4f4kLulmSLgn40exy5a5Js6/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214296

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
QXByaWwgMiwgMjAyNSA3OjA5IFBNDQo+IFRvOiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnIDxsZWlt
YW9odWlAZnVqaXRzdS5jb20+OyBNYXJ0aW4gSmFuc2ENCj4gPG1hcnRpbi5qYW5zYUBnbWFpbC5j
b20+DQo+IENjOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPjsgSm9zZSBR
dWFyZXNtYQ0KPiA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+OyBBbnVqIE1pdHRhbCA8YW51ai5t
aXR0YWxAaW50ZWwuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcHl0aG9uMy13ZWJjb2xvcnM6
IHVwZ3JhZGUgMjQuOC4wIC0+IDI0LjExLjENCj4gDQo+IE9uIFdlZCwgMjAyNS0wNC0wMiBhdCAx
MDozMSArMDAwMCwgTWFvaHVpIExlaSAoRnVqaXRzdSkgd3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IE1hcnRpbiBKYW5zYSA8bWFy
dGluLmphbnNhQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMiwgMjAy
NSA2OjA0IFBNDQo+ID4gPiBUbzogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0K
PiA+ID4gQ2M6IExlaSwgTWFvaHVpL+mbtyDojILmhacgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT47
IEFsZXhhbmRlciBLYW5hdmluDQo+ID4gPiA8YWxleEBsaW51dHJvbml4LmRlPjsgSm9zZSBRdWFy
ZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+OyBBbnVqDQo+ID4gPiBNaXR0YWwgPGFudWou
bWl0dGFsQGludGVsLmNvbT47DQo+ID4gPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcHl0aG9uMy13
ZWJjb2xvcnM6IHVwZ3JhZGUgMjQuOC4wIC0+DQo+ID4gPiAyNC4xMS4xDQo+ID4gPg0KPiA+ID4g
T24gV2VkLCBBcHIgMiwgMjAyNSBhdCAxMTo1OeKAr0FNIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiA+
ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPHJpY2hhcmQucHVyZGllPWxpbnV4Zm91
bmRhdGlvbi5vcmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+IE9uIFdlZCwgMjAyNS0wNC0wMiBhdCAxNzowNyArMDgwMCwgbGVpbWFvaHVpIHZpYQ0KPiA+
ID4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiBGaXgg
dGhlIGlzc3VlIHRoYXQ6DQo+ID4gPiA+ID4gwqB8IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2Fs
bCBsYXN0KToNCj4gPiA+ID4gPiDCoHzCoMKgIEZpbGUNCj4gPiA+ICIvbW50L3Rlc3QvYnVpbGRf
YXVoL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcHl0aG9uMy0NCj4gPiA+IHdlYmNvbG9y
cy8yNC4NCj4gPiA+IDExLjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIvcHl0aA0KPiA+
ID4gb24zLjEzL3NpdGUtcGFja2FnZXMvcHlwcm9qZWN0X2hvb2tzL19pbXBsLnB5IiwgbGluZSA0
MDIsIGluDQo+ID4gPiBfY2FsbF9ob29rDQo+ID4gPiA+ID4gwqB8wqDCoMKgwqAgcmFpc2UgQmFj
a2VuZFVuYXZhaWxhYmxlKA0KPiA+ID4gPiA+IMKgfMKgwqDCoMKgIC4uLjw0IGxpbmVzPi4uLg0K
PiA+ID4gPiA+IMKgfMKgwqDCoMKgICkNCj4gPiA+ID4gPiDCoHwgcHlwcm9qZWN0X2hvb2tzLl9p
bXBsLkJhY2tlbmRVbmF2YWlsYWJsZTogQ2Fubm90IGltcG9ydA0KPiA+ID4gJ3BkbS5iYWNrZW5k
Jw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gcHl0aG9uMy13ZWJjb2xvcnMgaGFzIG1pZ3JhdGVkIHRv
IHBkbS1iYWNrZW5kwqAgfCBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4gYS9weXByb2plY3QudG9tbCBi
L3B5cHJvamVjdC50b21swqAgfCBpbmRleCA2ZmNlYzc3Li45ZjJkZmE5DQo+ID4gPiA+ID4gMTAw
NjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9weXByb2plY3QudG9tbMKgIHwgKysrIGIvcHlwcm9qZWN0
LnRvbWzCoCB8IEBAIC0xLDY1DQo+ID4gPiA+ID4gPiArMSwxMTAgQEANCj4gPiA+ID4gPiA+IMKg
W2J1aWxkLXN5c3RlbV3CoCB8IC1yZXF1aXJlcyA9IFsic2V0dXB0b29scz49NjEuMCJdwqAgfA0K
PiA+ID4gPiA+IC1idWlsZC1iYWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0YSINCj4gPiA+
ID4gPiDCoHwgK3JlcXVpcmVzID0gWw0KPiA+ID4gPiA+IMKgfCArwqDCoMKgICJwZG0tYmFja2Vu
ZCIsDQo+ID4gPiA+ID4gwqB8ICtdDQo+ID4gPiA+ID4gwqB8ICtidWlsZC1iYWNrZW5kID0gInBk
bS5iYWNrZW5kIg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1
aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgLi4u
bjMtd2ViY29sb3JzXzI0LjguMC5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJifSB8
IDcNCj4gPiA+ID4gPiArKysrKystDQo+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pwqAgcmVuYW1lDQo+ID4gPiA+ID4gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiID0+DQo+ID4gPiA+
ID4gcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYn0gKDcwJSkNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiDQo+ID4gPiA+ID4gYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmINCj4gPiA+ID4gPiBzaW1p
bGFyaXR5IGluZGV4IDcwJQ0KPiA+ID4gPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy0NCj4gPiA+ID4gPiB3ZWJjb2xvcnNfMjQuOC4wLmJiDQo+ID4g
PiA+ID4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4g
PiA+ID4gPiB3ZWJjb2xvcnNfMjQuMTEuMS5iYg0KPiA+ID4gPiA+IGluZGV4IGM1ZWQ0YmQ3ZDMu
LmNkYTYzZDJhMzUgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC44LjAuYmINCj4gPiA+ID4gPiArKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmINCj4g
PiA+ID4gPiBAQCAtMywxMCArMywxNSBAQCBIT01FUEFHRSA9DQo+ID4gPiA+ID4gImh0dHBzOi8v
cHlwaS5vcmcvcHJvamVjdC93ZWJjb2xvcnMvIg0KPiA+ID4gPiA+IMKgTElDRU5TRSA9ICJCU0Qt
My1DbGF1c2UiDQo+ID4gPiA+ID4gwqBMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiA+ICJmaWxlOi8v
TElDRU5TRTttZDU9Y2JhZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gPiA+DQo+ICIwOGIwN2FmMjg2YTAx
YmNkMzBkNTgzYTdhY2FkZjYyOTU4M2QxZjc5YmZlZjI3ZGQyYzJjNWMyNjM4MTcyNzdkDQo+ID4g
PiAiDQo+ID4gPiA+ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ID4gPg0KPiAiZWNiM2Q3Njhm
MzIyMDJhZjc3MDQ3N2I4YjY1ZjMxOGZhNGY1NjZjMjI5NDg2NzNhOTc3YjAwZDU4OWRkODBmDQo+
ID4gPiA2Ig0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gwqBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRob24tcHl0ZXN0DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiArREVQRU5EUyArPSAiIFwNCj4gPiA+ID4gPiArwqDCoMKgIHB5dGhvbjMtcGRtLW5hdGl2ZSBc
DQo+ID4gPiA+ID4gK8KgwqDCoCBweXRob24zLXBkbS1iYWNrZW5kLW5hdGl2ZSBcICINCj4gPiA+
ID4gPiArDQo+ID4gPiA+DQo+ID4gPiA+IEVSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAncHl0aG9u
My13ZWJjb2xvcnMtZGV2JyAoYnV0DQo+ID4gPiA+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYg0KPiA+ID4gPiBSREVQRU5EUw0KPiA+ID4g
b24gb3Igb3RoZXJ3aXNlIHJlcXVpcmVzIGl0KSBObyBlbGlnaWJsZSBSUFJPVklERVJzIGV4aXN0
IGZvcg0KPiA+ID4gJ3B5dGhvbjMtd2ViY29sb3JzLWRldicNCj4gPiA+DQo+ID4gPg0KPiA+ID4g
PiBUaGF0IHJlY2lwZSBpc24ndCBpbiBjb3JlLg0KPiA+ID4NCj4gPiA+IExvb2tzIGxpa2UgeW91
J3ZlIGFjY2lkZW50YWxseSBjb3BpZWQgdGhlIDJuZCBlcnJvciBhYm91dCBSUFJPVklERVMNCj4g
PiA+IG5vdCB0aGUgZmlyc3Qgb25lIGFib3V0IFBST1ZJREVTLg0KPiA+ID4NCj4gPiA+IFRoZSBt
YWluIGVycm9yIGlzIGFib3V0IHB5dGhvbjMtcGRtIHdoaWNoIGlzIGluDQo+ID4gPiBtZXRhLW9l
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjIuNC5i
Yg0KPiA+DQo+ID4gVGhhbmsgeW91LCBidXQgaG93IGNhbiB3ZSBzb2x2ZSB0aGlzIGtpbmQgb2Yg
aXNzdWUgdGhhdCAyNC4xMS4xDQo+ID4gdmVyc2lvbiBvZiBweXRob24zLXdlYmNvbG9ycyBkZXBl
bmRzIG9uIHBhY2thZ2VzIG91dCBvZiBjb3JlDQo+IA0KPiBTb21ldGltZXMgd2UgaGF2ZSB0byBt
b3ZlIHJlY2lwZXMgdG8gb2UtY29yZSBmb3IgdGhpcyByZWFzb24sIG9yIHdlIG1vdmUgdGhlDQo+
IHJlY2lwZSB0byBtZXRhLW9lLiBJdCBkZXBlbmRzIHdoYXQgaXMgdXNpbmcgaXQgYW5kIHdoaWNo
IGxheWVyIGl0IHJlYWxseSBiZWxvbmdzDQo+IGluLg0KDQpJdCBzZWVtcyB0aGF0IG5laXRoZXIg
bW92aW5nIHRoZSBwZG0gYW5kIHBkbS1iYWNrZW5kIHJlbGF0ZWQgcmVjaXBlcyB0byBvZS1jb3Jl
IG5vciBpbnRlZ3JhdGluZyBweXRob24zLXdlYmNvbG9ycyBpbnRvIG1ldGEtb2UgY2FuIGJlIGFj
aGlldmVkIHdpdGggYSBzaW5nbGUgc3RyYWlnaHRmb3J3YXJkIHN0ZXAuDQoNClRvIHByZXZlbnQg
bW9yZSBwYWNrYWdlcyBmcm9tIGJlaW5nIG1pZ3JhdGVkIHRvIHBkbS1iYWNrZW5kLCBJIHdpbGwg
YXR0ZW1wdCB0byBtb3ZlIHRoZSBwZG0gcmVsYXRlZCByZWNpcGVzIHRvIG9lLWNvcmUuDQoNCldv
dWxkIHRoaXMgYXBwcm9hY2ggYmUgYWNjZXB0YWJsZT8NCg0KTGVpDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiBSaWNoYXJkDQoNCg==

