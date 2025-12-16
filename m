Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C60D637B4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 21:14:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4787.1765919647078455445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 13:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nlfx0jTT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nlfx0jTT;
 spf=pass (domain: arm.com, ip: 52.101.66.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fiGGb5VjFqj0g9V7Uz/5BQ3oJ7NeaUgQTFh/l4IfmWyjJFGi6SWAblty9ZbmfknEGGA+A26h/h9xZ8pqmS0eK0mowj3XR+45BK3g1TQrhbpf76jRTzo9G9l/8/2F7X/Pme+IWR6+aGs3IH6sOFeOrhBAj0QzqfcxhpGrkM71/TgE6SNbBKdu0K2Rqw+2gPcisgiCjVK51OhmYIMXR8SnqDahzOUxaGsFW2KxyI/M6tmyai0UFpY/sOqWgJFqk4xvzBHyjB8rN2m8sWn8+TFY/NQ5plc1B2lcP4Ses21OzgHMD8dINESPd4wZWvdlGPjev2dPvu7ve8qqO0aaoMxYQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwJ9esd02ci6NzrQ9JQRbDPYv2kLLZdqSACU/3cRHGE=;
 b=wHedsj2KQDEy5jwBdr8oGXc7R2ZPMzLnT+oO75Y2XbkO7+LBULcc8MoUbQe5tEQ6s5G3mkDREFmwWcPMjerDdFZ3mA5PHO1wl2hjBe2W31AT+Q8MeikmLogC7y/WcDRZhlfzF+YXnBDfxsnW9FVHUtkrsSbNDaxikQKxBwnc/IXY5CfNOjwze6OQcZCgZHAb8NcMAI+J2si0cjI1s4vMd2Scb5hW3DY6cneBBadxUqd1zsFvDrgFJvfJd3fJtbww8nEkw5jgMSy2rEGR839+qUBGagNpIM3IyXvMnmagYjNAHCWrRAnUhbhq932sCNKdI6C6SIiQtaCat93dX9x7cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwJ9esd02ci6NzrQ9JQRbDPYv2kLLZdqSACU/3cRHGE=;
 b=nlfx0jTTG+tzSa79Fad7/wom5Ah48bCmR01S1C8CyEVoJCrm4jdY+stPNrHt0CoEjSlp8H1VdMRl1GI3XLyC9fyMKkVxpViCJ6nlRyYS2xgIe+MdDFmh8y6raPO65i8RaCxZNJcvJNNZu9fvwPPn+EJLsFWi4rOuHTD0rx03m0Q=
Received: from AS4PR09CA0009.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::12)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 21:14:01 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::d3) by AS4PR09CA0009.outlook.office365.com
 (2603:10a6:20b:5e0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 21:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 21:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvPosOzZpM+i5jC/nLLvotHXBxc9BH7mH9iVcKRv3O/Dxvhs4jMkWjcO4KuLAIB2MawZeNh9aYJO4mUUMUsE2lq6Fr8touosHZ2zukQFM6s6fhW+F5YX3QPOasVRf5vaNfHTTeZCwF/U153KCfzx8OA6tfnxSkjlSGheP3gr7eyQ3i5qqWknJYn7AySbC+jGohWuN/LoYAuG/i3EB0Btt8AEU5TVvtiB/eW7rmVjtxvK1n8LmdBU7+iElcRLJtu+O1cfLMykcQu4vbE/srLW/FScJGWH/6r0Goocw3QYfvOtLnkMUJi7Qlr3cX8mQptAOJVajjiUCha2fNMSSg50qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwJ9esd02ci6NzrQ9JQRbDPYv2kLLZdqSACU/3cRHGE=;
 b=MYpDMig1oPM2h3AAqKQk8Tfn9wpfTw1xDZkEWuyIqsDr2FsfaAAJj6iQvjHn8HBxn2AIHQF5ZDPEIJG16a8/WFPzjuYmdmVEXKVBJy7w7+nyKL5qlV2h/RkKkSkEOfOOtusBZnkhIBzcWAro6iil4D536Fv96NPycDzXqVohanr8icX5QiE0TS4vHhuEg7Y7As/f656g+NfwSS2fbztaoXDbY8nGnKHxa5w5JJkK4OIkXsLMASIVRK8aqAIfbUeANVP9gBNHjTuHqn3BbKlY1A5SUhH0MuFLZ91K+2Pfkru9Y6C8LhuPDe3XzS6zeWlvGPeRGTXA4CvH6dgKq0oTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwJ9esd02ci6NzrQ9JQRbDPYv2kLLZdqSACU/3cRHGE=;
 b=nlfx0jTTG+tzSa79Fad7/wom5Ah48bCmR01S1C8CyEVoJCrm4jdY+stPNrHt0CoEjSlp8H1VdMRl1GI3XLyC9fyMKkVxpViCJ6nlRyYS2xgIe+MdDFmh8y6raPO65i8RaCxZNJcvJNNZu9fvwPPn+EJLsFWi4rOuHTD0rx03m0Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 21:12:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 21:12:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
Thread-Index: AQHcbnmps++C1aWvekyiag/3bKK+a7UkxH8A
Date: Tue, 16 Dec 2025 21:12:57 +0000
Message-ID: <53587996-F67E-43F1-A6D1-2D8863D2A3B7@arm.com>
References: <18807B69349A79F6.984558@lists.openembedded.org>
 <c0d06db9-f163-4421-80ae-97136b09d6c5@windriver.com>
In-Reply-To: <c0d06db9-f163-4421-80ae-97136b09d6c5@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5404:EE_|AMS0EPF00000195:EE_|AS4PR08MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b7a403-cb33-4f9a-6776-08de3ce808b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MlV4aExSQmFHMmIxZTRNVExUYXcwcTIzRDlHVUlNanNESHA2eHd2eEZERjgy?=
 =?utf-8?B?WEdVVEdmMW0xek9JVVFQS3hMckhmWUZ1Y0h0VGhaRVU3b0xoYWd4Zk8zdHZ2?=
 =?utf-8?B?a2RFYk5pa05ZMk9pTkF2WU5YbUxCb1VLelU4WjdOa2RqVkFyVmRBL2xBcFdT?=
 =?utf-8?B?eUhDM3NiWnNqcWJ0eW9CekZPVGZvRTV3MDlYSllydEdTRFU3L1JMQzE5SzVE?=
 =?utf-8?B?ak1RaVpuNitCbWhTWDdKak5TbkJEdmZBN21PK0RDd3JBY2RSOFlvY2FnWkND?=
 =?utf-8?B?UUJYWjVkNmM3WEFkT3lrYkNBZlpwcU9SQ0RHUlp6QVBOdXB1bEVKT2lSYTFi?=
 =?utf-8?B?cjV2Z3RYTkF6MUV6am55MURDclJJVm5McFkyWDlyVEZRZXVFdVhXK0hxcU0y?=
 =?utf-8?B?M0xZWklYU1Nla2lRNWtzYzJwTWExdUF6NDdCOXBUVlU3TWNHWmtJYVZ2dFBP?=
 =?utf-8?B?anlESmcvQ1pWUUhjcFAvVG56ajBwcGJ1MkRBOVFpU3dsZVlFeVdDdVR0VnJp?=
 =?utf-8?B?UU1OdTdRSGh6WUlHbXhNUEtjQ3VnbFY5ZDB4d3pHMkY3dVNrd2laNHRlYkRH?=
 =?utf-8?B?NnhicTNFK2p5RFhzSFQ0dWd1L09Bb1U1WXhxdUk1cE9wcENWV1Z5RHZaWnNX?=
 =?utf-8?B?djNLdkR5b2UrdWo3VStsNHFmbTk1RGhscmFnMkI1dzlzTjJUdGV0bEFLK20x?=
 =?utf-8?B?NXBvSnNZU1hZL3V2cmFhVUgzczROZHQ3MjJEVTIyeTNiYUc5YTgrbnRab0dE?=
 =?utf-8?B?amY3RndwdEFYSkNyVVpVbW9XZURBaml3NU5YNnRDTTN4UXh5OWNLKzVaQVow?=
 =?utf-8?B?d1ZLeVptOEZ0eXhwRThZOUJRejN6aUI2ZzZpMUJOcXZxNU5ZcjhvMEw3UWFv?=
 =?utf-8?B?clM0eTNWajBYRE1Uc1pCOVlPSzVsZk5hU2kwclAzWkRQTkpvSnhwYkVlUU15?=
 =?utf-8?B?ZGJqbHlsTUVxTUViUnczcTRIY0tIcmZ5NTdlWFh5TFIzdHVCemZQbWw4VUla?=
 =?utf-8?B?N09XTmQwV1pva3hVQVcxQ2NTMzJ5VWZDNkYxRWFGVzFuR2I2NUIrcW1HdnMr?=
 =?utf-8?B?MlZ4ekcvbEpjdTNKNnRFMzUxeDM0OWZTV3RDa2hid0gxdzhXVDVuajFzazhE?=
 =?utf-8?B?Vkk4ZnM5Zy9KRUdJK2Zndkg0aGkyUXExbmtsTWovQnEyNDY1eUNWajMvTStD?=
 =?utf-8?B?WHY0L280SFh3bHBNVTI2VEFwU1Azbkx5a1ExK2xqSXlzd0s1T3NXajhxWEJQ?=
 =?utf-8?B?NW1XU05uRXRuZDhSSU9JTGtOczFYRU4rVXRJMUovRWZPMzhnSlhwcDZMUk1J?=
 =?utf-8?B?cnV1aFhOZ2k0cHd4bDVNRmd4bEszWXRwUDhONW9RbktWNWVOUWNwS2xZdlI1?=
 =?utf-8?B?b0pkcDdSdHIxRk4rR2wyTm5KeVZYWkFjTlZ1ekRxOTN2NjFVNnBaMTBlckZu?=
 =?utf-8?B?U3N2YkpqTElvaTZJaHhURVNUcWIveWRPYmNwUllmVFhrSVdMK3huN0cvZ0pI?=
 =?utf-8?B?Z2tFSWhxc3FMOTdScVJFMzJhQ3hBTmlUR2hMU1UvUGsraUFFblk0NGRaMmRq?=
 =?utf-8?B?eVE0ZGhRanRBZmF6TVY4Q1R2YlUwMmVhcjlCVkh3RmpWOGk3enNCUHVEOHEx?=
 =?utf-8?B?SHlhNTFqTkk2WU1sTWVDS0pyNTVIeXpMbVFVYTlicStlSXA2Q1BNQ1d1WnA3?=
 =?utf-8?B?V0hlVW5xaDNoSm4wbmx6VGJtZUMrM21CWG9pTTlsT2JPS2R3dldZRmRRSHlE?=
 =?utf-8?B?M2FqZnBrN1JHTjdJakZvWFdiY0RBZ1BqbGlyYWduSmJ3OWpwbEtBKzlxZE5N?=
 =?utf-8?B?UDArMmlXVFUyTFpMclZvUHFtNEM2OWVxbEdsZjQvTUhKdllWZ2NtbnBHalJp?=
 =?utf-8?B?TzZ3dkRnNTV5bUVuLzBXMkVXa0RWZmxRNTYwUnc0anhrNml2bUlkNnFvQ1pq?=
 =?utf-8?B?Z1Z5S01LZjZqQkJYNGozK0loUDJETlBsK2JIU280TTU0em13eC92Ykk5VUFG?=
 =?utf-8?B?ZnFOcjY4d092dGNTV2xUbE9GcVI5WXBNSjJyZ0VhOXc3R1FHNUtpQUk4c3ln?=
 =?utf-8?Q?gDZ4u7?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FF8F463578B7D4FADFA21C42B5CE2F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bde4a7e8-d0af-4557-15a5-08de3ce7e2e4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEhNNzkyUHVUZktEM3YxT2tsaytPc2I4OUFyd0dSMkhWaGZkYTJZeFd0OHpK?=
 =?utf-8?B?dDdlWG1JbzcvR0NYKzE2RGJpMEI0cEVHMXpVdGQ5TTRGRzdOQ2FTZHZGRFZO?=
 =?utf-8?B?T2tkbGREZkx6ZlZNNnN1TG1qTXhCOFdLUXFhWURkbG12d3kyT0YvU3RWZENi?=
 =?utf-8?B?cHZRMHMxMzR4VENORC9YeG93K3FLOVl6Q0wzdm5BblJwRGZ1S0JTczdneGdr?=
 =?utf-8?B?Z2xORGxWc3VuUUVNU0pIM3J1VW14TkRrVUtKdUIzcGRib2JyTlg2SnJJbmg0?=
 =?utf-8?B?TGRQOEwvejdhYjIvdThqa2IyTWNmbkovTkpRK3VVV0NLc2VlaWVXU1hyM1k4?=
 =?utf-8?B?NndGZmtKTncxWExsZER5ODFTb0FmK2tuaUhMY0NxMkRtNjZQWi8yK3FidzJT?=
 =?utf-8?B?ZzI0Uk1wL04vRHAvdGh4bTNjSU0yQWlCM3JkeTkwcWtOZXRPVzloVXUvSU9X?=
 =?utf-8?B?cWpQMVgxam8rRUJVM201eEM4WGRVQkdTR3FPVVR2SmdZa3NHYkNLeGR5aE5q?=
 =?utf-8?B?ZEtBeDgyazgreFVXVHhFODlMd2IydGNwT1U3N3FXT3N1VVVsbzc0RXFBcUNp?=
 =?utf-8?B?NXZpZ0YwakZCTHVRQk40YysrbWhvdTlvcXppZGVKZU5IYURLL01qZEtZWnh6?=
 =?utf-8?B?bWpMTUgvOEdIL05lRnI3T2xhYTVuaUZWckhlamkrY2xQZlVITlYzSVlHamhR?=
 =?utf-8?B?OGdFTmJyeFlzWXRzK0k0RXE2WGRac2dna2tqcUI1UnVMTHQramFTWnFDQkNW?=
 =?utf-8?B?Q2tZTHhOODhHbVJsWjY0enRRUlpSZlYxOTJJMEZGeFY2Ty9vT2IrWTNoSENh?=
 =?utf-8?B?T3BFVlNOUTVBZDFSK0E2WmVxV1B4OWxUZXZpSFFoQksvNmZIVSs3SnhuUjgw?=
 =?utf-8?B?VTNDYWV1ZC9tbTNKeFFOZ3ArY2swU2lCSnN0RjZtY1dqdndoMzV5YUNhdm4y?=
 =?utf-8?B?NzRnTU9WWVlTUXl0OTVOeWdoUlpiMVNpcjlZT2RLRFNWL0hCNVAzWnd2MFhM?=
 =?utf-8?B?ZFgxUGF5WWhSY3JsQm5udGRyS3lGSC85WXpjbzBGcGFOd21nWmJVbWsvWjB0?=
 =?utf-8?B?L3B2RUxhRnNpRnRwWlhldEJLMXp3MTRvY21FSTc1MlNGNmc4bTFUZGFZMlhz?=
 =?utf-8?B?WUpPem8weE1GbW9QRlUyTlA4S2JrdzJ4cTFxUWNWZENYSFFBQTBEQ0VnSm0v?=
 =?utf-8?B?UkxpN3oxUmlLYmJkdWNqMklRbDlZZkg4QXdjbjY5bFcxYXQ3S293cWRkUndi?=
 =?utf-8?B?VGhHTHc1ck5tdUNBQ3pEZythd3pBdkhYbWZGQXFYRSszVzNodUhobzB6NTlO?=
 =?utf-8?B?eGpBRGtBYmgyTUJTM0Q1cTBtY2RNbGFiT1ZPNTIwZStHL1M5WWRnaDd2Qi9t?=
 =?utf-8?B?YzdFZ3lCczhFU25Ba1hvV2Z4MkZ6VE5yek50Q05JT0RwNkRDZGRKVmJzRXNo?=
 =?utf-8?B?Q3JZNVQ4azJLMUNUVGJtSWJXMDNYR3gyYkp6YlhuRnRIdFd5aEZZM05FVUpo?=
 =?utf-8?B?aVFPcjNpVUtqQUNTWjc0MnQyL2ZKS21xVEdnTG4xTkh5ZWZBaDI0N3NUNmw2?=
 =?utf-8?B?L3hoM2V1eHlNOU9YVk5sUTRtUUZFTjl0RVRFUXY5d2ZSU1p3MjNwN080YzJs?=
 =?utf-8?B?OElKV1lBdVdXOXFJTksvVXBDTldxTTAxcTlrelc1UUpGZExnV0JrUGxJc3h5?=
 =?utf-8?B?alJqQkk4ZG9YejR6d29qYU9WVXB6MVZNRTFQSnk3dVRFUFFGVFZ6V0hpNUs4?=
 =?utf-8?B?TXNBMGk0NHpTYkVFVjE4SitlTDVKWDRscUtNajZHdm5KNHFNSWhONjh2UG53?=
 =?utf-8?B?cW5oZ040NThHdjFmYVpYY0RsTGlhY1pSMWE2TzBjU3MwcGlSdWwyVnFvOWFa?=
 =?utf-8?B?Ylc4RkxmNklPTWgrc0dqaDBmTENKWkhCcVVFcHJZekE0ZHJQclhTaHkxT2xF?=
 =?utf-8?B?MDB5ZmlGc052bDkyY09qQTZvOVZhZ0JrQ3huTkxyOHY3QjlacExkaTRYN3RU?=
 =?utf-8?B?Q1RRWXJycko0Q05mYzIvWHRXKzBMM3p0QVFFYWUxZzN5My9rVWVPTC9WaDgx?=
 =?utf-8?B?MVMyb0JiZFlpTXRXeXRwWVhoRmRvM0d4RGlva3FIL1NNendqMkZ0aHJETmRR?=
 =?utf-8?Q?riJk=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(35042699022)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 21:14:00.8233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b7a403-cb33-4f9a-6776-08de3ce808b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227992

T24gMTYgRGVjIDIwMjUsIGF0IDEwOjQ5LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gT24gMTIvMTIvMjUgMjE6MzksIGhvbmd4dSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4+IFdoaWxlIGluc3RhbGxpbmcgMzIgYml0IGdzdHJlYW1lciBwYWNrYWdlIGFu
ZCA2NCBiaXQgZ3N0cmVhbWVyIHBhY2thZ2UgdG8NCj4+IG9uZSByb290ZnMsIHBhY2thZ2UgbWFu
YWdlbWVudCAoZG5mKSByZXBvcnRlZCBhIGNvbmZsaWN0IGZhaWx1cmUNCj4+IHxFcnJvcjogVHJh
bnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4+IHwgIGZpbGUgL3Vzci9zaGFyZS9naXItMS4wL0dzdC0x
LjAuZ2lyIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscyBvZg0KPj4gZ3N0cmVh
bWVyMS4wLWRldi0xLjI2LjctcjAud3IyNTAwLmNvcmVpN182NCBhbmQgbGliMzItZ3N0cmVhbWVy
MS4wLWRldi0xLjI2LjctcjAud3IyNTAwLmNvcmVpN18zMg0KPj4gDQo+PiBEdWUgdG8gdXBzdHJl
YW0gY29tbWl0IFsxXSwgdGhlIHNpemUgb2YgcGFkZGluZyBkaWZmZXJzIGJldHdlZW4gMzIgYml0
DQo+PiBhcmNoIGFuZCA2NCBiaXQgYXJjaA0KDQpUaGUgY29tbWl0IGRvZXNu4oCZdCBleGlzdCBh
bnltb3JlIHNvIHRoYXQgVVJMIGlzIDQwNCwgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2dzdHJlYW1lci9nc3RyZWFtZXIvLS9jb21taXQvMGVlMTg3ODFmOWIyMTAxMjlkYTIzYTg1MjM2
MjY2YmY4NGJhZmE4MyBpcyBhIHdvcmtpbmcgbGluay4NCg0KVGhpcyBpcyBhIGJpdCBvZiBhIGNv
bXBsZXggcHJvYmxlbSBhbmQganVzdCBtdidpbmcgdGhlIGZpbGUgaXNu4oCZdCBhbGwgb2YgaXQu
ICBJdCB3b3VsZCBiZSBlYXNpZXIgdG8ganVzdCBtdiBpdCBpbiBhIGRvX2luc3RhbGw6YXBwZW5k
KCkgY29uc2lkZXJpbmcgdXBzdHJlYW0gZG9lc27igJl0IHNlZW0gaW50ZXJlc3RlZC4gIEJ1dCB0
aGUgYmlnZ2VyIHByb2JsZW0gaXMgaG93IGRvZXMgdGhpcyBpbnRlcmFjdCB3aXRoIHRoZSByZXN0
IG9mIHRoZSBHLUkgZWNvc3lzdGVtPyBJcyBvdXIgRy1JIGNvbmZpZ3VyZWQgdG8gc2VhcmNoIHRo
YXQgbG9jYXRpb24/IFdoYXQgYWJvdXQgUHlHT2JqZWN0Pw0KDQpBYnNvbHV0ZWx5IHdvcnRoIHJl
ZmVyZW5jaW5nIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nb2JqZWN0LWludHJvc3Bl
Y3Rpb24vLS9pc3N1ZXMvMzIzIHdoZXJlIHRoZSBjb3JlIGlzc3VlIGluIEctSSBpcyBmaXhlZCwg
YnkgYWRkaW5nIHN1cHBvcnQgZm9yIEdJX0dJUl9QQVRILiBTbyBpZiB3ZeKAmXJlIGdvaW5nIHRv
IG1vdmUgLmdpciBmaWxlcyBhcm91bmQsIHRoYXQgbmVlZHMgdG8gYmUgdXBkYXRlZCB0b28uDQoN
CkFsc28sIGRvZXMgdGhpcyBfYWN0dWFsbHlfIHdvcms/ICBEbyB3ZSBoYXZlIG9uLXRhcmdldCBt
dWx0aS1hcmNoIGctaXItY29tcGlsZXJzIHNvIHlvdSBjYW4gaGF2ZSBhIDY0LWJpdCByb290ZnMg
d2l0aCBhIDMyLWJpdCBnLWlyLWNvbXBpbGVyIHRoYXQgZG9lcyB0aGUgcmlnaHQgdGhpbmc/ICBC
YW5kYWlkaW5nIGEgc29sdXRpb24gdGhhdCBicmVha3Mgb3RoZXIgdXNlcnMsIGFuZCBkb2VzbuKA
mXQgYWN0dWFsbHkgZG8gYW55dGhpbmcgdXNlZnVsLCBpc27igJl0IGEgc29sdXRpb24uDQoNClJv
c3M=

