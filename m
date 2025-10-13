Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98524CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:32:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.web10.43582.1760362369026893404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WeoJ/7Ok;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WeoJ/7Ok;
 spf=pass (domain: arm.com, ip: 40.107.159.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xi4oOjdpwSdFW7si8oJMjHiqb9wAg2dz8N89H3NQpPrqDs6sRb1MvCbyEceeSXmzjL6vUP5a8QT/bR/jpbGt45sVs7D99EZk0MvM8+EnnB0gacHgaX6e1FWdBsEiYZJ1O8Yla1GCy7f6hE6LALF0ODracKYeFYbK3zo6/E1TrmlVFHakwaIYvfmn5yiqUafFTU2DeBWnLgy7vxIaQSSXUTWzT1Ts+EDmn+6ZA37p2NWvqhZpFBG3wZ0xpz2wcnC9Drufwf7f6xjGoLsgqJ9BtY66YJeiKHk+GEZp7hLU8NcU3Dps/MuPjTB9aZTYVUD1CatyB6UqmUCiMADfkNamZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc2nZZZ8szUgl6aECPzPTy1WnQicOuJwLa+pRJ0PIRc=;
 b=YnfrGdIbtKaRfxGXss1jv7TXV0nOMKf+rDCEGZpEgjJy8Pxd+5yLBV9+0ftzvcV/stlavd418ZM6yjh1qMrSChXy3wvaAAN3jxWDcwmA+vVmzDq3qwZxBVh04JPlW0WCbtzm15Ds1hL+eZPVr8SG0vDC/iVH79Lvq1nXUSQeMRweuER8tPA6w5RqRTudW/1o9JLk/vEdsqF6kLmDPW/+khUp/lQWf/SvqP/cy2f0DiqqKIpxwb6lAhQ2tLMHVvrdWvNxHXaN8JjcugLmNfMlcmW43Z3DKQ0otuU/jlpmBkljBljGrDBgEkIku6jxKn11FYKxR0aNTckPgMN9Xm1lZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc2nZZZ8szUgl6aECPzPTy1WnQicOuJwLa+pRJ0PIRc=;
 b=WeoJ/7OkgONXgwMkoCGWt3C3KxWTuWlSsN8Y+6c3I6r/dQu4HVvrKix3+PdFTtrnVwzvhlSc51mOfiQYM+B+exTM7gwZAdtOWClvX6HL483He7jgeRZYPtBnXj6vgaLXI0B8M3tVuj5ir6w+fVld55QzFx70M+qWOy3r9KO8tDw=
Received: from AS9PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:20b:463::27)
 by GV1PR08MB10502.eurprd08.prod.outlook.com (2603:10a6:150:16b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:32:44 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:20b:463:cafe::7e) by AS9PR06CA0042.outlook.office365.com
 (2603:10a6:20b:463::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 13:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Mon, 13 Oct 2025 13:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBcNRXdgs5+GCd6dJSDwjVNbCsmoU8yemnp0z+3P6Zct28kmccrgsWTYwFdXIJWmOGBuXHVzv09IkMpDh59SPCeDivvO2cuM6q79aYRvfbTXDe3V769cX05EJgl/FSCRdGdJqIsnEOxxQxOfxOk558nVaTukrxdJmm+XDA05Iu2MFzZGN2Hl1FPyVSxrriZvw0a0MCFxa10KTCtpZgkco9fn4kQNSGOBkJP60+hOTYIfeZzYSHzN8yLFuX1iK8Qt1uCTn44d5VWcoHLdPuAAkXoDVrvbXxL9Q1GWDkeHL8gJ8qI/rkndvWazOfENIWJa2+GvALJDNwbXvc3uK76r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc2nZZZ8szUgl6aECPzPTy1WnQicOuJwLa+pRJ0PIRc=;
 b=AcZCHBi8ps5WUYKXIDYoe5VuHXFU++PhxJTOKXJ9lH22HvWeOIChekeYTlVUn9XPZiAf4/GEJpO/Vrh++VoDF2rja9xKAVkIrAanEW6Wgcj8BEoLqTTK4iURNhIFw5i/AOibrDPmhLfyX4rcghLzOwiCRUuP8WlAn6VrCfbqRiGbfpwhDft95rGPo2sRgP6XYVfV5z+op/LNi85T3V5aRlXxNe51Vu7qVcKMOHrsPUNoc/dbyk2C//q+efSSnoEU+NkjQ099tcCgFQdyOw3vFTzCG2zva/Yeas8GfiTSH8b7m1+AM/4QZxthcjnt/LVHEcWV0EiymC+1SHprT4naGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc2nZZZ8szUgl6aECPzPTy1WnQicOuJwLa+pRJ0PIRc=;
 b=WeoJ/7OkgONXgwMkoCGWt3C3KxWTuWlSsN8Y+6c3I6r/dQu4HVvrKix3+PdFTtrnVwzvhlSc51mOfiQYM+B+exTM7gwZAdtOWClvX6HL483He7jgeRZYPtBnXj6vgaLXI0B8M3tVuj5ir6w+fVld55QzFx70M+qWOy3r9KO8tDw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7535.eurprd08.prod.outlook.com (2603:10a6:10:303::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:32:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:32:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: upgrade to 1.9.1
Thread-Topic: [OE-core] [PATCH] meson: upgrade to 1.9.1
Thread-Index: AQHcLx8SL0LUojQBUkCjcWk+mTGoULSwrr+AgA9+hYA=
Date: Mon, 13 Oct 2025 13:32:11 +0000
Message-ID: <4055C6B5-DB43-45CB-A143-F211800E7D4C@arm.com>
References: <20250926195204.2323521-1-ross.burton@arm.com>
 <CAMKF1sqQSpAJ4UZQf4ms9_zSJuoKy4nSxfu4Z7P9yEULSJnX9Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqQSpAJ4UZQf4ms9_zSJuoKy4nSxfu4Z7P9yEULSJnX9Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7535:EE_|AM2PEPF0001C70F:EE_|GV1PR08MB10502:EE_
X-MS-Office365-Filtering-Correlation-Id: ff81fd13-35c6-4993-d9f1-08de0a5cfd34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2t0KytVUVE2REZtOW5CbWNPaE10dElZaVpnb3owRTg1WTEwQWJHOTVUUmtr?=
 =?utf-8?B?V0IyMnlHT2cvVTV0ODl0aTRHbEhTejFBQ3A4K3g4UkFLcDYwdWI4YWl2VkVz?=
 =?utf-8?B?S2dOc3ByZjVYUWZ1MXV5TUJYTE4yT0RZQ1pVZUpabVRGTkxUYWRscFdhcjV1?=
 =?utf-8?B?VFVlOTNIL3JZR2xPbGJVTW82akhUQ1RvMmVnSVlaU1lpNzhTbzhMbVd2ODBZ?=
 =?utf-8?B?ZVkwTmQzam1IS2FQVEtiWnE3VGpDajk5MGFVWWN4WjVFcXM1VUJrYmE0V2o2?=
 =?utf-8?B?ZXdrbnR6NEhaWnBrcnBjUHlrK2VlcG1XR0xhbU5oS05KK1AwZTd0eU9EV2pT?=
 =?utf-8?B?VEVEeGhoR3VrbHozUlpkVHljVmtONWJjZjNMRm9iWVhJTTBvRDRURDRnd1dx?=
 =?utf-8?B?bWNNbFJWdUdXdkpiS0xtYmh0NzlIOG11V3BwQkdsd0h6bEVNaDNnVXNBYWFr?=
 =?utf-8?B?VDZ5VDZkczBLUmVmc0JOYjN3eXREc3BvWllOR091cVNaeVorVTlVYmFQd29Z?=
 =?utf-8?B?a1VaeFNRVnhELzk2ZmVDaUFhL1NpOTRLZ1NKR1FuNEg4cE9VK1VSOFNrSHBh?=
 =?utf-8?B?cUYzTUJQOFcra3R1R1Z4VWFOSlRRWlZYMlhIUzRkaEZWbm92OWlrM05EY05o?=
 =?utf-8?B?Z2EyTjcrVTFma3dyb2RtZUkxS0ROWTI5R0wvZzNDenFjWnRJSndFUlYrU3Bu?=
 =?utf-8?B?aWRlWWljeTlva2YxOEl1Zlp3WFNXU1k4T2tmZWJ4amlHV0NXbVg5OVp4UXRR?=
 =?utf-8?B?Slp3VXNrTi91d09TYVhVcFpnNFhBRFJvRVBWQVkxZG1hOU1FQXg5SXFPSEIy?=
 =?utf-8?B?Q1AwbnFMQWlydHpPQjRMMnZYMjNtbHlYbmdaS0c5VU1GOVpIUXJDNEMwbmdr?=
 =?utf-8?B?T2YvWWljZWFkZGFvWGFpT3BCUGhOQjF5NklKam9XQ1hBWHY2bVY0T0NTcDZK?=
 =?utf-8?B?UkQrc0FYSXZzV2JJRHhsdUpKLzZaNXErU1A2bXhDSmRCQTR0aTE0REJoY3ZE?=
 =?utf-8?B?VjluQVNBRjdRZmRmWWt5T1MzSGpFaitiOGJucmRrc0hZemcvMGhCeExzTTlI?=
 =?utf-8?B?eXJZK3NqTlgweC9SSmNqaytEZnM1SzhsQlNUdWJpN1ZMcWdoVllpOHNXd1k4?=
 =?utf-8?B?RHdxZmVrdzNObUZFMVgrSThuV3RLeDZ1d2VaZ2hxM1h0RTNTRXlSQ3oxN1BH?=
 =?utf-8?B?WndqcDdsa1RCTld1RUxHcml0V2NiakxJV3RaMXZNL1drYU03eHlZSjJVMytQ?=
 =?utf-8?B?eklmSjlrRTZaV215aWZqd05uM0U4K0l2eDRVeFFhUFRzTHFzVjBiaDRlY0tX?=
 =?utf-8?B?RFM0S1p3V21CQ3pqTVNQMW5yZXJFeUV0UnpGT3MxRXNNN3RtUFBzSE0rM0Y1?=
 =?utf-8?B?eVBocElCL1hyNUNZcFJOcXZkcVJxRTYzVmI2TFFTbkc1enVTNTBvTDdqVklq?=
 =?utf-8?B?QjdEQVQzVXhtcVdoUWpXTHY0SzRYR0RFejVGalpKVStDQWl3dUhjZVU2eEdL?=
 =?utf-8?B?T3lKOHk4b2pENkZBWTBSYTdKaWhaSzBHMTllR3FxdTRJcWJFT0l0NXhYZkVC?=
 =?utf-8?B?eGlkYmhYM0VGaUpCb3VRNDRaVXRndUxCZHc3Z0E4d1pjODV6YWw5clJKbEFs?=
 =?utf-8?B?N0dQcWtmQU1QK20rbG0wRTFOM2hIY2tpTUp1aXVTemVYNjlYMCtvM1dveXZD?=
 =?utf-8?B?RFl4bjJ4RWhzWkNwN3lwb2R4N0ZpU0xSQkEvbmFISE5JeldXajBBNDEraXdz?=
 =?utf-8?B?bkZtMjFMR1Bhakt1c3pDUWVDZVBURmIvaW5KOWhQOC90UnZtdnp3RnRsc21U?=
 =?utf-8?B?dHNBYmsyRnJnbklZTXgrVXUwMEw4SWpudW1xUEluUFFxNThmanFqSE1HN05r?=
 =?utf-8?B?d3hZbHA5cEtENThybXdHL2JGTEFWS2Q0SXVyMXNobGwrV01PYjR1cVlDUHR1?=
 =?utf-8?B?Rkt0dFQ1QnNDYWFYcXMvR2JEN3BIVlBmMjdUUmlRWnNrVTl5ZmsrQ1ZrVjVD?=
 =?utf-8?B?cTREcG5Fb2FRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E0C222C3C00F04EB3C98B4665AA231D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7535
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5b561e8-05a4-4568-356d-08de0a5cea19
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWlyYmJtcGRTZGo4M0ZMS0J1RU5rcmNrQld1cUtNTU9ZRHBNTGQ1MWFmaGVX?=
 =?utf-8?B?NzFqcU1YTjQyYXhyaTdYMXNMcVZMeDREaEhxYTRMZVhqanZmSzVDRGpBMVV5?=
 =?utf-8?B?cndRNDZFYkVqdEkxOFgyWlJCTTBJQUNlMGdmLzFwNnJQeDhwTm1KbjZKM0Rl?=
 =?utf-8?B?K200RHp3a3YrazduN0VuNGt2ZWxCVVBna3JacWlHQzdGS2VJM1Jub0E0eDJ6?=
 =?utf-8?B?VjJlQS93S21PTWp3NGJsdGxGSk5zL1FoYkhHWmc1b0RDbjFQblowLzVjUDBT?=
 =?utf-8?B?UWE3am52dEx1aWIwdVN6ZkgwMVl2NGFReFpvaXZLT0taSXM1VzJlTlNuamFU?=
 =?utf-8?B?NHltMFpQNEJjTEhyRHE5Y05zSnQ5VW4xMFljdWVCcmF2UGI0WHBmc0RzZE9N?=
 =?utf-8?B?b0pKejdFaUVDV0FNQ25WNEZDVXRwVEdHb2NpeW1ZbkNqUGJTeDZ1WWtNb25V?=
 =?utf-8?B?UUNKZXpPSEJyeHdDdWZMMUg2S3drSnp6ZUNaSVM5MHBqVUJmTFBwQU00dUJm?=
 =?utf-8?B?SDBjMkRoclhsb25RaDBRTHg4S1gwTHNqNnZpVExSaU5CMUFUbkc1STljTmpR?=
 =?utf-8?B?S1U4NmhqTzZadGVpOG9BcW1vT1RqVFUzL3ErWS9ERzFsa0RlZzU1Y2xjb2Jh?=
 =?utf-8?B?aFdvWnY3MTd1c0k3blB6RzVveXpPM2kvcmRac1o4VTFJSlBwdHVOSWpBR3dw?=
 =?utf-8?B?RHFha2RSNE1JcFYwQkZXZW5BL3pBaUU2Tk4zdHNVN0hXNmo0WGlJVEdaMHY5?=
 =?utf-8?B?NVpIWXJiaUVacTZQdUtiZ0FudUxIWDZCOGsvR0plUnNzM3BmcUxudU5FL3N0?=
 =?utf-8?B?bk5icWo2dWZJUlNpSGZCVG1ISkJ6UW5qdXdqOE96aytGWkw4RTNPTFhCaTNB?=
 =?utf-8?B?TUN5d3JiK2VaeE00Wk9ieXVYbDJKcnZrL0hKVXVNaHEvZkFrTTAwYUZiejkz?=
 =?utf-8?B?WUxkTm9ERzZscExwRlR0SkxNL1AxTTFKRlhTMFo4K3VrbjJnNlBkWXdnL0Rm?=
 =?utf-8?B?ZGN5clh2alhnN0srU29wRk13SGpRYUs3N2NGUU9LMjVjdFdJSDd2QjBGNFpl?=
 =?utf-8?B?LytaS0E0VE1DbDFKRS9xWk1LTWJIOElYWHRFL3VWNTg1RTdvaVBkYTBIU3Qw?=
 =?utf-8?B?Z2QvNko2Z09kNDRjMm02VFRycmtJYWsvdzVzcTRLand4RUJLMnllcFg3NnpZ?=
 =?utf-8?B?TVVBSDJrNnN0ZmJpcWszYlJkVW9hUEpUT0xVTDAwVEgxdUlOc3hpTnhObSt6?=
 =?utf-8?B?Q3NLdzNSRk5ndWpXdGg4NG0zWmU0UzhxQUNrQ0RsWUYvVUdYZGp5bHY2bkdL?=
 =?utf-8?B?MzVOTXBYQjA4KzcvSEswbVU4SjlsUTd0Qi83U1F5TEphQTg5TlRrZzJQbUtH?=
 =?utf-8?B?TWw1QVlUQzJuRng0VVQ2THFmSjc3cFkrcE9ucUkrdWVSZHZCWU50RGFwTDFJ?=
 =?utf-8?B?SVRqRVRYOCtkcmtwMWgxRzBJZFhMWkpvTGxQOUxGRGdiM3lxNFB2a1VHUWhS?=
 =?utf-8?B?bEhyWXRPNVNXdmMzcE14MXljMWFDWkMrcVFscDcwNXVvemR0Y3F1M2hhWExw?=
 =?utf-8?B?VG1HcG1YWWN6dTRPYmd1Z0NZeEdaSkNrR2FKVEh4RHF2cWdMT0dSR1lpTzhQ?=
 =?utf-8?B?TzhmajZSZms2akRDTEl6RW1JL0k2b1ZST296dzJ3Qm45T2tGajM4Mm9SNlEy?=
 =?utf-8?B?R0hxQW91NThDc3BEeEFibVlEZXhiUkhVN0U1OGR4azc1SXpmckoyQVJlclkr?=
 =?utf-8?B?NENBb2hVWnF3U3lSbXlQMmExQU5sZEpFUWFrRHl1SHpLUFRSeHBUdlVLZUVo?=
 =?utf-8?B?bm5BMlNlTHpOZnZqV0Vnd014YVUzenNQVlhNMkVid0E3dzBRWDN5SHZKSTVH?=
 =?utf-8?B?RVM3UHBZcGdWVjNZSG5mdnRLYnFiczRQY3dwd0xEU0YxdXpncHcxY3pIWUVL?=
 =?utf-8?B?RU04Z211UEdmWVpuVGgwcVBnTUc5Q1dnUlBqL25VcmlVdDY2OFZadnNSb1Rr?=
 =?utf-8?B?V29WSmhCZHRTWjhMdGY1N0w2cHk1TndqS3p6Z2RwTkErQjI4QU1Nc2cvaUhT?=
 =?utf-8?Q?yOLQmP?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:32:43.4149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff81fd13-35c6-4993-d9f1-08de0a5cfd34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 13:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224786

T24gMyBPY3QgMjAyNSwgYXQgMTc6NTUsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gdGFpc2VpIGhhcyBzdGFydGVkIHRvIGZhaWwgYnVpbGRpbmcgLQ0KPiBodHRw
czovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzg4NDM1MS8NCj4gaXQg
c2VlbXMgaXQgY291bGQgYmUgcmVsYXRlZCB0byB0aGlzIHVwZ3JhZGUuDQoNCklzIHRoaXMgc3Rp
bGwgZmFpbGluZz8gSSBjYW7igJl0IHJlcGxpY2F0ZSBpbW1lZGlhdGVseS4NCg0KUm9zcw==

