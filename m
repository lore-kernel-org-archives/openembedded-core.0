Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB298C982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:35 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5565.1789501533986104486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZcteM91b;
 spf=pass (domain: est.tech, ip: 52.101.66.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxZgCKv/KVHpB7H3+l64bnneFGNdzncZzb198BO+PrDRsPlsbvx29RhshyqOn8eW01RmZUt+0vj6MtHO40kePYMNUcUzTfarbTkrCOll6A9zXXSj2vcALjxt8bGjNo8deUrnlmwHcML4gmWTESQusVS7mm7q+VWsq8ZeaEvLHOuUimfT5hhJAL9V+V1SHPKZMnQD1ohQLnzMxOOXWYVNUZ/eh/VUiXt8W8hv9o8SoHloEhS3cCtHI5nk1kzmvi9d9fc+2q3HERznl8DC9PnjAK3lLeYMit9oBvwjieN11JG7/sAi512Exsjyfgk3Uj+I4RxgGGKdwTwc1Pr8LUcX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raQXxk+wyh/CUTST6nnIk9Bs5sF6NvV62Mao9hV93DE=;
 b=o8RCC9YJIu9xZVofTFMBfEJf1JJ+YjqP1Zrw/3l90lOusfF3uV9KzEj5+eQzadR/O4/OVbud0SwiXXPN46ezlCiEdB3arly4hDYh0Ex6AZfesgE1A8BqsotXWiO2PqFJaLm9h75EX0Atb4sG51jwNv1xak7etVm6dm8ojd4DO0uKISkE9WlOc/BaYyOeo7wbDoAiJEunbdnus10aB076eGxGp+VsCVvnWeCpMp6T+SNI3nc68GSvx9eQlteTN1Eu1Ywv6hx95hJInNeuCLAdBRvsYTTieUk92ily0qPzbi0ylBItSilyqm7fri0xM07zDy7fxPSVtZZp3r6+jx/AMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raQXxk+wyh/CUTST6nnIk9Bs5sF6NvV62Mao9hV93DE=;
 b=ZcteM91bI4TNMKy1l1qhYpAvsMWRr2EuvP0WE1xsILD06JdLB9KppEIxL2kHaCY7YZzqZrupr6lC8M2JMf3gUsqPVNTxbFq0R71gsE70Wa22Y+O2CnJnjZOHtp/H3exT702fR+C3gux0J//km3gFszmMZ13P9lqr0x/Jap6aIIWUbD73UMA622cQi8jBwPRAn++5uX9uJO1xSzrI0vJwHX/V+I/t4rh8PVrkHyBcAF7whoZCcAs2xkkVHVGmE3BKeqLjbqIb8N9hO2Pkb7qyJOUhlBgYU1/DmULh2ZruM4dy/6dMq8Tf/jVpH0A3uTq4Dy5tPwdWBZY+EVx0ybzO5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:31 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 7/7] libpcap: Fix CVE-2026-18238
Date: Tue, 15 Sep 2026 21:45:20 +0200
Message-ID: <20260915194520.45847-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0273.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0facff-9ca1-4fac-61b5-08df1361e6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	44OEpmDi6nSF7aToo36DXHAZeKXQ7odQol15mEU4P5B3AaJLjbHgIoyr56RkeqRZ//bJk8509NAboFppELSKa8yflCV+JCBcG9iMSXWMUE5GJVgX7DeykNCPLoXyQ1GRjATo5C/RU9HaAhpX+yi/FGG8Tooi+r6ymeaPIjY+xgei/r1ziaA3nOiblnjwbogygWBIyTPqcdP6XHx9RQNGifNe09c/JpreSzum5IkC3G3r3FI9XtBo+GiLh/06/sDLXkTCKd3zTAuMsPW5HuRE+NzZYKOxXaQ5M5J1Wl/k1SNmBSxfIeV9B+TTfai/f+FVCLg4mJfmiKmIQyZkfxBahx+qYgJ3r2FmRQZDQsL0Kubt0Q5TgB2ZDv0uzsbWMmEpp9Ikg4dx4JQ8n7u+d6eRrkv52ltUiQ4MQ4x31nRnivVBXfsmm87vY00dsQnpx1rhpRR7wBNXkS3EJDeG+iPCo8cvxLOxjY6XECTRHuAyyEMiiJGYhR/EYrtsZrdXUN5Lv5pg+4NDHgtgnZd+vpsgLESSLUch2P/oZYKjwHuStJlv9ToVfQB5xqof9iUcvhyCAPXEOiYFoiRafxfFznm2WwoTuF1ni+0iMAyTY4sCXS11+/5UNJPbLaIMPOd0qSkL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/TIDKS+y64Xri/K9JkUmOFG2JOrYpxedFuCFS7Gej7wf2vbWWzleWuHhbi/Z?=
 =?us-ascii?Q?nnFr/hOsiBrSHPFxWsAYQzhyFeBnFzhML1olwB9S7PZDCZN+0orcwjAujT+b?=
 =?us-ascii?Q?B0sHh0zTTmHLVgA5XG9h7hTqw5rxfbTQOb4iuYBPdr4a/ws8/RfUj8nJ6OJp?=
 =?us-ascii?Q?awFJ4DGhDXPdgpU6Xosj9LZbMsG7O+pcCHKmDDed3CTBLpIE/2Ik75s903xo?=
 =?us-ascii?Q?RoXhOm+3wHk9qEWIgi1cVW85ouK2ATXCFYR6up+gHIrvrWm2wTyl6Y6JXNHM?=
 =?us-ascii?Q?4cYyP5bDCRnqjrAKaT3tWyFe8SSiKhp7Y9IoxLrb9LHcZcLnX4wL/S1NWGY+?=
 =?us-ascii?Q?X5paSELPJlVNKzsaweVlO6ZJ2dJ4rA3VEh44xg8ltQHu8/zxsw+VOe0CLIqe?=
 =?us-ascii?Q?DoxRr5VXd60Y8N+bZwbdNqO9Eg7xkCcz0MNVwxJXH3fsu8ox0TG/7sII5h2x?=
 =?us-ascii?Q?TiYh+7u8L12H4qcVzHY90V9EfJ/gyATqhpNW5Nc7ucTTquh2hTMaMUqTd5QQ?=
 =?us-ascii?Q?YiBzKUOIBK0n5j47rxm0RZHgvGKle9pAhaqq0di481L3F1PqtC9KWJGJx6Zx?=
 =?us-ascii?Q?z83PbQMuU/4dGW1ixcr2LEfoz5Nco1cjG5fCduoqRioLnebDNB+9ASxo8S81?=
 =?us-ascii?Q?s78wpNFdQ6i0o4KJz30SgkolqMdgI4vtCBqXiJRxNPDpiCHVt8yJu/61ETSo?=
 =?us-ascii?Q?yM41H1ej2VxTkCjGSTItttM5f43oJhMpo8vwDpGj/732XfU3hAInO0rz/IB6?=
 =?us-ascii?Q?Sz0PeWXtRGKioyqP7i1/t395DCHLHt8S+p8JhH1dZJxYQJztxAycQ5fpCaAm?=
 =?us-ascii?Q?hW+I1x/CL8amOYl2D4hYSJpPwgmDuSPK74ZHFKpyfbYW9kv46Iv/P4I9KVYO?=
 =?us-ascii?Q?3wxW87Ustfjuj9nB6AqjoySvlvL5/oxW3x0Tsgz12O49Aqc88nb6RZMkGd4D?=
 =?us-ascii?Q?FelIFoVmVUao7m5HzGFO+oAsWgZXR9lRAtJO9ZuUvBjoS7mgXJNjdZpQhBk3?=
 =?us-ascii?Q?eBSUZ8Xj1b0BSUmWA7APWMvE3JCEg+UHKqWt5vMIk535juXaUSytfT3tbzhl?=
 =?us-ascii?Q?fMYPqhE/y8wKKLgz36pMLthtgxfpAQnzbwpH6sG0JzIxVqR3T3AVd5W1kdJo?=
 =?us-ascii?Q?03zbxpmbTHdsbd2NThN2k7Pg0PPVLuHcJ1F7hf/04b07d6+OI/ISKBw1eg/o?=
 =?us-ascii?Q?s8Q6H312qo2X6XFgIXX9kxDzG0EiSu/9QWhCsix1m2VPwY2g7oY3eW2qSFjR?=
 =?us-ascii?Q?zQWUznLz8O5Jlcz6NHtZMkNl9iXVw7+4i+AVA5b/gYOlK8rj4EmiTx94JeO7?=
 =?us-ascii?Q?qk1IpQbA1fo1PM7exqQgY2EmhtCO6DGx1owWsp4fif8PYFH2H/fbWWRorarO?=
 =?us-ascii?Q?tOLRoSA5MABvd5Iu/XUXBNgMjGjPtsUCqjudjx8zZnBtwGtuOb7Rwf4cXW/1?=
 =?us-ascii?Q?myy7IgddAeaqjQ8R4vBR1WIHFWPHunCUD0iIxwflVBMySGiKdyDTcur44J2a?=
 =?us-ascii?Q?N4GizNsuy9mbUHxweunUJtfPDESta52rSFi6WIVIav9T2nqJf4BtnJc4cf+z?=
 =?us-ascii?Q?50F3a+OMTlnBmk8MN+n93SQAjNWxJOhc7BuowXige4Rj/WdC5jjt7Vwf6pkC?=
 =?us-ascii?Q?ajjHe2c+hMYTSVHJ4uHHQreNurLISHhy7AMHPvUG1q866juVPRiguS9mKnan?=
 =?us-ascii?Q?H2nk4qKvahRE8l7sW6Alc/15vUTC9l908TFXwoVC9T6ziOcnhaCn2JRnXAhq?=
 =?us-ascii?Q?39c4vC86/A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0facff-9ca1-4fac-61b5-08df1361e6d5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:31.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRoTd54anHEhWvBqYx4OzsokmragvZgPSyWHXE0E7d/B6yQWSLs8eiHSshQr7A7DHSN50DO0U70+o7IqUPsYwqb1raA4Xtikve7enM5jpso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245898

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d=
482986d64673712460aae1d48d11fa0473
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 219 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 0000000000..c981fa8ff1
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
@@ -0,0 +1,219 @@
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

