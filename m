Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A47C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:06:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.3])
 by mx.groups.io with SMTP id smtpd.web10.2393.1748549200265617600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WQvC/+Px;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WQvC/+Px;
 spf=pass (domain: arm.com, ip: 52.101.69.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wZYwsytHhniuCUEQ4l5rCOMXqXe4aRs+ixuGR19S2PovQhHKmAihpcRHGyYN7+JKedadlFVV8lKc7NPAH+KVaiNfs0VleyvVlvOdUexq54kwefnKyD1FbX0ENmjYP4oIYsADhxC/KgdjA7HNDbcTODpl8CA/5d5TqEEVDEnmnnDyKBIbI+v7klcYczC6hhBIIhZy5Nr+Ei7wYFJkrn7W98/z2LHAH5kh6sIUeyxATKMOwSDVrpr3BR0KPChSwx+38b/IZ/KYMJ/fo+vgDZhC3ZcCbCDBz7Fr9F0s366t/pm+7rJf1YwsKj0hOK+65adJ4L+W+GUWR1giALmIK4yniw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e9vXlOu4Pf2yJku7ILQkWxhjMLuSpNOIOA/e69w0NM=;
 b=mnBHdD9gww+rFvmI4XgB+u7jjBhfYRJPn5RmILLzUxc8/zCzTQIeAnsTksJei7q9oI3r5teAD3p5hEZ4/Wby2a1yDxfQgVXYa5B4zIkba50snIMZj9atn+d30PQr04qNay1k0+P+t1hrG7tqYnsTKr+m1ziBNf1S5XUzA0O6jrLqKnIL0Pqm3LJKoE56GY2qa1N+MLMiZ2SqW+aCXDE62v0kNbAX/dY9YNlMgWUwEHelicFJc5cfaIRs6ovn5su+3n1pWnX+jKMN63mS6Est0OTWgPfUUmo8q0M+Ds8PJo5TEla8HQbgNoe26LRGRHm313rr1hGLzHVVCWfDFZVaug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=limonsoftware.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e9vXlOu4Pf2yJku7ILQkWxhjMLuSpNOIOA/e69w0NM=;
 b=WQvC/+Px82gi34JP63/AJJblBGC1gsG7mTCVIC0x95pJ6n805D45uDGw9B868zB9V7CsCcitqRMNiGaM06hw+k4avS1/jZQ4ELIblETpoecDmrNkPGO3r1AlrHCQPsqruEbmEoURc6j7G+tq9/A28jW9LaQnxUngg1bu4139v/8=
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by PAVPR08MB9722.eurprd08.prod.outlook.com (2603:10a6:102:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 20:06:35 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::2f) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Thu,
 29 May 2025 20:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 20:06:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxJ9fodQ8XytOGAMdd083hQMEzXwgVxQKiPaK8v3ef5NUTskHJu7RJIyHf+95w1vbzadSX8jqSmJ+kDnAJuieNn6lCR77VKF9658NQmsIaNyH1LqwB82PyAjxuMoInFoEoeOwpE2024svUPnKlW6UPEFDcXuqYFDnG7FkFCJTS2RgXzHDoexLKvBJA/s5t4FhVws7IFxNgQea9eNuCeYWYtzYsq5OPkVKm5SpT2eeVWKW/nRUIx4L/4H8VklZXrdAAe8Ha1qcRtSOV/POoSZ4k61h7MsG2fgIz0JYxQkX/ob8i0PrvCKUvhdeTosagQ7N9K6zBuZhYmUuqm8TiZVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e9vXlOu4Pf2yJku7ILQkWxhjMLuSpNOIOA/e69w0NM=;
 b=E02TkTsadb3lbIgZEKfb8Od+EjZ5xF5ay5pFCxIcVzJ8V6tVyADYzUKq0hLGN5s2k9PubR7YfAi+R0AbQc/uyruaQBdTCxMgSseC0esS+guBRyK10YWyxcMzyp5WK0QZABg+TsZNKcY8iuOVdKvPpDTeieMjG2YdR1Jb/8vwQUCsuDArZ2lWw8qSY0yKVpPk9SCxmsDj5VdCbD48oadJmGnkhM+1wmWF2P6UaDq2nhGVtctFT0EZGzBerRXtqmg12+KfbUwlBMYgh1s383GJSRdq4lke4+invzOoMafbRMD84VPDy/RUd+fCbfYtw+pOl8Iv3EXGuGdDGM1dcINeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e9vXlOu4Pf2yJku7ILQkWxhjMLuSpNOIOA/e69w0NM=;
 b=WQvC/+Px82gi34JP63/AJJblBGC1gsG7mTCVIC0x95pJ6n805D45uDGw9B868zB9V7CsCcitqRMNiGaM06hw+k4avS1/jZQ4ELIblETpoecDmrNkPGO3r1AlrHCQPsqruEbmEoURc6j7G+tq9/A28jW9LaQnxUngg1bu4139v/8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7498.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 20:06:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 20:06:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anibal@limonsoftware.com" <anibal@limonsoftware.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
Thread-Topic: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
Thread-Index: AQHafVvBIZrBd8pWu0G3A9LhrwGAlbFIQMCAgABJEICCpCWeAA==
Date: Thu, 29 May 2025 20:06:01 +0000
Message-ID: <FB405ACE-51BB-44F0-B449-EAC18194F176@arm.com>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com>
 <20240325101809ec807440@mail.local>
 <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com>
In-Reply-To: 
 <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7498:EE_|DB1PEPF000509FA:EE_|PAVPR08MB9722:EE_
X-MS-Office365-Filtering-Correlation-Id: 53582da3-8933-4872-caca-08dd9eec4f55
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WkxhelZ1M0M5Y2IyQndnL3Y5VUJPNENoa3BWZkpCYVFlU1V4Rzdxd0tLYkk3?=
 =?utf-8?B?MjRXY0MvSWZHTTAvY0lndlJYR2VZVkZOcFVDU0hrQUxSaHl3RUVvZzNlOVFp?=
 =?utf-8?B?NkFpdjZpc3locnFVZXc4aEtHYUtUTDBKOUxvVHhBdUNUK3Bjdi8wZ2pEM0Rk?=
 =?utf-8?B?ZkhablVoOGxsc3UwVjdrUmtqdTluMEI5WXdmQ0FEWFk0Z2dOeW52bzMvSXFZ?=
 =?utf-8?B?a29ZVUNBTk53MFpVR0dBR29XTUhvcjk3emNxandlVEZnS1luazFTTHpHQmVu?=
 =?utf-8?B?SFpjYm1wc09tcU1oQytGZUFyd3VPR3hwcHNuNHhvSG5yRnNMNFNWNitYc3kw?=
 =?utf-8?B?RHp3TitNMWpPK1VYMWptTUNMT0N0YXpxS2NaVEF4ZlVoS2pEL3dlRFJSYmJQ?=
 =?utf-8?B?RGRqZjJ3cTRSRi80ak8rcGh1YlpXY1EwM2RURm9GemwzWXZJRUdVT1JGSVRU?=
 =?utf-8?B?ck8wQ01PMTJQNW11U21QbVNpTzdoclAwaHRRZ0RDejlIMlowVVVTeEJ6SjFx?=
 =?utf-8?B?UTFqdDBkTUp3K3NRS3k4ODY2L01WTldDME4vcm1GMmNucW15MmN0aGtkZjV6?=
 =?utf-8?B?SVBzUnc2NHh0SXV0US9EZGw3cGFTTFd1eHE0amphTHhmTW5DZ1p2TWs3YUxk?=
 =?utf-8?B?eHpBV1I2Si91dTFpZWE2UnhybUNlVU1Meng2QVRTK24zc1BZSFo3UnBNbHZk?=
 =?utf-8?B?UFlhK1FiRUEycjc2SXRocXdRQjNJdGFSczgxZVNjU0JIYlRXYlp2MlJZcDlD?=
 =?utf-8?B?VG5MK1lxVHlPN0xxZmVlR09oV09BTkJFOWhQcGFFMnJDSHhuYlQwM3kzMkt4?=
 =?utf-8?B?RDRWdHc4c3N0Wnd2OUVIdndPREJwcGo5alBwcXY1R3cxK0xacURUakdWdGM3?=
 =?utf-8?B?UnJzdmtpcXZSKzdLcVF0RDB6aFRaNTdwTjVGTW1xUWJlOXhZakM3OUUydzh3?=
 =?utf-8?B?NHBTbTF2ZXFoR1ljY29NSlJhU05RTDJHaURkSHJIcURsVHZtSXVCZ3M4Vk5J?=
 =?utf-8?B?QUdXMmt1bGlBdEx3eFkyanVEeWVZMGRsb01ubGFHc0c3QjZrN2NSUVo5aDkw?=
 =?utf-8?B?Z1lFRTV1QXM1NW9PTVVaVXJmWkNsQklRTGd1N1JNUFlQZE5kYWU0c01welJ6?=
 =?utf-8?B?VVJRVUtrVmc3S3pmT09YRmFRT1VnVkk3QStON0lNeXNhWks4SkxPODE3SnFj?=
 =?utf-8?B?cFV4NkpzOU02NDhQRjRSWGMwQjB3WC9wbVIvNkF3UktjcVgvdmNDVG5oK1lV?=
 =?utf-8?B?TlFvclFXaFVBbWVXTytpYkh4eStFL0JXVVUrRTRyTGxVMVZCazdIYWcrLzJ3?=
 =?utf-8?B?QlZKckpUdk1aUi9FeVpFa0VkWWg1dFFteFE3ZlgvVjlwZVc4SUo0amdaZG9w?=
 =?utf-8?B?ME5PRjJKc2RWcVVwWDNDVVFBeUNWOU5MYkZHd29XQzVIVkNlUHNaeHZXWCtO?=
 =?utf-8?B?QkNJUU1MRDh5WEU2dUZ2RW8xazVVanZUOUU1UzRZRU4zZWk1ZFBaendDNExO?=
 =?utf-8?B?Y29tR1FXME52eUhGcWJxWmREdzIyYmcvdGlmdnQ4K2lwT0J3Z1pUWnk4RVQr?=
 =?utf-8?B?ancxTnV2QnVKOW53VWRsUHdZMlplaEM2VGtxMGJLRktGTEVZWWFsSWVlMTli?=
 =?utf-8?B?amZ2QmVqbGYxbUdHV2ZTdm9YT2tGT0EvYTRoRmp2ZUNRQ2VQUFVVMmIvOVFP?=
 =?utf-8?B?ZkJSSGZ5b3dkczJlNGlTMHI2Zlo3OVdOSTRuNmovc0FkMkp6ekJRR3Z0c1c2?=
 =?utf-8?B?Y3VjZ3VKRjFuRjNta3NvSkwxTnpaNVJFM1FMK0pZZi9mTmxuckVJaUp3TWF6?=
 =?utf-8?B?NWRjRFRlY0pBMXROb2NqODZBM1huV3ZZZUlUNHJCN1NUbEhXMk5NZUpKU2xO?=
 =?utf-8?B?Q1NsNDZkOFplSW5tVXZtODFHTmF3eFBHMnhCSUhSN0d0akdpWmVUcGRnSEdm?=
 =?utf-8?B?bFU1WlRwVmJjcUhHNzBrem51eG1zRUhHLzcxZEQyVDBpY2FkdDQrZHA5WmpO?=
 =?utf-8?Q?9eXkPpVhHHP2KRTSqS24o+86+djEBk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78852FD04DE5CA458A165FCFA8F71AFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f69d1f4-2194-43e4-bc00-08dd9eec3bf0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|1800799024|35042699022|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUN1VUZMcGtWdDA1TW9acjZEVkJSSWlpZW5RRzVkWm1nQmN6bGNlcVNOOUxi?=
 =?utf-8?B?L1ZCQzZPMzgzZ2RsR3FCTWlBMjJJcW1kSy94NDNTMVJVN2FnV1hJbXpsVmE1?=
 =?utf-8?B?QlBsQ0lINGU2VUtlY2NVL0F4OFVQbzFGL2lIK0lZeGJRUW9wWHVlMi9DTXdh?=
 =?utf-8?B?Z01TS1dwbFFXaktneHlZd2V1cW4xMTlLU01jRVpDWGo5by9GVGR2aEh2QkJE?=
 =?utf-8?B?WGZrd29qVzU0d3hzcGRYWXRpYUhYckFxbEhJZTBaVXQyYlgxamxKblUrWWY1?=
 =?utf-8?B?UjlrM2VLOWhFT2JTa2I3Yjc5eUxsbHQ2ZlYvTlBnc2pubVd4T1pXeFcwN3Br?=
 =?utf-8?B?U25WSTJkajcwUzduNmtDSXBwbVJ1alFKSk9iaHE2OFR3SW53ZjZ6S0pWS0pC?=
 =?utf-8?B?Z2lLeWRuMlNYbzhBY2JVaVFBRzBPbGFMM0FXWFJzZEU0N1EyVjFaeVMxZVZm?=
 =?utf-8?B?UnM0NVdoL2dlOWRxbFRvZTd3Ly9OUnFRRWwzbFp6L3NEa3VQeU1JMVNzdW9P?=
 =?utf-8?B?OFBIRVRVa2Q0a2hndGwzMEFJUDl0WEdiTHhDcSt1cFc0MlV0YVdCMUtCVjhQ?=
 =?utf-8?B?N055cEo5dEZYT3RwUmticW5TWXZKVkpaTnJuZHNxY3Z6RkV2NTB5VkNYbkt6?=
 =?utf-8?B?ZjJybUJFbjJEMEY5MG5xdnRkZWJ4QmFYeG9sWG1wbCtUUmpyVW13a2JTUWhW?=
 =?utf-8?B?VTFqeG82M1NWUTR1MWxOZVdDdnJhMzJzMlBham4wZ1N3ekRiWmY0OVZsdXNM?=
 =?utf-8?B?eHNSZ3d4ZmZYUGtERTBHU0JIbGJrS0JxL2drc2xtVEp6ek94YVcrZ29hOUor?=
 =?utf-8?B?dTM0NWpIcHFwRXM5R20wVkNFamxOU3hGbHBQR1FrUHB6VlFKR0F6a0tKOURX?=
 =?utf-8?B?Wkszak8ydU9QcTROMk1zN0c4TldyOFFKdHRCZVBRLzZDK1JHZy9YRlNpTlF2?=
 =?utf-8?B?WWlOUlFFRnR6NTlUL3hjM0JqL3FjYWNBVUZkcmluYTFvUFdqWXJEZWoxZlhT?=
 =?utf-8?B?UUdWOWxxaC9SWHY0b2xhcXNFTVJJNTRqRnBLYVF4c3VDcFBIbjlQZXdXUHhn?=
 =?utf-8?B?N3laQzQwSUN4Vmd5SUdZWkNpZDNRYWdTKzU2TFM0aGdBQ1dkb3ZrQzVqODJZ?=
 =?utf-8?B?czNjZVZkTjFndGNRQ0k2SUpzdXN3TjVydTFGeXQwVUxkcnFmUUwvMHcyL3Vq?=
 =?utf-8?B?ZVFmRE5xRi8rOUh1bEpHWDJGVzkxczlEd2RJTTJtUjJ2TngxR1pQb1UrVWlY?=
 =?utf-8?B?T0ZNbnM4ZUM0TTNCZlFWNDlWVzhnNk1uMG1zYjkyOGVwcmxqR1p0WW5oMUI2?=
 =?utf-8?B?Rlk0c0xJaWR4SlBwd0JYLy9NNGhhSTZIWTJnQW11TjhkWmdUN0ZkZnl2UHQy?=
 =?utf-8?B?Q1BRTjh5clFLZVpDUFhPTzM1bmNBL3V3cXJQR0g2bENxcitDQTQ3RGpNYlhn?=
 =?utf-8?B?R1dzZksvRWhHeVdlc0xRVE5DenlLb0pNNGZIOTIzajl1V3k1dFNXVEl6Q21P?=
 =?utf-8?B?R295U21peENTamZBUmQyZmprSmlUdXZwZ2JiMzJPNWQxZFk1KzUxeHVEK2xY?=
 =?utf-8?B?V2VRWlViME1ZUGk4dWxyQUdvWk9pamhnTXNCNjEwQjB3R2lvOXlGSXphNWRR?=
 =?utf-8?B?ZC9LbWQ0S2tnc3o2VEdmeWVQTllNL05GNVArNVJBd1BWQ0pHSXVycHdkbnpp?=
 =?utf-8?B?eHJnQ2tHVWs4SVN5Uk5JVEFyRStxK3MzZmJoWkRHVjZ2U0dsLzhrWjlQaC8y?=
 =?utf-8?B?d2tTSVNNSllqK2VxeVV4M3l2TjJMK2Rwa2RoN3I5K3hITTBXcytwK3lYaDFj?=
 =?utf-8?B?UndkbXBDU2pSY0RnS3RtYWpMYkJRN2VWeXBXVHNwRHdVMmRwcHh0YStwK3Nq?=
 =?utf-8?B?NWU2VnBPeXN3aFhxZU5jUXVSejhkWVNzZU85MW53b0tkQ0NYS21BYWpjSUhy?=
 =?utf-8?B?amlxV0pkMitHQzhYUE5kS0FmaU9Vam9aV2xza0pYeG9wZkpRSldWMDNjcGt2?=
 =?utf-8?B?cmY2QzZkYjVic2I4TTFRTXRiQTFmQXNMdTlkZWlRVmNHaEorTzRFTDhHd09q?=
 =?utf-8?Q?dkx/dB?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:06:33.6034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53582da3-8933-4872-caca-08dd9eec4f55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217435

T24gMjUgTWFyIDIwMjQsIGF0IDE0OjM5LCBBbmliYWwgTGltb24gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFuaWJhbD1saW1vbnNvZnR3YXJlLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gVGhhbmtzIGZvciByZXBvcnRpbmcsIEkgd2lsbCBhZGFwdCB0aGUgdGVzdHMu
DQoNCldpdGhvdXQgaGF2aW5nIHRvIHJld3JpdGUgYWxsIG9mIHRoZSBkb2N1bWVudGF0aW9uIGFu
ZCBleGlzdGluZyBmaWxlcywgd2h5IGRvZXNu4oCZdCB3aWMganVzdCBub3JtYWxpc2UgdGhlIHBs
dWdpbiBuYW1lIHRoYXQgaXQgcmVhZHMgdG8gcmVwbGFjZSBhbGwgLSB3aXRoIF8/DQoNClRoaXMg
bWVhbnMgeW91IGNhbiBzdGlsbCBpbXBvcnQgdGhlIG1vZHVsZSBuYW1lcywgYnV0IGRvZXNu4oCZ
dCBjaGFuZ2UgZXhpc3RpbmcgYmVoYXZpb3VyIGF0IGFsbC4NCg0KUm9zcw==

