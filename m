Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD47C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 13:56:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35695.1782482181168725040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 06:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cCD4fI+b;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cCD4fI+b;
 spf=pass (domain: arm.com, ip: 40.107.159.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yxNd0mp1QTpMAsj4yYM1FZ4GjNzxkxNiRhf81gbITo1xzneAvB6fBm5NfNRV5DSbdB61nIx1ffe1WqduwgBeQM57tVFJdCoweNxIbr2Vf790DOUIovs9MM6v6J/f6t809ik5Hnj44Z0MBFGid+1uz2wxErHPRXH7K+wpWdfcp6ymQ0gTEZPTkjPw8pzADvQI4F3qz5TXujYjEgpDTujSUiOLYxMxgToNpWtaYNcWtB3KbbeKZTBjyf003vHc+VBWH5w7gsoIYuCv0lTgtlxPx/iLytm8mbuXQuUH0MFpKXq22mPIFNKbCd/7tJQpXV2+zE/f3MP1zzqalrKuTQnQqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov/6hGeXBlI8XmUDh8Wkqb9O+kC21tbkl/KAI5GPPq8=;
 b=o/DfyDO7o9IxPNRRezhpK5ervLETbCGj6PUoyDNmnDSJve6VVG9ZOMKmXQETPLPArOWB+ggb6r+fCbSFO95iGgMtS8C1hH59xnp25AYfZj3+WgXQePdNA5ubuE8I6FWZgmtzQ/gQCHFd0rJaI7lEIrt88f25cyPKbbq29d5cb39xgKTFGjHAZLv43a+0GSwQGfEu/07i8xIZnlmCpyISJy0wXEoZQpxf3l2/fq+CfnzCe5w6pj0Zsc5Obbne/K6cUNKQkIiakB4PjyuD0EJENW+BRwVyghxSuqwA5sgHOvZE7bA9Yy+OmMQwaq39uQYKhCHA54yWbik84HkIg7KbVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=keysight.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov/6hGeXBlI8XmUDh8Wkqb9O+kC21tbkl/KAI5GPPq8=;
 b=cCD4fI+bjrDdKvCrAJpa9tJZu5jODBTttX7eFT7zxIeVni01I0E4m7bVkwpn1llcft16V0fpVlsgg34KlCAmUby9JvRJKJ7Fvl2TS0bJP2Wb5gBUxQI4cUpCrZTdrdcGgSi6mwAUtB91Hg6OD67PD+N1crVgVNJh7lIlvYwLrKA=
Received: from CWLP265CA0324.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::24)
 by AM9PR08MB6209.eurprd08.prod.outlook.com (2603:10a6:20b:283::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 13:56:16 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:401:57:cafe::42) by CWLP265CA0324.outlook.office365.com
 (2603:10a6:401:57::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 13:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 13:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEKoVrU7ICSKYZwZ6uykxnT5sanHDFrU9NQ3/5mbfR9LT85mb8mSvk9ZOtHhh8X5t5irupkfuuZ6VNQNCTmSPQ79KRVATrnd/VCS+7JYsPE2RJ5V8jgC/WpAdcL7aSQQhLM6KIXYcWPXa3Mn2tAAQWGYGOK+GPk5fEpWPBnka1JDRyiqmAZ6UVoWNWYKoMEnSo9u3vlLAqL5ws630x9EW407PwtiLAUYp2Ffw7csrCj7HdS6BNnMNDI4TcW9Mh47Br/zufL3LK62gBDN4Ubbct85AU7UmHkYPZrAkYeH73o9732HOQ+sCUpefQ1rysTEfam+jS9g8Gy62qG1ynJXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov/6hGeXBlI8XmUDh8Wkqb9O+kC21tbkl/KAI5GPPq8=;
 b=SEPdlia8lTrHN5D2q9vzZgzvCAdLQtfKfJuvuZyhOQ5qah++RMcGQq4xoYSx+TW25ZYrC8QtUYpz1QJXEbCN9VI+sN9jrG1WwKNisfwQmGbUHh12jaSOnW6WBow9pAmaqehjlZmzK7MD5WaELuJWKIhwWfRyG/6DRFRu8efhv0ZupdIDLNN6D9we1YxHpGWLfMEkLieaFKxQH8jdzAgnr18kBfGK8vX6ZhUMAepyjxEdQSXi/+AkDhK0KmC0hY7sOFZ9RkhUpmpTBXmLz3mvSOfdpQfGEortIeJee485/J0zrau0zG3TnlQBkyKcQNw8Hd8mwTYRyA+C/UchX8hKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov/6hGeXBlI8XmUDh8Wkqb9O+kC21tbkl/KAI5GPPq8=;
 b=cCD4fI+bjrDdKvCrAJpa9tJZu5jODBTttX7eFT7zxIeVni01I0E4m7bVkwpn1llcft16V0fpVlsgg34KlCAmUby9JvRJKJ7Fvl2TS0bJP2Wb5gBUxQI4cUpCrZTdrdcGgSi6mwAUtB91Hg6OD67PD+N1crVgVNJh7lIlvYwLrKA=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7460.eurprd08.prod.outlook.com (2603:10a6:102:2a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 13:55:11 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 13:55:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "john.ripple@keysight.com" <john.ripple@keysight.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][PATCH v3 1/2] go-vendor.bbclass: Unpack into BP
 for destsuffix
Thread-Topic: [OE-core] [meta][PATCH v3 1/2] go-vendor.bbclass: Unpack into BP
 for destsuffix
Thread-Index: AQHdAptx00D/Dyvb5EmGWrJ7wgVVDbZQ4YsA
Date: Fri, 26 Jun 2026 13:55:11 +0000
Message-ID: <63E7937C-180C-4D86-AB9F-628D62ED2148@arm.com>
References: <20260622230331.3754496-1-john.ripple@keysight.com>
In-Reply-To: <20260622230331.3754496-1-john.ripple@keysight.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7460:EE_|AMS0EPF00000191:EE_|AM9PR08MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 303de869-ee89-4aa8-64b0-08ded38ab06d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 iqopebzVvUHU3SotFP4iBoiN1DfFgz7ssgF4NKL/KuYZFTVWM/3xU4PpQFa5MKNHxnXsvCTbTkxbI4w7WPmwmyhBORaoBShAstvjXQFgsLyQ5DVFrogQxMNM2JMsS+v0l1PHW1OVqm1qTCDWbrQgspL8202305CjLH6n2oIoOrBoutIGnhhQBtBPi122YGiiTZK6Nch/vw5sgUIO3Edsz2zvdx9VqTRvbuB1PKQxUXemvAL755OuhE/Zp0d3pZ2KtiGBwglEGBRiXHCfHCQrYr7hplAyoNLP4/u62lq5OxUUR5SK4Cg467lI6w2psP1nwg//RLZkZ85EWdbvYjMDWbdWFDgfo6XeAWPHQXtUaKrqNqM3oWcqawV6rnrMkR5xdROy65u52M/1lDhoEV/POFysXms4ZQG+nebAA2ZME9G5f9WPvACue45GunA4UHP7WR+Z+VohbRcxhmXYJ8/UmoQ353/Gb2ZswQaESV+A05OGjbgF0cYoBorKVP+1e6dN14RUbEL3oQKupXmZAh4gFnkwFFXoWUS/Cs7RlrNudyuJ8of9+N6o1ILB4RICSQnSR4o02j4E61Wl6eWyBZWMlD6Tm5fPXOnKgFVNqxhTW43IdRsocPC+FWWmzS3vXtVnWDUxD4QdPss8CCb7e06rwUHmFUkxmuHxRnRoSMx/NFwnKHmA97jQFmG8P+4HwqckG1nxYFa5pQhQRjH/JAdmCv9i5LgJcgy/61FLrmjPXDw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <626CFAE0B657EC49A16E8C72D6D7ACF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 nJqjqSb+/j/pM9yNFrWMI4h4MouNjCIFYc3os9qwXfhOZW0AxB5ZAC0/XKHOtmJEyKdNf5qptWZvVzUryWUB2DBm9/m5SU0BkMxp8/1hQPusrtVEtXFF6+SFvJVo0orBancogTJJz0L4kwGYvWW2A28CHo7RjyhTF4uYLfYigl/CA3RS7zzs4wtIM77UYkAvMhdHVEYyAbBpdcZ9p7KAFG0ZUZHuvKH+UkoCuzBECWG2GSzZ3mAxq3tQ0Owngj0LvFCO8HBvTP/gsCs8UGEJuZcxm8r+tQXrwTN8q9mYw02bLR/x8eIKOOncJ+2Q0bUkVCdGezXkU+SFrlBAPVf/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7460
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	483aa4fe-a9fd-43e9-9065-08ded38a8a4e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|14060799003|35042699022|376014|82310400026|56012099006|11063799006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hW5VG+LM2WsqHxl3KESzClvbUW4lEtVVl23DvSCuM2sFtHnRNqqxVlPEkjqJD0WL7AEqrl8ZAmjeIOubIYKwSYKL3D14sgSpPvTpIMYd+Qd4sqAgJFNMWq+RgOS24ODzwQ9dX7DitFcU0K/RpZzPsAIy00/HUuMAcFyw4GoxYCt1XRgPB/3Vi8oR1TA0qVfYYZCBDOSGLSNjtWtGd0XvpjMhdwZTswYa7EDHsYnNJONd/KyiqWoHhdnIADX84D7h6j85sqeNy8pOFWQZDH2TdDGe4ZFLWvO9CY/9TV8i9zxOOKXNXWw643jeWf5hUbk+GX4jxi01ZePMknuiCeDw22igKayXJu4rcKhqkFrpbW6Zz+s1DG6Ck7xFO4N6pKIMF34+fWQcOAOp7LhQvfZIXi9owtQF4Eu1Uz2hU1jQFnbqG0N31JGegh+DTu2DRI4w5xqLHV3kf3KDOR7IXMrmHtNNHHyFWR684+q8aE1k/xLhtS4Zd8T4V4bDfUVycOTAxVfIWn5j96z9/T/EG1p7/My7TSwnJarJcyq0N6jKpNXysOIaZcZdqLJNG4I1FS3f3s9yUCX+4hmAjpzhTPDoNvo2XgqaVNlNu2adkw9lAVurqlHYmi/nkDhTqveYanemSOSkawjkn2vORekZQlCxbP9VjAB9LT+/Q3h+PMtKV7AzudJL0OgQhNVm/aEaPiV2v6XbCRF59GR6PuZUj9xWJA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(14060799003)(35042699022)(376014)(82310400026)(56012099006)(11063799006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QxWuKV/pvAOKf19Lq8Hx3KOX9/py4sB3YVph5CIcFJHyxDZlrrtMBsjLk3BoZAYhymrpXqKbAZijQLJyaBSfjnRGQ20WUQlUwODUt/+Ss2422NBhKHJzP4n0IRio7eJTnsWhOqhRsTNXvF1rHZ2M9ar/SlfRCFX024/wb7wb1JCG5SIOWocLbgpiiA4F0OlqLJs1aTFUJp+Nb5LrS3v8i66/ACYataxBPHJ/y58pNQdaAktk9137TSLG02HJLUPAZujN8IIBeTBFZ3M1cy6z3yQDhlRbIHGzEdRkZ0FT6BUIg0wE0ve1cg8aRHqJM2c0Sdox7Nrgzx/kEwYM0nx9xMB3tQjA7OzuYisRGRB7sOUjenkB4wnrGYUXWgoaOxtsqh0Tmdq0eWUH+WFBy/kVFUGRntZC/ZSabzDD/nWxuIN/LyGU5/zrqEdM25Y0sY+Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 13:56:15.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 303de869-ee89-4aa8-64b0-08ded38ab06d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239634

SGkgSm9obiwNCg0KPiBPbiAyMyBKdW4gMjAyNiwgYXQgMDA6MDMsIEpvaG4gUmlwcGxlIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxqb2huLnJpcHBsZT1rZXlzaWdodC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGUgZ28tdmVuZG9yIGNsYXNzIGhhcyBhIGhh
cmRjb2RlZCBkZXN0c3VmZml4IHZhcmlhYmxlIHVzZWQgdG8gdW5wYWNrDQo+IHNvdXJjZXMgZmV0
Y2hlZCB3aXRoIHRoZSBnb19zcmNfdXJpIGZ1bmN0aW9uLiBUaGlzIHdhcyBjYXVzaW5nIGEgY29u
ZmxpY3QNCj4gd2l0aCBpbnNhbmUuYmJjbGFzcyB3aGljaCBwcm9oaWJ0cyBzZXR0aW5nIFMgPSAi
JHtVTlBBQ0tESVJ9L2dpdCIgd2hpY2gNCj4gd2FzIG5lZWRlZCB0byBmaW5kIHRoZSB2ZW5kb3Jl
ZCBzb3VyY2VzIGluIHRoZSBoYXJkY29kZWQgbG9jYXRpb24uDQo+IENoYW5naW5nIHRoaXMgdW5w
YWNrIGxvY2F0aW9uIHRvIHVzZSB0aGUgc3RhbmRhcmQgYmFzZSBwYWNrYWdlIG5hbWUgKEJQKQ0K
PiBmaXhlcyB0aGUgcHJldmlvdXMgaXNzdWUgYW5kIG5vIGxvbmdlciByZXF1aXJlcyBtYW51YWxs
eSBzZXR0aW5nIFMgaW4gdGhlDQo+IHJlY2lwZXMgdGhhdCB1c2UgZ28tdmVuZG9yLg0KDQpUaGFu
a3MgZm9yIHRoZXNlIHBhdGNoZXMuICBTYWRseSB3ZSBkb27igJl0IGhhdmUgYSB0ZXN0IGNhc2Ug
Zm9yIHRoZSBnby12ZW5kb3IgY2xhc3MsIGFzIHlvdSBjbGVhcmx5IHVzZSBpdCB3b3VsZCB5b3Ug
YmUgYWJsZSB0byB3cml0ZSBhIHNtYWxsIHRlc3QgY2FzZSB0byB2ZXJpZnkgdGhhdCBhIHJlY2lw
ZSB1c2luZyB0aGUgZ28tdmVuZG9yIGNsYXNzIHdvcmtzPyAgV2UgY2FuIGhvc3QgbGl0dGxlIHRl
c3QgcmVwb3NpdG9yaWVzIG9uIGdpdC55b2N0b3Byb2plY3Qub3JnIGlmIG5lZWRlZCAoZm9yIGV4
YW1wbGUsIGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcmVjaXBldG9vbC1nby10ZXN0Lyku
DQoNCk1hbnkgdGhhbmtzLA0KUm9zcw==

