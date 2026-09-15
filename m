Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494AFC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4962.1789499796613908729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jl8xXtv3;
 spf=pass (domain: est.tech, ip: 52.101.65.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emYv+2/9BQpNcjD1JpEkZ9DgCnFW7jUWawQrpPv5qjyuWpCwMO7AfsCQ9PG7k5dXSghMUKyAHaumnmGoli/HFQcNOUY1vg37FQKLvGMDSjCee1RReRG6X+zWt7zFJojqTnRLmJSDsJ0rDwBVAOqmsVTdV8XFAbvQSS+cR8Jd+U43xk+HuJx2grll88VPBRHBGEgBuHugyMOeBVchXW6pxbNj1kS+wztLilPiOhNSXfvqTSWBqqMfzCPKhDgHmpZmk5tXx4iP4mTiAZ1Zmpcd/mF2NUJhQ1+0lM0fzJrvFeMJCJfz0JSJVj3H3OBxXC435vJ/gLspBfYA2/gi7mkFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dxj/upShgYShp30gp45iPXh/6oT+L4XV50+OnNeT30Q=;
 b=ElpvRBUqRp35J9JOV6CLCgv7vt+T0MBCSzqCQGgMjYV+g8e0ES8uezI9BkgENLkTh2kg1f4/MCHngNa++x18DC3raOfIkPTGXKJ12JHUW8+1badVvFaXSgQq/ova4Hi0397EwM9W/6SBxg8LABewwYw0DJB4gM/I4D715ZDtTY/qm5YCHohms+yQIche8ZRd5GDy0kuUcVMHKCMYj1w3qArMdx41MDIw7IXSv0mrrfUmZYkEV9M1w6n05zMfDq+MVqc5IfVCFP+L8BQjQqS2uH4dO/QOrOeQhQKXLxAXduaBILlDaZL7a6IanzVTLON1ex8Zq+4MhwrH6yt50HJ4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dxj/upShgYShp30gp45iPXh/6oT+L4XV50+OnNeT30Q=;
 b=jl8xXtv3LNByj/JqHn9lYGVAaQzZGA5y/28AHOBc0dDz4hgPQbOc4oupLy9YBwqkujhng+3BpYJaOIlV8v878MEhpnyeUfolhzdViv6PFB1U72e8BBPe2uvQ2cVlUd6DhVJ5jOXJVrN9nxmgoooJkYE8x7Mpr1Tp5SlCZd/Cz292417fIVRcNeh2Wq+IFsV82C2+sO5y3uXC4B5APfA2bHYaAj53ezoSFfU2FP981nIWmNoJq+KUxVvRcZ9SCcUT9Ls54oD+HNTvUj1/JwMYfiKwBLXMw14+9rL2+T+BJVoJhs9Xh3C0ucSXJ+DogdyvMtq5HXkQeEyYAsidMf+MHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:36 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 7/7] libpcap: Fix CVE-2026-18238
