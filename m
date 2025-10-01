Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2CCCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 14:07:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.83])
 by mx.groups.io with SMTP id smtpd.web10.16025.1759321465119139399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 05:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=cXFyh0r+;
 spf=pass (domain: witekio.com, ip: 52.101.65.83, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDqVM1fndH6z3q7MpiFocFzyvPKI6Re6SjBPNJtnX9j/kP7R6+xih1LaFbIvkHH7fm23RKJe5KX8A4tImwtFbhi+8IwcvPin1Y9cXA8srXkCWsDamAGrpJaA/sGww1Ia904Wyiv3u8DSixo0rf6tB70hvkifTrbOYrSOTO8zlWYJ2+T+8CesCkWeKmdnqF3nBn5B7hoS9LAcJlF8vnr40a1QjBZd+kMKc/lgFWCVncDRhz9ZmTwuNcOT8zffzOw8vGeWgSIt97rVSXu+mOvSPxBj0umUYqTlGD7dOp7FhC87BvPwts3MH+ihsylr7u2MjoWVwMHVnYH5vHqOPQj+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=RaME848RE6CUJ9G2VyMxLuiEmjKjYUZOMigf4DjNb+7CX8Mni/0+xI7NSOXStokK1Cwqcnf4xnYPDjzFslv1Fmwh2bgn0rA30a4sFHvMXvk2WTK+rguUj2LChCj82sJRv4JbooQ87rYCF7yWrARscpQOrm1O6AUUER6IQvIk1gkUR9n26uoIVayQAvpjYQvy3Dm24clpRGpq2FU8C9sMwyJU0GUEDEinGHs5qoeBjwU9eakkPFt76+2PYVES21LrTRDLxAYigZdaknvEuCwzN/RXmgKVwOr7n3vpgsx/9ZVa9qZKYjxkrg5THs5CJZzlvd9ssI1uck3JKnD2WICBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=cXFyh0r+69SSwY8TjCFSY+NyJtckDRH/AU4/R/q2cTM8QB+EYwDJXAbcMkcAU/gbA4j0enkp6WYeSJiE5O99wW5mRH6npR+n7bEIMFwMOy7JMIPRt1R56H4sUGoLPacP7Sz0JoOjcp+ATL9HlrEZX6ZOX9IW51kU52KW5Z6jhKpOESaFMo2FwOR4bf+ptZXLzsap6KQtP9h5650xm6YC/nFuQB8QlgCKeVXSlj9T4/oMX63tcDZAmbtA50BV4eyJD8coQImyI/QjK9Nu2PAhOvYbyQb44mhhE8jpsP2VPJzIIPw8yOffJjXWYHn3tTR8lhGwFd6F0VJKyE8G0OwgiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by VI0P192MB3329.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 12:24:20 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 12:24:20 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>
Subject: [kirkstone][PATCH] libxml2: fix CVE-2025-9714
Date: Wed,  1 Oct 2025 14:24:08 +0200
Message-ID: <20251001122408.2607552-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: MI0P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::14) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|VI0P192MB3329:EE_
X-MS-Office365-Filtering-Correlation-Id: bdecf13f-56f2-4a9e-93af-08de00e572b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qGv/6YhfNNLfsloaBAYh944F5RwxAFv4lnfNYyZmKUYK56yZMVXf+ufB7AMr?=
 =?us-ascii?Q?8w6JgtvN3Z0of3k/LJ52cqM5eBkZm0CYO54ApbCagiDsdJ4LCNd1w+1FOYDF?=
 =?us-ascii?Q?w+yS6pZPUBZEbuBG5xukw1fbS2GgHw1TP68CKO1kJsm5zC17WNGMvdX3F6Mt?=
 =?us-ascii?Q?4b6iCDedZZv9Bqmo5Kcuswe1ZyWv5NkMCVXm/DuoLTGGlKT/d7bNX1FTyBR1?=
 =?us-ascii?Q?JakPEtHWH4V69oHYH+Qco8LSX1x3zMdi64dOwsoCmRgGQFBVjS7CIrTkiKJo?=
 =?us-ascii?Q?vCiGOnY9fT07uZxjEjMCNFWJJDAMARUIyF5oSehovRDnBhPd+a1xLjyGvN3t?=
 =?us-ascii?Q?OR6KqqzjP4AD5tYDpaJULIjKffFAIL3af1AoaCWJyKov2virA0Fw4sbPXbt1?=
 =?us-ascii?Q?ldVIrMqFUIlLnjtc3JQdvu2nbOfKITyET1F6QcuPdymierX9z9ne4ST8+of2?=
 =?us-ascii?Q?qrvpGPe6/JUSgx1Kj1e7Ig4th+1U2fq+FuvRNnc1quoCdlqx3NskgTTzmkeN?=
 =?us-ascii?Q?oQZkU9chNWFX7EFST8Z/Mxszi0cc195fF7VbB+Z51B+LMkq6n+2w0AMkqW7N?=
 =?us-ascii?Q?bO4rURtVvTHxdhcIBNlAtdNFcjE0N9C2hkQxszqLRwWU0BPL/ceFeMDMrOTy?=
 =?us-ascii?Q?EyJaqzEf0Qat2H9wnHclry7wIB0euJHzo/4LYhYX8kOsEog9TkEzasAs7+cN?=
 =?us-ascii?Q?yGchiezE85KP5NbTYbSiAkkyoeptj6MSH6tPnNhIkeDi2+bvELWz9ZqWH8kT?=
 =?us-ascii?Q?PtBauixg8SV8fyWoFuijRz3a2F2jatMeV1uJSOWDML1T16fgL51TA4oZgDQH?=
 =?us-ascii?Q?m2aULWkGLB0L5VbIh7RQ/b6tjLGonDgXdrVGoGoxe/gLuvdSIYtBLx/nPQx0?=
 =?us-ascii?Q?K5Y1ZaOFfYv9kZ84uRVIm05zO+6nEjzH3rLFRMiOZ2tggXIWXetSJ4hDIgK5?=
 =?us-ascii?Q?FN7Hbhg7xJ32q6ruLRJYexeVS2YKD1I+vuyBCAnAJWxNLL6mhE9rYlAVOWfo?=
 =?us-ascii?Q?sc5oxTw03T9sS6jEE3VH/nWWgpz/RQuGt3fxpBdgqXUehzCpnPsy+kaS0ox7?=
 =?us-ascii?Q?/aW02CL+J8QwBMemHWcxZr9MIwdC/Zk6LH8A53yD8j24/gzBmGD97FWRt93h?=
 =?us-ascii?Q?xtUvGEIDqVrib2sww9CherCx8HPJhmKmlCASo2UKdgpammrTxXUXDrK59SKU?=
 =?us-ascii?Q?SMdWmV/Yq2kdE5X0sthgn768cTE5vEaSxSZn59HbL1D3AqVAfdk/t2o9ulIk?=
 =?us-ascii?Q?GeYeBWcFgS8QKdEG5+u/Mrhg5XVC3oaacDeK/J/t3V2jRBRO8n3BAwU81IjM?=
 =?us-ascii?Q?BK7djaePC3q+cC3+RB6IgdkEn6Kmsa9cNVLNYZipt3L3g9ZDXb+4G7Y+w6T7?=
 =?us-ascii?Q?HbyAz8g70MRwJgV9ohwBLby4adOdq49sFsbxMpI0EQzfLDfYsv+R5f9/wxKE?=
 =?us-ascii?Q?4kwjv1EUxp+rBp0ZR/SwXBp67kag36sMblD8OZh7804Y1jT7HF2UkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o5DOX/2I4Av+iDBaRbLQOxjfET3EFir+XM9c46k6PVtoaNtNCeNoEH9KkQia?=
 =?us-ascii?Q?YxMThJ8lie4Fc7IhYT987SQUIrNU90MlzbBQBheP7k90fpDg0aFyl1cRZHt2?=
 =?us-ascii?Q?tj3JR8aNyCXfFXpC6q9tOO+5FRvfHR0vqOpU94ML18+UwjR9wbHBfcWbQSMu?=
 =?us-ascii?Q?63Z/T0Z5McyZDLvaRBtni1ce7J4f3yPE0bfNOZxu3Yc7emi3jF+hwN9XSdjL?=
 =?us-ascii?Q?Q7yrLVP4DmYdiuFbYE3bMDk/eaonEWLPbU9TRkFyAkQ0tLf3hiQBSFVUd1t5?=
 =?us-ascii?Q?x2DKK7oXBFf+8aLQX+jBz2oEatc72fse5SFacaUxzSoLC/i/Ye3/UwOVPFMX?=
 =?us-ascii?Q?w9uskMzjcbYPry8iMPakInfEtpxnDRwQgZ26IBMhW0nx/wZu3bdd8f3/8K2b?=
 =?us-ascii?Q?LCgXIusp2OLVBu03DoKW3ewyPpaRINn3kWFtKwB0JWAzTG1MG1tbn/wk5iiK?=
 =?us-ascii?Q?TyLXFK6og13QRKe+hlXSGdXvU9CNf/DB4ap5f1EHeMzqvsgAE2HfKv6brYV1?=
 =?us-ascii?Q?CAajUA2mtKnESII5WM3lyBCy6hiPrTpkGMedBriQKKd2myz+l0qs+IVeS/T/?=
 =?us-ascii?Q?/Mf9bcM+kz1pfdZOOuBg+hc7q13cCgwA7211KGOM1qNFDVuvkU5GJlSfz8ZL?=
 =?us-ascii?Q?HQ320IAwvlKZhbYWcH9kG9SffcEvrb3QOH3G7DV6moC1LpQth299MIarjHal?=
 =?us-ascii?Q?wdmdJMGXdZAPKpY+airNenkBBbwPPZCMPvWRjfsL+rJcIaK6AVhA2n5QzQq3?=
 =?us-ascii?Q?QF5fE2gtLlKVGYuihc83DZZ4Ka5+zXheT1jlZaahyjIHu/A5nawxsDfVRP66?=
 =?us-ascii?Q?7jYBdYO5fUUl/h7xMWxDjAXnhuyZKr9zmH50nCP4hcBnnt5J4FtbELaZAp/A?=
 =?us-ascii?Q?EYJfGg3RmwSrmzWPfXlZFJ79eiU9Ry2gkou0/zDbfobC0luqVjxQFpvjmb4C?=
 =?us-ascii?Q?fs9jPfpt//Og/IDUJ7WpXorLC7nUPRJB625u0LzKumEChz/h5xiEe0v0Yolf?=
 =?us-ascii?Q?74ubV026tctA8wGtDiMN8o+gmdQDrqPrZ4sGlqzTXK/5wSq7D4u7UoChzEe+?=
 =?us-ascii?Q?kCBd7kOvH63OEGmsccWeOpOnZNSTKbJXQW0wSXUeDmCX012AsiNpLB8TUNAW?=
 =?us-ascii?Q?dghI8keOhO0QZsMBlkX2AOSa/mhAbi0qqtvDBIBC7wAl5Xy+IjfNerqCNw2A?=
 =?us-ascii?Q?0hEYpmxrsD+1QYhbILWUPd8l6ph46cZ9Qw7iExpxZgujYQqJMnAZU4RjxK/+?=
 =?us-ascii?Q?R+aUTLGfKVHfWdATIsLhWUQyAhHg+5J7DnaCzuEYr45n0rPlWihT1Hddr1Hu?=
 =?us-ascii?Q?4ffSbtKfZpBNjGNtlejbH1iwFt18fpREFXB/hKGTODdc/X2fXEpSnwKS6nWU?=
 =?us-ascii?Q?8mC6XGMCNI7Vsf7SixDs/bvcjunpEsp1fq2ML6aWDgIvisftIShd4ykj6siY?=
 =?us-ascii?Q?17MxwBsAuCgM37DS5/pUQoOQVPDWp4Ze+6vwJHpXBZNFqy+RRnDLSwo/TYG9?=
 =?us-ascii?Q?CA63CyX6IYQTIhgalLD5rvK6OJVEzdo8836mz5eg+sIs1sCfHF4rwziMVd4Z?=
 =?us-ascii?Q?+NHPhxe/60O9VIss7B+5OsKjyikQMU5Ff6BMjtla?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdecf13f-56f2-4a9e-93af-08de00e572b3
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:24:20.6109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaQ14ydh7CYlI5IDth5ipRLaNdXPo1Zhe/IJ36CN8Iz2bpR2M6xXCQtZ7mkcN38FH5XgfZNWTgW+waJhXkNOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB3329
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 14:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224307

