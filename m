Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9509CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15448.1791988755421376542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=C74ndloO;
 spf=pass (domain: est.tech, ip: 40.107.162.20, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8EK3hLZ1bIQ6FuhbaMz1dfTJc8YdaWJU/+9jdRHe4CdPiqdaW7UQvrTXDZBYpyolknz9SzT0EaBpDtFvj+TK05YqnOIGn5e3oJJqPWNWbdG/kcm1aP2j9GJm7IDPitmATMIbYJcu+T/nVjCIAoWLfKF8LZLFH3S+OVpE0Vx3tneLqJX/g6h5ukqrMx1+xNcVG26UuuC85CbUD95grSpja5kcjgBuhzlNTq8WKRVywZmOMVP60LkC1EkjfezTd0oZ+Q7e1OkwUhI/KBWoOJA9LnPICXJ1wlwdZ2VaOD+MrHRm65lnmbbU2nWY/VrAjqu+AlW8tpung97rZnHWJEpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91gYnffLarq0ccFgu/lurfVxECPeIC58YO1UpBPYTPc=;
 b=jcLqGi3QJi4f/LWNJDGu5LMqK8FKs5qUwHTg0w/YUhJS8dWX+mFTnP2ZWjt/boSlSWs/T/7O7UjxqorCGb9hj2kPzw38OxlHSzf3N0rlBYSk/MByF5uoeewqaG/HCdz/AC7jkcQOEUlEyTeiqMzHfzmkqa+kQ47X5+kJynIqZ4Hk/OlfUSsXJb8lbnjGnzlJ7HCLDJS1E2b6RJBcXGZp4nwJqIvmuflaFgf8OlBmDB53/S6lMnQOU2HZcWLKboijkcxAqDlcQ0hoOENCuJQKzeXWGIJ5oO2za0UCOkmp8f3pG9YDZSlJhq0cQrJpkEOTH9+RRjv7Swp+h8zoie25WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91gYnffLarq0ccFgu/lurfVxECPeIC58YO1UpBPYTPc=;
 b=C74ndloOZuvM4w8U/0fDmN0PnOgomT4CwUjGGEr0f+DpzrCZxRfsWs8betefRfiT5eOp/BLfCnhZBtGByaCgEds0NrmpOKrQnDisAGxHxyfKs4Anf8Mxb54fMru4qx5sfirS9f6mccBSXYlRwv+nWY28IioWnLNczZRRmqg/Sjg0vlf+eHcGnEsPjWKnmEzQ8LypteK1JbXuvqamVJwd/ztkV6T7aQ/pSYIfYUZAHtQczor7vyVGu0z+Axh7wLuSYLxVTLEsGdjGH/KhZOXoTGnOZQkbhekA6mGWgdz7eZZG6zcf2OeMBR0fgj35mQqehtdW+SVejDCTGUqgYdfUoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAWP189MB2570.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 7/7] libpcap: Fix CVE-2026-18238
