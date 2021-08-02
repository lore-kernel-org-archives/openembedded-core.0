Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002000"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002000"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651158"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/37] systemd: fix CVE-2020-13529
Date: Mon,  2 Aug 2021 15:51:50 +0800
Message-Id: <5dcd5071d61fac240ff95672778ba1eed1312a03.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Backport patches to fix CVE-2020-13529.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...heck-error-earlier-and-reduce-indent.patch | 172 ++++++++++++++++++
 ...02-sd-dhcp-client-shorten-code-a-bit.patch |  66 +++++++
 ...ogs-when-dhcp-client-unexpectedly-ga.patch |  69 +++++++
 ...entatively-ignore-FORCERENEW-command.patch |  42 +++++
 meta/recipes-core/systemd/systemd_247.6.bb    |   4 +
 5 files changed, 353 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-sd-dhcp-client-shorten-code-a-bit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch b/meta/recipes-core/systemd/systemd/0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch
new file mode 100644
index 0000000000..ff877d9175
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch
@@ -0,0 +1,172 @@
+From ac6c7f2d2389c5c0ae90554a58f1c75f60cc8e5a Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 00:48:23 +0900
+Subject: [PATCH] sd-dhcp-client: check error earlier and reduce indentation
+
+Upstream-Status: Backport
+CVE: CVE-2020-13529
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/sd-dhcp-client.c | 128 ++++++++++++------------
+ 1 file changed, 64 insertions(+), 64 deletions(-)
+
+diff --git a/src/libsystemd-network/sd-dhcp-client.c b/src/libsystemd-network/sd-dhcp-client.c
+index d472fcd941..86bc3c6181 100644
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1770,21 +1770,21 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+         case DHCP_STATE_SELECTING:
+ 
+                 r = client_handle_offer(client, message, len);
+-                if (r >= 0) {
++                if (r == -ENOMSG)
++                        return 0; /* invalid message, let's ignore it */
++                if (r < 0)
++                        goto error;
+ 
+-                        client->state = DHCP_STATE_REQUESTING;
+-                        client->attempt = 0;
++                client->state = DHCP_STATE_REQUESTING;
++                client->attempt = 0;
+ 
+-                        r = event_reset_time(client->event, &client->timeout_resend,
+-                                             clock_boottime_or_monotonic(),
+-                                             0, 0,
+-                                             client_timeout_resend, client,
+-                                             client->event_priority, "dhcp4-resend-timer", true);
+-                        if (r < 0)
+-                                goto error;
+-                } else if (r == -ENOMSG)
+-                        /* invalid message, let's ignore it */
+-                        return 0;
++                r = event_reset_time(client->event, &client->timeout_resend,
++                                     clock_boottime_or_monotonic(),
++                                     0, 0,
++                                     client_timeout_resend, client,
++                                     client->event_priority, "dhcp4-resend-timer", true);
++                if (r < 0)
++                        goto error;
+ 
+                 break;
+ 
+@@ -1794,47 +1794,9 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+         case DHCP_STATE_REBINDING:
+ 
+                 r = client_handle_ack(client, message, len);
+-                if (r >= 0) {
+-                        client->start_delay = 0;
+-                        (void) event_source_disable(client->timeout_resend);
+-                        client->receive_message =
+-                                sd_event_source_unref(client->receive_message);
+-                        client->fd = safe_close(client->fd);
+-
+-                        if (IN_SET(client->state, DHCP_STATE_REQUESTING,
+-                                   DHCP_STATE_REBOOTING))
+-                                notify_event = SD_DHCP_CLIENT_EVENT_IP_ACQUIRE;
+-                        else if (r != SD_DHCP_CLIENT_EVENT_IP_ACQUIRE)
+-                                notify_event = r;
+-
+-                        client->state = DHCP_STATE_BOUND;
+-                        client->attempt = 0;
+-
+-                        client->last_addr = client->lease->address;
+-
+-                        r = client_set_lease_timeouts(client);
+-                        if (r < 0) {
+-                                log_dhcp_client(client, "could not set lease timeouts");
+-                                goto error;
+-                        }
+-
+-                        r = dhcp_network_bind_udp_socket(client->ifindex, client->lease->address, client->port, client->ip_service_type);
+-                        if (r < 0) {
+-                                log_dhcp_client(client, "could not bind UDP socket");
+-                                goto error;
+-                        }
+-
+-                        client->fd = r;
+-
+-                        client_initialize_io_events(client, client_receive_message_udp);
+-
+-                        if (notify_event) {
+-                                client_notify(client, notify_event);
+-                                if (client->state == DHCP_STATE_STOPPED)
+-                                        return 0;
+-                        }
+-
+-                } else if (r == -EADDRNOTAVAIL) {
++                if (r == -ENOMSG)
++                        return 0; /* invalid message, let's ignore it */
++                if (r == -EADDRNOTAVAIL) {
+                         /* got a NAK, let's restart the client */
+                         client_notify(client, SD_DHCP_CLIENT_EVENT_EXPIRED);
+ 
+@@ -1853,21 +1815,59 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+                                                     RESTART_AFTER_NAK_MIN_USEC, RESTART_AFTER_NAK_MAX_USEC);
+ 
+                         return 0;
+-                } else if (r == -ENOMSG)
+-                        /* invalid message, let's ignore it */
+-                        return 0;
++                }
++                if (r < 0)
++                        goto error;
++
++                client->start_delay = 0;
++                (void) event_source_disable(client->timeout_resend);
++                client->receive_message = sd_event_source_unref(client->receive_message);
++                client->fd = safe_close(client->fd);
++
++                if (IN_SET(client->state, DHCP_STATE_REQUESTING, DHCP_STATE_REBOOTING))
++                        notify_event = SD_DHCP_CLIENT_EVENT_IP_ACQUIRE;
++                else if (r != SD_DHCP_CLIENT_EVENT_IP_ACQUIRE)
++                        notify_event = r;
++
++                client->state = DHCP_STATE_BOUND;
++                client->attempt = 0;
++
++                client->last_addr = client->lease->address;
++
++                r = client_set_lease_timeouts(client);
++                if (r < 0) {
++                        log_dhcp_client(client, "could not set lease timeouts");
++                        goto error;
++                }
++
++                r = dhcp_network_bind_udp_socket(client->ifindex, client->lease->address, client->port, client->ip_service_type);
++                if (r < 0) {
++                        log_dhcp_client(client, "could not bind UDP socket");
++                        goto error;
++                }
++
++                client->fd = r;
++
++                client_initialize_io_events(client, client_receive_message_udp);
++
++                if (notify_event) {
++                        client_notify(client, notify_event);
++                        if (client->state == DHCP_STATE_STOPPED)
++                                return 0;
++                }
+ 
+                 break;
+ 
+         case DHCP_STATE_BOUND:
+                 r = client_handle_forcerenew(client, message, len);
+-                if (r >= 0) {
+-                        r = client_timeout_t1(NULL, 0, client);
+-                        if (r < 0)
+-                                goto error;
+-                } else if (r == -ENOMSG)
+-                        /* invalid message, let's ignore it */
+-                        return 0;
++                if (r == -ENOMSG)
++                        return 0; /* invalid message, let's ignore it */
++                if (r < 0)
++                        goto error;
++
++                r = client_timeout_t1(NULL, 0, client);
++                if (r < 0)
++                        goto error;
+ 
+                 break;
+ 
diff --git a/meta/recipes-core/systemd/systemd/0002-sd-dhcp-client-shorten-code-a-bit.patch b/meta/recipes-core/systemd/systemd/0002-sd-dhcp-client-shorten-code-a-bit.patch
new file mode 100644
index 0000000000..41d0c7b1e4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-sd-dhcp-client-shorten-code-a-bit.patch
@@ -0,0 +1,66 @@
+From 875f3773e383d99e7d43020f02acad7681a05914 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 00:51:52 +0900
+Subject: [PATCH] sd-dhcp-client: shorten code a bit
+
+Upstream-Status: Backport
+CVE: CVE-2020-13529
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/sd-dhcp-client.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/src/libsystemd-network/sd-dhcp-client.c b/src/libsystemd-network/sd-dhcp-client.c
+index 86bc3c6181..ef3a7d2c6b 100644
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1760,7 +1760,7 @@ static int client_set_lease_timeouts(sd_dhcp_client *client) {
+ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, int len) {
+         DHCP_CLIENT_DONT_DESTROY(client);
+         char time_string[FORMAT_TIMESPAN_MAX];
+-        int r = 0, notify_event = 0;
++        int r, notify_event = 0;
+ 
+         assert(client);
+         assert(client->event);
+@@ -1783,9 +1783,6 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+                                      0, 0,
+                                      client_timeout_resend, client,
+                                      client->event_priority, "dhcp4-resend-timer", true);
+-                if (r < 0)
+-                        goto error;
+-
+                 break;
+ 
+         case DHCP_STATE_REBOOTING:
+@@ -1813,7 +1810,6 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+ 
+                         client->start_delay = CLAMP(client->start_delay * 2,
+                                                     RESTART_AFTER_NAK_MIN_USEC, RESTART_AFTER_NAK_MAX_USEC);
+-
+                         return 0;
+                 }
+                 if (r < 0)
+@@ -1866,19 +1862,18 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+                         goto error;
+ 
+                 r = client_timeout_t1(NULL, 0, client);
+-                if (r < 0)
+-                        goto error;
+-
+                 break;
+ 
+         case DHCP_STATE_INIT:
+         case DHCP_STATE_INIT_REBOOT:
+-
++                r = 0;
+                 break;
+ 
+         case DHCP_STATE_STOPPED:
+                 r = -EINVAL;
+                 goto error;
++        default:
++                assert_not_reached("invalid state");
+         }
+ 
+ error:
diff --git a/meta/recipes-core/systemd/systemd/0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch b/meta/recipes-core/systemd/systemd/0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch
new file mode 100644
index 0000000000..07c7da8c21
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch
@@ -0,0 +1,69 @@
+From 0ad3b0fffe622bffbe9f380c3e4cb99b0961bef5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 01:14:12 +0900
+Subject: [PATCH] sd-dhcp-client: logs when dhcp client unexpectedly gains a
+ new lease
+
+Previously, such situation is handled silently.
+
+Upstream-Status: Backport
+CVE: CVE-2020-13529
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/sd-dhcp-client.c | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/src/libsystemd-network/sd-dhcp-client.c b/src/libsystemd-network/sd-dhcp-client.c
+index ef3a7d2c6b..04a75c6966 100644
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1760,7 +1760,7 @@ static int client_set_lease_timeouts(sd_dhcp_client *client) {
+ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, int len) {
+         DHCP_CLIENT_DONT_DESTROY(client);
+         char time_string[FORMAT_TIMESPAN_MAX];
+-        int r, notify_event = 0;
++        int r, notify_event;
+ 
+         assert(client);
+         assert(client->event);
+@@ -1815,16 +1815,16 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+                 if (r < 0)
+                         goto error;
+ 
++                if (IN_SET(client->state, DHCP_STATE_REQUESTING, DHCP_STATE_REBOOTING))
++                        notify_event = SD_DHCP_CLIENT_EVENT_IP_ACQUIRE;
++                else
++                        notify_event = r;
++
+                 client->start_delay = 0;
+                 (void) event_source_disable(client->timeout_resend);
+                 client->receive_message = sd_event_source_unref(client->receive_message);
+                 client->fd = safe_close(client->fd);
+ 
+-                if (IN_SET(client->state, DHCP_STATE_REQUESTING, DHCP_STATE_REBOOTING))
+-                        notify_event = SD_DHCP_CLIENT_EVENT_IP_ACQUIRE;
+-                else if (r != SD_DHCP_CLIENT_EVENT_IP_ACQUIRE)
+-                        notify_event = r;
+-
+                 client->state = DHCP_STATE_BOUND;
+                 client->attempt = 0;
+ 
+@@ -1846,12 +1846,13 @@ static int client_handle_message(sd_dhcp_client *client, DHCPMessage *message, i
+ 
+                 client_initialize_io_events(client, client_receive_message_udp);
+ 
+-                if (notify_event) {
++                if (IN_SET(client->state, DHCP_STATE_RENEWING, DHCP_STATE_REBINDING) &&
++                    notify_event == SD_DHCP_CLIENT_EVENT_IP_ACQUIRE)
++                        /* FIXME: hmm, maybe this is a bug... */
++                        log_dhcp_client(client, "client_handle_ack() returned SD_DHCP_CLIENT_EVENT_IP_ACQUIRE while DHCP client is %s the address, skipping callback.",
++                                        client->state == DHCP_STATE_RENEWING ? "renewing" : "rebinding");
++                else
+                         client_notify(client, notify_event);
+-                        if (client->state == DHCP_STATE_STOPPED)
+-                                return 0;
+-                }
+-
+                 break;
+ 
+         case DHCP_STATE_BOUND:
diff --git a/meta/recipes-core/systemd/systemd/0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch b/meta/recipes-core/systemd/systemd/0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch
new file mode 100644
index 0000000000..c65fb45ab9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch
@@ -0,0 +1,42 @@
+From ae18277a6cfd04af8a914780f04a867254ab2341 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 01:22:07 +0900
+Subject: [PATCH] sd-dhcp-client: tentatively ignore FORCERENEW command
+
+This makes DHCP client ignore FORCERENEW requests, as unauthenticated
+FORCERENEW requests causes a security issue (TALOS-2020-1142, CVE-2020-13529).
+
+Let's re-enable this after RFC3118 (Authentication for DHCP Messages)
+and/or RFC6704 (Forcerenew Nonce Authentication) are implemented.
+
+Fixes #16774.
+
+Upstream-Status: Backport
+CVE: CVE-2020-13529
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/sd-dhcp-client.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/libsystemd-network/sd-dhcp-client.c b/src/libsystemd-network/sd-dhcp-client.c
+index 04a75c6966..54eb3a2ab0 100644
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1536,9 +1536,17 @@ static int client_handle_forcerenew(sd_dhcp_client *client, DHCPMessage *force,
+         if (r != DHCP_FORCERENEW)
+                 return -ENOMSG;
+ 
++#if 0
+         log_dhcp_client(client, "FORCERENEW");
+ 
+         return 0;
++#else
++        /* FIXME: Ignore FORCERENEW requests until we implement RFC3118 (Authentication for DHCP
++         * Messages) and/or RFC6704 (Forcerenew Nonce Authentication), as unauthenticated FORCERENEW
++         * requests causes a security issue (TALOS-2020-1142, CVE-2020-13529). */
++        log_dhcp_client(client, "Received FORCERENEW, ignoring.");
++        return -ENOMSG;
++#endif
+ }
+ 
+ static bool lease_equal(const sd_dhcp_lease *a, const sd_dhcp_lease *b) {
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index 32afa159ec..f1db1e922b 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -27,6 +27,10 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
            file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
+           file://0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch \
+           file://0002-sd-dhcp-client-shorten-code-a-bit.patch \
+           file://0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch \
+           file://0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch \
            "
 
 # patches needed by musl
-- 
2.31.1

