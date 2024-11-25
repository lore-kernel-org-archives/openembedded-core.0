Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907F8D58D69
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 16:37:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web11.23096.1732552658446642409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 08:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bT/PcqH9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bT/PcqH9;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GmpWKOP+rkqJfRTDWuiELbqiWVU3sGoxwMKtMJoM496WbATq88/W5gzJe4rwc1xv5jL8ERwELmBZnaBt0YPdZfbgcc+Yso494wI2ZLEWqKxh3IWEY/1aqs3cA7xNpT8nhJi7xZxXKNfqz9SrN2sYvRJXd0JUKpc69uj3wpSRi+EDHyTzhlLmaZHyYqHY4hugJnnce3ScM6Z0XgMxM4IsnxKzXEG5bHwsSLjRRKLw03YV0huQHTwkQfxEBfeC13+0JRQx/CevfjFH8Qntpgi8+I6YxH8zxjAy6BY/9EmqMB9lmGlf/64Lu/qAPkts1wEgAcWxmUF7UGCUfVnUNrf38g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPajHxmUvBGr3fSP2lEn5VB5ueu/1bWHAs9qj5J/9O4=;
 b=KX5a+l6PT3e04SA3hJjXRUs892ngBWRMtCo7/hbMebOfut90bvoMdHzMAI87W4qOIZvSXZJBOfuJJucoHcGz8wP63sg/ENoplfE7mNAwHQA6uWX2lTwfiHDElSyMCYWFaB3Ks+0gvOhkkli03VZX8+vGyJ4FMXHC5HgH7j5Kki8mSMfUxgA2/huy5OXf22OsejgC0gBcSvvTdDi5NShjEOs9uHhReo4UJ6HBevFoLHztw98R44acFkcyz4jI+2/MLLwUcnZ1OfNui/JAkEkVCsEXzk8vvzkc2TXlrsUM99c9yhyOi5cJhxUzu+ViJoyvfqW+KWVbERRaLhU3/JLggA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPajHxmUvBGr3fSP2lEn5VB5ueu/1bWHAs9qj5J/9O4=;
 b=bT/PcqH9aB0lXFeRCHULrhRztxGSOoZji4Glu21P81Qo8MfnqI4iyo1ekCifT7iAQD2+F+rhfwaPph8uVUpE8syNtvzkKwMsc9f45qLZ8Eod2IFNmLibg0rq4Yfx9WGQ4skkHw4DOoi1HAkfcb5qKUFMABwcDPF3ghbP6eaDFZU=
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by AS8PR08MB8899.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 16:37:33 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::6b) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 16:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Mon, 25 Nov 2024 16:37:32 +0000
Received: ("Tessian outbound d013e61db77e:v490"); Mon, 25 Nov 2024 16:37:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45599d7c89f5b8c7
X-TessianGatewayMetadata: bYwcJgPCb9BnJhK0jGCnNhrsJ5hpEQ31NBsOoKtFyE5wp89Sy42Pk+8n5/6oybhx1JPl6+wAzqCNlwwrGRMrBLYNQHffkiVugSnGXtuqEOx5W5Xvt8pHWbhax4dzn4fiDW9EzHayaQ0cB4yEgGYymfdoW714Jyfo/a8G6rajigI=
X-CR-MTA-TID: 64aa7808
Received: from L4aa400f7efa1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9EE29731-4C97-4C18-8C0B-EFD7E475E498.1;
	Mon, 25 Nov 2024 16:37:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4aa400f7efa1.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 16:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG9gCGCjsb/Kyak4gW5TEDju+Wd4cAlONrmuxejjbf4CBg5TFugJsCwOj8xZknSUEcIAgsygPD9WjESpCh1xRwq+Ha/u9XcsMmE++AFdiPFS7IznAJViJtgSD2w0ih1rwGA9owUwL2EyxTtDt3hb1DHbJRiuqK+JbgTh54dcSZIYyNurs9UIyTbEvTofirzbX2lKZQsWN3HsJNiipm5sFLWmwxEm4/aKnTCBZpQvsrM1LnNrsksNZIgVwd/yGqZhUoSV20HPCEnvqYVS1zm9ZbN8ZemxjINhEK54ogMtMyqLLI/QNVuGJ3ydkNUvysgBIWvLYzR2lZvKQF4wWn3IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPajHxmUvBGr3fSP2lEn5VB5ueu/1bWHAs9qj5J/9O4=;
 b=OwrdHn++eNfgGsxn5iS1/ihrxXkwVXFQHGG116E+MOtx5x4bhQthNhrnRPPJVbM3dzYWlac7wuXF6mDepJ0tP9K8yGdHrnnPbAueLPTivl9RQ3lUzZ4yeml8BFNv06tl2gXfFKYy7iv1GdIHhYiK/jrtO4mmU+Q5RpaUzVO5ixzSaD2ljt8HGXTilJa4wBZU4orStx9THLq66MGU3JO90gR9VdF4vI1SE8zcC7kVmHL1jK4AxE3Isv2GNH5+9IiKl6DSNkJ+7Ppf9k8bWRxQLwKo0z/I+nhWm8fCliol26Er4M1rMDSj8eldVnnJbgsijgKpzwlwbYdXm8QGE0pnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPajHxmUvBGr3fSP2lEn5VB5ueu/1bWHAs9qj5J/9O4=;
 b=bT/PcqH9aB0lXFeRCHULrhRztxGSOoZji4Glu21P81Qo8MfnqI4iyo1ekCifT7iAQD2+F+rhfwaPph8uVUpE8syNtvzkKwMsc9f45qLZ8Eod2IFNmLibg0rq4Yfx9WGQ4skkHw4DOoi1HAkfcb5qKUFMABwcDPF3ghbP6eaDFZU=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB4PR08MB8054.eurprd08.prod.outlook.com (2603:10a6:10:389::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 16:37:20 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 16:37:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "danismostlikely@gmail.com" <danismostlikely@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Dan McGregor
	<dan.mcgregor@usask.ca>
Subject: Re: [OE-core] [PATCH] systemd: more optimistic dlopen notes
 processing
Thread-Topic: [OE-core] [PATCH] systemd: more optimistic dlopen notes
 processing
Thread-Index: AQHbP1Fl//d6Nxko8Uy7dxwypyjM4bLIMeeA
Date: Mon, 25 Nov 2024 16:37:20 +0000
Message-ID: <77816C76-BCE8-4321-9DE6-DFAC8639F8B9@arm.com>
References: <20241125154739.416548-1-danismostlikely@gmail.com>
In-Reply-To: <20241125154739.416548-1-danismostlikely@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB4PR08MB8054:EE_|DU2PEPF00028D08:EE_|AS8PR08MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 641cfb74-5e07-4a48-fc15-08dd0d6f7595
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WHo3dFhRWitWeFNqUUs1OVVrUERUNzV5TVVTUUZYSFd4bWt2U3lxTHdEMmp0?=
 =?utf-8?B?a1l6OHZOR0ltaUlXcVRrSGxzRVdFUmFwNlNMNjdOOS8vSGQ0YzNRSFJ1a0hP?=
 =?utf-8?B?VVRncW95ay8wUlkwTG5ERTIzRzFDemFncGp0dTN5MkhwcXkrN1c2d2pKQ0ls?=
 =?utf-8?B?bi92QWRUQityc0ZmSzc2ZDRPcmM4YnMvUGNoWm0vSWhxcmE5dTg0TWhPblRC?=
 =?utf-8?B?WWZIbFoxTkdxTnNSbndqdlF1WlBxR2JaRWNsUDJxL2YvVHMwZjZaRGw2SCt5?=
 =?utf-8?B?MCsxNjZWMERGelRmeWNqUXREdWhJQi8zT3RhL0VLVnMzaFJCM2xZdFZpQUcy?=
 =?utf-8?B?czB6d0o1ejk5Nkc1a0Q0cEt2a1JROUVSc2xVWDhpVDAwYy90a0FML3JXOTVC?=
 =?utf-8?B?Z0dwdm9uSVR0VzNjekJYRklKWlNTV3VxOFQwUE9QSSthbFU4OW9uMWxWSWdp?=
 =?utf-8?B?Q2YwSnFrTmlheXRnOVhmY0czUlZYWmFhWDRKQ0pWcGxFT25rZ1ZhQWJ1Rmxw?=
 =?utf-8?B?cG1OZCtncUZJb05vTzVkVjBJR1VZNmQxZHpZTWYvVEN1aURwSXdoQS9vMndT?=
 =?utf-8?B?YVM4dUQ0V2xsUTB3d25raUkzTTVUTTRCMU1UWUJqQWhoU2xONEVkTWJKYkRu?=
 =?utf-8?B?SkdVd0p5UzN2cUxMU2dPUkNFRzVRc3BkaGVtSDhHR2lweGp6L2ZjbDMrTzE0?=
 =?utf-8?B?VzBwTSs4MFl5NzdVTEoxNlZ3ZzFXQkxkaHREbHFBaTM1Q3d0dFFtRHN6RnlD?=
 =?utf-8?B?REZVcTAyai9CYzlIUytVT29WTERFMVpCL2VmQ1hVOWplUEROOWd2a1cvWFAr?=
 =?utf-8?B?d3JEUW1TUGFTOEFBcmRQSkRoajFGVHpGT1lIN1h1SjA1VktOOHlRdXhac1FE?=
 =?utf-8?B?WHRZUG12N3UxcnpsWWQzK25aWXJyV0xuZ25BNnVpSWtQTjdZMGpzUk13V0l0?=
 =?utf-8?B?ZkhwaldaZkk0UHpqVU95VEtoSjJyeXJDby9nMDNIcUlHdHNnU0ROVGxsN01h?=
 =?utf-8?B?dG42VU9wTkJLeW8xZ1djZkw1SmpicS9QdTFyZW5Yd1N6OXdaQUlzYjl0UDd0?=
 =?utf-8?B?R1oyQTY3RnJ5V1N2N05EbVozMUJGWjEwOW1TKzBwRUw4cmpYZXhxRGlha05M?=
 =?utf-8?B?VkhyUEhOcS9NOElSNEUva1YvZmhNNklrRmU1bnFhNnNzSXdaWnoxL0xQaVZK?=
 =?utf-8?B?NVovRi9nKzVxeUtnOEhIVjhFNm1lUWhBM2x3Z0laUzVhU3pYSldsKzJyU042?=
 =?utf-8?B?MmdxTDZsRDF0YUpHL0JYOWJZSm9SLzJiMWZNQzRrTjFHbnNSVWJBZFJGNVQ3?=
 =?utf-8?B?S1VKLzk1UXRiZ2hUNTZseTFDNERzVmVGZmFmZjB3UmxkZzBDb21pMWtPYndZ?=
 =?utf-8?B?RHpNYjJPVEZuNzdHMzczb1lnWTlETjZLY0xEVW5xa2JBYWlHclFLUkM5d29y?=
 =?utf-8?B?NFg2QlJCSDBBR1dXaGdNSGROZWZMeWg4SEJxT2Z4bTdsNUIrd1lkVGFxZkNZ?=
 =?utf-8?B?bnZtcXJINU9YR0hwMEw1QTlzci9XQllLb3dyZUxJbFJqajNrVm1LWllPTE5U?=
 =?utf-8?B?K2IvUkRVWFNZL2hRYWVpSDlLNHFGTUFFWHowbU94NWJHT21Ja3cvRi9DbEpJ?=
 =?utf-8?B?Z2E2c0thZGFTenBUZHBvaXNIYUdZdXRpT2Y5NTZxUzBKMHBpRlVsampjZTk5?=
 =?utf-8?B?YjVLRzZiNnhTckdZSTVqeGlGNjJUVjR4ZjdieHh1WWl5NDFybVlwemtjRFpS?=
 =?utf-8?B?YzFITDJLbWlOblNxMzBzL0pPc3FreGhiWVVtc3c1a3JJYmdDNHdkdFVaVXVq?=
 =?utf-8?B?RW04ZDhSV3pkYk5hemVOQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <372890D61D72B249828A80C9A27EADD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8054
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	67f20695-03cd-4230-067a-08dd0d6f6e66
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3VGMENyNUFvN2pjMUhodERyeXZxaTR5M0g0Mk5PV1NGbVlWUGh1czNTR2da?=
 =?utf-8?B?dm10d3VYSTlFNkpFNGFEdjRRMXpKcU84VFN2UjdiL2ppeDdsaUR5b3JiTDQ3?=
 =?utf-8?B?dkN1N3BmNzBFTjVOSWtISS90MTlBVlp0ZHh2Rm82bHhLWUEzYkhDeXR3SjM3?=
 =?utf-8?B?a3F3RzRnOHBmRW9QU3BDMU40VDFiTjliOHh0Q0F5c3FVNE5keVpZQVBma3Bz?=
 =?utf-8?B?aW1jNjdoVndMV1FhWEVvY2xDMXIzWDdaL09qci85Z2lwNFdQRHAyY3hiOW5N?=
 =?utf-8?B?SHI3TFVZNUxkTWpscnZXN3RTR2NnZ01hZWkzRURyb3l3VDZkVHZLNkp0d0xI?=
 =?utf-8?B?TDR4T2QyaXl2UkU0MzQ4N3g4bzRobk9ac0RaSHFnU29sR1Rta0huaGtDY3M5?=
 =?utf-8?B?Um1tbzVKeWhoM0w5QWFKWjB4VDFuT1Yrc2cyVzN5UlI1cytGNVFaMFZaR3hO?=
 =?utf-8?B?bDBHWDlQbFJ4aGQvK2dsUWZQUUxJUUZKU09KbndEM05yN1l4Z0ZqMnN2a3Z3?=
 =?utf-8?B?Sm5Uc2hXN0d0cUxuZHMza2F2STQrZnVtOW1zWEM0bkU2dGdXQ09XOHIxM0N2?=
 =?utf-8?B?YVdINGNQL09MMVVVUXVYRy9CZG9IRkZuaXpicmNWNGp4SkVZbDBnM3FXZnRs?=
 =?utf-8?B?aG5sNjlJSU5MY2F5USt1a0Q1aXNtU1c2OUpqbVlldjF6UERCL2FRais4eTdC?=
 =?utf-8?B?K1ZCS1VnNDJWYzQzb2w3bExsTk1DSGJsbkl4S1R0azNha1ZaODVEQ0NhK1pJ?=
 =?utf-8?B?MUNmUXQzdWRYWldPR0M3eTQ3YnZUZUZidFBGVjJvU2hDUHFYdXlCclUrRktF?=
 =?utf-8?B?R2trSlgxcGdkc0EzOUZYdGxRZ3RZUFYzcGxkcElZZW5NSWRWUVF4OFhlcU5n?=
 =?utf-8?B?c3poblo3WllEcy9uZDl4UzloUW9HT3F5R3RMa0pCVnRUZGRVZ1ZjaGlweXB1?=
 =?utf-8?B?SmdjNXVoUWt0dTBRK1JXSGdVc2h6SXJhY1grZXRlQmJBUmdKN3NZczJJMm9k?=
 =?utf-8?B?cVNGaCtUVGt0dU1HZVc5Z0VJWDQrR05ma3ZZUXhWOUtZT08vZHl1ajQzcUxG?=
 =?utf-8?B?TnZrS2FVRHViSVdQSnByUDUwVG5QdFVKTTJnNFhqVCtpeUFZckdWT0dWaENo?=
 =?utf-8?B?ZFlmaXMxL0hkc0ZFampWWFUwZlMwcGZPcStmQ3BVOURoVURXcWZralpkTi9a?=
 =?utf-8?B?TjlkeWRyL3oydWlKNnFvc1NCU3Z3VHo0TWJhUSs3bnpPZjB5aWlaK3dZcWF3?=
 =?utf-8?B?Q1I4U1RrRC9DOGFnWExWUTNCU3ppYSt6UGQwa3p3V0poUk8xcFF1SXV1a1hz?=
 =?utf-8?B?QzFGNXdjVDIzcnM2VjFUUzcwQkhpTzVkR2dWY1c1VG5iTi92UG9LZldXbXcz?=
 =?utf-8?B?YWpBM21GMHRLZU4vYmJZVWhjQzJxTjVpZzZqNDNoRlVLR3pUM3ZkM2ljWGFW?=
 =?utf-8?B?Zko5NHZQMHg3TjE1VmxCaUgvQVJ2Z29pV0VKZElwOXFiSXZtZU1xMzE5VU1w?=
 =?utf-8?B?NnhZZTBERGp4cnkwY3p5dUFHU0d2dkxNMVdxRG1LQ1EvRndEd3pUNVBoRStm?=
 =?utf-8?B?WE5lNVY3QmN0TzR2MlRGQ0JjQ0xiSHd2SnhoOXlqRmdyVHh5ZWU2cWZabmZq?=
 =?utf-8?B?SzFhZ0pvWi9ESFpnek02N3cyU2dDNk5Ja1NwZWc0YzYwclZoSmVHVVVBOUFa?=
 =?utf-8?B?SEJzNTQ4QjdSQ1Avamp5c2I2MWhQSGpHcWROMHp6ZjhlbW1nOTIzdHhqb0tE?=
 =?utf-8?B?c1lUR3JtWkxySlI4ZWJIZXBzS01KbHFGZlA5NVVnVitNTW1Ic1dWYVFuek8z?=
 =?utf-8?B?YlU0ZVo4MCswS0lMMHhYeUtRdzlFME1FV3hFNnF1am1HcHdwQlJxRllXWkEy?=
 =?utf-8?Q?hrZgNBa6IPMav?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:37:32.1304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641cfb74-5e07-4a48-fc15-08dd0d6f7595
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207792

T24gMjUgTm92IDIwMjQsIGF0IDE1OjQ3LCBEYW4gTWNHcmVnb3IgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRhbmlzbW9zdGxpa2VseT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBEYW4gTWNHcmVnb3IgPGRhbi5tY2dyZWdvckB1c2Fzay5j
YT4NCj4gDQo+IElnbm9yZSBzaGFyZWQgb2JqZWN0IG5hbWVzIHRoYXQgZGlmZmVyIGZyb20gbmFt
ZXMgd2UndmUgYWxyZWFkeQ0KPiBwcm9jZXNzZWQgb25seSBieSB0aGVpciB2ZXJzaW9uIG51bWJl
ci4gVGhpcyBhc3N1bWVzIHRoYXQgdGhlDQo+IGhpZ2hlc3QgcHJpb3JpdHkgaXMgZmlyc3QgaW4g
dGhlIGxpc3QsIGFuZCBpZ25vcmVzIHRob3NlIGxhdGVyDQo+IGluIHRoZSBsaXN0IGlmIHdlJ3Zl
IGFscmVkeSBmb3VuZCBvbmUuDQo+IA0KPiBJIHNhdyB0aGlzIHdpdGggdGhlIHFyZW5jb2RlIFBB
Q0tBR0VDT05GSUcgZW5hYmxlZC4gSXRzIG5vdGUgbGlzdHMNCj4gYm90aCBsaWJxcmVuY29kZS5z
by40IGFuZCBsaWJxcmVuY29kZS5zby4zLCB3aGljaCBsZWQgdG8gYSBwYWNrYWdpbmcNCj4gd2Fy
bmluZy4NCg0KSeKAmW0gdW5jb252aW5jZWQgdGhhdCDigJxqdXN0IHRha2UgdGhlIGZpcnN0IG9u
ZeKAnSBpcyB0aGUgcmlnaHQgc29sdXRpb24gaGVyZS4gV2hhdCB3YXMgdGhlIHJlc3VsdGluZyBk
ZXBlbmRlbmN5IHdpdGhvdXQgdGhpcyBwYXRjaD8gIE91ciBxcmVuY29kZSByZWNpcGUgaXMgdmVy
c2lvbiA0LjEuMSBzbyBsaWJxcmVuY29kZS5zbyA8aHR0cDovL2xpYnFyZW5jb2RlLnNvLz4uNCBz
aG91bGQgaGF2ZSBmb3VuZCB0aGUgcXJlbmNvZGUgcGFja2FnZSwgYnV0IGxpYnFyZW5jb2RlLnNv
IDxodHRwOi8vbGlicXJlbmNvZGUuc28vPi4zIHNob3VsZG7igJl0IGhhdmUgZm91bmQgYW55dGhp
bmcgYW5kIHNvIGEgZGVwZW5kZW5jeSBzaG91bGRu4oCZdCBoYXZlIGJlZW4gY3JlYXRlZC4NCg0K
VW5sZXNzIG15IGNvZGUgaXMgYnVnZ3kgaW4gYSBkaWZmZXJlbnQgd2F5LCBvZiBjb3Vyc2XigKYN
Cg0KUm9zcw==

