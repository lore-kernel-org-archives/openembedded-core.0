Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD148EFCE38
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 18:00:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24857.1772647210710213771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 10:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=I+CspMWO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=I+CspMWO;
 spf=pass (domain: arm.com, ip: 40.107.162.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CkCrO77JcinOBnfulpfdaVIpbLgMVews/gqKNlfbWUztWN2u/t9njV6BLZtCiM7xyTJ8c44J0hRsOaVlKbWSA4lsQ8vtPm//RItVVCZk85gW3b7SWRn8qGRcoFf4JHAyXkXe6V6/2TQgX5jeK0BOL+/mf551+QJf4HOf/XldXHeorIRytFUmjzSFCqHnPKYfSafl90AY8b1CETw76ihMvRunjOudS8zQCaayCmcxJsopUee/y0+MfJO7oXE+itgDfuEk2KrSnaN/JPGbWLDZkCaqaWhkGPNoWa2nHTQAX/ZVU3zVolHCYi3lOQEPw6DN4M/oqHKqBq/QavXv8LCduA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gdC+mq1rFouqTrQAch5uGG/1osBimuhjO3o+H24eDE=;
 b=tV0zfimo3l0w7P0WCeJw9XbfT4D6LsUz/n7jPpJeBm3oUg6vVTBI9KJ3uszPlqVFH6VfWDf0uQ++RZYA0QpyS8D3qcWDI22+Uvtsieao1giEBcxo+y5ZJTpEKbVBd8UtKoUQHBHieI+JAp8iZ4yX0QhCTuhB3VFRN2DA1G6JTMMQ0Rgbxv5eOwlFw3J80wXE+7NRZD1ShE9XtzaBqe9o21vkB/ApUCL4H4oohV3BeSgSveIj4dJXMCrGDPRtHZLdQY5rbdzMnfmfxfTPxFGdbu+lWPEPzuR7fuLLEqW8Ya2XoyLpXk8+QA8kbCnq8q0JYXJluX2QH/pZQAdOIP4kEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gdC+mq1rFouqTrQAch5uGG/1osBimuhjO3o+H24eDE=;
 b=I+CspMWO1HYXweDVuFzpgCglGstc5pSObRWtAeGEXJW7TJRVWWVXkIy/sjlj0VsvrjHQoMeAswoiJ9uN7+V3ZaO/mSf8hbDKV8dNXFV7fWdKs8bKB33q5xSGq8TGZT5KvE06OeCC416a8I81W/EyT+tx2KlxPS6xsKzCcRtAi18=
Received: from AS4P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::6)
 by DU0PR08MB7786.eurprd08.prod.outlook.com (2603:10a6:10:3b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:00:00 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::be) by AS4P191CA0021.outlook.office365.com
 (2603:10a6:20b:5d9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 17:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 17:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0osISwT0Qb1FayyH9lLK2xTXMPiKq5YRc1zeOoHewiyMr4ePI9OtGsn9MS/UdziGK/7fB2k6us2f9eyZDuBGJX28iGsvG496zv73XYhQjYiR1aFnfjeGgkOepqHmiOjuPoewoCoXRSj6PFOIIc7rbLSRj0l27K5N+ItC1qqP6q4lzkwsby0aHa1rwq1T+4RAeE5Bc3eUEByKsGyBfI+MH/xze89tNlxlhM27LPjvg+hH8SfmEFIU+Hkqi9LgoBmHOj1MTKjNnE0Dfq3yjxwrg4oMozq0wL9Y1ZzjcXiVcPy2PXDFOOdojlU7pphNR3HoGcT3bdjvKnHowLDLuo1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gdC+mq1rFouqTrQAch5uGG/1osBimuhjO3o+H24eDE=;
 b=WidUxEiYo211FtKyZNO1aOs/5YR97n+eyyU2kV49lq9OxT/tHX4LJ3J7hQaeIVmo/PKszsKigetJPfdQZv4KmitjqZYIUggOq0nL9kHBfJSCxIF25Wb4D2GwwaqNq90PYjRWI83eCty9c2ELK+P5H40OPAliTI8GxCmHQEg5kCI6zYVW8FvA17FtIigJEPxlMpEMMj0WSXRbqBHFoatE7gndHlVXQ+3OYMqMGOVN3nfA7fL23g5ptLLolR/Z92hQ9NIwoa7Jo8p1PVKRKPnyz2QcWqjxzRtyCsoc1BTD2l2jrGVkB86Jd/IjmsXYupiI36w+hPfxstO1H177sJPnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gdC+mq1rFouqTrQAch5uGG/1osBimuhjO3o+H24eDE=;
 b=I+CspMWO1HYXweDVuFzpgCglGstc5pSObRWtAeGEXJW7TJRVWWVXkIy/sjlj0VsvrjHQoMeAswoiJ9uN7+V3ZaO/mSf8hbDKV8dNXFV7fWdKs8bKB33q5xSGq8TGZT5KvE06OeCC416a8I81W/EyT+tx2KlxPS6xsKzCcRtAi18=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5794.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:58:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:58:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Changqing Li <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
Thread-Topic: [OE-core] [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
Thread-Index: AQHcp7gCPp8IyIj6okSKwBpPjzeMd7Wc8e2AgAEOJwCAALGTAA==
Date: Wed, 4 Mar 2026 17:58:56 +0000
Message-ID: <E1B2993A-68BE-4163-AE22-C639153BC92E@arm.com>
References: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
 <20260227070858.2687898-1-changqing.li@windriver.com>
 <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
 <519f845e-41a2-4cc3-8b8c-ff57b743a0ce@windriver.com>
In-Reply-To: <519f845e-41a2-4cc3-8b8c-ff57b743a0ce@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5794:EE_|AM1PEPF000252DB:EE_|DU0PR08MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7884f2-fde5-4ff5-8090-08de7a17d987
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 Br9HUwUY/GctOUecYN+MMDQMJzqZf3RZ67kmIkai/RSYgzuMjE82FYgoFpFu/pfvBgcTezokcwXHsEx4jnZU5yQyP/vlYV40orufFtqzwdzHo+cWiuFJcQoXWMAkzXwUbmnLoPda1cDubqIlWQ5YLXdSTajvGiymbZs4zZ7iQFGL26xuflrLGXtjYOg2UUNu3zQyP3a20Piaw0nquIZ7qvgLLne+Pd4t/kK0zRsDzz96f6Q9OoKemYrw106zp20Gt+XRyCdzKQCaDPlr+8CWGaoU1z1pUGJPs8GWy7R+8+bBt1gpSBO004x6VO3dUJvXlopV49mc84pT/TCz1/gZtebsA8sBYINed43OBJ9rd9hy1C+DHog6+HKaY/FbOJOS8q/PspqciVcLrOH9VnRyoEyp5o8pdWDltxMxGLfBb65VTO1nfI8M002zZ0X8EP4ZpTtp7GmypIqkChNEGGDmyFQkKNr3F6c54Ok/vo48fwhsmdi60NkXFID5/GmZm9w/Tg71POUuYdOIkMDQNaiImZjwlFtWOk0JlpfYd/AsAnZY8kBx6diaaDdjFQ1QKhSEqZFceqbG9aKlek/gIVPQWo1+tIMDeqGSjXxE705zJbDshCcJmC/ODOZTlIvmAAZbhjsRnD+OrlO95Di2/+2Lfxg15+oivpYMiuRM7ZIKy7PlZM1YeP5KxiTupCDQrv1g+DBCDqQ0LR2+g3ljmWz0fqqmQr0/NFV5GA39fNPpMGCHo9vTjMVsOdQCp4dTnFT5SvaoeqkSj3mSVLV7K3znBXI/3v1UKJ+9EWaLRI2hHF0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0B509E68F74814BBC228A112A9E773E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29c00771-1593-49d6-618f-08de7a17b498
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|35042699022|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	2ly9hM/7LTXg0O91k6eH360s35QHVSGlPn7Lq4XeLVMT4ZgPtDjd4Y3WiS67Ui1/rPoEVrqetVEWXsCJZSzDZxDzyTYHeTVMlrUtRVtbCzpuVCKYqCincL/fj22Br9pJ32GhqigYLO4uSntbgC5aao0Akc4tuikLinPPwkkqIQ0BYQYuNfYzEcjYTXr0/dodyvmNhhrhE00k/Q2Ma9nc0hMED9lAPZ8+6caIQi0JLziBijrVhhCeAouOgx+84ePd7YacOcX0AhlGWtgQ95ccwo4zGKhvRoBmF6GU3jEsE8UKTYDKamSaaTQ3IaGVSRxxzvEGgHoqlH7UebnLZX/I5UENPZQw4sGADUvcXLSkuO8q5ky4x5hRNOpFAztMC2fODleY4paGkHVPTFbkcSGHOB7jSJK2X46PsKcFytz/F3Rm/+sCoKCh1Jix5xzqWTZq1I8OtasHnIbCf08zWs9q3gbtSR0QMOdH+5OG9y1BLMbVKc2TdxulGnf9XMNLLwxbl/2iG1/moh+4ksuJWCAUPlNRvPSrEs578dYm+ys+rrLUXFQsjDVAfgbCWyDY7ARSbj1M6oEjwkD0w8CAhEcn9D2YT3ZmdEPLWvBgUI59lGkwZ8wHpN/u3Q171y47CIqlGxKiuuu93eeU13xs2InuoZUVM+HysWtyfjzB5aaZ1dzW/fpMjg1cRmSOWmWED3zswf6W2uhBpS1spoIsN2RLsmcL8aMgtl9ne84x5InJleFjlGl+gplTmrPJhAnnjmROuSISlrEuEqTcWCA+cr60dA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GynA2rawWizXOu5rzWkqwsS2bMYZrZvrzktIgYgzyFqfav0uN5x1dqDFNDP2soJTj4weuYGE0i3T6dK5LPIQ9fpyaBywpFm1tT24QsBUcFqVmYWQnpv4m8fwieGstQGIkotchD9NL5nZgoZOwQAxlKd0xvYYZKQ7wx3OpuhM4dur906UnOCO2JrmCXAeXcLLEg7+9hpt7AMIkW99EvzmF1kbBbTIbRFdFGvL8xr8CxA1rvOLp6qENHDwGjrH4zG0ehzdVKY5G9niI+HdUyMni3DeduI9gpN14pX2w+V37XvfXgKSEzLKjxS+K9BysvfBYr6O+mQ1k6WucyAZXhY76/y45Nw5221pvqMFH0Sx6Kr0DG/7Hy46R/T5EEQdTLHDYR2L7gJeaZbDPOrTr39lwDHRBptGMIJAGaHRU2HlxpzrgLsxK6vUpMNM5zylxsiF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:58.5109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7884f2-fde5-4ff5-8090-08de7a17d987
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232432

T24gNCBNYXIgMjAyNiwgYXQgMDc6MjMsIENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGlzLiAgSG93IGFi
b3V0IHdlIGp1c3QgaW5zdGFsbCAtZGV2IHBhY2thZ2VzPyBzbyB0aGF0IHdlIGRvbid0IG5lZWQg
YSBsb2NhbCBwYXRjaCB0byBzZXQgTFVBX1JFQURMSU5FTElCIHRvICJsaWJyZWFkbGluZS5zby44
4oCdLiBBbmQNCj4gaW4gdGhpcyB3YXksIHdlIGFyZSBhbGlnbiB3aXRoIGx1YSB1cHN0cmVhbSBl
eHBlY3RlZCAoaWYgcmVhZGxpbmUtZGV2IGluc3RhbGxlZCwgcmVhZGxpbmUgaXMgdXNlZCwgb3Ro
ZXJ3aXNlLCBub3QgdXNlIHJlYWRsaW5lKQ0KPiBIZXJlIGlzIHRoZSBkaWZmIGJhc2VkIG9uIFYz
Og0KPiAgUEFDS0FHRUNPTkZJRyA/Pz0gInJlYWRsaW5lIg0KPiAtUEFDS0FHRUNPTkZJR1tyZWFk
bGluZV0gPSAiLCxyZWFkbGluZSINCj4gK1BBQ0tBR0VDT05GSUdbcmVhZGxpbmVdID0gIiwsLHJl
YWRsaW5lLWRldiINCg0KSGFyZCBuby4gVGhpcyBrZWVwcyBvbiBoYXBwZW5pbmcgd2l0aCBkaWZm
ZXJlbnQgcGVvcGxlIGJlaW5nIGNsZXZlciB3aXRoIGRsb3BlbigpIGFuZCBlYWNoIHRpbWUgdGhl
eeKAmXJlIHdyb25nLg0KDQpSb3Nz

