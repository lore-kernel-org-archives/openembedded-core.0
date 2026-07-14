Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2533C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:47:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8907.1784130447691291503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZljUQIzn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZljUQIzn;
 spf=pass (domain: arm.com, ip: 40.107.162.42, mailfrom: ross.burton@arm.com)
Received: from GVXPR08MB10452.eurprd08.prod.outlook.com
 (2603:10a6:150:149::16) by DBBPR08MB6186.eurprd08.prod.outlook.com
 (2603:10a6:10:204::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 14:56:52 +0000
Received: from DB9PR08MB9562.eurprd08.prod.outlook.com (2603:10a6:10:453::22)
 by GVXPR08MB10452.eurprd08.prod.outlook.com (2603:10a6:150:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 03:47:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NGaK0rhRRnvA6OU0PGNwh40UZYx+sGIueVp50cL6U1qVGrlN+DDltYRfucQbOvwXkgGA9+w3/vzqrPlYMXNhostcWkQlOHgmz1ksnxlaofSFFsagQEv1dlOSi5+wHlcssz0zzu+aDzcUVArmnM5QKTKBxtonlQ8KBVG0cPUcUDB7g+my736naZRHu9sXX8WrEaHZwR55igWP/4EaCu7olNuYJfkVXpLO1+Sypi9vvsaxsz7o9NTZ8oS1EspgrfaGn5CB5xdGofA/SVpqCXt+q4eGqJK7Bdt5pWXSRn4mj/Tfw8vZt4tFVFPPrvnmq5ypWcQIfjWOr7/VVmmfMDNPzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6kWmou9KMk0RJGfANsyCqaMjQhEzyVG49UuNUR1ylA=;
 b=s9u8uktRQ4EUKTqG1La70/+3L9IBh8TqxldqVE5UKubC6I/hz7oL3HjQAlZXE8vLuxUkR4GTpXRKz5SC+ZHkeVrNYPxXCQJwJZ+WNm+w6xZpX1NnM0/Yr5nIaC1jEpIY6EfAIpe35qCQ17SuN6i44g1SRJRlu8iKUAoh4abwYmRuSVJ5hvYlc51gxbi6jcx3VkG29p1n9TjLTaBNoXT0+4fyJPgTqRSDs9DtNUHp1q+lz6bU0R0+NHp560+fheTmwbWVNr4DM3SDeYWnQ+BOjtJ/rSwA/1iy12yaj2jDfZaA222MfqRYkgogCC989f8iOHDAROcXqNmxVUBf5XWsXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6kWmou9KMk0RJGfANsyCqaMjQhEzyVG49UuNUR1ylA=;
 b=ZljUQIznff+/wUdl1fGjHGKTR4c3xsDPd+IxcM4v/GglFQV4XgMIdpsXELpKxBex1UwfYy5CKT8oNqNRA1kl/PP5yyt/jf08FxXv0Q/AxCeITTPo8FIv/eMbvHHfF/vV2Fjty8JwdIhL7O799huBEKcAEJPQTRkQIrMMna/SUvg=
Received: from AS9PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:20b:462::20)
 by DB9PR08MB9562.eurprd08.prod.outlook.com (2603:10a6:10:453::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 16:40:45 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::41) by AS9PR06CA0004.outlook.office365.com
 (2603:10a6:20b:462::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.20 via Frontend Transport; Tue,
 14 Jul 2026 16:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 16:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/EVjyw4hi5WiDyvxO7Zrp/Nqc1obpg/n2wpC05cOEfIHjYSWOyrL+FYh9xfdqH2MzydmBMtlVne94z2j0n4O7Up9jD/mLHJl89QmrZsD65//KxOp6ljEClK7h8xva5iOx3hqiaC1uIPqPj2mYGHjMzbVnmfsedNYC1F2Fbvl830efDI4WbfB4X2+H0Wdc7WKLrcUwibGtiaxbMqvBO8buQDK++bX1JtqyaT4u8iSgY/tDqO7T4SKih0v8rUFN1SL3WrBYXInJVFeTUwpHORoe88EhbJOPjDAw8VdixKCgAuu+r3Cyu9iEQjXBlY09wiMVV1OKmjxFCeGaH92hdekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6kWmou9KMk0RJGfANsyCqaMjQhEzyVG49UuNUR1ylA=;
 b=maU/AlnA1R/S2f4XHxx/DUOouT7JDASMWvr2Vbs9c/MYa+y6Whs0wMVSUckMG1X3vsUCY18UYQw3PRSsfg71/YWDNAodFywW8UxP7XmyCn0OomMFMAhmEV0HJu0ylQoYAxyJQDxasl39RuazMVOfCwHgsRTCqNUEl2W/hDbKUVrveokol+sDgJkm+/+9xAMGxEafI5PWBKJGODS07uXiF2QyFoVp60K7xT2LoZN9yigk3nyiXtm1loVS01Tu+cQ1wvyKrgL5QOTC6633ckl8bfFQuPUt/Q+sgSJUv1REDSfGpEEgnlZLGBdZjH3hOloGqjDGR3xeLVWDRDc+JjgJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6kWmou9KMk0RJGfANsyCqaMjQhEzyVG49UuNUR1ylA=;
 b=ZljUQIznff+/wUdl1fGjHGKTR4c3xsDPd+IxcM4v/GglFQV4XgMIdpsXELpKxBex1UwfYy5CKT8oNqNRA1kl/PP5yyt/jf08FxXv0Q/AxCeITTPo8FIv/eMbvHHfF/vV2Fjty8JwdIhL7O799huBEKcAEJPQTRkQIrMMna/SUvg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB11226.eurprd08.prod.outlook.com (2603:10a6:150:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 16:39:42 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 16:39:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] pkgconf: upgrading to 3.0.2 SUCCEEDED
Thread-Topic: [AUH] pkgconf: upgrading to 3.0.2 SUCCEEDED
Thread-Index: AQHdE1OpaTBPCUls70ODK0jcQ5d7ibZtOAoA
Date: Tue, 14 Jul 2026 16:39:42 +0000
Message-ID: <FCA04DC9-81BB-46D7-82AF-137560376239@arm.com>
References: 
 <0101019f5f238733-986e42ca-2a90-4b8d-bc4d-61f5ac444525-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019f5f238733-986e42ca-2a90-4b8d-bc4d-61f5ac444525-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB11226:EE_|AM2PEPF0001C712:EE_|DB9PR08MB9562:EE_|GVXPR08MB10452:EE_|DBBPR08MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd8e6c8-b27e-49ab-48e4-08dee1c6a6df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 ScLUewgByU8XY3wIjfV4SO5yPwG0Pe7YL0AovA1+BMJVcMhL30VmpylRlvmQZLUKk3dNj4RGzHN6m+73dxf3FZsARTs/r727ZQt0jzqnW0XCIW0OaQb4i5+/cSrecqkE9cJoJKTsOWlPpdzzbT6XTnqyFVrsYxmRhsK4KIO+uUIEZ6KFk/rKiKgznsaOdsq749B0qNyqD+uNraeRZGSq/CAQkmqzhyHl8FhsABfyK59bjM4YlyDQZMnA2fh7OuyfSCNZobnaV2eeA+AAHf+zBTPYRDc66qrZjqIi5R/gxMICRxf1hr+fTRfAaUeoJT/l05/qsz36s+W56432X62GM0HJVzsc8ijISYYZ4rGBwkyF7LyDMivOxeUQ1Y9y0EBMBQwLrORtwoB/NLTkvYteRsoSEl0UCGum3fHyP61ZwgXzYbLSp0eUUtvmuUZ2HVgC+2Las8YGrQSBtxiCHvDgtM6S6A9ymqsuQoq1eZ1z7pMDE7z477nHrz924aoPbEhK3pnxl6XU95YeisRkNtdmD16sowdKe/UyotD2HDBnhuDIRBsqkJhZLCPslouwxGeRn09xGEY2aGISCi7Zun5gpWcebyHbJL4BHnQs9TlM8MlAfQP8CeVASNKMS2JDxiMopbt7trl5gePT5eWZHDJGebqtYedHKlom6ZHi8+7zI7byiL3Z3w3zXYRMwwF7D4TXCbOMwah5KUuLNkQi8ZL6yFBxriI0kIdnI70gmZICLkI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D37CEFFB9F9094882023F11E8352345@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 S+v6XBlS/7wvzLQ44Aogkyi8jOgyuhh0XGYFksI2CTX1PN36s6aGdeMcDyJAS9Wmj5/s2wOGwUyW6s5qropQNvrsSDZz0uAsYc0gzrSGsDm13FXJsbz8EYVTYKg20aBFtDtNkQnbumcB215/TXb/AGA8qSMsD+GAUjhXSHdPyljAAlHfFcRN4LMR3RJUQSdPIOhfNcTiWd6rw9C8/+b7H7qH7VPWWZqzCZAzfljgSodPeGfYEzgK/ZWLXD7e7jrwg01Sg2HEtL4E30NfkJl+s1BnGOws+QVRmeJmrl36lQn+egdrhrTqiO6NoplLiVbqGzlj7Z5boUph/04kAlSaqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11226
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
 7bb62b6a-a40c-4ead-8634-08dee1c681a2
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|23010399003|36860700016|14060799003|35042699022|376014|82310400026|1800799024|13003099007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
 MDnbyMiC4SsxL8lq6cGgUJPb4IzZAsd2u3OnNt5HEM11FR+btM/zd4rUFJqpwZveq1lXIg503pDNczmkFLsqr3SNEhhEZX/hJsp7uYDCohQjkTU2qoxTdOe88EoFVaLcLpkaVqlb68ANjf1zpc58MIZ9MZUDKz7PCBZea+wOy0+/ybRhnFANVHaN9dJSP1VOSxV5lj0CLxRczuAhiAvOBQhfoukMRTY1INb75ARkhufanvF84gnbueE79htpUmFDX8KSM0X/51fNX9m7ZU/AtE5vpb14FkJ8mN3qKn29VbOM7y2HqmSLitpJIKYDH7U6U3Z+XbmD9LTEgMpqd8ZyqshKCKLcZhLtFryL5j5UnylqCaLS1kZA74KMmw4IiONl/fZrSk8oH/eOEDOq5CyJT01nlbtwSs4k/fU/wL8/6SFTx46E1llmhwSxwpos3xoy4xN3oq7E71Auhq9YTnuBsc+pQIc26LU6qGDZdx6L7QytbPDvGy/qKGdY4XtOHhUS1mg1Sfs0vLvFfXD+oBkph2cae5tqPLU3BO8UsSWvPDV7BcRDyu+mYGlhUt4YPHQ0YMFPffz1gOwAgXlxPB5RtU0nuaizIyO7azXZMx98gwbKAerm1b6y2P6ZkN0ell7rstoGWD6zIqN7fWshNap3CZCnDItLX0tVUiQTLh7Ib/kf1HA+p4eq9c4xBreeIvRrYbojdZU+P39/Bw17JTc+9w==
X-Forefront-Antispam-Report: 
 CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(13003099007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 zi9Z5uUNuycM6u4Oq28KVM3PmJtJHYkZYGTZi1uH5yS/LK2doKWNwoQRQfG6+swkWRjQfqd2OzkEV9PxoH9jMUcub720QoUuOVGqMjnABGjbTbdLpvkd7TZcTn71MrBjykv1uhN5Nqyfh2DwQYbamjvvJvBbde6iFiSufc7F0Ho6RZnI1aAq9UjkNadTbQ/ZCGqA93NRj5WbQWmQUlWqJNUWbYapKso8E5F//1Q5GaornZBmocUZ6/bilrCHgylFe4RiNpVltSpm5f6egTUu8WV3Gn3/WfVgeG5rpdiDhPQk9z9xtodsWkWS4E5nXRjTcAq5IWd+VQiu/5+WsDyJ5+ZSjj/F8FYQ7qr/McSkKuIRJSeqf0pKgTItGhbAqBxfXC1GOw1iNZ9Pfzl4np3Uhf47mzumB7lTLF1onMV8l5NNCqJYt7/O756jOG80XeiR
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 16:40:45.2273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd8e6c8-b27e-49ab-48e4-08dee1c6a6df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9562
X-OriginatorOrg: arm.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240980

T24gMTQgSnVsIDIwMjYsIGF0IDA2OjM5LCBhdWhAeW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4g
DQo+IEhlbGxvLA0KPiANCj4gdGhpcyBlbWFpbCBpcyBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBB
dXRvIFVwZ3JhZGUgSGVscGVyDQo+IHRoYXQgdGhlIGF1dG9tYXRpYyBhdHRlbXB0IHRvIHVwZ3Jh
ZGUgdGhlIHJlY2lwZShzKSAqcGtnY29uZiogdG8gKjMuMC4yKiBoYXMgU3VjY2VlZGVkLg0KDQpU
aGUgdXBncmFkZSBpcyBlYXN5IGJ1dCB0aGUgZmFsbG91dCBpcyBzaWduaWZpY2FudC4gIFNwZWNp
ZmljYWxseSB0aGVyZeKAmXMgYSByZWdyZXNzaW9uIGluIHRoZSDigJxwa2djb25maWctbW9kZeKA
nSBiZWhhdmlvdXIgdGhhdCBicmVha3Mgb3VyIGJ1aWxkIChodHRwczovL2dpdGh1Yi5jb20vcGtn
Y29uZi9wa2djb25mL2lzc3Vlcy81NzEpLg0KDQpOb2JvZHkgc2hvdWxkIHRyeSB1cGdyYWRpbmcg
dG8gdGhpcyB1bmxlc3MgdGhhdCB0aWNrZXQgaGFzIGJlZW4gcmVzb2x2ZWQsIG9yIHRoZXkgZmFu
Y3kgZml4aW5nIGl0IHRoZW1zZWx2ZXMuDQoNClJvc3M=

