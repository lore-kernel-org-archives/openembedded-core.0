Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F224FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:58 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41949.1782902937097099174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=aOscXtpC;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902934;
 b=ee8q5BEiFrlJsIuGlUu6QjXJbPey5Vvzm/uU7WlUzfe5R0+IEUHx5sEyyjvoleXMjvuRq3AM
 pmz6GhfrcLvDOPsPtwDGV5RwnzH3U0rNWvqRYpBlqnIiyiJgfn5pJ63uo85KBdly6IX83VQAbvo
 u5uxUeKC25Zmt5ONcVu14IxPbECri3RW0JkPpGeaAZ/wrSUP83sM3WNdlLPBZJhdKYcUY7zpUpP
 a9fiQr95SItnqCknfliHWtVdr5I1NxGKlm7fpAApHBneOhMpH/ijfyER3zGrA5DFrbdeX98aESV
 fUBGKFmQWYx2JkD69gZWI5AuQNO70ftV31sTtTstxgS6Q==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902934;
 b=n4MYbjsFoVdFohAF3XA5syAnxHadWUAzMbdpKwQKoRY5TThUZZ0JTsLuVBKzgBl3K4Zt3rX7
 5naaXph41pQUE3his0XyrOQlcjCWZ+368V5zQLXARwta1PiMMK1VkWOco+J6a9SOcWpH+eaM881
 iA64dzNXOSd1IsksZKwU4vbcS+DC32RRnVs/73bLWYzfF6Fau7gqabhE2Vp96jNtFzIpMPMwTyZ
 McC7/CD+id/djwt21qjoU1110nE/LOVPg+HdXtAKCsr2x+/DYBzQNImUDVwiandSBsOHct6SyBq
 AfgfJ8yDEjVrLsi16uEiY5TyRprHBAKw/7szJNng5ZUWA==
Received: from mail-norwayeastazon11023137.outbound.protection.outlook.com ([40.107.159.137]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:48:54 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icgsKTG65EA4z7UYLQAy18Q+4waTrbVNcqvX2Hw1jXA8d1bFjezZHYdykJC0rsjEbs1ym5jD1vdM+G11yCx00cPGNgsyXx5m9kPYgOxr6CIDRzZujtbYk2DVZAETOC6xL19EE8Ieso7ScGs37K/lMgeWNT+slN0cGEHvYUvLoiVs3xn+WYgploxVYMMxhaCmymUncrtkmS01ruwCPEeNQC1sjqHVuF9tNyWyyecWOB2Z5qO52gD85liyHNSYhhWCOyzmsBQnyyIfBxR6+YROe6lLCrQuSP3DG5nDEUdfySODt83Fmhq41J29KZmTSmnGLk51b5Umph7d0f4DMpK2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=;
 b=HVifzfKGMdHXPLdc3zfTJSrnG/SHZNW6GVa7tm+664AT5EL5un87Jt4IzZ4Mnb41EeIBoi+1oSSXLMh8lRqJA+HsirYANO+3Xda/bIcsyS5a10HrUWbIoAtqFW36ILE+EtbuoCLmp9yjUmNPVxKsjQjiBpRWX0hA5l12VWCPyB0lm0EJZyNBNB10AuObH656IV5VRNx2qiBKr7oIXt5EA1CtymSnyiPJOHICb6+mAF0JQwOc0XyYhVzRYWWcmIhVc+Uc9lqmPXcFiY+S0bjRwB6zLw2DvmalQB7KSxn4pfoA2s4O5+27EkL5dxsfB+8VHUdd9a81fLoqh0ELoODQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=;
 b=aOscXtpCGwaBNRmgLUR8jIhBqMKl/byZ0kttzrA3xW8kqgyzEb8SRSpJYPQClsSCauJLP0bU23VJPge/TmUSTB7YcqnsNHltNV8YIi6pcLM7GcApt2sXuFbVYSaMB5gUJ6wQe+4KWHpwa3WAj5/oRT/kMi2d5WqIa0ZDqzJTF5MEqaMPlE5+NCt+a7Z0tX/M+tA9Ykzyqwjc3g7MsJC7sMUDO6Za6abw6JQgEzx+Y08xMuxOa7f7GV/3S6DMJ1XOko+/nb1qgdT6Ve1YTFiII3N1MIGL9ges05guYHrRRNfMfRURSyhLLErGZyyn5tm/b1sVLYolMEhvWISlcgnAKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:47 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:47 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH 2/4] dhcpcd: patch CVE-2026-56114
