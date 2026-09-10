Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3162C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vpMpv+7D;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7O4a6TRwT1SSHBL0wADQHF7HtRkjVtEqMnHBy55coqcYakmW1vVazM9wpzVQxNXlD+mndYFs2VmLdZ377xYG+0wVcm3fsd+Kmw/QnHJijJ+1WTiCCTw8Aw8iVgXeMtJQYRnptYBp7oDpEEEFZKD1M/SxWLDlN1hr/uHm88unBpd+ITHYagoyKYDfGT1ZgPxxQd9izpF/WBAmDLRrSAJXsGkyd40NaHB4PoPUFVjR2RUcA0h2HjQILML53JyxXIMqT8fh431OhjKJve2UmsU7rkrbkAr78M1lyl/cqAE0mn9jhzChuEOiMK9Qjr7HSApLHi5cCD1ZY79L54erF+a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MP1e4XgY9jEJpu0v67fq7maVEuUuQ7iyc6ULTbE4WyI=;
 b=ZPIth6I0AqsZ/P9QSxgxtZhAQHTtCp4jBGwGN1ULEa4ldj73Bog1guYJRWVRdt3xmtKsQVFAwg3UZuIIybxtf9Pnb25psCZcUlqqGy8L1VvfTidR6cKhq3ZLxH5VJryKOc2uunzm1ZMPSDyPbkrXh9XGo5v3OYs3lvN0XzbZC5cUCEPW2+mZ3wP8WY2JqxXwmyGo6qex4D90MujzTSoPj4sfg0r0ZdDP5JqgyIA+f9TO+pwlT0oRVXnhoBiwJdgHomTSHroHuGjod+pEXMljzvPeTfsT4vYAC72XeJJ4PHkZzNxrkiMUWA/XB77R/LD265cO6x0Fz1x6iembwK8iBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP1e4XgY9jEJpu0v67fq7maVEuUuQ7iyc6ULTbE4WyI=;
 b=vpMpv+7DIs2sPzxA4E3ph93/K/qb5eWO+UFybuQ9QG6mHYiGRE0dmmS+49gavfG/BE/4ASegg5SgNEPzAtlo67VE/isg5/tzF9WVRMejhTwkJisT8ChJ2qELGPnQqfPUIP8+zXKYMpLNH+3Go2ejkkTGsoBe48Q7GNaiQ7PCNXZ6nd3v44bOw6/avoCrpy5s2DKnWuUipCzfBvKryvc3QQlluuc4IZwRmeLnihJGRI1EabMDZM0M5akAmwLe0antQdCLpbPxaZ1CoSd5YhDTYCklJeIir6vCRveuZt5eOXKtvgddJS8nmUkXQ3D3Q/evMVvNiwvdIEoowqRvOMFz5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:12:01 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:12:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 6/7] libpcap: Fix CVE-2026-18313
