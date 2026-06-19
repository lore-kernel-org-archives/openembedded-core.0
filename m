Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DCECD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 07:51:52 +0000 (UTC)
Received: from mx-relay27-hz1-if1.hornetsecurity.com (mx-relay27-hz1-if1.hornetsecurity.com [94.100.128.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37904.1781855508058571383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 00:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=O8s6pk5p;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.37, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate27-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.65.116, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=dV2wchlOVaGBTQvEGLFnfLqqd4rf2d9jYRm3BNpdyuk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1781855505;
 b=Z7vMlz4pKs7kn04Ah3q6uCZHbXZbyJA4bYHV1HhciD3RNz/wxezlfGkROccSAqduB0Kl824y
 K0hnOad5/0lFky4mOqO7kD4pikWlAesRb1HwTADfBmynNjtEs5XMKZx3qzjvz/ApF7YQIuZ/p5U
 WEz/o71TC/i/mpKBg0jlNMh0ik9RhcdCgoxgCorWzafDc8eqwoPkjl/Sufjht/tHcLedGM0Ieak
 VWvQU84KC70PJ1yrSpH88AhyfwEutIshTP/N6pgoHbsQ2RPGQmiYRMehRB6WWtAglIlqC8tctGc
 ++bqievYEXgMukUxQAlyUTLTObBCZJvXmMjkhTu2rhnkQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1781855505;
 b=mj+K/FC7euvdkZ+bjftsh+5XMpRPENG4E23+edCNMm8QjXnYL2xs2wHtSKhoSK2hqNMHd8TW
 cAf7BjXhrLLE+qVnogd+UguBGBD+R1thROK8isCgquhyH+IcopoDekOwD+byUfYJuaaE2KI99dk
 Oj6FI1cArKAHl2/Hu9d36apbKwvRGRrM2a2etorUNCDReAP0AMlewTloAQ6ueRqQVDuwxL+PJHD
 LmOiajfP3HEJuZQQ+N2+rP7HeX3BjH4xesCFvYUqXRmWifsE/idprd4EyFuhnPU46emrHwtcwrI
 OAkugrD//qoiQNTLpiw7lVMtLM9TXCy+J8Nn43pN/PpKw==
Received: from mail-northeuropeazon11021116.outbound.protection.outlook.com ([52.101.65.116]) by mx-gate27-hz1;
 Fri, 19 Jun 2026 09:51:45 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAMe/uDfHI5oKchAAwWibG5FZVD9/JDWMXx0DS2ZZypIIqSN+wtbwGQl3LgCWLQCzDx/PjlpI8e7uTTvBDF8h9gYJiwRyuwz/iyVZoJIEmU6uSXzPeknbBQZg74ZNTSFu1bojbiDAjZvV2LnjItBz865Le02LhsfquksjINFzpS6LS1F3p6FFmeHymezKLi4XuAXzbgXBqCEGQ43XaIUgL/gMm/1VT7QRxoSp7l6Q1Rx6ay5LOyAgzgI/rKlZiChTXH9vRXTM/KZ4XTPKJHWfVOYmgCyjN2GxP9oUT6/0d3vI7aRTBlYiBNTjkIeyE8ow0nosM0o2wfSKB9BLsQ4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV2wchlOVaGBTQvEGLFnfLqqd4rf2d9jYRm3BNpdyuk=;
 b=bCvKq9BhA0yq8n2U+mcs1DAfv1EN1oDxmKDu0pCDBEXpQCNEj4GMGnBXuuavECInwZlszATAQCk2FEwIZkgfsIAfonohb2NH/vyavowktLOoRcFZlL8hAutY4EB0JEMxQyaEmkUj8SS1dHgKwXE/LJv8YKhlVJ/TLnfLd/DEY5mQuop0+Ao12bjgraE8eTwmkI3b/K98MFuAh1Jn/bwiEDMJi/9Uobv2Z15Zyo1fF1pjXX+dRM1S3xPjs0DgyD9G1IRMApLPfuCFaDuP4Giw1mCr+QFg5U3zsjmUgEP54kmR36JDv4eEsZgTQx17CNBGsDWZTL+dtH/H9Hi5oxOusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV2wchlOVaGBTQvEGLFnfLqqd4rf2d9jYRm3BNpdyuk=;
 b=O8s6pk5p/LPwHRx3ZssuZSMWhl5jnA4ErXjGobN5IZzIwPpIScw/8/zc8Yq26QAyd/6YOlYuBJEeNwwyjYwyuZcOxEm6HyUvo01ST9vH1nrVnUpNFSiJOOmpKJoTjo1VEr2PtrM5i8qbTonVeUQaGlctrMsl+UwXk/pX5unX3KUVofPouUMQKvYGBJtobyvztiRNNEvl/cKZMuF9d/5ne6i3w0yEV556fdhtYXxGU43FtZjTUzWumlkwhqE/Xfbv3Z72qScOVESN2EQoy0cA+8p1GE4oYCQDPa/JyY1Qj3wJ5EEyc1kUoDDRNgJ4UfdyKEx82QLRvarAzg82JSat7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by VI0P192MB3384.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:335::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:51:39 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 07:51:39 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH] go: patch CVE-2026-27145
Date: Fri, 19 Jun 2026 09:51:18 +0200
Message-ID: <20260619075118.716327-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::11) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|VI0P192MB3384:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a449cc-027f-45ae-b4a3-08decdd79894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|10070799003|23010399003|1800799024|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Q6Wkr0R7P+D1ueBUPQbW3EgUSfCa3GRwOwYzhnZcJVx+X8gJlfPQNHgvSAQjWvvFifUjaBKnHVKA9D75BmNgNS52fUjF6/1BE2wz9GIDiSVMY0/P9BHZWYcAfdmw3RG0oJKQLX0SDsKC1lFjXtc6fuON3SFl3ndIf0eUY/72yLpV5cTA1Iiqd+67KkdOVpe8cxRm1ZNiZkMkU6jYnUSQLFGAFGy9dVDprXhmIzMMcQ9n8b6ktvu872x2x33B4HcoT9qNcGuN68Hr/COY9LxYSsuQdjtArgZn3E6YZ9CGpYJbgEXJD4hGh1bC7deRUkyZHKPtGqQVOU6NJ/Q4+ooiXG9NfjY0Pu2wFoAVfW7S3kjD71Kjsr5w3DRdooWvBT8x/E1JA+G9ey9b4a9I2Fpm1geQ9LFwCqMnJ0Z7O75Ln7LNrsxyY9b3vkC+Y0FPTTwi3le0a6jutOBwypD+WTjILerqfvC4qum+kmzriAoipTADBLbAqPqIQb0D1Ou7+WeY2M5yJoMbjEK0FNTyr1Wv4+sWm4n1DlII+bmT6pCI9PqU4uyE+rQBXzdtWaLHcwacBy+yD9ol8DxUzl1vuFrSksgouhsTDxY/9JOPEoSagpacep3rZ44J2RAcXhADEsFf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(10070799003)(23010399003)(1800799024)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6zlwMoPUSevNKtk2WH81QXWSu0jwPN8bcMZ0L39dmvuWrgcRTCr3bUnY22uZ?=
 =?us-ascii?Q?LxSQokRSmGL+PohTEWE5ROmf1bPRpcOIGqOJwAF0ztW8aDFUV2q/VOkBkYog?=
 =?us-ascii?Q?t0C+qqqjaVuEiRqhn9kN5JK6ODzIeTCGW6zxjAmkEhaRwy1nWuer6hNaGxZG?=
 =?us-ascii?Q?8gNYpL3DZ2259HL82jIZYoP+eSg97eYPX9RQglGAed20aRZFGvGXh5ltKzDI?=
 =?us-ascii?Q?w3br3aj4UQCkdb5coAmGlBKHBYi4jrWhinkFLzod2C7gjxR4uw8ydmEmVINe?=
 =?us-ascii?Q?ljv6bXTfqMAqvDI9gjhNtvn9tAUC9lblx+Pj0BCynhGd1N87NDxOCzgrhMZa?=
 =?us-ascii?Q?mbhRAeOjzcJqwL8Q8eDq9VK552r6FIgs4MwTTwESKxYl5Jc3VwDGB8VnmNuh?=
 =?us-ascii?Q?NbBirSSKFacBUH8InsafpUY+KFxMmQWJcWxXdJBsLYuOPkBf9Dz1dwh5cJS5?=
 =?us-ascii?Q?/fa9Y92tQ3tIqmIVM3N+6FBSxEC+u1MEKtPJTqGrMdWSgNgWIQLBeAq62igz?=
 =?us-ascii?Q?w8QElZwICkT9tSj9O5O7UupLkqswoQE6PXFdOIH/xcXRJNOgsf5dDRKvusj0?=
 =?us-ascii?Q?gUCNYGs5xwIfk8PAnyCYVieQclRiv8LeKRzPE28Zff2JWlzLckdBvgwOjcMg?=
 =?us-ascii?Q?mysTSdy92QQ13M4dqEq/ZTOD5fGLRg+kxlVl/Dx82MN5Ia4qFz81oNRL/3T9?=
 =?us-ascii?Q?nKAMyTZhI4gOHPE6jnUC9D7a8h7dyxw1cJgWpzv9IWRR27u8Vt5rFrKEfZJc?=
 =?us-ascii?Q?NCzk/HgauoEXgiyOHyoTvDsvCeC8uiVmq1FcDb4FDVy3Akv0MEUDlyfPmUGI?=
 =?us-ascii?Q?Pd02y8ioQoiwceOwUv9aCJ4vJlxrblo8YshJsDkwfBotXu85TWtwGkOVJ1hC?=
 =?us-ascii?Q?OoD+rM/to8PfyyGf7evoqj8dVMasRmDSiqd00i6vH5gMSAbP2pwK0aoG6G7F?=
 =?us-ascii?Q?SOuK0phnUylCOp4k2+oTFHisgTMsIuGVpacwQ9sVr59t6hffBGjrE3b0aLuU?=
 =?us-ascii?Q?jURwIYZq6/CapxzZKcRGnYH0VH0A2509MjY9f83ztwHCaidGba+WpsL69bG1?=
 =?us-ascii?Q?zyNP/vmVfsFeluAsboyR7GWgEug5Ba/W0N+552hxOkOtV8OsXayaQWbdd2qJ?=
 =?us-ascii?Q?AKJHrIDpXuG+oCI8El+X4RmczdRxnopxZy0Jz+CLVxJ1uiaofCQxvHEaOZqN?=
 =?us-ascii?Q?fLmmborMVrmfjHfMi6rRVWxLWn68jSwGnxwbtxaXxlHjGyfwh5yuCDmH7gN5?=
 =?us-ascii?Q?97nzDI3juzKFo0SG3a4x6jq6aiJf8iWCvCtZgSv4spiLmtr+TgO7I/AnfuEX?=
 =?us-ascii?Q?d0H0RDCwsPVm+kyoh1Gvj3dKOWldSRBLS5no6yZFfx6BImtjXAf2T+TuhPIe?=
 =?us-ascii?Q?3SvaQn7DaMQ7dSX/XKt1D6TEgo953vwBNeqPeR8iBT+jhlL8ZNGulUUgkw1U?=
 =?us-ascii?Q?kSbVEEKYtA1DNchlxc6i7HRXa9txvxXbrsEHzhBXbEs+aifsgnHs93iZSrr4?=
 =?us-ascii?Q?Bt0vtQ+yFJMe7len26MoOPIiOuhuv3UCx6cTuiZwencTLgX1zJBWudfVJ1DI?=
 =?us-ascii?Q?2Y5YNUk+Ny7KfTCLx4qoA//y4HT0tDu6XLqIBxJyTZlKxaFFgKZcYlr+9HvX?=
 =?us-ascii?Q?5PLxF8Ylm+Y85UxOMbGCvo9lHfUt0o0ReHwFHzv+b3j+UgX6p+pGb28Zn0rT?=
 =?us-ascii?Q?LiW99zL9wQqqc12w5uKSUt0+ecC7oyDUVrhltQNjOf003nM7hNBi7XrpWB9u?=
 =?us-ascii?Q?atGDKdwL7B0/hUdBEKcA5pexeRIspX1upKJ4K4H/09TuOjLrlrW1noiWD3x3?=
