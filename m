Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.1076.1617290892633368929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I0olw3/J;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id i81so2148275oif.6
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eUqIp9PcQed2E6AQWSyo2rbU3zMgIQJQON9tVU67O2g=;
        b=I0olw3/J2ecb8X9622dIhrPVp+xgpE29nKl+wVTWE5IbnLp3ARxZodUMML3Tc8/16p
         u/dXYx4pQfSiGJGnhTOxy2GeEsCrZvqbB6hJU/1OdHMvJ1kEggyTDtweS6cwaMXqdUt1
         eVrpqK3HY2LjcYJssF3ehSRMJZ5vRD5RUFgXpFl7nAc4CuNMkbCmaia0feKxPE1SfzdG
         5q3gGyREGXpX6BYLyXogiDgferRRJt4tgRL79fowZcIUdGNifAl4B1gtyig7QAY9Z8eA
         ED9Ox9dkwgPyA7oq72+K/OfGv0n6y2B3/+j0jCDxyMXditQU0WMOLBAuRyRj2vwv2mwS
         8qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUqIp9PcQed2E6AQWSyo2rbU3zMgIQJQON9tVU67O2g=;
        b=YZsjvPmJGKpXdkDf2LD6/H6KNcUidA/WY1gne93FdfyKlS9OCzjNQxz72RvHLMrSI3
         +ASBUjz3WKSh4FvKvZ5dDJVSQrJs4NrPS5QVD5KnNJh93b6YOGU7hCM2RU3JbEWvhudW
         QdPVT7N0cg1wO53fYA1LgG9CylBQAMrj9fHttBDaH8bkG1jp11/UUwgqJ/ifEkhxcWwu
         d/wkJYnNsdhWcWi4tamKVEE4Y5qqQfjiPeLGAVJNyHK59r7ep8ZSZcNvKNjtU2AArbjo
         dssLBXfEi496ZWCwZTYRjv2C/PEQmRiuVUILr1praGFiKWYuoRaBuShe2mPCUMXdGWRt
         bxOA==
X-Gm-Message-State: AOAM532Z330WlDNg/IrdqS4QJ018QPpMwDmYWkWMmfAe9SDLuZZaT11k
	F5yaT430Tf8C1UIgwyOrH+/ltvuMq4sGzt2hOH4=
X-Google-Smtp-Source: ABdhPJwBkp6ZZ/MAG/JQ9fLtloAM4qJk1DNndl8ZfpK+DLz6td0fpgZ/r/BfjYbdmSwj/JKXfX9S1w==
X-Received: by 2002:aca:b645:: with SMTP id g66mr6212727oif.64.1617290891334;
        Thu, 01 Apr 2021 08:28:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/15] connman: fix CVE-2021-26675, CVE-2021-26676
Date: Thu,  1 Apr 2021 05:27:30 -1000
Message-Id: <3c78000aaf8e4ee8ffb7674f5c286e2c110f167b.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Catalin Enache <catalin.enache@windriver.com>

A stack-based buffer overflow in dnsproxy in ConnMan before 1.39
could be used by network adjacent attackers to execute code.

gdhcp in ConnMan before 1.39 could be used by network-adjacent.
attackers to leak sensitive stack information, allowing further
exploitation of bugs in gdhcp.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-26675
https://nvd.nist.gov/vuln/detail/CVE-2021-26676

Upstream patches:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e4079a20f617a4b076af503f6e4e8b0304c9f2cb
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=58d397ba74873384aee449690a9070bacd5676fa
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a74524b3e3fad81b0fd1084ffdf9f2ea469cd9b1

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2021-26675.patch      |  62 +++++
 .../connman/connman/CVE-2021-26676-0001.patch | 231 ++++++++++++++++++
 .../connman/connman/CVE-2021-26676-0002.patch |  33 +++
 .../connman/connman_1.37.bb                   |   3 +
 4 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26675.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26676-0001.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26676-0002.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2021-26675.patch b/meta/recipes-connectivity/connman/connman/CVE-2021-26675.patch
