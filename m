Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20288C982E9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:29 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1707.1789682908307953812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fzG5ZmEk;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so558215e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682906; x=1790287706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n4aYrVo0FyrYdFQ1rC5mQnib+WAr+IdrBXTcbmZes5M=;
        b=fzG5ZmEkmCI6U5iLFMpGcHHlMlfnuOVCAzKOM+MIcthV2rttVSXuXXEicRHXytZrtH
         bSQgIs3AMqdJoOi5I3rsxmqVCLaw8hDCC3htSnusJdTfpoW1CErMxtA1dI4sXTSeTyoB
         Hsd9CacX9hA9JWqqJh+Zbp4kXm70wlXPpa/rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682906; x=1790287706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n4aYrVo0FyrYdFQ1rC5mQnib+WAr+IdrBXTcbmZes5M=;
        b=2EtF1XXC4eLM0LtABlxnCk5nFEPiVLVL/clRDPHMHJuSDV6Jg234OVFcglQ1HQ5Y7L
         TQ9N1q/B6BIoiETUxJ67OOLhRJIiCSdWb9Cg+0JMyuk+OMsPp8lbM41mrQrmgCLavwHD
         6acv5MEpYrOGg57GAqk8jOJ+/YOIofVSr2XJSqnifS3akSLvyjf9ECoq0r/5GmHPAptT
         KzV6XMDuwBqF3o39Kfo/PcCm6UQ5+ZGH+WDu2vhH22OXVmLAdmzLedqaDunNLTwyF6fa
         ONMZj8nUQpoHoIMNcz7aRRKbYIZEfkwTpQgGMN8kQXcWvIG5prp9874V/46A1kZDM5Jb
         ZHeQ==
X-Gm-Message-State: AFuF++mwEFl72OLpjd3iDXVQ3Nr1lkUHp9+y3MyVB5WcEvmU6n8ehScK
	PVbOhed+zGxvecLg6e+VkN2ZE1xKgZq/CYBq2xVmcUKi62kfxu3EW0yCXsky2+ea9IsGQpyxFM1
	1m1HbVco=
X-Gm-Gg: AYBFou2neHn+qu/jDpUTwWLUcfPna3Od///IPnvuC5NwHUEWCJy9aHA9xRWgg6kFClG
	wnKosZKjsy9jL3AWw+N0ossKLP0BZVPhTSVwbruQjyLUP2FacMnIh/tmGtaxi/BmvEc2F6rvnIN
	D8NKk7K1CWX7EZ6JMSLC8flBHyKLTHc8EHY2bz6G4srnUVJtjflG1eUtXQfHqTQeGNZq0EAebml
	9XkSZ4mfXdaGppiB+JezzyUDLX0QaYS8iQG/Iarjle7BKexCcU3evjtxrB3vBakqS1mv7WrZGYk
	KLtKfzBytMrr7226dGaW+TqOtgqqrRnh+aX8+xDvdclF9NoD2cFDnrSjx6iMvgxJtYtc26QOH+9
	hQ2apUOw2SYciyw7cF1iyvZN1K0vnVGpG/KrzybwgGz45DN6o8Kr5pE89snL5bp17AyEa0vHekM
	IIOwejqZtghAT1HiPwLDoyoBDmE3yR/zzuCrVrt5StOSJuo9YqvDKfPcn1hcqO8p6DDa3X3F1av
	sveM6v+B3F5t/uGJJmR3hs8ff8IfzKOobUNY5Wy/UZCiqgoCJ87ieob3jGaX/QtiKBO+W+18ug=
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr5995185e9.14.1789682906450;
        Thu, 17 Sep 2026 15:08:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 68/79] libpcap: Fix CVE-2026-18238
