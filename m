Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96168CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 15:21:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1175.1792164073934748749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 08:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=c1pndBC8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=c1pndBC8;
 spf=pass (domain: arm.com, ip: 52.101.69.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wYCcJi8/ZXuBOFhU1MUrhZIAYG41f9Rs5+ALq/3C7Eh3DMjxHMoqHRmVFgBn93ayP0h9b4aO704Cj5nFsYcInjtY0WZB2PzAyB7MF4qmI+/UPnoQnkbeZi96Nq9mIldYSmgKTJ7JzppRshCf5IM0z2SFpiBtA8qWlJJNA/TbMjbyFV0HgDFEmYNESUcZWMnFX0A0Jo3+n2IJWfzgOAf0CKy51Suwq5WWaE1OF5EeOSKoJKQUNQiAr3mrIeNoE0DGcHvKtgjXXdAZiRAYwUitSPqsoEBUeHKdKacR+IFrzq6nx0AqI11bB6n6pYH7qlob01O/aU86pAtu0flXj6JzMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwt6RGnVnVJeIxewM8sr/dSHbvT0RDUC7iFJJjpU0Uw=;
 b=kFtry/lOEmNC5pAIpUklarldfWa7QbbEdsWhwi10ucOl9dYaJhD7Jsm0gRkcMbexqtWBFpY+i8pwoidaQskHz1lk7uSsUlOwgHwIyQ4AvK0SwbGUyePJO95uuL+Wnai5FqcBKuHwk8exTQP55cy1NOjGRWa1A4yEI42AftsMmGZNr8TjM9OEk5tOK9OCgBPVsKXuIKyBdvyIkP7VmFYsLmOlT+6LYQS0Aw87Va9sm6QxvmcFiDHlbcOITgf9xYQw5/i4woUFiXTB6Fy2WiLPaHXbfRDogtdYDsiAPH6dg2dvpuW/wTUZrBjkzWoWWXQZ1BVZprm2ttna8gd4DLFVAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwt6RGnVnVJeIxewM8sr/dSHbvT0RDUC7iFJJjpU0Uw=;
 b=c1pndBC85PHA9WwqleyVNNa7/ed1QdmYdE4rcO1TnXw97ZR0SBUy12MrZlKWxaz2zyKhin6KbKmhkbJvMXgJbO4R1qAYBuEBCwG7VKqhc4MRk8wthypMnvdqm3jOSn620wcgMbY3oBiUvmFA1FS3++CR0otriCVb1ATALfvYoTQ=
Received: from DU7P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::32)
 by PAWPR08MB9832.eurprd08.prod.outlook.com (2603:10a6:102:2ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.11; Fri, 16 Oct
 2026 15:21:04 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::a0) by DU7P189CA0025.outlook.office365.com
 (2603:10a6:10:552::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 15:21:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 16 Oct 2026 15:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caGBehScrD6K/v7Ca/H0GTfI8twzhbbFZ7CfDWQpovlyp5TbKbOljurrEAY5LAc6eENad8wddbhwTRIkbaq+/Rwhy2Httw0kSKbYGx7S+Gs1AaoHJXMIHWeu3/GRqL+6tExibWQJefuz8QhtPNnwEWb+oq5LhZalEasw1fKHjBE9Jxt5klahTDQc+sukyQOlBvNj6T5MPjd/265jNKriSdJiAD6nHzlvjg0N2tf6+FwpHX6w77c6GBsOecR3NsLHCyO7E5A62lCI0NtdUkyUDaIWXhRnWKEOcFB3YgHuD0bgnQlRTI+g2pCaW8iwD6T+GqH4fw2tSV7L68w50pgFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwt6RGnVnVJeIxewM8sr/dSHbvT0RDUC7iFJJjpU0Uw=;
 b=ZH7rc9WZgABNJ5jv+PvoxCFDhADaEL6XltwlVZ6NqI+FVJMhSOBdRrehDrFTqlg0JMfJWiPdqgyVKZWywbe+3kuJEjPTpn6ewUE8UxqmjfMYbMtK3Vhl5qa/4xMgjVK//EgRdGroZ96nZ9rFimgIZuQ4iq+Z5JO7RdgNqr8L74US6UsR7zv6FE+7j0EeGkwDtamDK9Zx1drKgqwiMITuBxBRgGuS/D/RbqXNdmA1FCk19z84bUG48ghFTh1YAcTJMFXysJXt5CyslGMqHPWzgywyHPX1ogD17ZcGh/MHmLttXc7WWbqp3eQJiwsd79jBcUqwrnRUlzvNne6GLO5WBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwt6RGnVnVJeIxewM8sr/dSHbvT0RDUC7iFJJjpU0Uw=;
 b=c1pndBC85PHA9WwqleyVNNa7/ed1QdmYdE4rcO1TnXw97ZR0SBUy12MrZlKWxaz2zyKhin6KbKmhkbJvMXgJbO4R1qAYBuEBCwG7VKqhc4MRk8wthypMnvdqm3jOSn620wcgMbY3oBiUvmFA1FS3++CR0otriCVb1ATALfvYoTQ=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Fri, 16 Oct
 2026 15:20:31 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Fri, 16 Oct 2026
 15:20:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrej.kozemcak@siemens.com" <andrej.kozemcak@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] runqemu: support rootfs-dbg flag in
 QB_FSINFO
Thread-Topic: [OE-core] [PATCH 2/3] runqemu: support rootfs-dbg flag in
 QB_FSINFO
Thread-Index: AQHdUmQGY8/KMP3KGUKh37dt11Sv/rcAXuqA
Date: Fri, 16 Oct 2026 15:20:28 +0000
Message-ID: <6CDC140C-00B9-49FD-A494-BB775D82DD67@arm.com>
References: <20261002114848.1126256-1-andrej.kozemcak@siemens.com>
 <20261002114848.1126256-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20261002114848.1126256-2-andrej.kozemcak@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|GV2PR08MB9399:EE_|DB1PEPF000509EA:EE_|PAWPR08MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3a5edd-5974-4727-9748-08df2b991801
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|38070700021|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 Km9ekdGzUvlp6miE1M9ihtUmddNtCUONHeDXBXmWDrYYbDgHP25j77IooUSjWq0BuNmJ54uOOYOE6Ymz7Co6DBFd1Vnhe8vVSUg7SQusZ/OaUX0utI1tHWz8kpBqCuO6G+AVRHet+hjXImgSo/BWz+ahCZO4Av7eHxTUmS73ppuvazt6g6Wqg3x88MsClncdK7Xz4xPtY/9JTef/QSwiPRE/JNC1D93p3ubAZQ92wTkLhnHUSfPnFoyFYGzkSE6k+brnIhQXestx9poKpzWVpJN/mL+NDjP4k2kEf8PhNKd0I2Du0NMfoCoZC2GhjVqIK7fvj6eiyzZz3zAt8nBuyld2jWTmCgZ/FSqQ6CqfaEQF9xyptS22FjJoSaGoZPqrgSC3FQnBoDrrQXAcZ/LgiADe7SH7/5d4kI34xWG0WkWxHqwnXrUdAR2GNhjpfZNOiErFsw5cAkpVjntI6DYGNjKPWT58zYtvDEJtq2gGpCsM98CVFPpanaAWTNruoVNxbRKtBh6CB66m5ArmBjfLh1H5ypiuTBykQHZdUFQa8zqC5vB2jLQzjAh51wwqTEcXuUxlDQ4Cn85ouiYne1WL/Ci74nzFr3rO9BtXQ3Lri6K7ZAEu4vJlvvJ6y6iUwelUenoYnP65G3MpNuNCCJ6/DeTIDYpifQTsCdsUXAvAmKMuI86RcpAS6T/Gm537q7GjhMDKVgLPK6dSChAIRTA/9XmC1y7RYaNPu/T8C3xKr2k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(38070700021)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBECF40D160030448F8AD21D6E02A9D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 URlWQVUBSUM8xME9crpuLeBE6mSp+BDWiaEvcOuYPrNvRsO7Q+Vv3LH48/I2kXl8/ifKea8Whd2REsD2Gi5pgDYxYSpB2WZIDLgnNoJKd/BNmm5zgEL7idkkgJgH9SY/2UpiMOfAyblqvHc/85RcK+fd7YeyFek4Bcy1MmN6u11n8taq1B/QAX5lLIyoDDknMiMkQFFWs+xsPPO7eZBAGY7roz//kcFgvHHvVaOj5k1Opeq+FuhG9BKG68gYJbnzYTvi3Bh1EqZZexK4zgtQtMdXXZc/Og6QVAHfPJq1R9vYW5ElQi88ATI9WxLBSI/ajHd+dU4WDSqMhPBOk5Fgog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4152798f-dee2-49b4-fd6b-08df2b9902ce
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|35042699022|376014|14060799003|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gCoDbRRvjDg6G9vUUVo7bQlOSbOJdQz6y7PEH68YOoujXJxKfiwFhZPRvfIOD3FsOBWynoW1TYHtcejr88FIzBpgDWPf27JCdJ1jzAPPFgBEAMyDBfcK63Ri2POq6w7sSm9wWi2drDKzXfUa2a35znmPiCKcU29nJ7Yj1fMvS4KouVVLwk5WcFALouYIGJKUJ+ocBP3470ODwsVVGqw8NsPtjN3M3U5ALCrmXdRaZbGrToGavIUvvclZFHNcW0nWcQtDuQMVxO98KpkSzEeFCkpe2jOCKY+VoMO8cVp6LE/w6IxbpE3iFzUKW6AvbIQiPOSlhgfYPHOyJJYbcoVhF+jQb4VwwKLp3m1nEA/hgmXb5m6Q1L47Yj1+V1rZKFdZcdXfYGsbeIhv6kLhP7iciwnwaUxweSoE/UR15BRPHzuAxy06ofEKndXdL9CN/9sH4XCVIld47kWfBzhb6k+5o6HDKo0s5bGtS61jNtEwfGPFTSEYshetkQaKbAVihYSjzBqn25AJbO/Tevju6t6Bm6bNk0BymvU8oUAbLfQ4DUj1gK0ZImfomOizHo98HcfwUnoO6Ur9ymjbVGFhkUAb14ZbmXTCdH+RCl7V0ZzJDL6sxXR4AZte7RN6kzPLBvFPQ/RyyzBIMlLKXe84cd+PF1JM9jwNQT9uH5WE9Pjc23iSAsyfJf7ZpO5lwY4Be6wW+Aeq/iRHuOR45BPhCRC23w==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(35042699022)(376014)(14060799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5JfgpK6vOALLzENOwZH7JpCWn6FyaweXTrSW4UMnXs+MmDGmb2FbaGaTEn5TtYwMN+p7zvmWK1lrdf8vHlVv31+atugcgXcwn04/OQ9CfBi9MHqDcJInQbLkGXpPXSXv42UhBYe696/YaTYAyMJaNH75FpikmEJanf+11go5KHI/bnNI9FJFsAOykTQzAWRGw+qjy41P4/+peRrhPoCZipJYhTQCNhuYhnkk33oX+iyW5lCGie1pxWm1j999cgQfmjT+E40i8d0hDNR6n6tuluZPJAbNEFJuTZ0ekwIIf8a4ZJPdlK9BwugGOx4qGpNpDp2vC+lzWlsAM6CBDWk/nwyMi7x1gje3Mf4G+CVI/Y2rKU1P1SyQpcCXVn2YDzJ+KXaq6iM8+zGdCtX6sFeErlreudEWLVwVJDFLkrfRESCGUhpWy1NJuE1+VKqoTvx/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:21:04.2170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3a5edd-5974-4727-9748-08df2b991801
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248037

T24gMiBPY3QgMjAyNiwgYXQgMTI6NDgsIEFuZHJlaiBLb3plbWNhayB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YW5kcmVqLmtvemVtY2FrPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gQWRkIHBhcnNpbmcgZm9yIGEgbmV3ICdyb290ZnMtZGJnJyBm
bGFnIG9uIHRhci1iYXNlZCBmaWxlc3lzdGVtDQo+IHR5cGVzIGluIFFCX0ZTSU5GTy4gV2hlbiBz
ZXQsIHJ1bnFlbXUgYXBwZW5kcyAnLWRiZycgdG8gdGhlDQo+IElNQUdFX0xJTktfTkFNRSB1c2Vk
IHRvIGxvY2F0ZSB0aGUgcm9vdGZzIHRhcmJhbGwgZm9yIE5GUw0KPiBleHRyYWN0aW9uLCBhbGxv
d2luZyB1c2Ugb2YgdGhlIGRlYnVnIHJvb3RmcyB2YXJpYW50Lg0KPiANCj4gUUJfRlNJTkZPOiBh
ZGRpdGlvbmFsIGZpbGVzeXN0ZW0gbWV0YWRhdGEsIGFzIGEgc3BhY2Utc2VwYXJhdGVkIGxpc3Qg
b2YNCj4gImZzdHlwZTpmbGFnIiBlbnRyaWVzLCBlLmcuLCAid2ljOm5vLWtlcm5lbC1pbi1mcyB0
YXI6cm9vdGZzLWRiZyINCj4gU3VwcG9ydGVkIGZsYWdzIGluY2x1ZGUgIndpYzpuby1rZXJuZWwt
aW4tZnMiIG9yICJ3aWM6a2VybmVsLWluLWZzIg0KPiB0byBzZWxlY3Qgd2hldGhlciBhIFdJQyBp
bWFnZSBjb250YWlucyB0aGUga2VybmVsIGluIHRoZSBmaWxlc3lzdGVtLA0KPiBhbmQgInRhcjpy
b290ZnMtZGJnIiB0byB0ZWxsIHJ1bnFlbXUgdG8gdXNlIHRoZSBkZWJ1ZyByb290ZnMgaW1hZ2Uu
DQoNCklmIHdl4oCZcmUgYWRkaW5nIG1vcmUgZmxhZ3MgdG8gcnVucWVtdSB0aGVuIHRoZXkgbmVl
ZCB0byBiZSBkb2N1bWVudGVkIHNvbWV3aGVyZS4gIFdpbGwgeW91IGFsc28gYmUgYWJsZSB0byBw
cmVwYXJlIHBhdGNoZXMgZm9yIHRoZSBtYW51YWwgc28gdGhpcyBmZWF0dXJlIGlzbuKAmXQgaW52
aXNpYmxlPw0KDQpUaGFua3MsDQpSb3Nz

