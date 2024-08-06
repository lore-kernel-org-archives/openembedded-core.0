Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99147C3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:44:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web11.7609.1722951831056771161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RS6gnMFg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RS6gnMFg;
 spf=pass (domain: arm.com, ip: 40.107.22.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HqDiSnJOF/VIwEhcYB2RVeqp4VCVqy5FzaXFWuA1vUlCQDETEQKVqHeLwPyVkjwF9pyGrXKT7hAs7UqCn9VJPvFODh4RVvAmAcqvfeqPtkAASbmEF6XdHCnhckZX7jeeZWjv0R/KPgDRp2rYgzhwlO9ue+rccNp35aVLnTtR3HrX57vwDKX72vaDM6QO/97evbA0ikXl2Wz+SC5t4YORs6U42i1MD2ZVc3YtJ3cbOowSS8YgP5wtl8PCjWo+n4SnGH9ref/98pxzXO2HGsTjJt8FsGsqrpWQbY0b9hOynBVcfmZZzi4aKHfE52//R0zbaJX6Iv+4oIX1yEem6iLe4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpr6oDpG/lUVzgNr3PTRcXsGOjlnXOa5pu4eKWNrKj4=;
 b=VFPFZ67susaVg7wrPU86jGeEJjO7TER/XO/ogAUD0fCzt/JFjvKZeQsjw1uxAmaNTz8SBZ8roMuGGwK3422Oa7RdK1e6ewrUFYL14S6GjI69B0eXk4HDd4El0xiiwwrUcO92HaCK5ATkCDbJhJl2gBz5kmll/BOK5R3aojJ2FbrDx1SKbd5gcHucbknzjY+CxpUeJZVIJBASTAwaJSS38d2DXVJe/7SJKD0x3VfCTUnamiAASXgH5x5SyX1tXj92ajJbUsSUzhXsmGa/TLBrZne05z8WL5sqw9pN0nHMWLxOKrknkpw84UJjAcsTNKFp5Df1krvqq2f/TcI8W9BQUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xpr6oDpG/lUVzgNr3PTRcXsGOjlnXOa5pu4eKWNrKj4=;
 b=RS6gnMFgKy1zCzpzXwild07K90hZRiBxrBOO1l2oAlW0lBJV9H8HME+M9FJnQzdYI4arntOaiGK42D6qX+dZj1FHh1lsN7NrlKvaOSlBeb57367v+D6i5KjIAc3NKSEck8jZliJYIP7OlzGVwmfxk0prOFDqEzo24M36eYXOwBU=
Received: from AM0PR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::48) by AS4PR08MB8141.eurprd08.prod.outlook.com
 (2603:10a6:20b:58c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 13:43:46 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::78) by AM0PR01CA0179.outlook.office365.com
 (2603:10a6:208:aa::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 6 Aug 2024 13:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Tue, 6 Aug 2024 13:43:44 +0000
Received: ("Tessian outbound 6ceac6be275b:v365"); Tue, 06 Aug 2024 13:43:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 191554d8b1f7b01a
X-CR-MTA-TID: 64aa7808
Received: from L11e054ab3030.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4B7D4DA-5A1F-468B-A2F4-166B2C22CEC4.1;
	Tue, 06 Aug 2024 13:43:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L11e054ab3030.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Aug 2024 13:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbcrJrHMMhRab370H6cpDgvf7WySRx0fDpilHjp7cbd3PVxXalrnGprq/E+83cnIBhmU3D591oujvoQwQPe7IgXJ5sLYwzllsFrTzbZZZmwt7KMim5khM2seDOPz5p/e/lVF+ett3uIzIeNfFXi4i7xY+NvMMvq9kQHxjGiefw4RRZBvgwjUz7QPcaJsFevcX5y6Dqi7hJ4AmnoF5N/ej6Onbt/uaX0x8PwdFzzm1ZwpczwplUU3ib2tfJ6qR7NSHhBrHX0sGlLUX970gAnWqtHUKA0CF7U5ka5ycKjEKatvmQHz89vDoNeRUrDSzlQH7V+wP3YVaTSGpoR3G7V1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpr6oDpG/lUVzgNr3PTRcXsGOjlnXOa5pu4eKWNrKj4=;
 b=nvLKtCv6kVza1vk6ug+sUjy/mrwaodnIR3pmY1S6LqClqHDGHxLtEz1dDqfI7MJAPhIbp5EafMw/HcPGgI6SZ4SCv0IBuRJhTEZYJc3t5+5vhPjnB+hPf5k7ZkXQ4NeQ/BIThaGeks31jSRunKeZmjh6+c2d4HbNJY9+D/RbXnd0hl4nn9/iW6ORQvM5k2N6czBdlwewhtZnyk5cu6G3pk/0AMsrkRreRhXvwfnGFt/TQurnOmInl2D+GtwHThrRLK2tfO8NoGupTvKnXe9tFqe99rMBE+8T9DwaSZh99lrnAufP1Z+KxHAu43KNexOzk7V8kVzxn41NCCWkgHQtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xpr6oDpG/lUVzgNr3PTRcXsGOjlnXOa5pu4eKWNrKj4=;
 b=RS6gnMFgKy1zCzpzXwild07K90hZRiBxrBOO1l2oAlW0lBJV9H8HME+M9FJnQzdYI4arntOaiGK42D6qX+dZj1FHh1lsN7NrlKvaOSlBeb57367v+D6i5KjIAc3NKSEck8jZliJYIP7OlzGVwmfxk0prOFDqEzo24M36eYXOwBU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9841.eurprd08.prod.outlook.com (2603:10a6:102:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 13:43:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:43:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Konrad Weihmann <kweihmann@outlook.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes/flit-core: fix dependency loop
Thread-Topic: [OE-core] [PATCH] classes/flit-core: fix dependency loop
Thread-Index: AQHa1rFtiLymMqFzIEezvnhx9evJfbH5I8IAgAAL/QCAITAVAA==
Date: Tue, 6 Aug 2024 13:43:34 +0000
Message-ID: <8384D8CB-F2A5-4E0A-8EC5-0E66AD8710A9@arm.com>
References: 
 <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
 <3D92F9FB-177D-4E13-B21E-2CC9BF2BEC9A@arm.com>
 <DU0PR07MB91168F2965C2D50B5AEE9E72A8A22@DU0PR07MB9116.eurprd07.prod.outlook.com>
In-Reply-To: 
 <DU0PR07MB91168F2965C2D50B5AEE9E72A8A22@DU0PR07MB9116.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9841:EE_|AMS0EPF0000019D:EE_|AS4PR08MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 13591993-ed7e-471e-98e2-08dcb61dca92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SmFyU2lqVm9TVWE5ZkpFTG94cnlzSnV4bm9NMkp4RGtkaUpaM1ZFRHd1TFdI?=
 =?utf-8?B?d0xMcU1aalhLQUZLdk1TQzVlbFV3Q09FcUJHM29qS0FlNlJxaFdxbmJ0aVAy?=
 =?utf-8?B?cWpYVTRoY3VDSjFwdzJHZGhBejl4QVdHMitTQVFadnJoQTJpQlJlSG9VY3dp?=
 =?utf-8?B?V0x2ZVEvWm9ET05iSFgzUmoySDkxQlZzRnNCeC9lMVNsYVhvVk1uQmJ2WkV6?=
 =?utf-8?B?VGNNUzlUZkNKbFl2QnVUTjVXTWZOcHJ5YTlsTWdaMXlrcTJqOXNXd0NHRDBz?=
 =?utf-8?B?am5KdVp1MXVYd2VzS05tQzRZZ3EyYWJCM1AwQlVUby92UGVuTy83OEt4RXIr?=
 =?utf-8?B?dTN2dmtRYUo0YVBuS2lMWFdZcHJBZURJRjhDbElGKzdEb1BDSGdXWWkvS2Nh?=
 =?utf-8?B?bTNxR0pFWUNXQXM0UmFTR1VJT1hoYjhGK2ZOTnlDUEFrQUJiM0gzNkViaXMw?=
 =?utf-8?B?TFhMYUsrVTBwa2FkMjlnU2hESnRLM25EaWNrVlJOcXl5UFBsMlc0NmJDWEIw?=
 =?utf-8?B?NEt4TlJVTkVuRU84K3lxQi9WOVlpQTBlLzkyMjJHVmhuZHRtN1pmRDY1Ui81?=
 =?utf-8?B?Z0UxRS8rVTZ3Y29zY2pBVUVtbCtLRHRkSmhjcDl0WWJ1MWx4K2dxQjdXL2Rj?=
 =?utf-8?B?UTI1TjNlMjlYNm9CdzF5MFpRWEd5c0NrLzNETEpCUnV2UnFqM3FxZU9seDlO?=
 =?utf-8?B?OGRaZVhJQ0FWc1c5NnZRS1hpSG5TcjFKbVoyQTd3Tk5nS0JzVVNSM093Q0Q2?=
 =?utf-8?B?eHQ0L09YRHdPbDFNamZDckYxYmdkcVk3TVljNXh0T21MbWhUZVlobzEyUVNp?=
 =?utf-8?B?M1hIL0YzM0xPb0kybHZaNE5PRDgza0t3WmVlUWRvc1JuWk81V1RLTHYvb1hk?=
 =?utf-8?B?RG1tZDArbkFuKzJaWVovNzFYS2Njc3JKcWtHb1dYb1l6aGRzZ2ZUS1l0RXB3?=
 =?utf-8?B?cjUvRjM4SnNZYUNSR2dwRUg1L09JeGV3dDBQZk8yclV2ajMydUZQcS95Mk5N?=
 =?utf-8?B?N2d0NEt5YXFkTnZTR1JLUjhiVVNkRVMwZzY2ZmN5eEJYeFVIekNkNDZUUW5P?=
 =?utf-8?B?TWpBSXJOL2FzdG10NGtWV0JQNy9icy83bW95aUpYOHZvRmw0U3RzYkhzcmp6?=
 =?utf-8?B?NkFDaFZFRmhjZ3V0cmZNbXlvWVBHRlZPRjd0TDdhcklYbW1jVjF5WjZGOUV5?=
 =?utf-8?B?bENIcGd6eXV5a1N6UmZtbzgvT0ZLblRRcEJ1ZUdDNDZRRlFjSDFWdm1hekxa?=
 =?utf-8?B?WE4xZUNDYlNuTUVGTWxXazFhSHhuc2cxM3g5M1ZCZUY1R0pOYm5zeVRNYUxD?=
 =?utf-8?B?b0daRlB4dC95NUtxLy9Pd05NVk9OTGY5SzNPR2xUUE5VczNvTGhXdDlMYjBN?=
 =?utf-8?B?YkVjNjA4RWwvcU1aREo1dm9ENmRzbkM0dmVuNDI4cUhKNXpOTHV1a1ZYSUlV?=
 =?utf-8?B?cFZCTTJHd1lzSE1EWmp3dm9kSUs5QW50UUJWaDFKMmNFdzl5c283UTJUWk51?=
 =?utf-8?B?azhKeDJzUEtyYXJjZGU5ZStlYTJsT1liRW5idVFBRVhkb3l1ek4zdzU0N1hI?=
 =?utf-8?B?V0VlN3h1K0tpaGVYMDFWaHBsQzczUHJCclphQjl2Z09KMEw4Wk1VekhDSU1T?=
 =?utf-8?B?eXZjN3JlM0VxczdaZU9CWDZYMXFvYlpyZnM5VWR1QUxVWlF6OTdqMEIzY0dL?=
 =?utf-8?B?ZndZZVFzZ0lrQUpXL0xVb0Fwend0NEgwa3VtSkVoZmxLaUhqT1JWTG9VdUJp?=
 =?utf-8?B?MTE4d0xRT2plMVVUclhwSTRCZmpNY1M5dzJmOXRyUUtTTDR2ZGhlaFdyN1V1?=
 =?utf-8?B?b3lSNGtWVUx6cVVoUmF6QkNueXR3SmxXY0tlRmZ5VEwwUFhYL29yV1laUDNh?=
 =?utf-8?B?dFQzalhRcm1mWEtNakk2eXhhSHBVbEZTUUJDZ1VSSjZxbXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FB83F77D84BD341BC05123560F37F2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9841
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2e79e3e0-762c-44d4-59dc-08dcb61dc490
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmxybEpBNjJtYStZYyszdW1Yc2NyeGJpSFZ2N0N6TGo3eC95V284QkRURU04?=
 =?utf-8?B?Q21IcU9wSlhURGZMeDg5SkJLb1dzZU5rNjhTMWRwaUJnNjlMR0hqZ0xYK1k0?=
 =?utf-8?B?Lzl4dTRSb3ViUmh0cm12YVlkSGpnQVIzZ2NCaU15a3JkMnlIRDJGZllmd083?=
 =?utf-8?B?L2lrMmVHR1RZWW90cHlIS1NGK2JtVlpURnV2TUV0QlNwSGlDYTlWODJhTXNG?=
 =?utf-8?B?Tno5b3Z2Y2txeGxPcnIzNWZVZ2IzYUtZL29vMWlDa1o2TzFicXFWQWhUZVV6?=
 =?utf-8?B?TkExZHNUSEJiaXkxMms1Y21VTm04MWtkSzRPTnpwNjRFcExvdG9KVVErd1kv?=
 =?utf-8?B?MDR1SGtKSERqMmx0NGZxLzA2UTVXTjIxU1h4T20yV0pPTm5jUXl4MjlucjJq?=
 =?utf-8?B?OC9xWjlnK25xVVBjNEkzZFhOL0pJUC9URHluZmY4M2xnUHA2a2lmZ0Jselpq?=
 =?utf-8?B?R0dqQjF2a3VtOFp6MXNZQTB2SVMrYTg0cDBaeFNRRzFoTjNVMGNFTFFRRHQ0?=
 =?utf-8?B?MUxXbnFjZ3pNa2xCNURaTVowZThQNGJoQTcwSS9QRVpEQlZXMjJ6TTZMUWRU?=
 =?utf-8?B?K3V2NGlqRHFpaGpTNjBuT2laL2tTWTZXTlllS3hYdU5UcWJCVnBGQno0dU5J?=
 =?utf-8?B?bFhQUkJYUFQ5Rm45TUhNenJYZFFHSDVxN3BZMnJzditjWWhUVzJOdm9uczJj?=
 =?utf-8?B?enFqWkFheDF3ZFNpTm5NUXd1NGtTamh5d2pLdm9SeVhHTGtpOE01Y1dmcHJw?=
 =?utf-8?B?YWNKTjN4T3lRSTN5WS9QS0tqNWZvK1ZUWVhLZlRiU1QxWTJ3bEowMWZDSzNX?=
 =?utf-8?B?alF1WWJtUThFREh5YWgyT3NlVTJhKzhDaC94Tk4xUkFhd1lwRW5rUldyeFFK?=
 =?utf-8?B?clM4dkFDc1ZIbGFBa0lLMHhVUmV1eTVJY1VHNTU2Unc3c2NtZkF1UmtlejFW?=
 =?utf-8?B?UW5QcVRzK1BnQk1TSlZ4TXIwa2RCZlk4ZEpNV3liS2Z6a1pNUXBuUkZSZUxJ?=
 =?utf-8?B?ZTNHdVZpWldSV0c3NnRMaWlxVmVBQzRVL285S0dONmF4Ykx2ZlZtSTdIZU9G?=
 =?utf-8?B?My9ub05ha3gxVWlFUE1aZXBRQkZiTTcwVWRUQVlMV25NWTI3M29lTGxmNlN6?=
 =?utf-8?B?bEpLVXV3K2R3SFZpTm81QnBtVER1UTdleXlWMlBzamYwWEU2dEdJVzdTbm5E?=
 =?utf-8?B?ZVl3LzFpejZPOXZGbHErenRzaHRnU1crdHdvSThuRll6Wlg4QnM2NFhSOUph?=
 =?utf-8?B?NWFtdnhOQlZWOTBYYi9jR2MzdjZjcUU3ZHo5SHowZ2Zaek9sMmJ0OElFUldm?=
 =?utf-8?B?b01vS0YyU3cvVmpNMFhvTDBmSG1VMXBBeDByU1hjMGxXS2pLellEVzZ1c3B4?=
 =?utf-8?B?TXJ1ejlLbmtBQVBqVm14bGhpRUlESnUyTHo4cHI3ZXlOTkxUODJtNkpxak83?=
 =?utf-8?B?SEZGMmZ3bUFtM3R1SytrK3BCem9yK29YSWVKaWd4cFliQjhtYkhvSy80MVZz?=
 =?utf-8?B?TVlyOFA5UmhMTkFLdVovSDRZbS9PQ2RpbzFkZWpQS3BjVDFFSVpDOHpSc0w3?=
 =?utf-8?B?MzBiR2lJTkMyOFFUSmN4STdwWDJBVVQ0OUw4OFJ5eDVYcUlGU1F6cFAvdDhH?=
 =?utf-8?B?U2MyWEdjSUtUNmllRHI1aFhERXFWU2lXVTVtejRQaXFaeTIrZUhuWTVLNHN4?=
 =?utf-8?B?TklhL3M4NFU0ZHZZdUQ1SWZPUkdEOE0wVkFVRG44cTQxVUJ0VmVqT2Ivckx4?=
 =?utf-8?B?blJUWVMwQk41VEpURWxUOENzVXVpUzVodVJPMWpwUDB5byttL0YxcXpoRHpx?=
 =?utf-8?B?RE83eHkvUzFZNFJFTkFMd1B3VjRiN0QxN213TXZlTlh5MFFOTGJycFJ2S1Qx?=
 =?utf-8?B?SzZ5WENzVzR3OERjWjFNSmNRd3N4VDlIRDd1R0NzeFZkeTVJM21Gb0Fudktn?=
 =?utf-8?Q?k5qYvKTCf8lfl7e5ysQQpXP/K6N+syjT?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 13:43:44.8210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13591993-ed7e-471e-98e2-08dcb61dca92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203026

T24gMTYgSnVsIDIwMjQsIGF0IDExOjU0LCBLb25yYWQgV2VpaG1hbm4gPGt3ZWlobWFubkBvdXRs
b29rLmNvbT4gd3JvdGU6DQo+IEl0IGlzbid0IHRoYXQgb2J2aW91cywgZm9yIHRoZSBsb29wIHRv
IHNob3cgdXAgeW91IHdvdWxkIG5lZWQgYSBnbG9iYWwgY2xhc3MgdGhhdCBERVBFTkRTIG9uIGEg
bmF0aXZlIG9ubHkgcHl0aG9uLWZsaXQtY29yZSBidWlsdCByZWNpcGUuDQoNCkEgZ2xvYmFsIGNs
YXNzIGFkZGluZyB0byBERVBFTkRTIHNvdW5kcyBsaWtlIGEgYmFkIGlkZWHigKYgDQoNCj4gQW4g
YWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gZHJvcCB0aGUgcHl0aG9uMyBkZXBlbmRzLCBhcyBpdCBp
cyBzZXQgYnkgc2V0dXB0b29scy1iYXNlIGNsYXNzIGNvcnJlY3RseSBhbHJlYWR5DQoNClRoYXQg
c291bmRzIGxpa2UgYSBiZXR0ZXIgZml4LCBwbGVhc2Ugc2VudCBhIHYyLg0KDQpSb3Nz

