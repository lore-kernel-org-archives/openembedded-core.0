Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3023CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 16:18:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web10.4270.1712765914901421703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 09:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aqiw1YDl;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aqiw1YDl;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yln+u5ghXJDOHqs1KKQrisa/UHVdjPwf1fehVczmoqXqyqrxMdKMHEu8XCVJzmRdR1IV8U9anPJFUOD6ZzJTx7e3xUwEiCMfpuGnD4yORd9nlATf/CzzWaT7l7YKXzb0f5Hzjl/7NbvDFD98nYiNJfo3TdzO0w84uiygUs0hNSNqt03n0hLQJwr+I3/fc6X5jBNVYKjitI38R13erHfAD6CIVEnA2ZMng7jhYM6MjGwU2mh0ShI5Tp/cMG/mDqQrVdADEiLv/s9O5uSXVwGiOzBiaA9ydgtv0UE42+FlJG8nnC7M7Inz+jQsG0Sx1YdnjipBCiBV33Igo+SrznPsFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSiwHNhdNfayssiEnEQWEYC2HBsAmBty4OnELEupkUs=;
 b=H+mRstbl1ONWBOmWUvCf5/Wi7xZ85pAMHMWy9evE+moYdfflQAo1Xlrg38wyCpDDMbsjTMvAvcNbVY8NKIeMRcX2QdW9IV40RBI8Qh5JyFf9WFHefF2YSAn3nHM9z04vt+Pdilcd8DbMQZzTTwsDPT19zmbg16Eaqqp3dZS06KRr/KA4Ox0tUnyZ0e3urOBgenu6g9ifD+Ip84Fkqc+Cd8dX1Ksykag6rnG7YK7x3vTI7KiM5HS8F1YRU4kcTkNYKrk06Rvc2iW8MMumWtmoyr+Ib4/jeLUiZCD4+ELBAosx26C6mujBmrLWtBK9hLRkslGT5DJsjJcodUy9VUSBpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSiwHNhdNfayssiEnEQWEYC2HBsAmBty4OnELEupkUs=;
 b=aqiw1YDlUCHE9XqAMmHFK+Velsy9drwiIzRyONoSCrdUShO9Ptqsgsb50GOMIyWixRQWqgHU/kAYmuigV2ko0/gYWHyig6TX9QuzvKIIDAnS2Mr7KQfw+zwliNZHSk66gff+gIXUd3MD9wVpvbTwGzL+ZCnXaptaStcNYnAsyZw=
