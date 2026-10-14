Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F64CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15337.1791988748056411672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GZ1H5x+Q;
 spf=pass (domain: est.tech, ip: 52.101.70.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9uIVhwAjV+aiENxjPxZ/FvLjsbVJqy77+rVqpgH6f8NWxN5ceUus9E0TkxMt7g197RRXIYuPQ03eegUf7Nzt7Rih9JGkNeNvkYlPgUr6Scep6B0bFx9i8hDjmUF9/uiop4Ksq7hjZGkVttUn4c1MlRRfAJSdabF7Mtu4ytTXcv2yy9VqGCsE8TuGCjM0FbZzeUMgLsgMpKJlkoz6q3o8SLl/4o2d/TriOzK9dVHDtVsB/9S63ppRQBujumwwPCEJfP+GDvLK6SDROlBNUTfY8WmGgflBar1hP5baIoiOj+7GpjwO+F9jOhcp54EVvsj7ST+izJOCovbasNYrl8OKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHqgsC8NqXAMTHSzhSS+nUQV6h7LsGmhJwwBtM/fs+c=;
 b=LzTK6PEQYQCrie8OyOJbSyR7Xabbp3FLkG9VPA5PZ8U/V0sERtY721pj4j68eIUFSK0pjCMBaMvNG++Y8UmgcHgUQRxr4T4NsPkoBdN1isfMIV1sDdy51DYP7gsQohiy0Lm60+gpS9qXcbGHfMzsgzUy+7VJ3+9XthHdxk4YWHQ4AT654aI5UsYyObGdoDb++fs2QrrMwXU6QJnsyEUh0YLQ6zMfctJrSYf21GUgS4k3U9pdGpqHaOFlsftDdu4mp6yaELmuvw65NDjMjPuZlRaM4q2xMFkS9y865ffFZVuEw2qOChAYI5zYYae8PiXVui1wPTmloqs6gKakoixMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHqgsC8NqXAMTHSzhSS+nUQV6h7LsGmhJwwBtM/fs+c=;
 b=GZ1H5x+QcgoeVjgkGdm05NgfkB5jQIl6cpKImpBtC5rmwJhF2kNkvkl0R1PBEhWPZK4BSk/19h2oXgCjDekbnPjI7DnUt+C2pzRY7JlzMA/W033ytR+FvckLxgW8vdSJSz41GvdhAysumVyxgSzoRaB3AqW7z1vaDAwKHiV60juJ9zYEWfwlqK3XGKIUHVBq4YWkB/erNghsq9Xm5527YIGDPGs1S+6Iss2UsqVmKle2VvpVrQAo7CRgvxMYAKpKUB1tCZWu8lwYH4TCJUZBQ1l74xiXYHsU+zZqxltuDuW+gNIyxq7rsXzL5Ug7i40+pjgsPnLc8hoF6ljTZw+6tg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 6/7] libpcap: Fix CVE-2026-18313
