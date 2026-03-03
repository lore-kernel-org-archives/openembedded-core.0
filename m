Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F40EEDA6BF
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:32:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24201.1772559130189087569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 09:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rJcN/2zj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rJcN/2zj;
 spf=pass (domain: arm.com, ip: 40.107.159.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IjWoQU2G+hIGtRnrvGCnFKk/DAXQwreSD+rxc4iMLiEr7b+n+xbcdkVfGBIbyVN7GlSZRo4fQtLWl1t0ueQT7Zwb4OLMozBzW3OYZ/+ZwXgqh6rdgktICbUc/QaAt7b+Ypfg5kDlDVr+Cp+Ur/nedUaBT4p0mmWgoF1+OBaVbOs0LHCjdLApUbYWUlXLtVJcjt+3lyZh9KuJqz8+G9tu3T9OtRri+UkYw7LFLpOGRbgNHIOS0mpNqhbQ5tbCD6mo8ki3xadMVa6ij7qLTNnelmVv8xdIR+1ER0cmkUC2otoslUP2Kr4oYjjTS3mG9eR17cgseJ2WTArByCQpun4eQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw87dl2SkFsVflOKagwh0OilVc4lg64y1/XAW5OwXGI=;
 b=v2n2pyiLcZLNQWURX0jdEQUCDhL487/JVHwxk3Pus7Uh3TUM6kOKmMtu/WILH3vwX4ab68J39NLD6lSXV1+0R9ipLwV2n/LAsYrLVIj0TnRDdHFGImGa2v5lcJWbwrOB771EL9WVeEQf0ef2FQnL9OT5bayNbQwMJjMoKs8Hhx2/lWGS21hiFKHo9DRjR95Agte6CHijBXzUIKmynDn+UqDSy48FDGtUCQW1qUFxlgPvVmYOxaQZhhtSaWixlfvRP6NRvH/Hqc/Kj+xCi05eJ50RT6DpqG+Y6StBVM3efFlty3vF80g7KY/529YYryy1ydBsx1Satkp9mJJCIyA8hQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw87dl2SkFsVflOKagwh0OilVc4lg64y1/XAW5OwXGI=;
 b=rJcN/2zjGo0d5KTDw+kInwm4XxHzZECNset+JsEbSH2iv5cfYvOYp1/XQHMPiOj1hL4ldIIgK8xHZIK+yfq+YtlPpLmfRUVoDs9SuZ2n5vm2OaiUWIX4B7Ov5vVid5NEl2tGZZlWoKEh2Qf75w6H/6GoC0WQ9ib2meziQovlZ28=
Received: from DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) by VI0PR08MB11383.eurprd08.prod.outlook.com
 (2603:10a6:800:303::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 17:32:04 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::8e) by DUZPR01CA0334.outlook.office365.com
 (2603:10a6:10:4b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:32:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 3 Mar 2026 17:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRgqB7C1O4ISN02AWfAcrAEfZQtKC512lqh9r1dH45Scd28tN9zBVod7oH25CX3WD6ea1acBm7qx5q07M4jECHEC90q6Vbgnc7ItHTbd5DMw0cpgxvRVxq0DB9QG9DlTnXOBCHfdztnghqFlhct596IfMavnuoDslC6qyk2PSdIac+rJ0iDEtH6geZVE2PlEytmJq1if11XKnFor2YgbR+zxdXuYWvcY9xzLUI/LglZn90FAJ6IsLbs66st6psSONoSeRd3cCnIEL9+XY04yZWqXFPrk2dCdjJAuBp48e7JvXhezNw6ba/3HwrLnbFbN3GUfBwvaRa8gGRsHq6xg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw87dl2SkFsVflOKagwh0OilVc4lg64y1/XAW5OwXGI=;
 b=oLX7LExyFw+JfZezFrLLSWWyzKXqYgKDx3hZQkdYstAKKII9PRdUyxO+/4sZC7ByJJJRRXGZrz0Js2LIl+gPQJncX3wDIVHIXkC+VISjOWLkFoWIln78qvlrmdduZOGLD2W4/ou7norp5ARShpPjKYddQrWsM6wIXtOMLeZirAvJVWVnc2QNk6qxSkyWzeVSdTHuRpSUZsVcQNCxwuZrKiAFZwipPsBTdO6L7XiqTu89k4/3sg7WHU70we/8BbVmALZsZGFh3ooTQl/ogmrSfJ8AfJK8gdnSBn0kIGMN1Xr/v1fadmw0r1+qLb087RAoBFSFhZbB/HVO2yIC7ASi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw87dl2SkFsVflOKagwh0OilVc4lg64y1/XAW5OwXGI=;
 b=rJcN/2zjGo0d5KTDw+kInwm4XxHzZECNset+JsEbSH2iv5cfYvOYp1/XQHMPiOj1hL4ldIIgK8xHZIK+yfq+YtlPpLmfRUVoDs9SuZ2n5vm2OaiUWIX4B7Ov5vVid5NEl2tGZZlWoKEh2Qf75w6H/6GoC0WQ9ib2meziQovlZ28=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7809.eurprd08.prod.outlook.com (2603:10a6:10:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:31:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 17:31:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] ffmpeg: set status for CVE-2025-12343
Thread-Topic: [OE-core][PATCH] ffmpeg: set status for CVE-2025-12343
Thread-Index: AQHcqPulVpvHFV8jGESZA8jSHP78E7WdFP0A
Date: Tue, 3 Mar 2026 17:31:00 +0000
Message-ID: <D26AADEB-67F5-4B16-8F16-1A0C6079FB9E@arm.com>
References: <20260228214501.451765-1-peter.marko@siemens.com>
In-Reply-To: <20260228214501.451765-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7809:EE_|DB1PEPF000509E6:EE_|VI0PR08MB11383:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff981af-dca5-4904-c292-08de794ac93c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 Z362NuJ/qsJJLS+Va5hEAiGExVcqY9ge1bHOtm7lmkazJhyGkraqefsBZuHw8J266bUysaMYSi8IIrFG3PQo9yE04l5Y7zR2yPx0Fd9INWE7NCnEDZQKH7jyNAIiqgVSMMKPfxXuEVzBBgehoTPIhOe16tQOe68EuemNXWF4/2tseH9iE0iCxyeX/jWA+p6lQCFMW7ST9ByauFXLQReZMaE9KMSW1VLxKwFBpy+5UYubFGCRE6QW4nWWO2LFPIkdIXt2OVCGtQpMJIHerCzWoH4R4XTXVpcRU5HBI2cZKcb6INuJuoCmI+Tj7H4JYScEZCz/FNiJI66UPDwBQojNNuNSPsr90edxqpahEWJdGNrrO2MxKLMf+NGeyKlK+VoktGEQubGfnxt8Y5RJ0WXmMMWLeehT30GJNMT425zpMDPv7XvV5fRr4YQdQRweWz2vSgTmTz9uDVov19ZluHlOJzKw2LgI6y9NDWhSdp/dKiPSM7teLHPg2skh6KQklgrVkypvqYe39YmopLU1ID7gnN8su/UQNxxrF4Vvnx7UYdCSDnR5r309dOWoaPcNFPqzZvKuk4aI5KAZeWSwBKVxy7mbdxnF+BiwsBSPEYc8Ux91hzwaH9DQ6BPkl6nrOTY8VOEhy/q8Iej2/pMsZkCXv32+sjS/JpBNq7LX6Nx30Jva6bW/kmt4Gc8e0fZRHO3EiVS8YOBV+ySuMl4fRqYrh1/eGNADH/bxl+iZ+//wZa7TMBEfRuWLQiU2NmVE6Ryr
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F303E9FF999AE74BA3DB7E3BAF7E0BF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 iIscAbLsT+ViMSeuyiq9KToWVK4XAsxHeG1zKbiE7Quchf6HaFHYjfZ37UZNCoV8NBcnq8CyzOUt+nf9qAPhaVSdaYtS7rngMGxhIjLKX090ksJ0aTm9nPoNAHqRo3ij37yAqMMiwC2IRmp6FiOk3etaf5QyVljFjqw/esP4umnCONYJqplavk0xx1B3oPzSlYUISIMyP16tlpy32facTxp7SjUpq0rXw7teeuTO2I/ZGRm7pc0Py/VShD8E0Flyhld3yU+4u1UN7bYvUtcAgNjvvpuN1iVHeiYg8ySOfkTFjLfchuhE1tGr6efggzYLV4dBXkMFpj4PWS36gusEWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9513cc2b-f8a8-422d-688e-08de794aa361
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|376014|35042699022|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	HDntqjnLPj7GgGrRzeD4kJO/xURPuzsk3w94jhFM2lTHP7HhYo6lZLLBEMVfVdfg0YKdnnLxI07pcCKwyAdthMoMfcHfgXXNXL0i81DVZXBtW86kgxGXl16ORIoHZFCfM0KSLWXiY+r/ssXiECKxgCpc3GR5v8suhontspIGFbRtWpWgETRSaXpfUaDXau24pkncnHJe0eml0JROrGg1S8pnX/H3ER/9gfpLQNp1eHJrv3G99gPoBlWC37CIlcY6A2qDK2pP30sQLRJI1M3yqkq1XxcVv9TY+HnmEvVyjaEZTUyDbJ3gwnJsKidkR1RQkj+BNnSCWtB+vaT67PNfIY3XhOAPdxvD68pnACKaHqVk0+jghlRuDb7/cGDP3BYBTWsxaHp7f7YFTkBKsv8GQ8YTzWdKcG7HBfq4u8XrJCJCWYlU/RHX/JhS2NSdqpdUIQnEgKqxAJrskg2KE4j8uufD7OkJ4muv6guh7uH7jotatG8hkn/QtpPYvRtnJAtoAmwOBEe1z03+ZvsKj2WpjTsddJ0PcsrB+KrqxzTnlOqFy/2BaZ6ehx0P94v6+GZoxSUj1lBpIjhylwT75V5l3/f+fUvJlboCsSiWX4fSZySrDr3KixIMVYdPgEzo5Qdkyan+yTzu+c0FAfDXHoHd39ijX9fBLVJksXAKGvqhHDdk2vnlcCVfQlI4l7yQKqtRfgUyNi9nfF5lBJQlsEeAup3VGncDUP0X9mMnekmbhY/mKisfj8jpOOWjZY1gRTbHKx0g2fQRLZhNIbPYJzTnvg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(35042699022)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5mbd56cjPS1gpYnjZlSoJNp2rFv0Mb3MsQXKiCLBvlaGOQXU5tU2/0ELWyS0RYVal7vS4nntUkJLaQv+i27BeN3PAU41AVv5LWHSheFx40zq4w4+YxAK5sRus5VDEsB8JdNu0wx5Lj2rGQe7mmTyMs4DPDI/h9ifb0aj5rzbh57+i7KQGa5+ZX9qpQb6iLJvmJ996Lfui17fxUBTdt7C4heq4FAxwiRA4tKr45Z68MOJiCV2C7zDiadpExxOtSH3itewxY3MbWhyk8qEsjQxEswnBmK/BrjV8Nw+aDG3mWyL+C131xi/kf1IWVJm2i5LWFxVigygs5vNuG0Eu/MntMA2hotOknqfFCV28Qb6fd2RF9lwS09yz06j1sW8VEAPYb3pxCCREz75bBf/VLW/f/w7fX4x7jIrOQTsdsWcc8ogmtpr4c0qc3R2azoHPSXa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:32:04.3408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff981af-dca5-4904-c292-08de794ac93c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 17:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232333

T24gMjggRmViIDIwMjYsIGF0IDIxOjQ1LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+IA0KPiBQZXIgWzFdIGlzIHBhdGNoIGZvciB0aGlzIENWRSBbMl0uDQo+IFRoaXMgaXMgZXF1
aXZhbGVudCBvZiBbM10gd2hpY2ggaXMgaW5jbHVkZWQgaW4gbjguMC4NCj4gDQo+IFsxXSBodHRw
czovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDI1LTEyMzQzDQo+
IFsyXSBodHRwczovL2dpdC5mZm1wZWcub3JnL2dpdHdlYi9mZm1wZWcuZ2l0L2NvbW1pdC9iOGQ1
ZjY1YjllODlkODkzZjI3Y2YwMDc5OWRiYzE1ZmMwY2EyZjhlDQo+IFszXSBodHRwczovL2dpdC5m
Zm1wZWcub3JnL2dpdHdlYi9mZm1wZWcuZ2l0L2NvbW1pdC8yNjNlODE5YWE0NWNkM2M0OGJmNjg4
N2JlMDJiNGVjNTA0YzAyMDQ4DQoNCklzIHRoaXMgZXhwb3NpbmcgYSBwcm9ibGVtIGluIGN2ZS1j
aGVjaz8gIFRoZSBDVkUgbWV0YWRhdGEgc2F5cyDigJxmcm9tIChpbmNsdWRpbmcpIDYuMeKAnSBh
bmQg4oCcdXAgdG8gKGV4Y2x1ZGluZykgOC4x4oCdIHNvIHdlIHNob3VsZCBiZSBtYXJraW5nIHRo
aXMgYXMgaGFuZGxlZCBhbHJlYWR5Pw0KDQpSb3Nz

