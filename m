Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C90DCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 20:50:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.web10.3119.1760993439999804294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 13:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QsJ9mdyX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QsJ9mdyX;
 spf=pass (domain: arm.com, ip: 52.101.66.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wfm7E9avh/Ick0ySRQT6nP+Hpzdipg99M+A8hIvP3oDlt6rbif6xQQt3wlr5aRy657EB1O47Mo+E4UKMr0yw+8AoOncl+8vRtMhXI6RggsP36NxmuaEr2m+p4csYd0M+FpUJuczocX+Tm6DqExVeoclARHrnmxCspmzNGzXvY5zwir8HOrjygZNK8s/2hw6XHnTQw1bN3iayhiQHw9qj/DiwKqjY1hcWE82XQeYVuxhcghoBx29W4avLURQvjORzaxwVTpQEZZdqi/lPzED4Fy/Ld90wK6IUQgW5W6pL5FUnwMKwAzNgMmrn7phihc0jO06BWubE+JoMQ4+aEJW2nQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvTkka2ys1ecbXOoMwiTNAzaYitcjksNueqKfLgV6jY=;
 b=XvBOU5jLQkBymy3XVOqG0mrPLw6yKWJJVce9+iorYF4/cqweL8Qxmnb0MLoUlIvWMVqKOTKl8WqqpZzP6Yf3x53s82JWDjyKQgBAXA+I/w22D/xfCftIBYCqJweoSKjSyFEik0KwkYaHGjbRhAJLm3UEos6DgRmR8kP5LMQfK3Bv4U81ZJlaRQ7I8GxJzNZXcP0Ryp5ITauPyJYcxOdCel8lavJUQZ3aCoTe0fNKK0w+29u6R59ErNzT2yV8LV5f6vTPbPoCw29sBOycVaARw+p/92zBzyA02E5sWjiYVVyQ6SJMAAeH4Tvt70AV1BAXvP6BhwyZKOOj6Tn1OKlIEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvTkka2ys1ecbXOoMwiTNAzaYitcjksNueqKfLgV6jY=;
 b=QsJ9mdyXto2XP7hK1mvq5y+vh4AVvzvED+y0X/zHCNodub83hrbAv/C9IPneWvUfzTPGAnP6DFRSNJb/rcQQEgd1QkLyJ2QBmEG+LzMStSDoySk+3d/UvPM7fONIzPdY49ag1n6tXdv4zC07AcHmC6tdPNRvXetnhFF+l8mSgRE=
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by VI1PR08MB5343.eurprd08.prod.outlook.com
 (2603:10a6:803:12d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:50:34 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::a6) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 20:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Mon, 20 Oct 2025 20:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riZ8SZHYt12gGXEl3vADxx2qYbYyGV6pEc060w2ESpgERE6oRzIEg7fpkw4Y/yGJBIeZCCzbN53yT3nOk1/2tbAUqwwftq9Jkwt6nWqO++n9C8AjLOS06Eoqjhsiyg2JcmyJmRpirZhmwprN6mk3g4pg8a7MnU1M5IG9sfjieeFqlA9OO2AyaxFRxucSrm3m3J2feFnK+gU7zNkY8m0dQZqoIwXFyuf1gUtWhnyuoSENUfII1AdIcUNojsIeNobYNummV3lOWmB15DfoMVmIH4lQ834sFS4YjSzgUtw9Hx51ixplPLCdnOdihrDR0YpCAQmQLclbzNfxKA0jAoK6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvTkka2ys1ecbXOoMwiTNAzaYitcjksNueqKfLgV6jY=;
 b=vS+irSaCH6qIy8g1h+AvZFLU4wXuxUg1gvKI3UMZ+u64QjoGB4v8HlPfVSaOxgjq1+t0ivrGcq5Fsx97VRdR+zFpNmTLfEyarNF8J+7Dr+BV1zvqrO5PutVTszlgGNm0J1g6T6d5tgnvgEhyY+SaUoTauwzr9hnB/JdTu5ICh0dSeqjO9Wd38JUAekiRNvzMqc5zRMJzP7s9fCW5DlZ7qzMWzmCvILzsZmM8gjlqC3ZAX2eRvhNSEkPIyn8hqZkdGa26C+K9x3Mj/4fSY1kVKhDlbXmFKuLUGGp+ezK1Gqcy1sj0migOWB3FKkiNp6YQ0B2P8eOOJSNFHe91CcMHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvTkka2ys1ecbXOoMwiTNAzaYitcjksNueqKfLgV6jY=;
 b=QsJ9mdyXto2XP7hK1mvq5y+vh4AVvzvED+y0X/zHCNodub83hrbAv/C9IPneWvUfzTPGAnP6DFRSNJb/rcQQEgd1QkLyJ2QBmEG+LzMStSDoySk+3d/UvPM7fONIzPdY49ag1n6tXdv4zC07AcHmC6tdPNRvXetnhFF+l8mSgRE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10786.eurprd08.prod.outlook.com (2603:10a6:150:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:49:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 20:49:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] sefltest: disable qemu graphics
Thread-Topic: [OE-core] [PATCH 0/5] sefltest: disable qemu graphics
Thread-Index: AQHcP2FkXA5LkfNX1E+ZMibX88b0qrTGqMEAgATenwA=
Date: Mon, 20 Oct 2025 20:49:57 +0000
Message-ID: <F32EB93D-A34B-48F1-8DE7-0479C41843B8@arm.com>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
 <CANNYZj8-ujhLtW=6uHzD9F3xF1okizVwzexbnfxnkSkHEhmxwA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8-ujhLtW=6uHzD9F3xF1okizVwzexbnfxnkSkHEhmxwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10786:EE_|DU2PEPF00028D0D:EE_|VI1PR08MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e3f4a5-02aa-4313-450f-08de101a502b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aHJhQ3BEbkF1bHNjUFNVQWRpd2EwbUxlVE0rcG5EOXY5MTJ3LzhuRUNLZEdm?=
 =?utf-8?B?L254TUREV1BIa0tOODY0WGh2NUpUVEtrR3dzYm9sM3lFWDFHUWhwbTBsUS96?=
 =?utf-8?B?VkNjSkU5WG5lL0JLc0JmVVE5YlVqM3ZLZ1hLV3dZelVEUWE3V2dab01HbGNT?=
 =?utf-8?B?TW5lT3Q5U3ZQekRvcC94VEpzcEdIRDVFMzNHczRlTTRSbWp0akZwNE50NE1x?=
 =?utf-8?B?TzJxb3BCM3Z3azBaT3V3OG1tRTlZSFRGb2g4aEJLbHZuYi9aUDZaSHliQWN2?=
 =?utf-8?B?S2hvcmUyVUE3dTFPazkvemRYV3p3YUJjWHU3SjN2QU9jR3VtMjZQRjBlV3BU?=
 =?utf-8?B?RlVQNTQ3LzNTaDdoU3QzbWFFS3U1WUJrcUROOWdUWmQvQ3BTdU9sSGNqMFIr?=
 =?utf-8?B?cUZSZ2wybWxrZ2tNUEtWSHpmZUFDSXJvVzFPbjdYLzArelZHcVM4MXF6VGgy?=
 =?utf-8?B?QXBqWGMvb0E1OC9Lb28wK1pOelZBaXZ1bC9TRWltZG9nTXdGaVdUVzVldFVx?=
 =?utf-8?B?ejRUcmNhWjFjdkFSRmR4UXoxWHNhVnNXM3dGeWdEOGo4dUppZ3VMUWdmODRw?=
 =?utf-8?B?SC9DZGlDeEFHZlc0ekVwOFdlQndqNEMyYzM2V1ROcXdGMXpUamdzd1JPaXJ3?=
 =?utf-8?B?SGdmZHdWYXZOTktORi93OENDTzd4T0pLd3U2UVpXTFV5NUlyWEo4ZnNhdG9z?=
 =?utf-8?B?WFR3VWp1dmRDQ3Jrd2pwSlpKNFNHdUF3RGk2UjNzWFh1REs0dXRKSTFJR1Qz?=
 =?utf-8?B?RkR1UUZTN21uMEx6c3FPS0xycFplUjI4UzA1MXd2Wjc5b3dEWnVWbnl2Wmwy?=
 =?utf-8?B?dmtDays2S1dKRXd5N3JxazhLeXh4MVpoWlBJaENkUTE2YTRrblNHbzA0V2FG?=
 =?utf-8?B?WDRVT0srUjFFRUFDczVIZVUwRFViZFBMWjI1eWhIVW9hMGxIVzk5T2doYklU?=
 =?utf-8?B?bDBLSlZrM2QvbFhXMzZMdXFXdjdKQXhRa1FLaURhVHhUazFjM29BbXJKTVgv?=
 =?utf-8?B?Mmt1YnNvb0ZIemxDYit0T3J0SXQ4R1dpYlJJLzg4S1krdDJ6SGtUcm1WNkNi?=
 =?utf-8?B?TWpmYlJrWEZnb1Z6N0NDanJ4SzhkeWxQUEN5VEdzdmM2Mjh5OFM1aVI4cDdk?=
 =?utf-8?B?WGpjQWxKQ3FGVFRiNjBBeTFEWGVFbVdYVU5FbnVJejhwN01OcTF1RENxYWRr?=
 =?utf-8?B?US9veVd4Mi9FMDZFMGw2THIzYXJ4ZnNtdGM4alBhQ3IzeEl5S3NXMVk4c2t4?=
 =?utf-8?B?S21TVFBZZVhhdjJRQlFvV25xSGE4NThVMmpGUVBvSmdPd1NpaUlkQmI3N1d4?=
 =?utf-8?B?UXMyQkFJQkVVUGtIZy9sdjFNT1E0SjA2d21sU2lZRnQ5SzFndG1kNmhPdmFn?=
 =?utf-8?B?MXdGUi9hOFFSRjRaQXc0TkJrTDNuVTgzSCtNVTVMSmtIN0ZRYWtQY3FFd1Vm?=
 =?utf-8?B?V01TU0NFdVpBZDRjbm5PbklZM3BJODZKQm9KSStLSC83c1NxcGM5R2pOOWF0?=
 =?utf-8?B?TERCTjZZOEE3ZTRISE1RL1F1LzRaQXFsajFJZlI1UEo3OFB3bGEzeURIc05E?=
 =?utf-8?B?RnZrOVg4Q2RqVzlNZ2drcktsUFpaZXVLMGRRVzF3ZHY2eFp4V1ZiZHRMMS85?=
 =?utf-8?B?c3dDMTVSbjc0OTJNazZ4cENNRVdiWWh6OU44aTNVd2lRMEwwNW1CaFY4TDY3?=
 =?utf-8?B?SllXNUhQanBPazhINWRqdnpRV1ZFUHdkU3Z5TUs3cU5TMG1kY2xMcEJVR1FE?=
 =?utf-8?B?WFNJRTRsTWFSNDBWZUVUS0I5bFRMQ3JRSEVsb3o0NG5KK3FkYU5RRTE5ZVc0?=
 =?utf-8?B?REs3SStTQkFHbkM1S2JNV09TSXY1S1BHQXl4YjBWdXhFRkl2OWNRNWxxMVBG?=
 =?utf-8?B?c3laRHdqc0FqeDBIU045Mk91bkN2R2lrV3pRZnM3ejhsMlNINXdFRnlOb3Bu?=
 =?utf-8?B?TTNpSUMwQVN5MXpRUHEvZWgxWHFLZ3lZdEFqRzdoZWdHb0ZJdTdDZjVDZjhN?=
 =?utf-8?B?cWxwOEk5VFZRb2FXWmtLOE1GajcrWnRQMmVWeHdRNkFjNDRlRDJjUk1NN2c1?=
 =?utf-8?Q?cAJsW5?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07B8FE6E89AB774A9F3CF6F4E6697231@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10786
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	53c15bfe-8b22-4924-ae04-08de101a3aa6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmRiV0c1Z1g5ZldJbFA2SitYdjF4amt0M2hKakdwQzE3ZFV0T1lSZnRCZU1l?=
 =?utf-8?B?SDUxMVVIUjRIVG9XSmI5RGthUkNlVjhzMDFqMlhkWksyZnVzbHNyL055MXg3?=
 =?utf-8?B?VVM2RGd5UFdjTDIySTlhZmNYL1FFbWdjSUpzb3VkTUZHUHRmTlEwNXVkS0xP?=
 =?utf-8?B?RUJoeC9zMC9PM3N5QUF4aW1WSzY4OEhiam9DaFVFR2VnR3BHVmdvSUNHbVY4?=
 =?utf-8?B?dk05M2NqQnVyWUN1aktxRUU5VVpnaStISVh1UDh6U3RJYjl6TkcxODFuWHMx?=
 =?utf-8?B?L3NBdGtPbVFqOFFCNXNPdDlNNjZuWHdDMWVjTjRwbVMvdW03dWE2cFVBanRz?=
 =?utf-8?B?a05XMVdJU3lrVGhLUTF2K0k3WTRsTXVnOExBV0x2N3RsUGU3MG1IV2dES0U5?=
 =?utf-8?B?K0JCRXIwN0RiVzZpOEgxME5ac25yR0Izdm1oL0xocUFkUTVEY09rUFZtWERI?=
 =?utf-8?B?dTRvdjNsMGR2U1NIQUg0ZlhxZW9ZbjNLZldVdHBxYUduZHljbmZjMGMxK2c3?=
 =?utf-8?B?VVI1SElUQnN1ZUdNUk1TM2l2MFhjc3lXQ3NzbURxanpHNHJ4cXJXdVd5dThk?=
 =?utf-8?B?ZGF2c1U1cE1PV0FyNmJKZmlNUzBEQ2Z5RlF5SzZUbjAyRHV2bUtNMFFCZ2VK?=
 =?utf-8?B?aFBad3JsOVkwV29GUTdPRVhMM2ZOTld0VmM1Mk1taTYzQWdiOHdha1dxMkFv?=
 =?utf-8?B?Q2xCQXR1YnJ5TGRkNmdYcGFTNVFvMDB3cUZZdDZWV3h2cVY4VmNnMXJ6ZHRT?=
 =?utf-8?B?Qy9HN1phbDMvSVgzRnlvU0hTMWFXSnMvTGFtUGdrU3VFM2VaTElNTlRVemo5?=
 =?utf-8?B?SXhEYUJVMi9qMUtLRWdiVFh3SktGWTMxTy8yWmh6L3M2N2J4c3YrZTFmazY5?=
 =?utf-8?B?aHR2dTBRVFhHUGI3Vk11OTBCc1FZbkxmR2F4OGxrNkFsWS9hUkFSY0NjRzZI?=
 =?utf-8?B?Mkp1VFJCcE8yU3NadnIxa3JucXRhUE52NElqMzNQUXUxQXNSZ1UxWGFJK0tv?=
 =?utf-8?B?OXRiZVpKWk1rdkVPc0RhNHR5NU1VSE55QTNjRWFFVVJrTWtwbUtGZnlVY295?=
 =?utf-8?B?MjdjVjE4VldEVVNVSUsxSG9PdDQxV0VtRnV0MVZja1JQQXZVNWM1WStjQ2FE?=
 =?utf-8?B?UVpuYXI5SEdMaitXM3hUU25WdllQaTducHI1dGxPbXc0Nzh4S29RNXBISUJF?=
 =?utf-8?B?TFVvOHBKamxsTTBmTjhMbE9NWklTUlZMV1hMRWF2c0hzVmhRSUVBU1lybGxD?=
 =?utf-8?B?TjBZRkFoeHBRQ1dZaWFtaWljazRuWFRHVEMrcG0vNFlMSVJGS0xYbTRnOGxY?=
 =?utf-8?B?SzdNekFMRkxWNERod216SzJEWUhvS3RJak1yc1p0ekxZNFI3elBROEpDc3BR?=
 =?utf-8?B?VFFNdkRLSnEvSXgzTDE4aHpJcmRobmJ3MHJFNHUrT05iaEtOWDBFZkZGQTFh?=
 =?utf-8?B?aW1NQW9NZno0YTJ4bit3K0h1WVNCb1JmTjJYbkhvZTFFZ1hheFRjbHNnQnlB?=
 =?utf-8?B?Tlc1Vyt6YVQ2UDlXY0lNVzNEY0R2U0ZzZ1FlV0ptd0IyRDhzS2pWRytYNnNP?=
 =?utf-8?B?ZE1VaVFMci9SNEg1R0d2c3FqVVZ3cHduQkkyM280dis3NmdYUGxJSTR3NkNI?=
 =?utf-8?B?SzU1WGlIS0RYdUFVc3U1RzVKbWNaWnF1UThMKzVrb00rZ2N6UWwvZ0JrM041?=
 =?utf-8?B?YkdaVDFBRHpJWkNCUmRNUXAwR1UrWktWRzBwbEp4K1hndVFyTzRUdk8ya0lN?=
 =?utf-8?B?M1lJMURKb045Vys4b2duQ0lLanAvZmQzSkpvTFRjNzJVQldkUmJrd25PaS96?=
 =?utf-8?B?S1J6QjBkWjhCUnYrL3VnTEN5Q1pTYUhVQU42aWZ5YUcveStaaWRDdTZhS0di?=
 =?utf-8?B?SnQvMzFwMXVnRzBZSVdSNDM4bTljMk1YT2NNRVl5MVRXN0ZnTjdIRktIWWYx?=
 =?utf-8?B?NVc0V29Xd3plR0ZNWlQ0Y2kwaDlBL29MNVZOeHVOY0kvN0EwSGJrK3h2MVNL?=
 =?utf-8?B?M0VoSUhvdkI5NXZDc3pYWWY3VnA2UGc3d2xwd1VSWEkyMm5xZkxVenpJVTJI?=
 =?utf-8?B?L2hRa0U3TVNiK1pkVXJTYnVUbXg5bEE0cTBsb1k3QUUvVUhsajQ2bzluZm9O?=
 =?utf-8?Q?bvtM=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:50:33.2380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e3f4a5-02aa-4313-450f-08de101a502b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 20:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225133

T24gMTcgT2N0IDIwMjUsIGF0IDE5OjI3LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBXYWl0LiBUaGVyZSBpcyBubyBhY3R1YWwgZXZpZGVu
Y2UgdGhhdCBpdCBpcyBncmFwaGljcyB0aGF0IGlzIGNhdXNpbmcNCj4gdGhlIHByb2JsZW1zLCBp
cyBpdD8gVGhlIGNoYW5nZXMgYXJlIHByb2JhYmx5IG9rYXksIGJ1dCBJIHdvdWxkIG5vdA0KPiB3
YW50IHRvIGhhdmUgdGhpcyBiYXNlbGVzcyBpbXBsaWNhdGlvbiBpbiBjb21taXQgbWVzc2FnZXMu
DQoNCkkgc29ydCBvZiBhZ3JlZSBoZXJlLiAg4oCYbm9ncmFwaGlj4oCZIHR1cm5zIG9mZiB0aGUg
cWVtdSBkaXNwbGF5IG91dHB1dCBidXQgZG9lcyBub3QgZGlzYWJsZSB0aGUgdmlydHVhbGlzZWQg
Z3JhcGhpY3MgaGFyZHdhcmUgKHVubGlrZSDigJxub3ZnYeKAnSB3aGljaCByZW1vdmVzIGRpc3Bs
YXkgaGFyZHdhcmUgZW50aXJlbHkpLg0KDQpPZiBjb3Vyc2UsIGlmIGl04oCZcyBrbm93biB0aGF0
IHRoZXJlIGlzIGEgbm9uLXRyaXZpYWwgb3ZlcmhlYWQgaW4gYWN0dWFsbHkgb3V0cHV0dGluZyB0
aGUgZGlzcGxheSAod2hpY2gsIG9uIHRoZSBBQiwgaXMgdG8gYSB4dmZiIEkgYmVsaWV2ZSkgdGhl
biB3ZSBjYW4gc3RpbGwgZG8gdGhpcy4NCg0KQWxzbywgdGhlcmXigJlzIGFuIGFyZ3VtZW50IGZv
ciBub2dyYXBoaWNzIChvciBldmVuIG5vdmdhKSBpbiBvZS1zZWxmdGVzdCBzbyB0aGF0IHBlb3Bs
ZSBydW5uaW5nIGl0IGxvY2FsbHkgZG9u4oCZdCBnZXQgcWVtdeKAmXMgcG9wcGluZyB1cC4gIFdo
aWNoIEkgcHJlc3VtZSBoYXBwZW5zPyBNeSBidWlsZCBtYWNoaW5lcyBoYXZlIGJlZW4gaGVhZGxl
c3MgZm9yIG1hbnkgeWVhcnMgYW5kIEkgY2Fu4oCZdCBldmVuIHJlbWVtYmVyIGlmIG9lLXNlbGZ0
ZXN0IGV4cG9zZXMgRElTUExBWSB0byB0aGUgcWVtdSBhdCBhbGwuICBJZiBpdCBkb2VzIG5vdCB0
aGVuIG5vZ3JhcGhpYyB3b27igJl0IG1ha2UgYSBkaWZmZXJlbmNlIGFzIHRoZSBvdXRwdXQgaXNu
4oCZdCBhY3RpdmUgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpDaGVlcnMsDQpSb3Nz

