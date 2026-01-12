Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9848BC9EC63
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:22:12 +0000 (UTC)
Received: from MRZP264CU002.outbound.protection.outlook.com (MRZP264CU002.outbound.protection.outlook.com [52.101.165.111])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30210.1768212814693874872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=TubhzLUQ;
 spf=pass (domain: ekinops.com, ip: 52.101.165.111, mailfrom: karim.harouat@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKg9k7WkchH1NggYx2Hfvg3TU2j+RFzRsEOlK+tv9KaZPloeSBY9zdjnena5iry7/+ab64aYlRTXdGZqk1VRZK20gcQlA/3gRQaHA5YFuqHpNsVX5CKcHJBl6sCSB1rM/zLcGQuSGRy5Ilihdhdn9X4kGDafHBuvyCEDnRwSF2d7i88aJdQTJVxS5cHBWdKwZlLpdcesNubOExaBJpTfKeHBfFIWZVtOL+J5hIXc2qSkGy4YsDD85XCW2e8FZxpFfkphCH9Mg4xhTidFmpLD11o70xnI1H/HLuDGC9dZMQGt+54bQN92Jyxm0/E8SvWLh8XXagFX8HrlxTffyWp+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUUgP4XC+h2HHgNMptSKQep6qF6leGNHTfBRG7UELgY=;
 b=h8z/aLy/6wvoNQPIs7ByLNw51HdKm53GiJ/bsVyC7unOezf+LtQ2LN17c1jxDzhGi2bbktC/ij4xRieXhZxjGDe3BDoc42RfW54AvyRcP5m/18B/8oj59duiUGMFO/4PCYnAhBikbArNMJjAUBmNSxBQZEdDbEmOjfe0aerWarLZns1pOdLlR+EJzEJCxz2oUIhxw9hxPcyUUK0u2qX/cnrDFDNbP3oyOHQzAtYFuMWB8Z7ojTRj4+u04lES2VOk6RLcmUeDoebi/H0VwGMhYnF5JRXE29Zl9EBdLFdIGehG+U8lESw3WfK4vp/X5xJZKJGeORMuVZt0HRwTC/VgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUUgP4XC+h2HHgNMptSKQep6qF6leGNHTfBRG7UELgY=;
 b=TubhzLUQ5w3cs+zpWXI0BOhAQT1c8RyUfFlki+Ch/ockvPYgYzO2JPY1VzRD4rqcB/JnQjcuFIHkXGhcD2zPZEIvMyCP7auvAbx5io6uGd/OvTRSHWVrbwSUFAaMAW9OEvMxqyd1rYocu1MikNrU6/OmTYl7x4XElsXS9LbAwIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:55a::24)
 by MR1P264MB2689.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:58:49 +0000
Received: from PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9a1f:7b40:9db4:2f99]) by PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9a1f:7b40:9db4:2f99%4]) with mapi id 15.20.9499.003; Mon, 12 Jan 2026
 09:58:49 +0000
From: Karim Harouat <karim.harouat@ekinops.com>
To: openembedded-core@lists.openembedded.org
CC: Karim Harouat <karim.harouat@ekinops.com>
Subject: [meta-oe][scarthgap][PATCH] lighttpd: apply patch CVE-2025-8671
Date: Mon, 12 Jan 2026 10:58:32 +0100
Message-ID: <20260112095832.62686-1-karim.harouat@ekinops.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PR3P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::14) To PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:55a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA0P264MB6834:EE_|MR1P264MB2689:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe51fd9-c5a8-4b0a-2e53-08de51c12f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pLmXbcO4+TUaV56injWZFGoUt2ayvOSfrojDn5QNpSodjcXA1h/ePUcKi6Ws?=
 =?us-ascii?Q?y0VaULwQVuTk4S+l22n7mEMlFM7r2knBtKwTzX+69JGcK9iRqtR/O4SkmH3h?=
 =?us-ascii?Q?/hR2LLT41rCQ3x1dfZ+6RcaRCKFUMbZZx5F08dPQwzS7VKCineXChEwouZhn?=
 =?us-ascii?Q?lBomR7A1//bhXCxOo8uWx/Bejwrsbfze7eVfWB0YDrsABFwSBkjHEpK5I+9E?=
 =?us-ascii?Q?uPVQoi0gw3pLfgi4FJ6bXPHaH1LJEocagKKNpyfZiH33XN9A+NJquGoTrBik?=
 =?us-ascii?Q?mE/SpYc2n4bZ3F/7GMzk1hy64I1xWcMEXm33g1RjD1r72mBDYQ+6osT7ETl9?=
 =?us-ascii?Q?KTtyW3CiFpM0+EHT7E8NIwc2DoyPGvDOdxZun6N4OYclJPiP7wpveQSQHKcx?=
 =?us-ascii?Q?0Fp/vGQwbh/KKjfAF8uKmuxxGRU1cTYVCARNbBXh5LsQIJ/78lep5ck8Xi/v?=
 =?us-ascii?Q?4elVjJ/geEH3RHqxEd6TaskVXcktVAJB4iXfOtKhssvDgeJP7FoDUDr94WdJ?=
 =?us-ascii?Q?Wei8af3kdL7QKGS133Fr6rnHyA9P/rOX0kbVaizOpgU3qF9lpOyik4hCV6+V?=
 =?us-ascii?Q?6tXFfgeiiaUWT75nMNu5AR/60w+2+xALBrGB+LBblLOWyr6er+LMtApPMuhf?=
 =?us-ascii?Q?hc1CmogRhz/tRExLmEHAs6Cc6sK3zxKonmJwl4H3SrxHTxscixk2NEOwxeRq?=
 =?us-ascii?Q?K5oIYhUGyGfMyMjE5RPWUjf8E0MUVqtHs9+KkKBOzMS5cfO1VU8uXZGRb6ww?=
 =?us-ascii?Q?JAoBd/jbwIO3hMZAFeC8l22rCZzgSmDxC8Ldwiuvyx6sO8Fn1J4cJ57b6Kc6?=
 =?us-ascii?Q?fH591jYX4FI2t2a5HtPJ7hKeexx9INzj8QL3JcZRDCibjnCkbHWO3kTwO6DO?=
 =?us-ascii?Q?gaeuom6NklXFExcIZgF7M6ikBqcK+0zeysiA7HLkLG0/wGow5qT/FiFNnueY?=
 =?us-ascii?Q?hcNEAzB06pYRtpKd4yjnHwM7PeSc4FzFYjMFrelFVQHnCHhoIIoJyHOIgkOc?=
 =?us-ascii?Q?FjZ4MU0tlMjMR5cW4uOYb9ReG0b42dwNWRvftlj4wnGUmN16b+bDPHIr9p9F?=
 =?us-ascii?Q?CSMmL/OnFeYV8TqOCH6+s9ZZJXsJE9SjRTuDLQgGt18ZN5c3wWXgTaimU6rF?=
 =?us-ascii?Q?KugMFoXPbXRpU/cvry3BY9Qqo4qDO+aierl9oqx/aYMMExEwXs6pmcTknqnD?=
 =?us-ascii?Q?9vxMxZOkB9lJfjyOhzX0PI7UslS8eFkyFeBnlZF3YSueAhHQQz739mjmCDf1?=
 =?us-ascii?Q?9WhB6ZDTHvTApgJMJa/4HulbPEQRb7LDw5U7xTfawHRGgN9Zk3fwnhLDwxXS?=
 =?us-ascii?Q?IAN4t0Lz+vvy+0drTTOSl0kFqv/+GBUYNMTvWF2U89HN756JGIzJqYgHlLXQ?=
 =?us-ascii?Q?Sna4Ijk5HBFNueaNBB/AMQEOBGrqgD96OsUJxmWeFO8WjXkclEw1YNQK/x34?=
 =?us-ascii?Q?N31op7T8H2hkyDqlbOMiyPRA0jBnY3MZVjIAYbFit1o8xW+ZGvbidUu8QNvR?=
 =?us-ascii?Q?WowhzT537mWC2BgKYfyToJ3GMaCsC3avwU6s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1fvZGlzGAB/D4FxFv9yT+zg9TFXOWe/yBZ3tFwuCgtEf+eA/gJzbpCZRlle4?=
 =?us-ascii?Q?Rfh9eOdidxnGNvlci2W43NeM8q4BmP7XbMPm2s4tUdqzCmgU0HepvzdJG2Ib?=
 =?us-ascii?Q?WXyPlU6rtvuFHj3sX6n+cwV4rDr96QNm7OQhnsHMpM1OAltBu3CoNG0KHNhe?=
 =?us-ascii?Q?UhideFutu7GpMXtIQNSpCcMmdAVHgPP+AHmXtwEHWq6uPXdJf2s7vfWX4r4a?=
 =?us-ascii?Q?NcooHtQoXhkyQTSQ4ipt4Hg0KTWfyR1gYr/z+t3LIWRh6dpt3VaN+4qz35H1?=
 =?us-ascii?Q?XfYxjHNhrG6mbnjXY1zGhHKp+z3Vx1Cv/EUG0BLdp8jNuq4SXERmjVWUAADP?=
 =?us-ascii?Q?lrm1TKwAvzU93pbuodORxDetc22s6oSwBG1WkZtnBCT5wJD116j38ACaDtP2?=
 =?us-ascii?Q?VVtf+JxiCLiOqcRP1/s5UQ71sP5EbYrVqYoRUYcSrNYq9Eb8aKUMUdPcziG1?=
 =?us-ascii?Q?KqZn/+6aJyOOmh9tYU3V/TNWvgimGO8d3gEg5C42md8edpbbhhpRiZrk8mkV?=
 =?us-ascii?Q?iKAJy7jqG6d1QNUccE7honBILy+WkCEi2u7r8/R1sFwvjK1EKFl+p4Rqem8p?=
 =?us-ascii?Q?e9GMDt7Pkg1phy0R1qeADDFs7FOSCUGk2jouMayCRAiMZoO7JytX4mpVN1C3?=
 =?us-ascii?Q?/P76p8sF5MMIpRvhoIBLYG5suyjI7t7FQoWzIntR2XVx0ziC96shz/+J2KUF?=
 =?us-ascii?Q?aE4rzHwRoDcqjTj9HeOG2JL1E5C7cpGYkkK6wfyYaggvnl0A48yPw2do9zeT?=
 =?us-ascii?Q?ihmtADWajee4ZkzwLE9veAfffb79TinhYAIIvce3GtSnn3bnubSUe0ThgbJl?=
 =?us-ascii?Q?xGyt88/dDpKLIlHn0KHgMxRLuDDjozyac8XnMvu+EA6OSLeSFwnDhtTRt+fX?=
 =?us-ascii?Q?wW911ALL53uinhNRljTTobfCbw97rEFMgbOrcNLUcYpgb72NIngZhB2zvpaj?=
 =?us-ascii?Q?kM4DuC/TSy1wc5AwGWs64Yhbm4bjhaPPGzVs+hpI4wXu1xXIhuTDfJdLMFVc?=
 =?us-ascii?Q?qjdhkpHZHqxUtd3v3D47nMCdLWu6I1/ggjwqHqlb4aULSz2tAsAWKNEiOc2M?=
 =?us-ascii?Q?VnqbfdIaYQ9KBDVMq46clKS01Jh2iHOJnpDLGJXI3JUHVATXfEQRx80U19hW?=
 =?us-ascii?Q?OHvZwbwp9fBJ33ebz3pRh0Y1ltJBqfOHJvMdMOurEInCgzUF29rVDDSGXBhK?=
 =?us-ascii?Q?XfK4wMQIvdsFbRYip/nSXgOB2D9hh/3t22HZrxioP1qRFLJRQeCuJZR2qqgm?=
 =?us-ascii?Q?K9mEuz2qsAYenJ12rGf0LCBOQDFsDPwefw4gLam+3DHS0KYTOlzF9U7kuxQA?=
 =?us-ascii?Q?6dFv5gpEeZBZzr5lrFizBGrXyx7FeprHc1BU1Zj7LHmCQNIkRBloNdK26HXR?=
 =?us-ascii?Q?O4bqYV3ywX7JUukOS7WR/8my2uRYQQKMFm8mpi6uUOULWvNZqtvAEmQBt1og?=
 =?us-ascii?Q?faG2oz5HZjg8DtIz2Al0meDXIlEKCwsmuA3zEz8FDU7TWi4EbrNBRzf1owwJ?=
 =?us-ascii?Q?c035bInslrf4/Kw7KqjW07MVr5KpIRoDA8AW8YetYHIFCDxIK38I8xel0r2d?=
 =?us-ascii?Q?dUnOUJDY7K2IFGgsb5X8qUlo8MvYI+t3Wtaib5W/6FseZhfLUaSq9J47q67q?=
 =?us-ascii?Q?fS6bg3qeku4lQpQhaurtFs4gSv4LclrkASGB9ftsR+Lmi3acMLxj90P32+HN?=
 =?us-ascii?Q?+3kCbPul7XJkpdqrclvpY2iTcIX/SsapJYl2tdLXzbO2UY98YtUjVhstWW5x?=
 =?us-ascii?Q?ybqZDy60U7MTSmiU0HhVLKGJyy9JNJo=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe51fd9-c5a8-4b0a-2e53-08de51c12f41
