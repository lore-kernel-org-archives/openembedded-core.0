Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB257C982FF
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5812.1790021852865173722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Bhcz84XK;
 spf=pass (domain: est.tech, ip: 52.101.84.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lR3L04rCTdM3dtv7R5IU25KK/S12QTwrifg2nmxXkrhovmcW/gJMoCnRxBYnJjSEJddDrJNe6DMQ4ZgdjPg8TOTOXMVm1pf258g0dKzUXzy0FgM835ENFLodWIVajeSR0mcHtvJkJqOKzGxRE8YY8wfD/ctG8fwo501jm6h+KZ4uJKsYWby+sOBnY086Xqr/l+Uf5lPynmZ6HWVw+ve1999GtL3VMOTX3DOn3HQod/Soz/NRcrtaBSPJvPtIG4zIqTWbC1eos7+t4EUUCBIITMTIkCIOyBjuYyqdgr1n9+wYwGmvtMYJ8+NouLeDA0LAzzU7T+ldX+Kgg0xbQ1DjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91gYnffLarq0ccFgu/lurfVxECPeIC58YO1UpBPYTPc=;
 b=brx2a5sciu/NFD3+6KmaoZlESS1EHR3rUn66h3X51Keujx8t9AUvn4XR6A/69dqdsB0kWy+Rtw6DI3aQGeUdpCbM9uH9RZ6hJN/sDMjQJp0G8bzhov0TPWf51oxyMozQFlzcRgMLExerNCZ56zAVTJiuE8mPACbnXigOH8SWcbcW2OZ0itC9PdKER0Hierxiz/AU77pskz/VxajLChyDFYFY+N7PBV0WJvG6F8zf4JXsECAYmt+v2TJJXHMMHjrcH9I11S7Tf87enuOXy29GRB3JD3yfB5c0hwmjo1LbQxkHIsdq4V4cCzHN9At78UZk9dGAemagkRXCx/ihXCevQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91gYnffLarq0ccFgu/lurfVxECPeIC58YO1UpBPYTPc=;
 b=Bhcz84XKjn6A6hCHr0mi0CHSm5/oWK7CgATsV/EicbFFwT5o66XqJTbucBThR88GlU7mVJX/kk73UPDrgXr1P1Ra1bkg9gysUJMSAEankEz95BsnewhCW0l/tT5Jq96QlnDXn6cOSn4lBZKetKhHSVhDLPOknz/XeIz2D20sMjTSd1892GtsANQcCuQSJ8IRH/wP4GSFSwnWd6L6gBdLFsKLn9HYNR3dvzF28vKNzbFwtw3RdLifuA7C33d5UONRAh3WnD0TFBpMV3jfMjh1wTuffdfL1VV1r5cxbCxty885yElQzykZClguy/Ay3yLBp1uwQKpApYN6KMYTiE9ZjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1234.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:247::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 7/7] libpcap: Fix CVE-2026-18238
