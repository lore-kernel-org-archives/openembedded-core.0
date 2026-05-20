Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7B7CD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 16:03:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16001.1779293017137020536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 09:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hBIYMQO3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hBIYMQO3;
 spf=pass (domain: arm.com, ip: 40.107.162.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nxj1MryVK0M6yS7brfU5T4MdIWzHBNoEJ/nrXSooEMFKmvL1TN0zay58C5MIwCASkp8EQS2hb6Jz7ykfe/aMT2yDPva5pxtP7sxfUCehp194U52vZsLvTD6vh17jf29kM54KQq+U1jmQOqfKMWzocvZm2poCscQduf1wBZU0CoLo4BVbrt77T8Afgr8mnL3qAYi1i1UXyv/fdjHwJTLrx2kcnzjBXQZ+5vhazecGdJLcXAgVOIrHKOtEDKfuKIXPf4NKGnkGEwot9nPzdwONZZdq1RHv4OtbdCXCN9ORaY/YJj2uaefM/jA0jpKh/lp2EDAXHJUhUbTJrNAOGXJApg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PafI1A88IhxS/NaoVoOK3k2eCgxUIeklY8BtLowxIUQ=;
 b=wBKeTQgHXVuHUKpCiizc65k5kgPSnJxXQSoSVs1ZcMKMhXznA9JlMW1RVtwwoeQ9yo7x8OyzNqxN/iiIgPtAJ7sYZyWns0V2/KycwIxyo83D4/BoCJroiZSOqaPTw/Zp2oAZw7XSkfFf/Y/QgUsHfzyUj2/Vgu2oYggSB512Ucerh6gBGBgr8jeOz1/62WBuybNhaAod1u1snc8weaai1pg38leeIydDTfFW348rj+ZZY8K3akEZZtRMvlw3HGswqXHUMlW+fsKUTKp8iuLiuYPQgHZNUGUp0dQGSQvECkXDYIfTGO2BaSTEMr5ZRuBCN6afHhPBxHysGYBruWwZhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PafI1A88IhxS/NaoVoOK3k2eCgxUIeklY8BtLowxIUQ=;
 b=hBIYMQO3T8s08mYJrNpc2D3IW+fc6gHmdAWtGvFIt6D2Win5RMlktUt/5NGjanFuF546becammR5GhAg8yeQ1MWMguEVe3ryK0Ocn/+QMYFaGBAiNGFotoRXnwg6GzdCFKs1vLcYZvzKZRtE0ynxrbLqG2uhpa1pD8Qxt7wWv8E=
Received: from DU6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::21)
 by VI0PR08MB10848.eurprd08.prod.outlook.com (2603:10a6:800:211::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 16:03:31 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::82) by DU6P191CA0004.outlook.office365.com
 (2603:10a6:10:540::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koh15okcKXgHW0f/y3KfKGkJLwdv4HoDnlrRZeXO1qcOmWoX1w6qM3tUfcPPe3Zl0TqcoGFiw0+iYojIxaQTt3WeWKNcQ0+fP8srC1MIFhXfpW4zPV8uHlVRsWLqUZv4EmqNKepEcbIv5HEcnehqYDHg0EY10fB8PjeHK7YaZ5mEe0gbR8GBUxWGEy9rXlQ7eiKetNAh7B+HgS7FGwzbNGro6xkkJwrIlRGaAjowus2qYLa30OjNHmVKFGGXi43+0J2DQjP0jURttKb2iWA9actVzn6bxKfcUrZim5SNZWLAQN6d1NnaAtRUCt5V6IzDBb8xKUgNrCFa5E/U18McQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PafI1A88IhxS/NaoVoOK3k2eCgxUIeklY8BtLowxIUQ=;
 b=kpc3V83aZrJE1n8p4USnNlVcJ4Sn9pTRP9O1dr4HJjO+V42K4fxyPvqI2lNnfQIv2JqkxFgALbNuCQ42dxvNSyvJBb9JfOe4aRsRQIytSwCVFe3jELzLhrrnAiIeq+7UrWpFAHXzNcEKofEbdX8rII1yA6vM4FqnFw9S4ArG+H2d/MS3evQmJac4aEeL1oV+P779QAMyXd1N0xjGktxEPOrWzxafIbZ+5cCGVpHoAdtGvhI3K/snbemAtxyJOC9Kgrv0JbZYu7SMTpLC2T/vbAbI3Zynt0iuAHWJml+w3GBRSibiclmSD0g1M78Ql1Zm76gjT7etKJ0+ZxyBQZdFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PafI1A88IhxS/NaoVoOK3k2eCgxUIeklY8BtLowxIUQ=;
 b=hBIYMQO3T8s08mYJrNpc2D3IW+fc6gHmdAWtGvFIt6D2Win5RMlktUt/5NGjanFuF546becammR5GhAg8yeQ1MWMguEVe3ryK0Ocn/+QMYFaGBAiNGFotoRXnwg6GzdCFKs1vLcYZvzKZRtE0ynxrbLqG2uhpa1pD8Qxt7wWv8E=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB11768.eurprd08.prod.outlook.com (2603:10a6:150:302::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:02:25 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:02:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v4] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v4] libffi: add ptest support
