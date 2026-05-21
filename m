Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93036CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:38 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33226.1779358228770279756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=auTmsS5q;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:26 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLB+m2x2f8fBoYEw3KeyvNqBkXEngRyoqwpRPNK0NyH357T5YKgeNbl4e/gm/QACc+zTfEw2tY9qAd/aRKu33qdOhVITCXWUT/ClfnrAbTuRj78B0t1qLsMW8cYlJXA47PbZj5sf1JNqQLJ5mFdRK1+puhnrFAr/Gr2A7mHX+qeSiTbcRtEgb3yKJJ6OQHCdbjM9wAhzQ8xDzTCvhDcBfxnPuI9ol5CtrbSLeaE0tHE5cE0V6lYeLhoXJwiQkeXa3S26igBbonyQHpkQqkMM00kPD+ErbCXusUs82IR+Md9snBuZdEygan90V8gPMtS3IMfoNmQJQqI9vQI3kLgSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeSduU0HRdOjUaFoK75zIoMWMulgkHzCMZLW1DU8wFc=;
 b=NUJDvVR7eD/QWEdVUTK6w0ubISOfgStitMAN4BSD8ynmeL8rJJbuQcMGtkfkVXpTQhBrzk++n/9S2tQcNZiccxxOsd5xqe+NpeExob/wKlX49PknxnPu2YelbW2qf3weOyaHrh6eg5RKhGIkoSaBIGjI9G8i/SnR1+l39jwJLVfx8uaJJPTAwu3MshQHaJ21zbTtpEl1jewG7eo3EIy7H6HUX8yMtqSvqGSmwc3VY9ukwnT5xVAULq21wmd93ddbYqRk435KBQ1y85A+mj0YIErgHryivbmYeQHLFZQX8R5O9T0FyWYQ4T7lmc4CnM+KBaTGUmf3jRZZp1K7r1JBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeSduU0HRdOjUaFoK75zIoMWMulgkHzCMZLW1DU8wFc=;
 b=auTmsS5qE7jJUpxjlMPQBnyLhx3YNRrXp/+8xcMZl632x3Tg1pmUYCkKogNaD9GcbNtZmPxruwvAf1jrtFTdbDTEkpzhGKPXuf+BBiPbobHFf7BT5bFJzkZq9cxuM4A4eojHBn8CEmacetjlxjiQENzrNqHTo7XTL/YNVCPU8ScI6kJF9gLdpBhDHKhQnzr0n3Y8cyc2qyY0jgCf7SXVlt4Egx+hMgN8RH95lCL8oYt/fiwRFrth17xJBDg0xGKOwRxkl/2ixki1/tRzkp+4zsmqF3VJ7AnqWpwWPZ3FR6oPlA7f0Q3tyufxmRWxYQqQPgZCs+nlRQGmBhWzrtVGBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:07 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:07 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 07/14] go: patch CVE-2026-39819
