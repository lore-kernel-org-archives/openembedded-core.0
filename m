Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83711F588E6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:27:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22087.1776698818493714288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RI0WYXBf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RI0WYXBf;
 spf=pass (domain: arm.com, ip: 52.101.84.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gkOzyTebTTEtmLlBrucosKNYOqwfXc+oOyWjmL2/DkdfvJ7P7oOMxc6WMKjQ+/GuUEfKqs+QieNrs4I/4cA1sobKoijdJ6yYyXqIEdmPv4d2hw54aMXps4FuT7qyhgStXFOEiupRWcmchAHZJ7J4M6xVuOw0WUmfyvR00ChxPUDj3Zl8iQeMYB4qQ0LW2T9NFB7kIl2Z1QHGiIXE/X/FaSO6aCE3dH+omu91HWBGfCDokfEN9bFNLuU5yFwKKMxIxr/ET7H1m+Fez+L9xqrZm7MoVd9LtoqWOZWyzO34zQ57mF6RXHtcd0k+HYo5y1MLofKaM3ninaxJQZG2aflokQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlIcIi69DJe0L6xPomWxLYoBpU11PcPzP5movQmQor4=;
 b=JaSh3Da6DAbQiIR0XrRMRVAMSeGbHjIeCCy4B21IvulE0acjPuSzPmkC8KiFSg0JauUoT8OniMlxgSgL4hi2kTGeWw16vqChbMYpMUhUrQ50Y5beVYVjnLsAkVkWwRz/GIEaEa3+Dc50BBf0CT5dHKHnD/PfeIt7xN/xcT3+IgQqkmOHIjP+jSqLcVpfqt6mSjzj7803fzX5ANDLoM1qAkv/AYK+GhvTabI5DrbOvOFKOwCiHRRCPphomHrxUrWrlgZlXyD5MotzxAXElhKRWJmWuWYOBApgY2OE+Dkr19VMbnNSjGNTcY4ykwTD8y38ail1so/a64qJ14xELALQaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlIcIi69DJe0L6xPomWxLYoBpU11PcPzP5movQmQor4=;
 b=RI0WYXBfCNU/awmoSSpSG6L4tJbazdUdq4FjpunZIvaKXAhaItW4IluEoMB8CXtQicfDt1yoIKHRH6rWcKJjz7EPK/pYErKkgqFZEyO9aJdkRa+qxHsPj/7aClVJt6mJy4PEzFxrl0kDcdFVSOI7gxEEfId5odCL9vAAcyim6fw=
Received: from DU7P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::22)
 by GV1PR08MB10608.eurprd08.prod.outlook.com (2603:10a6:150:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 15:26:51 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::5e) by DU7P250CA0027.outlook.office365.com
 (2603:10a6:10:54f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 15:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 15:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqvwV7vlZGe+iYRdPc3mXu4UTH8J81hWoie6z3vX3UcIBfT73bghd9yuP796xGLXweFh82g1TddkwXVsSI7D2OV8EkZrlzzrIN2uhp0ILT9BqGhxdMLZCKcaQi+jCW4L0antfKa2ejCJTYln9LzjCcOuFeUTM7KUSrLtg4dYE6NeOBvQl7adXHILjNLZOMMXjddTzGT625AfSEQwJr2Cbuo7BbORzzJuldXEb935+UTe4g/iM7+Isrv+W66WouE77SCTYrqDnvPR5sjV34HkOf9lVivBwWESxe6JtRCtNaBzvhMfJZSnBpoij1X7h9nFOSywYI8kXB2R6MP+00FrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlIcIi69DJe0L6xPomWxLYoBpU11PcPzP5movQmQor4=;
 b=mm94Kt1g4Wcw6neeeCuhXLDhqwJdQ1QSJCXU7WKwfFnuvxIAkBb55jq72mBrcFN4HOMqmLM9WOl4fZezapcB675xKLguCFu4aroOW/YhAv0f4Jj6BUwJ2K4SyCiI9tpN8g4U9AVokt96/3ZRaOQri+RnwnkN85Dp/VoeOuy3Tk03HBPowGepLxvr9zGRCyM0nEgRZcOAsA7mfCbMXq20L6LeaQVU5A21+mLNWspgH6WKx22ET0OKohIyVGLqq1uG45MbiyiMzTACqwt1ohDR/N6C2tcq1x2x+ZyIlwm/neFisG1Y4n86BUBm3jVJpi3Qk7NxkISjuML4ZdMec60mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlIcIi69DJe0L6xPomWxLYoBpU11PcPzP5movQmQor4=;
 b=RI0WYXBfCNU/awmoSSpSG6L4tJbazdUdq4FjpunZIvaKXAhaItW4IluEoMB8CXtQicfDt1yoIKHRH6rWcKJjz7EPK/pYErKkgqFZEyO9aJdkRa+qxHsPj/7aClVJt6mJy4PEzFxrl0kDcdFVSOI7gxEEfId5odCL9vAAcyim6fw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB11562.eurprd08.prod.outlook.com (2603:10a6:150:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 15:25:48 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 15:25:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Topic: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Index: AQHc0GaemLzXb/DykU+XOV6zj01i97XoExOA
Date: Mon, 20 Apr 2026 15:25:47 +0000
Message-ID: <5A6DBDB1-9CC5-4D15-A3C5-5A230C2A4F71@arm.com>
References: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB11562:EE_|DB1PEPF000509FB:EE_|GV1PR08MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c0b88a-0cff-4b99-0d9b-08de9ef13ee2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|38070700021|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 iIHSg89RbHkXb11nhKIfUXXJuiw2l7vsncdqZfEFmZKhmlUBfj1k0K/4NboKHjtV7fvMgRUtFcbsbKjrc+a5iUgHMkD5nDAk+DF4Hzl8JMBGGYt18eolaUZJc9GzS0HrLH5WnJ+92LNROAm6PaLZp9BghyJhV1mqchQxXDX0tGDsNWTjkjMnaL76d51Utz8ohQR+kIlfYSUPQvXu5iotHs6nRs3tNbsyFkZdkHs2q5BGafNHNX5oRrR67/xBPTh4td7bpa/Nklh/gatN9TrvYyAXJpopRWDV01Sd4c5Wnatg4IH6ad5ka39Gichg34RffjuhlA/ogIrPP5MkbeJkvl9l85gfjrB22v6lSiPu2TIHHxmM70ZCfFU9T7APnxq5Aa3t4/ltsNCDrcB6Fqx3a3X+W8BdhHw7pKzVwJ06//XublfpYRHKNiKQmsPTisuWRGnXqAKRJETwy/QRjZs5FqAToqC8e6EBb134sMQ6WCDB9mjc6NqQXLnDaReIETVcPOa4paNXh95FGZyKLwte7AkhUuEJ+MMez5LaT+IhJUdGW7qev20WqcH1reiF81uO3NGnBJbZGdfvUMUIo7k7TonZs9nx8zAmD38MLPm/k726I4EUyikmqVWw035dhpKDhCIoNSxCaxqn2VzI+nVaQCBGF5sQRBMX5HXw3GdjP2PrUh8KQDui3CZDQdacP6+HQTzl4eijVCgbIh0/F9qe2yJEVLUS3jVv3CzvJ/cKCSiW0ojibGAH7RkxeYN8c4cT4znJUlJG8DMyCUu9K1rbq7AI08HBTV5nyUaK9psQK2U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34E717ED77C95841A7B08843278C0D0D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 YRkk3cNV3RHuWqH0TVlSxs8yoDLVmESK/5+bcLxitUGAD0qegKx87SFYaYIYcjdfmDAVfq7MQMpY+3neiKTMw0ozjFunXNYdgONrSbFodncr9d3XrLZMvt7yJE0WyEBuOSp20oGUdwTyAfPHlY9FULt+Pbwvor7vg9zsLGse82waZ2YpXVG6cFZB+cCESPnp5ek9LVxCGAwojT/mOuYbubPgV3DYWGL8fp5aSdxfEDe1QOtUsGZUVKHBT6UWhZe0mHE+YagRxVA6xPc5l44zMX9GmBx/PYvT4Os9z44LP4z08c+8tFkPTyetp6yNDRJlJbX5HCg0QTYzURA/mgW1kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11562
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6be17ce3-f10a-4914-d672-08de9ef1192e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TVGMPmXv5gCo3xYl3ND6cXn5C7A0F4b8Ev5b4k2T+oZo7fLxnBCB2RxPrJLs8YuaYCTgFqSUEAqIwiTpmDQM04U6JDU8t2Txfqw3jfd+pavbZaEo9wDLNkj/kz0FEOW4FlYVbt+jKhEbwYGX4fNuwen4cQgklOgPPLRvF0foni0tzIjBRGpAfRertBmksAGOHkK/1P/81yTv+Setcp6FTuZBxK/MS37lLt78z6h22Bblr7DJPUBF/tNmkRYjTKtZGFo+GF5KgK7jmWoQzY+SQh6tlb2rfgulTKX93TslNJmL82S4Gyn720E1jhg9+jAPkKR6uIbTCEeQcQPO6s2uGWtk9FUiSNZ6+XWhivwMh+pQ6hgioOB8y1fgifFKocnpb2herdJ26Ur51T3JYzL6Vy41mjiTefkxbCPyJt9Voqm/NAKeKHwgM/doMd2jh4m8Dpb50rfr9WxNTKphjiNRKZXPP3X6tf1PfQ82gtF9QU35YKm7BS6urc80HgYq3F+rzSPiy5gaK5o6IxsV5/zamvKL/CB7JFYyyg85vIU9axjPpf84XRxgrKYsQDtMf/mm5skivlnxQ+xqoSD/bE+npZCx8yOB8/DAV3S1pEDLr4LYqbA2ODWbvhL2gP1JUZjxkV0QqE2x9iAYqlLCrA3VliL0HB7+SdxEniH4lATh21GK+6lLeatUWXOsFSywhYkuUPra8XEyjlt9D94gSYJNgw/JJSB4cY+L0FTH9KOOs7XmmduWaVCNNlVhlBtb3dfc+5uewDJ0E+jrT1X7BeLxlw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XYaZSlmEYrcbRSUnlvAZ8LcEXrhUCYMmjcvzeOxP+2wxxy6F3muYGOriPt3h6sJdyr90Nt9PWtDjBN7v20pl8rb7Nmoo3fRoP3TyXGbHxOdq6ZHmg5oJLcP02kwH5ShCHMFGIhMrfRh/InNFbjYrNXL0spF2OFdZfobSbDFkYQa3eTLfy8VWhzI+IZSVDsAZPk3Ng7cq7zq2wd5sEX8Xk1712vlv5YoUjYbTRpZzDe1HKaRdC5VrZJo2AKU50bGhVZmoj1L6FD3WgFtvcmmgGikWFmVl8kgQzoMftGFkUsFwqaXnkoAhaqkLqtG5KO7s+3Zz9KwqrmMu75OMhkbHofKMX+4aPAjZv08r0XQNVScg6YHhJPothyh4J6hnyTH5U3ex394xKYh/WTECen4TcODz3FXxqN2o6z3C3Ot7Y0o74VH2XWnpcJFNU7AfPabt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 15:26:51.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c0b88a-0cff-4b99-0d9b-08de9ef13ee2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 15:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235571

T24gMjAgQXByIDIwMjYsIGF0IDAyOjQzLCB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8emhlbmdycS5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gIEhpIEFsbA0KPiAgICAgSSB0cnllZCB0byB1c2Ugc2JvbS1jdmUtY2hl
Y2stcmVjaXBlIGFuZCBmb3VuZCB0aGF0IHRoZSBzYm9tIGZpbGUgd2lsbCBjb3B5IHRvICR7REVQ
TE9ZX0RJUl9JTUFHRX0uDQo+ICAgICAgICAgSXQgd2lsbCBjYXVzZSBhIGxvdCBvZiBzYm9tIGZp
bGVzIGluICR7REVQTE9ZX0RJUl9JTUFHRX0gZGlyIGFuZCBoYXJkIHRvIGZpbmQgdGhlIHJvb3Rm
cy9rZXJuZWwgd2hpY2ggdXNlciB3YW50IHRvIGZpbmQuDQo+ICAgICAgIC4vZGVwbG95L2ltYWdl
cy9xZW11eDg2LTY0Lw0KDQpBcyBJIHNhaWQgaW4gdGhlIGNvbW1pdCB0aGF0IGludHJvZHVjZWQg
dGhpcyBjbGFzcywgaXQgaGFzIHZlcnkgbGltaXRlZCB1c2Ugb3V0c2lkZSBvZiBhIGZldyByZWNp
cGVzLiBZb3UgYWJzb2x1dGVseSB3b3VsZCBub3QgY2FsbCB0aGUgdGFzayBvbiBldmVyeSByZWNp
cGUgaW4gYSBidWlsZCwgYmVjYXVzZSBlYWNoIFNCT00gd2lsbCBpbmNsdWRlIGFsbCBvZiB0aGUg
ZGVwZW5kZW5jaWVzIG9mIGVhY2ggcmVjaXBlLg0KDQpJZiB5b3Ugd2FudCB0byBzY2FuIGEgYnVp
bGQgdGhlbiB0aGUgaW1hZ2Ugc2JvbSBpcyB3aGF0IHlvdeKAmXJlIGFmdGVyLiBJZiB5b3Ugd2Fu
dCB0byBzY2FuIOKAnHdvcmxk4oCdIHRoZW4gbWV0YS13b3JsZC1yZWNpcGUtc2JvbSBpcyBhIHNw
ZWNpYWxpc2VkIHRhcmdldCBmb3IgdGhhdCBwdXJwb3NlLg0KDQpSb3Nz