X-MS-Exchange-CrossTenant-AuthSource: PA0P264MB6834.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:58:49.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4fplzCxsXAAebkhfL+jc9gvOld6RI83yCwCYIU9OONwnXUq15zSzoSbZ+mCsRC2/+yCOh/49COPJpeHlREGXx+KehyXIt7aNpY+T3bIXZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2689
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229199

Fixes: CVE-2025-8671

From Glenn Strauss <gstrauss@gluelogic.com>

CVE: CVE-2025-8671

Lighttpd is prone to a denial of service (DoS) vulnerability in the HTTP/2 =
protocol dubbed
'MadeYouReset'

applying commit
https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/8442ca4c699566cdd7369e=
09690926f403b54fc9

Signed-off-by: Karim Harouat <karim.harouat@ekinops.com>
---
 .../lighttpd/lighttpd/CVE-2025-8671.patch     | 181 ++++++++++++++++++
 .../lighttpd/lighttpd_1.4.74.bb               |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2025-8671.p=
atch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/CVE-2025-8671.patch b/=
meta/recipes-extended/lighttpd/lighttpd/CVE-2025-8671.patch
new file mode 100644
index 0000000000..a304d91ff1
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/CVE-2025-8671.patch
@@ -0,0 +1,181 @@
+From 8442ca4c699566cdd7369e09690926f403b54fc9 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 13 Aug 2025 08:52:15 -0400
+Subject: [PATCH] [h2] attempt to detect HTTP/2 MadeYouReset DoS
+
+attempt to detect HTTP/2 MadeYouReset DoS attack VU#767506 CVE-2025-8671
+
+Upstream-Status: Backport
+
+x-ref:
+  https://kb.cert.org/vuls/id/767506
+  https://www.cve.org/CVERecord?id=3DCVE-2025-8671
+---
+ src/h2.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ src/h2.h |   1 +
+ 2 files changed, 103 insertions(+), 4 deletions(-)
+
+diff --git a/src/h2.c b/src/h2.c
+index 7926a5e9..b4299453 100644
+--- a/src/h2.c
++++ b/src/h2.c
+@@ -349,6 +349,11 @@ h2_send_rst_stream_state (request_st * const r, h2con=
 * const h2c)
