Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8BACCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 10:50:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14727.1762858200627664020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 02:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nPbAImYB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nPbAImYB;
 spf=pass (domain: arm.com, ip: 52.101.66.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RvJYaQDw2S6w+XG3g0If0J5onRa0fvrhYtK7aAK41oQwwnOLXlmuLA/ow7fiuoDCmrk+VZ2HE7dmo67a8CCBQsJVcIwEOfGKaWDBh77KjBnel1nRgm7zI8vPSy5MT15v/SFYvN2x0JoF4jRdAgiez92VOloA6Zg+qEj8So39pj0Ful5wEW/90/XsPFbRsk4EFegGV+zEOF1QF5R5Pnyic8UKxr4Hi0bRR7d/Lvgbb9OE43cn6/3b9Atqxfgnc8EfQZJc7500EnTuJngyxYkBaCxntTW70NegsSBepPVuCDDX0XrstLwTHD0TyA7ZoqwNW/ytyUeqoSKXPnwtjgaKpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCovEBcRgLKxNDZeC47zVdxFIRjA7/YRztblOYYOiLk=;
 b=DWISQoqwRKaQPp5KvEsSTvN/QTUrRdlMIOfw5ghcXT5Qi+56dyd7IktLSzgVtAEB7wLYNlXt1rwuacc0CSgURWeDKAGW5NHZKxmmt/xc8whMuy6FG5ZqOj/nkeoG3oSOzqHTHBkQhtvArIAGi0j7n3bpKiMjs4QpQyRY2+yfs1tU22FhynguVUkpYjvHBJZWjZNh41fxlk/G0zJDB4GGayRvmtYl1u5E6Hu0ffRUGeAzK5/SUO0HXDnvt0Fieblu5O22F6k6Z9y6ezjrei7Qqc9mXcElqeSjDFCsjgM1RziUyjNyTxrHGHEgoyFxByeHCfPDokK3cEJ8IvA4QU4ddg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCovEBcRgLKxNDZeC47zVdxFIRjA7/YRztblOYYOiLk=;
 b=nPbAImYBdtlcftSvqz5bUj7IYchxk+Rg8T2AeS/hl3mY4EJl6QM26SpfQVrIH9Vj1S6CZB0YwAPqB/MgCm+FvUjUjoJqYOt7MXC9q6jqQfRHEU7vhM40Y7+dPhxWmkf2Tm0y0lGLkk+tBq8yWFKId84R5aVpLmRA/RHSk0Y+TkU=
Received: from AM9P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::20)
 by DB5PR08MB10164.eurprd08.prod.outlook.com (2603:10a6:10:4a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:49:53 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::c2) by AM9P195CA0015.outlook.office365.com
 (2603:10a6:20b:21f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 10:49:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Tue, 11 Nov 2025 10:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvvnkJjDIRc4b/lum0nWEnCvaqyemMY4fGI4e1jywEKVNg2D5XAqwLt+6tYUCG1D/tQBqGKmYdlm1CuqWtt4ZO/TkFmDR8CTEjW23dZJvIn6gfkluG8GXOh993WObTSdWTZhX0F6XaCTPNJxzeEalRqJ+rd4z4CGKPZtGqenUlVqBA9w1If5DtnNWSRrEv2KgMrVdQ4zhYDRvnc0rPro7J5JakN3fTtWtkgwpGjXUMdQqiRd6hUCRK1hJtqd6mr1H/87OJneoqJzzghhzSQ2gP6MbnnE4Xev+lOomSgeUG9VcaOkyokgF63TbmMrcYq0WtxaLosDlSleODCSdZxDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCovEBcRgLKxNDZeC47zVdxFIRjA7/YRztblOYYOiLk=;
 b=tpjnCVZXQBrEL13AQ+T7YjqBz4vTYUEZIPC7KWmQucvMO655J9YouD/nTk5WxMP+BmdlYR2xrMU6dlQmx19OhxA+IXQTzybhcse3fVJQOywYVrEUZgH55F99dnxKI/ClNLqqnSLEM6NvOnd4PO9pCsyCxrTUhpk+Cnn2QYMO9321wG4UETRu2bOgEfAr3O/KTPKV98Xb/rXOqS1rf5eSDYYnAGqGVrnTvLzUv4Di4w3LPJs4KQzYGqTsus2xUCqYlKxyLSbfmuxo5ZK+HWZBiHaXMXaW81ntYg948piY/6iQd6ZGAu6FyabfMHgaYJMAsvE/UStfsYJoxu12zjUSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCovEBcRgLKxNDZeC47zVdxFIRjA7/YRztblOYYOiLk=;
 b=nPbAImYBdtlcftSvqz5bUj7IYchxk+Rg8T2AeS/hl3mY4EJl6QM26SpfQVrIH9Vj1S6CZB0YwAPqB/MgCm+FvUjUjoJqYOt7MXC9q6jqQfRHEU7vhM40Y7+dPhxWmkf2Tm0y0lGLkk+tBq8yWFKId84R5aVpLmRA/RHSk0Y+TkU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9573.eurprd08.prod.outlook.com (2603:10a6:20b:61b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 11 Nov
 2025 10:49:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 10:49:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ming Liu <liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Topic: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Index: AQHcUZ8XD/yjFxCfgUeZivrDjdPz5rTsMqWAgADxbYCAACpOAA==
Date: Tue, 11 Nov 2025 10:49:21 +0000
Message-ID: <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
 <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
 <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
In-Reply-To: 
 <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9573:EE_|AMS0EPF000001B5:EE_|DB5PR08MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b69c007-e9d7-4ba6-3c0b-08de21100bc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?oSCpRQO3/jVofayJUj0oaYC0MPg9MZhc7KyIp1bYgudeQcK6EipCzyzTWjHR?=
 =?us-ascii?Q?cfznAcElV4s2QRoIEJjrCuxzFFGzOzYPr7BUmljWEFl/v+3M608JQfSfar5B?=
 =?us-ascii?Q?TTqndHargHncr74S8s2lWCPjgtB3ykmr/V3oXS2GbCjTieSWFm37CiUTkrbP?=
 =?us-ascii?Q?sllXvEr/aR1QGGDtwexb+Sgtnnmw1qIx+aG6V/D3v2J42widD2cPqJLNBZDD?=
 =?us-ascii?Q?o3fn4GFWCN27Zik2C4e801rtWhMUmLN3gdaeOuBlfOeHJcaqhf9jVOThKRGt?=
 =?us-ascii?Q?6xUCCQ7Hp0TEB6JDxVG/NYhCarOn008Qz3+8R8jwIaJHkAMuPEuzQ4puV62u?=
 =?us-ascii?Q?DTAOZZiRydRP8ty2swcUilsNpj2s0fzx6yZF6I340BApXFJm0BNTP0G9idnt?=
 =?us-ascii?Q?XMyBgdGS4q2iGBG85nzPr68rbsxNhlCBz2fw38+/ldxp6ZulHLuHevP3PWEP?=
 =?us-ascii?Q?AQf2V05xhp5KOpUX9SKwez2JEXYtOutK+BF45/MOMeq4wohbB6gwTHIG59Ca?=
 =?us-ascii?Q?z7U05E+J2Rk+GsV48eLG6Y7W+fAPyvpOXtHcdGXO0TW3UpjzsljmxnSGYBdn?=
 =?us-ascii?Q?fN7FmRTnW2d0sHj/fTu+BSIHHxsEkOqo0ln7HuyKry4cuGlO+vrC22hIXN55?=
 =?us-ascii?Q?d1BRn3MHcTvEtVKOHRXKQYlF3N6Vj89wPnMm87fta7w0WQXcep3aMvfRHBpR?=
 =?us-ascii?Q?8KNDNxIOHJRNfhYGfxowUCHNEsd6twbhOOQnqti9eTcfWl+gt7DLL5wHXEi/?=
 =?us-ascii?Q?S/MeC7FHl3eKvd1rWuqEVcZg8cXYsE9EVV6jBPXpy5tkrqZEOd5HC185zIIA?=
 =?us-ascii?Q?385WR2PvDKy0LnEoNrWesR2Jy2efQ8Qbjmxw4LfR4Cavf/qrkozGQzm9YnTO?=
 =?us-ascii?Q?dAIOsqUlNNOKS8MmWJdOxFsacMrUT8XAT8PGkocwMQyWv6scQaJZzbRNsjTx?=
 =?us-ascii?Q?vRsjnwTOlYOi9Ksw/nGOaqY63Rw6giaXonF7pmPpi56ScelteInfRb4HLqOB?=
 =?us-ascii?Q?Qi7i1hmBMiZ3Y/l/Yz9XlwG8nosySuQ78AXf71M8YR2XvMJqKhpetV4rUYYf?=
 =?us-ascii?Q?eH6Cj5pZJSS0eEK8md9yxss9i+jSOZZ10/cOkJ/GolmjZHidlnMmYB17kOfb?=
 =?us-ascii?Q?em1KFfunF2SRyUrNg8rIwXO97kL6VKM/Pt3nmKueZsk6vxD6xHjeL0NVsCJJ?=
 =?us-ascii?Q?5YQWHjLfxY+IJY8VVHSCd/IySAvMQeKPr+TlmbjINNEF6zpe6iUonft2PwWb?=
 =?us-ascii?Q?fjbkDMfkFe1k1lkMWqGE3vmB9wkxMyTGQIPUHuDSJlUssSdshcTjhTdLfNDO?=
 =?us-ascii?Q?1vTDihVtSKRKLkjf8sCcAh6TTRwry0UYiGNYVEagO9Gvb4JjjGEfYhNBXCcs?=
 =?us-ascii?Q?ePFdXi2oB6zLMOuiqzwYY5Nc4e213UHqiIBZEybL8/MmdSNYIgkjbIN+Gvcd?=
 =?us-ascii?Q?/sDvISQun9tfevgLqeWDVr8QZVLf7PMY5HH6ZrzCI3y8ZInr6eoLx088S//l?=
 =?us-ascii?Q?sOLQhxyIwc0byi4ldrnwBiuVIGCxNkQBon6V?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F87E8876C8321B4280E706AA316B30BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9573
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d2ffe881-10dc-4d99-38d6-08de210ff896
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WMEXnDjHSrxZZypxt6ZccEtOUVIu8K0J51qOuSgqaB6hZtEUUv14Va70OZKb?=
 =?us-ascii?Q?Xaj0/olI6F3NalBvgnlQFQW1BWh8P8RXoYepdAJ5H8kLaMtr3gRWpAriIXou?=
 =?us-ascii?Q?dAuE4LD7KnyLz/A9Jufpb/VMBYlDYiQqa2dFRzQgfrEvQtH4fODKmzYT5oIg?=
 =?us-ascii?Q?+byl6gV3DlaiRkaq0O/HGmuUMZF5U7BNqMogCMyW+2EWXWOFO72Xam2lw2zw?=
 =?us-ascii?Q?/2AWyHFreLCBqkBwgzruq64S390etfaOkcrgzI4ivMmadUkPTDutOH0Jx0JY?=
 =?us-ascii?Q?jgopfESQcQI4wP7eZZCAlbaIk0/qV9GbzLW1x1/u9oOxTDZZ+wK8wRhISoFA?=
 =?us-ascii?Q?0iHgZpjCZakGnK2Zdq95aJWQ5wMtovlnVlor+ihMzq2oPYFKdyHHhLoN8qaC?=
 =?us-ascii?Q?a1r8+yLzjW8iMRHmp6XjoqBpMVdYvpYsFmajOEhYx48jSRltPeonyE71v0FF?=
 =?us-ascii?Q?31dFYLJ928m9dqJMd4yuZPTts0prD/PjKH0tYPF1BYf2XCdjtDhpmQSZSwq5?=
 =?us-ascii?Q?YUNgUceepTsQYlEth75OsyYz+H13Dffm5G3/ya1i2Vjcu4QGI3QrcOYIxyEK?=
 =?us-ascii?Q?IPtrPdKncRFfRkEI/4060MnFYa6NG25RBnM7fPjrOh37qW5cxqp48GiyFJdh?=
 =?us-ascii?Q?D88y9R4mZyp6xRmgwqlNtzBuaY0Ywg1b/bLuHUy0mjEhHOT4xv64NgL0Wji3?=
 =?us-ascii?Q?Y5/J2xN9M/CGtSAaJiOD5n0I/UaVsidfzsyeK6PFtCFNAMZGnMGzQ9g/wC/2?=
 =?us-ascii?Q?ShVKyD3vijTRtzmUGCBSWO2Ev4VafykkQp0f4AnSdtav94owMbHYeUodPfCt?=
 =?us-ascii?Q?bP3St+49OCLsdSRsocIHBb8h0ArxBI6TbwXj0xU4Ea1Lc3Ni403vDhVKhZn6?=
 =?us-ascii?Q?b5kMhGHm3lgu0JOZPnznfQJ7k/aRgvDmizG/rS6MJT2Y8vL+heNMtlWZidgj?=
 =?us-ascii?Q?w5eAuPSvakaBS6SFipNFgUtXKJs0SyW/7ghrME/QLtSBstHzsy3OmpXHEIv1?=
 =?us-ascii?Q?j/H+0s1goOwncGFYy3Z2UH4qPXKDO59QLTch46jajiD7UTrYHiWMEidYCKI+?=
 =?us-ascii?Q?i6AOEoZQYHmoUJP7m7SUOvy14L0H4I4J2MIu3bmiesaWlpD5dgl2h4ZeXSPE?=
 =?us-ascii?Q?/co1sTuxr4UV7LoZ2ztyMb+X+ZY7BWSeuoV2CKDpDbbsSSUwckH1Eg/lysOR?=
 =?us-ascii?Q?mg3cQCfMdGafiKISIrGyq8uhNc45GKGJB/yc3Y7/JwKMS+zKbCoGGm4rejB/?=
 =?us-ascii?Q?JpddtrfnrPhE9qcAT3enHsYKj6NY+BHNd54euoKU6TKBuMHewpwVTPAoKaHF?=
 =?us-ascii?Q?2Cu/gHM8f0SvarpqMYToy8kp++sc4QQJaOUG8v/OmJ/ZzJDIzxGtde5KeBMY?=
 =?us-ascii?Q?NPWRMZf//7KZGO4BtRUc+UgKgij1jHiUbbfQwuda3Kx09UjFMVoeqRMz4k6s?=
 =?us-ascii?Q?SM0TossUElXE9ddXn9OH0AF1LFBiVzDPE6AEaM8t5qO8u5D5q17kO+CLHPUQ?=
 =?us-ascii?Q?2IOapyRMnIgs1oo78+V89j0Ky6P/R7/f0QBxLz8zePuk+gQv2X36q+aVcs7Q?=
 =?us-ascii?Q?7kYMEe4Kf0GDIE38FQ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:49:53.3331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b69c007-e9d7-4ba6-3c0b-08de21100bc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 10:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226157

On 11 Nov 2025, at 08:17, Ming Liu <liu.ming50@gmail.com> wrote:
>=20
> I was using exact PACKAGES_BEFORE_PN with +=3D as you suggested in V1 pat=
ch, but it broke the build, clearly PACKAGES_BEFORE_PN is not handled corre=
ctly in some recipes.

Those recipes are assigning to PACKAGES_BEFORE_PN, so this class should use=
 PACKAGES_BEFORE_PN:prepend instead.

Ross


