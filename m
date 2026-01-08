Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC40CF6ABD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:11:21 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3506.1767867073678245070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h6GADjT2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h6GADjT2;
 spf=pass (domain: arm.com, ip: 52.101.66.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F91PQwyjPed6TflAXVQWXLSEm9uP9/c6dNaoB+4EgM5kO7AeZBWwURpnbqcnH43b3g/a9tmjxuy/74NWvf0l6JjOoEm3zLvROpbyfupy5jkMcoAmxkI5LZDMrNag8bxQMaGk7LSN8FI/pl+rGnvLhz9Qv/k81+b8AcfytGOYeA0i5F9+LazH0YhSsgwh13/HsLX+1nc0fFoK8/YWixO5cpKg1OPl0lDq4P7yyCVL76fuwYufwt6988nz8GxXvLlQ8SPveaIP7YSDBLXzO7MWtQ6xUDLlOe8Xy/snKl8ns+v0e8TioIbhSabKgpEIiNWjKQIO3yCKwadXQxlT7dwRLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=co28ZSYaAVLSjQTrpm47bR6V5RzZ4i5ysn+fR1VURZ4=;
 b=Ka9/1b9sK254bjYRtJZcaE7WZEjQTassX9cW1AUPbIHUXn9bn3yTEQjSrglHxvTHm06mxvZ+uxoLoVJ7/ty3GK7PWhZcxPEaBJ3e7thJmtJ3jg4YFbnR281OLRhqYmuogjEsfm/AtR7fAGGQguzpHW6vDrnqmJfWEw69duDe5o2xKYpNOqQePy9pD+U5+yGu8KAYQaqybEzTuNMWRLd0SwpBHiZJKUv8xEBqGpv0M6a8lS0XAb8Z+vnVw6Q0s3+3NZ/Wp9SyHbYg5Qkf8AH8DT8bDf8G6/n737vDnMlGX+P8gC5XYF+2+lCD5HuKe10efmg6VTfI8sHcFj8zkNq0+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co28ZSYaAVLSjQTrpm47bR6V5RzZ4i5ysn+fR1VURZ4=;
 b=h6GADjT2453S1+zhjng1XkT/K730QsMUHOPe5WfEcS0ya16kS6x5zOlsSER2Na0Ke/kJaPdApjBj4Kb6NOq7gUmbLY8HI+8Nd9NDMxT3gASxfJoRLUP+WU1xrsYLXKtFU6lYEj6a1o7g7aFHEh6qUopE0dX/fzOtM2UhkOJw+3E=
Received: from DU2PR04CA0236.eurprd04.prod.outlook.com (2603:10a6:10:2b1::31)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:11:08 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::59) by DU2PR04CA0236.outlook.office365.com
 (2603:10a6:10:2b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 10:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 10:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N46v+EcHxSqO7yBmT4b8Oe+TySCtnwxlm+ZRuEmpQxHph3yPhZd+7g4n59IJBUKR9z5CVVI2CDq9hoFHkv6zo2lmBI6gitXIhahYE0HO5cGS+/OakBEm+E/GRSWG6bW9ziSnL6Pa+7jeY3Lp2cr0GKMX8GIAzsvXSaXYDERgZ3sV2x+bsw3n02932dZqa+oFNfyrsI0kqlzIoN4FdJEhCnb7hxx8blo2yaekSLRGDIJgoepr6HUo9fYY+7nvEVsj6+WRhjN7cPu4x4qhiCGK4ux0o2x5KOBn8T73haaXfDw3pgBtNjzC52INq4YLM+xUerM32UeCljPZozlkhFhKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=co28ZSYaAVLSjQTrpm47bR6V5RzZ4i5ysn+fR1VURZ4=;
 b=KMb2b05xO/4h4pYT/IqzVLNsV0CPKDR/soen/OjChfZ/3/CyjSS2OUbwumeDjwQePDt8R5f2sKvE6Gw8CopqoDGCEfOFI32Pbfa9FXDcJOxgZ3MU7R24yXkEHalDT2+O8cv4dxaKvHsGYbaOdaonJA7WodfqPt8gJjJgGxcSI8X44JRn78uxJ5ry6fq8YbUrm9v6CD4J25404dTFbOSJHC8Zni9Dm2mZ7pr7JPMBcbx726qbfGcLPiBcQkmILskW6RYRmaVfPNHlyE9H6UzXaMCS4FpEYf7FslcQJoNsYjEq8xLqpgW4MLwTUJ8fDLrYf1T7qVX7pqCIiV6BMeP5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co28ZSYaAVLSjQTrpm47bR6V5RzZ4i5ysn+fR1VURZ4=;
 b=h6GADjT2453S1+zhjng1XkT/K730QsMUHOPe5WfEcS0ya16kS6x5zOlsSER2Na0Ke/kJaPdApjBj4Kb6NOq7gUmbLY8HI+8Nd9NDMxT3gASxfJoRLUP+WU1xrsYLXKtFU6lYEj6a1o7g7aFHEh6qUopE0dX/fzOtM2UhkOJw+3E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10484.eurprd08.prod.outlook.com (2603:10a6:10:53a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 10:10:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:10:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] go: fix multilib file conflicts
Thread-Topic: [OE-core] [PATCH] go: fix multilib file conflicts
Thread-Index: AQHccvKSzBTMnupcBEK7FkpIB1AnNbVD9qCAgAB3VYCAA7oAgA==
Date: Thu, 8 Jan 2026 10:10:01 +0000
Message-ID: <D3892BD1-671E-4177-9154-08CA89880ADC@arm.com>
References: <20251222032455.2683666-1-changqing.li@windriver.com>
 <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
 <979d9d7f-8a2c-4cb3-8849-d8724f3d0f58@windriver.com>
In-Reply-To: <979d9d7f-8a2c-4cb3-8849-d8724f3d0f58@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10484:EE_|DB5PEPF00014B8B:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: de360409-b96a-4017-6d37-08de4e9e3d8f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YlRmVjZYeTJCTVplZWNOM2piTkZJQjlicVJzYmNId0Y2WWY0OVg5VG1RUDM1?=
 =?utf-8?B?MTloMzM1TmQvK2tvb21MenRhZ2lqVTlyeFIzK2gxaEFZMVpsMlk3QmtvWFpl?=
 =?utf-8?B?Rml5Q2lEcWk4SVJHV2VhZ3laanI0b3BuNVFpaDlMeXpOVWJUR1E1OXNDU3RN?=
 =?utf-8?B?eHE0bGM1QWlNeTYrSFdMV256NXBjeFhPVzNWRFFmOVRBK000OGRudW85TnZn?=
 =?utf-8?B?NEVvY01WYWpiVjRORW5QOHJadGd2VGVTNGR5U2JZV2txQ0w4TUkzOUdRN0t6?=
 =?utf-8?B?ejVZWTJ3MHFyQVJFN29pZm8rd3RUaG5QRllHOW5ZSCtjUUc0a2JNNlJDWDd2?=
 =?utf-8?B?bDRFNzFkK2g1NStxd3R2VkY5TEl6dXRBb3FpdWIrSG5mL0NCOCtlTUpDekZv?=
 =?utf-8?B?TmhxMTcwTVN6eXdtRFZEbnk0SHNIMlVtYi9WOVRTekt3NkE1SlhTMkdyRmRE?=
 =?utf-8?B?WkRuclc4YUpVczFIbDFCbXF1ckJzK25QUjhZQnF4cFdlMVp1bS9kaVlOWUFo?=
 =?utf-8?B?NHVoem1WR0VOYUJ1emJIUlFHS29OYjluMGhWVjc0ZzVvUVhDdHZTaW5UeW50?=
 =?utf-8?B?TUlWdkJOVnBRNm5FRzkvVURGK3lneEUwWFl5T3ZGWEI0bVB1ZmhxUEtWTS9l?=
 =?utf-8?B?ZlNZQVBoL3pXbmtCQTZja3lLTWJPU3pEMmwyTnRlUElwbmU2UTFJMFBwU3o0?=
 =?utf-8?B?cEJndHlPVzVNMWd0d0Zud2pDc3JDZXVOTi9IbEFIdEFhMzhzWVZMdkZUL2ZO?=
 =?utf-8?B?Q25aRWxEYi9ScUwvRjdNTmU0dWJZL3dMZmxUMVpqTlVrcDI0MjNVOFZndEYy?=
 =?utf-8?B?UlpoUlF0QU5KWVB0QWZqVWRnbkFqRmd0MVBtK0NSL0NsUlpGZ3hQVEUwRERy?=
 =?utf-8?B?Q3BncGdFOTlaMVhlUTR6WFozOEF3K1lndUYwb3Rxb2pZcEVOeUtMNFJpZGJp?=
 =?utf-8?B?cmhzOHY2R2xKdnpBQUZSV0U5U1FyaExyRUl4ZTQrSW41R21JbDBha1hrRW1h?=
 =?utf-8?B?bnZrdGJRL3A1TDVoemtaL0piOFU1YW5xSTgvSkU5L3ZvNnBMMFhpWU50Wk1R?=
 =?utf-8?B?MkFoSU5RUlBuek1KRkE4ZmdSdTNuV1hvZnY1dW1yY2FFSnlJZmRaNExxVm5Y?=
 =?utf-8?B?anRpamZENWFEbmdQY2EwYWxFbWpUMG1Bd01YaUsyaGtoL1R0eTJKRGh0Z2tZ?=
 =?utf-8?B?ZEY4Z3VmZnRuOEcrZ0VQekhwMXNrTytqbE90OEtoMnpNZERFYzlaOHlJSllG?=
 =?utf-8?B?L3NtTnV5cFpmUnBxNElDYTVtUVJ0emM4SHpPNE5SVkkvSjhvajBGYjJSWHo0?=
 =?utf-8?B?OStEbVo0bTNVdmtLdTdwcUpFeGpGY0RRbENOSDFYMkJMazdlMVh4YVpaQXZ5?=
 =?utf-8?B?azZyQ3ZmNnpLakpOQ2tQWlNoblgrcHBDK2Z1eDM3cFZ0NXIyd0M1dzFjbTMv?=
 =?utf-8?B?UVhpeVJndi9TYU1iTG91eHdXd2FUam41QWNpWjRnWHNPbUFoczBoNy9LejI0?=
 =?utf-8?B?d1JXcUVRRzM5U3BITFBuQWdJUG43OUFwdkhLeWJaa0tOcEJsTlFQajRJRDdy?=
 =?utf-8?B?MTh3b0FpQUVkdjE0Q2NEMmlYdlhxenYxNlN3TDVsQTF6UFY4ZVdhblExYXpZ?=
 =?utf-8?B?RmI0OWYwRk5KUzIvV3FEZFFxVkxlT3RvM3o5YnJXbjQxWkNIQ1ZIZ2NTTVE4?=
 =?utf-8?B?UEhleUdDQ1NxVmZzNnNmdWkxYytYU1UrVmpzL2F6RU1CMDZXdkg4ZzZ5Z251?=
 =?utf-8?B?YkdqY2FVN3E5VDlVS2hGQ1NqNmEvQlR4KzlFZVpScjNvaTYrQ1FtVTlrdW5v?=
 =?utf-8?B?TUZhWEI1amVmVkZzeHFyV1o1SWdUQS9FNjA4K01ybFVWdDZhUDNKUVBJbVNM?=
 =?utf-8?B?RHh4blZtV2xCQWRKQlVXbEFBRDF0aFdNRFE4VkxZeTNlbVJYeWFHVzI0QkhR?=
 =?utf-8?B?MUtBa1FJRzM0QzZESTZGd1llcnl0cm03SHNWaW1FRUNYREdOMDBwMVNEdW5p?=
 =?utf-8?B?cW1aQmY3WlROL1JtdFI2b2hBYm5aNjJIRFB2RjdONWMvREMxTTljUEhnNWtl?=
 =?utf-8?Q?YPyDYM?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFF7D6097B5B2E4E9928413A92F412AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10484
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c33b0c3b-bce8-45e9-579b-08de4e9e164f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700013|82310400026|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2JMTzRwZ25RaG45TU9UWmozY2VBem11c3hrUncycHhxbGd0Vkk1bGhNMlRn?=
 =?utf-8?B?RXlUdUlWMWtBOURFTEhOekxITFZhVXRCWE9zRVJGRjVWZS9TTkIrZFUwSDhl?=
 =?utf-8?B?ZTc5SXVrVzlYbk44QnZvR21YTE11blhZRWFTNHk5ZkdpNVFkMnJlSUJMNHc3?=
 =?utf-8?B?Wk9MUzl5UGdrUS9qazJmWXN1MllnUlU2RC9ONVhxa0JmMU14VGU4cnRPYkc3?=
 =?utf-8?B?ckJFU1FuOVBlOGFvaFMrZXpGczFXRnQ5Zi82QUxhRnkrVGZFVjNSNFhnWWh2?=
 =?utf-8?B?WnRXWjZscVA0a0UvZVNjeFdSeHp4WjNNSGFySzZpQ3QzT0ZWWnp0WGNyV1hU?=
 =?utf-8?B?Qjdsc21JODN1YlVmTTdZVHZMNWtCanA2UHZYVTZ4L201dGdxS2c0UFR0OXRE?=
 =?utf-8?B?QUFnVDZaS2o5ZDE3SmZGY0U1TFN0MWhIMEh0MUY3N3F1V3RqVnhJcmhFTml3?=
 =?utf-8?B?ZWdyWlJWTzdCTGU5SFVkRmx5WENPbzh1S0lIODBoNGVwclRSeENKNmVtWlgy?=
 =?utf-8?B?MjNCZnY4MlVoTThJa2ZhZXlJSU1NZnFlZGN2cVVLdW5NY0xuNmdDU0pyY0s5?=
 =?utf-8?B?UmZsYTIyd0NnbEdwWjBRRmlpc0JuSzZaZm9IWTJoNVZKQ1VZQnBRbGF3NEhK?=
 =?utf-8?B?WEl6TTJUNFpCRC9rYld4TkZwdStRRUdjSTBBRmh5SVBZMDFaYXlJNitra3hD?=
 =?utf-8?B?ZEYyUXNodndUNEVicEE3RTBOZ0NMdkVkdkpqT3ZMYVQ2RmM4a0JCOWpLdkV6?=
 =?utf-8?B?OWJHS2VES0h5MzZDQ2lEKytnU0JWTTFuN0ZWc1ZrMUw3SWpWc05OYy9ySWd3?=
 =?utf-8?B?NUJFR3ExU2RTVyttL2F5WWFkV1RuMldCZlozbVJ1eGgvSW0veXNjVDUyU1hw?=
 =?utf-8?B?ZFErekowMWx1WTgxUWQ5SjZDWlNTdGRtOENHME9hRDBtbS9qMXp0RnNBcnJZ?=
 =?utf-8?B?MHg5VlkxamJiekRkc0tSWEhzNk84M3VPbjJTZFJqNWhWenN4Z2hIZHJLQTd5?=
 =?utf-8?B?U1ZKcWxHL2RGNXF2UUQyT3ZNSDk5REIxRTVvL1lraXloWGNJaVJvZmFOOXJN?=
 =?utf-8?B?a0RJNmJLMGkzWjFHQXYza1BwQXRtOHgrVVV2TFQvWEtDL1B3RnNWVmtRSU5S?=
 =?utf-8?B?NFlhektIZkdvVWxLNzMrSWZXRHdTNEZ4TTdONHhiciswVXNMVXNMcC9oZlRn?=
 =?utf-8?B?cDhvZHk0N3RKQndVTnVLemt3UFNaVXk5UjFmbVFMeFdmTnJRYU5NcUYrM2R0?=
 =?utf-8?B?aEhVQ2o1bzhpbittYS94cGJRQmNxanM5TitaR1dNKzBRUFgxQ1NDSDZhV29X?=
 =?utf-8?B?NDN5MlppYWZqcEQzekxQTjNqOUZQR1J4WmEyMXZ3cnFpL1ZiVGFqSi96b3Bj?=
 =?utf-8?B?Mmd1NkZ2VDJyTUlpbVYxS0ozS21rOTRnRytyZ0hva2dtdk5jTCtVT2xWTmI0?=
 =?utf-8?B?VzlsdlpXQkVZbmR4NVdsNWlGalp2TDVuQURmbEhoSjkwdGxlTURlNThpWEhE?=
 =?utf-8?B?ZXozUFN4c1VnT1l2bVpMU2E2c0JqNUpndzdncWlXSTJGU2Q3Y0x4cU8rYzlQ?=
 =?utf-8?B?TXcvb1BRL2FhWjJjSDVuTnpZaXdKVERnUklmTUNvOU90M1hGNHBvWlNCWTFE?=
 =?utf-8?B?NkdrSmpTYXcxQS9yb2F2QnYxbTF6eGxVR0F3RVRJRzBSSDErbDVvaUdkTW4x?=
 =?utf-8?B?dGY4YkkwUTFhQ3hsMDduV3F4Mkt3VkcvZ3pSSVdSSk5paDFIZEFiRnl2QWFz?=
 =?utf-8?B?N1NuYTNKbTZDUWx2VC9kbElKemxNclc4Z295NkJzNzNrdldEV1NKSTFjSndN?=
 =?utf-8?B?WDFsUFBadXhvNzFGU3F3SnRiTjdyS2xwWGtTN3hUSHhQN1lNNThRZmliQkNq?=
 =?utf-8?B?eU5haks4SC9ZWFhwVEJmMDZYVWg1U2VDMTRhaWNHbWxGNElHVng3Si9sQk80?=
 =?utf-8?B?OWUrcjRFSUFZUFkwZUlSR3BrOXFPNnliZ21VZ091MFVITVRTZlk1S29xeEVr?=
 =?utf-8?B?YkRodVB2b0w2aWVUdncza1V1SXNrdTh6SXgwK1h5STFNRFBsemRtb2lNVmJh?=
 =?utf-8?B?NGxhU1BqbllRV2MveUlOWFQ4dlZOelZGSE9uMEM5bGltdXRhQjk1dXlOem1m?=
 =?utf-8?Q?5AnQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:11:07.6797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de360409-b96a-4017-6d37-08de4e9e3d8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 10:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229053

T24gNiBKYW4gMjAyNiwgYXQgMDE6MTUsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiANCj4gT24gMS82LzI2IDAyOjA4LCBSb3NzIEJ1cnRvbiB3cm90ZToN
Cj4+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWls
IGFjY291bnQhDQo+PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+PiANCj4+IE9uIDIyIERlYyAyMDI1LCBhdCAwMzoyNCwgQ2hhbmdxaW5nIExpIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxjaGFuZ3FpbmcubGk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4+IEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdx
aW5nLmxpQHdpbmRyaXZlci5jb20+DQo+Pj4gDQo+Pj4gVGhpcyBpcyBmb3IgZml4aW5nIHRoZSBm
b2xsb3dpbmcgZXJyb3Igb2YgJ2JpdGJha2UgbWV0YS1nby10b29sY2hhaW4nDQo+Pj4gd2hlbiBt
dWx0aWxpYiBpcyBlbmFibGVkOg0KPj4+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0K
Pj4+IGZpbGUgL3Vzci9iaW4vZ28gY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxz
IG9mIGdvLTEuMjUuNC1yMC54ODZfNjRfdjMgYW5kIGxpYjMyLWdvLTEuMjUuNC1yMC5jb3JlMl8z
Mg0KPj4+IGZpbGUgL3Vzci9iaW4vZ29mbXQgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGlu
c3RhbGxzIG9mIGdvLTEuMjUuNC1yMC54ODZfNjRfdjMgYW5kIGxpYjMyLWdvLTEuMjUuNC1yMC5j
b3JlMl8zMg0KPj4+IA0KPj4gV2h5IHdvdWxkIHlvdSBkbyB0aGlzIHRob3VnaD8gV2UgZG9u4oCZ
dCBzdXBwb3J0IGluc3RhbGxpbmcgYmFzaCBhbmQgbGliMzItYmFzaCBlaXRoZXIuDQo+IEhpLCBS
b3NzDQo+IFRoZSBpc3N1ZSByZXByb2R1Y2VkIHdoZW4gbXVsdGlsaWIgaXMgZW5hYmxlZCBnbG9i
YWxseSBpbiBsb2NhbC5jb25mIGJ5IGZvbGxvd2luZyBjb25maWc6DQo+IGBgYA0KPiByZXF1aXJl
IGNvbmYvbXVsdGlsaWIuY29uZg0KPiBNVUxUSUxJQlMgPz0gIm11bHRpbGliOmxpYjMyIg0KPiBE
RUZBVUxUVFVORTp2aXJ0Y2xhc3MtbXVsdGlsaWItbGliMzIgPz0gImNvcmUyLTMyIg0KPiBgYGAN
Cj4gYml0YmFrZSBtZXRhLWdvLXRvb2xjaGFpbiB3aWxsIGZhaWxlZCB3aXRoIGFib3ZlIGZhaWx1
cmUuDQo+IA0KPiBbc25pcCBvZiBtZXRhLWdvLXRvb2xjaGFpbi5iYl0NCj4gVE9PTENIQUlOX1RB
UkdFVF9UQVNLOmFwcGVuZCA9ICIgXCAke0BtdWx0aWxpYl9wa2dfZXh0ZW5kKGQsICdwYWNrYWdl
Z3JvdXAtZ28tc2RrLXRhcmdldCcpfSBcICIgDQo+IFtzbmlwIG9mIG1ldGEtZ28tdG9vbGNoYWlu
LmJiXQ0KPiANCj4gZ28gaXMgaW4gcGFja2FnZWdyb3VwLWdvLXNkay10YXJnZXQsICBpdCBpcyBl
eHRlbmRlZCBieSBtdWx0aWxpYl9wa2dfZXh0ZW5kLiAgc28gYm90aCBnbyBhbmQgbGliMzItZ28g
d2lsbCBiZSBpbnN0YWxsZWQuDQo+IGdvIGlzIGFkZGVkIGluIHRvIHBhY2thZ2Vncm91cC1nby1z
ZGstdGFyZ2V0IGZvciBwcm92aWRpbmcgZW50aXJlIHRvb2xjaGFpbiBpbmNsdWRlIGNvbXBpbGVy
Lg0KDQpNYXliZSB0aGUgcGFja2FnZWdyb3VwIHNob3VsZG7igJl0IGJlIGRvaW5nIHRoYXQgZXhw
YW5zaW9uIHRoZW4/DQoNClJvc3M=

