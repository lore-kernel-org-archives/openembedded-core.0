Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C101CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:28 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33068.1779358224187956528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=IpScfYhZ;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:22 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7b7XTys2tAijvBVx3U6U08R/VWWjjH8FNHC8CwWSFG24nBriwNPuK8imC+q1ZZM6YCyGkFQ0KJJ463Wv/cbJE++e0HyKPKuzqrgJ3H0XXzKoH3OCCy5Y4VVg1eyYQLVUoYwGZuE5i1SHZC/GelzQpq/uJoOkNLckBeg3m+V9x0t7E8yF1e6toH7uvqwB8RS0o0r2cZMGFNI6MAib/sqXKbH8fZKqM/+LNV7CRsbDfxcUFTO4a2E+OyQK5+N37Ox3UtXtux+CB5tm8eDCTtJxqBuD4HthMZRvvE0h+As+c0exuWTy+K3JRf0SM7wpupvF4dZZCLlhccCXIE0qfWVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVPfj7eCuC+/u/zZJ5M9kHOjrCfaXhujF7UZDQa5WxI=;
 b=ZhjPefKJ3ly63mLzMFTKouKsdxhd2XUeAhtbWb0TzYy6ntFI0zpTyaTK3WAjLEkzc0EaXQ6ZfDNbBCw2uUKGjtEU2pVIPtSnUes6w8EAxM+j14Ax5+/qlupo6RcdNW+u7FiSpd98shT9Kqc8Yg8b3Ptt0B2gCAbwpWq/1Cp7SadxUIHtaBQ/L0aEPsYF3ocPdWdM483DOLc/6qndMVKgScxjVDDnCzDKiTYDhKuVe8gsMnNDPRYtzCwLxphMXRAEH2Pg4pRpji7O+T4Dz3Pd9rp8j64n3rBLhZROJi7IlKHVzRMoA1LFInoYEzv2ingbgI/SgGHhhG++UMUN5rXSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVPfj7eCuC+/u/zZJ5M9kHOjrCfaXhujF7UZDQa5WxI=;
 b=IpScfYhZJeEcZvb7JUyRRRx6ZLyATmeAOGiyRY1lhBZgblmtOUeFez3onNg5GILOv6bwqRRtO3M0CwhiCJ6MSiy1mTSNYzgpWHlwsQCiJPR9zo2dSkkfciix1lqL9ylB4PrRi2Jl6NUWXBGVSiyQeAyXGkv9J4+DCATl1i6K21kKtx8fOXuUFXRkSW/ylr/lZw4EQkG+Es3VWjtka6Z/eEldOaBqYSk/qiqqxYXInNV7iVDMb2ceG0mitgYTlGkioztj6/8bKEhiGsL0lml2+KxRPQQ+rMaHYWaaPwfPCYzHXChUW/1XR7GDdI4qXaIokPflsybdcjg9G/FV1zpCPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:06 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:06 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 06/14] go: patch CVE-2026-39817
