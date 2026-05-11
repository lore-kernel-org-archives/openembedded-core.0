Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C3BCD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 17:19:23 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55818.1778519956702101653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 10:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=U566p1pY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=U566p1pY;
 spf=pass (domain: arm.com, ip: 40.107.162.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C85O1wDJdObatN3+XJH0yDR3YG1ny5il//XragVfFAt8SdzNu3N3qs+Ia53p0ia03B+vbZZTSwXQc9ny5nbfypSwpzYhn9O7zVP85JVNqPCQfPXLPD8v3+thQlZPF0dHQL3jieaimeEuT6Db+6aLNu3i64b9ElxKVOk/msjKGCtiMBdxSFt5tv4w37FqCusecAOKPAwQspaPhYydMRBghrOLPiU8WaILC6KjjgzHc5cZMZSsBFTDKAtKCrv1cvhGNGmW4Wa0jLkD8P69VB+etLKIRK34hcENFpPrjFE4psw3AAsaAdqyAd7bLX4/mNBtaTxtnegEySSbVsvHpwLTfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ySbv87rah67Puvr13hIbMzYglg2bGSg8gBbqksMKI4=;
 b=bkRtrZ8MUYw+dEvr0g7MyoKX1sgEl8+z16mabPEyfE88TU9ycX5Zt4VlAsTpwYVf+pDqpdVhJERofd50yZI+dNm9RHs5RlYfIG4vpCYZo43CkDRJpEIpA5PY+YPJTjmc0zVxq2jDkahzdAl/RGCbddC5SpOCDOjqyKhqH/QdUEJzTl08io/lBfZwf1f64eGHmV8RTnanjttwbr9ueTUbBvITq+xGFs7XuLGn4UD0R2L0m82j+AMGSOHymaMScPWoqh++hQ5ZBW5O8x2RJWyxCegs3LSUGymH+sncdIE0iylJzVooaHT6+SkItWl66SDhY7GfQWEPKXXKfoUW8SBypw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=qti.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ySbv87rah67Puvr13hIbMzYglg2bGSg8gBbqksMKI4=;
 b=U566p1pYzWmfn9XRYVbK0dL0YzOkqCvUOebnWGJPfLzjQKBQ4PZ+o56T87mt122p78Uw/yvbzljH+QXzM+chY6A6ShjEedhLN94EYm45IDT6HRZrtpBJTSD6NeOHlUTXgGAFX5RBAY3TbwIhgvhtcjhB7vb4PtvLLFgOaI2hCwM=
Received: from CWLP123CA0266.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::15)
 by AS8PR08MB8062.eurprd08.prod.outlook.com (2603:10a6:20b:54b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 17:19:11 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:400:1d5:cafe::b3) by CWLP123CA0266.outlook.office365.com
 (2603:10a6:400:1d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 17:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 17:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBHpz6g/2MuEUBBgU/CtVamGvy4NnKal7JhjGG0YT8LaS/8+YlA9Nh1kK4LyHhlN0F4GLK7JO//sSV2XU8BzBl8c6AGdB0H3BbF5tm3HQm+o2wxjrCuKMJf74yPLg+RSI1PxMH5L+w6JCmwoOO2ysKVqoTM04BDqk7IxPEDs+ToCQlSkGaJUuX60Lc2xiw28nLkzp3U4aKAqDuqmoVVB0cebn74pbI0+6RGxXc3dEe1QFRdt0gUmdwmEUiRfsLhPU8ubiChaXOoUnr9QAngxYEpOaYQ+OaWh07Vg1qut002GCMZNl4T5SMkkv2SzxNuDm4DHNSv8BDKCDZqcDd4ZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ySbv87rah67Puvr13hIbMzYglg2bGSg8gBbqksMKI4=;
 b=qa3eVAvYrAwVZx/rT4KYmX4j07Q1exGpVVVLiXt9dkY6xTFQG2cBAR8Q4+WoP1arUtylwhV1YSUwCC8fqS2O4lm63dEsIUip5pMeMfm0njcw3MGoP0Gj0rqhZDoUvLJiEQW4V4lBZHN8Rdxzq+7PuWYniasWy9i9JmyQ5Pzz7bQcrbfmqiUWfDhSzfrfbOx0P3MsTKlr3lP9b+RfNTqAf4/Oz69hzqsiwaKc1b11WnVK6T9F+FzAERAuMnhF4ONHbOGZHe75Zlxck2ttEd/T6yAUQJynIBZScfoF0LOkyZUnflRpMl7ZXyKhtCeu0I1YrST6e1FLd9QwCvt3AMm7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ySbv87rah67Puvr13hIbMzYglg2bGSg8gBbqksMKI4=;
 b=U566p1pYzWmfn9XRYVbK0dL0YzOkqCvUOebnWGJPfLzjQKBQ4PZ+o56T87mt122p78Uw/yvbzljH+QXzM+chY6A6ShjEedhLN94EYm45IDT6HRZrtpBJTSD6NeOHlUTXgGAFX5RBAY3TbwIhgvhtcjhB7vb4PtvLLFgOaI2hCwM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS4PR08MB7784.eurprd08.prod.outlook.com (2603:10a6:20b:518::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 17:18:06 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 17:18:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tdarote@qti.qualcomm.com" <tdarote@qti.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: handle padded buffers
 in wl_shm buffer creation
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-plugins-bad: handle padded
 buffers in wl_shm buffer creation
Thread-Index: AQHc26fEH3+0ZMMf3k6L+GlfjicN9LYJHOaA
Date: Mon, 11 May 2026 17:18:06 +0000
Message-ID: <FAC6696C-2859-491B-B9CD-BAAED7F15F71@arm.com>
References: <20260504081223.2361368-1-tdarote@qti.qualcomm.com>
In-Reply-To: <20260504081223.2361368-1-tdarote@qti.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS4PR08MB7784:EE_|AMS1EPF00000046:EE_|AS8PR08MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: e66b8a0a-8fb3-4735-6325-08deaf816a51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 DxE04rJsYQ4Lz8DPYjiwhNFgHyHWvFNrkdbkOgdEp0xuqkxJfFe8OhJIfJy1y8h8qVcnkBEJni6XgjhBMxbevvp3y9g/srOsf2tofuLeUU4R0XYmcsNQREgfYAM/kos4oaFOy/r90nZH5M1W0MvIX6gLC144iKpPBBcuGFpZ5mTRnGE3b5MdUPfjq0TedjcJ+XgHXYtg6MnesIvRqk7NA7L7tGPHAhYh7N9wh0Li36nXhN0xw/CMJhNJBcAFfoJXWWTei0or9J4CiAk5J0EeA6Fy04VZgS2qQpmWjDwVITnqZH2G7Sdlr9GC+1X8G1HIAmbgAJTXzUM6TUp4Nk0jHywhMk/x7bBrUeLSjHqAE7u30rav4cV4Qc9ZdVXKrrdKZd6AcCyxbAAhww2t0WbqX61vL70G9aG3/JMEUbkr074jBJrvHkDmTb4ZG8lSN19JN/rccHKKmbvHCkeSRAGTqtL6iT1N++g1Xa7zoJGYzZJynG1sfxGMtWtK69ptsHvnh3OO1DW7ckrqx3RirNM5+CY/UtJXfV7CQb3oSULJdVPkK7O+fBZ3mGMOtsJN9OFSMcuJ++zRM4cnOUYSnCdipFqtJJh5iAZoiVs2cKz/xmMmOaHEVsbcACUMtseJ3n7TBD0BbetiTRi+UEpg0Nc7LDs3yjQ2srN4YakjJQ2AIFw/fKAIS4AddMz70dzc5xFeV4GKFJAS/0we2rQvFt1Q8uqLtNHS1m5sdIjqWw97vKakIVNtKCsU363W1dcA8Atc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A7165DC5BDBA344BC20C6FEFB59DF84@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 AEBWhnkuO/HWFNg3ZqAx5K4ZJzSuGWtv1Mw6DOKe3QgqvX1Sk84mGLMjLKCiujPniO8ZqlpfBPCXhmEAmQxICCkx7sfLOv7H5Hs3wkiDXJweqzwJsGzVaPIkgJoG8Pzu7NMqEN7Ik1xSF/+9i62G88kpNvbNdCvjj3WggQ13ri9GWBn2jN9eAresD8hz6+Lrh+QCmalmDXnToAxsVd8biTr2ZdnJIFJwWtl5eNkqvXDFLJ6gEln9k+kLzixFWjSLOwjCpTiIr5k2s5Y1bnAN7qObqllokjweNTDwo1Qv2IcqbkfMdDtOLSxo9MYWz0gTprLXL0lx1yos38oeXenATg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7784
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa133653-ea50-4b66-27bb-08deaf814448
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|82310400026|35042699022|376014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	0y4zFVHw/AcmANeEw/b6PYuhatlh7enp+I5J4sXjfT/taCKvfwBrpe+BCiLGX6YJkwpmH35/3zeUj9PSe1KcxWF1EiyT9DkERotSv/QhEjz7kDxWDKoU4JKTrGQviwtUAUQBiU4CYmCPzJ3sd+G8LQW8eCeEoPO0m5hW4qH4onjRd4M9LC44y/VuD8qrzJfIf5abLzkKyccdUy6wTzmer6FsMyRSZa+HGHmxBV1d8tlfgEu/1IEFsTwuCud616ldDe0jt0a1ibJ7VkGDikVOw9teBswFYnLVIuiC3Sxf6Njp09OatYVmHoR8qbQE48UwgbxGTHz/pNGY4jBs3zB6VW6XG1JcQjNB5PzW6y4nacnrT7BPeMRzHg+SJ/9RJKpoNAjW8PM+oF3hxaNFaLY/1wRfhRabshg5OGW6fdNm9VFHhiFpEdWEGB0CnNGCt+PcLRq4xVn/wLpqmdcoNQuscHRjmJe8tMTQitW52Tg5rBYTC6YAVp448jLe9bR+MdwfwI+PizZeFnpw/osBWylzM8UprOIX665pqG1n+3DTzsMDxEm6LzDv1q4w8LwMcUbfFs08+HOu4ee10JMWkT8Rk//+/JvsWmr12OmkHTH8pKC+tFOXyC9zIjf4m37t2aleGH/eB9mc/fFoO9mD/jSLlcaM4uc4L6T3GG+G6BHfQ8IlAZFunwzu8QxB2nQimfUEW8iL+1rtGaPXqk1V+ZOB5BnwFLMsq0f/VFzTc2xlxn0=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(82310400026)(35042699022)(376014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lTvxuotoPhYF7xboDnqrgC+vDTTbSb3LS0va3T0yb7jmPkGwjMESCEeufVauNBhqF+TknnFgyTt+8WTRl5uWeMXbdoRxq1aC+WWGB0ttFSgacMj0rG9weNXavnquMALFniYj/m0rgnP/ArZuxzl2ZM+04iHU/DXWvaItv1vo1azyMXY8zGaWErWJ9o37awYhwEZxA/eZrKPVZ+pgQZRywgzBEtaEgIQM8/oTkIdWZfqUXXxwtPODqvri09wuLeKV7oCCAOUTc+PvVAYwhz7ztWspUeePLKpwKIHtmxMw+szCMch95nOAwdRTpENQLCxLU9zbeTRKF8PxDVSOtSzHqgLCPYs6H+xGGfA4kvo8d6F9RAExqb+hMcLmjhZTPImVUSkl2HPdsqHNUM5EouPKm/nK64GxFrJ8zwsoX4IRHFb/XS1rDyP0zSPOr3vOFCJW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 17:19:10.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66b8a0a-8fb3-4735-6325-08deaf816a51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 17:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236823

On 4 May 2026, at 09:12, Tushar Darote via lists.openembedded.org <tdarote=
=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>=20
> Use GstBuffer metadata when constructing wl_shm buffers so stride and siz=
e reflect the actual buffer layout.
> This fixes incorrect rendering with DMA-backed buffers that include paddi=
ng or custom strides.

This is in the review queue but I see that the upstream merge request has n=
ow been accepted, so could you update this with the final committed patch?

Thanks,
Ross=

