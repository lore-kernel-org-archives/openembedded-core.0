Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963ADCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 10:51:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.5])
 by mx.groups.io with SMTP id smtpd.web10.40569.1760352701320673972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 03:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hidVFx5Z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hidVFx5Z;
 spf=pass (domain: arm.com, ip: 40.107.162.5, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VtERbZsa/Tx0zdZ59+rW/tNAA/DM5r75GjPXwgooqxdsTnWFWHvGqO8kdkxkPtmoMb/ABBTcXn6JaIx7RExt45Q3A0mZ4JwntQpJL/ywQXd8XY4f8ELzJGIjJehA+dlMT8YN2hbRu/DF1e51eh0i0u7vlcsgoKJrusM8RercwmprSo0nw9E8cjYNPjkvDa4vZFKdKpOPmsiEoLAXbI8Me4NMYuYoyaDWiFVL+mrIkm6RTqZ+YUQdeOyoV1nyQh1wr6noXaKbj+ayLmQRRLBTXGzPPINbb/rs3Xq4lZ3p366jH24DiA6EhTS4H57u06YVpmHRKsYpnFQVtS+1ZjSxNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz8I7IDGhDm6ZXTeywYFKfVTKqVyvzlxZymhyTuqgnU=;
 b=Git3zNzHZ/IIN88cJruU1w50AZ9g41w+iRPx8m233lyzjzWT33aPQajIKa30ZLkB6PNp+LeDWUzWqs71WkgzRn/gqPTx/3XTMzmXv/soiFx3bw4fRVKy9E2mOLxep1dksliq9alSWJa11G2N0wY79WFtZuOJYuUJHwC+HoEXJRFECAPtEAMnriBFeuO8rkc0BPtlRGeYf06okh6ADex24znhWeuIrnca7eNXeoMKLjDm62sjQUs8uDe/8vTsNjdLxFidkObSAXuBjEQNu9vHuS/M/uAhISfEVqoRJ2+mYiHoCcdO932PiNuaVjG8L4NaCjooKV09YDB6WAnv9wsNFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iz8I7IDGhDm6ZXTeywYFKfVTKqVyvzlxZymhyTuqgnU=;
 b=hidVFx5ZAk2b5yLouuoFz8IP2h19iIHxgyc2qnUpZt0ptn3GanIaUI3oxggev4HRngMEGVygzXgnMvtrNRQx97GHGn39Nru9uoltMAkqlqzLiRZJPfmqtr4EzKVsitPqnR7kwaRIGszinRLZY9c3mkQaxqfCeuuRneuJ1mpxUms=
Received: from DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) by PAWPR08MB11559.eurprd08.prod.outlook.com
 (2603:10a6:102:50c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 13 Oct
 2025 10:51:37 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::66) by DUZPR01CA0149.outlook.office365.com
 (2603:10a6:10:4bd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Mon, 13 Oct 2025 10:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGzKUTNj8q9+DhFf7HOjAPAkGELkXPdmNwfjkOeqZUICkAvqqEyDmjOnY8NwNPGHZ8pIxL1jkijjNbnmG5ReMDuz4OwyOvTTDMrkslfYQLy8YBXd+EaklUPeUA0wHULC5I7lIqHNLw9jiahC0rt414J0NtBZfGbys7jWeJg90zp9G4we3NvdeZmcZriqSoPn8UyeuH6A2VUBKuC7AYGJGgMNGNMXCFvYRb2c9HrLhhWHoVBk5p26DTU4UiD0jgOV+mGComxkFREIU66VlXIRY91NroP0dZ4l+yEC1YOl+KvXE5wijdOihTbnTPKsfaABMSZL1gPX0+GUfdv6/n29Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz8I7IDGhDm6ZXTeywYFKfVTKqVyvzlxZymhyTuqgnU=;
 b=dgMFbo5q4PuoK5yJK/CMhhXK929a0qh0Oygqoab/vADQCy3oJPfEcrI61gUEY2LRxt13vtijb/Th9XngjmlDJpLrzZ8mJMaPS11sdZaDntVuo375BZ0qCpUUphTT+8xbknreOao/cd1lXjeH9JOwz/cYZtUsKmqSpxggmnCPB7eaiW2+av0bVhFyZTiQfCz64DG9C77Aiwe1CwSOSiClk8U3fP2N8xRaiOri7cLOBSh4GlNkKkfw7fT4ZwT5ZrpSa4ukQDfm/LgXtI2AN5dsr992n3EM0VeGFQm5b9esEfD4s+Vsojc8rNkA55ARxLjBmxbscJ/Jbl9lrGSP+qOV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iz8I7IDGhDm6ZXTeywYFKfVTKqVyvzlxZymhyTuqgnU=;
 b=hidVFx5ZAk2b5yLouuoFz8IP2h19iIHxgyc2qnUpZt0ptn3GanIaUI3oxggev4HRngMEGVygzXgnMvtrNRQx97GHGn39Nru9uoltMAkqlqzLiRZJPfmqtr4EzKVsitPqnR7kwaRIGszinRLZY9c3mkQaxqfCeuuRneuJ1mpxUms=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:50:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:50:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] u-boot: Add specifying make options as part the
 config looping
