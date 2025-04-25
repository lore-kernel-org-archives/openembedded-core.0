Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8106C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 13:49:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.82])
 by mx.groups.io with SMTP id smtpd.web10.6947.1745588963094787773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 06:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=clKXF/RE;
 spf=pass (domain: topic.nl, ip: 40.107.159.82, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2vK+MCNdTfl2ypQzZmIqWLxvEOR9hFHtwZMdF9SJU9LDlyWA8IIeSXmYEttdlZpPr6TWa8MN/d0gKGqcPvf80Wtb5p8nI9PoLPWOrEGotGAQb30s1EiX6Pahxn8+sEAxnsxFCDRRrQ70LRoL3icyYmquKmGCG2X4rgpEYS+LN6KKgkeFTofz0J/+p/82MLw7gasUBECKwZplGcVwkSzW/YDqd0U0d/gf4dO8T0JapEyeIbJLrfeH5q2fzGNIqAyLDsD+a3H0Ir7qmiU+YfItqg1Z5A7edOJsb30xU73Apojr7F05BdMWz32XfJUEvVdoiId4j8LPFIX+V43AEG39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk4jOhdmUYvqZs5mgzysEIAnCzFJ/muESGNbL/PXKn0=;
 b=O23YwBLvPjWT/NE3wecqrQWWP4GeCL3DYUW2qot4Ug/V9dpzDP1T596KU7xxkqltPjKV93YGls8zAdwfETcX+4QnTNYSlpBwM0uXWyVibVC5O/mWVqAdj6bgNp7jbj6oBZw/wy3E4TcGag2BU6pmYI1P+8pWYpeSw9EjGnDa+37d5VdEJdIm+RR3pPUHXQ3U8jacqXwpOAj49mEo5PRO8ZliaJ3dFLMcuZBp1D2bNxF17stp1RjDKcvAzqbkJ9xi6FONBDHOndX5QrMUlVIBUlerKV72DukJssrRZI7ccYHahtu+GvG8TvOgkCn04OB77NrXJNxgc/YpGz8l8k71aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk4jOhdmUYvqZs5mgzysEIAnCzFJ/muESGNbL/PXKn0=;
 b=clKXF/REonandV7mgT+njIljI6cOfAXecOj/buCUgni5oWZnx4ywaJD2ikWB4nopjt79pGbSwf5GMGmu9wUj2I/Yspo4H6j7Ve3tT5pIRpo5ifFDqY+Dn/3qDCV4v7HJiXLkpdL6W3yAA5duJMPOhEadicjyWtV0c3OgMFfLSNTy8QF8ZhNjCJ5ZE1myYvvoeiZ0m5j240iZ/fZSvg2ngQFKQNhMXurLx03aq0jcFf8MyWZr9zr2Qf8mPhLpu7QEhPDvl8MoqLoH+jk6xlqTph884PjVgSSrKN6OFcXObZwst0u9nyXlmTlLkHrwGKEAPerKIx4jI+ic371+3MEkig==
Received: from DUZP191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::8) by
 AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:49:17 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::ac) by DUZP191CA0057.outlook.office365.com
 (2603:10a6:10:4fa::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 13:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 13:49:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.237) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 25 Apr 2025 13:49:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS5PR04MB10060.eurprd04.prod.outlook.com (2603:10a6:20b:676::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Fri, 25 Apr
 2025 13:49:13 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:49:12 +0000
Message-ID: <bc06b780-ab69-4581-8846-0fb11f354f6a@topic.nl>
Date: Fri, 25 Apr 2025 15:49:11 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] kernel-module dependency mystery
To: Gyorgy Sarvari <skandigraun@gmail.com>, raj.khem@gmail.com,
 openembedded-core@lists.openembedded.org
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <656f5ffc-98b6-44e9-8308-51495e1961d7@gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.26c21c88-3e9a-492b-9d2d-79874402141f@emailsignatures365.codetwo.com>
 <68e3c223-560c-453f-b1b5-9bbfc0f9a17d@topic.nl>
 <0d7b1d9c-a42f-4acd-ab19-6fd7c540695c@gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <0d7b1d9c-a42f-4acd-ab19-6fd7c540695c@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS5PR04MB10060:EE_|DU6PEPF0000A7E4:EE_|AM9PR04MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf7f103-fd84-4c9e-3e75-08dd83fff8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|4022899009|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bDJrMVRRckVNMUNmVHRjRlAycW9mTzhvTnp2dGZpVnNxeWN1S0FGZk1WbEJO?=
 =?utf-8?B?N2hma2lpV0xBWkcxb1pQMjlmYk85UGtYNHVmQldaQURYZlJMNFFrTmJMQU0x?=
 =?utf-8?B?T1VubzJpVHg2SThDM3lCSnBVUDZuUERyNmFXQWFOWkQ5cExqWGszbi9Ed1k4?=
 =?utf-8?B?M0RsUmFVcndHRk45czBvZkhvdG9VUVAveU1KbVRKbTdYd1VCdmp2SkJwRWhD?=
 =?utf-8?B?OERNOW4raU1KMGZqWTFicEIwRFZlbHN5UTVTZFRzNXJkeGVFSThQcGMwZS9x?=
 =?utf-8?B?SHBuRjBLR0x2RXdFbkRQQjRieVprcjdrVjdYQ3NTdGFjWWNmOXhqakZ6Mmo0?=
 =?utf-8?B?bHBiR1lvZFhBTGJzVWp0Mm1HRTJucW5Kd043dXZua1dVeVNaaVU4NnFGRUI4?=
 =?utf-8?B?encwOFpMeFRqL0tBSFNUQU1pY0ZCQlB5eVQ0QnMyTUg2ei9CYm5Kdnp6Mjht?=
 =?utf-8?B?dzZCc1NrS3c2OEZKdnhQMndUbVZCekY2QjluaTVtQlhwajl6enZJeDVTRThM?=
 =?utf-8?B?R2NjUS93ZlBucmZIUC9VeGdUd3NYeE55NDF1TGIxcGN6YVFiTjZIOVlHZDI1?=
 =?utf-8?B?V2dpa1dRUm5TcFRYWmc1R2IyVGFTQ3M2TTJRYmRaUzlMdHBNVjZwZFo1RElJ?=
 =?utf-8?B?QmRQVGN2bkQreGJ2NVVSUlBBQ1ArdU1HYzg2clZYeVMyai9hZ3FTeTk2ekRy?=
 =?utf-8?B?b0JHelA5OFRudEpqMklzV21VMXluYkVCT3VYZGkybnJOcjBGKzlndUhORXVS?=
 =?utf-8?B?UVRLV2lXcHEzYTlUd3hobWJvU1hQZnhIcHczRDUybnpELzR4ZFMyd1JUUzNq?=
 =?utf-8?B?QXVscVpjckpjM1dHWURYbGhBNWdTKzhiekFTZDNwdkFCZ1hkemQvNytETnMw?=
 =?utf-8?B?YjdzLzFYMlI4VmFpdG9oRThIa2JFcUx4TUFYNTltaHBUbFg3SDVFZVhuMXds?=
 =?utf-8?B?TjJ6ZGJTaFU3M3JDcGlEakNFaE9UR0wrbEFxOVFZbDRBd1VJWDRKZDVKWUd4?=
 =?utf-8?B?NnJYdWtDMDJMUnNLL090Q1NuMEFyNlZGR25xTitYMmRCbmpxL0NyYjdyQ1RE?=
 =?utf-8?B?d0ZjMTZkT0l3blIybEZRbmZ6ZzF0b2ZxcUEwN3V2Nk1GMklCMVAvV2NqREgz?=
 =?utf-8?B?ZlZiK1psekJLOUZIWFpJbDhmeUtYNGRKdFd6OXhIbkJnczZOWW9scG8xYzhX?=
 =?utf-8?B?ZU53SFpsOVdDMDR0RE5RbktEQ2VpTks1U1UyWi9GZzhtNHFOTlFjNHg3ZVlt?=
 =?utf-8?B?U3I4OVNNUzZKOWtqZnR4TE9yY1VpWXQ3SE96YkJvalRtT292VnA1TDIwcUZy?=
 =?utf-8?B?dWF5MU9VSHBRZEVhVFBJZFNpN0RxSFVuOE9VY0dJbWhiR3MzWTBQQWVDbzJl?=
 =?utf-8?B?NHoxSGM3UzYzQTZXekNvbUdySGdlNFVXaU9aMU5Mcm9RZC9ZbnlZSU10TlUy?=
 =?utf-8?B?anJJRUQ5bWxXRjRKNThZM3g0cngvT3dGTEhncUlicnAvVnF3QzJSMnJadDNu?=
 =?utf-8?B?OGJUSDNMYys2UVhQSmJ6aHlNVlErN1AxQzZlU3lqQXNiN3dwcjZPazNBcGZ2?=
 =?utf-8?B?c2hKeXdJUDBNbmhtTXduU0xiK3BYNXZOWXZoQjY3NFZoVzlXSktVbEpRNWx1?=
 =?utf-8?B?cEJ5VHFnSU1YRTB3eWxuRFMrZWtUaVd5dmh1akpDVkRJSjlPQmdNc2REZ1lz?=
 =?utf-8?B?NVR1VjJJeFNvbUpHMlZscGNoZWxXRGJ6cjBTMGhnK05BV1VlYlp2Y25iNXhi?=
 =?utf-8?B?dDBvVGp3bnlxUzZmcS9KaXlMcmt0NzgzeFBpSC91SzRYdFA1N3NRMWNNd0Fk?=
 =?utf-8?B?bmV5WisxcmRYRFZxaERiYVhHS3FMSk5NbXBpeDE0d3E1WUdPSTRUYlBibmRI?=
 =?utf-8?B?eWNVQ2x5a1EydmJxK0VudDlraUM5Qm4rdWgyZXg0VnNSUHUzWWhXdERHRk1p?=
 =?utf-8?Q?X067BI/plYA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(4022899009)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10060
