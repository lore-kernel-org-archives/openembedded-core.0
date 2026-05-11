Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB55CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 17:06:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55472.1778519159509973650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 10:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HRUGMA3n;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HRUGMA3n;
 spf=pass (domain: arm.com, ip: 52.101.72.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g0gR27fC1NwTGmMsT4pncf0R/nMHRyruJSGA2KDREPTn3wl5Cw102IccxCgFyaMYtoR4QJsG4La53rVu7SuGS5AD4YmZjdIht8fA+ai4DF0dBDrVCRL74xG2Sq9veHjedrk00fXLbH1atZHiYxnKO65DNJIQXYEA4h2c31k8oXMTPmil3or6Ath170MW876mR/aWL0xnTF+iu/Wg5nGk4KDumuzhTU0lr59RJqLhk4CKx/pIQH3GDP7gC56IpYCyOOv2n0qyLLXSA8/A8wifYQaHIp4dFizq8o3kt1TwFEkgiu+4FT8WVdTK8qyJIt11TiwErn3CwNkZPYg0B8Kk/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAtzhxIPa/D6NCzQ//8ti3kyvgfER4dgia2Ivp2kE/c=;
 b=jvaNpkaO/9gCDbRf8pDLA6T8S3CQvRYsVFO6yED6oE7x+osbF7J8Az3z5TOig5E41t27tgpmf7KdZjUddvdofOLLFdUqc82d74Q+6btx2xzqoDeFeSr8xCYoIuK4xQmZB2H1V7UNF9mIZc67HeE++ukGDt7i1ZMPEQI/kI62s0UiLgEPq7fODWEhI9JBSYWGxijssi25sxHfCm8Rsr35e0UgiS5Rx3cES6JshA0IFkFEGVQ9RXSnasI/54cf0jNMgQ6wnQPlU8RcPCQOU1xdEF4BO1mlkis6OljIQSn5Tt7PfayAajuEUBxwxrj2vuLR+bEiYW2U1fez/uN3Iam7Kg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAtzhxIPa/D6NCzQ//8ti3kyvgfER4dgia2Ivp2kE/c=;
 b=HRUGMA3nl1/30AHVCySihIZmxvI8J8j0akl/kAhVJ987SUFL5RGU7U+rM7nZtIvLQEHt8+2LZs0+v4mOxGnBoaIpZ56+RfMamxzCz48zhGyUkPoxSA3l9afeJ68ZUooSYbCLsZ2+iWcnB1gMnQnxvb9iV12k6KOq9wWUI5YNFNE=
Received: from CWLP265CA0422.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::22)
 by AS8PR08MB5957.eurprd08.prod.outlook.com (2603:10a6:20b:290::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 17:05:55 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::77) by CWLP265CA0422.outlook.office365.com
 (2603:10a6:400:1d7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 17:05:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 17:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux9F5gAVB6SGs04VKJY5Pbg8QLdkA7REEj/xr1f5G0f4DnwgJjVxEGfkGxN9jzyY/IfV8C0yFjsZ08wJKXwr6NYYa5E5BBfCfEfIgRgYBYh1NbvnHswX8EMT2D69sE6FzNUk69uxbLoHUP2rIJsGxGaxeFpGUVAOl1E5g2axBnQto2u9KUm0glHQTIUI+KqqHBnqDfzrYiBss6mzyqAauVfSWfjj5OF4vNlyuMLPUH9lbNQxdRi4kspnQ/fzTiYKRY49K8PgFo3EWAzstP5ed+wE4bgqhNFXmCSAZkoe47bWyQfLqDwJXJCOPzBALD6ZvkiDQcA1flopzmrs32fqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAtzhxIPa/D6NCzQ//8ti3kyvgfER4dgia2Ivp2kE/c=;
 b=GQAcbJi/w2KUOy1nVqMtIATslX8GTkF6rxbUlbhb8yz1HrUEWg3oEad4+ra5NkSOuQVuKq+sFb/CSzPG+5zUFBcJAC9QrwR7B+HlY36FbkIhc7V7yTl6JqU+1f+lwQrPFNiUP7ViL2ymk/a78L1xv/SoYosyScJFV+nUHjmHIf08cQGCtfwdjLScvZswDX41kGJJULhqtHCpGKA1YcQbMMSSfwAe4mWkyUtlKP75aq9d9PFG/HYqCyQXywfr7JfBbUlxn0JPZMGw4brnfq+UwDY43SAYtZ6QQUMEpzrfdOYSjrejwkZp3yOd5W7RrMUUuTEZzsdMY7abJKmbb0vorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAtzhxIPa/D6NCzQ//8ti3kyvgfER4dgia2Ivp2kE/c=;
 b=HRUGMA3nl1/30AHVCySihIZmxvI8J8j0akl/kAhVJ987SUFL5RGU7U+rM7nZtIvLQEHt8+2LZs0+v4mOxGnBoaIpZ56+RfMamxzCz48zhGyUkPoxSA3l9afeJ68ZUooSYbCLsZ2+iWcnB1gMnQnxvb9iV12k6KOq9wWUI5YNFNE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB7371.eurprd08.prod.outlook.com (2603:10a6:20b:447::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 17:04:51 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 17:04:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] vim-xxd: introduce new recipe for xxd
Thread-Topic: [OE-core] [PATCH 2/4] vim-xxd: introduce new recipe for xxd
Thread-Index: AQHc3zNlJoGF2LD/WkSqzy6zqciARbYJEhsA
Date: Mon, 11 May 2026 17:04:51 +0000
Message-ID: <BED2E5C8-3015-40DC-9609-EC5FF320A0C7@arm.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
 <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB7371:EE_|AMS0EPF000001A8:EE_|AS8PR08MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f6b6a7-7007-408b-34dd-08deaf7f902a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 HnetPkjPxSyOJ05k57O3lSsPto/z3c/saZruhlnpI2i8Pjf91RU956jiDOvyAnzdW8HlJFc4w1SJhDgmWnDjK5zcBjneFHbAyX0T422jAxPDarYoyAW+LqNkGgu9g4vmWJaa5k2xqMx/w8fFWGjyNGGSxGFQ9cpC38cYCH7360KBJVfnR4zAFqs1Bv/hJq0aH2Q97HltueUQFY6mmnn+QIVpQujxyHLLGm0ND5pYpkHZH+f/QIv0fH8T2gc2My3pjv6hIqv+KfXPLpnNvRSrYJBuDfDADoXi9X5aSs10510/kRrrnb9+9XMpiu/68lIbuRATXHie0zNHNz6Iftb+hKLKqP2VAQ5T/nKSBujUqYBLcTtqF/pv+1PCCO6/3T0nPPnXTsDF2nclnNWixRCzKYHVxJhewq97n+J34tRpycTC/l93JSbtklrx0T1iL/vBkkgR1GhjefemdMi4KKDbiB0jl2VD+wjjphFAUf6YyEXpViZVARjyXfnxXD8tRYApoLmEKQKtwDoyL/fASRJOS0Bv/nm3aV9L48jzQC6ioPWANTCZawCTIjiT6FYGxTVjN8cUBT8ZCL8MT0s9eCttg4iJQHbkCzy2sTJLPB06GlEvTSMOixaKdw9Fa+WjF5XzSQWWL0hlCdIPG9hVauuy4emNZN1MsO9ImShJbX3UcMcfiMLq9+gFcPLVikkJ+jri
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <69B96531FCD4584EA0D725C396AB2C8F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 n6elPQYNNvb2mqAWqlN/LimWljLsLXQ60cG2x7MLPlvmQhVEZYVzZb4VW6837s2cdYc+agTFTykzE5rs6IJjEj1a6pYl4m0xMgj9TQdUVaSqNyPdXoL1KRdlMBx+5VRDLuV13KtaW8bu9UKOGggGwOO78Eq4++2Aqi04+QuN8FBxoZhvBkN0ECJHzsATHUZIcoXiopUvgXBf5WayBbWZe1MgjJvjoH9trGZ7DDJgGcTIIkNtz0NTRfoSbmE6LmSokrXSeE/oyLpBqi3q1JSmvVxsdX9GE9Gg0LUmFWmq2QzC2es+WsrfJgy2CGER0MIvVD59aryK3kfPBJdOYeq0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7371
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ea7e9051-4358-408c-b49a-08deaf7f6a3e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|14060799003|35042699022|22082099003|56012099003|18002099003|13003099007|11063799003;
X-Microsoft-Antispam-Message-Info: 
	TCXp3NlFFRACF7HHKmoNETcq2cJhUNnP+PcjZsiBZTwNJlxfXnuqJq2uXZZyD7y908VPA7SS2A7VNWU0eEWgcDUFEC6+3LX/6OdRfQV/lrllc9s/D5u/6fuMD7w5D97lSCESzPE0jqblTAy+eBUXVYzzZul/VfaiLWwA9IXAi8m+NUc3tLc/P4RSobZhl2+YpSfUOLvVXs4/eKxiIpYQ+rCApqYnIcrN5XGjeWkACB6Bx3X4gOtK5qeHMBmdhabTcKM0ppPoDpxKKa9vl2Uuy19t9tMixODr/cgF3g4qP3X4XNPkkndOLWnxNx0yyltpQwHznKFFSb7zdLVwHj2queV466aWF55LBCkrgxiTtF4Zd2NfwBg9MsXu6yskd462pyyoLB69FDAqePF0QRb6ZgQSAiGkq38+phX28ZOnhKlB27haPrmBPx3gvQ0I00u0X1DIBhlzQ6AwZJSf7dhpd3Lwwr5uBprgepf5+75bpYw2aNfRl+aPPR+LM9/k9llHyalXL2Tn9XmRuuIs6VjVTeI/ei/jhbpjngbKqmxLXgnSd8s+Wk9pbJfaWZhHkkB4zrZ+x9n4/xW1PAeYSjwViiHJMJdwR5bt5SRt5QLT+tEOuW0neuXYYoS4CNLEtF8zRxbThnvXREoHvIYJ5kt6dBmPi1DoeTs8pZPFIL/uBM4FRGkuBXHmM8MuuUHoqK8d
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(14060799003)(35042699022)(22082099003)(56012099003)(18002099003)(13003099007)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kq5lWVeFd9QCybV0UwELBJLZ03n1ZBhzL3W5t2t8EobySYCYO+lR3WCsQubsKVOOWIjMJaGjyibK7axhv/wWaHwSSc2dyVJyjBgrKCyJT1vXrjkkUSiB5FpcWVvQQPshUXSzW3XbA7ycS/7hS7rLBLzQvFKN36Hi/n9tmRevvB5ZkerXRzzuIBoIeyuJ2UXmI4bezEsp1Nuxvvfe1awK7rFU4mpNsQLCjGO8Lv9HfHrTqaz69CqFgCl9y2MmoMsUtRsyRrDZuxjSpg33Or2WMmMzY7Kqmh5DKLv/8fjtkBeAEl3NTuS3KU7MR8A8qd5mkunFDAmlghV63M8c8Y7MRUv5LI3ixBI10sovY31iPH9aBPucZtzhY1+sK8CoWZ6cSwYseysST8muqKJgitw+7Vfg4UzT+Ad+KFtSop7myUyeKV6IpiR/YHiJrdHjwBul
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 17:05:54.7179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f6b6a7-7007-408b-34dd-08deaf7f902a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5957
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 17:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236822

T24gOCBNYXkgMjAyNiwgYXQgMjI6NDAsIEpvYW8gTWFyY29zIENvc3RhIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqb2FvbWFyY29zLmNvc3RhPWJvb3RsaW4uY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiArU1VNTUFSWSA9ICJIZXggZHVtcCBhbmQgcmV2ZXJzZSB1dGls
aXR5IGZyb20gdGhlIFZpbSBzb3VyY2UgdHJlZSINCj4gK0RFU0NSSVBUSU9OID0gInh4ZCBpcyBh
IHNtYWxsIHV0aWxpdHkgdXN1YWxseSBkaXN0cmlidXRlZCB3aXRoIFZpbSB0aGF0IGNyZWF0ZXMg
aGV4IGR1bXBzIGZyb20gYmluYXJ5IGRhdGEgYW5kIGNhbiBhbHNvIGNvbnZlcnQgaGV4IGR1bXBz
IGJhY2sgdG8gdGhlaXIgb3JpZ2luYWwgZm9ybS4iDQo+ICtTRUNUSU9OID0gImNvbnNvbGUvdXRp
bHMiDQo+ICtIT01FUEFHRSA9ICJodHRwczovL3d3dy52aW0ub3JnLyINCj4gK0JVR1RSQUNLRVIg
PSAiaHR0cHM6Ly9naXRodWIuY29tL3ZpbS92aW0vaXNzdWVz4oCdDQoNCklmIHdl4oCZcmUgYmVp
bmcgcGVkYW50aWMgaGVyZSwgdGhlIGxpY2Vuc2Ugb2YgeHhkLmMgaXMgYWN0dWFsbHkgIlgxMS1N
SVQgb3IgR1BMLTIuMOKAnSBub3QgdGhlIFZpbSBsaWNlbnNlLg0KDQpSb3Nz

