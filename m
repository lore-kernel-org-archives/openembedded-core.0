Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C729CD5BB0
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:38 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33072.1779358233704116491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=MuHCWIso;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:31 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFXBQlltLaSIjU92Ihi3Edvq8D5UKmh0hx/BI56GsrJcgIRKaDONzgPK7yHM8DCcBfpAa6uenH9dsVuucbl26kIX27KxxdAb1NJ3/IN/rC5Egmgpthbh1bTNS6M8cNCCl104KQoLNViyAhQMmZBK1IfW77JgglAteqMxG0L3iqhmnNxFtISB2NC5/qNfq9dEL+8NdksuCN8AWo0oSJoQaMn4CjwnWRphRBSpziwt69R94DwVraWFL04ZTCCavfAaY6JbG3PSzhKwpMi8xTkdlO7JpWjPUjNEls4IKaesPS2FQjpPym1sWu/lb/5/qpBpBAxZ3Wk/8L7EIRHiYzcnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC25waZUfvCC13ZmSCemq5oF80IXs4qDh3HXAg1SyQU=;
 b=KmiR9VgB+HtoR3GxL4/yXC74mKUHosENMGqbKd/PIk4OOBjyFvD5wBwYnQxv1RAGuz3DH3yXJ9VD3IyzIQmMLI1gghymR/W+mNzuBGLu1MRLTMLLGNzIaNEiQ7moQqIa2Mb4r51erijXnK1UZrmxqU3mcBV0ipbSVAvECGgWs6ThxZe+sJyEXbUE9sqIQtkNsd2sbVNLrA356oZLUINl8ankvhRoAgEZ3WPNtQEMS6ZxS4mppZdmRep7/l5C0wRyXDjmgGFsGPAMAU0gcZp6jz1r6O9VWk1sg4e/Xb5DY+ecKHvnBc+4OpWOpi+6yx9KUQVay6+uqL50Q+JX2SQ+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC25waZUfvCC13ZmSCemq5oF80IXs4qDh3HXAg1SyQU=;
 b=MuHCWIsomo35qoCr0ZousAnmGkU2+BM5xVHeZ9sdkhS0a4U8tKediBGLbxqi8KXEcgyaR39sM4FlpkccFr4tkO16qDozAtP9ACcrzSi1hZVKMuUMI4D1rNEVtKqNWU/jM6sUNViclCGO3yLBkjQ6trWF8v5b7isdwCRHN3QnsFoY8afLpbSEOqaQJBa7QySsk7R0wS9It7J/3Hf/03+r5vZQik4rD3dHa5cT7wLbbzUJhTMU0EXNOq5mi/VlKxxzbA3FTBhIKiso1JXZ708kd039q7Ie+u22Z1OVBgh6JTaUAuLYE1SwcAeJMZ7688kQxs30NICPPNM7WG73HbqP7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:14 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:14 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 12/14] go: patch CVE-2026-42501
