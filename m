Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5BBCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 14:38:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.web10.18591.1760539083982353920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 07:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=epKdFZa4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=epKdFZa4;
 spf=pass (domain: arm.com, ip: 52.101.66.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IALp/mgOwBEk4QXAuHT5S8su6k1r9/sbLxKp0jC1rUpqUvJfRw8K/Ll78fp8Tx87wCEf2eugCE+bzwdycs2gor2MIK7msLPYiYs9l2qWoOwbxFgbM2bp7qvL/JTMOlI9JQaFI1sZGPA+plpmiWZ0q8VJSMy7hfWMudogTYTuQs7kyoI3DE1LA696OlAaElB8vlyxk7F95/AZ5+D9eHh48IfbUZ0+Sg6yMBJ45+Wh6cKuaJv+KrW9WDgHq84q5hZAjCEbVNAoEBVQMe3rNNHE9EB5+gL8DlL4tBTdC1Jzhy1WE2iopzSw8XKsLlHO4CIl/KssFCUL8YdUi71ROQSNyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dW+Lu0URAyGSB7LhegJgABv8jrlto38DeJ6JwydKP0=;
 b=Q+6ZgC+STADkANTmg9KfZTSGYZy96YKJ5D6HyZaF5+J6FKvtvyIe1uKe13ZFJYbpl6L2W3Ed4sX1NcJyRMzAVRkZeYfceyvXqYCDx2ydupOLr9MiWaxt8ehsXTy6jt6IjLSiaUIXa6A7avBuaITgkr+F8pxutEI2itcNQSbW5P0CKx+dD2CUKdbaRETqHWJqLFIGAT2wXILPnFpqZH454nwoABOsxXv/GCD8d1bQFU/6+oXNTVxDufnutI8HBWRtrpZ/XsWxNBJgsLGLzk3UwSFJ7AQACetBvaW+Oi4u5PaPkZ7ZPCtyB2xoBCFZtArB4or2AIE61FhSZnj7uiziIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dW+Lu0URAyGSB7LhegJgABv8jrlto38DeJ6JwydKP0=;
 b=epKdFZa42HPNH4paqkuoFp9GVh4iXaA/oEVFKduUi1ZxHKs33C7AUFJ2I6bbjMxiNoD0UBOC1IBwH1qH0nyiXO0KI1Y4xRRuTbp6cyDBnC6TQzuP6PN1jXS6QosD8OwJYl26p6aSp2HP9ILPRzty11N4Oa4jOad7eMlF9t3JOKk=
Received: from AM6P191CA0044.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::21)
 by PAVPR08MB9307.eurprd08.prod.outlook.com (2603:10a6:102:304::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 14:38:00 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:209:7f:cafe::80) by AM6P191CA0044.outlook.office365.com
 (2603:10a6:209:7f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 14:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Wed, 15 Oct 2025 14:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShQV180W+w6T8hRRXq/ltLsJ5gvGJyCxK3vsgVfqKqPToBHCdV0UqOUMXSX10ameh2A23oBHJ3Ow+YR4tCBxQ9/ZoMxTL7Y5nhXDzk4a1iGBmRJwat9MwKgJPw3j4VXZ2zJ0mvRE3Vu/aoTYjymnwwKCCZakKbuB7MFNnXSVRDX2pJsk/3heM70u8ktirpcqwKBgwj/LUHQEvi0b3axEI1Zx1apuIWTcofgzjE+iGZxtGqo00OSbdLr8O09fu8QDsnW7E7VZrvUh7kbvOlHuwahs7P8KR9UVh9iOaqnQ7AOSder9mA7OzslhMp3eLjHxGGu8Vcz6gTwQq4EKdJv6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dW+Lu0URAyGSB7LhegJgABv8jrlto38DeJ6JwydKP0=;
 b=btm7nt724PLjwjsJJuwKXsDbvh5OPycCYvkKYGnxs1HlgmoQFvRwb5HT4hK++6Y7WXUJSmPDcouClWsYAVTDozswu1520E5BNXpGMUdypIPf8a2Jh3J2rHW+K75Pat/eNDqGUxF1lQ/SeJvZKvs1ZveTC2MNhdrMAl21PqShWWuiStEWWdPJTA8W4esEqKgTGamomitBcWO+zLt9NxZyIwL0M5qVFDrnZwV/jqojW6/mQ2dxp6q0CSiNXEhFR8ZxMV67PEJ3jYPdM/d3ez2z54rnd+awwMZyk2ebrLKMDH/EKEAX+jLCz4MpSCmDHdkcHS8uUHvbgmTBBgT65dIeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dW+Lu0URAyGSB7LhegJgABv8jrlto38DeJ6JwydKP0=;
 b=epKdFZa42HPNH4paqkuoFp9GVh4iXaA/oEVFKduUi1ZxHKs33C7AUFJ2I6bbjMxiNoD0UBOC1IBwH1qH0nyiXO0KI1Y4xRRuTbp6cyDBnC6TQzuP6PN1jXS6QosD8OwJYl26p6aSp2HP9ILPRzty11N4Oa4jOad7eMlF9t3JOKk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AMBPR08MB11658.eurprd08.prod.outlook.com (2603:10a6:20b:735::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 14:37:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 14:37:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rs@ti.com" <rs@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain
 socket
Thread-Topic: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain
 socket
Thread-Index: AQHcN+Tv8LuwE/jyc0iGOlSuNF225LTDUpyA
Date: Wed, 15 Oct 2025 14:37:26 +0000
Message-ID: <FA907A20-0CE7-47B3-B38D-A627F8A96D2F@arm.com>
References: <20251007234809.435300-2-rs@ti.com>
In-Reply-To: <20251007234809.435300-2-rs@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AMBPR08MB11658:EE_|AMS0EPF000001B5:EE_|PAVPR08MB9307:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a9eadf-da82-4728-97d6-08de0bf86fbc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bFd6VXZTb0dkWUNzUzVpTDNXOXgzb2J6VlFoRFNCdk00QWpkMFlPTGpQMWta?=
 =?utf-8?B?MHZRTjBrbG1QMXA1ZDN5NzNFZndtKzBqVWFZbFF1LzZDME5mZlV4b1Zac2hr?=
 =?utf-8?B?Nm1qd2wvaGhSVEJIUXQ2aUQzUzBIcThHLzJ5MW1YcVZHQUY1NysyVWVBeGxm?=
 =?utf-8?B?b05GbnVHNTdwbVQ5RVRZK2pSZmNGQkVTUVlha3lrcUhzNTVHZldBc2ZDZzgz?=
 =?utf-8?B?eWNjVmhEeVhiQ1cyVStnMGVqbHRpYy8rY0gvbTRUQ1lXVVNIL2t4Y05ja3ZN?=
 =?utf-8?B?MzZOT0NOTkh6QlR1RU1HeFFpNHk4UVFYcm9vWEpjSi9zSk5VMTdXckhZZzJV?=
 =?utf-8?B?cGVjVHZZK0ViZ0pGbVlVRk9TVTZvYmZ3ckVlakZEOTkrWHRtNHZId2lnTGRU?=
 =?utf-8?B?V1QrNjV2ZkN0VFUyU2hvQzZ1SUJTVzRXR1dCOEFaOFZaSUFqREk0QmUxNnlv?=
 =?utf-8?B?bVg3QVZMMklEd1JhWnhWRDFDN1VUa1JhcHdYQndnU01YNHFncHVKd0NWMVl1?=
 =?utf-8?B?ZlgrUEIwdHozTEVMVWZMc0x4NnM3bU9NeGtTNE5pZkNYQUlYTUdtMFgrelhR?=
 =?utf-8?B?N3NVU2FNcmdRYkEzQTRxQVFabGpEOU1tM2F0Q0VhWE95NWNielZZWXU2Q1RF?=
 =?utf-8?B?NUdsYkZ5bWJvQ1c0aWVzQ3VFOUU5WnliRHJubndtalcwcDJ0QnFOTnM2Syty?=
 =?utf-8?B?V2FtLy9XelhVUlZYQjNueFVVbU1TUTVqWGh1Ti9DRnpLL0s0ZnhFT1pTcjN5?=
 =?utf-8?B?NGlPRXR0bnFDK21hV0E4T2dZSG8zc1JoNG9ZQkd2RFlDWjFySTgzUFExTUh2?=
 =?utf-8?B?dVdJdHhDaU9JRGM2R1kxcHllNG9WT3dWazhVdWluM0s4OWFYS2RHV0p6S1NX?=
 =?utf-8?B?VWRNQXBQb3daZnBjOTZaS0EzRm5INDJNWFM0SzQ1aERZZUI1RmhDZDB1NDRY?=
 =?utf-8?B?OTlnNDlzWWNRbHlCQkpUM3RiamtwTGt3RDQrc3AxNGFuS0diWmJjMjBNbys4?=
 =?utf-8?B?WU53NTlMc3ZmQi9XUHJIaUJZYUhuL3czZjZjMG02ajN0ZSs0bERyelcxWGhh?=
 =?utf-8?B?WEozeXBZT3E5TDRGZjYxT0EydVNzdEk0REk1b0FDZUVtblhjbzVFdGJiRzlo?=
 =?utf-8?B?R0Q3MitQZkRGNjRHM25SSThmNllNN3Y3R3RDbk96ekRXeXRzejNnUnBTZGVl?=
 =?utf-8?B?c2JTdmRaUVZvb2hxaFNjaHRoUHl1SGwzYkJod2FxWDhnQmxUbDZuYUduUXNq?=
 =?utf-8?B?UTlnUG1QUWkyaE14RnpscDZzMjlaSmhoTXVyRnhzejl4dkJVQUw5cmdSTFhE?=
 =?utf-8?B?aytyQkxJQVRTTWp1dG9qbzBUUmpETjkwaXp3RWJLQ29MU1VwSUNXNnBEZjRr?=
 =?utf-8?B?UkFJOTJmNkRWVVZqK2g5aXYyUEQrQ0UwL3IzTkFvMGFyZkVNVkFVWFh2SFR4?=
 =?utf-8?B?TS95dkVBWlFpeEFkQzE2RHdTZlg1Z3hxSUI2MVk4TzhhNHJsTUE3UmVIdkJZ?=
 =?utf-8?B?MU5UN09Gd2FUcUlPelNxUkdLUUNKRzBwL3Q5Snl1aC8rOUJ4MEwwT1VSdVJ6?=
 =?utf-8?B?a0FBU0hrQUVYOEZlczMvUEU2enVFbVdHNFVTcWhIdGt2RjAyN2pUUURRWWN0?=
 =?utf-8?B?Rm90bFlyYlFPcEVaNkhLZHl3bktsZk1jT1gzVXNaeWVNeUN3ZnhEeUg0QUV5?=
 =?utf-8?B?N1VNNlNldnRMYW1SS3NKSUY2NXVodDdKQmFXVXZMZFprdGwwdWVxTFhnSjJY?=
 =?utf-8?B?QTBmQ0dLWnJMN0FOS1JIdUtSMjZ3UEdHYkNtZG1ZSWMyM2tES2FnUkZSTEwy?=
 =?utf-8?B?cFN6U1JLSWx4ZGVkZmQ0R1Y5OGJRLzRKSERFWUNha1pEdmZEVy9QUXJlUDlS?=
 =?utf-8?B?VkNOWUMzWWszWEx1S1dZWEU0c3hjRXkxNmREZjFLWUtNbG5rZjQyeE1sVDJG?=
 =?utf-8?B?eU5abzFYZjBwL0h1VUZ5UThDbWwxS0ZaTmZlaUdONVdyaE8yd2M1VDBIMDQx?=
 =?utf-8?B?K3BFWXhiUGk0dHdFeHVySUFHMi9VRVJUMHNWZUVucEhhRlREcGFlU1ArcnJv?=
 =?utf-8?Q?UIe9iJ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00B394CB6AD13C40A70142CD6D30C969@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11658
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	563d8bf4-8c64-41b4-0934-08de0bf85cd3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|35042699022|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlUrcjJGa0xZczJlMjFvU05PTUJGL2tJaGRJWTNIZ3BMWmw1YW5NYXRDZUIv?=
 =?utf-8?B?NEkwa3M5SzArdFBQUFpTWWtsLzFkYjNhM0ZLTWVYcmZaZTVCY2lpWHdDejhq?=
 =?utf-8?B?d2ZVclZCYnNwZ0RBRzNLanVhdTRHOTk5Qkp5THpNUTRodlUrQTVYbEt1RWRl?=
 =?utf-8?B?cmNZR2dadUpsNU1MazBOYkZueUVxSTcvRGtBcEk3S3ZhOG5uZTV6R3dGWjJ4?=
 =?utf-8?B?MlF0TlEyaVFLUkhBQUpIM0VCSW5rWnlNQjJNUmovdTB6RzJuakJrOWM4emlT?=
 =?utf-8?B?V20xc1VOS25NN205b2sxRGRkQ2MrelFWL1liQStVa1RsekJZWTFra3JrYk53?=
 =?utf-8?B?ZXZ2MU50eXpNenljL2k1VkVBanBOd3YwdkFENlNqSW1TMWYyTms5c3NuYnk0?=
 =?utf-8?B?U1JCSlg3eDlQY0xka3QrU2NzeUZSTW9yNlA0ZHp2ZGV0YTZmNEpJQkNLOW1k?=
 =?utf-8?B?S2pKSm1DQ0dBYlVsYWUvVHl1bDhPWElxeGhGeWlRRE5lT3lsWVFuUG5mZ1h3?=
 =?utf-8?B?bUFBZzFFR3IxWlZ4TmEvQXI2NmZwdmE4OGJXdHQxeExMQ1Z5WmhuOGNldzVP?=
 =?utf-8?B?Yi9wSms3NElVeFlmek11TmhIRVFuRSt0QlM1VDV0bDVjV284WFp0NXF2d09H?=
 =?utf-8?B?ZmZqUTdnRmJjRlZ1N2hCWmtQZ2xPaDVIaFlKTElUQUVRMDZkMFlnYmIweXpm?=
 =?utf-8?B?OUxid3lVbmhESlZPZGovQUZrQU9ZeXBqQ0VlYTB5MUNINlZNYUdFYzVQTlg5?=
 =?utf-8?B?V0tDRjhadXJnNE1kclgyVTVJMytJcFFRVTM0Ry9rc2llV2tyR1JuSWRwdXht?=
 =?utf-8?B?YlFOTTBtTjlSUUZGd1hPcDZMdFpVaTV1M1A4WjhNOHpHQzVFTzZVeW5WUVpV?=
 =?utf-8?B?bmlvbGtGKzJqNWlDc1AyMDloc1gvbDVsQmphbjEyTHZmZC9YWFR1YWJmenN3?=
 =?utf-8?B?MHROdXE2V3ZOekJLc3RZTU1VTjBnRUM3dm9iZzU3bFhVNC9ObHBWSzZlUHBZ?=
 =?utf-8?B?eVBObUEvYjVNeXFZWDhRL0MxU0x3STNNY1hQRWtvUk1BZERYbzlsRDZtK25Z?=
 =?utf-8?B?Ti9JNTZVRklLTk1VRjV4Q3ErZHA1aGhMWTIzQ3BIdVdjaUs3QmpZNzVHTWw1?=
 =?utf-8?B?bC9YbnZwMG1kNzcxWGc1QXBHQzZpblBpZ1kzRFdLMGtOQXYxOUEvalZhNExx?=
 =?utf-8?B?Sk9rZHVkbFR2dXJDVld3MDZQbU1CekIxWjBBM01DS3lzemdRNk1RdlBzS1Iw?=
 =?utf-8?B?WVVPZGhWZ09laHYzNmlIKzRVVUZZcTBoY3dTMElGc0l4S09TVHY1KzNHVWRD?=
 =?utf-8?B?cDZiQlBwNkJYaFphWXdpSERKWHl0WER6K1JodHFKYmNGVnc5R2dtS2d5ZzRP?=
 =?utf-8?B?NVJFSldIWjVMVFlkV3ZFall4TmI5Q3dRUGlHR1NYdnBiUjhiZC9Za3JDZ1Ju?=
 =?utf-8?B?RVlTODQrS0U0MnF1dHR1MERlVWZUK1IrRkx0b3Z3YmI1cTEvWU5MbkZSVk1H?=
 =?utf-8?B?WXFzUit0MVY3SHVWaFkzalMzdVhWa0pqMTAyNFh0cjQ3QXhSUlJJb2hCMmxk?=
 =?utf-8?B?eEVBV05nb0RQUWNLVnJISjg4azJlZGZFUkRmK3ZNTGVwbTY2WDBrVFlScEd4?=
 =?utf-8?B?WjNvRGV1OUMyNlZCaWJXOVo2YzZIM1lpUzNDR1BuaFJmVUN5cVU0TDk2anhp?=
 =?utf-8?B?YndnWjF4cWlpUGhud2hOcm1HTjY0NmZHUjhkS0wvcDVjajZjeVVwSEtLS0RU?=
 =?utf-8?B?QURRaXV6OWNTTjJvYzhSSGNKQ1dxb0NaRStmaXRpTVlTSCsrQy9MaFFRSFJX?=
 =?utf-8?B?eFRHVVc0eUoybXYvMVU2cVdTTXk5VlpyMUo2RXdwS3kvdWZlQ2lZazlhRnE3?=
 =?utf-8?B?UStmb1ZNL1RxQ0E1WmlyTExBQUFMVEUxYTJCMFQ4eTR2R0pPcE5nVXpTbXgr?=
 =?utf-8?B?WnozdC9DTVFmYXhOcEdJd0pCNnBkR3BDMzc4dEI0bnhiNUh4cnk4OGdOQk9z?=
 =?utf-8?B?bjBtUFRMSHdvWS9XTEhMZzJFdit5ejM0Ym5pWUpjKzZlWDhSekhmaTYraDlh?=
 =?utf-8?B?bUdMRnRITW0wZ1l3TFl5d3NJanlvb291WFRVTHd4aGNndllIcEpabmx0VHMx?=
 =?utf-8?Q?3RZA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(35042699022)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:37:58.7139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a9eadf-da82-4728-97d6-08de0bf86fbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 14:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224894

T24gOCBPY3QgMjAyNSwgYXQgMDA6NDgsIHJzQHRpLmNvbSB3cm90ZToNCj4gDQo+IEZyb206IFJh
bmRvbHBoIFNhcHAgPHJzQHRpLmNvbT4NCj4gDQo+IFJlZ2lzdGVyIGEgdm9sYXRpbGUgZGlyZWN0
b3J5IGVudHJ5IGZvciB0aGUgeDExIGRvbWFpbiBzb2NrZXQgd2hlbiBub3QNCj4gdXNpbmcgc3lz
dGVtZC4gVGhpcyB3aWxsIG1ha2Ugc3VyZSB0aGUgZGlyZWN0b3J5IGlzIGFsd2F5cyBjcmVhdGVk
IHdpdGgNCj4gdGhlIGNvcnJlY3QgcGVybWlzc2lvbnMuIFN5c3RlbWQgYWxyZWFkeSBwcm92aWRl
cyB0aGVpciBvd24gdG1wZmlsZS5kDQo+IGVudHJ5IGZvciB0aGUgc2FtZSBiZWhhdmlvci4NCg0K
V2UgZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIHBhdGNoIHJldmlldyBjYWxsIG9uIE1vbmRheSBhbmQg
Y29uY2x1ZGVkIHRoYXQgaXQgZGVmaW5pdGVseSBmZWx0IGxpa2UgaXQgc2hvdWxkIGJlIGluIHRo
ZSB4c2VydmVyIHJlY2lwZS4NCg0KPiBDdXJyZW50bHkgc29tZSB4MTEgcmVsYXRlZCBhcHBsaWNh
dGlvbnMgd2lsbCBjcmVhdGUgdGhpcyBkaXJlY3RvcnkgaWYgaXQNCj4gZG9lc24ndCBhbHJlYWR5
IGV4aXN0LCBidXQgdGhpcyBpcyBub3QgdHJ1ZSBmb3IgZXZlcnl0aGluZy4gSW4gYWRkaXRpb24s
DQo+IGlmIHRoZSBhcHBsaWNhdGlvbiBpbiBxdWVzdGlvbiBpc24ndCBzdGFydGVkIGFzIHJvb3Qs
IGl0J3MgcG9zc2libGUgdGhpcw0KPiBkaXJlY3RvcnkgY2FuIGJlIG93bmVkIGJ5IGEgbm9uLXJv
b3QgdXNlci4gVGhpcyBpc24ndCBhbiBpc3N1ZSBieQ0KPiBpdHNlbGYsIGJ1dCBpdCBjYW4gcG90
ZW50aWFsbHkgbGVhZCB0byBwcm9ibGVtcyBpbiBhIG11bHRpLXVzZXINCj4gZW52aXJvbm1lbnQu
DQoNCkNhbiB5b3UgY2xhcmlmeSB3aGF0IGFwcGxpY2F0aW9ucyB3aWxsIGNyZWF0ZSB0aGlzIGRp
cmVjdG9yeSBhbmQgd2hpY2ggd2lsbCBub3Q/IFN1cmVseSBpdOKAmXMgdGhlIHJlc3BvbnNpYmls
aXR5IGZvciB0aGUgeHNlcnZlciB0byBjcmVhdGUgdGhlIHNvY2tldHM/DQoNClJvc3M=

