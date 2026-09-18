Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3740C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 11:19:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8747.1789730382613130773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 04:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gx6ZHmq/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gx6ZHmq/;
 spf=pass (domain: arm.com, ip: 52.101.83.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=V/XHrROjWljcGcz9zWqWwSj4U8XPwzGqTPbjF1eKdSzt4HvKJldpRkJm+BMcS7Q0qn3GHqczM7ybfIkJtTWvNtlx6K9ZuxtGp9FRlFY0gx5/IJxp72rKmD7qMXJ3GSSvY0as0ki+NU5ghnpHWEa2i/iaNvcUw2LoP3S0Ey89SI0so3dBgicpxJ8r6w+sdfy8w3Y0VZW9hMjAzAzvIEwdjYwqWACCETsYHXSQ6ZqAjoMIz978DQMyWBnCEZ216DtcXZjoio2p99+ov3Hz0QR+jZt3OB/hlAeQdSEvmuhfCiTTSRb9XuXstMVFavcMkV898vnoEjegjr9pqPYWmrewug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzOTWdXK6Ic6bKFIYltY3M6l6FAaNU3DsjIhwkAPdEA=;
 b=fXcKdvp6hazpVbPVwKpqFAkn3JVD+dlkwXu3ZldCRWvKxmFu1xFetMxbGAz5v7YQnigPJSLp16jRMIe3+0zevmLSyXoGNymp11rxte4VIOfv/jMvkNTMVEzC7DpqyJvotIqvZK+qE87vkcoUSK7CPsMat9ZepnVW0OpqnJeW2mUE84iJuccSgSALLwhGZzKQqV7SThNqBlBFI7JrXBXa5hdP1vpgw2WiDVyMzP4oJ/FVTuFRpTur5ApuYAkD4Zmt9BUpIA4IafsPVumM4loMbdn70dVQzWGi9MxWe45aJNoIFai7EpI0GtBGLoziZ+glT0Yqr6emZjppshkXpkakqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzOTWdXK6Ic6bKFIYltY3M6l6FAaNU3DsjIhwkAPdEA=;
 b=gx6ZHmq/AjG44g1Hpl8sTh6dFS6Dord8Qj+8giGdyNd7a3qrDh0NtADRHD+SIGEeD8KIsF+TZwxPcKfNiQ+cKnYuuvmlbA/zTGgBpgSgN0CdNEh1wFALVH8Vww6z/q4jEhKEVRLNVXUwIRQq26TWxK3l7xZAG6R044QeJH8cnWE=
Received: from AS4P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::12)
 by PAWPR08MB11512.eurprd08.prod.outlook.com (2603:10a6:102:50a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 11:19:35 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::24) by AS4P251CA0010.outlook.office365.com
 (2603:10a6:20b:5d2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 11:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 11:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z196tXcwxV9lMS9lnq5XO8SSYH4YkURtPjLjKtLQlJX1LqLQqYCgSsXWvddNV1tRvo0u6HzqGn8Ch5SE7fmB9B0F/AuWfIznVWLPv/XDLPV0ycKHg4FmOMtZPnMZuAfOvDti+BESbzBFQSCsVcYVKlXKnJ4jCwdYVtf2GOS0naCtlTFD1gscpCY4hjHe6+1BnffNUz95DxxpUMhpnY+m8hyMndyWAmVfi8EWyv7wsctATuE9asWJZLXfrw0NMeXwTx4EkL4I54UAJp7WrtUDzEYapN359WkWkMENNCw5rxwzoSsb59TLEZCR7bwrEleYsaqCJhQLPMgH+D2r7xFdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzOTWdXK6Ic6bKFIYltY3M6l6FAaNU3DsjIhwkAPdEA=;
 b=OHw+7JhAclv/ieopA/7EF86c5rHatVFf1r/mDcqMsFjk39S4J71s7hDiF4yoXPrxuVl4kH2kYvJGnOE6wInkKcEHw1cFrhZbuaxoE3dV2bZu4XgzwPnz7reDphZ8QXQgnL6L/Nm2pm/W5KBMmVDUoMvZq3qC5CFFrKvUBJbZMvPJ4zAfzL3BSmFseXmvy6HGe3gqZch3ZHi1jk0BjxE3N6je1mNDLB5KvreYUZJhorv/cIbEDRVHJ7rqjxItLKfVVO2LsWKWlXwmimNmQ6B068ifm73K8YEAno5TzBb7u4IkwIjHOpqa2JrJ5Nt7KXup9PPdWOtbmMg1y2I6dSGZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzOTWdXK6Ic6bKFIYltY3M6l6FAaNU3DsjIhwkAPdEA=;
 b=gx6ZHmq/AjG44g1Hpl8sTh6dFS6Dord8Qj+8giGdyNd7a3qrDh0NtADRHD+SIGEeD8KIsF+TZwxPcKfNiQ+cKnYuuvmlbA/zTGgBpgSgN0CdNEh1wFALVH8Vww6z/q4jEhKEVRLNVXUwIRQq26TWxK3l7xZAG6R044QeJH8cnWE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB8934.eurprd08.prod.outlook.com (2603:10a6:102:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 11:19:02 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Fri, 18 Sep 2026
 11:19:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
Thread-Topic: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
Thread-Index: AQHdRZ/Vx51L/0oh+UmqWPUcZTCJybbRFeqAgAMdyoA=
Date: Fri, 18 Sep 2026 11:19:00 +0000
Message-ID: <4F8AC12D-97C5-4997-9FEC-2F9CD54334C1@arm.com>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
 <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
In-Reply-To: <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB8934:EE_|AMS1EPF00000094:EE_|PAWPR08MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcffd1f-d5fe-4b56-4fb2-08df1576b86a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 8vBwTKIfWVLc84P/QS9ZPPb5wXpPEGNX8J3uhm3Xhri1l/shCEWI8OaPcq4g8hugiwVOE+7IDbKzM55ZzNqX7Ku4jBFDr2AUCqR2dBPpTruL/W0wXj1PrAx/voVIkoQkGIQsMbH6wTHb2ejGMLtMh5dfD7ygoyba37R0WyPzT9fFZS2uZlpuweiPtfLN3XqMbSKHptc4MSgY0PNM3pzDvIH+U+03TfMaahnBQj5UxEtynROjYTQ1KMm+6UEEtPkJ0+Rfs3i09CyMEEcyBivfaYYTj9aK1VBz5IDZf+EwmeH8q+nakq8hdjBuM/ucneAR7X3OG95tXNCPipEbROKddY+vHmVh1Yxz+WrPKQxsYiRHSIIzZuXM5pqN0PzkMLeIg/RvIT9KjxE8397SD+T97wslqulQIzPwaSljVBJkHxSIoi2u6d5lgtCOPDXrHBC/ElpUO24iJn/Q2TnX02SdsE8A2c6FjGT3G8jKela8a5LMP5mxvnA9wD9P8lhAB6yU7XyQFM9XGanfttl1u1eMyBgbEvcBM33wEP+6eK7jVDBFUTVNlc12P2zQOwfEpKdoJcMKeA4mrtgs07KlguybsYaZUZ4EP/6sNJ+DTDZKzJPZwJBXX+cHJMu/csXjTfU/7T9+ERPKZ5cT22Ks7Tyy407aKoVUzoB+IhYy6zojKjE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2107049C0A28440991DF56838DCF8AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 kc5zcyOqFKoujLDA3Ip3+/bQfK5lqvzuGt2lPin3WXwv1WyUlvVdXPpfDNmXGXp9/2BqbQHNHG1W69qCQKXkW+/sL83Umhe+MDDmtcp85SOBDKgnLM3GwDNgwFKTOGgo2G/+kRetaAgihU9GcTD2aWTwrJh/3bG5VOaqKXtQe2IPXUMoHjn/nhcGCXHAOh0FHmZMWkAWy2Z7Ng+ar56BWmDnHQpZW0LR8gUYm54Fd/P/BMWL7Ymj2SZ2tN+k7VlOkeaXU79ImRirovpxTOgHYIIrnYJizaDgke6y4fHrJS4gJ+SjfAp6VoeCeSHuBGyySX9vb5fJkqo4V6mWhfmu4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8934
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b767287a-ec2f-4e70-8ae2-08df1576a3a2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|23010399003|376014|35042699022|82310400026|1800799024|10067099003|4143699003|6133799003|11063799006|56012099006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RFpI6nqyfcAtdfTG8nCIJkLyxchiMOKwcqc7QGv7t882VR6c/K3t3K79CkiupiK3I4TicXFN4SgEurqMqzlrmmZto4SX2MOdulIdT4JfXC83TJozDET+A97UzBtxrOtBpmFrZRBgXg5wWsWoU5YwjGIN/flUTSt575MS50D3hiXyLwXIgjfptgazJ14dron1qYrNKN3cbJ93aG0gQ/s5WcFvDFxMtXsD6FNEu6i+1czgUP+L+J935erKx1c3l3NXGVWimj9HdQuwSPuWOp/u9xPfy796Iy5lqGKtQ3iVkERa1NTmYKwcGUPVNNegbXOaoGmuZImHe/V9jCm2pJ54kaKBCObgw3afdPh+NVKcpKwopuf8brQFe158/dVvhmeqBJjLKKwes8w7drXZeAhDzLEnKRxtQ18SGT5x/bLJdtHr0h1V3g+TL5qOvpHVtHc+1n4nJT+lw6Fe1wtykMIqAyOYRZnSEeMh9zj2z+7vQ2AoxT+t4CH8CicbcgouCkZy4VskT6T2f3ESvXNAPysK+jBwgWsdGqGottj2Hw0S5k4ghHHE7031M1Pe5Q536lPA+FEQftt4gsJDC3KYZWskag78ov4CZO+a2QnwfmFcmpDi3un9+axwwstKrgJ00FAeUB9TcYpQQQ6KUP3vYYLXBw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(23010399003)(376014)(35042699022)(82310400026)(1800799024)(10067099003)(4143699003)(6133799003)(11063799006)(56012099006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hQf41ZrUcc0AngTGvH/tPIkAMsrBAkJpaTHa7FCY8ryiDsknUA6H3SXz2TX+wMXHH96xIXKQwDf4dAsi4lb9T9QfkF/TNh6VEJ5xgecg6ekFwmKPUF4BzNUYAbdNKwXq6JQjQd/JX9F7eArYhHB5vya0udAsd6TB29qJuBBa2xgYKOpM+pZH+v8He83m4n8/Geg+HbXWvUOGOLT8d7yc+cckLlkCb/CA9xG2GdT1Vxk6mOZNlpY7QdF+vYQiA1JoRJrlQvMfiZJXZPF4lOvXGsnp0qk8XLTOdMuERSw6uIb+L1Xh+5FUdGJAmQlvAatpLZPSvdIR8smm/KK5p6UBfw/OVJM9XQVuWqIA1q1bRf1kVTTFdp4r6+yJMZNw6EaNXGfRkfd48vcsJ6DbAMTHMI56QXsfVyz7G//pNu+8tDCTBYeNOmWxMeSPQWnA0WTx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:19:35.3345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcffd1f-d5fe-4b56-4fb2-08df1576b86a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 11:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246213

T24gMTYgU2VwIDIwMjYsIGF0IDEyOjQzLCBBbnRvbmluIEdvZGFyZCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YW50b25pbi5nb2RhcmQ9Ym9vdGxpbi5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBFUlJPUjogZ3RrNC00LjI0LjAtcjAgZG9fcGFja2FnZV9xYTog
UUEgSXNzdWU6IEZpbGUgL3Vzci9zcmMvZGVidWcvZ3RrNC80LjI0LjAvZ3RrL3N2Zy9saWJndGtf
c3ZnLmEucC9ndGtfc3ZnLXVuaXR5MC5jIGluIHBhY2thZ2UgZ3RrNC1zcmMgY29udGFpbnMgcmVm
ZXJlbmNlIHRvIFRNUERJUiBbYnVpbGRwYXRoc10NCj4gRVJST1I6IGd0azQtNC4yNC4wLXIwIGRv
X3BhY2thZ2VfcWE6IFFBIElzc3VlOiBGaWxlIC91c3Ivc3JjL2RlYnVnL2d0azQvNC4yNC4wL2d0
ay9zdmcvbGliZ3RrX3N2Zy5hLnAvZ3RrX3N2Zy11bml0eTAuYyBpbiBwYWNrYWdlIGd0azQtc3Jj
IGNvbnRhaW5zIGEgcmVmZXJlbmNlIHRvIHRoZSBidWlsZCBob3N0IEhPTUUgZGlyZWN0b3J5LiBJ
ZiB1cHN0cmVhbSBoYXJkY29kZXMgYSBkaXJlY3RvcnkgcGF0aCB0aGF0IG1hdGNoZXMgeW91ciBo
b21lLCB5b3UgY2FuIHNldCBPRVFBX0JVSUxEUEFUSFNfU0tJUCA9ICIvc3J2L3Bva3lidWlsZCIg
aW4gdGhlIHJlY2lwZS4gW2J1aWxkcGF0aHNdDQo+IA0KPiBGdWxsIGxvZzogaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllL2FwaS92Mi9sb2dzLzg5NDk0NTgvcmF3
X2lubGluZQ0KPiBQYXJlbnQgYnVpbGQ6IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0
Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzEwL2J1aWxkcy80NjM0DQoNCkkga25vdyB0aGF0IHRo
ZXJl4oCZcyBhIHYyIHdpdGggYSB3b3JrYXJvdW5kIGZvciB0aGlzLCBidXQgSSB3YXMgY3VyaW91
cyB3aGVyZSB0aGUgcm9vdCBvZiB0aGUgZmFpbHVyZSBpcyBhbmQgaWYgdGhpcyBpcyBhY3R1YWxs
eSBhIHByb2JsZW0gd2l0aCBtZXNvbi4gIEhvd2V2ZXIsIEkgY2Fu4oCZdCByZXByb2R1Y2UgaXQg
bG9jYWxseSwgaW4gZmFjdCB0aGVyZSBpcyBubyBsaWJndGtfc3ZnLmEucC8gZGlyZWN0b3J5IGlu
IG15IC1zcmMgcGFja2FnZSBhdCBhbGwuDQoNCkRvIGVpdGhlciBvZiB5b3UgaGF2ZSBhbnkgaWRl
YSB3aGF0IGNvdWxkIGhhdmUgYmVlbiB0cmlnZ2VyaW5nIHRoaXM/DQoNCkNoZWVycywNClJvc3M=

