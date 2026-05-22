Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB0CD5BB6
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:43:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18487.1779460972291623312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 07:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XJI2wHle;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XJI2wHle;
 spf=pass (domain: arm.com, ip: 52.101.83.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=iLrkYbNtv5avwmRIj58SSzXQ+LrBri1TaobaaLrUEEKtiubl6QiH5P2GD/FFhpKERMIiycgaxzpQGZVHhKnvWRbrLqG+3mf7wS9nS83ywQmsBXCcR040ef33tbvEk7xGSJY8yTkrBzRcqvk8nu86r1d43j1NfN7VqZz/noeD/kHWlfwzH3CbtWFPBX1VBrUdPgFRvghsX5RIplFqCPsDnYgbyr8dcWXrZ0tJCsNxBeJIAbQ7JEkq0y4VQUoF0j7+oV/CYipa1f9pF3CkldJ1BWHKsJe0+Fpu6Mevhl3BL3TG/Ag//sVyVgIoReRxL7EfJvKZi+uHptP55OVmkL9r5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVgxyMiuVFF+bZg7zwmiWbq2w7DifBkk9wIGV2r2qfM=;
 b=SvBhEQ3nyqXK5mCtYHBhGVm1DiLd2ZlTXaSz5dWiGOOkJAQHHyuhDI1MDhucWQIXih5Kgm7udVnSFIrSgjFTRySBzTAOais1SHe9+E5qgHap3bsb0lqds2PRxY7cIJF44nRcm0kFbD+8xkpkUNgcfJYQACG2VtLnqnJPnB0gNmZZWfFVCet1BFB6CORzf29AlaCnvDvcbH5/9XyPSebIsXlSg0gWX3P6ZQXP3U2NAnegqJ5so+mMk8FzOL97eXNXe4pd51stSvqW1l5i+M9+h9FAvfxWYXPW64CqAdaOLVMW3vDtXnEBn+WzGxuER967fIF88k+zURDGoA/YPY3khQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVgxyMiuVFF+bZg7zwmiWbq2w7DifBkk9wIGV2r2qfM=;
 b=XJI2wHleAN9DJFzcrZ7QPFcek2iZpUvwl3U+GWWAbjr+hf+1A7F0fYd8GXJzzgDMdyKApQwP10Ji/UMu9iyisZdFXH4afLeMXSF6INo6rTLMAaeGWCrv5dkO9ZmRmSu61tCPLlKh2+xovFZYqGM/n4pYbG0FcNpQTX59sCPlHy0=
Received: from DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) by DU0PR08MB9751.eurprd08.prod.outlook.com
 (2603:10a6:10:445::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Fri, 22 May
 2026 14:42:39 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::79) by DU7PR01CA0047.outlook.office365.com
 (2603:10a6:10:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 14:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Fri, 22 May 2026 14:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXDdOgEWK5olIp2ITrP6gZzeg8/xoyCMFXu+DJHFyaGYjTHhOHpVEYxOnk2X0CBtR4VFP9pmHkUs9SZXQ18nFo3ajJtYpxNBwoW0gUPeYRsnntD/enKrLczdGHfOsdeJ0A8qpvsBX7rS9cOOP2CH8EC8AF1CAtkbI40+qvRtUBBDVmErm7lSt9A9245vwJhwX2LQH1cTNlIoVzezZ6ol4nSKJrvfvOo8WIKzefmCvdZ8uxWgc17arKN0dVWYMg0Z2hGvQRsQQZz6n3J/ccRN4U18ta/xM5oMXrbQhvW8lI7Gw4jwSpKQ0tOOW59Gxg0uS6J2IYBaGZbrbGBzGDuyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVgxyMiuVFF+bZg7zwmiWbq2w7DifBkk9wIGV2r2qfM=;
 b=I6NyMVXx5nxZJfpqCY666Unjw8JxHGgBYQQ/DRV+Es3j50F4h6rKTv0ns55OgF6OwEPqjJTOyEjWUGCsRMbO8CkQQ3RgKVc/lbrHTQfcC9rrRziJVqI7UBkVU6cjuytB9lPaBnQ7vs3yIY6yor0iL82ZcFXjjZYmZlgPBnrvVJ2agyMRXu7dezO+L5Az/TNXjrc7Y3cgkv3nkgnpbiWoVBz4zu8K+mztqLbkuVodnV0h0z4LbkhcL8J0+eTA7Q+61D1fxGMO17m+1U8UbfDooxRDcblP470vUnpneHNo8KVFEWAD20PhI0+5yGijFLbICEJhdSFT/amBSVCqkuFxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVgxyMiuVFF+bZg7zwmiWbq2w7DifBkk9wIGV2r2qfM=;
 b=XJI2wHleAN9DJFzcrZ7QPFcek2iZpUvwl3U+GWWAbjr+hf+1A7F0fYd8GXJzzgDMdyKApQwP10Ji/UMu9iyisZdFXH4afLeMXSF6INo6rTLMAaeGWCrv5dkO9ZmRmSu61tCPLlKh2+xovFZYqGM/n4pYbG0FcNpQTX59sCPlHy0=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB11299.eurprd08.prod.outlook.com (2603:10a6:102:50b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:41:36 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:41:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v3 04/12] gcc: Upgrade GCC to 16.1 release
Thread-Topic: [OE-core] [PATCH v3 04/12] gcc: Upgrade GCC to 16.1 release
Thread-Index: AQHc52DT7rozhFrKHkGc9Cs9/MHprrYaI1+A
Date: Fri, 22 May 2026 14:41:35 +0000
Message-ID: <CBE8BFBA-884A-49FD-8024-7801B4010067@arm.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
 <20260519072534.24588-5-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-5-Hemanth.KumarMD@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB11299:EE_|DB1PEPF000509E6:EE_|DU0PR08MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 675ffc8c-35ae-48cb-9e9c-08deb8105f4d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 HU5hR6KmQwPHh14J+hG5EPEBlqPL473PQsONEhch8t1tY/h5/c9B/T6tTN8JQL94fGhQnW6u+aOzmkHfMlcaGiqkD/JE0k2kNtns8q4Lu1iBVrk64wb1I5hjIyVtKvoxreGZoOZcirFcfEccecYhfFu41SrRhOMYsOPeHC+EV6qFJgt8ut0HyMM1In/GF4L1Nh2VXPEjeM/6/ufmLvkZCHmvP5JLdJi4n0N6TIH1K6tNl5H580CGxJvSjN6/vZ1BokrZIlIzydEz99i6l5BQKTLGeyLvedYUHNh6U4fhpRQnZAqGGTecr+Lc5wYL3VkEjTUz0jCWk8KSTH3J9c4jwR1wHEnYHtJ8ZJrTx7cRrJxAzWP6UtxxpE0J7o4ztVkHNBFRO/olf2ZJJxNU8rOnyf4329qYLS9T/AP3j08Y6CTfI+ITjTzyy/fJo3jiqo1USOyZFkDYNbBkxFAkM9bklKf675eG8vNsGNS53qWW402EOSNhDcsHEoxxp/Pr7qsImUY9sCRLAFMux2dO8bGC1injJFOcS0ik5AWkAcr+a1rHWBFAUqrt9WRqWAkyjyd3E4A/QnAid6u1KIGNvpDhkxDm8VsPO/BuXXIL3no3ZcUJJc24qG5ChQuq7iM3YJmPv+DQfUoF/mfEwPhm1BHvP9E3myOuouqT/q2XcPvhviwzi8M+oZRIT6U7RtDn1nH2BGumWjv4KHJCS+fW5OebFI9zyr/K+Ii6UYia891VUW3QhtRaPV1mrL1qft8lmXdw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2C626F19AA83044085903A8E01AACDF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hioMPGNL7tw4ASre8bB0aTal3EZQ0HLTYI4ejATAZLV/9r7nO291BdPG4t2BGBWaq4d/P1eEyqwfCPqaVwzluGxfQfrK1kCBOvE3vx23kskcNmJNbsTSwbkZcquipxHfr/aIchZWOB88JX6kB8UOMUdJHSaAPjbsokyW8ew9g9aHEt2q8ncVncZ534uheuyqz/8Hkn3sB2PUnU8QTKsrsMsoLKvAhLKvkyodSPm9bZ/txTNVGyj4xz0j3lpkpVIvWEFjdYxj2PVc1cBCRxVZj/B0nfLX4VeDi9xDPyT9UQZpLmF/WbimpcD33sQnvRgZ3szWtHIKzSNs2mwoTFk+yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11299
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2af7f616-a183-43d3-c88e-08deb81039a9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|376014|14060799003|1800799024|36860700016|11063799006|22082099003|56012099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iZYCmbpCsLjDT3CGqnL8KvFH/T+o1hfregK8CWb7eTdx+93ETV/nE0rm0GpLbcS/5hPhOzN8j/Si5JYouchQweVuvey9wn6H21Hsqk4z9h282f4DkQxfPJKY4vwARly9uaHbeJx08VFc214KxPwj/QQffymUEcv8dyh38l17t46UQOcl7J3CT3Aw/HsIjCp+S1lyOfb8E7L4pTjdqAJeL+3FHYWE9PLt64ARjPXvkX9WPsrHYq9N5oPdC2cVLNraReD5P9Hq21UvZwTFwNFpmBlGWjAJcJLhtWDVTimHcXDCqFoIuZDI43Ygaa5NAqrcjcpJ/g89/eZARG+2FWQ23SULblLFwEp/Gh0ne11dAdpG4Wz1RxA55F94EX4orNPw4MT72T/ZPfYXGc2GUjgpFpsEDRxCMZ9Z/vz81hMjdJUrphOWBwZLlT3TlYkuney8oJ+Rcb3O7iJYLYD8frXbC4ApY0anJ2X+L3+/XZslfRpi1bzUOQSV7fHk0vo1nknKZucqFpAYdBs7BGdGHTq+kPpVHjkmZm125qMNCQ+a9oiI9l4PJi0M8mun3+JNy8DN1SEdxlzFxF4clJ4S2kGTxBdANbonPxie0Hc+8/4Y8jMyH+IBQhW3dQAL+WxSWE32X2K2cNqwMwlcBcSqwL+fcnuPJK4aX65L0i7i1pWnsNWfx+4qTOdzamqsp9KrgVjuC0z0Uw1O0GUWErBUDHmRONqdeLsiPAIs14Ao59cRb24=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(14060799003)(1800799024)(36860700016)(11063799006)(22082099003)(56012099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SDHXHd/t931yX/kEdQEohd3yyXCu4dY+V6T/xEJFdgi5zm5Oo1LxC4jgd82YDQauPK6bLycwbi4zj9WAjpwbGISfmev0URDEPWJyNWVrzfPhTbSseM6rOclbDyXS3+eLffrHlaaBggAwjTbbfeW5skiBtf3/RzKRNwuN5ponGcycKzBATL9WrKGCcdCX9SFIfEPQMdmpsviYvt9JIzfbsTFEFSGgaG80k1UX/8l4c4WI6dw41scdQzu1Gh8Y0nb/xsUwkWSBrWBZKokTt6QOf8LrgYFXev7miPTHyAasYA8ujhjeyGl1cNRH7XcEcqto60Wds8D9TqvQxDOvq0O3yh2wg8SWPkdR648Qi1w2wZitvHU8t/EmmxEdds49Ozt89cs5Y8P1t8RvIrcESlauAm4IqTY4RFr02icYu9ySUCgT0jm6mhk3GE3cFhiSdXO2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:42:39.0131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675ffc8c-35ae-48cb-9e9c-08deb8105f4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 14:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237552

On 19 May 2026, at 08:25, Hemanth Kumar M D via lists.openembedded.org <Hem=
anth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
> * Rebased existing OE-Core patches for GCC 16.1 and dropped
> patches merged upstream.

The patches are removed from SRC_URI, but have not been deleted.

Ross=

