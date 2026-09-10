Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61DAC79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=C1ntu8QO;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz76o53yLBmHIF4sXOT0YYsX3Doxjnux8LOA9Ki8uFKLsGcs1tzPEYi5qdGQ+1FPfGVBsbMbUxcoOLtAevP183FvIyCKprYd6XhjuL4Q4VF2Zc5DwcAWcJjN2el5gS6tMlTqFyKzacVAjiZujbrlcJ/ooxcy7eGIw1ntSdo1S9TWifCVvPEok4htc6Iiibeu1L2r9pAFZWzu6vGN4FNSmSZ6gmK4DoYZjkTf5heqXxcWUQmVzpqYsfpkpuwjtJy7++eeHXQNtmK3Y0bWYR1ZKoTnxooLny6sKfY9X2rFupOUR+WMIJNmOQc5R3WLu5Z3rbgrKeVou43ozPWU1Gl6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8MJFvtEs4JbU5xgG3WfCaTyzRSUf5UxPxicW7X+kpc=;
 b=GWKz+cvVVa4rInPnXTlPln7EQDMNwwc75lLotBGax78h0T6BZG7O4qE9sY3pO5gy+w2Av1Kskm/QIMHdEv9CCxN/HVJJZHxYeUOy5/Eghja0DGJr0YqirY/BqzPYDfs4X5mAm+W6L0DIU1zrV7m26XaK+OhhKKiNI8zkCZIJVPFFFV1Fu42caZXBWKyv9HNOp5cOYY3C0lX815WYhFeNKlqZ6Qq1mhs0mu6qc972zKIQJHHzzoGkb5DynrvlsSHbX4TLqT3SlR4eZ4sYllb2cRsiCt71V0QY7Hy6azf/DVyym0EJkFGZzBlEU/wtboh4DdHOGau5o/B2vjnSoFo1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8MJFvtEs4JbU5xgG3WfCaTyzRSUf5UxPxicW7X+kpc=;
 b=C1ntu8QOKjSuRG0C+a9oiTaST2hltVziiGX4RdDDW3mi6rSIBZmnqnvmMQ+eb5yl8YVrEgqOq0UEcTa55+4WFzXjKFLUq6OFPpmjwLveMnZ8PHzf6jkZL5FuOeEYbnyaDpvcIQ3aWjrWy201sv6U1V7fXd97PG/ZuUmbP1V6qYWHN2j6NWq+t6PYrvPI/Jb7BUyT9Umeqa+SNbbBeETsv2tz2xRWqsyoDbIjrgnVfKpFEX9Zi4ZEYvaHI7QMfU3sqvPlwMf4rUiY7BufWBZHgVGiwXvjEywbaDdpOIw4fitPs8FjS6tr+swATYPvXkHC0YHgNKAsjfxIN50R9DAdsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:12:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:12:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 7/7] libpcap: Fix CVE-2026-18238
