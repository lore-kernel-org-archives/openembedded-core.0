Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D61CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 13:00:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11505.1790946022872180090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 06:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KCx1II2t;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KCx1II2t;
 spf=pass (domain: arm.com, ip: 52.101.70.10, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GrJ4pstKkJrYfVA2sMuOaRQuPkF91zx9xEzdQCSt3GKSD26KlmmiHLDQYYX6uieCVoxu7JRblcFiuPGDBXwB3ZjJlwIqOE+8bafgCAcSriFM2np/dChGuiep2D/umAXrFF8yX5Nx3RmqBsK+Z4YQuvLcaLLWt5b7rorFTeEi8d2aNc1CT2rtZgON+jTkuTimgf2P3tg8y4UPDNp8nx9zA9MpdKbvqbLxBrk6gbZEll1JjEHBblD8c3mXwR42hdOie26WaCO1rBuAdloBySwLBwn2kGmhhAo4Kkol03qT+j//qQ8wGhlQtAktYbmaAEYXkFHdByg1JKU93tVo3uYfUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsgtJyGgSovOCkrvqjr6YjDPRlcVg8M9jOzp29iV+BI=;
 b=x/8Bcwxvao/iHvH9qSLTQSpgy6CuRcmoZAEYton9s1JMJKbUAshc+MDsDVytlfxzflqJQhqEDJdYTy7FJlvCrnnh1vG9wH0v0wORtT5ePdsjCYzVD1Zcck3wLUAbxYZrm44OJaLKXfCK9KiDKb2xb961RV5W/bKFOVQaMXuQKVR1Gf0Tqfi3h+8KIjnb47Pkg2CkXr9AZDvCeQKX8v6QWV6dHPHEtiJqh69xy4qR8zOP+Y0SlnvfDvWjqyRRVljvYCQ3EbR/pwk9C4L2nCnfbKTtqd5kZ3WK/iiQHh//pZwSILveN4o+dQbB9VcWHS4LVBks8maXTtJ81FMtsnXwDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsgtJyGgSovOCkrvqjr6YjDPRlcVg8M9jOzp29iV+BI=;
 b=KCx1II2tMRbyhpmOyyHDMEF+5CrXdm7g1cKrT3DRAVwzZmc1t20gZwGZY46QFdkZLUsWagN4GXuxNwRZ1fuvxw3qPgFYROGoOLNLDz6pbMF4cgW2jGXDrQ/RPidOHqZF1vVHvbmEFfUCpXqQYtcF7Dpt57NIho9MiBmubFuY66c=
Received: from WA0P291CA0003.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::6) by
 DU0PR08MB7464.eurprd08.prod.outlook.com (2603:10a6:10:357::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.12; Fri, 2 Oct 2026 13:00:12 +0000
Received: from WA1PEPF00009B38.eurprd05.prod.outlook.com
 (2603:10a6:1d0:1:cafe::50) by WA0P291CA0003.outlook.office365.com
 (2603:10a6:1d0:1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 13:00:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B38.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Fri, 2 Oct 2026 13:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXhutt+oa9NlWchvVtF2jA3/zM+7tgI8ojKScmE56EEzgD0lEjygmO8MWKkTzRjyt2kYsIuyPpPSLziruinLqmuuqvKUNWHDoVqZe2fwJwFiWzqwOGHBdKm4hNixoV06A+iWuqUW9ecHwpSI/m5OdJ4ZKUirX36o6+ePy+MDAbJHZq9YxTk6Z8ickONV1FWMzXv4LTWoAX9ryWM8iECIYtWx3yudwnDkBmL190AL1Q0M70Jq+MjBASwFFGTawLCCqgUML5cbVZ3NyFnbv1HVqlYhF6/yw1b9+d3YKwMIz9BzAFrUJfPrUaVXrQFyFo2fZ0il6XP4UTkJTnCccJ84ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsgtJyGgSovOCkrvqjr6YjDPRlcVg8M9jOzp29iV+BI=;
 b=ltSGpCpR4zDvayCUcrqTjGybN6bv/UI05XTPhf0R/y05PVyEV/mr4moOy9L/MYulMVBfiLgQNwIee5a9/ka2HON6GTZ2aePQ6QuhUrwlmpvHwMe9BO4Y/oiAeA/fh4xz7UrP3D1GyQ+f9hGrtIZIt2DZcjeuhhi2L9u5D87tPw5dZS9u0F+mlYb6NuFFlVXbZpLbKle27xsOZwsOlm0+lJ8rHnSQfiwjRMVk+5KBikOKCTWXYib3Vk4rHbN7GiX7+OZN7OmelHC2k/my0K6WRWhNTCtozgpn5bLUJGg1Jw5XVDWR0hKFE4AwlkgTig4RQ4iuLDTANJl2ZLQSIugpWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsgtJyGgSovOCkrvqjr6YjDPRlcVg8M9jOzp29iV+BI=;
 b=KCx1II2tMRbyhpmOyyHDMEF+5CrXdm7g1cKrT3DRAVwzZmc1t20gZwGZY46QFdkZLUsWagN4GXuxNwRZ1fuvxw3qPgFYROGoOLNLDz6pbMF4cgW2jGXDrQ/RPidOHqZF1vVHvbmEFfUCpXqQYtcF7Dpt57NIho9MiBmubFuY66c=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI3PR08MB984667.eurprd08.prod.outlook.com (2603:10a6:800:374::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Fri, 2 Oct
 2026 12:59:33 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0496.010; Fri, 2 Oct 2026
 12:59:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] ptest-cargo: fix quoted RUSTFLAGS passed to
 cargo
Thread-Topic: [OE-core] [PATCH] ptest-cargo: fix quoted RUSTFLAGS passed to
 cargo
Thread-Index: AQHdUKBDQGVHV9l5u0ePt7eS/wSU8rbqOm8A
Date: Fri, 2 Oct 2026 12:59:33 +0000
Message-ID: <71E03368-5767-4B30-B483-9367712FDAEA@arm.com>
References: <20260930055437.1584781-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260930055437.1584781-1-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI3PR08MB984667:EE_|WA1PEPF00009B38:EE_|DU0PR08MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ec6a88-085f-4081-a1d5-08df208514c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|38070700021|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 0ezmhEcZCxhlTheCEtF/nDYU1ZhUbwaWOs3+dvqBJ2xX46VA+XQwjr8kCfK3yMAcK/fUr31NPyDv17OmQJA9IvJi2d5BMf3L/djGlhbZSrYQ50diuvmCTh0fPt8QYvtWKptae52pnUTXbdutArc5jWJBkgV8NB2AqHjNmECYDpyqSFM9E4gqjRGE34/t+fwL7ThbB23BU8r8DRYR4uMOpVkbH5VD24Cj27LMaysR1hCHl3DJz+//OInhBgHBkZjMSP6F7H6G++KD8NBdZ12Oi/bXK9SHeRumYSp8jXHvwYBDE6gGpFZQZmGhLc432PEhcKZyF+8/Lf0ptRuIxSxS3uL+JB7dNpLyARlO8XiT4BcRUjZ3Kr0buXuScd5GoENSEPT1sNr1Re6hw5CVCBbaDJwCrGZVDdBT77jJYD4DmeAxn+PWoVmoYcaVlsNkrc7DZdUXqK5lf3WhgwFbPoCnRT7c3w7zVg44iPmIlJnhGRrq+pE+MosaEknudIXJxkltnR4tXOeggJFT3CbTNIov7rdYQG99inS5GsQxiFl4E8TEjiGWwNUwjM3TjlE+UNQgeloQ3ZEyxdYVSFWtEQNoEY78xrNs3jmocCfYpQb3J1nnayROwHK4sa5nd8oT3gupEY1u5F3yrWcjN6e6zjbLriEW6zhuRHcUMf/8nhOM6T9r50QeJAIMMQcc5FazSWGp8vYPQRTMhMo3Mhr/dI1nfg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E84AEFD76B8CBB43B7E0EA60420D9473@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 v1UnbbabP6Bn9JSxLxtW9z7c1EVdBp53Nb+VjC3mOxHlxWpDnyYmSNYBdwWfRhTzI3hGFLFzikuLMCfo3nS51KOgj4qDeLYxd+KJd8lGn8zcbQGK39NXmo52yowsjyx3OSsr16X6qW2xyvCa4DqY08EUcITaPeHsY6Adi5P3jVuDvOTCzy4SpjRndGukC9CA63O62n7id5zdDUBly1nyvjdWzu+CLQmrOhHNYfT6+I/AyrNtVLJl/pAP5K9mWCtIfbUICsyU6qk8yi5MqRdl+fQ9KdJTND8PVzikcXyd3Nm3G1WrMImNJeUbkpLvAFyn9vwTaH3azX145X9w99fuCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR08MB984667
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73f7beaf-e2b0-4c0a-b050-08df20850119
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|23010399003|36860700016|35042699022|376014|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	rXQ87t8jdRrIfkj9QioqpYPZP+4TZDgemQrCu6Fju/dR+eoe6TvGUc1yBmSCF84F0p7kuIan2g3yQ8spfRqOM8Wqsovj0JF9uUJ6hYGcRme1uBpSHB4wvgcn1+Ld9FsPMPLQN4mwDQ3xqp8JPF5b5NewzZ8A1QVy6HJ0nBU03vYq875WqXdBMS0sfPIma09ZG/6Ge+iTNt7XG6XdpFwLh2j9MsIAf6anaf7Vbim4kZI3vNTZ5lvV2bwogEKp53ZKfn5MSasAkpT2L5fzAab/IDnUT1j3/l1wg0+E4bLPHH6a9U4r48ZG9JmntmcqhG7bMMHL5sBxAmtB9rSliQBlM7sEQGYfMloFMBnwiI+q/I++AspelcwPF8iO7Z+YF+Gmp5YuUesG7C90lxmpMZ+BQAo81rJxfFvbLqAt3wx3hF+9MouQ4fu734XtQQvKuhWafARALRSIpI0QVkH1QBQhihYX72khRMk9v8/tWvlq5UzTloBSr2vHMMSXY6wb3gwf6KlvkMr9X2vTepFZaGf33ZvvGoG3A2asRCflfsGttBIprsROyQz9+62md3Z/mQGYEMr+skT1gI+D1W7PVVDm7UNsoXvkxHU/3zIaHy8kwurB0A7RYLCAwHEy9pW02/snxvKox7bnklKfPPJocc6QUgo20UU+wIIlelv93WZ2FZBzSydkC1m3emCNLa0bUhPbr4ZUqDiNFggOYh5xJVE+HQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(23010399003)(36860700016)(35042699022)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rvmJmxkGZdo/qAGe7McShbW99t9qZQttiFHdYgD3y7GPKEmPB6eyoISJ667l8148ZiVYIswWAhnbqTSMroZSbnV6J/RmwhnX/3T9AxNebGuXL4IshRUGaAcPFqEQkLfTUqcIvsDCxbewQeik29e+QjXLYY9croKMLalctRDDvZz16NdjITaHJu+k7aVY30NOjvfI32OMV6CYbBGYpgfkRhIaDfBh5V546ltPLcn0J0YwL2nGmGC2/uETXi2Um5mhESLi7fRB0XwkG05uuXWeoQT1laGrICh3gHZQaOqfaHm1EkCY0yu0rdqzk7NxscjCyx6C4e0B9/1+LTlllHhCKBgJQ6TqJtbh7ZEdQ1O27al7be6J6OKmx+ddIhomarc+Q6N/hW9ExUwphgKvzIug+jvN4/5AFctxYNUFDnXYkMfltX0mZPwBiCerlHlA2g1I
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:00:05.9556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ec6a88-085f-4081-a1d5-08df208514c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247120

T24gMzAgU2VwIDIwMjYsIGF0IDA2OjU0LCBWYXJhdGhhcmFqYW4sIERlZXBlc2ggdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGRlZXBlc2gudmFyYXRoYXJhamFuPXdpbmRyaXZlci5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBBbm5MZWVsdSBHZW9yZ2Ug
PEFubkxlZWx1Lkdlb3JnZUB3aW5kcml2ZXIuY29tPg0KPiANCj4gZG9fY29tcGlsZV9wdGVzdF9j
YXJnbyBwYXNzZXMgUlVTVEZMQUdTIGRpcmVjdGx5IHRvIHRoZSBjYXJnbyBlbnZpcm9ubWVudCwN
Cj4gYnlwYXNzaW5nIHRoZSBzaGVsbC4gQXMgYSByZXN1bHQsIEJpdEJha2UncyBzaGVsbCBlc2Nh
cGluZyBpcyBwcmVzZXJ2ZWQgYW5kDQo+IGNhbiBjYXVzZSBxdW90ZWQgY2ZnIHZhbHVlcyB0byBy
ZWFjaCBydXN0YyBpbmNvcnJlY3RseS4NCj4gDQo+IFRoaXMgY2FuIGJlIHJlcHJvZHVjZWQgd2l0
aDoNCj4gDQo+ICAgIERJU1RST19GRUFUVVJFUzphcHBlbmQgPSAiIHB0ZXN0Ig0KPiAgICBERVBS
RUNBVEVEX0NSWVBUT19GTEFHUzpwbi1vcGVuc3NsID0gIm5vLWRlcyINCj4gDQo+IE9wZW5TU0wg
dGhlbiBkZWZpbmVzIE9QRU5TU0xfTk9fREVTLCB3aGljaCBvcGVuc3NsLXN5cyBlbWl0cyBhcyBh
biBvc3NsY29uZg0KPiBjZmcuIFRoZSByZXN1bHRpbmcgUlVTVEZMQUdTIGNvbnRhaW5zOg0KPiAN
Cj4gICAgLS1jZmcgb3NzbGNvbmY9XCJPUEVOU1NMX05PX0RFU1wiDQo+IA0KPiBUaGUgcnBtLXNl
cXVvaWEgcHRlc3QgYnVpbGQgY29uc2VxdWVudGx5IGZhaWxzIHdpdGg6DQo+IA0KPiAgICBlcnJv
cjogdW5rbm93biBzdGFydCBvZiB0b2tlbg0KPiAgICBlcnJvcltFMDc2NV06IHVudGVybWluYXRl
ZCBkb3VibGUgcXVvdGUgc3RyaW5nDQoNClRoZSBuZWVkIHRvIHNobGV4LnNwbGl0IGEgdmFyaWFi
bGUgdGhhdCBpcyBzZXQgYnkgdGhlIHJlY2lwZSBzZWVtZWQgdW51c3VhbCB0byBtZSwgc28gSSBw
b2tlZCBhIGxpdHRsZSBpbnRvIHRoaXMgYnV0IEkgY2Fu4oCZdCByZXBsaWNhdGUgdGhpcyBiZWhh
dmlvdXIuICBycG0tc2VxdW90aWEgZG9lcyBpbmRlZWQgZmFpbCB0byBidWlsZCB3aXRoIHRoZSBy
ZXByb2R1Y3Rpb24gc3RlcHMsIGJ1dCBwcmludGluZyB0aGUgdmFsdWUgb2YgUlVTVEZMQUdTIGF0
IHRoZSBwb2ludCB3aGVyZSB0aGlzIHBhdGNoIHVzZXMgc2hsZXggZ2l2ZXMgdGhlIGZvbGxvd2lu
ZyBzdHJpbmc6DQoNCldBUk5JTkc6IHJwbS1zZXF1b2lhLTEuMTAuMi1yMCBkb19jb21waWxlX3B0
ZXN0X2NhcmdvOiBydXN0X2ZsYWdzPScgLUwgL3dvcmsvcm9zcy9idWlsZC90bXAvd29yay9jb3J0
ZXhhNTctcG9reS1saW51eC9ycG0tc2VxdW9pYS8xLjEwLjIvcmVjaXBlLXN5c3Jvb3QvdXNyL2xp
Yi9ydXN0bGliL2FhcmNoNjQtcG9reS1saW51eC1nbnUvbGliIC0tcmVtYXAtcGF0aC1wcmVmaXg9
L3dvcmsvcm9zcy9idWlsZC90bXAvd29yay9jb3J0ZXhhNTctcG9reS1saW51eC9ycG0tc2VxdW9p
YS8xLjEwLjI9L3Vzci9zcmMvZGVidWcvcnBtLXNlcXVvaWEvMS4xMC4yICAtLXJlbWFwLXBhdGgt
cHJlZml4PS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmstc2hhcmVkPS91c3Ivc3JjL2RlYnVnL3Jw
bS1zZXF1b2lhLzEuMTAuMiDigJgNCg0KTm8gcXVvdGF0aW9uIG1hcmtzIGluIHRoZXJlLiAgVGhl
IGJ1aWxkIGRvZXMgdGhlbiBmYWlsLCBidXQgKGFmdGVyIHVuZG9pbmcgc2V2ZXJhbCBsYXllcnMg
b2YganNvbiBhbmQgZXNjYXBpbmcpIHRoZSBlcnJvciBpczoNCg0KYWFyY2g2NC1wb2t5LWxpbnV4
L2FhcmNoNjQtcG9reS1saW51eC1sZDoNCmxpYm9wZW5zc2wtM2FhZDIxZDhmMDg2NTRhOS5ybGli
KG9wZW5zc2wtM2FhZDIxZDhmMDg2NTRhOS5vcGVuc3NsLjQyNzhiZDQ0MDNhOWEwMTAtY2d1LjEw
LnJjZ3Uubyk6DQppbiBmdW5jdGlvbiBgPG9wZW5zc2w6OmNpcGhlcjo6Q2lwaGVyPjo6ZGVzX2Vk
ZTNfY2JjJzoNCm9wZW5zc2wuNDI3OGJkNDQwM2E5YTAxMC1jZ3UuMTA6KC50ZXh0Ll9STnZNczBf
TnRDczVIUGdSVEpLQm5FXzdvcGVuc3NsNmNpcGhlck50QjVfNkNpcGhlcjEyZGVzX2VkZTNfY2Jj
KzB4MCk6DQp1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBFVlBfZGVzX2VkZTNfY2JjJw0KDQphYXJj
aDY0LXBva3ktbGludXgvYWFyY2g2NC1wb2t5LWxpbnV4LWxkOg0KbGlib3BlbnNzbC0zYWFkMjFk
OGYwODY1NGE5LnJsaWIob3BlbnNzbC0zYWFkMjFkOGYwODY1NGE5Lm9wZW5zc2wuNDI3OGJkNDQw
M2E5YTAxMC1jZ3UuMTAucmNndS5vKToNCmluIGZ1bmN0aW9uIGA8b3BlbnNzbDo6Y2lwaGVyOjpD
aXBoZXI+OjpkZXNfZWRlM19lY2InOg0KDQpvcGVuc3NsLjQyNzhiZDQ0MDNhOWEwMTAtY2d1LjEw
OigudGV4dC5fUk52TXMwX050Q3M1SFBnUlRKS0JuRV83b3BlbnNzbDZjaXBoZXJOdEI1XzZDaXBo
ZXIxMmRlc19lZGUzX2VjYisweDApOg0KdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgRVZQX2Rlc19l
ZGUzX2VjYicNCg0KYWFyY2g2NC1wb2t5LWxpbnV4L2FhcmNoNjQtcG9reS1saW51eC1sZDoNCmxp
Ym9wZW5zc2wtM2FhZDIxZDhmMDg2NTRhOS5ybGliKG9wZW5zc2wtM2FhZDIxZDhmMDg2NTRhOS5v
cGVuc3NsLjQyNzhiZDQ0MDNhOWEwMTAtY2d1LjEwLnJjZ3Uubyk6DQppbiBmdW5jdGlvbiBgPG9w
ZW5zc2w6OmNpcGhlcjo6Q2lwaGVyPjo6ZGVzX2VkZTNfY2ZiNjQnOg0KDQpvcGVuc3NsLjQyNzhi
ZDQ0MDNhOWEwMTAtY2d1LjEwOigudGV4dC5fUk52TXMwX050Q3M1SFBnUlRKS0JuRV83b3BlbnNz
bDZjaXBoZXJOdEI1XzZDaXBoZXIxNGRlc19lZGUzX2NmYjY0KzB4MCk6DQp1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBFVlBfZGVzX2VkZTNfY2ZiNjQnDQoNCldoaWNoIHNlZW1zIGZhaXIsIGNvbnNp
ZGVyaW5nIHdlIGp1c3QgZGlzYWJsZWQgdGhlIGRlcyBmdW5jdGlvbnMuDQoNCkNhbiB5b3UgcmVw
cm9kdWNlIHVzaW5nIHBsYWluIG9lLWNvcmU/ICBJIHdvbmRlciBpZiB0aGUgcHJvYmxlbSB5b3Ug
c2VlIGlzIHNwZWNpZmljIHRvIFdSIExpbnV4Pw0KDQpUaGFua3MsDQpSb3NzDQoNCg==

