Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A409C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:36:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.web10.11307.1750952208464405339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SltHXsuy;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SltHXsuy;
 spf=pass (domain: arm.com, ip: 40.107.130.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sWuqy9Bh9dcmXT46UaGEVlBVVFCzh+3bk6ygJqRsAzqulROp1nJNEfuQq+JDzRBXYXq9fv5A5fsXqzMlkoLhQG2yBKR59/sCn2JSbd+xfbzOEGg9/HD8Zuy1c9mX97iot3yPeRus/8miNh0KI/Mj1RCWSoN1wUb20GogkpcWn9jqkJSiXAy+gXAUIJP2in9i4pRCTS3DaZ9p4NwrryOO4G9Q/f7z/paC+xNT8HptHBcEFeR0hEGstoogLPkAxm/MeaHf3alSxuV3RUXIL3/30AhrzLiK+BTuHw2DZJkuIcvOWhpTzlmsR+Ul6ebopOLCr+7INNCUKmXRrJelnlD/og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfw+Be/YprV9nBp5XaWTHjWIUH7eh1Jjv5vKr4as0lc=;
 b=ezasVE1XhsXRPFSc+ATG3KHHbXK+NSIuFClpqpT4wEH58XmszHvfRX1OxdT++eOmO+paUEXLIUAsi/NOcnSTB5yJcdnO52fzIAKOyOA2X6ycJmeIjk7a/NMpgoTBIMJlHoKlI4nF11QAES9F7nX73jhkxt3YGD12Z09Ypvizo2k4YNSir7T+Qjt+x42ymDMMmqT92c6zPb3XM5e2eS3fD1cupRnB1U4ojuQxK0F35LC94mnW1nfVBffFWTqlDfFH9VnIigosGvuXmcVWFvW4X0maX02+JW9ngmOXTivAlrvwloxgJR6FM6QgM9BwlTq9xBwKDs3G9w+zW4sUOLE+NQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bmw.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfw+Be/YprV9nBp5XaWTHjWIUH7eh1Jjv5vKr4as0lc=;
 b=SltHXsuy0qaQchp6FwBQE7Nmn2HQ7ctBwvv15ftKWJMyOvMzZc/UEAE5tt3VhzsjadkZ6/BDS/T1SC18kk4tXR0ir4veYjaZOkXKm8VsXMHYmbS+jqD+gGXjU6l78TUBqpAeNWg+Tf5OvqBTncL09GJuGgiz4RcbWA5sSy2A/8s=
Received: from AM0PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::18)
 by AM8PR08MB5794.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 15:36:45 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::82) by AM0PR10CA0101.outlook.office365.com
 (2603:10a6:208:e6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 15:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 15:36:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DblXV7S4Sw4mK3VzKxMX0qQGZ5znhrzZfJOBmcYLO/yYOn0rQXkuz4AQo+mRRFc4YccCaMN5iarXnnJvv32aWoObG1Vhj8mnsU+mXc6Y59hB36zNvPweGrWaCbx9shcEXjtFsnpNkrzNlsR1i8E37P+EwCuaoXPj3PlmO/kyy52q/+LnhKx0QpEDBQcNcSadd5DOEjmLN1dga1OVzQEZEkU6s4zSh+ZBc7JqUD/2bZnjOCJVrxajv87YJFRnMIFgAB7EMoMSHV8ju9hG78M8EkwIS2RnDjnsZpstDjDjpms3xFczwJ/lOqBxLqdkmjR3Upx/d0sWpeZ2UGQRp/wQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfw+Be/YprV9nBp5XaWTHjWIUH7eh1Jjv5vKr4as0lc=;
 b=sorMfQUPlWndA3UTizsHQHql8QB8kvle0uBziJ/7OmhWQzCB5iDCxGV6cBvaPZiBN+awcl/Njfss+51myGBB0w+gUwr2mQjrodOt+QxcXrNG0gz7efb2zpIJtpHU5ZlzE7Is1/DlaK8bifCqKhhnYKY/jXrHrimesRTv+0TZt3fBFRstyoiPSU77JOHwI1lGybQYqzPn5LzxHLgDjDmmd2jTGyjbV8Qv2yyER4QTQE7JpYqkpEt5jWdxKEWcm7ig5SyZ/32U0d13FDUHkr2VnG1zW+Q5XFwpMfcnTl8W/R+oqbnufoxoZmeIC7AMTKp+1920gNQ4RZ6mcAUs6gqMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfw+Be/YprV9nBp5XaWTHjWIUH7eh1Jjv5vKr4as0lc=;
 b=SltHXsuy0qaQchp6FwBQE7Nmn2HQ7ctBwvv15ftKWJMyOvMzZc/UEAE5tt3VhzsjadkZ6/BDS/T1SC18kk4tXR0ir4veYjaZOkXKm8VsXMHYmbS+jqD+gGXjU6l78TUBqpAeNWg+Tf5OvqBTncL09GJuGgiz4RcbWA5sSy2A/8s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 15:36:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 15:36:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "quentin.schulz@cherry.de"
	<quentin.schulz@cherry.de>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>
Subject: Re: [OE-core] [PATCH] json-c: Re-enable '-Werror' now that icecc is
 not supported anymore
Thread-Topic: [OE-core] [PATCH] json-c: Re-enable '-Werror' now that icecc is
 not supported anymore
Thread-Index: AQHb5pxqmsiWzxZ2/kWM/rpuli/6JbQVktGA
Date: Thu, 26 Jun 2025 15:36:11 +0000
Message-ID: <B596FA3E-30BB-4BC9-8B9F-844B2C4C852D@arm.com>
References: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7451:EE_|AMS0EPF0000019F:EE_|AM8PR08MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: c64b7d65-e761-4491-ed1e-08ddb4c740ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QVpianUybE83UElXK25rYXlzd2x3aXNRMWlFYmxPblhmcVA4Mkwvc1p3T0Q2?=
 =?utf-8?B?TXhtUjJmL0Z0dEVxa2F3c0swTXVLSjBDTGNTR2xsaTQwNkVrRUlBSHNmekNn?=
 =?utf-8?B?N0RQQngwL2pjR1RqS0g5dUJvQXBMM0NzaDd6OXFkQ3RIQnk5dW9lTHdpbng0?=
 =?utf-8?B?c1RhM2NmQjAvNVNWT290UDk0VmhUNDBIczFQcjRscEpFTU1icHhyMlZDbXZn?=
 =?utf-8?B?bUNMSVFKZkFiVDF3WXgzZTlubE1hZ1ZsTXo0Q2xMWFNoMW1wUVB4RDNnRkQ2?=
 =?utf-8?B?TUlCS0tZUzBzWVcxa0VsMjZDdGNiNkJrWjhJUUpBSld3dFVtbmlKQUZjN0lJ?=
 =?utf-8?B?VVU1ZHQrU3g5K2JuNlZlNUQrSzM3QzE1Rkxob0NYOUEzY0c2UVdUd05tWW1l?=
 =?utf-8?B?VFptSDJpZkFjSnQzUlMvL0ZTM0dXK0xzaUdVWjJoQko2R0pPMncvaERFMnRM?=
 =?utf-8?B?dUJ6dXBvMnNrU3pWbWdzWFZrVG14NUVPdWJXS0RST2VsTkNkZmRYS2JJaGtI?=
 =?utf-8?B?azdOTzhvaCt5VUorU3FOdElob1B6Yzd1dWlRdjEwM0g3eWV4bTA4MzVKRkVI?=
 =?utf-8?B?b0hFeGVuVDQ2bVcyTlAwY2l4UFM1cUovQzVCVEhoZDI2c0lqa1NzM0FBMlJK?=
 =?utf-8?B?ZVJSNGoyRUtsdGdNMVVxSnFJdFB5R2VCNXhmK2tqV1BoOGJyeWU5YXBTd2hu?=
 =?utf-8?B?OGZLd3o2SWNvYjBRWVZlZFNxNlBZRkVINHBHeHY3MGVVVldCd1lWWnZGZUY3?=
 =?utf-8?B?aUp3WHF0QVU0bkE4czh5RFpuRXBFNzlwQkN1VU5iL2xpMnIzNFVWTC9qZHdw?=
 =?utf-8?B?VFVVTEFNWkoyMElHYkFrQmh2TndZWWNLUmJBbG8vMjZmSE5SQlFRdFpndTl1?=
 =?utf-8?B?SjNCTTRHeHVIeUVnaDgwMjRYOUdoNGxXbGNUM0t0SGxVbXYveHd5V1hJVEJt?=
 =?utf-8?B?ZnZRTEhRYU1EaExwbURIem9nOHdKdEFBbk5zcjRvbmJNMXNzT3JrM21JY01m?=
 =?utf-8?B?T1NIMTgvdkdJVTdwdWs5eEllNHA1VERoSjBYT1BBcDFnSWN2YXJWVzJpOGg4?=
 =?utf-8?B?OUpIckl5RG1RcFUzemEvT1dhUW0yd1VUSDhjc3lQd013K0pLVm1DcS9lNlFt?=
 =?utf-8?B?VUtPOEUyTGRWNFo3ZU0ra3VCVFI5bGVvYncxOXloNThXMFVuNzBiKzNCa01H?=
 =?utf-8?B?alpJSTM3VVZNWFNPV1VLRzNQaVJ4dG00aWVaN0NjTnJvMFU0bWYyRXI4cDFn?=
 =?utf-8?B?ancwelV5TFF4U21kV3lVQkpaTzZ1U3dEZnhVd3VFdDBMaTlxRmRsRHVoRXVI?=
 =?utf-8?B?TzBLZmpRZjN5ZVV1a3ljdm9UK2d2R05obCsvTGs3YXdpSFBnYlozS2JPakd6?=
 =?utf-8?B?MlZKMlcvWmpuNEpKK2J6MFJpanFxTHpJUjlmTmZGRUdUS0I1d3BFQ1pYQlpv?=
 =?utf-8?B?T2pvdVNXc1JnNk0rNUZBenZwRDJpSEYyZlk0NmdXUDc2UHcxZkdaWFRiQ2t6?=
 =?utf-8?B?L3R1dGk5NWhFb29uM0oycXphME4xSjBnaXFJNzMrODlpTGIxeEt5Y0QxZnRj?=
 =?utf-8?B?Yi8rT3Ivc3dIeWtkcHFha2EwSFJhTFBaRXp2U2ZnQUp2N0dDSmxwNGp3NGk5?=
 =?utf-8?B?VTNJNldBTTNCTEhIekpvY1NoWHRIN3lNSUtsRnlLRkRFWHltOHBMZG9nbEtS?=
 =?utf-8?B?N1dDVHY3Qno2N3llOUFHRWZhWCtycGc4cmxyYXdoUUUxZUxRRnVZZHFaVld4?=
 =?utf-8?B?ajZ2Zk1kU2lKWnZaZUMwYWRZb0U3Qm1jZXYyYi9GaVhqZXY1MGg4cTBjdU42?=
 =?utf-8?B?azcwSFcvUWt6aE5rdVF5b3RWcXJYZytST2pUTzdFeFBZTm12VDF1djA1U1V2?=
 =?utf-8?B?YUhzS1p1L1h4VFBLaWZINHF0VFNDaGE5RXd4M1ZTM0sremtCV3NpYzR4amMv?=
 =?utf-8?B?RUNyT3BxUWxTa3VPSmZHWFJuZ1ppV1ZmZmJlcDFnRUhKRGJZR0EvWWZEdnJn?=
 =?utf-8?B?R1B0MkdhK093PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F84F3D40E30084690BDEEF890882C6E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7451
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e5308022-99c7-4e5c-b73c-08ddb4c72dae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWIvMHZGWkRDQVUyV2I4R3l6TmltbmdHY3Vwb2I0VVpGaHF1WGJsQTRNang3?=
 =?utf-8?B?c1ovTE5yNkdWU0tvTTlGTm5CTWJHTjQ3WWpjd3RpczBIcHJYdHZKVVhidXpt?=
 =?utf-8?B?SlRlaUF3TU11d0Q2ZHhPb3g5dC9iZVFRcFpnMFVmaDFvNUQ0b1JiZlhTQjUr?=
 =?utf-8?B?dTRpOFFra1REOFpBVFFvTkloVGd0Um5hL3V4N2VYTVVrNlRRZGJ6emI5NDVI?=
 =?utf-8?B?NE9hRWtYNU1QS0k3YXE4Y1NIcGRLZHBnUENOWkRyMm9nV29heHd0R0QvZDRu?=
 =?utf-8?B?N2FVS0lPOVdBTm1ZY2FEcFpwOVBuU1VlUGI0SzFBQVdPUDZ6bkpjOWN0Z1k0?=
 =?utf-8?B?eW5XMHFRalNYekxKSDhYaE5PMTZ3S1paQTZpQXBIUEFQaytKK2pzOE16Q1hs?=
 =?utf-8?B?NXZTOW02M1JlWWU1elRFNkRxT3UrMU1DNHVNUjZZbEdiYVJIZzhlWkIwY2d4?=
 =?utf-8?B?b3lnWmt0S2g5cVB3YVE0ZzM1L0g2NWwrc1AyTlR2SE5jQ0h1ZUhleFd4ZWM2?=
 =?utf-8?B?Mm5nTXhNRUswaERTMFloWUM5TlhzK0NjejIvZ0dlQ1BHQk5DL1F1RW13dFBs?=
 =?utf-8?B?Y0V4ZE12djJMOGd2b04wVkRpWG0wTUlKc3ZZZmNxTnNURUVNSDF6bjlqaXBT?=
 =?utf-8?B?RmZpSVFtOEE5SjYwZ2xLK3FMR3gwSjc2c2UwOGpLenRGVCtkYS9SSzlWT2dP?=
 =?utf-8?B?UEFXNjVhcTdIRUVsdjFlV3lCRGxoUVlwSStpUHNxcVd0VndlQWF0VkQ1bitE?=
 =?utf-8?B?bXdIY1pYNmt4bUZpN2RUd2Z3eWRiRUQ5dmpWdVdnTmdGczZJOHY5OXo0UEpW?=
 =?utf-8?B?S3M2Ulg3bTgwaGU1T1J2UHNQaUZpMzNXbHZFRk5wU1pjWTdraVBseGhpekNT?=
 =?utf-8?B?dDUwcktPNVBiS0QyTG1GWXB5eXZoSCtiTWpKMDRDckRSRnFYWDYySGI4WXlD?=
 =?utf-8?B?YTVFNGtVTzZRSExaNVJZbnRwQk9MNGlBaVUxMnA1ZXVqc2tNOXZQYTNYYTcy?=
 =?utf-8?B?dzQ0cXIzZzBUQTBtTHIzenZLZ3JvaEpnTXMxT0ZHMWZxc0lSeHN0Q2luQWJG?=
 =?utf-8?B?NVRHT3pIc3pMS2d5aEZmNitKZGV0b2tvT0F5ZmlvL0RtMkMzeXBwdnhJc0Ri?=
 =?utf-8?B?RDBZbHIzV3E3d3FaOUpmaTRLZ1ZTMXl3anJvR2ZCaEVjbTIyRzFDcWpTS0xC?=
 =?utf-8?B?Z1FLRHRHZ0ZKRSsvdnZLdGhVNnRlb2Y0ZkdzbnNLYmE2Z0gzbWkvbC9MNUU1?=
 =?utf-8?B?aThUU2l6dHdJQVZzdTZ5THUxQVBqMlZ5SFJjc1piKytJd1RuN2g1Y2xVemRh?=
 =?utf-8?B?V05TQ0Z2d3NIL1l1bER3YlZJb1JNb3hFQnh0N3dRYk9HVzBoaTc1RUtmY3Y2?=
 =?utf-8?B?N0lGTmFhczBEU2cvRXhyLzY4bUJpUExMK2VtQjl3VUxIZ0Z5V3ErRFM5QlJI?=
 =?utf-8?B?MkQ5N0MwNkNvTU9nMDFrT0IyY2lMb0p3eGJ5ZGNtQngvR08waTEyeWE1Ukd1?=
 =?utf-8?B?WlZXR3AyWXZPaVlXYU85VFpCbWtWZ2hhSkVyTVJTRk5RVUhaYmhFQWUrL2Jr?=
 =?utf-8?B?RGZQb0hLelVFbm9vdzRCUWNuZlBybTVtZTI3ZnhtMEhTaXV5ZG42K2RuSkg5?=
 =?utf-8?B?dE1qUzlDcUhMSm5NUG11ZngveEJJZ05SczYxNmsySVA1TnpQWkNwbXpMNHBS?=
 =?utf-8?B?Q2Uvd051clpBZUlQeWF1K0hZT1ZxK3lxWkxHcDF4OVg1VUVLS1hGOUNiRmYz?=
 =?utf-8?B?TnI4SUlVT3JPclFIZGRRZ2t5YXowVzhCMVFlbzRJQlRQVjZEWW1QYjhCS2tw?=
 =?utf-8?B?cmFiMnYwUjdBSGp5Q29DRmR4b29ZL0lqNEd5clQxVWVlTVVxbHFNRS9ObHRP?=
 =?utf-8?B?aDFyUk0venZCOVRMQU5WQy9FemJOc1hISk1WK2k0RHo4cHJQVTk2QjJLRU1P?=
 =?utf-8?B?eGdoUHFlWmVsaEo4K2pyMTVmSEJOQVNpcG03L2J6RHdUcEJVVHZoTGhwUTBC?=
 =?utf-8?B?dERHWmZaaDJBS1VBTEpOUEFDVzJmVnVLbjQ2b3dmb2pYUXBjRFNtYVJuVm92?=
 =?utf-8?Q?fTqN5m?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:36:43.6375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64b7d65-e761-4491-ed1e-08ddb4c740ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5794
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219364

T24gMjYgSnVuIDIwMjUsIGF0IDE0OjE0LCBNb3JpdHogSGFhc2UgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPE1vcml0ei5IYWFzZT1ibXcuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IC0jIC0gJy1XZXJyb3InIG11c3QgYmUgZGlzYWJsZWQgZm9yIElDRUNDIGJ1aWxkcw0K
PiAtIyAtIEFwcHMgYXJlbid0IG5lZWRlZC9wYWNrYWdlZCBhbmQgdGhlaXIgQ01ha2VMaXN0cy50
eHQgaXMgaW5jb21wYXRpYmxlIHdpdGggQ01ha2UgNCsuDQo+IC1FWFRSQV9PRUNNQUtFID0gIi1E
RElTQUJMRV9XRVJST1I9T04gXA0KPiAtICAgICAgICAgICAgICAgICAtREJVSUxEX0FQUFM9T0ZG
IFwNCg0KLVdlcnJvciBpcyBob3JyaWJsZSBhbmQgd2Ugc2hvdWxkIGJlIHR1cm5pbmcgaXQgb2Zm
IGlmIHVwc3RyZWFtIGRlZmF1bHRzIHRvIGVuYWJsaW5nIGl0LCBzbyBJ4oCZZCBzYXkgcmVtb3Zl
IHRoZSBjb21tZW50IGJ1dCBrZWVwIHRoZSBkaXNhYmxpbmcuDQoNCkl0IG1ha2VzIHN3aXRjaGlu
ZyBDIGxpYnJhcnkgb3IgY29tcGlsZXJzIHZlcnkgdGltZS1jb25zdW1pbmcgd2hlbiByYW5kb20g
bGlicmFyaWVzIGdhaW4gYSBuZXcgd2FybmluZyBhbmQgdGhlIGJ1aWxkIGZhaWxzLg0KDQpSb3Nz
DQoNCg==

