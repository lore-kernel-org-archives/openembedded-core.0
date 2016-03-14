Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA488605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:34:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 14 Mar 2016 07:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,335,1455004800"; d="scan'208";a="933444850"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.3.41])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2016 07:34:33 -0700
Message-ID: <1457966072.3209.5.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 14:34:32 +0000
In-Reply-To: <1457686029-40654-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1457686029-40654-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH v2][fido] dhcp: CVE-2015-8605
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Mar 2016 14:34:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-03-11 at 08:47 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> ISC DHCP allows remote attackers to cause a denial of
> service (application crash) via an invalid length field
> in a UDP IPv4 packet.

Thanks Mariano,

I've queued this in my fido-next branch.

Regards,

Joshua

> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  .../dhcp/dhcp/CVE-2015-8605.patch                  | 101
> ++++++++++++++++
>  .../dhcp/dhcp/CVE-2015-8605_1.patch                | 131
> +++++++++++++++++++++
>  meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb       |   2 +
>  3 files changed, 234 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605.patch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605_1.patch
> 
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> new file mode 100644
> index 0000000..05f1fa9
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> @@ -0,0 +1,101 @@
> +Solves CVE-2015-8605 that caused DoS when an invalid length field in
> IPv4 UDP
> +was received by the server.
> +
> +Upstream-Status: Backport (v4.3.3p1)
> +CVE: CVE-2015-8605
> +
> +From: https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commit;
> h=4ce21cb6301d665de01c1a6209e40f5f35072c0c
> +
> +Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> +
> +====================================================================
> ===
> +diff --git a/common/packet.c b/common/packet.c
> +index b530432..e600e37 100644
> +--- a/common/packet.c
> ++++ b/common/packet.c
> +@@ -220,7 +220,28 @@ ssize_t decode_hw_header (interface, buf,
> bufix, from)
> + 	}
> + }
> + 
> +-/* UDP header and IP header decoded together for convenience. */
> ++/*!
> ++ *
> ++ * \brief UDP header and IP header decoded together for
> convenience.
> ++ *
> ++ * Attempt to decode the UDP and IP headers and, if necessary,
> checksum
> ++ * the packet.
> ++ *
> ++ * \param inteface - the interface on which the packet was recevied
> ++ * \param buf - a pointer to the buffer for the received packet
> ++ * \param bufix - where to start processing the buffer, previous
> ++ *                routines may have processed parts of the buffer
> already
> ++ * \param from - space to return the address of the packet sender
> ++ * \param buflen - remaining length of the buffer, this will have
> been
> ++ *                 decremented by bufix by the caller
> ++ * \param rbuflen - space to return the length of the payload from
> the udp
> ++ *                  header
> ++ * \param csum_ready - indication if the checksum is valid for use
> ++ *                     non-zero indicates the checksum should be
> validated
> ++ *
> ++ * \return - the index to the first byte of the udp payload (that
> is the
> ++ *           start of the DHCP packet
> ++ */
> + 
> + ssize_t
> + decode_udp_ip_header(struct interface_info *interface,
> +@@ -231,7 +252,7 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   unsigned char *data;
> +   struct ip ip;
> +   struct udphdr udp;
> +-  unsigned char *upp, *endbuf;
> ++  unsigned char *upp;
> +   u_int32_t ip_len, ulen, pkt_len;
> +   static unsigned int ip_packets_seen = 0;
> +   static unsigned int ip_packets_bad_checksum = 0;
> +@@ -241,11 +262,8 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   static unsigned int udp_packets_length_overflow = 0;
> +   unsigned len;
> + 
> +-  /* Designate the end of the input buffer for bounds checks. */
> +-  endbuf = buf + bufix + buflen;
> +-
> +   /* Assure there is at least an IP header there. */
> +-  if ((buf + bufix + sizeof(ip)) > endbuf)
> ++  if (sizeof(ip) > buflen)
> + 	  return -1;
> + 
> +   /* Copy the IP header into a stack aligned structure for
> inspection.
> +@@ -257,13 +275,17 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   ip_len = (*upp & 0x0f) << 2;
> +   upp += ip_len;
> + 
> +-  /* Check the IP packet length. */
> ++  /* Check packet lengths are within the buffer:
> ++   * first the ip header (ip_len)
> ++   * then the packet length from the ip header (pkt_len)
> ++   * then the udp header (ip_len + sizeof(udp)
> ++   * We are liberal in what we accept, the udp payload should fit
> within
> ++   * pkt_len, but we only check against the full buffer size.
> ++   */
> +   pkt_len = ntohs(ip.ip_len);
> +-  if (pkt_len > buflen)
> +-	return -1;
> +-
> +-  /* Assure after ip_len bytes that there is enough room for a UDP
> header. */
> +-  if ((upp + sizeof(udp)) > endbuf)
> ++  if ((ip_len > buflen) ||
> ++      (pkt_len > buflen) ||
> ++      ((ip_len + sizeof(udp)) > buflen))
> + 	  return -1;
> + 
> +   /* Copy the UDP header into a stack aligned structure for
> inspection. */
> +@@ -284,7 +306,8 @@ decode_udp_ip_header(struct interface_info
> *interface,
> + 	return -1;
> + 
> +   udp_packets_length_checked++;
> +-  if ((upp + ulen) > endbuf) {
> ++  /* verify that the payload length from the udp packet fits in the
> buffer */
> ++  if ((ip_len + ulen) > buflen) {
> + 	udp_packets_length_overflow++;
> + 	if (((udp_packets_length_checked > 4) &&
> + 	     (udp_packets_length_overflow != 0)) &&
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605_1.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605_1.patch
> new file mode 100644
> index 0000000..aa93c5e
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605_1.patch
> @@ -0,0 +1,131 @@
> +This patch is needed in order to apply the patch for CVE-2015-8605.
> +
> +Upstream-Status: Backport (4.3.2+)
> +
> +From: https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commit;
> h=0ce1aa94454ce9b50d592c08d7e0c559d38d3bc5
> +
> +Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> +---
> +From 0ce1aa94454ce9b50d592c08d7e0c559d38d3bc5 Mon Sep 17 00:00:00
> 2001
> +From: Thomas Markwalder <tmark@isc.org>
> +Date: Mon, 8 Sep 2014 09:31:32 -0400
> +Subject: [PATCH] [master] Corrected error in UDP bad packet logging
> +
> +    Merges in rt36897
> +---
> + common/packet.c | 55 +++++++++++++++++++++++++++++++++++-----------
> ---------
> + 1 file changed, 35 insertions(+), 20 deletions(-)
> +
> +diff --git a/common/packet.c b/common/packet.c
> +index 45e96e8..7460f3d 100644
> +--- a/common/packet.c
> ++++ b/common/packet.c
> +@@ -3,7 +3,7 @@
> +    Packet assembly code, originally contributed by Archie Cobbs. */
> + 
> + /*
> +- * Copyright (c) 2009,2012 by Internet Systems Consortium, Inc.
> ("ISC")
> ++ * Copyright (c) 2009,2012,2014 by Internet Systems Consortium,
> Inc. ("ISC")
> +  * Copyright (c) 2004,2005,2007 by Internet Systems Consortium,
> Inc. ("ISC")
> +  * Copyright (c) 1996-2003 by Internet Software Consortium
> +  *
> +@@ -234,12 +234,12 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   unsigned char *upp, *endbuf;
> +   u_int32_t ip_len, ulen, pkt_len;
> +   u_int32_t sum, usum;
> +-  static int ip_packets_seen;
> +-  static int ip_packets_bad_checksum;
> +-  static int udp_packets_seen;
> +-  static int udp_packets_bad_checksum;
> +-  static int udp_packets_length_checked;
> +-  static int udp_packets_length_overflow;
> ++  static unsigned int ip_packets_seen = 0;
> ++  static unsigned int ip_packets_bad_checksum = 0;
> ++  static unsigned int udp_packets_seen = 0;
> ++  static unsigned int udp_packets_bad_checksum = 0;
> ++  static unsigned int udp_packets_length_checked = 0;
> ++  static unsigned int udp_packets_length_overflow = 0;
> +   unsigned len;
> + 
> +   /* Designate the end of the input buffer for bounds checks. */
> +@@ -287,10 +287,10 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   udp_packets_length_checked++;
> +   if ((upp + ulen) > endbuf) {
> + 	udp_packets_length_overflow++;
> +-	if ((udp_packets_length_checked > 4) &&
> +-	    ((udp_packets_length_checked /
> +-	      udp_packets_length_overflow) < 2)) {
> +-		log_info("%d udp packets in %d too long - dropped",
> ++	if (((udp_packets_length_checked > 4) &&
> ++	     (udp_packets_length_overflow != 0)) &&
> ++	    ((udp_packets_length_checked /
> udp_packets_length_overflow) < 2)) {
> ++		log_info("%u udp packets in %u too long - dropped",
> + 			 udp_packets_length_overflow,
> + 			 udp_packets_length_checked);
> + 		udp_packets_length_overflow = 0;
> +@@ -299,22 +299,31 @@ decode_udp_ip_header(struct interface_info
> *interface,
> + 	return -1;
> +   }
> + 
> +-  if ((ulen < sizeof(udp)) || ((upp + ulen) > endbuf))
> +-	return -1;
> ++  /* If at least 5 with less than 50% bad, start over */
> ++  if (udp_packets_length_checked > 4) {
> ++	udp_packets_length_overflow = 0;
> ++	udp_packets_length_checked = 0;
> ++  }
> + 
> +   /* Check the IP header checksum - it should be zero. */
> +-  ++ip_packets_seen;
> ++  ip_packets_seen++;
> +   if (wrapsum (checksum (buf + bufix, ip_len, 0))) {
> + 	  ++ip_packets_bad_checksum;
> +-	  if (ip_packets_seen > 4 &&
> +-	      (ip_packets_seen / ip_packets_bad_checksum) < 2) {
> +-		  log_info ("%d bad IP checksums seen in %d
> packets",
> ++	  if (((ip_packets_seen > 4) && (ip_packets_bad_checksum !=
> 0)) &&
> ++	      ((ip_packets_seen / ip_packets_bad_checksum) < 2)) {
> ++		  log_info ("%u bad IP checksums seen in %u
> packets",
> + 			    ip_packets_bad_checksum,
> ip_packets_seen);
> + 		  ip_packets_seen = ip_packets_bad_checksum = 0;
> + 	  }
> + 	  return -1;
> +   }
> + 
> ++  /* If at least 5 with less than 50% bad, start over */
> ++  if (ip_packets_seen > 4) {
> ++	ip_packets_bad_checksum = 0;
> ++	ip_packets_seen = 0;
> ++  }
> ++
> +   /* Copy out the IP source address... */
> +   memcpy(&from->sin_addr, &ip.ip_src, 4);
> + 
> +@@ -339,15 +348,21 @@ decode_udp_ip_header(struct interface_info
> *interface,
> +   udp_packets_seen++;
> +   if (usum && usum != sum) {
> + 	  udp_packets_bad_checksum++;
> +-	  if (udp_packets_seen > 4 &&
> +-	      (udp_packets_seen / udp_packets_bad_checksum) < 2) {
> +-		  log_info ("%d bad udp checksums in %d packets",
> ++	  if (((udp_packets_seen > 4) && (udp_packets_bad_checksum
> != 0)) &&
> ++	      ((udp_packets_seen / udp_packets_bad_checksum) < 2))
> {
> ++		  log_info ("%u bad udp checksums in %u packets",
> + 			    udp_packets_bad_checksum,
> udp_packets_seen);
> + 		  udp_packets_seen = udp_packets_bad_checksum = 0;
> + 	  }
> + 	  return -1;
> +   }
> + 
> ++  /* If at least 5 with less than 50% bad, start over */
> ++  if (udp_packets_seen > 4) {
> ++	udp_packets_bad_checksum = 0;
> ++	udp_packets_seen = 0;
> ++  }
> ++
> +   /* Copy out the port... */
> +   memcpy (&from -> sin_port, &udp.uh_sport, sizeof udp.uh_sport);
> + 
> +-- 
> +2.6.2
> +
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
> b/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
> index d4414cc..4616693 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
> @@ -6,7 +6,9 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;str
> iplevel=0 \
>              file://fixsepbuild.patch \
>              file://dhclient-script-drop-resolv.conf.dhclient.patch \
>              file://replace-ifconfig-route.patch \
> +            file://CVE-2015-8605_1.patch \
>              file://dhcp-xen-checksum.patch \
> +            file://CVE-2015-8605.patch \
>             "
>  
>  SRC_URI[md5sum] = "b3a42ece3c7f2cd2e74a3e12ca881d20"