+ }
+=20
+=20
++__attribute_cold__
++static void
++h2_send_goaway_e (connection * const con, const request_h2error_t e);
++
++
+ __attribute_cold__
+ static void
+ h2_send_rst_stream (request_st * const r, connection * const con, const r=
equest_h2error_t e)
+@@ -356,6 +361,97 @@ h2_send_rst_stream (request_st * const r, connection =
* const con, const request_
+     /*(set r->x.h2.state=3DH2_STATE_CLOSED)*/
+     h2_send_rst_stream_state(r, (h2con *)con->hx);
+     h2_send_rst_stream_id(r->x.h2.id, con, e);
++
++    /* attempt to detect HTTP/2 MadeYouReset DoS attack VU#767506 CVE-202=
5-8671
++     * heuristic to detect excessive err sent by client to cause reset by=
 server
++     * Ignore H2_E_NO_ERROR and H2_E_INTERNAL_ERROR.
++     *   Were H2_E_INTERNAL_ERROR to be included, there might be false po=
sitives
++     *   (not attacks) in the count.  Ignoring H2_E_INTERNAL_ERROR here d=
oes not
++     *   count *response* headers too long, but that is not a client erro=
r.
++     * Ignore H2_E_REFUSED_STREAM, which is counted separately, elsewhere=
,
++     *   but not listed in conditional below since H2_E_REFUSED_STREAM is=
 sent
++     *   directly via h2_send_rst_stream_id(), not h2_send_rst_stream()
++     * Include all other errors, though some are more prevalent than othe=
rs:
++     *   H2_E_PROTOCOL_ERROR, H2_E_FLOW_CONTROL_ERROR, H2_E_STREAM_CLOSED=
,
++     *   H2_E_FRAME_SIZE_ERROR, H2_E_COMPRESSION_ERROR, ...
++     * Many such errors are sent with GOAWAY, so not as relevant to count=
 here.
++     * If r->x.h2.state is not H2_STATE_CLOSED, include H2_E_STREAM_CLOSE=
D here.
++     *
++     * Errors for unrecognized (not currently active) stream id are not c=
ounted
++     * here, but also do not affect potentially in-progress streams which=
 are
++     * consuming resources in lighttpd and/or backends, e.g. if request h=
eaders
++     * are not yet complete, a backend to handle request has not been sta=
rted.
++     *
++     * Similar to h2_recv_rst_stream() for HTTP/2 Rapid Reset attack,
++     * send GOAWAY with H2_E_NO_ERROR if count exceeds the policy limit s=
ince if
++     * peer is triggering server to send RST_STREAM, the peer is misbehav=
ing,
++     * whether or not it is multiplexing requests from different clients,=
 but a
++     * naive peer multiplexing requests from different clients could resu=
lt in
++     * more reset (failed) streams of valid streams if one client could t=
rigger
++     * too many resets sent by server on a single multiplexed connection,=
 and
++     * server resets all streams and sends GOAWAY w/ error (not H2_E_NO_E=
RROR).
++     * log watchers such as fail2ban could watch for error log trace indi=
cating
++     * detection of this attack, and could respond accordingly, across mu=
ltiple
++     * servers.  In lighttpd, a client could trigger server-sent reset st=
ream w/
++     * e.g. mismatch between received data and Content-Length, when provi=
ded.
++     */
++    if (e !=3D H2_E_NO_ERROR && e !=3D H2_E_INTERNAL_ERROR) {
++        /* simulate receiving TCP FIN from client to trigger imminent shu=
tdown()
++         * on socket connection to backend, indicating request terminated=
.
++         * Note: mod_cgi must be configured for this to have any effect,
++         *   e.g. cgi.limits +=3D ("tcp-fin-propagate" =3D> "SIGTERM")
++         * Regardless of whether or not this optimization is performed,
++         * lighttpd will schedule close() on backend socket (or CGI pipe)
++         * and will close() backend socket (or kill CGI) upon next poll c=
ycle */
++        /*r->conf.stream_request_body |=3D FDEVENT_STREAM_REQUEST_TCP_FIN=
;*/
++        if (r->handler_module)
++            joblist_append(con);  /*(cause short poll for next poll cycle=
)*/
++
++        /* increment h2c->n_send_rst_stream_err and check for policy viol=
ation
++         *
++         * time step interval currently 2 secs: (log_monotonic_secs >> 1)
++         * store time bits in upper nibble of h2c->n_send_rst_stream_err
++         *   (32-second time slice: ((log_monotonic_secs >> 1) & 0xF))
++         * time_bits are only 4 bits, so repeated time_bits could cause f=
alse
++         *   positive and not decay the counter, but well-behaved peers s=
hould
++         *   not trigger *any* RST_STREAM, so tripping the policy sooner =
is ok.
++         *   (rather than potentially missing policy violation (false neg=
ative))
++         * decay counter (divide by 2 (>> 1)) when time step interval cha=
nges
++         *   (any time interval change; not shifting by (cur_bits - time_=
bits))
++         * counter is 4 bits, so max is 15 (0xF) unless bit masks are adj=
usted
++         *
++         * XXX: server triggered to send RST_STREAM w/ error is unexpecte=
d
++         *      A stricter implementation might send GOAWAY H2_E_NO_ERROR
++         *      upon first occurrence.
++         */
++        h2con * const h2c =3D (h2con *)con->hx;
++        uint8_t cur_bits =3D (log_monotonic_secs >> 1) & 0xF;
++        uint8_t time_bits =3D h2c->n_send_rst_stream_err >> 4;
++        if (cur_bits !=3D time_bits)
++            h2c->n_send_rst_stream_err =3D
++              (cur_bits << 4) | ((h2c->n_send_rst_stream_err & 0xF) >> 1)=
;
++        if (!h2c->sent_goaway && (++h2c->n_send_rst_stream_err & 0xF) > 4=
) {
++            log_error(NULL, __FILE__, __LINE__,
++              "h2: %s triggered too many RST_STREAM too quickly (xaddr:%s=
)",
++              con->request.dst_addr_buf->ptr, r->dst_addr_buf->ptr);
++            h2_send_goaway_e(con, H2_E_NO_ERROR);
++            /* h2_send_goaway_e w/ H2_E_PROTOCOL_ERROR or H2_E_ENHANCE_YO=
UR_CALM
++             * would cause other request streams to be reset (and would h=
ave to
++             * check h2c->send_goaway <=3D 0 above instead of !h2c->sent_=
goaway)*/
++        }
++    }
++}
++
++
++__attribute_cold__
++__attribute_noinline__
++static void
++h2_send_rst_stream_closed (request_st * const r, connection * const con)
++{
++    if (r->x.h2.state =3D=3D H2_STATE_CLOSED) /*already closed; rst_strea=
m_id only*/
++        h2_send_rst_stream_id(r->x.h2.id, con, H2_E_STREAM_CLOSED);
++    else /*(r->x.h2.state =3D=3D H2_STATE_HALF_CLOSED_REMOTE)*/
++        h2_send_rst_stream(r, con, H2_E_STREAM_CLOSED);
+ }
+=20
+=20
+@@ -593,6 +689,8 @@ h2_recv_rst_stream (connection * const con, const uint=
8_t * const s, const uint3
+         /* XXX: ? add debug trace including error code from RST_STREAM ? =
*/
+         r->state =3D CON_STATE_ERROR;
+         r->x.h2.state =3D H2_STATE_CLOSED;
++        if (r->handler_module)
++            joblist_append(con);  /*(cause short poll for next poll cycle=
)*/
+=20
+         /* attempt to detect HTTP/2 rapid reset attack (CVE-2023-44487)
+          * Send GOAWAY if 17 or more requests in recent batch of up to 32
+@@ -608,8 +706,8 @@ h2_recv_rst_stream (connection * const con, const uint=
8_t * const s, const uint3
+               (h2c->n_recv_rst_stream >> 4) + (h2c->n_recv_rst_stream & 0=
xf);
+             if (n_recv_rst_stream > 16) {
+                 log_error(NULL, __FILE__, __LINE__,
+-                  "h2: %s sent too many RST_STREAM too quickly",
+-                  con->request.dst_addr_buf->ptr);
++                  "h2: %s sent too many RST_STREAM too quickly (xaddr:%s)=
",
++                  con->request.dst_addr_buf->ptr, r->dst_addr_buf->ptr);
+                 h2_send_goaway_e(con, H2_E_NO_ERROR);
+             }
+         }
+@@ -1137,7 +1235,7 @@ h2_recv_data (connection * const con, const uint8_t =
* const s, const uint32_t le
+=20
+     if (r->x.h2.state =3D=3D H2_STATE_CLOSED
+         || r->x.h2.state =3D=3D H2_STATE_HALF_CLOSED_REMOTE) {
+-        h2_send_rst_stream_id(id, con, H2_E_STREAM_CLOSED);
++        h2_send_rst_stream_closed(r, con); /* H2_E_STREAM_CLOSED */
+         chunkqueue_mark_written(cq, 9+len);
+         h2_send_window_update_unit(con, h2r, len); /*(h2r->x.h2.rwin)*/
+         return 1;
+@@ -1515,7 +1613,7 @@ h2_recv_trailers_r (connection * const con, h2con * =
const h2c, const uint32_t id
+     }
+     if (r->x.h2.state !=3D H2_STATE_OPEN
+         && r->x.h2.state !=3D H2_STATE_HALF_CLOSED_LOCAL) {
+-        h2_send_rst_stream(r, con, H2_E_STREAM_CLOSED);
++        h2_send_rst_stream_closed(r, con); /* H2_E_STREAM_CLOSED */
+         return NULL;
+     }
+     /* RFC 7540 is not explicit in restricting HEADERS (trailers) followi=
ng
+diff --git a/src/h2.h b/src/h2.h
+index 2112c637..53541fe5 100644
+--- a/src/h2.h
++++ b/src/h2.h
+@@ -91,6 +91,7 @@ struct h2con {
+     uint8_t n_refused_stream;
+     uint8_t n_discarded_headers;
+     uint8_t n_recv_rst_stream;
++    uint8_t n_send_rst_stream_err;
+ };
+ typedef struct h2con h2con;
+=20
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.74.bb
index 7460d3d716..ef6002d031 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releas=
es-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
+           file://CVE-2025-8671.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3=
bed71b9d3e53b5"

