Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEB2C982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5809.1790021847111180949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=T6s0MsUQ;
 spf=pass (domain: est.tech, ip: 52.101.65.65, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4GZlB89PuKD7EwYiXtWze8KKgnYsY6ENBQCAxhkapNHwlUu5B7jHGFQPV6CLsnK1HqvY0UB3Zo6IXQ/VrNPPZXgfYP/u0qNDxNfYz5UuePVSb6JQcJxCp0s3JuKYkDA7fihjtcG9ctQVrtGHxZ+3f/Rt6yfGnEZZ3K7qbUOD8h8MD0oHonTV0mQHg1CgumZJKqxUQNuEu3pIV4fkuZt34e1UIhAcocyvYMloeMpO+HgB4SM71MRc+iz0BXXO06wX5OpxM40iKjPzdsLQ/0KLMp0gGYY72ZY6n+ILPMEYsU/t3Q77JF8tExjPasUODSR7eUFSQZLvI3wCzjIoZDTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHqgsC8NqXAMTHSzhSS+nUQV6h7LsGmhJwwBtM/fs+c=;
 b=P4LLThzCTGObOsfAZLpjJFnicUPPNjUnMQM4MFta9YbHa3E5bt1KFZuNSgJxDy8VeKxKuqbPYVj25FVR6sLEWOyXKru0/Uy4NYHwn/M6gfHhA5fkRQNAryqWxH1bFPcevMYCWA9Lt+kwsXNljFZ0YX1KjktnjGwW03x4zZ1S2REFS04YFyNLEXrwWb1dKDDA0vgbMgBCkhQV0Uq9DKaATJE93H0OgMdphg3Bzv9r2gBAcIyW4x2ujZP4EHspr1Aj+H0iPOWWSK9jnJv5OirCbtkKK97SH6QuQEfn5MYUmxDSCuR2LltBSyjnAuLtQPyzVFQwIwC3hgnc2uxvW37FTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHqgsC8NqXAMTHSzhSS+nUQV6h7LsGmhJwwBtM/fs+c=;
 b=T6s0MsUQQSefqxl9p81N/oe6P1f/aAPfJKzN3sx1lJSjxExuRk1fkM8E3zu8MidpC386YNrqTYX+5PNpBgQBCmM3q1AVXTpSm1Np8e7sJneAIK/cM64B5TTRe06KAif3F1qciSOpkK8Gz0RTJdvycBRrhh9MvQZ4Fp/FwOJC9H0n9HvKRH12E7bb/KRgcek8okG6hxA607JStInudlTEa5KUlIKzUVJ55A7cdlzxplNjIqk2EJc74p/jiJ+wlP49KSxaJgCUpuAVwttD6htK+XiteZKDpua+FnSvJsRqauvJtMPU9a1KGZY0DK1pKM0U4E86cTqF5rXqOTC5NlUQFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
Date: Mon, 21 Sep 2026 22:17:14 +0200
Message-ID: <20260921201715.79085-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B7F.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::413) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a59361-2faa-48f0-71a2-08df181d5a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|12006099003|10067099003|3023799007|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VhgCtPF+gCEsyKvoYFUlO+5g8tGC0ZTffbiT1fTnP+yvCSOcIeOMVYUcCuZWv6v+4wGcwfvJyCBJH+1JRUSbAb77F/gqGuoJ4xR+vIA6Fls2sbcSjhfihC4D8EMomMfyEiW40tZJG33L5VXKe1GuMVNbONpFf/ZH7nvLFLdkV8myvp54gEAXblu2s/GooAhu/oK9fNyNjyP2VdlKbHgTuWvXXLq86lVH1biBO7AyhcMNGRkCRe+Wrgl05aQtwQNgckM2supyjLPJAtnkguAGCbhgJUBxoXUtBOmg63vtGCDFVGOJA/0uj0luAKso4cCCXG+fN9oRH6DMqbuN2lrG3XgcLtNOU4hZTKCuvWYW4zMnqQLg4rtpm0ewbNLcmu1O4ASa8Kq+MK4rZXiON33ApPxzWLWXiR3tdwmxqOxIMGU77LxuhrRuqJucAEUf38mRmRLqOCGWR3/1eT6swkdWWTP8jSvz2wMf6tKCCRXHnXh6aPtucMAhiT/+a3rRRm5ZnH05FKHAz+hiZe3OymVigfR3CYIWKDI4sUj/IzAP3BXqSGHO3V4bnbMVrzX2H4bX7tcL8Tuzbta+N2PkbDsUzeMp4No14mDJvENghA3KV51pFWnPBGWQzx4ml9eSrZQ6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(12006099003)(10067099003)(3023799007)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tc4oGFDngqgIdUho96UdBTL042xOI6WK3pEqJqu44NzFva1GAjW0es+h0loS?=
 =?us-ascii?Q?x1QrhnLEdxFe3Z1sjQfqbFdQxeqBwOAACsfpImNzNcCytUR+q7sISyEqL6Nz?=
 =?us-ascii?Q?G8u5uF4WWwySoEuC+hIUdI+QmyigDX0K48y75aNvIfYSm2rEEtylMs1Cjvxb?=
 =?us-ascii?Q?qWXTBYnS8ZqFmfoMLd1yOmG6OuFzMfGYj2SCb71icdmMxP7mNqfYzULcNged?=
 =?us-ascii?Q?bKaf5Tes7+ORo6VJeEJXfTcTanclyL0Ebk+tT98EmxlCT7qp+hI7QbCuvQq0?=
 =?us-ascii?Q?Q/TY5WbuI5qp6s17xsiCeQZlB0t2PbxnCHDtb9kqspiT783LQ90g+iHqN8Ll?=
 =?us-ascii?Q?AJi1ufk3R3PlG50GChdZl/vQGaQ6uFoLj3yms46IYROUTPepVL3Zz7yBbrSN?=
 =?us-ascii?Q?2TEvv+pBjPBcZpzXlNR08j0JRRHoWmCxGcYoZkPXE+7mHji/50nxpqVgvc5z?=
 =?us-ascii?Q?rJ8Md9XkeZ49nvR5kMQ2SWUe/OsT3jD90vg0qbcQLZPTOWQTxYtsj3KGV5Ua?=
 =?us-ascii?Q?lF/ZfVf/lCN8CoILbL2HEAmkuGW2ItpqvkUuLWz/uLVSpvppGmLtkBChdlc2?=
 =?us-ascii?Q?pLWCo5OLMCD9hG19BkDkNsHGVYh5UPrhIoq45CqKNznIEqpwgBeubVolQ1B9?=
 =?us-ascii?Q?UypeSw0aQRHdrYr8PnNBZyQV8Rdsl9qKmwlJd4z0WY4hVnKHU0KjSqA9Wk4Z?=
 =?us-ascii?Q?gLsEuqqPeLLcURJcpYQLHT8V5j/sxhdwDOTYX1RH2ht13BEUE72P5FN0WBDW?=
 =?us-ascii?Q?jS78XJ3YeVvoY4zD4eDBZnKrFkZ9x67Y4mCkZyCdLHTJNKrBJUbxKH1D5/Vl?=
 =?us-ascii?Q?fuKGqAtx9mhrglo+xJliUKqFvmw9i2KmqpCtpTIgLLBoUP4XF0uPgEWW/JJE?=
 =?us-ascii?Q?dDu14xeKs6ZVWSOq7ZvqcniaYic/kkwJr+KFW/Da+3nUEiPSCFXPeyJEwVLV?=
 =?us-ascii?Q?1Feo3hiZGc7ERebBx33q+V4mXhE9QgKiiVPr/oxdM6CSgXfOp8dqH1Ef47nB?=
 =?us-ascii?Q?ch3W3CwScoJPUrRmqhB3uAVmL5acvF2r4aguHYXxbLX/C3MO09+U3nUn6e0w?=
 =?us-ascii?Q?iWg9m5xd0g/jmn2+hUBZE9tWPu9n88bwMukDAVRQOa1vc5Cdl7dyxCjrY59/?=
 =?us-ascii?Q?kn6xFQQTzKHYIrLuuSrsWlcl3vqSTnOCvuKZQDiBO0XCP947xj3G2G4jDrU8?=
 =?us-ascii?Q?rvpStOXyAKBcg5gY3TmUZSNKmptjGCrbjE/9ouPfAfsI39OHl3UdIcNhAVdP?=
 =?us-ascii?Q?ToZxPjUIFgeKcf4CVKGBwaZS6juNP+7ZaJIkZSU3d/9ycpBbT/oxzZLeRwwy?=
 =?us-ascii?Q?FHNaD5AV3gKhGuIXDPK14UyoixTpyrQi7pQimVrj2EBnwAMtggozOw2jjQ8R?=
 =?us-ascii?Q?vB8Rzq+Oj21/enhC9ACuyWjVIoOuCGypd9lEuyRt4OJ8W1z2zgU1ohTjJNcc?=
 =?us-ascii?Q?dDOqqXLagTVT4+SJROhE7nY8sAF/qQF5VGjiMkWx2exlVzkP6xsxRgIcWerd?=
 =?us-ascii?Q?/9Oy7Jx3E+AiZp2kHKajgsr7qcyuSUHnSWmerabVYyi3C5AgUvAHPXvY5nCR?=
 =?us-ascii?Q?njonQweMZ/KQbEYG27bve9D4VDqS+gnlfdAuH6qP6ZON+2mi0b/qHFlnkv3x?=
 =?us-ascii?Q?DKkpMvrm6aN7jj8syUu9Q1gIjMgvYuXdStWVhegQkkJ+AcGutO6NmrkgSRDT?=
 =?us-ascii?Q?cH4/O8xWgWgzlWlNxXyabjEfaaQJvxYPrqpGfhxddOa47lAKtpOsoubclFDy?=
 =?us-ascii?Q?whJhyM7HSw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a59361-2faa-48f0-71a2-08df181d5a9e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:26.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mh+9UGUB6oOj1n6XHwj6cbJERB4+fS4DZr7v3rKpTBHLgbATnCSugipxPXYZDSI9ARE5D3PxEL0Evb8ZnDrBnFCCrQtn/WHOUw+baPHsEig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246354

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