Date: Thu, 10 Sep 2026 07:11:54 +0200
Message-ID: <20260910051154.30595-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0304.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 430ae3ad-d56d-49c4-275a-08df0efa0c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|5023799004|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	l9v9cgLTASORfMOLCSZxqrjFHbOQD/559BL8ZwEKLvMtt9dCuijkndPlqjn/AH8Wo4ojdu+/mBV73eemrBbM07LTNqMneNKAVm66oEmmcZ6IZQcJB6G88tqHCTb1fCNeKCzvGMfLkZN2HcCRf4apZCw1NM9HEA0NcdXuqq+pxDKRQHXEgqx7i+OS9fEL5WT+ADL9FR4gpEKQ34vRUVHOkc2bQXb1ItpImktOsEjM92CX163PRDd4w56Fsdwhg13XKrmXUgalXRle//KJqFH8nOzwjz7j5UGrd/dUGOxsyBBkT5ea9JtwcEhYvjyepzbhJQE9BTfBDV8VXSfVJfZB65s5088BIWRjslCnaLlULccFzV7I6zObxM9ekwCSbziqUw/5Bn3p1FL53kvyqOKF3g2stGqURV2jvhO9Mo5qCtV3KwM+kDsuA556INRR4bRJ83II4bpFaybBteudMTyiHLz+elBkj93pNS3bXIAAL4eiSe7C7h+XdfLrErcbCSZ/0EZZt36CMMiARFnD07AA3oFOzuOoh2S5jCueMRs5hD8WWxgIExKtJ3mgNFasL2gsNswwaxdrKioOtB9OaTCMC/8AREtTUd0otdBrSwNtgWk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(5023799004)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xx/5YEOf9xF/VXT5PQl3aheP5VEsPcgAPcFFzh9M9x00x+tFnVBDz6eJdy8n?=
 =?us-ascii?Q?W6im3nRfFy6zJuluUjnO5Zlt+wAI/Vu7n+tz5/reIAgfT2Pov4dFJHJ3nja3?=
 =?us-ascii?Q?I5Q4MECqxP3mZ/OfzUSjYLRzq4X9r94Nxp7pTJXRpGSDMqGV1hbi6B03VEg6?=
 =?us-ascii?Q?wevwYGJcZLhA4GVLNs4Y/8MoQM1L0HX9DQtmLuksUpvjFqPWLKPhgFyjugww?=
 =?us-ascii?Q?8rAgW3JRNuE7Y0OjjTxOzbTfHfDoh5F5awKTrwelh4MSgkO3G+JhOfZo2sMs?=
 =?us-ascii?Q?+1HqsohOoGzeiSybOW1Rc53Mdo+O9VfDvSsXoLEmRb+VU7ON9GwG+gbvR20V?=
 =?us-ascii?Q?XL0Ya4WKv8Pp7W2sMC3ejYAW73z4+Nk1eXpU9c9TE5takm6yRwUzIE8k70WE?=
 =?us-ascii?Q?N9SwsgGwTwtMNgynlX8kppEb4CIbYKXNG4tlzT7F9xUUuTLxCr0NCt7iyi7j?=
 =?us-ascii?Q?dvVGgH6vf3YqqYhmJs5VwQWlb23FbUNkz7d6CpYoGTckL3ZmJAvw5gut7cML?=
 =?us-ascii?Q?YWazXoC/CSEIpZyRHkiomxuPwSLLVUjW6U4GPgrPusKifXxkMXcDxKjbPUI8?=
 =?us-ascii?Q?JFc0iNRphx2u8QdDOfWc2nHWN3uhMKD0vm8KaXgRgfzJ7Icb6apH4ecAJmH/?=
 =?us-ascii?Q?NvB4nnT7GsVH0Mpvn3GsWcs8zCOfHPXbte7WPz6GpyFLDMehuohE1Q06orae?=
 =?us-ascii?Q?hpxWok89HlVSIkNV3+kIJ+WNLHhzpuv42E7BqELAs9KzitojE/LsxhQA1/3G?=
 =?us-ascii?Q?ZHUyURSLKI5J09AdtU+Pt2PJvM1zhOMKjXWMmr9ZCPEvKAVzUmQOUW9sKyb1?=
 =?us-ascii?Q?wKec6KU+fIwqPHFIq7WJ9DCc+PXrIBXgjUuGarq2KK5AAt+1etplG9yA71t1?=
 =?us-ascii?Q?u4HojjgZr0iasqWZ9uKH1odEeoz3SKtGz/Q8slkfAnUO/fqdWIxu0qRvBApE?=
 =?us-ascii?Q?5g/+B0jYolYCINZxx0UefC6iGAruXkabSXnbFb38iVnLeInbQFz9+dmyhZpw?=
 =?us-ascii?Q?cbUJFQuUHiP0UiVM4xwGn92abGV8vNDWVuRfTz0CyxioxqD8PZW2YVH8eSam?=
 =?us-ascii?Q?C4ukGR8h8w5uUgPvgkbL/0o6xDWmOnrd/Z3WqRzQyaQTdR/mmOzP6uOM3Gvw?=
 =?us-ascii?Q?lXx1fOqNfbIcDhNof7XpqedUcYwLd+VRtia/IqwMSL8LEXtSMFcT/jX6Jqmk?=
 =?us-ascii?Q?XQspyFm89mDdG+J8hnptgHdNLBYs9LKHY4JC8uQh6LEq3QYAbk3BP6gFFEt+?=
 =?us-ascii?Q?mlMfSznfNXP73iYJcLMDAI66YTPznA72MFaTT/OyPxi4kuHn8pwqnv7pqRP3?=
 =?us-ascii?Q?HkzugSYHxk9uX1drCc3KbYy82+bTx4IVjz5sgesz8s5WivYqEXjYcpwhDJq9?=
 =?us-ascii?Q?ucz6+KoTAFVTpVfdN6AqYrjnvoaepMOzySjmqEa1JYEgXZCep9Of39hXjfz3?=
 =?us-ascii?Q?3Tw5RdWuImEmwwq4N0O1JhB9BIiZkg3lz2wgWR/ocdDSoYeCacmn7pci3dp8?=
 =?us-ascii?Q?VTr1oM4z2wNzSik4yOReL8wTu9/yp6b4EwmflwWNErhiV9OhPPNYxEFn0AXN?=
 =?us-ascii?Q?wXwZDiWNmcdQ1YQA9vyvgi2P0OK5rAOd0HhN3LleeUZ5W2UhVEp7TVcnsYTj?=
 =?us-ascii?Q?m5tkzFZJgCA3rul3tfFKfwtsNhC5UP2smxftatYhw3IKzuFSsPHUbyw8G4IK?=
 =?us-ascii?Q?7TN99Muraml2KyZgZBJFQ5bjdKCE5gZmgTcfa5RmbZdwS7lr1oRnpVSzKnki?=
 =?us-ascii?Q?N4+bZ4cFfV1sEelLtCUM3yPx8sl4PnRcu60vHCbRwuac+DaeLsmESoV9i+hH?=