Thread-Topic: [OE-core][PATCH] u-boot: Add specifying make options as part the
 config looping
Thread-Index: AQHcN6asqeNCT1/DGkGYZD6h7b5WZbS/7yoA
Date: Mon, 13 Oct 2025 10:50:58 +0000
Message-ID: <5E22B38E-A3BC-49F7-AA16-A8C3A04F9D0D@arm.com>
References: <20251007162256.696-1-reatmon@ti.com>
In-Reply-To: <20251007162256.696-1-reatmon@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8741:EE_|DB3PEPF0000885C:EE_|PAWPR08MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b92db08-1180-48b3-7443-08de0a467ae4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cjc0TEFjWU1hWlVQVGhjbWc3aWNFQkNiZG43VUtRZmd1OGdleVlJRnBFUXZj?=
 =?utf-8?B?MVd1a3JsbWhzc1RVMVBoNmZ2U3Excy9LNHoycm1HU0hQL1RiRlNHbWdLSE5R?=
 =?utf-8?B?US8xaVlZS0wxV1I3aFFNQWlnbWtpRmpadC8yN2FoNk1oZDZkbkl2VUkvc3ZI?=
 =?utf-8?B?UlVQWStyNkFhUjBGUzB6S2VmMXpqQzFod0JZQnQ4VVhzeUpKdm94cUx2Y1Ji?=
 =?utf-8?B?VEIzS1lieUw3ajU3a2dqQk9rc29ZRHRMNWU0RXlUSnp3aVdGdGE5QUxCVTc2?=
 =?utf-8?B?NUxMMWpMTGZ3bFVwM2dRSEJqaVhQbVI4cXBCU0MvejloQWdvZjN2Q1VPNm1J?=
 =?utf-8?B?TlJvbFJ3U1NjRU5wczBIZ3pPYitmUFFrYitKWkdFckFLVmdTZUk5K3YxeWpJ?=
 =?utf-8?B?NVFod28zd1d0YjdHVktIS2kxMFIzS0FwcVhyTDk4RUE1NkVyQ1hDZ3VHcU1K?=
 =?utf-8?B?VzVwUERxTDRnMjhmTUNKdkhTRXRleEJ1Skx1YmUwRlJwOW82T1Q3ZzJZOWV6?=
 =?utf-8?B?RjRoTjVrNnhCb0RhdjFSVjhYaTR4Smw5cXFBQ3UrdWQ1M1Z3TlpBek9hT2pw?=
 =?utf-8?B?amE1cE9VUWdjVGJ0b1NoZnEyRWtodmtNd05rNHArSkdFdFRNdlJ4ZHNkc1lR?=
 =?utf-8?B?V3Y5WTNHSkppQm1BN2FIVEMxbDFZQU9IenBNWkZ1SjMxeVVwWDB3R3NQME5o?=
 =?utf-8?B?YkxhbGJFL1lSMWFlNG5ITzVCRGxtdEQ3N21MdEFCclphd0FZQXAxSk5kVlpn?=
 =?utf-8?B?NCttYmNZR2JnSFFpcWhBbkg4U3Nvd2I5MFo3VE1rMEhUYlNaQjZrai9WUHdB?=
 =?utf-8?B?TnovNnpKVGJVRlExVU9kV0h0YzBndXRzV2UxYWNMcUJnb2FPeTYwRkJ3Y3BG?=
 =?utf-8?B?S2tzeTVuWVFGVmpzRTRMYUdYbWpDaVFDcnZYVCtNWG0vNEozRm9UZXpJR2NQ?=
 =?utf-8?B?cVU5U2VpeUxNWno1RU1qOFN0cis4dzhJOHkyTG5aWXNJY0ZnV1A1b2hkbE1C?=
 =?utf-8?B?QlhWZWk4Ly9yM2ZUR3k3VmJ0aFRxZi90NXEyNUZQZ1F2bGRoZDZXOTVTRDE4?=
 =?utf-8?B?Sm1PN1FLM3pXZVBiam5sUmc0TWNpSEZTOTFlUlBBMEM2VlRUenM4aUtDdGlz?=
 =?utf-8?B?VmNXMkoxZjZjekM3VFg1UFZxNlBzajlSM3JIbFlFc2RlSE15M0lucnBESlZu?=
 =?utf-8?B?WDRMRW9lTlBHVXN5UmN5UDI3UlFONysxQUdoMTMxcWhBalNjTWpLR25qaThN?=
 =?utf-8?B?RG5YOEdrY20rL0xjOUljaWZuQkdKbHJKNE0xSjVUWTZ1ZDRucmUvWDVxRUNu?=
 =?utf-8?B?OGYzRk5Pd2xzODZqSDU2OENOMUUramkzdGN5SXpHdGgzYXYrSU5pMURIOFNG?=
 =?utf-8?B?bXNWSG5heWtreUhSeXFFZHFHUEp6N3kwdSs2M09BTXFLcDBiT1BGLzU2MFly?=
 =?utf-8?B?M0srUld0S1pKMFlEK2tWbi83bTEveUJwbWZqN2I3OU1lNktMVVBEajF5dGty?=
 =?utf-8?B?cUw4SzhhbUttVDYwemF4ckZMbGdJSTlaeXV6VmovOU16cWFXays2cnR0RmxW?=
 =?utf-8?B?R2tUZ1EyVWJzQndpQVBXMldaWHVqa21tVEd2OWtuaTJEcW5HTG4reGx6TnIx?=
 =?utf-8?B?QTNqYWtzVjFZOHB3ek1vYUlucWI5OW5hLzc5VEVxQ01BcDlRZU1uTE4yaVd0?=
 =?utf-8?B?Z1dMcnVRek9KU3ppY0VxSURiMXgrV3I1blRuRkhoNE5aYnlhRFpBK0NaeDJH?=
 =?utf-8?B?eDVMaTJCRys1VVlsdFpwUThHU3M0Vm9tbmRra0VOMUNwSUZpckhUTytiOWdR?=
 =?utf-8?B?YnZHR0laSmpzcEU3MVB0RVF0ZHZaN2gzTEdjTklZYWlDTnR2SjN0R0pzNldi?=
 =?utf-8?B?TEY0a3A2UDRlMDRSZHNhci9tRGwzQnFiMTVKakJJT0w1Yjh6MVBRcmpOUlNR?=
 =?utf-8?B?dS9hcXIwZFY0YWJVREtDUHViQlQ0NlRrRE1oREFwVVhlRnQ0Mi9KanM4UkxB?=
 =?utf-8?B?ZStST21hQ205aXUzN1RjRTFUWTBtRWFxL2x6ZVhYZDVvVW5pMThYaWEvWjIz?=
 =?utf-8?Q?9FRXQ9?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <21BCA3CE0CFEE2458DEDE965A6D905B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a93aa7d8-06a6-4613-7d7e-08de0a4664d6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmc3M0M3QzZjRlJOVytRdEQrVjE0QTd0VE5jekU1ZDZBbm5FUHJFVWxxTXpQ?=
 =?utf-8?B?RHd6L1FoUkxHYVlmMmczYzl3SXh5dGtaNHNDTWUwZjJ3Yk9uQ3JSalkyQkFj?=
 =?utf-8?B?Mmk2WWZiUnRpL1VHZHlJY0N0U0NLbUxXK2hxd2pKbEdveE92SklGL2dXckVM?=
 =?utf-8?B?bTk4M1FnRjFYSkNKWndUK3Z3MW1kcE12aWdHSUE2R0NOQlFCTGZtTjM2S3FX?=
 =?utf-8?B?L2diTDU4REVsWURGUzFhalJRK1pYWnhvN2REL3hyVUhvbHUxZG9mMkVqWFV4?=
 =?utf-8?B?RkJRbzh0TW4wU0s4NWhuNit0VGR5MzBMVzc1dEl0Q2dxYlBhUUF5djc3WU1G?=
 =?utf-8?B?MEFvcG5QQWhQQWVtaXN6MjVuMUI5RWEyajNNZHZ5blhrdzlraEtaeHNPeFpi?=
 =?utf-8?B?MXdWZTB2dzFmeno3eWx1d1FOR1c3RmdYSVJVdGRXSDJzSW8wRFExZ01tcHpO?=
 =?utf-8?B?UW1tYUxjOGRSTzExRENIeEJVSEttYm9JMzJLT3FMSTVEWTE1c0hreGJMQUx0?=
 =?utf-8?B?cVpwYyt2a0NpVWNaUUt3emRkcTh3dWNsMFRxY1lKNTdLNW5USUQ2Sm84UmFh?=
 =?utf-8?B?dEZVR1E1NVZOWkRBdWsyYzVlRW5vdDhnQnFSVksySktkckplMVZmZjVDeDdZ?=
 =?utf-8?B?OUJoNkpzQ2N2K3B4T1lhYmZyRk1rUmkwMG9kaWxRTWxkb3ZWMm9pd0tnU0Zq?=
 =?utf-8?B?REtGUjl3V3FpRzMvNGZTMUVsZDM1R3ZaQ1pDRldPb1pNeXRJOXVaekFHU2xw?=
 =?utf-8?B?anE1cmVhUUI3VndiODdTYmh2Z3VvekRBTHRaNk5wcnlHRFB1YWk2OGZsZmpa?=
 =?utf-8?B?N2tqdFdMbmFVQXFqWm1tOFdZeTNwM29jbktvNXYwVUZRS29aeFZEUSsvSzkr?=
 =?utf-8?B?S1Z4N1VFTjJBRzJJUFFHVzQ4d0NCdEpOZWVNeS95WkpaRjRlbS9RbTMreG5n?=
 =?utf-8?B?T2RLNE40ZG5NWHNqcWtmd0hlTVNBa25oOHp4ZG9VZnExQWtyc216WlZtVE9Z?=
 =?utf-8?B?bGUrUkZPd0Q4enBadDBzbFIrMjl3ekd3WnVaQ0c3UitmUy9yUU40eThkOEFX?=
 =?utf-8?B?dkdRZWF5MjhsWDIyQWdFZ1dSRzQ5N2IxWnhvbnBXbndKMy92emxuanIweU13?=
 =?utf-8?B?NHRLZWtwMndUYXFUb01lOEJlUVdpaklOdTNuYWswQVJEbm5keDlZYWpIZ05j?=
 =?utf-8?B?TXVVd1Z1b0NWQjJScFNqZS93VDRZb29JOWwzQkZWOTR6cnVWeVJBamMzSXlv?=
 =?utf-8?B?VW9nSU5vNTU1Q24reGpqWjdSYzB5UFpFNk1SZm4vWjRDejQrejd0VWlHM28z?=
 =?utf-8?B?U2d1clZET1Y0dmlaQWVlQWx1Zk1jdDU4cXNHY2xvOWNlaS9jdkVnTGtrRDhO?=
 =?utf-8?B?cDdqOGlsV3FzNmtDY2RxTndUUDkxZng5K1Z4YU5VRStsM3NyeThlMlM5UmlQ?=
 =?utf-8?B?a20yYjJwOHNVcWhlZ2tueXFuTHNPclRPWkNRSkhuTmg5Z0FxbVZrY3g3djhV?=
 =?utf-8?B?aVhkM0c0N2IrcHBEYmZRbFlEN0wyd2VJMTJPS3d6TjYzMzFJNEVUZ0FsY1ZZ?=
 =?utf-8?B?MHplcUVJNGJneXhsMVdXR0t1QUZyUkwxSVpZUnkwVU14WGZmb1F4c3hpRGVX?=
 =?utf-8?B?ZkNieWtPenQvV3F4bFBGbmhxNUNNRnY2SHJrUzRwRDBRd0RnRlVQMUZCVklh?=
 =?utf-8?B?Ny9HcjZYZVY1UXRJc1BkcXlLWW0zQXVHSFBpVnZ1cHVhVG1QMnhHMkpVbHRJ?=
 =?utf-8?B?d0F5WHZWcHhub21ZNVhzZGsxODNsR1lSVCt3V0pLeld0RzRWektjNEs4Qld6?=
 =?utf-8?B?NEdGNGNJem1DSE1Ecml3cnZuV2cvUzNYWERNZEFwNFZObmR5c1dCZjBYKzJO?=
 =?utf-8?B?cmxLLzFmYzlxOEpIQzlMN3BjMU0yYUczcVZYb0Y4RGxsVWlmeGZ1Mjc3K2ha?=
 =?utf-8?B?a0ZrOGxTT0JSRy9ZNm53Mmp0MjI4MWRwaDhQMFA1YUsxYzY5Mjh2Vno1dm1k?=
 =?utf-8?B?WWkvckpPS1ZUa1Q0OFdIczVoM05SNytHT1VSWkozanMvOTVrZG9oNHlWSVZ1?=
 =?utf-8?B?WHBFZW9ydWxwYWMwVnptYnV4SnhWVWROaVJPQXRyTlNpK1NxaEw0aXdybnRI?=
 =?utf-8?Q?22vA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:51:35.8488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b92db08-1180-48b3-7443-08de0a467ae4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 10:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224770