Thread-Index: AQHc4txddRhDbroeXU6ZezFeDD+qxbYXHlSA
Date: Wed, 20 May 2026 16:02:25 +0000
Message-ID: <C60FBD30-1468-4A2C-BCA1-E4C713F253C5@arm.com>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260513132756.27283-1-pratik.farkase@est.tech>
In-Reply-To: <20260513132756.27283-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB11768:EE_|DB1PEPF00039231:EE_|VI0PR08MB10848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6e39f1-f9a7-4780-abd3-08deb68956c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 
 RPfwtDzffcxqtPvcIEJqaishTSNa5buziRDH5ycG/5iaN/ywM2pjoPVFimpLKNYo2zfA1r7if9A84He9bJunxjAm6y0qEHYaLiNGeg1jZme9H39qFYUrYPxuG8EUTIpsEyRaBN4eApdwP0vfnfWb1zOcVBNDpq0k6LqzdXNvEvU3U5RpIJ77CpQJmYLNDUaqcZ+U4FRLB/QVaEe+JuiFArOK1JPQJg+pJaPnu0DukC8/mnWDhA5fEnfm25/BCvZ3R6NpkC1hTRwG4USsShxC6I04Rho6C6yMQYFrPZJSP5UlyfVMSeWt0IxPnqsWDH6KkS5nrC4zUUew5GL+q0G4UJEl9l7TJDHyLE4w9/CK29TF+v4kWJuyxFLAMpYfG98RNzGOgrzOHk+c1jAtaVcYRD5uiE/JcwIDDzwXH3e71dERRGmwapwLJZzd4FLL5JT55p+VBwDZOV9iPSAuVjeT+/9pxzBrWmeITCnxb7BDev+7x6v1ZktAcH1xiejrWhkjDSKFpu9LagtX6oh+NxAZw7CSTZkJ0XIqPLPvT2WlQrjTbmZL0mWBKbXLnrj77RyfGkkWZ/hiWhDF63y5ZmTVaXlhRZX9S2h93ggcNbwwJnuJPbFd4SBoZsaWrB8o+62O8SM1Qjw8IgUrf+qoyKuxLsI2ulK/e6Zc31V73ulV3GjGhb528X6Xm3l36jbPyltN+YQjTDHDjas1XfUKMB/9ngQCFXye8qQNb0bb7tj03eEIN2OH8A+yWAnSFE80XFw+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE3FA601AF7C2E4F9CA0CD4B6BE16682@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 b80uKKmJGceCccGmbTKH4tZJMtAJeRosMjJrfBF4eEAg5grTo4CPpECDypK1Ygb/uVmb/WbB1mXSK8eHIiAjvm6Km1xn2/6DaQV1B5GJ43c/Xq0LgdhThm9hskOalsyhsQPuI8AxZv3HLyj6lBa78UQNItXMKrQbTKkZ02XA6rPeoH3aRWAK2dmQeBlXy8Cdzm9GfsXrsbGyK29kB5dvSmclOWSODYHEwydgoxFJztpKVuB9ZAhbvQVV6PPlhyFa/57CXzLKbw/mVYwruwZQhPgwKDAkmOrUG8QUfLYmfFuplFYVCyuixwlRWsU2/NGAhJz9B2YkKI9JfXosvjdJfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11768
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	764a7101-3459-4703-7fcb-08deb6892f73
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700016|376014|14060799003|1800799024|4143699003|11063799006|18002099003|13003099007|3023799007|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	HOrTvuk+rsn/gj4gUcpHVFrabSEHoHUKnMjGY0CC+UUiRovYiwHoYGJLOiLENshdEgmGNPN0lJBl8QnTBSH1sayC/0MoOoVu944Aa/H/v5Z1wMKa9G1IbJ2+SjCB3RP+rtbe7MA7pU2ezG0FmJezDITapIfvpmyi+y3rsKVH5uGKbPfZlbgd8TwWYrD49+k9BJwHnljBxUvFUdDitJ7xSbtJwysWxBnyQ7S3c+eymAwVc856f4Cm17216coOn2+cmYF5u0WJTgxfMnhdwSptyCyFGExfM0lqqhajGWlrPkjr3icIm9ZyyJe3y96Qt7fEZHQslYMIhZ2vGLM15CpDYSHEbJlZN3zj4zcb1+BSm6UUMUEu+2lU5+bLVFSPnSYM00NZkHXIElPV8uLAA4PWXZ8rddQoHar4fe1hjzICd+l8fVZBf/QPiEW+M12si4HNo1IxTi8f1ZNfcwvPBrqCnr6qq++EVFGmKjACUyVjbuF8sqGLgN4thBGlzzc1lErq51IzwiwIiAYGXZLqvUuXrtDd11aTmYAH6Zl2uxR2gibZaILLjsUAJy3cm48gOrelDM7kmtMp4WomB9+k+PyVmiueuCcjDiPhtRjTRC2ZB7W7cHWBUv/V/yDcVCeIKyTU0/wv7taxMNpKSfnPeWgp4mlhO58Bl4SU+U/o5VGjcHlTlVpLmxjJK4MBb4tvi/nl
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700016)(376014)(14060799003)(1800799024)(4143699003)(11063799006)(18002099003)(13003099007)(3023799007)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kUbnD4miiD7LIeeyWQC0jkMF60qfw0NhPIXhVqWRvuA9LSypBXsE25nZ/NwP9mZY8b51ViBDjSSRLMp5mUdVyqZUfyJ/CT/vUKwfnMzPML/1hvpoWrwPr27dq5PduKXR0lA5ypWOkCcsezMRd2sJ7kyS5lfQDWA8YD0nUVgc787kdV8Jl8n4CbqB0B5XYGx+JUXUq2UCR7xW1lFPRBAiPN3T9mzsJnRB663PQM9BvE9fLsvCGD7QQ7ciSlL8LmYvkdTXYiIPNEz1IRCmDtseQQ+UYMUi/fKLTujrpNBgj2sXUVJnxTvLbUs5JFWrB8s6YB/bQn0ZougPgKiHs/AdZuOCnWJ04cxRO6TqG9pWPvYInEuif0+6JBrMD1hhP0cWzHVTDkRzkYMih1x24tuw12IyRq9nqfmAOf/o5y93V3wY1ddH2qtvvEvmdvGN/RlL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:03:31.4916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6e39f1-f9a7-4780-abd3-08deb68956c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 16:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237454

