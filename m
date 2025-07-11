Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908D4C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:14:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.34])
 by mx.groups.io with SMTP id smtpd.web10.19180.1752254081242193208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 10:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ODIHuGq4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ODIHuGq4;
 spf=pass (domain: arm.com, ip: 40.107.159.34, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oxPUJmFr6c/tHkwX5zEJDvqN+tY1EDEgf532FOQ3/Qj6UsphVpShnf4+UHMibaLGvuIfwFSctGpkZB+sMVoEz7YeXf0aVGI+oblniW+bGbRIwrB7N1fRlgz0U3J8Em3gRVgK0DsL0QkAgzdZROhzSnpGsh+WKQaTHfHmLgG0AzhW/2wY/MQRGvr0Y34Qf1asPFY8reiBm8bqvvqCimlPNuc20mX2IQImmnMrhnrox1YYanIa+mA+iJJQ5OYwjThxxiadgYh8LoBXgmUujJ3czSfvVUygJtm3Rz7bczwsTUBSP6OKViY0XhJDotJZ8AMufx7fZnwdKJc8RrDlsPAmwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2EZj91j1X2WAYOTjOgSR8vsOZYAluTIRDusTgLo9KM=;
 b=ZR870B+4ah58apEAZ01iRcSc70eyBlQh28s/D8V7oW+8zw8By19TFfPnTjvnkaFIbA7cfDyRd1MSq+/PH04dojTps+jaj1NsDBd0psujGjLuzNU1czAlj6F48XQcPSXXFdd/JnmUp0ehKp/aFCflCsm/RNTfozyfzPPgek6OBPhX7yiy+GBl8kR77qcXcAFF27v4Wwt/PEuLbiwIyOvSutyyb4Lf3hmGnKOT+xT8O8/4e/sUdth2m2yI7LZIDwpgGlHLCMxfThQHK5P4dSnrfz8P1Ljh+nrJbfAzFs6v8BGwC28A6gHFgkaQQ5TOBOMif8Ldv2sEBIgrp76xWS6Q8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2EZj91j1X2WAYOTjOgSR8vsOZYAluTIRDusTgLo9KM=;
 b=ODIHuGq4y0L/Pb3uTPgTVigpH8+RCfczDRvoM+kmwR8nEG77mfyi950NQsfQwCfaIWL20qj4rQqGvCB7IYPEAw89Fu3veBmHlcZSFPijl74mRq8ciVJ6Gz5Dy89UzUeAcBBhltWBonLKPa/sZemJ8Z+kBktVMo/JEHEME36msgQ=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by DB9PR08MB9683.eurprd08.prod.outlook.com
 (2603:10a6:10:45d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 17:14:36 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::f2) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 17:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 17:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOh5Dc4xu2AZ4BcpFDfJzEvZbrJf8SElhM07GLxVvDjJsqdtRqLKJDG1nSZB/oI4+7telZr4nm3r/rVVFr2e6Wn0DnsI5vUvqFERywEpo3abb1EBn47Y2Orzi1KGqQM2QWYZzUfMUvZI4xo3vBAxcsQVmDF9h1TCzh0LXzQlkBBZJfWrN8uPiYKG3G/8oS5J4mc2FYFL/RmqCG9xLq29la/SXXrgN7nMLsdPaGOAjRvIS0GV21efZrsljy5NWAc83gm51+eS5LMYhGqRiS8mUUmHPt9UGlLK8c/xTzKE3GT/frZK/db2kT7ULmOZqbQ0KHtodcX6l5t16fqsu5a1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2EZj91j1X2WAYOTjOgSR8vsOZYAluTIRDusTgLo9KM=;
 b=El7Db5BMfIZn6Lppi8G6ZGRFXAz7GpEYcc8VE/NjaC5lFODbEVS34d/4rLvTNyob2astCOkQiz7UWHDSoHq0oaF1f+d24jisM+VP2l/5NSVBMwXIR8bKB4Ifq3FjzAKhUgdGOHr3D6t92MqWeZybf6yKg6a4kf5ndK0s43j1TIu8GGihKllA5Fu9Kp2xwQGnH12AQ7pnIW8EtyBnkNFSMYyMR5OBz+TDa1P36c9hLnr8pzVaoOIYjtD6Z+ct88I87yDEww2Oc1ZNtwbBlpW0Q6T3ndSS3H+OenhYKFdjEdog5sc6h/7SN8n5XNUC2hytNeJmdiuHnLU1lDpoINPoyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2EZj91j1X2WAYOTjOgSR8vsOZYAluTIRDusTgLo9KM=;
 b=ODIHuGq4y0L/Pb3uTPgTVigpH8+RCfczDRvoM+kmwR8nEG77mfyi950NQsfQwCfaIWL20qj4rQqGvCB7IYPEAw89Fu3veBmHlcZSFPijl74mRq8ciVJ6Gz5Dy89UzUeAcBBhltWBonLKPa/sZemJ8Z+kBktVMo/JEHEME36msgQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6116.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 17:14:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 17:14:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] llvm-tblgen-native: add new recipe