From: Theo GAIGE <tgaige.opensource@witekio.com>

Upstream-Status: Backport from https://git.launchpad.net/ubuntu/+source/lib=
xml2/commit/?id=3Dff48b80d7ebd968eb9d4ee2d6cb3174959ad871a

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
---
 .../libxml/libxml2/CVE-2025-9714.patch        | 117 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch b/meta/re=
cipes-core/libxml/libxml2/CVE-2025-9714.patch
new file mode 100644
index 0000000000..99e0c7dfb3
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
@@ -0,0 +1,117 @@
+From b2c6511bd90063652ca1f8814f98ccae9dd24026 Mon Sep 17 00:00:00 2001
+From: Octavio Galland <octavio.galland@canonical.com>
+Date: Fri, 5 Sep 2025 12:36:12 -0300
+Subject: [PATCH] Make XPath depth check work with recursive invocations
+
+EXSLT functions like dyn:map or dyn:evaluate invoke xmlXPathRunEval
+recursively. Don't set depth to zero but keep and restore the original
+value to avoid stack overflows when abusing these functions.
+
+Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/libxml=
2/commit/?id=3Dff48b80d7ebd968eb9d4ee2d6cb3174959ad871a]
+CVE: CVE-2025-9714
+
+Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
+---
+ xpath.c | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/xpath.c b/xpath.c
+index c2d845888..028471d53 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -13883,12 +13883,11 @@ static int
+ xmlXPathRunEval(xmlXPathParserContextPtr ctxt, int toBool)
+ {
+     xmlXPathCompExprPtr comp;
++    int oldDepth;
+=20
+     if ((ctxt =3D=3D NULL) || (ctxt->comp =3D=3D NULL))
+ 	return(-1);
+=20
+-    ctxt->context->depth =3D 0;
+-
+     if (ctxt->valueTab =3D=3D NULL) {
+ 	/* Allocate the value stack */
+ 	ctxt->valueTab =3D (xmlXPathObjectPtr *)
+@@ -13942,11 +13941,13 @@ xmlXPathRunEval(xmlXPathParserContextPtr ctxt, i=
nt toBool)
+ 	    "xmlXPathRunEval: last is less than zero\n");
+ 	return(-1);
+     }
++    oldDepth =3D ctxt->context->depth;
+     if (toBool)
+ 	return(xmlXPathCompOpEvalToBoolean(ctxt,
+ 	    &comp->steps[comp->last], 0));
+     else
+ 	xmlXPathCompOpEval(ctxt, &comp->steps[comp->last]);
++    ctxt->context->depth =3D oldDepth;
+=20
+     return(0);
+ }
+@@ -14217,6 +14218,7 @@ xmlXPathCompExprPtr
+ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str) {
+     xmlXPathParserContextPtr pctxt;
+     xmlXPathCompExprPtr comp;
++    int oldDepth =3D 0;
+=20
+ #ifdef XPATH_STREAMING
+     comp =3D xmlXPathTryStreamCompile(ctxt, str);
+@@ -14230,8 +14232,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, cons=
t xmlChar *str) {
+     if (pctxt =3D=3D NULL)
+         return NULL;
+     if (ctxt !=3D NULL)
+-        ctxt->depth =3D 0;
++        oldDepth =3D ctxt->depth;
+     xmlXPathCompileExpr(pctxt, 1);
++    if (ctxt !=3D NULL)
++        ctxt->depth =3D oldDepth;
+=20
+     if( pctxt->error !=3D XPATH_EXPRESSION_OK )
+     {
+@@ -14252,8 +14256,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, cons=
t xmlChar *str) {
+ 	comp =3D pctxt->comp;
+ 	if ((comp->nbStep > 1) && (comp->last >=3D 0)) {
+             if (ctxt !=3D NULL)
+-                ctxt->depth =3D 0;
++                oldDepth =3D ctxt->depth;
+ 	    xmlXPathOptimizeExpression(pctxt, &comp->steps[comp->last]);
++            if (ctxt !=3D NULL)
++                ctxt->depth =3D oldDepth;
+ 	}
+ 	pctxt->comp =3D NULL;
+     }
+@@ -14409,6 +14415,7 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+ #ifdef XPATH_STREAMING
+     xmlXPathCompExprPtr comp;
+ #endif
++    int oldDepth =3D 0;
+=20
+     if (ctxt =3D=3D NULL) return;
+=20
+@@ -14422,8 +14429,10 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+ #endif
+     {
+         if (ctxt->context !=3D NULL)
+-            ctxt->context->depth =3D 0;
++            oldDepth =3D ctxt->context->depth;
+ 	xmlXPathCompileExpr(ctxt, 1);
++        if (ctxt->context !=3D NULL)
++            ctxt->context->depth =3D oldDepth;
+         CHECK_ERROR;
+=20
+         /* Check for trailing characters. */
+@@ -14432,9 +14441,11 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+=20
+ 	if ((ctxt->comp->nbStep > 1) && (ctxt->comp->last >=3D 0)) {
+             if (ctxt->context !=3D NULL)
+-                ctxt->context->depth =3D 0;
++                oldDepth =3D ctxt->context->depth;
+ 	    xmlXPathOptimizeExpression(ctxt,
+ 		&ctxt->comp->steps[ctxt->comp->last]);
++            if (ctxt->context !=3D NULL)
++                ctxt->context->depth =3D oldDepth;
+         }
+     }
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core=
/libxml/libxml2_2.9.14.bb
index f34b0c25ca..932251da98 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -42,6 +42,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20080827.ta=
r;subdir=3D${BP};name=3Dtestt
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794-CVE-2025-49796.patch \
            file://CVE-2025-6170.patch \
+           file://CVE-2025-9714.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "60d74a257d1ccec0475e749cba2f21559e48139efb=
a6ff28224357c7c798dfee"
--=20
2.43.0


