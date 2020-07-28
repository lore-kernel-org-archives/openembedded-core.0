Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WPqe6BqpTg79B7tWsFLsLG9YeilHpiZqjCpuiraQ0nDFZ8Z0h9qj7rIAblIUC5iMY0AqU0Id0T
 JGB6fGzF+QYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699741"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:09 -0700
IronPort-SDR: iF/695kuYXrUWJ+dKaOuGO4nPrP5rB5z/CTItFIAvJCv9OTkVw4qP4sdjrh+59TQaQHfrvxzc6
 UcHSg71TZIQw==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245877"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 18/32] wpa-supplicant: Security fix CVE-2020-12695
Date: Tue, 28 Jul 2020 16:51:19 +0800
Message-Id: <a341c128a5166c505ee1ec207abb87e5fa64d62e.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: http://w1.fi/security/
Disposition: Backport from http://w1.fi/security/2020-1/

Affects <= 2.9 wpa-supplicant

(From OE-Core rev: 720d29cbfce34375402c6a4c17e440ffbb2659bf)

Signed-off-by: Armin Kuster <akuster@mvista.com>
(cherry picked from commit e9c696397ae1b4344b8329a13076f265980ee74d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...allow-event-subscriptions-with-URLs-.patch | 151 ++++++++++++++++++
 ...nt-message-generation-using-a-long-U.patch |  62 +++++++
 ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
 4 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
new file mode 100644
index 0000000000..53ad5d028a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
@@ -0,0 +1,151 @@
+From 5b78c8f961f25f4dc22d6f2b77ddd06d712cec63 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Wed, 3 Jun 2020 23:17:35 +0300
+Subject: [PATCH 1/3] WPS UPnP: Do not allow event subscriptions with URLs to
+ other networks
+
+The UPnP Device Architecture 2.0 specification errata ("UDA errata
+16-04-2020.docx") addresses a problem with notifications being allowed
+to go out to other domains by disallowing such cases. Do such filtering
+for the notification callback URLs to avoid undesired connections to
+external networks based on subscriptions that any device in the local
+network could request when WPS support for external registrars is
+enabled (the upnp_iface parameter in hostapd configuration).
+
+Upstream-Status: Backport
+CVE: CVE-2020-12695 patch #1
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/wps/wps_er.c     |  2 +-
+ src/wps/wps_upnp.c   | 38 ++++++++++++++++++++++++++++++++++++--
+ src/wps/wps_upnp_i.h |  3 ++-
+ 3 files changed, 39 insertions(+), 4 deletions(-)
+
+Index: wpa_supplicant-2.9/src/wps/wps_er.c
+===================================================================
+--- wpa_supplicant-2.9.orig/src/wps/wps_er.c
++++ wpa_supplicant-2.9/src/wps/wps_er.c
+@@ -1298,7 +1298,7 @@ wps_er_init(struct wps_context *wps, con
+			   "with %s", filter);
+	}
+	if (get_netif_info(er->ifname, &er->ip_addr, &er->ip_addr_text,
+-			   er->mac_addr)) {
++			   NULL, er->mac_addr)) {
+		wpa_printf(MSG_INFO, "WPS UPnP: Could not get IP/MAC address "
+			   "for %s. Does it have IP address?", er->ifname);
+		wps_er_deinit(er, NULL, NULL);
+Index: wpa_supplicant-2.9/src/wps/wps_upnp.c
+===================================================================
+--- wpa_supplicant-2.9.orig/src/wps/wps_upnp.c
++++ wpa_supplicant-2.9/src/wps/wps_upnp.c
+@@ -303,6 +303,14 @@ static void subscr_addr_free_all(struct
+ }
+
+
++static int local_network_addr(struct upnp_wps_device_sm *sm,
++			      struct sockaddr_in *addr)
++{
++	return (addr->sin_addr.s_addr & sm->netmask.s_addr) ==
++		(sm->ip_addr & sm->netmask.s_addr);
++}
++
++
+ /* subscr_addr_add_url -- add address(es) for one url to subscription */
+ static void subscr_addr_add_url(struct subscription *s, const char *url,
+				size_t url_len)
+@@ -381,6 +389,7 @@ static void subscr_addr_add_url(struct s
+
+	for (rp = result; rp; rp = rp->ai_next) {
+		struct subscr_addr *a;
++		struct sockaddr_in *addr = (struct sockaddr_in *) rp->ai_addr;
+
+		/* Limit no. of address to avoid denial of service attack */
+		if (dl_list_len(&s->addr_list) >= MAX_ADDR_PER_SUBSCRIPTION) {
+@@ -389,6 +398,13 @@ static void subscr_addr_add_url(struct s
+			break;
+		}
+
++		if (!local_network_addr(s->sm, addr)) {
++			wpa_printf(MSG_INFO,
++				   "WPS UPnP: Ignore a delivery URL that points to another network %s",
++				   inet_ntoa(addr->sin_addr));
++			continue;
++		}
++
+		a = os_zalloc(sizeof(*a) + alloc_len);
+		if (a == NULL)
+			break;
+@@ -889,11 +905,12 @@ static int eth_get(const char *device, u
+  * @net_if: Selected network interface name
+  * @ip_addr: Buffer for returning IP address in network byte order
+  * @ip_addr_text: Buffer for returning a pointer to allocated IP address text
++ * @netmask: Buffer for returning netmask or %NULL if not needed
+  * @mac: Buffer for returning MAC address
+  * Returns: 0 on success, -1 on failure
+  */
+ int get_netif_info(const char *net_if, unsigned *ip_addr, char **ip_addr_text,
+-		   u8 mac[ETH_ALEN])
++		   struct in_addr *netmask, u8 mac[ETH_ALEN])
+ {
+	struct ifreq req;
+	int sock = -1;
+@@ -919,6 +936,19 @@ int get_netif_info(const char *net_if, u
+	in_addr.s_addr = *ip_addr;
+	os_snprintf(*ip_addr_text, 16, "%s", inet_ntoa(in_addr));
+
++	if (netmask) {
++		os_memset(&req, 0, sizeof(req));
++		os_strlcpy(req.ifr_name, net_if, sizeof(req.ifr_name));
++		if (ioctl(sock, SIOCGIFNETMASK, &req) < 0) {
++			wpa_printf(MSG_ERROR,
++				   "WPS UPnP: SIOCGIFNETMASK failed: %d (%s)",
++				   errno, strerror(errno));
++			goto fail;
++		}
++		addr = (struct sockaddr_in *) &req.ifr_netmask;
++		netmask->s_addr = addr->sin_addr.s_addr;
++	}
++
+ #ifdef __linux__
+	os_strlcpy(req.ifr_name, net_if, sizeof(req.ifr_name));
+	if (ioctl(sock, SIOCGIFHWADDR, &req) < 0) {
+@@ -1025,11 +1055,15 @@ static int upnp_wps_device_start(struct
+
+	/* Determine which IP and mac address we're using */
+	if (get_netif_info(net_if, &sm->ip_addr, &sm->ip_addr_text,
+-			   sm->mac_addr)) {
++			   &sm->netmask, sm->mac_addr)) {
+		wpa_printf(MSG_INFO, "WPS UPnP: Could not get IP/MAC address "
+			   "for %s. Does it have IP address?", net_if);
+		goto fail;
+	}
++	wpa_printf(MSG_DEBUG, "WPS UPnP: Local IP address %s netmask %s hwaddr "
++		   MACSTR,
++		   sm->ip_addr_text, inet_ntoa(sm->netmask),
++		   MAC2STR(sm->mac_addr));
+
+	/* Listen for incoming TCP connections so that others
+	 * can fetch our "xml files" from us.
+Index: wpa_supplicant-2.9/src/wps/wps_upnp_i.h
+===================================================================
+--- wpa_supplicant-2.9.orig/src/wps/wps_upnp_i.h
++++ wpa_supplicant-2.9/src/wps/wps_upnp_i.h
+@@ -128,6 +128,7 @@ struct upnp_wps_device_sm {
+	u8 mac_addr[ETH_ALEN]; /* mac addr of network i.f. we use */
+	char *ip_addr_text; /* IP address of network i.f. we use */
+	unsigned ip_addr; /* IP address of network i.f. we use (host order) */
++	struct in_addr netmask;
+	int multicast_sd; /* send multicast messages over this socket */
+	int ssdp_sd; /* receive discovery UPD packets on socket */
+	int ssdp_sd_registered; /* nonzero if we must unregister */
+@@ -158,7 +159,7 @@ struct subscription * subscription_find(
+					const u8 uuid[UUID_LEN]);
+ void subscr_addr_delete(struct subscr_addr *a);
+ int get_netif_info(const char *net_if, unsigned *ip_addr, char **ip_addr_text,
+-		   u8 mac[ETH_ALEN]);
++		   struct in_addr *netmask, u8 mac[ETH_ALEN]);
+
+ /* wps_upnp_ssdp.c */
+ void msearchreply_state_machine_stop(struct advertisement_state_machine *a);
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
new file mode 100644
index 0000000000..59640859dd
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
@@ -0,0 +1,62 @@
+From f7d268864a2660b7239b9a8ff5ad37faeeb751ba Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Wed, 3 Jun 2020 22:41:02 +0300
+Subject: [PATCH 2/3] WPS UPnP: Fix event message generation using a long URL
+ path
+
+More than about 700 character URL ended up overflowing the wpabuf used
+for building the event notification and this resulted in the wpabuf
+buffer overflow checks terminating the hostapd process. Fix this by
+allocating the buffer to be large enough to contain the full URL path.
+However, since that around 700 character limit has been the practical
+limit for more than ten years, start explicitly enforcing that as the
+limit or the callback URLs since any longer ones had not worked before
+and there is no need to enable them now either.
+
+Upstream-Status: Backport
+CVE: CVE-2020-12695 patch #2
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/wps/wps_upnp.c       | 9 +++++++--
+ src/wps/wps_upnp_event.c | 3 ++-
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/wps/wps_upnp.c b/src/wps/wps_upnp.c
+index 7d4b7439940e..ab685d52ecab 100644
+--- a/src/wps/wps_upnp.c
++++ b/src/wps/wps_upnp.c
+@@ -328,9 +328,14 @@ static void subscr_addr_add_url(struct subscription *s, const char *url,
+	int rerr;
+	size_t host_len, path_len;
+
+-	/* url MUST begin with http: */
+-	if (url_len < 7 || os_strncasecmp(url, "http://", 7))
++	/* URL MUST begin with HTTP scheme. In addition, limit the length of
++	 * the URL to 700 characters which is around the limit that was
++	 * implicitly enforced for more than 10 years due to a bug in
++	 * generating the event messages. */
++	if (url_len < 7 || os_strncasecmp(url, "http://", 7) || url_len > 700) {
++		wpa_printf(MSG_DEBUG, "WPS UPnP: Reject an unacceptable URL");
+		goto fail;
++	}
+	url += 7;
+	url_len -= 7;
+
+diff --git a/src/wps/wps_upnp_event.c b/src/wps/wps_upnp_event.c
+index d7e6edcc6503..08a23612f338 100644
+--- a/src/wps/wps_upnp_event.c
++++ b/src/wps/wps_upnp_event.c
+@@ -147,7 +147,8 @@ static struct wpabuf * event_build_message(struct wps_event_ *e)
+	struct wpabuf *buf;
+	char *b;
+
+-	buf = wpabuf_alloc(1000 + wpabuf_len(e->data));
++	buf = wpabuf_alloc(1000 + os_strlen(e->addr->path) +
++			   wpabuf_len(e->data));
+	if (buf == NULL)
+		return NULL;
+	wpabuf_printf(buf, "NOTIFY %s HTTP/1.1\r\n", e->addr->path);
+--
+2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
new file mode 100644
index 0000000000..8a014ef28a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
@@ -0,0 +1,50 @@
+From 85aac526af8612c21b3117dadc8ef5944985b476 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Thu, 4 Jun 2020 21:24:04 +0300
+Subject: [PATCH 3/3] WPS UPnP: Handle HTTP initiation failures for events more
+ properly
+
+While it is appropriate to try to retransmit the event to another
+callback URL on a failure to initiate the HTTP client connection, there
+is no point in trying the exact same operation multiple times in a row.
+Replve the event_retry() calls with event_addr_failure() for these cases
+to avoid busy loops trying to repeat the same failing operation.
+
+These potential busy loops would go through eloop callbacks, so the
+process is not completely stuck on handling them, but unnecessary CPU
+would be used to process the continues retries that will keep failing
+for the same reason.
+
+Upstream-Status: Backport
+CVE: CVE-2020-12695 patch #2
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/wps/wps_upnp_event.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/wps/wps_upnp_event.c b/src/wps/wps_upnp_event.c
+index 08a23612f338..c0d9e41d9a38 100644
+--- a/src/wps/wps_upnp_event.c
++++ b/src/wps/wps_upnp_event.c
+@@ -294,7 +294,7 @@ static int event_send_start(struct subscription *s)
+
+	buf = event_build_message(e);
+	if (buf == NULL) {
+-		event_retry(e, 0);
++		event_addr_failure(e);
+		return -1;
+	}
+
+@@ -302,7 +302,7 @@ static int event_send_start(struct subscription *s)
+					 event_http_cb, e);
+	if (e->http_event == NULL) {
+		wpabuf_free(buf);
+-		event_retry(e, 0);
++		event_addr_failure(e);
+		return -1;
+	}
+
+--
+2.20.1
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 0e74d21a76..de882fad55 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -25,7 +25,10 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
-		   file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
+           file://0001-AP-Silently-ignore-management-frame-from-unexpected-.patch \
+           file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
+           file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
+           file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.25.4

