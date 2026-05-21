Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5950BCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:28 +0000 (UTC)
Received: from mx-relay151-hz1-if1.hornetsecurity.com (mx-relay151-hz1-if1.hornetsecurity.com [94.100.128.161])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33069.1779358226718208552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=H5nBN+kw;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.161, mailfrom: tgaige@witekio.com)
Received: from mail-swedencentralazon11023073.outbound.protection.outlook.com ([52.101.83.73]) by mx-gate151-hz1;
 Thu, 21 May 2026 12:10:24 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISX6u2iEx2KunuznBc/HU9KEkaPjGcEUCvG1pjS9IaKZskl9GarDvEilJUHNBUUMZRomgPFuaqCuzv2pBCEd3xmMWwPp5yxgGXnJGnT++tR5kQP419XUvk3iALgohZOy+9H5REdctOX7KB5MjfktS/NtZDqow+VUjU4tO/W8Sh2XzxpeCLhHkFGj+g5BWwR1YQm1uqLWABhlAhaSr7H1ndpBo46Q/mItSn0JxquvrONbNM2q3fCLBdepAcM5XcnPQij/ER65BSmZY2u5rEPf/smQsotqLL66AuMnbTDgnkte4cO8ke8yTHEeYHmCOWi72rD2jt38v8xrkEwG5IfuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d7qBHymFaVtaRms77acxzMssMDY+LNAAX/oxmlp1u0=;
 b=h2cOGZc7kYoLMj+ERg4lp+jyqTMHdXpQGZWeoOzJGxNCkvLosKTnlQjlLL/Ji/R9fgc+d32qyBZPtK5iAOIx5hvvUjQwcpDBMC5ZVmchiQUvbNtiMAr+yGRcJIjgjygUuWc8Tr4I02nXGigG0b0Mr2dG2xfPuY70QGhsJlpHjEVSf3bUc5kvIISN/t5ziYbXghlUMSWVZoStH/DVdhxB77smY9EZSExE3jSDzsptYv1toQtvr/3YYFieJ64eRoykqkuf9hBUp0H4FW/cun8aragvNVbNRtE7F5DsbFj/qWASArdiMZcswSrgBLtPXNqodq2x39D9kFOkOU8v7Lll6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d7qBHymFaVtaRms77acxzMssMDY+LNAAX/oxmlp1u0=;
 b=H5nBN+kw67/1ZCFVrgKAW+XtxtM0vPtLu/kKlE8v/7R2zPnoaNhDlcc2c0mjbQ2IQtiKD9d+kBiHUTT8nLKkr7FOBxC1TOD1In/L8ttaaxlqeSfilJ2gSq6Je2Fq3kfLamqGfMATkgchEqYeuHIK1pbOPEDwOI0V6Fa5dEjgf8VyDOBG/Og2AC3iVZlWdY0JUHUnE3L2g9V/4P0YMRurCy5SwcaTGVd445lNh+XcpAAZte6dR53Kr4qXEzqxPxkABXoxFYS0eS+wWnhnceNVo+71CFtw73mcEbKNIowhMfCjCMVpqemRrY/ECuoHli6hAa/ningWsFe/2rtSj45yCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:05 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:05 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 05/14] go: patch CVE-2026-33811
