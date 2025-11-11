Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214EECCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 11:46:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15471.1762861610030150361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 03:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ALC6O89r;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ALC6O89r;
 spf=pass (domain: arm.com, ip: 52.101.69.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EHADaUzEyZApTwBO5HPdIBM0rQMy36d38gW6FWCOY0kX/KFlGSt4Vv2UnksBR7mPLr2a0WoS6w4E6tETSNt6Z22JpBnPc5DDnK/zedc6XC7892rb6KHW8Q5yLiYomLMj2S3C1U+48oR8qjV+UythYkv8ECG+ljh+wDL7qmK3euCD0VZhXAmWlgFz5DRq0UJ4adppIgeCVODP/3iQOXcwOc3auX4H4RoVnmYQChozQ7QvssAjtmewuGdN2prHKS5yHQACtmikKDwdL6KSAoPUo2QPJfzUz9hcIKohv/HUP1bvkSFOyvksJVkcQUNLW+qOCEQiDhSfFjDvaH2ik6TFIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX5rjIqCm8cM72O7H4GOyb35rWKRDOBXfaD+M4AU9lk=;
 b=EG/1JYPD59xLloPq3AJc0xMIsYO0ZRt7+45Ni/ES0phtXfKBIPfZ1fHDqaP9xYQxUL7KwHrv5/qYR5Kw0hlW5Ki4MS8IvVsb3RJdMAYwI+rEnzQ5lFaW5cSF4UaY4m8e7fTswoztmk/b3aGSW5gwGY86kI0Es69pOEaknrlJCo4gxM8Ka0ngmpeKgnwRvXi4ou3ETKpSEP2/j9/qkmS2NGsNnxPUbt4PBg3o1OZ3ge4BIYtUUX+Ywy6B51Ljjb3uxwHZqs8uwDNaPKnEIePf1Tu2v/SACPRO0MRQv7G5xAXmzAw5VNhfp7Zdk6TikkLOGzWiTzAaSZdB4ri+G8NLIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX5rjIqCm8cM72O7H4GOyb35rWKRDOBXfaD+M4AU9lk=;
 b=ALC6O89r3idRc68wQi0Svb4eRqcnunwSazVkP76TzNNuZmZxMG0XBlrLgj7H4pRVTEo1PssyBoUAnNE70c74az35jJY4ANp6uL2yMk5wbUn3wnhyZXwPKUQ2uqFw/9dmX+yFr07UnX1HBcP/w09mBxF/TUPVJiVOxsEagY7Epso=
Received: from DUZPR01CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::10) by PAVPR08MB9081.eurprd08.prod.outlook.com
 (2603:10a6:102:32a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 11:46:45 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::f8) by DUZPR01CA0072.outlook.office365.com
 (2603:10a6:10:3c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 11:47:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Tue, 11 Nov 2025 11:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf+o3pGOX/TLQJE2Ykfw/QSVzf0vRRkAgSori0K9pIjn2Fc7D8SPbJpZlIC80aEeqMe+iqTPg0DAKK2HeRqdLsmtwZwEJbfTBaGZRSw3xfq6PmSrW1JgkcVLM/bwBX7MfWeibDpb3h0GIFRLmCVRofD621AGvWzHcBiRrRBGiJ/Qm1B8bGzDGXhZZvguytc5OKnDL7J6Zg3bM1kAzlpxt3tOB4m0eY7XJee3yI0NL2sSkA3oCOmosnfKv1lPwgsRlRKGLTAY5wLXURUW3zRwmuEC6UM4BRBZl+lJhZ6TWsr3w9yF38T+uCUNnA/rmlggwrmTj2qO+TqGC8BVXza/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX5rjIqCm8cM72O7H4GOyb35rWKRDOBXfaD+M4AU9lk=;
 b=SK/Lg5xEZNF2yiMEJZFh4/6TlSBtnOX7O9IB8vPMY5D+zpNbnQbdkTVWUcHvgwaWFLDgS0/Mm9DP0FS26cPlFIWTpRuDnJPK5z8tvNP8U2U+SctZNwzl6fGXo+rymm4BvF+gvfKRKFEBr5EhPF50r+4B0bPLQmJF7Yu16YkPoTMmL/L+1fRsn3W68C7fLCi4kPtp/Tz+c6X9JWlp47nqCNcwmdaT2FxPYDTHzWTsz83NWoKoNlMZl52lE+Xk3u0dzRg1MTKEJwJuxTFwe9cRn26EBpeQl8hsYbmPanLJS967+vKNWtQW9mj9mVkoxJAq+4FmKbV8+Gk3VCYr6xZZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX5rjIqCm8cM72O7H4GOyb35rWKRDOBXfaD+M4AU9lk=;
 b=ALC6O89r3idRc68wQi0Svb4eRqcnunwSazVkP76TzNNuZmZxMG0XBlrLgj7H4pRVTEo1PssyBoUAnNE70c74az35jJY4ANp6uL2yMk5wbUn3wnhyZXwPKUQ2uqFw/9dmX+yFr07UnX1HBcP/w09mBxF/TUPVJiVOxsEagY7Epso=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 11:46:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 11:46:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ming Liu <liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Topic: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Index: AQHcUZ8XD/yjFxCfgUeZivrDjdPz5rTsMqWAgADxbYCAACpOAIAADuIAgAAA/wA=
Date: Tue, 11 Nov 2025 11:46:10 +0000
Message-ID: <CD811BB8-6C3E-4423-9202-1F2E0B07CB37@arm.com>
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
 <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
 <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
 <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
 <CALatG=6AR5oSJL7GhhCVZAfu4vGecXj3=nh03nPxv4YBHzcNEQ@mail.gmail.com>
In-Reply-To: 
 <CALatG=6AR5oSJL7GhhCVZAfu4vGecXj3=nh03nPxv4YBHzcNEQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6714:EE_|DB5PEPF00014B8C:EE_|PAVPR08MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0ba538-273a-4955-2641-08de2117fd52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z2Q2T1F3MGcwakFISklCQ1JNOFRXcGZrMjhPZ2t5R1kzU1JzVHJiRTU1N2Nz?=
 =?utf-8?B?dlpEWXpxNDFHdzVUKzhZbkp5YU0xMi9TYTRDK2ZoRytOblArV1hPMVM1QmxE?=
 =?utf-8?B?SjFGcURHY1Nybld4dS8yYXBIbTRNaDY1OVlDSTA3dDhKaWM2azhOenlycXRm?=
 =?utf-8?B?NXZaclpVMjNVSm4wWnI5ejBTQ2pOMFROcVRzRUdQL1M2My9qUC9pa0pIbVRt?=
 =?utf-8?B?cEhEUDZNaUVxK2hybmR1T2VTUmlWdlpmajBBL3k0ZHlXL3EvMWl6MlB1T2Jn?=
 =?utf-8?B?ZFhxdjZ2T3NKSHBaNTU1Z2JnSXJOMk1FQVJDRkRrVlQ2UnZtUFF4aWVKaVVa?=
 =?utf-8?B?MGd2RFJ5bGwyc0ppMXJDWHhhUmdLUkVqSGMyVWhuRmZBUmRINHRXeDdkYldn?=
 =?utf-8?B?aG1WdnoyNnJlQnJNVklLMUpGUnRLbk1PT2s5UHZlODU0d0ovaWs0NU5WOVBY?=
 =?utf-8?B?VmMrV1dsaXpKVlNodDdNTWh6ODhCQXJOUHp5U0NzeTY0dHRkdXpSRGhZOEM3?=
 =?utf-8?B?V0tCUzhNanlJM0VyZFEwLzh6L0xwTjh2TjJWN1pZeXpWdGI4TGhyb2ZJemZ5?=
 =?utf-8?B?K3MwblU2OWY1RzRrQ1dNMEdHZVFKL3Rmd1RVYTFEWFVUUTBQOUR3WkdCZWNq?=
 =?utf-8?B?WHovVm4zNUhZN3ZraCtpQmZhWmE5SXNTNnBMSlFVdGY0RFFZN3dwVXBHcDh3?=
 =?utf-8?B?STBmY1BTbjhwc1VtZDVMSWN4OUw2QlJndjM3QWxUa3k4d2RsVklzWTZpa2Uy?=
 =?utf-8?B?UDJualgwU2pwMGN2dElCVXlmU1J5aW5BZWFYdnNsckZtT1hvZTdtZkJYa1JX?=
 =?utf-8?B?RWZYS09IYUVtREhud3oyaFg2dStYVDhTd3djK0daRnZSZDJXc0F1dk91dHE0?=
 =?utf-8?B?TUNFajJPY2JYUXNlYmF1emtvbUdMNFRoVzFZWUR2dDMwdzVPZVFzMGNjM2Fj?=
 =?utf-8?B?VTB2VURkSU45ZE53NWhINTRNMjVGRUREeEV3SWFyd3F1NWpWSmNLSTVrN01G?=
 =?utf-8?B?K3B1Nkt5R0cxOU04Um1uRi9WR1I5eUJjVlR5UGFrZHdwTE5kYlJNYnRRc1hV?=
 =?utf-8?B?SUYraFZhdmFwaTdrRkVXZGdpVktLdC9SZkp3RVV1dUQyRms1dFRNWHUvckhp?=
 =?utf-8?B?Qkh6Ri9BQWtIMnAxVWlaNG5mVFFQanZEeG9CbzNZbUhCYi9PeW9yemRDWHRj?=
 =?utf-8?B?OHB2QjJ3anVLSkcxYXVqVFFybmRNN1ZGdXBUWGo5cDEwaEdXUzI1OExJa3Zm?=
 =?utf-8?B?S3NTdkd1d0pDdEJFdVdMcTRLcGxzajROazBac0EwdFdIdk5TYmZSTjdYcU5C?=
 =?utf-8?B?OTFTN29hQmNXWGNjRnhtOVZwUFJDZzhKUURhdlBBZkFyR2g5c0F4NmxXUlBJ?=
 =?utf-8?B?ekpLeXJiaHNJYmVJN244OUFiN0U4ZkhlaFREbHhwdFJIaVpIa203cUVxaUNZ?=
 =?utf-8?B?Q3M3NzRmN1JPSm40WGpEbm93ZDc2ZDhkYkpWVUpsRm1DeHcyM2ZhazVrNVJX?=
 =?utf-8?B?QzQ5MUMrOHhjU2x0R3Q1TEdtMnQvUElEeGR5N1BtekpQM09nbnZLbnlZQUFp?=
 =?utf-8?B?L1ZZWHo3MWs4c1kwUHNRWFhLOHk0cHhFc0xNVFNMRDR3TlhESWlYVXgzVHNJ?=
 =?utf-8?B?MzN4YWlabmFXT1pjWlJmalozMUErVVNPbE00aXFSbVE2YlUzSFhyb1dGc0Z1?=
 =?utf-8?B?TU8zaVI0YlVmNk4rVFI4UnAzT1UxOVV3KzRwMnVhVG9Gd3A4dGVsMHZXblpo?=
 =?utf-8?B?TkJYcW9CMzg4dnpLTHRPMmtkOUhKeUR3MUNlbEtaUjlyK29WcjFHbTllWFBx?=
 =?utf-8?B?T2pPb2o0T09wV3ZVRmpoVk9MelJ0SVY2aEwwWEhtVVJFcFhocG5LQ1c5K0NM?=
 =?utf-8?B?M3lyVWxUa2p5N1FxWFhhSjlCcXZtZnlhMG1Wdm9Yblpad1NHcEhqVDhweW5q?=
 =?utf-8?B?UnR0OXU3dG1Pam1RaG9qdTlVRm9idDZ1K0JKS2doMXZMdHRoWG5kOU1UeVdp?=
 =?utf-8?B?L0kvWWNlRmdDYXZ6dGhLdmlkNHV1Nk1LdkpiNElLTktncWN5MDhuUEtEcm1Q?=
 =?utf-8?Q?zqcMRB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <859011543F70DB4293C0710F84DC0CEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	505a88bd-9fc3-4626-7314-08de2117e8ff
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHA1K0xlVjkydzdRMWxxRXg5L2hpb3Z4bThtbWoyRWNoMHZ6R3FyVlowc2VD?=
 =?utf-8?B?aE81aGY1cEFOVExmTTI1K1ZOek11VHdSYkR1Q2lQNllZdVljekJOazZhNk9m?=
 =?utf-8?B?K0JwTEsySU0yY3MxNGlSbkR1ZStvNkxrR3hqcUdQMVo1c1diODhBVytyM3lk?=
 =?utf-8?B?bUFQaHNtRzNkUGZubXlrb2dxZkNqMFpIK3dKYXl3dW42Y205RlR1NXUvTVdr?=
 =?utf-8?B?eEJNSWVuT1lDZjJZSUJUU0JpL1lvc0hlbUlWLy8wWTBwZHF3bjFDa09QU3V4?=
 =?utf-8?B?MmFhVjBoQzZnbmU2OS9STjR4ZHpmVWg3djdtbzhZNEtwL3Vna0ozY01Hcnpn?=
 =?utf-8?B?Y2N1aENNM3kxQzdOVGZmN2pxZ0dRUEc2MmlhRmpCa2JRMG5CYm1ndmh1aWg3?=
 =?utf-8?B?cDFhZ3M5Z1VzWEFEMWl2cU5XSkZTMFZIcVRoekpDcW5hdnJHNG8wWHJTeFlR?=
 =?utf-8?B?MFRXdEdyMk9xMGZyMDFVSGRIUUJLZWVrWHdaaUxIQ0c3aEhZcXg5bEp2U0xs?=
 =?utf-8?B?ZzkxYWh1d1F2bXJNWit1bStNL0cveTkxVER5UDlSSVZmZmhZRkhuSG1TeTZ5?=
 =?utf-8?B?VWs4MkVobENaS0hpZHBySG1QYmx1UFRNMEhZb0lQZWpMU2d5QnJVcW9jSXNP?=
 =?utf-8?B?OVgvaFRWRmh4NHVnWFdUS0tZVXRHbHFodHgrOThSaUdKa0x4RVV3ZUJybS9D?=
 =?utf-8?B?eE0zejhlcnRyRDNQd2tEOVl5QlMrYnJodTd4UUpPR1lwdGg1UmNDNG9YUXpS?=
 =?utf-8?B?bW9MN25nNEp5aVBuSTV6M0p6MmJNWFNCM2llNUgxK2tYdEkzOFdKOTBjaVVM?=
 =?utf-8?B?ZlBHWlNOcS9PRHJ2eGxGY0pwaVcrSVdKSEFXaGlJdzZrMlFNVW5MS3NndG9P?=
 =?utf-8?B?TXZCNlZ6dGZFZjFkWURaME1EV0ZJZWR1SndXQVpMVDBGNCtVMkFNQzVDTnhh?=
 =?utf-8?B?SWhpNVJBTGtYUXlIMGRJUVZEV3BIcTBJV2RwRFl2anVpNkRjUEF5cTZMeHFy?=
 =?utf-8?B?QnRRc2lQNjJyMzJCZVd2b1FBWllJYkQ2eTRndEVtbUVUaUM2Unc5c1BBeHpS?=
 =?utf-8?B?TVBSSUpoeDZHQmxVWEFqdlRzV05WdWs1SlFaV0ZSTGE3bllVZFJUR1Z2NjlH?=
 =?utf-8?B?RzhVcG05MiszUFpTb1RhOHVvYzU3R0tNVmh5VVFQdnpac0VQWHR5YUVaWXM3?=
 =?utf-8?B?L3FkSmwyb3VxVm9IQXZET3FhcUJWQ3dsc3ZXTTJuaEtZY3RxUFN4d0FnbTVp?=
 =?utf-8?B?YngwNGd1Zi8rTWM5dDRSU1cxVXV6QWx1V3JHT0x0b1BrdGVsL3NwZTNZNHFv?=
 =?utf-8?B?dk4rOFQ4clRsOE1MNnVVWTgraFJXWDR2S2pZc1VHUFdrTzZFcFAyMmJmbUxV?=
 =?utf-8?B?djBieVZhenNadTRZL21qU25uR0JkUFdKWW1TTnBMbGxCMGNyL0JJb1ZCdGw5?=
 =?utf-8?B?SkhrZFZ1NFVpa0p5dnpDV05pWUtoZ2VOVnF6TUVidFJXYnNNTC85cUkzVVky?=
 =?utf-8?B?Q1dleXNwQkVxVE4xZHhuMXZZSEFDTW9xbklZVitTZWJRZWdFeGxkR3U2eU14?=
 =?utf-8?B?M0U4cUE3QUwyMStGK1U0aHl5eERjUWxUODRxandiY3phcUdPMW5tVWVwNGho?=
 =?utf-8?B?a2g3U2RZRHRNN0NLYW5MMzZlanpZVjk4aU1YUEpENmQzYVF3eHYyYWtFQ25a?=
 =?utf-8?B?L1JwMDJMekZLRDNmYUJmNHhBaWZaeGR2Q1FsUGx3T3dMK2pVVjdGdWlFU3Nr?=
 =?utf-8?B?SGlqVE5mZG1ML3dZTm1PQnBqcDVzTzVLYVdVS3Z5NHdLR1RtTHdHQU0xNXB3?=
 =?utf-8?B?b29JN2l2M2J3NEhGZHN1Y3hlTDFvRCtWWlgvdkQ4eGhVMytBNlBleHVVb3Z6?=
 =?utf-8?B?VUlMYnVVVnBBQ0VQVXl6ZUhod21MSkNmWi9lOVNjcWxKVDZucjBWT1pUZHZ3?=
 =?utf-8?B?WkVCSUlJRVlVNnlQbUZpZ3ZnQkxSajdZbEFaV3RRU1M5eC9YRkoyR1FSbE1L?=
 =?utf-8?B?WjBkUHRkclhHcHg1bDZmdlk0Q0I0cDRlR3JIcFoxZGVha1I5azVJUE5LcXpk?=
 =?utf-8?B?bFE1c0MzRVJHaTZZRFJrYlJqU0JwNGxqbmNjWEZycXNlcW5MRjdTSEFjTEJS?=
 =?utf-8?Q?aNLc=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 11:46:45.0552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ba538-273a-4955-2641-08de2117fd52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 11:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226159

T24gMTEgTm92IDIwMjUsIGF0IDExOjQyLCBNaW5nIExpdSA8bGl1Lm1pbmc1MEBnbWFpbC5jb20+
IHdyb3RlOg0KPiANCj4gSGksIFJvc3M6DQo+IA0KPiBZZXMsIHRoYXQgc2hvdWxkIHdvcmssIGJ1
dCBJIGhhdmUgdG8gdXNlIHByZXBlbmQgYW55IHdheSwgSSBhbSB3b25kZXJpbmcgIlBBQ0tBR0VT
X0JFRk9SRV9QTjpwcmVwZW5kICIgaXMgYmV0dGVyIHRoYW4gIlBBQ0tBR0VTOnByZXBlbmTigJ0/
DQoNClBlcnNvbmFsbHkgSSB0aGluayBpdOKAmXMgYmV0dGVyIGJlY2F1c2Ugd2UgaGF2ZSBhIHZh
cmlhYmxlIHRoYXQgaXMgZGVzaWduZWQgdG8gYmUgdGhlIHBhY2thZ2VzIHRoYXQgYXJlIGNvbGxl
Y3RlZCBiZWZvcmUgUE4sIHNvIHdlIHNob3VsZCB1c2UgaXQuDQoNClJvc3M=

