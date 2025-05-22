Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A6CC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:43:18 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.69])
 by mx.groups.io with SMTP id smtpd.web11.20296.1747906996164829691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 02:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bZApOlu8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bZApOlu8;
 spf=pass (domain: arm.com, ip: 40.107.104.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qy7U4myJvYdHvf1jhXTmtgLxGObgTQwa+Ki968BKMIPnZBBWPRPGaMt9x8AKsA+ovvdxqODfH0X/j7TUQUr0BvRZK+Gj/UntmrutuYjGbmFJ2sr9kRtn2zrKKwooUJNBWQBWbr3xAsOctdlEPf0zrskFXFYCYGZ9tHJTWfZd4aJIfzZTspz+mbzQLjoVt4gOHP5w70nuC6tFLP6q1D4bmJN+uzgxBDnDdo2AvLx8YBsvDkYq37MgSbE+ymyHCgmk6fEnwpxqA0NrZvvU28TwHGoXY0JgtaUtN3ixqUGLa3PwhG9a+a993hESw9X3812YI3eDBkiHpmmFSRyZQugpRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wFbVpCX/WaVSX63pAqQCz6T/HParOQq9yfwoi/Fq8E=;
 b=LmvkyOlxzuDWRgjXk+wXTn0/pBx+5/rAnBftQrCOupoVUKkN8BHETmIXx+syL90ILRV4XDMXPDcxjmk1k17Qk2vOyrzuVvLKSED+reY82JePUKUbc8VTHC0ZKxI3NX+pbDnenQ/ZmTYFNw9gNrrmWK6vex6uqJG+Dd932nD+4nPNHKITh+db/Lm1LNldozhNpMyv5aXp6QYCTCzIb8DP/8miRcAeUTyMqiQ69gtLXvt/bRxHOtfNVJeJKFXn/0Hx3wTt7SR/J+uM+XKD/sU84QQUzHPeXjqEBLjbMRCCfNMg0g38b4Jl4I6wCaEerMAZRyzn3z+0jHNakjdrlNm4lQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wFbVpCX/WaVSX63pAqQCz6T/HParOQq9yfwoi/Fq8E=;
 b=bZApOlu82Sso3jyc7QbGCzv5Hv5PcZspwgcX8a0m+1VzODgyvwsDRPxUM1f6mOdUSpZD3bdIS/iz9MejsrQ8XgEodBGVMUOZzoj4W/1xwPicUOeDk63BIjhj+fsdkk7z6W5hFgYLcd3fYgH3wRAFGwRnW14vk3K4DHu6wuyUOj0=
Received: from DUZP191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::12)
 by AS1PR08MB7585.eurprd08.prod.outlook.com (2603:10a6:20b:471::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:43:09 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ed) by DUZP191CA0045.outlook.office365.com
 (2603:10a6:10:4f8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 09:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 09:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5Gsc8zaGg5jBDU9fkCLbTJQiuLGfaO76hEecgA48zCnTcTBgaWmDzeF8VjIsgYgRffmxU9MzhpaXAgEsgqwyCnmUNikUf4xtlPvEQgpMqH3llOmCRc81qv7uM4RESnkfrjy8bY3/mjMjxl3UA9ED/lZgUcAXxCw1U549dt9QgJN7pOAMhbOxM1Hc3HF3+NXLR5OeOkpKXBedJ6TJFSqI3g4eHyJpaO0d3A3y1Sn4SsBPn1oJNWravlsAnElgvgVaAiHlqsSWvvwIXnHSKpLPckQ0BJ5oFMHagr5/WImfsPNnkY0UhzePWfe1/ZRopXxMOEpAa2C5uiPS20kJYLWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wFbVpCX/WaVSX63pAqQCz6T/HParOQq9yfwoi/Fq8E=;
 b=IjWTPlLynga/Xh0jc6UlfaU6mxDrQJHzEX1IK5QS6dj0U2BgQaBg+cCC3/hyrtt6j4WCyraE6SD2malFoFLNYjoT/aPXPYm7KcH8dJiM+Lf7iKmCSOoP5VqtslVBMmga63eTkaiYCEgAxHHGNwqzSJ10IBMRga1jF8sRkWvWgWt0LPQ9Ktvj3db5CwJgoPSzEH2e0WHrJX3cA5or954yH5Jbau4xHvjBMv0uyyERLG1RYbCrKzqBzsJIlq233Oio0gY5N6RXq4cYcPda+vwFFuQcZADLSrGd8mH+C9mbZ/dDIypRoM5zrzhtv7X7VUzgt2sq6BE8aU36Y4H7lb5Fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wFbVpCX/WaVSX63pAqQCz6T/HParOQq9yfwoi/Fq8E=;
 b=bZApOlu82Sso3jyc7QbGCzv5Hv5PcZspwgcX8a0m+1VzODgyvwsDRPxUM1f6mOdUSpZD3bdIS/iz9MejsrQ8XgEodBGVMUOZzoj4W/1xwPicUOeDk63BIjhj+fsdkk7z6W5hFgYLcd3fYgH3wRAFGwRnW14vk3K4DHu6wuyUOj0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10996.eurprd08.prod.outlook.com (2603:10a6:102:471::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 09:42:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:42:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
Thread-Topic: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
Thread-Index: AQHbyhh6VVQ0Q8yRBEKXBEHhWYJ4krPeZ3eA
Date: Thu, 22 May 2025 09:42:37 +0000
Message-ID: <100945AE-DECD-425A-9594-EBEF50D9053A@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10996:EE_|DU2PEPF00028D13:EE_|AS1PR08MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 4881c010-6833-4e6e-2b71-08dd99150fda
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0dDaS9SbUxWemNLMkZGaEhSNlNrNHNwTFdOTXdkWlprb3F4ZDZoa1JKUWl2?=
 =?utf-8?B?MkxLK3JhUFNGUTVjZWtZRkpOVVZkbnhybDBJbmJKRmh3dnlzRHRZdWF4Vmo1?=
 =?utf-8?B?OXJRTUl0ZkR2aUtuQ2FaTE5nYTZIN3RTTVliQ2dnR200OEpYbFBNSlg5R2s4?=
 =?utf-8?B?WmVNZ2ViQTdxQ1dUNDc4K3Z6Uk5WUFcyNWpxWlA0Z29VTHFUVnVEUzc3NVg4?=
 =?utf-8?B?aEx6VnFSZDV0WmJrbXRxSCtNZWl6a21hUmIwMmF2cnFYSWxDK05NY3FORWpL?=
 =?utf-8?B?QnVNNnBvNzl3S25WaVRrWkdwTzZmdWVCYkU0WFVQVVNGWHdOYUhoZ21uYmxM?=
 =?utf-8?B?dlQ0aDA1ckxjNExuZ1lDdzJrU1BCYjYweGVoN2VDUHZDT3puK1hNOXFCKyti?=
 =?utf-8?B?VVNMMHM1U0xEakx6VFFGcjlDL1QvdUxFcG02RXcyTUJNQVpZa2t1WEE4eHdK?=
 =?utf-8?B?bGc0N0dMM3pFWkdXOC9WVEZmUVFPUXdDRGJ0N3RjMkNCckpVRGFFUGhYYitu?=
 =?utf-8?B?Z3lCcVV4N3ErVkkyNnQybzZBMittOVZCb3g0YlJRVFZscWVlOVFjNVdlY01Z?=
 =?utf-8?B?ck03Z0ZHOWloM0RudDZIQ3RRdGtqSHZ2NkFHLzc1NDUvOWNpWEtlT2FRb21C?=
 =?utf-8?B?L0M3QWI3czV2bldsWWZtL204OXpnK1RXOWQ4RnhNSlFvT1l1dGtqMWFBYzB6?=
 =?utf-8?B?Y0hvMFhmTHJRSjhYcUpwaUV6ZjJ4M3V4SHdGNEZlV2tVZXUrcmZUVWJURjFy?=
 =?utf-8?B?THJvR1NZOGMwRjlmekIvWmlWOGQwbU12OEdaK1psMjhLOVNVNWdjbnIxUHFY?=
 =?utf-8?B?NmExanUrd0k1NWFibnVJdnRoVmVIbFNUb21nd2lnempBWmt6RWJTNEd5YzBQ?=
 =?utf-8?B?eFhDNStKVDJJL1FFcVJLVE1MamViSVYrdElNUWVYQVQrdHlEMUU2M1Flcm9y?=
 =?utf-8?B?SEJBT3p0aFRCWjFRN2FRaUZwempISEd5RkIvcTZDYTNIMWFhTVlrK3Jydk1v?=
 =?utf-8?B?QzVFMUd6S1QwbEVEYllPQ0dKd2xzZVVMUTdNWnBpSTNzRnptaTltTk0zV3JY?=
 =?utf-8?B?cUpPNWF0bitkNThWY1JnenFrbVJJajhWRm1hR1dDeEUrd3dSbm40OHlZTnVB?=
 =?utf-8?B?ZmVaLytLU0RUZlV0R0F3c1RRb2lYU0JnaUFkTlV3WU9sanE4STVRdEw3ZjFh?=
 =?utf-8?B?aHFveGJFcmg1RUNmUFYzR0NtUHRmeDV6Qzg0UzVuMkZXOW9BQmVmeGlJMTZ6?=
 =?utf-8?B?VWkxTEZtQTJwVjhXbWkzbFo4R2hJWnpWWmkvYm85TnZ6VnRQc0JZL293dEFi?=
 =?utf-8?B?UUl4Ni9aVzZ4VTg5bmhlZzNaRCtWbHlsdERxb0xjQ29mWWRjMitKQTd4SU92?=
 =?utf-8?B?TVROQ21vWXV2WEo4Qm1kVGYyUmRaQTc4ZjNGN1B3SnZzcFVUZnkxWU9PSVh2?=
 =?utf-8?B?RFNLeW9kNy9FZVY3cXdUbUZOREpsMldOQmR0NnVFMkxpZTJEU1p6SVU0NFVY?=
 =?utf-8?B?TkJvSWpFbTlJYTRyZjNwU1dxQ1NCdlVwUkpKbVpPdVlWbDU0UnVCOU55RHdj?=
 =?utf-8?B?WWhCSUtKQ0tOcitKd3VTZFNYZU9KZERJNVNZaHRoRVlPeTU3bkdjdzJyTTRH?=
 =?utf-8?B?d0hub01IQ2d4RGt3N0xtSU5ocDI2RnBSb1JESlVCWlpXdGY0Q1RBQTZJRUhr?=
 =?utf-8?B?T2hlZDV6dlAyN2oyMkkvZlFHZVVyajVkZnRKeng2R0l0VmlSQnl1VWdIcXBW?=
 =?utf-8?B?UTcyQzIwMG14eGZvdUY5UE5RbDdRUzFTZFpocVhMU3lZQm5KSm9JM0ZtRGhr?=
 =?utf-8?B?MGtSR1hIeFJlajlLYmZOYnpJN0pRRDlWckwzekYyUC9EUEViNStWVUllVU9n?=
 =?utf-8?B?NGlhTHc0VGk3K0RqN2NCVTZscDlCY29uSlEwVHZYREU4WnRCYnRhS2tkNnJy?=
 =?utf-8?Q?VyNtyE8TtIs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB7D74CD76071F468367F372DAF8F4B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10996
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d5e82e1-266c-4de3-8571-08dd9914fced
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|82310400026|35042699022|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkM4bzAwZVZveExQRFJsNHVlSlc4eUg0THI5d1ltMkNjY1JpUnIzZnBuWmJX?=
 =?utf-8?B?dktrTEFrVmliUC9IOFI1RlhrVzJadTlUTmpYQTdwSTZZb21hU2szSXJHK3Fo?=
 =?utf-8?B?QTZDVHMrdEdzeEpSOWlwZlNaZk1qUlZIekd4RGY3QzlBdDFTQlBiRlZ5OE1q?=
 =?utf-8?B?YVJ6WEMyQWRkeEJXeElOTStDV21IUUs4T3lwOGJBMFRMY3N1TzYxMGdGT2Jj?=
 =?utf-8?B?Rkp4YmFpVzdjdnFCQnBYbW9HY0tSOG9TZkd1NXRQWWMyRllva0pvbGNVZ242?=
 =?utf-8?B?dzRjdEwrVzI0UERMclJZNXNOdDAxNFVPUEpTSStCcEdSK0pIWFlWNzAxWGhG?=
 =?utf-8?B?ckJNK1VYc0diRnZWN2FBd2ZnMW1IcExGYkpxZXNxaGhjaDNMSklhZXNsQ0JT?=
 =?utf-8?B?TGpFcnhvQ2V6enpDTXg2L3ljZ0pzRXlSSUljNkJnNjloRmdta3Radk5sN2Y4?=
 =?utf-8?B?S1RZNmQwV3lvUGI0R3YvVm1pL0RuTi82QlJRbU9vWVU5ZXBpZVpGTUthV1Fw?=
 =?utf-8?B?RWsxRUFvMk9Oamp3VXkybk16MDdXdDMwcEVPdVNlRG5mRnU0RE5DWW5sMmgx?=
 =?utf-8?B?a1lLTGc3aG1iSWwxM3NuaGpsRXlRNlVVV2k0cXV1cGJ2ekJFSWlBTEM4TTNp?=
 =?utf-8?B?NURvN0VNYUVFQktjSTdpd2VkYVltVE10bkJGZ3U2T1Q5RGpDYlEycmpLTnBv?=
 =?utf-8?B?eS9LQ3NSaTJTYWpOMGdVMUtIZklpR0cyTGpQNmkrTHlLNzMvdm5NRDhQa3ow?=
 =?utf-8?B?ZDNPei9OTTZrRHFUODBqNk1NOEJGNWI5SFE1aWFlWkJ2MXpzR0lVbjlyTVdG?=
 =?utf-8?B?Vk9QVTZMQ1lRSzVKcHBqbUVjcnBUaGg0L1BSazhpb0N2L3F5Zjdhc0tFbm9W?=
 =?utf-8?B?SlRCWFZYQ00zWGdSM2FHeEdWWmdwbExFS2hIUWo1REpEaGk4OXkxaGl0N3p6?=
 =?utf-8?B?R05yZ2VtaFFrazNJb1dhMnlDRGloOHVFbnFJVXpjdU1HMUhEalJqemVLbXdR?=
 =?utf-8?B?aFkvRW5zZlNraVc0RXhUdWI3K1gyalBEOWlVdlp5M0hCQWZrZmEzU2wwOHlZ?=
 =?utf-8?B?RDV2MXFWSkdUL3pBUTRMcW4rRkt2QUxaUTZPYkRtVHBGWndlek1VSkFncVVi?=
 =?utf-8?B?Wmx1WUg1OXo0T0xXb2E3YXlzaXBneEJ1eVN0RVRZUVczRFpES2FkL1kweDZn?=
 =?utf-8?B?cnVMZSt2ZDRwZXd0Wk5WZzRITzl2azBqeUthRWJTa3FUeEVGV1E1U0Y0My9I?=
 =?utf-8?B?ZGJVRk5PYTVDT2I4ZWxRaGJuRWEwR1VhbkNQem5LYUtVWW9YdGJWVzNGN3Zs?=
 =?utf-8?B?MlYyeVcvZ0cya1hEVitrS1hmT01NRmI0YUxmVElLdEl5cjh1RmdTK01WSTV2?=
 =?utf-8?B?dnNGZmVMcVFYb2k0MnZsdUs5d01EK29XTm0vVldJZk1qS29kMzdUYTM5bUx2?=
 =?utf-8?B?ZTRFZzdWVi80eGNrUExWN1NDRTI4bEFoWUtraUwxMTVhaE42L3BzaFJZT3pm?=
 =?utf-8?B?eTBjYlN4YUxSUURiYllPNzRiS0xpOEpvMzlXR3F3Q1lGMTN1U2NSbWZWdzVY?=
 =?utf-8?B?NC9YZHFNQWVMOHgrUFFLR2VocGFSMnNQN1JyM3ZISDRSZS9WMGlWVStNM29C?=
 =?utf-8?B?Y3FINytEd205cGZBWTl1U0NBTEc5dUVFeGdNSnZZZldpZWNhVld3WVZBVm1F?=
 =?utf-8?B?RkZWYWx1N3Q2MFRvVi9ZMlRZZmdNeksxUUNBOVhUUkFIeVo2QkhQaWZyNmly?=
 =?utf-8?B?SU9yWStZYjVJWU9qRHRzNlZGREdhMU54VFZoSStYNWVqOTNBMkdPNktTVmVN?=
 =?utf-8?B?OVdBRitPRERQWUs3bThxYmtMQWV5RlhqdWRDN2d0MHBuU2Y5M09JbC81bTcv?=
 =?utf-8?B?aU8rcWFiRit3ZkNzZXljd0RrTFY0SGtKemRJL25ITGdSNjBSUi9LbHF5bFoy?=
 =?utf-8?B?c3F0UlNZLy95RlNhSkdKdXkveld1MGp6dlNYRGdzbDBkRUkzYzhRWVVPWXB4?=
 =?utf-8?B?L1k4RExHaitnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:43:09.5249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4881c010-6833-4e6e-2b71-08dd99150fda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217072

T24gMjEgTWF5IDIwMjUsIGF0IDA3OjE5LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArIyBxZW11IHVzZXJtb2RlIGNyYXNoZXMgd2hlbiB1c2luZyBjbGFuZyBhcyBzeXN0ZW0gY29t
cGlsZXIgYnV0IHdvcmtzIHdpdGggZ2NjDQo+ICsjIHNlZSBodHRwczovL3BhdGNod29yay55b2N0
b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UtY29yZS9wYXRjaC8yMDI0MDkyMzIzNDMzNi4zOTc4MTg4
LTEtcmFqLmtoZW1AZ21haWwuY29tLw0KPiArR0lfREFUQV9FTkFCTEVEOnBuLXZ0ZTp0b29sY2hh
aW4tY2xhbmc6YXJtdjd2ZSA9ICJGYWxzZSINCg0KV2FzIHRoaXMgZmFpbHVyZSByZXBsaWNhdGVk
IHdpdGggY3VycmVudCBtYXN0ZXI/ICBJ4oCZbSBjb25jZXJuZWQgYXMgdG8gd2h5IHZ0ZSBmYWls
cyBidXQgbm90aGluZyBlbHNlIHVzaW5nIEctSS4NCg0KUm9zcw==