Date: Wed, 14 Oct 2026 16:38:55 +0200
Message-ID: <20261014143856.74426-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f99132-336a-4940-90f9-08df2a00e7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	RHP4quT+sI/2GL37IDdvrp8CmgvVpXKIWtbbbv45GpbOS8aj7Wohn1h6wgovEVfGB/W/tMPDugzas0o+Bybitf/0Ww3RJ3RoQObKchOZTqituj15KhyCVjaaTrujecg+MDRzHKn4sBUM6hlzLWt08+45r80ysjzQzgsBZiEbWxj1XoIYJeZFY/S0nZUsq6C8q7gSkz5mb1CeD5tnSNY20ZG/95Fw8o6BKHf8GPpyAFBcrqyiNqt67f68qBId9lQKAgJ/8dKxogg/g/t72qIGv3nCxGyG+5uJsf+/eUvr87Sy5gINDM1pkwF44cYfsntw4NHJYwcPpNmvYKX/9gOAAG5ryJ7kLCV/nfu6C9iYhR16xU+H/9xnNR2bb31F9MJCiiiCmhUVpSaCUmYVXWxkfAHjtSu5auhFshRj0QQ/wp47GNRWIDJNRixUWKuj7CFxI8TmbDc/wue7iZIyp0Py6laWqnsZP2vCwDRfTA2QH8CCFc7Vo3WRV9XU0znATfa1tgxgjf5WdgrbBU8eTlSs+qMDM3aWWO7viasHiNoY4tLlhNw8vH6GKe3MJ0p2dojPLpo7wN+kBsHIByZNwEYPcaLGlmMdvCKDXyHGKVHwKb4hqd0HHYsWdR7ersaRU7wP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xL/8UEP3ML1jU0RWmbC2d7QRNu7cu39UCmBzeKZpxgBJKTvU41F3XaoNX4G/?=
 =?us-ascii?Q?SVtHUcmFPSojK7ci2IgrVFc+oAf4tDss3zEnzGThxnwAozr23adxx3HX16+/?=
 =?us-ascii?Q?ySwSfezMnjxSVcriLRngONpVxjt7anAapxy4VcIZh5FcoX3MIoaeqNO7PFys?=
 =?us-ascii?Q?3BHom8XE0+Nn5K0/X+607SUo0pGblC0QGGlL+slsMEf1HsiMGsQbsCNH02UE?=
 =?us-ascii?Q?AUGOgLgB9o3Y+AyC31G6X0HJpsS0qEa5InRkq65cyoInt0XDazYnYM1UvDNp?=
 =?us-ascii?Q?4Y8eidDOWYE5UMj7dTU4rPbhcoLCiBt+QuYOj+Pq1a5/d8qkxLNb1vxgtla3?=
 =?us-ascii?Q?IMwl6YE10Y9Qt+K4tnvV3P3vzhdbXWr+itwTFKUMrckJtODd1A38GwfplyPE?=
 =?us-ascii?Q?fcULGCgXZ3nBRFN9Cnd3r31Dy3fksWpZqwZfnHvc/isxJN99KS2o66g5XYnk?=
 =?us-ascii?Q?KiSwg37pNl3+//sP0dAvbH+wPHjob9920GrYNNZT3pstE4HpaURMFCMOZDEq?=
 =?us-ascii?Q?0bhshMB0bNAUFNtQDpeg2V11mtTe8oLwQUl8/JzTbXl4UpPawBgV44vFyIF6?=
 =?us-ascii?Q?9sVeFyWueaW3D0YACFHbJzJOzdG+UZc1aBGVAYcA4u9/1Or6VzYcBbPl2kXR?=
 =?us-ascii?Q?MYtxk7f5O128MHuh8LEQK+toL8mH9nzEcvapQ7xTK+liHzLIoojP4Ppkb6tm?=
 =?us-ascii?Q?7DVSED5aSeVdoAP6h1CxsVegQzD/x1R0VygBBybwxtBxWJ724aGhKxzDRMgf?=
 =?us-ascii?Q?ol+NBQ1uzH7bm5vdLcZCzHH8gp3AaIv21SGa37PTMmRSPwOy3bDy50P9j93b?=
 =?us-ascii?Q?9QqNGrOUmbKfDtCpwj/XDw5DX4FDtklo5gqlkGw2TLrADTCA9G4ntIi2bZyt?=
 =?us-ascii?Q?fvtNdQvacgc0nz3riUmYbxx1njYG3gzHYhNS7/Z8MPufxGpdXfPezPRQcq8A?=
 =?us-ascii?Q?oR9RmIewhNPtkyfFWyCqjFwrvFQUy/ShtEqECmbe/bT4PCzEvAihovawhSiz?=
 =?us-ascii?Q?0IAfO9KNf1D2A+DiG1av9eZSaxxxAiZhT5zbhprX8uDA8j+DPVf0vt/2WgSc?=
 =?us-ascii?Q?fRKL+9aQ4qstx/kQ797GgYpTzQY+SgJIHxLKVttVpwUCTz+zf0VhGmsRn3Gk?=
 =?us-ascii?Q?/FLWr1J2vhaVD0mveaIu+07TH8iUG/GtSJlYRQaxndsJIfX/hoN/gaVFheap?=
 =?us-ascii?Q?1dWSCnLd6iLYjx+yLhOATq0dWCUTvaS1oP0+ON6bliQ/MDheRM3OxMbzHHGA?=
 =?us-ascii?Q?i1okQ0r4yzDUOXfPNoYwgdg8OEVmqyZlry29ziV/r0SW2t2bEkAOz0NFcGWB?=
 =?us-ascii?Q?bkZ76nPxaaHA6JTDAamaQLFALCvN5c8nHRmo61WCeZYM2T57q8BBYK8CrAh3?=
 =?us-ascii?Q?CHxrcXhPr0yg8SQyOjXlHB2UHReziWUL2PXnoSAWwP80BIajqycEMk5hswxo?=
 =?us-ascii?Q?4+OYoj5vNAzsIyuXfUGrTUKyNZnK6EvCYLsixTG73+A6ko4zXPDH/anOuuH+?=
 =?us-ascii?Q?8eaJfXNrYeIasrKqaUuOCb0XTI+Iz11dUQqVTagthuekrTMOui6dWoOHw221?=
 =?us-ascii?Q?6C+JcD9dkrq5dbj6KhRCHfZT98b+utIrcdPnRiPQyj89XKi0KsIgTwruuCJd?=
 =?us-ascii?Q?lo5KU3VG/ukqnLCmpdMeBcjn4gY2eKLlx398BfOt5Ksi18Z+FVYrVgHJz8oU?=
 =?us-ascii?Q?Kbp38roX4tMvmYYqZRJuJlS5XppNqf0QsVvVBRUYtlyzLhqs6sxhbBx0A05/?=
 =?us-ascii?Q?wykfyNpr5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f99132-336a-4940-90f9-08df2a00e7b2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:08.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDylgyBrxId6vRwcI0KOeilNHmbl9Nq+giy+vz+2Gf1o2phtFkD4hPQCJ+8auZXL5/jh3ivN6Hk/4EZIODN5uUUO1wqEu6VYS/+srntsTe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247772

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775a=
f1a0ec76db60c7213241e6b48f1be10ac7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 84 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 0000000000..2a9df12e2a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,84 @@
+From f9775af1a0ec76db60c7213241e6b48f1be10ac7 Mon Sep 17 00:00:00 2001
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
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
+CVE: CVE-2026-18313
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 9b0f8285..b0268688 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2378,14 +2378,8 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctrl=
_ssl, struct session *session
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
+@@ -2401,16 +2395,19 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctr=
l_ssl, struct session *session
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index f7ba1bf3ea..5f1506f8fc 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
            file://05-CVE-2026-6554.patch \
+           file://06-CVE-2026-18313.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

