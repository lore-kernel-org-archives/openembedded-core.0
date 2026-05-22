Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26073CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:03:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20372.1779465773790412612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 09:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lsJvxi8N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lsJvxi8N;
 spf=pass (domain: arm.com, ip: 40.107.130.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=nx3C/cj4LJpB2Z28uq9RmZas+1pGP9/MbG/Uz2bHaGkZliFlFKkUkRdFZHhabsSj8kisCN271SCblK9124GSZfLTmBZs/QXhgL5gnbSuW9neDP8NDa3hzZ4CRVhJPJfJbovy4vRjHE+eN3YiZPdBJPVr59MQgum7QH8d+zcTTEIEeOZ1fgvzXJSDHx1eGINyG8SLlSQhusmnJ1rv/n9tvav/hVn9u3xSz3RkJ+Sqo9AX7iqseARzUpVxwr16IYE61U5JgqayOodTAtLcHmFStIN18iDrvbOztGGLwWjIjIJlx+IIDTpXLL2NfP6Ts2NYbNBrSDUgLblZBgFZHmy3XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlySrrFDPVDDiquIxuP5mYVWtspC/zeANyoTUhe3WQc=;
 b=FiC2wJj1gTVsIsficK4NC1g3VR2XigQOU3DZdCYvseJnyb48qa620h6f4GvTG3u1djmmQvRFIk8Dr/Y95I/hqUGwANJ0L4XCzdAXuQbZhao28B65RHQw8Hu1/aZc88thhI9drAeHFVjNnf3YiuL66GKhhVcLu2cTlZIPMd5zLAAjsW5HZWGL5oqEnmIikNMJeDD/yQv7P/VzaZHooc1d/LFMkYskILrMNRz7pmzUwvEOC5Z7T81JlQFoVyAi3banQ+mSUpQoo4T6o6+iswNYYrKRuALX5NWek0vVnNiKTD8X3rr2EMeZ6kB/prCzwHHc1KsV3/987wd7hk5qtpwZxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlySrrFDPVDDiquIxuP5mYVWtspC/zeANyoTUhe3WQc=;
 b=lsJvxi8N5rWtHAFNQjGJXrCKYKGxUyo8Hu4/8v7XDoqKL4M5LKH2ObIn0zSHmjipw8k6I054s+AZ6fyIIGuQ7A5xKpv01KYLLNRLTlT32dzHDHRYsZogLy6XC5GFl4/qKKT8IDH4VSrOJvmpIyKKXXuA/hP3cLcNraZReKOIIFA=
Received: from DUZPR01CA0152.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::27) by DU4PR08MB11078.eurprd08.prod.outlook.com
 (2603:10a6:10:576::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:02:44 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::a) by DUZPR01CA0152.outlook.office365.com
 (2603:10a6:10:4bd::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 16:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 16:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7QQRneDeOHAD+m56u53ApnZV1Le2KZEA2gkpDOIj9CCkdYW+LbMf2MnhzKuUB/AtmhWYexFpLzq0vvUqjpWbzDD5hFf0uXZZ9swiX2ya0PH/CgfN/bo4YDD5fV7P7tpjtqIANrbGXEwLXY/3vqEPOygbCvallrLR1mq63wsh+8TrG6st5JpK8kHbzYp2pOZT6zk7bPvVx/W4WNX9Re47VVEk5y2c2/FIVakNLU8rqN/bAqpNbD+pdWrTehfBWnPoen9gllfw7OYmtWnFWfW542uS4VjyfQ9WhtbYCCbYUOahA611e2xop71A/foDbvr6O8aOH3t5Rv63fbrTVFPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlySrrFDPVDDiquIxuP5mYVWtspC/zeANyoTUhe3WQc=;
 b=isUZuccsJQMbLrOhNcpbqXhTmfaVILFJbo3hTAv6gFq/ekpeJ6xXUusX1yzLUtSiBO6UZ0F8Nhf1oWZiwA1Z96usi1ce3ZQFztx6fpsiCnLwXP0fTHpaxuBQYkzrj/gKVJGh+jxOAkjyJ15w3BzvHaAkXFOhwXaAIg1U8K5xzFCuH+6dSM6LR5dhAOG/eiXsOoYRuJeFCTkHK6KUbnsl+F+15OJWWT16DraFW8U6D4WdjraSgnN8ug1D69Vvzuj7Z8Xo//6Ov8iUCOSPkm5wFilE2CrXeQzjVTPsz0b/STrc+eBEuSW5v7Avq/RiwFcsGLYR2j8KFwpSo8GoHPV20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlySrrFDPVDDiquIxuP5mYVWtspC/zeANyoTUhe3WQc=;
 b=lsJvxi8N5rWtHAFNQjGJXrCKYKGxUyo8Hu4/8v7XDoqKL4M5LKH2ObIn0zSHmjipw8k6I054s+AZ6fyIIGuQ7A5xKpv01KYLLNRLTlT32dzHDHRYsZogLy6XC5GFl4/qKKT8IDH4VSrOJvmpIyKKXXuA/hP3cLcNraZReKOIIFA=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB6664.eurprd08.prod.outlook.com (2603:10a6:20b:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:01:40 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:01:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
Thread-Topic: [OE-core] [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
Thread-Index: AQHc52DCkeg8iBtACEOgaJefu8oN5rYaJHwAgAAVQoA=
Date: Fri, 22 May 2026 16:01:40 +0000
Message-ID: <84A56E56-2C8F-4719-821D-BB0C79860A9C@arm.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
 <C5392453-7B9D-44CC-9F60-2B1BD60D286E@arm.com>
In-Reply-To: <C5392453-7B9D-44CC-9F60-2B1BD60D286E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB6664:EE_|DU6PEPF00009525:EE_|DU4PR08MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: 8872e310-51e1-42c9-fd7b-08deb81b8f50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|38070700021|3023799007|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 S80wC2q6lz1/kpRPNs8Mz8NkHQQclQlFy73c81JW8u6Hr9HDMaekXwmjp3yDNuNsxd59LhVwpoLG73BjdseXmQOXRz/3qNkYEZmdF9rloreYMtpLrb/F+1RhjTTV+fbqakj56JHVpdGFQIaKQc7HJFCF6P6JNSQ5kXqDOPDEDZ21jXvtCoi3E2ySx/SnhrupsPsV75sMD3G3o8BvxeIc+ZQU3VwkIBQZ+2fuOIITyIQQHeaSdkxwtqhnNkKzkf8JcAOQ26PJaC0CvZrgLKQrqbyGgWxVlZwLRB+q1VjWWlflhjPT9nsxUYMarAYQ0yza5G+saGmHftmM1Bx7VJI4hbAfxQtQ4Nv5NGHdsA+x9JKCC6pTMc76rsKNlfvpSpuRqkE1/S89q3pbL/+Usb3Y94MHKO2QeWcpyOhnmnMFbwUGk7gFnpQX68axKzMpyNCtCg+CFeCsjlteS3cY/keIbf9g7ZIqO+dTxOwGemQeh1JIOmMi1Sg1hdTkvOcLYkDzi/xrs3dC/b5jpHYZq2NSDEqimp+caVvs3tCRVffeXgfwPSBVT4PGlbAYYLr2J67wfRw9EW9cr3Ta0KA9k1Za5C1Qt4Q+y6H5WGeVfXNWPULxdPpaR9DF779nUaNNa37b3WJgVsfaEJpltxT4kCZTt+pqFHiCKOxKgMcfytVz9MesmXtq2MYVvmM00/Waq+QIAmMKjkQlCZlIfy1xxnpn31WOoy11ySS6UhHsm8MeHr9EvQFuCjU1kqyF4zoA+Ex3
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(38070700021)(3023799007)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9569275FA98424AA87F93FED5D5008F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 BFCZXb7x9iOe+kT7fIL0Zj5GH40lXjOsgapOtWJsKi4h76yFvhPXm2Bd1Bq+zic8vldyXG0mpEAy4t7V3Yi5P7N4cP4zlgElnqCli8wIJZaXLNRs6W02Qku3+7NqjJnXFjuGWZCrzRQ9Gf8l1sObeHlQzEU4Ef452gHH3sG3PLSmbKvKjOk7221hbM2lO+6DUjDYlaXxtDSCq2T1TEC7iLkQn5txC5mXJcTeiqTBNgiVaFhcBavHZLtTfajWwYszfzFULkLj2p4wCQrGPaPQbhHk3fogjG2LOQz123XW19BN5R1EV3RCYSuda9wyZP9hc6v/9HDqeOcRTRzsldJZ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6664
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1adbd421-2f52-4818-8312-08deb81b6936
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|376014|1800799024|35042699022|82310400026|22082099003|18002099003|56012099003|4143699003|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info: 
	irM7LpEXGVrf0UFYQwUT+gQVBNCOxjw7J+1eS0zYMtZx505paYt3HMz8edn1fYsztDt8PhpQYz+ROaIA8RPBXOz6+jQJl6Tk9+4+oXpBZjFIMIAK27qjrDo7f4t8M3MWX0qP6c/RQJCRb9n0bP5LNEwjQ7dWbKikz8C9mCG8qpQB6MBNCW/DNaGtsoGVUE2fcc2Y074ayj7osjr29WfE75Ta51AaqNQ1JZtEqOUFtex4mMYfiHpHSSXkn+d89nQWMMaN8jcXAK/dDS1O01QWKTZQ0Vb+7wminJLsuNR2393W0BrNtYcpKovtNtqFrMArL8G8/Fd+XMCY3hWrKI5sn7ytZU5NigLRJNIjAv2lKaojgzgL9kS3eaOXb3ctpNzCcx4sIk6vI3ja1CdQgPRclOX59I4BWLK5nQYS175vEqHuR6ihOaTvqsJNbk+qxJiXqjpJYzdiyy2zzER6YQxLkN4zJJQsWaLX3T+Ojas3w2zINZHYO9vGvQzSQt6066dIkl3CIOSaumxHMxJr+Sg7t5TgVuRa7kTIJ5uC1QxuGC6l5PGnudsUZJYU5AyPbHEuufxxY3CA2LhfOexMAZosXStPuDXCmVAhORo+kzBxjEqo9vYh0giSgSiHeHTmOtgZ0wkZqnZv93ljgz1+Pd5mKjkwfWmn6cm0553iyc52gR3dAb8sSVrwQVwA2g4HS/X+o3V0wU79SxLQZl4Qgq2sLD5iaHZq5Hn0moC8BJLSJdM=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(1800799024)(35042699022)(82310400026)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YQPIOEIJko06s64DQ8hqyIwf/bOUDPgApAwpdUnZAMd2tSON0TjmPuJwPmEp3WSzjWxqkydUH+yJ2aTmBDoCEtnC/qwJTLiOiwE04fgvazwNyHV/JBRCu/y/tch1XYTzJWkTXpQ+k/Y6WXUbyt8C14JimWX3E3ae1FMygmJ0l2NrRF6o/MHb8CNIVr6rp9YdpTBrP6WrmwHvCk7fyZmtm6+Y1IJ67J+Xck4yZTsOGXHQC0Hj3DtdFL6Wqr+2LsZufYTRXKGAsMl7eSbNOzU+Fy0B0LiJMHPrL3ns2jDB5jhNMnuCAfk/BuR6aZBjtm2rhXFvpi0lAWxtGSPWLJOMmk4V0hXuItwH216ElKZp0xENxHG0G+tBcS4e2hGDwwCaJc/dwVbIuD8gfgUNmGarvvFLQB+Rb22eTvak7uRMr9LdQZ6F4pDLhNCKj5izXp71
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:02:44.0281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8872e310-51e1-42c9-fd7b-08deb81b8f50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 16:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237555

T24gMjIgTWF5IDIwMjYsIGF0IDE1OjQ1LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IEEgbmV3IEdDQyBpcyBxdWl0ZSBpbnZhc2l2ZSwgd291bGQgeW91IGJlIGFi
bGUgdG8gcHJvZHVjZSBidWlsZGhpc3RvcnktZGlmZiByZXBvcnRzIG9mIGJlZm9yZS9hZnRlciBz
byB3ZSBjYW4gdmVyaWZ5IHRoYXQgdGhlcmXigJlzIG5vdGhpbmcgZWxzZSB0aGF0IG5lZWRzIHJl
c29sdmluZyAobGlrZSBkZWJ1Z2luZm8gdGhhdCBkb2VzbuKAmXQgZ2V0IHN0cmlwcGVkIG91dCBj
b3JyZWN0bHkpLg0KDQpJIGp1c3QgZGlkIHRoaXMgYmVjYXVzZSBteSBtYWNoaW5lIHdhcyBpZGxl
IGFuZCB3aGlsc3QgaXTigJlzIG1vc3RseSB3aGF0IHlvdeKAmWQgZXhwZWN0LCBzb21lIG9kZGl0
aWVzIHdlcmUgcHJlc2VudDoNCg0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvZ2xpYi1u
ZXR3b3JraW5nL2dsaWItbmV0d29ya2luZzogUEtHU0laRSBjaGFuZ2VkIGZyb20gMjAwODMyIHRv
IDI2NjM2OCAoKzMzJSkNCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVkaW8v
cHVsc2VhdWRpby1saWItcHJvdG9jb2wtbmF0aXZlOiBQS0dTSVpFIGNoYW5nZWQgZnJvbSAxOTg2
ODAgdG8gMTMzMTQ0ICgtMzMlKQ0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcHVsc2Vh
dWRpby9wdWxzZWF1ZGlvLW1vZHVsZS1lY2hvLWNhbmNlbDogUEtHU0laRSBjaGFuZ2VkIGZyb20g
MTMzMTQ0IHRvIDY3NjA4ICgtNDklKQ0KDQpBY3Jvc3MgYWxsIG9mIGNvcmUtaW1hZ2Utc2F0byB0
aG9zZSB3ZXJlIHRoZSBtYWluIGNoYW5nZXMgdGhhdCB3ZXJlIHN0YXRpc3RpY2FsbHkgbm90aWNl
YWJsZSAoSSB0aGluayB0aGUgdGhyZXNob2xkIGlzIDUlKS4NCg0KU28gSeKAmW0gaGFwcHkgZW5v
dWdoIHRoYXQgdGhlcmXigJlzIG5vIGdsYXJpbmdseSBvYnZpb3VzIHByb2JsZW1zLg0KDQpSb3Nz

