Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EB0CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:18:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.web11.8873.1758183487223133078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=selector1 header.b=S0GJVWQb;
 spf=pass (domain: danfoss.com, ip: 52.101.65.11, mailfrom: barne.carstensen@danfoss.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5xYc/ewXmg7mEvzVoXb1SjQ4rGNXJrMVxWGmG/C7hhwof3/VDMfHgv+xnnwGlbkS/koGY3xBTi0VyfeAIHdqnA4a5kRmpi5kyOjOWJvn02LBSah4AWcp8yTz/ffPyIymCFZ7p7MnI/gmWkwHGYWYMc+8f6pnbzcIs3nwce04LljHOpj8bgfk0cmlbzu71Vs0joris+gW9pb3Ug8bCj1vQSCiGFSBQYX8OWsY3lHmymbVQ+c+bFtr2YN4GijzafrC7u5BhaozTQpk7WT4XwwoVhl+2Dapf1ffbFGQEnDM1tQr/43Ik7DygkEbTFZAvzcB2XmEoMSXWl/dPBXqQHwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDKoKHA8zrdwI8UxqCimOc3lWharsOc4xdAxsGVOWqM=;
 b=WGV5cJHCjTq89R+3FG8cQFzO3n0yjS0o1HEOkMKhvZNBrshtdmPfzPWvm79pr4fFG9Y1bW3cjBHUzFTDSeeP45SI2gCe0I87nK2ku3bh1EsoVBscbkbWKJ1HkRkSIuX8wftRiAeuyRvLk9gguzwbZDdxJ2vNY9jlUbHebVJLWoi5rbT08s+kZDoMrqWoZBvUmpEqJmemMMmxUt8wbnhUrbbRRRkKPnowsJx6aH/CCAigdot4F71BRR9tEGad4GRwK8ctXZ3HDK11OEBkRa6FNnw8yBKUbE5JLi45kUQD3X3m5qrqZLWdLC3R5sOtYBrSF4iyhRM2qggWHlMQwXGFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danfoss.com; dmarc=pass action=none header.from=danfoss.com;
 dkim=pass header.d=danfoss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDKoKHA8zrdwI8UxqCimOc3lWharsOc4xdAxsGVOWqM=;
 b=S0GJVWQbTHWIa+A3u+mEW9FeMmtFkyVfGGO6Gv6y5K8AiKd99yAr1RhWhtuHXIDdSfikkQYbgwovf/xdgjZfOQKvmmLv4mXycRwqQ3a4uc09ScFrFCkDU3Bkc8SDoVacTJdB3FWWNjrz6YL1XULdSiDpI4Vc30qJDfqtOJbk9aBLuv5J02YYKi6aq9paGQ58S4mZ7nw6LvNYwe767XZhaJ6u37AnNVS9UQV1RfpVmQ1bI1Lf5fFPrTGvkboUhZU5Kecu4N5rTgGsflLQxtAhw7am9Tojcwy0JzMoQKkayq3sIMXHPOtHq+4gQucty2xwIlpXGflv/7Ca20aTeyqa1w==
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:216::23) by DU0PR01MB9119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:18:02 +0000
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a]) by DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:18:02 +0000
From: Barne Carstensen <barne.carstensen@danfoss.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Randy MacLeod
	<randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Topic: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Index: 
 AQHcJwT8jD4Qjy9jkEW2hSvUcVczgLSV0SdSgAEkEHCAABhAgIAABiZggAAIF4CAAXzEwA==
Date: Thu, 18 Sep 2025 08:18:02 +0000
Message-ID: 
 <DB9PR01MB7210117FFD8BD4B0218CAD898716A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org> <aMlo-hknGOEJqrGP@nuoska>
 <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
 <b26fc568-4afe-4de1-be63-2f53e3468617@cherry.de>
 <DB9PR01MB72102C7EF8F8862F583523158717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
 <d1df751b-3937-40d6-9546-0efee512706f@cherry.de>
In-Reply-To: <d1df751b-3937-40d6-9546-0efee512706f@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Enabled=True;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SiteId=097464b8-069c-453e-9254-c17ec707310d;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SetDate=2025-09-18T08:07:19.0000000Z;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Name=1.
 Business;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_ContentBits=3;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danfoss.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR01MB7210:EE_|DU0PR01MB9119:EE_
