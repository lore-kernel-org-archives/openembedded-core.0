Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F374CEDEBEB
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 20:02:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1750.1772568166853175556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 12:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dk5X27Hr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dk5X27Hr;
 spf=pass (domain: arm.com, ip: 52.101.83.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gssHN9HRRAFlu95ZeQpRlDzDwdm+RkltAzKz43zstCG3oLuiufY+94YlsvDCoZA8Xhex5RYjiNM6j5lPsqRh3zM4/1byzPti2AZWByk+kbwzxaEJHPsZMPFxMRAIQ5reKRhQDV1b95D0TPul+hXc0deN1s9JFBtGV5BIq2aRQQFGMKg8CUJ4RLJ6IEreMZ4cwGJbrjYFj5QlqUZb6bN0pBV3IACnwQ4Wy+izUu2jVbW+i6xc2jSTpIYOZqf0l9bRU94rqN/Wa/0i/6j4X+ZPRETxXG8scghuAc/gVaEWVraE6od8G+u+7eCIp4Uz9n2/Hv/aZAhgMgOzTc9XzHKwlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEWmqu/DDZ3T22s0Xx/YEpmtYf2QE+hhlJgkP/AdV+I=;
 b=CCqQXJZQ/sGF8kP+4yx951dFOcYpy1M5dFrq1lUtPWadwAair46tX3vIoAKoYl2cpapPPPgpEhIvuUFXl8YGKo9/BdPHOQOb/BtLnJWjfODC9JtsYmGU06j+fjrv0+XZRp7c5UAaiAyIa52WRpVr7D4j+n7l5acEjfs3BnRB+NCF8jr9titjvPxxWsIa0rqynBtmN1eoIb1GrVzOrYiXPoei/saqPlXkTCI1iGwfsOJ1oSGW8CBUIgkc3hjVd1nGrIxx/H/iaFFjXkl1/10qPDLgQFoZ82HuTZNk9A5oG4AruJpuAkbj0vZohNYMLMRUlzfW8IbIQaKtQ66f1ZZuSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEWmqu/DDZ3T22s0Xx/YEpmtYf2QE+hhlJgkP/AdV+I=;
 b=dk5X27HrJ29z0HCqXr6roPOM92WeBDw0MKDN7LIq10Stjxxlxnmk5aZwx4BKa7RCEziBD2515gsCGAQ54to5FlMWFcGQhmfg+PtDrR7KXu8MjI38IhDL6ppooKrHZTqs45p6W4HJ1zHbWvJQ8upKfOKK31xBac0zen84lKt8bCY=
Received: from AS8PR04CA0187.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::12)
 by AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:02:41 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::ec) by AS8PR04CA0187.outlook.office365.com
 (2603:10a6:20b:2f3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Tue,
 3 Mar 2026 20:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 20:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hweECV5iCDWNJIdm7MRJ17UKnjs6Ky9cl/zc2Ysn2w3ra/cPakFbD7K5Gm4cKIzuxAn6OKTjQlVMsi5l/D58U/Msflx9MuQ77UUas+BXCQQ+mG2h+f8TNTEENJ04AiLdlj0w6HCYdpPb0bm5kk8phDivpc5Bu0b9u3RSUF+sq8Gi9ObyM4e6Xg/TrhSbf08MpFtuiVmOatLEprWty6dRkhwxuQUu2jxCDDr0qlfFGCZQNUyfoyEZmKZzzDwrSVqLel2HM9LyXtpMbPQ6acA0e4FTZhU18C/GsRZFrWibcQVEwgL8Kx51aX2Pqr7+ZA39VYm8NarZtHjb5GHwQTXo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEWmqu/DDZ3T22s0Xx/YEpmtYf2QE+hhlJgkP/AdV+I=;
 b=A4cdALNAdxsgXc2YORe4AM68TcT+KF3uVHbCnCtvarjxMrZqCWBufkUxfqFYlJsIHkZBwxSfUp+x8x7bdLjq8U6M9Lq9yuLW4TjcNrY/ySmTE6dPQXqh6YC03gDV60HeDR0zSJUrComWdKblGuFWUoQ/PhOFzXj1gAnwlVBF6zLXV7dbdVNSYiD5qXid+0zhytCj/onNI5Z1w6V8FwHB44CK+oltDw9PuH+RVvt4Yt7rjFgMK7IUyZYfTO9hV939IydiiJ+HUvEko900BGq6a03dFFdJQUPB7cGGeOVGswOQ15WajSePpKRILy8ZgJjE0cjZqlLDzs9/lEFOG6zdyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEWmqu/DDZ3T22s0Xx/YEpmtYf2QE+hhlJgkP/AdV+I=;
 b=dk5X27HrJ29z0HCqXr6roPOM92WeBDw0MKDN7LIq10Stjxxlxnmk5aZwx4BKa7RCEziBD2515gsCGAQ54to5FlMWFcGQhmfg+PtDrR7KXu8MjI38IhDL6ppooKrHZTqs45p6W4HJ1zHbWvJQ8upKfOKK31xBac0zen84lKt8bCY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU4PR08MB11745.eurprd08.prod.outlook.com (2603:10a6:10:644::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:01:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:01:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] ffmpeg: set status for CVE-2025-12343
Thread-Topic: [OE-core][PATCH] ffmpeg: set status for CVE-2025-12343
Thread-Index: AQHcqPulVpvHFV8jGESZA8jSHP78E7WdFP0AgAAqC4A=
Date: Tue, 3 Mar 2026 20:01:29 +0000
Message-ID: <B2DE7035-3C0A-4F0E-87E0-86756EC678EC@arm.com>
References: <20260228214501.451765-1-peter.marko@siemens.com>
 <D26AADEB-67F5-4B16-8F16-1A0C6079FB9E@arm.com>
In-Reply-To: <D26AADEB-67F5-4B16-8F16-1A0C6079FB9E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU4PR08MB11745:EE_|AMS0EPF000001AB:EE_|AM9PR08MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb3b913-6c02-4e33-3ac5-08de795fd341
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 Cb+W+jUry3o+G4235mVcVbAKIet9EpPyxqLcAfOyv3Vv9qrMeMEIAYa/lJ79fDjwRsFY9N2CQZozEZjuA3ZDtoNBfZv0zLAlpNW9qSf9dFcKdMPK/0/QD7KOXH8wlEMMfp3oWP1i+nr80pyVVP0rZJ6s+CCVjtRZWtbTZxAmyxlASvm84lmbuiDDT4dpov43eldwcQpaLDr5oeTMBqOUZ1V6bmhHFt1vfwfA+eAjGh2JaOnpqboa91Ks95AMM6KBJ+56JOQwpfDxd6UA1lSfVQimcKIzCAnyHkNp1uekWEy+IAF3BuW0S2hkiE8YcLS+KOXz+nhC5aHInOly9HmJvRXTnsspN7aBp0dL2xbZqhiGxQTI3omoO1db79Q9RI4JFayzmFiRK13grwfn6uaIUjFCu6zpmzw5313ecsRZCXgOKVQtB9aWxY5eVtoB0a/11Kvw6Muf8rtu4etoXwtufneT3E25TUJcrF7hZ2/KSojFFLXFCb40+ch1mMm+pWo5fn6rGqNqLPvsFYjaJCST22GofaMYehzg76HLAU+s1zakM5HyUbJeNwUTwuU6hdDv0BDzkGVjKEU6VETSdPmUeC4OgN9q7dVJHu7BFcxZj59WnBGm4bUTbZXEEML6/adH0yJHHtVJG/qjxET737Se8Z5vEg9Is5G6r3ekz/cHQfwB0d7o9XfVqNBrC2WWmN4BJ+fqWYZ/Ghaf7xGIp8a08R0gnhxfgc++Qk4DXA4yZpgZMbfcnqcbi5tKHc0cFAzCywLezZjD+GG/AcU3LBkH8j3C/ja1nz8jaPJXbtuBynE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01E5D4757EDBB0479FEE34F113715DD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 c3GrOsrijUh49EgopTMhuqY9E/q5TuYTfFNQGIuJDr7Sl5DymzYmk62sqIBD6sWvDix5w8bkQUXgq3MOQGpi3k1qCzh3gAYqawv34QcfcT2vPd3RDS7LEf+YLB2qM2aTFoDB19ByTSTavFlTAMqBgxmvrtnFjstkMjUabLcMJomeMZuyP0LBt5O0QbTt/L3DAVh3AMJG0TJI7H6x3dJcFwsi8iQNXII9QaEfyeggoRXM/aDCYHcaXKlkI49TMwLveXA0guY+N/PJQQoE3D8g8VsNTmPBb+VhMS8ArdVaBwKb7+PWiOWqNnwzZ/QlOiMRL0IPIUHlY5yAwhSQw71IRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11745
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d764207b-4df0-4b2f-dc23-08de795fa8c7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	Ezu9DqNw/RVLxRRuA++ERa+pcJ2fpzmtVe17ChmWVKjB9GTx+/9rnk/IyifYftqvluOSbiP7mCv4bPciuMe8ozNdc0hsRwH13DEuV4tbYLNvppem7R5+yj+yc9XSBbG3BGFbOoDGQB30fiaKM2V0/cmIAKcPbtRWuxHcXV6b2d6xGZy/4la4XUu+4cEjQnN1IXXhmr9QwOi6zk1AMuchon8QJhexLbrCIVnBnnMd2XyebDyD5XQKFDvdyu/qREWqh1ccr1PZILA7BGWpmMxOu2WsyFuT8jbE7ot52Gh2s0Upkz6tp/wuHYkBldGcWkWtyiDOIxnZ10wZma6bnQpQ+czxzhHdtgnpJJqxTC3hQuqCvd1y0+RHEMfBrdRNjO6XAmEfn4vxaRR579Ux8c2GHObih+mqpUFddeg2J+8aDU3Rhm6h7QT3TAb6HvFBTKP31XPe5eN/n8CAduDpGrGTLPRvF+BT9NCvvvwS2yVzz00Mlj66Yf/kpt20nOctopYP97CqIIT4qjxDS0XUmNBpOLlz8NRiUYO45TDcDCFEnotiHk/OBRgzpZVz77mfrp3fS2YgS3VWgHshexp19I3NeZPF0z6KrpMNeE5K4BZptoxFCUihDM8D3g7cO2T5T9pUei47n1JQsgV1iAKFWdowRM7s+Z/I2SWIj1UPinMec0smHyjGoXjEmXlQMOALtMO4S3rIC7FpLRRpV3j7oKkuRG01A4pERfy5XLM0Wi5DZSDkHaR2S4kMtCJT9yHKFP/xvF3uLj3ZuW9SpqFG7+lYHM4OPLnNcXjD39ncF3W4FWzRlJxeI3It9SsroUCzW5TkFmbVHvbe2iD71t501130ow==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4YqhyrFd3H+WjAXbxOXZiHSk/mjGaJN+W+dV5MX8/ucyfXIdOuzKgGKZb/L1Elm+2JJ1G9bcs/VdNONP5ZOmHhQcI4CYC7eQE8SkL7bgsqNnblAtgTLY8nk9gSlVVO3qDHr8YDMK3mnzCyibPl+upAQ6lakMli3JiNWer/BJgi2l/YXBW636yXwZl78al2gFyo3TsIuviH47hetyY6TqwUjumOMsuNQSOE7AdfRJDKLK2/aZRVzcWg1/FElmnb2IPEnJEu3Cv39H9sVjsWOlfey3SMB+Pm7H7jbx4y8AjTg7kte7mtD0yD69Zbvjn/rgrdj8EsWHlt/Yu9dQMedpcX5rHcEXQv8ypOgQJIBncsshLFcvc9NYt+a46c4SdwfE/YWa/rVOvs/7vyj/E3l/I6bDSHnAlKVLWHN62s5kqyBWmt9HQFN5Q0vli9W/EzBX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:02:40.5843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb3b913-6c02-4e33-3ac5-08de795fd341
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 20:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232335

T24gMyBNYXIgMjAyNiwgYXQgMTc6MzAsIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29t
PiB3cm90ZToNCj4gDQo+IElzIHRoaXMgZXhwb3NpbmcgYSBwcm9ibGVtIGluIGN2ZS1jaGVjaz8g
IFRoZSBDVkUgbWV0YWRhdGEgc2F5cyDigJxmcm9tIChpbmNsdWRpbmcpIDYuMeKAnSBhbmQg4oCc
dXAgdG8gKGV4Y2x1ZGluZykgOC4x4oCdIHNvIHdlIHNob3VsZCBiZSBtYXJraW5nIHRoaXMgYXMg
aGFuZGxlZCBhbHJlYWR5Pw0KDQpBbmQgYXMgd2FzIHBvaW50ZWQgb3V0IHRvIG1lIGJ5IENvbGlu
LCA4LjAuMSBoYXMgdGhlIGZpeC4gU28geWVzLCB0aGlzIGlzIGJhZCBkYXRhIGluIHRoZSBOVkQu
DQoNClJvc3M=

