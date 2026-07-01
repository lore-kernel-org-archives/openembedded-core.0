Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA10C44500
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:47:08 +0000 (UTC)
Received: from relay-r19-hz12.hornetsecurity.com (relay-r19-hz12.hornetsecurity.com [94.100.138.219])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41928.1782902827343767221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=muTN9rS5;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.219, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate91-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.124, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OW1NcN4EsLWQLT2YPBy4lk6vrP8oBVf3gmCRs0h7ihc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902824;
 b=p0S0P0ggOrZZodWoIpb5r+ueGDkcIUB0O+s9YDm7JCoA7P7dguXhZ2VKJG9v0U9x8zRixlQ3
 7qq5PXYUB9eTVg51vMMgFqUBul8+MYZ2EcsDt4C1b3OEtysOHCukc6DubPKizZ38sz7asCAomyq
 3jSB2RSZ5YeJZHfvUY3GPsCndEESpmB9v9XM7w2S0uLyyEJfN3615Trh4hvP//e+H3ydZY5fTqe
 MvJVasEaQtRXCj8Yjqlzm1eaRSkLYfHZBXJ6ERZ+RrpeMFhJ7nduSR8T1O+ojgW3Im+H6egktRZ
 jkftTCvmSocNb80nbeJSV+vvioYO2SUYRTh79FR5AGU/w==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902825;
 b=ni5PLFuV0WyqWmIoqk5YfQG2+vawRTC+LMevCr/PdP8jDB0Nqq92D8KFAl7F2yKSiwIuIfQQ
 YfzOma1wokqZ/QNXCNqlrQI1j3I4cAoBdUw8gtytKPpOZqegyiTCty+9+Inh5JA016FPBy1Alz6
 vHvoYi6OZxQYkd3RNc8+Uy9A7+Tdp8NprluKegxlu1cb68psCN2WQXCmxDbfrvHi6jSl74ig3eP
 OKsFuoEvOVNs/FRSbDC1rvuasGrkb62sYXLCJfm5jsvaOns1cY4HmdiyExfL/zShq8oYkPk9ErZ
 PCV5FZmBQhRYfKly4TvsynAJRcP9+/MlYPb7Jy4Dg/9gw==
Received: from mail-northeuropeazon11020124.outbound.protection.outlook.com ([52.101.84.124]) by mx-gate91-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:47:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6JkigKFeSZfiBxzcPzeYChH9zpi1Y+UPkdhpZDyW5PM3prDLKdMmhpPKtrS7N/zZwbu7AcnZmsiyFwzvNisTrClCP7HcW4aCDgH1WVZQHNAZXZ1z7i08QSI6EVQorstwMCu8MnBV+sooxoF4s5FYW686lb00OHyLnYrfnTNO+gaN2OZL8rCx3weOLxBl5SWR3+sjybf3v859aoNpvjNIC2bKfmgSiuYyFtukyO1o7pJk0eReAIjBwq45xJFN0j36kfoDfLZ6qXHWFoftJoRL/tDjlyn39Fsc6gZnM9bM3aod1XqK+aXeD6wrozPBU2nIm5i/kHPPI98EdwXYdPdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW1NcN4EsLWQLT2YPBy4lk6vrP8oBVf3gmCRs0h7ihc=;
 b=vHVebugju7KI+4+bhS0jhG+vrE+zP1TJ8lSc6j9vxo3yzZ14F8vUME2FopYT4/ZTqK14zA5jSFCwavxEOzUJRlvfA3pW2BWD0gUjU5jofPs1yGn+3OUm+pDs+s1cs1cahsEow4eJefXZXdAtqj6nwAGciVqY0lMZOpZvm9fhQVWl1tCyzURFvbaB5CaN0sahOKYMr4iFldckO1UQdpXuF85ZRsLluLBJtZuOC4gizKSjCAcItAobinBX7rfhSNh7fV1mF+gEei2rUGJbgFi3mFXfCdHrWiuGQeJet5jLUdKs6lzv8oZHiiAbUud2yBVZb5fXt9M9trpRx3/UOJvODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW1NcN4EsLWQLT2YPBy4lk6vrP8oBVf3gmCRs0h7ihc=;
 b=muTN9rS5V05IPFPoBfRBXjomFqBfGbU+Xfb/aWCuaYektK5rOb/GUC5ENqHy7yGU8BZ9Kz53Ic/dotqLcHkpCyNtSSa9z+xHq+pcigljJJZxiiCWJo9+UiDiycz2SxZazkkGV3JKEFIhcFc2T5BoKr6XyAnPEJpovi9sGJzzqe6I20W1HXo7+PTPD2vSwkaJzGjiFF0t93l27A8Ukc6o4lC8NgwFXisIXupyBDtNaLJD69283jpNu2HOXmMu/v0zEAG6F1NeEXeESUIRuRElzNdIQt8DKbLZ6IlZ0uL1hT9eF7h6rFOYGSEYdC9xHswovnErGNGR3YlTlfWdwulmNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by VI2P192MB3195.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 10:46:56 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:46:56 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [PATCH 4/4] dhcpcd: patch CVE-2026-56117
