Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3291C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 22:14:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web10.7810.1721772854463722236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 15:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lbSnhrxx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lbSnhrxx;
 spf=pass (domain: arm.com, ip: 40.107.21.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sePDYO0d2dvdBZXGhPeMUQ8BFhq8V3e5ZHBHoIA9eRKw+R0Sg5+8T1cmOdgSITyIQJCQw30vyxDI6hTP1nRX5qkOiU7uqiKz9oDmWlqtrrd86Jp6Ld9iqxZ96w7inSLhLfOfEgBIBVMguwYVHyFcy1SHD6XPysa6xdB+3oqk97l51gR0qteFdVaIS00MsK5rRFLueVq/ku7nhsECwb9Qwo8GaqNDYu7T4WaRLdrVxQwVA6Wz+yeU1RNxfo4vHsk4vtydIMgr5ie/OrnytoC4PfrXoHGk0+0glDYmwSWC0vBAAiq1F/Zpgo1APPhOj5dg6ohoAU2oq5k8cr2KyvQfLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGYWAjmEZuA4PSRXoRe0WICCufdSfdoVOzKEDFI0l7U=;
 b=Syz6KmQwSd4QS1B4+MsLMHc0NGrIWf3r3i/Is7vSHPsIWbxwDPUaWDQ1kbMM5pc8t/B1/7KYJGfo1E9Vqr6UN/7S8aJiRYOjloihpRcC7uNY6JmWvr56ggXsgquuhb5xTivkK+ZPNZN9R+w0T3yQAtL9pEvfBSZ0nft9lY911L6Ppar1aU9/jrolxA5+x4NfcuJ2r7RBXXsuwCLE9oTy77KwzPDutj8jxYYaG0s85h2eul9NE5C4tVMp4yfHXtsu5eonNsqmE8TWe5s0W+q7ax7c0Q7G3apGJ00WeKcxwyTSlkcq/5hBCKOWjl8+7+ooIXUXnjdLaA/Jttq0D/oacw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGYWAjmEZuA4PSRXoRe0WICCufdSfdoVOzKEDFI0l7U=;
 b=lbSnhrxxMunxFX76SN8VEHKJyGZltv2D0O6vyZbuR39+BfvE6R2l3Fmu7psvwrwPJ/oFZfKSTEc3flZSPXp9A0d8P6mNmLhP63BsJ1PvZx1DFKQvVMyixVrEULOkM4/BF/yVvhkNHdQlq0ia+uaVYk1LU6twJlBzaggLYtKcc18=
Received: from DU2PR04CA0167.eurprd04.prod.outlook.com (2603:10a6:10:2b0::22)
 by AS8PR08MB10072.eurprd08.prod.outlook.com (2603:10a6:20b:634::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 22:14:10 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::d3) by DU2PR04CA0167.outlook.office365.com
 (2603:10a6:10:2b0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 22:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 23 Jul 2024 22:14:10 +0000
Received: ("Tessian outbound 2fd79eef2229:v365"); Tue, 23 Jul 2024 22:14:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16f84dc25f1cd77b
X-CR-MTA-TID: 64aa7808
Received: from L0a25d9699d88.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A99BBCCC-56D5-4929-B95A-38A2170779B6.1;
	Tue, 23 Jul 2024 22:14:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0a25d9699d88.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Jul 2024 22:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnZOJYGqXP02WGOjoFSLUPwcgN6pxG4Il2rFk46hxd+fZ51Yq9sh5K06MaYphVpADwOVqX/WTVjLAziW9fqIekGyDxl+C9yUE4nYzmTXi+JLm501HCpL/rSEJuvxv1DSmXijO58zbanZWP6KU/qdQ5ZQkyfNFMmsBRPu4KdB1MuIEnkxeSvCzY6wkD0VpKP8z0DTerVmC4Kf5n3ru69pJMTJJWiN811qatfRWVGfoUwN7mHL/0jx2CJhgefOW/nrGGOliBZUA48Gx60V476iU5j11IuSZTsi28ZffTWfE1sfz+8XETu6f+wEdoI2KRVoFgb3aIiymj6Zv41hplXGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGYWAjmEZuA4PSRXoRe0WICCufdSfdoVOzKEDFI0l7U=;
 b=QfPi1Q6LYFFHjtx+PMhFKDF7E/A6STWRFwkrmt9z+NK+MN6WpU/DYQYzh5ygYtKI4Hb+hYwKyT6LzAAGsqcRDeWih8Zr22ELsKG3kx8b0/VWUQ56hdNletsl1barnU4RbkJnMziZ6yfl2OS0uQ17n19K/xFuyP1PkZ5TyfXFK76/JfR0djFyRill2FbAoskpZo98uG+UzwV6YiCtBABYLm5dg1W+3Wt8q2ttZ9BDQHfyWzUmyJfe6W+siRlSKbg7De9VTok4WY2lQA0FyEq0nE4UCkmp697lb77sB1BRSj8dbcZdwvGTQuhKjRQ/1AXtldXke8gWjOnGjR27GpDopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGYWAjmEZuA4PSRXoRe0WICCufdSfdoVOzKEDFI0l7U=;
 b=lbSnhrxxMunxFX76SN8VEHKJyGZltv2D0O6vyZbuR39+BfvE6R2l3Fmu7psvwrwPJ/oFZfKSTEc3flZSPXp9A0d8P6mNmLhP63BsJ1PvZx1DFKQvVMyixVrEULOkM4/BF/yVvhkNHdQlq0ia+uaVYk1LU6twJlBzaggLYtKcc18=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6396.eurprd08.prod.outlook.com (2603:10a6:10:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 22:14:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 22:14:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: upgrade 1.4.0 -> 1.5.0
Thread-Topic: [OE-core] [PATCH] meson: upgrade 1.4.0 -> 1.5.0
Thread-Index: AQHa2fN4DDYp/IEtaUaSvLTzoq7PzLH/l3OAgAVP2IA=
Date: Tue, 23 Jul 2024 22:14:01 +0000
Message-ID: <A7C5AEF8-49A1-4722-B6B1-7BFE319EB9F9@arm.com>
References: <20240719155039.3243662-1-ross.burton@arm.com>
 <0a8d102337d8ae985340cc99033043190340b2a5.camel@linuxfoundation.org>
In-Reply-To: 
 <0a8d102337d8ae985340cc99033043190340b2a5.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6396:EE_|DB1PEPF000509F4:EE_|AS8PR08MB10072:EE_
X-MS-Office365-Filtering-Correlation-Id: 8022a45c-3ed8-4be5-841a-08dcab64c705
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SGwrRkQ4TFUxVHRNUFl6WE41SVJ0eVZuQ1I3a2JpdTB3RWFjMysvd0tZZTda?=
 =?utf-8?B?U29mQTJsdUgrT0Z6NXNQRHRwb1I2S24xQ2dIZ25tTFRYQkdrR2JBNWVaaWJ0?=
 =?utf-8?B?TGE2SDFMRHp3TUZwbG15cDJITlNocklXTE1RREt0Y0RleVZKQXBLTkc1ajV5?=
 =?utf-8?B?bnBCWVdaTWFZd011RVhMV3RGMGh1aXVsbS9oVHBtdzFkTTM5YjYra1NTVDVq?=
 =?utf-8?B?d2tKd3JNOUwxNUJrOHBCanhHa3lqTXIwOEhQSW1KdVQ0WHRPeTBjZ1c3dHhO?=
 =?utf-8?B?bS9CalZwV3dPTHdMWm8ycWJMWWVtejBlRFRpSkdBaHlCdmQzeXJIemY1VlVT?=
 =?utf-8?B?aUcrWVFGaFcrTGF2Z0t5SGM2WXh0MWZVSzRBSTRWNXE0UHBLbG9qc1dyWERI?=
 =?utf-8?B?OWxrZDhpcmZ1YWJSaHNnQ2Z0Y0NWVnY5VzQwclg3YzBKc1kwRFlvZHg3YitQ?=
 =?utf-8?B?c1NUTWJnOU1YeEVQQkFGR2d6ZURzNmdPdWlpalNPcHZvLzd0Q3hRRGV5a09K?=
 =?utf-8?B?VnJjalIxV3hUYUNjS3NLckc4Yk5iU1JsVG5iNkptcTBnV0x4UWpDMTJyRFI4?=
 =?utf-8?B?dm9PRVFvMFBpT1JJUUtKcTl0dXJUaGh3VXQ3M24xRkRpN3I1MFd0K3ZpYlhC?=
 =?utf-8?B?Z3BRbk5mV0dpRHAyNkFDUEVRSyt0dUV6Yno5K1BFR1JCTmE5N1dSQUdCL0Zq?=
 =?utf-8?B?WkhQblNQRDJma0pQNHJmWEpZZnZxVUoxS1k0bFRxOEx5WXo1cURra1ZNQ0x6?=
 =?utf-8?B?aW9rVGFiV0Q4WStaakMzZmkvbHllTVVsK1Jjb3MrbFdNdnVZUjgxRFkrTzE1?=
 =?utf-8?B?bWYydWFyNDh2NHFQeklrUG5EaUxmYnQxekJNQ1FYRGw2YkNKOHZRUlZmRlQz?=
 =?utf-8?B?MExVekdmNi9hR0xtNzJjc2ZEb0xGS1YvNXNYNE1rSUJLd2FGeENhL1RYQXdn?=
 =?utf-8?B?ZCs1MFcrRGN3VnVHOWpPZnZ6WmtVT3pjZkNHTjZQWm9YSVEwSDlYTlVyckhm?=
 =?utf-8?B?YjBIejk5YktFR1U2SE1HY0k0bGhueTJyeU01SHNqR0w0M0ZCWWZYY1NRbDRp?=
 =?utf-8?B?Q0lZWmxrRkZHbWkrQklXbGFaUVM1N1hQdHVFcUpKVXZYRnpzaFFNcnQwYW41?=
 =?utf-8?B?ZDVuRzA3aXQ2TnozNVVXN3pnY28rckV6eUVoWmZnVzFLK0xzeVZlb0FRZ0tD?=
 =?utf-8?B?ZGl3R3RLM3ZRY3NtaEdxbDU1Zm1iN2pIdTdtWTk2Qzd4UmF6Q25FTXlEYWRp?=
 =?utf-8?B?YkIwWkp1L3M5RE8wcmtJOHI0V1c5WURYYm9jZEM0U1RJRGEyS1ZXMzNyTzZY?=
 =?utf-8?B?STVuNWNwU0VoMkZsWUJQZXF5UHV0WmVqNjBDWU9sQWxRR2J6VkJBQ05FQUFs?=
 =?utf-8?B?MEFveWp3VGdiRGlEeWNiT1ROR3VXRmsvN0MybWlueEhvZm5iYW90eTJGaDdK?=
 =?utf-8?B?SWhoL1p4NWh5WHlKTU5rV0tZVEpFcDJzZVFEWk9USmJ5QnJ2WkJMZVN2OEc4?=
 =?utf-8?B?TkxiT0YrdW1OQ3VLZkphKytGN200bHlrNmsxdFhVOGo0ZTVxS0d0OEpBWGk2?=
 =?utf-8?B?U0t5eG1ybUYvTHFLa0ZLbHdwYzF4NnhQSnNKTWFxWnhEZ3AvRkxjeFJ5RlBN?=
 =?utf-8?B?emwzNlFLTVhIS29iUnMzbFA3bVBkN3pCOUZEVXlnZlBBYk4wMmRMb20zSkRF?=
 =?utf-8?B?WFMvNkJjQjRWbWtzeEdhdXRmdTlsWG9WZ2VvZCtNZjB3cmt5Qk1zY1pUYXRn?=
 =?utf-8?B?Rm5vdTBsK1JIREdvNHdkMVJFbzI1a251akEwcFJnRjdUOTRWemswV3U2aDky?=
 =?utf-8?Q?4qriFIjvWyFVSSYtQzx1QknMpsilDxWZGd3Ig=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB18DDC8A8861643B7070A506E59EECD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6396
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df2a0f11-4a8d-4f59-52f0-08dcab64c200
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|35042699022|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXpUTkRhV1BZcUMvS3NIaGZWZVB1SnNmcDJlWnpmTnQxUE5LSEpSajBNVFg1?=
 =?utf-8?B?OU1LaTJON0pQRXJDTjhuQitURlJCN1ZnYllYeFFFN1lPc1hZMlV0a2N1dTc0?=
 =?utf-8?B?ckpHUVNoNVA0d2ovcldoRk04NWdzeEpUTkd6KzhuK3g5RUNSeURsTFUyTXhJ?=
 =?utf-8?B?NFE3RlNVc1JKQzhLR1FuaEpBaWdqWmVFNE5DSHJ2UnRjaW1ybVgwT2drN3VW?=
 =?utf-8?B?cDRKZ0pRb0VTZmVFSGFrWTQ5eTlSWUdZSFhVWGRFeXNOQW9NaGZFYlN2ajJv?=
 =?utf-8?B?OFRPUmFQci9Qa1lPQmxFeWlyeldBSjN2Y1JrTTB1b0dLdjcyT1pBdWdFYm1m?=
 =?utf-8?B?bEZ1M0hTd1VMMmJUSzRscEd0eTJBNFJ0czBSQ3ZoUDhQNC9TZlQwWE5OYURO?=
 =?utf-8?B?dW9FSzlLZFRqOXpHbHMwb3pGOWpkRzdPeUpEbmVlSkhnTURPcUFneCszeExQ?=
 =?utf-8?B?dVBDTWh4ZHk4VUhxVkZ1NlhQZUt5Ui9lOTNsWHg5eW1nU053OUpxWUJkWFd5?=
 =?utf-8?B?ZllrSG5WZ2tLY2gwOWxqSWduOEpndldmM0JFSENFd3pseWpGc1EzTUR5Tkx3?=
 =?utf-8?B?dzVUcmZJSEdhMDJXV0NrYStwTm9QMnNvaUtubUJ0RTUzWHRZOTZybEp0MElK?=
 =?utf-8?B?L1RTUndPTXpZVmx2bnJhL2lWSTEwcHljWWFNZnRyeFkydzh0eHo4STNjeWU1?=
 =?utf-8?B?Y3pOYVR4T1h3cDQ2RXZmbVRIcWxwMXRnQjhYVXNna1RQSlU5SEREUFlDc2JI?=
 =?utf-8?B?YTFuRVF3ZEExMUZnUzdEMnkwMy9nTmVXd1NZYzRXckU1QWhBa1lvcU0wU1N4?=
 =?utf-8?B?eDZuQXpYcCszdHdMQ204dUhqQlRVY3dPeXJ6STdjSUFoVUVzWGYrbUNRcVE4?=
 =?utf-8?B?M0JSd2JpUncrem9hcllQQXA5OWdvLzRwbGpNM255b3Y2ajhvSlNTRjRraG5i?=
 =?utf-8?B?ZjRGejQ4ZlQyTk9lR3IyRFZWeWVMeXliT2VxWUZja3RnOGpzdjg0dEoySm1w?=
 =?utf-8?B?NmxQZTBuRlFSMTVsOFRwN0FGZk1wZHQwUVprZWFDOFJuUmRmTVdXZXdKcDR0?=
 =?utf-8?B?bmNVdndSbkdhcExnbmxnVzZYWVVONnhMR2Rwd09iMVpYNDJ0enJYd1BQLzlv?=
 =?utf-8?B?SXVJcWttYVB2SnM0QjRBWE5tZTFxeGtsN05sdTdUNytaUytxOXBiU2VvVTZF?=
 =?utf-8?B?b1RZMm9uVWp0RmF2TjRqNHBaYW5ya2JyM0xaUk92eHFRMjR2Y0IrOGQxTDJR?=
 =?utf-8?B?T1JDck9temZlZjZOcm54S0JkOVFGYlhNcnFobkVrNDZiQ0I5eUZ3bjhIdVhB?=
 =?utf-8?B?dGhTMVRQRSs5M3IrRVhyRVZRWFpzV1lISG0rNW5sQnZYOElmOWZzUGZ6Z05G?=
 =?utf-8?B?Q1A0N0hNdlIrUHBhWlIzQWVGQWJLT1VaMTJaYlVDMGVxSlNTeW13ZmFEL2Rs?=
 =?utf-8?B?ckZ4Smt6RFBZVU5wb3ZReUducjE0aUYzOW1Ua3pleGFYa3I5S1FLY1JJb1Vr?=
 =?utf-8?B?WCs2QW0rNDlvODZKZlNISFhMMU1zTklWTXkzNlIyQ0FLckdTZ1pFVnRKaGtB?=
 =?utf-8?B?V1VmYkhVM0g5cGdnc0p4K3hFRXJaWE1ZVW8zSkdkV3BNUzBkYlQ1UVBLNWhx?=
 =?utf-8?B?d3A3Ly9VbUZ2WTc1dktsOS9iVytPRDhLaWpMNkFVREVWV1NMV3dmSDNKZGg1?=
 =?utf-8?B?N3lsRTVORWRiS0hlRW52UEJXekVLb0xEV0pIMXllN3RqMWJzeWo2aEtnZUd1?=
 =?utf-8?B?QkVYb2pITEJDSXBDUEJwZDA2WHZJbFlSZC9ocmlXVVdQbjVEaUZLSVVjRGph?=
 =?utf-8?B?S3pjOHFKenA3TTVLazBKbTBYUFlYb1lQVDFXVWVFYzBSZEZuWEtCbFRac0pp?=
 =?utf-8?Q?0yvsdtn+Ss5/A?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(35042699022)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 22:14:10.3874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8022a45c-3ed8-4be5-841a-08dcab64c705
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 22:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202420

T24gMjAgSnVsIDIwMjQsIGF0IDE0OjA2LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNjAvYnVpbGRzLzkyMTAvc3RlcHMvMTMvbG9n
cy9zdGRpbw0KDQpUaGlzIHR1cm5zIG91dCB0byBiZSBhIHJlZ3Jlc3Npb24gaW4gMS41LjAgd2hp
Y2ggaGFzIGJlZW4gZml4ZWQgaW4gbWFzdGVyLiBJ4oCZdmUgdmVyaWZpZWQgdGhlIGZpeGVzIHNv
bHZlIGl0IGFuZCAxLjUuMSBzaG91bGQgYmUgcmVsZWFzZWQgdGhpcyB3ZWVrLg0KDQpSb3Nz