X-MS-Exchange-AntiSpam-MessageData-1: nD1tQuVBUle+9qWOUhMj6rtHt2HCn5q90/c=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 430ae3ad-d56d-49c4-275a-08df0efa0c7f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:12:02.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYAUTwlGtccDFd223q9FNtcjG2j2KSDplD9kFZ8sJGflp9fhincswQ950eA01qjH9KRlKTKBaPV6KUBetn1bNoLpn39KWYSpz61sWkNxwA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245530

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d=
482986d64673712460aae1d48d11fa0473
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 234 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 0000000000..373e64b1ff
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
@@ -0,0 +1,234 @@
+From 5aa9cfee8eb44967dec96199fde879022e4426d4 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/b9590d482986d64673712460aae1d48d11fa0473]
+CVE: CVE-2026-18238
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES                  | 1 +
+ pcap-rpcap.c | 117 ++++++++++++++++++++++++++++++++++++---------------
+ 2 files changed, 85 insertions(+), 33 deletions(-)
+diff --git a/CHANGES b/CHANGES
+index 4f24f94..8e29fd7 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -6,6 +6,7 @@
+     CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
+     CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
+     CVE-2026-18313: Fix a memory leak in rpcapd.
++    CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.
+=20
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 8f8960b9..b7f54641 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -389,10 +389,9 @@ rpcap_deseraddr(struct rpcap_sockaddr *sockaddrin, st=
ruct sockaddr **sockaddrout
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
+@@ -449,13 +448,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
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
+@@ -471,6 +492,8 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pca=
p_pkthdr *pkt_header, u_ch
+ 			/* Interrupted receive. */
+ 			return 0;
+ 		}
++
++		// Require a complete rpcap general header to be present.
+ 		if ((size_t)msglen < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -480,8 +503,18 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pc=
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
+@@ -496,6 +529,7 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pca=
p_pkthdr *pkt_header, u_ch
+ 	{
+ 		int status;
+=20
++		// Receive a complete rpcap general header from the network.
+ 		if ((size_t)p->cc < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -515,27 +549,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
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
+@@ -558,27 +600,36 @@ static int pcap_read_nocb_remote(pcap_t *p, struct p=
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index 859897acc5..2844f4b2a9 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz=
 \
 	   file://04-CVE-2026-6244.patch \
 	   file://05-CVE-2026-6554.patch \
 	   file://06-CVE-2026-18313.patch \
+	   file://07-CVE-2026-18238.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

