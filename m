Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28100CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:22:38 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15359.1762435356278155863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 05:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EVx7wv/S;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EVx7wv/S;
 spf=pass (domain: arm.com, ip: 52.101.83.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=L7EE1lnu1IW0upAkziERIpK7B6JNCDlI8FtbI1Zl88seO2qCGJxxpFvMbBFVFsgL1RyUrAPI2TSd90+g/ChXBkKo37IpoAoiY+9H4xYsaVbVGpGz0c2RFD06yh6Qk0TYAQNVMblO49bQhKw0fedgX67zzq9urPibS1TGy+zGRTCCzRyI8Z87ye2uboyWe8fLIxW7zi889nILYow5wVfxR7grZ9b6zIy6EqErJ4nHPYrKWq+AJRLoDx1EpqlCs2EtrVFrRyzUsl12OL9GxFpVevs2ZmjBIyfAOE00z1BqJySwovAaV6T3x7Re620P4vnhd4gDKTMCLJQh5Fv94FUMnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlrZD4pd/cB2lbwlvlsrzy8mgqyoccgvgxwq5VXsA9g=;
 b=wLPr7dYer0/NeAvh78heRIygBELQXUAOMD24nmnIi9eF2PYau/Fx9nCK2TSWi53tbpk8DhfRzyb9ZrBb++uBQCMnHEDvcLLRKjH2P5VtMK0K6p1AgURfbgAj4/BK1OUzBN51pgtUntn/nX1qPTOMZOjN3LPk9cghV6X6F+ZfQ0z9OFK2r69PxWbT8x9lmzqan8CG20W9tbp5Lzs28BffArc65PgZGoKFURyqdegULTHGXErN01Evme8lKTCtCihT7bIghbd/2Z7sBNo5sOcT1IPBvck8wG02L50b/3CAHLEZORBU0toO/7oYCTzHTt5QYFG84CEbSEedgiwn2E5yJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlrZD4pd/cB2lbwlvlsrzy8mgqyoccgvgxwq5VXsA9g=;
 b=EVx7wv/SeWRzDJyoQpCpkeya3Zt7AYYxwI90bw1WJT++9DkHt54Ug5k9ygz0tbBm1wmIyHqWxA5IDnMteIQm9SsAtPFZw/b9Gpao+AclpyBL4UYC3cBbDtsYlSBQH9Y4loJpEBAfOUhru7xyeemCs0oizF99aH6g1zqbJ+ij2/g=
Received: from AS9PR05CA0101.eurprd05.prod.outlook.com (2603:10a6:20b:498::15)
 by GV1PR08MB10806.eurprd08.prod.outlook.com (2603:10a6:150:162::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 13:22:30 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:498:cafe::5) by AS9PR05CA0101.outlook.office365.com
 (2603:10a6:20b:498::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Thu,
 6 Nov 2025 13:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 13:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3I4D3hEuYqb0PFIKjBARj3o3h9T6gGG+1Vza+dmOLhIEms7rDnQKGU3THlQz8sl9vzLKkevtdE5Dn4BLwnbDvHkCIFnG4GtTOM5Pgm0TH/H4cVKH+c4w7VNl4YXjnMZZ7W3aahaEY1qbwFeaoYyIJWBpsjbVc7R85mKdCWMu9sXbXtliJKrrR1at+kE1KFI6OrIPxTm4LmTT5jgwXLRv1jLWGVkh59+QT1Flylu+BZCmoaKM52uF+iqCna3oKusr70wrqNo2+r7TBmFhs8+1n+5EDrLOExmDix7QCrMfFvIP3Otzhu7rmQhI8RLsQRW5Uy+Q8+eBE81sIKaxVZ0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlrZD4pd/cB2lbwlvlsrzy8mgqyoccgvgxwq5VXsA9g=;
 b=UQQt2A15p+1iB4Cp2R9Tdvkz2SqbqC+kdMMZhmBtlB76AEwO5kJ7fl0+cgW7XqJOqDr3/eEJy+oPkTnMVMdS/dJmaMCPZUNWC480b2Dl0FggS9UxByRnzNQCNTD9PLQIaE9r/RuAR10kNyo4tlaO8IPeA2quGKWYD6hBOhHektmwEzqJncCY5+pF1edDwBern91VwGqqPpuQJpXbW6E9q8kZqMviUr44NiN4rO81tRUvjGuMkLIG1SHu/52IOousna1JZCXMqxUo+hk8yO5oUEhZuuS85kDc1DhMIz8P/9DZ+wNlP++wpoJnPGNO3oRkFCZsSrB4MX+zsC6EzswJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlrZD4pd/cB2lbwlvlsrzy8mgqyoccgvgxwq5VXsA9g=;
 b=EVx7wv/SeWRzDJyoQpCpkeya3Zt7AYYxwI90bw1WJT++9DkHt54Ug5k9ygz0tbBm1wmIyHqWxA5IDnMteIQm9SsAtPFZw/b9Gpao+AclpyBL4UYC3cBbDtsYlSBQH9Y4loJpEBAfOUhru7xyeemCs0oizF99aH6g1zqbJ+ij2/g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:21:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 13:21:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Convert packages to gnomebase and upgrade
Thread-Topic: [OE-core] Convert packages to gnomebase and upgrade
Thread-Index: AQHcTJNB2nrmBWJJ6Eur27eEVxCrIrTlp3SA
Date: Thu, 6 Nov 2025 13:21:57 +0000
Message-ID: <3DA33168-B257-450C-9AD9-C2AE5A97A2B4@arm.com>
References: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
In-Reply-To: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6177:EE_|AM3PEPF0000A79C:EE_|GV1PR08MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: e312659f-d9eb-453b-d864-08de1d37897f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Mmt3NjhoWXowdm10UTZ0MUpqSnc5anJSdFhQZlRTK0NqbG5xTE5YcnZUUXVs?=
 =?utf-8?B?cGFOM1gxa0pQam50aW9UaWQ1SzQ0ZDdVajNIT2hCRGdlVmtxOVIzYzVsQ1E1?=
 =?utf-8?B?VmdyZm5QSklDNm8yMUlJd2lQYWFoMVZJdk5ZYnE4b2U5S0pWVlRXTVF6b2NL?=
 =?utf-8?B?ejJUc09reTdGZGZXWE92SjJINzJQNXVHQzJSSDFKWTZ5NXBlKzk3eC9TN3lk?=
 =?utf-8?B?MnZrMDFvcG93d3JPR000TTVqWCtEZGxaUjVWallSZUxBbTF0YnhFa1N5NDRV?=
 =?utf-8?B?RGdFY0VHbkRQVFZzQWJzQTdZd0l2WHZtU2s3MmhDckczUmZTRmNmeGVkanlX?=
 =?utf-8?B?b0F5d0JEQitBOXFtZm5hRmZFSHB2N213OEw4dGVPSFRlSW5qRDNmeVd4R0M3?=
 =?utf-8?B?YVVIY2RhWExzVHVQUzZKVGN6UlgyNktPYUo0VStpUGtMMVkzdm9MR3pRaGdX?=
 =?utf-8?B?MWpOd3V1V1NYRW1temxxQjRQSjkvZTZTTUJ2Z1I3SWNkR3BCYzhhWmw5ZTZ4?=
 =?utf-8?B?LzM1Wm9SMkdlNGxkYlF4d3BlMllIa2I4Sm43MnZEZjMrb1U4aTh0NERmUWcr?=
 =?utf-8?B?MnZCckwwaEY0bmdVY0V1WHp5WTViWnYyMUtNV0tlMURnU0dTWFBSVUxXdTFN?=
 =?utf-8?B?SUZ3czZJdGR3bUE1bWZFZkdZeXZyclo3N2dNT2ZhamdFeWZ3VHM3VWNEOENx?=
 =?utf-8?B?WngvcVFkRnVxTmtUZU1OR2VGZXFkdTE0cVJvL1ZtdzA5YlhmemdZNWo3aFRE?=
 =?utf-8?B?VjRLZDZHU3pCemFXTFdNTTF0Z1plcE0vYTFKdkJMajUyOEt2T3ZlVnRMKy9O?=
 =?utf-8?B?QTE0aUpxVS9NSkVSTlhKKzJOOWFTb0xyWkZJQUlvTW1ld1pWd0hheGZIWDhD?=
 =?utf-8?B?SWlucGQvenNQemh4TXFNbE9ITHNzQUlOb3M5cXQ5V2RUNXEzQnNyT3I0a3h3?=
 =?utf-8?B?Tkp1aGdzV2VybWt4dGFwV3FQdUpuZjF4ZkIwM2JLV3BNVUZ0QTlPMWZEVVJw?=
 =?utf-8?B?d1FlS0hoL0FZd2xaRUhFSFloNFVuekwreEk3THlIRTFEdzlmeTEvN2FqaTZH?=
 =?utf-8?B?N24xTVJLQUV4aW1haFlSRy9PdDJYcDRMVEFONCtpMVQ4NkJRUzVJNGsrV1hm?=
 =?utf-8?B?dklVUFZFSVR1UUloVCtwR2xuVWc0WEhqcmhlcFZEWGZlaVRxdTZvY3doQlJz?=
 =?utf-8?B?b0FZYVQ4ZDdXaXZ3dEhranBROWo3TzVKbHRWWE5HWStwMnM0OHk5ekpKUjRP?=
 =?utf-8?B?d3M2dFY2REszQkJLazFMMzYxbjFld01qZGcyVFdycjhiVVc0d1hKZlNZQ2RG?=
 =?utf-8?B?dmtFd0FHckRrV1E0K0JrQkFFZmxkbGxmajdjaWRlbmNXdjd3NHIvMUhPZjVa?=
 =?utf-8?B?V3hueTgvQ3lSTkdhUS9GRDVKMUtwUHgwUko3M2tpQXB1N200YzhocDZOa2ZI?=
 =?utf-8?B?bmR6cHBjSXprR0ZYMGxWYnhNRnhlM3Y5Ymx4Y0g1NG9RU3p1ekF1cng3K1Zl?=
 =?utf-8?B?cHBZMklkWTNqekpjQzd4a3pnZTJMOUlZcGFmR0twYmJoSGNUcUpWNjJWUzZs?=
 =?utf-8?B?cFR3b3UzcTNXY0NqTlhubTNPaVVyV1BHV01VWXJXQXI3L0JIQzZ6SkgyRCsy?=
 =?utf-8?B?K1VDd2E3MjNMUUpyWDR5SXFEdlNLV0RkRDVHbGRmblZGRE1hU2NSdTV6cGdT?=
 =?utf-8?B?WkdITW9HSWEzV1oyMUFxTlFXNnhrcGRHTlc5SDFSK0JlNjk5b2haN3dZVGRL?=
 =?utf-8?B?citDQkFvTWMyeDFJS3NrYUwyREwxOGRDSUFJdm9UTm9TOWNBUHhBVmtyWUVp?=
 =?utf-8?B?dFVtaHVDbE1pOUZmMjg3a0l1UEtBM3l4YjVHSGlqWlYweUFQaU9MSjBQVnh1?=
 =?utf-8?B?UzVCYllsb0s5cHhFM204d3RwbGV1SkxKdVdmNVVweFZYd2ZDRTdOV2NrYzBw?=
 =?utf-8?B?bkNGTllJNDlpOXFlYi9pQ3M5c0Q4Zk9JN2hPUE56cEtSVmYxVHZOSE85VWdN?=
 =?utf-8?B?WlNpcEJFamFIdUxoK0pYa3lubmZqZitkVVlIN2NqTnRxK0tUNnF2akpJaHQz?=
 =?utf-8?Q?6qLndB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A4F23DDE3869A41ABADA216BCB70B81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db8b448e-e8ab-4395-1e0c-08de1d377641
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0N3UndCRHBTRm5uZmxnY3pIc2w3ZHlDandxUkplRzU2Um1kS29UNzhhZHlw?=
 =?utf-8?B?d0ZIUG5sS1gybHpVWFhvRktnNFBYMGhMd2ZBdXZ2NUx5THB6Z0tZVUgwcnBH?=
 =?utf-8?B?ejM1L01kRHFDcmUwcWlrMGdHN3BTbG9VTnh0bnJxSnRjbVoxSlJlRXlmcFZB?=
 =?utf-8?B?NmNVelVmcERiT2cvdm40NFdzZjByV3FpY3g2UmhvYnZRQ01HMStCZEpiYnBo?=
 =?utf-8?B?VnBObmFmVU9GOUd0UStOUmp2R0dpYlQxVklNN2YvYlV2MDV5bWEwdHpCMUsr?=
 =?utf-8?B?eDQ5TEFsUm1ZL05NMFN4Rlc5VE5kTEpJMlliTUIvQ0tNOXA5Y1ZMY0pTOGJY?=
 =?utf-8?B?eEVmN0hKUkhYRkFBWlZxVXp4M3FuenB4bDhrYk9ZeEU5cUtySzlBMzdnd2FL?=
 =?utf-8?B?eWpiSy9HWVUwck1TcmFRQTV0bFl4Unh1L0lVL0h0TWtpaGZzak9NRzBhRTk0?=
 =?utf-8?B?QVUySVAvU1VjcFY2N0dLd3R6Y2FmRzNCdXVjV2UwdTJUTW1RbE9YblRBNGhm?=
 =?utf-8?B?WEhvOGY3clFqOTlFak8wWHVqSU55U3RXQ3pRVFhDb0tWbXZXcWlUaDI0ZXdX?=
 =?utf-8?B?aFFaUUQ5OGIyTkxNUXhZQjBMT1dtcEhVVlVabTJZRTQ5aEdtT1BRNzZ2Z1ps?=
 =?utf-8?B?SVZFeTAxWU16K09hVWpKajZsQmFBbVhxUGJyODhBWkNpbXpjWTBFaFRqWmIw?=
 =?utf-8?B?UXlUazdZTmJZamhDZ1BkTmkvNzNoRnh0K3pNNDI3QmYyZktiRzQ1T09aYlpy?=
 =?utf-8?B?aWgyLy9HLzV6aVNJUnhlTDlGOW0yanZOMEQra0JDZzRWbEdDbG5zdzVKbGdv?=
 =?utf-8?B?bUJQbmJsL2UvdzlGdytVd1RLdyt3anB1a1V2LzF6elQ1d1ZEaGpFSkVQT3lr?=
 =?utf-8?B?eE5WN0E0MVNsKzlzOXZWb2xtbTVQaER6dUdwZEZYWHllcjN1QW9JS05oYklk?=
 =?utf-8?B?dGNCM2JUSW5McDRIQnJVWUlueWQrSWJQS250UWpTM0NqZy8zVDlZdThkVGl1?=
 =?utf-8?B?SlNWaG9ZYzJVaHRURWMrakRFYzNobk1JVDN6UjZoUGlxdWVXWi9INXVWaXFG?=
 =?utf-8?B?MDVnQXJwb1NjdVJWNnltUE1xL2Z4a0tqOHRlN2djTVpmcXVLKzVtMDFVMFdz?=
 =?utf-8?B?eU9lS1hEWUdHOUQ4Mzlxd1hQZE5DZ3hkeTJtdU5nSHIva2xZbnF6QnVuTWRY?=
 =?utf-8?B?OEd5dW93Z0JxL2hLVExMaUlkMlN3NWN6Y05GZFBCMmp2bU9OUWdjZHVLS2VL?=
 =?utf-8?B?L1kvcnJadHU1ak0zVzNVbjB1dUJpN0FXbndydWRLMXlHcVVzdUE4OE5xZWxt?=
 =?utf-8?B?eitVS0toVXFhcTVZTmx4am02TFZzQmI5a0tiWXNRaE5tRUVXZnBFZ0JLNFdx?=
 =?utf-8?B?NU9nakZNYk5KYlk0R0hNRlhxa1g0em1ZSHhKQnZJQi9Zd0orVHN4cVJCVDdJ?=
 =?utf-8?B?dC9vSHpQVWdUbis3R2c4UFREYlB4S0w3TU1YQ2R6YjNscEFCSkFKV1ZFMTFh?=
 =?utf-8?B?c1lRaXUxYmJsa0JiR2Q3Y2VoY0RuN0tJemZtNUJ5ZkpzdXNFT2VRNHQ0aEcz?=
 =?utf-8?B?alhLWWFwakxhL1B1ZytRMmlVeHJLK1JBMklCUWNoTHhaSUUvbzhXZEhsOTN4?=
 =?utf-8?B?aEE0UGcrK2J6bDhsMVBQN05NODBoby9CMmp4L3ljYmNJZTBFZHhpSDMrZnZJ?=
 =?utf-8?B?QnZ0aEN0UDFyZUhnUVV0cCtlUHdTUUo3MCtGamxEaWtUb1BjZjEwaDZnZi9h?=
 =?utf-8?B?aUovNE5rRXMrZkc0VlJacmZKRkVVd1JnREJGNCt2d3pKY0dFejRNWnVsM1M3?=
 =?utf-8?B?L0xzS3c3NzdLZ0dNN0dwZS9rNUtSQTN6SGkrSUFHVlphcXRlUE4raE9DV080?=
 =?utf-8?B?d2RQUnYzU1p2R0xMR09JenRrM0hBVnhjVURuMTFUdWxCaGplTGNlWW1aUE5C?=
 =?utf-8?B?bktUUVVtSy9SRGFsVFZFQVREalh1NVJhOEZOclE2TC9sc2lzcUVNUDNtQ3dV?=
 =?utf-8?B?Rnh2eXlTNXNmc2JmS2tieW1STk1VKzQxTW1uSnBkdHRQMllrMzU3TXFJWG1s?=
 =?utf-8?B?QURnTGpQbXQzNmRNVkxCV0lqR2ljcWhibmJPU1RuSGx6VWg5TXMwVm5qMSsv?=
 =?utf-8?Q?BK0E=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:22:30.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e312659f-d9eb-453b-d864-08de1d37897f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 13:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225979

T24gMyBOb3YgMjAyNSwgYXQgMDc6MjYsIErDtnJnIFNvbW1lciB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8am9lcmcuc29tbWVyPW5hdmltYXRpeC5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IFRoaXMgcGF0Y2ggc2V0IGNvbnZlcnRzIHRoZXNlIHBhY2thZ2VzIHRv
IGdub21lYmFzZToNCj4gDQo+ICogdmFsYQ0KPiAqIHB5dGhvbjMtcHlnb2JqZWN0DQo+ICogbGli
c291cA0KPiAqIGdjb25mDQo+ICogZXBpcGhhbnkNCj4gKiBnZGstcGl4YnVmDQo+ICogYXQtc3Bp
Mi1jb3JlDQo+ICogZ2xpYi0yLjANCj4gKiBnb2JqZWN0LWludHJvc3BlY3Rpb24NCj4gKiBndGsr
Mw0KPiAqIGd0azQNCg0KSGF2ZSB5b3UgdmVyaWZpZWQgd2l0aCBidWlsZGhpc3RvcnktZGlmZiB0
aGF0IHRoZXNlIHBhdGNoZXMgZG9u4oCZdCByZXN1bHQgaW4gdW5leHBlY3RlZCBjaGFuZ2VzIHRv
IHRoZSBwYWNrYWdpbmc/DQoNCkNoZWVycywNClJvc3M=