Date: Thu, 10 Sep 2026 07:11:53 +0200
Message-ID: <20260910051154.30595-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 798c40bf-c7fe-43ec-efcc-08df0efa0bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	P9KAWn1H3OD4I1FuGQNt7JYAuKYfJnhshdcgUtl9XR1msjV6Oj5jocrrfkv7Z+Hnl2QUEy6H4Lm00acOARiscv6jF8q1IhTaUga4xH1UEVL6gwxIRoo8/jFODZZluJ08u/enyn8SitwgohpHPhu18gfpPNMdF9581WqvGyylqiqQTbEht8rx9/RHyRskmfApwfvUjEcU1yyExpHw9dCGZOpdg172vYFllmU6jDi7RjcKMqMzoXFZhlcl4VZw54BcTN3U2qtCaFob+bz6eZ+ZuXkjrOBQKYdC/E2cg2BZ7fFPHCe37QCUWfI48fCjbTVHi1cigepd1rolY+yaZT4LL6BfdEupE+z06gEZqogeNmllsMHKXbrfReEatwDvDlDHM6W8X2AXgZt1KULgjlDFJFu1m4SgYq7JuSdgT4/jP1IIJaGg3+aJhMgMvatUAplIxvqDb1jagDqrNYPpNLf+vBsBzhxQlrCYjLxeoVydlh77oV8fYg3AZ5exa/CtQJAEBXN33SjIU7qdMs8Ln2fxTqvcXQ56StWZEQH21vLPW2WwvG6B9Z/Kx5JlwyYGEAYxhDeF9gMHC0pus5Z3f61/+clgj6Blh2/K5bAAnLC/AxhzcIP8YC6W5On7yTOIFlxe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVdoUhKC7k0RvdjswsD4AkHKSGMct/Fhj9EmGxmBedmldQYlckew/NG5QJeu?=
 =?us-ascii?Q?sdh10bTSersq0kBmZ19YGjgujjaUYm/Lzn+k1LemBTqalOsRAV68jJlESJ6i?=
 =?us-ascii?Q?Y5CmX7Izzkj5NGLtiLqiKpI5uQ4JYWrdxmlx33/mER+81J28d2TAoxC+Sg6t?=
 =?us-ascii?Q?5epCICMO5F9EwBX0ggI4chWtT2kiDPTPh3T5MQM8eJ2gsEzqpB/fqpsO9fPx?=
 =?us-ascii?Q?/QVMvI+YK0VWzbaCOoSNsD8PM6L/ka74ECww7AdU7tDBPZPAGoY1QR3cUbUD?=
 =?us-ascii?Q?SjBa/JKtRpx5VBp4o4uOXr9jvgjCdAX80bhz/azkZPpCJDXcixnCwcrspqsv?=
 =?us-ascii?Q?5JWab/2H4WQVraewLhq0b36zKjvMo8V9W6XXmPqQ8SrpX0DiQhCzHZAt8e2Q?=
 =?us-ascii?Q?OaOIa9YZrVh+lhjwFq4Vx0a3q2/rwwFsO8k2ng8si8ooYotAxoN4ePqG+bvJ?=
 =?us-ascii?Q?rusjt/0WbBQ/5UBFr+rpZvws+GNhgmVVCUTGEooK5xaOsnkbH0A/OJdqK+QT?=
 =?us-ascii?Q?UY+/RdaWZd+jcNKI16VdYp+u95WY/eW5aAaMbaGYFPd6u62wcfJ2Tj30cPtM?=
 =?us-ascii?Q?cwu/lA93xy4mO1RCSDaplaht5Y0mrDhAFuKMWUYlLpHDPkX6RJzf17a5C9d3?=
 =?us-ascii?Q?KSIrjpmtotBM5jSKJzj+6HWxF+hkSYeb5Md0iLTvSdqx7LwKAG6cGuPi+ka6?=
 =?us-ascii?Q?pxP7ABIzYGKwFqvHKfMRVRX5aI6YiLOOoe8A7LsFZHF1BaUyne9qXz4Oka5J?=
 =?us-ascii?Q?QAE8EhjO4/C01IwoSaIH9rKVCVfzHWHcg3OLzNxVZpXoYcHKDLwlQO2eYD7m?=
 =?us-ascii?Q?aLBk6L6i0RsLR8YplitUkpKIzzPsJyJ/G5AkNdKF4JL6J/X+cSCYE5YyF0Xo?=
 =?us-ascii?Q?Loqr7SkPeuo+j5TtuNYzAzvnfwbWhP0aHoprwgmjDQHrjyRJopZmy3q9FOEW?=
 =?us-ascii?Q?6013X+pu0zDMfoN/SjV/T6O/F9lMrtB4A8t/QAj7FQuSTdqhE1YddW9iYKZ0?=
 =?us-ascii?Q?H9+ge80JQzWNh4URVwzsGxw3/cZOr9ob50102aXjBmyDrYa8b5rB5iCt5vk3?=
 =?us-ascii?Q?6mgGvjY7VUG8E3Zgwn4jnSTMw0btuot3jS6RXmHv7jvIVrUIfL00J6fIvzDh?=
 =?us-ascii?Q?hoh05Acx62gIXAoRjIQX7GIkidQVleHl0VhcinCgHRROeMSZZtsOrp/qUJcR?=
 =?us-ascii?Q?YZKesF6hIlpvBdXkgpWrPD09rx1pYZtbwIX5DnOpSjxlQrLDXA+LZUWpycJU?=
 =?us-ascii?Q?lSToBKb5JvEzq77xBwx/wjjxjeNWxcolsQwzDr7XLImewfGusVk6xkEX7Yg1?=
 =?us-ascii?Q?AjZ6/45/OckiUIhQArCwFoO4CjdaanJP/KTOJUiwHC7Dmq1Ir3g+kLlUeM1i?=
 =?us-ascii?Q?w9zj0lT8R8xzBu0D2xeFXDp4OGRuT1AquMqlKMDEYlKV+7T8zwxnGVjK0Z0g?=
 =?us-ascii?Q?gABMyFw7rkJVRC2CNdg7GgtB3JKlHRUW2GdJj4Hb9u5it1Ux9p50B9VL1fFR?=
 =?us-ascii?Q?MVAqk6Z6/XK3KxE/JER9a6555S0cXRXWW2WS9M9o0cYuvL2VafeVu31jz2AX?=
 =?us-ascii?Q?PbJczpupNZY0X+DgWZQxDvRS+e4gr08HmE3iF/JrnYelinvJzX9eMGyTsb3I?=
 =?us-ascii?Q?vCp+JeNagEROkuln7RAzS/a6VrUdFsUNPhfKHvtULu0RkRSs2jfbARxij7Hd?=
 =?us-ascii?Q?0pnphi8IZ38Q2Otub/chS+YUXa5WVm7l2T2t9BUQeyslJJ7jGJXYJ31hildN?=
 =?us-ascii?Q?vtsSp88OQqk9kaOJ71Ddbw7ytgHwGkfuPdgddu64WtFFQLV/Ou8gGbxPUQ2F?=
X-MS-Exchange-AntiSpam-MessageData-1: 9/BtyXdnN4283+uVIDGhYyPXCwtMXsCyhKA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 798c40bf-c7fe-43ec-efcc-08df0efa0bee
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:12:01.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvWIcRBFFupQIBZf8oODdblwmFz68e55JpkIiU48xPuL5yAvWP4r/p3AiqHQ5Xn3+ow5tRCS3NzqNeU/y4bbUb3586RuFNYUFIBaEES2rVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245529

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775a=
f1a0ec76db60c7213241e6b48f1be10ac7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 104 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 0000000000..7e6868898a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,104 @@
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
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES                  | 2 ++
+ rpcapd/daemon.c | 19 ++++++++-----------
+ 2 files changed, 10 insertions(+), 11 deletions(-)
+diff --git a/CHANGES b/CHANGES
+index ff9bac3..4f24f94 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -5,6 +5,7 @@
+     CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
+     CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
+     CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
++    CVE-2026-18313: Fix a memory leak in rpcapd.
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
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