Thread-Topic: [OE-core] [PATCH 2/3] llvm-tblgen-native: add new recipe
Thread-Index: AQHb8nvJfDjBYCk360Ozc5Hl3bkrK7QtHqsAgAAKtgA=
Date: Fri, 11 Jul 2025 17:14:03 +0000
Message-ID: <D9C3AE39-04C9-4796-A49B-3E6442EDCEF4@arm.com>
References: <20250711155136.2172651-1-ross.burton@arm.com>
 <20250711155136.2172651-2-ross.burton@arm.com>
 <a2c24138-767f-479e-986f-75bfe50f6707@gmail.com>
In-Reply-To: <a2c24138-767f-479e-986f-75bfe50f6707@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6116:EE_|DB5PEPF00014B90:EE_|DB9PR08MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: eeeef96f-55e5-41d2-b2ad-08ddc09e6924
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Mjc4YVRXOUhWd0xNK0Q3R1d6dElRYnlZN0JEZEptVGFYS3dZaWptdmp1Rk56?=
 =?utf-8?B?RUJyYzl3ek5ja3pYN0NQZEtrY2c3NlNHVTllRmRHcjMwNkJaTzEvZUZHYXUr?=
 =?utf-8?B?bjM5empaZnZaYUFMdmNEcmcxU3Y1Y0VZL2k1VXh6YVNkamFSQ0pOZzhKUFd2?=
 =?utf-8?B?Y01aVlo5S3REQVRlNDBKU1ZPblRHMHozSDdwQVdMZFpPYTNMaW5wYXNaRXRi?=
 =?utf-8?B?VzB0NmdtVHB4dWJBOWQ0aFMwWnNWTDRxczZ0U0xxak8rOHVYYVhhRzZqbmRL?=
 =?utf-8?B?WHlvZzdUaVBGNVNpdjlyMUZlMEpQMWNmQldpdDlWM3NGVzJVUU95V1E2RjlY?=
 =?utf-8?B?NmJ5dTRBWHhVamdTK3ZYYy9ZSktOa1NwQ240N3hpa2NUWFk2c1NlMVpENXE0?=
 =?utf-8?B?RG9haiszRUN2Wng4SHJxR0xySndxRHRmd3k4d0U5cjR2UXFXMlFocjFzTTN1?=
 =?utf-8?B?WGpQRlNXWXh6VWc0YVBYUEdGNnJIWnBZRHJQUzY0czl5T0VlMWlkaXoyMktU?=
 =?utf-8?B?R21yNHBBU21uSlBFV1RZM2d4Tlp1L3Q2VkVBNnNjSzlNTUpMM0JJT1ZESlYv?=
 =?utf-8?B?aUVmcXlsQkt4b3RvWDNzYmNBMVZIdFVnZFU4a08yZ1RxYW1vZW81NG02NVVD?=
 =?utf-8?B?ZjlUNUI4Z1NBeE9EbmYrMHkyT3RySWphOFQ0SlJCblFicVBJVVl1Z3FRZTBT?=
 =?utf-8?B?RUNWYkNoZm12SFBSNUFwK1hVT3Vwa1RDcmFVYWtvck5UTTdXczJxTnVQdFVn?=
 =?utf-8?B?WnNxSjU3M0VoRUdTSk41Y3oxTWZZdEVQK1lWQiswMGpOQ0taQTlVOEdYMWEy?=
 =?utf-8?B?ek44eFFUTEZ5RjFRczZNWXRVVjdlcHY4RXlSNk8wNDhucklPRHZkTE5hL25I?=
 =?utf-8?B?S1JkbE9jTmsxc1RQRkZMSlN1b3ZtS3lZVGJVK0cxTFpFR3piL2J0RUFMN1hM?=
 =?utf-8?B?bER0alJKY2dVVjJrZTFXc2tKbFNGUERRSmhqMDdxTVZvT1NUdk9LaU4xbG95?=
 =?utf-8?B?Yjc3dHNLckkyYUhPeElwWGRCRnpxczVOWVFtbWFqb3F3MTNtVWF0VHdldEhT?=
 =?utf-8?B?MWxHemdXTEVCNDQ1ajA4cXUxMWlTWGNISmxra2t5WXhvem5SSG9EY01zQVJP?=
 =?utf-8?B?ZnhNN0ZabHVxWk5oeTN6M2tBdUI5d3NLeGZaUG5TaHVZR0FxYWpMZmpZdyta?=
 =?utf-8?B?SU1LbDZhem1ERDI0clhoSWxEaVF6VlZWYVAza28ybVI4UFdPTXMxMW53TCtG?=
 =?utf-8?B?czdaZFYxb1JrN2dxanVPNXpndnRnNmdwRVRFNnRLZkFVL1daVzdHd3B4d2Fv?=
 =?utf-8?B?Umg2TmFENjhhdEplMzkyZ3p2MlFxTU1qdE1MSmtGUjJNb09pWXZOTm1tdUlV?=
 =?utf-8?B?MUo0S2R4eU50NUJ6NjFXVWpNRkhjU2VMaVVYT1hDYUFGaS9DNUx3VDFlY3o0?=
 =?utf-8?B?NVpISnArL1VNZ0JoU2RiM01ZNnBuYVdScjBjek5WQk1MSUNwR3JEa3ZzeVFV?=
 =?utf-8?B?MWJYRE1CSnczRllDL3FHTHlxaVdYUVZ3MFk1UW9TMjhCRWV2QlYvRlM0YTFy?=
 =?utf-8?B?RDZQVHJ5bWVpenM1K1p3TzRyRGlVeVhMVHpSYzJWbkZHOENETW91L0N1ekNF?=
 =?utf-8?B?akRydFNsYzYwU0liL2xDSitTajJUT3h2YlBYaVRlbitRZUFRellIMmptcWp6?=
 =?utf-8?B?L3ZRbUNnQ1JKVXRaMzByVkNJaUkvNkJWWTBlcHhKNWVVYUZpUkphUkFnNTdU?=
 =?utf-8?B?dmFueXJtZkFBUmdTdVZnMTFmR3AwTnNVaUlCdjRvVGtqeXo1b1J4MW5RQktO?=
 =?utf-8?B?aGVtdEkyNnVHbEVBY1VhQTRnTFFQN29Pb1RsUnltc1JBd0NmTzRYNjlmMDVw?=
 =?utf-8?B?NjBNOTdiQTlUVXlXTDN1cTZ2eXFPbzhiV2RUSFRLallXNG9OMTIrVVZQcWFM?=
 =?utf-8?B?dGcvZE54RE8rZTlIenBMT0pXWk4raU5xdVhVQ3VpUnBBS1pQRnJ1elRpT2gv?=
 =?utf-8?Q?v8ph/spZ9/FeKRruicDZxI2IsZrC08=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E5B2A452D9BA46A34CC67FC7D918E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6116
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f3a945a-3742-4ea1-8d74-08ddc09e55ae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlhmb08zeDNLZnVBcnFYeURWRXZPR2ZtcEFXajVnYjFNUnRSUlI2NVZSekY5?=
 =?utf-8?B?cFB2WFpSdExQREVrLzJGREsyY0IrTVhSU243UW1JdTU3UHNhanVLSWdHbHp4?=
 =?utf-8?B?UmxpNFBFbm9GSUpCUGNxdk1idzdqRnhCMW1UNVZFQWR4cjNPTEFCNjkranZQ?=
 =?utf-8?B?QjJBMmNuV0dLN25MUmtKQlU2OTRsMFg4T1ZEelZqT2x3MUhtYVZJWkwvNU1h?=
 =?utf-8?B?OS92WU4zczlDNmJrMzhISnQrWWorWlhhbDVkZG1aOVN6dFJxdVhpT1REVVVn?=
 =?utf-8?B?a3NqT2RIejd6dTVzeXp5OVZOSlV2ODdadEgrVXdhVzY2WDNxWnNlc0RjWEQy?=
 =?utf-8?B?eWJuaXN0QTJRd0RpR1EzMjc1bDV6elo2bDd5aG8rREwxYmtiTXp4NEFQa2pV?=
 =?utf-8?B?a3FTTWpHQlI3WlZYcWZsRkFrYjE0T0FPY1JOL05hWDRWU0tjVXROQm1yQVhP?=
 =?utf-8?B?TG4zL0E2eWJwWTVTajZxa3Bmb0ZCZDR3WS9PSWRFbndkMDlGMUhvRVhnZ25D?=
 =?utf-8?B?WjJvRDcvQmZnN05ueStkaVNwRUE3aUZTVHFlTmtGYXljWjR5UEo1TTU0MFFV?=
 =?utf-8?B?Z3dnR05Dd0FCZU5yaUJwak9IWVpDcnRjVVhzaDhnRStuNzZhV1BLeEdGRjly?=
 =?utf-8?B?TGFWK3pDYTNpZW9Ka01CNHpScnVqZVdkUHJtMUhBUEpKaS9zNU5qVHZzb2ZT?=
 =?utf-8?B?TVJibC9yNEYyM0tRbHVzYnRreDBtM25raGlvNmJNeWhDRFM1Ky9Wc2YrUllN?=
 =?utf-8?B?emZHekxwWDVBRnlCaFFMTllWVTUra3pXbFkvZXM1SlhMRmUvK1FFZ01NbjA4?=
 =?utf-8?B?clRhQ0VtamVKei9hbFFsTGhseWtiTEx2eTh0TUZVMnFWZDd0cHQxcTdvd0U5?=
 =?utf-8?B?akVWczNsUFMvY2lkbEVCRVdHNUcxVnNxdTBPT2VtZHVUMEdaMkZIWVkxVkNi?=
 =?utf-8?B?UXdncTRHWnFxT0xZMFdWVDZZSDZIRXBlSGQvZXljY2tCNGhPM1QyRUZyRmNP?=
 =?utf-8?B?ZXhJNHhUTWdXOG5CRGo3Zk9pVzlNdHc1UzJpd21iU1JoWXYvZkhFRWExRHBw?=
 =?utf-8?B?V0RoREVyVUpLenF0VElvWlRMNGdZR1VSWDQ3K3E0ZDk4WXBkbXhxbzhUbVEz?=
 =?utf-8?B?elJSRWdHVlhrQWt2ejJIZlJsU05wVlZuKzFKMXFPb1FLeXlEUUc5dEJ2cWpO?=
 =?utf-8?B?SUhZR0ZtNG8wcllyam5GbFFRNFdsYWljNEM4Snc1VU9qYXY0S0dncnFIazc3?=
 =?utf-8?B?dmwxMFo1Um9PUmkzR3RySFBoR0F6RHRSRGJ1TktUOTB4a0phMHlhYU1XUGZk?=
 =?utf-8?B?ZHhFVElKUkp6Q2VwNUR5alhWd29kb1pxRlppVmVvb2huRmtncWlaZDQya3NW?=
 =?utf-8?B?Tk04SVFmMzdYWTFtVWE3V2tkTGxZZVhjY2tmVnZHMHhpeG0xS1MrYmRzZjFs?=
 =?utf-8?B?UXo3TVRzY3h5bjRJTUpGVXZ2ZnZycHlKZzBBYjZ1K3phLzVWZ3dMeFpuRjlo?=
 =?utf-8?B?TzM5TUJESmxSOS92ck16dWFwczRaMHBxL0dReDcxVFFzb2dQcmVBeWppTWk2?=
 =?utf-8?B?anJYZ1d2MlU4NEpjd2x6Y2t5bmJteldhVy9seSszRlpZUEcraTB2cmpZWkFR?=
 =?utf-8?B?ZURxK2gyclZ1UXFkaHM3VGU0dDV3VnJFMkpiZms3VTVTOWZNRCszV3cwY3Nv?=
 =?utf-8?B?UVQxVncvdzc2bjRMUjNWcy8wUTY1ZDFObzNHR0dpd09udG5Hb21DNU5PVThM?=
 =?utf-8?B?TTNDdkZjOCt2bHhHYjVydDBaRllMdFpQdTI4cHZBQnpoQTJDNUdmaG0rcGxQ?=
 =?utf-8?B?RUYrSHRiYzExa2l2SGhxbGdpcG42b280NTJiTlhRZmovZWw3NEx3UkZDaXAw?=
 =?utf-8?B?bE9TOUtnSEkwekQxQktERW9hR2tkajVQbHBWakx5S1lXTWxHanlIY1gyUkhE?=
 =?utf-8?B?K0xFQmlkNVJ3OTg5WnAzVEd4akZ6R1FxaTJ6aEtYbHZzbTd4c0p0R3k0YnJj?=
 =?utf-8?B?RUtUTEJwTGFjb011RWZKVHd0VTBTS3c1V1ZmdTFWWWNrbUJMa3pRUmNWeFJQ?=
 =?utf-8?Q?C6KqgO?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:14:35.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeeef96f-55e5-41d2-b2ad-08ddc09e6924
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9683
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 17:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220164