x-ms-office365-filtering-correlation-id: c4ee4a7f-5ff3-4301-537b-08ddf68be2c6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-7?B?aDVRdjc1WTQrLWZ3ZEZ6dG1ncllLdmtDNmo3elJkcmUzNVZMVzZ3QUFTREUx?=
 =?utf-7?B?aistKy1rYlJQQUdUKy15ajF1eXQ5QVdGOTRVODMrLXNUZWg2OHlqQzZTKy0=?=
 =?utf-7?B?UystTk5KSEN2U0RLSzZBenF5SGVIdGRPRzJaWnJVQk5tRWZMemJCQ2dvOGw0?=
 =?utf-7?B?WVB6NkwwZlZ1ZmZBSkMxdFJIKy05dXppcUloSWVPNkM5TWJ4R2pPWnNhYk5O?=
 =?utf-7?B?dUdObHRrVGtpV05hSVVNUlVVM3d3U0h1am9hdjlpOWxSZ0d0azh6dDV1N3I3?=
 =?utf-7?B?LzdiZVI2Z284anZZak0xSWlsZmdNMFc0WjdLTGJ2bUxDRWdjRE0rLVA2bGdY?=
 =?utf-7?B?aWFka2xLcG1aQkpJUmcrLVhoL0luZXZBMVYrLVp3T2hwSWtVVFZKRWExOVA=?=
 =?utf-7?B?OCstbGpKQWttdC9uUDJkSVlNQlFlWjFWUldJOHp4VllFMjJQWEgrLUZ0aWNj?=
 =?utf-7?B?cWNtdkNWQk0wb2t2MmhYUlNOYlV5cWc2V2RUYmVkU1o4ZHFKQkpEdlcyaFBO?=
 =?utf-7?B?OXZVektpKy16QjZxMkpJZHpjUUlWMHNlM045Wk9lVFFIN3FiekEyYkVjY1pJ?=
 =?utf-7?B?Yy81RDAyeHpyajhTV09hSWpGeGJBSmtGUXFWVHVoMnRidm1mYTQ0dFBTdXF1?=
 =?utf-7?B?Y05kcmorLTkyd1RmWk1XcTEyWGYwcU96dU5GMmJKZVlRVnM4QnpjdnhGeUFo?=
 =?utf-7?B?ZzRMeVhIZ0J2d3dqTmN6WTU4c21Uak1HUlNDSWtWejZMWFFOeUxpNlM0S0JP?=
 =?utf-7?B?SWdqM2diL094cmZhdXdxREl2WUJpdDBUVDJpVWIzcWVJdVlXZW8vWHlkRGtD?=
 =?utf-7?B?QllrclFPaHRFOU5kWlJRZll3WTJNYUxhWUc0QjBYVHpEUWY0aFhtWG5kWGFG?=
 =?utf-7?B?Q3QzL1Awbmp1dXpwRHl3QXg2YTcrLTlQaEpxTVZWTnJWTzlrVEtrdnJQS0xi?=
 =?utf-7?B?Ry9CY0prbWh3ajlsNUhzSVB1QjdWc1NWVE0rLXE2NFdGNForLVNXV3BHNnBR?=
 =?utf-7?B?QnhIUkdLYS83blZhd0VMMkR2d2REcVRuWUtvVVV4Um1xamdDWFF0OWIzR2Zl?=
 =?utf-7?B?OUQybU1qVTVVVWtoUkNQYWhEOTBURW8wYktQb2lneWI2aystRkVFaW9WTUJx?=
 =?utf-7?B?VmZ1ZDhpSlNWVE9laGJTVzZNNFV3S1VDbFI3TW54aVYwdExnRDN6cXZnQXZt?=
 =?utf-7?B?ZystQU15UXQrLTgxaTh2azhsd3lmUm1UOTIxN3czQmtGeCstQ2E4RjRvZlRt?=
 =?utf-7?B?blA4WjBuSkJueGpaU0xjSVdDS2tOaEJGaEE3TFNkQ21Va1lBTHE4L1BvMUhQ?=
 =?utf-7?B?cE55bE5zcDlsZjdJdWFWTms0WWpyVm1sVDlpcnZyT2poUC92ZjNpblZ5QVRT?=
 =?utf-7?B?NXdRQ2NsMDNjd084SDVDVkNickUwNi9mdWkxWHN4NUwrLVErLTJFT3ZxZ3Z5?=
 =?utf-7?B?QlBXQVlQTGlZVGJvKy1ML2hJQ0c3ZERJYXU0TGk5UUowSUg0SEVIblJRVXJl?=
 =?utf-7?B?ck1IQ2l4ZWJwZHphZ3JpNUk4MU5HT2lNUkhGRXRYeFJTM3JJck1yNm5vMXVz?=
 =?utf-7?B?cE5KVXlLVXpBbVR1cmgxWEdGS2lvQjhpaFZDNFJXWWZMUFBqbGhlWW5oSVJa?=
 =?utf-7?B?b3JwOHpMTlNtTE9vU0xLRlpORFdRTXdXazNDVUdGV21HNVYyKy02akU4SDJq?=
 =?utf-7?B?M0NKMHFZeGgrLTcvN2UxSjVONmVvNlRFd0VJNkRjMTFzZWNRNjJVZndGa0s0?=
 =?utf-7?B?cU5EbGN0LzlXR2l2WFdGNHFnc1RoQXp1TzZIdS9XTWdRbUM4Tnc5MXdLbUpk?=
 =?utf-7?B?OWJWeUx1eXNRMlRzWWZxRk8zRWJxUDlJKy1wWmV2WHJDR3crLXNpbUt5dGF0?=
 =?utf-7?B?VnVCbGlKZGNNNXhwQ1Y5UjEvUU1BS3hhaEgwbkFMd1pYNmpRUWtrYnBuOEJz?=
 =?utf-7?B?V0dOVnlIb3lJQzNMVXNneGM0T2R2YmQ2VFI5dUR2M1hhaXdpQUY5ODU0?=
 =?utf-7?B?K0FEMC0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB7210.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?dHByZDM2eEsvdFVyYW5xVVVRbVFvQm9KOXVRVDNWL1BzNjc0ZlVhYjlHVm1K?=
 =?utf-7?B?anhqdXpHWW55YnY0eEtUdHh0cTdMTUJDT1F2elRuc05Wcm1aTlNDSWpTTGNU?=
 =?utf-7?B?em5PVDlveXZRdng3d1A4UUdkeUVTNWVBNm9pc0lDQystNE4rLU5KbWtwM2JN?=
 =?utf-7?B?cTZ0NXowVk1RV2hMOXN4LzhQWW85UC9TcTNhTGxPQk5SSXZvZm83dVBOSm9R?=
 =?utf-7?B?MURvYVgzazFMdUsxRUkxeDJYSWVqTVE4Q2swVWJZSTlCeXlUN1BzQTNkanc1?=
 =?utf-7?B?amJFOUlHNUlUNmtweWpSRy8ySll0eDN0blFSdjZjeWJBUlhXYXF0aG8vZTdC?=
 =?utf-7?B?SGlMQ0xaeFpmdU5WKy1GWUo5NUVUTXJCSWdRTkhSTWhJU2Jhd09kcTBUUFAw?=
 =?utf-7?B?cml5TWlQTzVYZTl5SHZVS0s1Q1B3U1IzdFVPMVhKTUNJVkZCanU0OXRBZ0hh?=
 =?utf-7?B?RXhnYnU1d0R5d0J6NWFaNEVFUEx3YjVEbmdQQTZLdmt5ekNURystQU9TMnl6?=
 =?utf-7?B?ZkpzWElOVTRudmhKbVJKZlhMZlJLMjhFd2EvUjdsNVNwcGs4N0tsaDQ0TFNa?=
 =?utf-7?B?eHN6ZjBoUTRWZFFjQW5wS3IzUGFjdU5iT25ydTZ6bjUwc2lCR0FBYXpWM0wy?=
 =?utf-7?B?NVZoZGNSbDRZeFU4QmxFRDUya21EMHdkOVNKYW0vU1VWa0xmbEtBKy1mVGMw?=
 =?utf-7?B?NFNEbVBESFZGNktlKy1lU1BKTUY4UHdRQ2JwV2xyNFQwMGpibHdqbFhJNGJt?=
 =?utf-7?B?MzVXTmdHcHhFbk1YcTk2aUhlcnRUcG93ejZ0L2VHZzN0dXU4eGJTNklQUnUx?=
 =?utf-7?B?ODZzcnppSVB0U08wZjY1VU16VkJ0WldrbEttS094Y3A4Ky1uSlZab0JFUkRj?=
 =?utf-7?B?b1MvdGpaRERFaWJTWHd5aEVrMXVhS0FudGt3R25zZERwMXYrLTZiNENFYzRJ?=
 =?utf-7?B?T0w2d2FUWlU5ZSstdGM0NXBodG51Wk4rLUh1aGV4R2lyVGxjTDBtQmxQZC8=?=
 =?utf-7?B?NistNmprRXYzdDhEbzQ4Y3N4bDF1Um1zRystN1c0NFU1Ky1vWHdaL1p1TVYv?=
 =?utf-7?B?VXY0OThCYk0wUDZLdWc2Z25tSkhHcWFTQnE0My83SXBsTnhLSkdJeVZiZ1B1?=
 =?utf-7?B?eHp0eU1LYWZ5SEdSVHpEQTY1QystSEJheTdhdFcwdmxBdWRLbXZKL21KSlNB?=
 =?utf-7?B?bTE3by9PTDR3R2lqS25MQnBjRWZWY2FGWGFjaUh0RXgxSzgwOUdBdldxQ0l3?=
 =?utf-7?B?MUR3OExEMWkrLWw3dVVZNDdpSmJnVW9uMGtIc1d5dThJUEFQU0VtUXplOURl?=
 =?utf-7?B?RUw1WUFyZUtvZVZselRBdFRiYVJEbUYvQTl6dVFoN0I5ODRKb09hMVE2ZFFs?=
 =?utf-7?B?RUtNQUJMb1Mxa2NIaWgxaW02VVl6d21qcEd4WkswTm9SOGFQZllrcnBpSVRi?=
 =?utf-7?B?dTZWSDM3Y0VXNmpiS3NHWG42Q241ZVFpMFJXUWNvbjZYekh1V0Q3VWM4aUp4?=
 =?utf-7?B?Ky1NeExKZDlHL3Qvekt0eEFid0lwd1RrQllteVl1aVdrWlBJL3BIUU1DNkpJ?=
 =?utf-7?B?emhUbTBzRFpnZVpBTHl3TU1vZEhjSjEyVS9oa2ZBWlRCcjMvM052VnlOV1pr?=
 =?utf-7?B?aGlPbGxLM1hPTXdZby9peDVGL3VwM3FzTXJVbVNqUVRyTlYvd0F2bUszUXNv?=
 =?utf-7?B?TVY1VE8rLXkvaXFCUThlWFdhY2dReUtpcHVCUC9iZzBvVG5ITDlicistS2dh?=
 =?utf-7?B?WmxEdjJsQkhyZXZncTI0bWhUU0RsbGtJZEdDZHg2V1l0OHVVZEZ6WFNBN2cz?=
 =?utf-7?B?OTEvSmxQem5RWkxybGxHQVFUYSstKy05Z0kySmpCajZlNEFKZGRkTDBicFVu?=
 =?utf-7?B?a0s3L1FOWGlDbi96WE1MSy9nZ1haV2tnKy0xUTVmVDVhTEZZSjN2ZlptREFU?=
 =?utf-7?B?TGdlRTFZcWpCQmhVS0hJelRaYUpsZmk4ZU1ZeldwNSstTWRrS3F3Y2ZYUWdL?=
 =?utf-7?B?S3M1U1lnTmpZOWh5UUdQMDRBOGh3emZ6M21kbFR5VjFSS0tHOVFpYTBGWTdw?=
 =?utf-7?B?NVNPTWtkQVNtbXoxbDZYTjZVVTNuNkFES1BuN04wMHNoQjlndjdveHdKUGda?=
 =?utf-7?B?dmFaY1I2WXJObHl5QVh5NEQzbmtVUTFRUjB6VDd1TmdkMW1GNjNrdW1HaVRC?=
 =?utf-7?B?TVZUTXBFcjlhRkpFelBGcUJSQXZTUnBydytBRDBBUFEt?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: danfoss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB7210.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ee4a7f-5ff3-4301-537b-08ddf68be2c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 08:18:02.1745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097464b8-069c-453e-9254-c17ec707310d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EE6jThHcH1SJNjjfsClTu2O6K/exhNcDuYXJ5Ta8gm/aWu1y8D7RBxE6Mrbtyr8bTEUwVbvsE82WO0myQftrzVGjVmJ/yrCAVWiCtorg7hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223630