Date: Thu, 21 May 2026 12:09:38 +0200
Message-ID: <20260521100949.1299757-5-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: c564b392-83cc-4ace-fd91-08deb7212131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Q+s++vTrAqMIdwVCdM09cCU+qa9HGoWidPPdr8D75ngrcepKdOxcgTHioRGKf4Yq+8T150WC9TRlDLVygzwAAVQ8tp1Br6gv5IY/2V6nCaa4weCLS++W5JykKPKMRPTyM9fA9/9nvbUR+79U/md32rlqSuBza3Tj31qX2dZrCM6yoHnAi1EhGQ2HHw7mp+djjQq1PF1fJRvCpc9kOfJRVp33hDUnggFxyYHXcxOy0fzKBQ9fTrHcqLFl0qt0C4SceFia4JZTBj7L+RgnScY+x1YGbXiSh/7mzHIQzCpOBug5sOQuS6Gui/8+IcRNPQtzn9O4C1n7ZuZd/H1Fm0p3px9EAdtfiJGK8aT0f9FI0rGaaLXWQarFswoNLv0cjKspIoMEJ8+S+B58PzpnY9FQF8jP2Q65tKWyCubk3Q5iS7jaF21/sfaDEdwDVJSzY/F50MXU6UNvvIEpDbOm2l5dFBWwscnLAvq7WTmkOjnSl4pVkbSxHvNIuTRxs/FjcrdUlLCK0HVXCNqxg8ooV/OIB9xkNP66v3QQTKIQK0y2R0VwdDdBAPiZFJqlPrqis4vFpyQIJaNEFkDiCir16lQKsmpC85YAPQXSMjfNeqocCvBCpQNkKSLSgIRTtbWPA2Suz352fTArb9BWtYQUyrAUnidvAOYfgnd3oADWk6fXp2Ua40yg0l589Xmz0LpMrbnOd3h1kMGUMujmj4HLj4RctA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c8hZwZhOhcb6kfa8rv2BCxbXh4AFlgyL9zibryRukHcf7iYJEcfiP6qm1rPN?=
 =?us-ascii?Q?V7mFORZSDBz4bU+u33+wDFqsyY1CA/f2OZoMviGyxTX1NnmAyYQL6sHIDI2s?=
 =?us-ascii?Q?5oyjqbcjgUxPlgPOl4h9RMXIYdhchYLJOBHcTDDLtENOXzr5OhvZGQpyjCT5?=
 =?us-ascii?Q?QRC6UlvHYqMScpcDzoCHD7IXctjC+F9N+oJtQ78yIp2exE0Gp3eC9r4BM1Gn?=
 =?us-ascii?Q?ZFw3Bm49+3G+AkHX/3bO5iyWOMnwNIJzMjCKCE97lEXr4DinYE/7wmmMLgKa?=
 =?us-ascii?Q?zssUR6g7mNGEmz6z20sKIRYF+v2rtK83tC04aoFcUURkKAb/I5k6uXPa0gAl?=
 =?us-ascii?Q?F6dwBA1j8cJoiYI6eRPVAEsoG/2pZvUEK4UvAdS7hiPR0OMlEq6dtRrI1QTz?=
 =?us-ascii?Q?Wugx3Jq0edaZmi52xMMBNEqXG2CA3xhVvnYBd5MdYUFZXiZ+R8VTpLrCFlrH?=
 =?us-ascii?Q?L7N+QBUvkhu/VdorATrXPC+CsftA/c36UXoDzl7OTUiXJKrHckQfd1LU5yYS?=
 =?us-ascii?Q?26iwtZ/JalkCduI4dEm8sb0I3/u99hq6B0AdT6l/bt29Ygx6id29WoXXkvRu?=
 =?us-ascii?Q?1Md6qVTUSxg2s0xFNjSkG8E8BsqB6VVsjM9mOxmCUSmNguKpgjmhdcN34jvF?=
 =?us-ascii?Q?dmjLRafC9fSstcDO51wQtdgARbQ4ELmi9H5Vn8wjxWt9uP/2cmAK/csjX6vz?=
 =?us-ascii?Q?M0aMs2shTpgEJPYgEw8Gqg5FqFX1XShEcHSSAfjlmEEZnVsE7VXgZjjoetip?=
 =?us-ascii?Q?SO4ELFcmKLflIHSXEp49NdK8F+f898yD7wGcjCkyXlhb1+vcx4ht5nPTaSIx?=
 =?us-ascii?Q?IqeJ0PvAFUOVaS7Dy9QFfd3vSfIBQUVCZKWLGXICQcTrDpuK9iGM8Yy2Wo++?=
 =?us-ascii?Q?OaCUyRKAZLrZ9HfWnGTrY+siGxogxKjKZFMYOheddZD+GQM6GartEbFIW8E2?=
 =?us-ascii?Q?Ab604biby080cKd7wqZ9C9UlNvWCooJQFtcMIdn/ieebUByy1zx808LTVWe/?=
 =?us-ascii?Q?e19JDB1eTlJMgUP/rJ/Yv2xiyLG6ImRQ/y0swz8PDAlpyEWMdxh02AnZWWCI?=
 =?us-ascii?Q?jKmxYUWwDbFwe7YoEsHMecOaeW4H9zaSUyBI0yYyCUtqoi3T8iD2SQSlfWBi?=
 =?us-ascii?Q?TmbpmABLdynUO8QAZGzppqPTmDZxO2Z9XkbbVlHmwTzwTQka0sigOvCJkjnd?=
 =?us-ascii?Q?JcW5/i+VFHa6zOdPO0OuUIpd4yIC6T12D2Vpg4g1r4rZ1bJrohh4MupXYoxl?=
 =?us-ascii?Q?qIrT/lm7jqQsbgmUmXlbxeMKL66ANmT19IAJErrNCUEoFtRy9k/8smQ3DVLt?=
 =?us-ascii?Q?G8VnQZKwWh6oKPWJ1RxySmeB5vKPFeGczZy2yuDQX3eKrftcvaawdLUXL/MC?=
 =?us-ascii?Q?iX/MOMekBjv8vkurpWDTdYhkp6x8w6P8NnJj2NrJAyF8zYaU8yJaALzllYzh?=
 =?us-ascii?Q?kI5RUx9SGh7jTpWwvv1KPnng8g5qzdQPRTjobvmyDtqnLbS2djYNK5yvY21v?=
 =?us-ascii?Q?MP/GxQKTO+Eg8txvWG46p/g7lza4+G/2zKVyQjmG664hTDvRo+UFfYwpkD4U?=
 =?us-ascii?Q?Qfda6rffUv8Jzwyi7saMz+w1XVTINFMgTKAGF8QEu0pPj/2uViMr6ox15UpO?=
 =?us-ascii?Q?jyF+I4ZhPeaR+b17tsg77ZaNUpek6bLRzQd4BDc4Y6aeVckwzxpyOau007BN?=
 =?us-ascii?Q?qng6VVnQGS8tlsIadPyRX1uYud1Hc1NGT/lJxU4GwI21EJlQH1oVXY1ppgiR?=
 =?us-ascii?Q?Td0lzypMiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	bJvuA7xFI+JCrtlNTBzfnErD6na7iRcrvqTm7XTlqvpjotEXSOTEJ54HHf95ijxMWVB4JlbN3NoiBRCOU4YORh75nsRHRD6WNxEFqPOIKIGj1O5H1IOEiQDc1XKGajwiIE4Pkkvvd3h3s2CoMGhjY2fJs8qBjQWAwMnByP2T/keTgbWJEsLf59aVFT7x2tWKrKQowPL8RSFBDOWrGc71nOwIHwEGt/5hZ5u0xRZfavgy9XdzdbmLHBqvJgMN2kqcPC2U/uh6a+A94HsKNZAOlasquXkTYLIrOS6a16crgA4bTneCrKJeVdOga7acdwRX44O+79M7fH7jvJSckwC4dQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	51hNDyqSg120l6ciR1mVf5NN45Z0BHsXaEsuqgcMxb8Z24z/TmjxyG0CyN8SbimxRWc/2smjzQkYuNWHpbpD1Kmv/9Uz85EQuJ6/pqEHPJh6HM5v6Tg7wLPeo3F7IWnOJHwXv3aeuK8x+cUFDeZCNn2qO/QqCe7xThuEjyWb1XzmH3OmMup0Qyv3bnj/nD/o1r074QOFjT4lGchw3zXjOEYiBEympqnIRwaNpesYjhrDBlXLIUw1cW7khOgy9tLrGS9exkyuzQzdrhrEQdzbCjln1cy0qebuZxauSXrvTW1BFpaRDlI8yU8kkyVifjaAb7qZB1E7QKZ4Q1Bs6kLurHQFEkEh9ptZSvzhULm178HWDUV7hOWxTYHvXUc/Jc3Ihyq+4sp3Ho01/rjUvU+B1CEJvfQJxHFVnl3wsmhOGTMiUV+iR+hJradLbbvEs0nUi96hE33LqYVGmOkvHfoCGJnzJ+2/rorVtcp2ArWhMiwmqrwwgjZiFru8hc0+bDYVo648Bs4BS119TBLxqHq5LXGHvJRP9dgm23eHdooCfiaPRvITiZRulMYrsicfkh7LaAEdIKal3/4lw/reZgCooCoNlpMngUrHIcbsOMLrw3+oWmq5is5jRqmpGxaQXtPr
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c564b392-83cc-4ace-fd91-08deb7212131
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:05.2764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxUSuzxqSjVuMMvYbiLruL7ePYMf1yvE4k3Grc8Nn/wwQHzqVwMPvxgjnZNe/+j5SnIcc8VyWgQEbpT3shbd5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate151-hz1 with 4gLkgD1xrLz1fyR7
X-cloud-security-connect: mail-swedencentralazon11023073.outbound.protection.outlook.com[52.101.83.73], TLS=1, IP=52.101.83.73
X-cloud-security-Digest: e7977a9deee380870a6dc0efcbe4cd4b
X-cloud-security: scantime:2.037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237491

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/767860

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-33811.patch                | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33811.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 288cd5c95f..9a7695e754 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -45,6 +45,7 @@ SRC_URI += "\
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
     file://CVE-2026-32289.patch \