T24gMTMgTWF5IDIwMjYsIGF0IDE0OjI3LCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBBZGQgcHRlc3Qgc3VwcG9ydCBmb3IgbGliZmZpIHVzaW5nIGFsbCB1
cHN0cmVhbSB0ZXN0IHN1aXRlczogYmhhaWJsZSwNCj4gY2FsbCwgY2xvc3VyZXMsIGNvbXBsZXgs
IGdvLCBhbmQgdGhyZWFkcy4NCj4gDQo+IFRlc3RzIGFyZSBjb21waWxlZCBvbi10YXJnZXQgYWdh
aW5zdCB0aGUgaW5zdGFsbGVkIGxpYmZmaS4gSGVhZGVycw0KPiAoaW5jbHVkaW5nIHRoZSBnZW5l
cmF0ZWQgZmZpY29uZmlnLmgpIGFuZCBhIGxpbmtlciBzeW1saW5rIGFyZSBpbnN0YWxsZWQNCj4g
aW4gdGhlIHB0ZXN0IGRpcmVjdG9yeSB0byBhdm9pZCBkZXBlbmRpbmcgb24gbGliZmZpLWRldi4N
Cg0KVGhlIHBvaW50IG9mIHB0ZXN0cyBpcyB0byBkbyBpbnRlZ3JhdGlvbiB0ZXN0aW5nIG9mIHdo
YXQgd2UgYnVpbGQsIHdoaWNoIHRoaXMgZG9lcyBub3QgZG8uICBBcyB5b3XigJlyZSBtYW51YWxs
eSBkb2luZyB0aGUgY29tcGlsYXRpb24gaW4gcnVuLXB0ZXN0LCB3aHkgY2Fu4oCZdCB0aGlzIGJl
IGRvbmUgYXQgYnVpbGQgdGltZT8NCg0KPiArQ0M9ImdjYyINCj4gK0NYWD0iZysrIg0KPiAraWYg
ISBjb21tYW5kIC12IGdjYyA+L2Rldi9udWxsIDI+JjE7IHRoZW4NCj4gKyAgICBDQz0kKGZpbmQg
L3Vzci9iaW4gLW5hbWUgIiotZ2NjIiB8IGhlYWQgLW4gMSkNCj4gKyAgICBDWFg9JChmaW5kIC91
c3IvYmluIC1uYW1lICIqLWcrKyIgfCBoZWFkIC1uIDEpDQo+ICtmaQ0KDQpQbGVhc2UgZG9u4oCZ
dCBiZSBzbyBvdmVybHkgZGVmZW5zaXZlLiBJZiB5b3Ugd2VyZSB0byBjb250aW51ZSB3aXRoIGNv
bXBpbGF0aW9uIG9uIHRoZSB0YXJnZXQsIHRoZW4ganVzdCBSREVQRU5EIG9uIGdjYy1zeW1saW5r
cyBhbmQgdGhlbiBnY2MgaXMgb24gUEFUSC4NCg0KPiArQ0ZMQUdTPSItTzIgLVdhbGwgLUkkUFRF
U1RfRElSL2luY2x1ZGUgLUwkUFRFU1RfRElSL2xpYiINCj4gKw0KPiArIyBiaGFpYmxlIHRlc3Rz
IHZhbGlkYXRlIGJ5IGNvbXBhcmluZyBwYWlyZWQgb3V0cHV0IGxpbmVzDQo+ICtmb3IgdCBpbiB0
ZXN0LWNhbGwgdGVzdC1jYWxsYmFjazsgZG8NCj4gKyAgICBzcmM9IiRQVEVTVF9ESVIvdGVzdHN1
aXRlL2xpYmZmaS5iaGFpYmxlLyR0LmMiDQo+ICsgICAgaWYgJENDICRDRkxBR1MgLW8gIiRQVEVT
VF9ESVIvJHQiICIkc3JjIiAtbGZmaSAyPiYxOyB0aGVuDQo+ICsgICAgICAgICIkUFRFU1RfRElS
LyR0IiA+ICIkUFRFU1RfRElSLyR0Lm91dCIgMj4mMQ0KPiArICAgICAgICBpZiAhIExDX0FMTD1D
IHVuaXEgLXUgPCAiJFBURVNUX0RJUi8kdC5vdXQiIHwgZ3JlcCAtcSAuOyB0aGVuDQo+ICsgICAg
ICAgICAgICBlY2hvICJQQVNTOiBsaWJmZmkuYmhhaWJsZS8kdCINCj4gKyAgICAgICAgZWxzZQ0K
PiArICAgICAgICAgICAgZWNobyAiRkFJTDogbGliZmZpLmJoYWlibGUvJHQiDQo+ICsgICAgICAg
ICAgICBjYXQgIiRQVEVTVF9ESVIvJHQub3V0Ig0KPiArICAgICAgICBmaQ0KPiArICAgIGVsc2UN
Cj4gKyAgICAgICAgZWNobyAiU0tJUDogbGliZmZpLmJoYWlibGUvJHQiDQo+ICsgICAgZmkNCj4g
KyAgICBybSAtZiAiJFBURVNUX0RJUi8kdCIgIiRQVEVTVF9ESVIvJHQub3V0Ig0KPiArZG9uZQ0K
PiArDQo+ICsjIEluZGl2aWR1YWwgdGVzdCBwcm9ncmFtcyBmcm9tIHVwc3RyZWFtIGRlamFnbnUg
c3VpdGVzDQo+ICtmb3Igc3VpdGUgaW4gbGliZmZpLmNhbGwgbGliZmZpLmNsb3N1cmVzIGxpYmZm
aS5jb21wbGV4IGxpYmZmaS5nbyBsaWJmZmkudGhyZWFkczsgZG8NCj4gKyAgICBkaXI9IiRQVEVT
VF9ESVIvdGVzdHN1aXRlLyRzdWl0ZSINCj4gKyAgICBbIC1kICIkZGlyIiBdIHx8IGNvbnRpbnVl
DQo+ICsNCj4gKyAgICBleHRyYT0iIg0KPiArICAgIFsgIiRzdWl0ZSIgPSAibGliZmZpLnRocmVh
ZHMiIF0gJiYgZXh0cmE9Ii1scHRocmVhZCINCj4gKw0KPiArICAgIGZvciBzcmMgaW4gIiRkaXIi
LyouYyAiJGRpciIvKi5jYzsgZG8NCj4gKyAgICAgICAgWyAtZiAiJHNyYyIgXSB8fCBjb250aW51
ZQ0KPiArICAgICAgICBncmVwIC1xICJkZy1kbyBydW4iICIkc3JjIiB8fCBjb250aW51ZQ0KPiAr
DQo+ICsgICAgICAgIG5hbWU9JChiYXNlbmFtZSAiJHtzcmMlLip9IikNCj4gKw0KPiArICMgY29t
cGxleF9pbnQgdXNlcyBub24tc3RhbmRhcmQgX0NvbXBsZXggaW50LCBmYWlscyBvbiBzb21lIGFy
Y2hlcyAocmlzY3Y2NCkNCj4gKyAgICAgICAgWyAiJG5hbWUiID0gImNvbXBsZXhfaW50IiBdICYm
IGNvbnRpbnVlDQo+ICsgICAgICAgIGNhc2UgIiRzcmMiIGluDQo+ICsgICAgICAgICAgICAqLmNj
KSBjYz0iJENYWCI7Ow0KPiArICAgICAgICAgICAgKikgICAgY2M9IiRDQyI7Ow0KPiArICAgICAg
ICBlc2FjDQo+ICsNCj4gKyAgICAgICAgaWYgJGNjICRDRkxBR1MgLW8gIiRQVEVTVF9ESVIvJG5h
bWUiICIkc3JjIiAtbGZmaSAkZXh0cmEgMj4mMTsgdGhlbg0KPiArICAgICAgICAgICAgaWYgIiRQ
VEVTVF9ESVIvJG5hbWUiIDI+JjE7IHRoZW4NCj4gKyAgICAgICAgICAgICAgICBlY2hvICJQQVNT
OiAkc3VpdGUvJG5hbWUiDQo+ICsgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAg
ZWNobyAiRkFJTDogJHN1aXRlLyRuYW1lIg0KPiArICAgICAgICAgICAgZmkNCj4gKyAgICAgICAg
ZWxzZQ0KPiArICAgICAgICAgICAgZWNobyAiU0tJUDogJHN1aXRlLyRuYW1lIg0KPiArICAgICAg
ICBmaQ0KPiArICAgICAgICBybSAtZiAiJFBURVNUX0RJUi8kbmFtZSINCj4gKyAgICBkb25lDQo+
ICtkb25lDQoNClRoaXMgaXMgYSBfbG90XyBvZiBsb2dpYyB0aGF0IHdlIGhhdmUgdG8gbWFpbnRh
aW4gZm9yZXZlciB0byBydW4gc29tZSBpbnRlZ3JhdGlvbiB0ZXN0c+KApg0KDQpSb3Nz

