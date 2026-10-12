Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE82CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 09:44:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9843.1791798254973101583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FXak84bQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FXak84bQ;
 spf=pass (domain: arm.com, ip: 52.101.69.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NLSVXUZ3aDQZFPkOsq1nTu33pyu/97EJHY7qpX4YrCRVqiGxeovjIH2k4lZjCugSL4V6+DcxArCvAX4AA9AdMxA3c9AIGSXaPZ2LxJk+tvOhq1uAVKfjSQrKyMVIedHNEgNj8WT/fZOiKTvVBf5UAb39N3zBYgEfh7WKLGRZLBNVaWMQaFEUZTTzcX308rCIfk8AiB43hhHMa2CSDwSB1Y93W/xzdGHpztIcPjfzmzPqRAMWV5g/u809NC91wFWKD28fTzSzJx4kLGEZFANjM1ULudMCrKCfVmnd5xsRtww3zw3SAcTi7aG/3NCpz9YvNx+VBIAoAamaTJG+TDDG7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL9M6DtZ23O9O4NGgwiVJTmLDoASimFayUtqQNDgDeQ=;
 b=WZZJBr99HaMnH1RKiKDZm8x7d5DIjQu594WFgqPnv1RLZNDqSD5HghTjsnQLojCRkPDp0OWNjQRIwYc2t3NB8XmDZjEkarkOz24XiVHT34cpzkB1axiJinLxnuwYWnauhL72XaIrOB0HGOW9enLcp4NAB0/XVf4H46o1c/JILe3EbjVG+BwWZzfrQfUr5KFI3TYzI505Qb6Zo295UdFfin4SqOVPY0F8AP17CjT1af8k9T3lEsMMTanc4LFshoDZAWdIXk2f0ZketTamENThVElSJicyOEM41pFKz7Bk3+RhfCHqFqRILpKWXadWHkrV/yE90AS9ncciS8r1+3FfNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL9M6DtZ23O9O4NGgwiVJTmLDoASimFayUtqQNDgDeQ=;
 b=FXak84bQMDzmjCro6ON1QaVUrc5aFcNiKX1VEHTuc1hxrci+MIKb3obSvyo1UFmXOkdPd9knU+NFF820q6yWSU+0t3Z+zexkSY2zkvKRrs2LpmkGQqNDoF+XhTh919DbDGgN8kNiHptQ+q1a7+RSgE1QjggVCS3cvX+mRj0q8IE=
Received: from GV3P280CA0018.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::33) by
 FRZPR08MB11928.eurprd08.prod.outlook.com (2603:10a6:d10:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.7; Mon, 12 Oct
 2026 09:44:09 +0000
Received: from WA1PEPF00009B37.eurprd05.prod.outlook.com
 (2603:10a6:150:b:cafe::7c) by GV3P280CA0018.outlook.office365.com
 (2603:10a6:150:b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 09:44:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B37.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 12 Oct 2026 09:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX6J8QDFLlglSjdnpQEDhZgnfHiu5fvgG3hVdF+sJgke8zv5F1rsv8u+/P0EBbozsANFrWTK6+6/lexuf/QT9YagWj3upQ9OmnoUq7w/UEVPrcz9J6cFWaC6kmNitgnqIcrtK3zCNYWZqxcL1MF1sNB318W8AOblkOatqVHnMOFn5otfWy9yz7H9SaAz8PuBtoaZh7ihK6clRwd9ZgbRf8rSjTJHOzI3zJY9GPt60L6/nHRddGi9/XFHF+Ds9H5YoCu73NTnQAJZfsgWWSZrQW7dItS5aKwVD9FU2CI/uriDq7iz8sLsjISUmAiOU/QRLvh32TAp/IaQ8M9ziwZUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL9M6DtZ23O9O4NGgwiVJTmLDoASimFayUtqQNDgDeQ=;
 b=f/OIw+8C4ftsPjgoO5Sfhoz0LqTZ0RZV3aq2W7AtVF2mmz3N0tzDLWBrhb/bAXEBihZVkRtkMWtxUnxwhnIroUmzzV25HxTOMid9xEpHggT8+hQSlRPmpw3uIcdcW1TVkcOAB1Ck7WyXMGD3XCg8AI/wudqYyehXeW95kmdgKz8cZkVnYViqoNAVGl5qfioUQ1JoGJ3TfWWE6TccLBp1GJ4BX2hSJetaty1FCQ+7mmJ7IB6DhAA5z2rKeLDGsp+Pjne/bEeDOJdYcKBmkhDSCIg47HtUCS/xSJiHcxh+3XUbiWCT2FNG7Zf2VK8LcRvaN/CwYXo6igy+OWodBcGF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL9M6DtZ23O9O4NGgwiVJTmLDoASimFayUtqQNDgDeQ=;
 b=FXak84bQMDzmjCro6ON1QaVUrc5aFcNiKX1VEHTuc1hxrci+MIKb3obSvyo1UFmXOkdPd9knU+NFF820q6yWSU+0t3Z+zexkSY2zkvKRrs2LpmkGQqNDoF+XhTh919DbDGgN8kNiHptQ+q1a7+RSgE1QjggVCS3cvX+mRj0q8IE=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DU0PR08MB9276.eurprd08.prod.outlook.com (2603:10a6:10:41c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Mon, 12 Oct
 2026 09:43:34 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0522.009; Mon, 12 Oct 2026
 09:43:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.0
Thread-Topic: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.0
Thread-Index: AQHdVwlIcwtcguKvmkGhv4Ox9LM7tLb2JtOAgAOHWIA=
Date: Mon, 12 Oct 2026 09:43:34 +0000
Message-ID: <7DD53FF2-292A-4646-BE91-9982EB0E024C@arm.com>
References: <20261008094148.752601-1-ross.burton@arm.com>
 <DM0UOS73NIO8.2EU8I5189XEIK@bootlin.com>
In-Reply-To: <DM0UOS73NIO8.2EU8I5189XEIK@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|DU0PR08MB9276:EE_|WA1PEPF00009B37:EE_|FRZPR08MB11928:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f50a47f-9111-4473-5c83-08df28455cc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 Qy0UmDO+FI3DEu4WcSfG+iraFgay8+Q01ctP41j3zSKaddW4bfEXobNEuO6fPzfb+l/ctThTxHNgn/mVac4uOHpNR6ffXBam4VMX/P/OSaSeKbXXkIZAOstpfPHMZjy1dwHTZ+D8sPqO8E0CzzWIl1cOUiRrVitpaB4jLsX1ETjg3+LjxG4R7N3nUAZ3VXIZcBa0gNSfn/fK25AFW2h/m1UI2o1++w0eRHp6j9nXtRnflK31xNAbqTzT8zb7QpcmcLfYXp3NLii1rsbMnToEnVcgPTTmPZNT1fiN2QaqWzvjtLE4fBLJwdf7bmO0c5IK7ywQKxiTKk/28ouXTT29qQESEDO0MfQ6g+FlqxmOGUv7digt5Sv/Erm2PeSpR0iac6SzGqiCUI7uqKpaCpjPGjBDWZQN+9U8CcAWpL1RJ+dwQBHzNiXSLKaaR5LXhddNo5uUTrhZA/oX26DLe4/HVbQXHqd0gmx7ZxJ+XwRZ+Ji/6F8MF1TN6H7juZcwmDruE8TWy7z6mt0uivaaq3vy0+iXYGd0JQ7zZeIPUQCgMgwCZ2lM18LVVFZ9XXspGPbRETSI+iimCBDYureab2XgyRBEas3jvvZQWXXB3O6zyeroHY46YlO1L/Rz+T9KsRCiwO9ple+zoM3gBc8igPkaM/FHrkHbUqHIhuc6q2nCBoRNmoHbWSk4aORWV99Q7NqxxEeyC6qQc7/Op6A1ny2fASyb1Bvl4gomp+9eHcFgJdM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D48760FE43F1B4ABCA9C782072FD50C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 0My5UgWBFVyafKMxBFlw6McPOAGxUSO53CsHQBN/NYCxGm3+O6TYOtlBcpwtIUcqrf63AtXLDWpCNr1dELn25UEyROftVITWsBDobHZ0QnXKEj9LzotVQzp2NZ66LrYNGBOK977oEZtQC66bU4WIjKCiOAwu6Ouz6tNAjF2vJVpDzCZyuhUYAaNdOZsQQ+c5WJz3MH0iRSZ4G0higDP0T3A6bNjYy9dCjKnONy5QRX2+oUY1JMjCMcl4JRTGZeQ1NgDmLUJyHvW75wmezs04dTEzPVh0LGl/jtvtJxoMEVXBHSvmp7xjIzh0SfuP8+4ZOB4z88TwktErIMiMk/cCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9276
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 WA1PEPF00009B37.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c19b3f40-2353-480e-87b8-08df2845485f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|14060799003|376014|35042699022|82310400026|36860700016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	UnEU9t6KTRf5eUiPxxNjyGCh65Hgr6eGRWPBtIdP4mKWWpSQ7Zfx2/LhmSG430Yfw9B9dvy+TrSanzesWDpUE8wxSroRDT4RIIHn8rTnyB47tE5G8CFGz6o6dEYjaCr3Pe4oPbAfEIdN0z2pdgsfmf5ovdEFwtcgGIgEVcKswhkmQpTzsS2Xn+ouHZNsM8nnGR35/ygyeaJ9jSXQC/YlVGQniq4pFrSZxKW9lLSmUooGCNmmwRvyvyFggnGtF8uAtdfBcx4FEzLIldnA6J+L7s3wRHL+UxT+n0gC8hBpv7HguLQUJFfXyZIEQ98Kp11wzuMf80A2vpvP2/qPXYKj4Phc2osI/qWm3/hy6SU/6boZpGwK6X/6+elW8Jqlt9tBoeyPiTC4icdTeebQ6eq5pZZ6H0b5lEfNZ9bj0hu9MYIQWPt2gN7ZPE1NnQLtrFP7h4Qi3RC7CKvK9fg9YAMl/sMnGMAEbO/a6PwjSqK3oPOr9fxSC2nvPUVxedN+AUBD54qRCIGat8k4rZwuN1l1CtpxG5eTWgfQQ7mmLUWvz0zTgMLsg+Bk+3g4azYBQJBEJws2fi76g3hbHDt4ddCe74afQEIzP8/BVC/d7u3otXDWZg+XnoDvA6xU9KTnKBhrdCJffQsOQoT3WX3pxAjlmj4sjuvOb39X7h1TzojTWPM+QMWSR2I77jXpm5Ozd/SBU2IpzIGd3lyqXBwo9i2Aag==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(14060799003)(376014)(35042699022)(82310400026)(36860700016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	baNwsP1Wc/XbW2g6e/IncnHuVXir1715ZO7fIPm6A75K3HcZtqM2gHeib86N+rOdOe0rVjCIOyBS6nZFHBYR2N63Mf9Ns8GEgKbVvY0GpYg/3Oresd0OlrbS/d0+AEoZCLQkRMUW9d82y804QnHxPs6+2z107Ldw27F3wJOybg2i8OJO5oNW3K2RxqKx1YZzUQo70c4FCub1PQOBmIoEXhDp/Pkm7cx6VLkcdarIq+gI8WsJ+qu12+XkyqBKW3hdwOz0iEfGq5cnzIQzcnYs06NNo8JlB5690oMiQfCx2Je04EgC93A8vZ4xZPJCJmPEOSaWzAXDHDIIgQ8+Bkw6HQ7OvNP1SGUoSPyCYvuvXvbmyro5DVYdGP9aodvsTwaX9HKF1sM7TfEgypfcfiKJ2ILYRNEFalWokrnXPq6mewvqPcDfR558dNWuFtwouJMM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:44:08.3223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f50a47f-9111-4473-5c83-08df28455cc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF00009B37.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11928
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 09:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247619

T24gMTAgT2N0IDIwMjYsIGF0IDA0OjUwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG1hdGhpZXUuZHVib2lzLWJyaWFuZD1ib290bGluLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gSXQgbG9va3MgbGlrZXMgc29tZSBnZW5lcmF0
ZWQgX3NoYXJlZC5jIGZpbGUgd2l0aCBkaWZmZXJlbmNlcyBiZXR3ZWVuDQo+IHRoZSB0d28gYnVp
bGRzOg0KDQpMb29rIGxpa2UgdGhlIGNvZGUgaXMgYWN0dWFsbHkgdGhlIHNhbWUsIGp1c3Qgb3Jk
ZXJlZCBkaWZmZXJlbnRseSBhbmQgd2l0aCBkaWZmZXJlbnQgY29tbWVudHMuICBJ4oCZdmUgZmls
ZWQgaHR0cHM6Ly9naXRodWIuY29tL2N5dGhvbi9jeXRob24vaXNzdWVzLzgwNDUuDQoNClJvc3M=

