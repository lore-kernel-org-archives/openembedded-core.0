Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6294CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 15:38:02 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.web10.37191.1757950675114822070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 08:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AuCQc+iC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AuCQc+iC;
 spf=pass (domain: arm.com, ip: 52.101.72.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rap5/mlS/uIsIrL92WkrLkEWkaGzH8eCCGsmYicIjlEn6nO8dmXptlFuqVX5ub3EMJ163/oAJOCjgI+cZNUZl8riMYhy/1QdY77sZd3whMVJqTQuJXHm3/YJjW9IEGBat7z38NncIcxJfHCpufJaSAUcF5VfPDKdc3+G13Y5EURywhaaNYeuI5HRNUjhcSi+VmRWre0Pt9U10uVvp/s/c3PAyaDWBO/2j7oLqtlIxI+lNFmaxByXDPiO5Z6lnE4uuVpp1NtzqHyYJvfSn7wUaMnjd+ZLdaru5QqCylvA/OgQN0LgiN8myqHMjg56Z5vZyTqctyqwK/YR4Q8apkVJuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udhdBW+nCoX7fnHWLW7v3hhyLNjpNJV3EYWP9bwulVo=;
 b=icEcLbOj0xnwUXQE5i8bG6/bFln4TTq0/GkdFQPV50Z2oJI8slLxcZDrS/cu5fY7/P5medvkKQYJQmATZlXl0i/derFx9kzOB0ZfYoEHmtY3Lh9Kc50OewwTMtCdjysAoQU1UFaI46BvWalJk2ouPm7sGTPYAiL7G3XbvkrpjBoYXwPpkhGeQzM9KbENUYs61AF5Tv2kcD1OqR2f5Aqzi8Zt7Rg3jzqyqaRlkvn+Am97DRy/KY+y4hUfdgFzUJ5am4xSQ3Up0FXr1rFQ0M76KLObVtti+AwmSbdsfKjWeizpKmsfojgspmDyLJLrgFId5qAX5/desOLNKYh3WQJ20A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udhdBW+nCoX7fnHWLW7v3hhyLNjpNJV3EYWP9bwulVo=;
 b=AuCQc+iC+eLmY6DFRQ1qVDVpaqjnKHZhEzG7G6eMOzaQ7Xv42+SNOXlvR8j/BmTFMvae8cPgPX4zSEupDOwN7501wDMoJpjg4pVrNCwpez0VAMOFztKDCG24xc+/V8r0Lb+MY91soC7daMPKXTbrXqorlMmwYeqZjbApV1vw/8g=
Received: from CWLP123CA0034.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::22)
 by AS8PR08MB8417.eurprd08.prod.outlook.com (2603:10a6:20b:569::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 15:37:44 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::4f) by CWLP123CA0034.outlook.office365.com
 (2603:10a6:401:58::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 15:37:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 15 Sep 2025 15:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epKA3NW2e276Kg4AhuvmKn4XNeFOveiI5Dn2bmOJimj5cldzFe4AFIZzsDmuUcdlHtnjguJy5DW7FzT2zu0fBNo43nyg5U5qatnmWNkEeC2+sPgjK79GyJAq7U1VKIffT4nxWcV+U4rfDQvKZYGM8Pa5Succ8Tx2G4uS8RlTAujwnXoC0/U4TsZzMwNgtIHYaNegfrg+YOrzgGEy/8MsNlpyzkR++QJRCgMZdZLZwIbDnAfJgATjKU/pFnW/G5Xtl+/MLrl3bhkjFldH5b5+5d5r+UFuIYcUQnGtbvyVOcRfNNtRddm7TAWCK0JwOgkqIJprQGHf1cCIkGPs/i3u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udhdBW+nCoX7fnHWLW7v3hhyLNjpNJV3EYWP9bwulVo=;
 b=SzMlmHILeNCzzCI7QOmA6hQKMollY5RPRQoT8xeH/ytkDvlilElxF5wI8qPaq64E2SpC7f7H3Xn/xoCPmlhqQFsav4oylez5hoD+VEvAqJWjSBE6Ll0sHcsgHAuWUPyWwLbkk1rvxp4ligZ9VcCd/3X9jxROJQSwUEk8wK3VAcVwBh/HWfyzY9kI2Pbe/4iTOrm1H8QXnF1mZcI6GBY6bGQfzKbubTRJr8iQD6ep2gtjnEduxt1eyyV775JMTR3aeAIkg17zZ08o5+Jwo8sDQBZ9H88KSfFpqpXn2SsTPvRI0xbfUsd3j44dT/gA6pcAkVxjVfC54SEAmZ0RUCs3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udhdBW+nCoX7fnHWLW7v3hhyLNjpNJV3EYWP9bwulVo=;
 b=AuCQc+iC+eLmY6DFRQ1qVDVpaqjnKHZhEzG7G6eMOzaQ7Xv42+SNOXlvR8j/BmTFMvae8cPgPX4zSEupDOwN7501wDMoJpjg4pVrNCwpez0VAMOFztKDCG24xc+/V8r0Lb+MY91soC7daMPKXTbrXqorlMmwYeqZjbApV1vw/8g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10489.eurprd08.prod.outlook.com (2603:10a6:102:3d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 15:37:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:37:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] classes/cmake: don't put RPATHs to the
 build tree in binaries
Thread-Topic: [OE-core] [RFC PATCH] classes/cmake: don't put RPATHs to the
 build tree in binaries
Thread-Index: AQHcJlBFhqQJgpHNBE+x1WNNJxmGkLSUYIeA
Date: Mon, 15 Sep 2025 15:37:11 +0000
Message-ID: <C77C9671-B269-4E7C-9CDB-20CE32228119@arm.com>
References: <20250915145134.192581-1-ross.burton@arm.com>
In-Reply-To: <20250915145134.192581-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10489:EE_|AM3PEPF0000A793:EE_|AS8PR08MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: d24a69c9-90bf-40ac-13d2-08ddf46dd04e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UTlKaC80UHp1dkxJMDYzb2NyUjNBVkY1VFdzWkJydERrVCsrV0RBZDFIeVpu?=
 =?utf-8?B?MlpHQ0xLOE4zRDhPaDZVQTJrTm1mMm1Fcjh5cUU4NVJVOW5kaE9ya05IclRt?=
 =?utf-8?B?TEZYbWw0UlBXZFQrNHhpbktRZUQ1MGZYcFI2c0pQcG5MaXFNVmN1SzJSRlVm?=
 =?utf-8?B?NHVBMXZyejBiRXVCdUwzU2ZmYmpqUDJUY3VRK2tteC9TZWd0bkpUWVNuaFFL?=
 =?utf-8?B?RndNTVoyZElRdXl1VjJDanBvTDlPbVJGR2p4Y2hmaUVVdmkrdUNoWDZkek9T?=
 =?utf-8?B?czlPTHRwOHIwTUk5bHRBWFpNVTVnYmhKMC9oQnE1eEFhSmlYMDlZdmRkZURE?=
 =?utf-8?B?Y3B2ZjVMTmMvL2p1NHNTWEg2N2RDZ21YWi95bGF1cWllSzl3Rm1oRk9CZlAw?=
 =?utf-8?B?V09zdVpBbzRPZlB3Z2lVc3pHOVVJdXpsUFBtSXFnV1c2OGw2NkJDTHphN3gy?=
 =?utf-8?B?ajFCZE1rbG9iY0pMNG51dkVQZThCaC9UM3NyVjRXa2hISmozdm9LZVFWNE1C?=
 =?utf-8?B?RDRrQlBBcWlyaTc0QkFkU1I3bGZibHZ6RWUrc281T2ZCbWp1MjhJLzhaSlBx?=
 =?utf-8?B?MFJnQlJtK0VMNGJSNlN2dUlEd0oyTDJpTVFWdFdHbnk3bU1ZQWMwYXZ0cklx?=
 =?utf-8?B?OVE0UzROSDA1OXhQWGRyM1k4S0lyb3E4eEgzTU8zcnVNOTFteUR4SVIrZ09a?=
 =?utf-8?B?WC96QkErSFlWQVBxbWZKWlNGQkFneE9QU01WT2RHYXhiWTM5YkhSRm15RHdx?=
 =?utf-8?B?eEtZcmVOaVFnWGVWTFhWTW1SN3V2Ty9zK0JqT2x2YkNjenZZV2dFNmZsSjVo?=
 =?utf-8?B?STZlbTFlWjNhSHp4UmcwN3YwYXlQdGZyamZ5K2MyWWk5VFFMYThYa2ZZaUp5?=
 =?utf-8?B?akxvVzJhSzF5Y2FZbTFDMVJIUUI5Ykp1VmZlZ282TVM1K1F5RURIOTJVY3lx?=
 =?utf-8?B?WG5taXB6cExzT2ZTSEdjTWlHSXVDT1R1Vm9yUm1aZVNJanhtL2phOGFrWm5U?=
 =?utf-8?B?SmV6MS9ndVk1NDFYRW9Ec3lsYTZtM1dyYlBZaUl6Y29vYzdqRkwyT25TQStl?=
 =?utf-8?B?UDN4QmFYdm1CUG1HZXlxY040ekMvUXNxRlZ1Y0R1aFNJaTJtRzEwQWYxU3Bq?=
 =?utf-8?B?NGR5SHZKZFZkS2lQMHM2d2RMbndmQS9tUFd6NHFxMURjVCt2TnJRci9xRTlW?=
 =?utf-8?B?VFZJKzZWM1NsajM2VkxiWEtwQjZRazVYY01mcVVIeVdtcHFuNEs4V1lodm9E?=
 =?utf-8?B?K1NRNXpJbUJjZTJNdXBpMnE0d1ZrN2dyNWtUbnFPMEd0bmxHMnBLVEJuUVRp?=
 =?utf-8?B?TFF3SFo0YXVkWDRveEkxbkdjWnIyMW93SVFNOCtOSkNpZlhNY01ZaFU5R29M?=
 =?utf-8?B?eXRXMktERHljdXVGTHI0REV4VkNPeEJGdHFuQnFqZUIvZUo1aWNJN1JUYlZ0?=
 =?utf-8?B?aklndjhhVHZBRis1R24rZk9vWGZ5ZnB6amxrUDlENE1TUS8xRXgrVm9XY0FD?=
 =?utf-8?B?UmdGWmdBZG5TZE5xSk5RcjJyaEF5STI0Z1UrZ01hRUlRV0k4cHlCbUgzajFS?=
 =?utf-8?B?RUF4aFR3QnBMRzAxMFlGWjh6YmZYV2EwWVBxMTNQTUlrUnBucHN6RFZta20z?=
 =?utf-8?B?ODhFUlcyS21WOTcydVNJNU05NlRncVVVWlgxb0xYeGdoMEtLSC9IdTJPOXpj?=
 =?utf-8?B?WTV3MTV4cmZRa2VrRk8wSW90NXViRkJGcEhpNDZ4M1o1Y014cFdxMDhEZTMw?=
 =?utf-8?B?VU1ac0hZbElYZkM4Vk1ybENwaXQxQWgxWWs0SDdHWTUvbk9aQ3g3blcwSmpw?=
 =?utf-8?B?R05DVjZsTHM3UE9PMUxLYWlHa0JIa29vRHFkTFhpbG1uQ3JpR1dRZWREcEVO?=
 =?utf-8?B?NUk0WWd4djdUeU93bFRIV3J6V0d2WGhadExEM1l5NVJQalNEQWV4VXNJekI1?=
 =?utf-8?B?MDhRdnYzbDg3Mk9Ob29DbGI5WWw3VjV4bGZpYktLQjEvcE5QWW44QXNmYnhz?=
 =?utf-8?B?MDg1OHVmTlpRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <283DB5A3CAEB454E937EE20D44071FBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10489
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cd15d4ab-221e-4b39-29b6-08ddf46dbcfb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blVoNVc1eEVkMU8xckJ4cmJXd1hPSUZ6bWo2Tjd5elpOSUZxdDZkTHRwb2Rz?=
 =?utf-8?B?b0xvaTNqT0RRcWt5SHZ1Y2xiSzdOTjZVRVVzVHgwZ2RjYS9UUnhIMWNoZStQ?=
 =?utf-8?B?QnlrcTJOMEYxVjhpdHF1RkdTa0pEK092d0dDc1JhZDFYMnZ5YlhrWmw5MmQx?=
 =?utf-8?B?WTFGRlRuTlhMUDBLU0s2TjdyelpuREd2Nkl5OTNZY3YzdjZnN3VrakhWTnJB?=
 =?utf-8?B?cFBkWXBpQUFTU0tkZ3krdERpQjBhbGU3QmQvRmQvZytXQXF2c09KVTU5VmNz?=
 =?utf-8?B?UlptbjlQZ1JqVElmMEJUQjBsT0dJVUJ6Y3VyUjg3aU5rRkpTaXUya3ZKR0Vz?=
 =?utf-8?B?TjVobktzY08rOHpRejg4MThzVmFFa2h4UXVjQWFGVzIyT3JKMjFwOEQyeW1w?=
 =?utf-8?B?ODE1R29QQVZBVTNxODU4YjhDZU1Ma3JJU0VNK2xBL2RGWk1QZWd5dFErLzR0?=
 =?utf-8?B?ck8veFBZVUlONHB4Q0w1emg4QXMzdVZnelpCNEtKRDkxc2RXMnUyMTk2ek9v?=
 =?utf-8?B?SWZJWVpNUnZ6TWVxSGYzSjlwNDFXRTlCRFZHVjRiMEk2M1M2c3NxbURZbzZv?=
 =?utf-8?B?UEJReXBvakl3MnpzMkVTWVUyb2dNRXVJSzFXa1pNb3c4NnlVZkFNaXhSYTNM?=
 =?utf-8?B?Z3d2OHlwZmFjeWw4Tlo4VFg5djd1K0xXejdyYnlDZ1JVYzU0d21kbG5qK3Bh?=
 =?utf-8?B?b2lPTnF1OFk4cFJuZVhKQjluZUVNOGdMaURvdmZZSys4NFZINkpqaHJVSUNt?=
 =?utf-8?B?alVvVHVZWUJreXdoSmlyMEtvMzVWTm5BcXhpclg5ZjQ2MUlwVk56Y3JoWHpQ?=
 =?utf-8?B?dVN4cS8vem80N2lWTVAyRWYxK1NGSWVlQTBtNjcwdU9zNjNSbTg5cTFqQ3I0?=
 =?utf-8?B?QUM4OE9OSlJ1UXdlaldqcG5xWGpVT1RpSWx6TVczZ1VjOGpaazdVWG1ma0Fh?=
 =?utf-8?B?bCtPMy9JNi9OMHZTT0RXSXVZVmw2Wm82YXZjeDZFa0hFU2dnVExxcU5EaFE2?=
 =?utf-8?B?WkhzbG82RlN5TEdGVHd4eWp2a3hWRkRJcjZRd0o1QnlaM1M0bE12YXF1K2ZF?=
 =?utf-8?B?RVpSV24zSkxxeFkwYjFNWFN6RDBnVmk4ak1HdGFwUXFJemZtakdqbEtpNjMx?=
 =?utf-8?B?WGNWb2pMdVBjNmtkYUI5dmluaHVycGFCMFFJN29DWXl0L0Nva2FhNkFhUUtD?=
 =?utf-8?B?T3h4eHhRUFBXbUkySThKbDN0bmMzcC9EbU1STDBlUlBPUVZIY0dyVFhkdDRW?=
 =?utf-8?B?Qnd4OXEvSXdCOTlHYldLZ1V3VFA3WEhxS1kxSm9HVDJJZ0ViUm5NV3RDQld6?=
 =?utf-8?B?Vlo1QkxpUkpvUFVuWXB3a25lb01hT2JrNjJsWHdtc0luZ0wwWEYvYnZ2djFP?=
 =?utf-8?B?NkFBVlltYUV6K3liSklPOVh5VjhzV0FMM3lTYkdDRGRYRUsxNFN6eDBFazFT?=
 =?utf-8?B?bUFSTEsxOUtZZTlTYWtqRVJjNVlKN2lHVmhLZittZlZvRU1RNEp2WXE4NVhJ?=
 =?utf-8?B?aFpOUWR4T2dqZXpaWTMzZThvVE5xWUNIVDN0K2ZHZ3ZIVVpNcnNVa3QwdC9x?=
 =?utf-8?B?cUE1ckJtS1ZPVkhQb1kvRHJ6eXdyZ0lya2tRajNKTFJpRFJlNlJwZFdGQzFw?=
 =?utf-8?B?S1lLdmg4YnVwUUxNV1F5VEJoYlUrbmFPUXBHd2RJM1BVdDRwWEtqWmQyVWRn?=
 =?utf-8?B?R0tOd0lqbVNrTnpSNlk2VWVIV0NKQ3dpcGQxM0paRUx2NytHR3h3MTZ0d21p?=
 =?utf-8?B?K3EzLzhYQndJR0YzYzZnaW16VXNVWWtjVThPcVpzS2pGR2FoWjNaY0tiVTBn?=
 =?utf-8?B?a21KbVVjdnR3MUJWSURrbklCeXlGL25IV2ZDOU9wOWloRFFjOHVaMkVhUThh?=
 =?utf-8?B?VjFkV0paMkU3b1lQOFRveEFzWjJ0Y1pCOXQxeFhzc053elczcCtjekE3eE9T?=
 =?utf-8?B?YUIzU0FNNHVNaDBYd05iZ01aOEZsUm1lVFhGVUZYNjlkckFhSlRkbWk0b2lI?=
 =?utf-8?B?SXFVZ3MrVWdYMU5sY0l1aTI1ZEFhRms2eXo3WUZxZVN1U1p5T2hXVWNxdWpy?=
 =?utf-8?Q?qhvJ9P?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:37:43.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a69c9-90bf-40ac-13d2-08ddf46dd04e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8417
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 15:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223494

T24gMTUgU2VwIDIwMjUsIGF0IDE1OjUxLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gQnkgZGVmYXVsdCwgQ01ha2Ugd2lsbCBjb21waWxlIGJpbmFyaWVzIHdpdGggYW4gUlBB
VEggcG9pbnRpbmcgYXQgdGhlDQo+IGJ1aWxkIHBhdGgsIGFuZCB0aGVuIG9uIGluc3RhbGwgd2ls
bCAicmVsaW5rIiB0aGUgYmluYXJpZXMgd2l0aCBhbg0KPiBSUEFUSCBwb2ludGluZyB0byB0aGUg
aW5zdGFsbCBwYXRoLg0KDQpDb250ZXh0IGhlcmUgaXMgdGhhdCB0aGUgY2xhbmcgcmVjaXBlcyBs
b3ZlIHB1dHRpbmcgYWJzb2x1dGUgYnVpbGQgcGF0aHMgaW50byB0aGUgUlBBVEhzLCBkZXN0cm95
aW5nIHJlcHJvZHVjaWJpbGl0eS4gVGhpcyBpcyBhIHNsZWRnZWhhbW1lciB0byBzdG9wIGl0IGhh
cHBlbmluZyBnbG9iYWxseSwgaWYgcGVvcGxlIHRoaW5rIGl04oCZcyBhIGJpdCB0b28gaGVhdnkg
Zm9yIHRoaXMgbGF0ZSBpbiB0aGUgY3ljbGUgSSBjYW4gZG8gaXQgaW4gdGhlIGNsYW5nIHJlY2lw
ZXMuDQoNClJvc3M=

