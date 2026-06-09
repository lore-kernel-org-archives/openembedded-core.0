Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113CBCD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:05:05 +0000 (UTC)
Received: from relay-p04-hz12.hornetsecurity.com (relay-p04-hz12.hornetsecurity.com [94.100.139.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75126.1780995894172137899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=oFZa1LQl;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.204, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate18-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.83.116, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=gvxpr05cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=vZq4CKhhnqIwPz/Kuh+qH9g91OBdCn5u6pAL4gWIKqs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1780995890;
 b=S+lsPvaWsV+dyz2chVqm/Gus9K9f03x1lFa0lAvXQrvf+ii1WTj12JwNSG57DpE802mH+beu
 O1Kts7CKyInfanH24ZF+Z8WAaEVd1KyZRj92wUiFGfgiCuBXR1V+fNZaLlS0KtQKi/Fni0D/J7f
 7ASH0M/hyTBLeTudITP18ufT3qOGYbDIwZR/VN4woTW87ry+pWTy8hqdrNxwLZsyV7Wiku2FbBo
 xccVEKORYwGaRBQPbvadaDwtAPnJ6W8PCX09TvNngWV8Gp5U3MwpW6tR1wrQpKmIQqeF5Ttk4uD
 FF2P+DVIyTuBRJCgwTvtSM3m2isv0YlHoCnO2z21YAZgQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1780995890;
 b=s1cvNQDZ3J6OWpnCOb58asBtiw8Cai/e6hQk5FpUEhedmEcIRJnFzzxZeNbHpmIYd2mi6iZL
 QKbBGCrcgp+j7hJ8qHLdigMtY7u+bP1Grc2KMbt5DuiK1j2jtIEK7gVcOAwtCKKZD/b9pIpRpcv
 4PnRw/f1HZvmrWdyqO07YxPaVBdlflYa6ahAf+2tXX9v1RGiyGnBjCtzzp4u0JDEwZV6OL2vknO
 HOqZnminZryQk/9BqwxW5GixqH2MXmU8LtsewhzD8MVmfih8kDrmXGV5cQZP031o2GGAl5Xa8dA
 kLOTDFSBZ5G9N2y6JHtrcymaL4vts/goQ7ognCP+DR8xQ==
Received: from mail-swedencentralazon11023116.outbound.protection.outlook.com ([52.101.83.116]) by mx-gate18-hz12;
 Tue, 09 Jun 2026 11:04:50 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYBV1eVlqC/Kn84rg5JaDHygmY+BfraEaM13MJJGelSr1bUgXjGrQlAVGIyTrdrRGjR4r3eR3onP/BI0kLEJIeuCjkZNp9y2sPMvSWk2RR4I2oMn0H7wAQwQCnIV3451jucz/YXncxtgYNkwmrCyOu8iaVk1AfJ4Eg5DeQfQXNERTkxildw0vDYYukNzpPGdEwo39pgm+FnAd4pfIlmgpPnaGhYG3uYp2I5YoA6kPxoy0fVdc+TeVPwN4GuoUsvhWzvwDK2W0OUmovROIPNZM/hDWUeq/glIEFHBr0L99Qem5NE+xov9O//v+FWJ//Kv8UtFEZI4mN/siU+4foYEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZq4CKhhnqIwPz/Kuh+qH9g91OBdCn5u6pAL4gWIKqs=;
 b=K0dyrjDcQ5qB46UTdbyRBz90H6uPf+dhoftMNI9pOxa9dCsyBePhbgVKCCN/AECU/O9OJQ+B2hsee/auUCLMWpamSyn/78PPYspyTbo7REgaIKSPxwzjwGT0WhSgRX472iRmIu2UEaRpYZthSKTmF/z1r9zmAbk7pxvjZgCpO5tod7ZX3VdMMsMGOCw9fQI7qVvoSjvbYxDD1Uu6lNAk9FSgk1ee+4l1fUSLsxk3/dgs9uTBGyNqW7gt17l8r7fO3qc70OT0PyRxMUTrGYKw0cTQepTwVC3R/gTcjgYJ+HNbAHfqQ/g6mrgZIv+1Br42pE3qg8A9V4kZ7phOfnb3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZq4CKhhnqIwPz/Kuh+qH9g91OBdCn5u6pAL4gWIKqs=;
 b=oFZa1LQlIHrDzBiZchcG3A5UQE3P4rYqY1C1JYFphu01ltVcJ5CZ7UDYtklcr1ZwN4GlbcXyPh6HH9rpj+2jVRqull+oA7AJBsb/sEx7+Ul9yTbF1k2GwOA5YQ7As7beg9B7AI4oaV3g2Jf1nLFtb3hQ+jod8pS8JYN7LBdVwZbUNBFVo/lcuIDLO9puzwgJeMCuGlmbfIuEtchPN1bYembSarJLdFg6FO9Qp8qNqwDvVQ8SDWZW4TtNG9eJm2XQkIMIvgK+YFPvhz4cJuAeQ8jxlJTBW+kmCWBVF9kJuHyvt7L0QQ5K0GrpyDpsDE4p2hkBS55mQEWb62hd/OfZeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3140.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:506::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 09:04:34 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:04:34 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	jeremy.rosen@smile.fr,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [PATCH] perl: patch CVE-2026-8376
Date: Tue,  9 Jun 2026 11:04:25 +0200
Message-ID: <20260609090425.620975-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B8B.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::416) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3140:EE_
X-MS-Office365-Filtering-Correlation-Id: dacec4e5-313e-4aba-57a6-08dec6062018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|6133799003|12006099003|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info: 
	srMANS2mH7qQ095Q1QrzLuJ9bKoys2pix1iBbp1b8vTNMBzaeXsCzvrgrp4TwdsrUREoU55kG2aU+iT13/EVjql8Ly1aR33f2OWD+SXBliD+Mr9Z58lrWUher7qDVou7wAPKsbMRwpFYpCD3UxDV4mR14yIyNqVkeKuKHQH5MMHEhO42bHQV1XQ3PBXRvcWqQqyMkCXVvBJS8BBpim2E0LS7j90IbA0qlry6mHudBJBm/AL+QHqD7PLVLikxqCfRhOSx0hzSeCmzJyUes7Et9ORmMVQfT5jPcNPPN4Grt4hUuwG4w0meDAvuvhYWvtKQINVzM6MhZATjPgmHaQ6VNDxbjBZt8JIpsjIBJpYBcGCPPhZqnUdtS0eP7+Ib1xxnbKCh8ZaNHC71E8392HpHSiuVGkfODizwrLwWdQQH0KT+L11VIjEAnlTm/0q3cbpiz3H4SJrqIrO/BwicHk69ItdrLpJXWXJvJXY3uJ0cIEvY503TNWnP5cce7SkY1EjN183ZUX6bwh2HekP6FHYIyHkkynVwcehF0YZNQ9igocse85QKtXyFVbmFxJi9A25Gp0aGU2z9KOFvgVFlkx1nEu39fpUY2awSxEHG0lQZ3AVVR4d2PtEet1aNxd7Yd7onDtF2kjk+OOI8RglCGKuFXlKllHLrVgHlUhyq2abGaQfNXRIOB02hu+pwobx4Rtz2tx1m0XoXuH1eVma5iuvGMA7xwMZZVWWutGH/y/mnpmng5RfGb/yVI2zWT9Q+rviA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(6133799003)(12006099003)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vDAiw9XQGfAqvEIT3Z57cnu1GzMVSOQD+2vAY+nfxRyNJHpCYCo0xUPy+erA?=
 =?us-ascii?Q?o0uxu6ESkjjdHNNscWhKHOF9651lTNDDdvUuGZqLb065Xu9Z/OJYY5iSf8wD?=
 =?us-ascii?Q?vgylCvq9CN9vfmGR8tvqCcCWxT4qoQ/l1T7Vw+ddbAxHVHAbyyN/YIvLibcP?=
 =?us-ascii?Q?xsY6Ygit8C0dAZx9LDnEZ2Cm4JNpexqQm9Mu5COY6lM0ElUHGufZJMsig21t?=
 =?us-ascii?Q?b2lQ7R2AX75i6SZBZ5aQhO2djK1Tjwe0rdRN4ZJVd54nHUJa4CxbmKkg17Nu?=
 =?us-ascii?Q?w+hoVa1DuhI+gRjzOGzhrDSebxWBgp9fEflRcOv+iR17AYbzZlJCg66fPbFD?=
 =?us-ascii?Q?5e9THwV/O5FmmRJxTuKHhLsVgC4w29kZ24Bk+/nDNialogF9/q3aPd722xAg?=
 =?us-ascii?Q?nHwvfUeqUgYF6zmEBMYq+EXGe+hdL1iqkAtRhM5sl3KslOuKEcxglYDxDmAt?=
 =?us-ascii?Q?nUiVLrKriUjwT6n40LY5yKWoctdyKYXw6aVtTwq/XEe3dtsm1PGEcE9smABO?=
 =?us-ascii?Q?hVPq63wi9BNtQcyYyqwPMxcJgwnRZg0cMZ5tSbMZh6lVxrXIJwraHRmCjJ4V?=
 =?us-ascii?Q?EA3nGojM1ZKR27eWcb+A9ZqL61pymm19A5CgtQdartDjz1hA1v6S8pCSzuUZ?=
 =?us-ascii?Q?okNz05SrBy6L/hW0eVR3iKgtAk1A2n/L6gWMoNsD5GUtjBHICVCW0ZEFwvwc?=
 =?us-ascii?Q?MNDMATCK2Ejl/OWxsgKoERw+qDsx9ENrNWPm4q1COaOlrUujYOsEL0+M0pPp?=
 =?us-ascii?Q?DTMTfaUHJmer9XIAAkBkF5RpmJLLl0yLTIFo/xyqsHqjD/nSWCAMVY0uXfYP?=
 =?us-ascii?Q?lPxaYK9OzeIB98SfFJ4tAT+/4wuroLO/rDb0k3CUWHMSd5X9epFfzLMjYs+a?=
 =?us-ascii?Q?+O/i3kN8mwg6dBMs60eWBqXXCSq2jkYj1t3+KrSh35j1rIZgxial3vYxUSfp?=
 =?us-ascii?Q?6Tg7c2ODdJrWjmybEgXDCOi+BURmqlizB0sdREem/OohvLmk4QCUbsXEe7bp?=
 =?us-ascii?Q?EzXhwmXsqzsBa8JBEktHZ31AmRE6ESdlWmd876cBr0AJkQQa2Txs1ivU4wIr?=
 =?us-ascii?Q?2LuRuRowIp2owye2Gh1IRGLcqrhTg5zNrZ1/kM0VK5UaNPHkBVY9R3PWVTJe?=
 =?us-ascii?Q?xHZNa6j7fwYXuX6AdsihXwA9V3LKt1iZtWTzX4T8ENQqBqQy3d0HB84QYvWF?=
 =?us-ascii?Q?VIMo6xqQOvcglabTzr4c3kf25/QMjOTYAXnOCHAufEbg8derqx17LkAlpIqt?=
 =?us-ascii?Q?1nnsU88m4uE6lgVZPw8l15Hgp7GeYqcjDJnSF5Z6gyQsA9vQC33gEmQQUfrM?=
 =?us-ascii?Q?IBNSgjf6nbTqKRJWNVVioFLYD8RKORiOIJM3SrXM/HFTfKkmrMWI6rlFfcQL?=
 =?us-ascii?Q?aKZvlAwbw4ru296iih2rwz+cxJpDDaL/5DiNXAMtQwv2jZ9p+6tmYgJw/sgj?=
 =?us-ascii?Q?IMUfm4Va5EUqHWJ/QaaRFXOgMG1mv3P0VLNiZFpvosDOdBXhg0Uo1DOHL1It?=
 =?us-ascii?Q?x9oLAyyNz+weN0UVfUcv5HLHkrOSr44ClPk65619sObDTTtfLYxjgbWqp26H?=
 =?us-ascii?Q?XFib4/OBWGCXbh8BMpbtUCLMn/yLEkA/GF2PXjrTxOWRMpTUCVjjNY03zzMp?=
 =?us-ascii?Q?2prATyUig3kA+LIboxD4Pj/bArvptZoohsUUssoJkf/FfRY8OvwJzGSLeDcl?=
 =?us-ascii?Q?o1L3wEDdG+P0NPD6BnllXrGkooOlP9e0JP3KZscg1YAZKVlyrXMzfqEeug3J?=
 =?us-ascii?Q?zsLOFDnSkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	pH54y2Aqw22ewoLwqOWUyeyMXI8GjEadEGRfResZk2Ml20+MqC2hbmh0IJQ8sXHkoPqHkQFAPRJsIPNaVLtN2FcDhgZv9ZQ6MhlMvDEf3bHDl0sevKcaY3fo+IajIbdd8/xtQ+J6Ta46ila7u5YMu2clZFsgwIxGXbqLerLiBr/JwJRA/1d0reQg0eH7lQpotVs0DMvVymuw7dbSlsPVk8H+yHq6qqLmk5cig7qzf9sAN1cVDzAROcyd+oa5h1Vcbd/55367yMJOliiD5SBFTPNilPCTXa/sTWc+kxqtjWdvMDpW8SOWs8ml4XvnBB6APEFyB52wMzqCpQ0x18IsFg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iwjb95/wBh7130VnO9NyFh7P+6ERXwjoyotczivOBWku4kt/sEo3elbgL2RUwLDuWOcHJFGNAJpU9bqGH9/EpDh2i5hOg/Brx4voclaZxlaB77AOnFRniGJBoK2keC+NVVnShCHv/xBUAl5rGG+8+0SlUH+h8tkfnTi7lq/SztWxlKgA7WFCjUs5J9r4JGhLJnbGLQ0d8xNVvMWSxyVIi/1HuSemf1Ah6XqzJV3FpNwmlpulC3paxCdGWStM3c5ooCwE3KZUVF27j0DxSz2hLfYM+9ohtfSJLrDCjyx/f8Nsd7fK8tNeXA56iSzyQY/MVYOba3S+0kWcIzWD2l/z8p/Q/tWz/v5uuWewx73VekWpjgECzSBIw19km+ElT4sVRWG8R2XLOT+io1pRnwCHzj4XIhjMY5ZMIqQvfVDKf3MdAxx/QIbXQWvyeJERnQpL0EcTYyHrzV1TsEjF1c6KxqkUTQbADexbW9lbrR9Rujshc9ifiPeDTW05rBdWAClGrdWLsGkx1mwDUIxBvo+QlMxjn0GZxAymUIccv1SNnKNx3ePOrzngz2JmtTONLJ1FdOazEFeGz85RwvIrGs/pSYccU+/RrxiCztZT34Ruvc7B69br+nAlrvewDA3p5Vwo
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacec4e5-313e-4aba-57a6-08dec6062018
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:04:34.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMzcOWPDAxVcyY0av1HVY47B+ve72kEbELKV3r7/VGAdoWzOivNwHrhSvr/n0ng/cIqkrh2EhwPGKlxcSebk/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3140
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate18-hz12 with 4gZNJj26YNz2fWLC
X-cloud-security-connect: mail-swedencentralazon11023116.outbound.protection.outlook.com[52.101.83.116], TLS=1, IP=52.101.83.116
X-cloud-security-Digest: f696bfea829b7180a6ee50050e47cf91
X-cloud-security: scantime:3.659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238280

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/Perl/perl5/pull/24433

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
 .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
new file mode 100644
index 0000000000..af94eec29c
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
@@ -0,0 +1,62 @@
+From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:47:31 +1000
+Subject: [PATCH 1/2] perl/perl-security#147: test cases
+
+The suggested case from the ticket and an alternative.
+
+(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ t/re/pat_psycho.t | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 336039521d..73a7992372 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -10,7 +10,7 @@
+ use strict;
+ use warnings;
+ use 5.010;
+-
++use Config;
+ 
+ sub run_tests;
+ 
+@@ -31,7 +31,7 @@ BEGIN {
+ 
+ skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
+ 
+-plan tests => 15;  # Update this when adding/deleting tests.
++plan tests => 17;  # Update this when adding/deleting tests.
+ 
+ run_tests() unless caller;
+ 
+@@ -211,6 +211,20 @@ EOF
+ 
+ 
+     }
++
++  SKIP:
++    { # sec #147
++        $Config{ptrsize} == 4
++          or skip "these only fail on x32 and use too much memory on x64", 2;
++        local $::TODO = "This crashes";
++        # original case
++        fresh_perl_like('/\x{10000}{1073741824}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow");
++
++        # synthesized but similar case
++        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow again");
++    }
+ } # End of sub run_tests
+ 
+ 1;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
new file mode 100644
index 0000000000..39b3d510fe
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
@@ -0,0 +1,49 @@
+From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:51:00 +1000
+Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
+ lengths
+
+(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ regcomp_study.c   | 7 +++++++
+ t/re/pat_psycho.t | 1 -
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index 9106452dd5..05f1b017b1 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
+                                                (U8 *) SvEND(data->last_found))
+                                 - (U8*)s;
+                         l -= old;
++
++                        if (l > 0 &&
++                            (mincount >= SSize_t_MAX / (SSize_t)l
++                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
++                            FAIL("Regexp out of space");
++                        }
++
+                         /* Get the added string: */
+                         last_str = newSVpvn_utf8(s  + old, l, UTF);
+                         last_chrs = UTF ? utf8_length((U8*)(s + old),
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 73a7992372..9fd764fd5e 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -216,7 +216,6 @@ EOF
+     { # sec #147
+         $Config{ptrsize} == 4
+           or skip "these only fail on x32 and use too much memory on x64", 2;
+-        local $::TODO = "This crashes";
+         # original case
+         fresh_perl_like('/\x{10000}{1073741824}/',
+                         qr/Regexp out of space/, {}, "ssize_t overflow");
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index cf28067bab..1833b7a352 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://CVE-2026-8376-01.patch \
+           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


