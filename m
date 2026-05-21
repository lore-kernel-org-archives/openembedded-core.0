Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7A6CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:17 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33220.1779358213740978900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=bXrh3UAb;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:11 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEVqdBcT2mvhVoU2J0hiGSPEaRnaigkWFnuXcUv0FTxIylbUp2PoPESKOBlYVFXvi2wVw3aZzu81oxrBVmfX3M/bZz4G3MdP08OFSfHCEUtPUUqnzs3++p30L/xEDfe6cb8PAadE6gZbqSCuJWjM1sha9T7C4HrxvPPyhduH6xHGmT28Qf51lmCXVtVF33Qr0Oj2/eqETPjkyDCYt0jVEJTBxjmWbvzkqpdFnibOj/NjPQkOspvb2pLyb1PazNfysCjmYcU1A34DIE3poQpI4twePFyAtw0nmX5avqEKEpY9TMKABlfcJ/+WkzsCpazz1SeYMWJotVctQz2dOLBfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwEVnZEqpmn0d1JjR6860KtZJ7FvaMOyJdMngezvqM4=;
 b=evssSvrzk3Uw/nhZ28omDH4HB/9J0YEvkGzM/OzoVUrNl72G6iZ+RwPcfm4y4Sik+oJs6rXjMFoxNcSRaxoGAtM2jqUkugbdOrQca2ET0dWmqLa+Dxz+xM1YMVh1Mwihs4/fdi5ULEk8lDcB7gbRonAj4dBJsUf882YbtEimHMhYPssVQXR6KnlSkz0a/dbaZlNGzXTWNAwxyf+ieokSPF0fIotXdVrGlUK5xQp91C3W9LzXr3jVGdu+yUdLXG1nuPnlOIyizS8RTeCLA/5bZY1uyRk/sm77ktxvjda+leMmFGaBSTzb5Gv42XgPhYCBA+4zu3ieorQePiqbuWEY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwEVnZEqpmn0d1JjR6860KtZJ7FvaMOyJdMngezvqM4=;
 b=bXrh3UAbvb5hIznblQx+b+3PVme4FyYTo12LE7tYGlzyBwDYqQKbLkBY5rl7tNkymfJi1vMISSS+PlSGs2wvF2J9z12rSj2k2UH0c6OrpkiNHbiAMTjgO87r9Qfs5cnENTgh+lCUKtKtoafTDQ5dsZ4fiH1hPdYpprs5m2e+RCxWKTkRLK75JXUhtuEKXbkypOOB1qocV8nudIkBif1cUEEfjPI/5DhVuy+q+7vjoaqcd+2wJLk/qfmfIepAHza064rVUZT8336UrMV/MuteEw/OpexgX6kjz0Gqi8UJhGe8b+Ekum2zwoJ89IUSSY92WQ2YDqSJpnfNALg1GiIFRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:09:59 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:09:59 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 02/14] go: patch CVE-2026-32280