Hello,
Sorry was a miss click with the reply. Yes, I see it also now. I think the =
last section about the bug confused me, and I interpretated that as an +ACI=
-instead+ACI-. So, the other suggestion you made for updating the example s=
hould be good enough. Because when I follow the Note:
+ACIAIg-
Note.:

To find a suitable prefix for the commit summary, a good idea is to look fo=
r prefixes used in previous commits touching the same files or directories:

git log --oneline +ADw-paths+AD4-
+ACIAIg-

I should have been able to write a correct short description.

Thanks,

Barne


Classified as Business
-----Original Message-----
From: Quentin Schulz +ADw-quentin.schulz+AEA-cherry.de+AD4-
Sent: Mittwoch, 17. September 2025 11:25
To: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com+AD4-
Cc: Mikko Rapeli +ADw-mikko.rapeli+AEA-linaro.org+AD4AOw- openembedded-core=
+AEA-lists.openembedded.org+ADs- Randy MacLeod +ADw-randy.macleod+AEA-windr=
iver.com+AD4-
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- Fixes +AFs-YOCTO +ACM-15965+=
AF0-

+AFs-You don't often get email from quentin.schulz+AEA-cherry.de. Learn why=
 this is important at https://aka.ms/LearnAboutSenderIdentification +AF0-

