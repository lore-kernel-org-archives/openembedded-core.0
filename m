Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C03CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32855.1792040656745067296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FrGCO7I+;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a020e65269so31227415e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040655; x=1792645455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ka55WP5UG2fczh2eLqHUHHjq0Ob1WRXHPs+hpbOjzgQ=;
        b=FrGCO7I+u2ibOiKp1XRzVRTayZQ/8H6jKADv2bK6ui+ETkWrowNnfM9riMUMyMjkmB
         zcgSfpuw+A4ZuiWdoOoRYwozDYhwqZuK56oRdvy2xbLa/f+cSo8PFdK1TXmKxlFrZlDb
         UrKVTZPWR3v4gVxZ0yZCMQ4nAOcTunMHVVr58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040655; x=1792645455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ka55WP5UG2fczh2eLqHUHHjq0Ob1WRXHPs+hpbOjzgQ=;
        b=EmV/uCAwCIIphvc1X45AO4OhM8M2p4uETE4W0CnXIQ/tyvmMeSuHM8QKVaR98wDLgI
         Yt0CWIgbMTYogdn0a0wfyLIQKCBaezLdx5vaWyLtop5Vp4LLGNT0b5que9TpjLzKcjLb
         TuquB1EZrBwRRsqNPAFeeVTLeudJZMN4Nk98XxdWzNrB7hEcb7zsMSAQwEqjs0s7LwcS
         a+1wBIjltbgodiYdg4CSG8ROTKDZXjp1OdbS/MZw4viUtk7f8Kc7L4rsk9Tp5OUfm4i6
         f9PbNuN2epTvo4SYOXi7jC+6a3DAEyDB1PK2XgbJ1XEDZ0QbbeGXVAg/ym539dG2XUGC
         RyTg==
X-Gm-Message-State: AFq9FYL/kL4ZQwS5w8CoZ2LzAaNnUni0kwo0Bx0ip0SqW/pUp4xzi9iz
	4ELQeEUO+eQDyQrm2uqlV+4C3Pf9qLl2MiIfa6JKcHd2q2aUi4QEHkeE30GVNtppFktT7LvlKti
	WyySBoWY=
X-Gm-Gg: AYBFou2MpgKC9KHuN7aY8C++zKYkrNxO7Gk28St9X0HkaSaYSPmUqWJjxfybPPX1kJd
	YsVZimvmJVvDyho+TgZQL941X57x+W/FoqrrmJGCgugYmaWYRFjs6Ct9ryBFvgWFScfDF/NTfiO
	I9EnNOaIOR10QyIwwdHZIwaaegqjmrpLGt8CFNGv0eVrHw5F78p6pZKxudSYY74XOJVC3r7mJDT
	R8Uoep5vFc+V4o2lMl+nFWiN5lwja6rBrW1OdWfT6yZ6KFrpi0NGlYwwb7v4id/TAiTjvpwECse
	wh177teC47QY1fKGa9XTKH62nGCwqLtEbfBCvWgp6BDmhgINSmEiCnN6X8XmoeBXfP82stf016v
	uj3BshhAurpueWtc3Jo5IknoRLHVC4hfLJxS5K9pjvaeVU6a7cH+1s2DJ2r4yHdE/yidpmTMTro
	owuD7IBg+pvx61pJ7Ri8gKXs9fT19fzbPQG7G5dVmwBnfKBBJ3Xiv+kRSGK9Z++6IQGdWKwzK3x
	U9ZDnWkKfoyH19atYuBaN4MS26Nq0+1VMWQ0ejmqZWyqR7uQ6Q1W3Ti4G65MKZ1ko3Est0bxQ==
X-Received: by 2002:a05:600c:6990:b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a18e4d8bbamr313734115e9.27.1792040654844;
        Wed, 14 Oct 2026 22:04:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 52/55] libpcap: Fix CVE-2026-18238
Date: Thu, 15 Oct 2026 07:03:15 +0200
Message-ID: <940dee79d02890b06b91bb394ba51b933e3a1dbb.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247850

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18238
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/b9590d482986d64673712460aae1d48d11fa0473

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 ++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch b/meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
new file mode 100644
index 00000000000..36f80c483f6
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/b9590d482986d64673712460aae1d48d11fa0473]
+CVE: CVE-2026-18238
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 22fc7363..30fbd6d6 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -388,10 +388,9 @@ rpcap_deseraddr(struct rpcap_sockaddr *sockaddrin, struct sockaddr_storage **soc
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
+@@ -448,13 +447,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
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
+@@ -470,6 +491,8 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 			/* Interrupted receive. */
+ 			return 0;
+ 		}
++
++		// Require a complete rpcap general header to be present.
+ 		if ((size_t)msglen < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -479,8 +502,18 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
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
+@@ -495,6 +528,7 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
+ 	{
+ 		int status;
+ 
++		// Receive a complete rpcap general header from the network.
+ 		if ((size_t)p->cc < sizeof(struct rpcap_header))
+ 		{
+ 			/*
+@@ -514,27 +548,35 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
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
+@@ -557,27 +599,36 @@ static int pcap_read_nocb_remote(pcap_t *p, struct pcap_pkthdr *pkt_header, u_ch
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 5f1506f8fc9..3892454a400 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://04-CVE-2026-6244.patch \
            file://05-CVE-2026-6554.patch \
            file://06-CVE-2026-18313.patch \
+           file://07-CVE-2026-18238.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

