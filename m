Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBC8C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:44:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.web10.7889.1749131088913060564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nU7wLDHt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nU7wLDHt;
 spf=pass (domain: arm.com, ip: 40.107.130.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yv3VQjBcly6bOurKrNRf6XJ14n8YdLi4eyEWSaRyMV43Bw8mmmoXTRqF8UhXcV14+mrQgHlWIbG/H2SZbBD26N8SosG8NUabkeOwWJF8+QxUpQWWrH5ZowX1kkcFwryR+HvoeoFWTtg/fk13wev7wTLjkfGzcrEYm/xcCk7RsffWFJm+e1IJiRN2pe3aHLNUyvnjlWHTp5TKidbbffI8xuB5rpN4oY4XDAcQUoOtVMZA5+dtTJp3Vcx0XycFFBTzdUYb66jv6a9MPf2FOIjqlhMDFQJyf68/n1nLOAsDkMy3M1GfYd8U8myIG1Y9HJtWT60fQa1OZ97LlkjW5c4qfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWfMaeN0AevwQbidhgsLdbgEy+YkTsPM7lWCBWkDPQ0=;
 b=iFKWoFiwZYPXSTcrYETG36pz/ZnPIxjxPxTvpxRkGAZr+ZQY7jgq+Vvb0asFKeGjJmLxOgOaCxz/TsFoxTp+MVzb+BK4gBLRKTlPPUpgCBsq6PA4l8MjIgZXN7zAXzc8x+m7VVTuI113xlHDnuZOGicMQWFSWM4Tm0TmrWv9kZXaCWyUQLeVt1v+kXCskzwMiQZdxorZTYt7zyrvXqgbNrfUzXdtLk5ldDlq+CVNew2KzHK+0KMlrhTEMQSxYHzRBM7A/hCfc61vol9LBCcrAtZm2+Y1DE1XNSYTgrih8NlB5KhaNTznYJWw3YmcuJUiprewBK1rvoPM+V3yFHH8Rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWfMaeN0AevwQbidhgsLdbgEy+YkTsPM7lWCBWkDPQ0=;
 b=nU7wLDHtXBwjHPid1XI5BsiuKYwv3EJfLQp6bKT2a4GGQExLiULLaovtRmLVCc798k+vNybBp1/JknJlN6IvS/m+Vt2KEe5DqJnGdv3I61K3+VM5dTSU4MvR18HJnDzV3/8A/oFsPcpGTuOT2Xz+Nz1LlXTplCNgm1F/N1Hy360=
Received: from AS4P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::7)
 by DB9PR08MB8507.eurprd08.prod.outlook.com (2603:10a6:10:3d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:44:43 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::77) by AS4P250CA0021.outlook.office365.com
 (2603:10a6:20b:5e3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 13:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 13:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiSjNgH2gDnCPLwQXd36iM6XcR4vcySMFw8zdAxUxBN9ZLaaHk3pEOlWPsFFVLCcL2g+PxXg6Rdl9J28wMSSd534bYxGcFNs4pfSrCVT/KbJQE/rllr9EO9gzbLM/SUn6p7pjKZe+OTxCvFdzkGhsNCVkGeJa3wBtCjqYQs2hA8koi6q5lPz9VDX6rw33dQmzFP+u3NhPc01WUKB0hnLld/fjescLmQp20lnTmIh4LUGJONF+cPuckYqEXZHWaVQ1nRD51b+u+sltwWWccY1qk7TRrYNSbBG57cCFs9uQ73soKi8UfbRbpTfMuExfjjb6TJmYRjnnm7Vpav+6ns12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWfMaeN0AevwQbidhgsLdbgEy+YkTsPM7lWCBWkDPQ0=;
 b=MMT7Mv5mw1MBpB/jcdaktVJMNQdWbDfl4eN4ivpJf45NsZwbO/eKbed15hl8X08pUsUrU/cQkNegafKL70dNcz552Zy+rKF4UVz0fqlp3yD6/WXB6DN2ylTj1MTQnkMEBc0u8cZjOfjIW+jL2VPQEnQw6y6PxaeQurhaG83XZD7Lk7oVKEkSOc0jNHO0A2fr/eEj+fcXdH3D84Jc2qvt/2upQCgZKOq7vSgUKHlZShwWlD+hYZOUx2RBQmpnBgnQf9XN7gvK4WthI9Fg9pmHGpjLznyhh7jSDL66OUIYjdBUBMERz2TSqV4bOGpp7MGKJ/YGW/hVqEXWUN44+5JrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWfMaeN0AevwQbidhgsLdbgEy+YkTsPM7lWCBWkDPQ0=;
 b=nU7wLDHtXBwjHPid1XI5BsiuKYwv3EJfLQp6bKT2a4GGQExLiULLaovtRmLVCc798k+vNybBp1/JknJlN6IvS/m+Vt2KEe5DqJnGdv3I61K3+VM5dTSU4MvR18HJnDzV3/8A/oFsPcpGTuOT2Xz+Nz1LlXTplCNgm1F/N1Hy360=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10757.eurprd08.prod.outlook.com (2603:10a6:800:1b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:44:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 13:44:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Hongxu Jia
	<hongxu.jia@windriver.com>, Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
Thread-Topic: [OE-core] [PATCH] libgcrypt: fix compile error for
 t-thread-local
Thread-Index: AQHb1ADLj5RlH/sxaUSKHlLWCywa+bP0l8QA
Date: Thu, 5 Jun 2025 13:44:08 +0000
Message-ID: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
References: <20250602205546.426714-1-hiagofranco@gmail.com>
In-Reply-To: <20250602205546.426714-1-hiagofranco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10757:EE_|AM3PEPF0000A798:EE_|DB9PR08MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 326fafa3-1f48-47b9-42bf-08dda4371fe8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NmVPcnpudXErVkRZWEhES3YvMk9WTmxlc1k4TUgwTlJ2YUNwUkhvbTZyQnRa?=
 =?utf-8?B?MEZreWg4dXFrZ1ZmQXlFVXNnZXE1V3ZUQ0NoWG1yeHBxWWltTVJQbk83MCt1?=
 =?utf-8?B?cS9KTEN4MzVhS2ZvcmhWNlB6ZE9FcFJaTktKM0FrLzB4Z25kVG9vcFhleVc2?=
 =?utf-8?B?NnNPV3BrTU5mSFV0b1RhcTgzMjJyTTNOTHFFZUg5SDZQeVdwSWJtQXdpODRR?=
 =?utf-8?B?bFFmVEd6cEs2YmZINmtCTUJLaXJBVitDaUQ1Q1ViTjhEbWQ5TXN5QTFSS1Jw?=
 =?utf-8?B?MlBTOTFsZ2cvWmtWRWluUDdSRytTZzB3T0F5cks5ZGdnaFBDaW1mdzl6WlRE?=
 =?utf-8?B?MVpSdDRnd2dvU3RDNFVtbVlEanl4YzMxVEZkdnZ2VmFJME9GRDBRcW5aOFZ4?=
 =?utf-8?B?aDhEdmh0aWNFeEVaaDEyUDh4dFgxZlBSSHhiU2E4QUI5RDJ4RUZxUDZvcDhB?=
 =?utf-8?B?bUhNQ0ZFVVNYdEJqekVsQUpld3JkaW9aNGp5TG5PdGFnY0RHSS9NNEZva1RC?=
 =?utf-8?B?OVM4eE5DVkJ5V0Q5ZU9ERlZaMGhoRkx1eXpsUjRnVTl2UmVuUmV6WFFGTmRT?=
 =?utf-8?B?TXNTV2dDVk1kMDZ0T2tVRGdMeCtISDJGRDdNNVFiKzVEeEZmU0hadmRja2R2?=
 =?utf-8?B?NTEzelFSQUR0NllFbDdSRVJIbFBkZTRWa1dFNkdUTmsxVzZBSFRwdlMyNDUy?=
 =?utf-8?B?MnlZMHhzaSttMnJDbXowNVJOTUxIVTN4VlFPQTFLV09rYm1LYzl6T1JYakZH?=
 =?utf-8?B?RFZXekVrRUs4TXAzMVlRMmc4RVkxMUo2QXpONEErOFRLZzdGK0puaExzZ1d3?=
 =?utf-8?B?bEd5My9RUG5OMUhDK1hLZnlEWElnd3JXR2V5SGJTQWdtYUc3d2MvaXdFZlNQ?=
 =?utf-8?B?VGRUTlRac2lOaDBsZXJBcDg3MVYzZFRHRG1jOEhMcTVhWWowYU8rYWt3YW9I?=
 =?utf-8?B?VzVuN04yVUgyRW85K3pVUDVibldackdiZnRBU2FQcnZ1eUJkbFNiWk1JZmlK?=
 =?utf-8?B?b05XU01YL1JRbE82b3dKUGJzcVVYT3QwZjZ6d28zNS93ZWtTK3pTaTR0L3Jj?=
 =?utf-8?B?SEFPdkx2K3NnK3UyQ3kwL0tWMDZRT3k4OUpObEo4VTd2NHNoVTNTOXFSY3lX?=
 =?utf-8?B?MXRDRitjVUExYmpteG5HZkZnWHc4MHJhb0R6NWVsOVZoc25uYkpWOGNwd1g5?=
 =?utf-8?B?TERMK1lCNmZMNXNYakRsMVhmTW5EdWY4ai9kZkg2VWZKK0lwWWh3TTBvaGt4?=
 =?utf-8?B?UlIyY0VCTHIvRlhKWTFrVnZtUHdxTUVpbUd5NjJZdDZ6TEVPNk5YZXpKRTFv?=
 =?utf-8?B?VW80dzlVVjRjdmFEVmxmSG5qYXJGTGs3ZXZRQWdNbTBjNGlxeVhwT1pVYmtG?=
 =?utf-8?B?RjlNU25KbzAvRkVGeGxIRkFaS2pJczMxdlVlRGE4VUZwSms2NVlXby9KVlhU?=
 =?utf-8?B?cHBBVW1tMnZybTc3SlNSR0xla1dKRGhPNDZhV1M2ZXlQaXhBcmRuMUtOZHdP?=
 =?utf-8?B?QTJBeXk4Q05IcEJ6dDd4R1ZCMHJLbUFsN1BMbW81UEpWaUtVdWlUQnFiZ2cx?=
 =?utf-8?B?bVJOcktLTFlLYmtEdWI0dGVLT1Y5RmJmK1l4bmRwcm9YMjN1RHVuUk5Gay9q?=
 =?utf-8?B?b3RqTEpVOCs5MElkRmFkQkc2QWlIWTdHOGxJNk1BNGRLd0NPYmJ2bXdOcy8z?=
 =?utf-8?B?eSsxUTBQc1V3cWlkSGVwK2RkWm1DSk5ZeVh3MUw2eDUwcUs3QnRRWGlQdVpC?=
 =?utf-8?B?eWkzVzUzZTN4NEZWdmZMNG45OUNna3dSMlBGMjl3ZE0xa0QxaXR1dTV0WFgy?=
 =?utf-8?B?RTlkU1dSYlIzc3RYV3MxZmJ0dDcvbWpLQ21XZE5tdXM0am94OWJjVk5RT2h3?=
 =?utf-8?B?RmZLWGpSV3gyVlZhSC9pVWJJcWxseVBnYWV0WkpnNk55UC9rc0d2M1l1RlhT?=
 =?utf-8?B?TmpTS3J1RWZQRWluczA2KzFNQkJTVW8zSHNZcEVVZnBKMjdBa2t0OHZZdmNJ?=
 =?utf-8?B?SHg1OVhPOUh3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B16B6769CA3C34EADEAED171B1F5442@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10757
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f9319eff-f301-4a7f-54dc-08dda4370c25
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHpNUG1VQW4zakNZS2hHVkloNHFpTzhJYXh2UUFjbHpieVdmZVpxMzBlYUVr?=
 =?utf-8?B?N3dLa3V6dEE3WHNiOGxFT3JJQ3h1NUU4NlR5YlhFZEhISFBwcllGZTdUQTVW?=
 =?utf-8?B?Z1BhenROdmtFZlhQbzZQQWtnMkhHQlRyeXV3Uy83MitSVG9xeEpjODBIK054?=
 =?utf-8?B?UVVQZE1JTEhYYWNXY3BjRzFGVm5PaHNIc2FabnhONFRrNzhzaFFpKzlxZU5l?=
 =?utf-8?B?R1pKTVBaSUtlWWdHS1BWbGVFVzhjeGIyTytMeVV0b09FUEF5L1QrR2FvdkVJ?=
 =?utf-8?B?M3EwbjVRSUxDSlg4OTdSamNPYm9DUmljSFVWRzErWENWSFpkNmhVTUc5M3VP?=
 =?utf-8?B?cXhjRUNXU0lDWmVWMVJNaVNyMEZzaGpUMEJVUk4zZFhGR0hES3Z4TW11WFJP?=
 =?utf-8?B?ZUx2QUJjZHV2cVFVRnlFSi8yd25EUEMzdXNuR3V0Nm5sbWtEeXZ2NzVCZitj?=
 =?utf-8?B?cWY2TzREM2tNdFhHbzBqQXY4azVaTW00eWJGKzVEcGNlWHRzWmxVVUhhTlBa?=
 =?utf-8?B?VEtZZm43aDIzaUcwZXl5bG44b2tqMGNHV2Z0KzkvL05XSkhldDJiaGh6Smk5?=
 =?utf-8?B?ZmVXMElEUTlKWEl2clNid2tqTTZKMUErQXMrTUFmN0lMakhFUXlHUitsNXF6?=
 =?utf-8?B?TUNKZno4VFp2bHZMSXZIMWdPYTZucks4UEQydGVDdG1leVlLY2kxRDlYSkdR?=
 =?utf-8?B?RHpUTHAxYWhlVnYrdjQvSU1XMnZJUG1VTEtPSFhMYm8rdXlkUzRwOWVTYmVY?=
 =?utf-8?B?TStleHVlVk9aa3ErV2UzZkdiOGJSUm51N0FSYi8xdlcrVWVYR0ZxMEQ4cWF4?=
 =?utf-8?B?ZWtnQ0RBYVNuVEZ2M1hIM1dNcmtiYTNvbTZZd0wrOTJkTnE4Q3o5Qi9jREl1?=
 =?utf-8?B?N0hYN3YrTWlSNW1jemg0WHNNM2ZKZjVsdWI3eGZZTHZ2MDlFbEIxVDZDR2Fm?=
 =?utf-8?B?N3I0a282bG9MaUJ1dW8xOGZ4K0hDUmEwNm1UYWJTUXVDWnpFVldnbW00SXhR?=
 =?utf-8?B?Z0Jxd3JVVXFMcWI2TEc1a1hldXNsZnN1TDU3eUdKTkhDcCswanp0akU0RC9o?=
 =?utf-8?B?dUJyWkRnVlpQL1BscEQxSEk3dFFNbUNRTEJLR2dQMFExUnNvOTAxdHpvL1hG?=
 =?utf-8?B?Q2czQWV6MFh2RFVVSGROM0d2SWRRM2VEYXlWckxFTTRXbWJ4UWpSSGNCaWkw?=
 =?utf-8?B?N0lWcFNpWkt2TjVMWTdBalE4RU1UcXFtT3ZGTHpzQ2hKcFZodUNXNlUvOC95?=
 =?utf-8?B?SE5EbVE1Wnp6UHZvWngxYTdlT1JqVzRhbGxNK3pCS29hMnVNWHl2eXAzazZO?=
 =?utf-8?B?ZENwakFtMUJkbmFtcFVleThUTE4wclVjZUJMdmVTSTBKT3pySjNiL2NJTmJy?=
 =?utf-8?B?bHVCOWNBdXBJOWk3TDl5NDZpVUJqVlpVcjdZb2xaWTZjSEQ2OHBacFVwTmk3?=
 =?utf-8?B?dllkWFFncytheDdIOURvWXhLVXE0NGtrOFVvdENoREsvUCs5WkE3c25DV1ho?=
 =?utf-8?B?Qmk3QnlaYmtHRE1DVWh0cHkvWVJQN0JmMFJzNEVBc09pZUpIYTJGL2JLdEl0?=
 =?utf-8?B?U1RNTXFYb1dRQWJjWUVLSW1pRTZrUXFWcUJCbjJlekxFVWw4bTdpdEthRnc1?=
 =?utf-8?B?aVUzaGxHZFlvNXNkN2tkS01qUmxVdzZvdnFneUllK280Y2wzMkpFV2F2eVl3?=
 =?utf-8?B?VmlJN1RCbk14UGJiZnh6bEhBc0UxSXNiazVpR1NwV3V6dFN2MG5seENZeDdS?=
 =?utf-8?B?TUlJS1djd3R0VmRNWXZNY01YQXlCa2t4SXdsZG0zem96dXFRQmFLdWRCYWdv?=
 =?utf-8?B?RUtVd1hTQ3VrcGVoWHZCT1ZrM0EyRm9YdkpQRWM3WWVYMVgrWHNkVmovckVC?=
 =?utf-8?B?N2kvaytnUk4rZEs4VnRaaTJqOGgrd1pLbHd5dlJleHFjb0tRVTMzc09TUnpy?=
 =?utf-8?B?RlFBZUpta0lacHRqaENLaXNXbnlrS3FVRWdjTytSZUNLSy8zdUlIa1pSK1pj?=
 =?utf-8?B?L3VMSFlwUHZ2T1JyNE8xYUswSHpxcjJ3OUZCWFJhOXBpTjcxWklWbkY4cVE1?=
 =?utf-8?Q?KxVYbE?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:44:42.1089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326fafa3-1f48-47b9-42bf-08dda4371fe8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8507
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218020

T24gMiBKdW4gMjAyNSwgYXQgMjE6NTUsIEhpYWdvIERlIEZyYW5jbyB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8aGlhZ29mcmFuY289Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gRnJvbTogSGlhZ28gRGUgRnJhbmNvIDxoaWFnby5mcmFuY29AdG9yYWRl
eC5jb20+DQo+IA0KPiBDdXJyZW50bHkgdGhlIGxpYmdjcnlwdC1uYXRpdmUgYnVpbGQgaXMgZmFp
bGluZyB3aXRoIHRoZSBmb2xsb3dpbmcNCj4gZXJyb3I6DQo+IA0KPiB8IGxkOiB0X3RocmVhZF9s
b2NhbC10LXRocmVhZC1sb2NhbC5vOiBpbiBmdW5jdGlvbiBgbWFpbic6DQo+IHwgdC10aHJlYWQt
bG9jYWwuYzooLnRleHQuc3RhcnR1cCsweDE4Nyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHB0
aHJlYWRfY3JlYXRlJw0KPiB8IGxkOiB0LXRocmVhZC1sb2NhbC5jOigudGV4dC5zdGFydHVwKzB4
MWQwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcHRocmVhZF9qb2luJw0KPiANCj4gQmFja3Bv
cnQgdGhlIGZpeCBmcm9tIHVwc3RyZWFtIGFuZCBhZGQgIi1scHRocmVhZCIgdG8NCj4gInRfdGhy
ZWFkX2xvY2FsX0NGTEFHUyIgdG8gbWFrZSB0aGUgY29tcGlsYXRpb24gc3VjY2Vzc2Z1bGwsIHNp
bWlsYXIgdG8NCj4gd2hhdCAwMDA0LXRlc3RzLU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVm
ZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gNCj4gZG9lcy4NCg0KVGhpcyBoYXMgYmVlbiBtZXJnZWQg
YnV0IEnigJltIGN1cmlvdXM6IGluIHdoYXQgc2l0dWF0aW9ucyBkb2VzIHRoaXMgZmFpbD8gVGhl
IGNvbW1pdCB0YWxrcyBhYm91dCBOZXRCU0QgYW5kIHdl4oCZcmUgbm90IHNlZWluZyB0aGlzIG9u
IHRoZSBhdXRvYnVpbGRlciBjbHVzdGVyLg0KDQpSb3Nz

