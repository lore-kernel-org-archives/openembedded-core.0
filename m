Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809E4CD5BB2
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:28 +0000 (UTC)
Received: from mx-relay08-hz12-if1.hornetsecurity.com (mx-relay08-hz12-if1.hornetsecurity.com [94.100.139.208])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33225.1779358227275345040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=UGQIrcex;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.208, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023073.outbound.protection.outlook.com ([40.107.162.73]) by mx-gate08-hz12;
 Thu, 21 May 2026 12:10:25 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+csqGZosbVHBY/+pRIPaF7hjvAD3hPKndtYofh7OMqXo7PLDjRfUaLu+xXzbfcS7U7tzaMFps1ZYOjVXrlB9yvnJm7pORqvKJ28EHMWHYQYHMwRVwJEtxbdplZyFV8nTp7W4dGwAtdHP8ThzIuAEfvdbMqukyiGmS48gj3bgbXW6yn1BPEXSLbGQY27dP3gu+iydRFFuBbXlKuhjlOxEKD9b3f4UbQQFPYfkn/Rs74446/XqV2DqQpCGVLOieE0SXHX0kX/sqEtxmgTdpAuRMd7sxVF1+nB/dngCaW3+U/04CXojOJ7KwRSkkTyedPfWI+C/MPt3gcbrDaqIyRoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr46NG6TuJa9DePcx7A3fGRr6NlDVmdBPJ+LkvBC3Vc=;
 b=YooWNNu215b9U/XMoIyXXg1BHDcTlNYcE6804J1sFVv6KHMvAVn4vMQbotC8CZVy4k7+PdTzoYbxwapoeBtK+w7/NvDI7W+sEGm3TksFk/JIGNjZg+WFBEzhWBCry/9nx637pTh6p/I+3AoZbZoFZFjsdTdXmoluyUN0vvuySDY5g1byrFfgAQLnA3ceZYi1cQGqEHb7bioaqaTUEYwWi9IMmUY35MI9WUEWCo7WakP0gsljyUV58H1YGNbAT6JzQlVHlviRGRuRFxGMCfdIeQ0fswf4TACmA6QLwSJrW8IhRe1uB1Xiogt5haUkLz6fnrjLNsCfXXIkp6yUmwbSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr46NG6TuJa9DePcx7A3fGRr6NlDVmdBPJ+LkvBC3Vc=;
 b=UGQIrcexLgif/zy97352n6gg3pN6sgj+/n4AqzwuyVUiRSyi/lgyz8ER5q9VRMNGN7LXM2UXSCfmjPDMraf28Flvata7JmxwUk5WbNqPHqvOgpiiv+92dzDKh64d+HpIma7FYBZ5z3B+j9pH5nafaBrVOuyKZJydh8U9cTwOqBSBaJs6E3+mme48hjy7KsV8NnIbCySq3ul9IDqZfMGZR073bKUeE776067JEmoL43oGiWhuCpZOWabu6Y8XjzRk28JHbZuwtGk9IeZnekYa7DCIV2p27bCoI9rrjwJdcsBqPTRMFgwPp7ZutUGfH4NTKA8BCaTRND9QuY6h2xVZAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AMBP192MB2913.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 10:10:11 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:11 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 10/14] go: patch CVE-2026-39826
