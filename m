Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802BACD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 16:33:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15656.1778776431182068973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jR/qa1mC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jR/qa1mC;
 spf=pass (domain: arm.com, ip: 52.101.84.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OsF3e1/AOor4BStuROTmysievDupOHzODSHs1dZyY0SbKL37n50Cq2mpYARlLOYFswO0NIWWk/mpcd36ejfewqM/AvN+CPMOAaMpEL3IzUkK3Q+VEX2sovx52czdpV46tsZP2fpFJkgGokknxTIRXvFhDb2WL0S+RAnPeC9KKC81mLD8/y3h0Mvsm3eKlI6EZjH9pvSLH0mTytzRO8l4QqZTCYHnTt8EBYXI3T6OYKMr0287y4MPp/nk7IkcsRvDC569EQq7/0Z9AOlih2hdvjk3YPmdEJW8WiYdHcT2JZvjw62s/zFNYznzBwDe7J7RnCxxf58VbWdJBHNlUoxQOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyqaYCZ6Iu1/ZDWnjSi0UfDYw90ZbAGPl2DHzsu82f0=;
 b=AdldVP1k1HlVvkCosatS7wKWPWnR+2/EQP7L/A2vle4s5Mj6uenr9gGvHXOoQzUwbetf/2W9HYyLzUjgTXGjanSSa40AM4DjEAWfBy7uXWACAXs8+F67z1PSRoL6hKXYwQ/QS2/9A9pAVcPCloeYhENrilGPu9yFXKKmZfPXUQpYWXCBPuiMe0Zb/svyE6i7PlLRt7noFdnZa5GwRa09HHcS/jSNSNOOFO4WFTOmwjsxvHLeOQcQIYc12dBCBATuKqUpFxCRIv7WFVgoMzICqexByVn5EOeR790Vihf/O8Jmozrdby9lfuOyB+hAJN4/PnXoiXbP+0e6Ypui6hm3eA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyqaYCZ6Iu1/ZDWnjSi0UfDYw90ZbAGPl2DHzsu82f0=;
 b=jR/qa1mCK/yrRpI6MVmE6CtP+ZOgRvm/4VPL1ZtyybhaCwuiiLj/gO3fAGYtnBtGkXtfrbEYBCVioMaOdJ/XZ6vUR/NQwLRzwyI//ky4kdPvr1SiUO6eB+ed19M9p+xVr9VRSKu77PYFdYAoTx22ukw8tVYh0WTtrCznhRMx0sE=
Received: from CWXP123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::33)
 by DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 16:33:45 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:73:cafe::2f) by CWXP123CA0021.outlook.office365.com
 (2603:10a6:401:73::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 16:33:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 16:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNANQc2OoTCCU+9w7dj/0FUUj5PJtElk8YMY/8BawggL0fuFBtHaxpRYzmj58BEJjQesOGxy4A1YdBwczEolQtr2ESHeExBVIsZ0j2q+PlW0knwwmbuEhtO0wiNvf7hDvlQw3KeaxfAqHBJRN54jJ09JPCPcJuaj1M2K5KRJF+KLE6FFd/0b4v8gjOXaCQc0vd35fGEsbhTtgOlFjvEhIni4KYLCOpk+FXOsVcwtf5L6A8X1VVz3jt0+VukQkawQv/VxQU5KjmyKvMlJ/CtIbZzhNb4KaRByJhIrwxnEBr+H/Ylx0POorFud7FkvVUjLP9BbjEbT/iWAegRZEVGPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyqaYCZ6Iu1/ZDWnjSi0UfDYw90ZbAGPl2DHzsu82f0=;
 b=UxB0yHa1sQH6NZMu+4RvZmJK2d3U20m17NsxCLLggt+TzY4RHQon1nK5iwPvjM1mFDQnlnCoXRMDcdvWtyI9iXXYapJ5urEM+A48M90UcwoRkexhpdgguRMufPRF8t0bwF8RwKwUgQm+7vZh0sktVRDpxlHA7J/saK5rR6S20EhQBiP+hjHXV1hrk3UEMiAggGHi0yQciAJerJXsWVCdxDtHRccHCJvP5++xYGZ/LKtJzNz/KbvMm9HPgTe0NaTyQPnzA3M/m3gvxwEgy3yqe/dq5lgcz9KQbGRX6MlT1y75yLN8/r7lWLbbwOyKVlZwIhBWvw5rCLfXSdtr/wVFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyqaYCZ6Iu1/ZDWnjSi0UfDYw90ZbAGPl2DHzsu82f0=;
 b=jR/qa1mCK/yrRpI6MVmE6CtP+ZOgRvm/4VPL1ZtyybhaCwuiiLj/gO3fAGYtnBtGkXtfrbEYBCVioMaOdJ/XZ6vUR/NQwLRzwyI//ky4kdPvr1SiUO6eB+ed19M9p+xVr9VRSKu77PYFdYAoTx22ukw8tVYh0WTtrCznhRMx0sE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB7776.eurprd08.prod.outlook.com (2603:10a6:150:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:32:42 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 16:32:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Topic: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Index: AQHc46bnpDeMaUADskCpkasHyeafyrYNtmIAgAAA1YA=
Date: Thu, 14 May 2026 16:32:42 +0000
Message-ID: <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com>
References: <20260514133748.219486-1-ross.burton@arm.com>
 <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB7776:EE_|AM3PEPF0000A790:EE_|DU4PR08MB11149:EE_
X-MS-Office365-Filtering-Correlation-Id: 47accdf8-3800-4b66-508e-08deb1d69160
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|38070700021|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 7f9aAlo2XmlzKWnNFAxMV0eDyyxyapA3vD0dXvsA99zzsIS6hJD2miS7TMqQ23ihJVLnBS/bwIcb6AMy3RcTFMHTa0UbPtQj5MYhpcxtEXEuV544yoOzckR1+EtncfEdybloHvpBeRDbLZ4zj5b4mr9RRNABExn89NdrscYXpfXJaoX1PdISmAKszuI+tEDzun6CXmnzsfqgxIYTZPHWBQSCoGQ/FBjpA1N6BXUJMFUQXUostX3zuB0CXkvbhr41/egZ+u3xDgYDXzE3ZjsiconqO7ONfI2k/xQ40A1vvk35E+yhhJN012RmyDEeecKsQqSAZKF+5eZ5zsBWltI0KBNjA9GWSg3bz/o55tkD2PTQaY2/y0YgV6hjwiBFeVcw6Z2PZ26W2NVHfaq0HHJw4uejDmkIPyxTQ0Jlbl3PPvS0zBuMxp3bfqCWWrbhCojKu09Yg63GbhlANiKBvc/1ck7SIsYn98xwsdx+ENEmLtkBTwk8XYoNQVCu7phuPnP9KPnmCVSbKQtlCriifZyt1mPPwuiSnrNnd/d4nJ7sBmCnT5urYA8JsA6XHR0QFVD+CPA5s6Z9gAifoHrbAGqqexvAaPfT7RBJm9y/j5t36W0iRJ8Ku6Q9/QN6pSYhN5tjZUBLJX1x5tO/T8je/1SywNKaSrRNjPm9/00HP2XoIeAUZEbQBnGEseBhxcp6O3FoUr6pToU7XQSX9KNMdyDauuEfvmR13K/ACOIapWtfaamaOYBOUvGEmsODjlQcr6Hr
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <863EE33F736B1945BFDC7DEE042606AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 KGmSQMEG2TtkPT+GWCoJ40cpJD75s8Ug863XgNHWHnKe4mpsUorj5A0XQiaNM5RXPq18jrjcGP5aJUBPeRVKwW/Ce/P9lxHB/TnGM3fSSXQ467Y8W4SYjS3hPPIUI5ifQBvpJZlo7/5SW+Z3XWqfnAflfDbJ3N29/EqGHvrOEOCVJ3yf0LtV4Y/Qjq2E0Mz7BHcVAb4U6RdWSatp5qCYICi6g+KMp+9W/uTAJFQ8tdqgfXLJt8w4p9/KhdUJgxip+gNPGPEVdu5gS75RN3A69j/hbhMyRYfJu0OiHrpNMADjtRFjxq2oYDIaM3MEyvmpC80lNOM2Sv0xRaTlByaL+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7776
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c7196e06-da17-4b86-89b2-08deb1d66bc3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|36860700016|376014|11063799003|56012099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5URkq/ZgUnwW3WG66dXHJWrktPSFMqfFxcmwkmb5Ucybi5yk6r7x1NeLwZvNe3gPexBrx6phScXvGhSisihJYn7vqX+ljM5t90qoe7s6nNh4aNzLjonaI7lOh3gqzxHSKAtcjISWau2UZWmDa8HmL1iY4pC6PIBpC8ChtkJHEaG5y7h3gEEPYzE+i9mxm29FUw5eHejWa7Cjh3+iTKlY8hRnaNg+NY8PIHlIt+ligknoVMpjGBJfA/1D19ZLquozFxiu1xFAnpxtAqWSPeyQmxMPHxihRANdR91+kDzU1ei9PhY/7aGUr7jR+0g0TfzfbkbtIk488ZwgVmXSGGgLI+lzUKkcXhqnYNHTt+gjipkTYMiYYOtKCPlg/1674rI0blnR6Evalkp23UJnozZxavld+N6HNHGOCYa+277NNJR9MlLKgMk3L2uHCooKpMg5yiuqaYBFx4YpaoTzSBYKFmt1xETNYq1Vf6TbRqowQ54oLZw9csHBMq9Z9oecRUbSOZle49RX8KEVrw4UCSXQMjzenQsvpC92crZZxURbvKl3h9PZL4CuUo64abFbbpmlR5wyqw7BZfaWSWVg3rvC10WFK085ESUWhJ9sA02unHZp8V/88p7h2Jm/hJjGZ5nTaM9WlQny6pL+apdpyN3My/2SGMkKxzdaqAG4OJMg155z9P5c+EbS6rLJuZzxvCIWzRx0y6jVQhPf7MwCA6bVJpvp0NDh1IeewnoB/Gu90qE=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(36860700016)(376014)(11063799003)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sztt0ucy+hdNkgz152UdUPkCmZKtyr7kgdxGCn0bufO5RDe9z1B6qUuX3dosMryi3klxFMnC3vR6kw9rtEYkrNzXanPqo5A4POw0WFQhCD2pR9qYCwuTK7WEzZwsL7dssgtDzPjTXSTt2APeejOCYhww+cA0HsFsP7lN7ggwFNs2JRZVmDIRD/oX+4+s9GbS3che7K+S9hTGnTkBW0BZqhRQ+u0x1qORZ8KBXX4kRUTRjvRGnpsnaMBE1lkteoRuoVqa2FBFQyTtESs9J+KEG5rltgdsHHuUjVetisaBerypIZei1adm8ZpAsxEbOf8PqBZIg69EZ03GT6W82dg6vUPdhnX/Qg9ZrWZanQrWCkQguehWCD6dNt3rlyAtVtK/RBUutdvpjHa4p2tES8XgA+5sbWXa/ZbKqDKJWg1uSvPe733pXeMCl9vaqAuTyqaV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:33:45.2913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47accdf8-3800-4b66-508e-08deb1d69160
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 16:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237045

T24gMTQgTWF5IDIwMjYsIGF0IDE3OjI5LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IEhvdyBjb25maWRlbnQgYXJlIHdlIHdpdGggdGhlIHJlbGVhc2UgaGFwcGVu
aW5nIG9uIHRpbWUgYmVmb3JlIHdlIHJlbGVhc2UgaW4gbmV4dCA1IG1vbnRocyB0aW1lIA0KDQpU
aGVyZeKAmXMgYSBsb3Qgb2YgZGlzdHJvcyBsZWFuaW5nIG9uIHRoaXMgdG8gaGFwcGVuIGJ1dCBp
bmRlZWQgaXTigJlzIGEgbG9uZyB0aW1lIGNvbWluZ+KApg0KDQpSb3Nz