Date: Wed,  1 Jul 2026 12:48:35 +0200
Message-ID: <20260701104837.3577369-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
References: <20260701104837.3577369-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: d65b9a24-00fb-4754-9b37-08ded75e5470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	j+QG0klBNrL4IwacflJzG55xCmDbzTb1sfiKTbDHQf2ZlW+nZjPY+3ptRIRjaMIGYBfJVbRt2PA/SVVllLhVQJL7+yAM9kWgLccBOauyM9EZjzNXkf+6f/dS4TtsJJnw3qAjFF6N7VqL9jaeDPIAvAwa5eD6XN3t13UuxAcuJyBtDfIR+RtCczH8pE2gWmfb6Mp16qWJio8lfkm2cZfyjqPR2elK7Ai6tl/xVeGnRjRibbkvW/UnPM7ff2049K1lf9yPcFCOoYbjzEBWum2wzJlvHkHah63FrV0IfeyqzX29kpVC3fyG+oagauZWN3Q78ya+70KUNsl+jVKuiVa8yZnEa+SoFo7sv4GjHLbZyyAQzpg1bWaTnIVFLPT+FovBDA50icCtehIYuow8k68mh9WBJoxKsHA3Gs7jK/IQZXc6dNqngPrsf/oNiUHsfUa6BjDqL9Vszx1NGvshf1CrFw+UmAl46iZ6iVr4AakpIC/voD8IlEyOKdERPq6yvTb7/psVszv/sTcnptvHql0W/Lvy6PEzn9VSpILs0ILzappgHqpGFm5eoXZLcwkWdAv6BXVI4lNTEeaQKBuaTfH6URzTZ+Qu7MD6oXdfDv83xIyzU2Q9HWetzKadZbKx9iULVtzPD6y18mgvZz70dZq8WXAkGm8w/hB0/Twe/Lj2xaQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hmRnJjCtTfbT+vDBHCVtzuwZoof8wDBXIiHkwNY0q0Lg7twDlmq+OYHz801/?=
 =?us-ascii?Q?rDU7GTNmBvSfHGoTTRnt2aEzWYVPjn4p8MKVJTk6ypttkqybPI1XCn7EoJ3Z?=
 =?us-ascii?Q?OemmJG3bT+2dsVQ/DxoPxH+WAorOSHdLzSH803HkuPDbsgjHUngtaR+X+1CO?=
 =?us-ascii?Q?ZqZBWAIX+91O2j7k1B3Ttw0ythA7kNBT1UkYhSow412j8N4Va+TpwOeSAyzT?=
 =?us-ascii?Q?ugDz9nqxeb/8MPsNFEBZwulI21gvIvMBJ7EWQMsN6AJ+bq813urOfJHJwcU4?=
 =?us-ascii?Q?RbhK7tNP/TP57nH38CmQcuET1ywAK6ITzQj1M1mmCjYI3aWSIOhMXBckRElk?=
 =?us-ascii?Q?wqLg1wBSwLZIaEGZzvH7ukHvVEWRNif51w1BBTRfr3BdzwExDmzCRCuVhWtC?=
 =?us-ascii?Q?C+aTvgJ+ai4uCbTq5/1rN02Ir6y/sqUTgXK4rWSrw5GsdQedYgGUJkM5W2jc?=
 =?us-ascii?Q?Q/5N/jQT5N1nKzelbijpyCoQFrdLVy+JcRcSJ3LusL+tLnqKc24rCLV4XcPk?=
 =?us-ascii?Q?09tciVp8Z5Q/JSPRDntG0RVKkdg4wAyUuFdq0upXIKvZ0IWiQFtGhmPdkmf0?=
 =?us-ascii?Q?O+clgBaezlLwhrrLKgvlMXURhe10oMvBi77F108kCbiD4qUdv+ZJnN1yNE/x?=
 =?us-ascii?Q?sHQ/V94DqzSqgat8qVdm0xlIu7mCq7gPjOHFeBaI/3EinGJ+qCGws6LeVlJN?=
 =?us-ascii?Q?corPG43UXPKcqdl7rJgc87OeNQ9nyOaCnH50o2pDr0gi5TKNaUsTqUQnZeLz?=
 =?us-ascii?Q?nqDF6+DCyhWnc9EoOP7Gh6RfdWIAhO++pwkZTVHTEsYEbolU7NFw+pB4N8et?=
 =?us-ascii?Q?O8ocjNnwtSlW0ZubZIDFjIrQrfseC7nqPZVWzmc9C9T8xD+A3Qkf/LkEC27v?=
 =?us-ascii?Q?uFOF2wTA0VO6fpkn4uPNt0xE1zUQjpw3NwrbKSwpFruR/CaCD9QjtwK/Q79E?=
 =?us-ascii?Q?dhiELavQS1f5MJmDU9gnCwZQZwZTTcb4Bk0MqwEom6rmzO+pe9A+c6OLIKGI?=
 =?us-ascii?Q?AUHC/mIyYO2ijnZCVxTO/0t/KY/EuiZN0zF2za3/NhBJ7VJnNb//2rXfg/2x?=
 =?us-ascii?Q?pi5v4VCRQYeCwmBlD/LgMQEy/pUviv3NbKjkbbGFiYEFGK4vHbri4gWGvv/2?=
 =?us-ascii?Q?fP46tWuNIAQSPxa2Hj2aWP3vVgy535J1Uh9uBT8B3aNiA8+Cnf5dQcuA+XsD?=
 =?us-ascii?Q?MHCeEG/OVbrRhUdOhSN80FdWtQKEpTcsi96/iej1ESOqkpih+em5pgoQHGyY?=
 =?us-ascii?Q?pSQrb7F0UeDtweK3WQk2hzrBlo1rSWl78qfVLxvoY40Qxks39sLheWD88ZbD?=
 =?us-ascii?Q?HmN28eIzlPIsuHpIxUyn4o1RJSTy12Xhw2KCE7UFJhbE62jNVgkx5I/hgTuK?=
 =?us-ascii?Q?rd1XvrzPMb0wGizbcLlxIRYi2j+iz8kJm3VAwQeJ8OZNRw8Q7rWhM8Swu4AE?=
 =?us-ascii?Q?EzYXegNLWR3iyP+KY09/xhTEh4xaCUbQgXPe4pHfXoudONzFq30JpeoDnE14?=
 =?us-ascii?Q?PZsFOahIp135dm4tPFeH0+syWKwONpGYoRjYu8TiOqE3LQjTUQd5KYDG7fgb?=
 =?us-ascii?Q?KWJdgsw4ptjMj1yJoJB0AJ6HljmRRu1Dey3dFxt9/YQK357EtiJNFHKc4M6f?=
 =?us-ascii?Q?gt+Zj9ZuJvC/FQZcWRKlRpgcHm6rbM+nXtT3AFNhTZOo+TgW5GBPRQrZVO0V?=
 =?us-ascii?Q?lJj5gbMY4yarshrvHadGbrcyVGlwZrIe/OIEywEBxbyY8baiir2uQRCZitpZ?=
 =?us-ascii?Q?04MVhuDuUpZ4bisIYYGtI2/1GyeAbu98ZjNb2BqYoR7uonak2dyQhSyWRC3Q?=