Hi Barne,

Please always use +ACI-Reply all+ACI- when answering messages on the mailin=
g list. I'm re-adding everybody in this mail :)

It serves for archiving purposes but also offers people the ability to corr=
ect me (or any other recipient) as well as providing additional context, et=
c...

On 9/17/25 11:12 AM, Barne Carstensen wrote:
+AD4- Hi Quentin,
+AD4-
+AD4- I guess I was missing the information that the first line of the comm=
it message will be the subject and afterwards follows the +ACI-detailed des=
cription+ACI-. Having that in mind I would go with your second or third sug=
gestion:
+AD4-
+AD4APg- +ACIAIgAi-
+AD4APg- single-line summary
+AD4APg-
+AD4APg- Fixes +AFs-YOCTO +ACM-bug-id+AF0-
+AD4APg-
+AD4APg- detailed description of change
+AD4APg- +ACIAIgAi-
+AD4APg-
+AD4APg- or
+AD4APg-
+AD4APg- +ACIAIgAi-
+AD4APg- single-line summary
+AD4APg-
+AD4APg- detailed description of change
+AD4APg-
+AD4APg- Fixes +AFs-YOCTO +ACM-bug-id+AF0-
+AD4APg- +ACIAIgAi-
+AD4-
+AD4- But that would still not clarify how the subject should look like.
+AD4-