Received: from DB7PR03CA0086.eurprd03.prod.outlook.com (2603:10a6:10:72::27)
 by DB9PR08MB6700.eurprd08.prod.outlook.com (2603:10a6:10:2a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 16:18:30 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::9f) by DB7PR03CA0086.outlook.office365.com
 (2603:10a6:10:72::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 16:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 16:18:30 +0000
Received: ("Tessian outbound 9d16f63426bd:v300"); Wed, 10 Apr 2024 16:18:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf0ba8a0ee4826b2
X-CR-MTA-TID: 64aa7808
Received: from b93473de60ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5E61B9D6-C548-4DE8-A9D8-6F7D07F91207.1;
	Wed, 10 Apr 2024 16:18:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b93473de60ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Apr 2024 16:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtRoYM06UhRDiMDZi1cV/9hmhPKYRGu8g7rgVLKY4B+Xsq8DRDdyEH9/Gqb/DqP/TUADxh8pxHluvzUw2dgYIrczZMO8zJX247iXlHmmYnzVG4uSQd6vD8uMWA20GZtsY4HVuRYMnXJZQsqhzo3BQatsFMXOgRb+ufhgyJ8Mrc+GYQNLUHIcSoul7Dmb7eWXWbz3meeFSVRpLff6kETLD27Dpbw3szzJeQG7js2heef0ypJPCqvxMavwiIgnzCdYYc4yzxjjRJF2gB/akXwi1d4UmmztP0tnw4OEPffULgc/AL/v28mtzMePLm8GkDHVBFw6EZ8MudxO3vJIMmuvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSiwHNhdNfayssiEnEQWEYC2HBsAmBty4OnELEupkUs=;
 b=Ew21O55IUXKvHYXWOhjZ9DJMaZkC59NYdLOb4dRXLwOckDa+4sP/CpvrYKv/1OiaOFxXuRbRePe4T6jbUaBCCdoQan16XTkVKHQTj8oAAWujmKyu1EW8nQ96tcgm7P+DweniEwH7KY9UnuEYClK7rM+XrQCbBQf8SUctfdqICCNkYkK41tmv56P0cmdydsvbhM+0R8GMItptjjxQ4+dxfmt0XTE+Luj/AIl8QKfT9Rm4O828CJpda0BJDU7YCBZxnIfmUUiboyK7vo5cIuf3v3YhKuF+yMAWxvTwiGapATTHx9X35r6tjX3sD1rD+8Mi3NG0PqY4rTlz72HYPvbbPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSiwHNhdNfayssiEnEQWEYC2HBsAmBty4OnELEupkUs=;
 b=aqiw1YDlUCHE9XqAMmHFK+Velsy9drwiIzRyONoSCrdUShO9Ptqsgsb50GOMIyWixRQWqgHU/kAYmuigV2ko0/gYWHyig6TX9QuzvKIIDAnS2Mr7KQfw+zwliNZHSk66gff+gIXUd3MD9wVpvbTwGzL+ZCnXaptaStcNYnAsyZw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7509.eurprd08.prod.outlook.com (2603:10a6:10:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 16:18:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 16:18:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYND6p/3Rsy9aEO8Y3h9yFvSNbFhslaA
Date: Wed, 10 Apr 2024 16:18:21 +0000
Message-ID: <2E4C61C4-1C5A-46C8-A193-3C484F5D634A@arm.com>
References: <20240408070450.27686-1-peter.marko@siemens.com>
In-Reply-To: <20240408070450.27686-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7509:EE_|DB1PEPF0003922F:EE_|DB9PR08MB6700:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NsyinmXtUQappAj+DxxDWt3pw5aFhK2PER8fD8gj59dmMoAwaF+6k4eJ0/Cqj4pamGTE94x2whkGpzKFywGU233sItfSuIS8rw3nabF0Ukx4spY4wMssoMOI2n+dghdx/o/HGJ7xmeUzXAVdzznprPikCnO5BnBCNmo4VUmqwgbr6A+PLRQXsBJHJ/lX8if/6Tqap63UGh8LmKoW/G3tO9spVFNEg8eNu9nKauSjfYMFd6RUuQoyTF37yqPMu1uacSLCmkFRdACz4CHtclfT7WojC/qDx/vCzIf73dY2tHRyA0LiXLYnCbmIvdHU9K6M5mn/eEGgp//uEokSzVQV1/JkLi/FNuH63HPrSbjFc1vnJYOQOQpyl5XQAiL8gPkh5RYI4jfQQnpOajPsJc6KtKcpuAZvjZbdIh3wFstDTbTlCSWBMh4FsemEhefqb43FqzPmYjz0xewxZyUMxEOZHiT1xh8sVV6TlHmw3/2ly4lmejSkoeAevZ1smLvV9SXcwDnozVr/GH8Pm8QzI5u3E4K/ITGaKkZo/VqG56T+HVR1uT7UwBnh4rY2GhQSEOl+e2DYRBAeX7cY8x5D9lFxtjqp7C/Fv+gjMM7SWdLksZN16Yk2KtSqwj+fARffC8C1QIjXKgKu7MvJaSUSy3Gc8jqAfwzDAUGxRzs3BhXqxRM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <49598E7CFC1982468417CBDFD08694AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7509
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f1343db-7038-4195-4f3b-08dc5979dc87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0YZFL5XjWcI7NU1lJawuC5enBOcxGAfjGcA+vFl8nb+C52TUQNojZWyylDz42aI4w57VeteXApE1/UqCZA8c9556U25k6Nv9UnVRuZv7wsAbMEA+vtUVw8A8ZdLCnxGdUhFwTM4vnwwQpqPF0yHlj6sT+Op/l78+RhH98rdkMN2r3ifS42lnUTVncJH8Jq3xbazI1MYIYbxGSK567OoJInIfBXOVlZmhwGg/QRM1qsgmDaSxIRB2xDdzudt+4ch8Ox2KLa4CxUimoiYeB/dgbWQ2r19jBf82j0sZtuG0SiLXb252asMJPFN3TKJZ2jvginH6B2yPXnCrT8LDjKbR1l/jR6Q7MbN9pI9qZOX9tGYd3WEFHfjQtHSqWrSwpX8aCwEJd1WDihphnVNaWOQ/xsTeuYtO3JscNdrK6E9cOcBuptvYsStTaqrUx7oGxz+Znuhj49rpZfTbv5t0pJJThixXo+Y1tIr5Bu4dM5m0UpBc05F1rbryaVbRgDXzXtqL6ZsvA+tSlRtMl78LslqIPvrJCJvAzy00Y07AJQ5Qk3QkG7V1MJSiO3JdzwZC6FDXy88UZgXvOWl2XNQw/E03bVoedQA5OVbJ46MLPL/Rfkc5ALsMOwXj7eg25RzCjV56Ka7H8e6kcGRCT9M3GOrj9TkuTfGsRQrsCIcxH/ZrPOH5zWSKojT1/6NVMWu2r9WgKzXLb2up8YeFo0HIYApkFK8U5nG9DfZURrarntyVCTV27nRncP9/sTunnV+6FBRB
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:18:30.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1343db-7038-4195-4f3b-08dc5979dc87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 16:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198102

T24gOCBBcHIgMjAyNCwgYXQgMDg6MDQsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4N
Cj4gDQo+IEV2ZW4gdGhlIHBhdGNoIHNheXMgaXQncyBpbmFwcHJvcHJpYXRlIGZvciB1cHN0cmVh
bSwNCj4gYW5kIGl0J3MgYWxzbyBpbmFwcHJvcHJpYXRlIGZvciBzb21lIGRvd25zdHJlYW0gcHJv
amVjdHMsIHRvby4NCj4gU28gbWFrZSBpdCBwb3NzaWJsZSB0byBvcHQtb3V0IG9uIGl0Lg0KDQpJ
4oCZbSBsb29raW5nIGF0IHRoZXNlIHBhdGNoZXMgYmVjYXVzZSBvZiB0aGUgZmFsbG91dCBmcm9t
IHRoZSB1c2Ugb2YgbWF0Y2hlcyBpbiB0aGUgaW50ZXJmYWNlcyBmaWxlLiAgIFByZXN1bWFibHkg
eW91IHdhbnQgdG8gbWFrZSB0aGlzIG9wdC1vdXQgZm9yIGNvbmNyZXRlIHJlYXNvbnMsIGNhbiB5
b3UgZXhwbGFpbiB3aGF0IGJyb2tlPw0KDQpSb3Nz

