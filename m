Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24018CA5FF0
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 13:22:07 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45450.1791292916701321952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 06:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fXjJWCfY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fXjJWCfY;
 spf=pass (domain: arm.com, ip: 52.101.69.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oeap0tPDfik7CCkJTGNu6Ibx54mAzDTZgQcaCUyfrAB/w9GHoOIbEqvV3tEWg6hZsRCSRUr9NiV0nCab9uP0GUuhA7wFHPXFmCo0Aj2d0xyFTdYled9T8CpijRTpfAwUBrQDu7RE0MO7qnvjWpXoQWG+PugyPL/30tePYfbiLG6b1//ZNt+OMvYGzBKRs3adXQv90rC+jLueXJVw+8juKuN5LRg1etp6pGPLGXhqvXKGZGI/fJjaVpkKVnXaygG6oljVvGEulYclIIHprKHpGmGNCJotVt2flkSCKUiQ75VBz9EmKQt/9K/wvDI6I4viD9uFuC4mj00KWZI83l/saQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut1uRUMZMMVABAQID0S0GfkJcK6+8HG7AWyhvjSg+y0=;
 b=UocI8XBiDLE4DXflwtzFjX/yYN6Kbl9k4ZPeqH0l07FWCKymgNGMIneTml5Wp2IGzp/2Nk/dqRCsv0GsCGivoTEeTcxUtVyiKuDxfJSdQloZNbRHXBmRFQ1NSRuk/3ZEK0kPpMioF4RXdMh5nHAEGlQrP0NMggSqVOhAGnTpKuyCEzNJrbh6v9U8wknjzlRa3F3cyGj8vQZAYVE+gbHsVOJNW2Ie+fhR2JKyEh2gSElryzXKIuT41H0YjAZJw+n6fMGs6vQb9j44/VWB+4MJmlmWA/i6SMJUYWH5LtOYYH2e/rAhDUJLj16fjh1/JYgjtJA2BI3j93VhdyVAR6IemQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut1uRUMZMMVABAQID0S0GfkJcK6+8HG7AWyhvjSg+y0=;
 b=fXjJWCfY5pxgaS0lcfACayk//SajDadymymrfUa3tQ96MOEsmuoU0kiWiHXeXVp8ve1J1WGG+425ox+oemgVrkyRCV+28t8v8lZEHI+rzERcBAH48X3LCZTVvqs8uwqmmP7Z2SaRfWw+qxdgKtzxAaemcnnfZBTzPBm4ONSOIsk=
Received: from AS9PR06CA0590.eurprd06.prod.outlook.com (2603:10a6:20b:486::14)
 by AS8PR08MB9744.eurprd08.prod.outlook.com (2603:10a6:20b:614::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 13:21:51 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:20b:486:cafe::e) by AS9PR06CA0590.outlook.office365.com
 (2603:10a6:20b:486::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Tue, 6
 Oct 2026 13:21:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Tue, 6 Oct 2026 13:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcmYhOSrjGDzw9iubKXGy7QS7pZeD31JqWahFyh8DeNOMfgIybMnAlivj9ch4SQQPCiax4hV8Qa+srEhzGNox8xHW6bwY4YuNcFNklbZTbg2PF/OyZJK5nb2vzRL0X9fMzlYw9rgU81mT7Sa+pma0SmSp/Q9jJhXong3ZPjgvt+8sBIAlFUm6k90Huh5ZcSYKZlsjSogPWlwMLs0V6xPRcHSuXO5lY1vkgEYdx0vZQfv0/uT0h4ezSA9kSY0RT5SoNABBLxZNqlmpJbs72Ff/o/pQf2Wj/fndP3M6+AhxJ5mqYM2ZZ8oUIxjJF7837dM0GYHYeSxzwrvRqzzbCHnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut1uRUMZMMVABAQID0S0GfkJcK6+8HG7AWyhvjSg+y0=;
 b=qwssGJpAdEmiGtDwth7c3lHtAxvCfHyR89eAK5aw7hLYf5sOC0K4HwTwAaHdhH/FCoZy3hMsH1wuLzCmuMvS92wRN4X9HdSEXeW1n/iznqK3NIiRpRl/i1KbRTdpphuCMQ41HO/EzVQqyOyWh3MjSs9fLEMkY6zqXgnl87amoXDKpFnF3bxw6U1BdE5iYcVlwDjmEiydqlovwlLbzmhEPkwbfniCiEQ/unw7cnFOl1+sIgfXgWwwsi6F+lMHcvXoBrb2hT4ZQpkX64lhi8SVfrSV5oM9wOQXmOBnXvvxaoXzURzsbYYdnsDhzxg0pGa6xBl3v8N6S0d3YTo26fEtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut1uRUMZMMVABAQID0S0GfkJcK6+8HG7AWyhvjSg+y0=;
 b=fXjJWCfY5pxgaS0lcfACayk//SajDadymymrfUa3tQ96MOEsmuoU0kiWiHXeXVp8ve1J1WGG+425ox+oemgVrkyRCV+28t8v8lZEHI+rzERcBAH48X3LCZTVvqs8uwqmmP7Z2SaRfWw+qxdgKtzxAaemcnnfZBTzPBm4ONSOIsk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB5975.eurprd08.prod.outlook.com (2603:10a6:20b:297::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 13:21:18 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 13:21:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] avahi: add ptest support
Thread-Topic: [OE-core][PATCH] avahi: add ptest support
Thread-Index: AQHdTztlyrQ2Qgof7E2DcwjyAlknqbbwZdIA
Date: Tue, 6 Oct 2026 13:21:17 +0000
Message-ID: <B4D09A0C-DAC2-4987-AFE0-646E8A0993EE@arm.com>
References: <20260928112020.42351-1-pratik.farkase@est.tech>
In-Reply-To: <20260928112020.42351-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB5975:EE_|DB3PEPF00008859:EE_|AS8PR08MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 787af3fa-0ca6-414c-9601-08df23acc816
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|3023799007|11063799006|38070700021|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 73vJTxcIR39bcoFQHh6CKB2p7AiqZwOINYYrt+uw05f53bsKfJ08g+FG4hrUNZ6/QJGkyjaNEfuoXs7g22G8dOtQyJwS3UJ5tzusF1W0gmwAq8FcwF9h8oDrQspK2UHYdTaI8ZUXbFUjWU1tkkC0tYrrjJckJ8ezD3Z5zF0Poyd4aefd6VWcTOZ/e4kxh4tfXZc6sTEECHXY20IuzIBWMH9NkcE49CVmJvCBTfSdR8STssjFdatJ2smb8a7uWgJ6t8gOPkm3hhGUwu9ZNUIvqkUphj45wETzQrq8iOo5i7YJxypR9MM/HWjdOiDPasWZlWjYwm8Tii8X8RamH4N9W3dcKklAmNoQdAYdCdXKKexVEJ9DlTdgRlY5Zqzoytr8JjrPyJbCWcff5t1Y353iLTxZiZuQeZ9K6uqUY57IGCCZzH37hyyr2zAfS7dQvmupErfwrN1kOQalfySpbxKL7pE15bYv3d9ELRnAEoATTLo1QA50C8C2C3YvENvNoC0dwaD+8pVdlZWmgdYkEvsgdedF+rt9fuJWerlzB3R45FIwQBRw3xdG5R3NyXSoXqnMkgUg/dSTu9U2I/2IVYu2SEid09g7IZ5Q8+gmVad9gqlG0LYxOuvQVKJlUde3hfJT69yv44k8CLLdcYZvEyDFdN4v1gRmAn9rVhjOlptNAxkxhyGTdqHJi/WMpN6W1cLX0OMhS2BcPVgYIqcZEaLsK6vmU9UDK5bB0WaGqxBkFCg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C7E4CD1E159B54494F119538C0147AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 I6SnCYQ2WuvquttS+bW779LqLX2yWuA0ij1+/NMRa5qnHmEqkKfiIeKjmoUwJyD+EgQQwIdKGMhpnsZUPlm2zlWG4ypDygUt+WSQss/m/AEtj9lxCY4AFkF44Ol7NmW/20b1URbxQsj8BHr4Vn0ljT3/1pagt/9TWXaZwYN+Wm6PiN7K30sOK9M6D7nP3+RqR4e1cdElOlyFPVZhukU62sxk+crvH3Rdp7P6O5UElZxtGirt9SOt/vNQP3sb/002KzbMEllmSpyjrociWtsObPADyoHU7EN4gGwJRtMY4ltqmaA1oj647ztbx+0jRF+67qYK8H0FMgIuQsry1RNiKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5975
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	909b7544-64ac-46f7-218a-08df23acb457
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|23010399003|1800799024|376014|36860700016|14060799003|22082099003|18002099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	brOpUbMmMPMTNW79j453PGiu+6bL1dprjeAF26JvpDvfCeSKC1AriDwtV0ksPC/6xm8k4GDK1HY/TCGQw1g/9xPOGUzj7WBv2fP06Jwvs07Bk5W3X6dGZceawrL8O0TAp6b9SHEfZjn9a5XrjjvWe5akSv4c/B5qflcxUd9qp06ul243wnFfQAXH5YseqBzsH94UTS4B/zRqpfsvmz20gMa4EfRWJZ5dxhn/F8qPKwKozoPxG1Gge57/7fiRK+XEu9/CSloai8xNhnoRPB1RBTuyJlU4A23QiJr/UYLl+ze/TT/pCe5Auleg4OVJAguJ+Prtp4jlqQa635M5kYLAXv1tPXCmpJYLlZOveAeW5fVv9qOUsczS2NpA+yEEYJIdUncI0IQdsCXn4C5H0nunQZey2Fh2HJqfw50m2fQ/F5LwS8Ld/o/2SsrQwVeryZy/OAW8JKMYACa3XcPfOZykzT8r4ohFyTXvoP7HYQPdFDAO717XZYA3M0jlRYrpfSPWVHF6VOUlL8vMW7TpEKxTPuwRPdTC5G2cMJQXf03dJINnAAcj04QNA+1j5LZzievwVNgEATVTFNZCJ4hdeHRjcqrBUfwjIe9kGA5mke5OphtNywe7GbuTSeL8QEYmwo1NmWxgn5zC0AKJqKKuAjMrqWxwUgMZjDgdPN+XDki4HNzL5ipKFxoNjuGjj35yecHZpxV4iqMeaoPl1oDkftptlw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(23010399003)(1800799024)(376014)(36860700016)(14060799003)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	acuOF2NSCyjmLdtBbnGDzOlIj98nPvzLOAAEJjStlC4AC5s17hh/wTSDWIR73vSLiDqS1srri/GMLcr6lqmIa2i7E8Z4uD+pN2fKVfDp6VKsMCovj5KiyRgCvxSWf5JqSF6AsnVeqsL9TakCnl71C05Kn0vDqsujtLToTtvRtANiyIvvl8xR5cNN0pHr287T7umk3nFIb75iqZJ/ZrLBxpIWwlKaDxyX4BAuZRb1JrKB6ei1xeh3OTYGkTbkMy7Wlkzsp2o0pPRqErtFGU79n84ZKDQTRPevPLhHVSkwo0GxzylwZBJb0k+wIqjGPFy6k2Y8IgVY0uzMD6pwYEgswq0SqYNjVb0KID1F5dlGFYX7M6rIvU6to3ltOwbnIDIv9UQk33kBE/XQsrasfcjqNotvKU700Snmohwtsz5XtwRZ4RSGj85L1ltbebYMhVr8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:21:50.7177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 787af3fa-0ca6-414c-9601-08df23acc816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247287

T24gMjggU2VwIDIwMjYsIGF0IDEyOjIwLCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiArICAgIGluc3RhbGwgLWQgJHtE
fSR7UFRFU1RfUEFUSH0vdGVzdHMNCj4gKyAgICBmb3IgdCBpbiAke0FWQUhJX1BURVNUU307IGRv
DQo+ICsgICAgICAgIGQ9JChkaXJuYW1lICR0KQ0KPiArICAgICAgICBuPSQoYmFzZW5hbWUgJHQp
DQo+ICsgICAgICAgIGlmIFsgLXggJHtCfS8kZC8ubGlicy8kbiBdOyB0aGVuDQo+ICsgICAgICAg
ICAgICBpbnN0YWxsIC1tIDA3NTUgJHtCfS8kZC8ubGlicy8kbiAke0R9JHtQVEVTVF9QQVRIfS90
ZXN0cy8kbg0KPiArICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICBpbnN0YWxsIC1tIDA3NTUg
JHtCfS8kdCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8kbg0KPiArICAgICAgICBmaQ0KDQpZb3Ug
Y2FuIGFzayBsaWJ0b29sIHRvIGluc3RhbGwgYW5kIGl0IGhhbmRsZXMgdGhpcyBjb25kaXRpb25h
bCBmb3IgeW91Og0KDQoke0J9L2xpYnRvb2wg4oCUbW9kZT1pbnN0YWxsIGluc3RhbGwgJHtCfS8k
dCDigKYNCg0KPiArZm9yIHQgaW4gKjsgZG8NCj4gKyAgICBpZiAuLyIkdCIgPi9kZXYvbnVsbCAy
PiYxOyB0aGVuDQo+ICsgICAgICAgIGVjaG8gIlBBU1M6ICR0Ig0KPiArICAgIGVsc2UNCj4gKyAg
ICAgICAgZWNobyAiRkFJTDogJHQiDQo+ICsgICAgZmkNCg0KRG9u4oCZdCByZWRpcmVjdCB0aGUg
b3V0cHV0IHRvIC9kZXYvbnVsbCwgaWYgaXQgZmFpbHMgd2Ugd2FudCB0byBrbm93IHdoeS4NCg0K
Um9zcw==

