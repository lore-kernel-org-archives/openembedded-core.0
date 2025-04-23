Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3960EC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:26:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web10.4993.1745404011276687885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hrLNEUC8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hrLNEUC8;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hoxRNvQClhpYs5hrgD1aymy7BTMjbsMFfMoV6vWFoMlepQGGQ+iiUTtmW7kqrTz2CQ6ylJx3SsSWkYIt4YJxqynKNuFDlgcNOHKZ0Nzefme8squYg1Nf2Y/gQwXAU/OOuL/RCVDDoym9JtvER6/v9NHbRZp65P0Q3kjg+yDrUvSwPSDq05d+Heiysc9gpKgpPlSez+I2yVGUs/uzT+O2s7rj+JnUvcBLDdJxEE/k/fVdhJXu8i7kYwxZmncQpCHE0nB17MkqfiXngbFKpvAY1LvgIDAFm6GmP+Q5RiN74nvhwJAF+1agF93GmNTOMzcgjHRoeQelIIkNu54/xiGzJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RZpIEEJWjht5/3N6hpIzJMRTzWym8BlG/N0SXkCjGs=;
 b=HsYmP8Qf+/ngcBPoa/uaeGfEGwR7bIRXnu9UEO7NgVqRxjC62MvgVS+BM5tBMr3tPrrj1N5rJH8rKfZVAVlboCdALV4qfVnUXKxAVO4A7CtDOmstSzovAmud6g1U6t75Nz/i4KZbdu+XPGa//Pwio/DUxGHyvhRwY6ZRnxPWEbMx0aYSX+Zo98cAOn+0NuzhPNwc0WbBG6kSBvrVHkFbukih25CkLZU0jKM1/NteYAA/ixopnCO2kqUmBiDQFdz+UuKrIGHvoZDO2nzaCN1qQGiZNlg8Hw8gGHxnvsiDEYcTijwDVokztYXGqm/lUYuYxEWR27ZaTH8NsC+xNK9RCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RZpIEEJWjht5/3N6hpIzJMRTzWym8BlG/N0SXkCjGs=;
 b=hrLNEUC8U4vYiuI0UmTn00o2yw0CXsLIStucqUicZvh9sOoIFRWw3GpUNP5W0aa13yEBisomfqvjYfSyGRgp/YVd/SVQqCRhvjDXcIMF2lV1ued6YzpXNc7+wp2ibE2J26WhflmZjN8JObz9TP21i1wooZjD+8dgyuW8eGHlr0E=