Date: Mon, 21 Sep 2026 22:17:15 +0200
Message-ID: <20260921201715.79085-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0016.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bd6e7d-55dd-4b4b-dbe6-08df181d5bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|10067099003|3023799007|12006099003;
X-Microsoft-Antispam-Message-Info: 
	eRh+l2Pe7xN5Mwyi4PpkXviDlR4t+KSvRTu+egUE132iuqX2YlGHTiHB6ostpBHBQ0TmNmRy1iLa9aXpInpCsAXq1RYW7rqVbi81MGCyXDsYPaQaROdh+brJ/9IPcFrUuX2b1W/ZiFTny9F/DGWCfHDSnn1/JgqWA6D48nnnH8xr1jvS4E9zZNRJoKZPDKX7aOrliXt95f6LyzWkQ49BFwH5KLHJXT0GYlz0DxmbILL0ka9IqEw3tLftpbFxrifIGL7qnDKq8oFBwaPQrnujplcr/KafVgeX8j+wnCgSkv68SKqjHKyrzSLLO0WLAu/bfr+MOxUfgFla3vgVur/Et5O2EzQTO6VpI+8p2v3PEjCK7U4grUKsQIVj09LDjwpK2VK70lpx+VR4v4HMbE+xn8VDr9IcwtBzLw6FeuYgeiIbdT0x3vuquD2nHyOSWJboyTGqPJsJIWBG4jdJo2QBWvA2sx8nUn+RW1vViaik7in4ecE1d30LENJw6guG3J8bKLo/UGuA31rkbnMkHgGpc3vDj9XEm/xyE4ymRzl6ZcDGKSFZkUDJaxZNLpayEOvtb+be6xRrHsO/5EPv8sGasBGRnCp6ZJb8F9hwxsfWOJsXB5hkh+GqtkGl6M0oV8fr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(3023799007)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iZGVTbMOQSUb+EAbBjv722sd5sWiMohHYyByS/AP/7vY/QFtbfI67tBaIuQo?=
 =?us-ascii?Q?msmvasudzG3rIiLd/74BKehFJg+YEmEqNVieVyntnspFgLxKQ5pyZSZlU3vJ?=
 =?us-ascii?Q?LWkTdBExHBnmfkKleH1DRa8bA3+TLvYi6zAy55F+fnHb/nPZS8XrmJt8/QK1?=
 =?us-ascii?Q?VeE1rIcm1YfJRiXXGToJDBsIP3X5WP7bg5IuyqLAJY4E0z7XEnX4BhinL480?=
 =?us-ascii?Q?MNgQl3NXiudEmY17hfAS1L6nexBc0HoylMZPsq2f2Jubnn6fsSWLj1relsBn?=
 =?us-ascii?Q?Dltj1CWvzXFqICiEH1ZhakwRFZZU1MVWSS19vl3F29hcDHVZEMg6K6tXbfIL?=
 =?us-ascii?Q?RelGMY+PNEqA9zbb08RoFYh1Qxi76m1U/elObEUT3iNlja3jFxp5YSMyuv3u?=
 =?us-ascii?Q?ZNuiH+yh8G+z4LsHfYArjDzyj+or8Kcs6NPwVkhXA9hwYtBMVqWQ1ocsQO7P?=
 =?us-ascii?Q?khbKZ/CwuYaWrxZ0dKVnsGL6vywG9T2qk4QzQ90/IAUoiStR4zOSCBQ9E0O+?=
 =?us-ascii?Q?RbnVZfQOIKkd47P2VUir0pgKJmWdrtau2V3Zca06gMMUIGIH/OWYFJ7WZbRV?=
 =?us-ascii?Q?nlUrBwztuzDPwaXFKXKKMjbsQSgeJCLFCnxhFCrAFcHvhI/axafhRzju9Wze?=
 =?us-ascii?Q?kXiSzxZ+OvtTTpL69ciKRKZEAp6cZ/yPDeGyRfphB3jt6jngc1k3s5dhEh3G?=
 =?us-ascii?Q?ZlEYVbAE+qFZ+L0rYa4f/wwpDhPOJulR1XhUmOnxuFksDwFYQJtniGQ6VeGF?=
 =?us-ascii?Q?g5XSy+KCe2U4+6duCXSoi6G4gueZxg1enXXAhaXJwZMnN6LHuNCe24AqsJHx?=
 =?us-ascii?Q?SWwPQAufH0GQxBgWEK8d29qJquuowtYO3/agJJLb+WxjezJOS27ISjoIK2eJ?=
 =?us-ascii?Q?JUpNAaSlN5MeCYoFHXwI3naIKS8z1cFYMZVixhxu+I9lY1OjhF+sadvoexJ/?=
 =?us-ascii?Q?dxgV6ZBBGuRY71IVw/slYYUHAI/5VV04v6+sM+buvwFKA7WfDnwHbPodcbeU?=
 =?us-ascii?Q?Lo7DKIsjDY/aNooNwyBDKV3R+cJTDFg+fIzNq3DAHZVieOk8JBVNG/tuiu2k?=
 =?us-ascii?Q?xlntV5Hkh9y8Al3LPXX2QY22eeFZ+siMoV7I7l6nPWFlSMIZQCdOgx1Vk+DL?=
 =?us-ascii?Q?8S8l3V16GS2wHf84b08DgCczMowjLAQPM69eGXU7Lh8HjKpldRALqZDlM467?=
 =?us-ascii?Q?8BeyrgkebLhw26v7KtJNcGqP9fRXKcxAYLY8yWeQWafQIG76nvB/1Ug85kva?=
 =?us-ascii?Q?HPZ5UoWO9w4bxYrRplxuUefLqLHH3LHxjlgwkNvG1b1V98Yi02EsIADTOZ7M?=
 =?us-ascii?Q?z6yJyaOg7pi7zGJm/dh69ZTDCSUwRym+S2PMM1xfQHC8B2kc3fUkJ1lNSz93?=
 =?us-ascii?Q?Qzk9OIW0Wx1ty9hlhYUb70Qe2c65BpiggHRFG5XEaNEkGR9Bi+IKKNMDNtL9?=
 =?us-ascii?Q?IesjTsNNlq1l9MzX0IDvRrxWlUMOsQsSi9x6VIQa14fPu/StuN2zDOGHcnMD?=
 =?us-ascii?Q?mJSnaIGMdpGQHqFxQQaMyQoZSXGo4L73KP1UuHkm1GcNdxD2iM13qdocKe7G?=
 =?us-ascii?Q?OXyuU+i6N4ThKdlRG4kBdicFwZs7yQ7HS+198BYAldKHTmJIa8a+CcKunb4R?=
 =?us-ascii?Q?N6qMDZ5PBsIFTU162I39C0URllSle9dMb9CBf4YeF2a0vsY0hOxzG1P8VGqr?=
 =?us-ascii?Q?XAlmKo37M+lys2v+CArw0lxgcwphizbc/5iclMoQXDGNOTc84i//vXQ9RJUO?=
 =?us-ascii?Q?WchiI1Yjbg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bd6e7d-55dd-4b4b-dbe6-08df181d5bc6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:28.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM9jDgGyayV/XJX17sXpjT+HuIsBAm+0obQupJsuzeRZn+7dOu7dBcDgXzGjUnhZozKEZ/OjvGYVnaLgPbDV2zedVRaxdS681qz4OwDcr1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246355

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