Date: Thu, 21 May 2026 12:09:43 +0200
Message-ID: <20260521100949.1299757-10-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 38065bad-8e83-4d9f-f819-08deb72124bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|22082099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	GvdxyGbnbX5knDOZHuFYuThojfVWrTn6eVNQPni5r3su5x0JvN7Lar3cPD1ox3JkyySQ9EghWVnMljlvkNF8kwkSLiwVSoUBYDRBcqQ3Cqovoy2ERrV/ZvTOPxxC7aOtwUWx1eE9xl0BrDBu4hR4dA4dfevWfMEyJYdx2UrIfKr436S0mxN4oT127LVmbGwBqazQwgE2W4ktqzl+P+IYXhCUPi8uQGvuy9ZSvPvt8wxeKhYtoOsH+Sm8SjOR2wG4IyuRkgGSEiteoTTA6alzn/7nC8r2ExEwL2H7MRY5z++6cFnED7XtR0DP88xdOlTfMDCrur9ojA1Uv7gxdGc0lRzOQEwqevSAmO6ajEyDmX7+X2W2FG1SyaA5IISi+1gJ5WfUbZHLz1u9QboNnfooiOFPFbc7eGS/K21YSjRW0kFdr+/Y+aVSLz3OxbQ7YKW5Q0xy5bqSBF3u8h+T27tS6buoXq2idYY3QsDeV3b5nO7OrkRr26ZQ3MITRijgVjO8h/fjbwp1jEfqtxytDPBMUQZQwcFZkIddojk6z5Ai7c450zE08CvUj8bC86PoGu+ch1Xbspm8GYBwxGfSpzAD20yvE7xAU+kwIxF9ZS9+6+9WkvEjONwDrnfDz4jWqcAmt9cMZFsMqjUYRb6FF74OnzOYfheQVxNqDyffqLkKp9qEypfJ9aICP0eeKdQqaXhie5ofXJ4GGhi8NB23W+rX8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bGZazaJ+CWEetbQPxeBPawq23Nf1854nxejXfs3L5TcZjMi4+f+UD8/2L5bR?=
 =?us-ascii?Q?7ECx3YM2SXNRWTwI7dzcAHIQyNEa7jCG5P+8fMXixkE5IqQvPJb6JbiJHYpG?=
 =?us-ascii?Q?+7g67iI0UF/ySQi08Ou63hP7kj2ungMP/0HMjB9jmxgjLj6Mjv4i0IEkwQ4g?=
 =?us-ascii?Q?c+9btRNeDA5mKY4XISMS6F6Wh6lYH4py68YfvtIReegV/BlninjCRQ45l2bg?=
 =?us-ascii?Q?kqHYsBbgr8iQvuU9JMenScmAmqY1Y4YGdUUKDcc/jHX4cfYsTQrPv+6buoRK?=
 =?us-ascii?Q?5P+tHkLc46AGGsrsADECWJnTOpRLw86xVruK4OuiLzK0PrW7ifagRn+QUq7L?=
 =?us-ascii?Q?b8atb4lYCk0oMAuNN3NGVUmM+Shjqf+em/1BD8511323Xn0SJvyqZdBAsr00?=
 =?us-ascii?Q?5bEW+96EtzuIS6Gp8kvn970BGeoYHcgTdJeUKTn7A5sRh+sYmyyzdzpcVf1H?=
 =?us-ascii?Q?kHzV5qsCw30hCPTbHHsgyCjVVS2okonUBVzRkCIS7FXM0rISBKXWsRNDn7uU?=
 =?us-ascii?Q?P2prBSyj7JiEeeUVxqKRTcHcxcRfQSXk3TVHPeWQu/+QhYxJfdNy4KqDPKBn?=
 =?us-ascii?Q?xZDVyMmvG4PxlGoxHvBhoHtD6iziT+pEpkc1Cul187gpY884agQ71jj8qdpX?=
 =?us-ascii?Q?Sk3feDyYX4iC2e+tZn1mwI9HLt/NA34Bxr9iKtNZDiVXZXO//cY2+SximcNI?=
 =?us-ascii?Q?7DyV1DzTDJJ2nFR2Hcfvk7BOtjqakrEiW1X7gDwsVtT+9S671G52TtggQFPV?=
 =?us-ascii?Q?MzoeaQpZ11CMxKUDIskJKhzM1LLMykgllLSbl8hrPpa/zZmluXQQU6ng9Y4W?=
 =?us-ascii?Q?hpDg1ab+5swPzXIygVYxapTwjKiggKD9Qjc8H5ZuE70ctWau0vT4jCfo/4gz?=
 =?us-ascii?Q?RtTYuh7qrlztBIjFSLBHhU7d1pF/WPlJCnF5gRSYDvAyO0wpsgW27ha6j7pc?=
 =?us-ascii?Q?Td3YpW/MAEb38TQgLWRghef2jhZJVPZPbycpcYWGyKdOMqCcpU9hThqwKGry?=
 =?us-ascii?Q?R3rcSlzbZmYNh+OBDfb1hRLVAe7uhBmapfT/ut4UNyfHSZPe5atniyw7xFN/?=
 =?us-ascii?Q?GKEHntqPfdmZ6SwptHzQ9DJEIqLmlJrplPWqAuAXSIQ0vz8oppWCOI3LwZIK?=
 =?us-ascii?Q?I8jwqZx09sNykpumrTiBYxfCHtrxFo6FscI0SX6TTr3LyxpqNjDrbuRvQqBY?=
 =?us-ascii?Q?fCVdywd8eo4Pfg6zC0sI4iUlxOMmtb9K2ivy01npiq8p+a6PRcj2vc4t4xij?=
 =?us-ascii?Q?Q/h9F7garwjf+fpdsQkd6B3/2sB9FV3y+QkVeZ9KyQzX3FS20mmXjeKU/N7p?=
 =?us-ascii?Q?Q2asrGo2a7Kc4tmE3CA9b8axBtXlZ2E6F/h0H+hE7sg59Ub3SE4ipQdjS53+?=
 =?us-ascii?Q?8RH2STYM8aFjxrJKZ6OFfOcHKar9XLasvE1x4Mig5gvWkGRIAzncK2bV4gRe?=
 =?us-ascii?Q?s+7xzfezQllyj2AIOKWl/kyxA0H/pxsvQa/5XtIBq74IIxBzPhCbTOgt6tn2?=
 =?us-ascii?Q?8sYIh40JRelssodY2E3Ef3Aib0bvJwKjU8OIDN0dqJj2EH3a5Vt1O+no8YyX?=
 =?us-ascii?Q?5GFc4qaVoScaOJRcqZjeAN84MdjBY+Eita8ymlGJ8fZszviWWw6MfBbUnBiM?=
 =?us-ascii?Q?sLc718+0/ChVkcHleLT8bSyfk+qlC/rH66InPZdehaazMx8kb7VQiDiLhEZq?=
 =?us-ascii?Q?lEJRVnpCY7pD0H7JQsgGb1b36S4HVjMwjsHmgz6weFZU6KBFJXxsjvZ25WTu?=
 =?us-ascii?Q?0RnGYpkO7w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	RSZJ8da4yWz3THRHurGwqrZRaN/EGwT6IVKCj4UZvFI8KPv1e9P5ADnhFgy6iiDSEMt+JLeKkcSfdIbWwQQGY3YS7GQBpk+Qy/HTTCugNK6ZmwcVS9BPe+QpzUBd+5qNaRn7EzpWT4oAQS0TIN0I+a2EjUjQkc1A5sHxrgHD2YVlouRWfw1C+HIYxT/MuY/BCtNuPVR6emDbp2FzeGdCNmtdd34XD8GrP8lyj8mFbBtaR94WPDqLyl6bxsodQ4BMNYJviPDkOu4x4TUUHerYK6O5355cVCVYVQiuKat5Zzt/K4Bve/d9gtPUQHQ7osxJ++Iz7POX+VlO+hYO4Bz/aA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gnr/qVJZvFbS63GV9jD51SRx06dmvTsCZ5GlJVQWnfUThtceHwnwImeYZBQapl7byGzqQW0gn7DXLP9jUpc7tkOwiwaCyHXlo+CnLXoxeeI7Yoi7LqbfhSr4Lvw1euHA4EyBfXfa8W/7OJ0SODZIga+bv1vF181di505gQGRM5rfnBls1JY8IaSa6ulX49DkZDFzzDfywRucoDSLFEhG0sRloKG0CGgzdEWXLJKn0vE+Lhi5L5h1uv+XCN2ZVMPZ0aNtPTKZoaImeJyEni88HQ6q5E/xFP4EVOBTlzczqNCzied2DP2GPWKMpR2B5r8mR/K/QoLQBEvK+lP4Qaeq+UNwSAT+DupoTWPS6Q73p5Rgu20iMbeuWtj5/4KTL1gGx8nr/+mDkCYEjldKiSojR+bzQotVWCqc65xlP/WSSE5yasXLkTooJv6qCPrXTdYqrS6EXMc5oLWLI8Ca2gdSZ11IS3A/uCUXMLlO0RkktOYVx7C3zqfxbrrDiVhbxfDApinkRzz1oRdY3HrL5QryEvggocgF4rbPD72QU2Rha/MnVb94qHnU6EJM7RUYVw2ljWHD1yX+bK1icHv7S20mniXPHd5JX/RXEh2lnzasCCk1lvmYKSfbbXNTb2MVphzP
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38065bad-8e83-4d9f-f819-08deb72124bc
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:11.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/DGOaq/JJ5wg0LjKbctPiBX84LJHw1IaU9o1ea5YCQg1JdHHFPuB9XsjFAqFjISIPPTt2HLK2eUVk0EfuEiDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB2913
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate08-hz12 with 4gLkgJ37qTz4HMjq
X-cloud-security-connect: mail-francecentralazon11023073.outbound.protection.outlook.com[40.107.162.73], TLS=1, IP=40.107.162.73
X-cloud-security-Digest: 19a8a7efb30543788514116fd27106e2
X-cloud-security: scantime:1.449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237492

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/771180

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-39826.patch                | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39826.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 952c0e4638..77e6bcd59d 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -50,6 +50,7 @@ SRC_URI += "\
     file://CVE-2026-39819.patch \
     file://CVE-2026-39820.patch \
     file://CVE-2026-39825.patch \
+    file://CVE-2026-39826.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39826.patch b/meta/recipes-devtools/go/go/CVE-2026-39826.patch
new file mode 100644
index 0000000000..d9fa751adc
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39826.patch
@@ -0,0 +1,65 @@
+From 0d41a827f4d691be89c0285cd136cc45640341d4 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Mon, 27 Apr 2026 17:34:58 -0400
+Subject: [PATCH] html/template: fix escaper bypass by treating empty script
+ type as JavaScript
+
+Thank you to Mundur (https://github.com/M0nd0R) for reporting this issue.
+
+Fixes #78981
+Fixes CVE-2026-39826
+
+Change-Id: I3f2e06496020ece655d156fb099ff556af8cc836
+Reviewed-on: https://go-review.googlesource.com/c/go/+/771180
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39826
+Upstream-Status: Backport [https://github.com/golang/go/commit/a63b23ffb2eebc9ca3a14c369b615ca623bb20f7]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/html/template/escape_test.go | 15 +++++++++++++++
+ src/html/template/js.go          |  1 +
+ 2 files changed, 16 insertions(+)
+
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 435c83378f..ce06440738 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -231,6 +231,21 @@ func TestEscape(t *testing.T) {
+ 			"<script>alert({{.A}})</script>",
+ 			`<script>alert(["\u003ca\u003e","\u003cb\u003e"])</script>`,
+ 		},
++		{
++			"scriptTypeSpace",
++			"<script type=\" \">{{.H}}</script>",
++			"<script type=\" \">\"\\u003cHello\\u003e\"</script>",
++		},
++		{
++			"scriptTypeTab",
++			"<script type=\"\t\">{{.H}}</script>",
++			"<script type=\"\t\">\"\\u003cHello\\u003e\"</script>",
++		},
++		{
++			"scriptTypeEmpty",
++			"<script type=\"\">{{.H}}</script>",
++			"<script type=\"\">\"\\u003cHello\\u003e\"</script>",
++		},
+ 		{
+ 			"jsObjValueNotOverEscaped",
+ 			"<button onclick='alert({{.A | html}})'>",
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index d911ada26d..90cf2dc982 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -459,6 +459,7 @@ func isJSType(mimeType string) bool {
+ 	mimeType = strings.TrimSpace(mimeType)
+ 	switch mimeType {
+ 	case
++		"",
+ 		"application/ecmascript",
+ 		"application/javascript",
+ 		"application/json",
+-- 
+2.43.0
+
-- 
2.43.0


