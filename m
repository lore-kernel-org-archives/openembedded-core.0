Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8545C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 13:10:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.web11.85984.1749561030354706273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 06:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bX+wg5I6;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bX+wg5I6;
 spf=pass (domain: arm.com, ip: 40.107.159.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x16zVfFFtKQXw6xccUA/St+6Ht4P4vGlJSk/bJfDpNHh5mbY+2mPlIuxzaXchh+kgMQ2MOBP7nLOQ6xGbJHfkdckzt59gu/uBU2HW3rh+fQWo2Hx03/H23CHx4G4x0bOjNs584Gj5NKdm/sK3Bq5Y3ZZVvFD0OrtOfjRV7AQnZd8hELDaHZZnUQ5GTQUv/24hLgg3hvL9rqQdUSXItwZqN9d3tv5sZ2LWKx7ipLHXmaGVa++URc0PdcHTOG0GDt8zRuMy/G7EVah8atWzykZMy9UR343A4paOA2vFfTlBdE/ZKi/wo6yDnsKbixFb9E+jKmNKb3Iy+YxfEkRmXgfdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn75IBV15ggTTgUef11sWatTuHumt2QwE3sUuk+hzRI=;
 b=cTWqwVHq0h1lOiaQqGLGBu2FZQAs5DcIKRf2FR4e03Xi5lOSdaj0hAJRNT9+mJj7tFwtFfOBBtkuKCC0ISeX16CgalO3x7iFnk7sFM8EEQotY30CLJMZGlmxvvo4SHsrno7Ze6krQBU8oIbk/Weer3YR3RJ51wJEvq5tvC0mktnHLZuwbZL2K6VZNlCdt/nJ9C7PggOH+65WJwi3TaxYw+RQ5munGuWWB2/usPKjB47kDYhcUGF85tF38GqPRl5cROqyT5NT1dcdJC3/2ZzbZ41uaWE7mjuBE5/bIxTkKBDEKugNv23/mvnn4LO+1gzHlxWZwi/YUwWN9uyG/pkPSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn75IBV15ggTTgUef11sWatTuHumt2QwE3sUuk+hzRI=;
 b=bX+wg5I6tzQQL7CC916+H+ud8udOEzpCwJ+aP7WK35ksJa2JftjAqWAo0ELkZqprN3s/XToqss2autqWEVU70FXKYF1Bdr8BSWCHVd5+nEvVCsd8sochnA2+tdkgUzgQX0MwzNKBCF8Fdn4bmaeGFuUMOj6dkCpBldLkKWRwZx0=
Received: from AM0PR02CA0187.eurprd02.prod.outlook.com (2603:10a6:20b:28e::24)
 by PA6PR08MB10442.eurprd08.prod.outlook.com (2603:10a6:102:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Tue, 10 Jun
 2025 13:10:25 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::65) by AM0PR02CA0187.outlook.office365.com
 (2603:10a6:20b:28e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Tue,
 10 Jun 2025 13:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 13:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnI7nTUKqsyVci98lcUQ9cPWJty+z8rUxa/BrrNl2q5a/NHITD2gBLAN7E/ipZrjdUdNlrYrEA5O84XPCf74eN6o19koPC6LcUhAHQh62DWPK8UxKQjArV25PmZchSlP3zl8anpQdcYWKU7iXDZJu5YCzy5JQgQNZSFT2yNYl1d2vA+0JisgQwcHIbsTabDKWPjJyl1idLJAEVZqmyfvtcqixKUMhwyJYwBg6IHswxpwDYxm0tmFbej8jm0kp7oynqSkHiPrgT4tMH33yP4hrRRaw0fcOKkZOfS5TwVFfc1MQewBHQ/LJgFiAR6Qki9UYHAn4HSqpKiUL32VwJ8EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn75IBV15ggTTgUef11sWatTuHumt2QwE3sUuk+hzRI=;
 b=CokgFVxaqJo0JjodMPG/pyGA0mGwxhvg4QwWlyixY26T7RmFy0BBAXC4oBpH8sGzJ6jTygE5E2AuHKezOwa56yiJbPzMFtTB8C6fjcqxXncfGRTMOPKwjj7YkQ/KReZVB5xcgM1hP6+7oVFAf1P7PzEVSFH7Gpzalpx0zgVK3fWc6BkauTMGbNXiWNNv91cNIy4eA2T1ZO86MsBV9ajeuVy2qOXTjvk7Bvo1QVQk+BNamXUxvZ8RYrEPaBsHRnZ/5n139qs00z3fB8bfQVLQ7AyYkih9Lxha4ZfxJ1gzkFtTRpbcl24SuBFTxqgu6u2XMO1uT4piA6w0tftDX7XS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn75IBV15ggTTgUef11sWatTuHumt2QwE3sUuk+hzRI=;
 b=bX+wg5I6tzQQL7CC916+H+ud8udOEzpCwJ+aP7WK35ksJa2JftjAqWAo0ELkZqprN3s/XToqss2autqWEVU70FXKYF1Bdr8BSWCHVd5+nEvVCsd8sochnA2+tdkgUzgQX0MwzNKBCF8Fdn4bmaeGFuUMOj6dkCpBldLkKWRwZx0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7622.eurprd08.prod.outlook.com (2603:10a6:102:240::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 13:09:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 13:09:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/sanity: add test case for the
 recipe-naming sanity check
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/sanity: add test case for the
 recipe-naming sanity check
Thread-Index: AQHb2fQ5UfhI6dgjvESp602WzqmATLP8TSmAgAAQyQA=
Date: Tue, 10 Jun 2025 13:09:52 +0000
Message-ID: <74B8C51A-B704-40A7-917F-725C24FF1CA3@arm.com>
References: <20250610104115.2291973-1-ross.burton@arm.com>
 <DAIUBVF7DA8F.3244Y9H8MD9LO@bootlin.com>
In-Reply-To: <DAIUBVF7DA8F.3244Y9H8MD9LO@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7622:EE_|AM2PEPF0001C70B:EE_|PA6PR08MB10442:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d64ee5-a1c1-4761-33e1-08dda8202a13
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OVJoNFpCYWxTd3FOVlRHa1BQL2NuaUdnc25nZWR0KzlPTUhNOFk4T3V1T0Ez?=
 =?utf-8?B?OTg5bzdSd3IxSHYzanM3cE5JL3NwekRRazcwTmNkOXNGU2U0OUh2Rnc2T3BQ?=
 =?utf-8?B?MXo4NGFtb0llS2xJdUF5R2lIU2pnMmdXOEJtOE5LbWRJNlVOZDNKVFpac2JD?=
 =?utf-8?B?MmMwTWtmcm5XSGZtaEs5c3YxV2ZsekRna3BVMXZGSGo2WE02YVR1dkMzeTM4?=
 =?utf-8?B?L05tSjNEZWV4ZkZ5Rmlha2tTQmplYlFtVEVybTlXbWdudHU1Tngwek93Qllq?=
 =?utf-8?B?VFFqNjlKSUF2NWt2R0FPYkpUckVaOXVBTjZ3djY3dXdBTlh5VEEydjFTSTFp?=
 =?utf-8?B?TXNaVGRhblExdnZ5Rk5ISlNEWThheXBSM0pqd0tneDVJaDdXQmNObjdkQUdN?=
 =?utf-8?B?ampFejZ3VWJjcDhRYnRHSWZjZi9semNFMVV4eU9DWnhmSUtkc2FROWFWSDBW?=
 =?utf-8?B?MXZmY3Mrb3FUZms4K0d0c3phcUZ3bm1uU1F1UVdlLzRXeWlwYzBaTXN4aW50?=
 =?utf-8?B?OEY4ZExWOVpHUEQxdWROUUYzZzZqd01WeDdCelJYK1d3MUg2RkY4MWpQY0k0?=
 =?utf-8?B?WGdudDlweHNWR1djV2dUOEZld0R6LzFjVzZiWklzRnNzeWViaUFQZkhtK21N?=
 =?utf-8?B?b1dOcjdlNkZjczBwWVE5d1RicXVMVmpKVGZBR3Rqa1pTbUVsS0J1dzhtWDdI?=
 =?utf-8?B?YnRtS0JWR3RkTVM3bXlVOUZsSFFqSlc2VHJJTUxRUXJ1VmkzWlFZSTc1UXBV?=
 =?utf-8?B?QXo1R2U1VWIwUnVTeEpNZDlIM0VIQTZ0NWxzZDdlN3ZTNzlHWnlBNzJZTlBm?=
 =?utf-8?B?d0dBeWlnL283TXdUNjJRUDF4bU4zWCs2Y3JZcUZNSCtGTHRIaDljVDVYSWwv?=
 =?utf-8?B?aFA3YjBLRlBZVC9ITE1LTnUwZmlMT2NuaHR2Z0dLOEtRYTg0Y1pQSkJBUHA3?=
 =?utf-8?B?WjBpMDA4dDltbFZwakhRK042MjNscjZNR1hoQjRJcVVkS1YvRU4vZjRFUTdu?=
 =?utf-8?B?bWd3RjJodXY5VFZGNHNMYTd4TEJzRmhWYXhGenBsYXB2MEdQZVE2SThhSlpF?=
 =?utf-8?B?Mml1R2Z6QWp6TE1yeVIyTytLalNmck1vWjBEZVk5ZzRySWhNcW43cnEwY0tE?=
 =?utf-8?B?d2RmcXZ4RFdSUTc4K01pYXh6VUZvUDdFUWFQaHcxVHNHUmozNjZzT0tQQXNw?=
 =?utf-8?B?UWVMaDFyT29PNVpNcWJCK2tNa2U2bVg5Mk1oK3R4UWd0dm8rNUJ6YmpHcE5G?=
 =?utf-8?B?SlVTUUZkeW9XQlFQN2hYbzdKaTBxWlB4YlRyR29VVFM5dHc5Q0JLVEkxWEtO?=
 =?utf-8?B?eE5kUEZsaS93a3BubFhrMWMxc0FaRFRXZTFweUNEVVJPcFk2dzcyZmNyb29h?=
 =?utf-8?B?OFZHT0RkUEgrWUxDR1dYajVlVEdGU3lIejFvYkJVRzJpWHV6OVNOTmp6Zmx6?=
 =?utf-8?B?ZXhoQzRlM1RLSjlQcnVRSStkMTZjeXZSZlVHM0FieGo1N28yVHhhUUJlZ0t2?=
 =?utf-8?B?a1Y5VFROeUs3bGtncEZibWQvN1k2WkJMU2Vpa1I1b05tM2VkZG9wREIvY3lQ?=
 =?utf-8?B?M01EQ0NHRGFaMXZjdHgrYWZtd1hjU0NxMUNkYWgrREFaU1ljL1RPUmljbk5X?=
 =?utf-8?B?bkZXNGt0TEJ0QTlyU1dXbFphZlhaZTl0S1MxNHRhSFBraWYvb2d1R0J0RFdL?=
 =?utf-8?B?VzF2U3RnSnF2OHRYUXdwTmtCUTFMVWpucU1ReGs4ZHJjazdjS2FNY2VCVmsv?=
 =?utf-8?B?RXlvQmZlMXF6Nkg5THBuc1cxaEFmUVlVK2o3RFZDdk8xclQyYTEvVzBSa0Jx?=
 =?utf-8?B?V0N1QitkUWUwTlNFQUpOUFNlc1BxRTJYaHQyNzMyWDZmZHc5VlBzQUNXc1BX?=
 =?utf-8?B?akdhVG1URUFxbThwVmFrSlo0U1pZTWdiTEVTeUlUb1ppRkNodXVQM3BPUTAy?=
 =?utf-8?Q?+2PzDyyFUkI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADB938BC9B3ED34798AB937BF09954EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7622
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	072c6374-7cfe-4653-5f01-08dda820168d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTd4RCtDNGZYRnllV3AyTkNtK2lKRXJ2Nm9XU2dIaHNRSFNZVnZCdFRRbUUv?=
 =?utf-8?B?Y2QzMkpzMi9aMlZYNldGNnZkYTUzRHJranArdm5oeFVrenBpRndhUm5IQjNU?=
 =?utf-8?B?Uk9TZ2RpUUtGc0g5QWRheDlURGMwYllHblBRNVdPQ0hWUUtrV3h6bTF5Q25t?=
 =?utf-8?B?STByWXFGL0pXYkJLWm5XMXhsRy9heVBwVEFMUXNDRUJsSHdSejlKT1pDMWVx?=
 =?utf-8?B?dDdXdG9KOFFSU281UE44TStNaDdFV0FpT1lkS2g3NWZXS3JmUnhtaFFua3ZI?=
 =?utf-8?B?dERHb2RhdGp4d2FSWHRLV3VOSjBLTkpBZkNyaW1KMXUwQi9seTJheEhhbUxu?=
 =?utf-8?B?b2czVE9IVFRaamI3RzNRQStWUzFpeWhuNS82bDR5RjE0TzdNU3JOMmgrUGVm?=
 =?utf-8?B?TnVtTmdPdEw0Nk9TUzBCS0NJU1Rzb3dKRmpUZDZRK1RQMTJUREZqaFJoaWF3?=
 =?utf-8?B?OTBtZmxiY2VBenlVK1BHaEY0Tm4wZmt3RzVvLzRoSkVSVU1vNzRJQ240TnJH?=
 =?utf-8?B?QVpCa3AzN2QxSFlOa1ZhK3hsRll5Y3U4Q0tEb1dNcGVZZUxGSmFFWXNRK2Ev?=
 =?utf-8?B?RG9XZDl4Y25PM1NPQ05zYjBqOXdybW1tcWJxa1VFSkx4ekREeVJiMVFHb2hO?=
 =?utf-8?B?QXBhQmJGb3VTaG5WVEh1SG5xYjFyM3piSVJuQ0RCTDVFUHA2dnQrNWc3a09y?=
 =?utf-8?B?U0NqRk9CQ1pFOTZsWUNXb3pQdWNvV0xkZHh5NGlWVjJINFV3VUlHejcxMFRN?=
 =?utf-8?B?MFdEdFd0aUY5UzJmamRzM0NrT0gxZW1YS1IwUkNaUGZUSVBUeS9QcERLeG9J?=
 =?utf-8?B?UEx0V3kzMWhONmlTaTdIaGZTUlhEV3NLelRTcFhSb1ZGT3NJWlNob1JBaGxQ?=
 =?utf-8?B?cFUrWndINFBOdmxtNnhkM2NPOUxIR04yQ2ZQNHV0TjJVd1hSb01vUTQrU1FN?=
 =?utf-8?B?T0pUSy9pRkoxdCtLbE0rQ3hsUElCaFRZWEt3bGxCUlR3aGp6bWFNYWVoeDRD?=
 =?utf-8?B?aTVvUkNFRFp2WFVqdkx3cEhQTmsxZ2xwdUdwRG9hblIrQUFOTFBWdnFJR3FN?=
 =?utf-8?B?V2gyOFpGWU9LSjRRQUxmUlIzWi9iaFdNL3dqdUxSRTdOSUIwMW5YOE5FZUFM?=
 =?utf-8?B?NWRuOVEzODk3cnNHZXJnK2JyeHdWY1R3dzlDYzRnb24vUnE1VXc1V281aGJS?=
 =?utf-8?B?QTE2RzRoU2JJYk9YbW9XaTM5a0ZpV0FGNXd1NkdJWkdQS3RrT3ZnRVVjUGE3?=
 =?utf-8?B?ekhjWWpDL1poMUpNeExaK1R6TmNjSVlrNWRleFgraGdmeDFZL1NMNndmaXVI?=
 =?utf-8?B?b3N0NU5keFVlUHlJTzd5TmQ4S21ndGl0UGxvRHYwMDBzVVBESTI1OG5iUkY3?=
 =?utf-8?B?bUo1Y090OWtwdVUwR3FtdmZqcy81c3FZbEZ0dmRNeDNYTG5VTTVXNDZPdXVE?=
 =?utf-8?B?TEFPYTNaOGFpOWh4NnhyMkQ4VmNwZ3VBeXJVRTgzUTF3bHFxalJUbmNSVUJk?=
 =?utf-8?B?UHkyMnV5MitNWVg5VXEzRFdOSjk5V2JLS2FCMEhpSzh6NVdmVUNUUExJM2Vp?=
 =?utf-8?B?Q3dCM0RXNnBPTXA2eWhHT1c0dnJKa2wvQk41bXpTc01IbkdvZThEaHlMTFBK?=
 =?utf-8?B?ZmdHeFRHbk04YVNrTSsxajAxWnI2WmJ4bnd1dEdoRW9vYmI3dGxRZllVcUw5?=
 =?utf-8?B?VGVKTkw1dzFjTW5UU1dwSENwQTdUQnZRZENOcGVFV0FtdkY5eVZFUW81ckNC?=
 =?utf-8?B?ZmdRaU5oK2JjUmU0a0xwNm9mRk5rbU5QK3BZbisvdWJ0U04zNFgwczRBTWdx?=
 =?utf-8?B?LytvNFc3bEhMZWZaSmo0c3ZQQW42OEc3NHZGZzkrZTZmSTBWWm0vd2RZb0dU?=
 =?utf-8?B?U2lZbzZsRXgzNDFEQTB3VG5ZTVBvNE84Ujg2N0ltKzZqYnNncS9NTnFTVjdS?=
 =?utf-8?B?NGg0akRhRm5LeWptaXFkdkdsNUpwbytHL2U0YS9zWkE1YThzc1NsRHpzcXRE?=
 =?utf-8?B?VDU2aytPZk53PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:10:25.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d64ee5-a1c1-4761-33e1-08dda8202a13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10442
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 13:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218353

T24gMTAgSnVuIDIwMjUsIGF0IDEzOjA5LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUgSnVuIDEwLCAy
MDI1IGF0IDEyOjQxIFBNIENFU1QsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPj4gQWRkIGEgcGFpciBvZiB0ZXN0IHJlY2lwZXMgdG8gbWV0YS1zZWxmdGVz
dCwgYW5kIGEgbmV3IHRlc3QgbW9kdWxlIHRvDQo+PiBjb2xsZWN0IHRlc3QgY2FzZXMgZm9yIHRo
ZSByZWNpcGVfcWEvcGFja2FnZV9xYSBjaGVja3MuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gLS0tDQo+IA0KPiBIaSBSb3NzLA0K
PiANCj4gV2UgZ2V0IHRoaXMgZXJyb3I6DQo+IA0KPiBFUlJPUjogcmVjaXBlbmFtZS10ZXN0LW5h
dGl2ZS0xLjAtcjAgZG9fcmVjaXBlX3FhOiBRQSBJc3N1ZTogUmVjaXBlIHJlY2lwZW5hbWUtdGVz
dC1uYXRpdmUgYXBwZWFycyBuYXRpdmUgYnV0IGlzIG5vdCwgc2hvdWxkIGluaGVyaXQgbmF0aXZl
IFtyZWNpcGUtbmFtaW5nXQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzE3NzUNCg0KV2VsbCB0aGF04oCZcyBq
dXN0IGFubm95aW5nLg0KDQpTb3JyeSBmb3IgdGhlIG5vaXNlLCBJ4oCZbGwgZ28gYmFjayB0byB0
aGUgZHJhd2luZyBib2FyZCBhbmQgZmlndXJlIG91dCBob3cgdG8gbWFrZSBhIHRlc3QuDQoNClJv
c3M=

