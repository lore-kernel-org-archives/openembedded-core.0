Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2CEC56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:30:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25345.1786037405509064298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZDAoAJvu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZDAoAJvu;
 spf=pass (domain: arm.com, ip: 52.101.70.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hpWa4hfLULeJcUY303DFWq3IHc/vPSsmATuTfy0WCkuVxIt7sNoi5rWEmNT74+otFCOzHb9p3JhxfxyOci8ghtfnttnLhQ0pMUCM2EmC1+MjNNu93QXExHvVKR/FXT0wtLzILnfLwvziJwdh1XZo60KRL/f/l6E6e10KnWRnvG2FG07q6uFVFmCUZWFXHfeRDOy/EWxpxeqKf5raTonywtQfc7XALAq/V2iYKvu4AnlRbzHzC/gqqODtBhRAa4hUd7HUNOoQuSJ30sD1BIeyfscJ9i8uFEnK7RWjW0pNiX+jqgVcF+b+XL+rj0xyz9uHx0aZLxpVqZ5ICP5ENjOCuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NVtFhzgIZwglHSxNgzlFQsFpVyXRoDKKGHwmEUYAQY=;
 b=FDnGpnZ0t4o9v69JsBJsYJSCRXeTd+gjszMkk9vCW0aCGZm2QeXvFXM/StIgwuCRWQZ1mJeoAS91WYs0iMEyIbsjS1AbZ2SGejhLEHii6Q8vE8Ek1zT/4fS4ls57OrXHCdX7F2UJv2YHcmDZyn/Qso4ZHHbovFb1HSVWHUue2VhtuT4QQHZ5dJ5Hd+422ykRzEGa8+whhMMXduACDQK203Y3XO6W6//AzIlJQoaJlrTa0veZ2kXI+YzngvANAoAsSQDTDfJWQsnAQYBlZfuiSFoU+/7jHYsLx16or4sNbjcYrLwLBwXJgr3N16YJZHuCrTwHql+iXkTB56DA4zBVXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NVtFhzgIZwglHSxNgzlFQsFpVyXRoDKKGHwmEUYAQY=;
 b=ZDAoAJvuH9h6WdxThdshT+lH0dx7tdlpm8K1G0nhVm8UNLvZWEa2qkENpKHLJghgDtRVqbnLLak3/iIM+y1X52RdiGoIdARXQIGqVepw6NdvIIXjxMNuIT35r/wBIdjEiGy8c4bjLg59ZRYpSlXyUCAaYlaRUbO7oMxyg2FOWDY=
Received: from AS9P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::16)
 by DB9PR08MB7891.eurprd08.prod.outlook.com (2603:10a6:10:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 17:29:57 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:50f:cafe::5a) by AS9P251CA0018.outlook.office365.com
 (2603:10a6:20b:50f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 17:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 17:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh9URwLVFGq7js4j6q81cokzYZIANc2IB+G88Urv8WJop+bkbcKVOuHoeMz65w86ZVlqoP7O2NAb4qDQkqQT36uoNKhFPc3RuAa+dz18siYf7yYeWPFNGu1XisyTYTnxCQHKM4MgnTte7jgFIeq80hp72sB1jL1q4R96u8hJPZU+jhrEmrZCXmXnufUjz4wCGrslsGUsCRAcmIX+vvW+vIil6vvldV/5bEzkJyr45Ffy4ju/+JojrFuRDIw/8sUQq9uj22KlOd0VyorrTdfA882ffqaKzTzM6+R2t1Fuvs7aHKv/fHNwrp/SDIUmMdz1tRinH+73CgrMjjdrDtBYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NVtFhzgIZwglHSxNgzlFQsFpVyXRoDKKGHwmEUYAQY=;
 b=XfIUi8gZuW1HM8z5UWRlwRN+QFMGJ29mucf6xg6k/Z2ml8/+Yso6nf05g5Iqn2hqHT5MJ8V5ossWxV8MYd/0rfpFnQ07xNvCyZFuooyP6mghmbD2E5pCkvHTPSnIv1WqsbOqb4Munc8rrB+cORTIITMVpb+J2VJpVUad+BnqrE/dM9FaW8JqCGMVVGu4225JlJbNVzP7ES3Yy+QibqPbLjV0VLXLAL4y4RfKuHZVOPet6r191mXo/neMkSxtVpvqeY6Mb84Dgmaf6JPK0wrEOMqcvTM41lYXk7l6Yt1y1+DpNn7e+LvITePzTu1+6ht8GrzUk500UXFU5SojQRMzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NVtFhzgIZwglHSxNgzlFQsFpVyXRoDKKGHwmEUYAQY=;
 b=ZDAoAJvuH9h6WdxThdshT+lH0dx7tdlpm8K1G0nhVm8UNLvZWEa2qkENpKHLJghgDtRVqbnLLak3/iIM+y1X52RdiGoIdARXQIGqVepw6NdvIIXjxMNuIT35r/wBIdjEiGy8c4bjLg59ZRYpSlXyUCAaYlaRUbO7oMxyg2FOWDY=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 17:29:25 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 17:29:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] cross-localedef-native: prune patch list
