Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117FCCA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:19:42 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15121.1790871571889927404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GtxJiVyt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GtxJiVyt;
 spf=pass (domain: arm.com, ip: 52.101.83.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=J5471XSY2RWQPU+gV6tpHDhdA8+eWVICHZfjr+OzDfT7qE9OPQU+FYeaJb9TGWoNu5LeaNeA5vZzAU6osEWydXMlaSUUz0IlVnvtYN6eJ/7Y+DnQVUowvjXQIxjxCRLRQi+G0pI7ivyjB0ljwl2zoZJCR5yQMsxbOKi9t6BxhO49WduMNNa6kY0ucgLazBJyN/CPt2Dx/foffEC5MHuGOLFaD46jpPBl1lS9pK4ubDLLJ8IXt1nOvqITN4jOvUUaEa11592F3GPy49KRo8wdps/6Z/2CrnKSJvKa1npj6tUgLdVbzUytS+sdln0F7tCgfuEkLk/n+/VRm7elRzQg4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbJclMiL6gpRb3BKhy8zkzyfZcMcB8R9onxvG+wn3Is=;
 b=gP6HFagoUUUZkQfZIS4ll1rwYh7izpseNrzd3LrXD/h8Akl43lucQLyT8CYBQw1NT25rPhOYBE0SaHKErHC/DGsrA0fY0icB6mwIXO7tcczq96XbWGHpMyzWM9lDrjrWTvnrDAST+8mmkMXhJ8sy56G3YDd8faf9O/R4MGme3JCNgtCc/VW7KfjYvieX/4YlQ2pRPm0aZXJTkdcXl7l+FNirMl/iTQno19FMIaK2l+Y8kNiDTZDddqPzISqieDMyLpwzKPsZy3qTtlLRBD1UIk+ogKrQWtmmKzWBDCzNaHqBeFeD2ZsrHlPdshbSPFWL6k2/JsRGfrQwAhD4Bb6V6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bmwtechworks.in smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbJclMiL6gpRb3BKhy8zkzyfZcMcB8R9onxvG+wn3Is=;
 b=GtxJiVytVuoALsyJQOak8sX1KXLs4yddDwcx0g3yl+6A8f0j5XWTzFiJdzMjF7h+Vvo5cMUdXkh+dNyElZuPsY2qVDdeoBlogAyzU0v8AIB9rHHLVv+qRgAV15FHn51AL7fzBokM1zs+MmTX4Zp9FHMDCKA7oJLMD2M//s9FE+8=
Received: from AS4P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::14)
 by AM9PR08MB6722.eurprd08.prod.outlook.com (2603:10a6:20b:302::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 16:19:25 +0000
Received: from AM2PEPF00070CF8.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::6d) by AS4P251CA0014.outlook.office365.com
 (2603:10a6:20b:5d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 16:19:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF8.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 16:19:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbT4IIGQCLeWt5Lg9V9G4cGMPTlkeepMxS0qOEJ+2AGzgBMmozss84l9KZVBoynROh7BbUhpUy7Q18rerBMt36cZsFrIuQpP1yTmCm+e3b5sRP29UJ3uaomeaFqYIbx/iUnEflWi5YRBiXi1r01BIvZa1fZPOsQEavW95Z7h7gMY0qCcfUwzXKJtHGL4fLVzhCv/Gbv8fEFwYWfPhNTqv/b7d8nnNxbGLd7ZvWeW0OP+UhLz9326s1DdC0lL7OC43Xb8tbIsQ9Yly3R7djp3p9FaAg9rNhovwgSI/VG8KB6KKBKs8eOlx9xQydLc409MFvCvF715WLkBe2W06L7lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbJclMiL6gpRb3BKhy8zkzyfZcMcB8R9onxvG+wn3Is=;
 b=lvfDKktl/l7Z0wUHto7U1jKbuC2h/4QwOYNs7JoDoakZ5w5Z5lSgsHFNJDNPlNGMgtphMEMna4V03aYnzSKYbqTFyxqvNpjeEotVrBA3uu0/T9sfxMxHUB47Qu0+b5yR9V+TPkkIiE8pswlVWTMeGmADMXP+QdJZ+xcWt6gkBpa0OdfA0dRs2xV5+6Ve84fcvck+Q8Tx3odSUTyIT/VUh3H+YkLEDyQN78UbqiiNJDcS3nR12msiNMm7QTbfPRo74hXF9CLmAJleHm4fBcAIkG4jwkwBsWIN0WPuvRxizlRftQ5i3l9lbDsLC7snciFJGJEl/TARe8lHWBDY48Ohrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbJclMiL6gpRb3BKhy8zkzyfZcMcB8R9onxvG+wn3Is=;
 b=GtxJiVytVuoALsyJQOak8sX1KXLs4yddDwcx0g3yl+6A8f0j5XWTzFiJdzMjF7h+Vvo5cMUdXkh+dNyElZuPsY2qVDdeoBlogAyzU0v8AIB9rHHLVv+qRgAV15FHn51AL7fzBokM1zs+MmTX4Zp9FHMDCKA7oJLMD2M//s9FE+8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA1PR08MB11643.eurprd08.prod.outlook.com (2603:10a6:102:557::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 16:18:53 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 16:18:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sana Kazi <Kazi.S@bmwtechworks.in>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][scarthgap][PATCH] alsa-lib: Add ptest
Thread-Topic: [oe-core][scarthgap][PATCH] alsa-lib: Add ptest
Thread-Index: AQHdSbWAkbvDmkq/akCc1Hsq2EQUvrbkIs6AgATK0wA=
Date: Thu, 1 Oct 2026 16:18:52 +0000
Message-ID: <2B38AC27-2808-4A20-ABF9-39387B5D393C@arm.com>
References: <20260921101012.1107752-1-UpStream_IP-SK@bmwtechworks.in>
 <DLR1L06VPOY0.X5MWPPDOMG5B@smile.fr>
In-Reply-To: <DLR1L06VPOY0.X5MWPPDOMG5B@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA1PR08MB11643:EE_|AM2PEPF00070CF8:EE_|AM9PR08MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1f7bf0-e1d1-471b-47a1-08df1fd7c2cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 d9EsxjcPB6MQca7pTfoiM0ZGKOZZCHC+qm12f6XRJuKqVjMujWlGoiYcwlJy32S2EKuceTHDsFCcw2Rt1HaNXjuuI+ER+NhJQ8hHFKOyAXpa+oOZpLs2ZG937GKL4OfpkGEqOeovvzwQiAUy4Twj8li9cJj4pEGIssHFUrTZodjWUwb5OVoXCYpQiLek00rLhHayh0hxZV49JKU38lf5VqBS3w6rSJTgHs1LozkN7o4Tk0Wd/PEsLT31b+QMy/OENrXGe/0WT2NgPzk2TaW7rLKDHZqlHrjDQ24i8p5Sx/CnYW40MQoxwA3J5kI6IH34C/uovCR5mazQjv34z0WJObtpBTKSoSaBkTQyMa2Puf+LXhXvPyUTSCY7eMH1EegtxeaK3habFVsedqFcGdBVmJGot7AlqupT3CJEOUNDbIjKpU+3Jpt2ybaGZ0Gdp+H81dsT6MSAiqA05I7DaD7i4hTIb259FMN+wA0qH9RPSmTR7lEIv5hA6ljHGgcyDZTs+2cdtOAcwxc+Im+QqGGHezs8lm/hpCWO47zaLgEhCffnoYghuD8IqzBiHeA1KWDsA2lA43nLx9O2rt+EiLZ8b4Nu+9FqbppAz+YuUmkxHbJIpAQgcwe1KYeCp3Yc+Ja5sP9011yqpawTUaCfvo3zv6Zxn/QLQem5Px+waibCp8QlU/piD2Rpxs7/LBx+bI4j1Cn9AHlrpLIALa1kw50bJ2N3NAJdmDo+91923b99EpY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B35C64513170754EBE956AAF04BACE06@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 uJTRVoJ/ZxzFWXa1R3BzRXbMMmTvVSYAXDUGEymLlRAFg7VlpRCcnE4J5JdsBvvYKO6wvfIJtG79Od3u+TYTjp0/xfh+7WXeG5kempZTxo8bj2ybxA4oQYepIIFU9YFXFNDt7ro/hAURjCyPfrsdlR0zpBHZmJwQCK1Sa2pSM9Q+GeGyxX007diWmTOuVPSyq3/nI63oYH5DRLd5bkuzluaVd4Q1F1BCkG/XDdUkIx5U5djUEt1Dd0goO2ffRhEEthJ21uY5DrQBr2tdzBUuZo/1dSLdPlpnHRyHN5tW1H8vQW922CWtGlwMJS9HVvhR1ByemGGjbH8/mJXm8Sn2VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11643
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF00070CF8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3ba8bb1c-d16d-4e71-843d-08df1fd7af52
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|14060799003|1800799024|35042699022|82310400026|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RrS73Sc644oIvaHdbyYyXDxa+3rUtmg9ryucAfZWKUBnlNKt1kS5+29QfkdPEbXK3Fl1jg69AhhK9brIGel6yYZoZQDypQB5EkWjZOCTkfRpPyeqzSgFrtejdrYqAK62dU8oyLXGEGTWEyBD8JLoGix/zLTutQ9vXIDHoojQZGuo7OCf6q7HSENrA7iMkOL9mX3MZ52LTqvwNFT21x6XinAId/DEiusC5ORmegQf4PscZ+NlgbCj7q/zZNfMR0k7zPvjdHkRDybq8rKelhRYUkDpD1vLsbHzplW7XijC/qKyL6umciMKotWWSkFES4JeKrgm6XBamsyXf2+jqHH7exrFWRZ2aeX+Vc9zl4lTHsbRh74FohgQj7vHZ1H8YzudCPM/+awqLvtbYv0wMGIZ7RFWTqDJ19dEhD3PPF7og1jY2Jp1+vYVxk8TxMzhsTRQi1kBeSH+cNr2f3hVSn9TcKdxdITPLmRaGrGhTgfUgb0wK9T8pO8jDAkpvmQLc+Kl4VWQCMw0hAqbC8cqKAio9d7BQs452Q//VLKsYgc4MOY7tFO7yoWTmKk4pmSu4+vbC2SWDX+jdSgL9kUSOn5aTgSwc+3R+YsjG2MfksrqpTlX2i1Mo671oPrV+HX5QTfsqdSD08ZsFLO1JB0PuI6LLWU5fMBbGBUwAGOjLgvRURlZeDPPbJ07qFV26Ofo7+6UTpeiKjUQtGWFekFt4tjN8Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NN53Hd7wQtZxXSbhi61DKgKtomHPsT6Bw7tvV+8q8DlnjJPpGbsT20zytAi7SZUHRD84MFAm7IL6ZQ8nZV92VTgni3xwuYpEg6c/jKu/ttLisx98he0wy6Uo/VajQb5VnZRe3JYfhBmeBvs9a9kFI+Jq2F7CbaHlwebdnAbLEFrUrU0wkEVyF26UhSIUXKXC89hE5JpBdL+nlszbTSiWpjZYNf+VvKYYqEmpZrIq6Hyl/hEV+qAwp3s6afywZ2tpOLM1UhzAP1YooSaAYz4B4nqDDn5oFEYncPjS70sXAGr+fZ62Szn6KyKUCs0f9aaSRWX2duZXzmROQX+5fngwVy8U85gMiEcWn7Edz6DQWogEgf/WoaaT5SGoTcAp8qXdQRIPxc/9PRY+l/v+YFQV3I9IyxyZmRFGyyE9eBJqGnTOBo9IfxTCelVsqkO+uNrN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:19:25.5599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1f7bf0-e1d1-471b-47a1-08df1fd7c2cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF00070CF8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 16:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247043

T24gMjggU2VwIDIwMjYsIGF0IDE2OjA3LCBZb2FubiBDb25nYWwgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHlvYW5uLmNvbmdhbD1zbWlsZS5mckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gSSdtIHNvcnJ5IGJ1dCBhZGRpbmcgcHRlc3RzIGlzIG5vdCBhbGxvd2VkIHVuZGVy
IHRoZSBzdGFibGUgcG9saWN5Lg0KPiBJIGhhdmUgdG8gcmVqZWN0IHRoaXMuDQoNCkFsc28sIGl0
4oCZcyBub3QgYSBiYWNrcG9ydCBhcyBpdOKAmXMgbm90IHlldCBpbiBtYXN0ZXIuICBQbGVhc2Ug
b25seSBzdWJtaXQgcGF0Y2hlcyBmb3Igc3RhYmxlIGJyYW5jaGVzIG9uY2UgdGhleeKAmXZlIGJl
ZW4gaW50ZWdyYXRlZCBpbnRvIG1hc3Rlci4NCg0KUm9zcw==