T24gMTEgSnVsIDIwMjUsIGF0IDE3OjM1LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4+ICAgICAgaW5zdGFsbCAtRG0gMDc1NSAke0J9JHtCSU5QQVRIUFJFRklYfS9iaW4v
Y2xhbmctdGlkeS1jb25mdXNhYmxlLWNoYXJzLWdlbiAke0R9JHtiaW5kaXJ9L2NsYW5nLXRpZHkt
Y29uZnVzYWJsZS1jaGFycy1nZW4NCj4+IC0gICAgaW5zdGFsbCAtRG0gMDc1NSAke0J9JHtCSU5Q
QVRIUFJFRklYfS9iaW4vY2xhbmctdGJsZ2VuICR7RH0ke2JpbmRpcn0vY2xhbmctdGJsZ2VuDQo+
PiAtICAgIGluc3RhbGwgLURtIDA3NTUgJHtCfSR7QklOUEFUSFBSRUZJWH0vYmluL2xsZGItdGJs
Z2VuICR7RH0ke2JpbmRpcn0vbGxkYi10YmxnZW4NCj4+IC0gICAgaW5zdGFsbCAtRG0gMDc1NSAk
e0J9JHtCSU5QQVRIUFJFRklYfS9iaW4vbGx2bS1taW4tdGJsZ2VuICR7RH0ke2JpbmRpcn0vbGx2
bS1taW4tdGJsZ2VuDQo+IA0KPiB0aGV5IGFyZSBub3QgaW5zdGFsbGVkIGJ1dCBUaGV5IGFyZSBz
dGlsbCBiZWluZyBidWlsdCBpbnRlcm5hbGx5IEkgc3VwcG9zZSA/IGluIHRoYXQgY2FzZSBJIHdv
bmRlciBpZiBpdCBjYW4gdXNlIHRoZSBiaW5hcmllcyBmcm9tIGxsdm0tdGJsZ2VuLW5hdGl2ZSBk
dXJpbmcgYnVpbGQgYW5kIHdlIGNhbiBkaXNhYmxlIHRoZW0gZnJvbSBidWlsZCBpbiBjbGFuZy1u
YXRpdmUgZXhwbGljaXRseSwgc2hvdWxkIHNhdmUgc29tZSBtb3JlIHRpbWUNCg0KQW5ub3lpbmds
eSwgdGhlIG5hdGl2ZSBidWlsZCBkb2VzIGJ1aWxkIGl0cyBvd24gY29waWVzIGV2ZW4gdGhvdWdo
IEnigJl2ZSB0b2xkIGl0IHdoZXJlIHRvIGZpbmQgZXhpc3RpbmcgYmluYXJpZXMuICBQcm9iYWJs
eSBzb21lIHF1aXJrIG9yIGFub3RoZXIgYXJndW1lbnQgbmVlZGVkLCBmZWVsIGZyZWUgdG8gZmln
dXJlIG91dCB3aGF0IEnigJltIG1pc3NpbmcgOykNCg0KUm9zcw==

