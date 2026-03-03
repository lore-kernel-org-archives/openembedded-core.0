Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559CEEDA687
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:17:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20796.1772551057475533274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 07:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qJVTOCan;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qJVTOCan;
 spf=pass (domain: arm.com, ip: 52.101.84.1, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nJU8MRsQ+BARJoKTobr2w36wDaMu2TM8wXHidXM2n+xnoOIl28AflMxKvVN11r+A/z6xRqcAqRsIWKMRLwll884Hrxdainy1EGV4ERIPX8KXUOU7BQI22FZN/q0KYmW+OTlexHRq42RCgMdYwtbCZbDisWFt68NcJoBoLqfxPJu4WLso4Z9fop6KsZLUMk6oPz/8onX7J2Pjw61h2pCGrLDIGPWBG1m71lDJ18P1dCN3lXLJXDH8ylDBVUMY3/QbGkicpjD9MkL6vqwx7LsQbcxi0a1YYMXS5/PK6s3mesEP1WS0A3wp2XzyJVpIDjlIF6Pz1DHXBoLr6tAUzRPmkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEU3KRl9YNDkiq940NLNd1PeNizJy7eJ6PSf4F1C4yw=;
 b=VHjCZoieHSNsEOlHWZycG/O0F1GoB0IUhB2NURFXfQoyyhWE7xT/P7DraqOMhNJPD4GGqFO/4YusjgCuVwTmBw59nVbo6l5OosezQUyId8LPecdp9RkPPdD9pgNZcTwwYX9BjkuPwEjdsx0XyX3ty6ufVMVphK0Qr3t6FTeK5MdURQiNTllIpr9lHBz6cQiPS0Ja3+J6uHkxlARD4Gp+35nxoh0/53DDZud92MTZ40+RxdTYjDJdrKD3p+T1CL19u7aGErdLWas6h9kcTM9HQwb4ITbbC2/ty7BTjbxsk5/BKSmMpWGBGDCW9V7q0iSer6CcJ3TjPlQTfPew3VTh4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEU3KRl9YNDkiq940NLNd1PeNizJy7eJ6PSf4F1C4yw=;
 b=qJVTOCaneUNEFn5QxNTEEuDHCfq4AO5Q3DWU/g3snBDD/awhRJFeAZ1cV5EXf3Zerb5Mpvr5IxjamLArlE0hPZFqdNKBHjJzqQCymfYnyCyQRebYHBLMtYbhA3fHUZqtO0iUJaDnVLSO+t57qA45FjDmB1bCBK6CRfPl2ytfsR0=
Received: from DB9PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:1da::20)
 by AS2PR08MB9076.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:17:33 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::d) by DB9PR05CA0015.outlook.office365.com
 (2603:10a6:10:1da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 15:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 15:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jl7DFx9+5tkJgPuGCDGRvoMJjwOsSn1HWIgGes4bLYX4RUbo0bh56zEFuJ4mOh4zuy0f9K2TI91wfivSV+Sf9TRIaoSlj8p5JCsWm7xOXBaVOa4n/HyBOeGI8eJjTkZ7ZEpJ0/Jz4jT9fFMbYsd1ZJY51e5QVkGbs/K7bYnI+tAS66UAUYehiwXkjntemAiKlXsSTFBJi7ymPrMcwKpXkoSD3WnEM/xKzXZetIZNrttfP4LC0EQvSk2dPlbB/X3tpvj++kMI/YXlIdISAT8D4Q3MwEzL7G02gfpeEQsqt+ofzqmVgDBcFsCMS80EKgb9iKEwzjLFyFp85AnIulMuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEU3KRl9YNDkiq940NLNd1PeNizJy7eJ6PSf4F1C4yw=;
 b=WJmjq+ytKKL8nzjCaJQraaJ3/+h93/G3hj5LGjUfaYFs+o6XmtPdqRKkGz+KJg/veYt7Cu2Vw9ufioLkG91wQMy48LJSt3pgtT3UqGB3aQAzupEJg8CxXlWloHBC+/wcx8MUJs+sXEbntgYfCOjYN1UlSa2FGlCSSYvL+Q/OC1dovG17zML6177zXJFpaQ9umNM0aKP86VTujxMF/p+khR4ChsQEhACeL99tn2lg7kyyUTlNglpdzs+LAGT0TfZioB8pklhIHm9XXfH0AR5qp0rFWfKakW2ZzXEtS0/I/s1TqGkzWzB803MLxVookrx8h6yO6wWW+kpalUkUyhfyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEU3KRl9YNDkiq940NLNd1PeNizJy7eJ6PSf4F1C4yw=;
 b=qJVTOCaneUNEFn5QxNTEEuDHCfq4AO5Q3DWU/g3snBDD/awhRJFeAZ1cV5EXf3Zerb5Mpvr5IxjamLArlE0hPZFqdNKBHjJzqQCymfYnyCyQRebYHBLMtYbhA3fHUZqtO0iUJaDnVLSO+t57qA45FjDmB1bCBK6CRfPl2ytfsR0=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU5PR08MB10549.eurprd08.prod.outlook.com (2603:10a6:10:529::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:16:28 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:16:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
Thread-Topic: [OE-core] [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
Thread-Index: AQHcp7gCPp8IyIj6okSKwBpPjzeMd7Wc8e2A
Date: Tue, 3 Mar 2026 15:16:28 +0000
Message-ID: <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
References: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
 <20260227070858.2687898-1-changqing.li@windriver.com>
In-Reply-To: <20260227070858.2687898-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU5PR08MB10549:EE_|DB1PEPF000509F2:EE_|AS2PR08MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: e323b308-1a16-4c60-a5fb-08de7937fdc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007;
X-Microsoft-Antispam-Message-Info-Original: 
 p6jSY5k6+ntSZHal2nwBVBaUDSdSxXtGIJKKnCPnHJvVF6Dtdsnjah3nUcQe8nxL8th8YvGqWzZTQJxMR3byF7vsMPrlyFVD+dD/lynAI01ZcEdaGK3gwCTRoXI49Pjh20FCzmGutckiIpbPd4DHQchE31Lndcr2nqXsjp+GpJevJBSpK5NH79Xu81QEXYtlGPPWYqPbPlFCDSElwVGW/LZoHUkFi/UtGCVbokDwDSP9SNeN0Z5Iqf1UaZPstBMQlss6AgiLGkcBRfbXaUFTw5J1t2RSjpC9qNsc3o7bY9DTmI/34/95jc09CyFjWx7B9QI/WFBlQ9UurcLR5woM97adJtJjXPqiCaXr2Z7r/FQjssBDKX4FlWUgh9q+r0kkkKwWSkPqY7QUngvp7upsAPoDVWTUfQIY0l5MTN2ghdJT0nDB/Zi66IUtCe0ciQDwoEGQpXcHssAWncSU3YWglvk9qKaDzfzVrz4c1KTmgDdSTcGbPL9u//hr07U8obWFzYmez39vKl/PD2gaCEJd6ljO8WWtHqc4jT3j+xMW0wWn6EeCQfTG98Q3jjIcdMfSsxJQSH7JZf6Q25fBRZ7u6eT6uCdpDYjtCq4M/7NZtO0lF8xtJjriwbTM/DU3zjTT3VqbILGEiW+KMFYgR0HcIQxp+Z4Whd0/9p6doxiLsFV64CLdpZi0jWKnloCZs7UZ0bdv+jTRoWICv+uZogugbGpVtCCL3mEC9yLfj18asoE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF9EB14204CF4240BD10A8408F3D2712@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10549
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7dde891a-414c-4620-dd34-08de7937d7cd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|14060799003|35042699022|82310400026|14125299003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	zFeQFrxbVCpoa5Jcc56g+Nk7Y/HiO+w2VH4lIr3F03JXIFbOeju4DachOQjbYSXuRQ17Z7uIBY0E5ngdMkR7ZAKV1HRgUBsvUT+ANauYbQ14jcEk3EXgbih/OioMMORijQfyF1u5lD1xuE6blANDCznaZMBsc9KXIVhnw2HFzF8FiVq1O8bMvpmyg9g3Hn13/zm4D9rp+ZaZkmo3bsQI9EqBIHjKwqOExNP93pSWzvPNlKirVoNr2sHj+dZu8ZxqwGS2R/hH/9afFfwuwmUYOH8Hbg20SzDX5kLo3zg4UsY6+I+ySCq19QN6py+98crP56h+M5A5gOzNiUXlxldgHsreO50abD41jqNaeCifQSBMu6eJCp/Hh4kLWPkvZAWO/kehOtIJg6CGTg6f0KAusrfkAsmkpFGenA3UaBuVEqNcsOdyl8ggPGv7JAAx9jx2Tpde+zJTTf7g/uB19IUdAr306vBhyWR73X5Qo9LYdDII70BDKHS4boLU5zBmG1tIIwvg3neg2XwaKXxSqCWCzd9VrFroRPtvRPLmoOYPSGafghl+tbUKQjkZbtM/M/cc7MEStJQfzsYj64ss/mFmbR4vgdAQ8mPuvs/iQSCnjmnRpJOn36w715GXR2RG5NDLXHdp0hdYU2P45uwjdSBG9Mo6ubfSjumcqh6q2RgZepIunyu8P7nPoTTiXtXbObjdq1cw3QNBrlhevCcIGWjPggbSbOXLDBjB5J8tF5fyCPbAGV6haNILUWKtIIFURQ9N3cmELClkdY6B7pkTP4Zh8YHOsSiq1DD8ycT3WmbGXQCcrrGJLMN4sZVQ5VNtk+Vb
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(14125299003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NInT7z4VlYgr+jATAqigQ1xKdhvWp4xusbelNbU9YjvM8HLurT84YupEeiQLXp5plFMm2TMg4YOSV7z8gQHh8l99H4G1NAEpssyzg9Fw82Er3IO1rqfwx0cqnu3PdIcB5XfxgcO9hCDtWD3THzbMyo/kp2ulSmufmKx3YiW9rxS82HmSFgMKkTE3C+jrwtbfPI01e4+/uWfswVHHEVSot9McIF1xClsJr/dVLwCoq9A8L+ufH6Qnj6qMYDXcFKCVIzio3YWHkb6nJRUaEyZBEPNaDktSf1z14z1FAfE2RcmqdymgjeKqUMy+FIgI8JWQwmjH8wq+DDiDM6ZkMQzC+2ip8aBbS7kmgOsVGXJO9kDf21gHYLmRuy/mzofXzt1SmZArIS4eutE7G6TBxcc/eujGPYMknZAh70hpt6BMgzGzweqacqvgi8Z3v/OIjiVd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:17:32.0674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e323b308-1a16-4c60-a5fb-08de7937fdc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232318

SGksDQoNCj4gT24gMjcgRmViIDIwMjYsIGF0IDA3OjA4LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBSZWZlciBbMV0sIFBMQVRTIGxpbnV4LXJlYWRsaW5lIGlz
IG1vdmVkLCBhbmQgcmVhZGxpbmUgaXMgY2hhbmdlZCB0bw0KPiBsb2FkIGR5bmFtaWNhbGx5LCBr
ZWVwIHJlYWRsaW5lIGFzIFBBQ0tBR0VDT05GSUcgdG8gYWxsb3cgdXNlciB0byByZW1vdmUNCj4g
cmVhZGxpbmUgZGVwZW5kZW5jeS4NCg0KQXMgaXMgdHJhZGl0aW9uYWwgd2l0aCBwZW9wbGUgdXNp
bmcgZGxvcGVuKCksIHRoaXMgaXMgbm93IGJyb2tlbuKApg0KDQpMdWEgZGVmYXVsdHMgdG8gZGxv
cGVuKCkgc3VwcG9ydCBiZWluZyBlbmFibGVkIChMVUFfVVNFX0RMT1BFTiBpcyBkZWZpbmVkIG9u
IGxpbnV4KSBhbmQgdGhlIHJlYWRsaW5lIGxpYnJhcnkgaXMgc2V0IHRvIGxpYnJlYWRsaW5lLnNv
IDxodHRwOi8vbGlicmVhZGxpbmUuc28vPi4NCg0KU28gdGhlIFBBQ0tBR0VDT05GSUcgaXMgbm90
IGRvaW5nIHRoZSByaWdodCB0aGluZyBhbnltb3JlOiBoYXZpbmcgcmVhZGxpbmUgaW4gdGhlIHN5
c3Jvb3QgZG9lc27igJl0IGNoYW5nZSB0aGUgYnVpbGQsIGFuZCBoYXMgbm8gaW1wYWN0IG9uIHRo
ZSBydW50aW1lIHBhY2thZ2VzLg0KDQpUaGUgb2J2aW91cyBhbnN3ZXIgaXMgdG8gY2hhbmdlIHRo
ZSBQQUNLQUdFQ09ORklHIHRvIOKAnCwsLHJlYWRsaW5l4oCdIHNvIHRoYXQgdGhlcmXigJlzIHN0
aWxsIGFuIG9wdGlvbiB0aGF0IGhhcyB0aGUgZWZmZWN0IG9mIGVuYWJsaW5nIHJlYWRsaW5lIGlu
IGx1YSwgYnV0IHRoYXQgYWxzbyB3b27igJl0IHdvcmsgYXMgdGhlIG9uLWRpc2sgZmlsZSBpc27i
gJl0IGNhbGxlZCBsaWJyZWFkbGluZS5zbyA8aHR0cDovL2xpYnJlYWRsaW5lLnNvLz4gdW5sZXNz
IHlvdSBpbnN0YWxsIHRoZSAtZGV2IHBhY2thZ2XigKYuIFRoaXMgbWVhbnMgd2Ugc2hvdWxkIGFs
c28gc2V0IExVQV9SRUFETElORUxJQiB0byAibGlicmVhZGxpbmUuc28uOOKAnS4NCg0KQm9udXMg
cG9pbnRzIGZvciBhZGRpbmcgcmVhZGxpbmUgYXMgYSBidWlsZCBkZXBlbmRlbmN5IGFuZCBsb29r
aW5nIHVwIHdoYXQgdGhlIGxpYnJlYWRsaW5lLnNvIDxodHRwOi8vbGlicmVhZGxpbmUuc28vPiBz
eW1saW5rIHJlc29sdmVzIHRvLCBidXQgSSBkb27igJl0IGV4cGVjdCB0aGUgcmVhZGxpbmUgc29u
YW1lIHRvIGNoYW5nZSBpbiB0aGUgbmVhciBmdXR1cmUgc28gdGhpcyBjYW4gYmUgY29uc2lkZXJl
ZCBvdmVya2lsbC4NCg0KUm9zcw==