X-MS-Exchange-AntiSpam-MessageData-1: in4j5EeF5nzqXQ==
X-Exchange-RoutingPolicyChecked: 
	bXrF9zbTxWwaSoSEDlXN2qoPdDygMOIpdQaesTMDJ4yYsN5Ig7Ts462s1aDAr5VrIMUtDN9cEaVIPEMvc5KTjF7XyG02JfQe3rSK3B3S8RuEVutJjP+SisThjVXO7FJQxkXqQQo/NFlfhHlPUHqmsBKOdsmtnvJWjtGNUvv/y+HgtBbBsUOCYeCJmjavZ08pM0vI6qZ9SadF3Cyx10GhYUFTspaElbZoBDoWnWNczaPbk6GJUHBPUDLTRABADLRCikVljGfK997q1YQRh1gZoBe723aUh/6Isb6cNY0QvWjSEAAhx8NWmPnI6XOqbvff1i82SWeM/qduebF/43qMug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1DceFOWm3d1v8AUDDpVUuYsmdwwGrlNPENGSaV4TMgyWTmEg/rx/dDFNM86hPBsPXS8DQ2bdh+IlamN7iNpv60xmk/FyHxvv65+2KaAVrA7ExyphJTbsDl+RRwAfC3EZ0GE/Mw3qK4YBT736rYvdzATHWEOJkXu4O28pmUcpDhAjfWUNqvlXs4ilw4E5ftuhNt5B5Q/K3B9xSHpBTESvq5mH/I9khwSgkD8TgnW8xiM+98W5u0a+w7Qtya3pNlBmZBLYMGio7UoCR3VMA+hMMrVgu0AqgyYStpUdFSVbvkdFgLo9KypEVoUYRKsqWiKswbVIMUWvJHGAiXD7g2lRj5usedakx+HyXPgxwf459aZLBMNN5hFSZT8vRPIb+5g9Ow/OQaDMkaXDuP3fWRTSGjPtG6BE6f0k6Dp9JUrBlc1AVo+u+COAc7+xH0P8vBFwSj96hMaTdSZvtFv0LU+vhoXQx0zD8yBt3pzS5FRevQWtGdUaVJVDjA1mMY62lj9jvGJV/7K9uqw47ZbtDwCphL/OXhc1wAz+92w0BRwlAfO5Kb6kxRdpcaKMWiLb1TeXcA85SwIHgazNlxye9a+T/Q/VGdGhGpHFd4APRFVvTY3SMORKdzNWsw8LdQbt0xxF
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65b9a24-00fb-4754-9b37-08ded75e5470
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:47.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIcOTzCkXvwGqPSNfBtBptPoEX1yLTUYjmQ0WzotMZyKoCEVlxt2/hwlK7uHh5DJu/X2xMglG2vET9FlMv9Y+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gqxZq646Yz1PDHm
X-cloud-security-connect: mail-norwayeastazon11023137.outbound.protection.outlook.com[40.107.159.137], TLS=1, IP=40.107.159.137
X-cloud-security-Digest: 509268e6a532dd206bd2a15c06150521
X-cloud-security: scantime:1.017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239972

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 65dcbe52ec..bc87b91503 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 0000000000..748dc1ee8c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From fd86ded940524f60174582faa96f583c168589ef Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 5154bf41..1eac9f23 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1006,7 +1006,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+
-- 
2.43.0