Date: Thu, 21 May 2026 12:09:35 +0200
Message-ID: <20260521100949.1299757-2-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22e17b1c-d0a1-42d0-d550-08deb7211dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	7d0IlU9J/ApFvkg7k9/y4RtG9a2StLDGYrjNmV42skl3cJiKv52b5Q2XkFLG6hVRVm8kPCE85x0xC8PXSNLl49HPz1VQLKaDZKJB9JBC6O2xMR59FHnSNaphs+u5Gzr0Rawbltgx2TkyUTCKdJivbrgBHp6abn/C0T9yqXK+qAMQ25bddPPvb4J3r9MynGou/XQkVoUzRlazbvA5i4Bpmg3Zm0bOPb4h2O6EYf0QQ+gt4WQxFuES2YGdUHFdspIzHUP3uraxYd7pe8ARhQQVVM/oecJe9CmKuieCdAGRDW/2sZIR5+wmbg5Q+seccVz/paeWMHrI8jVhjHycQQmiOlhdoU7y3j1/UEUP8se8IwfM2nRJYvnMpI1nBH9rEt8bOTNeC7UQqIfbjbneEyZ7AdAt9lL8KWHHHs0WWJBU8R/sLkxQKevNILATgckn1YfNV2kNr1Ez/mgXxsCk2xT1aAJaTxG10wf/+KMF0E89rF3g7QN+vHgjzkPgBgnmNKfeXEq1azdhEk7A5TeNqAw7SU3W4AnTSCTlSeLZuK3syjKx6Yoi5CL4bEZqQ6CE+OpgZCgij+WMF3vdh2UkOjkZwSy0a92wV/LqpIJIvdaTFf9wEVHjvKen7IsDgZSkwVX16AagQJKwBJmGLKbfSy9Ff5BUxuWu2IM9atBiBdMiYuwbkpT/c4rtuBjrnTIc/9tVyRMOOp0udIwYqMw4YCsGbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n7l8ZautxtLo2yoFcRCpjSn3VGAwn0vN1hRDZWdoVKKnz46zcI0I/vU5fvG3?=
 =?us-ascii?Q?qREu7qYsLA1VWr5hQBdoGQYzohmy0+KBcR/YgB9qfcWidOT2we4OP2CPoakk?=
 =?us-ascii?Q?XdGH/M28WnLHq7Z0kJxKayiQa0HbhiNY6KVLIfRHwRLGa9OBEOO+4BI21i2k?=
 =?us-ascii?Q?9di/jrd806bxUPno9pVSBgk4KtKYqveVGPn+EHXXA3NRmq7zFvmu0sb0W0tr?=
 =?us-ascii?Q?jZLDmwKsV8zLVRl/S+ab/izbdVGwRA8iV9p13kDBo1azIDuo3wVL0xVOVK7g?=
 =?us-ascii?Q?tBheDEEqkiFPV0TXwnYOo+eTYHvZBU9/Ew30MGDB/yRNof6M6lRF2fPR41QQ?=
 =?us-ascii?Q?mmQtVUlMhKvZaURbn2dgHJhNOuTr7LHfxkehZGE6EJpq9trEh5ZmMy4Ye/v5?=
 =?us-ascii?Q?LQajexAa980NF6+3xYEp2pbmWYs8W3kpaE59hoTbWqY4tqSBTDyFKZX4Js8p?=
 =?us-ascii?Q?Z2yMYDvUnvlpC7H3zZwN26m72PqFbZA5azohifw0uOHO98phJ23ypeSWY2UC?=
 =?us-ascii?Q?QPBL9TCpo6yYCuqHg05qR0Gj9fVG8SPSLCwm8Yda0JmaulVQdPLMyhcY2IyY?=
 =?us-ascii?Q?wYtSneGu0Xr2umnjP9c63GEuE8EH85daZDRXMqD61d6G0Z+p/lqTLXAasl7R?=
 =?us-ascii?Q?m1LaVxVW0+b4MATu7+RVVonT/XWr96sIlBsbrDixFQ+d1LEddDqoJFEdsHgZ?=
 =?us-ascii?Q?ibEh0IN00mZFPAXvI5EvbX1poaTpwQXsbDOtF5ow2Ts1CudNSiJmrGhdpeat?=
 =?us-ascii?Q?vd5CKDg4kHg7TJumWZ5a6eRXSoIC2KHYrgS75eXEcVQ/nEy3pkSkLF40OalV?=
 =?us-ascii?Q?w4z1HNTGSA//44N9295bG61E2hqVY84GZzzqvVh1SUmxCRjlvWRfTjlZP9dF?=
 =?us-ascii?Q?Pioksp+i2zMRZC2A0WnhPTErmK4+U9gpaYjy6eAgRhtdoysDWnk/CZzHtGwf?=
 =?us-ascii?Q?95b8Xaw0yoHBn1ZQoR18loc/jJOCEiTBZHudP9Fy5n9MAmLAhIK8F0J1tZ6K?=
 =?us-ascii?Q?17kXPbGnHUmxWNyyPNMFMYJzE+07XXXniNFkmfXnZiJrRLvsxxuk4eysFci2?=
 =?us-ascii?Q?YiW+iQn9Uka0jXSJ31VK0xMCEtpgRXlqsSAsN57fZy2pnQ39GVLRGhN0BIV4?=
 =?us-ascii?Q?UXYivCmloiWaUg1RdVKODqq6JYz/hsK88/UEDh9ULJjBKb4c3+uzZ8a1F0xA?=
 =?us-ascii?Q?SzDplmawovIUBbgqhhpdvKwTgzLeDjyq1TMg8ybCcbT7gZCszv2QzcO7NvaP?=
 =?us-ascii?Q?DCvgtNX3o2FrjSfrTPzn9QO1CiWNYFItBg12ce45Tp2UbOc7tzj6oqSVxvNo?=
 =?us-ascii?Q?1HemYdMuCqx7x+v518FpuKAwf2ssXL1IbUYcnwqjf/B3ZRFqoKSZEOBjaMdj?=
 =?us-ascii?Q?WrkvEMVQYhhSYqkE4tVMLcOa1sl45Y5aiIDGVTLkkR5DLKiijkNM2Zaqou21?=
 =?us-ascii?Q?DaYF0ljns7p/O1B+vvIRWmE8IvlrM5S9e+EzqmxWkPb+FHO7t7us7J+GqqJa?=
 =?us-ascii?Q?M8BPpVZbNyaUAE7QxLD9pUA6OF+z8Xr9hWsfpgT86kCf06Sb/lu/m2XF6H0d?=
 =?us-ascii?Q?Gtxpu+zjpcgbNHrFC7kNfkCZWrp6bfAmOmqGiCITHJ2oGHdHYVd5WprULy4E?=
 =?us-ascii?Q?p5h9TW+2PLh3iWMSjJ0C8q+yPoOvs+MrLVMJjPZ/GHJtbj3CGIZzZwp9Hcyi?=
 =?us-ascii?Q?3mZUIZ545t83u2SlTw6H0paI0OyUAO8iW9o7raUu6Up/4hl/SAWJh4Tc13WA?=
 =?us-ascii?Q?YoF36mxLhg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Juie6qKfDWqiF4guKfNUmTTuvNAD3WDuQ5PJLOX5W8Hq7QNiUlIHH61rz7iFPosXvJWHIpAs5fNQmFZKz6apOPiOSvH8C0s61au7yuZBwJ0nT3ylMJWTXi5C8lDW755VZrkSGKgtLnDQ6w7t+PGLQ9AmwwvKJ8wsYUSOikB/YVmocv9Zk5h50MgNa8ImoJGopOvtuF5dIjXtyfUFdLyJNCTNSV4Ox9IWdSGB09531BcvwmbZUEXL+sMsLMIpy3j/qFZZDSgr5StEUub847XMi8gaDhJlwSXRHaghKJVGJBqj1mjDiLgM1fJ9jkPZ9Wkd9nnoBsZZdKe1lKuBvzhIiw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mA5BwLMmQIkaJknrSFF1fzsg+1cDQLaJ1wLogz/NwFC5j3fStFTvl9aEydTmQjQayJiwkcIIzhjVuDQzEOri4HSOMDEVDBdsRU+5yB0HoY7C4GyY6p99WFuGY2rKbKJoHsydyKuuGkt+E1B6z4eq98ttETXzKms+Ht+Ty7/LZhIG/B2w5FCZ6S2FVGJsfhIXqEwmr6/kh+gUjBUMZS17UyGvOVmUplFAydbD61stcgxYixY6Q799glCQIS/OGx9L5ZXwtKFzHMOflCr1j2tghu5OlnRKRD+F5YWllAG3KtVdBNP4F3eY/vDGoPgFG0RrjJcFrllFAsVsZ+Oi1y+246v+yUtWoVfKqIMzZXImVKIII8M94iKddMm8fM51D0ADgL9FquLquK/N7MhHh9iCdb0YTKRSNZ4dnYV4F7sA/xiZXzktlEmh3qpuZesyjpBnjhdtKGOnRUchlsRZvEBnjD5tjbyy1VWFR/BF+JbapV+aF2X+Lh5FAz1ozL2I6HlnNwXQONDMdDQW77kZb+KrulgsLfvsdJXBYFTqrmyT5eP5D6gstJPyYNzmHj9IBHNVUQKbovxnBZ4LNfcBjeEeFyJfguzuwEKcc3O9Ol93Gt2tV/82t8JsE2QNJspoqqy7
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e17b1c-d0a1-42d0-d550-08deb7211dc8
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:09:59.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yVV01C6iUu31bqXdGV7fsdWaFn48x7aNneUuy9IZmCzu2Ofbw9mzZLd5xBespIuAgduQfNHvjuzIKc3B5BNOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkg20MBCz1X2mL
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: 083cef0182eb0e378ae90faf1eeb2631
X-cloud-security: scantime:1.600
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237486

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/758320

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32280.patch                | 289 ++++++++++++++++++
 2 files changed, 290 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32280.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 8efa82f862..0d4dff6c21 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27142.patch \