X-CodeTwo-MessageID: 4583f817-7ee1-4c5d-92fd-506f944727ac.20250425134916@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e1afd21-28c8-47af-9559-08dd83fff645
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|30052699003|1800799024|4022899009|35042699022|82310400026|36860700013|14060799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnJtNWJUV2xzOE1vTGZGMHZLMXdKU1EzNHI1MkxieXc5S2c3RUY2Y25CVkEr?=
 =?utf-8?B?N0NCWWZwYXJmOFN6SE5GNTFia0pKTWFRaXJBaFJ2NzQrWldsMzVlNUJoaXBP?=
 =?utf-8?B?aWFhWm1kK29GQVhLdjNaMURHSU1LWllCOHBZUEdTWDNERHRjamRWdHYxOXZp?=
 =?utf-8?B?bTgvTGhlMUpETTc4em0wbGQwOW5NdDBCUnNmbTlkN0J3ZCtNZGJLSEN2TzBz?=
 =?utf-8?B?ckh2cnBhRFBNVnY1NTMxM3FOaFp2ZTMvS3RqT05vV0RlZGREQlE5WElPcERv?=
 =?utf-8?B?VzZQY2Q1R1pScXNLekc0R2J2b2VDN3F0d3NVcmpjb05wc2NLMTV6WWFpQ0Mz?=
 =?utf-8?B?RThpMGdCaENjMGw1bzMxcytieHpURDFFZmVYckVBd0ErMFFsbkx5aEpGZkFI?=
 =?utf-8?B?S0xJd0tXOExkMTUzYytKQU85OUdzTnR0K3RUaGNzcW14cm9XUE1ZbGpkTEQz?=
 =?utf-8?B?WTdJYnBkc2JseFJYZC95bFlKZWRsNXRjK3Q0aFBGY2NnSlFWVW1qSDlnVTRB?=
 =?utf-8?B?dTFud0NtMmhld0d3UXp0NmpKNU8wc1hTWjRFcktvaEtid1VDL0FqMTg2cHdF?=
 =?utf-8?B?UFN1NjlGNThSVWg1Yk1vc0NvVTU3blBCZHZDYXkxS05wZjJSN2NSZ1VFK0VT?=
 =?utf-8?B?cmVnVEpqbE5lVGV2bFhKM0ZxYlRENkNKTXFXYUxNYmJ5UHBJYjRqR1VDZWdn?=
 =?utf-8?B?bUpOK2tTWTVvRlRjU21POW9yWjh5Ym5VS25iM3d2SXFFdGJLTTRCblBOQk5F?=
 =?utf-8?B?TFlNQkV1cStZMzE2SE1Hb0tZc1ZaVHZVSFhRY3NzZ2g3dTh5djRCK0E5SWZr?=
 =?utf-8?B?eHpaa2ptN2k1blhlazRKYTVMMXVrL0JSRVJkVlUxeE9KWUtwa3AyU0tkcno0?=
 =?utf-8?B?Z3VDaEEzcDFZcWlpd2pzZWQ5RnpNQUZadTlNNy9rTXVLQStMcGNoSk9UMFJl?=
 =?utf-8?B?MnRINVIwZVVZcVM0Q04xdEhWRlJmeXE1TmRuUERDNVNwdFUrMTh1ZzA4Mmxi?=
 =?utf-8?B?VlVMY1lUOFBPVk5TWVZ4enc3azJyYVFNZVJXRFk0OHBFcGpvQ1ladHRPdE56?=
 =?utf-8?B?K0wvdjJ2b3BBN2o5aEVsQ0RKZ3M1VW5HU2RlRFFycHN0ampHdUczNmdYR1hR?=
 =?utf-8?B?dTk1VmFUWEt2ZC82VkxZZE1jdkNBSjVjdGVhMk5lL0pidUl0Z2hWWHp3MlF3?=
 =?utf-8?B?d1F5REszVFlUN1JnZXR5SzNQQi9HNnMxSEREaDN0a1ZCaUFEcmpweEdhcFl5?=
 =?utf-8?B?bktDaXVJREVJUzNncS93SEU4TG1VcXBsaTUzLytyVSswdi8vOUxRck44Nmpx?=
 =?utf-8?B?bjg2amRrUzRuRTZCcU8vWHV4aGI4aTIweGplOXhJQ1pFYzZlc0c2MUVzU1l0?=
 =?utf-8?B?d2JMNjc1NFFsSUpoS3QrSGt1WFg1cDB1M1R3UXpWeEVUM3NSM2k2M0p0elZ4?=
 =?utf-8?B?ekxOQ3draDBBUTk0Nk8wK0VpZHFwVWIwY1dPT2JFaG1FTnp0aUE0K3dsTng4?=
 =?utf-8?B?cERoMlVrMmtFMnFnd2Myc0RQZy9IaVovS21JVml2MXlPUHF6UVRiR3NyNzgz?=
 =?utf-8?B?bGdtVnR5aEtQOUNaQy9LMFo4UWdjN0hGYmVBa2JLRXI0L0ZnbS92TzhsbGZy?=
 =?utf-8?B?RklsVVdINEYzWG1LOThKTExMOUhYZ2dNQnVIQXI2TEVEZHFmNXpYWGdpKzg1?=
 =?utf-8?B?MmpRc3A1eUE1Z0ZGeHZ1VU1JeVBIN3E4YlhuWU4vNUtiQ016SnFYMno5VGxG?=
 =?utf-8?B?b3ZXWjlVcEd1cTVlQ0VNbWhOVHI3b3kySFllZC9UZkhNaWhqZnNVWkJEVXV1?=
 =?utf-8?B?bzNqc05zVE5UZ2dzNVF3Q3hENHlUME1BSnlib2tZZVhSMGRMQXBzOU90aDBV?=
 =?utf-8?B?UHpIb0VWYWs1QkFRQ2lWZTczbDNVVngydTM0d1U3M2Vqamc5dVpEb1l4eHBq?=
 =?utf-8?B?UzhoWEdjWnJuY0NQM2Fka1pMVEVueWgvYlpteWFMdHkxT0w3aGR5bnJwbk9m?=
 =?utf-8?B?VjlGeTM0a09RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(4022899009)(35042699022)(82310400026)(36860700013)(14060799003)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:49:17.3117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf7f103-fd84-4c9e-3e75-08dd83fff8fd
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 13:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215475