Date: Fri, 18 Sep 2026 00:06:53 +0200
Message-ID: <ae8e685504d86c5ba214947525548d0fc61235f1.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246163

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d482986d64673712460aae1d48d11fa0473
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 ++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 00000000000..d664f5b358b
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/b9590d482986d64673712460aae1d48d11fa0473]
+CVE: CVE-2026-18238
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 8f8960b9..b7f54641 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -389,10 +389,9 @@ rpcap_deseraddr(struct rpcap_sockaddr *sockaddrin, struct sockaddr **sockaddrout
+ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_char **pkt_data)
+ {
+ 	struct pcap_rpcap *pr = p->priv;	/* structure used when doing a remote live capture */
+-	struct rpcap_header *header;		/* general header according to the RPCAP format */
+-	struct rpcap_pkthdr *net_pkt_header;	/* header of the packet, from the message */
++	struct rpcap_header *gen_header;	/* rpcap general header */
++	struct rpcap_pkthdr *net_pkt_header;	/* RPCAP_MSG_PACKET header */
+ 	u_char *net_pkt_data;			/* packet data from the message */
+-	uint32 plen;
+ 	int retval = 0;				/* generic return value */
+ 	int msglen;
+ 
+@@ -449,13 +448,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 		return 0;
+ 
+ 	/*
+-	 * We have to define 'header' as a pointer to a larger buffer,
+-	 * because in case of UDP we have to read all the message within a single call
++	 * pcap_startcapture_remote() has pointed p->buffer to a buffer large
++	 * enough to contain all of the following data at once:
++	 *
++	 * - a fixed-size rpcap general header
++	 * - a fixed-size RPCAP_MSG_PACKET header
++	 * - p->snapshot worth of bytes of a captured packet
++	 *
++	 * This is sufficient for all code paths below.
+ 	 */
+-	header = (struct rpcap_header *) p->buffer;
++	gen_header = (struct rpcap_header *)p->buffer;
+ 	net_pkt_header = (struct rpcap_pkthdr *) ((char *)p->buffer + sizeof(struct rpcap_header));
+ 	net_pkt_data = (u_char *)p->buffer + sizeof(struct rpcap_header) + sizeof(struct rpcap_pkthdr);
+ 
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
+@@ -471,6 +492,8 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 			/* Interrupted receive. */
+ 			return 0;
+ 		}
++
++		// Require a complete rpcap general header to be present.
+ 		if ((size_t)msglen < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -480,8 +503,18 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 			    "UDP packet message is shorter than an rpcap header");
+ 			return -1;
+ 		}
+-		plen = ntohl(header->plen);
+-		if ((size_t)msglen < sizeof(struct rpcap_header) + plen)
++		gen_header->plen = ntohl(gen_header->plen);
++
++		/*
++		 * Validate the rpcap general payload length declared in the
++		 * rpcap general header.  Use subtraction to avoid an integer
++		 * overflow:
++		 *
++		 * 0 <= gen_header->plen <= UINT32_MAX
++		 * sizeof(struct rpcap_header) <= msglen <= p->bufsize
++		 * p->bufsize is significantly less than UINT32_MAX
++		 */
++		if (gen_header->plen > (size_t)msglen - sizeof(struct rpcap_header))
+ 		{
+ 			/*
+ 			 * Message is shorter than the header claims it
+@@ -496,6 +529,7 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 	{
+ 		int status;
+ 
++		// Receive a complete rpcap general header from the network.
+ 		if ((size_t)p->cc < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -515,27 +549,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 				return 0;
+ 			}
+ 		}
++		gen_header->plen = ntohl(gen_header->plen);
+ 
+ 		/*
+-		 * We have the header, so we know how long the
+-		 * message payload is.  The size we should get
+-		 * is the size of the packet header plus the
+-		 * size of the payload.
++		 * Validate the rpcap general payload length declared in the
++		 * rpcap general header.  Use subtraction to avoid an integer
++		 * overflow:
++		 *
++		 * 0 <= gen_header->plen <= UINT32_MAX
++		 * sizeof(struct rpcap_header) < p->bufsize
++		 * p->bufsize is significantly less than UINT32_MAX
+ 		 */
+-		plen = ntohl(header->plen);
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
+ 			    "Server sent us a message larger than the largest expected packet message");
+ 			return -1;
+ 		}
+-		status = rpcap_read_packet_msg(pr, p, sizeof(struct rpcap_header) + plen);
++
++		/*
++		 * Receive the declared rpcap general payload from the network.
++		 *
++		 * p->cc == sizeof(struct rpcap_header)
++		 * p->bp == p->buffer + sizeof(struct rpcap_header)
++		 */
++		status = rpcap_read_packet_msg(pr, p, sizeof(struct rpcap_header) + gen_header->plen);
+ 		if (status == -1)
+ 		{
+ 			/* Network error. */
+@@ -558,27 +600,36 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 
+ 	/*
+ 	 * We have the entire message.
+-	 */
+-	header->plen = plen;
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
+ 	if (rpcap_check_msg_ver(pr->rmt_sockdata, pr->data_ssl, pr->protocol_version,
+-	    header, p->errbuf) == -1)
+-	{
++	    gen_header, p->errbuf) == -1)
++		return 0;	/* Return 'no packets received' */
++	if (gen_header->type != RPCAP_MSG_PACKET)
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
++	 * 0 <= ntohl(net_pkt_header->caplen) <= UINT32_MAX
++	 * sizeof(struct rpcap_pkthdr) <= gen_header->plen
++	 * gen_header->plen is significantly less than UINT32_MAX
+ 	 */
+-	if (header->type != RPCAP_MSG_PACKET)
+-	{
+-		return 0;	/* Return 'no packets received' */
+-	}
+-
+-	if (ntohl(net_pkt_header->caplen) > plen)
++	if (ntohl(net_pkt_header->caplen) > gen_header->plen - sizeof(struct rpcap_pkthdr))
+ 	{
+ 		snprintf(p->errbuf, PCAP_ERRBUF_SIZE,
+ 		    "Packet's captured data goes past the end of the received packet message.");
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 859897acc56..2844f4b2a9b 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://04-CVE-2026-6244.patch \
 	   file://05-CVE-2026-6554.patch \
 	   file://06-CVE-2026-18313.patch \
+	   file://07-CVE-2026-18238.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

