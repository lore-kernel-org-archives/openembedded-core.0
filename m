Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA56FC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:32:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.web10.15176.1750339931501215917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qbZIph2A;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qbZIph2A;
 spf=pass (domain: arm.com, ip: 52.101.84.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xtY7v2jp4Ue9C9pb1IR9NhseyBmtsrC0BjAlx4Y7SxMnM3TInl2eSZ5pEACDs54PqB4X9MMMCNs5i5HEI0YspmEdUbZFUawyrdp4bc2ddb6C6VFfrhhW/lq8moNgfFAs0MXu6/2N87hykH+wHOEz8Gn5DM7buetSrJqNa2TbO0TYWzSFFyaLI6kBq06MGcXoccU2f1GuZhxhh1oEN9GfkRHMQXvg6w8ri4jWmiKbnwKkjssI2QPaxcM+6zCokA6cjTqk8TLQbpIatsx+Be3yQXbbINnk2gu3/AEIIVwn4P72tMivCvMTZ6G7jAwMMtAimonVUyO1w6sLdhuKpNA4DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUF+pTh7CpJ9HfbhVSQBEyxcj1aO6VCEfkOt5ykuJ0g=;
 b=wZPUF8SvdSGu9ZroehYfvgbeWxpOXy+uWWxVFRaMiyOO4hMQPixwLXai9nj5LYpYdwNfkf+2M/bcDLEEtIO5S7xssrtPGUuMQiotk2K0niRExrDdge6K2JmuDvjgsDKHH86Std56/7ETR3HQyRskPwclvy4N1ZGCzAimt3TjeIwI9e9ru2gKP6AaqotzvltCofmDK0Xi1L0KzTxbst4dXjmZqg1EtrOoMdJ6+KyjQ04X5y5wwaCuKmxELddKXglEVY12Hqzw7ax9h8WFFglxEFuSt/FwCZpWbQ8wkwICSG+ZKktgIsLlNx7fFsTPs7CwbVksFL0WUGsqQGoKmfKjTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=baylibre.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUF+pTh7CpJ9HfbhVSQBEyxcj1aO6VCEfkOt5ykuJ0g=;
 b=qbZIph2A17EgWE3a9LxbTNGltKW3/gwovsgDv77p4YFP8f93aq218EWVid3JjXvp5/oiAzOh4+m3OP2sF5B5iVbD0QhDdU0KYvNkZ54uMLfMMG9Y9+6Ts32rKqaoVK7znCYhlVRNOjPZ4JXz2+A6KsBJ8z37ZsZBdSfbvSEtoPM=
Received: from DBBPR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:d4::17)
 by AS4PR08MB8094.eurprd08.prod.outlook.com (2603:10a6:20b:589::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 13:32:07 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::ce) by DBBPR09CA0029.outlook.office365.com
 (2603:10a6:10:d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 13:32:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 13:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqslorJFY2+SWq85IGlHku8OpVYWb74Op57KvdezMFxUfRBUK1tyUZ9Of28Uo7ICBRxnLSAZymB1A42PwEssEtSkjnkMhK65vnUnCZ3kYhPrNuaq9qqFBXSl2OMqSGYvA2HF6kRa6zaUvgmft6zKGydA6ofxzlXpyTlPDDSvy/sNPwzby2oi4YYsq/reWHxLAWL777Hn8zBWmh370blymMS2gT8POZ/e2TuYdrgH2XmeoSlHjlrlsFgq/ATtPgpSIk1z3V9YrZqbw4fyQp5y1PR98eFR9HRPgQZtQqwutfRb/hS3kEP5wkajFsPRvJKizknMH+KwOLNHEYk6Ml/pGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUF+pTh7CpJ9HfbhVSQBEyxcj1aO6VCEfkOt5ykuJ0g=;
 b=Pvd+QqkKfRt4cKPRvslEw88pl4HQi00XLdZrfSljBIO/2i+92drsA4jt7khqIpd6cQPRk74myv38nSBLRs3rEQ7kATyLS1KUDGIyGlHm534puGUXfy+OEuRXfL0jJMtxnlcpQwMeTKwE3RSfO1kt53CiaDmuV4vvSmIGPPgz8boOond0v+TsfuvRe5Mn8YtpSjr9Ke2fLeXEjY1okuM4Fh/aTKY8waj2w9DS/ifhV8dU4cXxX5aoAceMG+wfh1UQkn0agWwPii1x+/SM3hRVuUiQnPZ+v6GL79x870TppqBY7FzMmuXgwbZa9kACsEUDcG5DWl4Fjw6cx1s3IcW5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUF+pTh7CpJ9HfbhVSQBEyxcj1aO6VCEfkOt5ykuJ0g=;
 b=qbZIph2A17EgWE3a9LxbTNGltKW3/gwovsgDv77p4YFP8f93aq218EWVid3JjXvp5/oiAzOh4+m3OP2sF5B5iVbD0QhDdU0KYvNkZ54uMLfMMG9Y9+6Ts32rKqaoVK7znCYhlVRNOjPZ4JXz2+A6KsBJ8z37ZsZBdSfbvSEtoPM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9055.eurprd08.prod.outlook.com (2603:10a6:102:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 13:31:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 13:31:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/5] python3-colorama: add recipe
Thread-Topic: [OE-core][PATCH 1/5] python3-colorama: add recipe
Thread-Index: AQHb36AGpUnMxNTTAEOQWys5Vcq7sbQKfaYA
Date: Thu, 19 Jun 2025 13:31:34 +0000
Message-ID: <DC6B7B7A-BBA0-4F04-B08D-16DF23229A6F@arm.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
In-Reply-To: <20250617155339.1305652-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9055:EE_|DU2PEPF00028CFE:EE_|AS4PR08MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 53267a4e-f6cf-49e2-2f8b-08ddaf35af82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?h0FTQd/GzMTocQGhOo62P+v1PXk9j/jQcMUcXoCBqtwGzkPvDRU1+heghXgu?=
 =?us-ascii?Q?s4Gwwvf7FQ1a/kvqGGqvy/jWPRNUbzSkun7X8mrMZ6uHxaP6s3YCJSRdooSZ?=
 =?us-ascii?Q?VZfBT1RZH1YGEfaiLOceinukSXznhu8o13em+UC8H7i8Vjp6jZH/lCz7Sg53?=
 =?us-ascii?Q?iP0N3hZSntRo5e40rEAUlDRZUH+VvNAzuB/JRaQ21ZW3VQ71lU6872at65au?=
 =?us-ascii?Q?0dBcuCoOQpfc9vpO5XByDu7ubtzdtWLoDSk6M8L9EtS/ixqs8+LJ9ThEfqWa?=
 =?us-ascii?Q?DaVWZpNmV0ONAYRcQOEHAjz2SfXF8BC64ATHTCmxDn47C1O6eDQpgjQGdkrr?=
 =?us-ascii?Q?69igPMheNBleeQ7KX5yoCyJtlqJfteCzGjrzWQv0qn1FhleGKUw6Izt9CZcT?=
 =?us-ascii?Q?ulFvsbIOwdgtumvX8u4Yz+opVXadqWIswu0PmyMZquo7XNzD6jazhHFBrxl8?=
 =?us-ascii?Q?wwCeCxQk3wkiN3RRZhTis/Z2ZSyA5yfPS7XwQLL0EXcFVJcwGqOIgF2Iaeg+?=
 =?us-ascii?Q?ccibRxrPRDgGRIqlnFrgCkaFRcyjBr2/CpBSXgsNbjVxER5skvqN5PNfEmFZ?=
 =?us-ascii?Q?P7osJwHl90dCuM3ch2z2kbKyLDboDMqIlYIOxqH2VyWF0kGGE98Oe340w5Ep?=
 =?us-ascii?Q?KCbN43dU8mH23DS4XAc0wWa+dbjG7GvhJHICk3D2TYVVxhSOqxVkyVECmrDk?=
 =?us-ascii?Q?ASdaJm5SbwPPirrk27H/znBpfji1JsKvVTPvthlhmr3VitzgjMOk4Daj/IVB?=
 =?us-ascii?Q?XgwHpUvvtIFSIFNXnajn9JkTvP6d3FrKPFhNV56HYC9hcan84cGWT+7nu1vZ?=
 =?us-ascii?Q?zc5VAMb2Gkf1DFbzIyfpg+V7n/RvVkq2XBCvIjQsjWVOLIDqwqZ/Jtui3NSi?=
 =?us-ascii?Q?v4icAvW1tBVHCnBTLC6x8dt8q0IbhwVA0dw2LJiFLoQpqTDjQpuX/cdo48a+?=
 =?us-ascii?Q?IpI4TXNephGxd70p6OJYVoMBJolrphq+iX3lifMxNFRZ0AmPa1fycQ8WORap?=
 =?us-ascii?Q?gxeSqXpzTWDKmpSKEiQln0vN+Ck5kxIiSMytEZCYBVo4OX4N0GRnB1zyHsV+?=
 =?us-ascii?Q?5aeRmaQ17X3nwaaiU11nqNCUkC5KCaFbXe+PbW3HaLJreRf7JfMgScA7snj/?=
 =?us-ascii?Q?rXMO/ukwpi8sQoWDopqJZrldTCZOn+0GQBP0LoWg2m6FHMGjmdr3Hj8X0hth?=
 =?us-ascii?Q?YjMk3TgMrwxsXlH9YBIbuIJiIdGozH5lRQ7qJ3CqZk3IHmBO6plQ81Bah5Vs?=
 =?us-ascii?Q?4S1S0RVvWgibCaWPgEC+e9vOu9gCKpXwFLFwXE6UFWFpRsDleeIsydszTIGy?=
 =?us-ascii?Q?f+jDez7S5f2azi9dpcz1Yh753z3nEANmf7xjG7dHupLXZsJ+kLyfYaPh/tgA?=
 =?us-ascii?Q?mTkB2GBVwB9GjfVX5dzUnJe76CfFKa+3vME18EJiXKV5ACJxdwcu3ySO4it+?=
 =?us-ascii?Q?Lyyz8f0YXxs/asGvr0AXXs0/a47OLNDmrDd7ggtbRC5HHErLphvsOldR9rDh?=
 =?us-ascii?Q?y0A9fZ0ribi9qk0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F8A248DBAAB2D49B2ABE624A90E4251@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e39c9ede-08b4-46ef-b3e2-08ddaf359c72
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fJ6GTGd2NU4j68YFdA2uNbVOweO/kMxWlopfWAxy6uPGALSzU95PVacJciR6?=
 =?us-ascii?Q?jr4Wi8WsQQgbiUrcVvcI9FsVcV9Z47C/ZHoTf+hlmrLvjnF1rYrcl0V6cR7/?=
 =?us-ascii?Q?+GZ84VFtQs+7D1aBn6mix/C77grE5HjL8rT/q29rnJS+s8fCT1OLzLmY8bM0?=
 =?us-ascii?Q?vSKliJ+pwcsLVpvOcPSeRXzvHfeR7fZXt03rksnAkwh7EreGjH3VoKb2Kyvi?=
 =?us-ascii?Q?6A/FdPJO9O38inXnqzxqoMBjjPrVUQfxYqKLoSxkrdcyeV+MuRplWoPoerwS?=
 =?us-ascii?Q?Yz64fmnpcRHE6VYlUdJ52YlGr7kc4ZrZHy3jtD7pZeJB+pbOeWtIVmCKWcki?=
 =?us-ascii?Q?vEU2y+Fs4AX4eFiAfSWtDWqPbqgIA+7Mjdy76LxH51m9cV0UWJpA6I2XONTZ?=
 =?us-ascii?Q?oOdW1VShlAN87aW5a66x/L86f+brNqHSnOsHrIZz/kus+1LGVxUFVSxNFLKr?=
 =?us-ascii?Q?CsWgmkW1Z1x83s8rdIcF0TkCR7bqC1aOlW6uVKio/4u3xc2ZNTD2aLNvsMzb?=
 =?us-ascii?Q?d+REjocQfjLMNt3PzwkhT8LXS3vX4P0dVlYOSqKvaveFYueM+XdFAaODBReB?=
 =?us-ascii?Q?nAogsOAIMGN4gNOyxoljpr/3zFz8HfPsKr7HkUN0i/VVx+uKbxsF73pNpqJG?=
 =?us-ascii?Q?W4iX/LNiNrxTvVpL6BLGH5Ng1WscEPJ25seve4iQbJQfoqH+RgvB/ejZrdtz?=
 =?us-ascii?Q?6LMMaPPf2jfrjAiqweaVIIwB0bz47qV2XlS1yiwk6x02gR8/fNeeJUYY5OO4?=
 =?us-ascii?Q?lRmfxgA4JH96B28q0sV7WFnr7T+5vgr0ZaSj/4roBg2RuNg7ttFoHRwrVX4L?=
 =?us-ascii?Q?Dm83v2QY/cArcSrc4XSqXBfIUi7bNzs4Ie2dR8nq3znqMw/vvnzXW2Lqo20j?=
 =?us-ascii?Q?RWnpj+eVRzcEmDd88laLL4oMKJQZL5U7SIPDrIkfcgFeGvpu8wGx3wSG/ERL?=
 =?us-ascii?Q?PQTk6A4FUEWGd6mkFzeOcknq20JdZhTn/a138NWcaXclrZFfkSUgrDf4Karo?=
 =?us-ascii?Q?u2frIOOXK1cJ4RkJmG/Jj21S0okhzePz+Nrnc1XBFnmA+9Vr49PwXYn94nh4?=
 =?us-ascii?Q?HiExufRR++dG3rhgoMFc/6OKeFtwkKgLYz4xjaCKjr1Gg8PKwZnFlqQ5lq/B?=
 =?us-ascii?Q?ylR5s4meQrjDhoYiit6jT1CIcuARvfR6ka/FIMyH1h74IBtAP2YzsTNjFHdQ?=
 =?us-ascii?Q?UOlfOzuwGq4EqAXl203znsH1x9LoMcIRs9HZa+VKTfcQywPSYq4vBDuHRB0E?=
 =?us-ascii?Q?jGJC6bDGDvqSDDcZcPKVnpAdtplNbCWB7k3NMTwYV0Lr4f9Nup/B2iYOux2g?=
 =?us-ascii?Q?uk9P0TU3ruC9WSxd1rsmRsR83NxkbazA2yHeeTWMLO5ahxyaezmrcVSZXqWI?=
 =?us-ascii?Q?0OB82zMv465BApC/i34cELPHMorUUQSn8JPbT/jjvEHU4oI+uHfCmIGFKK2x?=
 =?us-ascii?Q?Xk7q3I4G+fjStof/NzlEGSIWUHMAo6eT50/cNwXKHrHWjGj4OyOIgv8oPFUd?=
 =?us-ascii?Q?MOoVWgZ4/bdAEpkjjyjI6YKtbyW/pPf97C7F?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:32:06.8714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53267a4e-f6cf-49e2-2f8b-08ddaf35af82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219082

On 17 Jun 2025, at 16:53, Trevor Gamblin via lists.openembedded.org <tgambl=
in=3Dbaylibre.com@lists.openembedded.org> wrote:
> +inherit pypi python_setuptools_build_meta

So this package uses a modern setuptools to build.

> +DEPENDS +=3D " \
> + python3-hatchling-native \
> +"

So this package uses hatchling to build.

One of these is wrong :)

I suspect the recipe should inherit python_hatchling and not have a DEPENDS=
?

Ross


