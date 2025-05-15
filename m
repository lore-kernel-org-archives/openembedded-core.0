Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCDCC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 18:48:26 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.57])
 by mx.groups.io with SMTP id smtpd.web10.20542.1747334902319241814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 11:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Vz2rkTz1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Vz2rkTz1;
 spf=pass (domain: arm.com, ip: 40.107.105.57, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZtytXGgHisOMOk84lcHJIcYlR/p0LEAkgkfY+VDfU7ILLR8hHIq5VCwXHDeMr9Yf3xumLZCC+X97YYX/oVkfjJiQNJON7ibK5blLBTqmryQo6RSJB6AQGC71D4Ln2kQvphUCenoyS2ageAd+Q8138V3lH21zqahSCw4n2ij8pEjJZSf1EBJCQdNu+njk+MDunrkqX/n1t4kwWdB+LU9c/WjFWRm9RVTmnP/l5PcU3ZhzaQBJuENrDHBLxbWXqfE/gvVtcl/sYO3b8DObW5civDWJlWymufqR1QPrdnEtXnfDH+eR8emGUbbOR9PGvE4wibHkMvHLjWUlkBztr4VOJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYVbhttkAR/WpjseiEWqksSL0CdKhT4zIycnvhpJRr4=;
 b=gAr4ss44C87SYIARDz7bFwqZUArBmVG1NF+u6BvHAmzsfjJQv6AuVHGTeH7AeRe45LwF8lGep0DhYOBeuZTlBN8yPHnZPPWbeAMGyJaSfq8R1gZUVHv3Vbr+ao1mI5qyFX7lNKlDdSz+Go1ia5jHMBWZwwlOPiDFVA9EhTL71A6s9ZFiMF5uVnSj0jAhj3xO8Fw6HQQat3jJ61Dk/dMFDGEt038y0rB+R5LF6hBtmlPnnyU+zKuc8l7uzZSlgHZ50vYmiqE2rsa8/oaJjjS8XXZ00D5WYawMyxFuYe7gPKFbIEPIB1tZApwiVmicj2wfms8K5bUaszkhEfadDghEAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYVbhttkAR/WpjseiEWqksSL0CdKhT4zIycnvhpJRr4=;
 b=Vz2rkTz1h50QtqpKI5iyCKayP4AO9QPRiheTxDP17po1d2U2Z6UVHgegQrDorlJqBQh8LyMosCA9JHNJdM6L7aPN+jFIYgoeDPPVFBwj4aB6kc2aONTqmQMG75vVpsIOwPNXjNjXxHUdBawLm2SIvwm8TqFPIAvtFB75+uSrP3M=
Received: from DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) by VI0PR08MB10458.eurprd08.prod.outlook.com
 (2603:10a6:800:201::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 18:48:17 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::67) by DUZPR01CA0137.outlook.office365.com
 (2603:10a6:10:4bc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Thu,
 15 May 2025 18:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 18:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9KxdR2dpCeAywP50Iqds6aiO5oJLEKYe1uNJxsvg7zzU9Ec0kVvZ3g+5p1GsnwSxPl/A904Hb3/DjC2RnVLP9OBpdFRDXAdZ/OCbz1SHnNS6EQdTywKeq3ZSmpTgdztJpTEKDh6npNEN68D5MB5Tf+BLZFcYv66/uJen1KK97C0Wzt+otJIcDGthQUqXJa4W5bKsv7EGTEYyhMg5gqiQyoSSW4OCHEsESune7RvfpMs0fp5T3DmAIPy2KhbtnDeO9FcHcIZVwgOB5KD2JgGIwlBIPkJYFEbsWrPyn/x+1y4KVruxsDgYzFd3aO3AOdt51JHlS63/xWa7jvncv1PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYVbhttkAR/WpjseiEWqksSL0CdKhT4zIycnvhpJRr4=;
 b=vE0Q4riAFY/9TrhE8257E6sCpNawn2PZkpm6bAGG5vEtk0qNyAeWDVglB9MBRXznseQJSwYzM9XQ5P6/Z3JVjysyI1eu8U82V5aU4E5o/7OKrlTk3Oh3JmBJYaVEPaJm/WB7IOMNTc1oO3lJiuc7tTjcR0/R8Pfxt664/UASrSK3L/H+pG77iMJAXV+rVNYIcb/HffYtu6n/r0H8JFb9eMldr0jY3BEwG8ueS7rETblDl4CwNfMYbsywIJM8LMRMMthVReU44LehZLCxWFPB04VXsgifIgCwaCtZqji9gKrsz0IlmMis6jD89boTn2Y6s6apiyA/2WXah2Ygp6Rn/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYVbhttkAR/WpjseiEWqksSL0CdKhT4zIycnvhpJRr4=;
 b=Vz2rkTz1h50QtqpKI5iyCKayP4AO9QPRiheTxDP17po1d2U2Z6UVHgegQrDorlJqBQh8LyMosCA9JHNJdM6L7aPN+jFIYgoeDPPVFBwj4aB6kc2aONTqmQMG75vVpsIOwPNXjNjXxHUdBawLm2SIvwm8TqFPIAvtFB75+uSrP3M=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB4PR08MB8077.eurprd08.prod.outlook.com (2603:10a6:10:387::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Thu, 15 May 2025 18:47:38 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:47:38 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: AQHbxZq5ZISzQqXBeki2/byi0MF8RbPTsSuAgAAA5ACAAAObAIAAIHSAgAAyMIA=
Date: Thu, 15 May 2025 18:47:38 +0000
Message-ID: <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
 <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|DB4PR08MB8077:EE_|DU2PEPF00028D11:EE_|VI0PR08MB10458:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7e5752-4dbe-4d1b-85de-08dd93e10cff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SCtqbmlia2wvMVMxcVU3V04xMGdJSzBEY0hwLzFPUzdISDluTGFSZU02VlMz?=
 =?utf-8?B?bjk5czFOc094U3lHdG4ybEtYTUg1dnUzYkNRRzNYMjdWWDkwRk1jM2dldU4x?=
 =?utf-8?B?NVdzTFpjRjdBL0NKOXJMdUtZdWE0endoWWQzN05nVTNJL3JZd2kwVEliMEJj?=
 =?utf-8?B?VWZFY3VvazdVelBTb1ZCajZhZDREeEVoVUVVdUVPWUJtYXE1ZW9XemUxaUZn?=
 =?utf-8?B?Vm5JOUdDd1RXM3QxeTNUcWhTYnlSNnFNZlZNTkhxUlZuVnVpcm9QV1RuVWFV?=
 =?utf-8?B?Vk04ZkdEcmFBdytxWkRjR0hsMUlrd3h3eFJTdklXVTIyeFRUUjZ1aEU1MXVF?=
 =?utf-8?B?SStxTzZVQjJNei9zdEVDM3dGVkgzdzhRY1lyUENhVjhZa0djRnd0SFVZWGdn?=
 =?utf-8?B?WklxOU1lVGFmVGZDQ1RndnB6K215bW9lUExFTTVsZkYzTTdYY2ViSEhocFFM?=
 =?utf-8?B?SzhZMXdTNWhTQjl3WFVGMytVWEFSZkNHV25KV0xGZ01TZ0RjQSs3U29xUldY?=
 =?utf-8?B?NXo0b0Z0OVo3d0lCQ2dyL1hDc3RPa05hUFBXbUZiQ1Z5U09SeE5WNStIWWp6?=
 =?utf-8?B?dmpWbzgxQ0E1bm42NFlycDc1Qll2UlBaU0tsb3VVSFFMZFh3SkFxa09rNE9u?=
 =?utf-8?B?MkhLMjRacXB3K1NabEtlbjYwbmE4dVR6Z0xvcDRPay9PK0czZ1I2U2IwbmFy?=
 =?utf-8?B?Uyt5SUt3TjZRK1B4T2p1SkV6dllwVmFPb05tdUF3SExYQ0F6SVJXT2IySzNv?=
 =?utf-8?B?Z1FTSzUrOG9IQWNVNlUwb3l2SVFDVDdWK0JwTWdYc05FVTRZc2tZcUpZMXVu?=
 =?utf-8?B?eFJ2bGNwNEdjeUkzWnB4cnZ6QXBJVVdCY25TcnI0ejloUzhVVnhydTI3Y0Z5?=
 =?utf-8?B?YmxMdEtVdGRwWnptRllkcU1SbU9hQW01WXZjMjAxNmxjbFRqOGFHWExSN2sw?=
 =?utf-8?B?V1lIcHF6WFk2dS80OHVzdkNqcEJlbUE2VU5QSFVyR1Zod1g2Mkl3T3ZJZW00?=
 =?utf-8?B?Nloxc1NNVFM1dnArRmVLQVg4ekRhaDArd2JPRXdiYlN6Z1R1RjhLUXI2U1Nl?=
 =?utf-8?B?d2R4UnpONnQwZXlJZXB2K05XSWpteUdPU3lBK3B5WFF0Z2RmUEh0a1ludFRN?=
 =?utf-8?B?V1BrNjJ3a1VmbTB0VVU4bVhDOU5UZFB6Q0owNzNPdk5ob3FXNGZwMUtZMG01?=
 =?utf-8?B?NG5PUUNNNW5reFE1aVR6QnhxT0laaUYvQlRFVWFQVGRZRXl0NFJLQ216U3Y5?=
 =?utf-8?B?VngrRUh2ajFuOXFudjVBNU5qZzMvTzR3MCtPM3QvSWtFWVAvV3l0RHhRR2c2?=
 =?utf-8?B?UXdpQXE0cXJRbTlJTjZEa0o3aS9jOWJSSzl2S1J6WktUU05KUEtwN2tXZHdM?=
 =?utf-8?B?aU5pNE52cWtPNk5ka2FINVBYUXNwa2hlWWNqc1Y5Ry9lVkpjNDRQamlCVGRk?=
 =?utf-8?B?aWpwZE1ydkJMaHdTMWtZTEh0K2hLYjJtdUxTSk9zeXZSeDdoN0dwU0xxUVZM?=
 =?utf-8?B?bTRYelVoWU11SkZ5SFhCaWpQNDBjKzNqVWFKSWFwQ01XN3B4aEJ5SWI5SFBO?=
 =?utf-8?B?Wk04Y3BFdkViRnVMK3N3cWFFQlp3LzlXZEtEL2lsb2Y3d1VkU0gwU251V0tB?=
 =?utf-8?B?NW1tTVJGdjFiRllOblQ0VEh1QXlLc0FieUUvMmVaeHZ0SnN1Y2daNHlnQmZG?=
 =?utf-8?B?TG94ckpxNzY5RFVpRUh6dlZXZ2s1ZllrdmhsSnhnRW1nMlNmYUJxejgwc1Nw?=
 =?utf-8?B?UkdxQU02REZLZVMrM0xRUWw3aDJVWk9lSmtRUStpSUxhUVV0U2JGMSt3YmFn?=
 =?utf-8?B?bFMxUFhVOHBsYmRxdGlIRHVEVUZOeGNEUmRXMGVWaTJKdlcvQ1dySDlvRTQ3?=
 =?utf-8?B?cVhoelUrWVNWcHFuMy9xNEZYY2ZFYmRxT1hsdFZhUnkxa1FaMFBGRkIvZi9F?=
 =?utf-8?B?QmRpb1o2N1lkUHNNcUJYbENpQ3JrNFZVemhYNEU5bldjSnVRWkwxRGg0aFVk?=
 =?utf-8?B?dHN4VGk1dmhnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <030F5D3AB0BF904F9B07034E8090C130@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8077
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a6e76cc-df97-4715-cdae-08dd93e0f6f4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHRMTW1XN2FKdjFSRkRoUy9qdExubW1PakNwQ1lqMGI0MFN0MWEwMzg1dDRM?=
 =?utf-8?B?YmphMjhBUWtKZEJhM3YwSEdRUEUxdzE1cTdZaHZYazVEczFjUzRsTlBaMEVu?=
 =?utf-8?B?akN0MXZIK2ZLVkhDVWFFUlNqcGUya21HaU5qaTJaWUJGVDRqZndaWk9lSmJp?=
 =?utf-8?B?ekFoREE5ellBSUcvY1c1SnpRaTBtOXBOZEJoTlNpdU5VZzh1WWNiZElDb1hh?=
 =?utf-8?B?WkRqeGJrc3N0V09hbWdFQkF5VE1JU3pWSTZFeUVPeWdzK2sxa21MNjBUYVo3?=
 =?utf-8?B?WVdjMUtFS05RRDYzYkwwcTNHUldkUEQ0ZVRxdkVSVldSN3N6N1hnMkJxdVFp?=
 =?utf-8?B?YysybU9uRVZvQSsxTlFFa3ovNDBjQUpjOE1WRzh2QVo4S3BuWUdlRkRhL29x?=
 =?utf-8?B?UkhCTUgva1JNT3IweWJ5SXErRkxrc2xtcnQ4RW5lVFdDbkQwdS9EdzBMU0hv?=
 =?utf-8?B?SkxidUx0TmRMZ2Z5YWx5bWlndDl5cFdqSFNZUHh1SC91Zmk5MWhLMmZrRUkz?=
 =?utf-8?B?L1ZpeGxSZGtoK2JEa2plbUVlUHBqZTRzczYxUDlyMkVnSkR6bzNmSlFKVDRV?=
 =?utf-8?B?djVrN3RGNkZra3plazA5MlNGZmVrUnBzdUo1RHFvaGRhbnFaL0hDSE9wY2Jh?=
 =?utf-8?B?d01wUHBjZ0tHb3RwTU1FdVVpMmNxbytLUjZuejdqbTBObUlDQ1Y4SHJsQ1VK?=
 =?utf-8?B?RThxQmlrSGFlZzJPNXdFK2Evd1ZuSnJXWVJuRnhxWC9YMG5EeHdzS0QrYVc2?=
 =?utf-8?B?djNNQjBUWEt3Ry9hQmc1US9DVEhTSGRjWTR0RkJCMFVINUs1cXFrbVBjZzh3?=
 =?utf-8?B?UXF5NkdKWnpDWSt4Y3M2U0lWK1JBSzcrWDl5T1FkOXE4V0haNEpLMWp3YkFK?=
 =?utf-8?B?dnRYN1M4RVJEdU9xN3pRNTVtcXQ2MG9VV1ZtRHNrYWtKY1VNODAvcUdDeXJF?=
 =?utf-8?B?TWg0T09HUWV0cjBVcEorR3J1NkJFbFJPL1hWSGlBWW5jSG1yeGRhZGhDZGlo?=
 =?utf-8?B?L25ERGJPbDRxbEcxY3RpL0NsUzl2QUkycHJGREc2dTI5a01VZlNJOUNBaUtJ?=
 =?utf-8?B?RDNodVdhSi9IWlZpQjNqV3hRY2lvbXpYejF6ZUp0Ty9BUEJ1V25CWjAxVFVB?=
 =?utf-8?B?UEhMRlRxbmlpSFNYUllLR1RUcEdROS9YR0YvZXBpM1V0MVczSVVzb084ejh5?=
 =?utf-8?B?OEFLeXZHb3NNZ3E3ZzVKekZPKzlRdXNLRkljenpsZXRoamRDUUNqTFBqUmF3?=
 =?utf-8?B?ZWl5Nit5UnowU0hPdE0xbDZ0WThjdnBZVk5OT05DUkdSSzNHYmljaEgxNDhw?=
 =?utf-8?B?SmVjRjZ1ZkY2MjJPSVlsN3plSHg3djRSZ3pGTzBLaWd5S3ZHKytWOG9nNklT?=
 =?utf-8?B?QnVFTW1JcWdEN0krYXdLak81QlRkcHIvWWRubytKdm9vdTFOSnB3UlFtV21K?=
 =?utf-8?B?M1BzTmhHcnJJYnFJWUd5UUJEZnNDcHRtdGwxS1JONWJuZHhRSDFjUUh0V21S?=
 =?utf-8?B?SDZ5bUZUeDF6eFptZzd3aW9IdS9yK3M3SytQVGhiU1NWbmdLNUtvWEFZZ0Zj?=
 =?utf-8?B?U2UyQnlXUVVFYnM0QW43YmdMZXdrLzZ6MEhpb3hoR3hKbkVDNm02WnNZYVQz?=
 =?utf-8?B?MjlrWFdIc1kvV1JOVTNtdWpUNnYrNktjOTZwRHRwNDU2cUY2VkY2UXYzWHRr?=
 =?utf-8?B?anV4dlUzblluTUUxdDBjVlZJS2dxNFE0clhFWXA0SmdvcjFmWWMyYzFkZWd5?=
 =?utf-8?B?YmZFbmtXeGwvb1JQWEhkUjhsN0JZbVd1Q0QyOVlaNG1lcmNNakYvRllEeS9x?=
 =?utf-8?B?eGpDa0lsT1NLSVdrYlFwVDE5Z0FKMThQZnFDZFkxSjhzcVFWdlp4UTY2UFJW?=
 =?utf-8?B?YnFlelFtc0VrRjgyUWxJVGgzS0NMUFNxWTI3dXpVWDFNVXB5aFJaTUNjY1JS?=
 =?utf-8?B?cHVKYUQ2eWwrckVCOTZZSE9GYnlMelV2eFB0YlJJOGp2WXE2WkRqWnBhSGtW?=
 =?utf-8?B?aUdNaG5ac2JESkRCUklWQVRleENGYzRMenZHckFLQWo5UjFOd1dtYzI1OVVF?=
 =?utf-8?Q?n0UMFN?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:48:15.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7e5752-4dbe-4d1b-85de-08dd93e10cff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 18:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216702

SGkgS2hlbSwNCg0KPiBPbiAxNSBNYXkgMjAyNSwgYXQgMTY6NDcsIEtoZW0gUmFqIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA2OjUy4oCvQU0gbHVj
YSBmYW5jZWxsdSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bHVjYS5mYW5jZWxsdT1h
cm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPj4gDQo+PiBIaSBBbGV4
DQo+PiANCj4+PiBPbiAxNSBNYXkgMjAyNSwgYXQgMTQ6MzgsIEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUaHUsIDE1IE1heSAy
MDI1IGF0IDE1OjM2LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3Rl
Og0KPj4+Pj4gV2h5PyBDYW4gdGhhdCBiZSBhIFBBQ0tBR0VDT05GSUc/DQo+Pj4+IA0KPj4+PiBJ
IHVzZWQgdGhlIHNhbWUgYXBwcm9hY2ggYXMgbGxkYiwgd2h5IGRvIHlvdSB0aGluayB3ZSBzaG91
bGQgdXNlIGEgZGlmZmVyZW50IGFwcHJvYWNoPw0KPj4+IA0KPj4+IFRoZSByZXF1ZXN0IHdhcyB0
byBleHBsYWluIHdoeSB0aGlzIGlzIGJlbmVmaWNpYWwsIGFuZCBzaG91bGQgYmUNCj4+PiBhbHdh
eXMgZW5hYmxlZC4gV2hhdCBpcyB0aGUgdXNlIGNhc2Ugc3BlY2lmaWNhbGx5IGluIGNsYW5nPw0K
Pj4gDQo+PiBvayBJIHNlZSB3aGF0IHlvdSBtZWFuLCB0aGUgbW9kdWxlIHdpbGwgdXNlIHNvbWUg
cHl0aG9uIGJpbmRpbmdzIGZvciBsaWJjbGFuZywgc28gSSBndWVzcw0KPj4gc29tZSByZWNpcGUg
Y291bGQgc3dpdGNoIHRoZSBmZWF0dXJlIG9uIGlmIHVzaW5nIHRoZSBtb2R1bGUsIG90aGVyd2lz
ZSBpdCBzaG91bGQgc3RheSBvZmYNCj4+IGJ5IGRlZmF1bHQuDQo+PiANCj4+IE1ha2Ugc2Vuc2Us
IEnigJlsbCB0cnkgdG8gaW1wbGVtZW50IGluIHRoYXQgd2F5DQo+IA0KPiBKdXN0IG1lYXN1cmUg
YnVpbGQgdGltZXMgYmVmb3JlIGFuZCBhZnRlciB0aGlzIGNoYW5nZSwgbXkgZ3Vlc3MgaXMgaXQN
Cj4gaXMgbm90IGFkZGluZyBhIHNpZ25pZmljYW50IGFtb3VudCwgYnV0IGRvIG1lYXN1cmUgaXQu
DQoNCklzIHRoZXJlIGEgc3RhbmRhcmQgd2F5IHRvIGRvIHRoYXQ/DQoNCk90aGVyd2lzZSBJ4oCZ
bGwgZG8ganVzdDogdGltZSBiaXRiYWtlIC1jIGJ1aWxkIDxyZWNpcGU+DQoNCkxldCBtZSBrbm93
Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

