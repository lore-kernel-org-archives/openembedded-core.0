Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99CA108E1E9
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:06:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8572.1773918357995823660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WzVy0aKx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WzVy0aKx;
 spf=pass (domain: arm.com, ip: 40.107.130.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nwOS6Ldf7NQRrZaZWBvBzYiEgNZHvY6pkDAtzLnkuwZ6BGf3c7nUTMcpHFt63WXIHZ+e2VutPz21IhJYiEHHqs0RpCR7vm/txtVvHvPDHgnhtn/jYU1O3D2y/SHrGQv8JdTU/WrO19lVExcHG56ATbQonghA9HYhyeSNtOlSYBHTAuH6+wYuxMyoj5+Tnxe5g86PpdnQ8NTRn46J2/tqM9BaR3OyXjdSRcK/mLPB0KIGFJdlH3th978Dd+486fu+e5TVN/6SjsN9Q58FBuUHGqysWffuXPv62L0nlIVueNTGwK12BWODtu0U3LX3DIaxuInjXeoph37UNWjtOdU3Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzODX4ahHIQATP5mkcYVTCop1Pwae1lZ6jiSrTfSgfs=;
 b=NRqT6NtdraGuL7UcM+EfhpiVb3bIAjJ3ze/9L2I5k+nL31uOMckmn0S5hjsr66VcWBO80nE2tc3sRUp/2rUc2cBoi3XI95fYe+ZqiXnInzYCk2Cf06TmtYMx0UnIBVu/MjO9c1PhBPYWe9TdygRcmg3yr5RXqdejA6h+xNzMURAsDaFO49dUsHKZowLszzn5xjiEGAmubMwZWRy1CbycRKEjk1mMxxpL/KjMGATpZBT6RNh4OhmpN1I4si7ABUYHdsiePeS90ibaLA/o9w4RqDAitv4JkU8K++zqfy/kkihfcDyipMQQ6NOWOVz1mYgSqhVJn2L6cYS390bwpljw0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzODX4ahHIQATP5mkcYVTCop1Pwae1lZ6jiSrTfSgfs=;
 b=WzVy0aKxRFzZ5dQz6/w+j+LQpub+8cqw/hD2E7xJqVzwqDsjdXk5jk5NNSsN2WgNMnsVILOjckwaPe7ILB8hbKsWyQHL21mVM4F5ASElhIaJ+Gggkm9j2lPSPc7U99/ec9HbibEX+6egNKBFo7LrBqzoRxhqRZKG8tszWMZtuD4=
Received: from DUZPR01CA0299.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::10) by AS8PR08MB6007.eurprd08.prod.outlook.com
 (2603:10a6:20b:29e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:05:52 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::7b) by DUZPR01CA0299.outlook.office365.com
 (2603:10a6:10:4b7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 11:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Thu, 19 Mar 2026 11:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ir0BAFrr//lipjpFuXobs0mX7Gx5vW3jPFB4HyPw/KZKjU0tQG8Kr8l5zBXi0WNX6FAchthKFH9RqbEVxQ4KEwl4pAIc94EEvM2keNAucLcpMPNfMoX1lsHhue9PmbOf/qGLQrCgCpw1jcQHl4OUHHP9RF6mo2w/mG2gltvA1LEVlPfCVO9/oCViaRllI5wDkuEhwO89dpTHH2z2ykHxsf0zE4ab3y98HkacemUM1+NWXNBNplLPm4+uP8Rv63G4pmjjdL1tX+c4oihd9NGhDEY1vnDzeyZ829t4nzLqBJZ73GFG7zDGnw9JNCXxeeqb8TVwSTczCP3xdAbsyOhM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzODX4ahHIQATP5mkcYVTCop1Pwae1lZ6jiSrTfSgfs=;
 b=kqr38Lv4bFIrKOnw+8gxdGn4clWRH5M0J3dx61n55GAns6AYSGocm+tmDMQwIqcizoeCXk4VWqQuqXIv5fDSPN190s878/u0v8a2Lpe/H0hID4G404LLu+LTE4Bj1iUtJrWhYr1gkZGBXA8hPYRQlONZKVEJ4RgfROiWybfw2djnRivhxZ5MaOjkGmf3oI5NKVKlXQRN5OyGuBdsQDoIXUtRG4wAWm4iNk/CJUcabU6RHzZnvSnYP4U/BR7AkgWvcM4eA83LB+HCmoZdu98LybRYs2PoO9leDJqPxPE7/EnGdRywNMOY0Gv+8Wa3YTxsNJ6GhM7/hQr5TcdnOO8Fcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzODX4ahHIQATP5mkcYVTCop1Pwae1lZ6jiSrTfSgfs=;
 b=WzVy0aKxRFzZ5dQz6/w+j+LQpub+8cqw/hD2E7xJqVzwqDsjdXk5jk5NNSsN2WgNMnsVILOjckwaPe7ILB8hbKsWyQHL21mVM4F5ASElhIaJ+Gggkm9j2lPSPc7U99/ec9HbibEX+6egNKBFo7LrBqzoRxhqRZKG8tszWMZtuD4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6118.eurprd08.prod.outlook.com (2603:10a6:20b:29b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:04:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:04:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-chardet: upgrade 5.2.0 -> 6.0.0.post1
Thread-Topic: [OE-core] [PATCH] python3-chardet: upgrade 5.2.0 -> 6.0.0.post1
Thread-Index: AQHcsfnITwj1TwpKYkmOKbUsFcDE5LW1vGOA
Date: Thu, 19 Mar 2026 11:04:46 +0000
Message-ID: <856576AF-E10D-4997-963B-7B8691D0CC5B@arm.com>
References: <20260312082515.4074831-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20260312082515.4074831-1-jiaying.song.cn@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6118:EE_|DB1PEPF00050A00:EE_|AS8PR08MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: f083b053-fca3-4e84-1812-08de85a77bb4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 ulML25QKl1QXKBJPF8BHBt449YU4KOtqxFiBT9AKhEJWpjt7KKg9R0jSF5f3FGr/RF92rIhXdn9KBnXnf23zOrx8yMT0agrGU2XmNoeMuRt6QkldRO5n9E0R1ShkwtDquCFYOsaouk8Sdf6oF7g09EoKgLdKmw1dHDeiACzRPIFd0ixM73ai0YwMDeIVfz5m4jFqlABc51mvY8ocEultncmPOswEuiwNRPWWcXqgUOpP5f8TDHiZP5A+F9beaKk5zKj+Ca36bTHHVyrdxCJIFIf6IjlqjOWKFOsQ3GGIMEn4obFJebrLBcO7m48YftpIQZO/sB9T2JfyjJl90e12t9LXkT/g6v40FSRsWarwg1hT5Bic628zUfPnGlfpXrIgNSPlIkldd4E8tPqbwK/4z538LdfBenY6AaUnUzHooSqAzSyamzEKcX60U6RNrEGTEXu27rYl96m/txzTym9SDxJrir5PmCIHuhuPCz5ZZRLqYoUcqLpK8vXQ7tNCH11cBXEXTWCCHlHFhMETzFSEI/+eik9+S2NkOQ5vSxglTsv8/YDQzTwFysd67FezN9tbrDDjQxepQJfou3CSzlijjNFr458k25UFgkqnOY2ghztzLpQk3ZB72xmTAb4D6cT6z3vG5mVk1yvBmR922xLYAjG3y7EBeieZq19L5ksZS+FurvuWeYYY+vjfHAmKfwE/RusUPceHuBnAXJXZ2HYjHAubJpYBeCJRFvgqrFJNyieHEZdxNwertsWu+r4DbSBH//fC5jkhM+KVun58LA/dV3pntSblJ7eEVjtJpDgowj0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFB6DE1BA6156D438F2CC35D3148C81E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 pn76soWcNtiXrtO5p+4EmOsblwr5vufQpIsE20SyDrgYpYBSPwtZCxZMq8vhR4END8z/g7nnfk7i9jbgqYtTfKnasqygBFIh0xWrPdAll+jvjDeYFThywvshmZ5CSj8zY0zLPI6808S0pOYJXhhUlqqyGE9TXIi49MmpGJVY+VHVAaYykcA04lB8cpnntEY5MjwZIW3/kNq8uMuciPuIhD+eETuScirlOze1cdmU9qQTUPdw+USVKF/0afqhArIbrsIVAxEzowbSSQ5Uhe9e2qLszLisstbCHyvQW7XGUDNk8jHS6qhAvxBE+1z+KMKEX8DbG+F/+GEB/DcEyUi1qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6118
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90757ffa-8bc1-4bbe-a9ca-08de85a754b2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|376014|36860700016|35042699022|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	7PTTbRU0He2DlcGq+9dcOCisZcfauYGAFUJMbU67u8Wrldig0p6wJRznaX9NGc42b/p8zDcyk8MLRceMJNZ67mETkC0XKBq9wWeJEQYgdUZaK+JMvxxlXTLfI4GtZ8tLAPWnyx6tkZsEpXVaLDZNon1TXWAut7Sye8PIYHxafrNDy4T7ATzS+SDlwY9k1MGTJx/+YYkusL/fHNKRCjvxPkbJNn/S0kJ01Xbov+wfOStWzY1UOj1bpynFwU6MzLhpZPyF3Tl7fEWtn4w2/sC3zMWOElTHpRdopTNuybF1VCEO8s92nQ4v8gkSXDNnm1AcvMw34yG7iRYT7n7QRPrDYCNiujGcAseQBKXjXPcSiB9Zbmc46i/nVaXO3naHBWmqVoYVU+aAcsbwYFDwFwy00cng7aKK8nuBZGFLMJXVc0uG5hpPu0FnEk/P81l/y1oGs2evqCor8FxtJjhkJvGpDyBKGVxROshYPB3z7P9AKviLD3uES8S/DL/9iMZwdbgduHNAN98UOeYqVJ/X1rXRREjow5DCGnmsc7A0QaXGExfJuMXv6BoVemrmojNuwbJhNiU+13zYWqb7HPLngieQU0qSvER1w+ABpngnb8ZGf2AsdyebndpjxXamA0lm31xOj1+je6yAMouZKwS0GSW1bhvO2kiXxW81P8zUB5PxnGlrzAQGCYc4N1XJSd5kM+56zOLdEXDXuIUOfHan6knhT0xfqCVtZfrPrtF9ZnLvdmPkh8Qkg4FkCX4Txgej2AtKUwI4BWpxB5z+ZFPPROJ+8A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(36860700016)(35042699022)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zrykGztDNNMAOcMYEepjAsV0PwpXKX+jDfH+CLWDacAnq/+TvTjnCDItAPE8FnwUnSZ2v8yLo8gNYFl7ufuyoSCo1N/iZvDKIzZs+DprS01I2WMSKFm8KorMACAjdQ//TwEMyfXNRt4ZV7Oht/FNFPu0yWgeZXgCFc4N03XYHW9N+SjzPSFxZjSCDxxqHelh/6Hhe2BqwhiTOouaciWA0hBJuGbVpntEeT67GE/9o+s31FdLtKMrBrZqXtZk0HcsHUCWrsmc5JvQ6N9dXhHkLSRV9mNwBFJI9W1OaukSNd+CjZY9VxdVMhy3IgebxTn+AtCL9rNeIAEWmwgagYXwolQ055gg6BWhTPoWI1F7kaJnqIIeKpaqTRtSrXp/xshcT0O/7bp54IZhKhrDAJGHO9sSk12gIqagDITXJ9LQHReBNe5VQrcnqeYLCtsIKNnm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:05:51.4158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f083b053-fca3-4e84-1812-08de85a77bb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233513

DQoNCj4gT24gMTIgTWFyIDIwMjYsIGF0IDA4OjI1LCBTb25nLCBKaWF5aW5nIChDTikgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPEppYXlpbmcuU29uZy5DTj13aW5kcml2ZXIuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAtTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiDQo+ICtMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00YmY2NjFjMWUzNzkzZTU1YzhkMTA1MWJj
NWUwYWUyMeKAnQ0KDQpDYW4geW91IGFkZCBhIExpY2Vuc2UtVXBkYXRlOiB0YWcgZXhwbGFpbmlu
ZyB3aHkgdGhlIGxpY2Vuc2UgY2hlY2tzdW0gY2hhbmdlZD8NCg0KVGhhbmtzLA0KUm9zcw0KDQo=

