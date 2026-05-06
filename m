Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9560CD3439
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 17:01:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23904.1778086880873919163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 10:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IATh5JAb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IATh5JAb;
 spf=pass (domain: arm.com, ip: 52.101.69.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hNwvISVCsD6JPPVvUPV5OAS2mOYtiIopzOShunvWembIbiwFS4EVS6eMYmwPuNH081WQQd9ycDdRwVVv41svXkggMuQr2GlHvTUJl5VW4DE0BznVIKWuMUTKJYg7+x77eOQSYN8ENYciAtlJuSeum0mL+/+XTHHlybT/T6rPSkwxplOBtQu+EuePunWfJ8kTpwAgGMXBqPKYr/CZzdLn8IsM+dcn+puKHM7K59GpsCpc5LeT63L8z5dc0QomT76Llvhg6Q1kjc3d/TsSmNT7X0Pa5RmwUj0lWzc852QF4o0QKuRRvRG2JJ+84Jd/l+d3pFeoMr/546WzQo3ty9ZV7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUKgpaVuaRuc6OqCAATaWxstDt5vrQnyFWdcNUUmxHA=;
 b=nPngNN86JQqNnr+pPc6B17KG5f2ifFbuOUjkLb4FnGX/5SeI4UzIozdFemAH0kbJM7PrbF9xW/uDA21okhcYjy5XQm5XmYTBZXZzSCkZVSW2sfbWPtHlhR14zzGVUmsgzffdemp+iK5K+rKCezucdFwFG1ymbpxKqiinpAfqvbiNA73HxAVgQLO02L60I0rIq5ysORB3NfPjZhh24K8tPnuwDYgfO1zCSV2C0jvSs/4EHYNlqzy8TJIay6mxPEEneiV4dW34ZGXxeavmfOgVuxDrI/ZipVxs8qGjzBKeljfwbTHaN7J9QsYp9bMynRkaY20JVa+yAbiDEXRLQC1Kcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUKgpaVuaRuc6OqCAATaWxstDt5vrQnyFWdcNUUmxHA=;
 b=IATh5JAbJcDQm7FaJwnuK1M1BuaB4xowWboUiZ4FJ4xBLzIZl/HTa/tKJXyTUJTv2VpYQ2pricOKpSZZb2wfR+wvx3H2L3nw6S+QnlsbWKH4aI7joOEWQaAT89pVQyY/4RmLQ+1B3xAoYUCgEoQYiQRDWtwokNtSCX+GncK4xH4=
Received: from DUZPR01CA0218.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::21) by DB3PR08MB9085.eurprd08.prod.outlook.com
 (2603:10a6:10:43b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:01:13 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::b3) by DUZPR01CA0218.outlook.office365.com
 (2603:10a6:10:4b4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 17:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Wed, 6 May 2026 17:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsHlZLwtY+/2lj9za/fAPc1cvS5tQyKXcka2QsXF/AZTcQyK6sC1VQxse6et+RkdvonaOEWQPvhdfflBiPSi3pNHX0w2sCJ7DcKWuOCgIRaOE9/0ThbFTcvdgoQVam8jyeXo+Otj6V75AxUzUpFtLRtFJb9HXkM2pKTFSmFPvFLmh8z0+CHBZArL+SGRpPZRWHNkqw/dCumP/BxD53uOB4rWDLE4r7gopSTtChhMjiP59xJnKyOyHgyB/1uPhCk4avodu1pbNeWLzsiHzuUNVDbqHYQYD6dxFV63GI6Nnu6X9dtj1ouQSWOHC7wRMa5F8SfPm3463w0EehpYOW0jfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUKgpaVuaRuc6OqCAATaWxstDt5vrQnyFWdcNUUmxHA=;
 b=Jo+0K6juhg2XDopYKXBMY3D+LSSa0qBE2gSR7F8haiDvxEd2zgZq59n7aKwh3kgq/Zp+nrG+yNpg/OQEYY2KzcO37ufG7XrbqyeVmi01+H6s/lkdQyzuygmHiXnK/BWE4m4IecZaX62wm1iXBozFmF4QmGB9Vyc+ogUbeyJP3Qeflsi9W1T0BlIbrErZ2JuAhYxYmueQTz6IatxYXWQqo0ZSO83xeJYC9+hzAhVPQ8BJOqVliJ5DnqqU3NpMR3ZiIQKM3JzsdCMSITJmkQSxc4PS7rMx5ReO9js3YTt7uvur0T0YHCcHVpxLTQbW5YaeHl/Ltxm/FeGxRU+z1weDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUKgpaVuaRuc6OqCAATaWxstDt5vrQnyFWdcNUUmxHA=;
 b=IATh5JAbJcDQm7FaJwnuK1M1BuaB4xowWboUiZ4FJ4xBLzIZl/HTa/tKJXyTUJTv2VpYQ2pricOKpSZZb2wfR+wvx3H2L3nw6S+QnlsbWKH4aI7joOEWQaAT89pVQyY/4RmLQ+1B3xAoYUCgEoQYiQRDWtwokNtSCX+GncK4xH4=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB7361.eurprd08.prod.outlook.com (2603:10a6:150:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:00:05 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 17:00:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v6] go: add ptest support
Thread-Topic: [OE-core][PATCH v6] go: add ptest support
Thread-Index: AQHcy/ng8h4Sk/Q9Lk6JtXKN9g2nC7YBW5KA
Date: Wed, 6 May 2026 17:00:05 +0000
Message-ID: <95769D13-5780-4AD9-935E-036397DBED3E@arm.com>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260414103110.22263-1-pratik.farkase@est.tech>
In-Reply-To: <20260414103110.22263-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB7361:EE_|DU2PEPF0001E9C0:EE_|DB3PR08MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: afb16024-80f0-44e9-cbc5-08deab911479
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 VG/rF8BbzEO0bOD7oI1iDskUuN+5FBt4Crg4GTxPwFnhtTR6fym43bQy33XVy1jLLK0uKwDmps5SgMnXUfZoHFJ/i8PRnfuxVGS+Qp46YfzQ6X76mh1KUQGGqK49atI9X0//OPZ0EasFoFHvBXlxl+97v6yQuylwUH4BJaOQgPU9IMbSnLve6MszKPkTpI5ZsPWbdFT0zEZ36cyxjDpMPuFEkZqaHVKBFQALWCVzLjjTl2NpvhjRgCCmgpf2dKQOVC4XM9R49exVXxuow1vqdVb//ib0dUtsQCSrKfg3Lxol6okrfsOg9yE4Lv4k9GvfAuN1LbcswvI6HkvaevaNOY9zS+a2mGZllKg0nvDR7cSc92lLibkziMW0tbrZGvwws3JgxENuHA0eHNtBwkDfdZ8Y5SRfBRWiaBV1HNSdF0nRhc1H5mkqeozGHph9j/iUKWhZwnKkBb/+hT7zLQ4JYcA6z27uJdo5zDXFL8unBzIWVNpFUxacNOSjIjdyJ2lP53QJfb1L9HVCpxx8EZ59DmNKxvPN0xPEU+pyGHIXpb9IUaBG7ArmNQ6sYkLjlIq47gXe2znETQrqKOyB8X3uA7uk5BrgfvaA+gEHPH55cqQsxF/ne3zVCHAZf5RcxnvnGVO69A/u6WYjW4lEOrltbapxY/i/7+6kgqKZfA69UEJQkPLozQvYT9NP2zwsodHAF01jP/3+h1LrnQ29xZg9BB+EzH7QoiqPiyobZFxnCcy95K3lOBPYYaKmP3efn4Ki
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDB302D7297AC643A5BC052C57A31DE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 UepCn5Mo2bX7djdecsL8yEv2GPScjaYtXItcLZtIZV2nKxELpJv3E61yaV0VNeSgN73ww0/XSuG/Z3agHZWicxDatEL9MV9vVNVFSoKNmwSKekQBVhy3ykXJ7wBDnA/z8dmYkwFHkSHkiklQvbP023qHHrHZnLxtEzyTBYUS4jp3dLhEW3MigdCvKgaNBEOFdIfuTIOsQN2sd+aE1IRYPTArpJab/35gLMFFyYh54EmPntuzj9nNHLzU5NKbJ6Vz6Ezs8+HGR6AulUmTaf4KtDrr+pBflkjts6EF/0PjgyAS2B1Nm5fEvpuatJfQ6TzdxfQszJZ31/BCRM39hWg/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7361
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f090db47-a87b-4872-0ec9-08deab90ec12
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ViHAIF922t1vWf4MTu/yLrx9ROcOoJepzRibDEIQbWz+WKn73ngETbhv6vsrsAVYZQaF+wXERFxv3hC1Mbj1/1zO6WscllKEroXgGmFrO/iHvyyuInp2y6hZn4HXajivMPPRjEEVtpQc6sU3cOYjYiyU9j0U1YBl2ptkjO/XkTJQJBWSdvbqYRnh/T6KLEHdxKV/vtbT3gkeeggUCq0TiauV2Nc0smZ2KPNoDOJNWIRbkphmxuS67Lt5bXQgm+/w/AlkFuAfuMCjt0U0/jSGCeSv7QXGoAA6vTBoNtalvbMTreuOhqQmx9JUtvwQxFUr6+OtEb0/ERD0IInIaJiHEqhtwDTvgmOSAYY7/Vv/ZHojSIOhJ/ZZysVh+JO2f4QT1MKJLaSt9laWk5PkYyUGuHLg/gvIGPsanYuyhqIYOkK+Ge4mJ7nUEWVUAjKGmohhr0wQmErayEyogxz3udD+KrKE3BPN4yi5nOCp/aZ8bS0PYgP/RcI4T8i63kNw3fi0B4nPMdf+mE/FpEaIxUcK7yVLX1ATBflAjx5k41TwvZyoJWNjS2bmjoVb3xvN3uLvWhCAaMRqUFdpXteWRp8Ur8SGtgjvKQqPyuBE1/Un5QNFChLqM8mGx9dV8G4MU5NRBsrDS9SYnemBrWEjEm+Gl6mxbUK6lb05wtdMNt2OjpyHZuWZMovERb5DQila809kLu6kGgD9T+GQw0ayPPsJuy/MWtBQcxM4doWvd5zb+tY=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rpAQczQWqCIX1cVFjEsiCogHpU6WOWvMb0CdvUykpi/UhGXNAg39+NEWl7dh8sz8XBveWv0Q1cxguG/BhghYDm5UcsTcFp3Q3Y4+3e9NxHpGoCBig/7CEVHXNIOOuyVn9z2LYTi0uuqfz1jmFycz+73vF2dIqBlqIaRwZGRN65rjLqb3ocqiZXY7+iUjKgxqMY0HX5gOo1pfLr67fyyNKme5T2VQMrjUco5zbaJccWBE/25pQ2madSuTH0uozCG3MlCQRL0Ly2G9kRUtO5vn9MMa4J2DAR8jc6FSCkc22W8uSV8xvYeQaiQRiTc+qQu7wHYYgoBWP7WRH9mAmPpDiG1o3zBN8fwaCMJm+oNwef+tlWkwjX2NO/S2BRiiio/zrScUsjvYILRNQ1TFQ1NXBsWzL59ca+sC++gAOBetxfIKVpCObxlJoW5B00jWDXDY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:01:13.4360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb16024-80f0-44e9-cbc5-08deab911479
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 17:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236544

SGkgUHJhdGlrLA0KDQpPbiAxNCBBcHIgMjAyNiwgYXQgMTE6MzEsIFByYXRpayBGYXJrYXNlIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwcmF0aWsuZmFya2FzZT1lc3QudGVjaEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gK1NLSVBfUEtHUz0iZGVidWcvZHdhcmYgZGVidWcv
ZWxmIGRlYnVnL3BlIGRlYnVnL3BsYW45b2JqIGdvL3R5cGVzIGludGVybmFsL3hjb2ZmIG5ldC9o
dHRwIHJ1bnRpbWUgdGVzdGluZyB0aW1lIg0KDQpDYW4geW91IGFkZCBhIGNvbW1lbnQgZXhwbGFp
bmluZyB3aHkgdGhlc2UgYXJlIGJlaW5nIHNraXBwZWQ/IFdpdGhvdXQgdGhpcyBpbiB0aGUgZnV0
dXJlIHdlIGhhdmUgbm8gaWRlYSBpZiB0aGV54oCZcmUgdGVzdHMgdGhhdCBmYWlsIHJhbmRvbWx5
LCB0ZXN0cyB0aGF0IGZhaWwgdW5kZXIgbG9hZCwgdGVzdHMgdGhhdCB1c2VkIHRvIGZhaWwgYnV0
IG5vIGxvbmdlciBkbywgb3IgdGVzdHMgdGhhdCBuZWVkIG1vcmUgaW50ZWdyYXRpb24gdG8gd29y
ayBpbiBwdGVzdC4NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImJhc2ggdHpkYXRhIGdp
dCBwYWNrYWdlZ3JvdXAtY29yZS1idWlsZGVzc2VudGlhbCINCg0KRG8geW91IHRoaW5rIGl0IHdv
dWxkIGJlIGZlYXNpYmxlIHRvIHVuLWJhc2hpZnkgdGhlIGNvZGUgaW4gR28gc28gdGhhdCBpdCB1
c2VzIFBPU0lYIHNoIGluc3RlYWQgb2YgYmFzaD8NCg0KUm9zcw0KDQo=

