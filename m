Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0A6C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:28:07 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.web10.7945.1754422085709292030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W+m9Hue/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W+m9Hue/;
 spf=pass (domain: arm.com, ip: 40.107.130.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A+VJ/kYUT9/kzy4eq/yZ2k9a7ikCPIKPzs8ztljNiF0EPtf7Q7ynTyY/I/cQGSwK7hk5ETDyIZnWz1KBs/Tl0fixfMO90ozSzBvrdQYjeF2jm5MHRMEgqn2ncxw4tTTYobIua+/RhvrgIVfogvusUoInb5SG6cgzGNNHepWhcc38UGFqgWi5qerS/0FOs1v6XCfHX0OyQmRNzCi68e8Npo8RKkWDxJu1+jfSlf/FkJ53k1pScyL2lUGpTRtm4SyUXZkFjvm8k046fb1p3yzqiavmRF1dF+IN0I/xexawQU7A3dPF5K2GUZvIx4215dWOuXLqn0dE0Lb8usq3POWMIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlaA7VqVEXcbN7So94FFWisjJyHNBz5DoQrbO8eFLiQ=;
 b=DUbrN5ymxMGKPg5qxGgUYtgLW031ugFm5CrdC7rEauymB21STp7cmiyQpWgVUAtmmhHSn7/C8/oZzN4bM0UqpZSfOP7lQcFQxQWWjmHu8VB3iDkBmNkzuJwoGRmQvh369Yzb/bMWF5P551fPvoXFZHFyEWi73nO1xvfDqngPTj53EJ/nGlCG90yblF8kiRjOGLUfjrQToERM9Fl2sR8KWtnnOlWfq/h3LIturrN/xXkLn+TAYdRxIJFZsX9HII1G4C5fVoHCtKHExOZlIwbBMgwefyrOSjJQ0LWDdDFprypdizUxVVTwEMmAL4NHQocoyw/3tchkWD++VcDOwywEdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlaA7VqVEXcbN7So94FFWisjJyHNBz5DoQrbO8eFLiQ=;
 b=W+m9Hue/CHMRUvffLPWlHI8ZoXCFWLC7HfOpZfWlr4uwy3ZbixTCfC2zh13FODMTowgaJeNyyWvA2ZC8/6P8VEnm/zofgbtJq+uiQp2hoYmKzgqz49qBlLPbu5LSi+YhHWVr9x4Ej9aMWuTYhssnSIx5q3yQQJ5KcUNfUc7w+WI=
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by AS8PR08MB6070.eurprd08.prod.outlook.com (2603:10a6:20b:290::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 19:28:01 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::eb) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 19:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Tue, 5 Aug 2025 19:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYTPkKDHk+itk5h6guCTGkK0e0VVyB4nRhge0SftX2Q8KyaeMEV1htgo6z8pbYcGEyR49q1+iEp/ZJdmWK12EPrjD6v8BUUb0i9likuPDZ0RvDNbX5nSM+2XAKl4+CJXqZKHxOMD8avAq9oTC7Ip1YdmSwk1VDj41w857mzK/xNnQlYHHPCZz10I/+e9sJ5/SFac1F70vAlmS6G8MMpN9WyiFm3Gew6VXJqmZb2wEDRNgvb+WudqFNa0NlrQ0Z7LKhffbtsJA5TXPyHmeZMneeV2SLF18xrIrf0B6nCBCX9J6qwdquC8b0A5GmTOWXWx6NolZ6ZrFBoCTy0/tf7kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlaA7VqVEXcbN7So94FFWisjJyHNBz5DoQrbO8eFLiQ=;
 b=DjSRNjTzR0bnVzRoXaD6tTJa33fR4av/SVM+2/1M4WdQXJ25QwUWoMnZLbtraqWW64D9BX0TEsUQmxox1cMQFRF55gzvOoVLfs/EFjuxO15QD/CwF8GnHdgunA3d6L/nqy6ved3WPaV0G69dXZ0K0d2nTZwbIE5a9cZ/45hafkUHiYGlKDzidNQa1sYC90EJNoP9alft0fmnN8PTjmpu7yR2CcJYj8avQORVj752Ze4gpMSQFb/U6Av22mwkPKKVYMv40UXc7TKg60zbmmTsA4kirJieMR+7p67Nr8qSyp+pKtkFrxU42z3u/o+sfrlhm28TN41TH7N5lu6pLXZV/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlaA7VqVEXcbN7So94FFWisjJyHNBz5DoQrbO8eFLiQ=;
 b=W+m9Hue/CHMRUvffLPWlHI8ZoXCFWLC7HfOpZfWlr4uwy3ZbixTCfC2zh13FODMTowgaJeNyyWvA2ZC8/6P8VEnm/zofgbtJq+uiQp2hoYmKzgqz49qBlLPbu5LSi+YhHWVr9x4Ej9aMWuTYhssnSIx5q3yQQJ5KcUNfUc7w+WI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9070.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 19:27:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:27:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
Thread-Topic: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
Thread-Index: AQHcBjzAPcj+W839ZE+qyNiAAE56rLRUbgwAgAAATYCAAAFSAIAAAcGA
Date: Tue, 5 Aug 2025 19:27:25 +0000
Message-ID: <B28BC44D-45BF-41D6-9AAB-34D44092A94E@arm.com>
References: <20250805191115.608912-1-ross.burton@arm.com>
 <CAMKF1sok7LjqPQGu8ekCmaH+Yr7AbK2i2s2yn23n=urBUDDaBg@mail.gmail.com>
 <618AA413-A007-49BA-96EC-4D2041A53847@arm.com>
 <CAMKF1srzgeXoTAQ4Q=LdSFiAYjD7yGiXQBJEfxFLXM5hhSJFcA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srzgeXoTAQ4Q=LdSFiAYjD7yGiXQBJEfxFLXM5hhSJFcA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9070:EE_|DU2PEPF00028D0D:EE_|AS8PR08MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: e834320d-14ed-4ce5-c759-08ddd456300a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c1BJYythbS9BTkF4TDZFaTZKbWUyNTR6Uk1IUHpEMFp3WEMzNlA4OVZ6N3Rt?=
 =?utf-8?B?QXVEbTNYQzNiTTY2NVYvNkRaUG9MOFg0dUlnQUtwRWs2NHdrTEVWV1E2RHM1?=
 =?utf-8?B?Z09wbzgzcXZiamd4WHpvQVh6ZXNyZTUwZkxVTGZ0ZkNHejF2UFk2YlVxcW5k?=
 =?utf-8?B?MUtYQkNsQmdJVW4zUExOOUZmVzhrWGZGU25LWjFxc1p3TXR4TVA2SE5SODNx?=
 =?utf-8?B?YmxoUWNqSG1XN1VWRVNOM293UlBWNnMzUnhtMmRsTjlXMUw3Si95NUo4WVVo?=
 =?utf-8?B?ZzlvVjJnOEJieHF1T1RQN3haVmxVbjRPQ3hiSDlKcm5VUlg2OC9vWTFBcHhO?=
 =?utf-8?B?bmhwbDRFbDA2ajNzVkM4YVhraGtnRmtsbjE1QmpVRG9Db3RYNUFmaTdXelBH?=
 =?utf-8?B?UkFveDN3cFluZnVNTm9PRmNBKzBOT0lWOTF4RTVaaXNQY2RjelhLNkhlQ2Ji?=
 =?utf-8?B?YmNLS3Q3L1kwS0NpMDJneHJTdCtVbmpkekRYZmVmN041MlcySXhJOElZVk9t?=
 =?utf-8?B?cXk1bmxYaktBckxVMm1hYzNLTG1hVWFlaGRnaTNBZDZkN1BHSnhiRWFCYXZR?=
 =?utf-8?B?WUd4ZWdPZ3RweU00L0RKczVmaTFJek0xanR4M09ETDY0cDJGVVB6SE05SVpl?=
 =?utf-8?B?dFFQNklndWxLc0dvSDJqdlVpQ1BTcW10dnRGcVdFS1BXaEE5M1V0TjdMM01X?=
 =?utf-8?B?alh0NHo2Ym0wZ3ppcVF0VUNHZDVMWTE2ZEtkalFjWnoyR0EyZ1NMekhYS0g0?=
 =?utf-8?B?SkhPeDYwdW5lSFpJQm12bHB1Y3QybGMrUDRqN1diL0NuM2cyUzl4TTZoY3oy?=
 =?utf-8?B?Z1kvb1kwdDk2TnNZY1kweW51Y0twNjlEaEFpMnoySnBUNUxWZTNya1A3QTFL?=
 =?utf-8?B?Ky9UNllSZmFnQUlCSGlTMFpxL1VTY01XUjF2STFhNWx4b3JseCtQTmlqSVM2?=
 =?utf-8?B?c2MrNWdkbWU5STlFWC9lT3JjdFhKN1BybHhDbjFtbmV1NExOdlRWY01FR0tp?=
 =?utf-8?B?L0Z5elFZUWhDd3lLWUI1RHh3M2RhN2U5WHlEb1k5d0lMVVplZFFhbmtVaUM5?=
 =?utf-8?B?eDhYbVh5K051MWNqNDd1azA2alJ3WE5FczZwbWNmcm9GVGduUXkwQ0hyNXFR?=
 =?utf-8?B?UkgwaVNCUUI5TEs3bi9FdVp1YzlhOVdRU25ycFhzRkdiTUR4cHJDMDE0QThE?=
 =?utf-8?B?a2d0cmVraXhwcE0xcmtZT1pCbXVSbXZXL1d0NS9GcnpLb1FaMGJGblRyMVoz?=
 =?utf-8?B?d0hnZ0ZpZnJHSTJNWTB2WVRZNEdrVkZNS25mak1rRjl1RE8vMFF1d2pFbWhE?=
 =?utf-8?B?UzBhOXo2bVZyQUVlbVBmUnE4UE5VTGtFVURkZER6WFd6WnJPSEtJaGs2TWJO?=
 =?utf-8?B?Njc1Y0w0Q2x4clhMdnUvTlJJZWJkcm5hMmJCNXl1SzJZUlY3cG01M0dFb3Vx?=
 =?utf-8?B?eERoRlVpcWtwSmJjOXg1SldzRXBYYmxmREpIc1c0YVRoTUlTMzN1MUZENHBY?=
 =?utf-8?B?UElDaTdXZjYyZW5KTHFrS1U0SktjK1YzTnpMWnppRDhEV0Q4U3UyajhaVk16?=
 =?utf-8?B?YzVVMHNLVVUxRkU4VHMxcEpIWDI0M0Z3OEo1U2ZoampNMGphaUZCelFqeENE?=
 =?utf-8?B?bTBiV2lBZkxJbkpNaTl4OGpoaXNTMUlVMEdTU2EvWVdWVkE1M2tmT2s0Ym5z?=
 =?utf-8?B?bVBXUmxic3ZSYjJjMTdDVDdKQlRRYUs5NjYzWDdUZks0ZkN0NG5Ia3ExV0hx?=
 =?utf-8?B?MU9kT3hVZVZidmo2ZVhXcW9WSjlHYkFvWWowTXFVRXdabWJvVTRYVTlidTBL?=
 =?utf-8?B?cUxrZDFXcnVBYWpueFFHam91NkFVVWtreHo1ODV5VTQ3Qk9EZWxodkRWYlBH?=
 =?utf-8?B?QThVQ0FJVVpXaXo5cUVVS1RxUGIybHRQMmxXd1RadE1MSlRVN2VpYW5saWpN?=
 =?utf-8?B?Zk1iQmptcC9LdkpJUjBzOExQN05keGJyUzQ2UndLSVErUStyc3FNdzY5T0NP?=
 =?utf-8?B?Nkg1U2RIZlN3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B811AB7C0E3D43419F3802AA28EAB28E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9070
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7eaed9a5-973c-4cd7-9c0c-08ddd4561be9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|36860700013|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXExbktDWFNyeVduWmVRSm85WjhNZm9Zd0xZa2hhYmdpaFNFSTdVYmpBNkdQ?=
 =?utf-8?B?T2ZqSm9KWGZYazc3djlKREgrTkk4L0Q0NDhhTHREeTIxOXJ5T1NpbnVGU25q?=
 =?utf-8?B?UzdJUk0wU0lLdm1LMStXckFtS25MREFZN0phZ0gwMGtJd1pZb3NwVy8yRU05?=
 =?utf-8?B?Slg4amxLd0FJSVNkaFFWMVdPWGYvZGVTdnNRU3VYeU9UdmZFZkVqOW5rMCtZ?=
 =?utf-8?B?YnNHb1hnU2JjUmErNzhZQTdsWitvWWY2YjZTa2RUWXlMSmlPOUdOMEg5UWlE?=
 =?utf-8?B?cGpXRjNWSG5CT0RGbVRXL2doNnRBd2Q2aWg2WG1ZNmozN0x1Z1RwZUtycUNX?=
 =?utf-8?B?dEJEWitKTXBuQzV1Nm1wNFFXaHhpK2xtb0FhL2JtdEV3eCs3RXl4azVaQjZs?=
 =?utf-8?B?VWlSTFNHZDFPZVk5ZEdWVXMydXdGOWI2NTc5bW05cTNDM1VtTkdpdDI1TE1S?=
 =?utf-8?B?RExuZmhaMDBvZ01ybVk5Z2RQV0d2Mmhvc2lEZXgxNW5XUlJNSi90dk15c3F6?=
 =?utf-8?B?SXBJaUJCSmpOZWdEMGJzTURQa2VGekplbXVHdDlia3hnMENxZHNUdFJFRmFz?=
 =?utf-8?B?MFRPRUxqRkFidThsT3BpeXlOY1VHSlEydjVOSSs2Ti8rcTR1Y2lUUFJDaFg5?=
 =?utf-8?B?ZVp5QVhOZ25ibGNGdE5hWWdIRCtET21Vc2NlZ2MwbTg0UEJCOWpjQ3JXUUF5?=
 =?utf-8?B?VjhWaXQwMEs1MGV0eG5kNlJsckVJNFlQWlhUK0ZXbnV0VzlXVEJXVXR6VkJR?=
 =?utf-8?B?TFdJMG8vcFI3TXIzRkM1emxXc3Fyd2F4blFtenpmdVkrK2pldko3azlhNFVY?=
 =?utf-8?B?QWs3VGRZMWk4RXo0endLU2lWd2NFa0hvYjA1eXBQY2E1dXU1LzlFNG45blBQ?=
 =?utf-8?B?V0RXaDJZQW1PQXFDMnhuOSt3OTJvb29uZDZ4bWFQQlBCUlFtWFZ2dE8wcURN?=
 =?utf-8?B?Z1pjcnRHWlgyNk5iQnc4MUtGL0ZJcTBuZkhtNHhEc1pIRkhndlNKU3BieVZo?=
 =?utf-8?B?eWVuSkVNUEpIcit2TTZhb0NvWG9JbjlCS0NXTkd5bWZlendLR1BaNkNDUVF5?=
 =?utf-8?B?V09hSFBHMDZXbVRCZ2tYYm1pMjUzRU1iczNXbEwzd1owb0dna0xTZS9ndmd1?=
 =?utf-8?B?UnZHTzVrRFdZdzBYTWp2RGpZQ3JRaU1JVE5vKzkvOHh1WWVLODlTalFTbENy?=
 =?utf-8?B?TWwwb2I4RUNFazZhRkZXRitPbnREZkE0b09FSk5sQUk5d1FGVkowNURnbFBQ?=
 =?utf-8?B?NmFkbWRnek5TQnc1UkUvSzBKRE1QQ2M1ZndudDJkcFBDdXd0VEQ5OXJVdVFz?=
 =?utf-8?B?MTdEN3JtZ1pPbVY2bWJ1eUJQK1pxZXdyV1ZHRVZkZllKQzUrcHM4RnE2MllG?=
 =?utf-8?B?UWZhbnl2L3dtYyswRFFVcUg0ZWNHaGpTUmpvVkxwUEgrTUc3UDBVYzNMQnVO?=
 =?utf-8?B?S2UxVGoyTnB1bGRTd2lxZkdjOXJLNi9yVDRGMjdXTCtuTFdnOThSR0NHcmoy?=
 =?utf-8?B?TXB3QWM0WTJpbDhhMVhvVUY0QUFCK0pJWkNjWXhocmI4SEFkT1Boc1VKVWF1?=
 =?utf-8?B?Z21Cei9NMWEvUERVcW11NGtORVBHOStNOVhEOXdNSG1DQm8xa2FpekFyeHNG?=
 =?utf-8?B?T016K2tNQnBkNk13c3IzQTdGSGhYSE9ZbmZsbmJoVEZsVTlhQVg4Rmh1NDZj?=
 =?utf-8?B?NVR3cERwK1JhMUJXMlRoOEtJZnFxTGtORGxGOEVsSzZITjVUUW50cE4zeUZ5?=
 =?utf-8?B?a3RHVnR3QlJMdDg1SWlzenlIUGJiVldRQ0krTWdzNVpSU09JakJhVnE0NHAz?=
 =?utf-8?B?R0hCOStWZTFFR2ZMUURvSE9LYkY1VGhPcmlXOUtpM3ZaRnd0b0NpdE9YeE1v?=
 =?utf-8?B?TzlsSHc1SVhwTEZtUVk3bDZBaUVwNlNvTDRENzhxTE1HcFdPK2dENzJ0dTRP?=
 =?utf-8?B?QUJabDB2Wlh0b2NJZHpXcGVKYUNQN05OVC9tcUc5OWZoWWtWamR1RldZcmZC?=
 =?utf-8?B?b0tScWdjUVhjQ0tVc1Fhd3NpejVJN0dFVFdqZ0ZZRnd5TDlrQmUweWI5Y2Q5?=
 =?utf-8?Q?8iHFSx?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(36860700013)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:27:59.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e834320d-14ed-4ce5-c759-08ddd456300a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221492

T24gNSBBdWcgMjAyNSwgYXQgMjA6MjAsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPj4gRG8gd2UgYWN0dWFsbHkgdGhvdWdoPyAgSXMgYW55b25lIF9hY3R1YWxseV8gdXNp
bmcgdGhlc2U/DQo+PiANCj4gDQo+IFllcywgY2xhbmctdGlkeSBpcyB1c2VkIGJ5IG91ciBDSSBw
aXBlbGluZXMsIGNsYW5nZCBub3QgeWV0IGJ1dCBpdCdzDQo+IHVzZWQgYXMgd2VsbCBmcm9tIG91
dHNpZGUgT0UuDQoNCjxncnVtYmxlPiBmaW5lIDspDQoNClRoaXMgaXMgc2xpZ2h0bHkgbm9uLXRy
aXZpYWwgYmVjYXVzZSBkZXNwaXRlIHdoYXQgdGhlIGNsYW5nLXRvb2xzLWV4dHJhIFJFQURNRSBz
YXlzLCBpdOKAmXMgbm90IGEgc3RhbmRhbG9uZSBwcm9qZWN0Lg0KDQpCdXQgdGhlIHJlcG9zaXRv
cnkgaXMgZnVsbCBvZiBzdWJjb21wb25lbnRzIHRoYXQgY2FuIG9wdGlvbmFsbHkgYmUgYnVpbHQg
c3RhbmRhbG9uZSwgc28gSeKAmWxsIGNvcHktYW5kLXBhc3RlIENNYWtlIHVudGlsIGl0IHdvcmtz
LiA7KQ0KDQooY2xhbmdkIGlzIGEgc3VycHJpc2luZ2x5IHNsb3cgYnVpbGQsIHNvIHJlbW92aW5n
IHRoYXQgZnJvbSB0aGUgY3JpdGljYWwgcGF0aCBpcyBhIGdvb2Qgd2luKQ0KDQpSb3Nz

