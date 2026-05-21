Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA38CD5BB0
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:18 +0000 (UTC)
Received: from mx-relay17-hz12-if1.hornetsecurity.com (mx-relay17-hz12-if1.hornetsecurity.com [94.100.139.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33064.1779358210543430485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Ntz6vNC8;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.217, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023089.outbound.protection.outlook.com ([40.107.162.89]) by mx-gate17-hz12;
 Thu, 21 May 2026 12:10:07 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5+I5zMZ89xRp9fAVKJNFs9jVjnoteZCc4M3czyXXGJg4XaPJ8faliKEu6F0Tm7HcxGbk/RolZWxbqJ9x5sFv4MsIDyrsvK/Hyn4Le2G7pR8iB4zbjJH+S07LiRibs43gWVqt0G6v93EdTNkEQv23QL/+MxQZvGmw6YXxOOqhwFybMRj497gCSIcBP7aoRE4F9YCvcEaX3zyQUBNuO5uQ2KrAam54b1Yh3D4Hk7Do9oCfggmzWbL7yjPHLqmWBshBHlpZb4g9KED4EjW3Atzsji3ZqzoXboyUoA14JrvW1GIndMnhlaYQ36RCPzwGsLKG0TAbPyBMp/fpJOGQfHTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGQkIl6cCcWgBWadYGievRBdljIDaE6blYdPfq8s4XE=;
 b=gtLteImT7iq55HqwlhGmm8xPJrAhD0fLXV7LSw2soLNObWi7SgZPqdXBSW8oh70RN+KGTGfREf9mvFnRZJT0uJgWzwv46mLk7yrINd5lqjlW1dt4P8xBi4KePPK36VJ+Ol/mUxuGNzCyJr1QWCDvLutprlf25t6hb5QTvzGfD4mSYbUwLPubbEA/seDVTgY5Dpc5IshGhwrKSOm1GxpuTmrIeVaWhhEKJEPxHjAB8rU2vJe3IQgfev2RH/HXUFTfcybGRJWUp5uvWXF/8W2PtjlWaYr+qWoEcVVAWTHdcOp5MEbuZD4sd9vCy/tcSWoCBxcWJUPzCCMbWT/h3uUF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGQkIl6cCcWgBWadYGievRBdljIDaE6blYdPfq8s4XE=;
 b=Ntz6vNC8+q5FiaZ9pYUEhRzDCJNFNnCLZaekYsJAbhk/f1MC8aqbY7iKRzVcpP4yRyOhIMjQBDu+qLQeLijLLjhLJUE7LvRZok8WnUDCK2K60RLNbuLfGV/DGaX7IsbdNLRxB42n9ocM2EkNQNMsRwtYCjSMatcQNEGCNvQMWnGr2o81vYpixITcY+NYW+4ZDcBzIh9ib9/nj8yHrZGt8EB6Ke30Ky6DHEaK1VvUtHLh7zWzj4rQZc62vkh+3tMpdI8WAtiXs7rImLBoprTiLOj/JVb43dfoIxjxj47zhifwDQ4DbjDRyI1etj+QOWR4JRiZoqXhY7imDXWnm3/rsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AMBP192MB2913.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 10:10:02 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:02 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 03/14] go: patch CVE-2026-32283
Date: Thu, 21 May 2026 12:09:36 +0200
Message-ID: <20260521100949.1299757-3-tgaige.opensource@witekio.com>
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
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AMBP192MB2913:EE_
X-MS-Office365-Filtering-Correlation-Id: cc01d67d-b406-41d5-948c-08deb7211f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|22082099003|38350700014|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	nXwSN9+2Y93NeM+nPL5liQ7g1GzWFKIpJkr/qO9qxyVdHE3SVmDdRsymFGhujFhZWPdVgokI1jhCLAWSD/4k6qTBaDqLCKz1YFRXawUuUs+X3kCvvO0gLUjVDelrb8AIll9quD3hzQ8cKq4K/2727H+qkD47lVNObKC7JSpV8IbLMyqdw01AfomaTm+8CesZQdGjSqRPPBti5UWVQPyaNP/H6kii0NwoDESVYeCY+AClJ/LwIM1/e8qiS7vm19xGT3+bas6IemYu4Hy3w8iLThrMWWCia/cF/0hvkqVHAV1J898cFSAsuikq4076qLD1GwvE1YjLm357be46oR1Iit4iInpqvaye/mFBgP/T9z2l6rgR0YFc+xcEJ/9wk90mGzjGGbxNog4An9X+RqUV7f52w8INzwRWgvH1k2sAWktvTJTfitjNcpARBooZh7f76FgwpgrQhff1e24aAu0nc+IZ3lFxgee2s071LzLh6wGysTAYvcekhC16dFpdZv+M8lLldf/kB4Rmy1YdH5AOI9uZCrBnbeDJzTthN1NlsktqtVfn/++Ra3Hgct112LJBAqlSFERnmzmIk2RxycRHm9EuHh7fgO0x4b3XBIo3H6BRqJXdI9nolPnb5bRxLD/XjE+dWt4vqdHFG/7OuTYqRypZUtz/eZFewByz3euV1u7GEKIQpZdvYnOHbPsCvTf86gIrBW05H6E1n7tQsph++A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6pKRJjFxyROyLROlpto4NNPSMq8YzSGU4x6hqmgdrFzXzhKhBkcxC6SuNyAK?=
 =?us-ascii?Q?vzvXG88uW51R5VF4+Yu8D/uSQ2QufWES6spx0yrYskaCDmtGzsYS6VTgAUpK?=
 =?us-ascii?Q?QmlQPQROiqyT4Uq6GFFSeG2Lc8lGgj5+KV7eiEP4wH47lD0eOGZxhbDVBltJ?=
 =?us-ascii?Q?VXn2P8IC8iLPZwKd6bnnhEppFAY7T1zorWdSuGTS9IFPXeXUgkeCFFWuxwKm?=
 =?us-ascii?Q?77omJHjWF4Kuj7V/b3EJqFjAZrniqnVbCgYpv/moQ+Zd1IpfRbcm1cCpzzOg?=
 =?us-ascii?Q?XrOw4kJqnENuKFU2lhl9bX8dSquJdrFPGRj+f62QO3nKSdVc58ThQE8/WlQv?=
 =?us-ascii?Q?zsH9pxLVvoz2TVj1lHwLeNbeCXCQ0/o56moLVhqiyaZqqMFd2NF8XaQcQeUd?=
 =?us-ascii?Q?behD6NuvcEYKVTObF0px4BdaMuSvCQwMh0aU4PwoVN+ls7+/x3hT9JKNI04+?=
 =?us-ascii?Q?J1ycvkP6SVy6cHHGezQhRtfh3jPVK2/nN8NQ8hRQpwI/KZKfCDy7t7ex+B1s?=
 =?us-ascii?Q?iyGuzlggBxuTxp2lrx36m8TvajIFSne2kCeoo3BRFnoG8pCXTmSrHtIVqjGE?=
 =?us-ascii?Q?NcJ4+UhY2yYIFpThoXshAHiM1p4FSZ1NYXK2Om+fsW+YYtQh4FPdvK/eEYBw?=
 =?us-ascii?Q?CGkkjO+bb0ahJ5PeLyXJi0Fr+G7w0ZIKRwgA8xSdq2kTenvGWie4tdMlcevl?=
 =?us-ascii?Q?fKKw7vCkL+73Eep9o3C86x8yKmfpxU1UGELYc5K75KVME+8XqQfgvIMI0xmf?=
 =?us-ascii?Q?WKJeOEZ6UDQxKfC713/3C5IpK4+oLIC63xDJDYPzD0CtX7WE3kZk7GbQ94S2?=
 =?us-ascii?Q?ObOHWHXAgOZ4SWkXycQXJ20n5P+jRZaTSyLWuumHyUpNnFoMEbS2uMTl0htw?=
 =?us-ascii?Q?lKPUf+/XZaXAFG+gmbD2mRAw24wc+FQL4UIFcunpC35Rcl3kOC9/GtMwStRB?=
 =?us-ascii?Q?H8o5xsUKCiGUGlL7NR7UgsZ2MRbT2R9cW4FhvLg8rdej5LMxu4GahYsQQho0?=
 =?us-ascii?Q?W4pLD3ckv1o8HJtkOuUKzx+TnuCIfI2iI/nOTSnTerN+U110R/TmsvN3USHV?=
 =?us-ascii?Q?FmoCvJyYCV00ovrj3KrPj/AxYoE9vh4f2AUwvvTksEedlLVclO0kfMzjm+FW?=
 =?us-ascii?Q?TGNeijAdcZ/lwV19lcOq+9tAPALQPBGoo+3xyFutBkEjmT0YM+RaVYgnn1p4?=
 =?us-ascii?Q?wRe0gVHHCu4v0iw87zCY2+LCqRk2e1WQ9a+xu6ToSDAFPcLPagSKV6CknSww?=
 =?us-ascii?Q?jxTMptuHJKRnTnm9K5IrrQH75AG/XA6ltwofhkDf4WHa2HEanl8lscXA3WOJ?=
 =?us-ascii?Q?vzBTp8dd2R5Yuia4E0j8vYZg1GmSZOeutzUnHvqWtLtViNVG9JZrsxBJIVn+?=
 =?us-ascii?Q?tScgzG7svtpMcMBmwU9x1YMyfRx+8j10qzEnK4IV3ELBwNbQ4lLHwpLtV2wy?=
 =?us-ascii?Q?hMdbURDjpJy8VFphPr89p/Oq8Ugd6tCEdT6XB/ax/tdoRCTVmhnvhX6vgbam?=
 =?us-ascii?Q?+91oK0U0n+oa4a1fNb8i6j/gYLqh7QqcrASostjDGdXX5mTLbgEw1nDGHBQL?=
 =?us-ascii?Q?OVn4X9O70VyiVRA6Tr2D/byaAUhsoBO3B+topJFnyC4fVHvX+K9JVM9JeF2A?=
 =?us-ascii?Q?1A9mJpkTjpInPFOcvZXhELp0WfiZvw5xX5Sl1/7J65alrNOVdnEf1m4sbu6k?=
 =?us-ascii?Q?PEakbJkR3dlE7qCq9hryMBG9R4VpTxEKQa96dKCnpiI5p5ctO/gzHukBpdmH?=
 =?us-ascii?Q?8D+vD0KTeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JVlARIlyScdWsLSS5vy3jzyPtqkIwuYKwDiUx2ptoJST2JxkKaNOm/JqEwphwATn4ex9sS1AqTUBD2ni9oz0ASlcCSthBxT7fYNrFOBIFw2hh2ZVccQLJaZmfRVWowBHShAvQD+gTzSlPBnDBv/axfGQdg6BrlfeVJ1Pthez/UaGtNEKKN4KNWvnK7v1Ewog5/1Zl++Jhbc7jbR8urnu5Ds3wizs/DezO6ro2fJzf3KLgTfwzyjJFHYlE6FJNWyrNJE6Pu+paLd8DohWePyb/jC28ri4Di2i/z6MB2RAZ1YRVa2UIc7a4zcDMhqV5PwGCrnATKd99o2f79pWjcHnbg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5cLB73LZa49q5g0OApNtDTfYaFkJr7USduzjAM+ZwrtULLuVWGbgXV3MP5xNNAsHpkDpsfDZoYLhy3yGAJ3w3DqyXWfpfEWlD8yrMqDDVFUMU85vQEYV5paVkdu57npOVtFLuXDv3WkycD79M2LoTRTjZN6us/jk5MuoC7YCEERayg25pbUkTPa4+TbtBmw53X2xZSjutaSUTOtRrOz2WthJfHFsb3OfIlAnQEqW3X40EqwKx/+IMG3wk7ol7i+FYzi8u8v1kn+bLXTnvGRtXO/y3aEfimeB6x3qC3HF0FztNmMAoCiCCIAyafCkjvUYEAOFma2vHVj/dAM/ecMbmJlvWHuja6TJTTHjKvyeLFclryrVIcbNJqoBq9ftPixh8GbYoOz03LPF3fzewPxNkDOAI3JyY6YKdd2kFJCizr228a4ZfGEeBxDC9kh7SGVa6KKtviz258OaM7jrYxkP3rgawZb/deVMYbKb3pRaLl0u+fqg6Z3kljFB66XXxhfxqzYtWo2l65d8hPMS9ueWtdFdVWUrsbMTxDTUfPofsM2kxYQfjTeR83sJZI5VWJWopqAFbBSV/mxlXaEM9poRCgq++d4OOwR//SOvUL4mSGx2Duso/DIryf26TUlj0ZeU
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc01d67d-b406-41d5-948c-08deb7211f2f
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:01.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlepKeF20/BdsZs16/y2B+QPTtcgGmzMgXmPWKn8kxDqDJgYiPkSTJ9Qsea0P+atWiAyOUILP6Is6qMcQEELNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB2913
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate17-hz12 with 4gLkfz3Wp2z1L8XZ
X-cloud-security-connect: mail-francecentralazon11023089.outbound.protection.outlook.com[40.107.162.89], TLS=1, IP=40.107.162.89
X-cloud-security-Digest: 61bef733f7fb05576bfce394a72f9c65
X-cloud-security: scantime:1.447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237485

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763767

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32283.patch                | 177 ++++++++++++++++++
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 0d4dff6c21..99c2945a8c 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27142.patch \
     file://CVE-2026-32280.patch \
+    file://CVE-2026-32283.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32283.patch b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
new file mode 100644
index 0000000000..87bcc5816f
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
@@ -0,0 +1,177 @@
+From f560f55d3f804dcc3002dfe963b37bfa3a67202c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 23 Mar 2026 11:54:41 -0700
+Subject: [PATCH] crypto/tls: prevent deadlock when client sends multiple key
+ update messages
+
+When we made setReadTrafficSecret send an alert when there are pending
+handshake messages, we introduced a deadlock when the client sends
+multiple key update messages that request a response, as handleKeyUpdate
+will lock the mutex, and defer the unlocking until the end of the
+function, but setReadTrafficSecret called sendAlert in the failure case,
+which also tries to lock the mutex.
+
+Add an argument to setReadTrafficSecret which lets the caller indicate
+if the mutex is already locked, and if so, call sendAlertLocked instead
+of sendAlert.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes #78334
+Fixes CVE-2026-32283
+
+Change-Id: Id8e56974233c910e0d66ba96eafbd2ea57832610
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3881
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763767
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: David Chase <drchase@google.com>
+Reviewed-by: Russ Cox <rsc@golang.org>
+Reviewed-by: Jakub Ciolek <jakub@ciolek.dev>
+
+CVE: CVE-2026-32283
+Upstream-Status: Backport [https://github.com/golang/go/commit/1ea7966042731bae941511fb2b261b9536ad268f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/crypto/tls/conn.go                   | 10 +++--
+ src/crypto/tls/handshake_client_tls13.go |  4 +-
+ src/crypto/tls/handshake_server_tls13.go |  4 +-
+ src/crypto/tls/handshake_test.go         | 48 ++++++++++++++++++++++++
+ 4 files changed, 59 insertions(+), 7 deletions(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 08609ce..770d456 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -1345,7 +1345,7 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error {
+ 	}
+ 
+ 	newSecret := cipherSuite.nextTrafficSecret(c.in.trafficSecret)
+-	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret); err != nil {
++	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret, keyUpdate.updateRequested); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1675,12 +1675,16 @@ func (c *Conn) VerifyHostname(host string) error {
+ // setReadTrafficSecret sets the read traffic secret for the given encryption level. If
+ // being called at the same time as setWriteTrafficSecret, the caller must ensure the call
+ // to setWriteTrafficSecret happens first so any alerts are sent at the write level.
+-func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) error {
++func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte, locked bool) error {
+ 	// Ensure that there are no buffered handshake messages before changing the
+ 	// read keys, since that can cause messages to be parsed that were encrypted
+ 	// using old keys which are no longer appropriate.
+ 	if c.hand.Len() != 0 {
+-		c.sendAlert(alertUnexpectedMessage)
++		if locked {
++			c.sendAlertLocked(alertUnexpectedMessage)
++		} else {
++			c.sendAlert(alertUnexpectedMessage)
++		}
+ 		return errors.New("tls: handshake buffer not empty before setting read traffic secret")
+ 	}
+ 	c.in.setTrafficSecret(suite, level, secret)
+diff --git a/src/crypto/tls/handshake_client_tls13.go b/src/crypto/tls/handshake_client_tls13.go
+index 68ff92b..2d58b21 100644
+--- a/src/crypto/tls/handshake_client_tls13.go
++++ b/src/crypto/tls/handshake_client_tls13.go
+@@ -396,7 +396,7 @@ func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
+ 	serverSecret := hs.suite.deriveSecret(handshakeSecret,
+ 		serverHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -607,7 +607,7 @@ func (hs *clientHandshakeStateTLS13) readServerFinished() error {
+ 		clientApplicationTrafficLabel, hs.transcript)
+ 	serverSecret := hs.suite.deriveSecret(hs.masterSecret,
+ 		serverApplicationTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 1ecee3a..f73b536 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -636,7 +636,7 @@ func (hs *serverHandshakeStateTLS13) sendServerParameters() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
+ 	clientSecret := hs.suite.deriveSecret(hs.handshakeSecret,
+ 		clientHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1005,7 +1005,7 @@ func (hs *serverHandshakeStateTLS13) readClientFinished() error {
+ 		return errors.New("tls: invalid client finished hash")
+ 	}
+ 
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_test.go b/src/crypto/tls/handshake_test.go
+index 4991a0e..a95d751 100644
+--- a/src/crypto/tls/handshake_test.go
++++ b/src/crypto/tls/handshake_test.go
+@@ -673,3 +673,51 @@ func concatHandshakeMessages(msgs ...handshakeMessage) ([]byte, error) {
+ 	outBuf = append(outBuf, marshalled...)
+ 	return outBuf, nil
+ }
++
++func TestMultipleKeyUpdate(t *testing.T) {
++	for _, requestUpdate := range []bool{true, false} {
++		t.Run(fmt.Sprintf("requestUpdate=%t", requestUpdate), func(t *testing.T) {
++
++			c, s := localPipe(t)
++			cfg := testConfig.Clone()
++			cfg.MinVersion = VersionTLS13
++			cfg.MaxVersion = VersionTLS13
++			client := Client(c, testConfig)
++			server := Server(s, testConfig)
++
++			clientHandshakeDone := make(chan struct{})
++			go func() {
++				if err := client.Handshake(); err != nil {
++				}
++				close(clientHandshakeDone)
++				io.Copy(io.Discard, server)
++			}()
++
++			if err := server.Handshake(); err != nil {
++				t.Fatalf("server handshake failed: %v\n", err)
++			}
++			<-clientHandshakeDone
++
++			c.SetReadDeadline(time.Now().Add(1 * time.Second))
++			s.SetReadDeadline(time.Now().Add(1 * time.Second))
++
++			kuMsg, err := (&keyUpdateMsg{updateRequested: requestUpdate}).marshal()
++			if err != nil {
++				t.Fatalf("failed to marshal key update message: %v", err)
++			}
++
++			client.out.Lock()
++			if _, err := client.writeRecordLocked(recordTypeHandshake, append(kuMsg, kuMsg...)); err != nil {
++				t.Fatalf("failed to write key update messages: %v", err)
++			}
++			client.out.Unlock()
++
++			_, err = io.Copy(io.Discard, client)
++			if err == nil {
++				t.Fatal("expected multiple key update messages to cause an error, got nil")
++			} else if !strings.HasSuffix(err.Error(), "tls: unexpected message") {
++				t.Fatalf("unexpected error: %v", err)
++			}
++		})
++	}
++}
+-- 
+2.43.0
+
-- 
2.43.0


