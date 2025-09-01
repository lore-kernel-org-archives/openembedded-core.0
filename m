Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30190CA1000
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 18:45:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web11.59619.1756752331043753680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 11:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VIbMp2zu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VIbMp2zu;
 spf=pass (domain: arm.com, ip: 52.101.66.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CvPLScVXK6OsB3ks+v0bdrogin/hhAnmc/sHFz8ZDqdbDajoZ74jGwplyrPRR4v+QZ/wSzKbmS5y//LTcaVoNKGuHp3HApuegOyw0zwW83CjZa6BV9y6LMZ4DymZAy0PoVLiDXqggnHaqFFGElz4PbrkOqs3KjsRn5FVA3KNm3o/fXvFfS2toXWzOrV8yGed0PGJX1P52HsuDfK0IbXESc+mXfhgBL5X9evg97OWdCwozR0TBaqQ7M1cqv46zWkm7dvWaq3Su0thUib3ABaLUQ1SvNeFhsqmw5RoMz/EBhxAr+eHA2LjkKuhsQq/KbRr7yS1ejFDy4doeEp2Tf6VNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nw2MFQzlQGXMWDAHT7a0KUnWsUy2ifpmA8S4dlaEG8=;
 b=f9tzmCa6GHZfzOQXQFNjz5+NQF7w2l42S3Naml0z7bC9Vr2y9Vcp43NzQwE9qrPDZW+Pr2eAVMM2Bw8WYZwrShDEExIZcGriMhkx4d9BhvbPM4XDfTKQ1MCSDDsuPGynS3UNn3oVWVFkshcjWgJ/0KPQ3FFoSTkXWNshXSD8g6JCRo6ZGgg0PS/669h7MiIG+2ERshj/t2EBWRTOEKbHloaAESOF4TBFtvASXV8NgpAeRHA5kd/DITL0+ynzsH0lS/iJFCuc6D5Iy1qWU+SO07XEBq2RSvERwlYg19TGDNB8WIkkn49xE4AzWTCUtx0MSdXLqNGqbj02YK99olQg8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nw2MFQzlQGXMWDAHT7a0KUnWsUy2ifpmA8S4dlaEG8=;
 b=VIbMp2zuQCF4v0/tDW6yGzIhSNQwcBl/qLRInS8nO2zrW3cn2Z3iOeT7GF34yVRd3ENgPksJw+cxG09k120cOBEG6eQvXVh7DPRWUDKAZQKDUvN2w2f8n5WXKd+7/+fv5FMR1ykGAKuA+k14WWfIt5opizRzefeneJI86Fu2d8o=
Received: from DU7P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::18)
 by GVXPR08MB10640.eurprd08.prod.outlook.com (2603:10a6:150:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 18:45:22 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::aa) by DU7P194CA0012.outlook.office365.com
 (2603:10a6:10:553::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 18:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14 via
 Frontend Transport; Mon, 1 Sep 2025 18:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlfUYOIcTfxava2DEfFCPwJ8rvpemDvOX6cRRHkxP22JtIfbuajBBSpv+rQ0IOTNl3e03XegUEt/L5ZmydAO40E2E38rtNF3Sai/mNmZByPL1D3rdNCDkD5XXpzCFeGYQsb6CderpxNU3Imn1N/BWBdkBw2yKs+LjEtg3bSycda75lSb0vCVNUmpvch+pnLse6JjWnc2T8zZFWW8IwTgCYMbiYSGnKu+wJZYkpHaeCoEgqVN+fLWybtr+qnwmd+o1g/sSHXsogJrSwJzIibPC7K7qjrpUQ/Eau4NrFXhLioh88+tJ6fUHAjA7JaUfaaqrHOT9+vrWUZwNjeDHOcAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nw2MFQzlQGXMWDAHT7a0KUnWsUy2ifpmA8S4dlaEG8=;
 b=Nl8jmh7vrdnnN6fLEmbckYfIJ2sBwPcUIlSY6si69/H4hcPqumOJUeWETMteyEgiU5gBw6ZhPuU1DtA+QGNsqOeGZ67zXKB/eesX0aJo18L3t3SS1XWO0RwRSy7Vp7XYdGGG7R1MDDOpuPNSwtgfY6vDheAGB/OeZTGXShjW99IsZwNhxm8YzHcOqnoEvPEkNknQwY/b/9hSKg6MlnnVbRaCmudJYDyljGYV0O6qrEx62f/3BY0EAU+4/Mt3qDM0iQfvcJrMVbI+oF+FBTZ64bKvhl9JUtiWLuf3Y3Wa4AdiSn44/0GEoRZZaHDRNJJv9IGjLO0ExFWvdfH2GkZBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nw2MFQzlQGXMWDAHT7a0KUnWsUy2ifpmA8S4dlaEG8=;
 b=VIbMp2zuQCF4v0/tDW6yGzIhSNQwcBl/qLRInS8nO2zrW3cn2Z3iOeT7GF34yVRd3ENgPksJw+cxG09k120cOBEG6eQvXVh7DPRWUDKAZQKDUvN2w2f8n5WXKd+7/+fv5FMR1ykGAKuA+k14WWfIt5opizRzefeneJI86Fu2d8o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 18:44:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 18:44:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jon Mason <Jon.Mason@arm.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: remove setting of mem on kernel
 command line for certain systems
Thread-Topic: [OE-core] [PATCH 1/2] runqemu: remove setting of mem on kernel
 command line for certain systems
Thread-Index: AQHcF/x1NAt/UMg0bUqqvMVeVrPM8rR+sPaA
Date: Mon, 1 Sep 2025 18:44:47 +0000
Message-ID: <8F25672B-4A67-4E8B-AA89-842439E5D228@arm.com>
References: <20250828091630.82819-1-jon.mason@arm.com>
In-Reply-To: <20250828091630.82819-1-jon.mason@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9313:EE_|DU6PEPF0000A7E1:EE_|GVXPR08MB10640:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a34115c-dca8-4579-ac97-08dde987b468
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S0RzaVlZZmtWcmJOdGh3WUtlN3lNTjBtcll2MEx2ZjhQQy9MeFhQc3I4S3JY?=
 =?utf-8?B?Rk5pcWFXaytSa2c5WFpTQnRaRENja2EwQ2ZoRnEyTG1Xa1l4dUNWZ2FPdUxP?=
 =?utf-8?B?N3FvUGF4a2lERnRFdVlFUEJUUW9YaVVQZkN2blg2Q0hsak9JTFl4eUx4Ym12?=
 =?utf-8?B?eHFNT3FBT1c1Nk5icGhQUXlsb1JySFp3NUIrQkxHZmtCTHp6bytqZEhUek8y?=
 =?utf-8?B?VzQvKzFBTmpseTJuNkprRXJUK3BIUGg3c3lVdVo0QWxoZkovQWYxVFlWZHUz?=
 =?utf-8?B?QzNJOEUycXgrZVU1WUpGV0NDbDRhbFJJcW9vQmNmRTFYSjJxZE5yRmZSLzgw?=
 =?utf-8?B?VEVQUjAxdDZ6UGlEZjdpT2VnT2toREpqM09FUUY4bEF5VnlXOWx5ZUwzNnJX?=
 =?utf-8?B?Z1VwaEw3ampDaGxFcTJqQkJIcTczK1NFQnlhQTRXMDBlNEZQZXRUMFVGUWNW?=
 =?utf-8?B?Y0l2WkZWc0N0UkFzVGZmdldKbE5GU3BWN2VPa0RxaG0va0NVR1c0R3N3NkVp?=
 =?utf-8?B?dXRPVWpnZVFkVnJRVDdDazdMZjBlSmdtT3RQcnRWa1BXb1ByOGM0QUxjVUtB?=
 =?utf-8?B?OXM2eHg3Y2MrWTM5YkpCWkhCcGhreTBBOHBidm9QalBiQ3E3VXVKQzBicjJn?=
 =?utf-8?B?TitJZTVQb3VqdGNMNDNjNTZJb3UvSFFqb2ttZGQrb1ZJbmY0aUlxeUZTRmpO?=
 =?utf-8?B?dzhKazV3Z3hTK0lQV2RCTDdmb1J2TmJ5VTc1Y0pjcTVDMHArREVyZjJhakZD?=
 =?utf-8?B?cGc1ZXgxN3ZJN3JuWm0vNXozUHBpZXcrQnVTeEJpNVNJVmk5K2dSZUpCMGpm?=
 =?utf-8?B?WE5VbkMxY3hLZjdlWnplaTF5aGliTmZUa1krb0pvekhOMXNnS0NDTDgzL0Vm?=
 =?utf-8?B?NlV2VWxQaTh4WDRiWUEyYTZzRUkxL0Z2TVgzeWRTM3lneStQbnVJWTlEZ2JB?=
 =?utf-8?B?dmlKWElXQy80T1QyaTk3Znpud2k2YlA5U0xQZWc4QlZqcFFzYy9LcFd0aW91?=
 =?utf-8?B?L0NJZEVCUm16V0F5UUd0RHlDTU5tZk5KQWtFS2RGTUxRVElvME0zcUR0LzRB?=
 =?utf-8?B?eVE0dWlUbHNpTzJoNmxnaTJFVzZBZEpYcDAxcis5UjdzaXJveUxId3lCakl0?=
 =?utf-8?B?Rm16dXY3eGo5UTA0eXoreUxYb0NYVFJxV3JaZHp6dmFLUkVRYjRXOUVPamxa?=
 =?utf-8?B?Ry9MSnBiRzY0eTJ5YjdDT3JESGVmNE4zVWpjcnBmazRyZU5GWWNMWEtBWWVX?=
 =?utf-8?B?MVlIU09LWmszNjU0YjgzYVBkbk12ZTB5bU8zVWl3ZEk5NXR1Y1dYYk1UcitT?=
 =?utf-8?B?V2wvcUVzVXo2TUEvanQwK0FSRmRBVjJzNGl1bEZ3Y09SblpKSnBsYmdKTkg2?=
 =?utf-8?B?dVI0SnMxVVRIZ3VoYWRzcWZzNktNZ2VOV0FTZVh4TGlSWmNkUUtzcEh4aGdG?=
 =?utf-8?B?dWF5aThnM0h4b1JwQ1hIVVpteG4walNFVzVaczhLclFsUGFRWTBlMEFrbTUz?=
 =?utf-8?B?N2crbmVxWDljaDA2RTQ4Wk9zdGVVYU1lazdGMjJYaFZjOXkwS2sySW5oQ1BJ?=
 =?utf-8?B?dXozaG9GaWtIR2w1UlhPZzBNWitTOTBXeWRSZXVWOFJqWGNYMFhBblB5aG1m?=
 =?utf-8?B?N203WkFxa2JneDZjcjhIdjE3dUNoRE9PM2dsVUY5ak9rbU9veFV3bG94elY0?=
 =?utf-8?B?K2srZ1IybWRCbUhTdVpHaXJXem9SYU9MWVdRU01HVzhNUVJCMERnT0VKaGNu?=
 =?utf-8?B?NjF4ajMwT2M0U08yK2lUK2ZiOVhXcEVnZVhSbWRPZmFBRXArb2xkUVh0cEk5?=
 =?utf-8?B?cFBiekxXT1pyQzJLOHpsMEhacUthMjNEYUREUnNZbmY3ZkllSTE4OU1SbERK?=
 =?utf-8?B?MXI4US9NTmhMN2w3K2oxOTFQNFhQTTM2TmJuVFZOdm5jYUk0REo0aHR1THhv?=
 =?utf-8?B?N3hMWWRCd1Rlbi9kWFJ3VEYxbW9wVXlYNVFyT1Z0dzJQUmRuMDkyaGJGTGp1?=
 =?utf-8?B?bFdocmpjQk9BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F3F94859DA5794590D6BF6ED08A5037@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd838cf8-5de9-49c0-af95-08dde987a088
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTFtMWlQYjY4S2laVU1uM2pmYVJLYSt4T011NnpKVWJNRmJuWnFpcnBBTlpV?=
 =?utf-8?B?T0d3K1JCbHlnZHJ1SFdDN1FIbnVlMG5NaHlwZ3NoQnkwMmtJQmxGa2UwTi9C?=
 =?utf-8?B?WUF3TDF0b1RLMVpXNmtkVUk1eFBnV0JZbmZONUJvcERpR2FSekFiZy9Yc1JP?=
 =?utf-8?B?a1g2dWdCUWs3ckNBVTZNUmJ3MSsrZEgwZmZHcWxLMStiaTBnUi9NWUFvRjhv?=
 =?utf-8?B?VjRhaXZGczVNNHJmcElkcUJTRXBCaEtZYmcybkpZdEd4SHJjR3p0QlYvOUxh?=
 =?utf-8?B?OHo2SFV5M1ROV25lRFhWRlptaDlNZWdMenBEZ25NQlk3MzNjZlZ6MmZMVTMv?=
 =?utf-8?B?RHJqNFhycERBRDd0dEd5WWZrQ0RSOGQ1Wk92R3NZZC9vNE5XTXhnVzVhWm56?=
 =?utf-8?B?akI5ekpUUFYwWHpaVlB1amxISVEycGczNnBZbjh3bEtqdkxzM2NQSXdHRHRq?=
 =?utf-8?B?ZEQxRGhMdmY3ZzVzbytaYWYzSGxZdCtZc2hrY2lLNmJNM09VN0E5SHVOV0hZ?=
 =?utf-8?B?Kzd4YzF5SldWUzg2VmJYWlVDcG5sVHI1MFZUbFJxTFNuamdFditmLy91LzhR?=
 =?utf-8?B?WURobXUzMGtiK3lzVU9FSU5WNkt4d1poajNKblBTWFNFWE92UTRZY1pNcVNi?=
 =?utf-8?B?ZTBoSjRQWGkrbWFUM0xnQlNHVzdPRVlSRDQ2UVRGb2pmNkRUbkZXbnVXVWJa?=
 =?utf-8?B?Y2hOMHpPRzkycS9NYzBJRGtPQ3FqTVhFY1FFMGt2VnZYNmVmRzVUKzVkVyt3?=
 =?utf-8?B?NXoxTHFvMm51VVhqaTVDay84eG9WSkF1T2N6dFFVdTFRc1hrbFhHME9WU28x?=
 =?utf-8?B?bTdVQTFQN1MvLzd5NytzYWpQUGQ4dFB6azl1cjJQMU1ZRDBJZEVQdnAzWXp2?=
 =?utf-8?B?WEFBTkNiQlo4TWxmbWZnYkJDb2hQMmdxSkxHRzMwSnhaK0V4KzFHWjR4dzY2?=
 =?utf-8?B?Zng4NXlzN2FXK0ltZTQxd0pLTlVqNXA2QnFwMXJseVJFaUkvR2J1YjZ6cVVE?=
 =?utf-8?B?WmpGMW5uaGRyUFZUN3RoZDZMS1JSemtGK0JQbDBjTVFZRFJIZTdYSlRCZEgx?=
 =?utf-8?B?SWpBTTRhcGlRbUNsWDBsU1U5WTR0eEJuTHk3OGFqekswTEhISG9ESzFuUlBU?=
 =?utf-8?B?c2J4Y3lhRjMyMy9GR2MrVkxDMjlEMlJhR09yWEdZSGZHRUxLenVxQ1BzYjN5?=
 =?utf-8?B?Z1NiOXl3WDVUZXNpWEhwdDdVN2MwNVBHU0s0bzlJalhEenN1YU9EKzYyZ0NJ?=
 =?utf-8?B?cGw3NURmUXViU2RFbHRPYkNyb2svLytVVjZIMXd1b2hoeUpJd0xXSGF4WG4x?=
 =?utf-8?B?QW56R3h0VDNMK01ZOVlLeFg5L2dCUWN2bHYyYWE5eGZEMnMyQkQvM2Jxemdv?=
 =?utf-8?B?RDBnZUFYWDloUmRGRnhoS3NQUmY3MkJieHZJRktvQ3JwWlNheWZ2QklOQ3BP?=
 =?utf-8?B?VG9DdWtiNWw4aVljbTVEd0xXeEVUR0RVanRqaWNuNjJXcFNwaTUxMEwxM0RE?=
 =?utf-8?B?UFNNUTZFQlBJakFTYjY0WlAvQ0ROeWw5Q0M2SlFEM2tqMkFGMjE5emZNOGQ1?=
 =?utf-8?B?UkhQclVVaVJxNTZNOFBlWmQ3L1I0bXVTcXlkYW1FL3A3Sk1kVkttQTNDNmxY?=
 =?utf-8?B?YkhFaTZ1OTdSUWlYRXViaVU3b09RUFE2SzJiaVR4d3VrOEVIUGhiMUE0a1NB?=
 =?utf-8?B?SjhCU0hsZkVRbnhDMk5Pem0wRllnM3owb0pSUnUyUExZTVd0Nm5GdWRXOWw2?=
 =?utf-8?B?dDZaY3ZyVEUyWWNpektTU0hwdGhmZVlmL3dwS2RJNG9OalJoYUI0dWJCYmtM?=
 =?utf-8?B?QkF3d21ibDNrNnFzSWhGTWM1eFpCS3duRlRabVZxRVFXQ2Zpd2dRbzF0TWtL?=
 =?utf-8?B?N0NEbnl6S2k0WXo5Nnh3UTIzZHkvOWdkRnQrODhUY1RxdjZKRWNndEVyOHh3?=
 =?utf-8?B?YkZ2dDlRQitvNDVPSzkwZVg3MHFMbkoyMXBxa2RjVEovWWo1Wm9zNVRYRzNS?=
 =?utf-8?B?QXF0anN0M0swMytsQUV6WHNSY2NqNzhWQjF0eXFpaEZKWTEva2o1eG5hdXZh?=
 =?utf-8?Q?iXOK9H?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 18:45:21.2728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a34115c-dca8-4579-ac97-08dde987b468
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10640
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222676

T24gMjggQXVnIDIwMjUsIGF0IDEwOjE2LCBKb24gTWFzb24gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGpvbi5tYXNvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gU29tZSBlbXVsYXRlZCBoYXJkd2FyZSB3aWxsIG5vdCBib290IGlmIG1lbSBpcyBzZXQg
b24gdGhlIGtlcm5lbCBjb21tYW5kDQo+IGxpbmUuICBBbHNvLCBpdCBpcyBub3QgbmVjZXNzYXJ5
IGlmIHRoZSBkZXZpY2UgdHJlZSBmaWxlLCBhcyB0aGF0DQo+IF9zaG91bGRfIGhhdmUgdGhlIG1l
bW9yeSBzaXplIHNwZWNpZmllZCBpbiBpdC4gIEFkZCBhIGNoZWNrIGZvciBRQl9EVEINCj4gYW5k
IGRvbid0IHNldCBpdCBpZiBzcGVjaWZpZWQuDQoNCkNhbiB5b3UgZWxhYm9yYXRlIG9uIOKAnHNv
bWXigJ0gc28gdGhpcyBjYW4gYmUgdmVyaWZpZWQgb3IgdGVzdGVkIGluIHRoZSBmdXR1cmU/DQoN
ClJvc3M=

