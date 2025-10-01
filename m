Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FCFCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 12:32:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.114])
 by mx.groups.io with SMTP id smtpd.web10.16179.1759321964118688221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 05:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=RvxjKvTs;
 spf=pass (domain: witekio.com, ip: 52.101.84.114, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBM6g+cwSW3jv1qNDoQ/OQYHrZZhaJ8yCua3aiXFoPvuL+PpLl3X+vCcWYtm7MoTeQgw5OZRmdOa7e1UVi6Xrk7hCJQHRF0sW3XbPL1BR83mg0PaUfuSiAsx4dI6E7l10X/RkjqBQDIb2xfDRHmXy05gB+gZLwDABpFxXB+6Y9MXM4csSO6//QhPivmcw/LJ2FadEycayWEBGqH7s9+Azh1aBK6/j3CWfzHx+8IRws2VQf7qBSAVMjm2iEjqvw4c+zBzebdvF0Npa7wH+iQFrNn7Qzvpm22W2lqBeVfb87iGL2ZkbK3eYVbIIah0ARz/h+2zYB1HMK23yu4l/GmFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=eF0WNrtS+b7aQfylEkSKGnIGsiaXA4GktY4CU3CUOO1NPplcB3UBXUCn+nOHjmvkPQ9LVgmo1D7VXgA8QpObLWY1RFAiL8lgMVqGNeergD5Zm+m1196uaAq/II8sRTZQj4+alCh7hwdmEC+fwSTaclP/+ht1vbdi4tsBscun2dMwrYDZSXzSxWNsaR1VHSqHBid9wYgZXUgznmbD3b7LCnSqUHZSRJ0saKfxGcnoukzhwk/6fUe4wJSNw5J5vI8rUBEk55wEpLpbGZ9bna0YrHA9kEsQlkNR7oVEdgb3uT2RB0oPHBoZb5fz1glRv0AvxyRJ3/w6bgmfoS+bs+xQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=RvxjKvTsYXSokqtN4T5KT1gL3gkkIuARam6BGPJ9UzUN23LECo+I+Q9g8WZx019U+WFvi4SjpzYJSQAHwCnC2Sjh/v5x07HfCPcHNTbJoVlEnpYN2Zwfa25rBzWX2fqX9FJf6vExONfnY1I7zvkWw16otxIp86pARojHMkp6tSnjM1rMNgX9rkCSdq0AwF4cyhOgkVKw9ni+oZrL8wx+AtfXUGy7UjwOeGFwFECh7807+lm+6wycimXYuonDLj9mIcJFc1GPa1zr920gWH6Ry3HOjChgYyFNfLqIlVP79rs6ubO6pwFsgH+g7shqDNFeDm67h07dZKsv7fQizqGt3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by VI0P192MB2426.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:252::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 12:32:38 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 12:32:38 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: fix CVE-2025-9714
Date: Wed,  1 Oct 2025 14:32:29 +0200
Message-ID: <20251001123229.2609765-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::15) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|VI0P192MB2426:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dee3e0-4d4e-4629-1ccb-08de00e69b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AS07D5McsfMFJmpXkK7Dxl0gharmZ3wHS8tgH1MtvwyoA4o0M3P+hlroKBBo?=
 =?us-ascii?Q?eyoSIuNUFIuchX2Jj9ivBzTIUiBGdmU5U9bCCpBjwLVVnD8uEvHdSH35vIhq?=
 =?us-ascii?Q?1XrfD+cDQiGs/WlDJen/UpE2g/pJdu7cJ9aNgk4cfhMMZFaZXrN3rmLcxRlO?=
 =?us-ascii?Q?87VrUJy8U5yaYr8bjzpIdMokGuJAtC6UdB/AD24536iwBzrSWKjOQ9fMrBNG?=
 =?us-ascii?Q?82iJqGadR4B3mC8+PtdTd90YKRkvVbpjghpQcWuYpqsolp2Hbb83V+2pxhvA?=
 =?us-ascii?Q?3UvzBsk7rbAeEWqnLPUM94/Ggxx3Ue74L4HDojONzBdp/gMg5mt8kUG2iRZm?=
 =?us-ascii?Q?KWwQm9RjH8Nq3Wwrpb5Rr58lywNT+8/ul8Lzsk5gZA8Zr+CMwhsHYLphfGEc?=
 =?us-ascii?Q?ZH/GFh//3UmTwiQHMqB9+orjEAP7cAL5O5AAKspR9ninuVtuujbdRoQ+jrxe?=
 =?us-ascii?Q?Lsw50VS5XWJL+9THVOJTYVywQKAReF6sFY95iMjyoYFIsOw14C6nsJUr87vb?=
 =?us-ascii?Q?UnfgxaWe5t8CkBDZv2vrZRr+5l4bh2iZTat/fTbz+c9SbcO1gJniyhTBDwQN?=
 =?us-ascii?Q?ffJsaqmfc1BBE/OYp1P9nwBPyrNvkkjM6SKDXk3J/F2FLdLTpaRIF0KIocYH?=
 =?us-ascii?Q?ROahAq+dvc4NGINxcM8chGF3hr6mjPUNvn22F0za2UF3XoT1+1KV1voWCty9?=
 =?us-ascii?Q?hxJueu04J0nBCUC55TF/pJIsfKuxS8rj8SnjctSg8x602DTKd3PeRD3fS37R?=
 =?us-ascii?Q?0L+nsUi+bSqnYsR9CHAXEphz2ANYL/GT2QBzUKtoZdxoDyk0EiKkVVj9THqm?=
 =?us-ascii?Q?pXacD+ory3mBHZhZt2evtHQlzRZYf4N2scxvZ/02Gzq0dV/PE8ijYvTXXGt+?=
 =?us-ascii?Q?kIuhHvIc+hvFxepuelTQmQ3i2uwPjsMlqDrYvFgc1d5+gkQm1xAwZTUaX9Ot?=
 =?us-ascii?Q?iUB4wUMOTbdBpx/m0ubiB4Wrtt888V65qiJD4kGKpw+VPNfc9lwj4t2VDYYl?=
 =?us-ascii?Q?GOs34jGJGL//GXcpW4GsIdcddjx67XSK/Mx2QeASfL7ES1KHVt2h1R//OIor?=
 =?us-ascii?Q?nTRogastA2E4230AuioDOVJU6mwwScIhX3/cdennMVs9PF0BEcXZXDENzhIp?=
 =?us-ascii?Q?MY76kqTjt5C8M66HR4LSrQk8pqlq8YQTh42iytK/KvD2W0XSJ6fBY6eMIu0t?=
 =?us-ascii?Q?iVCeQtgzzV5KzMB3uz9KYru37wOYbLtj3uuRJCGJmYiav6fNHQX0Q7sOjaYp?=
 =?us-ascii?Q?nETJSDK/jPtj66bAEtLCHUdPuqLgYfdhu0n+mVgPEzL2GR4QKyDDFCeeEx82?=
 =?us-ascii?Q?Efhy5RvSnnbdvq7XoqGSXLpHUQfyShM9M+vDER7fzbykt0ZLLunlQQIMqRiG?=
 =?us-ascii?Q?NSbNLHbnjytePgQ984wutRkEFurvM9RXoooNm1ncDYrj/1nGjI3MKes3Trf5?=
 =?us-ascii?Q?aA6LScJcXezL+ADhKXbP+LV7hg2gWH0CdSwsCIFf1XM7W8uzyYbc3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?htNgYkBR8IrfiRWYEo/o/6u03x7OtOcE929a5x7S02vP1htrEui4Qj2KP9Ix?=
 =?us-ascii?Q?Zk0ueYTBKzTK0ceszs58BfIZyjkL05wxxOgRla5oXVtSCgO5w4k5qXA/L3+E?=
 =?us-ascii?Q?FJOxGZR2tO81GpvuBSzYv53UMDl9r/a9EGH0hmNzBoOlWSADZqgNGWNA6sEF?=
 =?us-ascii?Q?6Aey/df6zuxc0ug+KDQ5sisgCkEenR7zYlnHzZjZZL4yZkMdaMZ7O65Xi5/w?=
 =?us-ascii?Q?u3lpE22KEQ13pVfb0EwRQ5iRYy4dpuMrtfF0YkXwNEjeul48ju9LCtea1s1a?=
 =?us-ascii?Q?qw+Vn76jA/AKwIl9fkC6fKaoiMmQyvpK+9BTxA6lKFJMKB88m364874aDxOr?=
 =?us-ascii?Q?S7YZkaRuTb7tZNk/cfS+SKa3ct2WKHndgQxeCffvpw+DkroDg6+b6QcU27+S?=
 =?us-ascii?Q?AvLRKJ6XojnBBr/A4m8PEjAE1SW1PJPHzvZHrOgKf9GWewuyvzmc/irLMXOE?=
 =?us-ascii?Q?+axgAqO3IjvIy8+NjlP9HmOnKLVofGV4et92ad8pB+K+3RHngLBETuqZo/wv?=
 =?us-ascii?Q?a1dTWeHwRHQm0acYztG83CvvJDRF2mWdf6XejIua7TdI1TMf0kpVInI86WPg?=
 =?us-ascii?Q?UBSPmCMPpNaxoyvb2Bia2k8KtDNpbM5pMKORuybQnQuE3mwUjOLElLly9/Ma?=
 =?us-ascii?Q?pw1/KHhQa05ROxr6cqlcMGSA6oQEfKreR3KOy7sWobtcwEqcCrvKd20q+597?=
 =?us-ascii?Q?VfmywK7zRxV8ZI7avn5K4TsN9QUWSfzULiPxvphMVj7tg5LOCD26H2O5+vk6?=
 =?us-ascii?Q?BmRkZmFq2hSoxUs4gXTf8TpCX/v0Er/O3yUbPJ11cldSHLIUfY+VTOHDioIz?=
 =?us-ascii?Q?Ez6+INrr5h7/ZuGPMD2qD90PHx6xzE4vHSOhfhA3HhvNALLs9WuHV7eu4NE7?=
 =?us-ascii?Q?vDBk7bvdrZ3bl03sjP1FZgMy38cjodSM2wpK8IX4DVYc5MUWEAy1f8jkLua2?=
 =?us-ascii?Q?pfaYaMS6bXGFAiKMMEH/uqIYTwjDG6r4IZYJpQx82EPMkrEjvS7b/6YR3AyY?=
 =?us-ascii?Q?UyNetRuM8HWl8OATTaaR505RLvoxRNWhKM8OVuChf0ABuX4F3vThluY6ddtx?=
 =?us-ascii?Q?R2+FjEqltbil2odsjc9zJBxTcKswHBnqSwHdeEqojt47txz7Yk+7T5VTcIT8?=
 =?us-ascii?Q?h7b3T40ssh/uRNkxK0os4D6HLRc0D2I4n1VmqQtn3KHdGVMmTDNnwfr6mdto?=
 =?us-ascii?Q?ycCFCkkeNpz7nVYQGHTfOk1kjrmbvDnp8g0T4qDipTd7Yyxmf/rfY72Mv4Qv?=
 =?us-ascii?Q?aXjI+mtotj5GffK1JYhTWJ9oz3aq0DIcHdfP3lDxRusYPJwy5yH1LoF+5PqP?=
 =?us-ascii?Q?GvwbVwQMlSSFSeUO9q9WNIQWLfP8dTAR5hcYGtMYKkTPph+33HRwbu0C5zXZ?=
 =?us-ascii?Q?IxQdrq+jRcP94tDiEvD5oQsPz/yRCZNyy45WgGLRiIAGFSVlISYPvwuE5phi?=
 =?us-ascii?Q?tDAF79Auc21A5EWSQn9EZEncAb1pYMQ/mxNz9mXCmXCIg2OefYb6yn8i8TR2?=
 =?us-ascii?Q?BqK3AHnSZ7sgsGppZqeE3A3u3yt146t2pc9vvBrAIhoDS7NXig8Ub5L9Ls2M?=
 =?us-ascii?Q?a5ggQWmGBwe+k1EtCW9930rV/hYalzs6aR5FoU2u?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dee3e0-4d4e-4629-1ccb-08de00e69b75
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:32:38.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH6xezxDXj/MtN9707fA2A7VPCljZlt7COSxkc0KLY8kqz1EDYNvB8iWzNfeOBAER5ZpSD2iVBYYx2kAYjFliQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB2426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 12:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224209

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