Thread-Topic: [OE-core] [PATCH 1/3] cross-localedef-native: prune patch list
Thread-Index: AQHdJcCB3hpwDQy/jUSOtgClz4sC2LaRRlcAgAAAWwA=
Date: Thu, 6 Aug 2026 17:29:25 +0000
Message-ID: <84ABB47C-76DE-4D1A-B8CA-9756B517CC76@arm.com>
References: <20260806162730.352060-1-ross.burton@arm.com>
 <CAMKF1sqKK2ufVA6ugsxbjVmnVHL0Z1g5aLXP=-+AmNoRNG+adA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqKK2ufVA6ugsxbjVmnVHL0Z1g5aLXP=-+AmNoRNG+adA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB8741:EE_|AM2PEPF0001C715:EE_|DB9PR08MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cf5bbb-854f-48ce-f52f-08def3e0560b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 8LIQge7zRzmBSclfUeZfo9BcoXmC1vt0ZmGYCVDC/sSdEIHeCPG863dAU9VTFBo6XfqixCclUwbX+VekNs05o0+lSK0d2jt5X1chM+7N+fw1j0R5u0jYgyhCscnKLNa7Rp7UtozPFAVAt2h6zUs51Y4saUF10jT9CsXCgrCBcz66QtwqZeOM8zZfcJkRuTIHf0DM47L6Q8f8hldIx5blkaEIpwC7fqxcsgchvkbntXwuD+SWf93Yn1pBUlLJgXkPoGAczzVdKLyhnz1ijeb73rD1kCB/t6uzS/kXuNSXcWMhZFoHvBbFcsZphWgVB3QVVh0+iMbxY0nolV9IpWS6Spu1wHzX23a0kgOa7qt1XKNZyo2cK5DKnVX+0NRtXcnMeHqv1rsErB0j1xCvBmbXJyom30VUFOq1giQDSV+awXsqlLao9TxWRbZBh9KNcrU6ZSbooAZ+dE9cE5167BqMbz8CeVxAJoCzT5rsv27pOlDGLaT7jtJS4xhtxyTSO5Lp9YYkSB+m6P7+Cue2ovazhEGlUvt3OLbBrOXoTWmT3qcWu68/lZo9D8og5TeR9EkZ+MroYAwm/Na/v4VnohzYY6sqFeN6YA60FC1u/sLgcWZQPjx6EB6xGU8L1/ScUgoDgmGU2UZcj4u4GRh9Td29g2UJ438qRrlrx/DkEmUUoLeBrq/KQpmKs4PwODycV2BP03KQ0CLeyUoA2uXK/l1Zy8kPaXVHMjtNhhjpeQCE+B0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A0F7BB6A462F043AC92B929E9723FB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 H7D7cPe6mwtFtmpF7NvHddV4cebxn+ns76zOsRiiW6EgA31dkKFRB4xe2VvpKrpkFAYApMVxo/Mz4IYt72njPlfX/Ii2S3v13qMGYv0feMzKL2xJktZNtRIIvvyfSCCwMql9t2ErBCgIyV0MSvE7B2t8MqthxUjUBd+SflAQmnC6iAqAxTKMI4zc4Xog1CBSgTEQsEgUoE+ymT6YOhOjUMV/nHbVnJ5sDqIkSa8xc140HUGihy+MJyff7mJC93O4T6ABJGsUTlrAJgOoaLM1TbMW14xtnJwfn19QkzFoODY9FsuaDOn1OmlRce+aOlQB55eb1IjvLS1nknx1ugAFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a411c0de-330d-4d90-1270-08def3e042c4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|23010399003|376014|82310400026|1800799024|36860700016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	V74vghsXVlHqZXAUovKfE9EcUv/3X3AKIm2oMyql+k93Cdr529N4tEekS34tdg7MTSunUy6ZLj7tL7ZKU/DweD4FWD1/cB8OPJQ6qRxHONQpXhZ/fTjMvSE9l8REdj4fPWjMxHFJAnHu/Ksxhz/94iqrD/zsJJxMpYIlPEKB0XhzfWXTM+37yhNxo9TYy5ZUqRBI5QXTGzxijCWhLruJE65hxW1eVQu0ZdvB48X0cjGNQwGJ+CFDLRiN6BZHoCOsNTq+2XfIGGAkdmCmJAiOwtq/Ll7cAk2Q/7fnaA0yj+PnxE0JjSiuXIgepa48JI87ADk442P7APszwtaXNNT1tl01mm6m1sVnDE3QIGgTIDP9UcsUcmz+jAU0FtFbfdW5h42HSYPFZfED/gQnxq7FGr/erP1/dOL/v9gS/mpyQZkYuE62tA81oPGdRttpojt/sGM7UcTQ2+c7fnqIk5o/tzGGldpDVHpEaONJBV1JioRRleZRwHLOiP3+SzvrKwKdhIruNJN9xVEjaqBMVdLTIUFKKXiKRteziFQSKAaw6lt0aAvywrD4t4UfcuTdDXDqoNCeQDisZ5q7j5Lao0rad2sGQVAOhajrBBfAiai3gA+bEM7MP+4JIYr2QtWq+EVCm7GYDgiqIv+VMzRG6et25GtVSalkNrS9w4EkcwT0ehXq9spPyloHxJdYUJ83NuY9RrYpehrDctTpRU19nfoT2g==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	87ztPSuW2vlNvM0iESaD/CXe6Qe5kstMny24BLLYr/mcTB95JL99DoTDA3IrsdHddTnBllIc95MLrzsPrR6ahELuwIRgIRL65rXF7firyB2Jzq7Ifa8ESyYXBQTMGCXaK/sknLEd0MxhHKGHVn0wbl9+OdUFqI9iumqeHOVwf+y24ykojmSSdIn62Oe4rhAfd7syyw8/eWBIKIinoci7vi375st9t7pwo1g66N5uD/OH3dDriJ7qc+Qkg9a+CKO0oftJuXPeWWrBbyPzisqCzOMg35ddXc2uAqhSJ+ETHdzBSMCiD2qYO23UdVZ34gNBbQkvOLMvtaPfr89JZdsv6Vpz8+C1ksWAHJqL+r/15+n6UZPAS0O7qtEasDJJ4l8oOd5A34RZBUuDD+gGGY9PGHMbG7SbsUx54U6Szl49p5PHZCjvy/6nSNLmIqJtXKjU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:29:57.4662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cf5bbb-854f-48ce-f52f-08def3e0560b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242966

T24gNiBBdWcgMjAyNiwgYXQgMTg6MjcsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gVGhlIGZpeGVzIHdlcmUgbmVlZGVkIGZvciBidWlsZCBvbmx5IHBpZWNlcy4g
SXQgZG9lcyBidWlsZCBmYWlyIGJpdCBvZiBnbGliYyBpbmZyYSBiZWZvcmUgYnVpbGRpbmcgbG9j
YWxlZGVmLiBCdXQgaXRzIGdvb2QgdG8gcmV2aWV3IGl0IGZyb20gdGltZSB0byB0aW1lLiBJZiB0
aGVyZSBhcmUgbm8gYnVpbGQgaXNzdWVzIHdlIHNob3VsZCBsYXJnZWx5IGJlIE9LIHdpdGggdGhp
cyBwYXRjaA0KDQpJIGVuZGVkIHVwIGxvb2tpbmcgYXQgYnVpbGRyb2904oCZcyB3YXkgdG8gYnVp
bGQgbG9jYWxlZGVmIGFuZCBpdOKAmXMgYSBiaXQgbmVhdGVyLCBJIHdvbmRlciBpZiB3ZSBzaG91
bGQgc2hhcmUgcGF0Y2hlc+KApg0KDQpSb3Nz

