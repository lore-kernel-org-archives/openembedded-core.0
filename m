Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B60CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 12:59:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.55])
 by mx.groups.io with SMTP id smtpd.web11.13485.1755608379197392114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 05:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dB7/BPKw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dB7/BPKw;
 spf=pass (domain: arm.com, ip: 52.101.66.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q/0ozELA8XztQFx583KztHKTrq50D50t+nvR2dc1+CnT5Wis0idJwBAB01tLSqjecWTX7K3HBFWxnecgWeeU3Xz15TQ9zIqF2A5lnD4wJDJPidHuvB8DT2jEQ7heJvqI4lWmEz9XbeVkD7SGMlFQs2kmR4t66jmMjvifteRM07oH7kq7GxDqOi1BMat96uqSkqVT69ujOT5sqxO0hHnQgROSf3MYgAMHJ4g2SU1OHcFY6DKNeu0hgOtc/zhxBygoV7mOFHEdjLdESHZAf85nASRfG23gpLk9U85bzpH8WpdPTqBc9rHYmmap7CmIRpp/IzBkZaLS5fMFksWhWGwUNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NffkzwPCeJFkHknal115EqB/iHovlbuy53dVzH26ls=;
 b=C33gNdHrQ8Tzd75c2IjwpJhx7vb69L6WaM6DFJXzCf2rIY11DXWXGoqaqC4u7tyY+F5yWSEkLpYd04vj4Vz5yzu0z8CmoTsaiMFGRFn/JQ+D86gDIXVF2Er4pY4imLgt7H8xbbmE0kEIAEOerlgAGHC5hb4x1PklBuo6usfzsJ9jRO2VuEVxvyAPiUo0w6FSuuDMHicdQnzf5lsPIPh4EmWsdWOPeQBfLARhYfwTcg30ejFktbVID2WsG83U70wY6yMVcZfHmxGWcghYjTrW0mG5FgjFNkme0Y+1RQ+8c0AdoZ14gwe340ghjF/0SHvmrXp0W33xjhtWDW84Q2aDLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NffkzwPCeJFkHknal115EqB/iHovlbuy53dVzH26ls=;
 b=dB7/BPKwyA7vC8bBVxXl746w5hBMEMtLXD1XbjOxc5fMh1pZyoI3bJexjBVGvkfMu+TBBrAEIZkONP+O17m/2YRvPtOugGbMfhzmyRhLikbClMOt3NWt8fj0uR/e6bCHY9Dbai+gJF1n2BvzFHe5mGfhuJiEk5ihPgrQatTE0C4=
Received: from DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) by AS8PR08MB9526.eurprd08.prod.outlook.com
 (2603:10a6:20b:61e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 12:59:34 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::a3) by DUZPR01CA0293.outlook.office365.com
 (2603:10a6:10:4b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.24 via Frontend Transport; Tue,
 19 Aug 2025 12:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Tue, 19 Aug 2025 12:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhhczbhDuIe+kP69VQRexdUFRApydkcqe1NU4Peu0Pzthh+uFQu3sSVQPDw6/jFFNyszO3zNu/oBhWTUJupgNbXjhxB6M0+M9Eq3j6rJkmSfMAwcSZ6/inie9rQ8O6djpCdtA6Yv3TvSqzlaQZUXGtYVi2gwCNEwk4Z0VMFu74dL03jDXMj2Hzx+smpKZsIfR0x726zkykhSH163rpRGTYjJTsu93Ew+og+KwmlJgohRCHnr27mkRub3LbIgIalFMYcJLC877mOQq14L7Dn1t7BnteTqm39K01WgEVRdh5yuTAbun5CSESWbQ4orpTb1Nz2wfOdaRyeMBuQHuRHHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NffkzwPCeJFkHknal115EqB/iHovlbuy53dVzH26ls=;
 b=IDiNMX0HlU8PimuYzBG6PS5c7V4bx8dicDosdFhHiUDaHHonSNjmcDaaEe4HbX6tRLhEH43PaxbVBzq/vphJ27C5N+3kwTxXZ+4CV6ixXQ8GS+Dd5fojMsEIDrZ7SQD234zXDZQM9F2/Biuf+0KJtvM1AndUf0jO3zDP3nKV81HoaRVpLHICItm1ZGRA4sFbevAuHCto0jbq1z38UQv+uQW3E4zYNBXaGeFim1VOh5cj4ZRm7vE/12O9PZ5+NNtgfoal+S6wEs4I+S7Os55hoUILOhZ38SuXaieDVxfQFvKDHkA5zLt1tDTyk5M8o7RRaj5Wd+hC5fKkc9Vg1hTnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NffkzwPCeJFkHknal115EqB/iHovlbuy53dVzH26ls=;
 b=dB7/BPKwyA7vC8bBVxXl746w5hBMEMtLXD1XbjOxc5fMh1pZyoI3bJexjBVGvkfMu+TBBrAEIZkONP+O17m/2YRvPtOugGbMfhzmyRhLikbClMOt3NWt8fj0uR/e6bCHY9Dbai+gJF1n2BvzFHe5mGfhuJiEk5ihPgrQatTE0C4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9204.eurprd08.prod.outlook.com (2603:10a6:10:418::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 12:59:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 12:59:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Topic: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Index: AQHcDgbtk8oapSIaEkqpvFRXOiQPR7RopRcA
Date: Tue, 19 Aug 2025 12:59:00 +0000
Message-ID: <ECC125A2-DA09-44DD-8DB9-CB61F89A822B@arm.com>
References: <20250815170517.12674-1-peter.marko@siemens.com>
In-Reply-To: <20250815170517.12674-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9204:EE_|DB1PEPF000509E3:EE_|AS8PR08MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 46db1017-ab51-4f09-0824-08dddf203ee2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bThaRVhIditJdWYrZkVQbWFMY0JUa3F2VXNrVG1LYmVWRjNkcGUrUUtyejlY?=
 =?utf-8?B?aytRaXR6cjJZVVFMM3p1RzA5NDl5UTkwd0pIaEt2bU5XeXd0T2ZpYk1CdkQ2?=
 =?utf-8?B?a2VNQUtsdXJpZWtlWjIwamh4WGJVWTNnMWFKajRJempvUlVnUExZMGlLVjR4?=
 =?utf-8?B?YVhZOFgvdnlldUFhSmZadUxkYnhraWVJYmxOVGE4R0pNRWlIeTRMWll2eHBw?=
 =?utf-8?B?aDhQNTRrSVBFOXYxYXdXd3lLWHgvN2VhMWt2RGxKdVdacWJicEJzd09vaDYz?=
 =?utf-8?B?RXBrOWZ0KzdOVXY1UHF6Qi9EUlNWZXFrbFloRi9LOXFNaURHWlk2NUJmMm9p?=
 =?utf-8?B?SUJpV2RHNjJMczlDUFBvTHoweml5dlNCTjcxMzRnbGNVY2p2b3d2a3FBVGVH?=
 =?utf-8?B?SUJWR04yT3pQMFFRUHplWWt2dEdKbVpEb2FKWG5lRTFVcGhwelQ2VEdEeHBk?=
 =?utf-8?B?Sy9aWkZlS0hCbEZkNm8zUWpWcmhDalkza28yN0NaSFJQS3VsbGVpcENkTG1j?=
 =?utf-8?B?Y0QrMUlic3ZoR240VjBGUmJjbVNMRGZIbnBuMmdSTTFCa2E3bEM5Qlhrckls?=
 =?utf-8?B?SXl3aGpFbmIyajhpSVU2VEovSUdkUU5WblAxMVVaNmxqT0hDRmNsNHNpZERV?=
 =?utf-8?B?cFZJOXZhc3RyNzdKUnA5dzNIcE5uY3FtbFBCUXpVR2JoaEQ2REtYMjZ0T3Uv?=
 =?utf-8?B?aHFwaktQWFFla0dWSUg2UlMvTXF1WmdDdmM4dWlJN2ZieEorc1VodXpZU01r?=
 =?utf-8?B?cXE5dTNidHVnZW12eGUxOFhRZXl3VkJzN2wvNlRrMDI1a040K2k4RDZUTWo5?=
 =?utf-8?B?L3FpOWdzcnI5Q05xZnJLOVY5dWJYczAyRTMzWVEvWTV6dU1ReHJtZktNby9s?=
 =?utf-8?B?TE1EdmlVNHBHZUJTdkVFMGtsaGhqMkdkYzhHU1pubCtjTXB4NS91alFDRVVM?=
 =?utf-8?B?NldOdDJsN1h6MjFCcEcwTEx1M2tYcDYxQmN6UEt3WkZ5dmlNVEFFb0swbEh1?=
 =?utf-8?B?LzNna2RTd0huNlVBbkVYWnpBcmc2TnUxcHV0dUhHTEpUZzRjY0NRUjA3VWVt?=
 =?utf-8?B?b2N6RlZKVzRnc2N1Zm9UWllpaldUUEthN0JJRHkwcVU1blk1SG02aU1SaXVj?=
 =?utf-8?B?VGxjSUlxRVlsL3ZCYS9ldy82TGZnYkZVNFM0eUFUU1EwY05DVnRYTFV0N2c2?=
 =?utf-8?B?T1NLVGZpQllodEEzN2VWb0J0aFNzYmpXb0JERVl3YnpTQ2RXRHMxTTZzZlBa?=
 =?utf-8?B?eFF3R0JrQXplMTRCOUd1ZGwzMllvQ3ZqQ2hvdHdDZ2FBUVErK0pxWlRDdHA1?=
 =?utf-8?B?N1ZTU0tSNnhoVGdmYWdaTDFMT3ZKaUNUQThtSjF1cWROUW1VOUw1N3YvZFR4?=
 =?utf-8?B?bzNMT1IySmM2b216Ny8rekd1WUwwUHgvZUtYU2MreG9BQm1XTURZdDJ2dHpV?=
 =?utf-8?B?UTJkQUpPeXJsbHh2dkxvVU1BdVZzNXVVWlRFMm5sSE1KVXI3U1RvM2dXTzFl?=
 =?utf-8?B?MHhmUUkvMVJTMEdQdlZaUUdYNU9TKzVIVSthWC9FME5IakFBNkthcXJvZkRh?=
 =?utf-8?B?VUZweEhUQmZVeENNWHl1aldXUjBudVpMaHdmNFoyOXIva1NFNlYvdkQ0Z0Ri?=
 =?utf-8?B?bXVueE8zaXZmNUpKZHdUclpOcThIRnprZGZNV0Zqb2pMYUpnZzVRUWQra1Yw?=
 =?utf-8?B?T1l2NC81dzlJdjlzc2dQNDBKY1hQSTlBdXdIUHVJZlJEd2gzN1p4SnJYc0w0?=
 =?utf-8?B?ZWpmUXFmTFBzYURGNU91SmJ2emkraURWSjFCdGVlK0xuU3BnKzZXZjRTeU5M?=
 =?utf-8?B?NXd5NENPNldiQ0tra3AxbUd4ZU5tekVndG1SY2ViMk9OWXhLeHFlZk9rNXR3?=
 =?utf-8?B?STEyblBrczc0by9XcXNRRmZTdnRhQ0l0ZThPWEJIZ0FiL1QvMXRCaEdkcE1n?=
 =?utf-8?B?b2xBbUpYa3I4dUdZeUU5c3dkT1JKRnZKMjFmVmNhR0NwOWhoMTZlbUp0UGNH?=
 =?utf-8?B?WXVsczlqbldBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1ADF31579BEBB41B73E48FE8FD6A6F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9204
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	824d7599-7d5c-4860-338f-08dddf202aeb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UE1UV0t5dDdoN0M1N3hrNlgvNlp6SHQxbitpTmVWUmpOd2Y3aGpsUDgxZUNF?=
 =?utf-8?B?MFNRQkxuS0FJZG1ub3FlbGx5REFVeVdyUTdrWFVIR0VTQjdld0kwbU1FYlAy?=
 =?utf-8?B?S0tSeXZ0Ny9XTkRyS2J2L2hPVzYvZGQ2UklsdTRYRll4ZXB5ZGM2WHBiUFNJ?=
 =?utf-8?B?NkhvZTI4M0Q5TS9xL1RWY3pQcGxmaktZMU00RFI4UDJ1NktpS3hQeXNhOWNF?=
 =?utf-8?B?TmF2OXRVcUNvN2lTMWcyK0ZIRHhSZUQ2bWpBa2pQYjBKUi9GNlN3dUd6Y0Zr?=
 =?utf-8?B?aW9BbzZkWGlMZGFsMFFWa2c1MElGZzZEd2dmNVNMWllJeG12aHZ5TXFGcWJ1?=
 =?utf-8?B?UjIydDNpMkliSzNML1YvOEZGVC91RUgrQUZhWnZ4aHRQWnNJSElxTlpVdjAw?=
 =?utf-8?B?elRCSzdER21GeEtpNXo4ZE94NzdPeGNOSngxNjE0aXF1WmJPRllRY1BNa1Vj?=
 =?utf-8?B?VUFERThyNGVlYmEvczZ5V2ZVdnNzOG1pdXdxZVdZRERtOUZtZjZHcW5BWVlu?=
 =?utf-8?B?bDZNRmtpSUhiWS9kdXVueDlmNlpuenBYWGtYKy9VTXFhRkVWM1pGTXlBOGhj?=
 =?utf-8?B?R2g4L3ZXaUY1Ni9FalYyMUJzbUw2L0RjdU83VUxwZllucHIvRzQ5SHF5SEsv?=
 =?utf-8?B?NHpNbVF3VUQzZmZyakJ5cHFHTGcrekVObjJ0b2RYVmVlT1FCOFdnU2RvMnhE?=
 =?utf-8?B?aU52Q2lHc05vZ0dNbUNyWmhSKytaZDJHTk5XMTB2SC9ZcWlyUDFTMUZ3b1Fa?=
 =?utf-8?B?YjR4K0ZMcVFHaWd6RTdPZWw2cXlSYWtqcXZzdzl1ZzNZb1FFdGJMY1Q1Tlcr?=
 =?utf-8?B?d3RqSlFzZkdocUowaGJoU2ZLMjFiNWhwSm80VTRYYjFFUnZPTTJvekZMQk0r?=
 =?utf-8?B?S2lvLythRkc1d3FpWGhFRDU1MG9PeFdHSURZdlIwVXFQQUNzVVBUYjFRdTlt?=
 =?utf-8?B?NlR5SmJIUjhNVlhHK3lmOURTSG5XMUhGVFZTV2o1ZDVCWlBiMGdpMEVlTXdz?=
 =?utf-8?B?ZnNBWG9ibDlEbFhYZTQ1SG5kRHVpTml2UWNFSzJiRWJOWEhBS0ZLMXJEQkhG?=
 =?utf-8?B?NDdFT2xIbUpUelVieXhLdi9MbWxHdGJRaTliMkdRR1BzS0RiWWs4T0o4NjFS?=
 =?utf-8?B?Um5VTlQ0OGNaajhVbDVlS2R4ZkZEa0lveHBCZy9PVzY0SVBXLzBYOUgvSnVS?=
 =?utf-8?B?dXlVdCtkNWJDQy9maitOdFkvRFN0dEhJS2x0eDhJTEE5Qnp1cHRRVWpDbFNx?=
 =?utf-8?B?UW0xbGQrL0FtZVVOWFcrMkFBTE9XV3JRY0lQendQdkRvZDVyTHRIdXBQYmE5?=
 =?utf-8?B?anJaRE1TMUVOajU0V0l4ZDA2aWNiY1RHK252V2ZiOUpkOVFMYjdaSlo3VGhF?=
 =?utf-8?B?all3Y1lXMDJrQVAyMVZZUEptZDd3SzNmTlM2TSt4MGE3ZTl0Y2E2eWU4ajBB?=
 =?utf-8?B?WnY5a1BJTDZVNWYwRlJqSndiWEkvVHRFQ1ZOcVdodnNqQTlITGNYMUtLY21i?=
 =?utf-8?B?RDZxSnc1TkUxVXh1Zk8wcmFzMjFvRlp3dVU1ZlMrc2ZsWHBDb0VORldudzdm?=
 =?utf-8?B?RTlmbG5aSE5yWFBnNVBPMjR3UDREQjNXNGRkcnBaTmJlQytwRjhVNFFTdXlP?=
 =?utf-8?B?cCttUVE3QmY3ZHhGekxBNUVIN2dYRkIvTkN6clNrdUZ5SXhlNGxqTmptWnIy?=
 =?utf-8?B?Y29xMEU4eDVYTHJXR1FuYitpT0xmT1BjV0FIR2Y4TWpFM0F4ZWtUazFkQTh5?=
 =?utf-8?B?WGwwTExQYjVNa1pHSXU0YysyVkVhTnl3aGZxMW91RDVXdlo3VUtpN3lkMVc2?=
 =?utf-8?B?aWI4MUY0YkJXdXVha253QmwwQk1mbnowRldqelJ1NC9YbnNQSWdETUU1Y0Fo?=
 =?utf-8?B?SjE3RWd0eDNwcG1STDBtU3cxUGFpaGkwT3JtRSt6bURzbjBuWnBsTjMvZjVN?=
 =?utf-8?B?NDdyTm5IRG5JSTZHZjVWTjRGY3lULzl4dU10Wm1sOTNiemNUNm9NL2wvNnA2?=
 =?utf-8?B?RUlnUXFZWFh4T3N0cGN1ZUx6aEthc1hUSDFsd3hzZE9xd0wrbjd3L2Q3WlVL?=
 =?utf-8?Q?dypms1?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:59:34.2978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46db1017-ab51-4f09-0824-08dddf203ee2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 12:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222107

T24gMTUgQXVnIDIwMjUsIGF0IDE4OjA1LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IE5WRCB0cmFja3MgdGhpcyBDVkUgYXMgIlVwIHRvIChleGNsdWRpbmcpIDIwMjUt
MDYtMzAiDQo+ICh3aGljaCBpcyBmaXggY29tbWl0IGRhdGUsIG5vdCBkcGtnIHZlcnNpb24pDQoN
CkhhdmUgeW91IHRvbGQgdGhlIE5WRCBDUEUgbWFpbnRhaW5lcnMgYWJvdXQgdGhpcz8gSW4gbXkg
ZXhwZXJpZW5jZSB0aGV54oCZdmUgYmVlbiBxdWl0ZSBnb29kIGF0IHVwZGF0aW5nIENQRXMgbGlr
ZSB0aGlzLg0KDQpSb3Nz

