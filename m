Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5B7CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:39:10 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56174.1780929545849264324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D/E74VMY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D/E74VMY;
 spf=pass (domain: arm.com, ip: 52.101.83.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xELLNbVZTV4D1iyB7r3p01s1/Sgmm1OTgUhbykgVRa80BZmG5jRPLRW4TFvfsKKMGObjyoQyrJIStDdSH2kCk+L6UfHfCSFxiBruFS0WUEmRUZq6osW9eOVAb+NxVh4RgPJgw6xMi7qh9LJWJj2gq9rzeFVjakpdcjxOQZ87XbDfpDgGibhDd4QKLxwV8TOTbKcU6nTv/F/RdmVvHtwxFYLYuhZl8OlF8LuAunXypx5peukuuRhhIxPyt892kx3Fi4bfh9xatvqEmmYO7jyRwUEyV+U1EgPTcNboLvJ6MmTuwKYgdf4kVlNpPVJDQpIh7IWuzRHZtK1LuqJYHYLtLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9yyOCV2Uvl8/FoM7GLUVTmFVjT6WBLSuRZW0Ex7J0w=;
 b=jLdw+FdTvg641mI/ffDjBpC2x11iA1ze0xxqy2UoVqC9RYNj07rlsHOeoM1BsAJF5LpVqjms07O2TLVhHiRT1ggSfhKxt3hPvkobV+nJEyRt7UXu4JrvSSikPyMUSA6fK4sdlft80BmKOTMfejn70I2NAQpbhyc8Jg42kli3TB4XuffJP0VNqxP4GUWo+VwhwzORYTsWomdDAU86+PpSM3y/9gI7h0mHRCpo+CgFBhwW2rzVMlkK7yZ6Bb8Jp2C44S/B/ggg+8vLOBELzD3T4EqQBMNjALH9jmlc+TFqJu2tzgJcyR3pcVZMduEYM180AIq8zgDcCDD/lZs0tUcDxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9yyOCV2Uvl8/FoM7GLUVTmFVjT6WBLSuRZW0Ex7J0w=;
 b=D/E74VMY63yAE/Av74aA53mlfj5A+eRANCcGTJ97XrzD3A1XT2AYn79BntRots5xloWZyfLjH2AYIm+cs5FRJa8mVV3DdYr23ZAfEgM6eDbs+jYCrQ7/3iGbe4cJFZtC0/MhHnC05cv0/+gxgJC9IT0GP53O+qBGQ2hFmWonoKc=
Received: from AM8P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::32)
 by DB9PR08MB7747.eurprd08.prod.outlook.com (2603:10a6:10:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:38:56 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::47) by AM8P251CA0027.outlook.office365.com
 (2603:10a6:20b:21b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 14:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 14:38:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIF0MpN6xJWj/u0ox9bDurhZygaXtlfmiGOnFHsEAPTIsvqH9nhRgDbEXjwHw/cJpZOJZVkILN3DSnNBCV678oRjr4sSPxqo9SDZmPcr49bPJRtT9gc/hmglN/vnXSy/39H20jNxPXb7lx4pM6gocLX0HpY+/0CzbTGYq3KbLa5xcvfyXxgG1wzNcYeJ7kGnZ7zkD/Nv8lbtOSe3Y4/2mqWMjsAxTBJ0hEbnhNUli3k6XhJVTDeHJjiGxWn17D/THlq6tv4G/fkPBEm0MxlOOTjJ2NJl3MJBG8jGqirhT9SYd9f4QvPneKkM89357WEOkKrTBtJmjqfuJhxGmpeb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9yyOCV2Uvl8/FoM7GLUVTmFVjT6WBLSuRZW0Ex7J0w=;
 b=r1rgd237bF89iRQtOpSZaAKTsaL0SqKDxYytXrMxyCyQXrc7S6hWjlJZ28ezkk5a9LBB9ZZQcvUDAybYk6YTwY1V/90wXHg+esh9nHaCyX1HWpzOt3K8qvL7ifoI3g82rfPaGzyh4B5wE7DA3F1oYe0nh9KUl95Oc7lA5TBbsCuahyblGZ2SiqDj/env1dpJCaT5aXS70qTmalIdveVAsgxxV41va+kIsFSmu3FtVaSpdFAWVcEBXyqb0PBXzg3qoVZrt9cK+sIaiXd0U8djkUbn8ILyMNCUKCbhj8t2i7MzJiZriC46gGyGogm1I/7qGtZMdfOrQvfF8SokxA8yTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9yyOCV2Uvl8/FoM7GLUVTmFVjT6WBLSuRZW0Ex7J0w=;
 b=D/E74VMY63yAE/Av74aA53mlfj5A+eRANCcGTJ97XrzD3A1XT2AYn79BntRots5xloWZyfLjH2AYIm+cs5FRJa8mVV3DdYr23ZAfEgM6eDbs+jYCrQ7/3iGbe4cJFZtC0/MhHnC05cv0/+gxgJC9IT0GP53O+qBGQ2hFmWonoKc=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB7533.eurprd08.prod.outlook.com (2603:10a6:10:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:37:54 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:37:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] gmp: add ptest support
Thread-Topic: [OE-core][PATCH v2] gmp: add ptest support
Thread-Index: AQHc3YlogFw4niosp0q5xfDIaEqHJLY07aeA
Date: Mon, 8 Jun 2026 14:37:53 +0000
Message-ID: <7043DC83-A483-47FE-B755-18747604E425@arm.com>
References: <20260506074618.15882-1-pratik.farkase@est.tech>
 <20260506185128.10489-1-pratik.farkase@est.tech>
In-Reply-To: <20260506185128.10489-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB7533:EE_|AMS1EPF00000047:EE_|DB9PR08MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1b70d2-f8d7-4bc8-42d9-08dec56bab90
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 Lq1pfThjMOPq3c7v5jrOG1J9unP3qr3Wlz1XqSb7TZCBGSxQ7KWrP5ir0BfuoLV0qtl/zGPLunOLAWaLGrHRKdIOooom2/BWAkYxHveX+1btOhDzKm1dcArdxRUk/EYD1gLFdqZxKE05xLELSBKyapAwlekG1m05j3mHYx9PGt/GkcVHiDeGn7RAcJb21YjzW2TTWckCmwdC6dqWW7Irr7SYgnoNkPIBSU9gCs3TVDIFPcBEEKtzoiUD/M/jHLDH6lFxpAu9mguMiXwcppOF0DuUSZAnLnP6ZN+jsf8LW0FM7EdxelU5CTqNSG7pcP2BbWpaToyuy9FJ/N7mQzvNrLKFornvfe+P5pluzNcxnP2XaWJ4JnM521XtDH6zsAh5WfJ6FfJLp7rye/j0ghRXdMmKk6JIcPUvQ+0jjhvpEYObWQDZDdLz9Bs45yM/k7lhFXM/rLPfAeq7QQQnc8YFJifgjwPRdYttrwKg13yJE4oW/S5aLHSlep1Up9S/LQDA3J1W4QV6CrlwEJj9bYGbKNpwGnsWsbBqhMEfLZH5i96bdMrjXBrvTN27pHjtcwsGtZR3WSwuYu1Q/enzAH8yAj6WrzRIifSQMgzilLaDsHuUI9KmEpYHo36MT4iVLDQvLTzqiBH5DvIR1luUeYCFQdmjdRxx9Q8FR7XTIe1u4410X5HWkijhJKZFx2y8GB3jas42wKJ2KFDrpnTv165+Ibys6HkSOF2w7tlHdrxcThPDLrEJ2b3Tqa+HHn0Bkxlj
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <37A23EE73CB14144AF06C4AADB77976B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 rK3I0vLSJECLqWC2WTtfA2u7m1WN9pPdQ/6VL9JjXkFANcZQznHqvDy6eU+3yEapn7NshbsqzdtybvKdW6QnYTAUhrqBv49qPFwNQJO0acl2Xeu14KFEqvFf4gp6Q+mG0e+nmrpF2DYq45a69S/2UgoKBqgP/Tss8EZJ1ZK55cEc/RnTwZp6fWBYDzYGHFHBgpv0RizwlKtDq2x293CXPDr4yqs665a3tw8lTKa82vMz90CFlLcAAhmKlWYGaj9QsgN452lc2XxsSBl+wD7AgFx4qUd7QoE7ZLCZRj2dEyvBOtjqxNofat2PjriduAvhCsGgyW+FN6z3vMKsWfstOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7533
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b993e150-c41d-43a4-71a0-08dec56b8656
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|36860700016|376014|82310400026|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Njuf7DTmE9rYxeLJz/Zu6CuG9WfXgo6/jkAyh1NheeAJlFa4BFHAOpoK52/v83LGSJ4HjZR803tk66tplxL0wwahY6jq3o/HMcH+FvslDZW2TfKmCtWrI0Q1qHYECd9/RY+KgyX+NIk1egiGVsSeOJf0Igcs1i6nEt5UQYRxKGl8yg/yhuzE7z8muFhredARYP8LE1fGp6G0XyvGIns6rOK8ed9ofoI6Af92WVU+05PJ4yRVJJpgx1qKa3p06lVijKqdSRlUztU8UzNAlWMxbsUqtM9lKEPCoNw8SWXerOBPOD6grf5BSt6UWRM3VHt7jMeTGxG1JWqMAbUBVr+SUIa09ofUpEARS+DOyymvYumCn6mY7171JYaMuD9b6Lh1f2erIZu1Bq7RgD2C0tCB/KEBsBoRFXKByDfXA7DCsH4Hf3LOz1LMcZI7xAN2/K9BZjWllWLL9jUSEumCNbPDvMKqyi0+dHtMlO0V/4Hrdb7QRBglyv9YVdR09/RM6r7RtWz3N6amrgMajgbeSa0lqbed4ZDWRT5A9KHynt0ZZAK0bZWwJ/JQ8l0YzO8E935Fio0H3yzARccwMd1Z0JKYYToCiIz7K2Np3fL5MlmX8jR1w2rvA5fTdwMgUTnyw4J4/YAanhmbZdHitLATfC3FkE07I7dCLLnhSsIF+wdQ+yyMLHB5VsHqDucMlQRYFSEVAaU7hrsT3xpYyOjMNSFuQEBAgYHexmI0Gwi23nhCz/A=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LqI6Ctk5qhHjK4EgL09KgHrdVgV7/MyWPJg+LNlv7TTI95Rh+sYftOA4SkyKU7Mwvq8c/qgMhnOHmrw+/sR1LuiTZwwWKz9AYji9BOqJvnbHX2qYily3sSFiHT+bbOgM+oYuXKXpVBAD53DSdJ3zdzyxATkKofFgzx2wMMuPFv1wBxJbKsaVnLtwRE8O9Vz1OeSU3/epX69byY69HCwqW9lSDxggZQ0QHbnA8TNDFRALh6UXKukbJM8xJxSsuG/Ulwlm4uObf+qXyxbdE32uUp8cjzSw0F0iemwMWG2kQdrea/nhLw2yQGtUirbHMByfO/DBFz9Ej7psYSRLtqDCl/oo5zzVxjdSBENVN9yG+ghPwqTY2fNXMg1pUVtoMIodwq+8JYLJ3vPYFdllqx9mqe60OKdPv0dl+SPRNzkhfO1VyKicsOZvvmOENM9prXtn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:38:56.2778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1b70d2-f8d7-4bc8-42d9-08dec56bab90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238247

T24gNiBNYXkgMjAyNiwgYXQgMTk6NTEsIFByYXRpayBGYXJrYXNlIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwcmF0aWsuZmFya2FzZT1lc3QudGVjaEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ21wL2dtcC9ydW4tcHRlc3QN
Cj4gQEAgLTAsMCArMSwxOSBAQA0KPiArIyEvYmluL3NoDQo+ICsNCj4gK2NkICIkKGRpcm5hbWUg
IiQwIikvdGVzdHMiIHx8IGV4aXQgMQ0KDQpPdmVybHkgZGVmZW5zaXZlLCBqdXN0IGZhaWwNCg0K
PiArZm9yIGQgaW4gLiBtcHogbXBuIG1wZiBtcHEgcmFuZCBtaXNjIGN4eDsgZG8NCj4gKyAgICBb
IC1kICIkZCIgXSB8fCBjb250aW51ZQ0KPiArICAgIGZvciB0ZXN0IGluICQoZmluZCAiJGQiIC1t
YXhkZXB0aCAxIC10eXBlIGYgLWV4ZWN1dGFibGUgfCBzb3J0KTsgZG8NCj4gKyAgICAgICAgdGVz
dG5hbWU9JChlY2hvICIkdGVzdCIgfCBzZWQgJ3N8XlwuL3x8JykNCj4gKyAgICAgICAgLi8iJHRl
c3QiDQoNCllvdSBjb3VsZCBqdXN0IGRvIGEgZmluZCBvZiB0ZXN0cyBhbmQgbGV0IGl0IHJlY3Vy
c2UgaW5zdGVhZCBvZiBoYXZpbmcgdG8ga25vdyAoYW5kIGtlZXAgaW4gc3luYykgdGhlIGxpc3Qg
b2YgZGlyZWN0b3JpZXM/DQoNCmllIGluc3RlYWQgb2YgaXRlcmF0aW5nIHRoZSBkaXJlY3Rvcmll
cyBhbmQgdGhlbiB0aGUgZmlsZXMsIGp1c3QgZG8gImZvciB0ZXN0IGluICQoZmluZCAuIC10eXBl
IGYgLWV4ZWN1dGFibGV8c29ydCkg4oCm4oCdIGluc2lkZSB0ZXN0cy8NCg0KPiArZG9faW5zdGFs
bF9wdGVzdCgpIHsNCj4gKyAgICBpbnN0YWxsIC1kICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzDQo+
ICsNCj4gKyAgICBmb3IgZCBpbiAuIG1weiBtcG4gbXBmIG1wcSByYW5kIG1pc2MgY3h4OyBkbw0K
PiArICAgICAgICBpbnN0YWxsIC1kICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLyRkDQo+ICsgICAg
ICAgIGZpbmQgJHtCfS90ZXN0cy8kZCAtbWF4ZGVwdGggMSAtdHlwZSBmIC1leGVjdXRhYmxlIFwN
Cj4gKyAgICAgICAgICAgICEgLW5hbWUgIioubGEiIHwgd2hpbGUgcmVhZCAtciB0OyBkbw0KDQpD
b3VsZCB0aGlzIGp1c3QgYmUgYSBtYWtlZmlsZS1nZXR2YXIgdG8gZ2V0IHRoZSBjaGVja19QUk9H
UkFNUyB2YWx1ZT8NCg0KUm9zcw==