+    file://CVE-2026-33811.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-33811.patch b/meta/recipes-devtools/go/go/CVE-2026-33811.patch
new file mode 100644
index 0000000000..216b33ed8b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-33811.patch
@@ -0,0 +1,46 @@
+From 9082277a0a78af39190c1f23b622f02b89e46196 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 26 Mar 2026 12:17:06 -0700
+Subject: [PATCH] net: avoid double-free of cgo pointer when handling large DNS
+ response
+
+No test, unfortunately: I've had no luck triggering this without
+the ability to override the local recursive resolver.
+
+Thanks to hamayanhamayan for reporting this issue.
+
+Fixes CVE-2026-33811
+Fixes #78803
+
+Change-Id: I9e51410337316c20e4b9fd5b86657f436a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/767860
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-33811
+Upstream-Status: Backport [https://github.com/golang/go/commit/ab2c7eb1c43011dda118282c1e757d8c27cd7d4f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/cgo_unix.go | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/cgo_unix.go b/src/net/cgo_unix.go
+index 7ed5daad73..bd694859ab 100644
+--- a/src/net/cgo_unix.go
++++ b/src/net/cgo_unix.go
+@@ -343,7 +343,10 @@ func cgoResSearch(hostname string, rtype, class int) ([]dnsmessage.Resource, err
+ 	// useful in the response, even though there *is* a response.
+ 	bufSize := maxDNSPacketSize
+ 	buf := (*_C_uchar)(_C_malloc(uintptr(bufSize)))
+-	defer _C_free(unsafe.Pointer(buf))
++	defer func() {
++		// Free in a closure which captures buf to pick up a reallocated buffer from below.
++		_C_free(unsafe.Pointer(buf))
++	}()
+ 
+ 	s, err := syscall.BytePtrFromString(hostname)
+ 	if err != nil {
+-- 
+2.43.0
+
-- 
2.43.0


