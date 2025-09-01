Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93243CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:05:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.web10.57541.1756746319051183962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 10:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X1TebF1Z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X1TebF1Z;
 spf=pass (domain: arm.com, ip: 52.101.65.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UKY2gzu2cRnW6/x5tt2I6TjuM4I3xr+yqq2Xn2lv+e/rIY2WJtrrmnp9Sk8K4PUWqOJCDg7Maj1ma26wOdJ2nyAswNwqUCvygapW2QcmSbUcKInP1rZx8+gYInioP4Uw6//YhhM2iLPG/w85FSWppsxh+n9XncoYIZphsQgymCMxDUK4RctjUMqrtJDmFF2sxg1q8ljI9OEpmCj93cQDLPz9GplxX81y8XxAaArIwAg6tM2LqOIP9OYjZZd2SZtgz04cxeZy3uO6HF61jm0F/V0x+N7OsJicZPWnUO1ylZRrT1roLelzlbhC69T21d26HAgVW3xjXRoT5bImFkW6Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDZPX81HnkFhhEsYshleEudCFwtq0qyqTPDL1I/45uo=;
 b=VUdJ0Qb2TChqm7esWBXgR6WwJOuBFfg0XoHYKvLUKQp5MP2cJwAxz9g7UBa64Oe1k6AwPAB2vokAzD29QuKnCYKavWPm7eo7oixNFma7TO1OLSGeOBg0joYw/4qCGBMkZJNZUlsWTE925sM8Ie+Nc4ITFaRXY93h4C3EU+6x1eWFwD9KkhASLdP+N9yzccH+Bge5cQupkktlN3kaNLbDohvnFJ+YvRUh/WbmYxILv/AlMA30FDuP7qufCU+/bokUYn4tTgrz1ESj4xMdHGnrD4q7HZ/mGfN0/pk9OEaM/1ygqWUU+ysuUV+Q+TBSADzlSAZDI1FZ9jll4e3vonSt2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDZPX81HnkFhhEsYshleEudCFwtq0qyqTPDL1I/45uo=;
 b=X1TebF1ZP899/alpBBa6nT7qRvGr+EVlWdexsEnIXuEux9UXf7hc6X6hzKF6g6DBX02XytgZFyKxws7a7ju+skmXlEYQEyZZjvWbe3T6OtXy+AN5i4zKtMfhagUaP+7JY8ZxMsTisEQ9hLOO5lSLXuruRrYERT++elesAIZMAlQ=
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by FRZPR08MB11140.eurprd08.prod.outlook.com
 (2603:10a6:d10:13a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 17:05:14 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::9b) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 17:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 17:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH+vzVc0I8F2mSTb4rEkOQ+bCR453UYpHAYUf42q8Uj1SYfLFgfI9QKcsfMmovlk6xC9zhhjwqljAYcue8NIftxJxLSPUPdkdHTLNqjPbqZrl4HF9YT8Pp7RGeCwovyA5PnU/6+kYJzbtof0wM7GWVUYQrCX7hVvW12bZI5xp+VF01+FWRcHAjFByWWLuc2N8VQeBZxryTA3DzrifCbkFu5re3nB545H1/9Bb6RHlJYlF9uAQ1D9+n7SSTdXSJ8ljv3G1Dzz0nMuGMwDG4sWPYr5N4vF9fsDQPGvY9X/fcLGv1Rv2NngrtRUVpwpyAjJUcBav+6d/wGC45AJAGYpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDZPX81HnkFhhEsYshleEudCFwtq0qyqTPDL1I/45uo=;
 b=vXH9tco9i0xwFnjCK+vAvJKRH3QLG2WqJPY6EkvZiI1zq47tIItn9zcOR6pYobCObvxPpuvwPyq75C3169/KajbFPCuG45SclF0G6+n9+IJLrcg8tBu84G5EFMan559EZDmBLn3X/E9bHsRyAxUuIQpJXNzgmCm53E9gKEcwHpCCT36WpuIH7o29M1BbFc3GcV/Scu27u/BAUrb5JqGUjh+w6JxyVRVO1QzFtzfJz09WaBB9hT/MGHYLaYGIczREe+boGkA+gP2Tiee+2gH/FLzW0lET5dFyLuSMFSD4W4kQzNs+Ae4I9T/ENHBvFzMUlpHAF/6F8d9seVN7bz3ZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDZPX81HnkFhhEsYshleEudCFwtq0qyqTPDL1I/45uo=;
 b=X1TebF1ZP899/alpBBa6nT7qRvGr+EVlWdexsEnIXuEux9UXf7hc6X6hzKF6g6DBX02XytgZFyKxws7a7ju+skmXlEYQEyZZjvWbe3T6OtXy+AN5i4zKtMfhagUaP+7JY8ZxMsTisEQ9hLOO5lSLXuruRrYERT++elesAIZMAlQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB7930.eurprd08.prod.outlook.com (2603:10a6:150:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 1 Sep
 2025 17:04:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:04:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Joshua Watt
	<JPEWhacker@gmail.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
Thread-Topic: [OE-core] [PATCH v3 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
Thread-Index: AQHcEqubfrkbgqC5oESM6rz/AK5tjLR+n5uA
Date: Mon, 1 Sep 2025 17:04:38 +0000
Message-ID: <818BC0DA-8F57-4BCA-987A-BD3128CFE9EB@arm.com>
References: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
 <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
In-Reply-To: <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB7930:EE_|DB1PEPF00039232:EE_|FRZPR08MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b290b12-c786-4bae-2227-08dde979b7c6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eEtFNFlPU2ZrbE5zQVNCdUpHR1VMdmJmYU9rQlJRb3lOdDZPMFpVNUxraW1Y?=
 =?utf-8?B?NFE4bnVONEMySzhIYWp4UXNCL2tzN1Z5c1U1VVhtS3A1N1gvbjJHdS9tYjdM?=
 =?utf-8?B?WTg2SHA1UTR5WU0xa3pGN01DUUttUjVVUitYY3dTc05GREp2clgycTdqNjdZ?=
 =?utf-8?B?WjJtUDBvYUd2N3d4MGNZWloyNUx0MGJTMFJiUkZsVXp2N0t0Ni9OdHJqMElI?=
 =?utf-8?B?ZksrVGdxS3R0K2F4ckg1U2pVaUtnYS9tU2RINnRycVQ5cXpVQk5uUnYyV1Rv?=
 =?utf-8?B?d1hxTzRMaEFVMEN3Q2ZqbFRpcWgrZVo4akY4OHhWTXV5QkJ1dW12cGhwVUh5?=
 =?utf-8?B?M0JDYTlnTC8xSGNSdERSd1lscHp4R3dRVlFkNzRIV3FyYUhFY2ZxcEV3N0kw?=
 =?utf-8?B?dHdyQUd0WWJTMlVoRHZSa240V203eExDTUJDR0M4M1BCdXJMOUpXMUxtV3Iw?=
 =?utf-8?B?VWZUQzhyNW1GMFZuQjl4L1dYR3U1cFc4VG5iNlhVV3c0ejFNV3JTRnlTV0RS?=
 =?utf-8?B?elhjak9SSGZZd0loNFhJUGhYYzdLOFpkNlBadnhWUVh3RUpZSmE2YUVYb2Y4?=
 =?utf-8?B?azRKVzkwclNCeGttSlpXTm40azJnKyszSmIyR0U0MU9aN2NyZ0kxbHg1Kzhj?=
 =?utf-8?B?SUx6bStWV3kreXE2elV1WjJQTUFUT1BDMmM1ajVJenBrT0puRmhKa0pOa3N6?=
 =?utf-8?B?MENZdWpXcTBEa2U4YXBITE5FcXBSZlZXUUNGVEw2N1BUTlkxV1lvc1pkMGpF?=
 =?utf-8?B?N0lBbkFTRDlNeEJWR3NxRGtpaWtYbzM1VzBuZDB1QmZZdUU3czVKdUFmQW11?=
 =?utf-8?B?OVV1N0c1aFhzdHlKQXExaEhqOFFiVmttc0hxWGlkaHRlZWRRQ1JiUW1zWW5h?=
 =?utf-8?B?TG9ubW1UMWxEQXVsLzJJaXEyazBhVmdqZ3U3R3VhcVRmZWluSlJPNWpQS0Fk?=
 =?utf-8?B?cWFlbS9oU0F2WGtPVWRNclo0VDVqTmxRNVB5cjk0V05Ld3E1VDF6MmNTVTRw?=
 =?utf-8?B?U1owN2pJa1RwMXdpdmppWklNZmQyWENhQStKVHhsY3hPbjZvSmRlUkJZbU53?=
 =?utf-8?B?dDA0L2RPNllRUHBUWm04eUgxa3JDbnhZNlUvbVFDVXNMWjJHMmxpbFZiNzNs?=
 =?utf-8?B?cWxkUWE1MERSTGt2UmNsaHRBV28wUHVyaWR2azk1OHJ4dUE0MjU3YWNyeU5S?=
 =?utf-8?B?Szh3Rll4VWJBbTRyV21CWVU3anl3RnlKNndocWJ3b3dyTzQxVzBPU3JKZ1Fa?=
 =?utf-8?B?akZKQ04xdVdvcUhJeXg3QytxWGdKbnVrdlBGWUhCNDJQaXZtdnBFdlJxUU5S?=
 =?utf-8?B?c0xmVmVsRUpabitGZlFZdm1mcms4blU2SWJNUHV1ekJlbmRVMkdFellyU2U2?=
 =?utf-8?B?U3cwdjhZeFdjNDdncHBJQjBuSzR5UXZCaU9XSjNVbUVWQ0p6YnBHUUxVQXZE?=
 =?utf-8?B?eXFBckJPdG9KY2FCcFpVM1V1ZTlreStJS3JRU3ZWWERUbFp0SEhsWnpJRGJr?=
 =?utf-8?B?RlVMemhmWHRGVGNrclNVZlJ0RmpDeFg1K1lta25vQVVmd1Z3eVBYUDM2REhI?=
 =?utf-8?B?eXlsQUkzeWN4QWNjWFVtMmo1Q1ZDMXh3akJhY0hPaHFFdDRGQjY0NUJaNVRy?=
 =?utf-8?B?SVA1ZE1MdkFMZWROenJad2N1SlRHZVV0WExwdDJmbU8vSkMrcjBJcVB2VGFo?=
 =?utf-8?B?UmV1eFk3SDJPWnZTRnQrM2JwYUptWWM4RU55cmtxRFBXa2duRncyQjFpcE1I?=
 =?utf-8?B?Q1pTcWh3VG1VV3lCSlAzMmZJRmpxZzhubjBFdUxSWWsvMUtxWGw5RkxYNVdx?=
 =?utf-8?B?NmdaQXdwNjZXTEt0aTA0OURKUVQzYXZ1RzlkUE4vQUFhS0I0WTkrTWlNNnBP?=
 =?utf-8?B?eTdyNUhtTFVZc1NNWTNBOHVMQVU5SU4xRTdXbFR1ZWl5L1pDNmtTeUdEczdQ?=
 =?utf-8?B?cjVrQ3hJa1Nkc3FuVmQ3RGh2cURyOE9qV0xTcy9XVzIraXFDVlFBZGNFYmNC?=
 =?utf-8?B?YUpNMUJ6YzRRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D99950402B62E744B14C79A80E6A54F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7930
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d944ed33-b3cd-41bf-d92b-08dde979a282
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1ZRNkNmY2NPOFRpVDVxU3piaStGZkhGNXcyWmZadWduTS9UWGRWZGw3aGF1?=
 =?utf-8?B?LzlkZnlycHBvczJPakZrSEhHQlNqQXE4ZlpuN1NST3k1dmVCSHBsdmJjQ0tZ?=
 =?utf-8?B?MTdOWTMxaDBBNTR4T1kwSEpyUHd4WnkvRFdjb3AxTE9Tb0RQVE5qM1MwSVhj?=
 =?utf-8?B?OWcyaEZIOExKREFVemViems2S1FBTVBjckd1Ty9OQm10M3o5dXhYeUJpcDYw?=
 =?utf-8?B?SnJoTC9OSHRmTGQ4cGpZV3JXV3M0WTFMUkltdlJpMUJjbXMrZW41SG02VXBq?=
 =?utf-8?B?bWFJM0h1b05iUFpKWU1wV1BET0NubExlTlhyWEU1UTBtdnI1ZEdKYitCZEk2?=
 =?utf-8?B?UkZyYmpsb3JGQjhEYmpJamZRWjljbk0zRmlCVXJJeWREa3NRN0xaTmZ0VHF6?=
 =?utf-8?B?eWkxS2ZiMmpId1BleS9Rd0VSTXBaR3lZNUxhZUoyWWVXaEVNWlZyMlNGQVM1?=
 =?utf-8?B?ZlJJL3VTdk5ocDF1SzFvdjJXNmxYMGEwM3F3MFRscXVDOWRlUXpWWGIzY0w2?=
 =?utf-8?B?a2xlQThCb2Q5eDhSVGJua0NjWHJsMnVyQXhydE5paldQMWx1NHNEaUZUS0lR?=
 =?utf-8?B?aEZqUk5NRVpGcVFGTFAzcDZOVmZuN2FkeVZISk1NUlpDNEFaYktKcUovcnVh?=
 =?utf-8?B?Ym1nTXdtc0IvMlZ5TjBEc0ZMd2VicHkwVzRMakhINTF1ZkxyR0tGRk9CdlAw?=
 =?utf-8?B?ZlpSSmtaMzhXUmtRb2hDbWFmdmlNQTA3ejBscnNCbnZHeFNwVUg2Uk1MYXo3?=
 =?utf-8?B?SHlyYmQwS1ZXSlZmWW5DUGRYSkpwdTJ2SU5sc1JJbi91azlOQVFydCsvQStz?=
 =?utf-8?B?OXZRSXNwVEpsU2ViVHdKaEFQUldNSmxYbld2RmlvOFlnZmxCYWhmWmhSbjUz?=
 =?utf-8?B?SHpubmozYlJZeHc2NC9CcU9YeFZWUVdiK2d5Q0xJaEkreVlRK3drRmhpdDFl?=
 =?utf-8?B?SG9HZHdXZzlZaS93c2dMeGNaTm9DOW9UTmxFT0pma1g1RXkvYUVXSUhNUlEr?=
 =?utf-8?B?WHJSTVdUWUd2ckJlekhjbE52WndZQUp3Uzk4cDJqcDc5VGlpYndtK2l0WW40?=
 =?utf-8?B?ZnkzQThPVi9EbTZtRk9BS095WGZnZjFIQXNKREdlcHVnQ3cwclZlSFkzdUQ4?=
 =?utf-8?B?TTZrYnFNY2hqWEJUZnBlb1ZCMm04bWo1cU9XZ0xwN2tONUhoOUl4eU9COEZR?=
 =?utf-8?B?WlB4ODBVck9MTG1ZQ1ZaRWF2ejQwS0VMb2R4c01IbXVsODdjMElpd282czFv?=
 =?utf-8?B?clVPVVZ2OUFJY3pnS2NIRjdNN1FMRGY3MnBoN096ck1tWXVRTVhvR2M5dlJ4?=
 =?utf-8?B?ejgyL0tWYUJERzNIKzhzRTBnVTlMKzI4OXcxSFk2SVNqU2pOMGYrdmlUTmo3?=
 =?utf-8?B?czArNVc3NWM4dDQxS3V1ZXR2NUN1bGU5ZUNneEpab0VaUnhEbSt0NUdqOGtw?=
 =?utf-8?B?SnhlbDZmT2JtcmQxY3IwYU82R0RyQVVWeUtGMDdwdkZ4TUpqSXI4SGpOZURE?=
 =?utf-8?B?RDRzUUVEcHE4dVIvWFFEWEI3dWY2U0ozbUhDRHdYL244Vm8vSGV0dW4vLytq?=
 =?utf-8?B?WWc3Zm1Yb2QrY2ZsZ3FmTHFNcUVUdUszdjBESks5UDZVUU9QLzdvWm5rcktj?=
 =?utf-8?B?T2J6MUlBRndqVitKWEVVVENDOTBMOXY0NjEzWXJkN2ZmT21mVlI4QXpDMCtu?=
 =?utf-8?B?akpxaHR3bjJVZVJXbW53T05GSzdLOE9VeWovdVVJV21pUGJCTCtnQXMxbTRq?=
 =?utf-8?B?WTM4WnhXK1hLYVJYSjBMTGVDUnpJTHBXVHNjNVVpYk1CbVhLYytBdS9ZVVFi?=
 =?utf-8?B?cXl5Zk5VZDZFYnczamNZSzA2eGQvRHhnQ09rVkdlNGR2cVo3bnM2cWszTC92?=
 =?utf-8?B?SjNQZEJvbUxNWUpQYkFxR0dKSUJjTlFXVGRIUmhTOHcrTm0zTnlVN05pVzBq?=
 =?utf-8?B?TGlIV25ZTlBMNXdiS0dhMS9tSHc1WVBCY3p1d3VkbFZCKzVaY1ZORHNid1lt?=
 =?utf-8?B?MVk0eEd0YjFqb0xBeUNxQjNoWEpkajZvYnhyYklteWZ5SVRta05DTW1YWVZU?=
 =?utf-8?Q?U69m7C?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:05:13.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b290b12-c786-4bae-2227-08dde979b7c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222670

SGksDQoNCj4gT24gMjEgQXVnIDIwMjUsIGF0IDE1OjU0LCBLYW1lbCBCb3VoYXJhIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxrYW1lbC5ib3VoYXJhPWJvb3RsaW4uY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gSW50cm9kdWNlIHRoZSBTUERYX0lOQ0xVREVfUEFD
S0FHRUNPTkZJRyB2YXJpYWJsZSwgd2hpY2ggd2hlbiBlbmFibGVkIGNhdXNlcw0KPiBQQUNLQUdF
Q09ORklHIGZlYXR1cmVzIHRvIGJlIHJlY29yZGVkIGluIHRoZSBTUERYIGRvY3VtZW50IGFzIGJ1
aWxkIHBhcmFtZXRlcnMuDQoNCk15IGluaXRpYWwgcmV2aWV3IGNvbW1lbnQgd2FzIOKAnHdoYXQg
ZG9lcyBKb3NoIHRoaW5r4oCdIGFuZCBoZeKAmXMgYWxyZWFkeSBhY2tlZCB0aGlzLCBidXQgdGhp
cyBpcyBhZGRpbmcgZGlzYWJsZWQtYnktZGVmYXVsdCBmdW5jdGlvbmFsaXR5IHRoYXQgaXNu4oCZ
dCBkb2N1bWVudGVkIG9yIHRlc3RlZCBhdCBhbGwuDQoNCkNhbiB5b3UgYWRkIHNvbWUgZG9jdW1l
bnRhdGlvbiB0byB0aGUgcmVmZXJlbmNlIG1hbnVhbCBhdCBsZWFzdCwgYW5kIGEgdGVzdCBjYXNl
IGluIG9lLXNlbGZ0ZXN0IHRoYXQgdHVybnMgb24gYWxsIG9mIHRoZXNlIG9wdGlvbmFsIHRvZ2ds
ZXMgc28gdGhleSBnZXQgZXhlcmNpc2VkIGF0IGxlYXN0IG9uY2U/DQoNClRoYW5rcywNClJvc3M=