+    file://CVE-2026-32280.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32280.patch b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
new file mode 100644
index 0000000000..9a6f7950ae
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
@@ -0,0 +1,289 @@
+From 1d71a2882078ea5057e68a7d2fedc83a5227c764 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 5 Mar 2026 14:28:44 -0800
+Subject: [PATCH] crypto/x509: fix signature checking limit
+
+We added the "is this cert already in the chain" check (alreadyInChain)
+to considerCandidates before the signature limit. considerCandidates
+bails out when we exceed the signature check, but buildChains keeps
+calling considerCandidates until it exhausts all potential parents. In
+the case where a large number of certificates look to have signed each
+other (e.g. all have subject==issuerSubject and the same key),
+alreadyInChain is not particularly cheap, meaning even though we hit our
+"this is too much work" limit, we still do a lot of work.
+
+Move alreadyInChain after the signature limit, and also return a
+sentinel error, and check it in buildChains so we can break out of the
+loop early if we aren't actually going to do any more work.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes #78282
+Fixes CVE-2026-32280
+
+Change-Id: Ie6f05c6ba3b0a40c21f64f7c4f846e74fae3b10e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/758320
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Jakub Ciolek <jakub@ciolek.dev>
+
+CVE: CVE-2026-32280
+Upstream-Status: Backport [https://github.com/golang/go/commit/26d8a902002a2b41bc4c302044110f2eae8d597f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/crypto/x509/verify.go      |  31 ++++---
+ src/crypto/x509/verify_test.go | 150 ++++++++++++++++-----------------
+ 2 files changed, 96 insertions(+), 85 deletions(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 0ae8aef..1de06bc 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -939,6 +939,8 @@ func alreadyInChain(candidate *Certificate, chain []*Certificate) bool {
+ // for failed checks due to different intermediates having the same Subject.
+ const maxChainSignatureChecks = 100
+ 
++var errSignatureLimit = errors.New("x509: signature check attempts limit reached while verifying certificate chain")
++
+ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, opts *VerifyOptions) (chains [][]*Certificate, err error) {
+ 	var (
+ 		hintErr  error
+@@ -946,16 +948,16 @@ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, o
+ 	)
+ 
+ 	considerCandidate := func(certType int, candidate potentialParent) {
+-		if candidate.cert.PublicKey == nil || alreadyInChain(candidate.cert, currentChain) {
+-			return
+-		}
+-
+ 		if sigChecks == nil {
+ 			sigChecks = new(int)
+ 		}
+ 		*sigChecks++
+ 		if *sigChecks > maxChainSignatureChecks {
+-			err = errors.New("x509: signature check attempts limit reached while verifying certificate chain")
++			err = errSignatureLimit
++			return
++		}
++
++		if candidate.cert.PublicKey == nil || alreadyInChain(candidate.cert, currentChain) {
+ 			return
+ 		}
+ 
+@@ -996,11 +998,20 @@ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, o
+ 		}
+ 	}
+ 
+-	for _, root := range opts.Roots.findPotentialParents(c) {
+-		considerCandidate(rootCertificate, root)
+-	}
+-	for _, intermediate := range opts.Intermediates.findPotentialParents(c) {
+-		considerCandidate(intermediateCertificate, intermediate)
++candidateLoop:
++	for _, parents := range []struct {
++		certType   int
++		potentials []potentialParent
++	}{
++		{rootCertificate, opts.Roots.findPotentialParents(c)},
++		{intermediateCertificate, opts.Intermediates.findPotentialParents(c)},
++	} {
++		for _, parent := range parents.potentials {
++			considerCandidate(parents.certType, parent)
++			if err == errSignatureLimit {
++				break candidateLoop
++			}
++		}
+ 	}
+ 
+ 	if len(chains) > 0 {
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 223c250..f3711ac 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1765,10 +1765,13 @@ func TestValidHostname(t *testing.T) {
+ 	}
+ }
+ 
+-func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.PrivateKey) (*Certificate, crypto.PrivateKey, error) {
+-	priv, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
+-	if err != nil {
+-		return nil, nil, err
++func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.PrivateKey, priv crypto.PrivateKey) (*Certificate, crypto.PrivateKey, error) {
++	if priv == nil {
++		var err error
++		priv, err = ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++		if err != nil {
++			return nil, nil, err
++		}
+ 	}
+ 
+ 	serialNumberLimit := new(big.Int).Lsh(big.NewInt(1), 128)
+@@ -1779,6 +1782,7 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 		Subject:      pkix.Name{CommonName: cn},
+ 		NotBefore:    time.Now().Add(-1 * time.Hour),
+ 		NotAfter:     time.Now().Add(24 * time.Hour),
++		DNSNames:     []string{rand.Text()},
+ 
+ 		KeyUsage:              KeyUsageKeyEncipherment | KeyUsageDigitalSignature | KeyUsageCertSign,
+ 		ExtKeyUsage:           []ExtKeyUsage{ExtKeyUsageServerAuth},
+@@ -1790,7 +1794,7 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 		issuerKey = priv
+ 	}
+ 
+-	derBytes, err := CreateCertificate(rand.Reader, template, issuer, priv.Public(), issuerKey)
++	derBytes, err := CreateCertificate(rand.Reader, template, issuer, priv.(crypto.Signer).Public(), issuerKey)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -1802,81 +1806,77 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 	return cert, priv, nil
+ }
+ 
+-func TestPathologicalChain(t *testing.T) {
+-	if testing.Short() {
+-		t.Skip("skipping generation of a long chain of certificates in short mode")
+-	}
+-
+-	// Build a chain where all intermediates share the same subject, to hit the
+-	// path building worst behavior.
+-	roots, intermediates := NewCertPool(), NewCertPool()
+-
+-	parent, parentKey, err := generateCert("Root CA", true, nil, nil)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-	roots.AddCert(parent)
+-
+-	for i := 1; i < 100; i++ {
+-		parent, parentKey, err = generateCert("Intermediate CA", true, parent, parentKey)
+-		if err != nil {
+-			t.Fatal(err)
+-		}
+-		intermediates.AddCert(parent)
+-	}
+-
+-	leaf, _, err := generateCert("Leaf", false, parent, parentKey)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-
+-	start := time.Now()
+-	_, err = leaf.Verify(VerifyOptions{
+-		Roots:         roots,
+-		Intermediates: intermediates,
+-	})
+-	t.Logf("verification took %v", time.Since(start))
+-
+-	if err == nil || !strings.Contains(err.Error(), "signature check attempts limit") {
+-		t.Errorf("expected verification to fail with a signature checks limit error; got %v", err)
+-	}
+-}
+-
+-func TestLongChain(t *testing.T) {
++func TestPathologicalChains(t *testing.T) {
+ 	if testing.Short() {
+-		t.Skip("skipping generation of a long chain of certificates in short mode")
+-	}
+-
+-	roots, intermediates := NewCertPool(), NewCertPool()
+-
+-	parent, parentKey, err := generateCert("Root CA", true, nil, nil)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-	roots.AddCert(parent)
++		t.Skip("skipping generation of a long chains of certificates in short mode")
++	}
++
++	// Test four pathological cases, where the intermediates in the chain have
++	// the same/different subjects and the same/different keys. This covers a
++	// number of cases where the chain building algorithm might be inefficient,
++	// such as when there are many intermediates with the same subject but
++	// different keys, many intermediates with the same key but different
++	// subjects, many intermediates with the same subject and key, or many
++	// intermediates with different subjects and keys.
++	//
++	// The worst case for our algorithm is when all of the intermediates share
++	// both subject and key, in which case all of the intermediates appear to
++	// have signed each other, causing us to see a large number of potential
++	// parents for each intermediate.
++	//
++	// All of these cases, Certificate.Verify should return errSignatureLimit.
++	//
++	// In all cases, don't have a root in the pool, so a valid chain cannot actually be built.
++
++	for _, test := range []struct {
++		sameSubject bool
++		sameKey     bool
++	}{
++		{sameSubject: false, sameKey: false},
++		{sameSubject: true, sameKey: false},
++		{sameSubject: false, sameKey: true},
++		{sameSubject: true, sameKey: true},
++	} {
++		t.Run(fmt.Sprintf("sameSubject=%t,sameKey=%t", test.sameSubject, test.sameKey), func(t *testing.T) {
++			intermediates := NewCertPool()
++
++			var intermediateKey crypto.PrivateKey
++			if test.sameKey {
++				var err error
++				intermediateKey, err = ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++				if err != nil {
++					t.Fatal(err)
++				}
++			}
+ 
+-	for i := 1; i < 15; i++ {
+-		name := fmt.Sprintf("Intermediate CA #%d", i)
+-		parent, parentKey, err = generateCert(name, true, parent, parentKey)
+-		if err != nil {
+-			t.Fatal(err)
+-		}
+-		intermediates.AddCert(parent)
+-	}
++			var leafSigner crypto.PrivateKey
++			var intermediate *Certificate
++			for i := range 100 {
++				cn := "Intermediate CA"
++				if !test.sameSubject {
++					cn += fmt.Sprintf(" #%d", i)
++				}
++				var err error
++				intermediate, leafSigner, err = generateCert(cn, true, intermediate, leafSigner, intermediateKey)
++				if err != nil {
++					t.Fatal(err)
++				}
++				intermediates.AddCert(intermediate)
++			}
+ 
+-	leaf, _, err := generateCert("Leaf", false, parent, parentKey)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
++			leaf, _, err := generateCert("Leaf", false, intermediate, leafSigner, nil)
++			if err != nil {
++				t.Fatal(err)
++			}
+ 
+-	start := time.Now()
+-	if _, err := leaf.Verify(VerifyOptions{
+-		Roots:         roots,
+-		Intermediates: intermediates,
+-	}); err != nil {
+-		t.Error(err)
++			start := time.Now()
++			_, err = leaf.Verify(VerifyOptions{
++				Roots:         NewCertPool(),
++				Intermediates: intermediates,
++			})
++			t.Logf("verification took %v", time.Since(start))
++		})
+ 	}
+-	t.Logf("verification took %v", time.Since(start))
+ }
+ 
+ func TestSystemRootsError(t *testing.T) {
+-- 
+2.43.0
+
-- 
2.43.0


