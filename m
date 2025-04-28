Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BCCC369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 10:56:58 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.44])
 by mx.groups.io with SMTP id smtpd.web10.45361.1745837810825185910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 03:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QDtHw3gl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QDtHw3gl;
 spf=pass (domain: arm.com, ip: 40.107.104.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZTENkJlntzrJbqsyl0ksKqvjJaDGqFaJanV8tOfeoAx7K8aBaPwsrn2IRtvT2VMKc3tGiqWzJzavL8djbWV16owYgG5+Rzra5aHy9WOTtHx1qGKL7UVLA7munranA+sOkX29HBFb4uLiLpkEu3QUyFwqzLbYzHZJJ/6rCu6qmlp6l+DFq8UBcfdUzJKFCDoUpzG6O/ap93zwrg1D26nQXPKtSbeyy84QCELwTT1aNczQ4xdgHeZ6hMfaeYIUxpF9Ek2hOQucA89fC6u7Pgm2fbDZkIVNA2kbILXN41mDTCqIw7ZKTi/z3WnU4dwh9G2GjdgVCu550IwSwcIQk3wK7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBcNvFD3aALooMRFYBL5qgzaLgZip/Vd7fH2ii41htc=;
 b=uU3F2G+xMidYhO28ikIZen/cFoxppmk5TBSIvCm9MsLheFq/6+0m1cazFB8yJX86sBkGJiYc5Tt3M+FV8KP/nzAOfjy7zxhg8Zcjk/r5m425C9wuspmshOeyV5WHA4ceNPjCOFCaduDEvCFg2QyV4kLzYe+3TAUNbFNcH61rkX+WmrO8VAx2r/oYSwUfu7EKF9EJMpfEXhlE1xXKUTCy9rLc2sbZIsrk8sA/JegijIoQlS+PuEi+pWrXXyNDOanszsg2SjDFoM4NToecrbjit7h7x/LomcLu0S4gau610rkXy/iWjoap6684QMvQ+qEHmlWuIgluEOu9UenQWdPIWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBcNvFD3aALooMRFYBL5qgzaLgZip/Vd7fH2ii41htc=;
 b=QDtHw3glrebqsm2ztvrVyUUfIQ2NMLq7tQUnu9eAzGtDnzfKqF9YZ+EgNE3uRipPHehzhvjioI+iEB9z0sk8DYBBgSzjgbYf12yHrZ/Hy+TTdK9LvQNtUVigUHlNkl9B1fPvkcpL0mSRxpLgd7Vwje5BaBlkOXaYzLz0brq7I1s=
Received: from DUZPR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::15) by AM7PR08MB5496.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 10:56:46 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::9a) by DUZPR01CA0116.outlook.office365.com
 (2603:10a6:10:4bc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 10:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 10:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHQ5ZrqFUdqZr4LV6FiooLtzcxvQRjlsoEyBCBSY00lzk2rLNe27f1TAMy8TkxzDbqllA6MgcuJdJnJL8XThg2aK1MAlYwaDYWUWPShUXs0vMlbGLVlM1r+AljFzftyeQVmWAEweju07TG79O1dAd/asEA+GdWcxHi0bcMhSbEwSoDPiJ5OOQRdQN8VHvAjaqziMrtiGbO1hIZ/lBRS6SJ9a6u2PtdOawUCo9P3dRr5ElCN7slLIEsuZ5wjUQE5JChxpPezPzhXmV6UXG5qz6dfV6bwmYLMbYZEj+X5jtqf4FL46n6vVPs2QINdVMo3FLfC4iZBdvBeqjGd1Z+9JXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBcNvFD3aALooMRFYBL5qgzaLgZip/Vd7fH2ii41htc=;
 b=D/1dZ0YogD8rt2rzQV9CvzNFkbQrZAZM/O+aszlueKXey7N0jSj3rjlTKMQjroC/OHKEEpBcZYc1xVJHOWu4bejIcBgNsf7X2DqG0SlVPR6x8D01Ku7jBPfcAN3WO6bFeilNYHi6Kb4M2F5T8rlhnLg7Q37aCrfRpLIBYpgcfBqtnUkWwKDA/AhrKutdfhq/h2MTv7XNGkkUrcbfJbCI18LRophbzE32Y60t+6xUSgyO7/USq3MCTSqn/0IiHObJgYZ17AhHSh1u1AlNez1UXCPhqXhakPdXr76fIlr37ocaf+yGr60Szvbf+V1iqkCi4DS5Z483B+JJ8LCfKajvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBcNvFD3aALooMRFYBL5qgzaLgZip/Vd7fH2ii41htc=;
 b=QDtHw3glrebqsm2ztvrVyUUfIQ2NMLq7tQUnu9eAzGtDnzfKqF9YZ+EgNE3uRipPHehzhvjioI+iEB9z0sk8DYBBgSzjgbYf12yHrZ/Hy+TTdK9LvQNtUVigUHlNkl9B1fPvkcpL0mSRxpLgd7Vwje5BaBlkOXaYzLz0brq7I1s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB11172.eurprd08.prod.outlook.com (2603:10a6:800:254::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.52; Mon, 28 Apr
 2025 10:56:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 10:56:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "hongxu.jia@windriver.com"
	<hongxu.jia@windriver.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO
 live failed
Thread-Topic: [OE-core] [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO
 live failed
Thread-Index: AQHbtoHTJbI2s8uJmUG7EI9zOPQaXrO405aAgAAXqIA=
Date: Mon, 28 Apr 2025 10:56:12 +0000
Message-ID: <AE38D3E5-5632-4C2C-ABBD-D213983EBD63@arm.com>
References: <20250426080352.2358278-1-hongxu.jia@windriver.com>
 <CANNYZj-ZjfSiT_K0nx-WyM50d6fFvyjhE=RkwpQRgeLPrFi9=Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-ZjfSiT_K0nx-WyM50d6fFvyjhE=RkwpQRgeLPrFi9=Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB11172:EE_|DB1PEPF000509FB:EE_|AM7PR08MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 2564c09d-5e25-497d-1887-08dd86435d69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WXRuL0lScWxwVW83MDJFcVVTSzlFMGc3TUJDYTFGTmhEUnZEcXMvalZCSVpX?=
 =?utf-8?B?Sm1xMEFFdDE3SkpNS0dadDF5YlVPTm83aXFpenAxeVVQVHZrUTlvYXNGUXF0?=
 =?utf-8?B?TVRjaDdYRVViUnpQVWdReFIrdVFUdnRhMGNYVzVRczhsdXV0ZklKYXBwOGdQ?=
 =?utf-8?B?N0JnblV4UWJVWmtRNDMxZ2phNStDdVNJMm1FVk0wdlhodFgzblNkZXoxZE9j?=
 =?utf-8?B?eHk3N2p2T1JNdHVQYkdWTmkwWnlCUjFWTVFsQ3NXWmk5SFBlNXpRYTE4NThr?=
 =?utf-8?B?RUdBWGlxRFRTMkM2RFYxeTBYeit2bEVSVkxxYmVhMnlXSHVjd0swYm03WTVS?=
 =?utf-8?B?K3ZnS0RYRVNkMld1ZWVaTGZPNkMvK3p4MFNTbytTZHFlQ00xQ2dYMDVXS250?=
 =?utf-8?B?dng5SlpCcFY3ZExncm5iVVRMeG9lcmhVa3Z3RDFVOEluRFNpeVEyTkdPMUxJ?=
 =?utf-8?B?S2Z0NDdEU3VoQStFT2UxbFRPNDZ3UXliZGplVEQySjYvZXE2a3ljYTNrVlBl?=
 =?utf-8?B?dmI1eDZrd2Nxa1RxV1QvdzVXNXA3ejJ6akkwVDc4TTVyRVl6T1FISk9xL3Bv?=
 =?utf-8?B?b0FuU1prM08wUHJCQ09lbXJTdlc4bnR5d2FwRUNLZUJBTGdvQ2xmem5RcWFD?=
 =?utf-8?B?eVZ2MzkzdjNJUVdDNFlzMXUreWJza0hyUWJhUlMrOXFSL2dzRGlPcHRXVXRo?=
 =?utf-8?B?NU5GUlNtRWdVNExkLzBjS1BsZEZudjBEUUx3SDlHUlRxZ0NYTG1QTHlFemxu?=
 =?utf-8?B?em5hVFZVM01xSXhnWGxUeW5meVBKUDhFZHdZWWlhVVdBYndCR0lTdURnc3Bm?=
 =?utf-8?B?NVBueTdHTUUwUWFob1VsbkczRFJRS3ByWE5ubFY5OElCakZhdzFWakFHc0h5?=
 =?utf-8?B?MGVSWXIvWlpQdjJEUmFsZnd2Z09zVVpPVUpkS3duV1F0bm9XL0FtVXBQR2la?=
 =?utf-8?B?VE9MeXRYakZvZHk0WG1lY1p5Rjg2YlZ5TGN1QlpvOGRRcFJoeXUwRWZDZGVH?=
 =?utf-8?B?V3FJZldaTjNWOFVjUTc0NXBCL3FQVmJBZzExK2huZ3g4ZEtRWExMd2YycmVk?=
 =?utf-8?B?RHloclJuaDl5dkdGVUpKQ0V0cnc2UWtVSTliZDdqMWtrZ3ZpVjI0V2t0SFoy?=
 =?utf-8?B?U0didVRyWThuenRBS29OOHM4TE9tN01JS2pRcEN5YWNXeHVmMGhlTmRkLzRi?=
 =?utf-8?B?UGpoYUs5OE4xQUtsUm4zUUVqVnJTQzVQV1RON1dWNE90VzVKSUtJMmpOVmZ2?=
 =?utf-8?B?K0FxaUhaVnkrcXVqRGZxOUkrejBRcE9LOGNkWjllRHFJb0tiOUhIbGlOcjhP?=
 =?utf-8?B?aW9XZ0VjeW0wQm01SFdyUkE4TmZVejFUaDVGYmdDY0s4UzFnZk9kc2VPVnVU?=
 =?utf-8?B?SWFkY2N4ZEZ5MEhGM1B6ZGwxTnpOUFFWM3duTmpSTjRqK2ZhN2NZVzJydjN0?=
 =?utf-8?B?LzRTTXppbHNTNWZZdGtpR0NhSzVMaDV0aGUyRFdUamRqWkgyekxIT0RSdDRt?=
 =?utf-8?B?OGxUdkdTMjhIQzZIYWtuaHVWcHRlblFHSlE1VkhRWlJ2RGoyWXF6ZTJUdzBV?=
 =?utf-8?B?MmFKQ1R5aTRCenhGRlNCcWhoeUhEeE0rVmMwM04vVENBTnVqWmlYY2wyUFZh?=
 =?utf-8?B?ZkoxVkFmVG1DemQxWnNnS01xQ2pSVUdocE5SbW5lUGRjcVRWOFFqQ1pvMGJl?=
 =?utf-8?B?OGVta0E4YU84L1VPTjdxNFNUQ3VoMDhDbElaSDc3eVJKVEtWcmZPTUFtVDJu?=
 =?utf-8?B?a2FPOFhoMjdsNTJGTGt4azNXYjFWdXFhakQ0S1UrRitrVUc5NTNIUjNuMXdK?=
 =?utf-8?B?TlNvb2JuWDR6UitqblV1TWdMY3VyUVJYZ2ttZTlqbW9Kclo0R0lhQ0pINjY3?=
 =?utf-8?B?b2ZLQ3p5MXdoRHJhbGpzT1d6andGRlhlMGExUlhCSTdrN1BYL3dDUWJidmky?=
 =?utf-8?Q?xxaQwSbg4ko=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7751E42B2BD85544A073890446FE22F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11172
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04296e56-57be-48e2-d2b9-08dd86434a2d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y09ROURyVmdlRE8rbHFEdVlOQ3QxelNXai9DeFR4TGNqak1PRlg3REdkRy90?=
 =?utf-8?B?Sm1tU2pkZWxuSWx2dks5RjhLTHhkT1d5U0I3d0w5eDRLVGxuM0xwUWNwM0Nx?=
 =?utf-8?B?T0J0cm9xb3lKWHhIMGkyODZKdWVyNHdsbXlNMHAyVXhDMGlTN2FvdDE0ZVF0?=
 =?utf-8?B?Szh5bjdKRmo1NUIyUWVjS2JZSzFVMTRTMnQ1YXFYbVRKQlZOM2xJSm5HcHYr?=
 =?utf-8?B?SjFtUlVMY2JsbnczVUtuQWVlby9OTGVjcW5hQWl6ZlVOMytyY1pGdFNacTRs?=
 =?utf-8?B?NWhEMzZpNlhMMExMc2hCMVorMWVnUmsra0NHR09vN2N1Y3VDV0k0dHJRZDZw?=
 =?utf-8?B?cUxzVnZaM2lETUZrV1Q2cTZMckJYb09INjhVejVKRXRnVVR6bGgvRnBPd0p2?=
 =?utf-8?B?U2VGNUw1RUljcFRTRFJwRzNOSDlncVRFckdHZnhIdmdHNmY0aEVJakp2eUpx?=
 =?utf-8?B?Mkdra095ZXpBOHBZWWlvTEJBNWJZU0Q5bEViQ1VmZ3NBNEZTYWNTU0FxdHUw?=
 =?utf-8?B?ZzljYVkzempmWE45UlVtbDh4eW5hak8vbjhobG9FYXJmYndIKy8ybENrYnFR?=
 =?utf-8?B?Wi9iZElmUU1aYXZSQ3pkQkIxcE5BNUhFcGJQYmw3OWlOUWwzY2RTb3dkM0tM?=
 =?utf-8?B?OTNyTlpIQVlvSU04eWlWeVA0cTRoRDIvQlJXTngzMGp6UjlIdWZCNllMaVlk?=
 =?utf-8?B?VEMwK01PUUIvNzE2ZzhRdnFHd1NtVTY2bnJoNVRsOWtRNnR4VndmMG9Yai9F?=
 =?utf-8?B?Z2JUZElsT1NGQWdKdmxPQnNvbzIyMGpGblFNTzNtM2RjL3luU0ppNlFjRTVD?=
 =?utf-8?B?QzBnejVmYkVTN1JTNnQ4RERlVzlLTXZXVnNNWmowUWxPV3JWZHhvTkFFZGRs?=
 =?utf-8?B?b1k2QXRhS0NhNHFnZlp5bmJVMHpIakYwbW1JRHZEc3RyeSt0b09CZ1JrOWM3?=
 =?utf-8?B?SjVYMnBydFdJWkR0UXpIRWtuaGdDYzhrWGxReEwvSDhNMmhDbzFXb096WmRo?=
 =?utf-8?B?N0RkNjBLZmlnTVFpUXNLMXlhOUVNM042OW5vZVFQUXJrMDhpOVFzM1ZaU0gw?=
 =?utf-8?B?amdtMTlDR0VLYU95a2pYY1lZUzkySWFxSDFXUFBNMDBFU0hHcnRhNzVKUS8y?=
 =?utf-8?B?enhLczVFV2svNUk4d2kyOUM4WDBLd3dlcmk3RE1PcGJPTEVYKzgrenY0THB4?=
 =?utf-8?B?eEhHbVlMLytiVlB4Lzdjd3RPM0xCT3VYZTk1NUhIWno5Zno3dEJBOUROUTZB?=
 =?utf-8?B?REZHVWhBOERvdzhkQTZLS3JvdkIySEYzcHJHaXhXaUVqdzRDR1krYjdtZGhl?=
 =?utf-8?B?dUhIMTV0dWVYWmJjTUUxTDMvaVVZcWZERWVTbVV4SytLTXh1ajVkUkcrSTBn?=
 =?utf-8?B?OHprdXY5OGFCRjRCU2p0ZWpBZEhUYXhKSG0rVDZkVkVPNStRbXAvYnlqc21N?=
 =?utf-8?B?RjA2ZDl5bnJhMEJOTVdmTXlQSGlHZGFPUkpjdnl5MkhyV3ZSTkJnWGZHUERW?=
 =?utf-8?B?ekwwdHN4TDZHMG82MTdWbENjQ3VsSEhJcmZxUExyNitsL3l5QkdNQjJzLzhx?=
 =?utf-8?B?eEFDZ2VNQnBlSU5CUzRuWElScDdYV3J4cUNyWGF1blNZVW1ma2Y2c3Y2VEM1?=
 =?utf-8?B?OVBEOHlBN2tGQVArbE1NMGVTMlZxWFZXY3lUYjV2Yytrcy9uSVlhd1FPTkxu?=
 =?utf-8?B?NTJDVU5ySDJvL0h6YXZEcHJHalIrUTlvOWl5SlRxdUlWOFk0OWttMmZuK2NE?=
 =?utf-8?B?R24vTStVMWRNT0VIYW1GL3hxbWF5dkkxK0F0TnZRZVNFWXF2NkNvVjVINW15?=
 =?utf-8?B?TmtEVklHZXdWL2FKR3JLNFFhWXM0UDFoQVBRaGd0UjJLTE9GWS9lcE5ubmk1?=
 =?utf-8?B?VUN0TmNqMFB4bTZjU1pHVENYK0w2SXA4UW9rOEdFZUwyQUJITmZTcUphSENP?=
 =?utf-8?B?b1NlN1BkSE5URDYzcitTRXVWZUFaWlRYd0MxVkkyZFBUMElqcmZvT0duSlZZ?=
 =?utf-8?B?OXptS2hlUEFnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:56:44.3637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2564c09d-5e25-497d-1887-08dd86435d69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215593

T24gMjggQXByIDIwMjUsIGF0IDEwOjMxLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFNhdCwgMjYgQXByIDIwMjUgYXQgMTA6MDMsIGhvbmd4dSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8aG9uZ3h1LmppYT1lbmcud2luZHJpdmVyLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+PiArVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFt1cHN0cmVhbSBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0
cy9jZHJ0b29scy8gaXMgbm90IGFsaXZlIHNpbmNlIDIwMTldDQo+IA0KPiBXZSBoYXZlIGEgZGVk
aWNhdGVkIHN0YXR1cyBmb3IgdGhpcyBzaXR1YXRpb246IEluYWN0aXZlLVVwc3RyZWFtLg0KPiAN
Cj4gQnV0LCB0aGVyZSBpcyBhbiBhY3RpdmVseSBtYWludGFpbmVkIGZvcmsgb2YgdGhlIG9yaWdp
bmFsIGNkcnRvb2xzIGhlcmU6DQo+IGh0dHBzOi8vY29kZWJlcmcub3JnL3NjaGlseXRvb2xzL3Nj
aGlseXRvb2xzDQo+IA0KPiBDYW4geW91IGNoZWNrIGlmIHRoYXQgY2FuIGJlIHVzZWQsIGFuZCB3
aGV0aGVyIHRoaXMgZml4IGlzIHN0aWxsIG5lZWRlZCB0aGVyZT8NCg0KVGhlcmXigJlzIGFsc28g
dGhlIGxpYmJ1cm5pYSB0b29scyAoaW4gbWV0YS1vZSkgd2hpY2ggaXMgbWtpc29mcy1jb21wYXRp
YmxlIGFuZCBpcyBhIHRyaXZpYWwgY2hhbmdlIHRvIGltYWdlX2xpdmUgdG8gdXNlLCBzZWUgcG9r
eS1jb250cmliOnJvc3MvaXNvLg0KDQpTd2l0Y2hpbmcgY2RydG9vbHMgZm9yIHNjaGlseXRvb2xz
IHdvdWxkIGJlIGEgc2Vuc2libGUgc3RhcnQsIGV2ZW4gaWYg4oCcYWN0aXZlbHkgbWFpbnRhaW5l
ZOKAnSBtaWdodCBiZSBzdHJldGNoaW5nIHRoZSBkZWZpbml0aW9uIGEgbGl0dGxlOiBsYXN0IGNv
bW1pdCBhIHllYXIgYWdvIGFuZCB0d2VsdmUgb3BlbiBQUnMuICBsaWJidXJuaWEgaXMgYSBtb3Jl
IGNvbXBsZXggc3dpdGNoIGFuZCB3aGlsc3QgdmVyeSBhY3RpdmUgaW4gZ2l0LCB0aGV54oCZcmUg
aW4gZGVzcGVyYXRlIG5lZWQgb2YgYWN0dWFsbHkgbWFraW5nIG5ldyByZWxlYXNlcy4NCg0KUm9z
cw==

