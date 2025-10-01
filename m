Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333C9CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 12:32:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.84])
 by mx.groups.io with SMTP id smtpd.web10.16162.1759321931879451311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 05:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=Og6mJwpj;
 spf=pass (domain: witekio.com, ip: 52.101.66.84, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4p8E3l3g+EazShsGKFUmlD+Ogy25A6lD5o59Bvah7EHaEm2Qs6/ty4x7cKnRyLJuhCvcmLmHdt6HpnAw/2agM93dO+ooczUZ3CERnXoWIv3vrplgFwJA+I3vO2iyRJWvUD592uSVmvuvr7hJsC6xhRJoqjzODrbAVzWVqEK27IymH5vnEJeJNheborMVqGzZNhXcOe+BdmNC6Q+s1tAwfUCwtDFrgoFWj9AuctwYdJc9GBRRh4Zft+ToxrTcUSLbVyFDioLUWYkecG1tTpkCYmtxplqLnHbAjJrQQoLfqbuv6zDzYdM2Ay71O1/WgcoGYycQUAuA7tdY5cI7EdLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=nx1SeyibbkFKSA7y4ljfoGX+htelZ+KgHzrL2kL7BdkguElvJ3BYsOvKsvLjPXP3dquWdl5FqwUM7XkHbJmTttf7YzRcZqEXVw/y5be/I9V1FdsOl1EwuLOYhThRVt5Yp7JXBYR+wKRcjTmP2oI8zQ0x+2c5WabUtPzDtd5bq7tsHFJUkoBXXXX/PBzk9XAtPr3O/2LZHb6ilkRyva5G8xq7NhKCCTeMqLgtfoBkCUX9D64n+YgphsflSEm8rDB+ueBsSY3H6s2ByXvazQMJjjS/EUP+W06nE0khSfi+6ie5+0Vm6Bjqk0cxtEUcO1wXORXjzbpsgN9+Zu0HBGuiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76XtJxDtctWdA4sPU7Kvd0pifdPW4nYnAVKt8sH685Q=;
 b=Og6mJwpjCr3huNukDi2b3lQJWcWB8zRopazKkMaSUc8aT7dzbY8xKSIhwn/KN8DT9r20bBd5yZasEO25SRjHlsZvAmASU8dYm+uTjCBC7sOkLP94PJNfXsoKvSXLBp0RUAjksXUVEEYr4RT/UxGc1zuKILo9aa4SKZxLE15fMHfC1oW53ZZP6/v2zs6IvkOZHIKcqvGT0hzmiJR99+OtggUKbTGnTNUM9atIsFwDmy4IvkizZp24Pmus5Lbnhsq1eIb5kJnqwynwmUGnUioBHAagCS8+cRGoAvHP/EymE4kf2DQS/+OlMR595I9pgEPEFFM62IMyfMi+k5VqkN2c5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AM4P192MB3252.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Wed, 1 Oct
 2025 12:17:06 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 12:17:06 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>
Subject: [kirkstone][PATCH] libxml2: fix CVE-2025-9714
Date: Wed,  1 Oct 2025 14:16:49 +0200
Message-ID: <20251001121649.2605064-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0017.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::13) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AM4P192MB3252:EE_
X-MS-Office365-Filtering-Correlation-Id: de99c8f0-07d8-4e67-5e52-08de00e46fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r9cRAMZzZbvGqigHjjPAvHZuN3MuJc1lBzuApnux9T5Fy6Bg7rCR9EIWe7ne?=
 =?us-ascii?Q?lAl5BVIiRvQOk5c5FhVtkX5NebAPG9+FOxmSHvJwCAS+Yo6PB8pvfLF/K7AI?=
 =?us-ascii?Q?3wRQOYSBHEDBIAmcZPBIACbTF62z4kfw+PoDHsc0Kz6A5RNWQTxdkcdxvdza?=
 =?us-ascii?Q?q115HSRBlAPOwSQj51ixU17wkc9o+zVGqsHisCS2VugzzljVzg3/9UHE41p6?=
 =?us-ascii?Q?wn5FVojpUTatr8vGhLL/fur5A6s7LBGHz4bve29+TyX/1z44RP+Nq7DWZOrQ?=
 =?us-ascii?Q?vq8ZM5+NF0a1h1xo2hF8Qkx45kkt6PS0mguswW5ehJD7mI4V5nDWeW+Xt6Uw?=
 =?us-ascii?Q?1O/HKdtdUAMv7ZobKjv7NcXwN3p4bUQePpmKiQMNO6SnClGwGHZT8ItjDczo?=
 =?us-ascii?Q?NklLZ/SG+o490kjJ1CVrSe/5PXDjtUAOOHdrQk/Kz8lAn5UrsooDirHeQ7Gm?=
 =?us-ascii?Q?IxFavYmGM7rPEIuK8WcvWhcTPbD3rsJUcG3I+5sBvNLE6chTmQBDNLAIvfDo?=
 =?us-ascii?Q?TxtEmZ6lv+WluN360XrvIqGWOo7iLtQikzWfjUAoDYYfIgfe1fIIgRBgXwPv?=
 =?us-ascii?Q?T+8Gbh4ovQwwlsR9WyJOfny4TczPDIChc2N70z1CpPXe5IB+rpOCYR8xWvXl?=
 =?us-ascii?Q?fMIIWTboMy8wPjY1ExUuCFqc9jhl4A0ohp6tEJ0n9Ei9sch2WDENL1u+lvJl?=
 =?us-ascii?Q?qSup707Sa8qAD3rZIVzez6ZAZgggai0hwtq+AVIAk96/M6dftZ9g3mcNbLY+?=
 =?us-ascii?Q?uCEtlQFz5ria6F1EkDbJ2LNXmGh7++UaI3bTWWfzVJ88WL/5cE7ohwVE/Mzm?=
 =?us-ascii?Q?PErogJw7xoPoUBLotUWyvgRHHVk/t9cYg4/6xTDlmrFTMtgv/q+47YTY1gaM?=
 =?us-ascii?Q?9Bv4vRsWd4vMhhyJKhvMcmxDnLED/PmGNnXUV9hAOtPYPSzTuUqs9QhzJUjf?=
 =?us-ascii?Q?4X4PWKNjDNLw5w8DA5bPFi+S1iyVL9RaaFXdkIPUXCxM3FjDxByNNdRk+N3L?=
 =?us-ascii?Q?fmZUFMqQ5TdDjaHdCwujOBluSk8qWWz6WNJM7h3Q/hA4JvmYsvmwb0i1mjF/?=
 =?us-ascii?Q?rtx/pM3ekgQY3L+t3ABmRvTT7puHXnzcTg9X5nI6edqplfLmFQZTuUL4ESub?=
 =?us-ascii?Q?irjBYdIgPxSVhdJYYIib2vHdZXlsPlHeZBsIcgvPkK1aKJKVX6wzQOCgTiKo?=
 =?us-ascii?Q?naIB1K9WmYKJgJILpF8XQBLVK9I8l1le4z7EVdSHxgaZ13/6OmNEZx4u7ytn?=
 =?us-ascii?Q?xXyWxn/suj+rwKWcNq7i7OwoE1QpjKK3Gs2h9YDNTxu2LyCraKT36svMkVuZ?=
 =?us-ascii?Q?QfcT5su9eg7JrFJ2eZGXdnbhYAFfNn4CGojELOOJSSV5WF4GsIuNlriyYvrn?=
 =?us-ascii?Q?Q50RGw/YPXYtUdfs3zYRr3yZz98m35zb0lQxbHR1aZWjsszYuL2GRkhLvgVR?=
 =?us-ascii?Q?R+9raEUq3DbkZ5mpvIuvr9tTWrapbVpEPWazP9OBlij2E/em7ST0WA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x9iq9zxJxJlAE5vdBBeKQ21WV4J/oEZA+pbM/sTk3/GhHPhdvyt+0pLO9eGM?=
 =?us-ascii?Q?DzhI9NyrwQyQie+z+MfejREAuzYb8SUrhzwyS8CdxRiUO9tR/Bhs3UID/RAB?=
 =?us-ascii?Q?GxVfkmIIGp5ooKqwUM+ZDb93xRB8ihc5FZVjjC26l6Eyxxx7NFM6LVEoSNac?=
 =?us-ascii?Q?IlF6zPs17It3Qf5mpP1JpLkNPQl5XYxVk+vi6xsVyYUu/d+foLVszr3bmQcQ?=
 =?us-ascii?Q?Ru0R7r8R75wDmN69ynK/DDjiGmPY1Iqa3LuoS9M4OcoVwUC//rQ356jWRcKp?=
 =?us-ascii?Q?Ru/2f9OnXN/2zAvsnf+jQg7uGp9q0mVFeN6stjwsTuYJExma0whkGgvRDOhx?=
 =?us-ascii?Q?rggx0L0GcNV3qbA6ybaVuLBpXc/kISskaV8ICkyQNgIdAkoiUN8wZfIFSqG9?=
 =?us-ascii?Q?bHzlstgPdtwHjs7MdO+Xy26ZWvowFlXuSND+acnxmMKtx4CkN8FsVihjhVmZ?=
 =?us-ascii?Q?H8OQ/xEQkD6cSdTiXnLy/oey5uZYklHiWEA8ShlK8dIHTCubUc0hx1OO+XPr?=
 =?us-ascii?Q?gZm6/yuxB29ET85yv0xiuHKrwKxgRTz5FyweNBLNnsNGrn7IHTHV+qX03va3?=
 =?us-ascii?Q?LTrDbQlyuXEtcK2EygYcy83s8Fv24IlHRUPFE16RGlQgYvT7m0/a1FDLqSKg?=
 =?us-ascii?Q?VMeWVIUBuctBfKtuyaQFRpGaSkyAmUOSwUU3CSdAtn1AqJoiFE8oDzudQpyz?=
 =?us-ascii?Q?8hgVNAuem9Z0hFnyZ6Y+6p9Z4vN644iK83ZHgwKcJcl+mkwoOFGBqEljPFe5?=
 =?us-ascii?Q?0MYk3BqLSM+TrdLy4qhWmeGXsHZW1DsI0ff/VtwUvhe84WxSdx4wk321vwT9?=
 =?us-ascii?Q?WanpmJ+37cFreulsndGcmnsYu7Rsqkq2n9fq4XuwFHbNxfpI3vr96iGQvOXL?=
 =?us-ascii?Q?7L72i0TTwY/gWYH4esMss4ooWzou80n2REhts/hVWaReMmdL7ShAagZnHgm3?=
 =?us-ascii?Q?cRpjHw8PBL3+dFfmIxyBCx+xBZvDNa9G9l7l6HO1+2yhALRTsd3Fri+UR3+S?=
 =?us-ascii?Q?fqoBEA87+zTo2UcIYIWvYUWyQT5Ctz8YErfLnxJkv17DgfPG7uO+hocXlUqr?=
 =?us-ascii?Q?AsN0XJzkLyQXiL8TXag/jw76JyT4YG7x/8oa1KimQNhQbTmjodPSqccRXgM+?=
 =?us-ascii?Q?bm7AzNfeDvK8Octs9sMkJZHkzDl2YdpuB8iJcCGJvezB9/CsA6Cx3njw12Ck?=
 =?us-ascii?Q?BKgd8QrhfSDY/dKPKwlq9iz76Sw7I/PCOq2X9ON4QKgGx2U33ieidNhrRerW?=
 =?us-ascii?Q?FhKLZwjYOGqeFMdotqMPMXDP4usxdwAAtJwQsvpAYkMlTziAkzEH0JMO7cbH?=
 =?us-ascii?Q?vGIl2+hvBc4n9iBevkk/H1RNnpZ2YH4enVQrCmlWDZymhl+Q9os4ChnI7jk3?=
 =?us-ascii?Q?+sqS58+OuJHYW2k87UqmO6GU22wJkL5TylLXPgu2BAGYG/ylmgssxxxi+3aw?=
 =?us-ascii?Q?eJ0ctwEvhrT9jnJOG2VzfFL/ewsPGeYIW77RkxkYphIfFaBWDBGAwakBe756?=
 =?us-ascii?Q?wejhZGgQMQXR9lUohCI7RDwNUz0JufBwlv3lfCeDOGKEGM7ROHCgR0s03z8P?=
 =?us-ascii?Q?+Bic5vWL9J5upx0C1LqKZZU+1wpBNIJTbLYMS8tS?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de99c8f0-07d8-4e67-5e52-08de00e46fef
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:17:06.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/vQWGUL2rJQISMleQVRQN3sgJxvrgAVzvzJbdfGHHSinGeGXoJaYg9g9uYcifl5yoHiQi7XX3vW4DOhpPAZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P192MB3252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 12:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224208

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


