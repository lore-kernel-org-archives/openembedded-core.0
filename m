Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B151CC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:25:25 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.46])
 by mx.groups.io with SMTP id smtpd.web11.16905.1748510719689041417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iUU9X83Y;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iUU9X83Y;
 spf=pass (domain: arm.com, ip: 40.107.162.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KlmAPFoEtF6fqjRkRfY2gtEfzqdIXStWVYUg35RGOcsAtR9UmtoJjD0QXUI0ZXlEuR/ughHxWGKIJgjiCBwPMaE8JQD70Ge3KLo5vCj2DUFqVopbPqnqH27otc+rkWRLz37n1TzCax5OpJLd/2UJOpgx7jcYkpRhcBkkux0qfiCTysQYlS+ONbb7339BCjsmlEgU5E+s0LyFOtfxLmHcEHTr2qN2EzrMIlqt5oV31Pq6NHz6+harckvFX1Z7BCdzKv6pSI25a65ZIgYNAn8lKN9QzYFLryR5va+8eChWtVm3VRAaapN3wXVQThC/GNi3BOoD6RZnOb7ZUKItEPMfRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/VFNnomdiBk3FgN+4hyc0bbuwSpM1rkm9/CFm5qCM8=;
 b=iQTusAZqqztXUYcwQCb1mdHiKM6K3/pXRiqakjCTN0mLN33L8bB5r6XS1M3wKlR7VKjQ8DG7NNdSqoRAhjcq901fVLuM4xh7TQX6yFjUzP16cmAv61mwG5JsfGW3krYJdjofUObXK0efJst5Wf+v3MzIhzASQBoawhwehNZdwrAcEn0PXCt1rX8xvBz1vtQI/bHGvFdGEmHvs4vKHLZXaDjab4WwlHj4D9CP5BfHrNOGKkbgXAdbdroOiA37wYA/2KrecTS5VCeh1dvQdoFyUm14OShtLUTfxjqjQnAAu0i+8M8xO5Ib7z1oC6G6lziM7ZSeqLuN21jWJG9KUYAO4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/VFNnomdiBk3FgN+4hyc0bbuwSpM1rkm9/CFm5qCM8=;
 b=iUU9X83YvU2H3G5ubkuCi2FAgu/i6JfK12dzYWcwTVvjTpuMBSHcFpNot8313cWS21BRX8t0B93ZdKdycjm+r8f+cKY1pBhz04uyl1AdPjdNScMrGCzNkczjZOoiyVNfYHdHjOy4PlRxZ+Oaj3N8AmOG2ovscUTtBd3yl3bpY7c=
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by AS8PR08MB9930.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 09:25:16 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::fd) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Thu,
 29 May 2025 09:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 09:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1ZJ42sflFOZZAtSIVn0rouzf0kct+SWuBygG1TtBXUlNb3NEtHnnYqCNQ5eop/9I8Jm2l5FZKajP8edfPaZbNgHtnh2oDDVM2z4jKU0YQ7HWSo2cyswEqooUcmVFn0OoptByh5hqGEztD2JlWhNFJ/HokZVtQ1/2tNcDLjx+RkF7bJUxB0r6q3XUkfnPTRRcxd/n01/yb7cQFH5BYSWWXDYZvCw7IbBY2pzsUxrHKSH1bplKd9zgOWPYh3DdL5IqvNJCvxDIBthFV/k38zirm1rE61ENLVaX2PNCf+qzgCJZnLyd3nbCae4MZysxcMjwJxTk3rJNzHALJxdLwBuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/VFNnomdiBk3FgN+4hyc0bbuwSpM1rkm9/CFm5qCM8=;
 b=QVUwN/KXjn+h8i71+AEsmkxzP7tXPA6XRiq2yA5/Z3dwDSPZu9E/QbRCGgD0YIWFvPz+K0BrrlcoGwWPkGhOcmo/mbLe0qyLkk5IqezAuKIdfWRI7BhevEkBM8rbvBRErYYfZ9ZBxxIY+wOXK9VcEbah2nrlbTanmHVvTac/ZQTPplCFxDC/5DrRqo/hSmFT/v/IbSznJ0uUC4/mUCShZRgkMHkIu2AdMgcrAH1WpxetDSS+f4wHrfTmYi2wrbCTTs2QEFH7IlvsL7lA7Y8/JY7Jox3fgORIE3fw0t0gg0ENUP7JPesvSPF+p76Q4JmRHUbDZN7DWL6ztXDxjVQhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/VFNnomdiBk3FgN+4hyc0bbuwSpM1rkm9/CFm5qCM8=;
 b=iUU9X83YvU2H3G5ubkuCi2FAgu/i6JfK12dzYWcwTVvjTpuMBSHcFpNot8313cWS21BRX8t0B93ZdKdycjm+r8f+cKY1pBhz04uyl1AdPjdNScMrGCzNkczjZOoiyVNfYHdHjOy4PlRxZ+Oaj3N8AmOG2ovscUTtBd3yl3bpY7c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10264.eurprd08.prod.outlook.com (2603:10a6:10:49b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 09:24:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 09:24:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 07/13] pixman: Fix build with mips/clang