new file mode 100644
index 0000000000..2648a832ca
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2021-26675.patch
@@ -0,0 +1,62 @@
+From e4079a20f617a4b076af503f6e4e8b0304c9f2cb Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:41:53 +0100
+Subject: [PATCH] dnsproxy: Add length checks to prevent buffer overflow
+
+Fixes: CVE-2021-26675
+
+Upstream-Status: Backport
+CVE: CVE-2021-26675
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e4079a20f617a4b076af503f6e4e8b0304c9f2cb
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/dnsproxy.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index a7bf87a1..4f5c897f 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1767,6 +1767,7 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+			char **uncompressed_ptr)
+ {
+	char *uptr = *uncompressed_ptr; /* position in result buffer */
++	char * const uncomp_end = uncompressed + uncomp_len - 1;
+
+	debug("count %d ptr %p end %p uptr %p", field_count, ptr, end, uptr);
+
+@@ -1787,12 +1788,15 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+		 * tmp buffer.
+		 */
+
+-		ulen = strlen(name);
+-		strncpy(uptr, name, uncomp_len - (uptr - uncompressed));
+-
+		debug("pos %d ulen %d left %d name %s", pos, ulen,
+			(int)(uncomp_len - (uptr - uncompressed)), uptr);
+
++		ulen = strlen(name);
++		if ((uptr + ulen + 1) > uncomp_end) {
++			goto out;
++		}
++		strncpy(uptr, name, uncomp_len - (uptr - uncompressed));
++
+		uptr += ulen;
+		*uptr++ = '\0';
+
+@@ -1802,6 +1806,10 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+		 * We copy also the fixed portion of the result (type, class,
+		 * ttl, address length and the address)
+		 */
++		if ((uptr + NS_RRFIXEDSZ) > uncomp_end) {
++			debug("uncompressed data too large for buffer");
++			goto out;
++		}
+		memcpy(uptr, ptr, NS_RRFIXEDSZ);
+
+		dns_type = uptr[0] << 8 | uptr[1];
+--
+2.17.1
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0001.patch b/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0001.patch
new file mode 100644
index 0000000000..4104e4bfc6
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0001.patch
@@ -0,0 +1,231 @@
+From 58d397ba74873384aee449690a9070bacd5676fa Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:39:14 +0100
+Subject: [PATCH] gdhcp: Avoid reading invalid data in dhcp_get_option
+
+Upstream-Status: Backport
+CVE: CVE-2021-26676
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=58d397ba74873384aee449690a9070bacd5676fa
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ gdhcp/client.c | 20 +++++++++++---------
+ gdhcp/common.c | 24 +++++++++++++++++++-----
+ gdhcp/common.h |  2 +-
+ gdhcp/server.c | 12 +++++++-----
+ 4 files changed, 38 insertions(+), 20 deletions(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 09dfe5ec..6a5613e7 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -1629,12 +1629,12 @@ static void start_request(GDHCPClient *dhcp_client)
+							NULL);
+ }
+
+-static uint32_t get_lease(struct dhcp_packet *packet)
++static uint32_t get_lease(struct dhcp_packet *packet, uint16_t packet_len)
+ {
+	uint8_t *option;
+	uint32_t lease_seconds;
+
+-	option = dhcp_get_option(packet, DHCP_LEASE_TIME);
++	option = dhcp_get_option(packet, packet_len, DHCP_LEASE_TIME);
+	if (!option)
+		return 3600;
+
+@@ -2226,7 +2226,8 @@ static void get_dhcpv6_request(GDHCPClient *dhcp_client,
+	}
+ }
+
+-static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet)
++static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet,
++		uint16_t packet_len)
+ {
+	GDHCPOptionType type;
+	GList *list, *value_list;
+@@ -2237,7 +2238,7 @@ static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet)
+	for (list = dhcp_client->request_list; list; list = list->next) {
+		code = (uint8_t) GPOINTER_TO_INT(list->data);
+
+-		option = dhcp_get_option(packet, code);
++		option = dhcp_get_option(packet, packet_len, code);
+		if (!option) {
+			g_hash_table_remove(dhcp_client->code_value_hash,
+						GINT_TO_POINTER((int) code));
+@@ -2297,6 +2298,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+		re = dhcp_recv_l2_packet(&packet,
+					dhcp_client->listener_sockfd,
+					&dst_addr);
++		pkt_len = (uint16_t)(unsigned int)re;
+		xid = packet.xid;
+	} else if (dhcp_client->listen_mode == L3) {
+		if (dhcp_client->type == G_DHCP_IPV6) {
+@@ -2361,7 +2363,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+			dhcp_client->status_code = status;
+		}
+	} else {
+-		message_type = dhcp_get_option(&packet, DHCP_MESSAGE_TYPE);
++		message_type = dhcp_get_option(&packet, pkt_len, DHCP_MESSAGE_TYPE);
+		if (!message_type)
+			return TRUE;
+	}
+@@ -2378,7 +2380,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+		dhcp_client->timeout = 0;
+		dhcp_client->retry_times = 0;
+
+-		option = dhcp_get_option(&packet, DHCP_SERVER_ID);
++		option = dhcp_get_option(&packet, pkt_len, DHCP_SERVER_ID);
+		dhcp_client->server_ip = get_be32(option);
+		dhcp_client->requested_ip = ntohl(packet.yiaddr);
+
+@@ -2428,9 +2430,9 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+
+			remove_timeouts(dhcp_client);
+
+-			dhcp_client->lease_seconds = get_lease(&packet);
++			dhcp_client->lease_seconds = get_lease(&packet, pkt_len);
+
+-			get_request(dhcp_client, &packet);
++			get_request(dhcp_client, &packet, pkt_len);
+
+			switch_listening_mode(dhcp_client, L_NONE);
+
+@@ -2438,7 +2440,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+			dhcp_client->assigned_ip = get_ip(packet.yiaddr);
+
+			if (dhcp_client->state == REBOOTING) {
+-				option = dhcp_get_option(&packet,
++				option = dhcp_get_option(&packet, pkt_len,
+							DHCP_SERVER_ID);
+				dhcp_client->server_ip = get_be32(option);
+			}
+diff --git a/gdhcp/common.c b/gdhcp/common.c
+index 1d667d17..c8916aa8 100644
+--- a/gdhcp/common.c
++++ b/gdhcp/common.c
+@@ -73,18 +73,21 @@ GDHCPOptionType dhcp_get_code_type(uint8_t code)
+	return OPTION_UNKNOWN;
+ }
+
+-uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code)
++uint8_t *dhcp_get_option(struct dhcp_packet *packet, uint16_t packet_len, int code)
+ {
+	int len, rem;
+-	uint8_t *optionptr;
++	uint8_t *optionptr, *options_end;
++	size_t options_len;
+	uint8_t overload = 0;
+
+	/* option bytes: [code][len][data1][data2]..[dataLEN] */
+	optionptr = packet->options;
+	rem = sizeof(packet->options);
++	options_len = packet_len - (sizeof(*packet) - sizeof(packet->options));
++	options_end = optionptr + options_len - 1;
+
+	while (1) {
+-		if (rem <= 0)
++		if ((rem <= 0) && (optionptr + OPT_CODE > options_end))
+			/* Bad packet, malformed option field */
+			return NULL;
+
+@@ -115,14 +118,25 @@ uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code)
+			break;
+		}
+
++		if (optionptr + OPT_LEN > options_end) {
++			/* bad packet, would read length field from OOB */
++			return NULL;
++		}
++
+		len = 2 + optionptr[OPT_LEN];
+
+		rem -= len;
+		if (rem < 0)
+			continue; /* complain and return NULL */
+
+-		if (optionptr[OPT_CODE] == code)
+-			return optionptr + OPT_DATA;
++		if (optionptr[OPT_CODE] == code) {
++			if (optionptr + len > options_end) {
++				/* bad packet, option length points OOB */
++				return NULL;
++			} else {
++				return optionptr + OPT_DATA;
++			}
++		}
+
+		if (optionptr[OPT_CODE] == DHCP_OPTION_OVERLOAD)
+			overload |= optionptr[OPT_DATA];
+diff --git a/gdhcp/common.h b/gdhcp/common.h
+index 9660231c..8f63fd75 100644
+--- a/gdhcp/common.h
++++ b/gdhcp/common.h
+@@ -179,7 +179,7 @@ struct in6_pktinfo {
+ };
+ #endif
+
+-uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code);
++uint8_t *dhcp_get_option(struct dhcp_packet *packet, uint16_t packet_len, int code);
+ uint8_t *dhcpv6_get_option(struct dhcpv6_packet *packet, uint16_t pkt_len,
+			int code, uint16_t *option_len, int *option_count);
+ uint8_t *dhcpv6_get_sub_option(unsigned char *option, uint16_t max_len,
+diff --git a/gdhcp/server.c b/gdhcp/server.c
+index 85405f19..52ea2a55 100644
+--- a/gdhcp/server.c
++++ b/gdhcp/server.c
+@@ -413,7 +413,7 @@ error:
+ }
+
+
+-static uint8_t check_packet_type(struct dhcp_packet *packet)
++static uint8_t check_packet_type(struct dhcp_packet *packet, uint16_t packet_len)
+ {
+	uint8_t *type;
+
+@@ -423,7 +423,7 @@ static uint8_t check_packet_type(struct dhcp_packet *packet)
+	if (packet->op != BOOTREQUEST)
+		return 0;
+
+-	type = dhcp_get_option(packet, DHCP_MESSAGE_TYPE);
++	type = dhcp_get_option(packet, packet_len, DHCP_MESSAGE_TYPE);
+
+	if (!type)
+		return 0;
+@@ -651,6 +651,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+	struct dhcp_lease *lease;
+	uint32_t requested_nip = 0;
+	uint8_t type, *server_id_option, *request_ip_option;
++	uint16_t packet_len;
+	int re;
+
+	if (condition & (G_IO_NVAL | G_IO_ERR | G_IO_HUP)) {
+@@ -661,12 +662,13 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+	re = dhcp_recv_l3_packet(&packet, dhcp_server->listener_sockfd);
+	if (re < 0)
+		return TRUE;
++	packet_len = (uint16_t)(unsigned int)re;
+
+-	type = check_packet_type(&packet);
++	type = check_packet_type(&packet, packet_len);
+	if (type == 0)
+		return TRUE;
+
+-	server_id_option = dhcp_get_option(&packet, DHCP_SERVER_ID);
++	server_id_option = dhcp_get_option(&packet, packet_len, DHCP_SERVER_ID);
+	if (server_id_option) {
+		uint32_t server_nid =
+			get_unaligned((const uint32_t *) server_id_option);
+@@ -675,7 +677,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+			return TRUE;
+	}
+
+-	request_ip_option = dhcp_get_option(&packet, DHCP_REQUESTED_IP);
++	request_ip_option = dhcp_get_option(&packet, packet_len, DHCP_REQUESTED_IP);
+	if (request_ip_option)
+		requested_nip = get_be32(request_ip_option);
+
+--
+2.17.1
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0002.patch b/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0002.patch
new file mode 100644
index 0000000000..ce909ec293
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2021-26676-0002.patch
@@ -0,0 +1,33 @@
+From a74524b3e3fad81b0fd1084ffdf9f2ea469cd9b1 Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:41:09 +0100
+Subject: [PATCH] gdhcp: Avoid leaking stack data via unitiialized variable
+
+Fixes: CVE-2021-26676
+
+Upstream-Status: Backport
+CVE: CVE-2021-26676
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a74524b3e3fad81b0fd1084ffdf9f2ea469cd9b1
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ gdhcp/client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 6a5613e7..c7b85e58 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -2270,7 +2270,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ {
+	GDHCPClient *dhcp_client = user_data;
+	struct sockaddr_in dst_addr = { 0 };
+-	struct dhcp_packet packet;
++	struct dhcp_packet packet = { 0 };
+	struct dhcpv6_packet *packet6 = NULL;
+	uint8_t *message_type = NULL, *client_id = NULL, *option,
+		*server_id = NULL;
+--
+2.17.1
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 00852bf0d6..bdab4c4f18 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -6,6 +6,9 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-gweb-fix-segfault-with-musl-v1.1.21.patch \
             file://connman \
             file://no-version-scripts.patch \
+            file://CVE-2021-26675.patch \
+            file://CVE-2021-26676-0001.patch \
+            file://CVE-2021-26676-0002.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1

