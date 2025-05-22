Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE550C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:47:58 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.86])
 by mx.groups.io with SMTP id smtpd.web11.20361.1747907273866052796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 02:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XTgpvxuf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XTgpvxuf;
 spf=pass (domain: arm.com, ip: 40.107.241.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WMaCv1cb7XDWUM8vZFb5BHyMM+tbPzGaLRWMQg9aRHUzEVbedLAWdbfn/vcDCo/tKyH/Tq5DOkKGionFH273Z603ZcXASvnIvi55Yoclds3DrbTi2EnMfmwspZ7IUPLpJdfVf7LYzU/rd6m57/Jgq7AX3rFKLmobChyPpfzgAyd0w0UkeAK+ukPqZM2LF1xq5OeQ+728USMA5uMXmrp+fKBvbtPvKVLNGdaicNrRYk3MCDiZJcnXOwnKTnLJO5DMOck1v61z9Tyl/cKVs1NhKv2fmrNmBJyirrF8GaQUzjYhMKOB+e+L1dVfNeUmj0JdMvWqEjY0r/ZogIHkfxBW+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MigM5ZYNj+7+6POYrONYh8Cfukx13ME+LhH+QLvi17Q=;
 b=i6KK42UqV4jaSag/mV8ictN+pXZ/KT2h/X1bOJuPiWejxoJ0f+h9OsS5aYFXLgWQijbB3w3dVbtgCnmArtec78W2SBDBlw1FYGz8XnpHCWaJ9In6wc1QADB1Yf9eNQDYivc4KJpF7Efy90khandyZSdmzeU36OLcbmGcuWrvtpNPUHfLunXizMFZHuWFlNapaE0qzVKDSF/98aifuY/kKHWrxZXdqgcpOETd9UstMGMF81yXOExDUBYNYJV4fAlRWJoHmFW8Z/AvJe6/SiT4LcoFFks+Vpus4KyAo0hmeQiN2aWRUukFNpZRNLrGIcVhF25XbPdfhmTDEIJK/51TMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MigM5ZYNj+7+6POYrONYh8Cfukx13ME+LhH+QLvi17Q=;
 b=XTgpvxuf7NTVV9pV+L3jjJP4t/XRQHDLrteLJpbShzKLb8WJGKgPvNo8fHfxvVBN5t+cEqYZlr93s9GGCJpKKN/Xl0AAo7hLScEGiSOxyJQsQ/klR7VU/3XamHQA0k+py54wYSoMGYQV//T+LGeCAJUDEV8hOj7Bmw3JST/Qqg0=
Received: from DU7P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::31)
 by DBBPR08MB10650.eurprd08.prod.outlook.com (2603:10a6:10:52d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:47:50 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::2e) by DU7P194CA0014.outlook.office365.com
 (2603:10a6:10:553::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 09:47:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 09:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewa7An6ysZ0p/fypLYAGnBMF2cBdHd4DFl4NMpxVMuhtY3TZgN4ELcBfmNBV3h1KQ97O9Z6txQN4R1i0H8cllWoO0T+Ucr0o0EMOlb+hCYVZ1nQYCfEOvQ4VjvpZW7UnS05nkn7u0ASts2myMr5Z3ilgvBisHBylZj5Mnm1ASqMqgdlQ+vh47qybX4AbeWy9mhFQi8RhWspsU8nsXPLjes6PuQCyduYrt73k8qs8yMcujq63HXW9Dkr4309HS+ItCaVw6/xm3evHxr03yIiBf7QWP9kMuanrTz/Yn5y4f/X5kVWcAbhSTpnvFTU1hQQo0QG3fo8dzPvPywCiQROa8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MigM5ZYNj+7+6POYrONYh8Cfukx13ME+LhH+QLvi17Q=;
 b=OPmCsEFsqEcJYwqn0FhLLUj5Csbju4yLhv+n8GqA0SHZUMfBdCfb7bch/g2wOjMOhJZyRqQc6Byr2C7mJ2vvBzpTzWuoN/6gJcprLZZ3HJe2L0KiFtTtg7UgyhnoF1gDKj6WhLpQx9ybJpWfJow7/V2lgiUC6vO5zHi3OW6duGe73FGm3niocTG3e1X+PwhgwbnqkVUIgfy/P4HcUB40zOBaBCxfJvYrQxclKQOu00rfU9S/Nruxoee5KN6l4avg3EYhvlNHJm9qS5X45SCHtT43QRgaaTe4aq1MDtbMXM3ul5ypOxv4Ymz0XkOEzwrVZux1gtPCCgyWmKROI2+Pmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MigM5ZYNj+7+6POYrONYh8Cfukx13ME+LhH+QLvi17Q=;
 b=XTgpvxuf7NTVV9pV+L3jjJP4t/XRQHDLrteLJpbShzKLb8WJGKgPvNo8fHfxvVBN5t+cEqYZlr93s9GGCJpKKN/Xl0AAo7hLScEGiSOxyJQsQ/klR7VU/3XamHQA0k+py54wYSoMGYQV//T+LGeCAJUDEV8hOj7Bmw3JST/Qqg0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8159.eurprd08.prod.outlook.com (2603:10a6:20b:560::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 09:47:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:47:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 08/28] libjpeg-turbo: Fix build on mips/clang
Thread-Topic: [OE-core] [PATCH v2 08/28] libjpeg-turbo: Fix build on
 mips/clang
Thread-Index: AQHbyhiaC91AY/qfm0yKm48hy22wpLPeaMMA
Date: Thu, 22 May 2025 09:47:16 +0000
Message-ID: <5994B15C-6892-421C-8DE9-947331A9C451@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-8-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-8-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8159:EE_|DB1PEPF000509F6:EE_|DBBPR08MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: e7260233-fe27-4933-d520-08dd9915b6b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?rQL0Q4SmCDyVXMV+z0l9ck55bYEns0P7vnZh7/TWuBTPHHJ1CMJV+ocm9WNg?=
 =?us-ascii?Q?VVBb6f8BC6FECSVsUxm74L+f2OmjH5c7tG8Hp6PaevZpRap25W9diH3i9dHL?=
 =?us-ascii?Q?9uECNiEkGuskza+ASmncW1di9Dzp5bvF5kb4sllNSg5zAZuFfMQaepLinK1W?=
 =?us-ascii?Q?4aivKwjp6sWEuPIYHfLnAkvafyTS/rmeeVr9AL4fTdFj2e/yB8hs0zPntWU5?=
 =?us-ascii?Q?I9W6MxYoZHdsWLlSI/4BcQ0ntXniymCblh72W5zd4z6zXGJ+ygu7lBSo49He?=
 =?us-ascii?Q?AkTzaBc14yERyiSlC+wixzrGDe1Z0W3jE4UhKM1E7/9dd/rkJKqXwvZVWpb2?=
 =?us-ascii?Q?iQaG8bWdtE3dOtplzIVHMfmYBTANyreE3gPSBuG72OYy/bzguoKVeIdrM9J2?=
 =?us-ascii?Q?j47lnGDBvjAuYzyViyAltmMbz4KvvCHsAzznJiWwm2GFxAp4xDNhGljBAdix?=
 =?us-ascii?Q?r0v2LstmT30K7ojqsgC/6BUTGeav3waujN5VdYOvhmfvMuthfcnow6mvo3s4?=
 =?us-ascii?Q?NOeJLlXB+frkKdiQzxkaGThMmUPMy6q+kaV4q+7C4vIxB8huv9Wrt7So+QTY?=
 =?us-ascii?Q?Q4tMA9/O0gE4pxnF1d+MBBRqCKNxgXIWkRojAZIADB3G8BBjGee7P1FIuS0L?=
 =?us-ascii?Q?pnX+pRbSI63M9nNJPUtst7oL9NXQMvmY/6XgCrNMMimQyzRoYrYqY3FETWao?=
 =?us-ascii?Q?XldyFpmthSErrjE1XGu1sTjppYKoloV6/emw+qQxO1CGY32DtC7+fAXQ8dOp?=
 =?us-ascii?Q?mFLVT92sETwl5gg0lHnKf8wd6meu/pdYC2yYhjdSS2M1sVFzOSmiisL1Ajw3?=
 =?us-ascii?Q?yfQ9hYSz3uM7upHPczLqdCj6yZBnyz+oj7uEDLGhrpTMdcsIgaFcjf/uDRCc?=
 =?us-ascii?Q?T7A66kGUOkFCcbpkehQ5XC0tFb+lytOnMINrQ9J2jTN8jLQNvpkHVbU5Pgci?=
 =?us-ascii?Q?tW6Ae7LDA8oLtAxpPYyOxTJPU92QQiLgV3RMZZMi3KCo55xyjzaPF1TmfbsW?=
 =?us-ascii?Q?N53cBDVzh3uTytC6DTvZkOxuCANTznJIts62nOHO/8SGpTeWf2Y3BxrBH6QJ?=
 =?us-ascii?Q?UHVNhHytySaSqceKQLunrimh7FT67MsWKQPimR3axUrRZniCImneF/TQibGk?=
 =?us-ascii?Q?TGlJXSllqXUW3ffC2mhpOQ1Q50NvZOXLjIsWcRZV7CkQlF2pZQXF3qy8ZTSl?=
 =?us-ascii?Q?vB8mPjtHDBxjABVOWXjWuEHihDT42oFBCM5TGxwmjL8SlQuUa8fa0EG269M4?=
 =?us-ascii?Q?mvxO8vmAZt26JLgu2xxcEfHo96Hrxuf4o/H0AErZeF9/SmwixmDyNdjt0540?=
 =?us-ascii?Q?V9PwWjpWEQhRNKqWtu+hTMRL3RW+6/o9T7mC6s3yYEseqsC/5jBJ6uTa+3eB?=
 =?us-ascii?Q?HP0FJEknCq1jnZ/P7WM7O0ka9EsJXfSsZqdaSwRTvhL8WbCdyJvku63wghoK?=
 =?us-ascii?Q?qOzfnTT3OGh9zH9Jh++G7IU69Rdppeq8hlGUFyWOPiaH6YBwr7MEBQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <514EA869144836408CD5EC5A2CF798CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8159
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2deeb413-660b-44db-1b2e-08dd9915a320
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IZVhT9aOxL7KgbJLU2svk2KlxEebwW++V0QkNE8ERyvrYa6xMTJmjdee/WZi?=
 =?us-ascii?Q?s6UncDlEGtdB2vZ1hzEdPd5BD+EavktNE7N4U/a1r/SzSeKpjB5aXlt+IGoN?=
 =?us-ascii?Q?1TFSTwIEnGb/tmScVw2y18Numyn0zscl2iWyBimOyHN8MKENVFbeycPME4Q6?=
 =?us-ascii?Q?rHszhw1miS+aFeaycz55pufI1Y/dY9yRPGgIxD+w3PN1ia7Uzvs1l7HqRwi7?=
 =?us-ascii?Q?G7P0F0qSbkeSfh0wNa6BRbyfPwkx/+DJTnqxJbUfrA7ntCHqW/7k9OliFE7/?=
 =?us-ascii?Q?vgjK5jQY5TfgHFhXigIYxMu4/LhDLsMR2xBSWJViG3D33b4+Kh7kAPwt13Na?=
 =?us-ascii?Q?zyzcLA/dhqDFHlLJx2HTYl+1jMgL62nM+0il5o94E4n1KM7a/dFK3IKXMxFL?=
 =?us-ascii?Q?H/TzeEnCvZnB3birqolur7tvhXy4Lx/Xw7A+iV975dOGtGH8rDQcGuNJC22V?=
 =?us-ascii?Q?QERw6eW65t9g30hoDMFMLQtEEkUtTYb2sLkK6BUGhct+/hXy1+jtVd928veY?=
 =?us-ascii?Q?xprBiejffXJgNpoPbeQCi0lKlniBGsAQ+ZOTZ5vqjEyn9neKN6PC8JOLkDXg?=
 =?us-ascii?Q?r8OO1+rqh8+xvyyZdSuCEoWfCVKhFDsxTJt3IXaBMkqxvka+ot3Gc+VyrO/h?=
 =?us-ascii?Q?iX5cY2OqAdhhCM69XekGN1KbM6tk7d2FqEigqMMaMIeOhYbZRuqZOvGavyBg?=
 =?us-ascii?Q?+lvIuL/QcU+oyRBZnWv5gpz6/k80niUc73+muz6G8d90IAgpzLkVJXtn0Agw?=
 =?us-ascii?Q?5cftD+G5IVkyzhRSPSuy9tjkOegQ8sL5HufJMMgLbpTXyhQmzaCBnnOEOtkK?=
 =?us-ascii?Q?pwH0XhhRf77O7brSkvYtDT6pynwqqRXURJ6n2QuiTCAa6tHkZ5BzWQ+2i79t?=
 =?us-ascii?Q?uelW9wQq6NqluDF9BGIaMIAg4qgw2DAGO2HJlisRMBnvBwvLh0oL0Npte6Qc?=
 =?us-ascii?Q?1bfixcjPWd53GstfVIAgnXklBShZ9CpHKmvU1Q32cgQ7KQizsnBhD/RegXOt?=
 =?us-ascii?Q?wQmxLQbnhB0azi5j5cdQN474tUBfEJCwZ6udBxaHfbm1PNKh3rOFpmDo1e1X?=
 =?us-ascii?Q?VOlCLk4fQ2VPhGGmUu7ClAUx4acGYsV/8y/39RPwzhgC8K+zEBgWDy/C3NuT?=
 =?us-ascii?Q?Yb0j65YAxyM4PsN9d/iiImevE4zaTu+xn4uHXHkEvO5quJjslJa/JmnC6Wn6?=
 =?us-ascii?Q?62vucd0PmwNCCUJ6rPrPtd6Y7giSiWMvCc8SBkqEGRvS2BBVLqk9GnlTzWPc?=
 =?us-ascii?Q?phNAoXcXLwI0u/HlfIR9WxceAjUVHJ81qaVgmGdeBHVEDLKZfsgc1fggURY8?=
 =?us-ascii?Q?AWtfvEVaxbeAeoeWHMQ2WSz5pV+thDumeQCZsq0REYvIFqfJ8BcGFNxEuRBJ?=
 =?us-ascii?Q?Wcx5mjJbjUDr2MuDryjzai7DkZJOosLJ8/bUes4rItKNReSUDQ2NooeyUDHy?=
 =?us-ascii?Q?JfT3ECbgsrZmW5cke1TY+WCtRcO79D5uh1GTcf8s0op/mdbt5YLHWEGY0jjl?=
 =?us-ascii?Q?rf08cmROt/tt7RTXU5PPovucOi+zS3vC5F4P?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:47:49.4691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7260233-fe27-4933-d520-08dd9915b6b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217073

On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> index 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e=
47d953bf5773e19 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le =3D " ${=
@bb.utils.contains("TUNE_FEA
> DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS',=
 '-mthumb', '-fomit-frame-pointer', '', d)}"
> DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS',=
 '-mthumb', '-fomit-frame-pointer', '', d)}"
>=20
> +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
> +# <instantiation>:13:5: error: invalid token in expression
> +# .if $17 !=3D 0
> +# ^
> +CFLAGS:append:toolchain-clang:mipsarch =3D " -no-integrated-as"

The log is from 2.0.2, did you replicate this with 3.1.0 before moving from=
 meta-clang?

Ross