Date: Thu, 21 May 2026 12:09:45 +0200
Message-ID: <20260521100949.1299757-12-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9352f9-c025-4752-26d0-08deb721266f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	XYdIiQY+LrD+mnyar3bsFsdWBEzP4pW75dFmEllg8hUUCV+Ni3hHyYucVwQzYBlGM2+ghkAearY/ZbpJywxkP71SeYJOsOieUAS3nJoFOjV3oPV28FQqufY3vGO+GzeKJXAdgO+XyHmhmtpE3m7XHTVa0Ww3DtcmJ2KdtxCo1cQBKD6ZELRvd1NQJK62swN/iwl2gE1xxSK6Q7c6xZugaFk9tWXQ6hvZPMTa1woE+R2spYOQSTKIV370hcEdpmu3Py8pTr2UZga/NHMsnE7i+/ewnn6mCi9spgqBM3rM4H9eo/Po+gTCF/hQzQif+E8+LDHM2e+lqN3S/JA0XG0YG8qrX3V2NZoOSTxV9UONnboWNnat0qYTZZSHo8To+8r+U6J8+10RwVy9u3a4aWw60YmaUH0mN5Ty3j9MNqHomKmC4QyB0vO7KCq3cWOPctXmadfULM9I4xy9gHD1Pw2164sI6KTPMG4FbZ2VxC6VvOBRSVYpB34GUlY0UX0kb2Nw93F66tein777/C+Kda020tgFzB6QUYIT1ho09F617fOTbj2ydewfB7vJFVpbAE9ziW68BKcFnRLD9lB2aF1lPp3tAPh1r7/2WKMxHSaahGC+/zu8mQfpiWDRuDwDg1lMK2uV9ZplRBPGTBZ+1ffyQ0FLI3xXXvmdM3Aps650/ZozmY967xKaftD+XSZNJFGDZu4GvStnFcOSacC65Cq9pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QalH3X+Ktpb3Y3kTXYnSPHehqu3lOVF5sb1sBecfctzQMcYr5noywH5XiMFK?=
 =?us-ascii?Q?g08+W4ADb+4ib3P2+gkz9XbnozwbRWIeNpJwWXPKZYnFMfUNGBv44g8H7C9U?=
 =?us-ascii?Q?fZre08w0Upb3o6pq/JMqXBuuT5cuIflZ0I7WPHUqxzmLEq1IvyDLPEx04O6q?=
 =?us-ascii?Q?+1OoSUQG3Qwa5YXW8U7yYYFpVihIZY+8011D2OhxW+MVJ4MpkHotsRFusC7n?=
 =?us-ascii?Q?StuBiegAlM8x31qzYG2IsMxmjBz77sTtXc15f4Jd2zVpD56MGu8nQLUnSOp2?=
 =?us-ascii?Q?KU5YUCdgiVM+zGjnHEtD91sRTp2Q+6n/QtDQCXHcc0jX7VbRcV02qKZO5ZyF?=
 =?us-ascii?Q?T6POG7lzQMQv94yxoSv/fBFgPEQMxIkBUaRIerZr7s2HUgtW9tMDUg7Tkg12?=
 =?us-ascii?Q?81VdwbNIee84REoWISQhmWM8YCxUJLAVnnYDfBhR/HWQxiLHgMMdAgb5av4r?=
 =?us-ascii?Q?QAEPjX6+W1OZubai9LfuDYn6ACUwvYYnQQqB5HuMwYr16hqMZdoQOOvO3A3T?=
 =?us-ascii?Q?EcrOsoWETpFJGXBJNHdwsLfhG92oyl6h2iSCyAwuWshSGli+8Vo1RqKBt4Ay?=
 =?us-ascii?Q?qb/er+lcf4EaLouqex9VW97HWLVC1atoHduiVtSr7E3QTX8oo/vzttJgOEdw?=
 =?us-ascii?Q?DQH69KCkJitD/R1ddUAh8b6wvZZBc4y/PyOKs5g8JL4jQkqeo2sIrAoDzig0?=
 =?us-ascii?Q?NLqL7M/b0YJvPBrnYY1JiYoYR/sAP5KaR0BASBzXDVPAZTlnRwG7fglEnB1v?=
 =?us-ascii?Q?pFpc6GzQAQ3uTWSmCNP9uiHn5KpWgryH85Mv0tHIRvcKdY549WzsLvxOWeIz?=
 =?us-ascii?Q?maTPTpwY7zfxVOVfVArUwdx9g64ipiq7BL4cz0szphu6/hOTV58YlJPSAtSr?=
 =?us-ascii?Q?vTc27VMFmEGDCASmGpXgyHr65HiXY/EP/YReEzcp9U55GCoMaxwTxuUyqCmC?=
 =?us-ascii?Q?1WwbqdGHUut8Igi7QG0bLB9LJYDBGRs8pzcIpQ3lnBjnsXvqC45e3j9WUJ4d?=
 =?us-ascii?Q?ZvMQGKcWtvzCU5Rg+1LllCAbpduUoY0TiaesNbziOURrvfd40rcS69aEzCew?=
 =?us-ascii?Q?DYjVydIRi/SPG4lLuFUVeFn7yJ08t+Ow71Zxt6mKUnwlN+Y4S/T7KqrCan5S?=
 =?us-ascii?Q?Rf74TOxbNV/uMYbWjeRW+ux1/8KdqGR7Ce4Vd8e9zhaFUO/ZPKikqea2UMAp?=
 =?us-ascii?Q?uIKCypj4bGFI4fq7u1E3tHq4WcvVBR0xHTKrPvkVuCRcwWQonX336krr9f6Z?=
 =?us-ascii?Q?TuRc0us2a0Grwyo2SF2zNJk7KO0cf/ojyDXDTMOZibvIT1MeYip19z+W3I7i?=
 =?us-ascii?Q?2XFMuWJfHvzi8OSPT7H5g7oBKgj/1Nwk+z/6cJV97R1VD8qCAKfLDd5ENEyR?=
 =?us-ascii?Q?SE5TY4A4fztPk56asxTVNUMjn8SGVFrehwcWCzrvZQrAu33lh5U2GU609Wbm?=
 =?us-ascii?Q?oQ6UGJMwCyt2j7AIUtyPAioH3zTCjHlFA9XLcVstbe4vQOM/BHoSmM74yKWV?=
 =?us-ascii?Q?o8pLtgpBTOcSamxBZn7ikVDHM0K4kgsQxTTUZOYDkQG0Mh162++QBi0sq9c8?=
 =?us-ascii?Q?L7kY0lNM4IFSonXg9v25C54F0ZKJuIeRnYwlBhFUPvHM2cHZSqSzO6jxwnK+?=
 =?us-ascii?Q?CGuhvq+B1a/rAapXOxbRXYr2u3D4JIrkUa2KNruiekZEC9+eQMsUuH7LdKlY?=
 =?us-ascii?Q?3DWB4fWT6oWocIU3UI6ze2cxBM10Gn4PIsNTx0vmDmyNJItOxcACinGP/6ho?=
 =?us-ascii?Q?6LdsHwy4AQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JRJyJGLCXgAfJJoK0JfBc08ujwTnlhKZeZGaDd+eBLE1xpRMEtZXPCOs8wAoDousQzVTRAUscV1MfCDj7pl8J20EXfHLiR27BvhANt9Ei7mHDSEM1f5k//Z4d3jKE0LkYxlQ35CtGR7FmFdylIQRJm/bjx6pMDsbefd9Gpjrvf/VpWSb6WIgqOMVgVIB26yZ3OKsO70pAnMRmRjCJWcZrfJPlziiMYBK0SMl2lJTMZIgy1bZK6v24hj7d+mwmWJAFdPy75RPJGTHe3/mj7tBiw11xKwv16xYhX2SsrIfv2KQYqCCSjK41p5OHy3hMKh0w6p48GfOembMHjg3gUYDHQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	b0RyJ4zN+yhobc8fTX4/4Rk7LM+IYByhBK1dgDJeqxGp9Hj6sTUy6Gtblyo4MIsMNLYO4OTyZNrsRcYY36r6b8n3ZA+d26vnAJpXqdCImHMq0SOMKUq2xPYkmEjHtpGnfQOyX0YIohUkbOwE7cKgy57olMs/S0lT4BqpmPYiNWhicDLAn9PYSVLuPAiZZmm0TLSHVSSFJdVEuu8E8BZnS9CMt9O3gcHXtQjQ8jFmzwfAnVZgKNGKSi17qAyqXt3Dd7am3E0ElEnp+7JLzB4baPnd5AlRLIOC0tm3cxDLM15a1fZ+FHm6fzyDJWSdTbiuyDOz/Hj+CwilrFXuWxkos+whHhBXXjjyaAaMO7/0e7Rz/GJnUoCkqR5lC+t0QE++SSol6tcdYSKeGEx/jR0Xo/V8x5S9H6Je4zfIPHr1UXWd8E30GCmhwdCZEQikgaeTYu8rqKZoh/j6wmxPPPInnDtOAQc1LwzSOEYzL8kh/+3gKKnl4WDFIbgzCsmIkCC1l+OjaU8uJx/ltIZHQANl4kHBfp1g04rXfmA83LWOT2XCOYiiS4Z2Xn0BFohykP4OLi3IAuCVwRn2zPG9JLysyEDTu+Duq3mw9VqPFkNn/0J5mmyE//TWcbQws55kU6Kk
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9352f9-c025-4752-26d0-08deb721266f
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:14.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wR5TilkVSZckXPq2KT2ovn3e0Xtrv2C30qhKkY4yeLHfNj5oj330zdlWrcrzdw3PMOmK7scN5nef69SVGA30hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkgQ753wz1X4Xb
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: f64902ea04615d1566dde001f55d92a8
X-cloud-security: scantime:1.426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237494

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/775321

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-42501.patch                | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42501.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 85f75f0d89..03a1a81fc3 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -52,6 +52,7 @@ SRC_URI += "\
     file://CVE-2026-39825.patch \
     file://CVE-2026-39826.patch \
     file://CVE-2026-42499.patch \
+    file://CVE-2026-42501.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42501.patch b/meta/recipes-devtools/go/go/CVE-2026-42501.patch
new file mode 100644
index 0000000000..82b2fa02a1
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42501.patch
@@ -0,0 +1,127 @@
+From 52d8958ce7e102a5ebd3b4748aa03989b5469084 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 30 Apr 2026 13:10:49 -0700
+Subject: [PATCH] cmd/go: reject sumdb response lacking module hash
+
+Report an error when a sumdb /lookup/ request does not
+include a hash for the requested module, rather than
+silently proceeding.
+
+Previously, we would verify that a returned sum matched
+the expected module hash, but did not verify that the
+response contained a sum. This permits a malicous
+proxy to serve a corrupted module along with a
+valid-but-irrelevant sumdb response for some other
+module. We now ensure that the sumdb response contains
+a valid hash for the module we are validating.
+
+Thanks to Mundur (https://github.com/M0nd0R) for reporting this issue.
+
+Fixes CVE-2026-42501
+Fixes #79070
+
+Change-Id: I7d9a367deb237aa70cade2434495998f6a6a6964
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/4340
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/775321
+Reviewed-by: Michael Pratt <mpratt@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-42501
+Upstream-Status: Backport [https://github.com/golang/go/commit/1a9af07120312d368815712a4dce2dd2070342e5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/go/internal/modfetch/fetch.go         | 15 ++++++++++++++-
+ src/cmd/go/proxy_test.go                      | 17 +++++++++++++++++
+ src/cmd/go/testdata/script/mod_sum_absent.txt | 17 +++++++++++++++++
+ 3 files changed, 48 insertions(+), 1 deletion(-)
+ create mode 100644 src/cmd/go/testdata/script/mod_sum_absent.txt
+
+diff --git a/src/cmd/go/internal/modfetch/fetch.go b/src/cmd/go/internal/modfetch/fetch.go
+index eeab6da62a..75769d7c61 100644
+--- a/src/cmd/go/internal/modfetch/fetch.go
++++ b/src/cmd/go/internal/modfetch/fetch.go
+@@ -740,7 +740,7 @@ func checkSumDB(mod module.Version, h string) error {
+ 			return module.VersionError(modWithoutSuffix, fmt.Errorf("verifying %s: checksum mismatch\n\tdownloaded: %v\n\t%s: %v"+sumdbMismatch, noun, h, db, line[len(prefix)-len("h1:"):]))
+ 		}
+ 	}
+-	return nil
++	return module.VersionError(modWithoutSuffix, fmt.Errorf("verifying %s: checksum missing from sumdb response"+sumdbAbsent, noun))
+ }
+ 
+ // Sum returns the checksum for the downloaded copy of the given module,
+@@ -931,6 +931,19 @@ have intercepted the download attempt.
+ For more information, see 'go help module-auth'.
+ `
+ 
++const sumdbAbsent = `
++
++SECURITY ERROR
++This download does NOT match one reported by the checksum server.
++The checksum server has provided checksums, but the checksums do
++not contain an entry for the download.
++The checksum server may be malfunctioning, or an attacker may have
++intercepted the checksum request.
++The download cannot be verified.
++
++For more information, see 'go help module-auth'.
++`
++
+ const hashVersionMismatch = `
+ 
+ SECURITY WARNING
+diff --git a/src/cmd/go/proxy_test.go b/src/cmd/go/proxy_test.go
+index cb3d9f92f1..88e5052b89 100644
+--- a/src/cmd/go/proxy_test.go
++++ b/src/cmd/go/proxy_test.go
+@@ -172,6 +172,23 @@ func proxyHandler(w http.ResponseWriter, r *http.Request) {
+ 		return
+ 	}
+ 
++	// Request for $GOPROXY/sumdb-redirect/module@version:/lookup/...
++	// performs a lookup for module@version rather than the requested module.
++	if strings.HasPrefix(path, "sumdb-redirect/") {
++		redirect, rest, ok := strings.Cut(path[len("sumdb-redirect"):], ":")
++		if !ok {
++			w.WriteHeader(500)
++			return
++		}
++		if strings.HasPrefix(rest, "/lookup/") {
++			r.URL.Path = "/lookup" + redirect
++		} else {
++			r.URL.Path = rest
++		}
++		sumdbServer.ServeHTTP(w, r)
++		return
++	}
++
+ 	// Request for $GOPROXY/redirect/<count>/... goes to redirects.
+ 	if strings.HasPrefix(path, "redirect/") {
+ 		path = path[len("redirect/"):]
+diff --git a/src/cmd/go/testdata/script/mod_sum_absent.txt b/src/cmd/go/testdata/script/mod_sum_absent.txt
+new file mode 100644
+index 0000000000..c2dd814542
+--- /dev/null
++++ b/src/cmd/go/testdata/script/mod_sum_absent.txt
+@@ -0,0 +1,17 @@
++# When the sumdb returns a response which does not
++# include a sum for the requested module,
++# we should report an error.
++# Verifies CVE-2026-42501.
++env sumdb=$GOSUMDB
++env proxy=$GOPROXY
++env GOPROXY GONOPROXY GOSUMDB GONOSUMDB
++
++# /sumdb-redirect/ causes the sumdb to return /lookup/ responses
++# for rsc.io/quote@v1.0.0, not for the requested module.
++env GOSUMDB=$sumdb' '$proxy/sumdb-redirect/rsc.io/quote@v1.0.0:
++
++! go get rsc.io/fortune@v1.0.0
++stderr 'SECURITY ERROR'
++! grep rsc.io go.sum
++-- go.mod --
++module m
+-- 
+2.43.0
+
-- 
2.43.0


