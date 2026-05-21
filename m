Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70978CD5BB0
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:28 +0000 (UTC)
Received: from mx-relay08-hz12-if1.hornetsecurity.com (mx-relay08-hz12-if1.hornetsecurity.com [94.100.139.208])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33067.1779358222260076140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=psxMg6k8;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.208, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023073.outbound.protection.outlook.com ([40.107.162.73]) by mx-gate08-hz12;
 Thu, 21 May 2026 12:10:20 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsST8zmLH+I2AsorDopmlyBGZR/yVfXKOQVA9U6iaGdZ2e0glGTbNrFUin5RB5CfMTTU0KFR5yCbyqlbcEV74cS7kjSJrxCxA6xsoYMM9l37CfTilEqyB7PSdaytzPapdN6mgNdpXwxhw8LaLvCU5hHepiMBb4gINiDD5vzAdKj+WMpjkcxq5dR0l7Z4ek80r8t2FOXJjbyUrsY7JN9tMt6GStnD5bMfv7EhH9OzSFcW81u4v1td6vH7qOLxNcZPWq9Jb/z15bC5necIu68y4mJQUE5PlD64waHiFKhoBE5BL5wki7gpReoRGKJDF/FJAH0sb8vBtW64yPItCQ+D1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK/7tdhmjTP1kmVNMuvUuIBTz+DCp+t6Tl7amrUc1Cg=;
 b=dzkBoM+shtFeVqx0B+72fYvMli7h7klFH4yp9Nt8Qx/F6q4howUxtgCGcTQJzF21PdYOHK8lViBrBrdVcaaqjnVB02bs+19tw55SZccGNfcL83OmQ/JyCcRlw8af/R7sFL4nrCm0oi5TgZ0zXt6LcteOxoR6QBaxaM0ispN05huTYUzMZGNZ/tGxUJfvWg3CX07oreP05djS/hhnud+OvBYRtzkd71LDmSVoXkOm9mEen1RVkZ4fN6GniHrTXTvZWL1Vr2jlA2qa7g0hf2PvBOKbemawdNEhLZeAqrCZBDsh202JTLKm7N1OrkoNzNesTc3tufeF0Fs28mAywNdQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK/7tdhmjTP1kmVNMuvUuIBTz+DCp+t6Tl7amrUc1Cg=;
 b=psxMg6k8CnvrglrwG3aI9/P+1DE2wIJxAjCoW19DMn9EY0KdACfPqI361+wG4/ObqU5RRxObqTNh5JZQ1p3LLvstlRHmj8WMOcpA/SYH+wTVPNlJUtu2CVOmJp+9mo0OV7xm2AzYs42RAqc5x44IffKSVIaA9uMsr0pRzVhwWcAnZyBh0bgpBG8CTQgS1typGgsZMGeYkvdxlfILm3rfpmuoRz06EN3QC7VeucjoM1utPNnj+yNhEAsYMDaqSTTIs/pKFT/sqlwGF4Dz7VEC+WDqsNVFd2YFMnKraDmwamG+jJ4BbiSGSIqsQ2R4Zx8xE/ZhOdeDVTr9WG00iz7OkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AMBP192MB2913.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 10:10:10 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:10 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 09/14] go: patch CVE-2026-39825
