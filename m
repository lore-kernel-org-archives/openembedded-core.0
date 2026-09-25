Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5EDC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:19:34 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5708.1790335163216346609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rf/kejBB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rf/kejBB;
 spf=pass (domain: arm.com, ip: 52.101.65.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M6K+ZhbQ4wb8XBHzxcp5ydBu4AQMQg0giMgwlyQxaM90qPldmpiuOyon1GkWekGifKhHitaBL0QRJ/EUUGvmkMNnzTJs468OygQe/dC0DFfD7uG5rrY23oGiPVJmIAWao7Nmp1KR1j1tuIoH4K/mgDrZl/D2uOYtmqLyd3NNNrbIJMeIV1CjosXFtn39Noj1+D0u+RwSv+remcY6YmNBhvA7X7TpwwYlsMkn6xCAtbnvtosXUwKt99MmFGjOAJtheiKjXy1RHdRvgYTfUAynu7nJMnH1X0EyqaPJf2vv1/oiLK7/No2MKjB6tx1ujDDj1m1IlYK+YyImuBy7nIT7cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l95mBc17mAsP78YLf/ON6FZW+54F9AmGnt2Fy6hlkYg=;
 b=d87u25DxWNanQiL9DsQS+Nu2HddM/KA0+PjaUVaRgYg7OD+7zyZrDPsPIgYTjd+r2EUvMVytk1vpijEa1kC1iWrlRab1ht3AeD5SAHyScNBo2IY2Bw0eh80jaUyuvCvomBNKngobDqUWllZQEGDjpvPiIRPP+5UJtuxnmS7GgKJFzFPLiyhwEKT7t3qujy1TllF36VmahNsniLGzQSpOyEFPecGjZkKG6XT8zQJCHF1iXDh6j1jvwkeevFK6Tq0YMljZZouDfguXf3BLuxCpsyOYoYTTqNC5hkrdE14XrLSBUNbbjUpTCZBp/E6D7NUOyB61s+h71vXgU+h3i2aLQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l95mBc17mAsP78YLf/ON6FZW+54F9AmGnt2Fy6hlkYg=;
 b=Rf/kejBB77mhNQ7Wf8A2hUkkd2wWC8W9cARU42kPqYItDPXYYhFRBv1d6xjzH9cKS2GBSXSMTK7MNjfSYk18KYU2cnHs/TyetSTWheKL8fJiN1BpCZRK4tDMbLzJ2pYn5sm6Eej9QDidm5213XEj7ncwDn6hFQI3D2i0FLvHxPQ=
Received: from DUZPR01CA0155.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::11) by FRZPR08MB11220.eurprd08.prod.outlook.com
 (2603:10a6:d10:136::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 11:19:14 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::aa) by DUZPR01CA0155.outlook.office365.com
 (2603:10a6:10:4bd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Fri,
 25 Sep 2026 11:19:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 11:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCYoBwHiLezey+hrItnt8vCUZekeDjVWsK/0P4f9syC3M0w6dgmqV13ktONEJRimPEU/rf0Jnf2gDLNt3DFmNGC599QORhQp0MmEqbPRuocG6GSLXPBp8qe+hcPSSfrfCvRFweQLUtZdlVEfmfIqwarjItj5ss2rLrVCvdGTc1m8QBdc23u43PU07S8FGWu24lYCajX/v6oIIU/hpveYGj8Y/SY7m+VwYSpRv+34iSgwZF6AoxA1V1MA9MaxNzEb1aTDeEmJUDxIr6uV7fUUa+QuNAR9zKhCRtZm6+Z3c+Ne/LhWgio60+fQsUjbIEU7tccMYNgwRjnjwQ9RHgaOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l95mBc17mAsP78YLf/ON6FZW+54F9AmGnt2Fy6hlkYg=;
 b=JDo7szxhoEOVi2iReWiTqUDp2RcUyANJzobMc2KhwZeUlUlJuXZaC2s/1y7dUDKrhMYhs0qDEH9NBTNtIvSUe/cX/8JRdSic4JUpRrcKjLxKP/EfrUwMWr1V8D45IQPoCNi3jD7riXXigaZdtO+ghGffPYIf1hCsQmeFY6VAI616Lhlc8nqIBFMeExwWkKbW43KR8/rPHqtU1N8m/zGSW/LhnC3K7dn2qhIMlomI2ZSUTBjKi1SHd7Knzg+6pRQC0sZsff42St52Tewkc6stmg5qgIrBC7ncXiFhqETUdzR42BzW2ASAt9mt5ksnaiQCqw6kSVs3TOoGv5rCw4nIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l95mBc17mAsP78YLf/ON6FZW+54F9AmGnt2Fy6hlkYg=;
 b=Rf/kejBB77mhNQ7Wf8A2hUkkd2wWC8W9cARU42kPqYItDPXYYhFRBv1d6xjzH9cKS2GBSXSMTK7MNjfSYk18KYU2cnHs/TyetSTWheKL8fJiN1BpCZRK4tDMbLzJ2pYn5sm6Eej9QDidm5213XEj7ncwDn6hFQI3D2i0FLvHxPQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM7PR08MB5352.eurprd08.prod.outlook.com (2603:10a6:20b:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 11:18:39 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:18:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 5/5] go-mod-update-modules: include the generated
 files from the class
Thread-Topic: [oe-core][PATCH 5/5] go-mod-update-modules: include the
 generated files from the class
Thread-Index: AQHdSnQx9eSGYZGVZEqXOUP2Kry5ILbfKkQA
Date: Fri, 25 Sep 2026 11:18:39 +0000
Message-ID: <776C7C9B-D450-4067-B9E0-A68576F303A3@arm.com>
References: <20260922092411.262885-1-f_l_k@t-online.de>
 <20260922092411.262885-5-f_l_k@t-online.de>
In-Reply-To: <20260922092411.262885-5-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM7PR08MB5352:EE_|DU2PEPF00028D08:EE_|FRZPR08MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: db44caff-f6d9-4aa0-42a2-08df1af6d4de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 YJrMIV0r7rvc/lN7BcjbQejVLPBHcGZc6bOcvEEudu4Bl7qCdZGyJTMPVA/51uHAifaeaO/i0pTBYi8L6vDP3USPuLcIaWr+EEftyYhhORZ+ptGXwg1eNMWWKytv5zx6eXFsggZk8F2hPX/Na5IH7LOfpfRSxonaRERecScIvX8n84OHoVvHPJtZgUewe1z1SQtJTtBwSXKPL+gH7RJ+5yZ8ykigBw8RJTN0T60lCI1x1cOxAcVC1zqGMwKEXARndkOkZR/S3+1SrqOoNZ3VjhORgtoG3saIL4EovoauX+s8zEOLc664wVl8uQhweW0EcmTbbPgOFq5a65APAf1FLy45MnV1kqji0Mx3keuMykBLNq53zdm0T20xiOhS3S4UC9eNtQub4E1GLcIMPO1yVSPRFep3O5fs+7DBZQZeqt5qDmf70EuqfR02wg67i2/M3v3haHi2zWQPtYaIcofQ4PWnHnACuECrX+qNlJiswPDZBRPyDK4VkMn7fipnoTGM0XLf/3UsiCDxfLb9dwfnrogvLlaV7Yw/fkgKTQTJoEHmZZod68b8qSe+JaCtxfeyoOFiUCCz2/J5aQdXXMoRI453ZWIme3EWCHKPK5a92LbM54yCnVH97cxxDhYlo1AX41A5WghVKx+9nK6r9oe9NF3w0/+YvlNEfntg7hv+Ts+N5xMeqHxxPLHW/2U/cj2qdAWwvArR2vpn4LMeHe3MTugpsk/QDMkhKqzxIPH5OHk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B95F890D9F0044A8761803A419BCD6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 INuPxN594ZKW0SYeBT0j5znidEjryhNkinJ7ZDuTAmxPUaj4+SMjg/2p6Radj5grXIqnFdalknV2mUzyabe8hhUITNt1hAbvoRa86YcgOnmNRd0eIBjYPaxuquXNbMFYNVvhTSwqER1JrGKDcDMOwpK7ZJdor8KKyWx8c1QqdQ4C05HHhd/v5M4sVN8ONkxu41F6yStwEVG8r2XJX4lVeBW9irHRfXA4QshQKdQs+EUqXMeO9lTCeShIASbJGUV9uI5aY4ODTOQVvSVX69jKcVCkwRYSRbUO5HlkoZRHtI6afI1+iX4R9rYPgFe+L3Do2WYzziuoRNip/sIEqFhLqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5352
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9b13848-106a-4ee1-91e2-08df1af6bfc2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|82310400026|14060799003|23010399003|36860700016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	oacqRqQ3WLCDHYDT3PU9AARvC26zhywIX5CXTX7x0AtJ6nVH6Z0GSuXXntwIWOSligw0BCN5bl0PZzoDlwYCftGsHkuL8XnOZ/2TLLTG7kRTN8+xuIB6TazRFENwQvKd8Iu7LwbZ0eGjD3rSnLiLRqhm5nf70n132S3xNy67hGcPuKe5Y7IUhuzowP7LbO4eyfnF2r8abSKXiCuUVhSS4pvEPyoRjOZIpb/gZiSAN0oUFZ1+sBjOLB2ZZw/z9X8ZbkvmMAXl8YUW1NWYJykLSkiqfdGjgPLNvlsbiHJELdjK28SVHa63OvLjQgEUNr1xLNHEyBknPPgameNnZ/wur3kHwHWeFdmq4uLVARx1BMwei4Xl1izpOOiSGexrdkHkRqs5JPXJAnyXqneJGJRi/zk1X250o/l505JMs8dOI2UHQxXLbcxFLG57fx1ywBl5NBuVMB0zJBnUfIWGKNUqYs6GJXDjpfKwvQb6SVkt/tb/d2RhD3iUwyzP7DqnYLMmi6JUHEZWwd5mZbzSSjPFXr9RsbKSRgm9Iq5IRCWqZMBwCU3L3P9p5czQ76SnPJYwdzTu7Aezx6E7rw+vsthgIhp4ntnbDxSecF58zGnKWOQrG8sHmim/6h4crweaEt1gzZDUjB1+Low1xxG/C4ZnXz1HqatyQP5Y/WMixJ3tK0NR0gdvX+BAYexnsJvoAXpwYlW06gBM/hdiWj3cETde9Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	l8+3BclNHdSq3hHzlB24ZJG6ZTO8BmlAt7UIkg1FkwseGtuuhUWAfzy4Si8Qsi4vTw5Du/BTGCnVWLJi/odYpVqyyKciY0qPkwHPsQ4cEd6Y5EPHISRZKU76L5p4BmqiypcnKKX7lAtThB/XD+TUpuFgjYMHe58e9eQV4BoI+LKRxoYR4OaJ9hzuQBRWmiKyUTcqjV7oezkqdfjfdyVEhRy1+TQyyfmdY2qMSylIwSeHKUkiEg6fMFFg+pWx2pd9G5f025KHHMSXl7CSh+4b/52XZY/jPiKlX3a3mTLjN5pXv9RwBE4wiji7OY3g4YQaXREZbHmS8w43THJhX6bDEmHjIZJ7o/H7xNgCrLYvPAruNfYD2uSp406fP9dNF5qBXGo4ZaxYCIxIjm8y+092lQ5SjgO0MmsZ2vVc36ueiHuqQLCTZjikv3hlddcbfTN/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:19:14.5028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db44caff-f6d9-4aa0-42a2-08df1af6d4de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 11:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246615

T24gMjIgU2VwIDIwMjYsIGF0IDEwOjIzLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IEEgbmV3IHJlY2lwZSBjb3VsZCBub3QgYmUgcGFyc2VkIGJlZm9yZSBpdHMgZmlyc3QgdXBk
YXRlX21vZHVsZXMgcnVuDQo+IGJlY2F1c2UgaXQgaGFkIHRvIHJlcXVpcmUgdGhlIHR3byBnZW5l
cmF0ZWQgZmlsZXMgaXRzZWxmLiBJbmNsdWRlIHRoZW0NCj4gZnJvbSB0aGUgY2xhc3MgaW5zdGVh
ZCwgcmVsYXRpdmUgdG8gdGhlIHJlY2lwZSwgc28gYSBtaXNzaW5nIGZpbGUgaXMNCj4gdG9sZXJh
dGVkIHVudGlsIHRoZSB0YXNrIGhhcyB3cml0dGVuIGl0Lg0KDQpXaGVyZSBpcyB0aGlzIG5ldyBy
ZWNpcGUgY29taW5nIGZyb20/ICByZWNpcGV0b29sIHNob3VsZCBiZSBjcmVhdGluZyB0aGUgZmls
ZXMgd2hlbiBpdCB3cml0ZXMgdGhlIHJlY2lwZSBmaWxlIHNvIGl0IGNhbuKAmXQgYmUgdGhlcmUu
ICBJZiB5b3XigJlyZSBoYW5kLWNvZGluZyB0aGUgcmVjaXBlIHRoZW4geW91IGNhbiB0b3VjaCB0
aGUgZmlsZXMgd2hlbiB5b3Ugd3JpdGUgcmVxdWlyZSwgb3IganVzdCBpbmNsdWRlIGluIHRoZSBy
ZWNpcGUuDQoNClJvc3M=

