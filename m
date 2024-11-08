Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC23D5C0E1
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:57:45 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web11.14612.1731077858641625622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=P8ByhPm5;
 spf=pass (domain: arri.de, ip: 40.107.22.54, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnLB+QLY6V9POkqTkrr8zxFXmmEMLqYJ6LrZunof/aOYRjJMy6hz4d+fDj7NHt7StI7SfnVPu+DdJrP5qSVn4nnYuBZwe/zrXB6kFOlZ1xX8IsHweqYbW7nAB/hJflfVaIrzV3cQIhRpb05xwF+qenlcP5IOzVlnR8d9bnMgtd5SxUVYX9Xqy42RcO2ZeCaur6mE7uK90zyLP3OC9d2FDopULRwjhD9rtMabpQf/2V61Ru2TPewSWvrjJ/FyieJxADlVFcGFdH3YLv+gq1CbpQDuOrrysRucGobU4krEUPsUp0/D3VO2bMhmATh6XoUIM5U/6BCl4SUse2MBlyn3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmc/iWjbhroK/gJnLdq5VBaZ9BZ2narg/tjVXKgMsWc=;
 b=fGf9PJP1oDi1y/3J4JKJ4byl+L3T1aBmcMkWvh4FIsmJ1gwv1TUelJb3GfTWmMdj0aLHmbBPDUdni/DZLQw/CRkHCfQDP8PvAubaPuia01sZahpyyv4/+fClerw54zXeVlb8jVuIznjpRtZBslszyWdHojK92Z5YKepIi7hDYKqUcIegdZm6DCqYPqfu2IYx4iFfSJaWjkQtKlJ9aosWWw1R0PdHAXLxdB8Qd3O862Kb48vCBHiZV/EezJsnot9wRpS8NAx1IFKP82yu3ZWTLp5zpVnd0Hu2ffSw3pDLfi+6CY+7gDnaepjpZ2bPYHEbKSp6+6sPDg7FUdWMbXhJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmc/iWjbhroK/gJnLdq5VBaZ9BZ2narg/tjVXKgMsWc=;
 b=P8ByhPm5jlPHSHL3QfxYCmk4fFjRwyuTMCKrEhk7zKZCcA4UplpkyKeAtdUBnPT9fAh970a5jeitNHpud14I9D4xbX2NNL70NABSpxOiT7GLhgDL+M6HSO6XMKhKn1NawzJrvz3jY7WoXLMzX2ESJ5X2roDTZVaEF7Bd0LGU4mQ=
Received: from DUZPR01CA0289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::20) by DBAPR07MB6920.eurprd07.prod.outlook.com
 (2603:10a6:10:19c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 14:57:33 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::ca) by DUZPR01CA0289.outlook.office365.com
 (2603:10a6:10:4b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 14:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net; pr=C
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 14:57:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.109)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Fri, 8 Nov 2024 14:57:33
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 5466548
X-ExclaimerImprintLatency: 2159275
X-ExclaimerImprintAction: 6015bcf15e284536b0ba015d2aa2e8c0
Content-Type: multipart/related;
	boundary="----_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013"