T24gNyBPY3QgMjAyNSwgYXQgMTc6MjIsIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyZWF0bW9uPXRpLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+IFRoZXJlIGlzIGEgbmVlZCB0byBnZW5lcmF0ZSBhbHRlcm5hdGl2ZSB2ZXJzaW9ucyBvZiB0
aGUgdWJvb3QgZmlsZXMNCj4gdXNpbmcgdGhlIGV4aXN0aW5nIGNvbmZpZyBsb29waW5nIHN5c3Rl
bSwgYnV0IHdlIG5lZWQgdG8gYWRkIGFkZGl0aW9uYWwNCj4gc2V0dGluZ3MgdG8gdGhlIG1ha2Ug
Y2FsbCByYXRoZXIgc2ltcGx5IHNwZWNpZnlpbmcgYSBkaWZmZXJlbnQgY29uZmlnLg0KPiBTcGVj
aWZpY2FsbHkgd2UgaGF2ZSB0d28gdXNlIGNhc2VzOg0KPiANCj4gMSkgV2Ugd2FudCB0byBzaWdu
IHRoZSBzYW1lIHVib290IGZpbGVzIHdpdGggdHdvIGRpZmZlcmVudCBrZXlzIHdoZXJlDQo+ICAg
dGhlIGtleSB3aWxsIGJlIHBhc3NlZCBvbiB0aGUgbWFrZSBjYWxsLg0KPiAyKSBXZSB3YW50IHRv
IGluY2x1ZGUgdGhlIGFsdGVybmF0aXZlIGRlZmNvbmZpZ3MgZnJvbSBhIGRpZmZlcmVudA0KPiAg
IHJlcG9zaXRvcnkgYW5kIG5lZWQgdG8gYWRkIHRoZSBwYXRoIHRvIHRoaXMgbmV3IGxvY2F0aW9u
IG9uIHRoZSBtYWtlDQo+ICAgY29tbWFuZCBsaW5lLg0KPiANCj4gVGhpcyBpbnRyb2R1Y2VzIGEg
Zm91cnRoIHZhbHVlIGZvciB0aGUgVUJPT1RfQ09ORklHIHNldHRpbmdzOg0KPiANCj4gIGNvbmZp
ZyxpbWFnZXMsYmluYXJ5LG1ha2Vfb3B0cw0KPiANCj4gVGhlIHZhbHVlcyBhcmUgcGxhY2VkIGlu
dG8gYSBuZXcgZ2VuZXJhdGVkIHZhcmlhYmxlDQo+IFVCT09UX0NPTkZJR19NQUtFX09QVFMgd2hp
Y2ggaXMgYSAnPycgc2VwYXJhdGVkIGxpc3Qgc2luY2Ugc3BhY2UgY2FuIGJlDQo+IHByZXNlbnQg
aWYgeW91IG5lZWQgdG8gc3BlY2lmeSBtdWx0aXBsZSBvcHRpb25zLiAgVGhpcyBpcyBoYW5kbGVk
IGJ5DQo+IGNoYW5naW5nIElGUyBpbiB0aGUgc2hlbGwgY29kZSB3aGVuIGxvb3Bpbmcgb3ZlciB0
aGUgdmFyaWFibGUuDQo+IA0KPiBBZGRpdGlvbmFsbHksIGFkZCBpbiBhIG5ldyB2YXJpYWJsZSBV
Qk9PVF9NQUtFX09QVFMgd2hpY2ggaXMgYWRkZWQgdG8NCj4gdGhlIG1ha2UgY2FsbHMgaW4gdGhl
IHZhcmlvdXMgZG9fY29tcGlsZSBmdW5jdGlvbnMgdGhhdCBkbyB0aGUgYWN0dWFsDQo+IGNvbXBp
bGluZy4NCg0KQ2FuIHlvdSBhZGQgYSBzbWFsbCB0ZXN0IGNhc2UgdG8gZXhlcmNpc2UgdGhpcyBi
ZWhhdmlvdXIsIHNvIHRoYXQgaXQgZG9lc27igJl0IHJlZ3Jlc3M/DQoNClRoYW5rcywNClJvc3M=

