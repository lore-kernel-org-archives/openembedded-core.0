Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D63BC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:45:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13667.1785840302619864416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 03:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Or0UVE4W;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Or0UVE4W;
 spf=pass (domain: arm.com, ip: 40.107.162.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cIUDtV/rpFJFoX2eZQQnQ32+KbOAULNxVgDT7vVATl5rFXVNaheCFArF9Sk8Z3Jml8jHnEwu7FL78om2lkr08R0iyE6HG5rHECrkp83Gwek3P+Igz36ZJcURfPN1GTbs2C/37Mpb2S7p1Lt1UbEpz7KG6zWBeEYcsRhbZzfLvZ92vsChVwCU2OftIXNR+I+S/IMbuazIA46YktK+V+wn809nqV93QEFGjC6Pd4VJSNyKHjFF0YUgP2Gmy2QeOa85xX1F2RvJEpmRGUDx/27s9m7IQtJrkgJ4BCwooS7aDMMtYbqltfW0M00h0wQZX08cnU+gBDjo52gApYo9B4JtuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGOulECHoBurSVMsRubvUSp/oxSp0xdQbIKzqPjNjyk=;
 b=GO67I1VWDPWCo8YqUE/0zhWzYguVounZSX5eQhQXvcDqeOddueJM20CMbWLiZEIDfUoDYKhBpr7LWo1CxY0ZPzqQII+UaShM97dSqK1RhZC2Kx1RjFz+hf0qLmlcuWgkMS0pSeqJ7g4UJNVeZTEsN6qNu957W3McxVtdRF340OgQdmcmJvTDXD6D1HzzNal0JhLzrLxJycGx4fJGWTIPf7NUfRZLvy5lgzl6/oHhZeyedarLFiNeCSYaWGGHAvs/u5j+ta32VXvY6BkovWLsadFVeGnZfdrEq4CM62mit3tavb2cmey1mwcbP0HnAHrl1hXtqoDo3xL3ozrRRrcSiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGOulECHoBurSVMsRubvUSp/oxSp0xdQbIKzqPjNjyk=;
 b=Or0UVE4WDwD3aVOxe9qmmUg3WNchuurVUFeeqPm8emZ24l5RDiYD95lPqHuQJ/KMIyEpeiaSsVT5Im9IUOAitAHpVGgD4rkR/tG/Eh5Tqdj2wz/um1mqdMw4jQfPbN7ixT4zSAisodj2xMoJ/SZ3JfVo3rVegP22hY1p3d0Wi6Y=
Received: from AS4P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::17)
 by DU0PR08MB9584.eurprd08.prod.outlook.com (2603:10a6:10:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:44:55 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::68) by AS4P251CA0028.outlook.office365.com
 (2603:10a6:20b:5d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 10:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 10:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOA8Ejk0lwP8umGsDZny8W/iwwVXeHbK/USgMaCNG4BRXJ4kQFcD1oCg2/jonOvao1wx6929d6kKSkmNLZB8aja4Ij+GbE9a7OUWR79OC2NlIf4xmPbk8erKnA/r4dvSERwV4qZUfhNfBOk+luJ3i0K+XQfcIhbZ4NaUmM1yByyjR7BoqNOtI3tIQpwykLlt1+bglFJiASa7+xbwpTmHIKYFA+BvywgeVj8CWo7u223EKH39XXJxctrHWZCLuHjTSxUi4IAIoV3MCSVYd4IWPuJNymLr+wgt/VRUYzm+GoajE42aWq3PFszh0d5DOTGYnU0qp2cOmAySnX3WL0lI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGOulECHoBurSVMsRubvUSp/oxSp0xdQbIKzqPjNjyk=;
 b=gcFIHvDAvQhaex/7a40c1h/UM1r8vrQZ9riWv74jDluOywdc6qGboa3/wPGpuwprq+LDMv7GUZ49SuaMHlNT4/NVn8wGWljvdR0rYdfYm2/rUx2kdK9nQhQLpAWmsTgoGDKBMoqtaMzahAtmI0n35VGTSQikzfKyQPNvX2wUE13/Nk11M7+/TLa7ZaTEPuNzbrfsX9KjG65grLXkRF1K7DI5AfKJEuPr4qQdncOLM/Khx9DBh9SvZQkfUCgQ+KacZa7OLx8eErlEPnulD5738Wdr9w0TPVh15X3KRyp7bfyfj5d2BqvvnvYTPfuyGjLr8lU/Xknt9uVcm9GOKcgCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGOulECHoBurSVMsRubvUSp/oxSp0xdQbIKzqPjNjyk=;
 b=Or0UVE4WDwD3aVOxe9qmmUg3WNchuurVUFeeqPm8emZ24l5RDiYD95lPqHuQJ/KMIyEpeiaSsVT5Im9IUOAitAHpVGgD4rkR/tG/Eh5Tqdj2wz/um1mqdMw4jQfPbN7ixT4zSAisodj2xMoJ/SZ3JfVo3rVegP22hY1p3d0Wi6Y=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI0PR08MB11687.eurprd08.prod.outlook.com (2603:10a6:800:310::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 10:44:22 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 10:44:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "shinucha@cisco.com" <shinucha@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external@cisco.com"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core][PATCH v2] boost: make Boost.Locale ICU backend optional
Thread-Topic: [OE-core][PATCH v2] boost: make Boost.Locale ICU backend
 optional
Thread-Index: AQHdHyFHkKqPkB89yESmppW9aQzEDbaNvhuA
Date: Tue, 4 Aug 2026 10:44:21 +0000
Message-ID: <EBE6CBA0-EB72-47D6-AF42-32D22691D4AA@arm.com>
References: <20260728051641.1997335-1-shinucha@cisco.com>
 <20260729061232.3547458-1-shinucha@cisco.com>
In-Reply-To: <20260729061232.3547458-1-shinucha@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI0PR08MB11687:EE_|AM3PEPF00009BA1:EE_|DU0PR08MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b94b4fd-2e3b-41be-beda-08def2156c10
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 atzTyethUFUDwZNuT/XYTRRkaLpIPSfxF2UvTO0H8b33RFvgGU/7LUDulpSZ7Rkm7mnWdu42eHgsP7HH0Fq9t/qWyuwJqfQvovVgqr7V8GZcJqluUYbQlNuitcfj6PbRAswcZr9kRxZCW17oejJPiHsYs65SPfiuK0Ugo+l6C12853AqSKo6vQCx2gUUJS9Mun6aUfX2Yj3w/FcQZ5kys8dDJYERtaJ7Q5AnpGjE7Tb/WoA0pfcr/8u3+UmXXCib6q4H5+5fdN+YmecCB1SFTgTbqvo2NdxKrmS6NNedWHSEoJrgqsf7wXfRmcS16fT4dHG6PYxhbfmPF9neeIQvyWUK2vvbn2MQJ4m5Apc3fEidxdRHvkRxpugGF2fJnjjPBvIepggZzzdL19oKpao0wAra8QIs3bLrbXISZpR0mOZEiAXZ2PwlNbjiYmv+wndQfQBWV9tWUzlMByhsQeAuzB+YYHZTczV7H2Kq3mdRvzBkn/ervj4dXDvNByGAKf1FLKcBxMUON4VwtWxGFM8p4v09IOpYPRuJVK8ac5xhdMLE+cL3UvpDMPfydGkwUjlcdPBO3PDMEvvtiX71fN2xTsE4bqMwhFbJBXucsTwaLf1WhWLX+s5/RmiZKrJS9F5MDzmIXvzq9TpVBR/N9qRywywjHlO9N6WDUIc3O83RujGj9ye9ZVYtyb9nU4c4NxrMFicD0CBf3HF0p6tyfYvRRA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC0ECE7CD0F3674689194FC4A9485169@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 T+yg6satnWboLaGN2mqC4Hl6g0C69aJ+Bd1r8pK5cKXhpQMRf8Gd2qA/1HM8TqaT6yzKEzz1l1oMvuuRWYSXDc/aV2YUlyR56y+dEwmFkaJNK3L/QXqAa1j/L/oKu4agf3Tqys9OYb7otc+piGeVl9QPdQQOGM5+37jGVnes9Il1kz+wGVXMKKPwEXwez6UBYFcvWQmSZjya+enHJLBlx3roea3+olQYxMeoeQy/mA14aX8d12ARR1Kqhp6Yf+gp04tw87szslJw/EHPynHo3ta4nGny//pj02UXMggJSOH0Us+b9EQ/6I+zFyIHro64QQpFl2Z8kq2PIoOPkyqjCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11687
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2bc4678-7dd7-4391-0306-08def2155806
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|14060799003|35042699022|4143699003|56012099006|11063799006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GEkgIgfDKdLoV3Hmof0Mkot5HCAV/bopO+ciP6TXk7/1wdFdcID7QWo0iTmPzPu/Mbu6ACwMMUSZKgoh3RKcIpMXX1rBQ8mbqZ7ZWdAIA6/vb8SO8lWrT51S6xFsFUpo3N73aqKINNfdv8TAN3PHQFj277zfjubRn1BASeEFNhxKqNTWoEQ/Z9Jh5W6O2lW8JSoEzXZLUWellAAr0SnG9R+lLfDLklNI27GxaYrP/aEC/ZcNc9C9UOLpi+13YswgKduu6eNdqlcsNasaeR8IR8uJSVU3TnXiA++sqPjG0GnXaQdYeQiL0591Y8C3hmoyWe62O5nAg5akMvhU0vTPsfE1FHVPJ1BOkIUtaD70ZKow3j+q34VbJBMHKxOAF9q2TAElXkM3Id8vsWBo4fApv+YLRo++FIrpGo25CgVQLBJ60GgswjpldKOmUGq230IxVmBzJfkYqUVgWRockHDkpJuw8uHDtOXh15Xaapnv027Pl3mNKN3bccilNnEkbCRus3FD08GP/gl7sbkU0iwPJ4zSittIsK+JFuWaybT3RzGIX0rylf7w4KaxxDZgFp9ZYs3GFGQhdu/xVOp8d35CEKPR2Mj4BYe7VrdH1D1mEJ6tcBkdFHRquyFpy9MrWR0IyoMXqQz/CFSVsli0JF3YZLgBi0SPcxaPBE4ccwnETlr4GBnunVphioZYlhLAgJNQjAB9sftwMpWd6oToH8lUSg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(14060799003)(35042699022)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kp2nCavxVXrzGcVjCe9YbJeD3qC5+gxWCFVDANTP9GXBerXEOX/YT40Wr+n8V6Qk23TJpBqkuzu/w3AUHYkunwPOnvgwavtt6cGcTNzSDFp12kLpQjWTPz3YO4DxKgE89C2MTWmlyGSIIdcpO2vf43U6UN3Lh1iVYSWW5bSgrYuvA6+P334h1++74c6UzmtxUPG8u+wV6u0qidhVi7IIRhSZkw76P5DYIElVDmMf71qjP7n5zRe5NMm87IZOmrbbNCDetGHfItyrPoU+cqu34aOw4/kqHQdvWD3uFjDzz5JCpzhuYSysaG2Q9Y8cmAkr0hHNUtRuX6hfk0Mh3OFmYS553cqGE/v/oxX/tvvr6QZnaZ4E70VON021QeWk7YC+ddaYz945mV9SOjvyOcDPmkE7KHxFHU49sVgmhqlObsQ2VhBMUNvy0mYJrFa+Ffdk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:44:55.3527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b94b4fd-2e3b-41be-beda-08def2156c10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242716

T24gMjkgSnVsIDIwMjYsIGF0IDA3OjEyLCBTaGludSBDaGFuZHJhbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2hpbnVjaGE9Y2lzY28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiArQk9PU1RfTE9DQUxFX0lDVV9ERVAgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BB
Q0tBR0VDT05GSUcnLCAnbG9jYWxlJywgJ2ljdScsICcnLCBkKX0iDQo+ICtQQUNLQUdFQ09ORklH
W2xvY2FsZV0gPSAiLCwiDQo+ICtQQUNLQUdFQ09ORklHW2xvY2FsZS1pY3VdID0gIiwsJHtCT09T
VF9MT0NBTEVfSUNVX0RFUH0iDQoNClRoZSB1c2Ugb2YgQk9PU1RfTE9DQUxFX0lDVV9ERVAgaXMg
b3ZlcmNvbXBsaWNhdGluZyB0aGluZ3M6IGlmIHRoZSBkaXN0cm8gdHVybnMgb24gbG9jYWxlLWlj
dSBidXQgbm90IGxvY2FsZSB0aGVuIGxvY2FsZSBub3QgZW5hYmxpbmcgaXMgZW50aXJlbHkgdXNl
ciBlcnJvci4gIEp1c3Qgc2V0IHRoZSBkZXBlbmRlbmN5IGRpcmVjdGx5Lg0KDQo+IFBBQ0tBR0VD
T05GSUdbZ3JhcGhfcGFyYWxsZWxdID0gIiwsLGJvb3N0LW1waSBtcGljaCINCj4gUEFDS0FHRUNP
TkZJR1ttcGldID0gIiwsbXBpY2giDQo+IFBBQ0tBR0VDT05GSUdbcHl0aG9uXSA9ICIsLHB5dGhv
bjMiDQo+IEBAIC0xNDUsMTAgKzE0NywxMyBAQCBCSkFNX1RPT0xTICAgPSAiLS1pZ25vcmUtc2l0
ZS1jb25maWcgXA0KPiANCj4gIyB1c2UgUEFSQUxMRUxfTUFLRSB0byBzcGVlZCB1cCB0aGUgYnVp
bGQNCj4gQk9PU1RfUEFSQUxMRUxfTUFLRSA9ICIke0BvZS51dGlscy5wYXJhbGxlbF9tYWtlX2Fy
Z3VtZW50KGQsICctaiVkJyl9Ig0KPiArIyAtLWRpc2FibGUtaWN1IGJlbG93IGNvbnRyb2xzIEJv
b3N0LlJlZ2V4IElDVSBzdXBwb3J0LiBCb29zdC5Mb2NhbGUgSUNVIGlzDQo+ICsjIGhhbmRsZWQg
aW5kZXBlbmRlbnRseSB3aXRoIGJvb3N0LmxvY2FsZS5pY3UuDQoNClNvIHRoZXJl4oCZcyBhbiBv
cHRpb24gdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHVzZSBvZiBJQ1UgaW4gYm9vc3QubG9jYWxlLCB3
aGljaCB5b3XigJlyZSBleHBvc2luZy4NCg0KVGhlcmXigJlzIGFsc28gYW4gb3B0aW9uIHRvIGVu
YWJsZS9kaXNhYmxlIHRoZSB1c2Ugb2YgSUNVIGluIGJvb3N0LnJlZ2V4LCB3aGljaCBpcyBub3Qg
ZXhwb3NlZC4NCg0KV2hhdOKAmXMgdGhlIHJhdGlvbmFsZSBiZWhpbmQgZW5hYmxpbmcgaXQgaW4g
c29tZSBwYXJ0cyBvZiBib29zdCBidXQgbm90IG90aGVycz8gIEl0IHNlZW1zIGxpa2UgdGhlcmUg
c2hvdWxkIGJlIGFuIOKAnGljdeKAnSBvcHRpb24gd2hpY2ggZmxpcHMgdGhlIHRvZ2dsZXMgb24g
YWxsIHBhcnRzIG9mIGJvb3N0IHRoYXQgaGF2ZSBhbiBvcHRpb25hbCBkZXBlbmRlbmN5IG9uIElD
VS4NCg0KPiArQk9PU1RfTE9DQUxFX0lDVV9PUFRTID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQ
QUNLQUdFQ09ORklHJywgJ2xvY2FsZSBsb2NhbGUtaWN1JywgJ2Jvb3N0LmxvY2FsZS5pY3U9b24g
LXNJQ1VfUEFUSD0ke1NUQUdJTkdfRVhFQ1BSRUZJWERJUn0nLCAnYm9vc3QubG9jYWxlLmljdT1v
ZmYnLCBkKX0iDQoNCkluc3RlYWQgb2YgZG9pbmcgdGhpcywgaW5saW5lIHRoZSBhcmd1bWVudCBp
bnRvIHRoZSBQQUNLQUdFQ09ORklHW10gc3RhdGVtZW50cyBhbmQgcGFzcyAke1BBQ0tBR0VDT05G
SUdfQ09ORkFSR1N9IHRvIEJKQU1fT1BUUy4gVGhpcyB2YXJpYWJsZSBpcyBnZW5lcmF0ZWQgYXQg
YnVpbGQgdGltZSBhbmQgY29udGFpbnMgdGhlIHJlbGV2YW50IGVuYWJsZS9kaXNhYmxlIHN0YXRl
bWVudHMgYmFzZWQgb24gdGhlIHNlbGVjdGVkIGNvbmZpZ3VyYXRpb24uDQoNClJvc3M=