On 24-04-2025 17:38, Gyorgy Sarvari wrote:
> On 4/24/25 08:58, Mike Looijmans via lists.openembedded.org wrote:
>> On 24-04-2025 04:25, Khem Raj via lists.openembedded.org wrote:
>>> On 4/23/25 5:34 AM, Mike Looijmans via lists.openembedded.org wrote:
>>>> I built the same image for 5 different machines. Only one of them fail=
s
>>>> with the logging below. Note that all machines install the "kernel-
>>>> module-dyplo" package, and on 4 machines that succeeds just fine.
>>>>
>>>>
>>> how are the five machine diffrent with machine config metadata
>> Here are the conf files:
>> https://github.com/topic-embedded-products/meta-topic/tree/scarthgap/con=
f/machine
>>
>> The "tdpzu9" triggers the issue, it's the same SoC as the tepzu9 and all=
 the
>> tdkzu* machines. Only difference is in the peripherals. tepzu9, ttpzu9 a=
nd
>> tdpzu9 are the same SOM, just on a different carrier.
>>
>> So the only difference in kernel configuration is some variance in drive=
rs
>> that get built.
> Is there a chance that that this is the only board using an out of tree
> driver, and CONFIG_LOCALVERSION_AUTO kernel config is enabled? If yes,
> those two factors sometimes aren't playing together nicely with Yocto.