Date: Thu, 21 May 2026 12:09:40 +0200
Message-ID: <20260521100949.1299757-7-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c9e272a-45d3-4846-dc10-08deb721229b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|22082099003|18002099003|56012099003|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	ejPVXcCwyUNB513SbgTDsNSEQN8mACV/rq3AT2Pibz9KUkgGpTF07tVRd3gHvYFKSLxSgKQ5tzxtw6G1XwsGGxKMvCMjcAT85M3xfOPLT5igHS/znrrn8rKEU6/xGCQRzHRBOJYqYD/rheyf3jKHrodtIe8F3JcnhfXIzbnu51iHwMBocXECvsCejiui1XoYOzdnDZJlZ6UmnuJlBksk+wKqtCqMRFCqtkLE0VaVFLn2dPoS/nfqRLlMndjXfxe3B3pQjebzmzh4XJozviWV2xIhsaMDpaFnzBdtgFOVOwYemd+6qmVoF6DHdGH6f7n1o8IlBKdMn1M8vn5M4Pc2Pg+BXfqAdW2BHiAWNkil/3ooggqwDGX8CkyIX69/Q2ms7xYBJunDq2SosZqh3SZK5UzAByNREg47hYtxLUWkzhyUk3FaXQh4AVujEgxI3X5pajxaJNud42Tc8kyPtUccojQOSV4CwlhFPYGZIOgSjdQPzmIytpRoLfEPap2AiyhpBvmb2bDUlIngbCuBgsH7yEXyRSCU48K/WkoVsWG62PLbEnH9qKfRc/ev8cb+1IBAHQZXGCm5F2u7KkTGTcVK55iNQpIe80CfOuqvpGCQIB/GRPNHsbIjF3dEN1ewmeO8jISs3ZBlUWbYa9iZ4LSARGEa71MHXSK3AqSl9wNkIFYh4OnLj5EoygKKh0Cqfh3fb6xQCQ9GLpv0LI6uSWgxRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3hcun5QSsdjMvZvprSg5eZ5759Hm7S6WSWwRLqrH5ebZWw355V6sdaqypAGZ?=
 =?us-ascii?Q?/AkMkqjahZflkgcCMc6xVxGfnbJPnQCXjj/gqLLkKQoxnpKSML5Mx3lcILu1?=
 =?us-ascii?Q?cUN+DqL258RYDbsuIPEscPbgN0FwvqVuYzO/jYGryeJjb6UjHPOLXuuwLLx/?=
 =?us-ascii?Q?u1UYGoe23GGhEI2SxxF5NrdTl49bienL+sBgfiQtYo9uzJe/8oCd9ygth883?=
 =?us-ascii?Q?Cg0gm1zTZ7k2WVeQYxcnF7plD0FsC/lTbdisheubagb1L5aam4xzD28zS1AM?=
 =?us-ascii?Q?Ts3nlMdxZoCCyKz6JzBkw3nn73S0oJBj0+1CAPiwrxiH1qOQeyvl5Dfqn5d6?=
 =?us-ascii?Q?3cMT3dnwqbf9UB++0yUMUI+dkLv6ZAhVtn/oi1UV/m1V64i2+LwXDWXTnCTn?=
 =?us-ascii?Q?sADo77Pl2fVtIqYqhDHOCY8DzdxjyX1zW+elQwmgTzlm/GdndWK3V1O0AqjS?=
 =?us-ascii?Q?2XfWsGtnzwR7m1llKcIDesWRVEybq8YCJjQ8g/PVFd2KTqQ6+wd6qDTbsv09?=
 =?us-ascii?Q?/GsV1cVtpK+TK1EzfFT+zEjKVV6rsoyZNQwdYO+IOhr69vdooEA5LQIm80W2?=
 =?us-ascii?Q?HD6Cjq1LhxldzDyH8kGiZNtmKecp1mmjGMsNhTudpnAGYJoPPI78aHGW4OKQ?=
 =?us-ascii?Q?gzf8N6ULJnIgDN7Dfndd3eUs9i4hhEISGPLNzyOYwFCuJhpIYvtYV++L15kE?=
 =?us-ascii?Q?Lawe/NLmXsyZStLxielV1wiXVt0F9szXQ9DciMKOF6Hd2+Zrxq/XQ87zeVxp?=
 =?us-ascii?Q?xgJJeEw5tuUohCO8NgN6Z0z4XCar8U4xnE3VTs6E6KIkwbnKZ3rXFNYkRkuO?=
 =?us-ascii?Q?KPjDPddu49uKBozptTDpar074V0Q1CawZWeJa0rkis4879047h6MokWrSaZz?=
 =?us-ascii?Q?h9TWQEV/zrOyudMmTtdvcfi3SpZmDDvKdYW9joPDI7d0AfO76PYpRkoOs7uL?=
 =?us-ascii?Q?QBkXWxw1iHTuvLQAtcePvYRWB37K4c8460w0r8cfc7PhmwTyNEBtb4V/5565?=
 =?us-ascii?Q?xXeuZsHcl2O3odo+O6PSxJrFIE9LgydDVUB5vturgAHfJoN75DcYKTTkN/Qg?=
 =?us-ascii?Q?ZXtUQg51cLJ5ZcRuHA1RL4N5QbgPvM5Qry1C/LYg/CCx8JWHDdXnO+iY7DcM?=
 =?us-ascii?Q?Dd7wVQMKaVKmxig2v4E15WHoYd0oPc58jmkeopTL9+/4B2AWkVchzhZwk2FD?=
 =?us-ascii?Q?WbvAJnKjiSismbcCX52+8+Q/FKEbpwXroldHWkbc3KHLN8d7jC8QwgxTqYnN?=
 =?us-ascii?Q?zQetvvuxUI194jMdGfmGPFI8jwXRJh948Alz+ovfjQD5cAHkNn4bQjRr0KUm?=
 =?us-ascii?Q?ae42RGq75agz4ojyVVECKtc6rPzGmnqEV1FrOe927lc43pXm9zYMy7vRDF20?=
 =?us-ascii?Q?aGyutxSqPjXSgm1k9o7Vh652lcQBhP3FpM55Vl2rXDjpjrnAx8+wtNmrSm8y?=
 =?us-ascii?Q?4nnlVjeM/a12vCU1ZEJgkELqdc1UBLxrqrYWBwoycPMtAVc0hr+YosboUy7N?=
 =?us-ascii?Q?Sjwe6xoqDDTFHK36+2Yl6NF217F9vrTCL+8NYs8c2yTsk5Hf/sYYN8ez/DuR?=
 =?us-ascii?Q?zAM53IuO85KpxUE7VCRZz6T8+bnrm0PVFkZKFR6ZL/orGyp1jkRttv7ZpHh+?=
 =?us-ascii?Q?288DwOKezTjbzGRjnY40nHwZKOYNl15+J6aboRkKJB4gmPl9xfyRLTtaA33L?=
 =?us-ascii?Q?kEWwCL0kpVBrDZlj/N36ts7TdRDith7V14+0Td9aoCfn63DqpMt/h7yRxoaQ?=
 =?us-ascii?Q?hNnoLRAdpg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	tH1QEPNCebbHIzFTrVefd2Scme/gaUOuJWnWunbiT4SZOY4h2ZOFPAeCiLaVPPrwo5xiM9El4eBy1AK0pU5Y+YJVoK/zZrfkL0kjYR11pxshOTTd+/Ls2/x6IOrk6safMq4+8xGvM9Y2v6rlMZ9uuxnjWS+MqK08d+JIMEVMvLJXNn1ZntLx/W4vxlR8TXC6woXEJwFRDBeiXR0lfZuNcBzWINxm05VfXhFAXhlVr6If4r428Se3MD2raS3Vbv8LIPeDOaFqnmQa+IOpA6AwTyf4y7CdBA4weA5MGqUr5GE+spq79nO2d8KPbXZhnMWREqSWSzJloMlFDBZNgrenuw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fIZIRyjtiCxnK/cDjmPAe0UwzACLuqHlZz2bZ0PW+PeNuBhuGFVuYilhVdAXk6W9MzcWm0vlpKUP3D/QLHGjrWp4bjqcLKPpgtxj5ntEw2xVgctZJrFeUPsoMhH2Z9Slx11mCHhZQdhMMiz4OhZ783QRCO26AUmcfj1xF/0lHpe35xePuwwYeRwx3gqxRZ04lQgrnS4UEQ7UEVBG48ieIjnuEum3X2QQGNppwDiFwrsFYzod1umMQwJ5gy8l9AzeVAcWItv4Tw4cciB8ihUTPf1cNtRxrqSbbJTChLou+24wJ3MEeUlw4ckeI6Jr+QFMEFBpnwzVjjQbfMHZ/K4i6GQMthZNFjcoJOxcQ5IwIPMPcSdkQlr9gUrcqRdYfcSVFN3qqVUYvN9uKBX/Lgx/NHmxlDEbJHjC8aNvyOD8KUf0f7gWcX2arIpB9YoTtWw10hV+LqLk+5/snzNo7cCptMiX84E474EIKizDvWUxr0603rCf43CupkOIUMPoC57LwUnO/l2SelIbdpQyVLm7n7nbWSh2Qq/eCkDiGuOcpT3NDJBZMigTO+YUgCmcW55y+gbBQGfcwenoYRzKXrQnsBQcKvJ1RoVqMF9n290S8pF8EDpJPFylTiHFPl9BzYj8
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9e272a-45d3-4846-dc10-08deb721229b
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:07.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4QSqtHlM85syLhglLYXrd2VDblrIUIV4pqzkl+r/5J6ZXoIpS6OhxzM4TAkwCDUcvLHAS6egv/k1PhdsnETdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkgL38CGz1X4Q4
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: b2dbd07ef9fd5b9d1a5d8d830558dd4d
X-cloud-security: scantime:1.360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237493

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763882

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-39819.patch                | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39819.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f06b974e04..dba826011b 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -47,6 +47,7 @@ SRC_URI += "\
     file://CVE-2026-32289.patch \
     file://CVE-2026-33811.patch \
     file://CVE-2026-39817.patch \
+    file://CVE-2026-39819.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39819.patch b/meta/recipes-devtools/go/go/CVE-2026-39819.patch
new file mode 100644
index 0000000000..cb767e1320
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39819.patch
@@ -0,0 +1,48 @@
+From db6ceacb046779c763f87060d8a1ba5c936309c9 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 8 Apr 2026 09:55:54 -0700
+Subject: [PATCH] cmd/go: use MkdirTemp to create temp directory for "go bug"
+
+Don't use a predictable, potentially attacker-controlled filename in /tmp.
+
+Fixes #78584
+Fixes CVE-2026-39819
+
+Change-Id: I72116aa6dd8fa50f65b6dc0292a15a8c6a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763882
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39819
+Upstream-Status: Backport [https://github.com/golang/go/commit/5d6aa23e5b6151d25955a512532383c28c745e18]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/go/internal/bug/bug.go | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/bug/bug.go b/src/cmd/go/internal/bug/bug.go
+index ed1813605e..9bf97dd511 100644
+--- a/src/cmd/go/internal/bug/bug.go
++++ b/src/cmd/go/internal/bug/bug.go
+@@ -182,14 +182,14 @@ func firstLine(buf []byte) []byte {
+ // printGlibcVersion prints information about the glibc version.
+ // It ignores failures.
+ func printGlibcVersion(w io.Writer) {
+-	tempdir := os.TempDir()
+-	if tempdir == "" {
++	tempdir, err := os.MkdirTemp("", "")
++	if err != nil {
+ 		return
+ 	}
+ 	src := []byte(`int main() {}`)
+ 	srcfile := filepath.Join(tempdir, "go-bug.c")
+ 	outfile := filepath.Join(tempdir, "go-bug")
+-	err := os.WriteFile(srcfile, src, 0644)
++	err = os.WriteFile(srcfile, src, 0644)
+ 	if err != nil {
+ 		return
+ 	}
+-- 
+2.43.0
+
-- 
2.43.0


