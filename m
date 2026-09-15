Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A72C982C4
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4962.1789499796613908729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YrfbO7sa;
 spf=pass (domain: est.tech, ip: 52.101.65.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iijknouU9ceCY6LhIZpVOwYhU03VrdI5/HuTFDmrpVaO4rOKycbMJzDBP6urh0G/4ouu7WfXYnrY7uwSEbkq51YTXxIQ8Q2SChB5IpkCs1VJzRRnKgsYP43nHKm4EmEWRgPWcoyCM2JgzBIgFQY8bNd5/YZ5kRAxEXtOIPb9ZXNEAwbO+coMAq6mYrjonuuFDI4/iG0CQtLEYpxy6QTM7+T/DcWC6uiNK+Q1iA/5gnWO6QG1/v0nhcSbvw/3jluQL5ndYv3M66uINPSylsn4+Mkl5K1syL68qu/S/LFG+pQsetK8ld+DoUxNb3SVvi3wXUBTuj9BVQlbQPjsi4oYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwy/U4B/f8L/UWjBD17MsuyTS1KS43v23ZWDEwJ1LdE=;
 b=hWvADtnZBgLBqcNJ6RcsYRfUVZp96+KhYCoKvAAL9iN7P9l2UqODVb1kqSp/oqRBMkdq05iE+5DP5EGOfR+BNl/bupU6L7n18QpODPiAzlRQSSiUnxB+P0ggm6CrlUWLyj6dshB/jbqHo2th4eKnAO+xhBpBGKgC36y321fJ8THyzFpXsAekBeQgwZiQzMYnQTWq+G89nkmM2v6CBCLg0BzRfzI0e53wUU4u5W81QX2r477KQTgFLClXwrAgaMZoPai/WzeAm0m9XzSsLjBccQnoFtNVY95dPmTzTmt2S5qUMfImQZ3o1oe1XUpigbnvvaOgKxUjKAONGbGbauEk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwy/U4B/f8L/UWjBD17MsuyTS1KS43v23ZWDEwJ1LdE=;
 b=YrfbO7saq/QethqRAJjK8WtXAFng5kKSmNVlXG8nTS4r5MpoSWSf2Q3E0a202ojzhEfG7T5SmKnKDNsUQuGSNSj7TsIHQ2Zjbb1dHEn2kXCxUeWZ32SD4OE6UVGSkrNTP/CAkjwp21MriTcXuJ3bWeVNsh7pd/jk/bP4sVpUcQ/2wK57nXMIIjeIBLhUG7WRBGaJRiKKg0Gk+0nCNR3tNDK114M6+V7BQ5uwXMVZdbelrDR+uqvhh8mwN2HxgO+jaVT4yDjzj9G/yTw5EKsCTwSM9o4ahY+vXtlS3Nvhp6PxjmLjMXdbmJHm6me1m358M5QuuuvrJpYT/ty1d8zMWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
Date: Tue, 15 Sep 2026 21:16:22 +0200
Message-ID: <20260915191623.42107-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ae6bc3-fcbb-46b4-ee0d-08df135ddbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	15x4vf/bcYQeTKpZlYRbMm7OBcAaZRfEMsArFQjPEuWRd+GeqCwczKb53j2wL3oSEPEhjCKVybr5/C7wkAll1xs42pINondnxiE0SVl6QzAo/2X6sT6kRFLG8KBHJFbhtCJE9M9mSl+TAW17oXrIqsnUHjs/u8y0RSG9AKno/ADtM9h3LTuos2lNSXSSKT9MVkPFcBtfNEIBOVGvrQwMDZFCrHXyJItDiunn0tsuXAp1oglWiToeib3/xw0AcWO3bwtHGR6es1sV7SpL8lVbDILUIrwlQNYp4WghUQ7VzGwWj9uul/lFPAIojh/oUPsI4J5+ySE7CI/szxO6SWwQBPzbWSPqJV6LsUwd9IdzYii/lNDJDaHWD23ZLn1es7pWQeKdU2IhoN8/JSsh+7nfqvIVGTJnPnL/AakLg67bzhMPTSasiNfcO6mo+I7Ungtit+t05pCznuOrnijnIxvseFlctUF2g+TBY0SKeLfqHwI2Cp/PE5QpKsaf0N0gYMQd7R3RFmPoraQFkq9bJhzw03TKvnwxkmiA+UPrD4VGWMSeRwUjWvIQrwxrnQUs3XFW6S/bSKSagCFBtCjDR7NgSyowYNiT1W0kdPPDaQLKIQMvn3xQPbfwXzS5ssgUPYJV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AKfp9Q9w6KqPRaqhqFncRyYHpY2kIqQGOL6VEkBfPLOrORqS0Fw/ZJXxtel4?=
 =?us-ascii?Q?OR2sQhB5gr5ta1pawvbra/ulTx//AyV+frn8Y8EVWhGDziYJJOtFYtOYvMLT?=
 =?us-ascii?Q?TOuoHX3QGoT2mJJZsyl8ELDoN3gOaOKlFa452oEgvuDFvoijnh27LnKH42so?=
 =?us-ascii?Q?J8Y8Bh6NwXLfgh7iY2JzsAuLcc3WjiO+YBkFzrd9gmtWJDx/s4fmixNNxBad?=
 =?us-ascii?Q?qXyThI3VjN9cVr2mIHrExtNhH+AIhH0s5cPDXv0mVp+AS6sl2m8TSOzqhy9o?=
 =?us-ascii?Q?wK7jT5WcJoOLNY8ewAteeoe8X9QdTba69SVLz8XCsLwqvEy1Lh/cN+aeBqGq?=
 =?us-ascii?Q?sxitv1zeKRTgX2iawniNfCRzMmdk5nUTYXzY6mpiTxNTs0bQ3vcE3l5kRQyO?=
 =?us-ascii?Q?mw209VgKxoM2N1cG2wQR7yx1yrQ24mn1TIqf7UJo57cXYc3HBA1WgVozoXpI?=
 =?us-ascii?Q?W5gAcveZPDA75qoFnFnp69BV5eyBzlOgXw43BQJzObepNjAaBixCD9hb9GWu?=
 =?us-ascii?Q?Hj2nobdAqaTbuOjC11WzMB+Fc+DAgtaF/cOaMaD02CJeAbSBTpybY6axH+th?=
 =?us-ascii?Q?8wPVZwL39/8hjNu/MhQB2P+2WoFhWCGTWah6IGBOhenK5/rePhoWaKQL4ymq?=
 =?us-ascii?Q?kpvaPaOeVGUBGInDqqNYip+ZBR8c91QyA6NJwrY6bfIvzgVyznmE268YtcfJ?=
 =?us-ascii?Q?9yMVTi/9LXKWjYQD5n7WopY6Zry7U/eSIFMOC8Jkk8BqQYx7Dbei36FDvYHp?=
 =?us-ascii?Q?HEcFKgFXtg/UkfWe/0K1sxTlhRMYaUBsCEWoSN6AtcocrVmWwaxT5vMJxnwX?=
 =?us-ascii?Q?Xjmfex0JX+Tk77lZqjs+3ifKE3V+gpjuYE5GlvZrDY6svoVfBrxtfzBDIHyN?=
 =?us-ascii?Q?OdBTCO2p4QtQnTulZV/It0Cqk9dvtY11rpPzXUQSriMxGV9paMwFTS+nBreg?=
 =?us-ascii?Q?lwCFkJrXXwdQRk+OUC5bGw9DjzR5U6WX9t3JJv1nBX7QakhCn+vOOTL6qDND?=
 =?us-ascii?Q?agh555J6pocs2zrVI04y5kO1eVYQUi6Musn/fv2k0ZKJiqc8bxhNujyu6dPo?=
 =?us-ascii?Q?EjCslAa1xaMnMX08CPOd5IA1ci/hS2UZ5zMt6RHrwBne7Ci5krlaoNTT46QM?=
 =?us-ascii?Q?uzOCWXHwREIPRVXBAFE16cNtoC3n8ekO1SNA5wwGG68Ol3adRbJ/u4cDDsOu?=
 =?us-ascii?Q?vZ7YWMZplb9DidJdwZxA30zf7w45IMBHU7jNnBrojoDa7yNKWv3trWZKCpAX?=
 =?us-ascii?Q?DVfoObGY4kAByrKsljpUJ5PxvRL0ZySKFv2DXWPNeiWdPB00oG34l1NKM8oF?=
 =?us-ascii?Q?G9PRGz5Mw1LOOKQFczQlgnnNXBcS3+tzDYeQCTrKFJCYAkmupUZysIo+aFpF?=
 =?us-ascii?Q?FMtTcC5z/kXL59szODc/nP0iJ9NLP7VyK5cjptU6vaVHlqZKWT0RCgg9eMPk?=
 =?us-ascii?Q?kf03QeEHlkxwtQKCO/k4Qo391LhgSEp5qDfk6VapjPXPgGZy+VuRZghBEUmt?=
 =?us-ascii?Q?mL7aoYTMjMGS76VYXGId4guMzbYJyc+lYnRuejuoHColILLGL5Gqyqdh/CI7?=
 =?us-ascii?Q?HVOoijylEzDQ2vm2XMLsxDwZZiTrvmWAd3CoCDvuwrWR4n3Jw5laLebU9pXe?=
 =?us-ascii?Q?wsx/uO7vOJ1HaDeiR3UTEaS2v9Q7anRtbcLv+6416kHtDmorkS48cXKJipFf?=
 =?us-ascii?Q?ZEd+ohTLTt7PS1ArBwXyB4Jk7PKK47QKGr4YJ5udfrf+zxEu4JKYe29xQDgB?=
 =?us-ascii?Q?js0qHDKjVA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ae6bc3-fcbb-46b4-ee0d-08df135ddbc6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:35.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbsnxzed/EuFL+4rZL6hetnYE7pb5n+PSZjboNz4yFBwEydrN2aFE+Wi7LVbqCR4RAgDLNOxPTPhKudYvrPb7oYoFrJUWbwBEQD3BWeROF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245873

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775a=
f1a0ec76db60c7213241e6b48f1be10ac7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 90 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 0000000000..eae9aaa989
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,90 @@
+From b039b8b66616852673c21ec5c7e0bad3190eae59 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Sat, 1 Aug 2026 18:24:48 +0100
+Subject: [PATCH] CVE-2026-18313: Fix a memory leak in rpcapd.
+
+This vulnerability was originally reported publicly, hence no credit is
+given.
+
+daemon_unpackapplyfilter() can allocate a temporary buffer for up to
+RPCAP_BPF_MAXINSNS (8192) BPF instructions (65536 bytes) per each
+received RPCAP_MSG_UPDATEFILTER_REQ or RPCAP_MSG_STARTCAP_REQ message.
+It never frees the memory, so repeated messages from a client will
+eventually leak enough memory on the server to cause problems.  This
+holds for all connections that pass the validation and some connections
+that do not.
+
+48 bytes in 1 blocks are definitely lost in loss record 2 of 2
+   at 0x4844818: malloc (vg_replace_malloc.c:446)
+   by 0x111AAB: daemon_unpackapplyfilter (daemon.c:2372)
+   by 0x113279: daemon_msg_startcap_req.constprop.0 (daemon.c:2139)
+   by 0x114808: daemon_serviceloop (daemon.c:901)
+   by 0x115BC7: accept_connection (rpcapd.c:1321)
+   by 0x115BC7: accept_connections (rpcapd.c:1118)
+   by 0x115BC7: main_startup (rpcapd.c:709)
+   by 0x1112BD: main (rpcapd.c:567)
+
+To fix this, after a successful malloc() return exactly once, after the
+free() call.
+
+(backported from commit 26a1c75702b105ac8788014f35f1b5c57fa6043b)
+
+(cherry picked from commit f9775af1a0ec76db60c7213241e6b48f1be10ac7)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
+CVE: CVE-2026-18313
+
+Notes on backporting to 1.10.6:
+ - The upstream commit was made after the "bogus instructions" -> "invalid
+   instructions" message change (commit 836d0fd0), which is not backported=
.
+   The 1.10.6 wording ("The filter contains bogus instructions") is theref=
ore
+   kept; only the memory-leak fix (goto free_and_return_status / free()) i=
s
+   applied.
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 87274665..b720cc45 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2380,14 +2380,8 @@ daemon_unpackapplyfilter(PCAP_SOCKET sockctrl, SSL =
*ctrl_ssl, struct session *se
+ 	{
+ 		status =3D rpcapd_recv(sockctrl, ctrl_ssl, (char *) &insn,
+ 		    sizeof(struct rpcap_filterbpf_insn), plenp, errmsgbuf);
+-		if (status =3D=3D -1)
+-		{
+-			return -1;
+-		}
+-		if (status =3D=3D -2)
+-		{
+-			return -2;
+-		}
++		if (status =3D=3D -1 || status =3D=3D -2)
++			goto free_and_return_status;
+=20
+ 		bf_insn->code =3D ntohs(insn.code);
+ 		bf_insn->jf =3D insn.jf;
+@@ -2403,16 +2397,19 @@ daemon_unpackapplyfilter(PCAP_SOCKET sockctrl, SSL=
 *ctrl_ssl, struct session *se
+ 	if (bpf_validate(bf_prog.bf_insns, bf_prog.bf_len) =3D=3D 0)
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "The filter contains bogus instru=
ctions");
+-		return -2;
++		status =3D -2;
++		goto free_and_return_status;
+ 	}
+=20
+ 	if (pcap_setfilter(session->fp, &bf_prog))
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "RPCAP error: %s", pcap_geterr(se=
ssion->fp));
+-		return -2;
++		status =3D -2;
+ 	}
+=20
+-	return 0;
++free_and_return_status:
++	free(bf_prog.bf_insns);
++	return status;
+ }
+=20
+ static int
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 6ca75117e1..859897acc5 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://03-CVE-2026-31911.patch \
 	   file://04-CVE-2026-6244.patch \
 	   file://05-CVE-2026-6554.patch \
+	   file://06-CVE-2026-18313.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