All machines build the same out-of-tree driver (dyplo), but only one failed=
.


>>>>  =C2=A0=C2=A0* Solver encountered 2 problem(s):
>>>>  =C2=A0=C2=A0* Problem 1/2:
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - conflicting requests
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - package kernel-module-dyplo-1.1+154+bb94f=
350+bb94f3599b- r0.tdpzu9
>>>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but non=
e of
>>>> the providers can be installed
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a=
2cb0f14db5 needed by
>>>> kernel-module-dyplo-6.6.40-xilinx-
>>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a=
2cb0f14db5 needed by
>>>> kernel-module-dyplo-pcie-6.6.40-xilinx-
>>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>>  =C2=A0=C2=A0*
>>>>  =C2=A0=C2=A0* Solution 1:
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing=
 kernel-module-dyplo
>>>>
>>>>  =C2=A0=C2=A0* Problem 2/2:
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - conflicting requests
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - package kernel-module-dyplo-1.1+154+bb94f=
350+bb94f3599b- r0.tdpzu9
>>>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but non=
e of
>>>> the providers can be installed
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a=
2cb0f14db5 needed by
>>>> kernel-module-dyplo-6.6.40-xilinx-
>>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a=
2cb0f14db5 needed by
>>>> kernel-module-dyplo-pcie-6.6.40-xilinx-
>>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>>  =C2=A0=C2=A0*
>>>>  =C2=A0=C2=A0* Solution 1:
>>>>  =C2=A0=C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing=
 kernel-module-dyplo
>>>>
>>>> I'm on "scarthgap" branch.
>>>>
>>>> The "kernel-module-dyplo" recipe can be found here:
>>>>
>>>> https://github.com/topic-embedded-products/meta-dyplo/blob/master/
>>>> recipes-dyplo/dyplo-core/kernel-module-dyplo.bb
>>>>
>>>> The isue at first glance appears to be that "kernel-6.6.40-xilinx-
>>>> g6a2cb0f14db5" mixes the git version hash from the module itself and t=
he
>>>> git hash of the kernel. There's no such package, it should have been
>>>> "kernel-6.6.40-xilinx-gd7b52381656b"
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#215326): https://lists.openembedded.org/g/openembedd=
ed-core/message/215326
>> Mute This Topic: https://lists.openembedded.org/mt/112412917/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




