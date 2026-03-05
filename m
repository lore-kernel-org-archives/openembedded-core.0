Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB8F33A8C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:17:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46593.1772723847195586714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 07:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sNraMNx9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sNraMNx9;
 spf=pass (domain: arm.com, ip: 52.101.84.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XQJ2hheSQlxbfrJCQA6IXMmWXK7WT1911dQkjNTu2s5Tq6TCAEORyXShyzECPSlMbU5zl1IF6sxcKzF0H+V3WAY6Flmn329hUqevJSZUAw2QFSn0xmnRkFKtRcmST0lyZvF8l1pe9fvSdA1ndVRaoU0SkLkrlIu20f4RFOlFpktmjMPKGhYbRNtsfJasLAnFL8P3E8mihQ+KHMZLZuah66ATkW5eSSQ9hScaEoL65ye+C4wjAvn4W5cXtSpYliP9l4LidkTp2+Bc/bCYVOJP1BpsGr0dPxDLylvSlEfFq5dnsOqTkyFrrxxN3ywtledLO9R1YyX1n285HdrTx0bLTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=if0hF3GxAUBVO35eGIyHkZHDHlejrCNV7AU+qACADGU=;
 b=djUsQvltDpLjmo7Na9YeSxmjfTFtKWUzqhu4PkeeV21X6eEg5DEQIFaeRjMpRoUSUGuoBdhY93gaGxHDUWXxYPrxGiM4IxWwxEMjtzXeV1+WohNOuHn17emRQTefuj342MkSvuUF6SgDUEG7mGasvr53R+c+HrQN2ZvRyjsGoR5qqYkYiACW3mJaDWtUAksmyCLzc3xG2lz8STOUQQG++UAFL/k81r8BayHjuqoI783R9q9Hux+6ngQxWe1to6THb6U44YyEPsJ8BSPbz+rQNUX1j/2ymf6DXE9O78zzqLDzhArpMFKZJMRAJdPNsqho3gVnkyVX1XkYQsaN/z70Yw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if0hF3GxAUBVO35eGIyHkZHDHlejrCNV7AU+qACADGU=;
 b=sNraMNx9CjBpdJw/mLaROB1/h8uwLxQnbma6iWwoIY6xRAZdiKy2euHnetdTVZKWhXcNm7E4U1XJQJULztHn81JGnmTjRpwSxwUMIcmOUKnvw0QBdPu3/QVq2uQcIJBdrmfcTgJiNrg9+9fQMKv4CPS8TlUXDsEVQiAP32yrvxM=
Received: from DUZPR01CA0305.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::26) by PAWPR08MB11016.eurprd08.prod.outlook.com
 (2603:10a6:102:46d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:17:22 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::1a) by DUZPR01CA0305.outlook.office365.com
 (2603:10a6:10:4b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 15:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 5 Mar 2026 15:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H67/y8pzNfq4cFtXFXVW0nXbtT83wm/bsKJM2WiAJmXyCeRQSV2wLS1TRtmyPDJhFTn0PurPSyAdIe1Z3vCFd0qw2q3c5ANZ/DbVcXl66cQ/KvGHF7pSWMKINH5N31+oHqgbS8VLw86bQXKlmwX4o5kUaB4vCfTp76zxCvoI9ZNld8LZ29rOMd39EeKH0LQddRCh1a1KkLi03fDkgOuvBp5jPOSisQXunyAJ02oblNKwpK6nlFu1ZO0OUKwN/Kj3/yQ3lwanNgj0S+sCCV16rhQt5vtzRIwmGdyjBNQHicg3MpbwmfysvlI901dCnESucn2RYXrwoU61VCee6fTiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=if0hF3GxAUBVO35eGIyHkZHDHlejrCNV7AU+qACADGU=;
 b=q1LdWdQgmeUYik5JLBvZmUJyp6ZRQyRHNUXRn5bNQAT9CDvnKPg/CIx+1LIK19fQ74yqPRxrrkhesnzaOvA0Rr/uCjlEGnk8AcGGkUEXCfZUJy9dk08it6L6foJBAV/UdEhh6PNuJlJuHnK60I7vKQV1Ldq6a3F+Au3yGJ8OPRnErmaSlAz0MAxP+tfB0GwcaPUe8jkkfe/tXvPovRdi/d0iCzOTJdHsIs9DxWXu2C+2LDi+KYAWP1nY+9NKSMBhnchrIKygdqkmSYP58/K4A8uv/tgops4VgMajs2SrblQsVCXWSeXV1e1z6SCVmnWuvpZw/rwqNVULQoU9o0PSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if0hF3GxAUBVO35eGIyHkZHDHlejrCNV7AU+qACADGU=;
 b=sNraMNx9CjBpdJw/mLaROB1/h8uwLxQnbma6iWwoIY6xRAZdiKy2euHnetdTVZKWhXcNm7E4U1XJQJULztHn81JGnmTjRpwSxwUMIcmOUKnvw0QBdPu3/QVq2uQcIJBdrmfcTgJiNrg9+9fQMKv4CPS8TlUXDsEVQiAP32yrvxM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10151.eurprd08.prod.outlook.com (2603:10a6:20b:628::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:16:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 15:16:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] procps: support ptest when TCLIBC is glibc
Thread-Topic: [OE-core] [PATCH V2] procps: support ptest when TCLIBC is glibc
Thread-Index: AQHcp7Vi+wgxj/poZE6C7vnPaEwjk7WgFpCA
Date: Thu, 5 Mar 2026 15:16:17 +0000
Message-ID: <5CBCC8E0-6F27-4C8A-83FD-1E96B5EE8CD4@arm.com>
References: <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
 <20260227064932.518801-1-changqing.li@windriver.com>
In-Reply-To: <20260227064932.518801-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10151:EE_|DB5PEPF00014B8A:EE_|PAWPR08MB11016:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aac6742-690f-43ff-23eb-08de7aca4c11
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 DLN6HFUN5Zirenle8V9p3Hidv0X0eR1/vUihzWsuR31MdxJfAOlyfRMu6IGjO2Fh/OUzu/81YyKF5+r8wLK+RBnXSymWC0clCz8q9a85yUrxfe4N1+9EepWnMgB2ZnELU1RKDHgRV3vCJ9yjqttOhG+sbbmR7XDuFpnmdXvVnzmzyOJT0R3AOpaQvlG0eJFabDmwjO2j2I1vAZO/GHa8NvlvqzlzuDhRcw3LiVE/slcQ9RoqIA7Yl7TblBijsPmyJLg9v+gWsv9xWSjJUAS2uAK9MntJbQKr1USLJPbP1pSKOhMi/wB5XcsqHZJ9xjbHRnnXwmfFjIQmRXQ6hB8gNySbJ7aztm4rbGBdSFBJ8ZBgrfj1yDKKT3Qr2gyjbMialcC/Lg3hcPRbH218Fk9nV2qLBBdDuYOYfjg1V/PLNcoHS/FQKtiGmXQHjdt1yPW/PNAihe0pzjAJVxtFlwWLoxILwQo3PfJCG+cxB68gCIJK1/1FQUeHcjMBIFy7NkJ9JGpwKwoJcVJQ5o8AOPeTlhxoP3YCgq/gVOUVwYVLqnFXySjgAJ8PetNvvcLEe++2E+tDqlBQD92zVNufLuPfB/BJNXScKFYy5t6O2w5pCcFwl7c7y8YXX3k3s8SOLDrgiREfIyqKBeLlWYw2Fj4fMNtA/FBL8NOfjG/sJIPGy4M973x5m+l1hbLPW7ahNjZ3Y7Cg5utNour8aI/wVCqmUaUwjjU77VxbUBFSnHt119JjombRzLe++6XUFiIH9FlppIY+vmYz2WauOq2Wb/Eh73nV9O585IncIjrqz7NMBNg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67755E8CE7536444A09FC09DFB35BE1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 omNpLT5C/MOXbnlD51jNtOI/AdgfKBvyZYUKRH5dRbMZaMA1QgmtKJUcjQVixYFL4j8/PDW3Hb0MNBZ9U9snYKUnqIQaWmt61sUJ9jvYyYu0ehuFvdYfoQqfvzGanPP9sg1GwRvJNAVUPwKNIosYYat5up+oucEcZ4YLkIXwAmY1/s4oXchDyypGGRoJO2MUSSoSkNPJMkdIpd37FBHNTOatuFTrI5FBQg1Zw1kbE21I/dIU0uhCdpxdnXs3CZoN5U1nga8DHnm219m1/h+xg5tNx4sp5p+eliZ7w8WAUgcgGJNkT0RkfoCKOCMvLdcJoKe9oARSykdNfh0TcAwH5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10151
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1b3a3596-8e2f-4f63-c01b-08de7aca2627
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|14060799003|36860700016;
X-Microsoft-Antispam-Message-Info: 
	0Qsx3uZA7tgRWYgU5fvxZx91tlVwmha16zw+eAEIZgq4kl/jbOFigbhhUg5rzZD02io4tchTW3nzP5/MiAC85fxyCSaioNy5OkNH7WwHcIP5e4ccOYJF6A7oKPB/c0tmQT6QRboSEYRn35Bss5Daxj+7d2tHQWMigl08WK+atQ/xphtXzDH/zpcQeO6R0EiNwiWVOymBwZzqVVxo0w2vqBJozZYxJt5qpqbR+CgctQKfhdjKvh6ZlKzsk/SIC0p1ngrZUQWT2Lx4yOZHK5RpV0t2jcFIT1J+NS0IiZK2ZTC2zyk//kDCjClFdrjA/6w6vynmyXB3C2HUgXIxghmyv/p/0LfxVU/l0MNX7mhPsvmEh/A8BfEojPEvxTg8NZyr0fooKM+kunitEZP9I33Wd+W914YGaSiO+pIRslmZ1HPeUxTWM7nVgFaoUir9/ZzqpsYlTpxvJM2WFaOa51qRhQdTIdGcuEsBaEGRpQpm4Jpm0jQawXt2aUQf0SeyCmVQ7vF5ZjADg9Dya07ruyUrS6xwaKWWEjPt1Zu6o7sUe7YACvQ1d/KgwVUmrf4AHSleUuUqV9XEGNXEwu8QmfFUFYOHRO6UFaF02qtG/PuPwungvHFHOQ+ejaI1wrfr/qcEwjndO2WM6nKwvrVvWwmDEZkDc2nSEWM0DpOAe0FF8gJbLYspWaaQmv5cnKXnlfm6toPWlvRWM1VXgTp5FH+wv9FZot0EXfLSCohsxZYPa72l25vOUORNyQiMM6e4JrM/g3De/o9csRQO63LliqlbMQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	R1XPiddSrPBWH7owaZMOzO0oxAtNFFvWSPG9nAhmScfAib1kuZ4Y/JiO9i9WhUbdnumNVRIfB9Nfl/RogBmaRP4YdPIBGUJyRdl5ZO2raEd656OlwzNYYitzDODMPtwMBglVGGEBLRcDt9QOybqKN39GOJdukT2WC0pLN2LQW9gEeuUdA3BKqpYutCZ/XvAWzasp8rglMXmRJxhF+imo0mmV3gLtoOKl11Ke08Zv15kG854QVikJqMPd7WyT/cKxw6HMZyP1Ua1AzP9I05Or2bn1fH1qKxrKW/HNm7olRZBX0/eq9A0b9tFy941y653MDpi0ZhC7JrJB3hhwqHnRZ0QOLxtBRnbOOTruEa9Ua0Y9HhfKeF4CgZXB7fHadnmiSBxYYhvkRrMmbcyk3C0vTLPdL1j33gQgaSnIAhs3rChaSv+8fUriCV6EtMo3qt9K
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:17:21.0899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aac6742-690f-43ff-23eb-08de7aca4c11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 15:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232499

T24gMjcgRmViIDIwMjYsIGF0IDA2OjQ5LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAtaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwa2djb25maWcgdXBkYXRl
LWFsdGVybmF0aXZlcw0KPiAraW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwa2djb25maWcgdXBk
YXRlLWFsdGVybmF0aXZlcyAke0BiYi51dGlscy5jb250YWlucygnVENMSUJDJywgJ2dsaWJjJywg
J3B0ZXN0JywgJycsIGQpfQ0KDQpUbyBtYXRjaCB0aGUgbG9naWMgaW4gdGhlIHB0ZXN0IGltYWdl
IHdoZXJlIHRoZSB0ZXN0IGlzIOKAnGRpc2FibGUgaWYgbXVzbOKAnSBub3Qg4oCcZW5hYmxlIGlm
IGdsaWJj4oCdLCB5b3UgY291bGQgYWx3YXlzIGluaGVyaXQgcHRlc3QgYW5kIHRoZW4gc2ltcGx5
IGRvIFBURVNUX0VOQUJMRUQ6bGliYy1tdXNsID0g4oCcMOKAnQ0KDQo+ICsgICAgICAgICAgICAg
c3JjL3Rlc3RzLyopDQo+ICsgICAgICAgICAgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke0J9LyRw
ICR7RH0ke1BURVNUX1BBVEh9L3NyYy90ZXN0cy8gOzsNCj4gKyAgICAgICAgICAgICBsaWJyYXJ5
L3Rlc3RzLyopDQo+ICsgICAgICAgICAgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke0J9L2xpYnJh
cnkvdGVzdHMvLmxpYnMvJChiYXNlbmFtZSAkcCkgICR7RH0ke1BURVNUX1BBVEh9L3NyYy90ZXN0
cy8gOzsNCg0KSWYgbGlidG9vbCBidWlsZCBhIGJpbmFyeSB0aGVuIHBsZWFzZSBhbHdheXMgdXNl
IGxpYnRvb2wgdG8gaW5zdGFsbCBpdC4gWW91IG1pZ2h0IGJlIGFibGUgdG8gcmVtb3ZlIHRoZSBj
b25kaXRpb25hbCBoZXJlIGFuZCBqdXN0IGFsd2F5cyBkbzoNCg0KJHtCfS9saWJ0b29sIOKAlG1v
ZGU9aW5zdGFsbCBpbnN0YWxsIC1tIDA3NTUgJHtCfS8kcCAke0R9JHtQVEVTVF9QQVRIfS9zcmMv
dGVzdHMvDQoNClJvc3M=