Received: from AS4P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::17)
 by VI1PR08MB5311.eurprd08.prod.outlook.com (2603:10a6:803:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 10:26:47 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::44) by AS4P250CA0014.outlook.office365.com
 (2603:10a6:20b:5df::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 10:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 10:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKSuvhMUrW0lNHxqc9v9SMTzCcYQfRIgyjT27l84dk2XM14a/5U1JrvV0/8SqA10kkU9K4FHn2H/HikuJyyclR/bsS5W+HiAh63nWjRSiD+DDpXcprkV/uMT+71K36+K3cXAQSJzKQxA6F2YSsrlSLyzEHXeWXfGfi1PoCe9HfVHdbL+/PccW1Z01nB7Lruwws1IinP6cmbIInx9Vz2+YLLAUGiTnQl+aBjcFblVVhyxd7WeBOqTZeSIocccKfagvi2BAjlq3pDBG++CX7TCBydK4AekDGzXFRYf78y8muzLYDA+ASfxISn3x3O2jnGyuRuTXl+Cdp5fcE4VCMS09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RZpIEEJWjht5/3N6hpIzJMRTzWym8BlG/N0SXkCjGs=;
 b=VwlDfM/CiqpQ0kfwZKET71vMn+sSfomxtGhuEhHywocXjSkHh70N9rSrvJ1wZfj0UlzQMv5UWA18clWyDBDqOGAadRaHiiDCD6Uvlh8mi/faZTryiH7FXJ+V6qcHETXH4wsYoOYVqY88JTW+zGSQ/6Wpi+fuiRrOTGGB9TKOxqcyZdzmMUHaA3gEmX4qimNqkDLSvhZ9HvV+b/APBv581WIQhz7zhpf0vAijWuS0vlDubCXlYEig6PYgsRq0lnLgb8WUz+io35KQPZLLUz38ExDOiHQx55C6Kog8PQnzx47+yvJeGvt2nRBUK+Fr+Lt8B8uOevhu5IBYn1vR1TEwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RZpIEEJWjht5/3N6hpIzJMRTzWym8BlG/N0SXkCjGs=;
 b=hrLNEUC8U4vYiuI0UmTn00o2yw0CXsLIStucqUicZvh9sOoIFRWw3GpUNP5W0aa13yEBisomfqvjYfSyGRgp/YVd/SVQqCRhvjDXcIMF2lV1ued6YzpXNc7+wp2ibE2J26WhflmZjN8JObz9TP21i1wooZjD+8dgyuW8eGHlr0E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10628.eurprd08.prod.outlook.com (2603:10a6:10:52d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 10:26:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 10:26:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH RFC walnascar 3/3] genericarm64: add ttyPS1 for KV260
Thread-Topic: [PATCH RFC walnascar 3/3] genericarm64: add ttyPS1 for KV260
Thread-Index: AQHbtDnm0lCdb5eJyE2AXL5oeXvmnrOxC8aA
Date: Wed, 23 Apr 2025 10:26:13 +0000
Message-ID: <9177D0F1-D21B-48BB-BD0A-EB0D36BA6537@arm.com>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <20250422190053.3244331-3-ross.burton@arm.com> <aAi_26B8GiJ_GocG@nuoska>
In-Reply-To: <aAi_26B8GiJ_GocG@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10628:EE_|AMS0EPF00000191:EE_|VI1PR08MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 53481647-ecd3-4942-c1f6-08dd825159ae
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?K3dwZEJMZ3IzYmd2V1czSFNaUXRQdk9tUXZzV3VyclI4R25ZeDM0ZHVyeWEr?=
 =?utf-8?B?SFRqNEliRGQyR2c2QWd5Ump1dmNMNFZSdVByVXQwWEFNWUdaSDBTMWgvR1NG?=
 =?utf-8?B?aE1OczdPV203b1F6aU5MbURJNFVqejQvZWlrRlFOSm5lRFJjcFdtWTNsTzFZ?=
 =?utf-8?B?d0RKZmw5UUh3NjVyU1UxSjdyRForaDlOS2gvbkJmMHp2b3NlOEVObEQxc3A4?=
 =?utf-8?B?b01uUEZlU2hucU8reUd4L3dwMVE5dkZFd21EMDE0SC8zUkNFSUZtS3hmbm12?=
 =?utf-8?B?d0RlcFVxY0lrVTFWRmIrb0hHc1IxVjhndmpVL0Z0SDRkb3BJY1Q5cDFGOWg2?=
 =?utf-8?B?WGs0Y2d3Ly9TTGN2dzNWTXBpWk1QRm1WdDhDcE5CYnlhU0xQQkY3QXRiNkNG?=
 =?utf-8?B?Ty9uSlVXVWRWSlBwdHRsS0o0RE1MMGlhWnhWSWZjRGdoMDd0UlFHMGxVS044?=
 =?utf-8?B?WkRDZ21tSWdZMzBZSUdYN3h1L3Q0QVZuRzJEN3JyMVRGNkloZnAzOFNvbGZR?=
 =?utf-8?B?czdXYzRrMW43WHdkT1RTU2dHYldNTGhER1g4ZlFkeFFobXpvbXRCbjJCTEwv?=
 =?utf-8?B?SWVYQmU4YklWUmJpWHpJRFBvTHJickUzOWMyRmFBWlJTQ0ZKeUoxVlhDYXVD?=
 =?utf-8?B?b3dZMUNmcnpNYms2OUo2SkhZSUVwTjFaYUEzMkFQUEtBYXBLYmh5Z2JPeDRp?=
 =?utf-8?B?K1hWSTRMQnFqUkxvLzJtajFoNnJGZW9vaEJnb1VUa2paUDhYeXVJVHFnbmlo?=
 =?utf-8?B?Ums4NmcyOWdYWXZGR3M2am1OMXIxZ1pZOTdqcHRUV0dWZ1pUcWRsMkdPZTk0?=
 =?utf-8?B?anRGR0JjNlJEalhiSk0rb1JsTzErM0praW1MUUMrenpVWVNXMnppQ0I3V1FM?=
 =?utf-8?B?bXZvWDJ6LzRTcjFiWG1RU2hiR0llSlJVY3dIWnNvaFZIMDdBZVVzdUNzZUIz?=
 =?utf-8?B?bmNzZE1Dalh2UW1WUTBkeFZjOUxVVjhQdjF1V0lRUXF5eFQvLzV6bmJEWkEz?=
 =?utf-8?B?WXgvWk1rSXk2UDZFUHl2QmxaaGJXR1htdkFUTnBla3FNTzFCZThNS1pmUGlu?=
 =?utf-8?B?QVhzRHk3U2xUeGhRUkMvK0hQVGVtWHFPS1dXN0pCVXIzeVhCbGJES2QwTlRz?=
 =?utf-8?B?a2x0aHNrK3hLZ1dGdW5rL1dBSWR6UGVURkUzbWtaOThCNFgzOVRBVVExL3VI?=
 =?utf-8?B?aTBKU2grMUJxWXZLOVUxeDFacGFJeXNWZmdqZ3pvU3BNZU9oalZMM28raGRk?=
 =?utf-8?B?T1I0Z0N5b0xlT1JwbUt5QWZka2xDNEJMUHlMOXhhanZkOGREUkx2TmZqRFNn?=
 =?utf-8?B?WUNTbEFzTGo1cS9LV21xQTZPVUFTQ2Q4MzR1NTBWUVZoakpZZUZXMWpGeVRE?=
 =?utf-8?B?eW5leitWcXNNcVZyc1hGM3I0WDRGc2t0NEdZdGV1d3lxNWk1cTBZcHZFTC83?=
 =?utf-8?B?M2IvVmRuTS9DZHY2Q2tRU3ppd1A4WktLWXBSc08veThFeittT2pra1Z2ZEo5?=
 =?utf-8?B?OTQxamVaZEV4TWJsZWt2bHh3V3NhOXNXUXRqamsxSkhhY3lueGtxa3ZMdCtR?=
 =?utf-8?B?dS9tblRHWDUreWxsODN6ZGx2UUZaZ0dSQXlreEdMeEhVWmVrbEpTQThZWjdF?=
 =?utf-8?B?UjFiTW9TZTBrQTdzMEhhQjJOSVVUc2lVTU5hVG5vUkp6ZndMeUlZQytiK1ZR?=
 =?utf-8?B?ODdjekRkZXhRZDkwTGVnYmhic3pPWm9udUQ2QWFXNEVRQm8yaW82dnQ4YkhM?=
 =?utf-8?B?MndmVXd5aUduUmZRd2ZlLzQvTU1aV1VxeDc5NzczcE05S3VDc05CTmVBRENi?=
 =?utf-8?B?Q3Vqdm1uQzlZUkdVZmJYbGtoUFV6T3VYcU92Z0JTb1BUS25OS1NVSy8vYmly?=
 =?utf-8?B?cG94bEtwbXo0dVBjUXRnSDI2MXdjdVMwSFJIYjRabU5pYXV1U29VMjVVRHdj?=
 =?utf-8?Q?GllM3ArENdg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F485B9C83FE73D4195854AFD2632896C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10628
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30c293cb-fdb6-46b4-b914-08dd8251460e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|35042699022|82310400026|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckRsQTF4RmpkYUdtakxKaWVWaVhPUUlna21ZVXhWRzlTOXlrTUdVR2Q5Wkg0?=
 =?utf-8?B?N0hPREdzWlRIdFJFQWRpNVJOeGpNdXdhQzNHQitBT0dxZTJXWlpIbmNJcmI5?=
 =?utf-8?B?Q3paUTRiVTAyQ0ExMFRUL3dVWmU0aEJPcG90SmhPcUQ5Mk56clMvbkNSVWdm?=
 =?utf-8?B?NnVQTUtWUE5IWGdmMHZzeGlkQkppdW9nb295L2lkZWE4ZUp1TkFXQS8rVkZY?=
 =?utf-8?B?OEM3T20vY0FUblN5SHE1eXlFcXpHZkdsNjNRd1AyQmo4ZG9iK0VWcEhiYzNw?=
 =?utf-8?B?eUZNaGJZM3pCOERoR29tNUpFc0I3NUxkWWt4TlkycEpnUTFnMU1zWnIxQUEv?=
 =?utf-8?B?MGxIYTBEcUU1YzVKcW9lVmlKQmp1aXJPa0ZkcTVaK1FyelJMZHJLbWFEbVlY?=
 =?utf-8?B?d3p3WWQrdnlST2NTWnVUUmRHNUxEeC9LaFZGQnhYOXcyemRQMXdEb3dwMjhy?=
 =?utf-8?B?bU1nWHFsWEx3Qmt2eTlxU3AxU2kwY3NGMXgwU013bnVlMkhRWTVvUXJ1bzRB?=
 =?utf-8?B?bGZ2SzM3eFhNbDhzQ1cwMStML1FaLzhhZERNbGhwcDdYUEp1UGZINkkrWnBv?=
 =?utf-8?B?NjBuWHFlMllzdFUyam5WMWFoTlVuV1Z6MTdqcHo0STJRQjFzdy80ZGc4M2Uw?=
 =?utf-8?B?WE10MHB1aURFT3V5SWlvRW9zTnBSaHNKSzhyK0d4RDlTWm1EZjJRNndoaFJo?=
 =?utf-8?B?RHZyK3psR1V0T2VENkdkdnRjbU96VFZ1Tm4yV2o3eVg5WmVPYWtrbmdNcTVS?=
 =?utf-8?B?MzcvcklWM1U3RXRFS1FwMTdTanFsTzZEV1VsTDBFQWp2MXBCZ0srbk42TXkz?=
 =?utf-8?B?Tkovbm1udGtkekVHS3ZiTjE0eXUzNHBJbHVWaGhQdloySE5pUTZoeExwNXZw?=
 =?utf-8?B?S3ZwL0pMWVcvbWRjZDlwRnJPUjR0NzBPa2puYzZ5alF3MzdjdXRlcHJwZWc1?=
 =?utf-8?B?MUQyY0p3dWhneEFENzZaV0Q0MFpMSkdKRzlhczFmMEdlYkd0anRpNDBGRkVB?=
 =?utf-8?B?RXFlallrV2dYU0VaMUVnQkQ1V2xiYVhxcWRSTGRQZU5RRjV4YnhEbW9ncEUw?=
 =?utf-8?B?YnVNSW9NR1FUQ0JCMDNuSmhDWFg4a3NrQSs3enJZYjgraTkvd01KT1Q3Q1A1?=
 =?utf-8?B?Q2tSbDZmdW1zdW1MamdpUUZzcGkzMEEzdHNFb1B5VHROMEh4UHowVmQrbFNw?=
 =?utf-8?B?RzVua05HMGd3RGo5Q25Fak43aXlhOFZzSkt4cTdLdUYyLzhkNG12TFB0SG9N?=
 =?utf-8?B?TXZsWEJFZzk0VmprWHh0REtjUVR1VzhlKzRxbjRpMlptSDk5VmxVbTJJa0hN?=
 =?utf-8?B?U0IvOFNQZjcyc29ZK0xIZVd2cWlvbzN5UGY0ZjZYZTVFQzV6YkF6U1RJdCtV?=
 =?utf-8?B?U2wwQjV2Ym1lUVM5bDFUMjN1WUM1d1BlRWR4U2E5NDBaL1RxbDcrWmFITnBx?=
 =?utf-8?B?eXlCM09DKzlqdWtuUkduSDk5M080R2VvSHdBSEFqNlEzUWtUQ1pRNElmK1pv?=
 =?utf-8?B?Q3lhTVU3ckpZVDlJZFcyS1BQa1lXcDU3OW1BV0tkU212RUc3OWtUL1hjZ21q?=
 =?utf-8?B?bGJyZXpkS2d2OVJoMG13L2YyQTZ2Q2haR0xQWWdUS3Bub096R0RDOWpISzdN?=
 =?utf-8?B?R1hQSnhPQnlQeHhjditnaUd0eTgwQmhjN0xJNWFvdkltN0paeHFUYkx5OXJn?=
 =?utf-8?B?K1hpcFd6TjFyc3FzSmhZdDAzdWR5OC9WM25JOEJLdHJEeUFyd0QzdHFGaTZZ?=
 =?utf-8?B?WVRXQ3Y4VVVGbWFzWHMzLzBBbVZJeGJlRzA1Zzh2bm5BZHRrNlRlYmRnNXls?=
 =?utf-8?B?amY5SldsWVhvUlRlOXdYQ3lzeTlZdlJqejFHY0ZiZHBSY1dJNHh1T2ZnRGFm?=
 =?utf-8?B?YkRQMVc5c25RaVY5VXZ4WElqcU9vMnh0QzJFRXROTnd2bFF0SUFBTXFEWTlD?=
 =?utf-8?B?TkNHRSswd0JZNkYrZDRxdmUvb0Q5VnZrMG90YndldmNtR0cyeGYyT01CQVl2?=
 =?utf-8?B?ZjljNjBLRzVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 10:26:46.4284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53481647-ecd3-4942-c1f6-08dd825159ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215277

T24gMjMgQXByIDIwMjUsIGF0IDExOjI0LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQg
MDg6MDA6NTNQTSArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBUaGUgQU1EIEtWMjYwIGhh
cyBhIHNlcmlhbCBjb25zb2xlIG9uIHR0eVBTMSwgc28gdW50aWwgd2UgY2FuIGR5bmFtaWNhbGx5
DQo+PiBkZXRlY3QgdGhlIGNvbnNvbGUgdW5kZXIgc3lzdmluaXQgd2UgY2FuIGFkZCBpdCB0byBT
RVJJQUxfQ09OU09MRVMgc28NCj4+IHRoaXMgcGxhdGZvcm0gaGFzIGEgd29ya2luZyBjb25zb2xl
IHdoZW4gbm90IHJ1bm5pbmcgc3lzdGVtZC4NCj4gDQo+IFNvIGZ1bGwgY2lyY2xlIGJhY2sgdG8N
Cj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcG9reS90b3BpYy8xMDkyNzM0NDcj
bXNnMTM0NjEgdGhlbiA6KQ0KDQpQcmV0dHkgbXVjaC4gIEl04oCZcyBob3JyaWJsZSBidXTigKYN
Cg0KPiBUbyBtZSB0aGlzIGNoYW5nZSBpcyBmaW5lIGJ1dCBpdCdzIGFsc28gb2sgdG8gbm90IGFw
cGx5IHRoaXMgYW5kIGZvY3VzDQo+IG9uICJwb2t5LWFsdGNmZyIgZGlzdHJvIHdpdGggc3lzdGVt
ZCB3aGljaCBpcyBtdWNoIGJldHRlciBhdA0KPiBkZXRlY3RpbmcgSFcgc3VwcG9ydCBhdCBydW50
aW1lLg0KDQpBZ3JlZWQsIGJ1dCBhbHNvIHN5c3Ygc2hvdWxkbuKAmXQgYmUgaW5vcGVyYWJsZSBv
dXQgb2YgdGhlIGJveCB3aGVyZSBwb3NzaWJsZS4NCg0KPiBOQiwgc2hvdWxkIHRoaXMgaGF2ZSBi
ZWVuIHNlbnQgdG8gcG9reSBsaXN0Pw0KDQpZZXPigKYNCg0KUm9zcw==

