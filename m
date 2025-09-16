Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B60FCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:40:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.web10.21962.1758033605311414726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qQ1KermA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qQ1KermA;
 spf=pass (domain: arm.com, ip: 40.107.130.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DJJCtTAithx1QXFMrlzWmrk80HsCxZ6w3Vg1nAH6vHnGTNODe+MhHKNZWL5zW3AA95uRyiJf84CVbkHzb1UEHJVELGAQ/NKRP/GSB3c+ymDRjQRD8Pr6ySokyJ9skEVpE7VNy7LiA01DJ00NFOcVi+6AetKrBEBZJITwtnlIU8oLDraG/z5GSdfd0hFJp+7oE9P1wzdJZzx/dHhNSZ+2kQdzJLgQyOVu5I7xH660vsEvYbdf4WXFjS36TBlhoG9ibs82ldg+CNNRRxIwzAvhiJh6PGoCzAz8tHUb2F/QldPedc4J7D4Q9EjEcZ7SZxJgyUmMGhP3a+hYok3HdvJGZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8xtNoZUsh0ga467jW76idXKQ6LjePkkPgAjKY4LHVw=;
 b=pnoW8et3SHOOyIizG2yKrqO9G9UlYSfKbb3cwVgtEjxhsvDBt/qUY+3FhN4UXUGI9iVZAWDsGDoneFtwgXOYpI903dHhm9Hswc1e9Ln/PRdIfa0erh9fGxdkosNyqLYM5a4HXhOh+7hxdsUI7MMGnEAh2FNMlXjRHaZlBK8Xk3bx+yKlZm2wWSVQS6kHYXREx/KLco+fcjEEwWse/lcielcvfITIedpKBbHHMM4oUPWSndR/N08GQ7ro0t96OK8itpgUnbSVb/7CG6lUHxTGL0s4cmzJkk0fEPKc9NTLAJsP2m4qn5sKHCuvZm96ySNguuDeF8VL/Nz6TKo0CJ9OBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8xtNoZUsh0ga467jW76idXKQ6LjePkkPgAjKY4LHVw=;
 b=qQ1KermADGsvfJLa0izqz/XiTB3A0pHJxrK1plGDzkjaeGyLgzesFfVj09ymOBwMWA7rNmtw7uEo1l0Vb5XpPNswmEPLFjrs201iNEnW0IPimnAiPZvfsUVwXwk2/lcuuObkYqheNj/KTdwQ5NIbFeSu2W488YW45mrZL9VqtTk=
Received: from AS4P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::19)
 by DU0PR08MB7787.eurprd08.prod.outlook.com (2603:10a6:10:3b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 14:39:55 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::f3) by AS4P190CA0029.outlook.office365.com
 (2603:10a6:20b:5d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Tue,
 16 Sep 2025 14:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Tue, 16 Sep 2025 14:39:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8S/ZLBysVS3iMm86xW/XdhFzwgpL7rCNDfwrJePZxYLkFfkqCz+UdngFepWGzGPyUcJUB2nrE4y/2JnlY3iVmEQVgmR+5/nYQCpk0BkMidJmug2wg2JyVAh5n1vuEOan2UoDQe6shGKEhoGVH4CUZu2mAXvXA9q0eNVVIBhHcwHi/Fp130F0gUxqaXylrzSbhZ+jVoHp65q+Z6+BCBj0ikw5sWiG7Q8CaSPfZFt9tFof2tSBwopwCKbA01WFTo5LvtU8c1LP4Nszfj1kMwPgWUSXHgpDOwoqkLliNTHMpSmwXI1lEPsVHY/s3GY98/wRtibAXCKNuCeZuHClJXKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8xtNoZUsh0ga467jW76idXKQ6LjePkkPgAjKY4LHVw=;
 b=l1SHsA+gLpgKXzv29XZ3hsOCCzbsmfrwi/gqziAB0nT4CYnYdXa18oN7euEoPcEFGV1SuQcp1iPZD/jtw1dYrBwv2nii2y21mu/6BlAgV9rJfgefvFsxzvgscGmEsAKv13crihTMpUx0qWSu/lbkW5dBPefSs+KhtfEc4v5gA6wVvjw1toIFLjwiCZX/tztcTrJPHXvqPuu5M2r3OEO8l1Zd+n9WUxDcnPdm/Ptan8zS1xH7s65w8bx2FiFUg5pi9mgc3Nw17J9+NAEqAxUbRyczUIEz5l3i20WFNR5eGwIs58QjEZFLUDYmkYcPYsb2d0oER8vSg7hSepPge/z+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8xtNoZUsh0ga467jW76idXKQ6LjePkkPgAjKY4LHVw=;
 b=qQ1KermADGsvfJLa0izqz/XiTB3A0pHJxrK1plGDzkjaeGyLgzesFfVj09ymOBwMWA7rNmtw7uEo1l0Vb5XpPNswmEPLFjrs201iNEnW0IPimnAiPZvfsUVwXwk2/lcuuObkYqheNj/KTdwQ5NIbFeSu2W488YW45mrZL9VqtTk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8354.eurprd08.prod.outlook.com (2603:10a6:150:a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 14:39:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 14:39:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	<randy.macleod@windriver.com>, "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>, "Dora, Sunil Kumar"
	<sunilkumar.dora@windriver.com>, Deepesh Varatharajan
	<deepesh.varatharajan@windriver.com>
Subject: Re: [OE-core] Performance Benchmark: ripgrep Linking Time Comparison
 (GNU ld vs rust-lld)
Thread-Topic: [OE-core] Performance Benchmark: ripgrep Linking Time Comparison
 (GNU ld vs rust-lld)
Thread-Index: AQHcJxSNeSE/DmljJUq1Wqg04upE3LSV4SUA
Date: Tue, 16 Sep 2025 14:39:16 +0000
Message-ID: <9F392464-759A-4B10-803B-38FC9A78AC81@arm.com>
References: <d602b56d-c8a7-4659-b962-d2d00cc9bc5f@windriver.com>
 <268e81f5-2ff6-4e8d-854a-a8faefb1dbd2@windriver.com>
In-Reply-To: <268e81f5-2ff6-4e8d-854a-a8faefb1dbd2@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8354:EE_|AMS0EPF00000198:EE_|DU0PR08MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: efc367de-5a44-4794-170d-08ddf52ee673
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SEFHd0xkRUNCN2JLMktlTkZWNldIMkYxWDErY3BkQWE5NGIxSnd4OTBzdW0z?=
 =?utf-8?B?ZWZ6eFRQcSsrTjhxY1ZFcEZnb0J6NVN0bHZYRGFRNUhCQldOazlsWEg4VWZW?=
 =?utf-8?B?SUI0MmxoYlJUTDlkM2xEUFlxQ0Z5NFg3NENmQ2t0ZnRxUG1ZREw4eU1ialBN?=
 =?utf-8?B?VXpVNWd3WkdybEpQRmMrMUFiRmE3UXRySEpaRldiTlJBcExTbnRja0YxMWRo?=
 =?utf-8?B?cjJobGhCUHV0MlJPSXdlaGVLR0pEdllrdm5KT1l5ekl1dzNUWm1JZWVXa1Az?=
 =?utf-8?B?WmFxSmR3OVNsVmJTMzRBKzJvbnRqODFwZGNMdjVqM2daYzFOalRkTmRsSlNn?=
 =?utf-8?B?T2hUU1F3WEJHcmRxYkk1ajhOKzJSZ2F3dldna2d4NFByVnZobUh3ZXNHaURW?=
 =?utf-8?B?bmFDN1ZIZENvdzdLUzBtZ011WHNETUdBZ0xWNThFdXhnY0l6UXVka1k1dnZn?=
 =?utf-8?B?S0diUzhNWCtUdEVWeVlQVUp0NTdiZlFjTTZGcTJvWWU2QXhDQXVZOVkweWpH?=
 =?utf-8?B?SGJjR2FSaTg3QnBBbXJyaW55bk9GSkkwMldGYXdUT2pQM1RTR0xZZTJGNmJB?=
 =?utf-8?B?MXNtYzlIenBxZ0owSlBycXdqS2dIcVVwYUdxT2p1SFVuZmt6OWJEbnFZTzd1?=
 =?utf-8?B?M1Z4Y1VzZkgxR1N3czhzRjE2cnROWHFyNkh6STdkcHZIRnYyYWdZV3FPK3lx?=
 =?utf-8?B?RE1QVDFrTTE3RjYxdS9sUEZNTHZLK21GMFJ6a0xQYytOYXRlOEhQczlVcy9z?=
 =?utf-8?B?Wm5Hdm5YR3hyVkdQdjRnbC9Vc1Vnek5oOGtFVVdmZkY1cktGdlYyMEN6RTA3?=
 =?utf-8?B?RFlMaXc4ZHg1ZFRtUW0xMStyQVR6TWZHUGFHQ3BRdWxyM2VwWU9mK0ZDd1or?=
 =?utf-8?B?UUNjSTY4bTl0NEthQVdlTzRYdmt2UnB1WEpQOGdxZ3UrZUNETGJSVXUrQjcr?=
 =?utf-8?B?SW0rR2xpQXRmS081ZFQ2ZmF2bzJORCtvK2kycVJFbGVWNkRtelh3UUtxZHJa?=
 =?utf-8?B?RG1lU1BtNlBxcXo5UE9ZM3RvTFBHZUZ5eUhRa1BsYit0cmFwaEk3d251ekpQ?=
 =?utf-8?B?TEdEVmlqK1MvV2Q3Ykg5eER5UjQ5cmlSMFhycGJweFFObklMcHljNTlIcDJa?=
 =?utf-8?B?UHRpcHlPWHZML2FRNFJHcU13TWFyR3daWEI4Wm9vbVE4am5HeGlqTFBlSkZi?=
 =?utf-8?B?ak1KNTlMVXh6bXdKNTBURndsVnpQaUFzTFNoaEFSRWo3SEZoTUd2L1FRb3J3?=
 =?utf-8?B?Z213bXczOXBPY3FUOENWOVF6L3ErSHI5YVdLR0hPZGlvbEtBb0d2bk1aU1pM?=
 =?utf-8?B?QUdvTlF2R1FzNUl1RDgraUhNV1hzdHVrYlpLM2R1NFF3UWRZSmpMNUNOK2NM?=
 =?utf-8?B?TE9oeVdMSktQY1hXYXZIenBsd1hHbGVWVElJbFFhTDRwNHV3ZDM2VUQ2aCsw?=
 =?utf-8?B?Z3hIczY4M0hhb2NNdVlYUVRpakFaNDBaeGF4MGJCbzdLT1V3MW9qd0FKZEc1?=
 =?utf-8?B?L0pXd1g5eGJOTDBTbVNYMGszZG54azZhTlJUUE9ENEVMY3F3ZXFVL1MyY09r?=
 =?utf-8?B?a2dLb3Z0MWVzZlZmSDFDRldlV0VqVWozekJFNjVJQUFJUU1ELzk3R05wcWk0?=
 =?utf-8?B?YUZBRE5GT29GdURHbG16MEJCbjdSdUd2cG96THhNa1QvQVRERXVLejJXdStq?=
 =?utf-8?B?WTZYeG55OEVYMUdyNEh5MkxSRWV1N0QxMk1yMWFrMnNzWkw2Ujc1OTNIQ1Mw?=
 =?utf-8?B?UDBCWW5vT3UxWkU3b2JRQ29SMzFkeHJ3QUpwRjZOWFdmSjJLR3RIaTZCdVIv?=
 =?utf-8?B?bGlaMlVGdkZSRkdhSkhheUI0UGl2Z1dJTGxkcU1BQzhkSDRjTzBOK2ZwdTh1?=
 =?utf-8?B?NW1HYjV3cnVkUStaVkFBU2svTWxLcTBNUEo4dlh1RlYxdWFqQmVSSkJKTXlV?=
 =?utf-8?B?eHYxSDZwUTROUEdrbGd3Wit4Sm1uV0g5ZjFJd1NRS3VFa0NRckRIaWgzV3Iw?=
 =?utf-8?Q?F5ojE5YonCWBewr4cSkBadDWqeeezU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF74235190B4D84AB7A8A9D4D5EA757D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8354
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2a4b0ea0-d161-45b1-ef4d-08ddf52ed04d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlgrVnJ0eDhFakJLcGVPc1JBUW40UmhmZmRENEpHOWo2TXBFbWV6ZTlXUFVF?=
 =?utf-8?B?RmZQYjh3MmhGMXgwNGNEWVV6UkZMMXdOT2daTzZxVTZqTG5XU1p1dEt6MWlk?=
 =?utf-8?B?bnBwOEpiOUo4SysvbkJUcHlCY2JYcG5lZjhUQmFrNWZMVWIvc1c3TnlXRm1F?=
 =?utf-8?B?bmlqdUdOc3dQaVh3M3JiMkdWazNEeXNxOXA3d2FEZFRnNnpYZ2tLWVA4UkR4?=
 =?utf-8?B?bTVpdkZWek9VVnhObUdXeFAwNDlZRVBqeHRZWXZ0dWhKSmY1dlBZRXBnb21L?=
 =?utf-8?B?NHRuUjg1K0tZV0NkSGNiRENLTWNqMkplMnRVQVpJU1ZMQTZZZWVWK3l4ait5?=
 =?utf-8?B?M0pvSGk5Zk5mVU1VbVh1VjdwSGNna2hldlRIOXZKaThjZWZ4dFlpYmIra1Rw?=
 =?utf-8?B?QlJSRy8wTnp1cFAyMHlHaVU3WnAvakJKM3ZMMy9vRy95OVg2SGhhMmN6aGlp?=
 =?utf-8?B?Z0Vtd3N2UGh5UnVTbnl3eWFYSjB6djB2L3JTWFVtSGR2T1BvL3Y5VTlmZytC?=
 =?utf-8?B?OXA2STU2MEhPejFsVmxPV2UyR2RwQmhUVzlVYUU2SzVwYVAvMURZSXY2eXcr?=
 =?utf-8?B?S2RuZ0ZTS3Y5Q0wvUGFNVDlzeGNoRWxhUDR2emZhVy94VlkvR1hqSkxVTTR4?=
 =?utf-8?B?SEdCUUFLYWpubTc4VUtGZ0hEZXFFdG9QZm9Xd3o1RHFVZSsxWXNZdXR1Y0tp?=
 =?utf-8?B?MWViakRHejZQeHV3cEwrNXoxemNxN25kb0NqVmpYaGMyT2NYR01Rd2RiYzU2?=
 =?utf-8?B?T0pyaGdLTEJjcnVLcWhwZ21xanNFZEY0RzFhZ2FJalE1K3JBMU9sNHV3NEpM?=
 =?utf-8?B?QS9Pa2diQjAxUnNXYUNwRU95SmYzMEJjcSsyMUtPNVFKRFVSOE1oTXNvcENM?=
 =?utf-8?B?bDJ0bFV3RGNMbldBaVl6dGdCVkJoY1JKSFlrZndOdS9QaUhTMWdzVjhpalJJ?=
 =?utf-8?B?SUpGdHhBRlZwZzlmQ2JDRlFGeUo2RnRmZmZXTm9yQmZ2MUZweGJqVndwWFV0?=
 =?utf-8?B?M1huL3hnMGNpeFMxNFRvZVJTd2JyUFlRTlkrTDNoUFFQUjdOaC9rcWZaUTY3?=
 =?utf-8?B?Rnd3eFRYVG1sMmhKRU5jTWV6anhsZ0hNa3pkUWpBQ0xXQ2h2V3c3MjBKMXh5?=
 =?utf-8?B?QlZHaGhXM3ZDYytIZ2VUQ3hpMWpXZDVkK3FxSlMvT0VzNTZFaVg3TlFqN3FM?=
 =?utf-8?B?WUZYa2I5YkJTRCtFbHNQU0ptWWRVR2lQTWp5NGl4OTRLNElvTzNFOFp4YVdD?=
 =?utf-8?B?WFRKTURzRWdzUjFqL290a1pFWUt2Y0t6U2Q4VFV2ZExseXRDM053Qk9yaThC?=
 =?utf-8?B?RDZieFNyazZJckVzT0dWMFNDUHk2QkNNYU5zZEVUVmt3QzFaaW1yTGtsRUg2?=
 =?utf-8?B?dVd3Um5uT3h1TWZwUDFwL1RUM1I4bk9NMTF4d3FUN3Fxei9pSzFSTWNoWmJB?=
 =?utf-8?B?K2pMNW1sdHVLczJ5QUMrS2FBVnRoMjlvTXBUYk9rYklJSFljQTFIWkhRTTUw?=
 =?utf-8?B?U21ZbnBHeGdVVWdhNHpHTlNkdTRnc2cxUmhEN3poTlFKdStsc2JoVDJxTWtG?=
 =?utf-8?B?TnJFUHAzaVdYVnhmZThnVUdPUkI0NEVUWHhRTjVjMldvVVE2SFhsNjdJYWZY?=
 =?utf-8?B?RDVLanNkSGpaQVR3TXVmUDNsS1BtNi9QdGFHVldYMFR3aFp6a1ZDaVZZSkFW?=
 =?utf-8?B?azloODc3WEFzN0hjZkc4VkYyakhMU0l3ZzRpL0pSZGFSQ0d0QmhMYlp6QXdJ?=
 =?utf-8?B?R2wxbGhKZCtpcllQMWNjVERzc3Evemxnamw5a05NNGRHcHN0c1VJY2g4Ukp1?=
 =?utf-8?B?REw0YXpadS9LNm1IMWl4UzZWam1DQVlXUVJHMTBGZXJIdGp0cUVwbTlzTmp4?=
 =?utf-8?B?ZnJOTE9UNVdiSWhjSVJ0OTRqMDcwWUc0dHJsWTYxVWJKOHJudTZBVUlaRUNJ?=
 =?utf-8?B?L3dMVktoUytmdmcrNlVQbit0KzhhSmgzQ3k5SzFQc1pBN1NyQUhxYktMRHVG?=
 =?utf-8?B?cUlsQjM5U0lyc3RHNDJyaHdBNEtaK3dSSm1OWDZBS252VGM1ckkwNVZmSUcy?=
 =?utf-8?Q?fr5RGo?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:39:53.9142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc367de-5a44-4794-170d-08ddf52ee673
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223559

T24gMTYgU2VwIDIwMjUsIGF0IDE1OjE2LCBZYXNoIFNoaW5kZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8WWFzaC5TaGluZGU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gQXMgcGFydCBvZiBldmFsdWF0aW9uIG9mIGxpbmtlciBwZXJmb3JtYW5jZSBp
bXByb3ZlbWVudHMgaW4gUnVzdC1iYXNlZCBidWlsZHMsIEkgY29uZHVjdGVkIGEgY29tcGFyYXRp
dmUgYW5hbHlzaXMgb2YgDQo+IEdOVSBsZCBhbmQgcnVzdC1sbGQgdXNpbmcgdGhlIHJpcGdyZXAg
djE0LjEuMSBjcmF0ZS4gDQo+IA0KPiBUaGlzIGFuYWx5c2lzIGZvdW5kIHNpbWlsYXIgcmVkdWN0
aW9uIGluIGxpbmsgdGltZSBvZiB+NXggdnMgfjd4IHJlcG9ydGVkIGluIHRoZSBSdXN0IGJsb2cg
cG9zdCB0aGF0IA0KPiBoaWdobGlnaHRlZCBydXN0LWxsZOKAmXMgaW1wYWN0IG9uIHJlZHVjaW5n
IGxpbmtpbmcgdGltZSBmb3IgcmlwZ3JlcC4NCg0KVmVyeSBpbnRlcmVzdGluZywgdGhhbmtzIFlh
c2guDQoNCklzIOKAmHJ1c3QtbGxk4oCZIGFjdHVhbGx5IGp1c3QgdXBzdHJlYW0gbGxkIGZyb20g
TExWTT8gIFdlIGhhdmUgYSByZWNpcGUgZm9yIHRoYXQsIHNvIGlmIGluIHRoZSBmdXR1cmUgd2Ug
bW92ZSBvdXIgcnVzdCBmcm9tIHJ1c3QtbGx2bS5iYiB0byBsbHZtLmJiIHRoZW4gSSBob3BlIHdl
IGNvdWxkIGp1c3QgdXNlIG91ciBsbGQuYmIgdG9vPw0KDQpDaGVlcnMsDQpSb3Nz