Date: Thu, 21 May 2026 12:09:42 +0200
Message-ID: <20260521100949.1299757-9-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b81923d-f1cb-4127-424a-08deb7212408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|22082099003|38350700014|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	U6aPX9w6Y/QKMmYdmEgxDLtgfBTQfC6ngYGfKg3I+n8Jf219m4MM6vZMPNcbvW/AISBp0XxKBzvE1zKNswkIvuxaPC/Di1xb6sTGp8iaVBzaxdvDFbE5V6MVihIBIMiedWdEgCvHpyQW+eG9q1s39qlS0k5jBOORV+PwggrSVVEo1mTNALEZdyT38l9FvxGIevj6fXTZXzWFVVdCFFgtar941CeOcQLIjH8ijDRb3IWPqSm3ShpVIo6kwMqaqIqxFIntH2uaafXtFrYzhStNqDHCyT1dpa43llb9D4/FoGmXOgHuAUYVk0GcWVacXi50Ff1hcAG+39r69n3tMoqX2hrfZVPZuy/D8+BgpCb61Jb5dex3zWup/fTF01C0lZimC+tbThXlkXx+f1V0XFprzvbNaiyhp7wk4IFmua2cn14Wk4rhP2D6nmBjkEKrl18XPKWuGkXp//H+M7ecAbZn6v33HoRid7c8oOpAYMhHXpktqrPsBsfI1FlEFiHSWlA47ERaAuPLQfjCCRPadakOVPSFrxhU6Gmv5bnUVvlpzHV99yB9P9R+gM6DHg+Ac8p/Yl9Q++/xHwUIulgON6KY7A2BCmWKt2cPcEUZtramRaKEzvA+02jXOlgl4EeqiXYlxIy2U6Wyd/Q5MaMbYmWH0XXKOSXvFIgBr5o0JWa1UEfcKEsMLfUsDForn88ZMJFAHnhJH418hx5OwMecRRQIPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CXXb8xZKIfVLJ/Be1wEO4ENtoJrDFg2GIeSen4bwpiGHLLEnoPrMADseAHpO?=
 =?us-ascii?Q?fR1mQotdhjjBb/EGPoXmUodg1IRx5LA8NZj0nbNEEvS32XJY19O3vfuQ4X7+?=
 =?us-ascii?Q?PfLcsnLH6agUZigwBVoTSzbB1kdLdVenrR2PEkM1S367PiVbLUxDCMlbhzae?=
 =?us-ascii?Q?bs1qGIFITZToqtWsvZGZ9TocJ2Z3YNFnMCsbldETeSnw3IvNkpZCLcPs4jpS?=
 =?us-ascii?Q?0PLKaCC4o9q76K1L6wU/ppWygXJt/F/dAiU8n9qXWFjRoNRcp8+csdtEZeDd?=
 =?us-ascii?Q?tGEeRFslBEp00Rc52YV2mycBQ3PK0CLPiWDXbV87+kKg3oSUSQgXXiQW6kwg?=
 =?us-ascii?Q?971FDnXcvCRi3UidiGisjlN9l7X9a2Md1xxIKPYH/X+ZNZDB0oSsyQiNlFdu?=
 =?us-ascii?Q?0Yt/PuMd4DMkAQKuQm5UWKRdvnVXxjI7G0GPLyjMOhRQyqCNB5482/ORAmrm?=
 =?us-ascii?Q?+Hi33HQ/aCYniosof3IZdQyTPH+mB2Sn7L/t/IwQyAZ092Yn6/rmX8HETk/+?=
 =?us-ascii?Q?U7XnEhVk8AR2JAN1yFPqDKKHvcuAgtX8eZPU0L6xF5oLs7mDK42s4HdChJLM?=
 =?us-ascii?Q?3fNy6meJPPBdNOHy1wdrow12+vtGYLXSiGDQGNR+VcCkLLGcdnwjWlZPxUXA?=
 =?us-ascii?Q?bTmB0JYtw5sGmZT0MSRxV5GLoSxuE0xEnYBUqZYT6575n9IlgIGhryLboUqg?=
 =?us-ascii?Q?4vT87dpmbxcPlyh7xMsNjhXpFMCWb65FIdMGnErLdg/vN9cGSr/57zCxfRh1?=
 =?us-ascii?Q?V0R75G502wMQBCapY/ATkbg7amODek6M+q7BSGdNrg7ZrwV62JICdQ+Tikjl?=
 =?us-ascii?Q?jAnb1TYGz0Ry0vupbwbEtn9dFXcdzox9hxz5Ngdu8oWlSzNLCIgc8lOyH71v?=
 =?us-ascii?Q?WttqvP7w2afZyy6qaE1+xawG6aIubFXM9Ah0uix576cpnz+hnD+01JTaNvWn?=
 =?us-ascii?Q?nwEkWeBBW2I0sMdTO+EWXdNbK1w45/4x3fuq1VMqgC1b7/TuaYsCOB1K94UY?=
 =?us-ascii?Q?5RpFwJOYeb/YxoRDOgC57u9XhSXzpEdEOlUE3Jo9KzCbVXHa09JCsytGcSVy?=
 =?us-ascii?Q?x63o8bqVdZ44fTwulMzareW14YnAEoEo4QWUc3NSDjnOcRxiMJHEi8nXg9FR?=
 =?us-ascii?Q?h02zRA3gGrGzTV8/YFWivYuI94dyhGoE9aPidL1X0gdFeSiDgvyXK9irkZS2?=
 =?us-ascii?Q?cubCiyQDOg9KD5VkNbfGLs+14C5AXc2HMeGf6dZSJwbNQtYtMp7kjW0D6Htq?=
 =?us-ascii?Q?Sv7Ycbk9S2tO1ELqy9GAgU/KwKMwUvjB4NO6oTYjlsMxQh2SbKYd01sA+vfe?=
 =?us-ascii?Q?+jfw2kRtVk4nYTE5zbcwXBTRNl2Og0d4Jag0kSQAMOjyJ5pqRQ7Q7EjaBP+Z?=
 =?us-ascii?Q?SNe4YC88AGGyQ8abI1VhT2LCsieJS+hcwmGgVYKAPyWhJnjcrIGwLCBeQgRQ?=
 =?us-ascii?Q?S0+k0sT2tQoLEwiH4YsoVTr8IyrhR55On+PpGs57vf56pZ4pFAlBv72Q3Cf/?=
 =?us-ascii?Q?DXBFeASvSPJNUDpXL/eNvU+BV2qT+rqpdcMFv5wpAAv5yPH8M2XZ3O/3lHuA?=
 =?us-ascii?Q?DlMOrv7x/Ylz5zM4a6/1Q69CYSOkYUEwi5eFBSAj++Kd1xNRA5PG4Avq3K+c?=
 =?us-ascii?Q?NfygJfDbtw3FplyVIH02YlSBu11lpfIx44eHMScmS8s2vyh4gSCPbydJQmiD?=
 =?us-ascii?Q?lUMkzee7zKEypmZT0pxf8RVxKjXyTcSV2uXU/Q6ROE/lOQl4ODWy66OsdHIF?=
 =?us-ascii?Q?BTtJ5QtRoA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	RvPsNEW4l9h5YWTYDoX21zQdGjuxkYhC5z0xiFjue3VWs826dn2QzvJaDjD8xmIThseMZE5UVQcTj8BZPzcsXi9Ye+JrvlQzHKkqgP61lAlwDz9h5U893905snmHrcB4+kbnpmeFIQvUvVCN7433Jms2+gJRQWvc8rqI3/RQPJoGwR++XWEM/7LZ7kMjGx0Wzx6AqSRdIiWauVZv/Bb5j14tp2bx9qXReYzt354rQOh7CiIXbwkjhqQBpz0VRLZwC3Q22ge7LXF9MoOqwvrLGVaw1Wkzk8xY+C/XUpxP272/X5ACntAqZhxguozk+dstZNSXuEXmqCu7BVFVSH5woA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6K2HLl40xP7ahAjG+cuvmIPbmJBqyAStzpo8MWHJw7SjzPYtXImBtcH7byEV7YgZ5c8MwgPWgWqRwGmmFLC6hrfo9FM8juAScVJeWvCV4Kg+may2Yl3/+/ca4t/mcB4grJ+VCdyrIkqDStvaj3l4cxlKy9digDE6Z+N6QE3xgEcDHmCqukdXdVVfiew7xBk0fyL6tIbHM7bzOn+E5Chv1fbHAoIKsA36lgvIrCavAOvi3eMWAwaCAafz3K60Esajzs5CvivRzZ/IihGSgDhYn0NkGRUP+eSHWy3928wRiYh2pN+zx7kjK8ijasfBI0GsYmmmUDGNCThSuGw332e7hOy6bokw2GQmB+J5L0lMhh+3eOabz9d4+NVPCPlHafgcOCcnTAIyQdp6faVOjmM55MRU09huD8m/Pw6Cy5gYVOERkZ2yLXJnb5XD24DAIKfibUQ4b9nv+ByWk8Sv60tPhzxmxnSbvFpH8ZVoHHB8hFvp22um5l1xJmo/TY1NBSCx2RQ2EQLxtEF6MCaOgJOPvQstJY6YhjVmZSZocBoZZMzZvnipAMZ8Whd+7hT3iuKYW4iZjzjax1taBA9mjnwhg5kJ37uxRw3IhtowPniGs0x9FT4uWHWCqkUeOtPiywaW
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b81923d-f1cb-4127-424a-08deb7212408
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:10.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7iV75bUnRBNZdGZjOzt3K5DJS0L2Itl04zkVNKzeqUdXr1cQg/HjLi0B36AThzT2oqVJ/HS6htj7JxEFzKlQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB2913
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate08-hz12 with 4gLkgB5Rx4z4HMcD
X-cloud-security-connect: mail-francecentralazon11023073.outbound.protection.outlook.com[40.107.162.73], TLS=1, IP=40.107.162.73
X-cloud-security-Digest: 8993aa7c0b55e104cf54ccaed682c5bd
X-cloud-security: scantime:1.637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237489

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/770541

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39825.patch                | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39825.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 002d443059..952c0e4638 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -49,6 +49,7 @@ SRC_URI += "\
     file://CVE-2026-39817.patch \
     file://CVE-2026-39819.patch \
     file://CVE-2026-39820.patch \
+    file://CVE-2026-39825.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39825.patch b/meta/recipes-devtools/go/go/CVE-2026-39825.patch
new file mode 100644
index 0000000000..6082f5fc37
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39825.patch
@@ -0,0 +1,104 @@
+From 96b1a3f872971fc38d9f2c0ed4a3d1f3ceeb517f Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 24 Apr 2026 14:10:47 -0700
+Subject: [PATCH] net/http/httputil: reencode queries with many parameters in
+ proxy
+
+When ReverseProxy forwards a request containing more than
+urlmaxqueryparams (GODEBUG) query parameters, reencode the
+outbound query parameters.
+
+Avoids potential smuggling of query parameters, where the
+sender sends many query parameters, the user's Rewrite hook
+fails to observe those parameters due to the limit being
+exceeded, and the request is forwarded with the full set
+of parameters.
+
+Fixes #78948
+Fixes CVE-2026-39825
+
+Change-Id: I691be7899c4b6208bf61f6b78dacfdf56a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/770541
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Auto-Submit: Damien Neil <dneil@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39825
+Upstream-Status: Backport [https://github.com/golang/go/commit/6795bb331782b33691f772d30c810b4c3a317aeb]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/http/httputil/reverseproxy.go      | 14 ++++++++++++++
+ src/net/http/httputil/reverseproxy_test.go |  6 ++++++
+ src/net/url/url.go                         |  1 +
+ 3 files changed, 21 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
+index 5c70f0d27b..37b0eab6b0 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -10,6 +10,7 @@ import (
+ 	"context"
+ 	"errors"
+ 	"fmt"
++	"internal/godebug"
+ 	"io"
+ 	"log"
+ 	"mime"
+@@ -797,11 +798,24 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
+ 	errc <- err
+ }
+ 
++var urlmaxqueryparams = godebug.New("urlmaxqueryparams")
++
++// Keep this in sync with net/url.
++const defaultMaxParams = 10000
++
+ func cleanQueryParams(s string) string {
+ 	reencode := func(s string) string {
+ 		v, _ := url.ParseQuery(s)
+ 		return v.Encode()
+ 	}
++	if urlmaxqueryparams.Value() != "" {
++		// Always reencode when a non-default urlmaxqueryparams is set.
++		return reencode(s)
++	}
++	if numParams := strings.Count(s, "&") + 1; numParams > defaultMaxParams {
++		// Too many query parameters.
++		return reencode(s)
++	}
+ 	for i := 0; i < len(s); {
+ 		switch s[i] {
+ 		case ';':
+diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/httputil/reverseproxy_test.go
+index dd3330b615..deb1ab9ce2 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1845,6 +1845,12 @@ func testReverseProxyQueryParameterSmuggling(t *testing.T, wantCleanQuery bool,
+ 	}, {
+ 		rawQuery:   "a=1&a=%zz&b=3",
+ 		cleanQuery: "a=1&b=3",
++	}, {
++		rawQuery:   "a=%zz",
++		cleanQuery: "",
++	}, {
++		rawQuery:   strings.Repeat("a=1&", 10000) + "a=1",
++		cleanQuery: "",
+ 	}} {
+ 		res, err := frontend.Client().Get(frontend.URL + "?" + test.rawQuery)
+ 		if err != nil {
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 5219e3c130..41f3bef1ee 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -961,6 +961,7 @@ func ParseQuery(query string) (Values, error) {
+ 
+ var urlmaxqueryparams = godebug.New("urlmaxqueryparams")
+ 
++// Keep this in sync with net/http/httputil.
+ const defaultMaxParams = 10000
+ 
+ func urlParamsWithinMax(params int) bool {
+-- 
+2.43.0
+
-- 
2.43.0


