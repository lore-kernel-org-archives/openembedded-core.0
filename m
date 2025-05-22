Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C818C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:02:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.20359.1747908154612487631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HUtH62AD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HUtH62AD;
 spf=pass (domain: arm.com, ip: 40.107.21.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dDpL8OV3W1/4Fn6v6YkxpTyu8j8VJiCoaB2OYaVUnMIuPuqkH9RFfMiJD0X7tNTT/pZ9aPO60564zCizFhPH/nnf32R1Km262McmYlP+fr+M4oTh8FFzNcBGK3M1rOxWQvtN+MxRtL0TduaveQ454QywPApvytzYjGcIMrwyZBFOnxZA5Bh5lHYvn+Sxd4Tvy8+/K5vwRLnv0IxNZuMenpE4IAVeDIFEcLzC9hAcLDlQYhxuYeZDaUXex8a/6dUoNBjZxa0nQM4/wrDH9th/T/INj7OXSI59YRf4Uu6+AoQACBatIcssNNXypPgTALDzhWIqFm24SBmzqOLvc8PxHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj4Na3QHgGyIWa5j5FC3HoTFNtwCDgVNvp94v/EHJBs=;
 b=ckAu244NZgdyZRyc616AnI1atyigE0IJCZBfHKQ3hvM45+vXYFjtcLegpZfNixyhPJo9dqF0ewXJHAghJAhf+JBaz9n8XkTx/1xVaDRzUaK1Mg7dHC4rbHxm1KXOwhaRHteYIbgmy0i0vBfkiWakTi49TARPxdEkSqq3MYtiIABGy/923puxq5+fi4/AvfQ3yCfxYARuv4PgBegwNAdVxU8aWd1guECkPKEkWxz2CCAL+m8FMX18JRjH16+rCJpG+/FCgzDE7FxjU9PrAAWpbmJppw70V5GfMIjqg/D6T9GSyVWzUy9N74hSgh0ydjCBHjMf+4PBvUWV19NmFbq7Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj4Na3QHgGyIWa5j5FC3HoTFNtwCDgVNvp94v/EHJBs=;
 b=HUtH62ADAEj1Mjj/CYpti4YI8el/a6QCMJZkGW8bbbNB06eLMXXqPcIQPrFKILPGxOYDkXeSdExkuyvTVMGO2ZlzjUHRc4OMhKYEyix1GsFpg/mgsCWFmN+z+LLHZQsAZsw0owGFUjEdNldOX/4QivZ+2T3kTpWxAUKY7oFnZ20=
Received: from DU2PR04CA0168.eurprd04.prod.outlook.com (2603:10a6:10:2b0::23)
 by VI0PR08MB10845.eurprd08.prod.outlook.com (2603:10a6:800:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:02:30 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::6) by DU2PR04CA0168.outlook.office365.com
 (2603:10a6:10:2b0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.28 via Frontend Transport; Thu,
 22 May 2025 10:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 10:02:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhRkbVPyUGalhlStJFqej0vz2OnqgaLSiixiCaYODZq2uyj7uCclLMnHGnml+9TYKfxTbIu19gfn6UYN2Ezf16G/XQ/cn5mxz9iKT0rGV5yS1MM3/St2QJ74ya+DFxjv8iBrFMu1Ct5Eml6Fyo27850wlIljQsKlV/X5SU5l3Pk+fM3nQ9a8QSWmC/nSjbUDl0vZXXCP2UeYDkQb4npKJc3uF3R383HCxR+l/BkX8SO51A4EWVrzodOproaozORtyUGpzlSw+szeY8RTGipF5eCm6yDbeF0DG6nnFuBzYNq5JY9YM/R8z+FiK9DzbZMUnadIMPARD43hyfaP61+sEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj4Na3QHgGyIWa5j5FC3HoTFNtwCDgVNvp94v/EHJBs=;
 b=fgdcA3nDPNtN33/5oSVIhNFYXcniei16EKIg4XvmnBNj/dm/mlC5JNy89eUBiWZ4ZFqYmXhHzvNqSn4Tk92ujryIKvw8KXI7Qr7im4hKKKAIzghkEuACnJpvjrVVA+gKLV+t6Bpx1wvqMC6y+3I9p9a+hqbk01CfheVGpj5MkH2WiZS59ACZQMVkK1J0Dl6n181T0L8V4PdgJVbH5zgVT0V1vBpqcm6RRw8n32iJ2O3fsw9dHU8EqmE4rKaCGZOvy84cBJLhyvj1ANNs/zACBAI3y5ew/nxx5BiGU8qL3qjTv6amuW+g36AmFHgV9fi9mDsSOyNLyPCWnl2hMLNsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj4Na3QHgGyIWa5j5FC3HoTFNtwCDgVNvp94v/EHJBs=;
 b=HUtH62ADAEj1Mjj/CYpti4YI8el/a6QCMJZkGW8bbbNB06eLMXXqPcIQPrFKILPGxOYDkXeSdExkuyvTVMGO2ZlzjUHRc4OMhKYEyix1GsFpg/mgsCWFmN+z+LLHZQsAZsw0owGFUjEdNldOX/4QivZ+2T3kTpWxAUKY7oFnZ20=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB9424.eurprd08.prod.outlook.com (2603:10a6:150:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 10:01:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:01:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 20/28] systemtap: Pin to build with GCC
Thread-Topic: [OE-core] [PATCH v2 20/28] systemtap: Pin to build with GCC
Thread-Index: AQHbyhjtZ3sII8AAAECCKAK7x8Bb/rPebNiA
Date: Thu, 22 May 2025 10:01:53 +0000
Message-ID: <6DBF807F-B9A8-48EA-8FB5-4D4964611CC6@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-20-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-20-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB9424:EE_|DU6PEPF0000B61B:EE_|VI0PR08MB10845:EE_
X-MS-Office365-Filtering-Correlation-Id: 329d7f65-8b4e-4c3d-94fe-08dd9917c2f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZS9lOXpHdWp6bzBpK0QrWTNOQUswSjI4RE96WHZzSFpJMU5IWFRRVitjMHox?=
 =?utf-8?B?Q1NvbVZPTWZwUkYyM0liQnQxVlhnaWZBT1g2QWIweXVvL2lIWk9xQVVBV0ZS?=
 =?utf-8?B?bC9UM2hKTjV3WVh2dFgwVXpnQWFneVVlREVqMWd0S05FWnp1T0JJVjgzeFZ2?=
 =?utf-8?B?aWdQOWt5RXdjVTFIbW1XcGRMMkdCc3ZqK0NadXJVQUxJNXN4ZHZKQ24ydHJm?=
 =?utf-8?B?QnNiamU1RTFYOUl5OWRyWWdvQ1RiUFJUSnNkK3RWSzRieUorcUlCYjhVV2Ja?=
 =?utf-8?B?dFEwa3NvTmo5STAvUXRWZ2Nla0Y1Ums1dGVJeUFEMFpoYmRubk9GZS9kSUxn?=
 =?utf-8?B?YVJpZGd6T2NJLyt0RmF5cUlPdTBQSlNOUmFaaSs4SE9ZV2tlZnVqbm1tRG5Q?=
 =?utf-8?B?Ui9UamNmcThBemRwcUJaZyt4Z1p1U0ZPbVZDeUxxQmZ4eWZJSVF0TTlqU3pL?=
 =?utf-8?B?V1JheEFQSzZsRVZ2N0Fzb0hlWDFnRDZjdCt2MkRPVThtNmErQ2ttMDBycDhP?=
 =?utf-8?B?TEVhQlhDRzA1VDRvakJ4Qlc4R0paQUFCYjk5blVYSXVLeTlpWXkxRzhhZFpR?=
 =?utf-8?B?VzhDNWVZTEt2Rm8xTXdSWmk0WFE1OWVxYUZOY3h2dTNtOCtXV1dJNHNMS3BZ?=
 =?utf-8?B?bjVyUk5lOXdOREgyN0JwdXdyZWZRVVpUY2xzUytGcXpMNG9XM1N3bEh6R3dj?=
 =?utf-8?B?REprWHdVVDduK083ckhnL283TWlTRi9qTVlzRnR2S2tydjBiOUg1cDhQSFZH?=
 =?utf-8?B?R3htTGR6TXE5UFlYNHR2NHJhYkt6RHVOYlJvMnJTa0hSdWF6cEpGVlR3SEFO?=
 =?utf-8?B?RFZVU1JacGY4cm8vOWtvSURiQ3lYa1VIbFhWZE9TR0xJMUljaGVVWWgvTHpN?=
 =?utf-8?B?dlF4ZWdsbTBMcmdMOGhYdGZSV1E4cjNOY01ZK3VIajN5VnBjUzJySGZiOUF6?=
 =?utf-8?B?OVhGTVpmT1hZN3h5SmtITkJhN2x5czFFTW1PQ3JZcnNKc2ExdWZzL3FZUjhG?=
 =?utf-8?B?a0Y3empPK201VFptSUhMK1plMXVoRjllNk5vYzl2TFlYSkhZdXJQdWtmbUxy?=
 =?utf-8?B?WXZvNUkyeXlwOHlHTTN0TS9DVk91cW9mSFN3ZWJSL2M2MTM5RXVyQWZQTWZk?=
 =?utf-8?B?bVNFczN3ZWFKZVFpdkhGcVIzRktmTFVrbzUxdXUvb2p1ZlBPVkREbFRsL0dj?=
 =?utf-8?B?K1Jqc3Y2cG9saWVzZXhSZkRJRmVVTkZyYnB3TG5pMFQ5QXdvMWdWY2tKSThO?=
 =?utf-8?B?eWk3OUxsMHBZTWFoWCtEMjRaenhpTjNsZURFVDQzeThEK2tmUnF3bTI1c25D?=
 =?utf-8?B?c0gwQ2pEWGZDblBHSmZadEEvL1dRL0lrODE4N3MvY1NodzdIYjJEWE91OFZW?=
 =?utf-8?B?dWFVMFZyQklkRG5tQWNXdDdnQlpsYkQvUXdGSHB4LysyUk03djdVWHpCaGd6?=
 =?utf-8?B?aHhQZ2JZMTd5Y3NrRTVnOHlhUWVCZU9xUlFkUis1bzlNMDNiY1lKZzgzcXRo?=
 =?utf-8?B?aFlnV1NUSXJTeXVGMWpXazVIWG92eTBiNFl0VkVUbW1uM3BvRUNnS3ZCN1ND?=
 =?utf-8?B?a00yUlI3Q2VNeWRHVjJpMWVsQ3hIWUlSRzFVSFloK3QzaERIKy8veTRxQjVj?=
 =?utf-8?B?ZzQ0eXA4c2hnRjcwSVFoajFuRmFUWmJMOS9jakJndHF3NU1vMmNZYVQ5TkhP?=
 =?utf-8?B?TXZ6VDZURk1tcHN0cWx1aVJVWitYNVRFSXNPVEZML1RMK0xsbFVlZTZPcXlp?=
 =?utf-8?B?K2d4V0djK3AySHRsa25WZjhtaWx0dDl2WjhuUk5oTnpqNTFyRlp2djBqVEt0?=
 =?utf-8?B?cElvdWVEZElEbmlyMTRNUnlEZno3WnJlNTNLU1A4QStGRGQrYjByRDVVZWJW?=
 =?utf-8?B?TlYwbUtoUnBlM0kzL3Y2dmpQVDlqV2hkRTU5ZVFuV2drVUc0Skl1cTNXNi84?=
 =?utf-8?Q?3khWwtItT/8=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <853FCCA60CED3C4C9DBC10C3762E3309@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9424
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2a39a98e-9e48-4f64-4a48-08dd9917adc3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlNKclA4eEFHOWlVZ1ZMS3pCdjFzamlEeDJyRDVwVkJvV2VuUGw2WThsRTVj?=
 =?utf-8?B?di9oQVBNd0pVRGk0aWZWRUlVV2NWbkgyaWZ1V0ZIVEdJSlpDUzlWZEZkNS9a?=
 =?utf-8?B?MnlhdHJwbk13YUtVSXhUYkRkcG4vblFvcjJtVThlV2VLNjdhbVZaZGYzZTh4?=
 =?utf-8?B?eFVvUllQK2Y3cVJjc2dvRU9wdnJyWWJnSTVyTU14OGhZK0l4Y2thTEMxbHhR?=
 =?utf-8?B?OHV4ejB4SW1HanRsbnZySnI0ejFEVHlHQmFEUitnanpHM1RyNFMyTjlqeGN5?=
 =?utf-8?B?R3NPMmViQ2ZxRVdKN1kyTDFLOXdmeFhlbkdkVXpDMlRjUlozTnFKdWtJdTh2?=
 =?utf-8?B?b1hWRDVKU2F6WUtEUURzQm0vaXhnL2JLK3ZzRU1HUSs0L1ZEcjZ0cGFyUEtU?=
 =?utf-8?B?ZEtaSHlOWnNFMytlY0Z1T2s0L0pXajdsa2NyOG9McEhtS3lqSVlVOFlIMkZv?=
 =?utf-8?B?Ylp1UkxaeG5FTklTT05Mblk1NndRaVVsQmVjemdUQkl4VU9rRytDY0Z2RDJQ?=
 =?utf-8?B?QW91azk5d2ZUYUlWVEZ6WjJ0SGdZNXRqZ3ZOQko0TDZMVnhQSE15WWFwU3lo?=
 =?utf-8?B?L1ZDRXB4UkhjUjdJODh6VTNISWtFNmROWnN4VTZQcEVyU29sUmwzbDlrajRC?=
 =?utf-8?B?NlYvRXFxTytLK1lDeDArazRiZG54RmRSa0dOK3RaMVptcGs1b0ZHZlNxcmdD?=
 =?utf-8?B?UHVJN3llU0FGaHlWY1Q2M0pDWHE4TWJMUGhhRUpaQXdjbGpreVVRL1p5dVdW?=
 =?utf-8?B?KzZPVFlWYzltdzNER05KTUY5YmRaYXl5R2U3aVRwTG1rU3VCajNmVlpTdWFy?=
 =?utf-8?B?YWlEQytVOXAwOURiODhyaklBQTd3ZUVkcGN6bnFCZnNtbi9xRlI0VVFlNk1Z?=
 =?utf-8?B?Z2xTRms4MkRya09tRVVVOUx1Qy84SUFacjgvTllUZ0pBTU9lOGJhL2xyY0t3?=
 =?utf-8?B?SFd3Z3l3L2xsY0ZXUUlYOGhvZEwrTWZTb0xubnpXVEYrV0JSakowUDZlTlla?=
 =?utf-8?B?N05RRHR5bXNNVHJteVVRYms3d2FObzBNc3pJMmM5WEJ6QXVpaFEyanVXNHZ5?=
 =?utf-8?B?T3dmaXZtS2hyNXJUWG11eTdGUUpya0lTTFBsZVA4WjNBVU1TQlZVQXY5Tm43?=
 =?utf-8?B?OUVxVjhab0RJaU1FTlJyMjNFYW0vb2dKZGNoNFl5RHo2MG81UFlsRDlnN1pp?=
 =?utf-8?B?aFpnWVNnM0VDREFiNWM5cjh3V2Rua0tCV0ZJNTRha2xTZUVIY2tiL2NpeSsw?=
 =?utf-8?B?SzFvL3pMcVQ2emtwKytIcTh5T25zVVZuUkVwZHBHS2MzM2lzdzZtZzV0ZWNU?=
 =?utf-8?B?WXdtVGJsaGtDQ2tiSE1ndURFY09iTWlFNmVNSHdtT1ZvYjhpNU5vMGN4MGFX?=
 =?utf-8?B?L0hjUlBqcEllTk5RQXo5VXhxMFRaZlRBODFBWm1QR1J3L2UyNHl3ZExxVGRn?=
 =?utf-8?B?aWthaFBvTW90VnVQNC8yUXlYRWNZSXlEbnYwQnpBa09SWHl1QUllWEg4K1h5?=
 =?utf-8?B?UWZWeE5HUEhKQmp4VVRrWk1ScXlaZnRPV1VIdndoWjNmWUFpT2U2Z0hJQXdB?=
 =?utf-8?B?Rjg5NUtYN2pzWW1uTTdSMkxWRU1yREFrY1ZQLzhsMFRYaUJYaE5COUNEQUxv?=
 =?utf-8?B?TS85Ty9XdzJOcUpFNnRhQTNuWXYyY3NienlIdFBSUW9UbGRzN1JGOEFwYkl0?=
 =?utf-8?B?QVd2T1pwaGJxdFdITEh0Wk5TSWIyVTNLVFVIZ2orUmgrbUQ2ZkxIWVFrSzhL?=
 =?utf-8?B?OHVKRG1KenNiQ282T1VsdUZndWRnbjljelJSWERSbHU3dmNzd2tMNis0c0VE?=
 =?utf-8?B?MmFKb0lORGdhOWZJZEdia0k2QVE0V0hxaWNmMFFWalovS29lSUFlQjVsYTdI?=
 =?utf-8?B?cDEwNm1kVUtnN2QxZ1lOS1JkaU9iVFZzVkdxWjNQMFdma000a2l5aUNyWFpK?=
 =?utf-8?B?ODlNM1N3NTlsNVhxaDJKcWdBRWdwSnlmcDRJcUYrN0o2OXh3eVE3dDFBOFdL?=
 =?utf-8?B?Y2ZkalZydktRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:02:29.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 329d7f65-8b4e-4c3d-94fe-08dd9917c2f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10845
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217079

T24gMjEgTWF5IDIwMjUsIGF0IDA3OjE5LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gY2xhbmcgZmluZCBhIGxvdCBvZiB3YXJuaW5nDQo+IA0KPiB8IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAuLi9naXQvdGFwc2V0LXByb2Nmcy5jeHg6MTE6DQo+IHwgLi4vZ2l0L3Nlc3Npb24u
aDoxNjk6NDc6IGVycm9yOiAndXNlZCcgYXR0cmlidXRlIGlnbm9yZWQgb24gYSBub24tZGVmaW5p
dGlvbiBkZWNsYXJhdGlvbiBbLVdlcnJvciwtV2lnbm9yZWQtYXR0cmlidXRlc10NCj4gfCAgIDE2
OSB8ICAgc3RhdGljIGNvbnN0IGNoYXIqIG1vcmVoZWxwIF9fYXR0cmlidXRlX18gKCh1c2VkKSk7
DQo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4N
Cj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIg
fCA0ICsrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiDQo+IGluZGV4IDIx
ZDUwZmZiMDQ5NzdiZGQ5NjY2ZmJhYmI1ZTI3Mjg5YWZmMDEzNzAuLjI1NGJhYzRkNmY5Yzg2Mzdj
NTc1YjRiNzg5NjMyMmJkNDJlOTY4NDEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYg0KPiBAQCAtOTksMyArOTksNyBAQCBkb19pbnN0
YWxsOmFwcGVuZCAoKSB7DQo+IH0NCj4gDQo+IEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlc2RrIg0K
PiArDQo+ICsjIEVtaXRzIGxvdCBvZiB3YXJuaW5nIHdoaWNoIGFyZSB0cmVhdGVkIGFzIGVycm9y
cw0KPiArIyBUaGV5IG11c3QgYmUgbG9va2VkIGludG8gYmVmb3JlIGRpc2FibGluZw0KPiArVE9P
TENIQUlOID0g4oCcZ2NjIg0KDQpVcHN0cmVhbSBjb25maWd1cmUuYWMgaGFzIGEg4oCUZGlzYWJs
ZS1lcnJvciB3aGljaCBpcyBwcm9iYWJseSB0aGUgcmlnaHQgdGhpbmcgdG8gZG86DQoNCmh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPXN5c3RlbXRhcC5naXQ7YT1ibG9iO2Y9Y29uZmlndXJl
LmFjO2g9NmZjOTUyNzY1MDQxMzU2OTMwMGFhNDFjYjE1NDc1N2VjYzA2YmU5NztoYj1IRUFEI2wx
MjYNCg0KUm9zcw==

