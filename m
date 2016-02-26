Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 85CC677290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 22:38:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 26 Feb 2016 14:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,505,1449561600"; d="scan'208";a="924791957"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2016 14:38:40 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 14:34:17 +0000
Message-Id: <64382dbfc824db93729e324f33f2a2519b9a15c6.1456497209.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456497209.git.mariano.lopez@linux.intel.com>
References: <cover.1456497209.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] dhcp: CVE-2015-8605
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
X-List-Received-Date: Fri, 26 Feb 2016 22:38:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

ISC DHCP allows remote attackers to cause a denial of
service (application crash) via an invalid length field
in a UDP IPv4 packet.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../dhcp/dhcp/CVE-2015-8605.patch                  | 99 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
new file mode 100644
index 0000000..923d5d5
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
@@ -0,0 +1,99 @@
+Solves CVE-2015-8605 that caused DoS when an invalid lenght field in IPv4 UDP
+was recived by the server.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8605
+
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+
+=======================================================================
+diff --git a/common/packet.c b/common/packet.c
+index b530432..e600e37 100644
+--- a/common/packet.c
++++ b/common/packet.c
+@@ -220,7 +220,28 @@ ssize_t decode_hw_header (interface, buf, bufix, from)
+ 	}
+ }
+ 
+-/* UDP header and IP header decoded together for convenience. */
++/*!
++ *
++ * \brief UDP header and IP header decoded together for convenience.
++ *
++ * Attempt to decode the UDP and IP headers and, if necessary, checksum
++ * the packet.
++ *
++ * \param inteface - the interface on which the packet was recevied
++ * \param buf - a pointer to the buffer for the received packet
++ * \param bufix - where to start processing the buffer, previous
++ *                routines may have processed parts of the buffer already
++ * \param from - space to return the address of the packet sender
++ * \param buflen - remaining length of the buffer, this will have been
++ *                 decremented by bufix by the caller
++ * \param rbuflen - space to return the length of the payload from the udp
++ *                  header
++ * \param csum_ready - indication if the checksum is valid for use
++ *                     non-zero indicates the checksum should be validated
++ *
++ * \return - the index to the first byte of the udp payload (that is the
++ *           start of the DHCP packet
++ */
+ 
+ ssize_t
+ decode_udp_ip_header(struct interface_info *interface,
+@@ -231,7 +252,7 @@ decode_udp_ip_header(struct interface_info *interface,
+   unsigned char *data;
+   struct ip ip;
+   struct udphdr udp;
+-  unsigned char *upp, *endbuf;
++  unsigned char *upp;
+   u_int32_t ip_len, ulen, pkt_len;
+   static unsigned int ip_packets_seen = 0;
+   static unsigned int ip_packets_bad_checksum = 0;
+@@ -241,11 +262,8 @@ decode_udp_ip_header(struct interface_info *interface,
+   static unsigned int udp_packets_length_overflow = 0;
+   unsigned len;
+ 
+-  /* Designate the end of the input buffer for bounds checks. */
+-  endbuf = buf + bufix + buflen;
+-
+   /* Assure there is at least an IP header there. */
+-  if ((buf + bufix + sizeof(ip)) > endbuf)
++  if (sizeof(ip) > buflen)
+ 	  return -1;
+ 
+   /* Copy the IP header into a stack aligned structure for inspection.
+@@ -257,13 +275,17 @@ decode_udp_ip_header(struct interface_info *interface,
+   ip_len = (*upp & 0x0f) << 2;
+   upp += ip_len;
+ 
+-  /* Check the IP packet length. */
++  /* Check packet lengths are within the buffer:
++   * first the ip header (ip_len)
++   * then the packet length from the ip header (pkt_len)
++   * then the udp header (ip_len + sizeof(udp)
++   * We are liberal in what we accept, the udp payload should fit within
++   * pkt_len, but we only check against the full buffer size.
++   */
+   pkt_len = ntohs(ip.ip_len);
+-  if (pkt_len > buflen)
+-	return -1;
+-
+-  /* Assure after ip_len bytes that there is enough room for a UDP header. */
+-  if ((upp + sizeof(udp)) > endbuf)
++  if ((ip_len > buflen) ||
++      (pkt_len > buflen) ||
++      ((ip_len + sizeof(udp)) > buflen))
+ 	  return -1;
+ 
+   /* Copy the UDP header into a stack aligned structure for inspection. */
+@@ -284,7 +306,8 @@ decode_udp_ip_header(struct interface_info *interface,
+ 	return -1;
+ 
+   udp_packets_length_checked++;
+-  if ((upp + ulen) > endbuf) {
++  /* verify that the payload length from the udp packet fits in the buffer */
++  if ((ip_len + ulen) > buflen) {
+ 	udp_packets_length_overflow++;
+ 	if (((udp_packets_length_checked > 4) &&
+ 	     (udp_packets_length_overflow != 0)) &&
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
index 6fcdddc..ee1e082 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
+            file://CVE-2015-8605.patch \
            "
 
 SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
-- 
2.6.2