Date: Wed, 14 Oct 2026 16:38:56 +0200
Message-ID: <20261014143856.74426-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAWP189MB2570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c80164d-7c7c-4e97-4a54-08df2a00e89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|22082099003|18002099003|260925022911599003|260925021311599003|260925021911599003|12006099003|13003099007|3023799007|5023799004|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zxak4u3013Tw1/5hGSSyWi63k0j+G8n/g4CYDnRPB/GXgkBJsKEp2cOh1yc6ijmqelT40maaSVZ0GakpaZu9/RzHwYtVa4RrntsGon9pZntT0QdiFsmHbw6OV1REN+vf3g0r++JeAZk2qnqR9q+PReBGHRIKQcLHLEtterTnkwLVya5ZpwgW+jGfb3Yqg8kx1V+aQ0WLg5k/Y1AiIamUX/AR3uNSQJDzHkpf7SSs4e4uPOMTuV5/i+RKZtq020VbnCFkZvu3wZc+X7l9LEGENgcAhl+xe1wJ5uBTK1r1YElsxMk6RDwJTo36LOIFuWWUjevgCv4WkEXGeIRUoKrY4fTV0Ke4lFrp4eFYarHrHrCYFYTfDOnbYalPFXKqrr1Fg4hsmyyIvtjSlrnoLmLgpLD1OBSP/gPONZZr0XWqvWc6qas7O+25V12uERN1gXvqnZusSRc5y+Iw7IF9CZHJhukkCYU1DJh0qLOLtTFyq0I3dg/MoqojVaDn5mtQkpQHEdA5ahmo1pLJ1KXW3zgZwyP9RrVK86A3qgj2xb7w4LHJZbxoWwA75Z5a46zrs2zrxcndiJnhEhmMadgHJCg5Ia0FYjddaZZrXgjt/y6On251GEwWJsWX6W+K6hWptyzr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(260925022911599003)(260925021311599003)(260925021911599003)(12006099003)(13003099007)(3023799007)(5023799004)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5evLe56N0O32rc7/8VC7HWPkUO6km53Jnmteqr+Gv4BuosAd6yGw+vCz+DHH?=
 =?us-ascii?Q?u6Tck/hv6w8aAhDwngkUXwzBZgSwdtHYLo83Cz83wFHiAO+/chFuuRw8m2ff?=
 =?us-ascii?Q?ZPebVSv17WwputLcQ12euD5a4kOUc9DSiwTqyvdxOKJDU2ZHiEETp9nTVwXw?=
 =?us-ascii?Q?wYZ5EJbitHzYLEqo0gtSBEdaSPRU0J+t7ZwOiJX1D5wHUZ6IscOeGHx7JtB+?=
 =?us-ascii?Q?QHSRg3A2XuId8uZHnZfrXtqcWuDsHqC19kdSXVUTBaITmnIcOizPNY9C242G?=
 =?us-ascii?Q?5/0NdZlqkbxhadosnsvSj+QlOC9ZaDSTd/inyTqBFFOWm3pkXwU4Y6RX1BJ/?=
 =?us-ascii?Q?rWiOtlR0UD6M0XNRYaMH9Gv12uVnhc6xr++POC4hN/vdc+G0/D2OZvyfRenM?=
 =?us-ascii?Q?+Iqi18hIo9ZISdVMUMAGPp2QT3DrOPUR58W5lZQDoFvnAnB/3S2I5vRzQ6+Q?=
 =?us-ascii?Q?qluXeNQNNwjuTuj6ntcc4XWap+jAeUNPcs1tQAsfyvrrJGVjI8zhKVtTEvxq?=
 =?us-ascii?Q?lYnsE+nJ8k4ezCOKVO2jRBmV00ba7jys98DzqLSQqd4iG5He4FQ8MuKmu+8u?=
 =?us-ascii?Q?bdDzoM9mea0ZTcdTI2NcfwQ0BT/Ni2E2o6DBmujiIe9CLgDcydSNiz+xS1We?=
 =?us-ascii?Q?tcb4ayEe3IQB9InEnJzQ7hXE8GLRbqLXJAejY5vaGzPXmkI/9pAAtOCIZnvk?=
 =?us-ascii?Q?bMNweUFOCVJMRNfTax738haJEa3VWLdrueIqjsiMqiR3Mz4MQfXz4VWtAj3/?=
 =?us-ascii?Q?JuD5ZD8C7+JbWeiB1CftC+3lCEuKVUhvCnhVshosa5Ju1SrnikwOsc2nHcXa?=
 =?us-ascii?Q?PJyMf2tZAlxXftvQxPMivAij2vV7cilAD0cwpAETUoqUYDYB6Pwn6Y0IOou4?=
 =?us-ascii?Q?jgg2E4SOfQliMoX36Xfck4Gm49yfdlUFBoIo7UVeDp9W1TCV+lnS+5V51AUo?=
 =?us-ascii?Q?ljRSmD5awf9JvdF11Hx71fYNN5KE2WofgMVIrHngG8zEoL194sa+yJGRfDvf?=
 =?us-ascii?Q?fI03NpzjgCHMW3xvpKwqKtYh9nApfQiQXmckKwlVYyQV+YqrgpDibv/qnO3a?=
 =?us-ascii?Q?Dan1BdHh5Gv3x2XZMCv6pnFcb/FZAs0yoO21MEeTsrB/84pOXTN53qtwtgTG?=
 =?us-ascii?Q?SjrvxjUTEcnXh3N55v6Y6GBJiFB9vsddKsIxrwwzKcPz80jW1MLJOzrl/k6l?=
 =?us-ascii?Q?HgBg48fE8nWRsLNkB3Kjhj4o2OwysYHhEoywdhVS/mEMaYU3L5IaAOhIloO5?=
 =?us-ascii?Q?T2A7MLUxkATDcX6rmYli1lIKlaTs2LN7ahV2Y5ks6UDdYfrt1cQ8ZOPl/FAA?=
 =?us-ascii?Q?yy0Lv5SolzurROIfmVUnrrjHN9U3CFwrVS4tGxxcVOOALuumMvh4KU+wLien?=
 =?us-ascii?Q?quHOgDO18AeSGNePHG0DWrBBR3cLWYJHOXC5Bnnjp0HZHBKdQyGBs4jNrze9?=
 =?us-ascii?Q?0vRj/XztQKQ+iiczl44R26cInC6bg8PSlZOxv+fkzIfTAgFIQrOVy4sXPInu?=
 =?us-ascii?Q?wxRh7DDJB+rz9nXk2vj9dCli41piEPAH+8o6yPNTQFBPRg4GdqkrP5GeRAQV?=
 =?us-ascii?Q?gWdmjei37tUbEWrtOJfiK9J1yY6G24MJISVCAGSanvQEsMHXCw/XqteOlmX2?=
 =?us-ascii?Q?Y90baNM9KjR07d1cQIHh5/nRI2w72j0YJjlnlYmZIjAEJkTlWcMIDGH1bQo9?=
 =?us-ascii?Q?LGORtFdhqrsXibQ1eUSB9nA6aC47i6II6ENybKNOISOiXglx7sWJFeq06gXu?=
 =?us-ascii?Q?6fyUc9cLYQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c80164d-7c7c-4e97-4a54-08df2a00e89a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:10.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJNxqkc6YVqX5uEVNVT+VsRc2Xr+QFt5whRj2oXbFLprsWxcGdqyDwbePDqIy20wYU7akblHp+Iga0p502lMkFhT+5K7/7w68eVmfOOZkgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247773

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d=
482986d64673712460aae1d48d11fa0473

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 0000000000..36f80c483f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
@@ -0,0 +1,222 @@
+From b9590d482986d64673712460aae1d48d11fa0473 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Sat, 8 Aug 2026 00:31:10 +0100
+Subject: [PATCH] CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.
+
+This vulnerability was originally reported publicly, hence no credit is
+given.
+
+When pcap_read_nocb_remote() validates a received message, it does not
+verify that there is a complete RPCAP_MSG_PACKET header in the rpcap
+general payload, also it uses an incorrect value to validate the length
+declared in the RPCAP_MSG_PACKET header.  The latter can lead the
+protocol client to over-read the message buffer by 20 bytes, which in at
+least one scenario can cause a SIGSEGV.
+
+Fix this problem, as well as a potential integer overflow in the UDP
+code path on 32-bit architectures.  To make message encoding and
+validation easier to follow, re-jig a few variables and update comments.
+
+(backported from commit 2d67e814e8d3791a8b508c359f94688c5669cce9)
+
+(cherry picked from commit b9590d482986d64673712460aae1d48d11fa0473)
+
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/b9590d482986d64673712460aae1d48d11fa0473]
+CVE: CVE-2026-18238
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 22fc7363..30fbd6d6 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -388,10 +388,9 @@ rpcap_deseraddr(struct rpcap_sockaddr *sockaddrin, st=
ruct sockaddr_storage **soc
+ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_heade=
r, u_char **pkt_data)
+ {
+ 	struct pcap_rpcap *pr =3D p->priv;	/* structure used when doing a remote=
 live capture */
+-	struct rpcap_header *header;		/* general header according to the RPCAP f=
ormat */
+-	struct rpcap_pkthdr *net_pkt_header;	/* header of the packet, from the m=
essage */
++	struct rpcap_header *gen_header;	/* rpcap general header */
++	struct rpcap_pkthdr *net_pkt_header;	/* RPCAP_MSG_PACKET header */
+ 	u_char *net_pkt_data;			/* packet data from the message */
+-	uint32 plen;
+ 	int retval =3D 0;				/* generic return value */
+ 	int msglen;
+=20
+@@ -448,13 +447,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
cap_pkthdr *pkt_header, u_ch
+ 		return 0;
+=20
+ 	/*
+-	 * We have to define 'header' as a pointer to a larger buffer,
+-	 * because in case of UDP we have to read all the message within a singl=
e call
++	 * pcap_startcapture_remote() has pointed p->buffer to a buffer large
++	 * enough to contain all of the following data at once:
++	 *
++	 * - a fixed-size rpcap general header
++	 * - a fixed-size RPCAP_MSG_PACKET header
++	 * - p->snapshot worth of bytes of a captured packet
++	 *
++	 * This is sufficient for all code paths below.
+ 	 */
+-	header =3D (struct rpcap_header *) p->buffer;
++	gen_header =3D (struct rpcap_header *)p->buffer;
+ 	net_pkt_header =3D (struct rpcap_pkthdr *) ((char *)p->buffer + sizeof(s=
truct rpcap_header));
+ 	net_pkt_data =3D (u_char *)p->buffer + sizeof(struct rpcap_header) + siz=
eof(struct rpcap_pkthdr);
+=20
++	/*
++	 * Step 1: to receive a message that does not immediately look
++	 * malformed, consider it as a fixed-size rpcap general header followed
++	 * by a variable-size rpcap general payload and require:
++	 *
++	 * - a complete rpcap general header to land in the buffer, and
++	 * - the header to declare an rpcap general payload length that fits
++	 *   in the buffer after the header, and
++	 * - the complete declared payload to land in the buffer after the
++	 *   header.
++	 *
++	 * Since this step loosely corresponds to rpcap_process_msg_header(),
++	 * which among other things converts rpcap_header.plen to host byte
++	 * order, mimic that as well to produce a valid argument for
++	 * rpcap_check_msg_ver() later on.
++	 */
+ 	if (pr->rmt_flags & PCAP_OPENFLAG_DATATX_UDP)
+ 	{
+ 		/* Read the entire message from the network */
+@@ -470,6 +491,8 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pca=
p_pkthdr *pkt_header, u_ch
+ 			/* Interrupted receive. */
+ 			return 0;
+ 		}
++
++		// Require a complete rpcap general header to be present.
+ 		if ((size_t)msglen < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -479,8 +502,18 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pc=
ap_pkthdr *pkt_header, u_ch
+ 			    "UDP packet message is shorter than an rpcap header");
+ 			return -1;
+ 		}
+-		plen =3D ntohl(header->plen);
+-		if ((size_t)msglen < sizeof(struct rpcap_header) + plen)
++		gen_header->plen =3D ntohl(gen_header->plen);
++
++		/*
++		 * Validate the rpcap general payload length declared in the
++		 * rpcap general header.  Use subtraction to avoid an integer
++		 * overflow:
++		 *
++		 * 0 <=3D gen_header->plen <=3D UINT32_MAX
++		 * sizeof(struct rpcap_header) <=3D msglen <=3D p->bufsize
++		 * p->bufsize is significantly less than UINT32_MAX
++		 */
++		if (gen_header->plen > (size_t)msglen - sizeof(struct rpcap_header))
+ 		{
+ 			/*
+ 			 * Message is shorter than the header claims it
+@@ -495,6 +528,7 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pca=
p_pkthdr *pkt_header, u_ch
+ 	{
+ 		int status;
+=20
++		// Receive a complete rpcap general header from the network.
+ 		if ((size_t)p->cc < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -514,27 +548,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
cap_pkthdr *pkt_header, u_ch
+ 				return 0;
+ 			}
+ 		}
++		gen_header->plen =3D ntohl(gen_header->plen);
+=20
+ 		/*
+-		 * We have the header, so we know how long the
+-		 * message payload is.  The size we should get
+-		 * is the size of the packet header plus the
+-		 * size of the payload.
++		 * Validate the rpcap general payload length declared in the
++		 * rpcap general header.  Use subtraction to avoid an integer
++		 * overflow:
++		 *
++		 * 0 <=3D gen_header->plen <=3D UINT32_MAX
++		 * sizeof(struct rpcap_header) < p->bufsize
++		 * p->bufsize is significantly less than UINT32_MAX
+ 		 */
+-		plen =3D ntohl(header->plen);
+-		if (plen > p->bufsize - sizeof(struct rpcap_header))
++		if (gen_header->plen > p->bufsize - sizeof(struct rpcap_header))
+ 		{
+ 			/*
+ 			 * This is bigger than the largest
+-			 * record we'd expect.  (We do it by
+-			 * subtracting in order to avoid an
+-			 * overflow.)
++			 * record we'd expect.
+ 			 */
+ 			snprintf(p->errbuf, PCAP_ERRBUF_SIZE,
+ 			    "Server sent us a message larger than the largest expected packet =
message");
+ 			return -1;
+ 		}
+-		status =3D rpcap_read_packet_msg(pr, p, sizeof(struct rpcap_header) + p=
len);
++
++		/*
++		 * Receive the declared rpcap general payload from the network.
++		 *
++		 * p->cc =3D=3D sizeof(struct rpcap_header)
++		 * p->bp =3D=3D p->buffer + sizeof(struct rpcap_header)
++		 */
++		status =3D rpcap_read_packet_msg(pr, p, sizeof(struct rpcap_header) + g=
en_header->plen);
+ 		if (status =3D=3D -1)
+ 		{
+ 			/* Network error. */
+@@ -557,27 +599,36 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
cap_pkthdr *pkt_header, u_ch
+=20
+ 	/*
+ 	 * We have the entire message.
+-	 */
+-	header->plen =3D plen;
+-
+-	/*
+-	 * Did the server specify the version we negotiated?
++	 * Step 2: to validate the received message further, require:
++	 *
++	 * - the rpcap general header to have the correct version and type, and
++	 * - the rpcap general payload to be large enough to contain at least a
++	 *   complete RPCAP_MSG_PACKET header, and
++	 * - the RPCAP_MSG_PACKET header to declare an RPCAP_MSG_PACKET payload
++	 *   (i.e. the captured packet) length that fits in the rpcap general
++	 *   payload (not the entire buffer) after the RPCAP_MSG_PACKET header.
+ 	 */
+ 	if (rpcap_check_msg_ver(pr->rmt_sockdata, pr->data_ssl, pr->protocol_ver=
sion,
+-	    header, p->errbuf) =3D=3D -1)
+-	{
++	    gen_header, p->errbuf) =3D=3D -1)
++		return 0;	/* Return 'no packets received' */
++	if (gen_header->type !=3D RPCAP_MSG_PACKET)
+ 		return 0;	/* Return 'no packets received' */
++	if (gen_header->plen < sizeof(struct rpcap_pkthdr))
++	{
++		snprintf(p->errbuf, PCAP_ERRBUF_SIZE,
++		    "Received an incomplete RPCAP_MSG_PACKET header.");
++		return -1;
+ 	}
+-
+ 	/*
+-	 * Is this a RPCAP_MSG_PACKET message?
++	 * Validate the RPCAP_MSG_PACKET payload length declared in the
++	 * RPCAP_MSG_PACKET header.  Use subtraction to avoid an integer
++	 * overflow:
++	 *
++	 * 0 <=3D ntohl(net_pkt_header->caplen) <=3D UINT32_MAX
++	 * sizeof(struct rpcap_pkthdr) <=3D gen_header->plen
++	 * gen_header->plen is significantly less than UINT32_MAX
+ 	 */
+-	if (header->type !=3D RPCAP_MSG_PACKET)
+-	{
+-		return 0;	/* Return 'no packets received' */
+-	}
+-
+-	if (ntohl(net_pkt_header->caplen) > plen)
++	if (ntohl(net_pkt_header->caplen) > gen_header->plen - sizeof(struct rpc=
ap_pkthdr))
+ 	{
+ 		snprintf(p->errbuf, PCAP_ERRBUF_SIZE,
+ 		    "Packet's captured data goes past the end of the received packet me=
ssage.");
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 5f1506f8fc..3892454a40 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://04-CVE-2026-6244.patch \
            file://05-CVE-2026-6554.patch \
            file://06-CVE-2026-18313.patch \
+           file://07-CVE-2026-18238.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