Date: Tue, 15 Sep 2026 21:16:23 +0200
Message-ID: <20260915191623.42107-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: 075baef4-a4bb-4cca-b0c8-08df135ddc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|12006099003|18002099003|22082099003|13003099007|3023799007|10067099003|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: 
	qThsGpkyXbbxptgh55TmmzMxO8IsDUqyjzNKp4rA4RG7NguENf/w9kS/XlkY4NiWwCI/RBb6mdW7qZ5J82qfwLhd130+6jyQjzHAwtxjd8aAdbFbLWV07OBOD7u72dEsO/JTKD4rnHcHxraH83AMp17eK4ayEXkgI1qrz8MuExPBSHD1N/OVeM8eFqCJkSv6Hz1Yh5Y6cte1X/TWrDUVHvPx/Z+YNSADEPkE67naSPANhZ0afjqdVuTkEC5ToAGz+NwDqiqxCV8bRuDzBJcIzLiyEwI7Y0hoOXGHQdtximPT2ERZa9SHXFb1sPekuYqHDTorw6R1h66amARcE3PAaul1k4/5lB0tAIMC30YBCE3W+YsnDZ32CTsGPywY0KQ3iYgJmFSv9kGoU/fyVCUOP/rvfqpG1lTsqyZSnbccWuAvfR2r6CGi82yjFxIURlx0YwQdeYDNvG+QTu26ODV0/rMse185PvjMGxtKm+0TDXC38c/WUTLk6hVfYWDuQSiMTO8mnZlhCXV2BQHaEZzOtjymLE4RhjoIG+obeDg0EDoMkAFSOkL34SImB0vEd7HEane1WwjBtHm9OHbGdJEwAiJxLtNZpufLM2PoQnGcNws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ion5iZ6S//X/QA42w3/0w9AZO6lrkiZiJredLARfRet5NSWyjKxkQj3+jWQk?=
 =?us-ascii?Q?b1gVrIe8SrHolvCak3baXoP/Seo2gcLN3D+gmEd87I1n7s/Kia/5Pm5iFeDl?=
 =?us-ascii?Q?MJPYMZZ6QZLmU2GCQ7JXqGfTBezYaHPINn4ytjjeFpBEj4ffMGCqdLP5yk3Q?=
 =?us-ascii?Q?un3KSXOoS9uV1VpaW5gUDH8B6FE0cnJorjMtXDL1Lbi54JaSm4y1gFf8dleW?=
 =?us-ascii?Q?RoYSfnUsicHtPWkwPlVZMK2BqUZ5ZOH3mrRBQ+Ot7cXYcK8ahe7zuk6ZnHjP?=
 =?us-ascii?Q?HTNZrf5zUy8tTHQX+ukkWyiQnQZYQn1EGdp0V+1l2gyntAky9Ko/tuQUl60X?=
 =?us-ascii?Q?RaeOyN1TXF6oikvIIKUB+felLwp9kR1Uf/iJCUbi+9xfpbKGpHigelM6Xm15?=
 =?us-ascii?Q?S3wUevYb2lJWGgnvJGtoKRmVrtXSWNr9JbOBLaRoWizI750+zSp4dTN/YzPa?=
 =?us-ascii?Q?CBdN/QUAYEfi0ZhIera4DOsjQWhcCqQudwjkTIwImB9AeFgT0eFcJMwGSNCL?=
 =?us-ascii?Q?gFOde7sTm9670Mn9XzhgKclHGLcl3DMo3M1teSTj2j/fK/0qVbY18DXd41ZD?=
 =?us-ascii?Q?6PMtrlQeJSRzRT7OV8y+qdM784+sExX+YHjXbLIz8tNFn3fHNfKSg8VqwHnP?=
 =?us-ascii?Q?mjjbuCUN+cccOJRnVjdBWnk8Q3Hui1mKLTtiSl5LRLR/K0OkIcskk5vdp0uY?=
 =?us-ascii?Q?JvOI2kzvoY/es8tCYLo90xeHD4kjVrprPT1DL7TgucJUWxBOZ4qUDeIOn2JR?=
 =?us-ascii?Q?LAQBqnsApFp75Q9wnFKMRvf5t3zqCK05bHCk5HkdNywcd+LRCWSPv/cECxi+?=
 =?us-ascii?Q?T8TWCCnEUSDkR+x0dCxIVjCnB0IV0ryP2s9Zt9z3CKUeR8HoquwWz5XD6VTL?=
 =?us-ascii?Q?KOwNphjoTM9TdpLnjo6Zr+k8cDgvtKqRonhfPYAr2GRHoyhWfcoMD2liJEAo?=
 =?us-ascii?Q?/B44E5qLgDYvl6MTJoclDVHs/1WcWICVU1NRtBE3Y4SVbjzIXktzYHXIK55v?=
 =?us-ascii?Q?c4IAA3n3ppxAEFDgI8jgnKWdve28a0cW88PXlvmZEX5fbMQo19wCjA24sdAj?=
 =?us-ascii?Q?00im0s5RQlDGze2ayBfL+hGiSsadhBnUgwZiLHzMYNZW+1N/62KKW4USMyD9?=
 =?us-ascii?Q?3CaR9wUPV7w1mXzn/5Cz+IDMO6qZVbiQTI41HYoBsh0EQmvu5B8LRqHof7NG?=
 =?us-ascii?Q?/jFVvyJ8A0QcwIRyiKn3WTfx57QDRTNtsmyyQYcMD/9nzwLrU/cEan0by+IH?=
 =?us-ascii?Q?4kEmuAPJdjv2UF2ww+5vAC9o/+Te9S9pndZkEKlmd5QgcLJHuRV2WQPbCRxB?=
 =?us-ascii?Q?KQ9Y7NYCgfXcrsqnl+70Cwl6QLZCJAdGcaacjgJmvNAxGJnegGL6YEwXdpsd?=
 =?us-ascii?Q?9K9scrSup1ic+aZ13QXjubPrqAl7P4itOFBEK5QtJzQNh+sPU1Cy7Pre3ij0?=
 =?us-ascii?Q?G5ExlWxHI+4HwqLYDxN4haU4ru90exLpkAOgWK2Bra1XhGqQm6iWzNnnq6h9?=
 =?us-ascii?Q?J5RtBYRvLX1gALh+oRe5VMijYAkIXX8YoxGFEg2qwSnk1sr6OSAU97XcZnqN?=
 =?us-ascii?Q?Tr9QwqmCdQZC2huzksosIQ63KbO1IBiH2tRl7C/mHFHComfy8uxrELhaJjyD?=
 =?us-ascii?Q?IEWVT8xbSMM1bJoLHvo8qLbP0MXNonsJ0tfOgopXzrUkf16e1lnQEcK3wYCa?=
 =?us-ascii?Q?bNn/bYZILE96kYGwVupNkgRDrEpnCdnhydtnsY3xNNT1ILf2/3lDgLn4Y1XI?=
 =?us-ascii?Q?AaVwDFliCg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 075baef4-a4bb-4cca-b0c8-08df135ddc9b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:36.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxrt7zfdfItgHvY+UIEPldl0viG2KvK0lqh+DfKPV4xJVHN1MnERpuJ/vZq06Hbpo9Dw+UmVqS0iMm4sgDrDDBWmLaZAC9jP8pUTQ79Luz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245874

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d=
482986d64673712460aae1d48d11fa0473
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 0000000000..d664f5b358
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
@@ -0,0 +1,222 @@
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
+Notes on backporting to 1.10.6:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/b9590d482986d64673712460aae1d48d11fa0473]
+CVE: CVE-2026-18238
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
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

