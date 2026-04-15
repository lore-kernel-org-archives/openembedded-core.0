Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118A0F433C6
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 21:14:20 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5842.1776287654572695068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 14:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=n8Pk1A3q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=n8Pk1A3q;
 spf=pass (domain: arm.com, ip: 40.107.159.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MOkz5/UXbyD9rDXvbgl2oqXrpueO4vhiGAWGs/uk6aJS+T4hx3eMPvN26VP1TS30Jvrm/0KnDPlaN+wgDM0Z8PWZb9t/Ti/IxQxzHdrK5bADqhXQXR+9vzym09wjDRnaLIIBsLoZvVsXp35iQEz0D/fvO92nWRdBXGRWHwj8ac4EaI8xejbXcvcAdHwQlHZ5iDkzKH0LlTITGheYe+htC4980wdfxxuah33ibutUVyUZ5ZNppdue4TwUtMI/ePJ2VUYK0IiUF+vOhu5SrFoTXgiChSSROccFk91k/o2hyilISFYvVfGAm60Z0Ek8Dmc2KAtiWOVEqcsOvyZwUNr6+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHSLDOxBiXin82h5CHoy98fiifAZcuswuybeTy4SDtk=;
 b=LmKYz5F1U3qZMd4Dey/pgbtFEBDJtOu0BC6AOZVZwWxF5Ag32zqi0Vdp7gqtbPxO6wQcCGPL9Ncc9MtRWv0xKYIBI8fpF0MyPVkJvZ8kyqdLNGxBGJPZ6WBlqVHd4EybcMzRQ15KaI9RimJq2io3cEIjP93vKW9n9ChPBhHwbPDV9fYEN947Y+e53ZmuVmVp2BW5P0gDVsrD6jnC8mKhKwQjqsy8yYYYBeVAOLKYjsUpAj56VpMxjkP0PQbQP3MPqrQ0HFyFTlN3lrSmUR5SahGvtGd6GtW0l7zEFy2UKAdxxAw7at0JjEK8FVYJ8zGF8lUW7JAqCn6c1U4+Iq/6Ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHSLDOxBiXin82h5CHoy98fiifAZcuswuybeTy4SDtk=;
 b=n8Pk1A3q2gcZPxGQ2vjA7HNsaEeBiM+bB5XD/nDn2A46isD9ISP5OUz5q0JgCoVgOTNwdg6NJXjGCudf4fjU6HgBgkHz3oxWJCVRl2BFCttOuK8Ecrd5zdYRvfkM61dVqSu22kiFRKBILhRYe80bKiQYA/SjI7hI9Xd1zkbKte4=
Received: from AS4P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::6)
 by AS8PR08MB10248.eurprd08.prod.outlook.com (2603:10a6:20b:62b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 21:14:08 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::cb) by AS4P195CA0032.outlook.office365.com
 (2603:10a6:20b:65a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Wed,
 15 Apr 2026 21:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 21:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC+J621s434v+d38MeBqG4k1fB7Z1LQtF3SLC7k6Ufo5DCyKcVXsXI5U+8pknpPBZKefiH10pgAOX9Pe4WpI+ag2knpKCj6nj09sj1aj3jy+ySOnKJ98oVTr6w4xeiqhQDODkwkdxGHbyvigmr5lNayVtD3jEjZKa9N3chv4KTmiK5P4gjas1UqpDKh6EkW/RgSQ/YqBBlieuo/v6bHJm5uvcmLr59LpKkEJ7/IVAi8Zwlaj2XK6lEd5AHx3oMZXZxajuobWlrTLLKZHO9LZ2n5OH09TT0HOVXdtajvOJq+LWcjZ5kRHDsAv5fVzFSXePAtPkqRtbiZYWRJS2/JLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHSLDOxBiXin82h5CHoy98fiifAZcuswuybeTy4SDtk=;
 b=Yr4MI2aFF8H1/nnmQs1YvO+kRrzVu6TfuoZkxWZH0k7INkRll2PLK6r7IbvKkYXuZi5a380fO34Dd+1QxwI6PSjcesaPIf38EqUCbgqolMB2iWFwLfT3BrwIN+hd7p21XmoRGsm/CYiIJaycyaRhJe78QxZnmaVo3XLkg6Y79dvK3xNU4j3qn9jMiK12aKuffUWK/MgK/Bah7t3WorjlehlXuRw8c2InnPnEI9UlkJjZ/lXB2D898yFpc55mylRnDeUErV546c7lHe15Tl3TsSydleM2dW0fa6VmEBqQ0cPrumqxTbr/hpjqAWeF2HiaHvoGcA5ZBX2wf03R6GT1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHSLDOxBiXin82h5CHoy98fiifAZcuswuybeTy4SDtk=;
 b=n8Pk1A3q2gcZPxGQ2vjA7HNsaEeBiM+bB5XD/nDn2A46isD9ISP5OUz5q0JgCoVgOTNwdg6NJXjGCudf4fjU6HgBgkHz3oxWJCVRl2BFCttOuK8Ecrd5zdYRvfkM61dVqSu22kiFRKBILhRYe80bKiQYA/SjI7hI9Xd1zkbKte4=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by GVXPR08MB7701.eurprd08.prod.outlook.com (2603:10a6:150:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 21:13:02 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 21:13:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/6] libexif: backport fixes for
 CVE-2026-40385/CVE-2026-40386/CVE-2026-32775
Thread-Topic: [OE-core] [PATCH 4/6] libexif: backport fixes for
 CVE-2026-40385/CVE-2026-40386/CVE-2026-32775
Thread-Index: AQHczCdyjkSO42S+1UOBycDgmszYDLXgfqCAgAAiTYA=
Date: Wed, 15 Apr 2026 21:13:02 +0000
Message-ID: <12333A27-B1EB-417C-8D4A-6C059E536975@arm.com>
References: <20260414155652.1214302-1-ross.burton@arm.com>
 <20260414155652.1214302-4-ross.burton@arm.com>
 <AS1PR10MB5697E819CF0D07BC4C21CD11FD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697E819CF0D07BC4C21CD11FD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|GVXPR08MB7701:EE_|AMS0EPF000001AF:EE_|AS8PR08MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f8b77a-f88b-4f8c-846f-08de9b33ee96
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 k2ebJ7gXUv77lBcPDsvGY7J+Sc4BTlYvTjSnYRKe5aIVwMxXBeWeXWKw04smdlJqiZSuGA24x4hoLXU6xDo9G1CaNJImZjifBT/wpJgo9s6/f6hsrvtGJ6SW9iF6olNJ5V9h7SKjipv7vd2gDSZTtD1a6FPcT4E38wl0tDJtkbHHle3856MaaosswCcEj6uN4Y+gQ0+ePr4k6HFw2gYlXxoMU1nbNPh5nMOdGMgqPBbJ5aSflJ1pLiuV4USaq44dqq/O0VA82LVcOzt86UPHo8FtSnUMskdZYQFPMLq/Ma/TI/9fMvGY+9Ib7p+DJG20ADvDMooFXeFo0KW0Eog+6GsyePeUDJYXHGeCMXec4vvGYhb/fXXeGVU06wKG20mnWriP1wtvy20BzFfPR/AJ9MRIRH+rZIL+CluTBv0asGMcq6kg7tlOJRdirSw1PW7qdBVgofK4N/CFjNoBNN1FAt+1MkkO/uWzIzH3u7foTj4QYsC5P4lYT9qL5K561xzMSySoiSKpyTpI+WXR2s0ptpP1TnFFK7MrqqkAekSTCtrrSI02QjIklgVU5PZRUMatqknKJJTm28WdDE1nMtjmsOpampCcx3YzDD6U3OZyh6zRTnzc7A5D4IInaXbQeYz9HALAtsGJgaNpeumD2ZD0uwaqCBAfiOsrRqTqXJDULtoWTwqVDv4NS5eYNDgHl72tz+yYn0kITZ3bv1Mk8l9UZ+DttKIRseXDvI+42Q/eqV9FWuhz4Ea6s9Wox5dmcXKl9eoqXCpsSfOYCba+aQtEWFMFhva+IbYEAWFuhLPIwOo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34BE255F9F8D9E4C852972DC53121730@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 V7Y/mRmJAHkEvY8LKKXPZ8eyJ7SQHiN3kIyVVD5VkwYwGx3h2tOwQfTA5YpGpXE2qUSoZsMmAePP/wUKiq0gjEpMi/j80Cf9sPngKU5af8am//QwXF85W7J7inJEZmj6GUYF1oHWcj70gwp5VbdiEhTzH4PsMqsOFBinIT+jCiUYg5x3PHqguLBYJON/Ubu+7JKzMmwg5QGrD5JuHPqrEmDTo4P7gBK6oCmFBRhjDHCCyldAlZqItQzxSks8konRApG7oi6xXU+snBB48qFtBBrH5itlFqV32IAZR4zsKr36TODUFYHggqAIDuYCrQqCf+7/hwCW811nGEOnFemJwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	96cff3b0-88bb-4305-59da-08de9b33c755
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|82310400026|376014|1800799024|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	gGTygSSZVxLSQQMWIwH78a4XeDBOmZviqNL0e4qfarmu8drR7i7f9iFvK8EzNhFNxvcquna5RTQC1USjASoAYQTGJ6EU2tDOYAzgqi7QHTCQJYCmd+Zm2cS/vnWi17PTkMENfyJFM/ke9d2bYnJUShOvtbc4HzPZ9MjOrTuEJf0N5XVKIsKsoclwm+3aGCpFmEScxtMGk5tMCABIdG0DiLbwjuL7Q+wSdvcgolf5BNstuaaMme9z7h2v4swMqXWl6oXTBIJGDF9epqIY8uDApX/AKyeJmjwj9edfH/XbAY+KlZLnMoTffyN7WNW4rhGUnsbnIkgb1zSanXYJ4AJP1uKeMrqZx/I3DaNwaZ+SYCEgSYMhpn3TIh+E/8GgSGTam6P3xx6pO3VuFE7oBKQyxtnNiZmJuNDygy5gR919ZOHG7HfmohY+5+XZ0bI3ScHSMtiiFiChx8S+exWgMUiuhtZ1yaAgPL0M694Bib2CMd5HJscWpj5/ErA2/JwKg0uqkPAUbuhO8n+YECzJnzXJCt3EaSWwvlyKWEnt2Zt17VYu+z8MVy2Ah/fhkKnDKdw+FCryku7M3HmOCwMAAAeWEB10lcNfXLZ7qCKFtpGotctcagrs4olaxRQvq/VscIuDGYtxCoJ1b56z+m/0woD3NFgyrWsvqr31uBYwTY13s3m0L3zAGzNkMM3Jsm1Xc4xL42L0tc2aJXto3OuKhaUxVZVSrgyJP82WRnn8t0blLBnWc5DmUPQqjOujcH83m4Cv+HRTiNFnxAjFrzzrXIabqw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qu/gYgnaKnw60l9qz8u/HtilGmAzTmVGp6vLnkUfoXzG9E0BzoEqdOrIE34VervzDJXYs2Gi+jZLebRvu84pJcxKib1rh6AEODocNo0vdBu4sjnp0PI8EDpQ7+J5xfoWvDN00H+H7KjssRdJCQrJaYRBufm/TkUrbkEpfc37dJdukvRd+r2pWppwqr4k27Qp88RUWC8Hmq3uuXylv6FPJJUAPY8Ok7k9gvGBtV+6cqE6w11VuHW4tbt9YD7PVDZPqNQBxfdBnqFYO8B1OZwN8yh4UoyIMJ6lQ0HptmEow51BW7PArodYj0SyPt7KBl+KSJKznYwNMsrm5DInWYnO4znDXlPYh9M9XmgRFO48KEFbSH4w6R8o/URY/xJ1XmsGqkerRbGy/55X1xSppIjMJrCV3qThCLPeoRloHctXNhD3iMk7WBktAQVAoO3Q6oX8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 21:14:08.1295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f8b77a-f88b-4f8c-846f-08de9b33ee96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235330

T24gMTUgQXByIDIwMjYsIGF0IDIwOjEwLCBNYXJrbywgUGV0ZXIgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPiB3cm90ZToNCj4gDQo+IEkgaGF2ZSBzZW50IHVwZ3JhZGUgaW5zdGVhZCBvZiBwYXRj
aGVzLg0KDQpJIGNvbnNpZGVyZWQgdGhhdCBidXQgd2XigJlyZSBwYXN0IE0zIG5vdyBhbmQgdGhl
cmXigJlzIG1vcmUgdGhhbiBzZWN1cml0eSBmaXhlcyBpbiB0aGUgdXBncmFkZS4gIFNvbWV0aGlu
ZyB0byBkaXNjdXNzIGluIHRoZSByZXZpZXcgY2FsbCENCg0KUm9zcw0KDQo=