Received: from DUZPR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::25) by GV1PR07MB8336.eurprd07.prod.outlook.com
 (2603:10a6:150:1f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 14:57:29 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::6a) by DUZPR01CA0130.outlook.office365.com
 (2603:10a6:10:4bc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 14:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 14:57:28 +0000
Received: from n9w6sw14.localnet (192.168.54.24) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 8 Nov
 2024 15:57:28 +0100
From: Christian Eggers <ceggers@arri.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] Preferred version for upgrading Glib
Date: Fri, 8 Nov 2024 15:57:27 +0100
Message-ID: <2865390.DJkKcVGEfx@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CANNYZj9HHdmcd9Ve1S1h-H4yO3hry8PtehcQHDvcb6FG6-j6Rg@mail.gmail.com>
References: <3611538.dWV9SEqChM@n9w6sw14> <2108179.YKUYFuaPT4@n9w6sw14>
 <CANNYZj9HHdmcd9Ve1S1h-H4yO3hry8PtehcQHDvcb6FG6-j6Rg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.24]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	DU2PEPF0001E9C2:EE_|GV1PR07MB8336:EE_|DU2PEPF00028D12:EE_|DBAPR07MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c812e8-ea82-4fdc-0638-08dd0005aced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?l6spJE6w4H1iGwfLxQESm2hVF0ziAUYV7aC04qrZu58OxyMZG5tKNogGnAlO?=
 =?us-ascii?Q?nB7lUFeID2X6gJMDwlWgC+F4XKQOhM1FIhet6rrvyihJb1oaBbZPEneSLbkT?=
 =?us-ascii?Q?9cttrrM5CDP5WGooUZkW+Y81UIEjgfyg9odoHD0xXKwCpvzkhW7N1UXxSLDm?=
 =?us-ascii?Q?DetxQbX7zWXmDCT3t825iHslM1I765HzBz4dr4HP7TPwSCZ8mjoVawbdqiiu?=
 =?us-ascii?Q?S6xktI279apWCEoc12l2zUTef0/o/otAkxApITQCDJhjI3rZf4IJ59lq2yvg?=
 =?us-ascii?Q?JSKadGMzklI5pZsZyav3KtO0QoyvAl9g8Z7pDeglDKwomAXdLmJD5TL/IfEX?=
 =?us-ascii?Q?zpQnG6EL39IBvuW1/jeUF9l50X2qykLPqNbKr+Xbs+L30wOPmxtgkaJu4ZBG?=
 =?us-ascii?Q?3CVWqxUsgKtbIGy/x57zFyfub6KqwZ2o6vnjXm0KMJW+HSET0JN9HexK5jGH?=
 =?us-ascii?Q?ZhW8WkKP6PsMFNh3tdNbdpyS4O2j1JDYt13EM31MS2EsZ74ToJJqYacgrSGh?=
 =?us-ascii?Q?6+lCtJd3D92Q4lUNkF7BlV1p7qPqR/9bJP92jCz7LwGuMS+26WFYoTbK35OS?=
 =?us-ascii?Q?cM2jfs+pzwgHAD4I3vyvb4YRQ4Gv60wx6YSKkw2quepyIEw+huk6CCmjXZGZ?=
 =?us-ascii?Q?jf/CydzvKvIswMD+NZHTUXAcFQ9urivar+NIT7zeZeXdQfeQwur53exKnOVx?=
 =?us-ascii?Q?uSAGzOYjD1QBnUTNIJVOFYlBA0tv1HWTIaTINmSXZxsN0C23rf1GtB9cv6U2?=
 =?us-ascii?Q?UkRvivYDUUcEHDK8Djbpo56volHBS6Xrq4Ya3uesHmQUF0P2i2VwM8cJZ1gy?=
 =?us-ascii?Q?mj6RMtALGFJ9f7czS36YosmvaDNXF7NuvMTmS2I+UHgNQ85okdiLcoi42siJ?=
 =?us-ascii?Q?6F51OluZkZqnPqIUSRIxvLSj5gn2gPwayX5txceZn2Na6aJUb1lBXspN9Z3B?=
 =?us-ascii?Q?vk7P19Ahl2i96AFu1ndzx7+DppgTpAjwXuTE85wIzgTuBYaOzFgWZWqNDisW?=
 =?us-ascii?Q?uix4EBu/i1g00lMIjaqUUzMl9kIr0Zvw6yV/UiCCc4yeuaMlEsuVGP6+yu+O?=
 =?us-ascii?Q?Piicf4Fu1gqTu6Hh1eYAQzOaC6+6f0CWbskxOse0yyGA7mJHwMG0DHtXh3c8?=
 =?us-ascii?Q?xNNXWQ14kaT0lavae8p6+EvjZeEWcnn04TE0fNsWAlMsLkzFIDTA3egJIEf/?=
 =?us-ascii?Q?mUxrRYlCiGyKghJC+lte0pWuj2zu4SvUzhpUUtGpsvXMaJmlHlzrd4uc2NC9?=
 =?us-ascii?Q?uEE9j09JskTEh/O8gd/ddg8axFgFByO/wQdOvaWC/A7DneX2D0WWou/1Oie5?=
 =?us-ascii?Q?HKV4hgAwxbKNUGdLB9dq12uXqVKa/bThGtzR19B6Vgrtjas2BBXEcWsuxz2t?=
 =?us-ascii?Q?rTNlG+fDRVx3aU+PdekYH+AJGQA+MYU70oOCvKXpoOPJkmjemQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8336
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ad06e2f6-3159-4e38-ff01-08dd0005aa3e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|82310400026|14060799003|8096899003|4076899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d21QbHFmc2w2VTVxTzRXNU5BbHNZZ2dSVkgwd3ZZT2l4OXZ6YW9DN2NpUWVZ?=
 =?utf-8?B?TjdoTkhmTlNWQXFyUzBUYm9NczBIOTZBbFFYb3p4TDlKby8zWHBSSWFaQ3pW?=
 =?utf-8?B?MzR3RDhMSVBWbEErZ2NmMWp0K1JxQ1VMZittcHZtaFZNV3Axd3VqQi9qMTU4?=
 =?utf-8?B?M1Bia09sYzZxazJXUGE2TlJRQmlXMzV3dVlONnRmZmpJME04RFlNdGNjdmI5?=
 =?utf-8?B?aDh1eGJCVy9la0RyTEJJU0VZclRrM1JZRnJxcEtsQmxJVUZaQmI5WFlmTUFz?=
 =?utf-8?B?UXV3bzExTmpVM0IxRDZmWm5EQmFBKzNEVlJpQXRRY1VWdGUxRGwzNk9aZzlH?=
 =?utf-8?B?R29rMUhRN2FlY3ljQkxDb0duSlBKS3k2MUZJdzEyZGRvTGxhR2p2V0FnNjM1?=
 =?utf-8?B?cGlIQ1E0djI5NUFPWi9iVVFIUEcxclNEczVNWjBwek8wa08rODFoYnRqZmFS?=
 =?utf-8?B?c3pxeU5tT1R6cE54VjV0ZUN4MGxEWFNWcHh0QmV0ZXlPYStrRkk1REFvTEZI?=
 =?utf-8?B?YldnbnVvT1hFRys5QjNUTWd1NldGVElIclhVdmJBYWhDUEdyTVZUNGVsRUxN?=
 =?utf-8?B?SWk1VTZxUnBpeGVpL3ptM0NuQjlseUJUaFB0akJLWXZ5RzQwQTBwUDl2NHhi?=
 =?utf-8?B?Qm9KU0tpSXhMTmdIY2s2VWc2OUpVbFRERy9NbUFNblRib3NFNnk4VTlZdldt?=
 =?utf-8?B?cWNNTzd5ZG0vd3FzUnF3dXNaYldtaENJK0pzM0NvRHhzWHVrcmtlK1drNTNS?=
 =?utf-8?B?M2Z5bUQ1VENUUkYyaDhyWWV2THI3NG1ESWUrWC81YU11Uld4TFhNbnNwR2pN?=
 =?utf-8?B?ano4RElwU01ENUpZemFHSUtPWnowbjFmeW5mNHRKVzBHY3RhTlJqQjc0RjVU?=
 =?utf-8?B?QU1SR2lvWW1SVmZoS2psNG80R3E3THR1V1pXd2VlVlJkUUpNMncxdWZOVVYy?=
 =?utf-8?B?WEFPdDZKNk9jNXFsZTdubytOQVdvdGlkYlQ5aG9YL0pCaUh3YzhROWNyTXdk?=
 =?utf-8?B?WXJMTkJ2UHlsMnlYd3p3ODhOM2c5WCtHcCtjVGczYUdtalByOEJLN2dHdVls?=
 =?utf-8?B?NUh4MThFMzZFV2ZRSHY0TDhibm9BQ0RJbU1NR3Y2S3hNdnp6K1hEeGsxRGFR?=
 =?utf-8?B?aHBQVDBjeXErRURRYzBEdVcwZXhmdm9NR1pQd3lvRHZRUTJXMHJkM1dFdHFy?=
 =?utf-8?B?MjVVbFlUaXZoaXZhd1FEZC80ZjFrZXBwaDhia2RlaE1wM0Q1eGRGbGJiMHBO?=
 =?utf-8?B?ZEVTeVJYTnNUM21kdERFcnFnRmdleTFucng3Q1NMRHExekp0cVZNNHRQdExS?=
 =?utf-8?B?R3lhaVdyYXNRaDB0V2JNbmF2U3R3ZXNuQmVXS0Y1V2tGWG9NSnNyQndEbkRI?=
 =?utf-8?B?WVpnaEVJRFMzTEs4MUhpRUxKcVI4bG5mMVJMcEJEY3JPcmt5RVJQdGhIMW53?=
 =?utf-8?B?OWJSOEhkN0xkZUwxQXRmeU9ub2R1TXAyZk9OUUZwck5ZMDduQTFlZ2NDZFB0?=
 =?utf-8?B?RXBDWlA3VmRuZlRnaFNBTTNWVDBxVEN2ZW9Ga2hWcVFyNkVWZXpMSjJCY3k2?=
 =?utf-8?B?UGpMUEFpejVyKzFGRGcvM0tmcm50c24wTlNIdUo1OGtuMkpKVnViZkNSam5x?=
 =?utf-8?B?SEh6Qk1SRi9Vb2JoRWtGVDYxKzB1VlF4b0I2NGRlZm02S1V6dGhMcFBzbmlQ?=
 =?utf-8?B?Q3dlM2hnMk1OZ1I1dXMxN05FQnc4TERXazRTUEVGWTZ3djhBZE9YdHNGZVRK?=
 =?utf-8?B?Z0RuOE1NQTdDSGlpVS9sUVc0TlZlbE8wdU50NkptTUJRNXo3Z3ZuYXE0c0FB?=
 =?utf-8?Q?9wjuK+E86+sheanJDPZSlPr4M+0TFP7n4dxMU=3D?=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003)(8096899003)(4076899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 14:57:32.9404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c812e8-ea82-4fdc-0638-08dd0005aced
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206888

This is a multi-part message in MIME format.

------_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_1c1fe55f-fce5-40f0-8d09-14d9ae0c250e"

------_=_NextPart_1c1fe55f-fce5-40f0-8d09-14d9ae0c250e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


On Friday, 8 November 2024, 15:49:11 CET, Alexander Kanavin wrote:

_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Stefan Mairiedl; Walter Trauninger

=E2=80=8B
> On Fri, 8 Nov 2024 at 15:39, Christian Eggers <ceggers@arri.de> wrote:
> 
> > Hi Alex,
> >
> > On Friday, 8 November 2024, 11:46:03 CET, Alexander Kanavin wrote:
> > > You can do anything you want in your private layers, but in public th=
e
> > > options are:
> > > - backport the fixes
> >
> > I tried to backport them, but beside the mentioned merge request I
> > need a number of other patches which feels like creating a zombie.
> > Due to the complexity I cannot prove whether the result is valid.
> >
> 
> Yes. This is the problem with LTS releases 'bugfixes only' policy that
> cannot be easily resolved. Do you *have* to use scarthgap, or can you
> transition to styhead?

Currently we are in the process of making a new release, so switching
to a newer OE version is not possible. Switching "only" to a newer
Glib release will let me sleep well tonight.

> > Would this help other users of Scarthgap? I thought that the mixin
> > layers are intended to bring new features to a stable layer. But
> > in this case there is a serious bug (race condition in the memory
> > management routines) of a major piece of software. Every multi
> > threaded application based on Glib is potentially affected. On
> > my system it's NetworkManager, but I also read about Firefox.
> >
> 
> LTS mixins isn't about new features. It's more about making it possible t=
o
> 'opt into' potentially disruptive version upgrades. If such an upgrade
> would land in oe-core scarthgap, users would have no choice. With LTS
> mixins they have a choice: take the upgrade, or not. If the issues don't
> affect them and they don't need new features, not taking the update is a
> valid choice.

Thanks for the clarification.

> 
> Anyway, you are welcome to prepare such an update for meta-lts-mixins.

Cherry picking the commits from Styhead into our private repo was a no
brainer, so anybody can do. I only thought about other people who may
have the same (almost unfixable) problems with NetworkManager. Providing
a mixin wouldn't really help them because probably nobody would look for
it in such a case.

> 
> Alex
> 

regards,
Christian




------_=_NextPart_1c1fe55f-fce5-40f0-8d09-14d9ae0c250e
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div><br />On Friday, 8 November 2024, 15:49:11 CE=
T, Alexander Kanavin wrote:<br /><div dir=3D"ltr" style=3D"mso-line-height-=
rule:exactly;-webkit-text-size-adjust:100%;font-size:1px;direction:ltr;"><t=
able dir=3D"ltr" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"=
width:100%;direction:ltr;border-collapse:collapse;font-size:1px;"><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:co=
llapse;font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" style=3D"width:100%;border-collapse:collapse;font-size:0;">=
<tr style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-weight:=
400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;fon=
t-family:Calibri,Arial,sans-serif;">_______________________________________=
________________<span style=3D"font-family:remialcxesans;font-size:1px;colo=
r:#FFFFFF;line-height:1px;">&#8203;<span style=3D"font-family:&#39;template=
-LZ3Cj7wTEei85wANOiIRuQ&#39;;">&#8203;</span><span style=3D"font-family:&#3=
9;zone-1&#39;;">&#8203;</span><span style=3D"font-family:&#39;zones-AQ&#39;=
;">&#8203;</span></span></td></tr><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:co=
llapse;font-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-sp=
ace:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"v=
ertical-align:top;font-family:Calibri,Arial,sans-serif;">Christian</td><td =
align=3D"left" style=3D"vertical-align:top;color:#000001;font-family:Calibr=
i,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-=
align:top;font-family:Calibri,Arial,sans-serif;">Eggers</td></tr></table></=
td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-ali=
gn:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"b=
order-collapse:collapse;font-size:0;color:#7F7F7F;font-style:normal;font-we=
ight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
">Software&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67px;color:#000=
001;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;">&#8203;</td></tr></table></td></tr></table></td></tr><tr s=
tyle=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><tab=
le cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collaps=
e:collapse;font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" styl=
e=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"border-collapse:collapse;font-size:0;color:#0E50AD;font-sty=
le:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33=
px;"><td align=3D"left" style=3D"vertical-align:top;font-family:&#39;Arial =
Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67px;color:#7F7F7F;"><=
td align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span sty=
le=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Techni=
k&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></t=
d></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" styl=
e=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"border-collapse:collapse;font-size:0;color:#7F7F7F;font-sty=
le:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67=
px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">Arr=
iweg&nbsp;17</td><td align=3D"left" style=3D"vertical-align:top;font-family=
:Arial;">,&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middl=
e;font-family:Arial;">83071</td><td align=3D"left" style=3D"vertical-align:=
middle;font-family:Arial;">&nbsp;<br /></td><td align=3D"left" style=3D"ver=
tical-align:middle;font-family:Arial;">Stephanskirchen</td></tr></table></t=
d></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" styl=
e=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;fon=
t-size:0;color:#1532B9;font-style:normal;font-weight:400;white-space:nowrap=
;"><tr style=3D"font-size:11px;"><td align=3D"left" style=3D"vertical-align=
:top;font-family:Arial;"><span style=3D"text-decoration:underline;"><a href=
=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"tex=
t-decoration:underline;color:#1532B9;">www.arri.com&nbsp;<br /><br /></a></=
span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"verti=
cal-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" sty=
le=3D"border-collapse:collapse;font-size:0;color:#858080;font-style:normal;=
font-weight:400;line-height:normal;white-space:nowrap;"><tr style=3D"font-s=
ize:14.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font=
-size:0;"><img src=3D"cid:image620512.png@E693A2E7.1B21FED9" width=3D"20" h=
eight=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-w=
idth:20px;height:20px;min-height:20px;max-height:20px;font-size:0;" /></td>=
<td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibr=
i,Arial,sans-serif;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;">+49&nbs=
p;8036&nbsp;3009-3118</a></td></tr><tr style=3D"font-size:0;"><td align=3D"=
left" style=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=
=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"font-size:0;"><td=
 align=3D"left" style=3D"padding:0;vertical-align:top;"></td><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"font-si=
ze:14.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-=
size:0;"><img src=3D"cid:image401169.png@1FBCDBA4.4B8823D6" width=3D"20" he=
ight=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-wi=
dth:20px;height:20px;min-height:20px;max-height:20px;font-size:0;" /></td><=
td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri=
,Arial,sans-serif;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;">CEggers@arri=
=2Ede</a></td></tr></table></td></tr></table></td></tr></table></td></tr><t=
r style=3D"font-size:14.67px;color:#000001;font-style:normal;font-weight:40=
0;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-=
family:Calibri,Arial,sans-serif;"><br />&#8203;</td></tr></table></td></tr>=
<tr style=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"p=
adding:0;vertical-align:top;"><a href=3D"https://www.arri.com/en/cine-lense=
s/enso-prime-lenses" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;"><img src=3D"cid:image394958.jpg@3805BF91.7C7A7CD3" width=3D"=
650" height=3D"95" border=3D"0" title=3D"Ens=C5=8D Prime lenses" alt=3D"Ens=
=C5=8D Prime lenses" style=3D"width:650px;min-width:650px;max-width:650px;h=
eight:95px;min-height:95px;max-height:95px;font-size:12px;" /></a></td></tr=
><tr style=3D"font-size:14.67px;color:#000001;font-style:normal;font-weight=
:400;white-space:nowrap;"><td align=3D"left" style=3D"padding:0;vertical-al=
ign:top;font-family:Calibri,Arial,sans-serif;"><br /></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;=
"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-c=
ollapse:collapse;font-size:0;color:#6A6A6A;font-style:normal;font-weight:40=
0;white-space:nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left" sty=
le=3D"vertical-align:top;font-family:Arial;">Arnold&nbsp;&amp;&nbsp;Richter=
&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG=
<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amt=
sgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;=
HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbs=
p;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz=
:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&n=
bsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;5=
4477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Stefan&nbsp;Mairiedl;&nbsp;Walter=
&nbsp;Trauninger<br /></td></tr><tr style=3D"font-size:14.67px;color:#00000=
1;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Aria=
l,sans-serif;"><br />&#8203;<br /></td></tr></table></td></tr></table></td>=
</tr></table></div>&gt; On Fri, 8 Nov 2024 at 15:39, Christian Eggers &lt;c=
eggers@arri.de&gt; wrote:<br />&gt; <br />&gt; &gt; Hi Alex,<br />&gt; &gt;=
<br />&gt; &gt; On Friday, 8 November 2024, 11:46:03 CET, Alexander Kanavin=
 wrote:<br />&gt; &gt; &gt; You can do anything you want in your private la=
yers, but in public the<br />&gt; &gt; &gt; options are:<br />&gt; &gt; &gt=
; - backport the fixes<br />&gt; &gt;<br />&gt; &gt; I tried to backport th=
em, but beside the mentioned merge request I<br />&gt; &gt; need a number o=
f other patches which feels like creating a zombie.<br />&gt; &gt; Due to t=
he complexity I cannot prove whether the result is valid.<br />&gt; &gt;<br=
 />&gt; <br />&gt; Yes. This is the problem with LTS releases &#39;bugfixes=
 only&#39; policy that<br />&gt; cannot be easily resolved. Do you *have* t=
o use scarthgap, or can you<br />&gt; transition to styhead?<br /><br />Cur=
rently we are in the process of making a new release, so switching<br />to =
a newer OE version is not possible. Switching &quot;only&quot; to a newer<b=
r />Glib release will let me sleep well tonight.<br /><br />&gt; &gt; Would=
 this help other users of Scarthgap? I thought that the mixin<br />&gt; &gt=
; layers are intended to bring new features to a stable layer. But<br />&gt=
; &gt; in this case there is a serious bug (race condition in the memory<br=
 />&gt; &gt; management routines) of a major piece of software. Every multi=
<br />&gt; &gt; threaded application based on Glib is potentially affected.=
 On<br />&gt; &gt; my system it&#39;s NetworkManager, but I also read about=
 Firefox.<br />&gt; &gt;<br />&gt; <br />&gt; LTS mixins isn&#39;t about ne=
w features. It&#39;s more about making it possible to<br />&gt; &#39;opt in=
to&#39; potentially disruptive version upgrades. If such an upgrade<br />&g=
t; would land in oe-core scarthgap, users would have no choice. With LTS<br=
 />&gt; mixins they have a choice: take the upgrade, or not. If the issues =
don&#39;t<br />&gt; affect them and they don&#39;t need new features, not t=
aking the update is a<br />&gt; valid choice.<br /><br />Thanks for the cla=
rification.<br /><br />&gt; <br />&gt; Anyway, you are welcome to prepare s=
uch an update for meta-lts-mixins.<br /><br />Cherry picking the commits fr=
om Styhead into our private repo was a no<br />brainer, so anybody can do. =
I only thought about other people who may<br />have the same (almost unfixa=
ble) problems with NetworkManager. Providing<br />a mixin wouldn&#39;t real=
ly help them because probably nobody would look for<br />it in such a case.=
<br /><br />&gt; <br />&gt; Alex<br />&gt; <br /><br />regards,<br />Christ=
ian<br /><br /><br /><br /></div></body></html>
------_=_NextPart_1c1fe55f-fce5-40f0-8d09-14d9ae0c250e--

------_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013
Content-Type: image/png;
	name="image620512.png"
Content-Transfer-Encoding: base64
Content-ID: <image620512.png@E693A2E7.1B21FED9>
Content-Description: image620512.png
Content-Disposition: inline;
	creation-date="Fri, 08 Nov 2024 14:57:33 +0000";
	filename=image620512.png;
	modification-date="Fri, 08 Nov 2024 14:57:33 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013
Content-Type: image/png;
	name="image401169.png"
Content-Transfer-Encoding: base64
Content-ID: <image401169.png@1FBCDBA4.4B8823D6>
Content-Description: image401169.png
Content-Disposition: inline;
	creation-date="Fri, 08 Nov 2024 14:57:33 +0000";
	filename=image401169.png;
	modification-date="Fri, 08 Nov 2024 14:57:33 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013
Content-Type: image/jpeg;
	name="image394958.jpg"
Content-Transfer-Encoding: base64
Content-ID: <image394958.jpg@3805BF91.7C7A7CD3>
Content-Description: image394958.jpg
Content-Disposition: inline;
	creation-date="Fri, 08 Nov 2024 14:57:33 +0000";
	filename=image394958.jpg;
	modification-date="Fri, 08 Nov 2024 14:57:33 +0000";
	size=50387

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABNAAD/4QODaHR0cDov
L25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENl
aGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4
OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA5LjEtYzAwMiA3OS5hNmE2Mzk2OGEsIDIwMjQvMDMvMDYt
MTE6NTI6MDUgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcv
MTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIi
IHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJl
Zj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6
eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50
SUQ9IkZCNDU2RDlERDVGQ0FEODFDOEFGRUEyOEFFM0M3OTZDIiB4bXBNTTpEb2N1bWVudElEPSJ4
bXAuZGlkOjZCQzk2OTdBN0YzOTExRUZBOUY5REZFMzkyRjZENzRGIiB4bXBNTTpJbnN0YW5jZUlE
PSJ4bXAuaWlkOjZCQzk2OTc5N0YzOTExRUZBOUY5REZFMzkyRjZENzRGIiB4bXA6Q3JlYXRvclRv
b2w9IkFkb2JlIFBob3Rvc2hvcCAyNS45IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9t
IHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NTBjZWQ5NDctNDIwYi00NGU4LTk3ZGMtMzkyNDg1
ZTMxYjUzIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MDk2NjJhMGIt
M2ZiMi1iYTQxLWE4YzQtNjFkZDYwODQ1MzAyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpS
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

------_=_NextPart_d39771d5-dc4e-47b0-8494-1bf144d76013--

