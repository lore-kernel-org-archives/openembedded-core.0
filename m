Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110ABC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:41:05 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17312.1786016461983822389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jHebhk8r;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jHebhk8r;
 spf=pass (domain: arm.com, ip: 52.101.70.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M6ODOvzWtXR8P81HJnbzhF/NuZrisIrc1wru2jSpmPUErTlDqqCeFwW9sTF63yOOoEt5UZWMASp4CX+SsAvBlFOmIvYfIUC9t8lqag+wN6pIt+N2vhtuYeIo7GBPb4+FQ7g9zY7s5XApG2eBZqvuiq+YA10PdzNz8viLkxO82GpyRPqm8sp2fET0KbgomHjOFdi30K6tBJDym2HRf2JXWJBflm9mpqOmJNclMDYweBRiL7Kqnwgeh2dAKc8gLUgQgHxWM4rfPE5NqxrKpaSZN8oMpDlYTgnGzGDibtHfDdpRB6fToTGEnCUBWuBZySDpeYsBsjXjLQzZbBkR0pr0mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9p1Jbvk8HcSujYnm1NmBIjVzPxiqSlLkm8uvQRo0CY=;
 b=bGKPSuOTNKk3yjlgiwWH4xHOlHQhG7oTVXCA8iMG9Od+33WvEh7FdOfJJ20ezZIQ14WnYgCi+Kd6k2TpaNJGGf2F8xChEaNVTDQ3su9UYLcBLINT4O8iGRe7R3Zr57/4YvfM/T4xolgxnlLqVxH3l+KkNvRJYbaeO4qJ9EQo5ApGkOcKIUuO3QeLl9oLEYlYokG4LAKFgCCkady85ZCZuh9nGTrY0pLN8i9UAdJ14Grgw76Oc/bQGGyaLKsx+LY8kyMXzLYk0LrAcNgUqWwDHZMWZdHSyJU4bAUUkXLTodqsoWbUhjkrg6nlMZLlKv3OqFEPQt0a5fv2wnT8Pcs5iA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9p1Jbvk8HcSujYnm1NmBIjVzPxiqSlLkm8uvQRo0CY=;
 b=jHebhk8rgrpb0Ez/H2ZKbytOEFjQ5x4GLGsDEiPYyfixRHF/UDuWPdw754VbQub4/Dbv1/oOZvX9jnhDdUYJ+nIDmw4QlAxFoRACf7FmnwCFpR98JHp++2rsLrDLa+KxKGwtM9AQkZ8TAbbeFvfuIxZa+lFYvvxe26jaq/h67zg=
Received: from AS9PR05CA0142.eurprd05.prod.outlook.com (2603:10a6:20b:497::20)
 by DB3PR08MB9112.eurprd08.prod.outlook.com (2603:10a6:10:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:40:55 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:497:cafe::7e) by AS9PR05CA0142.outlook.office365.com
 (2603:10a6:20b:497::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 11:40:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 11:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZsjqI2modpSyPZXFyGGhnWYHgs2xwF5sBr4zDFKCMMzh6U8LG5Kdnt2GRWSSXqEI3+4fN4SlGHtqeAPllVuA+zm6Pp6Xlp9JIvBceZJi+GwFajd/KEwEPI28KPnotm+EUnOnp9AOThpbRcBsrmxsyXDq5VJoHtTbScTkUCSaJx9OzP62gAW7LpruxeH42OENuLZWe+9vGFk7IXu3mVstLW5fD6XLonAb6zufSnd74lvrrLlA+TYPw0evIu4D9WYkLcnXtBvlQ8N/UrHXp9cb107EFR66t2BidWRrpk5y45crwd0t+eYJ7Me7oZeoSpivDm44/nUhNBHDkN3+7dlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9p1Jbvk8HcSujYnm1NmBIjVzPxiqSlLkm8uvQRo0CY=;
 b=kHKk+oNj4haZrJerp7ede2yl6t2RquaqEm5KMrMQU9W2PvDjXSAKmJnwzmQ1dVWFNDMZnlp2R37Umxwky314yKY1xK3wBKLXG+0UeD+xXL93Xzsgs3TOt888PNJXSlElSZuRNN0JL0D650yfsPbv6mwX2dUrFp0l8TBE38FAxB3o+K4MlK7hppvvvoWCUsJVp/U2XR0Qg2LYIsUbq63bqWGNQxsc3e4o+IICcEvhZWGm5XmXuWA1EaP7++Doh9Ej3TQQn7dgYNo1I7w4j8z59WEm+WQc1LN3QjN52+c3ftyqXeXAOjUvKhfSSTd9q5ZLmjsBCVUe0CITYlDjDpb8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9p1Jbvk8HcSujYnm1NmBIjVzPxiqSlLkm8uvQRo0CY=;
 b=jHebhk8rgrpb0Ez/H2ZKbytOEFjQ5x4GLGsDEiPYyfixRHF/UDuWPdw754VbQub4/Dbv1/oOZvX9jnhDdUYJ+nIDmw4QlAxFoRACf7FmnwCFpR98JHp++2rsLrDLa+KxKGwtM9AQkZ8TAbbeFvfuIxZa+lFYvvxe26jaq/h67zg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB7677.eurprd08.prod.outlook.com (2603:10a6:150:3f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 11:40:13 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:40:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH 3/3] oeqa/selftest/clang: Add oe-selftests for
 Clang/LLVM/LLD test suites
Thread-Topic: [OE-core] [PATCH 3/3] oeqa/selftest/clang: Add oe-selftests for
 Clang/LLVM/LLD test suites
Thread-Index: AQHdIv8pIH+AgidYkUWqYntbj9DITraQ6qWA
Date: Thu, 6 Aug 2026 11:40:13 +0000
Message-ID: <04519601-5714-4D12-99A1-2BF15C49B652@arm.com>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
 <20260803041741.790019-4-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260803041741.790019-4-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB7677:EE_|AMS0EPF000001AD:EE_|DB3PR08MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fca300c-ca69-48f1-184d-08def3af9361
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|11063799006|38070700021|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 yuU/FCWXfo0cy0cDldSx3s2spNKAd05Z6vunEyuA056Qw19DuAOg6qOsiwzXJHok8daRlPnKKoGtQ8KZlPZNr+leQZ+9wlOGFMUAS3Y1u9B2vS5WbTutchNuMWEefHDahDDk9k6XXZspzYVyobdHXcMXrzVQ4ehMGoWxBwDbDfx0B6Mk9rIVNTZ6yt4Qpv6UOEan3cpdGsDECbtuLAdN/eJMHUeF3fQcPQRI74DxWGrbUyGc80tBXtbaj5A6D8xc0S/rwYz3tzEI0l2X/tKG3blaFc4zGQJzsVB5IKRy5DNfdlAGjGs/LVyNbmGUhBvKk0gALmOHafomheSGWr4brXL4IMLMSqzJF1aDQtReUgNfTDEbxoRRweEPjZrhXeh9Szkef+JJEkainkux9goJMdGNsnJDDh0A928j16AfwL+BrxEdWFBOkRPBFLGMuTQs3O8w82IUrPVWrelUhh8PSjzC+8kTh8+tZrNKHFu6qdUSzmzWFGlpZACYPUJ3/eo02gSdJT9GD5lJNfHhIC8CKteUeGXo4MNkT5DuDNx9m+BPdY2w4pOXP2ycAquTZYvPbiC51OL+EotLgEjErOZuJEwQl3orlxomGxXx6vwFiBvCjMtIDGO084f6VuCTHDZdxS4klZ1fiflqkkLEoVoapqQXNGPeMpFNAHTL4V5+TOdSEQxABnHQV9Qibby4GQjm07sFpO/2z1MNwCgNO9a2UVWelcxUY15vepTbdHAw7ew=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(11063799006)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <650752381DD22C4F92690BABEB5D489C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Qa+Hlezh5mZXYfAs1VZt0kFd7yD+qTbjHU35hhYL/VG+MiMsJyVGbwRE7BGIwTm6VaPjqwRndy6/VcwKRetmUZWRkUafTWUD+ap41ikMr+uKQ4n8GrNpMcfrYdXp8c/cKVDd18U11kzuGZtPN6z2q9DJAMKEz0FnRAYQSBQEz+9OP1pW2NHY6317rFLUJrn2EUs8sXTpmmPXsqJHvtA3VRArgx7WambOynGBpRM+oG/gYTlgpC8a4aoxGBzB9r5/an1I5pDZ8r+GJrftRdJZBJM4c3qLRtT9cILP9HA6yZ53g6AaeD3C9OhoDqxcJ+9r9yAMGQdfD7cR1BKYMUmt6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7677
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f28b744d-c35e-485c-2ef3-08def3af7a83
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700016|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	xx+2/nZMzw+kYMio4+Dzisncz/hQ4Z0nM/lGnjmH2CehyVMtGYl921d1Z4YmyZdbdE7szzldBU5+3B0XoGqHibaHLLgiUuSfyFqN0J9Ss0T/xXhYL/pDoF9aVT86q4liIBhH3JxMDBknp2Bpekn/Op0neOzsn75m5qJd3c06ejqIxqtWVO4/3kNHVdgIOfrMnpZBTZSmbK6GYyXMGaPPOx0CPV+3OWy7kJvAjVAbN7BNFT+serAkrtBt3iC1vorUrGS7hyi8z/wYL91r/Fd0YuTTw7gLBe4SvXkjUu1lWIP2pU2bE/aGuL+ApSSfNhTQxbM9BJo17ZZ91RTN7EFCCMDPH/BUuFmW3K2iZ1GCGe3yLLLu4BQfPyULJ1ilZPk8ZagOjoL/yeXdp9UFBA85EEeHbF78oXMtJuIn6fjcyPcu0X20Unvw2XkDPVmtkmUnO+S76PncKliYZGwU8PLRWc5ZwvRi0zSEKnpHz+Z8UnP0BBIJe6A+WZj9F/A8v+P3rDejgWFximgTTkN0JAAmnMtb+dIEsUugorkUNxtC7d6igMuGXkGrNQFRi6fIExkjUwrH23WXZNZYoLDjxe5eENhLha9ZLXlsW9sdX7KtPdctpdgUyDLGyni9ZY6xJnYVFVSQNT9MN8SA4rB1CHQRJlN/uLZVGhaA4u99M9QVZA+ehPcSKTcmRNVuaFExmUmPb2mV4/T/hEkCiDgww7WdDA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uxuCffFar8+iDVHfNkTsGNKbCXm9PmmXjJxjGvXarpCXXK5Vp5oBIN8lITp+R/BZMDoa2LACpzjo51ql2WjHt8mDnggCKotziVYcS6Ojeb2N2TSCOSrDRPIGJ22QmWta+J/PTuSsVgUvboMDcOsnJHmKB3FyP7ZjfaI5S1Pvglz2vJYL9G/rikwXuHNnGeBAjJfTjl/cKQ7r396R+qbTtosrtP3Irita69G6SFroDLm4UL1kCWJpcHAg+Q16FdlZRk+lGJD5PyMX8PrtRCPL8C4Mc3rfq7TmjI1cVHLHhzvD7KEIlLHOXKZS0rZlXGzV/+2k6Ax//+NixHyJTqlEuNk+QuNgZgsPrp5BjG6ar6OCYANd5GF+r9Zjjemmr68ZEthIYhIQEOhhq/tNP02fJloMSRerCHNlzZwQbxX7RBOtfUQ0E7LoCqrxRcqIZmlL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:40:54.9555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fca300c-ca69-48f1-184d-08def3af9361
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242934

T24gMyBBdWcgMjAyNiwgYXQgMDU6MTcsIFZhcmF0aGFyYWphbiwgRGVlcGVzaCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8ZGVlcGVzaC52YXJhdGhhcmFqYW49d2luZHJpdmVyLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gIC0gRXhjbHVkZXMga25vd24tZmFpbGluZyB0
ZXN0cyBzcGVjaWZpYyB0byBlYWNoIGNvbXBvbmVudA0KDQpJIHNwb2tlIHRvIG91ciBMTFZNIHRl
YW0gYW5kIHRoZXkgY29uZmlybWVkIHRoYXQgdGhlIGV4cGVjdGF0aW9uIGlzIHRoYXQgdGhlIExM
Vk0gdGVzdCBzdWl0ZSBwYXNzZXMgcmVsaWFibHkuICBUaGV5IGhhdmUgYnVpbGJvdHMgdGhhdCBy
dW4gaXQgY29uc3RhbnRseSBhbmQgaXQgcGFzc2VzIGZ1bGx5Lg0KDQpTbyBfc29tZXRoaW5nXyBp
cyBoYXBwZW5pbmcgdG8gY2F1c2UgdGhlc2UgaW50ZXJtaXR0ZW50IGZhaWx1cmVzLiAgSSB0aGlu
ayB3ZSBzaG91bGQgaW52ZXN0aWdhdGUgYXMgYSBtYXR0ZXIgb2YgdXJnZW5jeSBzb21lIG9mIHRo
ZSBmYWlsdXJlcyB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIHByb2JsZW0gaXM6IG15IGNvbmNlcm4g
aXMgdGhhdCB0aGVyZeKAmXMgYSBmZXcgdW5kZXJseWluZyBwcm9ibGVtcyB0aGF0IGFyZSB1bnJl
bGF0ZWQgdG8gc3BlY2lmaWMgdGVzdHMgdGhhdCBpcyBjYXVzaW5nIHRoZSBmYWlsdXJlcywgYW5k
IHdl4oCZcmUganVzdCBleGNsdWRpbmcgdGVzdHMgcmFuZG9tbHkuDQoNClJvc3M=