X-MS-Exchange-AntiSpam-MessageData-1: z/3pSTo0IMVXug==
X-Exchange-RoutingPolicyChecked: 
	h2Px1AbEleNH5hXmP+eiaJ/kl2ithquU5dM+BepWGRgLsYIACzHiQ0+5vy/GappwpALtPPwH2N60fZvLF0vfdAKbdl0neLJ83e+0JMLAtP3yUd2o238QGzqFSe3rOZ78rLpMDunfS4dACF9ElmgT+XjDsTSV2lR4ar1+hexljO9VrW280uCxlpiOhTeHEwT4Wf2S5AE2Uz6vTCAujU+cyaW52B32pMnjsdsSpTbCkXsvQNKIOxqzQw0K7Dx0rxb/AC4bx1DvZ/2bsSz3UFPRe655Y7MRY9PboSm1fH0Pu8IhTzlPnqp9JKcjzpvqw+cAkluMnVbWInlM844Ig/sC3Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8Xxcj4B3vRA7IdC8eLQKEGMyiwUc+plXk9NZADhMoiLA/wDNRmK1Mb0FHfanpGYjo6XeYOu1XmOYGAfcGUzgfd2CIeA5PZfOCRj4qCC9hNKjzEftLEeM1J5MkPDdy5JLxNEI+nQpZGKHda4dDZN6fwgUCaHXvfImWlPHBoKhdQ7lEh0QgggD6XW2hbQjbBqTQlNXn2hJ/5SRxb8lovlqsSHuo39FWqtUtPWtmfQ/LPU9OYpfkQ6m3tx3N0OfG98v0sMRWKVFDvqyfoHT0FZvXPZw5h1XpExBC2TTqQxix2CXYcB06gA27ltLWzRHTxYO2Etup5xZMSVhyt8DwzygevwIWuEGYEHpJQ+MgoAUMcWn3huGgbA0mneVheskcrlRACfOljXvgngJtVQ93uFI2jsO/e531VC72Ji79FO+F6EWy8aw4Ve/lilEPBOVjgBNEA6WBUTFDqfDJv4YFiDcBKfVamVEjHTUlrl2HG5QMoEyGL1N4pg4sAG3zgf/GyJLDMVDoDdqnJaFejeanI1XhR331oSwidv7u9BiQtUrkS6Ku+ZPGmM9ZGkEMFRmSIww/0cTzkTAUHgjm/p5C1jtb2mJPLYtDVmrGB1d33WF/vY84g1rgsUfBB3yf6qR3pRv
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a449cc-027f-45ae-b4a3-08decdd79894
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:51:39.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi9yVqATUnNVgBFabrfYyXh9f6s641pMj75wh7EwvdaujvRHgeWTXA7RcbhG5pBAXVNUXUb5QygNZTvCTrj6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB3384
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate27-hz1 with 4ghVCy2dZ9zDs7k
X-cloud-security-connect: mail-northeuropeazon11021116.outbound.protection.outlook.com[52.101.65.116], TLS=1, IP=52.101.65.116
X-cloud-security-Digest: 8996e10a00e806a4bfa0a552c8bfb0a0
X-cloud-security: scantime:1.293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239133

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/783621

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-27145.patch                | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27145.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f67da3e078..cd03d67355 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2026-42501.patch \
     file://CVE-2026-42504.patch \
     file://CVE-2026-42507.patch \