Date: Thu, 21 May 2026 12:09:39 +0200
Message-ID: <20260521100949.1299757-6-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 075f6dee-6c21-411f-549b-08deb72121e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	R5NiGmqpyv1GSEavsW745viSg+UW23aGWXECljBFJzgWTYCL0gemhZOv86mR6gHtKZhDOF1TJEkB8Ak74O6CjmA+tck4bbw78QPAyIZULYvfxnNrspJURQlg4oiiHMnXb7wf0mpnWH9+hhoZgHyf4cw/hpEXMVJ+s+gBvJSc1pAvEnZzzJslbhCitHvrdJYbasD4OwbKlbw37H2628opr/m/KIJZF0O3T0U3JXtUXKAsw1Hz6zu6L1JLVc9c7PAwb6ErtkhVLGMx4fvLLJ0MJdXlV/RWZO3GTOl+hDpJJp982ez3kW+M4k+eVTS6HMWHaj3U5QYXhB+XN0aCim65bMUlqtvwxjPi756br3nqqdPrPE2qyywV9HY/2d9uoJ8ZhbP9TL6d91w891GgJ7qF5kqH1uwjT88BU+N/CMciySl+2eGBxpbj3558IokaQxqSUmD6U84f+zAFymB0a1ARe+vRMMR+Ku5Yys+iuWbvAVgyCGxpaSiXg61TMBzdxrPqKzveFCLLBl5vhCWRyQpKpNmKH/LNBqDeu54o+nApbYFwRQAMw/KIQpV4uNasVr0/kv7MlStfO+cShaj0SgIrS6Q6DKModBDqbHMicjfHRhc5qf5ILrvvuB8z65TeO2zGM+zMNVv+4lBMGbAx7j01rUVFulXJne3FDWp2WHFWnrWR9FqdJOjNMgVekRyU7X2GVUDooHkbghNEtENoX8A8Aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iBMpP2kungl0J6fmu0M38gRgl3Pu+H7pOdxhF4mQmWDc/68LrEpEDrDujCD1?=
 =?us-ascii?Q?/b6jBX535SQNJx+heLjS6D/InmC2d40eBK56cxPNUYr34gDKPH4cCMmgTLBU?=
 =?us-ascii?Q?avw+d3pv+QZHqbedCWufuWsDNJZElzP8ZVD2MMEgod8ARAV9nHLEN5SyKR/i?=
 =?us-ascii?Q?uza29XPIM+ssN8kRb5LOU9vqeSK2DbGlqW2oeG9Ex1z/Zy10DLHycWerQuDM?=
 =?us-ascii?Q?6S1bEo/6e0G2MmJvjMcROmThIPWADMuy8GXeOMztQ9A0BllWu0w0EJBKYLTO?=
 =?us-ascii?Q?Bg4u3hcnVAB6afxIKw9cyBSF+xQN9JMquZ2odOUMh7mM1M/T96pULFr7ganz?=
 =?us-ascii?Q?iJCMFhM3QUTtBhWIZVmxpYLbz/QFma1FJJ7Blm5O9QoFOqYZTPpzgfRC/LqD?=
 =?us-ascii?Q?dbd1nLAOu8CUdUdhrO5M0kptuutHfyCjmPKlwn1LcbXXsrdWNIRMZWuTQHTn?=
 =?us-ascii?Q?U/Bi4ESm/aCc91wY48zUM+ZbNlanHgmIOKHa+/OhPDFas9Yioaq42mTAEbBB?=
 =?us-ascii?Q?xDRtCNOETsJ1zPulDv/LsvvQv4aflNJD6N7Wn8src73UYbpLMIwQjdQa9Jxm?=
 =?us-ascii?Q?ptwFd+SlpetgmUxZwAhzNbLnvY9HdP4amnnuzlJTOQioQk/J+N6MvscIWEj5?=
 =?us-ascii?Q?138yHNAxEcJh071jJ2AqpAUKyHlT5McWBNuO5dNx9/dmHVt/+uBNDjLriSOs?=
 =?us-ascii?Q?5cVOI8KpY3gDr/svKdnFjGIkLoDfl2lRe601DXKq3OFtMqkkEaqDyyBSfmg2?=
 =?us-ascii?Q?ZM04U5qVNUPv8hLDmaYuh6AANWql9DgMOINsgvT6qk/tVlik2G/nhShYkVFK?=
 =?us-ascii?Q?slIqcTWRtnIcarBLwCbZp1G6+FjFMIzXo/3tzAzS80tQxxUuOJg+i6ljwVTE?=
 =?us-ascii?Q?Et/l2LBHXSanHGMBD9QvaNRUo59Hc1yUy1+0zm4JYKwGO2vFEaQQCUOTtr3f?=
 =?us-ascii?Q?cWlxxuqtKbSgTZ2KTLxxfzfUy9C+vQvTbs/pMv6PmuLklWVsPNUAu9skUY+2?=
 =?us-ascii?Q?gSP+9ZpJ9z3dd5TpsQ0H8VwZ9stf1lxNqlTeMGUzo+XU7eC0Bp+Hxptuvd4q?=
 =?us-ascii?Q?JpwIBWBQuw+fzfuserQIiM4kmPCv03rghB2q14usgge2CJSbBLTdhXGMwh0r?=
 =?us-ascii?Q?grOzlPh2LLm21GKAfTlXghAUnCs6ks247TFAfnlUYTS+zWnfCbYpRfqktrOe?=
 =?us-ascii?Q?vKZhdK+ZwaGHoryGH/OvDA58g/KfB+MeST1gElGn9myPnU71a+GdtO0WIkq2?=
 =?us-ascii?Q?CpE8JI1bvEwIx5KjfubH5b8+HpTgV4B7bbDxFGZsxu4QC6dKU5tWaoasj1da?=
 =?us-ascii?Q?n7WCFy0Ly+jrI60VHl9wwo+oT40KGvf7ZqjnAQc5Ry8zEcs6e/OTKD5B2GXS?=
 =?us-ascii?Q?0tPdlJ+nHfKuGsXMnHcJxmmYQMWrzwPDBmecxnEwSW7tIsvDBHs4YiANP3eu?=
 =?us-ascii?Q?GqwlXx2pFngE+f8bCNRWl5DB4mIYo1orM0E8Zve28P35irBQKAbJpEW7ijSc?=
 =?us-ascii?Q?ObQADSefJiBGw4oGFdP5xe+tqzwTasgTn5OhwGK9iWwkIC3+4D7uxYmswDfD?=
 =?us-ascii?Q?gEz2wsebYf/k4GvvkbM21HnqvP6FF0u3UkAYGlb9DGtRG0XLURAYt/6hQ9lb?=
 =?us-ascii?Q?dwEOgholiNNXiFO41zdevh9ZtGyRrmTgQeu0JpYpBfzGrf0kyrblfW7EiQQH?=
 =?us-ascii?Q?f0PwdBR1rxtkxL0W3+cnJpeLOwCEwu0Rh8jV4kiNznYo/ktNEoCRS/QFjYag?=
 =?us-ascii?Q?9T04NNVICQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	dv7+HxgySPSFshFXXdR7k35OooSWehS1X0xa0aoUlUQZ0kinCh8c+xBt6U+W2qU69/ztwa5Q2VxZbP/G8xQ9ngq/+HPR9tAYXYWxxI3Znx83RueKDiS7vnSiQ9tQxPmxbV5uCFLj+gOi4/xyGQZwBr9I7C5cKUhJYPx1FRDXu7BsSj74ZjecCtBJLP4AHgus6Q+Dmjp2A7A7miEglg2FHL/v+YPYDaNhi2HQltBaxWoTS8+2WrCP72nGbke/dJzKknlxUX7zUkHBmGEp38wYFGV4bT0/2UZJFXBEw3MHD2fR1/MhP8MP37A9cx5JsdsKADZJnvdK5/Gfx7tj5fw68Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EP7wH2iPahT2iqpcMgDtOfFbhh3xXtKp3dHYf27+Ex8gIEJFa/tLB/xYpD0HdhMRyUqp3ohvGlvii/9NZgi8/kYt4erHE3pECl1CT5z21nl7FwFzRS7aNonHjJYSjr1BJnRvcyMEZVehwxqfCusJzjbfVPC0U0emhoJatNXa0B2LMSm8ZQxmQBpFsd1MB/i1fS2xx7TTUrUFatkYr+8S74BCRTO4GO/j41kTCOw/W0EPnrPPCPvQDwWkrxewT3pzb2iVoKy0QXwnvFF+9ItjMUARm5WwNuh35Bcl0q5F4npwYyurUww69HR7DZMK1NbdmvLr8+0vC2P3AaG7Cs0YFkol59o/1mz1bNuT5D3lea4vINKQE0G7P6nBFx6TDov06ObW69q9F4F1ClPqyB6k9sRDu8YOKyvU7nNewiAUx9iYoLFWOuBPICg0kWA6mWe0cPlKIs/pwFF8VQUYXU4HhYI0vccMt2NFIkKYzj1artsTukMJSUfgSABct8x155FPaj9B0K2ozsS0Eh06IIDZAG6hmOfPhgr0c+jkHYpPPvZsi5YjNQWlj8RZULnwY2TDwfXB0kU6Um+Ds6+QzSEblcm9leA+PtCn4sskIiKwFD6Rla+HeMwGwym55D/+HYF0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075f6dee-6c21-411f-549b-08deb72121e3
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:06.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYkE6klI6mxVQtVviYbzSPoxzgXhEqF9srZqJm82gPJDiI4jPrF3Tet83c/yJQAuZyg/oRXq8wMyE6fkT+YYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkgF4CjLz1X42l
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: 01c7caf8122536ca97396a79218291a5
X-cloud-security: scantime:1.358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237490

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] mentionned in [2]

