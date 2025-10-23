Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE8ACCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:17:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.web10.18694.1761221860650894240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aYsckCOY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aYsckCOY;
 spf=pass (domain: arm.com, ip: 40.107.159.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X5HQQlf+hbKFFDnfrT/Ci+KlYROPAZvC/x6uFs0m7n5wW/DNts+Pf8rTbZHGf0316gDdgzAlbf4lkfVxFnrgGrpAef8Sqvwzp+oejOw3q0Cz40IKLiZVPn1cWbaMQqUD+6kErI+vjieq/1o5/oJog6fFKPp/zi4yxQ600nLHajXqBrkYjxEw5p37PP8TLOvvb2aBwUT/eS59hxCHTwXifGwQVvA93t3VwMxHDUDlAM5cfOvup+Dipc+3UHY23WSBbL49G284XLGv+U2XB7vJbh7qN2uisr/GPaZcYTKSxx/Y9PvPcRUi+E16sDfrkcO16LFhpc0mreHs2wK4nCK34w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5uLe7KkZdyTxcotp7TssT1kK4GG4zcDSYPaGK2eBVU=;
 b=jH90EQ1tLjFPox8XI0vn2IGyN6WVAfblZVFUCHiRGEZC1xUzkDa9NsIVcKus4NFe8big2P56dP1JmWAymmvXrOLG3SN4f4pqIpdTu0//Dv6JfYXfR137BPcqQJiaqbRlhKkiVXzsCzGpRSNcQdsOUmuFc2ijiA2mIa4zakpPBty2gQK++UCHx+wjlxsUWVywqDMfL6XDewo26Ev2Sm710pmInCfWCr4yKMhUt7hFZlVHE5Tg7wgaOqlxAKnGttFaVh748FJNewtYQomfIMJf0XKARotBFp1g+tT5kDj+C3A5r3vX7y5xgmD0P/wX5JjAx3f/581N2ZP+Y3pATBwlWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5uLe7KkZdyTxcotp7TssT1kK4GG4zcDSYPaGK2eBVU=;
 b=aYsckCOYp/36KKhHIPw4M7TfeKmyKp+EoQ28eg8o1NLsm8WINInwlbLyc16eqiAjFhDECOYeTQiQ27OD005wIWygOmtQxsuXLObvhbZOwTN/SrA+faV7BU6LA6abpu4/lPwR8yLOXbhdSLRAWG69NxbwjLJ/gDGmGUSiM7fqakM=
Received: from DUZP191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::9) by
 AM7PR08MB5366.eurprd08.prod.outlook.com (2603:10a6:20b:10b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Thu, 23 Oct
 2025 12:17:36 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::78) by DUZP191CA0066.outlook.office365.com
 (2603:10a6:10:4fa::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 12:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Thu, 23 Oct 2025 12:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op96uoB2871QlduuOMw5+5OciQ0O0tr2K8cD9elYlvinZmTIlPMbFvzWtDnxlxIIAK2vUsgmrVteTVtAI+Hl/+ic29NZpP/NXb2vP1JxhD03IB8UXzkOnd1G01PfqxjNx19w+HUlEdiEHUIMzYSDkny2tpjzA0Nr1nt5rWu9JvfryvlQEb0xcLWy7CGMq0qHk9uC1tP1UwthFGKoF/xyeZGSETms6Y20n3foKn9NwwyTbMKQMwObz/jOaeZKuTgek6G1HL6oarKY6wP3jUlOKiAuVcZZAcF/z/ZXV8xLtGR6kJQ6iGohx0k1xpaoPVZG4kzZ687C95izZ2GkHpk4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5uLe7KkZdyTxcotp7TssT1kK4GG4zcDSYPaGK2eBVU=;
 b=miAGj0ksV2jxuatMEvXmswxO7qVBPiCK9NFFxUuLD4Cbtr17NizaLSdbWbd6j1bTqzE85j01cygu85fx02tIsdnUZ+s2ZnsQ09x/AVP3OvZ1gQk/N1WFPrYEGR3hckrZiQY83b1GA9WPAvstwyM+0Hld5pawuJBucGd1TdEu3oJ9fbzXp44NDGQD6aoyAGVGT/LiD5s3M4y3fJYOMJ+qd+OGvpgXJrhWt+KA74+DpJqati6QEbPaVFt0FRrkJkMRrs0jkJiZJk0aCpgXDJwZKELqKdv+P7er04ubD1OiguTj/sHvQ1BqrRLDaCcYzj8cdpTKsMktG3npvwOFc4Yovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5uLe7KkZdyTxcotp7TssT1kK4GG4zcDSYPaGK2eBVU=;
 b=aYsckCOYp/36KKhHIPw4M7TfeKmyKp+EoQ28eg8o1NLsm8WINInwlbLyc16eqiAjFhDECOYeTQiQ27OD005wIWygOmtQxsuXLObvhbZOwTN/SrA+faV7BU6LA6abpu4/lPwR8yLOXbhdSLRAWG69NxbwjLJ/gDGmGUSiM7fqakM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8878.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:17:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:16:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Always use gcc for native
 compiler
Thread-Topic: [OE-core] [PATCH 5/5] elfutils: Always use gcc for native
 compiler
Thread-Index: AQHcQxIBoIwkl7/clk6rGFE2/loXEbTPp6sA
Date: Thu, 23 Oct 2025 12:16:59 +0000
Message-ID: <F47FB95C-77CA-46C7-925D-DC1BB0C078A2@arm.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
 <20251022050810.1572184-5-raj.khem@gmail.com>
In-Reply-To: <20251022050810.1572184-5-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8878:EE_|DU6PEPF0000A7E2:EE_|AM7PR08MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 49474b70-9b21-403e-01ee-08de122e2659
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dHduYlBBUEdVWDdjeTZyRlNOL2VIQ041WUg4Ky80Wk9RSHNJQzFjem5tc1Y0?=
 =?utf-8?B?VGdJOXcwTzZBSkQwenNOKzFpV040cHFDNVkzSUFUZzcxa0Ezb2h5MnczV0Zm?=
 =?utf-8?B?OVhyYVBTc1Exd2dwMWJUSUpLWkpjYjBLOENFTCtyL2ZQMVhYTWxvZjRhdGVD?=
 =?utf-8?B?d2hCV1h0bHNyZzdjMWRNeEFXQnNuVVZKNmIwdUFwcHpDZjJZU0hSWUNPbkRQ?=
 =?utf-8?B?Z1NCMFN4Q2xtTnpKZmI3N3VFd2hPKytCRTJJOUMwNWVaSmJNMWhxOFZHUTRV?=
 =?utf-8?B?MFR4enY2YXF6RHIxY2RwSjRwUVVDM1E1dkxlYWVISGlBYS9POENVcTF0czJs?=
 =?utf-8?B?aEMvaUtDOHJxWCt2WFJGUndlZXYvamZoR3N5elhRcTU5R3F5MlVXbjBSTGJU?=
 =?utf-8?B?TTFBNGdtR3poVEt2VGZ0VVU2NVVmMUJuUHMzUnRVVXJ1S0lpakM2TkNlSUs4?=
 =?utf-8?B?WTFFWENTQXkwSHFDdlZ4NWR1UHpCb3cvdkptbXFsTUxBazhNVWw5Z1hPTFRU?=
 =?utf-8?B?T0hjZnNHZWRSQjFDbG9UVTVrNTkybXNiTEhtdzBOei85OE0zOU53MlE1eDFK?=
 =?utf-8?B?MkwxRHJudmZCVUh2YnJncEFwcU1COVdFNDJTblJLOENVMUZrR2RWZFVOdVdE?=
 =?utf-8?B?QW1jVFBwQWZkMkRSNU52NWxKNG1EMGRhVWZwa1BLbHc0RmVpOVV0TXhTWXR4?=
 =?utf-8?B?ZWx2akJITXlXR2hNVDBZcVl0UVNIQVp6djUxK0pyR3ZuM1R4ek9sdjAzODc2?=
 =?utf-8?B?T1hiWG8valVWSENBdzlYTFFqZ2I1K2Q5RHJwUWsvQ08zQUMyeSsvVzdCTkY3?=
 =?utf-8?B?ZlMzV3MzWDY5YnUzL09raGpwN1lMTFpMeTZhTEw4TGZVay9RdDl6eVRMZCtH?=
 =?utf-8?B?ZmFBU3RKd3V1MThUWGd3eGtFQU1MTUpZaWlLVkQzSzdvWWNDUWFQdHJUMlZX?=
 =?utf-8?B?MFZOM3ZSbWZBdTRJTmx2bkVxME5kZldDYTYrWGxTOUIvd0lyQVdleGtPbUZG?=
 =?utf-8?B?a0x2dVJzSXNCOGhjMFR4bGtuYVFVZDV5SWlwVFIxeE5pMnlpSWM3ZTJaaEpy?=
 =?utf-8?B?Q3Y3VmV1R3dMTm1WRndScjIraENUZ3VKNCtkWGpjWWZHSkJSYytFN2dqalda?=
 =?utf-8?B?N2tueHVKQTcwTU5oZm05K1lvcGpMTmx5dVI0QXJiWXg3bkUzdjRIaDVlVkZi?=
 =?utf-8?B?bnlMK2IyaHZKRTlqZmJZYndTcWpLRUo4anZjTjc5VUkrcDI5c0Z0eFBReXdr?=
 =?utf-8?B?UzVocTFDWVpiTFpjeG5QS2o1OGFJWFN4QnJBVlZrMCtOOHZQRXRROE1WUDdJ?=
 =?utf-8?B?WnA2cnp0NllWUXc1OGI5RkhjZzJrMDNoVTVOMmpURUNtdGtqcEMwRUVkM2tz?=
 =?utf-8?B?aWlOYkdVU2prUzNjMmxZa3ZsUnFhZVFIcFhvM2dKYUJFbU5SMWVaVHlCM01T?=
 =?utf-8?B?OE1FS25jVVgwQ2ZZNCtyV1FZZG1YNlloYkJhanJlb21ZSzFNYVF0dGdDeUVN?=
 =?utf-8?B?S09zK1AzOTRXL1lmNTVxMTlLMG1XUEZWZUlyV2dTRHpoN1oxeTh5UURGUjBP?=
 =?utf-8?B?U040cnZrVGoyR0cxZjZyWmY1NU1aT1ZreG40aEdTcmpUMHoxZlByb2cwRGo2?=
 =?utf-8?B?U05yQTk5TWJzdXJwQ1N3ZlJ4UERjajg3SmZIODJCSk5MaWpCaVVwRDJLSmMr?=
 =?utf-8?B?YUlodlFFRDUzQyt0bytFaWF4ZHJFTjFndEtiRzlTTjJCblBuTmwzZXBTc1dm?=
 =?utf-8?B?QzNIc2VaaTFXRkhvNEtiOElQNERBVElsK21VOE5raUJOWHpXZklOQnNlMmRj?=
 =?utf-8?B?VzRlblVKY2JGU1FENVQ5K1VvNzlna1R6SGFaVjFtbXh5K1F6NHZlSHN5cWtn?=
 =?utf-8?B?eWFQQmI0c055TGtqOGtGOHFCdGhDTlJKeU4wUzBKbnEweXlNVG0yTk5FVHpZ?=
 =?utf-8?B?WFlGNHVKMVkvL2hBLzE4dkJkRzRTNlF1KzlCWmZnTDFNczUzU3g0anlzM3Vp?=
 =?utf-8?B?cjRmazhxaWk0SE9HV0FUZ0xGTVdJTGNES3EzdDFnOGRKMFFWZFhIOVhiaSs2?=
 =?utf-8?Q?XTgOT+?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <36E709EE5321F147B7F2D1E9266AA453@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95e898c1-d43b-4d60-b5ab-08de122e10c6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjhMQmNkTjczY0dMY1ZZUFRKdE93SFN6R3pXZFRYWXAwUkNDQVZLTjBhcEJ1?=
 =?utf-8?B?eGJ4eEJoMFhDSGRQbkVENU0xVzhzZHYvQStmcm9JRWRrTEozQ3EyVWtSekh5?=
 =?utf-8?B?UmFwaUFzN3M3SXpTTUNyOUZkTGhqUzQ3TVJzUEdWUGlLeE1tRUdVdDM5VzR0?=
 =?utf-8?B?amg5RXQydktTN2M1VlNZMVhTTlV3SVVxKzA5TnJMMjZjenlQNU5hZHFIQmZQ?=
 =?utf-8?B?Q3J2b0NqWVFSUTVlWXFpMU5lOEFwRi9acmJHVm9MZnkrYVhkVytmQkMrSU5F?=
 =?utf-8?B?RGpRZ2NZaHg5N3YySjl3SEZZZjJQS2RKZG5VYzMvU0pOanlhTVRKV3Q4enpT?=
 =?utf-8?B?cVdzenBOM0Z2NXZPMW1rWUlGeTJibXlkT1lCcWNYdUdweTNWZnB3UnpHUktl?=
 =?utf-8?B?RXlxOWV5T3dkM1k3WTZjSS9KMTVMYjdEUzFDdEwvdU82MjBRNnpyTU93R2Zs?=
 =?utf-8?B?c3BHeStjaHIreUlLTjhZWDFtSjFITDFHRytrTWxMbDdWTnh5Q2NiTWRMOGtI?=
 =?utf-8?B?WlJ3R2l0ajRiRllqRjA0akFLUzhBOG0yTFlmdk9SbDFjUWY3NlVtN1d6M0pn?=
 =?utf-8?B?VGIxRnRwcU11YWRyWUJORlp5WGk5M1M2bmdhVUIweWFKa3RuN00wQXZkSGtE?=
 =?utf-8?B?SGtWQkN2R1lsdE15UU5WZDFDSkFZUkR5c0I2TFlxQnpySGp3V0s3bWR1NXAv?=
 =?utf-8?B?amFnVnozOHVpZjBrdUhqQmluTjFkbDJkUHFzcHE1a0pVKzlLSzBQQzYwYXZl?=
 =?utf-8?B?TXdab2t6dm45MEh5bVFuY3lFc3NmWU1MVk5tN2FoRDZyYWgzNWlxblk0R25i?=
 =?utf-8?B?WHpXOXhLMkt6bFFHYWdqaytIMkF5YXRTbTdVUmFXeXI0NzhYMUx0SXFzQjVE?=
 =?utf-8?B?dHlkUS9Ud1Vmd05MYWF0YzI0bjgyU250ZDFqOHQ1aGRDanpRdUMzckpmUkVB?=
 =?utf-8?B?S0tZZVM4dWpOOU1jOGtkNFpSSTZmV2VzeS9hME16V1ZSYUtRZm1RSjhhdFc4?=
 =?utf-8?B?RXFaR0V6YWJjaFN5VzU4a2UxSXB2V3ltVVgrd25aTGFPaXJ6K1pCRjA5dHpD?=
 =?utf-8?B?S1pqTXBUQjRBR1docDAzcC9Qc0tlTHBoNmszb1hqYVlmYlVFWlptdGhjWmJo?=
 =?utf-8?B?RE9kNFU1WnRvblQ4QUpLSjNpLzRZQ204ZUpJUCtBaVBFNlVlbFFwRjFnMDRI?=
 =?utf-8?B?cEk1blhEaVRmUCtSdWw0VWVlQXdJMGlMMWFlWmRTYStTZ05Tb0g2Z29yRWZK?=
 =?utf-8?B?Tmx3cE96NDJlR2FIZWg1SWtVUExIY1ovU2FqWFRHU2t5dzdhaWt0ZTRYZ0Jy?=
 =?utf-8?B?TW5jZzBDVXpRZ0I1QXBZQ2s0NytWNFFKUzB3akVLTWZKUFQ5NUlQK1J5UGxE?=
 =?utf-8?B?cUlzd0kvdnJiZ0lzV1hVc2QySVdKeHdSM1VMbkZTTEJycWlRRmk3VStHcFVt?=
 =?utf-8?B?bUN2aUg4eUNSaWY4eHgxT1pWdi9LYzR2cVhweUtFM1JTZkdFVFJKTTFGRTZL?=
 =?utf-8?B?V3lyZW1BeERudVlUdzFjQlZ3M0JjS252eTM5aUEvODZVazBxWDJNL0l5djk2?=
 =?utf-8?B?SHk3d29aZ2RsQlV4NXkwS09xUVBQWmVzbi9PVXFDdlZOakEyOFlOMVVIY3dY?=
 =?utf-8?B?YndKQ25oZjlXM0VnaDZDVGUrS2dodkhIcE1PcldmWFprUG00UEh3TWtmQitV?=
 =?utf-8?B?a2hzbjFZMGdBTXNiMkh3Z2ZEa0hlM201YXc2aDZSR2oxd29oR1dFd044bUkr?=
 =?utf-8?B?OUVUdHYzZ2dIVW0wM0xIMlV4MFdxUkVHVmN5ZXJLNzAzcSs5eHlWc2UydExI?=
 =?utf-8?B?OXJyUUZFRWVZTHIzQm5BU1NXVXdIMnF1ZU4vZTNvbU1GdEJzUDdTVmFFRGEy?=
 =?utf-8?B?TWdmSVhIakRoUXBLcjNZUlpiRkJHclR6Q3lPcGJkRHV0cE1hTTZmQWUrc1RS?=
 =?utf-8?B?TWs0YU9GallFNGZ0ODdRdlM0UG9zUkk1ZUs2VnFsL2szS2tCZ0dEQVlrRW5a?=
 =?utf-8?B?aFdKR2hsOTdxTFVwQytWbnlXWm83RWtRQUFCUUxteXdPcE5WUDB4aU5BdGNN?=
 =?utf-8?B?bWpvNU1vVXNIT29PdWdXclZNRDdydVM0WlBLeFVnY1hiWDh0SkZSN3ZCekZV?=
 =?utf-8?Q?if80=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:17:35.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49474b70-9b21-403e-01ee-08de122e2659
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225251

T24gMjIgT2N0IDIwMjUsIGF0IDA2OjA4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArVE9PTENIQUlOX05BVElWRSA9IOKAnGdjY+KAnQ0KDQpDYW4geW91IGFkZCBhIGNvbW1lbnQg
c2hvd2luZyB3aGF0IHRoZSBlcnJvciBpcyBzbyB0aGF0IHdlIGNhbiB0ZXN0IGl0IGluIHRoZSBm
dXR1cmU/DQoNClJvc3M=

