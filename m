Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7699FCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:43:40 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3296.1782294215516614578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KUy6gjkE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KUy6gjkE;
 spf=pass (domain: arm.com, ip: 52.101.72.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JIfRabDK071Tt1MjFluqFNiYBy8V8yHeKd3ViaAeGW0DvnM36mSNrOFyiGG1k4ySklfMClLnc1m6iilQ/P6NJPE5gfl7oEhErFbk2j4ejgNc3DPKsPiNfDfY7ZdGcSyDWNWrY2VyN7JyRCdC0+EUhtJxdqEk8LtORBCBeBLtd7wo8joOXYzS/Y5y4KidX/MuE5TVJiqAHK4PuJMQQOjLGEr/dAhhGx7MslFtjwaXfJGyk8uzubgmIQp+QLBOfDqL02ZQwBzfV/7JGQhLa8/pzXs6DdzosAypnHx6wm6IPO9mmsaM4YNGu5tO3pGOnEqTAwL8n1iHig+VphnwQB74Ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPAjrPd2Mic0S2+Ij1h2YElVe9lZ7LszShEWYVx3CNQ=;
 b=RsUZVCg6dtaAjBLUpMksdD+T0YodqAhF/Sg6syfVHmJimkr6f/WHn00P2RI6/iUS9dPVBZCA2Yt6lCL8iYIv+77fHznWphSOOOsbN0x1WiZbmHg293FvxClw2r5ptW7uz2wgNXQPcSGfWqTdLbJM9KU72KOCNa3N8t62jCl/yYYCaqETo2BcbsXt3EpaoPPHo7s94eOvDQnFIb6pgtd4OWB/bhPyomUuNLaAx7vVN5BntfRZwxOgNiZEuJGkpzJIc+pjpw9vMCoTY5yx6Zwa8nG5yv4m0pTXe5/CcUhgPR2QXBfLlryvmH5Iu4cMQ3AVncZs8QLW5ENhCkB4bkXnVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPAjrPd2Mic0S2+Ij1h2YElVe9lZ7LszShEWYVx3CNQ=;
 b=KUy6gjkEmCnV4MJhVWAPUSER/eZiQpsXToFhN5apGBDf1p8xLSttYLaNtKgwTpOHUOk6ozQPi8Rmtt+WtCDhM7j/+EfvzXYhpcp5o0gd7dX1bF8441gkbQKbHqpeaPR/MSBVd4LvklmTMtZYYvSOXRSgydgKIIsAZbAwtDyQ/EU=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 GV1PR08MB10569.eurprd08.prod.outlook.com (2603:10a6:150:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 09:43:31 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::f) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 09:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 09:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwRERCzs2YwWHmLXiKkXseS1gNRii7o6rVD5On6L27bkvJx/qZDQJet8llCFMcBLKJUKE0WHVqCEOBS9Lf+ccIIM02a2QbMfgZqAB4MCJGX9c+uS6T3dezL1v8y5cig+5XXQAuDu/I5uiTDqZDiWIG0KrhhlOHUU8cmu7zujP1nUuKZpQ3ILBXaggH7Pp3kdB00TkEPN371nnYiQQpmZ+UNgtpHF4vIlToluj+g+KUHff5sr+UfXwPqe0xHQ9riQd7cPTzcLYVfFFwzkPasXTHcVhxrKSXsyHH8JXsDtiEgRN0wyHW5QhPMkEWKvT9nd/FkSU35W0jOmIsgo3yChZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPAjrPd2Mic0S2+Ij1h2YElVe9lZ7LszShEWYVx3CNQ=;
 b=khmSnr7EF3gjs3gZmfXb9wEuwu0IsbT1YtNvaZnQhaQ6a+TMBzuDmxXpIJvDfigIFxQRu/VbzMgrRcpBKlmui0HpapsgNs++QC0agRebTm75f7WLZ6WQ+D87/++D48N45Frtqo7GaqW/cBVFNW24w/naZTXkbjKaJez2yX3ZhG2rPejkAZy/EzczJZkMcvlEEPPyBJl03fM9aPPdr7wz9KjVwynjwblSidq/goMspia95UNkO2I8vxSv6TuOJfItP4q/SIOuwvjRi8DGbJHrGU4GLhoHU7Yhxr/YrR4RbQs8COHMV6xu2/PZVWxZkgLEXP2UB6iXWOVXK8gEUKZ+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPAjrPd2Mic0S2+Ij1h2YElVe9lZ7LszShEWYVx3CNQ=;
 b=KUy6gjkEmCnV4MJhVWAPUSER/eZiQpsXToFhN5apGBDf1p8xLSttYLaNtKgwTpOHUOk6ozQPi8Rmtt+WtCDhM7j/+EfvzXYhpcp5o0gd7dX1bF8441gkbQKbHqpeaPR/MSBVd4LvklmTMtZYYvSOXRSgydgKIIsAZbAwtDyQ/EU=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB11033.eurprd08.prod.outlook.com (2603:10a6:150:1ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:42:27 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:42:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] pkgconf: upgrading to 2.9.90 SUCCEEDED
Thread-Topic: [AUH] pkgconf: upgrading to 2.9.90 SUCCEEDED
Thread-Index: AQHdA5v6SKxuUo5mYkym7fkD5yFpwrZNdEMA
Date: Wed, 24 Jun 2026 09:42:27 +0000
Message-ID: <94805360-EFEF-4C36-8ACD-D3FDA81706FB@arm.com>
References: 
 <0101019ef824a589-9a7e06f3-449b-44c1-8212-1f1e5008a460-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019ef824a589-9a7e06f3-449b-44c1-8212-1f1e5008a460-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB11033:EE_|DB1PEPF000509FC:EE_|GV1PR08MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: 476ba3d0-504e-4a12-07fc-08ded1d50cdc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 82MmiuMLlfnaB7/j+yD8Do99nlWM5ObLq6QPgf5obVkI8e8yzvRYbgABsvRcpEjVQ/KJwlQR/M5+TZUOFAkm+35pVpC0ddK08EqgN29Yg4Ey7YdHBWkCG7Dh/s7KRrPU3gtuOv4NRFuMPL515oam9vDcEnLemj87uoPNcQ426g8CFUpT+TY4RLa6Ffsm/cByb8IaNpuhrgUxzYK53FPjgXTDh2Lh1Q8toBGgvjtGVjnhlqWKSd+1EP7Y8PhDUbLa7A9StkFSQ42EDeSULPAQbQpXcQjopYNZs50sfMn81l5v/QfbQpiLHfT/Ugdii/j0a6IZnp0qDSzef2gfJ+ew856oQXdxPwhx+Xxa6LjSHUqxAHzq5JS1pyV3x/Opr3+i0UPxXaAQT7ACsij0JW/Tatd4C/X77scKTIn9C4nuO6WS5B7up6k6afFmLSVEcidYAVg0T4eCoqz2LnMVvOvmtL4DD0SK0E4Dmh9wiG2f3y1sA7KFMMnGN+Kc8Rd0ejifPY1qwaK/Y0ETIAtOztBx6NsymqymBHI/+ixzVtvkX+HbxMymyV0Q27ob9gM4kEhLoFyEJ/HPtS69TUqn+eYRJlUfXoyG1QUQJrUSsFqPAUomGKUuAt1XZHLdi0/w5eUX77MDS8DLXjQ6INzNpnLOIdZHWjY9PQx04d4a+PvbMCtn9Qu9ueNo8/Rb24sCPOMYHawbo3TyjmAGIcnI9f/+lguWggey8uJIGu9m/IKylmA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4653355A2B993C4CB3BA5B16FD11B4D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 rnVHx1ZenqWN1uGKkN553u3EkCBeaaEkOJmUIkQdm4DNDm+Bh+hCKN11w9enxxDHrTfrIP3943CzAya1QcG7+NCrNyI6JGgZQWBRBFzA6zkNEJ+5/8FBZTlPZ3lSdWdSTLLBcpQK1Y7RPUTPX/pnPANwsvhr8lO7TQswwuY1BumpXajy1JNSChS//JTjKV02F7ov2nFundc/lCIu34lyySmJIJZoiyIKBAUnEfgv72NzXu3hvWKGE5x2DEArTg2SmIqbp5IdYy0lQZoMDr9LGUnphlTH6XR2hXldbngNHSi7BOoRDsaIvEQMUJpnfmcnaaf8Dwo78g0v7WYyAF+tWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11033
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1bae6d56-79ee-4e53-54d7-08ded1d4e729
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|35042699022|14060799003|376014|23010399003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PyiuajY82jcnS5isUvuSYiehs6o5z4ST1SZ+vGZiGJZzci1hBpgE5i2n6Z0hRRyNaZxxCQ3HqRGn+itXSMMvCYarG/5F8E+RWtUDZZpv6L6yrkcxtEfmq5xAOuqmaoxCcr3YD/WfwR72AhsQ6T+OSiW3ydMf1MAvwKUpKBe4CuEYDv8tlZLFaoC50obD+g2VnfQf8It4D2n1QHTQmdOMBfaVjB1xvFuUDakYewbitg3FvZuYh8kt2+eF0ciq7geQ8hf3CpAkz9YNW0ec1/ou0vCj8WgDHQx9q22+zrmsNoMBcMdsRHnBVY8/MxL25nwJGTuD8CoryYWLPYnO6exRtYdTQbArHJn7Np1PyrmVDkiSCmCVBnNZKHsmFguQbyRdJEBv2Ql8i2WPXdThWoqxpgy+HyLf0IUB3697qaoZjwl/gmFhcwamtMwP5Poa1rRXsVl1v2yW/iz0hzSJ19ZNeX2HFovVtpxMgcO2l7cMPfuZHblpn9arH0+pTbZZ3wr95EVhD0bI/M/YSov0q/I/C5YQ5aXX5klrjHCtwavHIR7E/tATcNRkS1Ap7uo/CfFV7F3n2VCvHWXH0P/Lcwosh1Q/1KuqPl/+Zr2SElilOe2GrKT6u3rsOWZspramTew7yl+fLdaMfb7hD7FIQHgYLWKx9qJtGmJgW1E/0RNvwRkwPhT88aVBImuVJmqqbEBjqRePZGKEFyubcqyZd+pM7A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(23010399003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1lN3vjjjA17JhyH+y+vUUWKUIoKmmHrNRL4Dfn4odD/2BJOs6qpAEf7Z4iLmk9a9QF2JsXn9S7cSOwDBqu16NRo+xUsSGfIvqXa4MN0FDP0mgIt9ssNGTA/FVZSB7ol9ILrLnOiec/mkfD623T5bRXZGAJGFuImjlVUnmBg/8Njc2jmH29OF9JfYqXc9KlcXRTmgkrK1eTyua8CWe7L2FMsou8ShbSxZLjDETy2H+pjMTbDBNHZosPEywKW84m0DBMI30H9xsqNnAbS+J5cndiyATLONG9ZT3QaJjrnc5DJ5xQT442fVpMVnSqKa44E2RJXvBpKwxrI9G/zMprXpMWJH/BNekhB+xDg6MPbsW8GxpBmQK97QbbhV9giIWLJYhs9+D9iijDWNIgLk7VxVWNR0OfLFdDTsqekY3Kuw9ygQJ2MZ5lDa55Ffqck938bx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:43:30.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476ba3d0-504e-4a12-07fc-08ded1d50cdc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239482

T24gMjQgSnVuIDIwMjYsIGF0IDA2OjQwLCBhdWhAeW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4g
dGhpcyBlbWFpbCBpcyBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBBdXRvIFVwZ3JhZGUgSGVscGVy
DQo+IHRoYXQgdGhlIGF1dG9tYXRpYyBhdHRlbXB0IHRvIHVwZ3JhZGUgdGhlIHJlY2lwZShzKSAq
cGtnY29uZiogdG8gKjIuOS45MCogaGFzIFN1Y2NlZWRlZC4NCg0KTm90ZSB0aGF0IHRoaXMgaXMg
YSByZWxlYXNlIGNhbmRpZGF0ZSBhbmQgd2Ugc2hvdWxkbuKAmXQgYmUgc2hpcHBpbmcgaXQuDQoN
ClJvc3M=