[1] https://go.dev/cl/767520

[2] https://security-tracker.debian.org/tracker/CVE-2026-39817

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39817.patch                | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39817.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 9a7695e754..f06b974e04 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -46,6 +46,7 @@ SRC_URI += "\
     file://CVE-2026-32283.patch \
     file://CVE-2026-32289.patch \
     file://CVE-2026-33811.patch \
+    file://CVE-2026-39817.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39817.patch b/meta/recipes-devtools/go/go/CVE-2026-39817.patch
new file mode 100644
index 0000000000..103fbedb7a
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39817.patch
@@ -0,0 +1,105 @@
+From 7d35508ad684c808ec11fb6ef3ab27f9258a9418 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 15 Apr 2026 16:27:23 -0400
+Subject: [PATCH] cmd/pack: refuse to extract files with directory components
+
+Do not write to /etc/passwd when running "go tool pack x evil.a"
+on an archive containing a file named /etc/passwd.
+
+Fixes #78778
+
+Change-Id: I4cf69b81af62321ffbb41ace679672a86a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/767520
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-39817
+Upstream-Status: Backport [https://github.com/golang/go/commit/7409ada33f99c0d74db2b0389c51a15de116e48d]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/pack/pack.go      |  5 +++++
+ src/cmd/pack/pack_test.go | 44 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+)
+
+diff --git a/src/cmd/pack/pack.go b/src/cmd/pack/pack.go
+index 412ea36d60..2fe0258f01 100644
+--- a/src/cmd/pack/pack.go
++++ b/src/cmd/pack/pack.go
+@@ -135,6 +135,11 @@ func openArchive(name string, mode int, files []string) *Archive {
+ 	if err != nil {
+ 		log.Fatal(err)
+ 	}
++	for _, f := range a.Entries {
++		if !filepath.IsLocal(f.Name) || filepath.Base(f.Name) != f.Name {
++			log.Fatalf("%q: invalid name", f.Name)
++		}
++	}
+ 	return &Archive{
+ 		a:        a,
+ 		files:    files,
+diff --git a/src/cmd/pack/pack_test.go b/src/cmd/pack/pack_test.go
+index c3a63424dd..c4a8c78cbf 100644
+--- a/src/cmd/pack/pack_test.go
++++ b/src/cmd/pack/pack_test.go
+@@ -6,6 +6,7 @@ package main
+ 
+ import (
+ 	"bufio"
++	"bytes"
+ 	"cmd/internal/archive"
+ 	"fmt"
+ 	"internal/testenv"
+@@ -409,6 +410,49 @@ func TestRWithNonexistentFile(t *testing.T) {
+ 	run(packPath(t), "r", "p.a", "p.o") // should succeed
+ }
+ 
++func TestOutputPathSanitization(t *testing.T) {
++	dir := t.TempDir()
++
++	// Create pack.a containing a file named "longpathname".
++	// Note that "go tool pack" requires that all files be at least 8 bytes long.
++	const validPathName = "longpathname"
++	if err := os.WriteFile(dir+"/"+validPathName, make([]byte, 8), 0o666); err != nil {
++		t.Fatal(err)
++	}
++	doRun(t, dir, packPath(t), "grc", "pack.a", validPathName)
++
++	// Create evil.a from pack.a, replacing "longpathname" with "out/pathname".
++	b, err := os.ReadFile(dir + "/pack.a")
++	if err != nil {
++		t.Fatal(err)
++	}
++	idx := bytes.Index(b, []byte(validPathName))
++	if idx < 0 {
++		t.Fatalf("%v not found in pack.a", validPathName)
++	}
++	copy(b[idx:], "out/")
++	os.WriteFile(dir+"/evil.a", b, 0o666)
++
++	// Extract evil.a. It should fail and not extract a file to /out.
++	os.Mkdir(dir+"/out", 0o777)
++
++	cmd := testenv.Command(t, packPath(t), "x", "evil.a")
++	cmd.Dir = dir
++	_, err = cmd.CombinedOutput()
++	if err == nil {
++		t.Errorf("pack x evil.a: unexpected success")
++	}
++
++	ents, err := os.ReadDir(dir + "/out")
++	if err != nil {
++		t.Error(err)
++	}
++	for _, e := range ents {
++		t.Errorf("unexpected file in /out: %q", e.Name())
++	}
++
++}
++
+ // doRun runs a program in a directory and returns the output.
+ func doRun(t *testing.T, dir string, args ...string) string {
+ 	cmd := testenv.Command(t, args[0], args[1:]...)
+-- 
+2.43.0
+
-- 
2.43.0