In the same section a few items above in the list we have:

+ACIAIgAi-
You should prefix this short description with the recipe name (if changing =
a recipe), or else with the short form path to the file being changed.
+ACIAIgAi-

Did you skim over it unknowingly? Is it too verbose? Not clear enough?
Would some example help?

It's good to try to be in the shoes of someone who's not used to the proces=
s, hence why I'm asking a bunch of questions so we have some idea how to be=
tter formulate this section of the docs :)

+AD4APg- 5.3 is not out yet, so I would say not specifying the branch is fi=
ne
+AD4APg- as that would be master. We're very late in the cycle though, so n=
ot
+AD4APg- guaranteed it'll make it in time for the release (but +AD4-may be =
a
+AD4APg- candidate for backporting. I'll let Mikko provide background on wh=
y
+AD4APg- they thought it isn't for master (did you (Barne) try pulling mast=
er
+AD4APg- and applying your patch on top of current +AD4-master?)
+AD4-
+AD4- Yes, the patch was made on top of the latest master commit +ACI-ba3bd=
832e810bfb96bfa6fcd52710de185dbee22 overlayfs: Disable renaming of network =
interfaces+ACI-
+AD4-
+AD4- So, is there anything left I am asked to do? Is changing the commit
+AD4- message now enough, to update the subject, or is there more I should
+AD4- do? +2D3eCg-

You can either send the v2 with a proper commit title already or wait a bit=
 for Mikko to provide feedback in the next few days on why they thought thi=
s would be targeting older releases, up to you+ACE-

Please don't forget to have the v2 in the mail subject, see
https://docs.yoctoproject.org/contributor-guide/submit-changes.html+ACM-tak=
ing-patch-review-into-account

Again, do not hesitate to provide feedback on how we could improve the docu=
mentation for the contribution process (or any other part :) ). Feel free t=
o contribute to the yocto-docs as well directly (https://git.yoctoproject.o=
rg/yocto-docs/).

Looking forward to your patch(es)+ACE-

Quentin

