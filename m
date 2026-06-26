Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97ABC43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:07 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36985.1782485399169245866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XRBuUwRz;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XRBuUwRz;
 spf=pass (domain: arm.com, ip: 52.101.65.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iiobXN81XjlGrj4e/SpmJnF5F5Rp/gb2jlFo88kiESAMSRTbsKPVZ3G5YBCt9S/vIPzEWegnma4288eAUkkviJ2dew7sfiXVzA7Xld0GyoAqWMMaGFYGapc3LoAQLFQGMftXVW00f70REFvtErD5jmhmSGCYzFeh7Rv/exCSLeM4L81COCequbcpN7DvIt1uXP9a6cfHz7ItwUwW16dQPFmB+SBbDuuhSJ8+BqEk5MkMFXN7ReSodminu3dPhpG7skfnHcEHSuZC4L2aXnLd3FbkNrkDgAzxyZUD/KvcUsxuX8F4aGPnVzmFg4mHR8g4W98QXPYKTXzpMHGlEUIRsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4piyDOh2ifefduyrOkk/h0nOl/sL30ZeJKDsRKLaIxk=;
 b=X/G7E88pNjxYMJNxCIyaoTxChmVlL293AWWdpXEAEGRY4m+1Ey+RnoQkkFef0XhlPjQb1XJdVVIj60FoCvvnCiPmWOa3ZKg1gH+9y3HFJm9QfqdGxmZvi15ZLR91g10yfxvnJoYEiWhzQaRm+V2oY5TWVSK7B6SuMYFeT57iH+23zlrZK30mB2pKr6IhAJVpa/CkVNYhY8NOI2PpErzRYpMUORUigS4j3LxFN9MNOejMOeug6ogiOkhewuuK9AefGYYb8F5bX3ayJc2wGhmptJosmabY6gFKbn94xPkjTt2mdPNVb5KwcKk7owQ6AVBvKUejHJP/c0qONcLN5VA6IQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=emlix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4piyDOh2ifefduyrOkk/h0nOl/sL30ZeJKDsRKLaIxk=;
 b=XRBuUwRzaJMIWlW+Qreaw3ganEAVyw1GZhBwzNM11EWHBYMzfP448mD2MO86LsYIodSKAiE30/fVlZqa3h01w3ikUEPVBzI7SgjVf+bkICF3iDxqlJCyXEoRamRczLg8Dz/rh0GLxY7tG+CMFzdOfTuCNl8kaQEdMKNRqmlXHzM=
Received: from DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) by GV1PR08MB10752.eurprd08.prod.outlook.com
 (2603:10a6:150:15e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 14:49:51 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::6) by DUZPR01CA0288.outlook.office365.com
 (2603:10a6:10:4b7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 14:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 14:49:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAPPneJ/qOXtO3HSV5/BEx07/7pjSPs1CMRdxGmhTtXaz3Ux0vEzFUDmcOJF8iKURClOr5ZDBucsHFFMY/DZ+PQGqnPCuzafHyeGP9P7grFL2/0tj25gWye1wJCsml1s5JbOet9SrVUT7RhSNuZBT4dxeXZ5ROF97gc0KVFEAi1H6k4+Pz0fh9xHLnhx9aZLr4AKhlcfxbfn/lwVaS0yiVFOsVCa5NAWE9Gayk6urlq873aiJ47/vsYiI5QhWXGfKTgskB+Gq4sNt91y/gqwJW6uSHEob2rsb/PVGl+XPQB1KzAj7lBfvrAZs17bUa4fLpjTq54t5bW5rB+0rgAWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4piyDOh2ifefduyrOkk/h0nOl/sL30ZeJKDsRKLaIxk=;
 b=jfI4cPF34hczX+NKXZkImrlHtTJ6moVcFYzkRsDKC+0h36SNvzkBgC6vD4PJ2P1vTtU1QLFo2zZ1UOvmr/jN2zB523E/O6b9tt/IzaZpjVL4+EALW3kPukR97Uamh3XXn9TQy3aJ6PtYK1Exi9QH0bxZWJGfIvRcIaxrLGvEEokRWH0rVhaSzkiBvIJvameddj8T2sYK1CDaKbMVHTjnppiGXRh4CkwZYuh1mIzc7p/fDyoX8UP2PqArSOvH8Hxof5beSpOv4qP7zDwl00ZG+mBabvk4a+2uP3GoHymszxodSH6YplFk1MbC5VAA18AhOj+YJ0uqs5erDAtvcb0hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4piyDOh2ifefduyrOkk/h0nOl/sL30ZeJKDsRKLaIxk=;
 b=XRBuUwRzaJMIWlW+Qreaw3ganEAVyw1GZhBwzNM11EWHBYMzfP448mD2MO86LsYIodSKAiE30/fVlZqa3h01w3ikUEPVBzI7SgjVf+bkICF3iDxqlJCyXEoRamRczLg8Dz/rh0GLxY7tG+CMFzdOfTuCNl8kaQEdMKNRqmlXHzM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB8391.eurprd08.prod.outlook.com (2603:10a6:150:ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Fri, 26 Jun
 2026 14:48:46 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 14:48:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andreas.muetzel@emlix.com" <andreas.muetzel@emlix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] overlayfs: re-introduce helper unit
Thread-Topic: [OE-core] [PATCH 1/3] overlayfs: re-introduce helper unit
Thread-Index: AQHc/Z4iG1YDE1tPskK3qA5fh0/EKbZQ+n6A
Date: Fri, 26 Jun 2026 14:48:46 +0000
Message-ID: <AB6072BD-1529-4080-B9E4-1FBA3774748E@arm.com>
References: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
In-Reply-To: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB8391:EE_|DB1PEPF000509E2:EE_|GV1PR08MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a55a8dd-2940-4130-3d4f-08ded3922d7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 yCytt5bK7ToF1rmjGItxjoq8lrNkmYuL8B/zAoM0rDax4s4wrj1zOqZNYgAaPaTQD6jXOmI6j2Wh4wFz2nK5XkSmf0/s8QnLTpai2Ghp2wIHDS8LnovzXz1IrfU0lcA7X2ifzMfq4lRjufLRv2C5m4MeVUQkK2EemTdaYMeVOcRab6kEvRkZCHnK19Ul2agfGtBbjPTmb6kg0xxWrVgGXmuUhdEE5tnmA38aT5jKEheIj4z83Tq2uZIqLwLdiDG/vD7O91pppWfGzYTqD+tQVv+gd5tshVsRjQxCoyWPkdfo5kt+DChN6rNDqVnTXloeoRmC6el1HpievTNFaaa5/Jmv4021kbc3dWVTdDQ5/TpatfE+mYHNYpYo4Kg8Kp/DaNK+z8DsRU0oGcmkI0uKY4hkWsH8ekcF2qk7q0EoiZWV/G7yLlGRIc9p+2acRFNyleJhVjG6j/KD+O0KLo1GEfANSPDHMdq3qKn/vQxrqZ1dOfdgTW0kP4NyMge9RyRMFsYkn0iKoMhWhT26n95In6ujsoI37k9RbxRfRazZCVTWnFXzsHWJ9ZLDUiK08yoaL5+kdFoLDHzIxviu9AAFRqPupjRURP1CV6mGPOf07HYFkoOEcRkyU1gbUmb+TYO6IcBCL0UHBdbOGaL6x4Axeb0qkOVa+ByPK3nso4NgLxsPmEUY42S/arAKe7AJcYSW0LxHm+PuC2hfzKw7XsNEcsmYbooZctNGQrpS/FhGcGw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E54958125324B14C97197618B0970B30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 cDjv+wJIg9DykK033waSdRrkJ/k2rx2bAnpkQ6wCzR/N49lZ8dsFoJIGWsezpGJjzFaTSB7+jPWpu9k8mgfRrPXivWFdv3UtXJgabn/BkT5YFHjDChjyfbzz5b/GN1JAXVKKwJIFQrHZduCYnvLZBg+2uyuMggVnE35tRShmvsafCvaW2Zfrz2P7ViEp7h3HE5wtIZM/3P6AspNiGZPHRH6O5E6xBbpt6LdH3a0FF7DsZQfC8+a2I+YIwgrpBR00oaFf111lBiIkV0jOopuYcXNFluMerPH7+xcV92QXSPS1D5LfHzvWFIR4UCh+MpM2cW7CFqeTbUM3BLV6yQRSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8391
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	11f8e655-9f45-419d-2e31-08ded3920696
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|35042699022|376014|1800799024|14060799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fCF28+gFVg51O90rhoZBZdz2UhEcUnhlAcMfLwb9SVvX9V+InHkRlyBd2A1EHYK+cFyoQ62suQZ9B5UDReZpyqq+WAarUAxyMfc+J9bdqhM0aI6VEe9nxhRwTBrw3WUENx6vG4jtmJXMuxSEEFAn9uuY6oT00hW5ufm5Ug2Pftid6EwTxyYHal8N+AcHTx67Ds8m21qlVIF3QGHaEOg7NzsmXqOSnOS3TTSUkOrnvK09zUbgAr+1m91dAwknVT4+tVHMUko9xTOzJbb7zx/8HK0PLiE1Cf2xL2hXq08mNSgJI7r+pYmOrXE3K5X9rLO+kVPG6KxPDtBzoQIgYtxDcFRjaJCIDa/wjyHuyCZN3vGnHqBC3hN9TRAthHb64cKmNXmNH3OrWvWGpDHntSLNRn96ORkSHJjJX+dg2ts9yX/GfkNdS5WcOFBpcK7PFuDwhJYW3XzDjL4DUIxqkKDv828G1xYOWEj2c9Ub8ydPDG/E/0o62U7MRoz5o8rneAMAblolsNS5avLxIYOJNWgWc7Kk+lCYQWccLRqfMY8gEAIj0m1IqDMm9t9VkqYHh4K21jgoNTkY7mInQUMBoDgC3e5NiBVYPR3iS2T1dH62VN1EkmO28ec0i+SOWFgJsezpoduV3v02kN3y3396UuW1Ox8+T9sA13GMSwUy/DcmNOoi4ABWnxDBHfx2t4o2I/oVHjCouTLZNYljbp7+KWoDGQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(35042699022)(376014)(1800799024)(14060799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m8TZMSuPlr/hykJBmBbcUG9Nhj4krjuICKCZTAKOpGH74x9XCeOWJHpGYvxdfdAXbodD+vBx2YlFu6EtLkG7RC1KhQRlMzendD+Mxz87nIFR/6fpcXLPVBSy/VCIEpgxpSpT7IP7u2Jue1/VVqAaZVPg5a3IhaWyAt+1zmgE5TsmUbual5xkkEagi+ZuRumwclAqb/RQX6eo9Jtrc8+SHOJiWUowOCqhInehZtNrBWKDVrWptPa9xlOZ1svtHm3wYIQJqEPRxJrW9Hyiyasafep/94koQPH/fiFpuvRuNbjdnfgBcxf2A/NrfTOnASJcqr2t1bwqJimv2okdWQ3kKnwV9yfez+P2MJVFQ9XeCmd5ixCt2E0PDPOA4GttqstrKLvJdz1auE6hbin+0TFVu7mwIKSPtNdGTnagJQA2grKfUQ3oDpuHbY1VDlTUnQrf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 14:49:51.4544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a55a8dd-2940-4130-3d4f-08ded3922d7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239639

T24gMTYgSnVuIDIwMjYsIGF0IDE1OjQwLCBBbmRyZWFzIE3DvHR6ZWwgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGFuZHJlYXMubXVldHplbD1lbWxpeC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBzeXN0ZW1kIHYyNTYrIGF1dG9tYXRpY2FsbHkgY3JlYXRlcyB0
aGUgdXBwZXJkaXIgYW5kIHdvcmtkaXIgd2hlbg0KPiBzdGFydGluZyBhbiBvdmVybGF5ZnMgbW91
bnQgdW5pdC4gVGhlIGRpcmVjdG9yaWVzIGNyZWF0ZWQgdGhpcyB3YXkgYXJlDQo+IG93bmVkIGJ5
IHJvb3Q6cm9vdDsgdGhpcyBiZWhhdmlvdXIgZGlmZmVycyBmcm9tIHRoZSBwcmV2aW91c2x5IHVz
ZWQNCj4gaGVscGVyIHVuaXQsIHdoaWNoIGV4cGxpY2l0bHkgYXBwbGllZCB0aGUgb3duZXJzaGlw
IG9mIHRoZSBsb3dlcmRpciB0bw0KPiB0aGUgdXBwZXJkaXIuDQoNCknigJlkIHByZWZlciBub3Qg
dG8gaGF2ZSB0byBjYXJyeSB1bml0IGZpbGVzIHRoYXQgbW9zdGx5IGR1cGxpY2F0ZXMgY29kZSB0
aGF0IHN5c3RlbWQgaGFzIGludGVncmF0ZWQuICBIYXZlIHlvdSBzcG9rZW4gdG8gc3lzdGVtZCB1
cHN0cmVhbSBhYm91dCBjaGFuZ2luZyB0aGUgYmVoYXZpb3VyIHRoZXJlLCBvciBhZGRpbmcgc29t
ZSBvcHRpb25zPw0KDQpSb3Nz

