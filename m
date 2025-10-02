Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAECFCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 06:59:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.97])
 by mx.groups.io with SMTP id smtpd.web10.2932.1759388337515458511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 23:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=dIkD1W/D;
 spf=pass (domain: witekio.com, ip: 52.101.72.97, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8oMLlRlrP2zUDcufejwzaEnqaxvyR2tnaAhIayz04ETyM8SqU6siCgpW3TfXWI83Y2M0SoUhX8a+Vstr/GQfKXXxfFJ1VQI0wfjhVDDbPDGZE8gH5p/VYE9kKEgcbrj3thOex1KgrpehabwOjDnpY7qcrFN7beBnt2XR15wAVkaq5WsxGKNgHKPW/KfLb74M6TS/TdolR0B05wNuMcZJV32lswE0ddyseDZaRBUtxL0DuNsF/44NRT5yM392HQ0cAiy5e9kEQTLatBXsOnyJUa+W/bRlTGGR0zZ5Hm4JwgnSi8Sq0lq+FE+8ECtdBQEiLWMpvGcaA/h0VYnQ3CQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTor193wnzvAhtzUFlWrIO9mt9/myYiBcsxGmo1dYak=;
 b=MISi+xnu8evqfZ/gw5LI6O3cgVUI9xLA7HaxHQxcLvlHBWdOUuDbCzaEKESRoRGTuusWyWbcRLFXaDOny//CCw2dCoOSgJ7MMCviuiDkxS7PGArkd5V4XPMKeQ28ASpga46GA5y1TN90G0w1UsuUXD91RfL+odyJttj/Z43O5ZiBJppHR+WdfQ17O/6q0DK3GyL1aQ63Cjhi63IpZZjJRjG00Dnuwt5eJ62xRJyBw9Dovdi8/bNUTii81Pplx2iXcqPqrO/0N3Zl8fHuO4nKuj8+eJNYW3XuUrJr7RPj3BMpqmadrt6dKnQPmHbfy/WgbTjtur1R8zaq1Js8HnEwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTor193wnzvAhtzUFlWrIO9mt9/myYiBcsxGmo1dYak=;
 b=dIkD1W/Dl1CGouDBdsz/LyL7AkELMV6Ko924kFzzcVlq8WxFmo0MY7uoFbMRHJzOAGTGv6u46l3pV36Svu103hv9K+oTzh5kih1V5aOZ22ofpghSiRYl9PJU/0+qroKKD3iAbQCcopUaeCRYkKqAWeiGhcqT0rzRWOqoFQNr3OetQE2bUpwQ9P4t7VHCVRLGlc0qHa5g7phZLGLl/bkuFFnDWl9A7YzZQnJ9oazAvKP/SwJeNo+bA5NHHYJX9FbaI4TikyQmCm1/NUE4qIrbZLS9i140vGlKPnOYklB1ocK0Q9UK1Cb6NzCH51H1XP2nr7u+PCs1HZvztB/Wh4WrNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PR3P192MB0619.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 06:58:53 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 06:58:53 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>
Subject: [OE-core][kirkstone][PATCH v2] libxml2: fix CVE-2025-9714
Date: Thu,  2 Oct 2025 08:58:32 +0200
Message-ID: <20251002065832.493029-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0170.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::12) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PR3P192MB0619:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b18909d-f10d-433e-23b1-08de018125fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?On9dPb/LL4EUphnCDCpwAYrI8zyRMQNIxg6cGEJhN0fxcORdsD206gxWqSut?=
 =?us-ascii?Q?aB/Bv9vZ1+UPL9FTxJDybGJg64uNLLBgL5J5dm2I31OFi98NrGqS0KmQ188Z?=
 =?us-ascii?Q?ZrLEV61Q0uCtsY9t4BC/J9kKciOJVuvYWcqGSvvCEI01F7eDTgNSQKbStkFX?=
 =?us-ascii?Q?Dwxahwpninw2aeSInJH7DMAHEB0j6TjyEZbMdRLi/PdCdWGlugXncleRU3Sq?=
 =?us-ascii?Q?LzTUrTV3y9b9L1D4Urgs3SrrsgJjCrGYz5C9/+6NiYtU8jFU9SJvRFk+WKBh?=
 =?us-ascii?Q?3MaDQvBbSLVh7wKnpRE5goka2g2iIGpq94oJF579i4OGxfPqns/wIB6d284K?=
 =?us-ascii?Q?jAHPxoKrcwNsysnf0IKpBViHZIiAGBptl3tbz/GOGEhQX2Rg/bWxD2hhDBM8?=
 =?us-ascii?Q?SEuXJlWrat6K8Bamq+gLo085EALroPEgyCb46Pp/xYLTC8oQ1qWhdIJfakGX?=
 =?us-ascii?Q?YCIZIwqu0wiSSEQGSlbaWmx+/2Zn2GJce7tVa6gHztw07E22pH9mtkAyzg6e?=
 =?us-ascii?Q?OEmZC5ageSrfnFY+PvpwzX++I4uvCpGcNxszvDkqlB0VrsdE/LNiS48F8Hrr?=
 =?us-ascii?Q?NY6KR1pVJHGmIB3JLSbDMCg3OlH2X9hyo4Uc0073O+bAZifw4LZ/oToSqAJy?=
 =?us-ascii?Q?IwPZ4DVzVyQhVa4CGQfNy1a79qnIUEajZFii6D4gpfEzDWQjiLRxbLWoqT30?=
 =?us-ascii?Q?B8kPrMMy46qI6E4sDgtM6fXf+AzPiXYN909orXkoedrnMhdUh0lWp0LSeI5p?=
 =?us-ascii?Q?W7W1rFS/m+x3rynU2AgXpIuDR9gZYRkIxF0wy1fD892+79LgSqxQz43oSh7P?=
 =?us-ascii?Q?35IuQB6f0XCERk6qi4jxZRc6OqOqCO29+5+w11mOM6yfxtvOkcCnrTf0ciDb?=
 =?us-ascii?Q?iGWueHj9AMZ9b9VC2uBKWD1ejPg7x812vxmlZnyc0dbhIP7wmqwMAK4Bk/Sf?=
 =?us-ascii?Q?nm6KPi7maZtyAeSQv118mDzCVvJ4a0gfIn3FMB0YiZop+gADvxFMDmbf/pY7?=
 =?us-ascii?Q?N6sdOhGG340HL/GOM3w7uHkqlS7fy3rTEgBFrf1QIX6x8byGp6uLpaPpOca1?=
 =?us-ascii?Q?r3uUktGFn7vw0QUEAlX6awpUdoV4G7/jFgDexBeri31URqE9VpCcJwyYzzCG?=
 =?us-ascii?Q?2hfN8t+HlI8M4yTuh3kSiLUjTCDwUxJsxKY5LFJaRFWjjIY1bcl6At1hNnRC?=
 =?us-ascii?Q?AvDbNtDEDeTCUarndIychPz/fGe+ZY2pCl3LGxWeeWFjYF3NtBvS8Gd3nCnQ?=
 =?us-ascii?Q?LhB3x53/Y0a/e+THlJg2zv8mGVbwPrdJqb8qhZ00e7OT+wMUGVAQ3zFeZZCC?=
 =?us-ascii?Q?A6Jo8UU99k2X4XU4C4cMbQVj+kv9O7flL/xrfc/ukLo3orO36V3xYk/ld4md?=
 =?us-ascii?Q?y3XItliPzwuOrAj+pVNFTFj68U913iFZTG6CbHc778cgviM9zQSMxmljxlRW?=
 =?us-ascii?Q?86GqOk/7hFqPFpR9oqsyHup+jpb9KDb3PHnBCpxxDRU8WdVdWL3nIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C+a0zIJKKDuzgY+XX8r4ctpD7dEVIScDvpj4lLqX1f1PdU35ys8gN4O53Zdh?=
 =?us-ascii?Q?c0Zf3JMFiFCIM5HtnR/Gcr3Y26ZsYSd0PsjlC7omAgAbLqMS6hQICOqNmre4?=
 =?us-ascii?Q?AikkFDLXC3EUDKCj6U9MmdG0rYsXpCRyufXHHg9qP3X9Q8BEE0/mQD86PNng?=
 =?us-ascii?Q?nG1GiCp2xfIyeuL0cIzj2UnzGzoHffN0h9i0EVS9b08LpkDpK2i8I+7V6KQU?=
 =?us-ascii?Q?SvQbxI8v5XlkR1/aUsES4eEwgnNKzWj0J9WXJ2yui4uAR39cILVYp6uPTOpK?=
 =?us-ascii?Q?uGQzsey2e9A7hako3q7W+5aZKektgmCBYxuYNvc0yJAMJNO080FVqCXNmECJ?=
 =?us-ascii?Q?zkrOyZH8UGHfQzlY+4m3HPSdeK864KFC/xhAGx8HSGj+YmaL7V+JpHpmC+C7?=
 =?us-ascii?Q?UT9hvchN5nYTdMLeYIWySP295l1JL+ez8fkfQeGw3yorZtmrT3t9mopJsLYn?=
 =?us-ascii?Q?vo93JuwTBictKdQ4Qbc+cFoM86K6FLDiOcgCElPjhMOsqYpkai7AAjU5oIYl?=
 =?us-ascii?Q?fytNyelOGPXcVaE3R8epI7VUZEmbT5J8JqHDWTEGwX+d+VGA1xGxRv06+lw1?=
 =?us-ascii?Q?Q7uMp7cS06pr6tq1HsqXnrjWMPfbcvfhwZdQdfrz040W+zCuIZ6ICb57XJKv?=
 =?us-ascii?Q?sbMG28bt4qimjIQKwAXtV1ilKXCwSHH8UFjg9kjZ8C/B12cvLU13SRTfy0YS?=
 =?us-ascii?Q?kTmSqqWF4MmRq1uXPc2dQ4i/COtQZiUIAP23RiID8wvwlkFE1axhBzofprpJ?=
 =?us-ascii?Q?l1bgyxJubwRbNE9LKezbp5js5J6Jv0wT0eNYXZiw6PKOaATIGWDSbUH4iK3K?=
 =?us-ascii?Q?4N7xVMnd8y/jjwfal5THeOwIq/9VwxVSt+kvMmYBqbF2HImuNAV2TZ7W56hx?=
 =?us-ascii?Q?UWMRYDYYTG4WHgkrstJsDIpAZUAImHvHTYCwjkk8HyJQjkcmUZP4Y+hdJX2O?=
 =?us-ascii?Q?rCVf2f7sz2YvlfiM/yVHq+ZXzZGe26jqODDOpuc49U4jGVs3Um9so61A9xxY?=
 =?us-ascii?Q?hHjdt5yR2trcLg9YhVyow1by021FMJqEH/aJPK4kxUeyJkIlIxalw41UA6j+?=
 =?us-ascii?Q?ob4lJGjwChFr9Ub2yZLaeWSqa7pMECryuauW3RUjPvRJLsIcaly1wH8tH+AD?=
 =?us-ascii?Q?vvS39WCpyIxfuLsaWd9UpVREsJ+h8siCYWWcdmgyox1+aFLV0nsmK/l7P5c0?=
 =?us-ascii?Q?Vu0eyjNywhRcwtH+eBVPwIbasML+HwrlgCxd7eXjzS+3SQOKT7uqlIFhXQuq?=
 =?us-ascii?Q?RQXwDfOMvD0wzzShx7erYD/pZHtFjVnAQBl+PHdsrl//9Q6ZnF3hjgWO0sjk?=
 =?us-ascii?Q?PyoNbxez0L4Rz8XJA0sLO9/Ww75y7Ng6rXt5U5LklcANPy309EcR+wXpXXXs?=
 =?us-ascii?Q?3V3oG0npD2LXxA9c6ezZLSXcf5fasEbYgx9pC/anDQp5cjTFuCz1TMICN2Ur?=
 =?us-ascii?Q?z+d99rIZrQEJldROwCADjDjprtky2vSaRK/lHl0OebBE2bpr+U9N2K++0Vc0?=
 =?us-ascii?Q?UVTjoeVW8km4t8Lk9NYddhC9hxMztQAnGdmrY71QU97FFhvwuO1SKrMlwJOt?=
 =?us-ascii?Q?oZmNzUog76ARroDypGg4nIfTum5K1qn0OYyIp163?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b18909d-f10d-433e-23b1-08de018125fa
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 06:58:53.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/oe9LWr4OyOPaQVJtAM4+3hgSeWeffm75bfcf6HsMTnts8+jyLESvdshYvnIrj7HhKXA+nwCyvyHPA8yz4Mkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0619
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 06:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224344

From: Theo GAIGE <tgaige.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/com=
mit/677a42645ef22b5a50741bad5facf9d8a8bc6d21

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
---
 .../libxml/libxml2/CVE-2025-9714.patch        | 117 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch b/meta/re=
cipes-core/libxml/libxml2/CVE-2025-9714.patch
new file mode 100644
index 0000000000..24d1a8348c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
@@ -0,0 +1,117 @@
+From 6ef8b9f05cc21d3fc28156fe5d1251834c29c7d7 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 28 Jul 2022 20:21:24 +0200
+Subject: [PATCH] Make XPath depth check work with recursive invocations
+
+EXSLT functions like dyn:map or dyn:evaluate invoke xmlXPathRunEval
+recursively. Don't set depth to zero but keep and restore the original
+value to avoid stack overflows when abusing these functions.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit=
/677a42645ef22b5a50741bad5facf9d8a8bc6d21]
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