Date: Wed,  1 Jul 2026 12:46:37 +0200
Message-ID: <20260701104638.3576579-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
References: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0275.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::10) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|VI2P192MB3195:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8c66a8-7a60-4d9b-d664-08ded75e11f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|52116014|18002099003|13003099007|6133799003|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XJ/R8eDccswOjPcA2bJq1Xm5g/gpL5yRNA9IlW9j2vLRgwluh5yXMFzQUHwTv0ZNKBolEzkZB5rXizplKBx1nj3TLeqnS82wqNBqE9l+er1BcAdTpOzuuuMWszfwJCk1PD8BLczxg2wmUcbxpYj4PGJyq4V4F/5aBMC7HH2hpstIiy3vbqoIkvE0+T02L+37SNMhn8oRTc7JY+etNJ7P+qLSm/5HKtJkvunGLd9A8uXPxVb92dELJgBtrEtQ8pdJHuShR1bhFBwZOYDSONgCfmEk1GpmnZRxTnoQJltiBkJo13QBzi5XNJNqnJajNQVqNgSEmcnwC5IOEejsjBGIqD2o8Hs7K1f1M3pymTkgkaH37PJmR4GCaTxsAwCEEr+ZeBxlL1lPS7zkkkL7o4nRqB6RgUiIhnCg5Ndv4VuUJ8nCqZPq+NeOSSxXwawoMMjx1vbPw7pMLuGaXQDa105V+cv8fY388tb4QqsWatxjeyOA6me1flS4ZTtFBcTvUFSTiWuw+Ox7tyF6cP4dPvTvLVz7C7zf6502xPRskkVEQWuyJPXnRX3SDgTfR79+aiIqot8XL5o8EUP3m6nh3EDiN8S6ZLgHFDbf7qyq43+0z5LGn7UUNAN+I4M3AdAiscKUl95G/68ZcaHDfwEAcwvYSLh7ELyhFAYJtxqErmrcFrY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(52116014)(18002099003)(13003099007)(6133799003)(56012099006)(3023799007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aJS99taHkpQn3cxBF2kPn/Zyl44fTRnZHKLl0kXLc8Lx5DeVJneJSR1wYP3J?=
 =?us-ascii?Q?Q/5BAav0U03mDLhiYPdTxKiyF+3Sj/yFtjA1PJUgzSRUMucEDH1d+StN0aRG?=
 =?us-ascii?Q?E26ENHbtxaoO6IzG6YEusuoqW1cCQyh7V5pFI6dDpFmVLd4QeF/PjvdRYRza?=
 =?us-ascii?Q?ABNAv/aIpMNoCa/OKMgmBWPvNAJizNM2tW7Fb4Kn9dSAAhq1errAwko/rSeh?=
 =?us-ascii?Q?4Kast9jIqiX8XNu/hGCFxWJnPzfFyM0iIPfyNvp/+w/B3yezcHpHrYdntDNd?=
 =?us-ascii?Q?n5eK2uX4UQKenEeBb5t55kG6sTfDU1ZG8Egzx4AhZoXN234+Aal468GAsxhg?=
 =?us-ascii?Q?1f5no++rnYbwK9y31Sx/X5AfrHQN+OuBPsKm5yGYWz2V4PXIwehc1a/IKdcO?=
 =?us-ascii?Q?Vkv+46e2NOEMuXS2+4ESlMJPL2WMGcgrfS6J3IDWMU0KAHluiYwjop6oktCC?=
 =?us-ascii?Q?hY3ZPEGXVhhNYVaelpxOnXx2WNs1R4yrOwAKQ02EF413FXUjqfvSZMqBPVnv?=
 =?us-ascii?Q?diup7ua0Jp65Qtfxple5VGPrEqqw+0ZgoQ1Pw9KbM52hDviO/OcxyRajtqbG?=
 =?us-ascii?Q?iJe1u84ExLaFJkC1fJ4JVn14IiZWjmHCbDcky5eIEskPtBaeGb4oXJ6R4GFl?=
 =?us-ascii?Q?fjarkit1DNQroy5lcOBT9oHKkr5ko6lWJOhiQoXM6l/WPKuzywT/UY0u61Bx?=
 =?us-ascii?Q?rthszn2kFmPDopMI7GbwpwQtd/Xp/vfFiUn8PeJUeajZp/RNJFYOgX7AJ8VH?=
 =?us-ascii?Q?DiPqGvZEeiba5qq80v4ylCWP6wUZckr+bFOaRswFck0ZyvE9XcLhpgrYEhWg?=
 =?us-ascii?Q?8aE1bweKtKiY/XwGD9Rlle3OWDI2eqPNOSamkgXZezeSUllP6T4NY1MFNXPu?=
 =?us-ascii?Q?q4UfZUm4Clgybf60bWywd6AzVZGzoQsS9g/WIRglEIJuwmmFmKUL0Z9qEpRJ?=
 =?us-ascii?Q?W/LSnXZ5HQEQA9JSIUEMVqWAT+t+qTdjzq5eC+kNP7vAikiwR91n5Nv7uzNE?=
 =?us-ascii?Q?TZP50pMwK26fzo8dYVUg5jh6rb36O+m0m7vpKfZ+R9vTsNgldVIcPaHHIF7i?=
 =?us-ascii?Q?k2OxPplzCoc6UlFFH6QFDVEFE3nk4t71rrOXolrJ2c3yWg9ZGzmIBl/UkWTM?=
 =?us-ascii?Q?Q6LRHax7m9YiD/LNI7u57TVtbPr1l0xNrmgmA9iKFXx2K78p9cuUM5aBzE3V?=
 =?us-ascii?Q?SKCDEsEWTVR1KtL9Rotm4P8Jw2wqy/nkIESpiZkrjuM9R3PUO6qzgurOc+ck?=
 =?us-ascii?Q?nU6DAcPys/JMtT5WQPfx8hN8mENBXSyGNlq115gv9QD97S/y65K/r3bEvxcK?=
 =?us-ascii?Q?XZp/pecBM/WQ2ihcFLXhr4XgXcyF/AHXjCEqWg8oVhmu9svUMK0FjF1If71u?=
 =?us-ascii?Q?SRn39opJw6g/g1ops1MTLnglHx6Vc+2X/r2lraf2VoS4PLfu824f2uCzOs66?=
 =?us-ascii?Q?CBZLl7rRHHEk0qx7GXIRmazSD92FZFUvstCmxy/C5UDybtsS9ZalB/LdZCAo?=
 =?us-ascii?Q?RZHtDbY07tHFyN7D6EFDRZUUfIIKQg2+xQqKsPXBrjDjDDNhSlUnW05WRST7?=
 =?us-ascii?Q?oXFveN7bTyNLC3IMncUuZeIoV7FCuIg71fZJnlkDsUDExSi6gwYctiQ87sP3?=
 =?us-ascii?Q?FV+MFiAd+lnrC+xdOjVJuOIOigwkVve+x8/JtbN4/TRWilWR1qL4E5weI0Kp?=
 =?us-ascii?Q?I2HKW9TEZ1n4rJd1gFC0owEweKk0Fn7IQjJx83qSqIVNFa09iVvmF78z6SB2?=
 =?us-ascii?Q?XBSvgHyN7yKULeIu0gSFFeiZgxVp1wRjlkKpPk7R1oRZwWJBcDHjpaeJTi5P?=
X-MS-Exchange-AntiSpam-MessageData-1: DI0PRnBPZE04tQ==
X-Exchange-RoutingPolicyChecked: 
	BVjHO2ZqlN5L2ypVXHb1mgyJhdH2CGVYRIJRkoYuJ/CZzRrELYvADu0PaoVvqtfwJLr3amSvd13JUC3pEVZXJzzTDYZDKMhBXav/iQI1MIrNCQSNfQUUu40QLcTOcxUsRwMXcue8HKfqzk2dTY5dkchX+2oUeNE+G6b2xhTuuMp+7qTFdP2V5T3JBrrvTzxlQjBQAZduV8QRsyhAw7Hqb4dfOt7yRrj3zOyCa1SwAtRndkkahR1SwuSmIgNsm3qjR/Q1DMLeJDlR9OS4VxZga9/q3EitX6SH5PAGGihv7znrJnfOhmS8T9R3IqbHgBmZCX9qHnGM6CDv1vfaswU/vg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EVE7PFd3UTECzcLo50tmQDGIdvW22iKuXaECzwFEypvk74q36xANn5xHzgDVjupN7kgNW1izrK/t/S9VwbSyuW5wKupu8rXWx1/+OJHLkRsRNla5tpFikuC1AfdzpZ5zqswnZ0IjyqvOr306o8KWZBHDbOzbGz/NUFCdid65rm7rq7migOv1Wo0fqs36daH2MpOZHL9sBjycxv7lYydw1bgGAmZHypLHyc3MVhWL0aE4jD3yQoFarIT20HbJa/Npu5XvkMi5nnJKsVoXAjFwPUolvy+CpxGYHyefEyNvpQpcXdnQ7/WshTlyJEI9CMPlx/Jpp1IUa+DwHmxnb72WFbTY4SF+2b7tS+YnJ8wVk6PKBlzJa5gYjjov9hG0lnkMgMUH6DSGYW5kOtIFH+ORYphKTrNlqFoi/iBzu210qWgI80HxLtjQrl8UtlJRnkPvZmUI7ZrVG4CSSzvWMTLh4sW6RrJ+BGTqN42UMf4Ll1DDQUMfMpYxaToJJ4Xq7pRWc9Hvt0jvkaE12kyCylNcev6DKb0uPLJo9jNm3c5N2YMSegbJSuaYBRqBV36SpWk0S5NRIBWx0LkpK/J9UuIOXJBifFaMCh+cmL7NkPiYBIt/JGaGeznlg3at8CAIpcBd
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8c66a8-7a60-4d9b-d664-08ded75e11f1
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:46:56.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJV8t5LZgtZgT4EqJi3CWaoFRxQ4AAYCHltzQkUKq2+bkuyWKl7ObKRGgNp0y5yhXF8SI6vcsXV9rgIr3846JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3195
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate91-hz12.hornetsecurity.com with 4gqxXj62sfz7tB90
X-cloud-security-connect: mail-northeuropeazon11020124.outbound.protection.outlook.com[52.101.84.124], TLS=1, IP=52.101.84.124
X-cloud-security-Digest: 670b7216fc1ac806a0845f1f54fc578c
X-cloud-security: scantime:1.086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239965

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34

[2] https://security-tracker.debian.org/tracker/CVE-2026-56117

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.2.bb                   |   1 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 8f1615482a..b86c249704 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
            file://CVE-2026-56116.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 0000000000..6ef86204f2
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From b7bf047e30217e144235a6b00d4c81afbcc5d6ab Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Mon, 22 Jun 2026 23:41:53 +0100
+Subject: [PATCH] control: Avoid hangup in the recvdata path
+
+Instead return an error and bubble it up where it can be
+hangup / freed more cleanly.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
+
+CVE: CVE-2026-56117
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/control.c         | 47 ++++++++++++++++++++++++-------------------
+ src/control.h         |  2 +-
+ src/privsep-control.c |  7 ++++++-
+ 3 files changed, 33 insertions(+), 23 deletions(-)
+
+diff --git a/src/control.c b/src/control.c
+index ec1c633c..e6115f66 100644
+--- a/src/control.c
++++ b/src/control.c
+@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
+ 	bytes = read(fd->fd, buffer, sizeof(buffer) - 1);
+ 	if (bytes == -1)
+ 		logerr(__func__);
+-	if (bytes == -1 || bytes == 0) {
+-		control_hangup(fd);
+-		return -1;
+-	}
++	if (bytes == -1 || bytes == 0)
++		return (int)bytes;
+ 
+ #ifdef PRIVSEP
+ 	if (IN_PRIVSEP(fd->ctx)) {
+@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
+ 		if (err == 1 &&
+ 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) == -1) {
+ 			logerr(__func__);
+-			control_free(fd);
+ 			return -1;
+ 		}
+-		return 0;
++		return 1;
+ 	}
+ #endif
+ 
+-	control_recvdata(fd, buffer, (size_t)bytes);
+-	return 0;
++	return control_recvdata(fd, buffer, (size_t)bytes);
+ }
+ 
+ static int
+@@ -205,23 +201,31 @@ static void
+ control_handle_data(void *arg, unsigned short events)
+ {
+ 	struct fd_list *fd = arg;
++	int err;
+ 
+ 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
+ 		logerrx("%s: unexpected event 0x%04x", __func__, events);
+ 
+ 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
+-		if (control_handle_write(fd) == -1)
+-			return;
++		err = control_handle_write(fd);
++		if (err == -1)
++			goto hangup;
+ 	}
+ 	if (events & ELE_READ) {
+-		if (control_handle_read(fd) == -1)
+-			return;
++		err = control_handle_read(fd);
++		if (err == -1 || err == 0)
++			goto hangup;
+ 	}
+ 	if (events & ELE_HANGUP)
+-		control_hangup(fd);
++		goto hangup;
++
++	return;
++
++hangup:
++	control_hangup(fd);
+ }
+ 
+-void
++int
+ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ {
+ 	char *p = data, *e;
+@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 			if (e == NULL) {
+ 				errno = EINVAL;
+ 				logerrx("%s: no terminator", __func__);
+-				return;
++				return -1;
+ 			}
+-			if ((size_t)argc >= sizeof(argvp) / sizeof(argvp[0])) {
++			if ((size_t)argc + 1 >=
++			    sizeof(argvp) / sizeof(argvp[0])) {
+ 				errno = ENOBUFS;
+ 				logerrx("%s: no arg buffer", __func__);
+-				return;
++				return -1;
+ 			}
+ 			*ap++ = p;
+ 			argc++;
+@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 		*ap = NULL;
+ 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) == -1) {
+ 			logerr(__func__);
+-			if (errno != EINTR && errno != EAGAIN) {
+-				control_free(fd);
+-				return;
+-			}
++			if (errno != EINTR && errno != EAGAIN)
++				return -1;
+ 		}
+ 	}
++
++	return 1;
+ }
+ 
+ struct fd_list *
+diff --git a/src/control.h b/src/control.h
+index ef592268..1f09fc8f 100644
+--- a/src/control.h
++++ b/src/control.h
+@@ -76,5 +76,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
+ void control_free(struct fd_list *);
+ void control_delete(struct fd_list *);
+ int control_queue(struct fd_list *, void *, size_t);
+-void control_recvdata(struct fd_list *fd, char *, size_t);
++int control_recvdata(struct fd_list *fd, char *, size_t);
+ #endif
+diff --git a/src/privsep-control.c b/src/privsep-control.c
+index b9ea7f9c..3cdeedea 100644
+--- a/src/privsep-control.c
++++ b/src/privsep-control.c
+@@ -110,6 +110,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 	struct iovec *iov = msg->msg_iov;
+ 	struct fd_list *fd;
+ 	unsigned int fd_flags = FD_SENDLEN;
++	int err;
+ 
+ 	switch (psm->ps_flags) {
+ 	case PS_CTL_PRIV:
+@@ -133,7 +134,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 		if (fd == NULL)
+ 			return -1;
+ 		ctx->ps_control_client = fd;
+-		control_recvdata(fd, iov->iov_base, iov->iov_len);
++		err = control_recvdata(fd, iov->iov_base, iov->iov_len);
++		if (err == -1 || err == 0) {
++			control_free(fd);
++			ctx->ps_control_client = NULL;
++		}
+ 		break;
+ 	case PS_CTL_EOF:
+ 		ctx->ps_control_client = NULL;
+-- 
+2.43.0
+
-- 
2.43.0