+    file://CVE-2026-27145.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27145.patch b/meta/recipes-devtools/go/go/CVE-2026-27145.patch
new file mode 100644
index 0000000000..f231aab458
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27145.patch
@@ -0,0 +1,96 @@
+From 612753600a0184c8b792425dea62e530170ca811 Mon Sep 17 00:00:00 2001
+From: Ian Alexander <jitsu@google.com>
+Date: Wed, 27 May 2026 04:22:31 -0400
+Subject: [PATCH] crypto/x509: split candidate hostname only once
+
+(*x509.Certificate).VerifyHostname previously called matchHostnames in a
+loop over all DNS Subject Alternative Name (SAN) entries. This caused
+strings.Split(host, ".") to execute repeatedly on the same input
+hostname.
+
+With a large DNS SAN list, verification costs scaled quadratically based
+on the number of SAN entries multiplied by the hostname's label count.
+Because x509.Verify validates hostnames before building the certificate
+chain, this overhead occurred even for untrusted certificates.
+
+Thanks to Jakub Ciolek <jakub@ciolek.dev> for reporting this issue.
+
+Fixes #79694
+Fixes CVE-2026-27145
+
+Change-Id: I2788b8ee22ffd28e45bcc7b0d860549084906a74
+Reviewed-on: https://go-review.googlesource.com/c/go/+/783621
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Neal Patel <neal@golang.org>
+
+CVE: CVE-2026-27145
+Upstream-Status: Backport [https://github.com/golang/go/commit/d01955d5d50ccb5f46c215f88c1781742b3f117d]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/crypto/x509/verify.go | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 1de06bc95b..4c423a5fca 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -102,7 +102,7 @@ func (h HostnameError) Error() string {
+ 	c := h.Certificate
+ 	maxNamesIncluded := 100
+ 
+-	if !c.hasSANExtension() && matchHostnames(c.Subject.CommonName, h.Host) {
++	if !c.hasSANExtension() && matchHostnames(c.Subject.CommonName, splitHostname(h.Host)) {
+ 		return "x509: certificate relies on legacy Common Name field, use SANs instead"
+ 	}
+ 
+@@ -1081,16 +1081,14 @@ func matchExactly(hostA, hostB string) bool {
+ 	return toLowerCaseASCII(hostA) == toLowerCaseASCII(hostB)
+ }
+ 
+-func matchHostnames(pattern, host string) bool {
++func matchHostnames(pattern string, hostParts []string) bool {
+ 	pattern = toLowerCaseASCII(pattern)
+-	host = toLowerCaseASCII(strings.TrimSuffix(host, "."))
+ 
+-	if len(pattern) == 0 || len(host) == 0 {
++	if len(pattern) == 0 || len(hostParts) == 0 {
+ 		return false
+ 	}
+ 
+ 	patternParts := strings.Split(pattern, ".")
+-	hostParts := strings.Split(host, ".")
+ 
+ 	if len(patternParts) != len(hostParts) {
+ 		return false
+@@ -1168,6 +1166,7 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 
+ 	candidateName := toLowerCaseASCII(h) // Save allocations inside the loop.
+ 	validCandidateName := validHostnameInput(candidateName)
++	hostParts := splitHostname(candidateName)
+ 
+ 	for _, match := range c.DNSNames {
+ 		// Ideally, we'd only match valid hostnames according to RFC 6125 like
+@@ -1176,7 +1175,7 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 		// always allow perfect matches, and only apply wildcard and trailing
+ 		// dot processing to valid hostnames.
+ 		if validCandidateName && validHostnamePattern(match) {
+-			if matchHostnames(match, candidateName) {
++			if matchHostnames(match, hostParts) {
+ 				return nil
+ 			}
+ 		} else {
+@@ -1189,6 +1188,10 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 	return HostnameError{c, h}
+ }
+ 
++func splitHostname(host string) []string {
++	return strings.Split(toLowerCaseASCII(strings.TrimSuffix(host, ".")), ".")
++}
++
+ func checkChainForKeyUsage(chain []*Certificate, keyUsages []ExtKeyUsage) bool {
+ 	usages := make([]ExtKeyUsage, len(keyUsages))
+ 	copy(usages, keyUsages)
+-- 
+2.43.0
+
-- 
2.43.0