Thread-Topic: [OE-core] [PATCH v3 07/13] pixman: Fix build with mips/clang
Thread-Index: AQHby5ZVNf/jgxPMH0SQzIYWuDqWhrPpX8yA
Date: Thu, 29 May 2025 09:24:43 +0000
Message-ID: <4FFE439D-3DDE-4B8E-BD3A-1E8C0B76A387@arm.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10264:EE_|DU2PEPF00028D00:EE_|AS8PR08MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 063422fb-137a-49e7-46aa-08dd9e92b8b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UmhhdnlWdEhaUWp1R1V2R2M4SVM0R3lIdFBTa0J2WVJjMldEbUpSRXBDbDRy?=
 =?utf-8?B?eHlaNm9FclRVZTFrRDVra1Bua2xUTVR2Yy9RbzMrUW4xbmZRVGxRM3IwM2Rh?=
 =?utf-8?B?b01FVnFVczFVZ0cxVmk0NlVlK0ZUdjZLNGt1MWFkMHlld1RjSjdWY01DZ3BZ?=
 =?utf-8?B?bG1EcGdXZ01weGZVVmJtcEVNSm8rRW9EUThWNGQ2SGEzZWdaUnpyRjNLRzZo?=
 =?utf-8?B?aWlrSUhtK2pZR1l3QUZKclV1R1ZqbmhUMCtnVWJwN0ZSLzJLenVUZmpVYnJy?=
 =?utf-8?B?a0FHbEkvZnVOY1N0M1diSkx0Nkw3djNXMmY2RmpkRkdJUHdyQ0lpRkVsVHg4?=
 =?utf-8?B?U0J5aEVhei9HcjYzOGx6a2grT0duYlU1OS9GazVtalFSWUZBdHlSYU9ZaXJl?=
 =?utf-8?B?QkxxYlp4WU5PbHFkUUR5bGZLVk9JNHNaNWdrc0ZBeGpBOVRXeUpuc1g0YU4w?=
 =?utf-8?B?NkFsZXNaT00weklCUzZvRzJBUUcxZFZSRlA0emh4YnRia2NHUSt5OCtEY2Jz?=
 =?utf-8?B?dytHWWZXd0tTeEJ5K2R0b0FuTWp4aWtMQWcxeHdzUnlKc1NjalMzMkVkNFBl?=
 =?utf-8?B?ZXNMRzNsU0ZSUys4bnAvNUkxenowSTdKaEpuRWM0N1YvbDFRbytGa0Rhckh4?=
 =?utf-8?B?bkxxamlxbjFNWEJMYkljaGVqQ2lCZnhTdGE5YnpBbCt3dFU4bGs2ODZCWlRI?=
 =?utf-8?B?akFMeHc4Y2VNM0VmRE80cExyYVQ1RDJ5YlF3Mk44WFpPWGxORDI4SlkzbEpr?=
 =?utf-8?B?b1RIZHdtUFYyckl6YURLVnlJSFVlNHVBN2tIRG5DOERtS2J2dlE0ckRiOVVX?=
 =?utf-8?B?dTRybWlVa2Y5eWVUeXJCYWZWMDJLMkRST1dnYnVUMXd4OTNZcjllYkhJbmZa?=
 =?utf-8?B?Sm1oRzhBZ0VwT1MvMkMrcnp3NjJaS3ZnYzQ3UEhrVnhkbEN2Qm8wam1xcXZH?=
 =?utf-8?B?TzV6OGZRUDdrdlJLbTdvY2ZDS3BDZ3Y5L1ExZFhWVWthREIzVU8wVDNyb2xS?=
 =?utf-8?B?MW9JTEMyNTJLcXo2RTd2SWR2RllCQ0NueHhLL1pRTUd6bW1NZGVQYW04RXhs?=
 =?utf-8?B?YWp0R2s2c0FneHJwR055S0M4dU5FZFk3VC9rMDVFa3RxdVJieDJxYVR6U0Q4?=
 =?utf-8?B?TXc0OWIzaGhoYW5NYjNlRnZPSGpkNzZqaGQzb0srT0ViZXNDa2xLL2ZKbTI5?=
 =?utf-8?B?bUxXbm9mcURINTdnbDRZQUtmWEthZzJINmxITjVzUXo0RUJwVWs5NGR2aVRJ?=
 =?utf-8?B?ZE05eFBkSno3MWFzdXFHTHdudFdvSWZMdldTcVVoczl4dGJNdHFYU0dXWXVp?=
 =?utf-8?B?R2I1a2xzd0Y1ckpzUG42ekp3bkVsUUliV3I4NUpnTzJhNmNQWXlUOUp3RTRW?=
 =?utf-8?B?SmJxU0tnYlhrZThwZWE2Yjl2TzFLYkZjR3RSZWNoWHFGcmNweG1DaWllemtN?=
 =?utf-8?B?Qm9iUTc5cVExT051bWExSWdaakowNDdRUks5b2Ntcm4vSk5VeWVnUHJBWEZ0?=
 =?utf-8?B?dHVYRnBWZ1JzczVWZys5ejRrVEtncXhwc0hLbHZFa0x5clU3VStIWGhyandV?=
 =?utf-8?B?NzZoVkw0QWI4VlpaNHBxb056LzJ2OFVMdmRPU3ZZQjhjNjB0ZldQOElwWm9J?=
 =?utf-8?B?UUZCYk94ZG5ubUFDNFoyZ2lHY3VseFQrUFhVSXNEYlV1b3puWG1UWjVkYlVB?=
 =?utf-8?B?VUNDVjNwcnh3S3VMTVp4dFlKdUptalh0TlFWUlhkTFpFYjdJZXd2aWdYRGlH?=
 =?utf-8?B?WVVoZWY4YktzdDRnZVJVZ1hIb3BPanpSY3JSS3lMUkJyY3lQeTJHY05pMnFR?=
 =?utf-8?B?TWwrNnpzaTdQV1N2TWpTUGhtZEkzemtOZXRGbWJoYmYwdk1lUG9la1RjdzhB?=
 =?utf-8?B?UEhWTTlnTS9PazRBVzBLSjRPb1pzZlVUOEY2ZkljcG1yZFRCeFh2eDJBSXda?=
 =?utf-8?B?Zyt4bk1yTDJpR1dkTVcyVGg2TmxkcG5UTnZ6NGRYMTh0ck45SU9pMVk4K2Z6?=
 =?utf-8?Q?U0ZkIOu3q6lRX102D7PhpZGgDieS1Y=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <93916A5F964AD7448CAA9B720467FCD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10264
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	506ea4dd-15e2-4ec0-b652-08dd9e92a5b9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUx0Q1lwSzNpUGRrTllMUTJGenZqYldiNTJyc2I4V29Dd3hNb3UvZjRSdENZ?=
 =?utf-8?B?SGJIeS92Y0xWSkJTSmljOGRYdGg2VlNINTB5NWtoUkl3S1RTZmtoM0JhZGVl?=
 =?utf-8?B?S2FKblhWRzhkQko2NHZ1eDE5T25HMFRHWFkzK3cwaHUvL29ielNuZmhqa0Vk?=
 =?utf-8?B?eGtyQ0VGbTNvKzJHY1FKaXlrMDJmRmEyZVViTytYOGRIaUlCL3VHMStQTkF3?=
 =?utf-8?B?MmxtenEzemUxWE0yV2JEaGhPSEJWdS85VFF0dnQ5YmxFZ3loQitlR3RFdEVE?=
 =?utf-8?B?NVhPVTJCOEt5MGY5RkU3MG5lOFBaOHorRnVTSGI5TGFpbjZuKzZuK2s0NWpS?=
 =?utf-8?B?UlZ6WmZYanVtaUtkUmNCQ2lJWWF2aEl1eGRyNldjVTZNWkovcXNtZjNobHkv?=
 =?utf-8?B?VnA2NDdBYURqNGR1RVIyYVJwcmwyOHZnb0VqS1NnNElQdWt2eHJwTnl5K0Fw?=
 =?utf-8?B?THZTOTBYTjJlVVB2SDNOZ2hUQklIZXhmZXBXYndHcjJPWE84QlRqeE9zcEtB?=
 =?utf-8?B?dzlKWnJtNFo2RlNTVjI5RDF3TjRIK0xuRlkrVjB3NEloVGFHNzFOaFh4Si9C?=
 =?utf-8?B?S0I0cHFka3I2a2I3d3NjTUZtaVRvbExTQWRvQVFYS29WSnhHVXYrVjBXeENP?=
 =?utf-8?B?R0hGL0MvTEhYUXdoV2RvRlNPRkxXNVVZc0Naak5JSXNMYWx6dUVWdm1yQUdT?=
 =?utf-8?B?bDdlb1BZQnNITytTY0VSbWJvY1FVbXFQYzIwM0VCeEZKQlFOYU1FSlQ2TkZZ?=
 =?utf-8?B?clhlaU5jeXd4bjdaR2RmOFpVNlE0U01MMG9NTU53RnhXV0hEaWVNSkNPRUo0?=
 =?utf-8?B?VmRFelBPcXltSWRUM2hwcFdhWE1wUlJFL3Z1b2hMcUMzdFNFQ04xTzBuWnBG?=
 =?utf-8?B?WmRDeUE3Rkh6UUsyalR3Uk9ycGFtVDdIZVVsNG5MbGE1dU56ZlVuUGNrSVpw?=
 =?utf-8?B?TFFQT1JWY01RN1d1WEhTaTJ0d3NPdVpVTmp4bit1Z0dZVzRHS2VMY00xVlZ5?=
 =?utf-8?B?VFFtZmFBVnBaZ05CK3B6elFpWTl5WGJNUk5QeGVSS04wSFRyQ2p4WXhUbGps?=
 =?utf-8?B?M0loOC83WUNGU2VTay9jcXFrUUU0alQrbFpPVTV0M2xwa016d2ZycFpXbWxP?=
 =?utf-8?B?R2p4VmZGY0ZYeWFuV1htYTlGb1lrQmtQakdjWTdrVVNKMktlelNWU1VJMDJO?=
 =?utf-8?B?ZHhRS09zSTR0K3ZBdmFmdDJiZE5xcFpCVEcrbDI4L2d3bmx3dkh0NFg5RXlt?=
 =?utf-8?B?blE5dHp3M05sSUw3U1VoUnNJMUtHTUlZOStZdWlud21qUHBJY3dYSWNhWnV6?=
 =?utf-8?B?UlluTiszQ21NdEcxTDBoQzBVTUlSTEZ5WkVWQ2ZpejZzNTMwZ3JpNWNGQ2J3?=
 =?utf-8?B?a3BvTEJPVndmTnRsZkZQYmJveUVGcFNVRFFwZG1MSUZ1VElObWgrdEloYnJI?=
 =?utf-8?B?RTUwOHpUSTJoc1RuVy9wZ1E3MGFnRGNuTENpZkI5dkhGMGVkMnJiQ2pWanJB?=
 =?utf-8?B?YncxZmtIakhVYk84ajVQdWVTeTJ6dWxZYllodHMveVVOamtpT0c0T0puczRa?=
 =?utf-8?B?Um9uT3I2M1RWd1lNcnI5MCtHNU1mWkcrdWg5Mm5UTzRMMk84QzNBcy9GK1pF?=
 =?utf-8?B?RzdGOTRpTGkyek5kUmZWdkh6V0xUZTlBVVNmaCttS2c1aW03NWtyTHBtMGdP?=
 =?utf-8?B?K2lxUHRabDRTS0NvaVpuNnlSTUc1ZEFYZjNhRlJHVStrNlNaWkFZTDFzcXU3?=
 =?utf-8?B?T28rZmpTeERLUlBxSUpITnNwRjlzT0FEZGpUV3JIdWVscFY4Q0E1YmdoVUd0?=
 =?utf-8?B?ZE10WmtjNENyRjM0SlcrNjZPbnpKZWN0MjFXbWtHN0lmZkd4dUlTcEVCelFU?=
 =?utf-8?B?eUdSTDNtMzhBbGpuK0lON0w4K3ljS0dPeDdZWkJSOERRVkoxaWowUjdSY3VX?=
 =?utf-8?B?ZXBRQUx5OGtLcUZaUkt6WUZqQmllL3NKYjhXWVBPUTJMVkFIZm80WVZTdGRv?=
 =?utf-8?B?ZitNK1N2ZU1IMnJXbDBjaXIxaXdhSm5KbEROQ0NpNlNCS09GVW1YNzJocGsy?=
 =?utf-8?Q?ngw0zH?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 09:25:15.7135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063422fb-137a-49e7-46aa-08dd9e92b8b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9930
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217405

T24gMjMgTWF5IDIwMjUsIGF0IDA0OjUyLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gK0RFUEVORFM6YXBwZW5kOnRvb2xjaGFpbi1jbGFuZzptaXBzYXJjaCA9ICIgb3Blbm1w
4oCdDQoNCkNhbiB5b3UgZWxhYm9yYXRlIG9uIHdoeSBvcGVubXAgaXMgb25seSBuZWVkZWQgZm9y
IG1pcHMgd2l0aCBjbGFuZywgYW5kIG5vIG90aGVyIHRhcmdldHM/DQoNClJvc3MNCg0K

