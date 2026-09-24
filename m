Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AEEC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 10:59:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4968.1790247589158206558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 03:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=duDrr8y/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=duDrr8y/;
 spf=pass (domain: arm.com, ip: 52.101.65.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qbx0i6P4kCczFRVdx0HzCFtYXFaSDk+03fthBEgdK1Wg684LCFmGOKO6we6TkXxHlh+OcQijNeN1sK6xfcR0wGP1JdS9JiUWgUKxKkd3rwfaOaBzuxJDPDVuPKNEotOLvmjL+xRzlMezLk1rarfsvjpRdOg7KPjOK1QFT8USQlkl+Sl8yqI6r/BhOBlbsDILW2QRwui9xJw+JA1bi19sNJvbQow6MrGD6f9Tko69i351c3Sx83Se4z/MHpnS6gHD8qyM7Sdq1vx9HM8UqFPW8u5Dj+pbwppmTc1SURGVcSWaSi5ExY5ZT9/bW7T3bJJ/j0oKOkfWGaV3Q2F93KUDTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXAr5lprXPIrDvFNNzoKPn+7NDerl2n7pk7uk1z7xX8=;
 b=icNUBJA58uf9m134gZN+jtmaINXPF3ZBUwY0dcZ3j2PRvR1ft96Xdfi2YmOzNae4QPGEUsNTbJ+h68dhMC1dxxvwP+4yPSRHfkZWxrU9oN0tJ+S/ZlegwetWiGQTIAqfYLEn34Gg9V8cfkmqbXpv9o+AyNl5rFZMyFRJFPl8ookrisRYmgAH16dh/cE7094sL2B5a7UF7Dyx/R2QODGh1lYTPWQKqp/jJPG3Fcfjvt8fRbofD9wLaFiqKRr9PClsf8KmekikpR3Id55zU9MWlzIXStIwxapf7relrFTlpC/dGPJ6kPnFMwOPqdFX+zj7ZGSoz2VFevEdnkArPOavKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXAr5lprXPIrDvFNNzoKPn+7NDerl2n7pk7uk1z7xX8=;
 b=duDrr8y/WMCSiJ+T1jw0I2akvS6wgQm0QZcIn4Uf3C+Gcx0oIKO9haEWgV5tqv8BXhQxivry4FwCP2VufojAc1FJbnGknLj6kzibgrLxmkkZmCwEaCWWq820osIN0FLwMDqhRNtE2Qik+Wj50dxMyfllHSpKc7HZEEr9Uc7NXAA=
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by PAWPR08MB10167.eurprd08.prod.outlook.com
 (2603:10a6:102:364::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 10:59:44 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::52) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 10:59:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 10:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnN6VvxUDTOWE1An0F/PNWADx2OTpxjD4+hu44yynwZi3jqfIJevL4s9B4Mu3H1HuaZMwpkIFYXxojVL5ETNSTpCr+Cyt+yP2SuPA6zRy/QvdTW1lp/QXDmLcdg9Lm5V+ZqweEwd+GkeRuHwR7y+T2kh+voTXT50roeSgXmA7rULMrNqrbNPQIeTILQjrUVmcQgjFnNIPQoWm2hwlPrFd0C8umTJJchRC37/zhfRd0tvJ1JVMe+qQflvx36SPs+aTFFuyTKeF98jzFYrlLze6Su8bnR/FwvnN9RWGqFvR4jfaJn/yNY+o9992fPFcDbO+tqTt8KQtg74zTXO79Kjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXAr5lprXPIrDvFNNzoKPn+7NDerl2n7pk7uk1z7xX8=;
 b=ayLH+eS95jlEBfBOSKA3AXvSryfYQ4z+JwIGI16rJkOyCSEKEmiQ2SXLixmwo33Ad/4QuP/uZ41V9wTzcSFihrG/Pmho31SsJENINE5Zbj1SOZT5WcLEY+DnoW2g+4hZSOGw8xKI1eLaCH8cxoJflJ1MPnKNhZEaDd1KqE3Fg6t9P1A8HyaQGai90zZKe79VQxytmaicl49+mvCXZeUqZp7wJkN4iF8gRb/ATv36Kj8KTopWYUueLrksD05jMSwKZHL9o9WaBjwq8BtCuGuWp19zjzlZYtnXxYazd0Y7/CnSJDnrFTWRaR1HHaBW+7xrzaF42bP2o8s7EEEN9tynhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXAr5lprXPIrDvFNNzoKPn+7NDerl2n7pk7uk1z7xX8=;
 b=duDrr8y/WMCSiJ+T1jw0I2akvS6wgQm0QZcIn4Uf3C+Gcx0oIKO9haEWgV5tqv8BXhQxivry4FwCP2VufojAc1FJbnGknLj6kzibgrLxmkkZmCwEaCWWq820osIN0FLwMDqhRNtE2Qik+Wj50dxMyfllHSpKc7HZEEr9Uc7NXAA=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7619.eurprd08.prod.outlook.com (2603:10a6:102:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 10:59:08 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:59:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] systemd: dlopen-deps: only warn for
 missing required providers
Thread-Topic: [OE-core] [PATCH v2 2/3] systemd: dlopen-deps: only warn for
 missing required providers
Thread-Index: AQHdSg0v30x8lLv2dEW74BZ6dMUI2Lbdk0qA
Date: Thu, 24 Sep 2026 10:59:07 +0000
Message-ID: <6A31FAEC-BA42-4AB0-9778-045997B55EC3@arm.com>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20260921210644.85026-3-jaipaul.cheernam@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7619:EE_|DU2PEPF00028D0F:EE_|PAWPR08MB10167:EE_
X-MS-Office365-Filtering-Correlation-Id: 44675bc7-e625-4649-2633-08df1a2aeff7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 J8UQ6kdICpVa9IeL+vUmckQFtADgluaYMWZAZfmdYxSjCa8x/yUt/wLcomgEasR34Abhsj4FQ3kNOh6BBVfpxNmk+AOPKXREuyy9MumIlzsAAerG41zY6eUA1cGP28NrtLpRw3dYL9wJtpFcPHFzD1JeskxPsDEiTt6DKjh3IaJ2/9APZYJOyp6EM4mOLfEQbGiIT6dh5bDz+MX53MA3AiwikI3V/HZ5uTzXFFRwSHX/gdtn17qSbp1Wjv5AxTb1d1P3/ruUxaAqXjjoHGiLm7Ym/gg7yGDmZPtIUeZJIrHueHS/7IkiTbumFl6++Qf3pashEFnT5KQPoMliF7v/L/7+xpAOVSaozgyvM35AG1ujW46JRg4InXaInwyDnPrlY/dImeO3vpSd7lRg1GBmhgkcNulOcYl+371eDZFF5FSDn6j6eIvkMDtrMdkbp+g034NnB7Z7gHUIOHtmbQ/hna9b5gUOu2GKEy50paNdJKr6ZZy5qJX0bdlYr4fHmEQb/VPOP4KOP5F3uGTvrFjf9KYpzDos+o/hKo+6MfvlCf9Z/OUoyQBR45rlQInKdMik949c36/4fnbcJIDGNw3xXbZQ+D15HcPWxg37fV4sTb/MuOe2pTiwkbsPl8o7JhuuwWED/+Ze9D1n3mkiaHFC6fuS8yj/7N3fqOjTMW9TmbxKGq2DAF0TpTwaJ+Y0LNfZBBWnDkD6qvzgI/6Q4fSpm7XoWgVInojBb19fw7Q+ZWI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A82BD20847422048B44A5686B63F3893@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 V+KQYNfUTMOG8yxroRY+n2JpJmLzB6P9B0W2ZTYjl4UYd5BeNW4Bil+k4Fmpnpkx4ypezDPeK+fnDItaF2wfVtumw0W5bkmEMEFZjN09DPXJhzFmKiijJucZt4jRpD/oBgVgwwEssupT57AaV60bkWoRxAkkWuhf9SP2qxi/IJqSRGQmrLJ959Ua6igGin5kRLWVAtvCLrwOA+0Sw2slhZXTtLTFTLSEl45hZI8Kjqx5xvXLwbLJUtCD1sDikse0CApNeq4r7WtaJjEcG7ZZyfhIdSVf4OxxXSlyXIzWgEVKoBZbIugyU8l1BnJP6lKH+6W3sVR/eKddcuHaKEaacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a016837e-efc9-44c9-9bdc-08df1a2adb3b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|36860700016|23010399003|1800799024|10067099003|11063799006|22082099003|18002099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	bKPXK0mVcqhBT7Kp844XY0pPOhrepRCIWY3CgSGfN56qWU9QzFoudf/wnKIMeVUOfURg6qz79Sq3m4kZNfScSvtc1A2eDVxqLDhNSEgjOqN7Q2eDcLC7UYk7i10urZuRdP78srlL5mM348M8zz8SrEnwfELI2uH3XxZe5uCX4Hr2ppLzYQifvllP0mFEj4lhwoVlSBzDc4g2L9B7U43HWtzDQ1Uaf6V3UdOEK4CwOUCy70KT2qHcroJQgFQJzbsCcbiQZCJxwLaPiHhGkuoeCjkjvjwcsjT68uGMqa7u6Ngnlq97/jGS6sPhzCVgetQQy5aztOWsb/1kY7IJ1Z3j8a8S5IkYG9GquaOJ1ObQcudE2cBW+iOcPa43x7oqL47TduSqKLeMAKBJM1scK7nIHa3Ox0TK2g6yHAXLR5PD4WucEgckKp9IquAev6/xql7VCC7eR1+Tgo0jOb3fH3ziEwSjtEc0haqSgbmPIgVtpiJKKCqf6WyrImGPH8PRXMauvlnukhDi5Y5sbpDWI727kzavv58YQDC4X6nY8ebf9XJAb+bkKfxPPzX+QIKXV+/6ctzFAGLX56N6Qb2JS8j/twW3CJQYd17r3J4gI1CNX4dNm/HOETkMFa7224ZYTWe/3BfdaTDof5AtVWr7Wi8Ed1ekPzpZ3rfCHG8TNGdP6qV5pkCUI1TBCcPoZ0jUkHjp36xMMLRJk2V0z8R9khDCEQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(36860700016)(23010399003)(1800799024)(10067099003)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PE2wtUl5k/mR8aV5SpcN4KaNgPoS5Dv3/wdNDPl6s8InIpoC39+/Ia5uDkyJCc3x5fFUInfqPNJlcTc+z0z9/WQJAZNznfxZvDzCKafUD90CWIBPAxq9dThM1GbuXKCdZbA5ubY8sZN+I+D/qSeEbaiRRllz8P9v3nyWawxX920nAwtmsLpPY9Bp6YdT4ADZmB5kDCaplLjeeK1wSWs832LnmW9jK3vL5jGyxjd5aJfWTea995y18+0D/ZfG5SA0bWfFYRbYZT7kpw9dZfllk2iz5QqspBeA72PghbB+r6vj5683NrINocyknn/segXkBbai2smvC/c2dhBBaI9U+NSBFACJLSxQjbiLZSvcF3QzdyrwDmwjf+JlUKBugPRJ4kugij0ivCdQYz+KCdC5/kkN9pXkF7TG7V3/ct6QkQnYDsY3Z1GvokLnJWxuyQNh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:59:42.6317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44675bc7-e625-4649-2633-08df1a2aeff7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 10:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246579

T24gMjEgU2VwIDIwMjYsIGF0IDIyOjA2LCBKYWlwYXVsIENoZWVybmFtIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqYWlwYXVsLmNoZWVybmFtPWVzdC50ZWNoQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gT3B0aW9uYWwgcmVjb21tZW5kZWQvc3VnZ2VzdGVkIGRsb3Bl
biBkZXBzIG9mdGVuIGhhdmUgbm8gcHJvdmlkZXIsIHNvIG11c2wNCj4gYnVpbGRzIHByaW50IHdh
cm5pbmdzIGxpa2U6DQo+IA0KPiAgV0FSTklORzogY2Fubm90IGZpbmQgYW55IHByb3ZpZGVyIGZv
ciBkbG9wZW4gZGVwZW5kZW5jeTogbGliaW50bC5zby44DQo+IA0KPiBPbmx5IHdhcm4gZm9yIHJl
cXVpcmVkIGRlcHMsIG5vdGUgdGhlIHJlc3QuDQoNCklmIG9wdGlvbmFsIGRlcGVuZGVuY2llcyBu
byBsb25nZXIgY2F1c2UgYSB3YXJuaW5nIHRoZW4gd2XigJlkIG5ldmVyIGtub3cgdGhhdCB3ZSBz
aG91bGQgYmUgZWl0aGVyIGV4cGxpY2l0bHkgZGlzYWJsaW5nIHRoZW0sIG9yIGFkZGluZyBidWls
ZCBkZXBlbmRlbmNpZXMuDQoNClRoZSBhY3R1YWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgc3lzdGVt
ZCBkbG9wZW7igJlzIGxpYmludGwsIGFuZCB1bmRlciBtdXNsIHRoYXQgZG9lc27igJl0IGV4aXN0
LiAgTHVja2lseSwgdGhpcyBoYXMgYmVlbiBmaXhlZCB1cHN0cmVhbToNCg0KaHR0cHM6Ly9naXRo
dWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvMjU3MTQzNjRhOTgxZThlMGNhM2FjNDRmZjA5
ODE5YTIyYTQ2YjQ0Mg0KDQpJdOKAmXMgbGF0ZSB0byBiYWNrcG9ydCB0aGlzIGZvciBibGFja3Nh
aWwsIGJ1dCB0aGUgMjYyIHJlbGVhc2UgaW5jbHVkZXMgdGhpcyBjaGFuZ2UuDQoNClJvc3M=

